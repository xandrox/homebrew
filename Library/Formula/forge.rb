require 'formula'

class Forge < Formula
  homepage 'https://docs.jboss.org/author/display/FORGE/Home'
  url 'https://repository.jboss.org/nexus/content/repositories/releases/org/jboss/forge/forge-distribution/1.0.2.Final/forge-distribution-1.0.2.Final.zip'
  md5 '0853bc6c152d29975a01bfe0f5576bdb'
  version "1.0.2.Final"

  def install
    rm_f Dir["bin/*.bat"]

    libexec.install Dir['*']
    bin.install_symlink Dir["#{libexec}/bin/*"]

    inreplace "#{libexec}/bin/forge",
      "#   JAVA_HOME - location of a JRE home directory",
      "JAVA_HOME=\"$(/usr/libexec/java_home)\""

    inreplace "#{libexec}/bin/forge",
        "#   FORGE_HOME - location of Forge's installed home dir",
        "FORGE_HOME=\"#{libexec}\""
  end

end

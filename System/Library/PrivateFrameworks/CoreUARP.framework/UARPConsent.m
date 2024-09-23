@implementation UARPConsent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UARPConsent)initWithAccessoryName:(id)a3 assetVersion:(id)a4
{
  id v6;
  id v7;
  UARPConsent *v8;
  uint64_t v9;
  NSString *accessoryName;
  uint64_t v11;
  NSString *assetVersion;
  uint64_t v13;
  NSString *consentDescription;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)UARPConsent;
  v8 = -[UARPConsent init](&v16, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    accessoryName = v8->_accessoryName;
    v8->_accessoryName = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    assetVersion = v8->_assetVersion;
    v8->_assetVersion = (NSString *)v11;

    *(_WORD *)&v8->_isDownloadable = 257;
    objc_msgSend(CFSTR("This is a firmware update for "), "stringByAppendingString:", v8->_accessoryName);
    v13 = objc_claimAutoreleasedReturnValue();
    consentDescription = v8->_consentDescription;
    v8->_consentDescription = (NSString *)v13;

  }
  return v8;
}

- (UARPConsent)initWithAccessoryName:(id)a3 appleModelNumber:(id)a4 assetVersion:(id)a5
{
  id v8;
  id v9;
  id v10;
  UARPConsent *v11;
  uint64_t v12;
  NSString *accessoryName;
  uint64_t v14;
  NSString *assetVersion;
  uint64_t v16;
  NSString *appleModelNumber;
  uint64_t v18;
  NSString *consentDescription;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)UARPConsent;
  v11 = -[UARPConsent init](&v21, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    accessoryName = v11->_accessoryName;
    v11->_accessoryName = (NSString *)v12;

    v14 = objc_msgSend(v10, "copy");
    assetVersion = v11->_assetVersion;
    v11->_assetVersion = (NSString *)v14;

    v16 = objc_msgSend(v9, "copy");
    appleModelNumber = v11->_appleModelNumber;
    v11->_appleModelNumber = (NSString *)v16;

    *(_WORD *)&v11->_isDownloadable = 257;
    objc_msgSend(CFSTR("This is a firmware update for "), "stringByAppendingString:", v11->_accessoryName);
    v18 = objc_claimAutoreleasedReturnValue();
    consentDescription = v11->_consentDescription;
    v11->_consentDescription = (NSString *)v18;

  }
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  UARPConsent *v4;
  uint64_t v5;
  NSString *warning;
  uint64_t v7;
  NSString *consentDescription;
  uint64_t v9;
  NSString *installerProgressDescription;
  uint64_t v11;
  NSString *installerProgressPhase;
  uint64_t v13;
  NSString *assetBuildVersion;

  v4 = -[UARPConsent initWithAccessoryName:appleModelNumber:assetVersion:]([UARPConsent alloc], "initWithAccessoryName:appleModelNumber:assetVersion:", self->_accessoryName, self->_appleModelNumber, self->_assetVersion);
  v4->_isDownloadable = self->_isDownloadable;
  v4->_isRecommended = self->_isRecommended;
  v5 = -[NSString copy](self->_warning, "copy");
  warning = v4->_warning;
  v4->_warning = (NSString *)v5;

  v4->_downloadSize = self->_downloadSize;
  v7 = -[NSString copy](self->_consentDescription, "copy");
  consentDescription = v4->_consentDescription;
  v4->_consentDescription = (NSString *)v7;

  v4->_needsPostLogoutMode = self->_needsPostLogoutMode;
  v9 = -[NSString copy](self->_installerProgressDescription, "copy");
  installerProgressDescription = v4->_installerProgressDescription;
  v4->_installerProgressDescription = (NSString *)v9;

  v11 = -[NSString copy](self->_installerProgressPhase, "copy");
  installerProgressPhase = v4->_installerProgressPhase;
  v4->_installerProgressPhase = (NSString *)v11;

  objc_storeStrong((id *)&v4->_installerProgressError, self->_installerProgressError);
  v13 = -[NSString copy](self->_assetBuildVersion, "copy");
  assetBuildVersion = v4->_assetBuildVersion;
  v4->_assetBuildVersion = (NSString *)v13;

  objc_storeStrong((id *)&v4->_installerOverallProgress, self->_installerOverallProgress);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *accessoryName;
  id v5;

  accessoryName = self->_accessoryName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", accessoryName, CFSTR("accessoryName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_appleModelNumber, CFSTR("appleModelNumber"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_assetVersion, CFSTR("asetVersion"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isDownloadable, CFSTR("isDownloadable"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isRecommended, CFSTR("isRecommended"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_warning, CFSTR("warning"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_downloadSize, CFSTR("downloadSize"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_consentDescription, CFSTR("consentDescription"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_needsPostLogoutMode, CFSTR("needsPostLogoutMode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_installerProgressDescription, CFSTR("installerProgressDescription"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_installerProgressPhase, CFSTR("installerProgressPhase"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_installerProgressError, CFSTR("installerProgressError"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_assetBuildVersion, CFSTR("assetBuildVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_installerOverallProgress, CFSTR("installerOverallProgress"));

}

- (UARPConsent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  UARPConsent *v8;
  uint64_t v9;
  NSString *warning;
  uint64_t v11;
  NSString *consentDescription;
  uint64_t v13;
  NSString *installerProgressDescription;
  uint64_t v15;
  NSString *installerProgressPhase;
  uint64_t v17;
  NSError *installerProgressError;
  uint64_t v19;
  NSString *assetBuildVersion;
  uint64_t v21;
  NSNumber *installerOverallProgress;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessoryName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appleModelNumber"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("asetVersion"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[UARPConsent initWithAccessoryName:appleModelNumber:assetVersion:](self, "initWithAccessoryName:appleModelNumber:assetVersion:", v5, v6, v7);
  v8->_isDownloadable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isDownloadable"));
  v8->_isRecommended = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isRecommended"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("warning"));
  v9 = objc_claimAutoreleasedReturnValue();
  warning = v8->_warning;
  v8->_warning = (NSString *)v9;

  v8->_downloadSize = (NSNumber *)(id)objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("downloadSize"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("consentDescription"));
  v11 = objc_claimAutoreleasedReturnValue();
  consentDescription = v8->_consentDescription;
  v8->_consentDescription = (NSString *)v11;

  v8->_needsPostLogoutMode = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("needsPostLogoutMode"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("installerProgressDescription"));
  v13 = objc_claimAutoreleasedReturnValue();
  installerProgressDescription = v8->_installerProgressDescription;
  v8->_installerProgressDescription = (NSString *)v13;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("installerProgressPhase"));
  v15 = objc_claimAutoreleasedReturnValue();
  installerProgressPhase = v8->_installerProgressPhase;
  v8->_installerProgressPhase = (NSString *)v15;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("installerProgressError"));
  v17 = objc_claimAutoreleasedReturnValue();
  installerProgressError = v8->_installerProgressError;
  v8->_installerProgressError = (NSError *)v17;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assetBuildVersion"));
  v19 = objc_claimAutoreleasedReturnValue();
  assetBuildVersion = v8->_assetBuildVersion;
  v8->_assetBuildVersion = (NSString *)v19;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("installerOverallProgress"));
  v21 = objc_claimAutoreleasedReturnValue();

  installerOverallProgress = v8->_installerOverallProgress;
  v8->_installerOverallProgress = (NSNumber *)v21;

  return v8;
}

- (void)dumpWithTabDepth:(unint64_t)a3 dumpString:(id)a4
{
  void *v6;
  unint64_t v7;
  void *v8;
  id v9;

  v9 = a4;
  objc_msgSend(v9, "appendWithTabDepth:format:", a3, CFSTR("%@\n"), self->_accessoryName);
  if (self->_appleModelNumber)
    objc_msgSend(v9, "appendWithTabDepth:format:", a3, CFSTR("%@\n"), self->_appleModelNumber);
  objc_msgSend(v9, "appendWithTabDepth:format:", a3, CFSTR("%@\n"), self->_assetVersion);
  if (self->_assetBuildVersion)
    objc_msgSend(v9, "appendWithTabDepth:format:", a3, CFSTR("%@\n"), self->_assetBuildVersion);
  if (self->_consentDescription)
    objc_msgSend(v9, "appendWithTabDepth:format:", a3 + 1, CFSTR("Consent Description: %@\n"), self->_consentDescription);
  v6 = v9;
  if (self->_warning)
  {
    objc_msgSend(v9, "appendWithTabDepth:format:", a3 + 1, CFSTR("Warning: %@\n"), self->_warning);
    v6 = v9;
  }
  v7 = a3 + 1;
  if (self->_downloadSize)
  {
    objc_msgSend(v9, "appendWithTabDepth:format:", v7, CFSTR("Download Size: %@\n"), self->_downloadSize);
    v6 = v9;
  }
  objc_msgSend(v6, "appendWithTabDepth:format:", v7, CFSTR("Is Downloadable: %d\n"), self->_isDownloadable);
  objc_msgSend(v9, "appendWithTabDepth:format:", v7, CFSTR("Is Recommended: %d\n"), self->_isRecommended);
  objc_msgSend(v9, "appendWithTabDepth:format:", v7, CFSTR("Needs Post Logout Mode: %d\n"), self->_needsPostLogoutMode);
  if (self->_installerProgressDescription)
    objc_msgSend(v9, "appendWithTabDepth:format:", v7, CFSTR("Installer Progress Description: %@\n"), self->_installerProgressDescription);
  if (self->_installerProgressPhase)
    objc_msgSend(v9, "appendWithTabDepth:format:", v7, CFSTR("Installer Progress Phase: %@\n"), self->_installerProgressPhase);
  v8 = v9;
  if (self->_installerOverallProgress)
  {
    objc_msgSend(v9, "appendWithTabDepth:format:", v7, CFSTR("Installer Overall Progress: %@\n"), self->_installerOverallProgress);
    v8 = v9;
  }
  if (self->_installerProgressError)
  {
    objc_msgSend(v9, "appendWithTabDepth:format:", v7, CFSTR("Installer Progress Error: %@\n"), self->_installerProgressError);
    v8 = v9;
  }

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: _accessoryName=%@, _appleModelNumber=%@, _assetVersion=%@, _consentDescription=%@ _warning=%@ _needsPostLogoutMode=%d, _installerProgressDescription=%@, _installerOverallProgress=%@>"), v5, self->_accessoryName, self->_appleModelNumber, self->_assetVersion, self->_consentDescription, self->_warning, self->_needsPostLogoutMode, self->_installerProgressDescription, self->_installerOverallProgress);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)accessoryName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)appleModelNumber
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAppleModelNumber:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSString)assetVersion
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)isDownloadable
{
  return self->_isDownloadable;
}

- (void)setIsDownloadable:(BOOL)a3
{
  self->_isDownloadable = a3;
}

- (NSNumber)downloadSize
{
  return self->_downloadSize;
}

- (void)setDownloadSize:(id)a3
{
  self->_downloadSize = (NSNumber *)a3;
}

- (BOOL)isRecommended
{
  return self->_isRecommended;
}

- (void)setIsRecommended:(BOOL)a3
{
  self->_isRecommended = a3;
}

- (NSString)consentDescription
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setConsentDescription:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (NSString)warning
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setWarning:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (BOOL)needsPostLogoutMode
{
  return self->_needsPostLogoutMode;
}

- (void)setNeedsPostLogoutMode:(BOOL)a3
{
  self->_needsPostLogoutMode = a3;
}

- (NSString)installerProgressDescription
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setInstallerProgressDescription:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (NSString)installerProgressPhase
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setInstallerProgressPhase:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (NSError)installerProgressError
{
  return (NSError *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInstallerProgressError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSNumber)installerOverallProgress
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInstallerOverallProgress:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSString)assetBuildVersion
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setAssetBuildVersion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetBuildVersion, 0);
  objc_storeStrong((id *)&self->_installerOverallProgress, 0);
  objc_storeStrong((id *)&self->_installerProgressError, 0);
  objc_storeStrong((id *)&self->_installerProgressPhase, 0);
  objc_storeStrong((id *)&self->_installerProgressDescription, 0);
  objc_storeStrong((id *)&self->_warning, 0);
  objc_storeStrong((id *)&self->_consentDescription, 0);
  objc_storeStrong((id *)&self->_assetVersion, 0);
  objc_storeStrong((id *)&self->_appleModelNumber, 0);
  objc_storeStrong((id *)&self->_accessoryName, 0);
}

@end

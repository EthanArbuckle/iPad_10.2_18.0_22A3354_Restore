@implementation UARPAssetID

- (BOOL)analyticsIsEqual:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  v5 = -[UARPAssetID type](self, "type");
  if (v5 == objc_msgSend(v4, "type"))
  {
    -[UARPAssetID remoteURL](self, "remoteURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "remoteURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v7))
    {
      -[UARPAssetID assetVersion](self, "assetVersion");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "assetVersion");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UARPAssetID)initWithLocationType:(int64_t)a3 remotePath:(id)a4
{
  void *v6;
  UARPAssetID *v7;

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[UARPAssetID initWithLocationType:remoteURL:](self, "initWithLocationType:remoteURL:", a3, v6);

  return v7;
}

- (UARPAssetID)initWithLocationType:(int64_t)a3 assetTag:(id)a4 filePath:(id)a5
{
  void *v8;
  id v9;
  void *v10;
  UARPAssetID *v11;

  v8 = (void *)MEMORY[0x24BDBCF48];
  v9 = a4;
  objc_msgSend(v8, "URLWithString:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[UARPAssetID initWithLocationType:assetTag:url:](self, "initWithLocationType:assetTag:url:", a3, v9, v10);

  return v11;
}

- (UARPAssetID)initWithLocationType:(int64_t)a3 assetTag:(id)a4 url:(id)a5
{
  id v9;
  id v10;
  UARPAssetID *v11;
  UARPAssetID *v12;
  uint64_t v13;
  NSURL *localURL;

  v9 = a4;
  v10 = a5;
  v11 = -[UARPAssetID initWithLocationType:remoteURL:](self, "initWithLocationType:remoteURL:", a3, v10);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_tag, a4);
    v13 = objc_msgSend(v10, "copy");
    localURL = v12->_localURL;
    v12->_localURL = (NSURL *)v13;

  }
  return v12;
}

- (UARPAssetID)initWithLocationType:(int64_t)a3 remoteURL:(id)a4
{
  id v6;
  UARPAssetID *v7;
  UARPAssetID *v8;
  os_log_t v9;
  OS_os_log *log;
  NSMutableArray *v11;
  NSMutableArray *activeAccessoriesForStaging;
  NSMutableArray *v13;
  NSMutableArray *downstreamAssetIDs;
  uint64_t v15;
  NSURL *remoteURL;
  uint64_t v17;
  NSURL *v18;
  objc_super v20;

  v6 = a4;
  v20.receiver = self;
  v20.super_class = (Class)UARPAssetID;
  v7 = -[UARPAssetID init](&v20, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_type = a3;
    v7->_downloadStatus = 0;
    v7->_updateAvailabilityStatus = 0;
    v9 = os_log_create("com.apple.accessoryupdater.uarp", "assetID");
    log = v8->_log;
    v8->_log = (OS_os_log *)v9;

    v8->_signatureValidationNeeded = 1;
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    activeAccessoriesForStaging = v8->_activeAccessoriesForStaging;
    v8->_activeAccessoriesForStaging = v11;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    downstreamAssetIDs = v8->_downstreamAssetIDs;
    v8->_downstreamAssetIDs = v13;

    v8->_reportProgressToDelegates = 1;
    v8->_deploymentAllowed = 1;
    v15 = objc_msgSend(v6, "copy");
    remoteURL = v8->_remoteURL;
    v8->_remoteURL = (NSURL *)v15;

    if (!v6)
    {
      UARPAssetLocationTypeToURL(v8->_type);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = v8->_remoteURL;
      v8->_remoteURL = (NSURL *)v17;

    }
  }

  return v8;
}

- (UARPAssetID)initWithLocationType:(int64_t)a3 remotePath:(id)a4 releaseNotesRemotePath:(id)a5
{
  id v8;
  UARPAssetID *v9;
  UARPAssetID *v10;
  uint64_t v11;
  NSURL *releaseNotesRemoteURL;

  v8 = a5;
  v9 = -[UARPAssetID initWithLocationType:remotePath:](self, "initWithLocationType:remotePath:", a3, a4);
  v10 = v9;
  if (v8 && v9)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v8);
    v11 = objc_claimAutoreleasedReturnValue();
    releaseNotesRemoteURL = v10->_releaseNotesRemoteURL;
    v10->_releaseNotesRemoteURL = (NSURL *)v11;

  }
  return v10;
}

- (UARPAssetID)initWithLocationType:(int64_t)a3 remoteURL:(id)a4 releaseNotesRemoteURL:(id)a5
{
  id v8;
  UARPAssetID *v9;
  uint64_t v10;
  NSURL *releaseNotesRemoteURL;

  v8 = a5;
  v9 = -[UARPAssetID initWithLocationType:remoteURL:](self, "initWithLocationType:remoteURL:", a3, a4);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    releaseNotesRemoteURL = v9->_releaseNotesRemoteURL;
    v9->_releaseNotesRemoteURL = (NSURL *)v10;

  }
  return v9;
}

- (UARPAssetID)initWithCoder:(id)a3
{
  id v4;
  UARPAssetID *v5;
  uint64_t v6;
  NSURL *remoteURL;
  uint64_t v8;
  NSString *assetVersion;
  uint64_t v10;
  NSNumber *assetVersionNumber;
  uint64_t v12;
  NSString *remoteBuildManifestPlistPath;
  uint64_t v14;
  NSURL *localURL;
  uint64_t v16;
  NSURL *releaseNotesRemoteURL;
  uint64_t v18;
  NSURL *releaseNotesLocalURL;
  uint64_t v20;
  NSNumber *releaseNotesFileSize;
  uint64_t v22;
  NSNumber *firmwareFileSize;
  uint64_t v24;
  NSDate *assetReleaseDate;
  uint64_t v26;
  UARPAssetTag *tag;
  uint64_t v28;
  NSString *firmwareHash;
  uint64_t v30;
  NSString *modelNumber;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  NSMutableArray *downstreamAssetIDs;
  NSMutableArray *v37;
  NSMutableArray *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  NSMutableArray *activeAccessoriesForStaging;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  NSArray *deploymentRules;
  objc_super v50;
  _QWORD v51[2];
  _QWORD v52[2];
  _QWORD v53[3];

  v53[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)UARPAssetID;
  v5 = -[UARPAssetID init](&v50, sel_init);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("remoteURL"));
    v6 = objc_claimAutoreleasedReturnValue();
    remoteURL = v5->_remoteURL;
    v5->_remoteURL = (NSURL *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assetVersion"));
    v8 = objc_claimAutoreleasedReturnValue();
    assetVersion = v5->_assetVersion;
    v5->_assetVersion = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assetVersionNumber"));
    v10 = objc_claimAutoreleasedReturnValue();
    assetVersionNumber = v5->_assetVersionNumber;
    v5->_assetVersionNumber = (NSNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("remoteBuildManifestPlistPath"));
    v12 = objc_claimAutoreleasedReturnValue();
    remoteBuildManifestPlistPath = v5->_remoteBuildManifestPlistPath;
    v5->_remoteBuildManifestPlistPath = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localURL"));
    v14 = objc_claimAutoreleasedReturnValue();
    localURL = v5->_localURL;
    v5->_localURL = (NSURL *)v14;

    v5->_downloadStatus = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("downloadStatus"));
    v5->_updateAvailabilityStatus = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("updateAvailabilityStatus"));
    v5->_releaseNotesDownloadStatus = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("releaseNotesDownloadStatus"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("releaseNotesRemoteURL"));
    v16 = objc_claimAutoreleasedReturnValue();
    releaseNotesRemoteURL = v5->_releaseNotesRemoteURL;
    v5->_releaseNotesRemoteURL = (NSURL *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("releaseNotesLocalURL"));
    v18 = objc_claimAutoreleasedReturnValue();
    releaseNotesLocalURL = v5->_releaseNotesLocalURL;
    v5->_releaseNotesLocalURL = (NSURL *)v18;

    v5->_releaseNotesAvailabilityStatus = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("releaseNotesAvailabilityStatus"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("releaseNotesFileSize"));
    v20 = objc_claimAutoreleasedReturnValue();
    releaseNotesFileSize = v5->_releaseNotesFileSize;
    v5->_releaseNotesFileSize = (NSNumber *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("firmwareFileSize"));
    v22 = objc_claimAutoreleasedReturnValue();
    firmwareFileSize = v5->_firmwareFileSize;
    v5->_firmwareFileSize = (NSNumber *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assetReleaseDate"));
    v24 = objc_claimAutoreleasedReturnValue();
    assetReleaseDate = v5->_assetReleaseDate;
    v5->_assetReleaseDate = (NSDate *)v24;

    v5->_deploymentAllowed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("deploymentAllowed"));
    v5->_signatureValidationNeeded = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("signatureValidationNeeded"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tag"));
    v26 = objc_claimAutoreleasedReturnValue();
    tag = v5->_tag;
    v5->_tag = (UARPAssetTag *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("firmwareHash"));
    v28 = objc_claimAutoreleasedReturnValue();
    firmwareHash = v5->_firmwareHash;
    v5->_firmwareHash = (NSString *)v28;

    v5->_reportProgressToDelegates = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("reportProgressToDelegates"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modelNumber"));
    v30 = objc_claimAutoreleasedReturnValue();
    modelNumber = v5->_modelNumber;
    v5->_modelNumber = (NSString *)v30;

    v32 = (void *)MEMORY[0x24BDBCF20];
    v53[0] = objc_opt_class();
    v53[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v53, 2);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setWithArray:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v34, CFSTR("downstreamAssetIDs"));
    v35 = objc_claimAutoreleasedReturnValue();
    downstreamAssetIDs = v5->_downstreamAssetIDs;
    v5->_downstreamAssetIDs = (NSMutableArray *)v35;

    if (!v5->_downstreamAssetIDs)
    {
      v37 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v38 = v5->_downstreamAssetIDs;
      v5->_downstreamAssetIDs = v37;

    }
    v39 = (void *)MEMORY[0x24BDBCF20];
    v52[0] = objc_opt_class();
    v52[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v52, 2);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setWithArray:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v41, CFSTR("activeAccessoriesForStaging"));
    v42 = objc_claimAutoreleasedReturnValue();
    activeAccessoriesForStaging = v5->_activeAccessoriesForStaging;
    v5->_activeAccessoriesForStaging = (NSMutableArray *)v42;

    v44 = (void *)MEMORY[0x24BDBCF20];
    v51[0] = objc_opt_class();
    v51[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v51, 2);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setWithArray:", v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v46, CFSTR("deploymentRules"));
    v47 = objc_claimAutoreleasedReturnValue();
    deploymentRules = v5->_deploymentRules;
    v5->_deploymentRules = (NSArray *)v47;

    v5->_isUrgentUpdate = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isUrgentUpdate"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type;
  id v5;

  type = self->_type;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", type, CFSTR("type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_remoteURL, CFSTR("remoteURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_assetVersion, CFSTR("assetVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_assetVersionNumber, CFSTR("assetVersionNumber"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_remoteBuildManifestPlistPath, CFSTR("remoteBuildManifestPlistPath"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localURL, CFSTR("localURL"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_downloadStatus, CFSTR("downloadStatus"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_updateAvailabilityStatus, CFSTR("updateAvailabilityStatus"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_releaseNotesDownloadStatus, CFSTR("releaseNotesDownloadStatus"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_releaseNotesRemoteURL, CFSTR("releaseNotesRemoteURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_releaseNotesLocalURL, CFSTR("releaseNotesLocalURL"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_releaseNotesAvailabilityStatus, CFSTR("releaseNotesAvailabilityStatus"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_releaseNotesFileSize, CFSTR("releaseNotesFileSize"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_firmwareFileSize, CFSTR("firmwareFileSize"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_assetReleaseDate, CFSTR("assetReleaseDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deploymentRules, CFSTR("deploymentRules"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_deploymentAllowed, CFSTR("deploymentAllowed"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_signatureValidationNeeded, CFSTR("signatureValidationNeeded"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_tag, CFSTR("tag"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_firmwareHash, CFSTR("firmwareHash"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_activeAccessoriesForStaging, CFSTR("activeAccessoriesForStaging"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_reportProgressToDelegates, CFSTR("reportProgressToDelegates"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isUrgentUpdate, CFSTR("isUrgentUpdate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_modelNumber, CFSTR("modelNumber"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_downstreamAssetIDs, CFSTR("downstreamAssetIDs"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  UARPAssetID *v4;
  uint64_t v5;
  NSMutableArray *downstreamAssetIDs;

  v4 = -[UARPAssetID initWithLocationType:remoteURL:]([UARPAssetID alloc], "initWithLocationType:remoteURL:", self->_type, self->_remoteURL);
  -[UARPAssetID setRemoteBuildManifestPlistPath:](v4, "setRemoteBuildManifestPlistPath:", self->_remoteBuildManifestPlistPath);
  -[UARPAssetID setLocalURL:](v4, "setLocalURL:", self->_localURL);
  -[UARPAssetID setDownloadStatus:](v4, "setDownloadStatus:", self->_downloadStatus);
  -[UARPAssetID setUpdateAvailabilityStatus:](v4, "setUpdateAvailabilityStatus:", self->_updateAvailabilityStatus);
  -[UARPAssetID setAssetVersion:](v4, "setAssetVersion:", self->_assetVersion);
  -[UARPAssetID setAssetVersionNumber:](v4, "setAssetVersionNumber:", self->_assetVersionNumber);
  -[UARPAssetID setReleaseNotesLocalURL:](v4, "setReleaseNotesLocalURL:", self->_releaseNotesLocalURL);
  -[UARPAssetID setReleaseNotesRemoteURL:](v4, "setReleaseNotesRemoteURL:", self->_releaseNotesRemoteURL);
  -[UARPAssetID setReleaseNotesDownloadStatus:](v4, "setReleaseNotesDownloadStatus:", self->_releaseNotesDownloadStatus);
  -[UARPAssetID setReleaseNotesAvailabilityStatus:](v4, "setReleaseNotesAvailabilityStatus:", self->_releaseNotesAvailabilityStatus);
  -[UARPAssetID setReleaseNotesFileSize:](v4, "setReleaseNotesFileSize:", self->_releaseNotesFileSize);
  -[UARPAssetID setFirmwareFileSize:](v4, "setFirmwareFileSize:", self->_firmwareFileSize);
  -[UARPAssetID setAssetReleaseDate:](v4, "setAssetReleaseDate:", self->_assetReleaseDate);
  -[UARPAssetID setDeploymentRules:](v4, "setDeploymentRules:", self->_deploymentRules);
  -[UARPAssetID setDeploymentAllowed:](v4, "setDeploymentAllowed:", self->_deploymentAllowed);
  -[UARPAssetID setSignatureValidationNeeded:](v4, "setSignatureValidationNeeded:", self->_signatureValidationNeeded);
  -[UARPAssetID setTag:](v4, "setTag:", self->_tag);
  -[UARPAssetID setFirmwareHash:](v4, "setFirmwareHash:", self->_firmwareHash);
  objc_storeStrong((id *)&v4->_activeAccessoriesForStaging, self->_activeAccessoriesForStaging);
  -[UARPAssetID setIsUrgentUpdate:](v4, "setIsUrgentUpdate:", self->_isUrgentUpdate);
  -[UARPAssetID setModelNumber:](v4, "setModelNumber:", self->_modelNumber);
  v5 = -[NSMutableArray mutableCopy](self->_downstreamAssetIDs, "mutableCopy");
  downstreamAssetIDs = v4->_downstreamAssetIDs;
  v4->_downstreamAssetIDs = (NSMutableArray *)v5;

  return v4;
}

- (void)setRemoteBuildManifestPlistPath:(id)a3
{
  NSString *v4;
  NSString *remoteBuildManifestPlistPath;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  remoteBuildManifestPlistPath = self->_remoteBuildManifestPlistPath;
  self->_remoteBuildManifestPlistPath = v4;

}

- (id)remoteBuildManifestPlistPath
{
  return self->_remoteBuildManifestPlistPath;
}

- (id)downstreamAssetIDs
{
  return self->_downstreamAssetIDs;
}

- (void)restoreDefaultStatus
{
  NSString *modelNumber;

  -[NSMutableArray removeAllObjects](self->_downstreamAssetIDs, "removeAllObjects");
  self->_releaseNotesAvailabilityStatus = 0;
  self->_updateAvailabilityStatus = 0;
  self->_releaseNotesDownloadStatus = 0;
  self->_downloadStatus = 0;
  modelNumber = self->_modelNumber;
  self->_modelNumber = 0;

}

- (BOOL)isEqual:(id)a3
{
  UARPAssetID *v4;
  UARPAssetID *v5;
  int64_t type;
  NSURL *remoteURL;
  void *v8;
  NSString *assetVersion;
  void *v10;
  NSNumber *assetVersionNumber;
  void *v12;
  NSURL *localURL;
  void *v14;
  int64_t downloadStatus;
  int64_t updateAvailabilityStatus;
  int64_t releaseNotesDownloadStatus;
  NSURL *releaseNotesRemoteURL;
  void *v19;
  NSURL *releaseNotesLocalURL;
  void *v21;
  int64_t releaseNotesAvailabilityStatus;
  NSString *remoteBuildManifestPlistPath;
  uint64_t v24;
  NSString *v25;
  void *v26;
  NSDate *assetReleaseDate;
  NSNumber *releaseNotesFileSize;
  NSNumber *firmwareFileSize;
  NSArray *deploymentRules;
  _BOOL4 deploymentAllowed;
  UARPAssetTag *tag;
  NSString *firmwareHash;
  NSString *modelNumber;
  NSMutableArray *downstreamAssetIDs;
  void *v36;
  char v37;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;

  v4 = (UARPAssetID *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (self == v4)
    {
      v37 = 1;
    }
    else
    {
      v5 = v4;
      type = self->_type;
      if (type == -[UARPAssetID type](v5, "type"))
      {
        remoteURL = self->_remoteURL;
        -[UARPAssetID remoteURL](v5, "remoteURL");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (nullableObjectsEqual(remoteURL, (uint64_t)v8))
        {
          assetVersion = self->_assetVersion;
          -[UARPAssetID assetVersion](v5, "assetVersion");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (nullableObjectsEqual(assetVersion, (uint64_t)v10))
          {
            assetVersionNumber = self->_assetVersionNumber;
            -[UARPAssetID assetVersionNumber](v5, "assetVersionNumber");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (nullableObjectsEqual(assetVersionNumber, (uint64_t)v12))
            {
              localURL = self->_localURL;
              -[UARPAssetID localURL](v5, "localURL");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              if (nullableObjectsEqual(localURL, (uint64_t)v14)
                && (downloadStatus = self->_downloadStatus,
                    downloadStatus == -[UARPAssetID downloadStatus](v5, "downloadStatus"))
                && (updateAvailabilityStatus = self->_updateAvailabilityStatus,
                    updateAvailabilityStatus == -[UARPAssetID updateAvailabilityStatus](v5, "updateAvailabilityStatus"))
                && (releaseNotesDownloadStatus = self->_releaseNotesDownloadStatus,
                    releaseNotesDownloadStatus == -[UARPAssetID releaseNotesDownloadStatus](v5, "releaseNotesDownloadStatus")))
              {
                releaseNotesRemoteURL = self->_releaseNotesRemoteURL;
                -[UARPAssetID releaseNotesRemoteURL](v5, "releaseNotesRemoteURL");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                if (nullableObjectsEqual(releaseNotesRemoteURL, (uint64_t)v19))
                {
                  releaseNotesLocalURL = self->_releaseNotesLocalURL;
                  -[UARPAssetID releaseNotesLocalURL](v5, "releaseNotesLocalURL");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  if (nullableObjectsEqual(releaseNotesLocalURL, (uint64_t)v21)
                    && (releaseNotesAvailabilityStatus = self->_releaseNotesAvailabilityStatus,
                        releaseNotesAvailabilityStatus == -[UARPAssetID releaseNotesAvailabilityStatus](v5, "releaseNotesAvailabilityStatus")))
                  {
                    remoteBuildManifestPlistPath = self->_remoteBuildManifestPlistPath;
                    -[UARPAssetID remoteBuildManifestPlistPath](v5, "remoteBuildManifestPlistPath");
                    v24 = objc_claimAutoreleasedReturnValue();
                    v25 = remoteBuildManifestPlistPath;
                    v26 = (void *)v24;
                    if (nullableObjectsEqual(v25, v24))
                    {
                      v46 = v26;
                      assetReleaseDate = self->_assetReleaseDate;
                      -[UARPAssetID assetReleaseDate](v5, "assetReleaseDate");
                      v45 = (void *)objc_claimAutoreleasedReturnValue();
                      if (nullableObjectsEqual(assetReleaseDate, (uint64_t)v45))
                      {
                        releaseNotesFileSize = self->_releaseNotesFileSize;
                        -[UARPAssetID releaseNotesFileSize](v5, "releaseNotesFileSize");
                        v44 = (void *)objc_claimAutoreleasedReturnValue();
                        if (nullableObjectsEqual(releaseNotesFileSize, (uint64_t)v44))
                        {
                          firmwareFileSize = self->_firmwareFileSize;
                          -[UARPAssetID firmwareFileSize](v5, "firmwareFileSize");
                          v43 = (void *)objc_claimAutoreleasedReturnValue();
                          if (nullableObjectsEqual(firmwareFileSize, (uint64_t)v43))
                          {
                            deploymentRules = self->_deploymentRules;
                            -[UARPAssetID deploymentRules](v5, "deploymentRules");
                            v42 = (void *)objc_claimAutoreleasedReturnValue();
                            if (nullableObjectsEqual(deploymentRules, (uint64_t)v42)
                              && (deploymentAllowed = self->_deploymentAllowed,
                                  deploymentAllowed == -[UARPAssetID deploymentAllowed](v5, "deploymentAllowed")))
                            {
                              tag = self->_tag;
                              -[UARPAssetID tag](v5, "tag");
                              v41 = (void *)objc_claimAutoreleasedReturnValue();
                              if (nullableObjectsEqual(tag, (uint64_t)v41))
                              {
                                firmwareHash = self->_firmwareHash;
                                -[UARPAssetID firmwareHash](v5, "firmwareHash");
                                v40 = (void *)objc_claimAutoreleasedReturnValue();
                                if (nullableObjectsEqual(firmwareHash, (uint64_t)v40))
                                {
                                  modelNumber = self->_modelNumber;
                                  -[UARPAssetID modelNumber](v5, "modelNumber");
                                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                                  if (nullableObjectsEqual(modelNumber, (uint64_t)v39))
                                  {
                                    downstreamAssetIDs = self->_downstreamAssetIDs;
                                    -[UARPAssetID downstreamAssetIDs](v5, "downstreamAssetIDs", v39, v40, v41, v42, v43, v44, v45);
                                    v36 = (void *)objc_claimAutoreleasedReturnValue();
                                    v37 = nullableObjectsEqual(downstreamAssetIDs, (uint64_t)v36);

                                  }
                                  else
                                  {
                                    v37 = 0;
                                  }

                                }
                                else
                                {
                                  v37 = 0;
                                }

                              }
                              else
                              {
                                v37 = 0;
                              }

                            }
                            else
                            {
                              v37 = 0;
                            }

                          }
                          else
                          {
                            v37 = 0;
                          }

                        }
                        else
                        {
                          v37 = 0;
                        }

                      }
                      else
                      {
                        v37 = 0;
                      }

                      v26 = v46;
                    }
                    else
                    {
                      v37 = 0;
                    }

                  }
                  else
                  {
                    v37 = 0;
                  }

                }
                else
                {
                  v37 = 0;
                }

              }
              else
              {
                v37 = 0;
              }

            }
            else
            {
              v37 = 0;
            }

          }
          else
          {
            v37 = 0;
          }

        }
        else
        {
          v37 = 0;
        }

      }
      else
      {
        v37 = 0;
      }

    }
  }
  else
  {
    v37 = 0;
  }

  return v37;
}

- (void)setReleaseNotesAvailabilityStatus:(int64_t)a3
{
  UARPAssetID *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_releaseNotesAvailabilityStatus = a3;
  objc_sync_exit(obj);

}

- (void)setReleaseNotesRemotePath:(id)a3
{
  UARPAssetID *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UARPAssetID setReleaseNotesRemoteURL:](v4, "setReleaseNotesRemoteURL:", v5);

  objc_sync_exit(v4);
}

- (void)setReleaseNotesLocalPath:(id)a3
{
  UARPAssetID *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UARPAssetID setReleaseNotesLocalURL:](v4, "setReleaseNotesLocalURL:", v5);

  objc_sync_exit(v4);
}

- (NSString)releaseNotesLocalPath
{
  return -[NSURL path](self->_releaseNotesLocalURL, "path");
}

- (void)setReleaseNotesRemoteURL:(id)a3
{
  UARPAssetID *v4;
  uint64_t v5;
  NSURL *releaseNotesRemoteURL;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = objc_msgSend(v7, "copy");
  releaseNotesRemoteURL = v4->_releaseNotesRemoteURL;
  v4->_releaseNotesRemoteURL = (NSURL *)v5;

  objc_sync_exit(v4);
}

- (void)setReleaseNotesLocalURL:(id)a3
{
  UARPAssetID *v4;
  uint64_t v5;
  NSURL *releaseNotesLocalURL;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = objc_msgSend(v7, "copy");
  releaseNotesLocalURL = v4->_releaseNotesLocalURL;
  v4->_releaseNotesLocalURL = (NSURL *)v5;

  objc_sync_exit(v4);
}

- (void)setReleaseNotesDownloadStatus:(int64_t)a3
{
  UARPAssetID *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_releaseNotesDownloadStatus = a3;
  objc_sync_exit(obj);

}

- (void)setReleaseDate:(id)a3
{
  UARPAssetID *v4;
  NSDate *v5;
  uint64_t v6;
  NSDate *assetReleaseDate;
  id v8;

  v8 = a3;
  v4 = self;
  objc_sync_enter(v4);
  if (v8)
  {
    v5 = (NSDate *)objc_alloc_init(MEMORY[0x24BDD1500]);
    -[NSDate setDateFormat:](v5, "setDateFormat:", CFSTR("MM/dd/yyyy"));
    -[NSDate dateFromString:](v5, "dateFromString:", v8);
    v6 = objc_claimAutoreleasedReturnValue();
    assetReleaseDate = v4->_assetReleaseDate;
    v4->_assetReleaseDate = (NSDate *)v6;

  }
  else
  {
    v5 = v4->_assetReleaseDate;
    v4->_assetReleaseDate = 0;
  }

  objc_sync_exit(v4);
}

- (NSString)releaseDate
{
  id v3;
  void *v4;

  if (self->_assetReleaseDate)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDD1500]);
    objc_msgSend(v3, "setDateFormat:", CFSTR("MM/dd/yyyy"));
    objc_msgSend(v3, "stringFromDate:", self->_assetReleaseDate);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (NSString *)v4;
}

- (void)setAssetReleaseDate:(id)a3
{
  UARPAssetID *v4;
  uint64_t v5;
  NSDate *assetReleaseDate;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = objc_msgSend(v7, "copy");
  assetReleaseDate = v4->_assetReleaseDate;
  v4->_assetReleaseDate = (NSDate *)v5;

  objc_sync_exit(v4);
}

- (void)setReleaseNotesFileSize:(id)a3
{
  NSNumber *v4;
  NSNumber *releaseNotesFileSize;
  UARPAssetID *obj;

  v4 = (NSNumber *)a3;
  obj = self;
  objc_sync_enter(obj);
  releaseNotesFileSize = obj->_releaseNotesFileSize;
  obj->_releaseNotesFileSize = v4;

  objc_sync_exit(obj);
}

- (void)setFirmwareFileSize:(id)a3
{
  NSNumber *v4;
  NSNumber *firmwareFileSize;
  UARPAssetID *obj;

  v4 = (NSNumber *)a3;
  obj = self;
  objc_sync_enter(obj);
  firmwareFileSize = obj->_firmwareFileSize;
  obj->_firmwareFileSize = v4;

  objc_sync_exit(obj);
}

- (void)setAssetVersion:(id)a3
{
  UARPAssetID *v4;
  uint64_t v5;
  NSString *assetVersion;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = objc_msgSend(v7, "copy");
  assetVersion = v4->_assetVersion;
  v4->_assetVersion = (NSString *)v5;

  objc_sync_exit(v4);
}

- (id)assetVersionNumber
{
  return self->_assetVersionNumber;
}

- (void)setAssetVersionNumber:(id)a3
{
  UARPAssetID *v4;
  uint64_t v5;
  NSNumber *assetVersionNumber;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = objc_msgSend(v7, "copy");
  assetVersionNumber = v4->_assetVersionNumber;
  v4->_assetVersionNumber = (NSNumber *)v5;

  objc_sync_exit(v4);
}

- (void)setLocalPath:(id)a3
{
  UARPAssetID *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UARPAssetID setLocalURL:](v4, "setLocalURL:", v5);

  objc_sync_exit(v4);
}

- (NSString)localPath
{
  return -[NSURL path](self->_localURL, "path");
}

- (void)setLocalURL:(id)a3
{
  NSURL *v4;
  NSURL *localURL;
  UARPAssetID *obj;

  v4 = (NSURL *)a3;
  obj = self;
  objc_sync_enter(obj);
  localURL = obj->_localURL;
  obj->_localURL = v4;

  objc_sync_exit(obj);
}

- (void)setIsUrgentUpdate:(BOOL)a3
{
  UARPAssetID *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_isUrgentUpdate = a3;
  objc_sync_exit(obj);

}

- (void)setDownloadStatus:(int64_t)a3
{
  UARPAssetID *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_downloadStatus = a3;
  objc_sync_exit(obj);

}

- (void)setUpdateAvailabilityStatus:(int64_t)a3
{
  UARPAssetID *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_updateAvailabilityStatus = a3;
  objc_sync_exit(obj);

}

- (void)setSignatureValidationNeeded:(BOOL)a3
{
  UARPAssetID *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_signatureValidationNeeded = a3;
  objc_sync_exit(obj);

}

- (BOOL)signatureValidationNeeded
{
  return self->_signatureValidationNeeded;
}

- (void)setValidationStatus:(int64_t)a3
{
  UARPAssetID *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_validationStatus = a3;
  objc_sync_exit(obj);

}

- (int64_t)validationStatus
{
  return self->_validationStatus;
}

- (void)setDeploymentDay:(id)a3
{
  NSNumber *v4;
  NSNumber *deploymentDay;
  UARPAssetID *obj;

  v4 = (NSNumber *)a3;
  obj = self;
  objc_sync_enter(obj);
  deploymentDay = obj->_deploymentDay;
  obj->_deploymentDay = v4;

  objc_sync_exit(obj);
}

- (id)deploymentDay
{
  return self->_deploymentDay;
}

- (void)setDeploymentPercent:(id)a3
{
  NSNumber *v4;
  NSNumber *deploymentPercent;
  UARPAssetID *obj;

  v4 = (NSNumber *)a3;
  obj = self;
  objc_sync_enter(obj);
  deploymentPercent = obj->_deploymentPercent;
  obj->_deploymentPercent = v4;

  objc_sync_exit(obj);
}

- (id)deploymentPercent
{
  return self->_deploymentPercent;
}

- (void)setDeploymentAllowed:(BOOL)a3
{
  UARPAssetID *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_deploymentAllowed = a3;
  objc_sync_exit(obj);

}

- (void)setDeploymentRules:(id)a3
{
  UARPAssetID *v4;
  uint64_t v5;
  NSArray *deploymentRules;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = objc_msgSend(v7, "copy");
  deploymentRules = v4->_deploymentRules;
  v4->_deploymentRules = (NSArray *)v5;

  objc_sync_exit(v4);
}

- (void)setTag:(id)a3
{
  UARPAssetID *v4;
  uint64_t v5;
  UARPAssetTag *tag;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = objc_msgSend(v7, "copy");
  tag = v4->_tag;
  v4->_tag = (UARPAssetTag *)v5;

  objc_sync_exit(v4);
}

- (void)setFirmwareHash:(id)a3
{
  UARPAssetID *v4;
  uint64_t v5;
  NSString *firmwareHash;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = objc_msgSend(v7, "copy");
  firmwareHash = v4->_firmwareHash;
  v4->_firmwareHash = (NSString *)v5;

  objc_sync_exit(v4);
}

- (void)setTatsuServerURL:(id)a3
{
  NSURL *v4;
  NSURL *tatsuServerURL;
  UARPAssetID *obj;

  v4 = (NSURL *)a3;
  obj = self;
  objc_sync_enter(obj);
  tatsuServerURL = obj->_tatsuServerURL;
  obj->_tatsuServerURL = v4;

  objc_sync_exit(obj);
}

- (void)setModelNumber:(id)a3
{
  NSString *v4;
  NSString *modelNumber;
  UARPAssetID *obj;

  v4 = (NSString *)a3;
  obj = self;
  objc_sync_enter(obj);
  modelNumber = obj->_modelNumber;
  obj->_modelNumber = v4;

  objc_sync_exit(obj);
}

- (NSString)firmwareHash
{
  return self->_firmwareHash;
}

- (void)stagingStartedOnAccessoryID:(id)a3
{
  -[NSMutableArray addObject:](self->_activeAccessoriesForStaging, "addObject:", a3);
}

- (void)stagingCompleteOnAccessoryID:(id)a3
{
  -[NSMutableArray removeObject:](self->_activeAccessoriesForStaging, "removeObject:", a3);
}

- (BOOL)isStagingInProgressOnAccessoryID:(id)a3
{
  return -[NSMutableArray containsObject:](self->_activeAccessoriesForStaging, "containsObject:", a3);
}

- (void)processUARPDeploymentRules:(id)a3
{
  NSArray *v4;
  NSArray *deploymentRules;

  -[UARPAssetID _createUARPDeploymentRules:](self, "_createUARPDeploymentRules:", a3);
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  deploymentRules = self->_deploymentRules;
  self->_deploymentRules = v4;

  self->_deploymentAllowed = -[UARPAssetID isDeploymentAllowed](self, "isDeploymentAllowed");
}

- (void)setReportProgressToDelegates:(BOOL)a3
{
  self->_reportProgressToDelegates = a3;
}

- (BOOL)reportProgressToDelegates
{
  return self->_reportProgressToDelegates;
}

- (const)typeString
{
  unint64_t type;

  type = self->_type;
  if (type > 0x10)
    return "unrecognized";
  else
    return off_24CEA3FB8[type];
}

- (id)rawDescription
{
  id v3;
  const char *updated;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  objc_msgSend(v3, "appendFormat:", CFSTR("type=%s, assetVersion=%@/%@"), -[UARPAssetID typeString](self, "typeString"), self->_assetVersion, self->_assetVersionNumber);
  if (self->_modelNumber)
    objc_msgSend(v3, "appendFormat:", CFSTR(", downstream=%@"), self->_modelNumber);
  if (self->_remoteURL)
    objc_msgSend(v3, "appendFormat:", CFSTR(", remoteURL=%@"), self->_remoteURL);
  if (self->_localURL)
    objc_msgSend(v3, "appendFormat:", CFSTR(", localURL=%@"), self->_localURL);
  if (self->_releaseNotesRemoteURL)
    objc_msgSend(v3, "appendFormat:", CFSTR(", releaseNotesRemotePath=%@"), self->_releaseNotesRemoteURL);
  if (-[NSMutableArray count](self->_downstreamAssetIDs, "count"))
    objc_msgSend(v3, "appendFormat:", CFSTR(", downstreamAssetIDs=%lu"), -[NSMutableArray count](self->_downstreamAssetIDs, "count"));
  updated = UARPFirmwareUpdateAvailabilityStatusToString(self->_updateAvailabilityStatus);
  objc_msgSend(v3, "appendFormat:", CFSTR(", updateAvailablity=%s, releaseNotesAvailability=%s, "), updated, UARPFirmwareUpdateAvailabilityStatusToString(self->_releaseNotesAvailabilityStatus));
  if (self->_tag)
    objc_msgSend(v3, "appendFormat:", CFSTR(", tag=%@"), self->_tag);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UARPAssetID rawDescription](self, "rawDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %@>"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_createUARPDeploymentRules:(id)a3
{
  id v3;
  uint64_t i;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UARPDeploymentRuleConfig *v11;
  UARPDeploymentRule *v12;
  NSObject *log;
  id v15;
  id obj;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v18 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v20 = objc_alloc_init(MEMORY[0x24BDD1500]);
    objc_msgSend(v20, "setDateFormat:", CFSTR("MM/dd/yyyy"));
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v15 = v3;
    obj = v3;
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    if (v21)
    {
      v19 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v23 != v19)
            objc_enumerationMutation(obj);
          v5 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v5, "objectForKey:", CFSTR("rampPeriod"));
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "objectForKey:", CFSTR("deploymentLimit"));
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "objectForKey:", CFSTR("countryList"));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "objectForKey:", CFSTR("goLiveDate"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "dateFromString:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_alloc_init(UARPDeploymentRuleConfig);
          -[UARPDeploymentRuleConfig setGoLiveDate:](v11, "setGoLiveDate:", v10);
          -[UARPDeploymentRuleConfig setCountryList:](v11, "setCountryList:", v8);
          -[UARPDeploymentRuleConfig setRampPeriod:](v11, "setRampPeriod:", v6);
          -[UARPDeploymentRuleConfig setDeploymentLimit:](v11, "setDeploymentLimit:", v7);
          v12 = -[UARPDeploymentRule initWithConfig:]([UARPDeploymentRule alloc], "initWithConfig:", v11);
          if (v12)
          {
            objc_msgSend(v18, "addObject:", v12);
          }
          else
          {
            log = self->_log;
            if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v27 = v5;
              _os_log_error_impl(&dword_212D08000, log, OS_LOG_TYPE_ERROR, "Error: Invalid rule combination not allowed %@", buf, 0xCu);
            }
          }

        }
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
      }
      while (v21);
    }

    v3 = v15;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (BOOL)isDeploymentAllowed
{
  NSArray *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *log;
  char v13;
  void *v14;
  NSNumber *v15;
  NSNumber *deploymentDay;
  void *v17;
  NSNumber *v18;
  NSNumber *deploymentPercent;
  BOOL v20;
  __int128 v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  if (!-[NSArray count](self->_deploymentRules, "count"))
    return 1;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v3 = self->_deploymentRules;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  if (v4)
  {
    v6 = v4;
    v7 = 0;
    v8 = *(_QWORD *)v25;
    *(_QWORD *)&v5 = 138412290;
    v22 = v5;
LABEL_4:
    v9 = 0;
    v10 = v7;
    while (1)
    {
      if (*(_QWORD *)v25 != v8)
        objc_enumerationMutation(v3);
      v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v9);
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = v22;
        v29 = v11;
        _os_log_impl(&dword_212D08000, log, OS_LOG_TYPE_INFO, "Checking Rule %@", buf, 0xCu);
      }
      v23 = v10;
      v13 = objc_msgSend(v11, "isDeploymentAllowed:", &v23, v22);
      v7 = v23;

      objc_msgSend(v11, "deploymentDay");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend(v11, "deploymentDay");
        v15 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        deploymentDay = self->_deploymentDay;
        self->_deploymentDay = v15;

      }
      objc_msgSend(v11, "deploymentPercent");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        objc_msgSend(v11, "deploymentPercent");
        v18 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        deploymentPercent = self->_deploymentPercent;
        self->_deploymentPercent = v18;

      }
      if ((v13 & 1) != 0)
        break;
      ++v9;
      v10 = v7;
      if (v6 == v9)
      {
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
        if (v6)
          goto LABEL_4;
        v20 = 0;
        goto LABEL_20;
      }
    }
  }
  else
  {
    v7 = 0;
  }
  v20 = 1;
LABEL_20:

  return v20;
}

- (BOOL)isDynamicAsset
{
  return self->_tag != 0;
}

- (void)dumpWithTabDepth:(unint64_t)a3 dumpString:(id)a4
{
  id v6;
  unint64_t v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  const char *v14;
  const char *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend(v6, "appendWithTabDepth:format:", a3, CFSTR("Asset ID:\n"));
  v7 = a3 + 1;
  objc_msgSend(v6, "appendWithTabDepth:format:", a3 + 1, CFSTR("Type: %s\n"), UARPAssetLocationTypeToString(self->_type));
  if (self->_remoteURL)
    objc_msgSend(v6, "appendWithTabDepth:format:", a3 + 1, CFSTR("Remote URL: %@\n"), self->_remoteURL);
  if (self->_assetVersion)
    objc_msgSend(v6, "appendWithTabDepth:format:", a3 + 1, CFSTR("Asset Version: %@\n"), self->_assetVersion);
  if (self->_assetVersionNumber)
    objc_msgSend(v6, "appendWithTabDepth:format:", a3 + 1, CFSTR("Asset Version Number: %@\n"), self->_assetVersionNumber);
  if (self->_localURL)
    objc_msgSend(v6, "appendWithTabDepth:format:", a3 + 1, CFSTR("Local URL: %@\n"), self->_localURL);
  if (self->_tag)
    objc_msgSend(v6, "appendWithTabDepth:format:", a3 + 1, CFSTR("Asset Tag: %@\n"), self->_tag);
  objc_msgSend(v6, "appendWithTabDepth:format:", a3 + 1, CFSTR("Download Status: %s\n"), UARPAssetDownloadStatusToString(self->_downloadStatus));
  objc_msgSend(v6, "appendWithTabDepth:format:", a3 + 1, CFSTR("Update Availability Status: %s\n"), UARPFirmwareUpdateAvailabilityStatusToString(self->_updateAvailabilityStatus));
  objc_msgSend(v6, "appendWithTabDepth:format:", a3 + 1, CFSTR("Release Notes Download Status: %s\n"), UARPAssetDownloadStatusToString(self->_releaseNotesDownloadStatus));
  if (self->_releaseNotesRemoteURL)
    objc_msgSend(v6, "appendWithTabDepth:format:", a3 + 1, CFSTR("Release Notes Remote URL: %@\n"), self->_releaseNotesRemoteURL);
  if (self->_releaseNotesLocalURL)
    objc_msgSend(v6, "appendWithTabDepth:format:", a3 + 1, CFSTR("Release Notes Local URL: %@\n"), self->_releaseNotesLocalURL);
  objc_msgSend(v6, "appendWithTabDepth:format:", a3 + 1, CFSTR("Release Notes Availability Status: %s\n"), UARPFirmwareUpdateAvailabilityStatusToString(self->_releaseNotesAvailabilityStatus));
  if (self->_assetReleaseDate)
    objc_msgSend(v6, "appendWithTabDepth:format:", a3 + 1, CFSTR("Release Date: %@\n"), self->_assetReleaseDate);
  if (self->_releaseNotesFileSize)
    objc_msgSend(v6, "appendWithTabDepth:format:", a3 + 1, CFSTR("Release Notes File Size: %@\n"), self->_releaseNotesFileSize);
  if (self->_firmwareFileSize)
    objc_msgSend(v6, "appendWithTabDepth:format:", a3 + 1, CFSTR("Firmware File Size: %@\n"), self->_firmwareFileSize);
  if (-[NSArray count](self->_deploymentRules, "count"))
  {
    objc_msgSend(v6, "appendWithTabDepth:format:", a3 + 1, CFSTR("Deployment Rules:\n"));
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = self->_deploymentRules;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      v12 = a3 + 2;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v13++), "dumpWithTabDepth:dumpString:", v12, v6);
        }
        while (v10 != v13);
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

  }
  if (self->_deploymentAllowed)
    v14 = "yes";
  else
    v14 = "no";
  objc_msgSend(v6, "appendWithTabDepth:format:", v7, CFSTR("Deployment allowed: %s\n"), v14);
  if (self->_signatureValidationNeeded)
    v15 = "yes";
  else
    v15 = "no";
  objc_msgSend(v6, "appendWithTabDepth:format:", v7, CFSTR("Signature Validation Needed: %s\n"), v15);

}

- (int64_t)type
{
  return self->_type;
}

- (NSString)remotePath
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setRemotePath:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 112);
}

- (NSString)assetVersion
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (int64_t)downloadStatus
{
  return self->_downloadStatus;
}

- (int64_t)updateAvailabilityStatus
{
  return self->_updateAvailabilityStatus;
}

- (int64_t)releaseNotesDownloadStatus
{
  return self->_releaseNotesDownloadStatus;
}

- (NSString)releaseNotesRemotePath
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (int64_t)releaseNotesAvailabilityStatus
{
  return self->_releaseNotesAvailabilityStatus;
}

- (NSDate)assetReleaseDate
{
  return (NSDate *)objc_getProperty(self, a2, 168, 1);
}

- (NSNumber)releaseNotesFileSize
{
  return (NSNumber *)objc_getProperty(self, a2, 176, 1);
}

- (NSNumber)firmwareFileSize
{
  return (NSNumber *)objc_getProperty(self, a2, 184, 1);
}

- (NSArray)deploymentRules
{
  return (NSArray *)objc_getProperty(self, a2, 192, 1);
}

- (BOOL)deploymentAllowed
{
  return self->_deploymentAllowed;
}

- (UARPAssetTag)tag
{
  return (UARPAssetTag *)objc_getProperty(self, a2, 200, 1);
}

- (NSURL)remoteURL
{
  return (NSURL *)objc_getProperty(self, a2, 208, 1);
}

- (void)setRemoteURL:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 208);
}

- (NSURL)localURL
{
  return (NSURL *)objc_getProperty(self, a2, 216, 1);
}

- (NSURL)releaseNotesRemoteURL
{
  return (NSURL *)objc_getProperty(self, a2, 224, 1);
}

- (NSURL)releaseNotesLocalURL
{
  return (NSURL *)objc_getProperty(self, a2, 232, 1);
}

- (NSURL)tatsuServerURL
{
  return (NSURL *)objc_getProperty(self, a2, 240, 1);
}

- (BOOL)isUrgentUpdate
{
  return self->_isUrgentUpdate;
}

- (NSString)modelNumber
{
  return (NSString *)objc_getProperty(self, a2, 248, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelNumber, 0);
  objc_storeStrong((id *)&self->_tatsuServerURL, 0);
  objc_storeStrong((id *)&self->_releaseNotesLocalURL, 0);
  objc_storeStrong((id *)&self->_releaseNotesRemoteURL, 0);
  objc_storeStrong((id *)&self->_localURL, 0);
  objc_storeStrong((id *)&self->_remoteURL, 0);
  objc_storeStrong((id *)&self->_tag, 0);
  objc_storeStrong((id *)&self->_deploymentRules, 0);
  objc_storeStrong((id *)&self->_firmwareFileSize, 0);
  objc_storeStrong((id *)&self->_releaseNotesFileSize, 0);
  objc_storeStrong((id *)&self->_assetReleaseDate, 0);
  objc_storeStrong((id *)&self->_releaseNotesRemotePath, 0);
  objc_storeStrong((id *)&self->_assetVersion, 0);
  objc_storeStrong((id *)&self->_remotePath, 0);
  objc_storeStrong((id *)&self->_assetVersionNumber, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_downstreamAssetIDs, 0);
  objc_storeStrong((id *)&self->_activeAccessoriesForStaging, 0);
  objc_storeStrong((id *)&self->_firmwareHash, 0);
  objc_storeStrong((id *)&self->_deploymentPercent, 0);
  objc_storeStrong((id *)&self->_deploymentDay, 0);
  objc_storeStrong((id *)&self->_remoteBuildManifestPlistPath, 0);
}

@end

@implementation MSDKSignedManifest

+ (id)signedManifestAtPath:(id)a3
{
  return +[MSDKSignedManifest signedManifestAtPath:verifyManifest:](MSDKSignedManifest, "signedManifestAtPath:verifyManifest:", a3, 1);
}

+ (id)signedManifestAtPath:(id)a3 verifyManifest:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  id v6;

  v4 = a4;
  v5 = a3;
  v6 = -[MSDKSignedManifest initFromManifestAtPath:verifyManifest:]([MSDKSignedManifest alloc], "initFromManifestAtPath:verifyManifest:", v5, v4);

  return v6;
}

- (id)initFromManifestAtPath:(id)a3 verifyManifest:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  MSDKSignedManifest *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _BOOL4 v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSArray *nonSystemAppList;
  uint64_t v22;
  NSArray *systemAppList;
  uint64_t v24;
  NSArray *backupDataList;
  uint64_t v26;
  NSArray *userDataList;
  uint64_t v28;
  NSArray *appDataList;
  uint64_t v30;
  NSArray *groupDataList;
  uint64_t v32;
  NSArray *extensionDataList;
  uint64_t v34;
  NSArray *provisioningProfiles;
  uint64_t v36;
  NSArray *configurationProfiles;
  uint64_t v38;
  NSArray *factoryBackupList;
  uint64_t v40;
  NSArray *allFiles;
  NSObject *v42;
  MSDKSignedManifest *v43;
  NSObject *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  objc_super v53;
  uint8_t buf[4];
  id v55;
  uint64_t v56;

  v4 = a4;
  v56 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v53.receiver = self;
  v53.super_class = (Class)MSDKSignedManifest;
  v7 = -[MSDKSignedManifest init](&v53, sel_init);
  if (!v7)
    goto LABEL_35;
  defaultLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v55 = v6;
    _os_log_impl(&dword_213A7E000, v8, OS_LOG_TYPE_DEFAULT, "Reading manifest at path %{public}@...", buf, 0xCu);
  }

  -[MSDKSignedManifest setFilePath:](v7, "setFilePath:", v6);
  -[MSDKSignedManifest _manifestDataFromFile:](v7, "_manifestDataFromFile:", v6);
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    defaultLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213A7E000, v11, OS_LOG_TYPE_DEFAULT, "Checking manifest version...", buf, 2u);
    }

    objc_msgSend(v10, "objectForKey:ofType:", CFSTR("Version"), objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v7->_version = objc_msgSend(v12, "intValue");
      if (-[MSDKSignedManifest _checkManifestVersion](v7, "_checkManifestVersion"))
      {
        defaultLogHandle();
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
        if (!v4)
        {
          if (v15)
          {
            *(_DWORD *)buf = 138543362;
            v55 = v6;
            _os_log_impl(&dword_213A7E000, v14, OS_LOG_TYPE_DEFAULT, "Skipping verification for manifest at path %{public}@", buf, 0xCu);
          }
          v17 = 0;
          v19 = v10;
          goto LABEL_19;
        }
        if (v15)
        {
          *(_DWORD *)buf = 138543362;
          v55 = v6;
          _os_log_impl(&dword_213A7E000, v14, OS_LOG_TYPE_DEFAULT, "Verifying manifest at path %{public}@...", buf, 0xCu);
        }

        +[MSDDemoManifestCheck sharedInstance](MSDDemoManifestCheck, "sharedInstance");
        v16 = objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v17 = (void *)v16;
          objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24D0B83E8);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "verifyFactoryManifestSignature:forDataSectionKeys:", v10, v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            defaultLogHandle();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v55 = v6;
              _os_log_impl(&dword_213A7E000, v14, OS_LOG_TYPE_DEFAULT, "Manifest at path %{public}@ verified", buf, 0xCu);
            }
LABEL_19:

            if (-[MSDKSignedManifest _parseManifestInfo:](v7, "_parseManifestInfo:", v19))
            {
              if (-[MSDKSignedManifest _parseInstallationOrder:](v7, "_parseInstallationOrder:", v19))
              {
                -[MSDKSignedManifest _componentListForSection:fromPayload:](v7, "_componentListForSection:fromPayload:", CFSTR("Apps"), v19);
                v20 = objc_claimAutoreleasedReturnValue();
                nonSystemAppList = v7->_nonSystemAppList;
                v7->_nonSystemAppList = (NSArray *)v20;

                if (v7->_nonSystemAppList)
                {
                  -[MSDKSignedManifest _componentListForSection:fromPayload:](v7, "_componentListForSection:fromPayload:", CFSTR("SystemApps"), v19);
                  v22 = objc_claimAutoreleasedReturnValue();
                  systemAppList = v7->_systemAppList;
                  v7->_systemAppList = (NSArray *)v22;

                  if (v7->_systemAppList)
                  {
                    -[MSDKSignedManifest _componentListForSection:fromPayload:](v7, "_componentListForSection:fromPayload:", CFSTR("BackupData"), v19);
                    v24 = objc_claimAutoreleasedReturnValue();
                    backupDataList = v7->_backupDataList;
                    v7->_backupDataList = (NSArray *)v24;

                    if (v7->_backupDataList)
                    {
                      -[MSDKSignedManifest _componentListForSection:fromPayload:](v7, "_componentListForSection:fromPayload:", CFSTR("UserData"), v19);
                      v26 = objc_claimAutoreleasedReturnValue();
                      userDataList = v7->_userDataList;
                      v7->_userDataList = (NSArray *)v26;

                      if (v7->_userDataList)
                      {
                        -[MSDKSignedManifest _componentListForSection:fromPayload:](v7, "_componentListForSection:fromPayload:", CFSTR("AppData"), v19);
                        v28 = objc_claimAutoreleasedReturnValue();
                        appDataList = v7->_appDataList;
                        v7->_appDataList = (NSArray *)v28;

                        if (v7->_appDataList)
                        {
                          -[MSDKSignedManifest _componentListForSection:fromPayload:](v7, "_componentListForSection:fromPayload:", CFSTR("GroupData"), v19);
                          v30 = objc_claimAutoreleasedReturnValue();
                          groupDataList = v7->_groupDataList;
                          v7->_groupDataList = (NSArray *)v30;

                          if (v7->_groupDataList)
                          {
                            -[MSDKSignedManifest _componentListForSection:fromPayload:](v7, "_componentListForSection:fromPayload:", CFSTR("ExtensionData"), v19);
                            v32 = objc_claimAutoreleasedReturnValue();
                            extensionDataList = v7->_extensionDataList;
                            v7->_extensionDataList = (NSArray *)v32;

                            if (v7->_extensionDataList)
                            {
                              -[MSDKSignedManifest _componentListForSection:fromPayload:](v7, "_componentListForSection:fromPayload:", CFSTR("ProvisioningProfiles"), v19);
                              v34 = objc_claimAutoreleasedReturnValue();
                              provisioningProfiles = v7->_provisioningProfiles;
                              v7->_provisioningProfiles = (NSArray *)v34;

                              if (v7->_provisioningProfiles)
                              {
                                -[MSDKSignedManifest _componentListForSection:fromPayload:](v7, "_componentListForSection:fromPayload:", CFSTR("ConfigurationProfiles"), v19);
                                v36 = objc_claimAutoreleasedReturnValue();
                                configurationProfiles = v7->_configurationProfiles;
                                v7->_configurationProfiles = (NSArray *)v36;

                                if (v7->_configurationProfiles)
                                {
                                  -[MSDKSignedManifest _parseFactoryBackupList](v7, "_parseFactoryBackupList");
                                  v38 = objc_claimAutoreleasedReturnValue();
                                  factoryBackupList = v7->_factoryBackupList;
                                  v7->_factoryBackupList = (NSArray *)v38;

                                  if (v38)
                                  {
                                    -[MSDKSignedManifest _parseAllFiles](v7, "_parseAllFiles");
                                    v40 = objc_claimAutoreleasedReturnValue();
                                    allFiles = v7->_allFiles;
                                    v7->_allFiles = (NSArray *)v40;

                                    if (v40)
                                    {
                                      if (-[MSDKSignedManifest _parseLocale](v7, "_parseLocale")
                                        && -[MSDKSignedManifest _buildAppDepedencies](v7, "_buildAppDepedencies"))
                                      {

LABEL_35:
                                        defaultLogHandle();
                                        v42 = objc_claimAutoreleasedReturnValue();
                                        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
                                        {
                                          *(_DWORD *)buf = 138543362;
                                          v55 = v6;
                                          _os_log_impl(&dword_213A7E000, v42, OS_LOG_TYPE_DEFAULT, "Successfully parsed manifest at path %{public}@", buf, 0xCu);
                                        }

                                        v43 = v7;
                                        goto LABEL_38;
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
            v10 = v19;
            goto LABEL_40;
          }
          v10 = 0;
LABEL_40:

          goto LABEL_41;
        }
        defaultLogHandle();
        v52 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
          -[MSDKSignedManifest initFromManifestAtPath:verifyManifest:].cold.2(v52);

      }
    }
    v17 = 0;
    goto LABEL_40;
  }
LABEL_41:
  defaultLogHandle();
  v45 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    -[MSDKSignedManifest initFromManifestAtPath:verifyManifest:].cold.1((uint64_t)v6, v45, v46, v47, v48, v49, v50, v51);

  v43 = 0;
LABEL_38:

  return v43;
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
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: Name:%@>"), v5, self->_bundleName);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_manifestDataFromFile:(id)a3
{
  id v3;
  void *v4;
  char v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  NSObject *v14;
  id v15;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fileExistsAtPath:", v3);

  if ((v5 & 1) == 0)
  {
    defaultLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[MSDKSignedManifest _manifestDataFromFile:].cold.4();
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x24BDBCE90], "inputStreamWithFileAtPath:", v3);
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    defaultLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[MSDKSignedManifest _manifestDataFromFile:].cold.1();
    goto LABEL_16;
  }
  v7 = (void *)v6;
  objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x24BDBCA90];
  objc_msgSend(v7, "scheduleInRunLoop:forMode:", v8, *MEMORY[0x24BDBCA90]);

  objc_msgSend(v7, "open");
  v15 = 0;
  objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithStream:options:format:error:", v7, 2, 0, &v15);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v15;
  objc_msgSend(v7, "close");
  objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeFromRunLoop:forMode:", v12, v9);

  if (!v10)
  {
    defaultLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[MSDKSignedManifest _manifestDataFromFile:].cold.2();
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    defaultLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[MSDKSignedManifest _manifestDataFromFile:].cold.3();

LABEL_15:
LABEL_16:
    v10 = 0;
  }

  return v10;
}

- (BOOL)_checkManifestVersion
{
  return self->_version == 7;
}

- (BOOL)_parseManifestInfo:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSArray *v7;
  NSArray *products;
  NSString *v9;
  NSString *contentCode;
  NSString *v11;
  NSString *bundleName;
  NSDate *v13;
  NSDate *dateCreated;
  NSString *v15;
  NSString *language;
  NSString *v17;
  NSString *minimumOSVersion;
  NSNumber *v19;
  NSNumber *networkTier;
  NSString *v21;
  NSString *partNumber;
  NSNumber *v23;
  NSNumber *revision;
  NSDate *v25;
  NSDate *validUntil;
  NSString *v27;
  NSString *bundleID;
  BOOL v29;
  uint8_t buf[4];
  const __CFString *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  defaultLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v32 = CFSTR("Info");
    _os_log_impl(&dword_213A7E000, v5, OS_LOG_TYPE_DEFAULT, "Parsing %{public}@ section...", buf, 0xCu);
  }

  objc_msgSend(v4, "objectForKey:ofType:", CFSTR("Info"), objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_17;
  objc_msgSend(v6, "objectForKey:ofType:", CFSTR("Product"), objc_opt_class());
  v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
  products = self->_products;
  self->_products = v7;

  objc_msgSend(v6, "objectForKey:ofType:", CFSTR("ContentCode"), objc_opt_class());
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  contentCode = self->_contentCode;
  self->_contentCode = v9;

  objc_msgSend(v6, "objectForKey:ofType:", CFSTR("BundleName"), objc_opt_class());
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  bundleName = self->_bundleName;
  self->_bundleName = v11;

  objc_msgSend(v6, "objectForKey:ofType:", CFSTR("CreateTime"), objc_opt_class());
  v13 = (NSDate *)objc_claimAutoreleasedReturnValue();
  dateCreated = self->_dateCreated;
  self->_dateCreated = v13;

  objc_msgSend(v6, "objectForKey:ofType:", CFSTR("Language"), objc_opt_class());
  v15 = (NSString *)objc_claimAutoreleasedReturnValue();
  language = self->_language;
  self->_language = v15;

  objc_msgSend(v6, "objectForKey:ofType:", CFSTR("MinimumOSVersion"), objc_opt_class());
  v17 = (NSString *)objc_claimAutoreleasedReturnValue();
  minimumOSVersion = self->_minimumOSVersion;
  self->_minimumOSVersion = v17;

  objc_msgSend(v6, "objectForKey:ofType:", CFSTR("NetworkTier"), objc_opt_class());
  v19 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  networkTier = self->_networkTier;
  self->_networkTier = v19;

  objc_msgSend(v6, "objectForKey:ofType:", CFSTR("PartNumber"), objc_opt_class());
  v21 = (NSString *)objc_claimAutoreleasedReturnValue();
  partNumber = self->_partNumber;
  self->_partNumber = v21;

  objc_msgSend(v6, "objectForKey:ofType:", CFSTR("Revision"), objc_opt_class());
  v23 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  revision = self->_revision;
  self->_revision = v23;

  objc_msgSend(v6, "objectForKey:ofType:", CFSTR("ValidUntil"), objc_opt_class());
  v25 = (NSDate *)objc_claimAutoreleasedReturnValue();
  validUntil = self->_validUntil;
  self->_validUntil = v25;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%d"), self->_partNumber, -[NSNumber intValue](self->_revision, "intValue"));
  v27 = (NSString *)objc_claimAutoreleasedReturnValue();
  bundleID = self->_bundleID;
  self->_bundleID = v27;

  if (!self->_products)
    goto LABEL_17;
  if (self->_contentCode
    && self->_bundleName
    && self->_dateCreated
    && self->_language
    && self->_minimumOSVersion
    && self->_networkTier
    && self->_partNumber
    && self->_revision
    && self->_validUntil
    && self->_bundleID)
  {
    v29 = 1;
  }
  else
  {
LABEL_17:
    v29 = 0;
  }

  return v29;
}

- (BOOL)_parseInstallationOrder:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  defaultLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 138543362;
    v21 = CFSTR("InstallationOrder");
    _os_log_impl(&dword_213A7E000, v5, OS_LOG_TYPE_DEFAULT, "Parsing %{public}@...", (uint8_t *)&v20, 0xCu);
  }

  -[MSDKSignedManifest setCriticalComponents:](self, "setCriticalComponents:", MEMORY[0x24BDBD1A8]);
  v6 = (void *)objc_opt_new();
  objc_msgSend(v4, "objectForKey:", CFSTR("InstallationOrder"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    defaultLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[MSDKSignedManifest _parseInstallationOrder:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);
    goto LABEL_23;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      defaultLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[MSDKSignedManifest _parseInstallationOrder:].cold.2();
LABEL_23:

      v10 = 0;
      goto LABEL_18;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "objectForKey:", CFSTR("CriticalComponents"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("Components"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v6, "addObjectsFromArray:", v8);
        -[MSDKSignedManifest setCriticalComponents:](self, "setCriticalComponents:", v8);
      }
    }
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v6, "addObjectsFromArray:", v9);
    }

    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v6;
    v6 = (void *)objc_msgSend(v7, "mutableCopy");
LABEL_16:

  }
  -[MSDKSignedManifest setInstallationOrder:](self, "setInstallationOrder:", v6);
  v10 = 1;
LABEL_18:

  return v10;
}

- (id)_parseFactoryBackupList
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24D0B8400);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "addObjectsFromArray:", self->_backupDataList);
  objc_msgSend(v5, "addObjectsFromArray:", self->_userDataList);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v19;
    *(_QWORD *)&v8 = 138543362;
    v17 = v8;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v12, "identifier", v17, (_QWORD)v18);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v3, "containsObject:", v13);

        if (v14)
        {
          defaultLogHandle();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v17;
            v23 = v12;
            _os_log_impl(&dword_213A7E000, v15, OS_LOG_TYPE_DEFAULT, "Removing %{public}@ from factory backup list", buf, 0xCu);
          }

          objc_msgSend(v4, "addObject:", v12);
        }
      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v9);
  }

  objc_msgSend(v6, "removeObjectsInArray:", v4);
  return v6;
}

- (BOOL)_parseLocale
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSString *v15;
  NSString *languageCode;
  void *v17;
  NSString *v18;
  NSString *regionCode;
  NSString *v20;
  NSString *v21;
  NSString *localeCode;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v3 = self->_backupDataList;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v30;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v30 != v6)
        objc_enumerationMutation(v3);
      v8 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v7);
      objc_msgSend(v8, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("locale"));

      if (v10)
        break;
      if (v5 == ++v7)
      {
        v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_15;
      }
    }
    objc_msgSend(v8, "data");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v12, "data");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(v12, "data");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKey:", CFSTR("language"));
        v15 = (NSString *)objc_claimAutoreleasedReturnValue();
        languageCode = self->_languageCode;
        self->_languageCode = v15;

        if (self->_languageCode)
        {
          objc_msgSend(v12, "data");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKey:", CFSTR("region"));
          v18 = (NSString *)objc_claimAutoreleasedReturnValue();
          regionCode = self->_regionCode;
          self->_regionCode = v18;

          v20 = self->_regionCode;
          if (v20)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%@"), self->_languageCode, v20, (_QWORD)v29);
            v21 = (NSString *)objc_claimAutoreleasedReturnValue();
            localeCode = self->_localeCode;
            self->_localeCode = v21;

            goto LABEL_15;
          }
          defaultLogHandle();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            -[MSDKSignedManifest _parseLocale].cold.5(v24, v27, v28);
        }
        else
        {
          defaultLogHandle();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            -[MSDKSignedManifest _parseLocale].cold.4(v24, v25, v26);
        }
      }
      else
      {
        defaultLogHandle();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          -[MSDKSignedManifest _parseLocale].cold.3();
      }
    }
    else
    {
      defaultLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[MSDKSignedManifest _parseLocale].cold.2();
    }

  }
  else
  {
LABEL_15:

    if (self->_localeCode)
      return 1;
    defaultLogHandle();
    v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v3->super, OS_LOG_TYPE_ERROR))
      -[MSDKSignedManifest _parseLocale].cold.1();
  }

  return 0;
}

- (id)_componentListForSection:(id)a3 fromPayload:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  MSDKManifestComponent *v20;
  MSDKManifestComponent *v21;
  id v22;
  NSObject *v23;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  defaultLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v33 = v5;
    _os_log_impl(&dword_213A7E000, v7, OS_LOG_TYPE_DEFAULT, "Parsing %{public}@ section...", buf, 0xCu);
  }

  v8 = (void *)objc_opt_new();
  objc_msgSend(v6, "objectForKey:ofType:", v5, objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v22 = 0;
    goto LABEL_23;
  }
  objc_msgSend(&unk_24D0B8640, "objectForKey:", v5);
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    defaultLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[MSDKSignedManifest _componentListForSection:fromPayload:].cold.1();
LABEL_21:
    v22 = 0;
    goto LABEL_22;
  }
  v11 = v10;
  v25 = v6;
  v26 = v5;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (!v13)
    goto LABEL_14;
  v14 = v13;
  v15 = *(_QWORD *)v28;
  while (2)
  {
    for (i = 0; i != v14; ++i)
    {
      if (*(_QWORD *)v28 != v15)
        objc_enumerationMutation(v12);
      v17 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
      objc_msgSend(v12, "objectForKey:ofType:", v17, objc_opt_class());
      v18 = objc_claimAutoreleasedReturnValue();
      if (!v18)
      {
        defaultLogHandle();
        v19 = objc_claimAutoreleasedReturnValue();
        v5 = v26;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          -[MSDKSignedManifest _componentListForSection:fromPayload:].cold.2();
        goto LABEL_20;
      }
      v19 = v18;
      v20 = -[MSDKManifestComponent initWithIdentifier:componentType:andDictionary:]([MSDKManifestComponent alloc], "initWithIdentifier:componentType:andDictionary:", v17, (int)-[NSObject intValue](v11, "intValue"), v18);
      if (!v20)
      {
        defaultLogHandle();
        v23 = objc_claimAutoreleasedReturnValue();
        v5 = v26;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          -[MSDKSignedManifest _componentListForSection:fromPayload:].cold.3();

LABEL_20:
        v6 = v25;

        goto LABEL_21;
      }
      v21 = v20;
      objc_msgSend(v8, "addObject:", v20);

    }
    v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v14)
      continue;
    break;
  }
LABEL_14:

  v22 = v8;
  v6 = v25;
  v5 = v26;
LABEL_22:

LABEL_23:
  return v22;
}

- (id)_parseAllFiles
{
  void *v3;
  NSArray *appDataList;
  NSArray *factoryBackupList;
  NSArray *groupDataList;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id obj;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  _BYTE v41[128];
  _QWORD v42[4];
  __int128 v43;
  NSArray *configurationProfiles;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  factoryBackupList = self->_factoryBackupList;
  appDataList = self->_appDataList;
  v42[0] = self->_nonSystemAppList;
  v42[1] = appDataList;
  groupDataList = self->_groupDataList;
  v42[2] = factoryBackupList;
  v42[3] = groupDataList;
  v43 = *(_OWORD *)&self->_extensionDataList;
  configurationProfiles = self->_configurationProfiles;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v42, 7);
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  if (v22)
  {
    v21 = *(_QWORD *)v36;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v36 != v21)
          objc_enumerationMutation(obj);
        v23 = v7;
        v8 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v7);
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v24 = v8;
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
        if (v26)
        {
          v25 = *(_QWORD *)v32;
          do
          {
            v9 = 0;
            do
            {
              if (*(_QWORD *)v32 != v25)
                objc_enumerationMutation(v24);
              v10 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v9);
              v27 = 0u;
              v28 = 0u;
              v29 = 0u;
              v30 = 0u;
              objc_msgSend(v10, "data");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
              if (v12)
              {
                v13 = v12;
                v14 = *(_QWORD *)v28;
                do
                {
                  v15 = 0;
                  do
                  {
                    if (*(_QWORD *)v28 != v14)
                      objc_enumerationMutation(v11);
                    v16 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v15);
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      objc_msgSend(v16, "fileHash");
                      v17 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v17)
                        objc_msgSend(v3, "addObject:", v16);
                    }
                    ++v15;
                  }
                  while (v13 != v15);
                  v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
                }
                while (v13);
              }

              ++v9;
            }
            while (v9 != v26);
            v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
          }
          while (v26);
        }

        v7 = v23 + 1;
      }
      while (v23 + 1 != v22);
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    }
    while (v22);
  }

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (BOOL)_buildAppDepedencies
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[16];
  _BYTE v28[128];
  _QWORD v29[9];
  _QWORD v30[11];

  v30[9] = *MEMORY[0x24BDAC8D0];
  defaultLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213A7E000, v3, OS_LOG_TYPE_DEFAULT, "Building app component dependencies...", buf, 2u);
  }

  v29[0] = CFSTR("Apps");
  -[MSDKSignedManifest _toComponentDictionary:](self, "_toComponentDictionary:", self->_nonSystemAppList);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v22;
  v29[1] = CFSTR("SystemApps");
  -[MSDKSignedManifest _toComponentDictionary:](self, "_toComponentDictionary:", self->_systemAppList);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v4;
  v29[2] = CFSTR("AppData");
  -[MSDKSignedManifest _toComponentDictionary:](self, "_toComponentDictionary:", self->_appDataList);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v5;
  v29[3] = CFSTR("BackupData");
  -[MSDKSignedManifest _toComponentDictionary:](self, "_toComponentDictionary:", self->_backupDataList);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v30[3] = v6;
  v29[4] = CFSTR("UserData");
  -[MSDKSignedManifest _toComponentDictionary:](self, "_toComponentDictionary:", self->_userDataList);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v30[4] = v7;
  v29[5] = CFSTR("GroupData");
  -[MSDKSignedManifest _toComponentDictionary:](self, "_toComponentDictionary:", self->_groupDataList);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v30[5] = v8;
  v29[6] = CFSTR("ExtensionData");
  -[MSDKSignedManifest _toComponentDictionary:](self, "_toComponentDictionary:", self->_extensionDataList);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v30[6] = v9;
  v29[7] = CFSTR("ProvisioningProfiles");
  -[MSDKSignedManifest _toComponentDictionary:](self, "_toComponentDictionary:", self->_provisioningProfiles);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v30[7] = v10;
  v29[8] = CFSTR("ConfigurationProfiles");
  -[MSDKSignedManifest _toComponentDictionary:](self, "_toComponentDictionary:", self->_configurationProfiles);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v30[8] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, v29, 9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "addObjectsFromArray:", self->_nonSystemAppList);
  objc_msgSend(v13, "addObjectsFromArray:", self->_systemAppList);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v14 = v13;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v19, "getRawDependency");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
          -[MSDKSignedManifest _addDependenciesForComponent:withLookupDict:](self, "_addDependenciesForComponent:withLookupDict:", v19, v12);
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v16);
  }

  return 1;
}

- (id)_toComponentDictionary:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v10, "identifier", (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKey:", v10, v11);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

- (BOOL)_addDependenciesForComponent:(id)a3 withLookupDict:(id)a4
{
  id v5;
  id v6;
  uint64_t i;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  BOOL v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v27 = a4;
  objc_msgSend(v5, "getRawDependency");
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v43, 16);
  if (!v24)
  {
    v19 = 1;
    goto LABEL_24;
  }
  v25 = v6;
  v26 = *(_QWORD *)v33;
  while (2)
  {
    for (i = 0; i != v24; ++i)
    {
      if (*(_QWORD *)v33 != v26)
        objc_enumerationMutation(v6);
      v8 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
      objc_msgSend(v27, "objectForKey:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        defaultLogHandle();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          -[MSDKSignedManifest _addDependenciesForComponent:withLookupDict:].cold.1();
LABEL_29:
        v11 = v9;
LABEL_22:

        v19 = 0;
        goto LABEL_24;
      }
      objc_msgSend(v6, "objectForKey:ofType:", v8, objc_opt_class());
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        defaultLogHandle();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          -[MSDKSignedManifest _addDependenciesForComponent:withLookupDict:].cold.2();
        goto LABEL_29;
      }
      v23 = v8;
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v11 = v10;
      v12 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v28, v42, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v29;
        while (2)
        {
          for (j = 0; j != v13; ++j)
          {
            if (*(_QWORD *)v29 != v14)
              objc_enumerationMutation(v11);
            v16 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * j);
            -[NSObject objectForKey:ofType:](v9, "objectForKey:ofType:", v16, objc_opt_class());
            v17 = objc_claimAutoreleasedReturnValue();
            if (!v17)
            {
              defaultLogHandle();
              v20 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315650;
                v37 = "-[MSDKSignedManifest _addDependenciesForComponent:withLookupDict:]";
                v38 = 2114;
                v39 = v16;
                v40 = 2114;
                v41 = v23;
                _os_log_error_impl(&dword_213A7E000, v20, OS_LOG_TYPE_ERROR, "%s: Failed to lookup component with identifier %{public}@ in section %{public}@", buf, 0x20u);
              }

              v21 = v9;
              v6 = v25;
              goto LABEL_22;
            }
            v18 = (void *)v17;
            objc_msgSend(v5, "addDependency:", v17);

          }
          v13 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v28, v42, 16);
          if (v13)
            continue;
          break;
        }
      }

      v6 = v25;
    }
    v19 = 1;
    v24 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v32, v43, 16);
    if (v24)
      continue;
    break;
  }
LABEL_24:

  return v19;
}

- (NSString)bundleName
{
  return self->_bundleName;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (NSString)regionCode
{
  return self->_regionCode;
}

- (NSString)localeCode
{
  return self->_localeCode;
}

- (NSString)contentCode
{
  return self->_contentCode;
}

- (int)version
{
  return self->_version;
}

- (NSDate)dateCreated
{
  return self->_dateCreated;
}

- (NSDate)validUntil
{
  return self->_validUntil;
}

- (NSString)minimumOSVersion
{
  return self->_minimumOSVersion;
}

- (NSString)language
{
  return self->_language;
}

- (NSNumber)networkTier
{
  return self->_networkTier;
}

- (NSString)partNumber
{
  return self->_partNumber;
}

- (NSNumber)revision
{
  return self->_revision;
}

- (NSArray)products
{
  return self->_products;
}

- (NSArray)nonSystemAppList
{
  return self->_nonSystemAppList;
}

- (NSArray)systemAppList
{
  return self->_systemAppList;
}

- (NSArray)backupDataList
{
  return self->_backupDataList;
}

- (NSArray)userDataList
{
  return self->_userDataList;
}

- (NSArray)factoryBackupList
{
  return self->_factoryBackupList;
}

- (NSArray)appDataList
{
  return self->_appDataList;
}

- (NSArray)groupDataList
{
  return self->_groupDataList;
}

- (NSArray)extensionDataList
{
  return self->_extensionDataList;
}

- (NSArray)provisioningProfiles
{
  return self->_provisioningProfiles;
}

- (NSArray)configurationProfiles
{
  return self->_configurationProfiles;
}

- (NSArray)allFiles
{
  return self->_allFiles;
}

- (NSString)filePath
{
  return self->_filePath;
}

- (void)setFilePath:(id)a3
{
  objc_storeStrong((id *)&self->_filePath, a3);
}

- (NSArray)criticalComponents
{
  return self->_criticalComponents;
}

- (void)setCriticalComponents:(id)a3
{
  objc_storeStrong((id *)&self->_criticalComponents, a3);
}

- (NSArray)installationOrder
{
  return self->_installationOrder;
}

- (void)setInstallationOrder:(id)a3
{
  objc_storeStrong((id *)&self->_installationOrder, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installationOrder, 0);
  objc_storeStrong((id *)&self->_criticalComponents, 0);
  objc_storeStrong((id *)&self->_filePath, 0);
  objc_storeStrong((id *)&self->_allFiles, 0);
  objc_storeStrong((id *)&self->_configurationProfiles, 0);
  objc_storeStrong((id *)&self->_provisioningProfiles, 0);
  objc_storeStrong((id *)&self->_extensionDataList, 0);
  objc_storeStrong((id *)&self->_groupDataList, 0);
  objc_storeStrong((id *)&self->_appDataList, 0);
  objc_storeStrong((id *)&self->_factoryBackupList, 0);
  objc_storeStrong((id *)&self->_userDataList, 0);
  objc_storeStrong((id *)&self->_backupDataList, 0);
  objc_storeStrong((id *)&self->_systemAppList, 0);
  objc_storeStrong((id *)&self->_nonSystemAppList, 0);
  objc_storeStrong((id *)&self->_products, 0);
  objc_storeStrong((id *)&self->_revision, 0);
  objc_storeStrong((id *)&self->_partNumber, 0);
  objc_storeStrong((id *)&self->_networkTier, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_minimumOSVersion, 0);
  objc_storeStrong((id *)&self->_validUntil, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_storeStrong((id *)&self->_contentCode, 0);
  objc_storeStrong((id *)&self->_localeCode, 0);
  objc_storeStrong((id *)&self->_regionCode, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_bundleName, 0);
}

- (void)initFromManifestAtPath:(uint64_t)a3 verifyManifest:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a2, a3, "Failed to parse manifest at path %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initFromManifestAtPath:(os_log_t)log verifyManifest:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_213A7E000, log, OS_LOG_TYPE_ERROR, "Could not initialize manifestVerifier", v1, 2u);
}

- (void)_manifestDataFromFile:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_213A7E000, v0, v1, "%s: Failed to read manifest file: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_manifestDataFromFile:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_213A7E000, v0, v1, "%s: Failed to convert manifest file to property list. Error: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_manifestDataFromFile:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_213A7E000, v0, v1, "%s: Manifest file at path %{public}@ is not of format NSDictionary", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_manifestDataFromFile:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_213A7E000, v0, v1, "%s: Manifest file does not exist: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_parseInstallationOrder:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "Manifest does not contain %{public}@ key", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_parseInstallationOrder:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_2(&dword_213A7E000, v0, v1, "%s: %{public}@ section in wrong format.", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_parseLocale
{
  int v3;
  const char *v4;
  __int16 v5;
  const __CFString *v6;
  __int16 v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 136315650;
  v4 = "-[MSDKSignedManifest _parseLocale]";
  v5 = 2114;
  v6 = CFSTR("locale");
  v7 = 2114;
  v8 = CFSTR("region");
  OUTLINED_FUNCTION_4(&dword_213A7E000, a1, a3, "%s: component %{public}@ does not have %{public}@ key", (uint8_t *)&v3);
  OUTLINED_FUNCTION_6();
}

- (void)_componentListForSection:fromPayload:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_213A7E000, v0, v1, "%s: cannot determine component type for section %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_componentListForSection:fromPayload:.cold.2()
{
  NSObject *v0;
  int v1[10];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_213A7E000, v0, (uint64_t)v0, "%s: component %{public}@ in section %{public}@ is of wrong format", (uint8_t *)v1);
  OUTLINED_FUNCTION_6();
}

- (void)_componentListForSection:fromPayload:.cold.3()
{
  NSObject *v0;
  int v1[10];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_213A7E000, v0, (uint64_t)v0, "%s: failed to parse component %{public}@ in section %{public}@", (uint8_t *)v1);
  OUTLINED_FUNCTION_6();
}

- (void)_addDependenciesForComponent:withLookupDict:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_213A7E000, v0, v1, "%s: Section %{public}@ not found in section to component dictionary", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_addDependenciesForComponent:withLookupDict:.cold.2()
{
  NSObject *v0;
  int v1[10];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_213A7E000, v0, (uint64_t)v0, "%s: Failed to parse %{public}@ dependency list for component %{public}@", (uint8_t *)v1);
  OUTLINED_FUNCTION_6();
}

@end

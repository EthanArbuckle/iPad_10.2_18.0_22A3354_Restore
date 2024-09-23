@implementation MIBundle

- (BOOL)_validateWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  BOOL v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v22;

  -[MIBundle infoPlistSubset](self, "infoPlistSubset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AE78]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v8 = v7;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;

    if (v9 && objc_msgSend(v9, "length"))
    {
      if (!objc_msgSend(v9, "containsString:", CFSTR("/")))
      {
        v15 = 0;
        v16 = 1;
        goto LABEL_14;
      }
      -[MIBundle bundleURL](self, "bundleURL");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "path");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      _CreateAndLogError((uint64_t)"-[MIBundle _validateWithError:]", 79, CFSTR("MIInstallerErrorDomain"), 69, 0, &unk_1E6CD3758, CFSTR("Bundle at path %@ had an invalid CFBundleIdentifier in its Info.plist: %@"), v19, (uint64_t)v18);
    }
    else
    {
      -[MIBundle bundleURL](self, "bundleURL");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "path");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      _CreateAndLogError((uint64_t)"-[MIBundle _validateWithError:]", 71, CFSTR("MIInstallerErrorDomain"), 12, 0, &unk_1E6CD3730, CFSTR("Bundle at path %@ did not have a CFBundleIdentifier in its Info.plist"), v20, (uint64_t)v18);
    }
    v15 = (id)objc_claimAutoreleasedReturnValue();

    if (a3)
      goto LABEL_13;
  }
  else
  {
    -[MIBundle bundleURL](self, "bundleURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLByAppendingPathComponent:isDirectory:", CFSTR("Info.plist"), 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    -[MIBundle bundleURL](self, "bundleURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[MIFileManager defaultManager](MIFileManager, "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "debugDescriptionForItemAtURL:", v9);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"-[MIBundle _validateWithError:]", 64, CFSTR("MIInstallerErrorDomain"), 35, 0, &unk_1E6CD3708, CFSTR("Failed to load Info.plist from bundle at path %@; %@"),
      v14,
      (uint64_t)v12);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    if (a3)
    {
LABEL_13:
      v15 = objc_retainAutorelease(v15);
      v16 = 0;
      *a3 = v15;
      goto LABEL_14;
    }
  }
  v16 = 0;
LABEL_14:

  return v16;
}

- (id)initForTesting
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MIBundle;
  return -[MIBundle init](&v3, sel_init);
}

- (void)infoPlistSubsetForTesting:(id)a3
{
  objc_storeStrong((id *)&self->_infoPlistSubset, a3);
}

- (MIBundle)initWithBundleParentURL:(id)a3 parentSubdirectory:(id)a4 bundleName:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  MIBundle *v14;
  MIBundle *v15;
  NSString *parentBundleID;
  _BOOL4 v17;
  MIBundle *v18;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v20.receiver = self;
  v20.super_class = (Class)MIBundle;
  v14 = -[MIBundle init](&v20, sel_init);
  v15 = v14;
  if (!v14)
    goto LABEL_3;
  objc_storeStrong((id *)&v14->_bundleName, a5);
  objc_storeStrong((id *)&v15->_bundleParentSubdirectory, a4);
  objc_storeStrong((id *)&v15->_bundleParentDirectoryURL, a3);
  parentBundleID = v15->_parentBundleID;
  v15->_parentBundleID = 0;

  v17 = -[MIBundle _validateWithError:](v15, "_validateWithError:", a6);
  v18 = 0;
  if (v17)
LABEL_3:
    v18 = v15;

  return v18;
}

- (MIBundle)initWithParentBundle:(id)a3 parentSubdirectory:(id)a4 bundleName:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  MIBundle *v13;
  MIBundle *v14;
  uint64_t v15;
  NSURL *bundleParentDirectoryURL;
  uint64_t v17;
  NSString *parentBundleID;
  MIBundle *v19;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v21.receiver = self;
  v21.super_class = (Class)MIBundle;
  v13 = -[MIBundle init](&v21, sel_init);
  v14 = v13;
  if (!v13)
    goto LABEL_3;
  objc_storeStrong((id *)&v13->_bundleName, a5);
  objc_storeStrong((id *)&v14->_bundleParentSubdirectory, a4);
  objc_msgSend(v10, "bundleURL");
  v15 = objc_claimAutoreleasedReturnValue();
  bundleParentDirectoryURL = v14->_bundleParentDirectoryURL;
  v14->_bundleParentDirectoryURL = (NSURL *)v15;

  objc_msgSend(v10, "identifier");
  v17 = objc_claimAutoreleasedReturnValue();
  parentBundleID = v14->_parentBundleID;
  v14->_parentBundleID = (NSString *)v17;

  objc_storeWeak((id *)&v14->_parentBundle, v10);
  if (!-[MIBundle _validateWithError:](v14, "_validateWithError:", a6))
    v19 = 0;
  else
LABEL_3:
    v19 = v14;

  return v19;
}

- (MIBundle)initWithBundleURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  MIBundle *v9;

  v6 = a3;
  objc_msgSend(v6, "URLByDeletingLastPathComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastPathComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[MIBundle initWithBundleParentURL:parentSubdirectory:bundleName:error:](self, "initWithBundleParentURL:parentSubdirectory:bundleName:error:", v7, 0, v8, a4);
  return v9;
}

+ (id)_URLOfFirstBundleInDirectory:(id)a3 withExtension:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v17;
  _QWORD v18[4];
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v7 = a3;
  v8 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__2;
  v25 = __Block_byref_object_dispose__2;
  v26 = 0;
  +[MIFileManager defaultManager](MIFileManager, "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __61__MIBundle__URLOfFirstBundleInDirectory_withExtension_error___block_invoke;
  v18[3] = &unk_1E6CB6F00;
  v10 = v8;
  v19 = v10;
  v20 = &v21;
  objc_msgSend(v9, "enumerateURLsForItemsInDirectoryAtURL:ignoreSymlinks:withBlock:", v7, 1, v18);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v12 = (void *)v22[5];
  if (!v12)
  {
    objc_msgSend(v7, "path");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"+[MIBundle _URLOfFirstBundleInDirectory:withExtension:error:]", 160, CFSTR("MIInstallerErrorDomain"), 36, 0, 0, CFSTR("Failed to locate a bundle with extension %@ in directory %@"), v13, (uint64_t)v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)v22[5];
    if (!a5 || v12)
    {
      v11 = v14;
    }
    else
    {
      v11 = objc_retainAutorelease(v14);
      *a5 = v11;
      v12 = (void *)v22[5];
    }
  }
  v15 = v12;

  _Block_object_dispose(&v21, 8);
  return v15;
}

uint64_t __61__MIBundle__URLOfFirstBundleInDirectory_withExtension_error___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;

  v6 = a2;
  v7 = v6;
  if (a3 == 4)
  {
    objc_msgSend(v6, "pathExtension");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", *(_QWORD *)(a1 + 32));
    if (v9)
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    v10 = v9 ^ 1u;

  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (MIBundle)initWithBundleInDirectory:(id)a3 withExtension:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  MIBundle *v11;

  v8 = a4;
  v9 = a3;
  objc_msgSend((id)objc_opt_class(), "_URLOfFirstBundleInDirectory:withExtension:error:", v9, v8, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    self = -[MIBundle initWithBundleURL:error:](self, "initWithBundleURL:error:", v10, a5);
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_infoPlistKeysToLoad
{
  if (_infoPlistKeysToLoad_onceToken != -1)
    dispatch_once(&_infoPlistKeysToLoad_onceToken, &__block_literal_global_2);
  return (id)_infoPlistKeysToLoad_keysSet;
}

void __32__MIBundle__infoPlistKeysToLoad__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0C9AE70], *MEMORY[0x1E0C9AE78], *MEMORY[0x1E0C9AAF0], *MEMORY[0x1E0C9AE90], *MEMORY[0x1E0C9AAE0], *MEMORY[0x1E0C9AE88], *MEMORY[0x1E0C9AAC8], CFSTR("MinimumProductVersion"), CFSTR("MinimumOSVersion"), CFSTR("UIDeviceFamily"), CFSTR("InstallDeviceClasses"), CFSTR("UIBackgroundModes"), CFSTR("XPCService"), CFSTR("NSExtension"), CFSTR("EXAppExtensionAttributes"), CFSTR("UIRequiredDeviceCapabilities"), CFSTR("UISupportedDevices"),
    CFSTR("SupportedDevices"),
    CFSTR("WKCompanionAppBundleIdentifier"),
    CFSTR("CLKComplicationPrincipalClass"),
    CFSTR("CLKComplicationSupportedFamilies"),
    CFSTR("WKApplication"),
    CFSTR("WKWatchKitApp"),
    CFSTR("WKWatchOnly"),
    CFSTR("WKRunsIndependentlyOfCompanionApp"),
    CFSTR("LSApplicationLaunchProhibited"),
    CFSTR("LSCounterpartIdentifiers"),
    CFSTR("INAlternativeAppNames"),
    CFSTR("INIntentsSupported"),
    CFSTR("ITSWatchOnlyContainer"),
    CFSTR("DTSDKBuild"),
    CFSTR("NSPrivacyTrackingDomains"),
    CFSTR("OSMinimumDriverKitVersion"),
    0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_infoPlistKeysToLoad_keysSet;
  _infoPlistKeysToLoad_keysSet = v0;

}

- (NSDictionary)infoPlistSubset
{
  NSDictionary *infoPlistSubset;
  void *v4;
  void *v5;
  void *v6;
  NSDictionary *v7;
  NSDictionary *v8;
  NSDictionary *v9;
  void *v11;
  void *v12;

  infoPlistSubset = self->_infoPlistSubset;
  if (infoPlistSubset)
    goto LABEL_4;
  -[MIBundle bundleURL](self, "bundleURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIBundle _infoPlistKeysToLoad](self, "_infoPlistKeysToLoad");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MILoadInfoPlist(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (NSDictionary *)objc_msgSend(v6, "copy");
  v8 = self->_infoPlistSubset;
  self->_infoPlistSubset = v7;

  if (-[NSDictionary count](self->_infoPlistSubset, "count"))
  {
    infoPlistSubset = self->_infoPlistSubset;
LABEL_4:
    v9 = infoPlistSubset;
    return v9;
  }
  if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
  {
    -[MIBundle bundleURL](self, "bundleURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    MOLogWrite();

  }
  v9 = 0;
  return v9;
}

- (NSString)identifier
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  -[MIBundle infoPlistSubset](self, "infoPlistSubset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AE78]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  return (NSString *)v5;
}

- (NSString)bundleVersion
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  -[MIBundle infoPlistSubset](self, "infoPlistSubset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AE90]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  return (NSString *)v5;
}

- (NSString)bundleShortVersion
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  -[MIBundle infoPlistSubset](self, "infoPlistSubset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AAF0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  return (NSString *)v5;
}

- (BOOL)isRemovableSystemApp
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  +[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "systemAppPlaceholderBundleIDToInfoMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIBundle identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 != 0;

  return v7;
}

- (unsigned)bundleType
{
  void *v3;
  unsigned __int8 bundleType;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  unsigned __int8 v13;
  unsigned __int8 v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;

  -[MIBundle identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    bundleType = self->_bundleType;
    if (!bundleType)
    {
      -[MIBundle bundleURL](self, "bundleURL");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "pathExtension");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      MIDiskImageManagerProxy();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v6, "isEqualToString:", CFSTR("app")))
      {
        if (objc_msgSend(v6, "isEqualToString:", CFSTR("appex"))
          || objc_msgSend(v6, "isEqualToString:", CFSTR("appex")))
        {
          v14 = 6;
        }
        else if (objc_msgSend(v6, "isEqualToString:", CFSTR("framework")))
        {
          v14 = 7;
        }
        else if (objc_msgSend(v6, "isEqualToString:", CFSTR("xpc")))
        {
          v14 = 8;
        }
        else
        {
          if (!objc_msgSend(v6, "isEqualToString:", CFSTR("dext")))
          {
            self->_bundleType = 0;
            goto LABEL_15;
          }
          v14 = 11;
        }
        self->_bundleType = v14;
LABEL_15:

        bundleType = self->_bundleType;
        goto LABEL_16;
      }
      -[MIBundle bundleParentDirectoryURL](self, "bundleParentDirectoryURL");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "path");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "systemAppsDirectory");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "path");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v8, "isEqualToString:", v11);

      if ((v12 & 1) != 0)
        goto LABEL_5;
      +[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "internalAppsDirectory");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "path");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v8, "isEqualToString:", v17);

      if ((v18 & 1) != 0)
      {
        v13 = 2;
        goto LABEL_13;
      }
      v19 = v41;
      if ((objc_msgSend(v7, "URLIsOnKnownImageMount:", v41) & 1) != 0)
      {
        v13 = 3;
        goto LABEL_14;
      }
      +[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "coreServicesDirectory");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "path");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v8, "hasPrefix:", v23);

      if ((v24 & 1) != 0)
      {
LABEL_24:
        v13 = 5;
        goto LABEL_14;
      }
      +[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "systemAppPlaceholdersDirectory");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "path");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v8, "hasPrefix:", v27);

      if ((v28 & 1) != 0)
      {
        v13 = 10;
        goto LABEL_14;
      }
      +[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "systemAppBundleIDToInfoMap");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "objectForKeyedSubscript:", v3);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (v31)
      {

      }
      else
      {
        +[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "systemAppPlaceholderBundleIDToInfoMap");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "objectForKeyedSubscript:", v3);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v33)
        {
          +[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "coreServicesAppBundleIDToInfoMap");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "objectForKeyedSubscript:", v3);
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          v19 = v41;
          if (!v36)
          {
            +[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "internalAppBundleIDToInfoMap");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "objectForKeyedSubscript:", v3);
            v39 = (void *)objc_claimAutoreleasedReturnValue();

            if (v39)
            {
              v13 = 2;
            }
            else if (objc_msgSend(v7, "bundleIDIsOnKnownImageMount:", v3))
            {
              v13 = 3;
            }
            else
            {
              v13 = 4;
            }
            goto LABEL_14;
          }
          goto LABEL_24;
        }
      }
LABEL_5:
      v13 = 1;
LABEL_13:
      v19 = v41;
LABEL_14:
      self->_bundleType = v13;

      goto LABEL_15;
    }
  }
  else
  {
    bundleType = 0;
  }
LABEL_16:

  return bundleType;
}

- (BOOL)isStaticContent
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *i;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  char v38;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v6 = self;
  v55 = *MEMORY[0x1E0C80C00];
  -[MIBundle bundleParentDirectoryURL](self, "bundleParentDirectoryURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MIDiskImageManagerProxy();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v6, "bundleType");
  LOBYTE(v6) = 0;
  switch(v5)
  {
    case 1:
      +[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance");
      v23 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "systemAppsDirectory");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    case 2:
      +[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance");
      v23 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "internalAppsDirectory");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_22:
      v29 = v28;
      objc_msgSend(v28, "path");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v3, "isEqual:", v30);
      goto LABEL_25;
    case 3:
      LOBYTE(v6) = objc_msgSend(v4, "URLIsOnKnownImageMount:", v2);
      goto LABEL_38;
    case 5:
      +[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance");
      v23 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "coreServicesDirectory");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "path");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v3, "isEqualToString:", v30);
LABEL_25:
      LOBYTE(v6) = v31;

      goto LABEL_26;
    case 6:
    case 8:
      if ((objc_msgSend(v4, "URLIsOnKnownImageMount:", v2) & 1) != 0)
        goto LABEL_37;
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      +[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "allExtensionKitExtensionsDirectories");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
      if (!v8)
        goto LABEL_11;
      v9 = v8;
      v10 = *(_QWORD *)v49;
LABEL_5:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v49 != v10)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * v11), "path");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v3, "hasPrefix:", v12);

        if ((v13 & 1) != 0)
          goto LABEL_36;
        if (v9 == ++v11)
        {
          v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
          if (v9)
            goto LABEL_5;
LABEL_11:

          +[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "allFrameworksDirectories");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (void *)objc_msgSend(v15, "mutableCopy");

          +[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "systemAppsDirectory");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v18);

          +[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "coreServicesDirectory");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v20);

          +[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "internalAppsDirectory");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v22);

          v46 = 0u;
          v47 = 0u;
          v44 = 0u;
          v45 = 0u;
          v23 = v16;
          v6 = (void *)objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
          if (v6)
          {
            v24 = *(_QWORD *)v45;
            while (2)
            {
              for (i = 0; i != v6; i = (char *)i + 1)
              {
                if (*(_QWORD *)v45 != v24)
                  objc_enumerationMutation(v23);
                objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)i), "path");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = objc_msgSend(v3, "hasPrefix:", v26);

                if ((v27 & 1) != 0)
                {
                  LOBYTE(v6) = 1;
                  goto LABEL_40;
                }
              }
              v6 = (void *)objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
              if (v6)
                continue;
              break;
            }
          }
LABEL_40:

LABEL_26:
          goto LABEL_38;
        }
      }
    case 7:
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      +[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance", 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "allFrameworksDirectories");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v33 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
      if (!v33)
        goto LABEL_35;
      v34 = v33;
      v35 = *(_QWORD *)v41;
      break;
    default:
      goto LABEL_38;
  }
  while (2)
  {
    for (j = 0; j != v34; ++j)
    {
      if (*(_QWORD *)v41 != v35)
        objc_enumerationMutation(v6);
      objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * j), "path");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v3, "hasPrefix:", v37);

      if ((v38 & 1) != 0)
      {
LABEL_36:

LABEL_37:
        LOBYTE(v6) = 1;
        goto LABEL_38;
      }
    }
    v34 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
    if (v34)
      continue;
    break;
  }
LABEL_35:

  LOBYTE(v6) = 0;
LABEL_38:

  return (char)v6;
}

- (NSString)bundleTypeDescription
{
  unsigned int v2;

  v2 = -[MIBundle bundleType](self, "bundleType") - 1;
  if (v2 > 0xA)
    return (NSString *)CFSTR("unknown bundle type");
  else
    return &off_1E6CB7030[(char)v2]->isa;
}

- (BOOL)isPlaceholder
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (!-[MIBundle isPlaceholderStatusValid](self, "isPlaceholderStatusValid"))
  {
    if (-[MIBundle bundleType](self, "bundleType") == 10)
    {
      self->_isPlaceholder = 1;
    }
    else
    {
      -[MIBundle parentBundle](self, "parentBundle");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      if (v3 && objc_msgSend(v3, "isPlaceholder"))
      {
        self->_isPlaceholder = 1;
      }
      else
      {
        +[MIFileManager defaultManager](MIFileManager, "defaultManager");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[MIBundle bundleURL](self, "bundleURL");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        self->_isPlaceholder = objc_msgSend(v5, "bundleAtURLIsPlaceholder:", v6);

      }
    }
    -[MIBundle setIsPlaceholderStatusValid:](self, "setIsPlaceholderStatusValid:", 1);
  }
  return self->_isPlaceholder;
}

- (BOOL)setIsPlaceholderWithError:(id *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;

  +[MIFileManager defaultManager](MIFileManager, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIBundle bundleURL](self, "bundleURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "markBundleAsPlaceholder:withError:", v6, a3);

  if ((_DWORD)v7)
    self->_isPlaceholder = 1;
  -[MIBundle setIsPlaceholderStatusValid:](self, "setIsPlaceholderStatusValid:", v7);
  return v7;
}

+ (id)bundlesInParentBundle:(id)a3 subDirectory:(id)a4 matchingPredicate:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  uint64_t *v35;
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)objc_opt_new();
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__2;
  v41 = __Block_byref_object_dispose__2;
  v42 = 0;
  objc_msgSend(v10, "bundleURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "URLByAppendingPathComponent:isDirectory:", v11, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  +[MIFileManager defaultManager](MIFileManager, "defaultManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __71__MIBundle_bundlesInParentBundle_subDirectory_matchingPredicate_error___block_invoke;
  v30[3] = &unk_1E6CB6F28;
  v17 = v12;
  v34 = v17;
  v36 = a1;
  v18 = v10;
  v31 = v18;
  v19 = v11;
  v32 = v19;
  v35 = &v37;
  v20 = v13;
  v33 = v20;
  objc_msgSend(v16, "enumerateURLsForItemsInDirectoryAtURL:ignoreSymlinks:withBlock:", v15, 1, v30);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38[5])
  {
LABEL_10:
    v24 = 0;
    if (!a6)
      goto LABEL_13;
    goto LABEL_11;
  }
  if (!v21)
    goto LABEL_6;
  objc_msgSend(v21, "domain");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v22, "isEqualToString:", *MEMORY[0x1E0CB2FE0]))
  {

    goto LABEL_9;
  }
  v23 = objc_msgSend(v21, "code");

  if (v23 != 2)
  {
LABEL_9:
    objc_msgSend(v15, "path");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"+[MIBundle bundlesInParentBundle:subDirectory:matchingPredicate:error:]", 540, CFSTR("MIInstallerErrorDomain"), 54, v21, 0, CFSTR("Failed to discover bundles in directory %@"), v26, (uint64_t)v25);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = (void *)v38[5];
    v38[5] = v27;

    goto LABEL_10;
  }

LABEL_6:
  v24 = (void *)objc_msgSend(v20, "copy");
  v21 = 0;
  if (!a6)
    goto LABEL_13;
LABEL_11:
  if (!v24)
    *a6 = objc_retainAutorelease((id)v38[5]);
LABEL_13:

  _Block_object_dispose(&v37, 8);
  return v24;
}

BOOL __71__MIBundle_bundlesInParentBundle_subDirectory_matchingPredicate_error___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _BOOL8 v14;
  id v16;

  v5 = a2;
  if (a3 == 4 && ((v6 = *(_QWORD *)(a1 + 56)) == 0 || (*(unsigned int (**)(uint64_t, id))(v6 + 16))(v6, v5)))
  {
    v7 = objc_alloc((Class)objc_opt_class());
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v5, "lastPathComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v11 = (void *)objc_msgSend(v7, "initWithParentBundle:parentSubdirectory:bundleName:error:", v8, v9, v10, &v16);
    v12 = v16;
    v13 = v16;

    v14 = v11 != 0;
    if (v11)
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v11);
    else
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v12);

  }
  else
  {
    v14 = 1;
  }

  return v14;
}

- (BOOL)allowsAppleAppExtensionsNotInExtensionCache
{
  return 0;
}

- (BOOL)isDeletable
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = -[MIBundle bundleType](self, "bundleType");
  -[MIBundle bundleParentDirectoryURL](self, "bundleParentDirectoryURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 == 4)
    goto LABEL_6;
  if (v3 == 2)
  {
    +[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "internalAppsDirectory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqualToString:", v11) & 1) == 0)
    {
LABEL_10:
      +[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v12, "allowsInternalSecurityPolicy");

      goto LABEL_11;
    }
LABEL_9:
    v8 = 0;
LABEL_11:

    goto LABEL_12;
  }
  if (v3 != 1
    || (+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "allowDeletableSystemApps"),
        v6,
        !v7))
  {
    v8 = 0;
    goto LABEL_12;
  }
  if (!-[MIBundle isRemovableSystemApp](self, "isRemovableSystemApp"))
  {
    +[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "systemAppsDirectory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqualToString:", v11) & 1) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_6:
  v8 = 1;
LABEL_12:

  return v8;
}

- (id)_filterExtensionBundlesNotInCacheIfNeeded:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v19;
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[MIBundle allowsAppleAppExtensionsNotInExtensionCache](self, "allowsAppleAppExtensionsNotInExtensionCache"))
  {
    v17 = v4;
    goto LABEL_23;
  }
  v5 = (void *)objc_opt_new();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v20 = v4;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (!v7)
    goto LABEL_21;
  v8 = v7;
  v9 = *(_QWORD *)v23;
  do
  {
    v10 = 0;
    do
    {
      if (*(_QWORD *)v23 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v10);
      if (!objc_msgSend(v11, "targetsAppleExtensionPoint", v19))
      {
        v13 = 0;
LABEL_13:
        objc_msgSend(v5, "addObject:", v11);
        goto LABEL_14;
      }
      v21 = 0;
      objc_msgSend(v11, "extensionCacheEntryWithError:", &v21);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v21;

      if (v12)
        goto LABEL_13;
      objc_msgSend(v13, "domain");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "isEqualToString:", CFSTR("MIInstallerErrorDomain")))
      {
        v15 = objc_msgSend(v13, "code");

        if (v15 == 45)
          goto LABEL_13;
      }
      else
      {

      }
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      {
        objc_msgSend(v11, "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        MOLogWrite();

      }
LABEL_14:

      ++v10;
    }
    while (v8 != v10);
    v16 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    v8 = v16;
  }
  while (v16);
LABEL_21:

  v17 = (id)objc_msgSend(v5, "copy");
  v4 = v20;
LABEL_23:

  return v17;
}

- (id)_filterExtensionBundles:(id)a3 forValidationFlags:(unsigned __int8)a4
{
  int v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  char v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v4 = a4;
  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (!v4)
  {
    v22 = (void *)objc_msgSend(v5, "copy");
    goto LABEL_34;
  }
  v7 = (void *)objc_opt_new();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v27 = v6;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (!v9)
    goto LABEL_32;
  v10 = v9;
  v11 = *(_QWORD *)v31;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v31 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
      if ((v4 & 2) == 0
        || (objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "isApplicableToCurrentOSVersionWithError:", 0) & 1) != 0)
      {
        if ((v4 & 1) == 0)
          goto LABEL_12;
        v29 = 0;
        v14 = objc_msgSend(v13, "isApplicableToCurrentDeviceCapabilitiesWithError:", &v29);
        v15 = v29;
        if ((v14 & 1) != 0)
        {
LABEL_11:

LABEL_12:
          objc_msgSend(v7, "addObject:", v13, v24, v25);
          continue;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_26;
        objc_msgSend(v13, "minimumOSVersion");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v18, "compare:options:", CFSTR("8.2"), 64) == -1 && v15 != 0)
        {
          objc_msgSend(v15, "domain");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v20, "isEqualToString:", CFSTR("MIInstallerErrorDomain")) & 1) != 0)
          {
            v28 = objc_msgSend(v15, "code");

            if (v28 == 66)
              goto LABEL_11;
            goto LABEL_26;
          }

        }
LABEL_26:
        if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
        {
          objc_msgSend(v13, "bundleTypeDescription", v24, v25);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "identifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v15;
          v24 = v21;
          MOLogWrite();

        }
        continue;
      }
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
      {
        objc_msgSend(v13, "bundleTypeDescription", v24, v25, v26);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "bundleURL");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "path");
        v24 = v16;
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        MOLogWrite();

      }
    }
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  }
  while (v10);
LABEL_32:

  v22 = (void *)objc_msgSend(v7, "copy");
  v6 = v27;
LABEL_34:

  return v22;
}

- (id)pluginKitBundlesPerformingPlatformValidation:(unsigned __int8)a3 withError:(id *)a4
{
  uint64_t v5;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  id v31;
  _QWORD v32[3];
  _BYTE v33[128];
  uint64_t v34;

  v5 = a3;
  v34 = *MEMORY[0x1E0C80C00];
  -[MIBundle pluginKitBundles](self, "pluginKitBundles");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (id)v7;
    v9 = 0;
    goto LABEL_20;
  }
  v31 = 0;
  +[MIPluginKitBundle bundlesInParentBundle:subDirectory:matchingPredicate:error:](MIPluginKitBundle, "bundlesInParentBundle:subDirectory:matchingPredicate:error:", self, CFSTR("PlugIns"), &__block_literal_global_126, &v31);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = v31;
  if (!v8)
  {
    v17 = 0;
    v18 = 0;
    if (!a4)
      goto LABEL_23;
    goto LABEL_21;
  }
  if (!-[MIBundle isWatchApp](self, "isWatchApp"))
  {
LABEL_19:
    -[MIBundle setPluginKitBundles:](self, "setPluginKitBundles:", v8);
LABEL_20:
    -[MIBundle _filterExtensionBundles:forValidationFlags:](self, "_filterExtensionBundles:forValidationFlags:", v8, v5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIBundle _filterExtensionBundlesNotInCacheIfNeeded:](self, "_filterExtensionBundlesNotInCacheIfNeeded:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a4)
      goto LABEL_23;
    goto LABEL_21;
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v8 = v8;
  v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (!v10)
  {
LABEL_13:
    v15 = (uint64_t)v8;
    v16 = v9;
LABEL_18:

    v8 = (id)v15;
    v9 = v16;
    goto LABEL_19;
  }
  v11 = v10;
  v12 = *(_QWORD *)v28;
LABEL_7:
  v13 = 0;
  while (1)
  {
    if (*(_QWORD *)v28 != v12)
      objc_enumerationMutation(v8);
    v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v13);
    if (objc_msgSend(v14, "isWatchKitExtension"))
      break;
    if (v11 == ++v13)
    {
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
      if (v11)
        goto LABEL_7;
      goto LABEL_13;
    }
  }
  v32[0] = CFSTR("PlugIns");
  objc_msgSend(v14, "bundleName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v19;
  v32[2] = CFSTR("PlugIns");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "identifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v9;
  +[MIPluginKitBundle bundlesInParentBundle:overrideParentBundleIDForValidation:subDirectory:matchingPredicate:error:](MIPluginKitBundle, "bundlesInParentBundle:overrideParentBundleIDForValidation:subDirectory:matchingPredicate:error:", self, v22, v21, &__block_literal_global_126, &v26);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v26;

  if (v23)
  {
    objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v23);
    v15 = objc_claimAutoreleasedReturnValue();

    goto LABEL_18;
  }

  v17 = 0;
  v18 = 0;
  v9 = v16;
  if (a4)
  {
LABEL_21:
    if (!v18)
      *a4 = objc_retainAutorelease(v9);
  }
LABEL_23:
  v24 = v18;

  return v24;
}

uint64_t __67__MIBundle_pluginKitBundlesPerformingPlatformValidation_withError___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "pathExtension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("appex"));

  return v3;
}

- (id)pluginKitBundlesWithError:(id *)a3
{
  return -[MIBundle pluginKitBundlesPerformingPlatformValidation:withError:](self, "pluginKitBundlesPerformingPlatformValidation:withError:", 3, a3);
}

- (BOOL)validatePluginKitMetadataWithError:(id *)a3
{
  _BOOL4 v5;
  void *v6;
  int v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  id v15;
  uint64_t i;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  char v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t k;
  uint64_t v43;
  void *v44;
  char v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  id *v66;
  void *v67;
  _BOOL4 v68;
  uint64_t v69;
  char v70;
  int v71;
  uint64_t v72;
  id obj;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  id v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  id v91;
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v5 = -[MIBundle isLaunchProhibited](self, "isLaunchProhibited");
  -[MIBundle identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.MapsExternalComponents"));

  v91 = 0;
  -[MIBundle pluginKitBundlesWithError:](self, "pluginKitBundlesWithError:", &v91);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v91;
  if (!v8)
  {
    v77 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    if (a3)
    {
LABEL_97:
      v9 = objc_retainAutorelease(v9);
      v14 = 0;
      *a3 = v9;
      goto LABEL_98;
    }
LABEL_5:
    v14 = 0;
    goto LABEL_98;
  }
  if (-[MIBundle isWatchApp](self, "isWatchApp"))
    v68 = -[MIBundle isApplicableToOSVersion:error:](self, "isApplicableToOSVersion:error:", CFSTR("2.9.9"), 0);
  else
    v68 = 0;
  if (!-[MIBundle isPlaceholder](self, "isPlaceholder") && v5 && !objc_msgSend(v8, "count"))
  {
    -[MIBundle identifier](self, "identifier");
    obj = (id)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"-[MIBundle validatePluginKitMetadataWithError:]", 772, CFSTR("MIInstallerErrorDomain"), 122, 0, &unk_1E6CD3780, CFSTR("The app extension stub app %@ must have at least one app extension, but none were found."), v46, (uint64_t)obj);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v76 = 0;
    v77 = 0;
    v10 = 0;
    v75 = 0;
    v13 = 0;
LABEL_95:

LABEL_96:
    v9 = v15;
    v11 = (void *)v75;
    v12 = (void *)v76;
    if (a3)
      goto LABEL_97;
    goto LABEL_5;
  }
  v89 = 0u;
  v90 = 0u;
  v87 = 0u;
  v88 = 0u;
  obj = v8;
  v69 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v94, 16);
  if (!v69)
  {
    v76 = 0;
    v77 = 0;
    v10 = 0;
    v74 = 0;
    v75 = 0;
    v15 = v9;
    goto LABEL_75;
  }
  v76 = 0;
  v77 = 0;
  v10 = 0;
  v74 = 0;
  v75 = 0;
  v72 = *(_QWORD *)v88;
  v71 = v5 & v7;
  v70 = !v5 | v7;
  v15 = v9;
  while (2)
  {
    for (i = 0; i != v69; ++i)
    {
      v17 = v15;
      if (*(_QWORD *)v88 != v72)
        objc_enumerationMutation(obj);
      v18 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * i);
      v86 = v15;
      v19 = objc_msgSend(v18, "validateBundleMetadataWithError:", &v86, v63);
      v15 = v86;

      if (!v19)
      {
        v13 = (void *)v74;
        goto LABEL_96;
      }
      if (objc_msgSend(v18, "isFileProviderNonUIExtension"))
      {
        if (v74)
        {
          objc_msgSend(v18, "identifier");
          v9 = (id)objc_claimAutoreleasedReturnValue();
          _CreateAndLogError((uint64_t)"-[MIBundle validatePluginKitMetadataWithError:]", 786, CFSTR("MIInstallerErrorDomain"), 62, 0, &unk_1E6CD37A8, CFSTR("Multiple file provider app extensions found in app but only one is allowed (found %@ ; already found %@)"),
            v51,
            (uint64_t)v9);
          v52 = objc_claimAutoreleasedReturnValue();

          v15 = (id)v52;
          v13 = (void *)v74;
          goto LABEL_95;
        }
        objc_msgSend(v18, "identifier");
        v74 = objc_claimAutoreleasedReturnValue();
      }
      if (v71)
      {
        if ((objc_msgSend(v18, "isMapsGeoServicesExtension") & 1) == 0)
        {
          -[MIBundle identifier](self, "identifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("com.apple.MapsExternalComponents"));

          if ((v21 & 1) == 0)
          {
            -[MIBundle identifier](self, "identifier");
            v9 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "extensionPointIdentifier");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            _CreateAndLogError((uint64_t)"-[MIBundle validatePluginKitMetadataWithError:]", 794, CFSTR("MIInstallerErrorDomain"), 59, 0, &unk_1E6CD37D0, CFSTR("App %@ is forbidden from providing an extension of type %@"), v58, (uint64_t)v9);
            v59 = objc_claimAutoreleasedReturnValue();

            v15 = (id)v59;
            goto LABEL_94;
          }
        }
      }
      if ((v70 & 1) == 0 && (objc_msgSend(v18, "isMessagePayloadProviderExtension") & 1) == 0)
      {
        objc_msgSend(v18, "identifier");
        v9 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "extensionPointIdentifier");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        _CreateAndLogError((uint64_t)"-[MIBundle validatePluginKitMetadataWithError:]", 801, CFSTR("MIInstallerErrorDomain"), 123, 0, &unk_1E6CD37F8, CFSTR("Messages stub apps may only have a single message payload provider app extension, but this stub app has an extension %@ of type %@"), v54, (uint64_t)v9);
LABEL_88:
        v57 = objc_claimAutoreleasedReturnValue();

        goto LABEL_93;
      }
      if (objc_msgSend(v18, "isMessagePayloadProviderExtension"))
      {
        if (v75)
        {
          objc_msgSend(v18, "identifier");
          v9 = (id)objc_claimAutoreleasedReturnValue();
          _CreateAndLogError((uint64_t)"-[MIBundle validatePluginKitMetadataWithError:]", 810, CFSTR("MIInstallerErrorDomain"), 121, 0, &unk_1E6CD3820, CFSTR("Multiple message payload provider extensions found in app but only one is allowed (found %@ ; already found %@)"),
            v55,
            (uint64_t)v9);
LABEL_85:
          v57 = objc_claimAutoreleasedReturnValue();

          goto LABEL_93;
        }
        objc_msgSend(v18, "identifier");
        v75 = objc_claimAutoreleasedReturnValue();
      }
      if (!objc_msgSend(v18, "isWatchKitExtension"))
      {
        if (v68)
        {
          objc_msgSend(v18, "bundleParentSubdirectory");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "isEqualToString:", CFSTR("PlugIns"));

          if (v28)
          {
            objc_msgSend(v18, "bundleURL");
            v9 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "path");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            _CreateAndLogError((uint64_t)"-[MIBundle validatePluginKitMetadataWithError:]", 853, CFSTR("MIInstallerErrorDomain"), 118, 0, &unk_1E6CD38E8, CFSTR("WatchKit 2 app contains a non-WatchKit extension at %@. WatchKit apps specifying a MinimumOSVersion earlier than 3.0 must have non-WatchKit extensions embedded within the WatchKit extension."), v60, (uint64_t)v53);
            goto LABEL_88;
          }
        }
        if (objc_msgSend(v18, "isSiriIntentsExtension"))
        {
          if (!v10)
            v10 = (void *)objc_opt_new();
          objc_msgSend(v18, "extensionAttributes");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = v29;
          if (!v29)
            goto LABEL_70;
          v66 = a3;
          v67 = v8;
          objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("IntentsSupported"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v82 = 0u;
          v83 = 0u;
          v84 = 0u;
          v85 = 0u;
          v31 = v30;
          v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v82, v93, 16);
          if (v32)
          {
            v33 = v32;
            v34 = *(_QWORD *)v83;
            while (2)
            {
              for (j = 0; j != v33; ++j)
              {
                if (*(_QWORD *)v83 != v34)
                  objc_enumerationMutation(v31);
                if ((objc_msgSend(v10, "containsObject:", *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * j)) & 1) != 0)
                {
                  -[MIBundle identifier](self, "identifier");
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  _CreateAndLogError((uint64_t)"-[MIBundle validatePluginKitMetadataWithError:]", 871, CFSTR("MIInstallerErrorDomain"), 117, 0, &unk_1E6CD3910, CFSTR("More than one Siri Intents app extension in the app %@ declares the value %@ in the IntentsSupported array in the ExtensionAttributes dictionary in the NSExtensionDictionary in its Info.plist."), v48, (uint64_t)v47);
                  goto LABEL_79;
                }
              }
              v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v82, v93, 16);
              if (v33)
                continue;
              break;
            }
          }

          v36 = v10;
        }
        else
        {
          if (!objc_msgSend(v18, "isSiriIntentsUIExtension"))
            continue;
          if (!v77)
            v77 = (void *)objc_opt_new();
          objc_msgSend(v18, "extensionAttributes");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = v37;
          if (!v37)
            goto LABEL_70;
          v66 = a3;
          v67 = v8;
          objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("IntentsSupported"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v78 = 0u;
          v79 = 0u;
          v80 = 0u;
          v81 = 0u;
          v31 = v38;
          v39 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v78, v92, 16);
          if (v39)
          {
            v40 = v39;
            v41 = *(_QWORD *)v79;
            while (2)
            {
              for (k = 0; k != v40; ++k)
              {
                if (*(_QWORD *)v79 != v41)
                  objc_enumerationMutation(v31);
                if ((objc_msgSend(v77, "containsObject:", *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * k)) & 1) != 0)
                {
                  -[MIBundle identifier](self, "identifier");
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  _CreateAndLogError((uint64_t)"-[MIBundle validatePluginKitMetadataWithError:]", 891, CFSTR("MIInstallerErrorDomain"), 117, 0, &unk_1E6CD3938, CFSTR("More than one Siri Intents UI app extension in the app %@ declares the value %@ in the IntentsSupported array in the ExtensionAttributes dictionary in the NSExtensionDictionary in its Info.plist."), v49, (uint64_t)v47);
LABEL_79:
                  v50 = objc_claimAutoreleasedReturnValue();

                  v15 = (id)v50;
                  a3 = v66;
                  v8 = v67;
                  goto LABEL_94;
                }
              }
              v40 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v78, v92, 16);
              if (v40)
                continue;
              break;
            }
          }

          v36 = v77;
        }
        objc_msgSend(v36, "addObjectsFromArray:", v31);

        a3 = v66;
        v8 = v67;
LABEL_70:

        continue;
      }
      if (v76)
      {
        objc_msgSend(v18, "identifier");
        v9 = (id)objc_claimAutoreleasedReturnValue();
        _CreateAndLogError((uint64_t)"-[MIBundle validatePluginKitMetadataWithError:]", 821, CFSTR("MIInstallerErrorDomain"), 82, 0, &unk_1E6CD3848, CFSTR("Multiple WatchKit app extensions found in app but only one is allowed (found %@ ; already found %@)"),
          v56,
          (uint64_t)v9);
        goto LABEL_85;
      }
      objc_msgSend(v18, "identifier");
      v76 = objc_claimAutoreleasedReturnValue();
      if (-[MIBundle isPlaceholder](self, "isPlaceholder"))
        continue;
      if (-[MIBundle isWatchApp](self, "isWatchApp"))
      {
        objc_msgSend(v18, "extensionAttributes");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v22)
        {
          _CreateAndLogError((uint64_t)"-[MIBundle validatePluginKitMetadataWithError:]", 841, CFSTR("MIInstallerErrorDomain"), 93, 0, &unk_1E6CD38C0, CFSTR("WatchKit 2 app extension's NSExtension.NSExtensionAttributes dictionary is not present. It must contain a WKAppBundleIdentifier key set to the WatchKit app's bundle ID."), v23, v63);
          v9 = v15;
          v15 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_94;
        }
        v9 = v22;
        objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("WKAppBundleIdentifier"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v25 = v24;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v26 = v25;
        else
          v26 = 0;

        if (!v26)
        {
          _CreateAndLogError((uint64_t)"-[MIBundle validatePluginKitMetadataWithError:]", 834, CFSTR("MIInstallerErrorDomain"), 93, 0, &unk_1E6CD3870, CFSTR("WatchKit 2 app extension's NSExtension.NSExtensionAttributes.WKAppBundleIdentifier value is missing (should be WatchKit app's bundle ID)."), v43, v63);
          v57 = objc_claimAutoreleasedReturnValue();
          goto LABEL_92;
        }
        -[MIBundle identifier](self, "identifier");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v26, "isEqualToString:", v44);

        if ((v45 & 1) == 0)
        {
          -[MIBundle identifier](self, "identifier");
          v65 = objc_claimAutoreleasedReturnValue();
          _CreateAndLogError((uint64_t)"-[MIBundle validatePluginKitMetadataWithError:]", 837, CFSTR("MIInstallerErrorDomain"), 93, 0, &unk_1E6CD3898, CFSTR("WatchKit 2 app extension's NSExtension.NSExtensionAttributes.WKAppBundleIdentifier value does not match WatchKit app's bundle ID (found \"%@\"; expected \"%@\")."),
            v61,
            (uint64_t)v26);
          v57 = objc_claimAutoreleasedReturnValue();

          v15 = (id)v65;
LABEL_92:

LABEL_93:
          v15 = (id)v57;
LABEL_94:
          v13 = (void *)v74;
          goto LABEL_95;
        }

        goto LABEL_70;
      }
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
      {
        v63 = v76;
        MOLogWrite();
      }
    }
    v69 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v94, 16);
    if (v69)
      continue;
    break;
  }
LABEL_75:

  v14 = 1;
  v9 = v15;
  v13 = (void *)v74;
  v11 = (void *)v75;
  v12 = (void *)v76;
LABEL_98:

  return v14;
}

- (id)extensionKitBundlesPerformingPlatformValidation:(unsigned __int8)a3 withError:(id *)a4
{
  uint64_t v5;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  id v16;
  id v18;

  v5 = a3;
  -[MIBundle extensionKitBundles](self, "extensionKitBundles");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    v9 = 0;
    goto LABEL_7;
  }
  -[MIBundle bundleURL](self, "bundleURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "URLByAppendingPathComponent:isDirectory:", CFSTR("Extensions"), 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[MIFileManager defaultManager](MIFileManager, "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "itemDoesNotExistOrIsNotDirectoryAtURL:", v11);

  if (v13)
  {
    v8 = (void *)objc_opt_new();
    v9 = 0;
LABEL_6:
    -[MIBundle setExtensionKitBundles:](self, "setExtensionKitBundles:", v8);

LABEL_7:
    -[MIBundle _filterExtensionBundles:forValidationFlags:](self, "_filterExtensionBundles:forValidationFlags:", v8, v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIBundle _filterExtensionBundlesNotInCacheIfNeeded:](self, "_filterExtensionBundlesNotInCacheIfNeeded:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a4)
      goto LABEL_10;
    goto LABEL_8;
  }
  v18 = 0;
  +[MIExtensionKitBundle bundlesInParentBundle:subDirectory:matchingPredicate:error:](MIExtensionKitBundle, "bundlesInParentBundle:subDirectory:matchingPredicate:error:", self, CFSTR("Extensions"), &__block_literal_global_219, &v18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v18;
  if (v8)
    goto LABEL_6;

  v14 = 0;
  v15 = 0;
  if (!a4)
    goto LABEL_10;
LABEL_8:
  if (!v15)
    *a4 = objc_retainAutorelease(v9);
LABEL_10:
  v16 = v15;

  return v16;
}

uint64_t __70__MIBundle_extensionKitBundlesPerformingPlatformValidation_withError___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "pathExtension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("appex"));

  return v3;
}

- (id)extensionKitBundlesWithError:(id *)a3
{
  return -[MIBundle extensionKitBundlesPerformingPlatformValidation:withError:](self, "extensionKitBundlesPerformingPlatformValidation:withError:", 3, a3);
}

- (BOOL)_validateExtensions:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  BOOL v14;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = a3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v18;
    while (2)
    {
      v10 = 0;
      v11 = v8;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v10);
        v16 = v11;
        v13 = objc_msgSend(v12, "validateBundleMetadataWithError:", &v16);
        v8 = v16;

        if (!v13)
        {

          if (a4)
          {
            v8 = objc_retainAutorelease(v8);
            v14 = 0;
            *a4 = v8;
          }
          else
          {
            v14 = 0;
          }
          goto LABEL_15;
        }
        ++v10;
        v11 = v8;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v7)
        continue;
      break;
    }
  }
  else
  {
    v8 = 0;
  }

  v14 = 1;
LABEL_15:

  return v14;
}

- (BOOL)validateExtensionKitMetadataWithError:(id *)a3
{
  void *v5;
  id v6;
  void *v7;
  BOOL v8;
  id v9;
  id v11;
  id v12;

  v12 = 0;
  -[MIBundle extensionKitBundlesWithError:](self, "extensionKitBundlesWithError:", &v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v12;
  v7 = v6;
  if (v5)
  {
    v11 = v6;
    v8 = -[MIBundle _validateExtensions:error:](self, "_validateExtensions:error:", v5, &v11);
    v9 = v11;

    v7 = v9;
    if (!a3)
      goto LABEL_7;
  }
  else
  {
    v8 = 0;
    if (!a3)
      goto LABEL_7;
  }
  if (!v8)
    *a3 = objc_retainAutorelease(v7);
LABEL_7:

  return v8;
}

- (id)appExtensionBundlesWithError:(id *)a3
{
  return -[MIBundle appExtensionBundlesPerformingPlatformValidation:withError:](self, "appExtensionBundlesPerformingPlatformValidation:withError:", 3, a3);
}

- (id)appExtensionBundlesPerformingPlatformValidation:(unsigned __int8)a3 withError:(id *)a4
{
  uint64_t v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  v7 = (void *)objc_opt_new();
  -[MIBundle pluginKitBundlesPerformingPlatformValidation:withError:](self, "pluginKitBundlesPerformingPlatformValidation:withError:", v5, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[MIBundle extensionKitBundlesPerformingPlatformValidation:withError:](self, "extensionKitBundlesPerformingPlatformValidation:withError:", v5, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v7, "addObjectsFromArray:", v8);
      objc_msgSend(v7, "addObjectsFromArray:", v9);
      v10 = (void *)objc_msgSend(v7, "copy");
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

- (BOOL)validateDriverKitExtensionMetadataWithError:(id *)a3
{
  void *v5;
  id v6;
  void *v7;
  BOOL v8;
  id v9;
  id v11;
  id v12;

  v12 = 0;
  -[MIBundle driverKitExtensionBundlesWithError:](self, "driverKitExtensionBundlesWithError:", &v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v12;
  v7 = v6;
  if (v5)
  {
    v11 = v6;
    v8 = -[MIBundle _validateExtensions:error:](self, "_validateExtensions:error:", v5, &v11);
    v9 = v11;

    v7 = v9;
    if (!a3)
      goto LABEL_7;
  }
  else
  {
    v8 = 0;
    if (!a3)
      goto LABEL_7;
  }
  if (!v8)
    *a3 = objc_retainAutorelease(v7);
LABEL_7:

  return v8;
}

- (BOOL)validateBundleMetadataWithError:(id *)a3
{
  return 1;
}

+ (BOOL)bundleIsInDenyList:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v8;

  v3 = a3;
  if (bundleIsInDenyList__onceToken != -1)
    dispatch_once(&bundleIsInDenyList__onceToken, &__block_literal_global_223);
  v4 = (void *)bundleIsInDenyList__denylist;
  objc_msgSend(v3, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5);

  if (v6 && gLogHandle && *(int *)(gLogHandle + 44) >= 7)
  {
    objc_msgSend(v3, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    MOLogWrite();

  }
  return v6;
}

void __31__MIBundle_bundleIsInDenyList___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E6CD47C0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)bundleIsInDenyList__denylist;
  bundleIsInDenyList__denylist = v0;

}

- (id)frameworkBundlesWithError:(id *)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v11;
  _QWORD v12[5];

  -[MIBundle frameworkBundles](self, "frameworkBundles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = 0;
    goto LABEL_5;
  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __38__MIBundle_frameworkBundlesWithError___block_invoke;
  v12[3] = &unk_1E6CB6FD0;
  v12[4] = self;
  v7 = (void *)MEMORY[0x1BCCAA218](v12);
  v11 = 0;
  +[MIExecutableBundle bundlesInParentBundle:subDirectory:matchingPredicate:error:](MIExecutableBundle, "bundlesInParentBundle:subDirectory:matchingPredicate:error:", self, CFSTR("Frameworks"), v7, &v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v11;
  if (v8)
  {
    -[MIBundle setFrameworkBundles:](self, "setFrameworkBundles:", v8);

LABEL_5:
    -[MIBundle frameworkBundles](self, "frameworkBundles");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a3)
      goto LABEL_8;
    goto LABEL_6;
  }

  v9 = 0;
  if (!a3)
    goto LABEL_8;
LABEL_6:
  if (!v9)
    *a3 = objc_retainAutorelease(v6);
LABEL_8:

  return v9;
}

uint64_t __38__MIBundle_frameworkBundlesWithError___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = a2;
  objc_msgSend(v2, "pathExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("framework")))
    v4 = objc_msgSend((id)objc_opt_class(), "bundleIsInDenyList:", v2) ^ 1;
  else
    v4 = 0;

  return v4;
}

- (id)xpcServiceBundlesWithError:(id *)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v10;

  -[MIBundle xpcServiceBundles](self, "xpcServiceBundles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = 0;
    goto LABEL_5;
  }
  v10 = 0;
  +[MIExecutableBundle bundlesInParentBundle:subDirectory:matchingPredicate:error:](MIExecutableBundle, "bundlesInParentBundle:subDirectory:matchingPredicate:error:", self, CFSTR("XPCServices"), &__block_literal_global_254, &v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;
  if (v7)
  {
    -[MIBundle setXpcServiceBundles:](self, "setXpcServiceBundles:", v7);

LABEL_5:
    -[MIBundle xpcServiceBundles](self, "xpcServiceBundles");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a3)
      goto LABEL_8;
    goto LABEL_6;
  }
  v8 = 0;
  if (!a3)
    goto LABEL_8;
LABEL_6:
  if (!v8)
    *a3 = objc_retainAutorelease(v6);
LABEL_8:

  return v8;
}

uint64_t __39__MIBundle_xpcServiceBundlesWithError___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "pathExtension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("xpc"));

  return v3;
}

- (id)driverKitBundlesPerformingPlatformValidation:(unsigned __int8)a3 withError:(id *)a4
{
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v12;

  -[MIBundle driverKitExtensionBundles](self, "driverKitExtensionBundles");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    v9 = 0;
    goto LABEL_5;
  }
  v12 = 0;
  +[MIDriverKitBundle bundlesInParentBundle:subDirectory:matchingPredicate:error:](MIDriverKitBundle, "bundlesInParentBundle:subDirectory:matchingPredicate:error:", self, CFSTR("SystemExtensions"), &__block_literal_global_257, &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v12;
  if (v8)
  {
    -[MIBundle setDriverKitExtensionBundles:](self, "setDriverKitExtensionBundles:", v8);
LABEL_5:
    -[MIBundle _filterExtensionBundles:forValidationFlags:](self, "_filterExtensionBundles:forValidationFlags:", v8, a3 & 0xFE);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a4)
      goto LABEL_8;
    goto LABEL_6;
  }
  v10 = 0;
  if (!a4)
    goto LABEL_8;
LABEL_6:
  if (!v10)
    *a4 = objc_retainAutorelease(v9);
LABEL_8:

  return v10;
}

uint64_t __67__MIBundle_driverKitBundlesPerformingPlatformValidation_withError___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "pathExtension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("dext"));

  return v3;
}

- (id)driverKitExtensionBundlesWithError:(id *)a3
{
  return -[MIBundle driverKitBundlesPerformingPlatformValidation:withError:](self, "driverKitBundlesPerformingPlatformValidation:withError:", 2, a3);
}

- (id)thisBundleAndAllContainedBundlesWithError:(id *)a3
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  id *v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  id v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  id v58;
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  id v64;
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  id v70;
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "addObject:", self);
  if (-[MIBundle mayContainAppExtensions](self, "mayContainAppExtensions"))
  {
    v70 = 0;
    -[MIBundle appExtensionBundlesPerformingPlatformValidation:withError:](self, "appExtensionBundlesPerformingPlatformValidation:withError:", 0, &v70);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v70;
    if (!v6)
    {
LABEL_52:
      v36 = 0;
      goto LABEL_53;
    }
    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v67;
      while (2)
      {
        v12 = 0;
        v13 = v7;
        do
        {
          if (*(_QWORD *)v67 != v11)
            objc_enumerationMutation(v8);
          v14 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * v12);
          v65 = v13;
          objc_msgSend(v14, "thisBundleAndAllContainedBundlesWithError:", &v65);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = v65;

          if (!v15)
          {

            goto LABEL_52;
          }
          objc_msgSend(v5, "unionSet:", v15);

          ++v12;
          v13 = v7;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
        if (v10)
          continue;
        break;
      }
    }

    v16 = v7;
  }
  else
  {
    v16 = 0;
  }
  if (!-[MIBundle isAppTypeBundle](self, "isAppTypeBundle"))
  {
LABEL_33:
    if (!-[MIBundle mayContainFrameworks](self, "mayContainFrameworks", v46))
    {
      v7 = v16;
      goto LABEL_46;
    }
    v52 = v16;
    -[MIBundle frameworkBundlesWithError:](self, "frameworkBundlesWithError:", &v52);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v52;

    if (v36)
    {
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      v37 = v36;
      v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v48, v71, 16);
      if (v38)
      {
        v39 = v38;
        v40 = *(_QWORD *)v49;
        while (2)
        {
          v41 = 0;
          v42 = v7;
          do
          {
            if (*(_QWORD *)v49 != v40)
              objc_enumerationMutation(v37);
            v43 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v41);
            v47 = v42;
            objc_msgSend(v43, "thisBundleAndAllContainedBundlesWithError:", &v47);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v7 = v47;

            if (!v44)
            {

              goto LABEL_52;
            }
            objc_msgSend(v5, "unionSet:", v44);

            ++v41;
            v42 = v7;
          }
          while (v39 != v41);
          v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v48, v71, 16);
          if (v39)
            continue;
          break;
        }
      }

LABEL_46:
      v36 = (void *)objc_msgSend(v5, "copy");
      if (!a3)
        goto LABEL_56;
      goto LABEL_54;
    }
LABEL_53:
    if (!a3)
      goto LABEL_56;
    goto LABEL_54;
  }
  v64 = v16;
  -[MIBundle xpcServiceBundlesWithError:](self, "xpcServiceBundlesWithError:", &v64);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v64;

  if (v17)
  {
    v46 = a3;
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v19 = v17;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v60, v73, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v61;
      while (2)
      {
        v23 = 0;
        v24 = v18;
        do
        {
          if (*(_QWORD *)v61 != v22)
            objc_enumerationMutation(v19);
          v25 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v23);
          v59 = v24;
          objc_msgSend(v25, "thisBundleAndAllContainedBundlesWithError:", &v59, v46);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v59;

          if (!v26)
          {

            a3 = v46;
            goto LABEL_49;
          }
          objc_msgSend(v5, "unionSet:", v26);

          ++v23;
          v24 = v18;
        }
        while (v21 != v23);
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v60, v73, 16);
        if (v21)
          continue;
        break;
      }
    }

    v58 = v18;
    -[MIBundle driverKitBundlesPerformingPlatformValidation:withError:](self, "driverKitBundlesPerformingPlatformValidation:withError:", 0, &v58);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v58;

    if (v27)
    {
      v57 = 0u;
      v55 = 0u;
      v56 = 0u;
      v54 = 0u;
      v28 = v27;
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v54, v72, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v55;
        while (2)
        {
          v32 = 0;
          v33 = v7;
          do
          {
            if (*(_QWORD *)v55 != v31)
              objc_enumerationMutation(v28);
            v34 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v32);
            v53 = v33;
            objc_msgSend(v34, "thisBundleAndAllContainedBundlesWithError:", &v53, v46);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v7 = v53;

            if (!v35)
            {

              goto LABEL_58;
            }
            objc_msgSend(v5, "unionSet:", v35);

            ++v32;
            v33 = v7;
          }
          while (v30 != v32);
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v54, v72, 16);
          if (v30)
            continue;
          break;
        }
      }

      v16 = v7;
      a3 = v46;
      goto LABEL_33;
    }
LABEL_58:

    v36 = 0;
    a3 = v46;
    if (!v46)
      goto LABEL_56;
  }
  else
  {
LABEL_49:

    v36 = 0;
    v7 = v18;
    if (!a3)
      goto LABEL_56;
  }
LABEL_54:
  if (!v36)
    *a3 = objc_retainAutorelease(v7);
LABEL_56:

  return v36;
}

- (NSURL)bundleParentDirectoryURL
{
  return self->_bundleParentDirectoryURL;
}

- (NSString)relativePath
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[MIBundle parentBundle](self, "parentBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "relativePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MIBundle bundleParentSubdirectory](self, "bundleParentSubdirectory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingPathComponent:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIBundle bundleURL](self, "bundleURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastPathComponent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingPathComponent:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[MIBundle bundleURL](self, "bundleURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastPathComponent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v9;
}

- (NSString)displayName
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;

  -[MIBundle infoPlistSubset](self, "infoPlistSubset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AAC8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  if (!v6 || !objc_msgSend(v6, "length"))
  {
    -[MIBundle infoPlistSubset](self, "infoPlistSubset");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AE88]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v9 = v8;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;

    if (v10 && objc_msgSend(v10, "length"))
    {
      v6 = v10;
    }
    else
    {
      -[MIBundle bundleURL](self, "bundleURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastPathComponent");
      v6 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  return (NSString *)v6;
}

- (void)setBundleParentDirectoryURL:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_bundleParentDirectoryURL, a3);
  -[MIBundle bundleURL](self, "bundleURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIBundle pluginKitBundles](self, "pluginKitBundles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v54;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v54 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * v12++), "setBundleParentDirectoryURL:", v6);
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
      }
      while (v10);
    }
  }
  -[MIBundle extensionKitBundles](self, "extensionKitBundles");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v49, v60, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v50;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v50 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * v18++), "setBundleParentDirectoryURL:", v6);
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v49, v60, 16);
      }
      while (v16);
    }
  }
  -[MIBundle frameworkBundles](self, "frameworkBundles");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v45, v59, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v46;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v46 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * v24++), "setBundleParentDirectoryURL:", v6);
        }
        while (v22 != v24);
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v45, v59, 16);
      }
      while (v22);
    }
  }
  -[MIBundle xpcServiceBundles](self, "xpcServiceBundles");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v25)
  {
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v41, v58, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v42;
      do
      {
        v30 = 0;
        do
        {
          if (*(_QWORD *)v42 != v29)
            objc_enumerationMutation(v26);
          objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * v30++), "setBundleParentDirectoryURL:", v6);
        }
        while (v28 != v30);
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v41, v58, 16);
      }
      while (v28);
    }
  }
  -[MIBundle driverKitExtensionBundles](self, "driverKitExtensionBundles");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v31;
  if (v31)
  {
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v37, v57, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v38;
      do
      {
        v36 = 0;
        do
        {
          if (*(_QWORD *)v38 != v35)
            objc_enumerationMutation(v32);
          objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v36++), "setBundleParentDirectoryURL:", v6);
        }
        while (v34 != v36);
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v37, v57, 16);
      }
      while (v34);
    }
  }

}

- (NSURL)bundleURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[MIBundle bundleParentSubdirectory](self, "bundleParentSubdirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  -[MIBundle bundleParentDirectoryURL](self, "bundleParentDirectoryURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[MIBundle bundleParentSubdirectory](self, "bundleParentSubdirectory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", v5, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[MIBundle bundleName](self, "bundleName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", v7, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v6;
  }
  else
  {
    -[MIBundle bundleName](self, "bundleName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", v7, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSURL *)v8;
}

+ (id)bundleForURL:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;

  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBundleURL:error:", v5, a4);

  return v6;
}

- (BOOL)needsDataContainer
{
  return 0;
}

- (NSString)minimumOSVersion
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;

  -[MIBundle infoPlistSubset](self, "infoPlistSubset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MinimumProductVersion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  if (v6)
    v7 = v6;
  -[MIBundle infoPlistSubset](self, "infoPlistSubset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MinimumOSVersion"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v10 = v9;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  v12 = v6;
  if (v11)
  {
    v12 = v11;

  }
  v13 = v12;

  return (NSString *)v13;
}

- (NSArray)deviceFamilies
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  -[MIBundle infoPlistSubset](self, "infoPlistSubset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("UIDeviceFamily"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  return (NSArray *)v5;
}

- (BOOL)isWatchApp
{
  return -[MIBundle isCompatibleWithDeviceFamily:](self, "isCompatibleWithDeviceFamily:", 4);
}

- (BOOL)isLaunchProhibited
{
  void *v2;
  void *v3;
  char v4;
  BOOL v5;

  -[MIBundle infoPlistSubset](self, "infoPlistSubset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("LSApplicationLaunchProhibited"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = objc_msgSend(v3, "BOOLValue");
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v5 = 0;
      goto LABEL_7;
    }
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("YES"));
  }
  v5 = v4;
LABEL_7:

  return v5;
}

- (BOOL)isAppTypeBundle
{
  int v2;

  v2 = -[MIBundle bundleType](self, "bundleType");
  return v2 == 9 || (v2 - 1) < 5;
}

- (BOOL)mayHaveExecutableProgram
{
  int v2;
  BOOL v4;

  v2 = -[MIBundle bundleType](self, "bundleType");
  v4 = (v2 & 0xFE) == 8 || (v2 - 1) < 6;
  return v2 == 11 || v4;
}

- (BOOL)getIsBuiltForiOSPlatform:(BOOL *)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  char v8;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E6CD4838, a4, &unk_1E6CD4850, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIBundle deviceFamilies](self, "deviceFamilies");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MIIsCompatibleWithAtLeastOneDeviceFamily(v7, v6, 1);

  if (a3)
    *a3 = v8;

  return 1;
}

- (BOOL)isCompatibleWithDeviceFamily:(int)a3
{
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)&a3;
  -[MIBundle deviceFamilies](self, "deviceFamilies");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = MIIsCompatibleWithDeviceFamily(v4, v3);

  return v3;
}

- (BOOL)isApplicableToCurrentDeviceFamilyWithError:(id *)a3
{
  void *v4;

  -[MIBundle deviceFamilies](self, "deviceFamilies");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = MIIsApplicableToCurrentDeviceFamilyWithError(v4, a3);

  return (char)a3;
}

- (id)currentOSVersionForValidationUsingPlatform:(unint64_t *)a3 withError:(id *)a4
{
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v10;

  v7 = (void *)MGCopyAnswer();
  if (v7)
  {
    v8 = 0;
    if (a3)
      *a3 = 1;
  }
  else
  {
    _CreateAndLogError((uint64_t)"-[MIBundle currentOSVersionForValidationUsingPlatform:withError:]", 1527, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("Could not get the product version from MobileGestalt."), v6, v10);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (a4)
    {
      v8 = objc_retainAutorelease(v8);
      *a4 = v8;
    }
  }

  return v7;
}

- (BOOL)isApplicableToCurrentOSVersionWithError:(id *)a3
{
  void *v5;
  id v6;
  void *v7;
  BOOL v8;
  id v9;
  id v11;
  id v12;
  uint64_t v13;

  v12 = 0;
  v13 = 0;
  -[MIBundle currentOSVersionForValidationUsingPlatform:withError:](self, "currentOSVersionForValidationUsingPlatform:withError:", &v13, &v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v12;
  if (v5)
  {
    -[MIBundle minimumOSVersion](self, "minimumOSVersion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v6;
    v8 = -[MIBundle _isMinimumOSVersion:applicableToOSVersion:requiredOS:error:](self, "_isMinimumOSVersion:applicableToOSVersion:requiredOS:error:", v7, v5, v13, &v11);
    v9 = v11;

    v6 = v9;
    if (!a3)
      goto LABEL_7;
  }
  else
  {
    v8 = 0;
    if (!a3)
      goto LABEL_7;
  }
  if (!v8)
    *a3 = objc_retainAutorelease(v6);
LABEL_7:

  return v8;
}

- (BOOL)isApplicableToOSVersion:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[MIBundle minimumOSVersion](self, "minimumOSVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[MIBundle isMinimumOSVersion:applicableToOSVersion:error:](self, "isMinimumOSVersion:applicableToOSVersion:error:", v7, v6, a4);

  return (char)a4;
}

- (BOOL)isMinimumOSVersion:(id)a3 applicableToOSVersion:(id)a4 error:(id *)a5
{
  return -[MIBundle _isMinimumOSVersion:applicableToOSVersion:requiredOS:error:](self, "_isMinimumOSVersion:applicableToOSVersion:requiredOS:error:", a3, a4, 1, a5);
}

- (BOOL)_isMinimumOSVersion:(id)a3 applicableToOSVersion:(id)a4 requiredOS:(unint64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  BOOL v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[3];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = v11;
  if (v10 && objc_msgSend(v11, "compare:options:", v10, 64) == -1)
  {
    v21[0] = CFSTR("LegacyErrorString");
    v21[1] = CFSTR("RequiredOSVersion");
    v22[0] = CFSTR("DeviceOSVersionTooLow");
    v22[1] = v10;
    v21[2] = CFSTR("RequiredOS");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v22[2] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIBundle bundleURL](self, "bundleURL");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "path");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateError((uint64_t)"-[MIBundle _isMinimumOSVersion:applicableToOSVersion:requiredOS:error:]", 1639, CFSTR("MIInstallerErrorDomain"), 9, 0, v17, CFSTR("The system version is lower than the minimum OS version specified for bundle at %@. Have %@; need %@"),
      v20,
      (uint64_t)v19);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    if (a6)
    {
      v13 = objc_retainAutorelease(v13);
      v14 = 0;
      *a6 = v13;
    }
    else
    {
      v14 = 0;
    }
  }
  else
  {
    v13 = 0;
    v14 = 1;
  }

  return v14;
}

- (BOOL)isApplicableToOSVersionEarlierThan:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  -[MIBundle minimumOSVersion](self, "minimumOSVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = objc_msgSend(v4, "compare:options:", v5, 64) == 1;
  else
    v6 = 1;

  return v6;
}

- (BOOL)isApplicableToCurrentDeviceCapabilitiesWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  id v16;

  -[MIBundle infoPlistSubset](self, "infoPlistSubset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UIRequiredDeviceCapabilities"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v7 = 0;
    v8 = 0;
    v12 = 1;
    goto LABEL_14;
  }
  +[MICapabilitiesManager defaultManager](MICapabilitiesManager, "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v6, "checkCapabilities:withOptions:error:", v5, 0, &v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v16;

  if (!v7)
  {
    v12 = 0;
    if (!a3)
      goto LABEL_14;
    goto LABEL_12;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CapabilitiesMatch"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v10 = v9;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  v12 = objc_msgSend(v11, "BOOLValue");
  if ((v12 & 1) == 0)
  {
    _CreateError((uint64_t)"-[MIBundle isApplicableToCurrentDeviceCapabilitiesWithError:]", 1686, CFSTR("MIInstallerErrorDomain"), 67, 0, 0, CFSTR("Device capabilities do not match requirements: %@"), v13, (uint64_t)v7);
    v14 = objc_claimAutoreleasedReturnValue();

    v8 = (id)v14;
  }

  if (a3)
  {
LABEL_12:
    if ((v12 & 1) == 0)
    {
      v8 = objc_retainAutorelease(v8);
      v12 = 0;
      *a3 = v8;
    }
  }
LABEL_14:

  return v12;
}

- (NSArray)supportedDevices
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  -[MIBundle infoPlistSubset](self, "infoPlistSubset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("UISupportedDevices"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  if (!v6)
  {
    -[MIBundle infoPlistSubset](self, "infoPlistSubset");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SupportedDevices"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v9 = v8;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v9;
    else
      v6 = 0;

  }
  return (NSArray *)v6;
}

- (BOOL)thinningMatchesCurrentDeviceWithError:(id *)a3
{
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  BOOL v12;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;

  -[MIBundle supportedDevices](self, "supportedDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_4;
  v6 = -[MIBundle bundleType](self, "bundleType");
  if ((v6 - 1) >= 5 && v6 != 9)
  {
    _CreateAndLogError((uint64_t)"-[MIBundle thinningMatchesCurrentDeviceWithError:]", 1724, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("Unexpectedly asked to validate thinning on a non-app bundle %@"), v7, (uint64_t)self);
LABEL_14:
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    goto LABEL_15;
  }
  +[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "skipThinningCheck");

  if ((v9 & 1) != 0)
  {
LABEL_4:
    v10 = 0;
    v11 = 0;
LABEL_5:
    v12 = 1;
    goto LABEL_6;
  }
  objc_opt_class();
  if ((MIArrayContainsOnlyClass(v5) & 1) == 0)
  {
    _CreateAndLogError((uint64_t)"-[MIBundle thinningMatchesCurrentDeviceWithError:]", 1734, CFSTR("MIInstallerErrorDomain"), 87, 0, &unk_1E6CD3960, CFSTR("The value of the UISupportedDevices key in this app's Info.plist key must contain only string values."), v14, v21);
    goto LABEL_14;
  }
  v11 = (void *)MGCopyAnswer();
  if (!v11)
  {
    _CreateAndLogError((uint64_t)"-[MIBundle thinningMatchesCurrentDeviceWithError:]", 1744, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("MGCopyAnswer for kMGOCompatibleAppVariants returned NULL"), v15, v21);
    v10 = (id)objc_claimAutoreleasedReturnValue();
LABEL_15:
    v12 = 0;
    if (!a3)
      goto LABEL_6;
    goto LABEL_16;
  }
  objc_msgSend(v5, "firstObjectCommonWithArray:", v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v10 = 0;
    goto LABEL_5;
  }
  +[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "alternateThinningModelIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18 && objc_msgSend(v5, "containsObject:", v18))
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
      MOLogWrite();
    v10 = 0;
    v12 = 1;
  }
  else
  {
    objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "componentsJoinedByString:", CFSTR(", "));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"-[MIBundle thinningMatchesCurrentDeviceWithError:]", 1759, CFSTR("MIInstallerErrorDomain"), 86, 0, &unk_1E6CD3988, CFSTR("This app is not compatibile with this device. This app specifies a value for UISupportedDevices in its Info.plist as [%@], but none of the identifiers in this device's compatibility list are present in this app's supported devices. This device is compatible with [%@]."), v20, (uint64_t)v19);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    v12 = 0;
  }

  if (a3)
  {
LABEL_16:
    if (!v12)
    {
      v10 = objc_retainAutorelease(v10);
      v12 = 0;
      *a3 = v10;
    }
  }
LABEL_6:

  return v12;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIBundle bundleURL](self, "bundleURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIBundle identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIBundle bundleTypeDescription](self, "bundleTypeDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ : path = %@ identifier = %@ type = %@>"), v5, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSSet)siriIntents
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  MIBundle *v22;
  MIBundle *v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  id v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v32 = 0;
  -[MIBundle pluginKitBundlesWithError:](self, "pluginKitBundlesWithError:", &v32);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v32;
  v5 = v4;
  if (v3)
  {
    v26 = v4;
    v27 = v3;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v6 = v3;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v29 != v10)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          if (objc_msgSend(v12, "isSiriIntentsExtension"))
          {
            if (!v9)
              v9 = (void *)objc_opt_new();
            objc_msgSend(v12, "extensionAttributes");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = v13;
            if (v13)
            {
              objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("IntentsSupported"));
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              if (v15)
                objc_msgSend(v9, "addObjectsFromArray:", v15);

            }
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v8);
    }
    else
    {
      v9 = 0;
    }

    v5 = v26;
    v3 = v27;
  }
  else
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      v22 = self;
      v24 = v4;
      MOLogWrite();
    }
    v9 = 0;
  }
  -[MIBundle infoPlistSubset](self, "infoPlistSubset", v22, v24);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("INIntentsSupported"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v18 = v17;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v19 = v18;
  else
    v19 = 0;

  if (v19)
  {
    objc_opt_class();
    if (MIArrayContainsOnlyClass(v19))
    {
      if (!v9)
        v9 = (void *)objc_opt_new();
      objc_msgSend(v9, "addObjectsFromArray:", v19);
    }
    else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      v23 = self;
      v25 = v19;
      MOLogWrite();
    }
  }
  v20 = (void *)objc_msgSend(v9, "copy", v23, v25);

  return (NSSet *)v20;
}

- (BOOL)_validateAppNSPrivacyTrackingDomainsWithError:(id *)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  BOOL v12;
  objc_class *v13;
  void *v14;
  uint64_t v15;
  objc_class *v16;
  void *v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[MIBundle infoPlistSubset](self, "infoPlistSubset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NSPrivacyTrackingDomains"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
LABEL_12:
    v11 = 0;
    v12 = 1;
    goto LABEL_17;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v21;
LABEL_5:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          break;
        if (v8 == ++v10)
        {
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
          if (v8)
            goto LABEL_5;
          goto LABEL_11;
        }
      }
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      _CreateAndLogError((uint64_t)"-[MIBundle _validateAppNSPrivacyTrackingDomainsWithError:]", 1835, CFSTR("MIInstallerErrorDomain"), 193, 0, 0, CFSTR("The \"NSPrivacyTrackingDomains\" key in the app's Info.plist must have an array value containing strings. An entry was found in that array of non-string type: %@"), v18, (uint64_t)v17);
      v11 = (id)objc_claimAutoreleasedReturnValue();

      if (a3)
        goto LABEL_14;
      goto LABEL_16;
    }
LABEL_11:

    goto LABEL_12;
  }
  v13 = (objc_class *)objc_opt_class();
  NSStringFromClass(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  _CreateAndLogError((uint64_t)"-[MIBundle _validateAppNSPrivacyTrackingDomainsWithError:]", 1828, CFSTR("MIInstallerErrorDomain"), 193, 0, 0, CFSTR("The \"NSPrivacyTrackingDomains\" key in the app's Info.plist must have an array value. An entry was found of non-array type %@."), v15, (uint64_t)v14);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (!a3)
  {
LABEL_16:
    v12 = 0;
    goto LABEL_17;
  }
LABEL_14:
  v11 = objc_retainAutorelease(v11);
  v12 = 0;
  *a3 = v11;
LABEL_17:

  return v12;
}

- (BOOL)validateAppMetadataWithError:(id *)a3
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  BOOL v16;
  id v18;

  -[MIBundle infoPlistSubset](self, "infoPlistSubset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("INAlternativeAppNames"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v7 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  if ((unint64_t)objc_msgSend(v8, "count") >= 4)
  {
    -[MIBundle bundleURL](self, "bundleURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"-[MIBundle validateAppMetadataWithError:]", 1861, CFSTR("MIInstallerErrorDomain"), 132, 0, &unk_1E6CD39B0, CFSTR("Bundle at path %@ has %lu %@ in its Info.plist, maximum of %lu allowed"), v11, (uint64_t)v10);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }
  -[MIBundle infoPlistSubset](self, "infoPlistSubset");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("ITSWatchOnlyContainer"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    _CreateAndLogError((uint64_t)"-[MIBundle validateAppMetadataWithError:]", 1866, CFSTR("MIInstallerErrorDomain"), 137, 0, &unk_1E6CD39D8, CFSTR("This app has the %@ key set in its Info.plist, which identifies it as a shell app surrounding a Watch-only app; these are not installable."),
      v15,
      (uint64_t)CFSTR("ITSWatchOnlyContainer"));
    v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:
    v16 = 0;
    if (!a3)
      goto LABEL_11;
    goto LABEL_9;
  }
  v18 = 0;
  v16 = -[MIBundle _validateAppNSPrivacyTrackingDomainsWithError:](self, "_validateAppNSPrivacyTrackingDomainsWithError:", &v18);
  v12 = v18;
  if (!a3)
    goto LABEL_11;
LABEL_9:
  if (!v16)
    *a3 = objc_retainAutorelease(v12);
LABEL_11:

  return v16;
}

- (NSString)sdkBuildVersion
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  -[MIBundle infoPlistSubset](self, "infoPlistSubset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("DTSDKBuild"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  return (NSString *)v5;
}

- (BOOL)sdkBuildVersionIsAtLeast:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  -[MIBundle sdkBuildVersion](self, "sdkBuildVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "compare:options:", v4, 64) != -1;
  else
    v7 = 0;

  return v7;
}

- (NSString)parentBundleID
{
  return self->_parentBundleID;
}

- (NSString)bundleName
{
  return self->_bundleName;
}

- (NSString)bundleParentSubdirectory
{
  return self->_bundleParentSubdirectory;
}

- (MIBundle)parentBundle
{
  return (MIBundle *)objc_loadWeakRetained((id *)&self->_parentBundle);
}

- (NSArray)pluginKitBundles
{
  return self->_pluginKitBundles;
}

- (void)setPluginKitBundles:(id)a3
{
  objc_storeStrong((id *)&self->_pluginKitBundles, a3);
}

- (NSArray)extensionKitBundles
{
  return self->_extensionKitBundles;
}

- (void)setExtensionKitBundles:(id)a3
{
  objc_storeStrong((id *)&self->_extensionKitBundles, a3);
}

- (NSArray)frameworkBundles
{
  return self->_frameworkBundles;
}

- (void)setFrameworkBundles:(id)a3
{
  objc_storeStrong((id *)&self->_frameworkBundles, a3);
}

- (NSArray)xpcServiceBundles
{
  return self->_xpcServiceBundles;
}

- (void)setXpcServiceBundles:(id)a3
{
  objc_storeStrong((id *)&self->_xpcServiceBundles, a3);
}

- (NSArray)driverKitExtensionBundles
{
  return self->_driverKitExtensionBundles;
}

- (void)setDriverKitExtensionBundles:(id)a3
{
  objc_storeStrong((id *)&self->_driverKitExtensionBundles, a3);
}

- (BOOL)isPlaceholderStatusValid
{
  return self->_isPlaceholderStatusValid;
}

- (void)setIsPlaceholderStatusValid:(BOOL)a3
{
  self->_isPlaceholderStatusValid = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_driverKitExtensionBundles, 0);
  objc_storeStrong((id *)&self->_xpcServiceBundles, 0);
  objc_storeStrong((id *)&self->_frameworkBundles, 0);
  objc_storeStrong((id *)&self->_extensionKitBundles, 0);
  objc_storeStrong((id *)&self->_pluginKitBundles, 0);
  objc_destroyWeak((id *)&self->_parentBundle);
  objc_storeStrong((id *)&self->_bundleParentSubdirectory, 0);
  objc_storeStrong((id *)&self->_bundleName, 0);
  objc_storeStrong((id *)&self->_parentBundleID, 0);
  objc_storeStrong((id *)&self->_bundleParentDirectoryURL, 0);
  objc_storeStrong((id *)&self->_infoPlistSubset, 0);
}

@end

@implementation MSPMapsPaths

+ (id)mapsApplicationContainerPaths
{
  return (id)objc_msgSend(a1, "mapsApplicationContainerPathsWithInvalidationHandler:", 0);
}

- (NSString)pinsSettingsPath
{
  NSString *pinsSettingsPath;
  NSString *v4;
  NSString *v5;
  _QWORD v7[5];

  pinsSettingsPath = self->_pinsSettingsPath;
  if (!pinsSettingsPath)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __32__MSPMapsPaths_pinsSettingsPath__block_invoke;
    v7[3] = &unk_1E6652148;
    v7[4] = self;
    __32__MSPMapsPaths_pinsSettingsPath__block_invoke((uint64_t)v7);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_pinsSettingsPath;
    self->_pinsSettingsPath = v4;

    pinsSettingsPath = self->_pinsSettingsPath;
  }
  return pinsSettingsPath;
}

id __32__MSPMapsPaths_pinsSettingsPath__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "mapsDirectory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("Pins.mapsdata"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (NSString)mapsDirectory
{
  NSString *mapsDirectory;
  NSString *v4;
  NSString *v5;
  _QWORD v7[5];

  mapsDirectory = self->_mapsDirectory;
  if (!mapsDirectory)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __29__MSPMapsPaths_mapsDirectory__block_invoke;
    v7[3] = &unk_1E6652148;
    v7[4] = self;
    __29__MSPMapsPaths_mapsDirectory__block_invoke((uint64_t)v7);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_mapsDirectory;
    self->_mapsDirectory = v4;

    mapsDirectory = self->_mapsDirectory;
  }
  return mapsDirectory;
}

id __29__MSPMapsPaths_mapsDirectory__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("Maps"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_web_createDirectoryAtPathWithIntermediateDirectories:attributes:", v2, 0);

  return v2;
}

- (NSString)groupDirectory
{
  NSString *groupDirectory;
  NSString *v4;
  NSString *v5;
  _QWORD v7[5];

  groupDirectory = self->_groupDirectory;
  if (!groupDirectory)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __30__MSPMapsPaths_groupDirectory__block_invoke;
    v7[3] = &unk_1E6652148;
    v7[4] = self;
    __30__MSPMapsPaths_groupDirectory__block_invoke((uint64_t)v7);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_groupDirectory;
    self->_groupDirectory = v4;

    groupDirectory = self->_groupDirectory;
  }
  return groupDirectory;
}

- (NSString)homeDirectory
{
  void *v2;
  void *v3;

  -[NSURL URLByDeletingLastPathComponent](self->_libraryURL, "URLByDeletingLastPathComponent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

id __30__MSPMapsPaths_groupDirectory__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "URLByDeletingLastPathComponent");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void __32__MSPMapsPaths_pathsAtLocation___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLForDirectory:inDomain:appropriateForURL:create:error:", 5, 1, 0, 0, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "containerURLForSecurityApplicationGroupIdentifier:", CFSTR("group.com.apple.Maps"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("Library"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithLibraryDirectoryURL:groupLibraryURL:invalidationHandler:", v8, v5, 0);
  v7 = (void *)qword_1ED328370;
  qword_1ED328370 = v6;

}

+ (id)mapsApplicationContainerPathsWithInvalidationHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  MSPMapsPaths *v9;
  _QWORD block[5];

  v4 = a3;
  objc_msgSend(a1, "currentMapsApplicationContainerURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "currentMapsGroupContainerURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__MSPMapsPaths_mapsApplicationContainerPathsWithInvalidationHandler___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (mapsApplicationContainerPathsWithInvalidationHandler__onceToken != -1)
  {
    dispatch_once(&mapsApplicationContainerPathsWithInvalidationHandler__onceToken, block);
    if (v5)
      goto LABEL_3;
LABEL_5:
    v9 = 0;
    goto LABEL_6;
  }
  if (!v5)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", CFSTR("Library"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", CFSTR("Library"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MSPMapsPaths initWithLibraryDirectoryURL:groupLibraryURL:invalidationHandler:]([MSPMapsPaths alloc], "initWithLibraryDirectoryURL:groupLibraryURL:invalidationHandler:", v7, v8, v4);

LABEL_6:
  return v9;
}

- (MSPMapsPaths)initWithLibraryDirectoryURL:(id)a3 groupLibraryURL:(id)a4 invalidationHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  MSPMapsPaths *v11;
  uint64_t v12;
  NSURL *libraryURL;
  uint64_t v14;
  NSURL *groupLibraryURL;
  uint64_t v16;
  id invalidationHandler;
  void *v18;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)MSPMapsPaths;
  v11 = -[MSPMapsPaths init](&v20, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    libraryURL = v11->_libraryURL;
    v11->_libraryURL = (NSURL *)v12;

    v14 = objc_msgSend(v9, "copy");
    groupLibraryURL = v11->_groupLibraryURL;
    v11->_groupLibraryURL = (NSURL *)v14;

    v16 = objc_msgSend(v10, "copy");
    invalidationHandler = v11->_invalidationHandler;
    v11->_invalidationHandler = (id)v16;

    if (v11->_invalidationHandler)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addObserver:selector:name:object:", v11, sel__invalidate, CFSTR("MSPMapsPathsAppContainerURLWasInvalidatedNotification"), 0);

    }
  }

  return v11;
}

+ (id)currentMapsApplicationContainerURL
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v12;

  v2 = objc_alloc(MEMORY[0x1E0CA5870]);
  v3 = *MEMORY[0x1E0D26D08];
  v12 = 0;
  v4 = (void *)objc_msgSend(v2, "initWithBundleIdentifier:allowPlaceholder:error:", v3, 0, &v12);
  v5 = v4;
  v6 = 0;
  if (!v12)
  {
    objc_msgSend(v4, "applicationState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v5, "applicationState");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isInstalled"))
      {
        objc_msgSend(v5, "applicationState");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v8, "isValid") & 1) != 0)
        {
          objc_msgSend(v5, "applicationState");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "isRestricted");

          if ((v10 & 1) == 0)
          {
            objc_msgSend(v5, "dataContainerURL");
            v6 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_10;
          }
LABEL_9:
          v6 = 0;
          goto LABEL_10;
        }

      }
      goto LABEL_9;
    }
  }
LABEL_10:

  return v6;
}

+ (id)currentMapsGroupContainerURL
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  uint64_t v13;

  v2 = objc_alloc(MEMORY[0x1E0CA5870]);
  v3 = *MEMORY[0x1E0D26D08];
  v13 = 0;
  v4 = (void *)objc_msgSend(v2, "initWithBundleIdentifier:allowPlaceholder:error:", v3, 0, &v13);
  v5 = v4;
  v6 = 0;
  if (!v13)
  {
    objc_msgSend(v4, "applicationState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
LABEL_6:
      v6 = 0;
      goto LABEL_10;
    }
    objc_msgSend(v5, "applicationState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isInstalled"))
    {
      objc_msgSend(v5, "applicationState");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v9, "isValid") & 1) != 0)
      {
        objc_msgSend(v5, "applicationState");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isRestricted");

        if ((v11 & 1) != 0)
          goto LABEL_6;
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "containerURLForSecurityApplicationGroupIdentifier:", CFSTR("group.com.apple.Maps"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

        goto LABEL_10;
      }

    }
    v6 = 0;
    goto LABEL_9;
  }
LABEL_10:

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportAProblemNotificationsPath, 0);
  objc_storeStrong((id *)&self->_historySyncedMarkerFile, 0);
  objc_storeStrong((id *)&self->_favoritesSyncedMarkerFile, 0);
  objc_storeStrong((id *)&self->_reportAProblemSearchRecordingsPath, 0);
  objc_storeStrong((id *)&self->_reportAProblemDirectionsRecordingsPath, 0);
  objc_storeStrong((id *)&self->_pinsSettingsPath, 0);
  objc_storeStrong((id *)&self->_directionsCachePath, 0);
  objc_storeStrong((id *)&self->_routingAppLaunchRecordPath, 0);
  objc_storeStrong((id *)&self->_failedGeoDirectionsSettingsPath, 0);
  objc_storeStrong((id *)&self->_failedDirectionsSettingsPath, 0);
  objc_storeStrong((id *)&self->_failedGeoSearchesSettingsPath, 0);
  objc_storeStrong((id *)&self->_failedSearchesSettingsPath, 0);
  objc_storeStrong((id *)&self->_nanoHistorySettingsPath, 0);
  objc_storeStrong((id *)&self->_geoHistorySettingsPath, 0);
  objc_storeStrong((id *)&self->_historySettingsPath, 0);
  objc_storeStrong((id *)&self->_directionsSettingsPath, 0);
  objc_storeStrong((id *)&self->_geoBookmarksSettingsPath, 0);
  objc_storeStrong((id *)&self->_bookmarksSettingsPath, 0);
  objc_storeStrong((id *)&self->_geoCollectionsSettingsPath, 0);
  objc_storeStrong((id *)&self->_geoPinnedPlacesSettingsPath, 0);
  objc_storeStrong((id *)&self->_nanoDirectory, 0);
  objc_storeStrong((id *)&self->_groupDirectory, 0);
  objc_storeStrong((id *)&self->_cacheDirectory, 0);
  objc_storeStrong((id *)&self->_mapsDirectory, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_groupLibraryURL, 0);
  objc_storeStrong((id *)&self->_libraryURL, 0);
}

void __69__MSPMapsPaths_mapsApplicationContainerPathsWithInvalidationHandler___block_invoke(uint64_t a1)
{
  __CFNotificationCenter *DistributedCenter;
  __CFNotificationCenter *v3;

  DistributedCenter = CFNotificationCenterGetDistributedCenter();
  CFNotificationCenterAddObserver(DistributedCenter, *(const void **)(a1 + 32), (CFNotificationCallback)MSPMapsPathsSourceApplicationsChangeCallback, CFSTR("com.apple.LaunchServices.applicationRegistered"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v3 = CFNotificationCenterGetDistributedCenter();
  CFNotificationCenterAddObserver(v3, *(const void **)(a1 + 32), (CFNotificationCallback)MSPMapsPathsSourceApplicationsChangeCallback, CFSTR("com.apple.LaunchServices.applicationUnregistered"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

+ (id)pathsAtLocation:(int64_t)a3
{
  uint64_t *v3;
  dispatch_once_t *v5;
  _QWORD *v6;
  _QWORD v7[5];
  _QWORD block[5];
  _QWORD v9[5];

  switch(a3)
  {
    case 0:
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __32__MSPMapsPaths_pathsAtLocation___block_invoke_3;
      v7[3] = &__block_descriptor_40_e5_v8__0l;
      v7[4] = a1;
      if (qword_1ED328378 == -1)
      {
        v3 = &qword_1ED328370;
        goto LABEL_10;
      }
      v3 = &qword_1ED328370;
      v5 = &qword_1ED328378;
      v6 = v7;
LABEL_15:
      dispatch_once(v5, v6);
      goto LABEL_10;
    case 2:
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __32__MSPMapsPaths_pathsAtLocation___block_invoke_2;
      block[3] = &__block_descriptor_40_e5_v8__0l;
      block[4] = a1;
      if (qword_1ED328368 == -1)
      {
        v3 = &qword_1ED328360;
        goto LABEL_10;
      }
      v3 = &qword_1ED328360;
      v5 = &qword_1ED328368;
      v6 = block;
      goto LABEL_15;
    case 1:
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __32__MSPMapsPaths_pathsAtLocation___block_invoke;
      v9[3] = &__block_descriptor_40_e5_v8__0l;
      v9[4] = a1;
      if (qword_1ED328358 == -1)
      {
        v3 = &_MergedGlobals_37;
LABEL_10:
        a2 = (SEL)(id)*v3;
        return (id)(id)a2;
      }
      v3 = &_MergedGlobals_37;
      v5 = &qword_1ED328358;
      v6 = v9;
      goto LABEL_15;
  }
  return (id)(id)a2;
}

void __32__MSPMapsPaths_pathsAtLocation___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", CFSTR("/var/mobile/Library"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithLibraryDirectoryURL:groupLibraryURL:invalidationHandler:", v4, 0, 0);
  v3 = (void *)_MergedGlobals_37;
  _MergedGlobals_37 = v2;

}

void __32__MSPMapsPaths_pathsAtLocation___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend((id)objc_opt_class(), "currentMapsApplicationContainerURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("Library"), 1);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "currentMapsGroupContainerURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("Library"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithLibraryDirectoryURL:groupLibraryURL:invalidationHandler:", v7, v4, 0);
  v6 = (void *)qword_1ED328360;
  qword_1ED328360 = v5;

}

- (void)_invalidate
{
  void (**invalidationHandler)(id, SEL);
  id v4;

  invalidationHandler = (void (**)(id, SEL))self->_invalidationHandler;
  if (invalidationHandler)
  {
    invalidationHandler[2](invalidationHandler, a2);
    v4 = self->_invalidationHandler;
    self->_invalidationHandler = 0;

  }
}

+ (id)mapsDirectory
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "pathsAtLocation:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mapsDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)cacheDirectory
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "pathsAtLocation:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cacheDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)cacheDirectory
{
  NSString *cacheDirectory;
  NSString *v4;
  NSString *v5;
  _QWORD v7[5];

  cacheDirectory = self->_cacheDirectory;
  if (!cacheDirectory)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __30__MSPMapsPaths_cacheDirectory__block_invoke;
    v7[3] = &unk_1E6652148;
    v7[4] = self;
    __30__MSPMapsPaths_cacheDirectory__block_invoke((uint64_t)v7);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_cacheDirectory;
    self->_cacheDirectory = v4;

    cacheDirectory = self->_cacheDirectory;
  }
  return cacheDirectory;
}

id __30__MSPMapsPaths_cacheDirectory__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("Caches"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_web_createDirectoryAtPathWithIntermediateDirectories:attributes:", v2, 0);

  return v2;
}

+ (id)groupDirectory
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "pathsAtLocation:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "groupDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)nanoDirectory
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "pathsAtLocation:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nanoDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)nanoDirectory
{
  NSString *nanoDirectory;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  NSString *v8;
  NSString *v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  nanoDirectory = self->_nanoDirectory;
  if (!nanoDirectory)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2050000000;
    v4 = (void *)qword_1ED328380;
    v15 = qword_1ED328380;
    if (!qword_1ED328380)
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __getNRPairedDeviceRegistryClass_block_invoke;
      v11[3] = &unk_1E6652190;
      v11[4] = &v12;
      __getNRPairedDeviceRegistryClass_block_invoke((uint64_t)v11);
      v4 = (void *)v13[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v12, 8);
    objc_msgSend(v5, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pairingStorePath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("NanoMaps"));
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();

    v9 = self->_nanoDirectory;
    self->_nanoDirectory = v8;

    nanoDirectory = self->_nanoDirectory;
  }
  return nanoDirectory;
}

+ (id)geoPinnedPlacesSettingsPath
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "pathsAtLocation:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "geoPinnedPlacesSettingsPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)geoPinnedPlacesSettingsPath
{
  NSString *geoPinnedPlacesSettingsPath;
  NSString *v4;
  NSString *v5;
  _QWORD v7[5];

  geoPinnedPlacesSettingsPath = self->_geoPinnedPlacesSettingsPath;
  if (!geoPinnedPlacesSettingsPath)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __43__MSPMapsPaths_geoPinnedPlacesSettingsPath__block_invoke;
    v7[3] = &unk_1E6652148;
    v7[4] = self;
    __43__MSPMapsPaths_geoPinnedPlacesSettingsPath__block_invoke((uint64_t)v7);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_geoPinnedPlacesSettingsPath;
    self->_geoPinnedPlacesSettingsPath = v4;

    geoPinnedPlacesSettingsPath = self->_geoPinnedPlacesSettingsPath;
  }
  return geoPinnedPlacesSettingsPath;
}

id __43__MSPMapsPaths_geoPinnedPlacesSettingsPath__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "mapsDirectory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("GeoPinnedPlaces.plist"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)geoCollectionsSettingsPath
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "pathsAtLocation:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "geoCollectionsSettingsPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)geoCollectionsSettingsPath
{
  NSString *geoCollectionsSettingsPath;
  NSString *v4;
  NSString *v5;
  _QWORD v7[5];

  geoCollectionsSettingsPath = self->_geoCollectionsSettingsPath;
  if (!geoCollectionsSettingsPath)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __42__MSPMapsPaths_geoCollectionsSettingsPath__block_invoke;
    v7[3] = &unk_1E6652148;
    v7[4] = self;
    __42__MSPMapsPaths_geoCollectionsSettingsPath__block_invoke((uint64_t)v7);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_geoCollectionsSettingsPath;
    self->_geoCollectionsSettingsPath = v4;

    geoCollectionsSettingsPath = self->_geoCollectionsSettingsPath;
  }
  return geoCollectionsSettingsPath;
}

id __42__MSPMapsPaths_geoCollectionsSettingsPath__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "mapsDirectory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("GeoCollections.plist"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)bookmarksSettingsPath
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "pathsAtLocation:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bookmarksSettingsPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)bookmarksSettingsPath
{
  NSString *bookmarksSettingsPath;
  NSString *v4;
  NSString *v5;
  _QWORD v7[5];

  bookmarksSettingsPath = self->_bookmarksSettingsPath;
  if (!bookmarksSettingsPath)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __37__MSPMapsPaths_bookmarksSettingsPath__block_invoke;
    v7[3] = &unk_1E6652148;
    v7[4] = self;
    __37__MSPMapsPaths_bookmarksSettingsPath__block_invoke((uint64_t)v7);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_bookmarksSettingsPath;
    self->_bookmarksSettingsPath = v4;

    bookmarksSettingsPath = self->_bookmarksSettingsPath;
  }
  return bookmarksSettingsPath;
}

id __37__MSPMapsPaths_bookmarksSettingsPath__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "mapsDirectory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("Bookmarks.plist"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)geoBookmarksSettingsPath
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "pathsAtLocation:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "geoBookmarksSettingsPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)geoBookmarksSettingsPath
{
  NSString *geoBookmarksSettingsPath;
  NSString *v4;
  NSString *v5;
  _QWORD v7[5];

  geoBookmarksSettingsPath = self->_geoBookmarksSettingsPath;
  if (!geoBookmarksSettingsPath)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __40__MSPMapsPaths_geoBookmarksSettingsPath__block_invoke;
    v7[3] = &unk_1E6652148;
    v7[4] = self;
    __40__MSPMapsPaths_geoBookmarksSettingsPath__block_invoke((uint64_t)v7);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_geoBookmarksSettingsPath;
    self->_geoBookmarksSettingsPath = v4;

    geoBookmarksSettingsPath = self->_geoBookmarksSettingsPath;
  }
  return geoBookmarksSettingsPath;
}

id __40__MSPMapsPaths_geoBookmarksSettingsPath__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "mapsDirectory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("GeoBookmarks.plist"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)directionsSettingsPath
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "pathsAtLocation:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "directionsSettingsPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)directionsSettingsPath
{
  NSString *directionsSettingsPath;
  NSString *v4;
  NSString *v5;
  _QWORD v7[5];

  directionsSettingsPath = self->_directionsSettingsPath;
  if (!directionsSettingsPath)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __38__MSPMapsPaths_directionsSettingsPath__block_invoke;
    v7[3] = &unk_1E6652148;
    v7[4] = self;
    __38__MSPMapsPaths_directionsSettingsPath__block_invoke((uint64_t)v7);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_directionsSettingsPath;
    self->_directionsSettingsPath = v4;

    directionsSettingsPath = self->_directionsSettingsPath;
  }
  return directionsSettingsPath;
}

id __38__MSPMapsPaths_directionsSettingsPath__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "mapsDirectory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("Directions.mapsdata"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)historySettingsPath
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "pathsAtLocation:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "historySettingsPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)historySettingsPath
{
  NSString *historySettingsPath;
  NSString *v4;
  NSString *v5;
  _QWORD v7[5];

  historySettingsPath = self->_historySettingsPath;
  if (!historySettingsPath)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __35__MSPMapsPaths_historySettingsPath__block_invoke;
    v7[3] = &unk_1E6652148;
    v7[4] = self;
    __35__MSPMapsPaths_historySettingsPath__block_invoke((uint64_t)v7);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_historySettingsPath;
    self->_historySettingsPath = v4;

    historySettingsPath = self->_historySettingsPath;
  }
  return historySettingsPath;
}

id __35__MSPMapsPaths_historySettingsPath__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "mapsDirectory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("History.mapsdata"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)geoHistorySettingsPath
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "pathsAtLocation:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "geoHistorySettingsPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)geoHistorySettingsPath
{
  NSString *geoHistorySettingsPath;
  NSString *v4;
  NSString *v5;
  _QWORD v7[5];

  geoHistorySettingsPath = self->_geoHistorySettingsPath;
  if (!geoHistorySettingsPath)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __38__MSPMapsPaths_geoHistorySettingsPath__block_invoke;
    v7[3] = &unk_1E6652148;
    v7[4] = self;
    __38__MSPMapsPaths_geoHistorySettingsPath__block_invoke((uint64_t)v7);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_geoHistorySettingsPath;
    self->_geoHistorySettingsPath = v4;

    geoHistorySettingsPath = self->_geoHistorySettingsPath;
  }
  return geoHistorySettingsPath;
}

id __38__MSPMapsPaths_geoHistorySettingsPath__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "mapsDirectory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("GeoHistory.mapsdata"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)nanoHistorySettingsPath
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "pathsAtLocation:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nanoHistorySettingsPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)nanoHistorySettingsPath
{
  NSString *nanoHistorySettingsPath;
  NSString *v4;
  NSString *v5;
  _QWORD v7[5];

  nanoHistorySettingsPath = self->_nanoHistorySettingsPath;
  if (!nanoHistorySettingsPath)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __39__MSPMapsPaths_nanoHistorySettingsPath__block_invoke;
    v7[3] = &unk_1E6652148;
    v7[4] = self;
    __39__MSPMapsPaths_nanoHistorySettingsPath__block_invoke((uint64_t)v7);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_nanoHistorySettingsPath;
    self->_nanoHistorySettingsPath = v4;

    nanoHistorySettingsPath = self->_nanoHistorySettingsPath;
  }
  return nanoHistorySettingsPath;
}

id __39__MSPMapsPaths_nanoHistorySettingsPath__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "nanoDirectory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("GeoHistory.mapsdata"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)failedSearchesSettingsPath
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "pathsAtLocation:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "failedSearchesSettingsPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)failedSearchesSettingsPath
{
  NSString *failedSearchesSettingsPath;
  NSString *v4;
  NSString *v5;
  _QWORD v7[5];

  failedSearchesSettingsPath = self->_failedSearchesSettingsPath;
  if (!failedSearchesSettingsPath)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __42__MSPMapsPaths_failedSearchesSettingsPath__block_invoke;
    v7[3] = &unk_1E6652148;
    v7[4] = self;
    __42__MSPMapsPaths_failedSearchesSettingsPath__block_invoke((uint64_t)v7);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_failedSearchesSettingsPath;
    self->_failedSearchesSettingsPath = v4;

    failedSearchesSettingsPath = self->_failedSearchesSettingsPath;
  }
  return failedSearchesSettingsPath;
}

id __42__MSPMapsPaths_failedSearchesSettingsPath__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "mapsDirectory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("FailedSearches.mapsdata"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)failedGeoSearchesSettingsPath
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "pathsAtLocation:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "failedGeoSearchesSettingsPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)failedGeoSearchesSettingsPath
{
  NSString *failedGeoSearchesSettingsPath;
  NSString *v4;
  NSString *v5;
  _QWORD v7[5];

  failedGeoSearchesSettingsPath = self->_failedGeoSearchesSettingsPath;
  if (!failedGeoSearchesSettingsPath)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __45__MSPMapsPaths_failedGeoSearchesSettingsPath__block_invoke;
    v7[3] = &unk_1E6652148;
    v7[4] = self;
    __45__MSPMapsPaths_failedGeoSearchesSettingsPath__block_invoke((uint64_t)v7);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_failedGeoSearchesSettingsPath;
    self->_failedGeoSearchesSettingsPath = v4;

    failedGeoSearchesSettingsPath = self->_failedGeoSearchesSettingsPath;
  }
  return failedGeoSearchesSettingsPath;
}

id __45__MSPMapsPaths_failedGeoSearchesSettingsPath__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "mapsDirectory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("MSPFailedSearches.mapsdata"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)failedDirectionsSettingsPath
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "pathsAtLocation:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "failedDirectionsSettingsPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)failedDirectionsSettingsPath
{
  NSString *failedDirectionsSettingsPath;
  NSString *v4;
  NSString *v5;
  _QWORD v7[5];

  failedDirectionsSettingsPath = self->_failedDirectionsSettingsPath;
  if (!failedDirectionsSettingsPath)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __44__MSPMapsPaths_failedDirectionsSettingsPath__block_invoke;
    v7[3] = &unk_1E6652148;
    v7[4] = self;
    __44__MSPMapsPaths_failedDirectionsSettingsPath__block_invoke((uint64_t)v7);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_failedDirectionsSettingsPath;
    self->_failedDirectionsSettingsPath = v4;

    failedDirectionsSettingsPath = self->_failedDirectionsSettingsPath;
  }
  return failedDirectionsSettingsPath;
}

id __44__MSPMapsPaths_failedDirectionsSettingsPath__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "mapsDirectory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("FailedDirections.mapsdata"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)failedGeoDirectionsSettingsPath
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "pathsAtLocation:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "failedGeoDirectionsSettingsPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)failedGeoDirectionsSettingsPath
{
  NSString *failedGeoDirectionsSettingsPath;
  NSString *v4;
  NSString *v5;
  _QWORD v7[5];

  failedGeoDirectionsSettingsPath = self->_failedGeoDirectionsSettingsPath;
  if (!failedGeoDirectionsSettingsPath)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __47__MSPMapsPaths_failedGeoDirectionsSettingsPath__block_invoke;
    v7[3] = &unk_1E6652148;
    v7[4] = self;
    __47__MSPMapsPaths_failedGeoDirectionsSettingsPath__block_invoke((uint64_t)v7);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_failedGeoDirectionsSettingsPath;
    self->_failedGeoDirectionsSettingsPath = v4;

    failedGeoDirectionsSettingsPath = self->_failedGeoDirectionsSettingsPath;
  }
  return failedGeoDirectionsSettingsPath;
}

id __47__MSPMapsPaths_failedGeoDirectionsSettingsPath__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "mapsDirectory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("MSPFailedDirections.mapsdata"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)routingAppLaunchRecordPath
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "pathsAtLocation:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "routingAppLaunchRecordPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)routingAppLaunchRecordPath
{
  NSString *routingAppLaunchRecordPath;
  NSString *v4;
  NSString *v5;
  _QWORD v7[5];

  routingAppLaunchRecordPath = self->_routingAppLaunchRecordPath;
  if (!routingAppLaunchRecordPath)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __42__MSPMapsPaths_routingAppLaunchRecordPath__block_invoke;
    v7[3] = &unk_1E6652148;
    v7[4] = self;
    __42__MSPMapsPaths_routingAppLaunchRecordPath__block_invoke((uint64_t)v7);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_routingAppLaunchRecordPath;
    self->_routingAppLaunchRecordPath = v4;

    routingAppLaunchRecordPath = self->_routingAppLaunchRecordPath;
  }
  return routingAppLaunchRecordPath;
}

id __42__MSPMapsPaths_routingAppLaunchRecordPath__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "mapsDirectory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("RoutingAppLaunches.mapsdata"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)directionsCachePath
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "pathsAtLocation:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "directionsCachePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)directionsCachePath
{
  NSString *directionsCachePath;
  NSString *v4;
  NSString *v5;
  _QWORD v7[5];

  directionsCachePath = self->_directionsCachePath;
  if (!directionsCachePath)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __35__MSPMapsPaths_directionsCachePath__block_invoke;
    v7[3] = &unk_1E6652148;
    v7[4] = self;
    __35__MSPMapsPaths_directionsCachePath__block_invoke((uint64_t)v7);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_directionsCachePath;
    self->_directionsCachePath = v4;

    directionsCachePath = self->_directionsCachePath;
  }
  return directionsCachePath;
}

id __35__MSPMapsPaths_directionsCachePath__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "cacheDirectory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("DirectionsCache.mapsdata"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)pinsSettingsPath
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "pathsAtLocation:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pinsSettingsPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)reportAProblemDirectionsRecordingsPath
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "pathsAtLocation:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reportAProblemDirectionsRecordingsPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)reportAProblemDirectionsRecordingsPath
{
  NSString *reportAProblemDirectionsRecordingsPath;
  NSString *v4;
  NSString *v5;
  _QWORD v7[5];

  reportAProblemDirectionsRecordingsPath = self->_reportAProblemDirectionsRecordingsPath;
  if (!reportAProblemDirectionsRecordingsPath)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __54__MSPMapsPaths_reportAProblemDirectionsRecordingsPath__block_invoke;
    v7[3] = &unk_1E6652148;
    v7[4] = self;
    __54__MSPMapsPaths_reportAProblemDirectionsRecordingsPath__block_invoke((uint64_t)v7);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_reportAProblemDirectionsRecordingsPath;
    self->_reportAProblemDirectionsRecordingsPath = v4;

    reportAProblemDirectionsRecordingsPath = self->_reportAProblemDirectionsRecordingsPath;
  }
  return reportAProblemDirectionsRecordingsPath;
}

id __54__MSPMapsPaths_reportAProblemDirectionsRecordingsPath__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "mapsDirectory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("ReportAProblem"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("GraphDirections"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)reportAProblemSearchRecordingsPath
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "pathsAtLocation:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reportAProblemSearchRecordingsPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)reportAProblemSearchRecordingsPath
{
  NSString *reportAProblemSearchRecordingsPath;
  NSString *v4;
  NSString *v5;
  _QWORD v7[5];

  reportAProblemSearchRecordingsPath = self->_reportAProblemSearchRecordingsPath;
  if (!reportAProblemSearchRecordingsPath)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __50__MSPMapsPaths_reportAProblemSearchRecordingsPath__block_invoke;
    v7[3] = &unk_1E6652148;
    v7[4] = self;
    __50__MSPMapsPaths_reportAProblemSearchRecordingsPath__block_invoke((uint64_t)v7);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_reportAProblemSearchRecordingsPath;
    self->_reportAProblemSearchRecordingsPath = v4;

    reportAProblemSearchRecordingsPath = self->_reportAProblemSearchRecordingsPath;
  }
  return reportAProblemSearchRecordingsPath;
}

id __50__MSPMapsPaths_reportAProblemSearchRecordingsPath__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "mapsDirectory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("ReportAProblem"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Search"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)favoritesSyncedMarkerFile
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "pathsAtLocation:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "favoritesSyncedMarkerFile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)favoritesSyncedMarkerFile
{
  NSString *favoritesSyncedMarkerFile;
  NSString *v4;
  NSString *v5;
  _QWORD v7[5];

  favoritesSyncedMarkerFile = self->_favoritesSyncedMarkerFile;
  if (!favoritesSyncedMarkerFile)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __41__MSPMapsPaths_favoritesSyncedMarkerFile__block_invoke;
    v7[3] = &unk_1E6652148;
    v7[4] = self;
    __41__MSPMapsPaths_favoritesSyncedMarkerFile__block_invoke((uint64_t)v7);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_favoritesSyncedMarkerFile;
    self->_favoritesSyncedMarkerFile = v4;

    favoritesSyncedMarkerFile = self->_favoritesSyncedMarkerFile;
  }
  return favoritesSyncedMarkerFile;
}

id __41__MSPMapsPaths_favoritesSyncedMarkerFile__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "mapsDirectory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("Bookmarks.synced"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)historySyncedMarkerFile
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "pathsAtLocation:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "historySyncedMarkerFile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)historySyncedMarkerFile
{
  NSString *historySyncedMarkerFile;
  NSString *v4;
  NSString *v5;
  _QWORD v7[5];

  historySyncedMarkerFile = self->_historySyncedMarkerFile;
  if (!historySyncedMarkerFile)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __39__MSPMapsPaths_historySyncedMarkerFile__block_invoke;
    v7[3] = &unk_1E6652148;
    v7[4] = self;
    __39__MSPMapsPaths_historySyncedMarkerFile__block_invoke((uint64_t)v7);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_historySyncedMarkerFile;
    self->_historySyncedMarkerFile = v4;

    historySyncedMarkerFile = self->_historySyncedMarkerFile;
  }
  return historySyncedMarkerFile;
}

id __39__MSPMapsPaths_historySyncedMarkerFile__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "mapsDirectory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("History.synced"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (BOOL)_shouldSyncMergeAfterCheckingOrCreatingMarkerFileAtPath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  char v11;
  void *v12;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "checkResourceIsReachableAndReturnError:", 0);
  if ((v6 & 1) == 0)
  {
    objc_msgSend(v5, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v4, "createFileAtPath:contents:attributes:", v7, v8, 0);

    objc_msgSend(v5, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MSPExcludePathFromBackup(v10);

    if (!v9 || (v11 & 1) == 0)
    {
      objc_msgSend(v5, "path");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "removeItemAtPath:error:", v12, 0);

      NSLog(CFSTR("Couldn't set no backup attribute for %@."), v3);
    }
  }

  return v6 ^ 1;
}

- (BOOL)_deleteSyncedFileAtPath:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  void *v9;
  id v11;

  v3 = (void *)MEMORY[0x1E0CB3620];
  v4 = a3;
  objc_msgSend(v3, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "checkResourceIsReachableAndReturnError:", 0))
  {
    v11 = 0;
    v7 = objc_msgSend(v5, "removeItemAtURL:error:", v6, &v11);
    v8 = v11;
    v9 = v8;
    if (v8)
      NSLog(CFSTR("Error removing synced marker file: %@"), v8);

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (BOOL)shouldSyncMergeFavoritesAfterCheckingOrCreatingMarkerFile
{
  MSPMapsPaths *v2;
  void *v3;

  v2 = self;
  -[MSPMapsPaths favoritesSyncedMarkerFile](self, "favoritesSyncedMarkerFile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[MSPMapsPaths _shouldSyncMergeAfterCheckingOrCreatingMarkerFileAtPath:](v2, "_shouldSyncMergeAfterCheckingOrCreatingMarkerFileAtPath:", v3);

  return (char)v2;
}

- (BOOL)deleteFavoritesSyncedMarkerFile
{
  MSPMapsPaths *v2;
  void *v3;

  v2 = self;
  -[MSPMapsPaths favoritesSyncedMarkerFile](self, "favoritesSyncedMarkerFile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[MSPMapsPaths _deleteSyncedFileAtPath:](v2, "_deleteSyncedFileAtPath:", v3);

  return (char)v2;
}

- (BOOL)shouldSyncMergeHistoryAfterCheckingOrCreatingMarkerFile
{
  MSPMapsPaths *v2;
  void *v3;

  v2 = self;
  -[MSPMapsPaths historySyncedMarkerFile](self, "historySyncedMarkerFile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[MSPMapsPaths _shouldSyncMergeAfterCheckingOrCreatingMarkerFileAtPath:](v2, "_shouldSyncMergeAfterCheckingOrCreatingMarkerFileAtPath:", v3);

  return (char)v2;
}

- (BOOL)deleteHistorySyncedMarkerFile
{
  MSPMapsPaths *v2;
  void *v3;

  v2 = self;
  -[MSPMapsPaths historySyncedMarkerFile](self, "historySyncedMarkerFile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[MSPMapsPaths _deleteSyncedFileAtPath:](v2, "_deleteSyncedFileAtPath:", v3);

  return (char)v2;
}

- (NSString)reportAProblemNotificationsPath
{
  return self->_reportAProblemNotificationsPath;
}

@end

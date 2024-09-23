@implementation NTKDArgonService

void __36__NTKDArgonService__argonIsComplete__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "infoDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("Argon"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("FileName"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

  }
}

- (BOOL)_argonIsComplete
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  void *v20;
  id v21;
  BOOL v22;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKDArgonService manager](self, "manager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extractor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sourcePath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0;
  objc_msgSend(v8, "contentsOfDirectoryAtPath:error:", v7, &v35);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v35;

  if (v9)
  {
    v24 = v10;
    v25 = v7;
    v26 = v6;
    v27 = v5;
    v28 = v4;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v32 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          objc_msgSend(v16, "pathExtension", v24, v25, v26, v27);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("aea"));

          if (v18)
            objc_msgSend(v3, "addObject:", v16);
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v13);
    }

    objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
    v19 = objc_claimAutoreleasedReturnValue();
    +[NTKFaceBundleManager sharedManager](NTKFaceBundleManager, "sharedManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __36__NTKDArgonService__argonIsComplete__block_invoke;
    v29[3] = &unk_1E6BCE7D8;
    v4 = v28;
    v21 = v28;
    v30 = v21;
    objc_msgSend(v20, "enumerateFaceBundlesOnDevice:withBlock:", v19, v29);

    objc_msgSend(v3, "minusSet:", v21);
    v22 = objc_msgSend(v3, "count") == 0;

    v6 = v26;
    v5 = v27;
    v10 = v24;
    v7 = v25;
  }
  else
  {
    _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[NTKDArgonService _argonIsComplete].cold.1();
    v22 = 1;
  }

  return v22;
}

- (void)queryForNewFaces:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = (void (**)(id, _QWORD))a3;
  _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "Attempting to query new faces…", v7, 2u);
  }

  if (-[NTKDArgonService _argonIsComplete](self, "_argonIsComplete"))
  {
    v4[2](v4, 0);
  }
  else
  {
    -[NTKDArgonService manager](self, "manager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "refreshWithReason:", 3);

    if (v4)
      v4[2](v4, 1);
  }

}

- (NTKArgonManager)manager
{
  return self->_manager;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id buf[2];

  v5 = a3;
  v6 = a4;
  _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1B72A3000, v7, OS_LOG_TYPE_DEFAULT, "Getting XPC connection request for argon service…", (uint8_t *)buf, 2u);
  }

  NTKFaceSupportServerInterface();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setExportedInterface:", v8);

  +[NTKDArgonServiceXPCWrapper sharedXPCWrapper](NTKDArgonServiceXPCWrapper, "sharedXPCWrapper");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setExportedObject:", v9);

  objc_initWeak(buf, v6);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __55__NTKDArgonService_listener_shouldAcceptNewConnection___block_invoke;
  v11[3] = &unk_1E6BCD7F0;
  objc_copyWeak(&v12, buf);
  objc_msgSend(v6, "setInvalidationHandler:", v11);
  objc_msgSend(v6, "resume");
  objc_destroyWeak(&v12);
  objc_destroyWeak(buf);

  return 1;
}

+ (id)sharedService
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__NTKDArgonService_sharedService__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedService_onceToken != -1)
    dispatch_once(&sharedService_onceToken, block);
  return (id)sharedService_service;
}

- (void)argonManagerDidRefresh:(id)a3
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "Argon did refresh", v5, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("NTKArgonManagerDidRefreshNotificationName"), 0);

}

void __33__NTKDArgonService_sharedService__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
  v2 = (void *)sharedService_service;
  sharedService_service = v1;

}

- (id)_init
{
  NTKDArgonService *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NTKFaceSupportNotificationActionEventRecorder *v17;
  NTKFaceSupportNotificationActionEventRecorder *actionRecorder;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  NSObject *v32;
  void *v33;
  NTKDArgonInternalKeyFetcher *v34;
  uint64_t v35;
  NTKArgonLocalKeyDatabase *v36;
  NTKArgonExtractor *v37;
  NTKArgonManager *v38;
  NSObject *v39;
  NSObject *v40;
  uint64_t v41;
  NSObject *v42;
  void *v43;
  NTKArgonCloudKitClient *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  _QWORD v53[4];
  NTKArgonLocalKeyDatabase *v54;
  id v55;
  _QWORD handler[4];
  id v57;
  uint8_t v58[16];
  objc_super v59;
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v59.receiver = self;
  v59.super_class = (Class)NTKDArgonService;
  v2 = -[NTKDArgonService init](&v59, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__addFaceActionTappedFromNotification_, CFSTR("NTKFaceSupportAddFaceNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel__viewFaceActionTappedFromNotification_, CFSTR("NTKFaceSupportViewFaceNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__viewWhatsNewActionTappedFromNotification_, CFSTR("NTKFaceSupportViewWhatsNewNotification"), 0);

    v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.NanoTimeKit.face"));
    objc_msgSend(v52, "registerDefaults:", &unk_1E6CA86E0);
    -[NTKDArgonService setUserDefaults:](v2, "setUserDefaults:", v52);
    -[NTKDArgonService userDefaults](v2, "userDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLForKey:", CFSTR("ResetFaceSupportOnNextLaunch"));

    if (v7)
    {
      _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B72A3000, v8, OS_LOG_TYPE_DEFAULT, "Reset requested.", buf, 2u);
      }

      -[NTKDArgonService userDefaults](v2, "userDefaults");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeObjectForKey:", CFSTR("ResetFaceSupportOnNextLaunch"));

    }
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.nanotimekit.facesupport.service.usernotificationqueue", v10);
    -[NTKDArgonService setUserNotificationQueue:](v2, "setUserNotificationQueue:", v11);

    v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[NTKDArgonService setKeyDescriptorsAwaitingUserNotifications:](v2, "setKeyDescriptorsAwaitingUserNotifications:", v12);

    BSCurrentUserDirectory();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringByAppendingPathComponent:", CFSTR("/Library/NanoTimeKit/FaceSupport/DateDatabase.db"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v61 = v14;
      _os_log_impl(&dword_1B72A3000, v15, OS_LOG_TYPE_DEFAULT, "Push date storage at %@", buf, 0xCu);
    }

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "removeItemAtPath:error:", v14, 0);

    }
    v17 = -[NTKFaceSupportNotificationActionEventRecorder initWithFilePath:]([NTKFaceSupportNotificationActionEventRecorder alloc], "initWithFilePath:", v14);
    actionRecorder = v2->_actionRecorder;
    v2->_actionRecorder = v17;

    BSCurrentUserDirectory();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringByAppendingPathComponent:", CFSTR("/Library/NanoTimeKit/FaceSupport/KeyDatabase"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v61 = v50;
      _os_log_impl(&dword_1B72A3000, v20, OS_LOG_TYPE_DEFAULT, "Key storage at %@", buf, 0xCu);
    }

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "removeItemAtPath:error:", v50, 0);

    }
    NTKFaceSupportArchiveSourceDirectory();
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v61 = v49;
      _os_log_impl(&dword_1B72A3000, v22, OS_LOG_TYPE_DEFAULT, "Extracting from %@", buf, 0xCu);
    }

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "removeItemAtPath:error:", v49, 0);

    }
    NTKArgonExtractorBasePath();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    NTKArgonExtractorBuildVersion();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringByAppendingPathComponent:", v25);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringByAppendingPathComponent:", CFSTR("ExtractionInProgress"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "removeItemAtPath:error:", v51, 0);

    _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v61 = v48;
      v62 = 2112;
      v63 = v51;
      _os_log_impl(&dword_1B72A3000, v27, OS_LOG_TYPE_DEFAULT, "Extracting to %@ - using %@ for in-progress extractions", buf, 0x16u);
    }

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "removeItemAtPath:error:", v48, 0);

    }
    BSCurrentUserDirectory();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringByAppendingPathComponent:", CFSTR("/Library/NanoTimeKit/FaceSupport/Assets"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "removeItemAtPath:error:", v47, 0);

    if (v31)
    {
      _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B72A3000, v32, OS_LOG_TYPE_DEFAULT, "Cleaned up obsolete asset database.", buf, 2u);
      }

    }
    NTKFaceSupportDatabase();
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = -[NTKArgonCloudKitClient initWithCloudKitDatabase:zoneName:]([NTKArgonCloudKitClient alloc], "initWithCloudKitDatabase:zoneName:", v46, CFSTR("FaceSupport"));
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v45);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (_os_feature_enabled_impl())
    {
      v34 = objc_alloc_init(NTKDArgonInternalKeyFetcher);
      objc_msgSend(v33, "arrayByAddingObject:", v34);
      v35 = objc_claimAutoreleasedReturnValue();

      v33 = (void *)v35;
    }
    v36 = -[NTKArgonLocalKeyDatabase initWithKeyStoragePath:]([NTKArgonLocalKeyDatabase alloc], "initWithKeyStoragePath:", v50);
    v37 = -[NTKArgonExtractor initWithSourcePath:inProgressPath:extractionPath:]([NTKArgonExtractor alloc], "initWithSourcePath:inProgressPath:extractionPath:", v49, v51, v48);
    v38 = -[NTKArgonManager initWithKeyDatabase:fetchers:extractor:]([NTKArgonManager alloc], "initWithKeyDatabase:fetchers:extractor:", v36, v33, v37);
    -[NTKArgonManager addArgonManagerObserver:](v38, "addArgonManagerObserver:", v2);
    objc_storeStrong((id *)&v2->_manager, v38);
    -[NTKDArgonService _setupUserNotificationCenter](v2, "_setupUserNotificationCenter");
    if ((_os_feature_enabled_impl() & 1) != 0)
    {
      objc_initWeak((id *)buf, v2);
      if (_init_onceToken_0 != -1)
        dispatch_once(&_init_onceToken_0, &__block_literal_global_130);
      _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v58 = 0;
        _os_log_impl(&dword_1B72A3000, v39, OS_LOG_TYPE_DEFAULT, "Demo: Setting up pings.", v58, 2u);
      }

      v2->_notifyToken = -1;
      v40 = _init_queue;
      v41 = MEMORY[0x1E0C809B0];
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __25__NTKDArgonService__init__block_invoke_133;
      handler[3] = &unk_1E6BCE7B0;
      objc_copyWeak(&v57, (id *)buf);
      notify_register_dispatch("com.apple.nanotimekit.argon.demo.ping", &v2->_notifyToken, v40, handler);
      v2->_pushToken = -1;
      v42 = _init_queue;
      v53[0] = v41;
      v53[1] = 3221225472;
      v53[2] = __25__NTKDArgonService__init__block_invoke_139;
      v53[3] = &unk_1E6BCE850;
      objc_copyWeak(&v55, (id *)buf);
      v54 = v36;
      notify_register_dispatch("com.apple.nanotimekit.argon.demo.push", &v2->_pushToken, v42, v53);

      objc_destroyWeak(&v55);
      objc_destroyWeak(&v57);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      -[NTKDArgonService _checkInForFirstQueryActivity](v2, "_checkInForFirstQueryActivity");
      -[NTKDArgonService _checkInForDailyQueryActivity](v2, "_checkInForDailyQueryActivity");
    }
    objc_msgSend(v52, "addObserver:forKeyPath:options:context:", v2, CFSTR("FaceSupportNotifications"), 0, &NTKDArgonServiceKVOContext);
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addObserver:selector:name:object:", v2, sel__push_userNotification_faceBundleManagerDidUpdate_, CFSTR("NTKFaceBundleManagerDidUpdateBundlesNotificationName"), 0);

  }
  return v2;
}

void __25__NTKDArgonService__init__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.nanotimekit.argon.demo", 0);
  v1 = (void *)_init_queue;
  _init_queue = (uint64_t)v0;

}

void __25__NTKDArgonService__init__block_invoke_133(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  uint8_t v3[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_1B72A3000, v2, OS_LOG_TYPE_DEFAULT, "NTKDArgonService: notify ping!", v3, 2u);
    }

    objc_msgSend(WeakRetained, "queryForNewFaces:", &__block_literal_global_136);
  }

}

void __25__NTKDArgonService__init__block_invoke_134(uint64_t a1, int a2)
{
  NSObject *v3;
  _BOOL4 v4;
  const char *v5;
  uint8_t *v6;
  __int16 v7;
  __int16 v8;

  _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v4)
    {
      v8 = 0;
      v5 = "Demo: Querying for new faces.";
      v6 = (uint8_t *)&v8;
LABEL_6:
      _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
    }
  }
  else if (v4)
  {
    v7 = 0;
    v5 = "Demo: NOT querying for new faces.";
    v6 = (uint8_t *)&v7;
    goto LABEL_6;
  }

}

void __25__NTKDArgonService__init__block_invoke_139(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[16];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "NTKDArgonService: push ping!", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKFaceBundleManager sharedManager](NTKFaceBundleManager, "sharedManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __25__NTKDArgonService__init__block_invoke_142;
    v23[3] = &unk_1E6BCE7D8;
    v8 = v4;
    v24 = v8;
    objc_msgSend(v6, "enumerateFaceBundlesOnDevice:includingLegacy:withBlock:", v5, 1, v23);

    v9 = *(void **)(a1 + 32);
    v21[0] = v7;
    v21[1] = 3221225472;
    v21[2] = __25__NTKDArgonService__init__block_invoke_2;
    v21[3] = &unk_1E6BCE800;
    v10 = v8;
    v22 = v10;
    objc_msgSend(v9, "enumerateKeyDescriptors:", v21);
    if (!objc_msgSend(v10, "count"))
    {
      _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        __25__NTKDArgonService__init__block_invoke_139_cold_1(v11);

    }
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v12 = (void *)objc_msgSend(v10, "copy");
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v26, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v18 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(WeakRetained, "push_postNotificationForKeyDescriptor:completion:");
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v26, 16);
      }
      while (v14);
    }

  }
}

void __25__NTKDArgonService__init__block_invoke_142(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (id)objc_claimAutoreleasedReturnValue();
  +[NTKArgonKeyDescriptor unfilteredKeyDescriptorFromBundle:](NTKArgonKeyDescriptor, "unfilteredKeyDescriptorFromBundle:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v2);

}

uint64_t __25__NTKDArgonService__init__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __25__NTKDArgonService__init__block_invoke_145(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "fileName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v8;
      _os_log_impl(&dword_1B72A3000, v7, OS_LOG_TYPE_DEFAULT, "NTKDArgonService: Successful user notification for %@", (uint8_t *)&v9, 0xCu);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __25__NTKDArgonService__init__block_invoke_145_cold_1();
  }

}

- (void)start
{
  NSObject *v3;
  uint64_t v4;
  dispatch_semaphore_t v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  dispatch_semaphore_t v9;
  _QWORD block[5];
  uint8_t buf[16];

  _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "Argon service is starting…", buf, 2u);
  }

  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__NTKDArgonService_start__block_invoke;
  block[3] = &unk_1E6BCD5F0;
  block[4] = self;
  if (start_onceToken != -1)
    dispatch_once(&start_onceToken, block);
  -[NTKDArgonService push_updatePushConnection](self, "push_updatePushConnection");
  objc_msgSend((id)objc_opt_class(), "cleanUpStaleBundlesEventually");
  v5 = dispatch_semaphore_create(0);
  -[NTKDArgonService manager](self, "manager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __25__NTKDArgonService_start__block_invoke_150;
  v8[3] = &unk_1E6BCD5F0;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "extractKnownKeyDescriptorsIfNeededWithCompletion:", v8);

  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
}

void __25__NTKDArgonService_start__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.nanotimekit.facesupportserver"));
  v3 = (void *)start_listener;
  start_listener = v2;

  objc_msgSend((id)start_listener, "setDelegate:", *(_QWORD *)(a1 + 32));
  objc_msgSend((id)start_listener, "resume");
  _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1B72A3000, v4, OS_LOG_TYPE_DEFAULT, "Started XPC listener for argon service…", v5, 2u);
  }

}

intptr_t __25__NTKDArgonService_start__block_invoke_150(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (void)cleanUpStaleBundlesEventually
{
  id v2;

  if (cleanUpStaleBundlesEventually_token != -1)
    dispatch_once(&cleanUpStaleBundlesEventually_token, &__block_literal_global_151);
  v2 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_BACKGROUND, 0, &__block_literal_global_153);
  dispatch_async((dispatch_queue_t)cleanUpStaleBundlesEventually_fileQueue, v2);

}

void __49__NTKDArgonService_cleanUpStaleBundlesEventually__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.nanotimekit.facesupport.service.files", v2);
  v1 = (void *)cleanUpStaleBundlesEventually_fileQueue;
  cleanUpStaleBundlesEventually_fileQueue = (uint64_t)v0;

}

void __49__NTKDArgonService_cleanUpStaleBundlesEventually__block_invoke_2()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  char v21;
  NSObject *v22;
  NSObject *v23;
  id v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  id v38;
  uint8_t v39[128];
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  NSObject *v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  NTKArgonExtractorBuildVersion();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  NTKArgonExtractorBasePath();
  v0 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  v26 = (void *)v0;
  objc_msgSend(v1, "contentsOfDirectoryAtPath:error:", v0, &v38);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v38;

  if (v2)
  {
    v24 = v3;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v27 = objc_claimAutoreleasedReturnValue();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v25 = v2;
    v4 = v2;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
    if (!v5)
      goto LABEL_19;
    v6 = v5;
    v7 = *(_QWORD *)v35;
    while (1)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v35 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v41 = v9;
          _os_log_impl(&dword_1B72A3000, v10, OS_LOG_TYPE_DEFAULT, "Checking %@…", buf, 0xCu);
        }

        if (objc_msgSend(v9, "isEqualToString:", CFSTR("ExtractionInProgress")))
        {
          _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v41 = v9;
            _os_log_impl(&dword_1B72A3000, v11, OS_LOG_TYPE_DEFAULT, "Skipping scratch directory %@…", buf, 0xCu);
          }
        }
        else
        {
          if ((objc_msgSend(v9, "isEqual:", v28) & 1) != 0)
            continue;
          objc_msgSend(v26, "stringByAppendingPathComponent:", v9);
          v11 = objc_claimAutoreleasedReturnValue();
          _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v41 = v9;
            v42 = 2112;
            v43 = v11;
            _os_log_impl(&dword_1B72A3000, v12, OS_LOG_TYPE_DEFAULT, "Adding stale content for %@ at %@", buf, 0x16u);
          }

          -[NSObject addObject:](v27, "addObject:", v11);
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
      if (!v6)
      {
LABEL_19:

        v32 = 0u;
        v33 = 0u;
        v30 = 0u;
        v31 = 0u;
        v13 = -[NSObject copy](v27, "copy");
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v31;
          do
          {
            v17 = 0;
            do
            {
              if (*(_QWORD *)v31 != v16)
                objc_enumerationMutation(v13);
              v18 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v17);
              _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
              v19 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v41 = v18;
                _os_log_impl(&dword_1B72A3000, v19, OS_LOG_TYPE_DEFAULT, "Removing stale content at %@", buf, 0xCu);
              }

              objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = 0;
              v21 = objc_msgSend(v20, "removeItemAtPath:error:", v18, &v29);
              v22 = v29;

              if ((v21 & 1) == 0)
              {
                _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
                v23 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  v41 = v18;
                  v42 = 2112;
                  v43 = v22;
                  _os_log_error_impl(&dword_1B72A3000, v23, OS_LOG_TYPE_ERROR, "Cleanup of %@ failed - %@", buf, 0x16u);
                }

              }
              ++v17;
            }
            while (v15 != v17);
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
          }
          while (v15);
        }

        v3 = v24;
        v2 = v25;
        goto LABEL_35;
      }
    }
  }
  _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    __49__NTKDArgonService_cleanUpStaleBundlesEventually__block_invoke_2_cold_1();
LABEL_35:

}

- (void)requestResetOnNextLaunch:(id)a3
{
  void (**v4)(id, uint64_t);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t))a3;
  -[NTKDArgonService userDefaults](self, "userDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBool:forKey:", 1, CFSTR("ResetFaceSupportOnNextLaunch"));

  NTKArgonExtractorBuildVersion();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NTKArgonExtractorBasePath();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingPathComponent:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("reset.%@.%@"), v6, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stringByAppendingPathComponent:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v15 = objc_msgSend(v14, "moveItemAtPath:toPath:error:", v8, v13, &v19);
  v16 = v19;

  _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if ((v15 & 1) != 0)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[NTKDArgonService requestResetOnNextLaunch:].cold.1();
  }
  else if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543874;
    v21 = v8;
    v22 = 2114;
    v23 = v13;
    v24 = 2114;
    v25 = v16;
    _os_log_error_impl(&dword_1B72A3000, v18, OS_LOG_TYPE_ERROR, "Reset: Failed to rename %{public}@ to %{public}@: %{public}@", buf, 0x20u);
  }

  v4[2](v4, v15);
}

- (void)knownKeyDescriptors:(id)a3
{
  void *v4;
  void (**v5)(id, void *);
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = (void (**)(id, void *))a3;
  objc_msgSend(v4, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKDArgonService manager](self, "manager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "keyDatabase");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __40__NTKDArgonService_knownKeyDescriptors___block_invoke;
  v11[3] = &unk_1E6BCE800;
  v12 = v6;
  v9 = v6;
  objc_msgSend(v8, "enumerateKeyDescriptors:", v11);

  v10 = (void *)objc_msgSend(v9, "copy");
  v5[2](v5, v10);

}

uint64_t __40__NTKDArgonService_knownKeyDescriptors___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (void)requestCurrentEnvironment:(id)a3
{
  uint64_t v3;
  void (**v4)(id, uint64_t, _QWORD);

  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  if (CFPreferencesGetAppBooleanValue(CFSTR("ArgonSandbox"), CFSTR("com.apple.NanoTimeKit.face"), 0))
    v3 = 2;
  else
    v3 = 1;
  v4[2](v4, v3, 0);

}

- (void)setCurrentEnvironment:(int64_t)a3 completion:(id)a4
{
  const void **v4;
  const void *v5;
  void (**v6)(id, uint64_t, _QWORD);

  v4 = (const void **)MEMORY[0x1E0C9AE50];
  if (a3 != 2)
    v4 = (const void **)MEMORY[0x1E0C9AE40];
  v5 = *v4;
  v6 = (void (**)(id, uint64_t, _QWORD))a4;
  CFPreferencesSetAppValue(CFSTR("ArgonSandbox"), v5, CFSTR("com.apple.NanoTimeKit.face"));
  v6[2](v6, 1, 0);

}

- (void)argonManager:(id)a3 didExtractKeyDescriptor:(id)a4 toPath:(id)a5
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a5;
  _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "fileName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v18 = v9;
    v19 = 2112;
    v20 = v7;
    _os_log_impl(&dword_1B72A3000, v8, OS_LOG_TYPE_DEFAULT, "Argon extracted descriptor %@ to path %@", buf, 0x16u);

  }
  objc_msgSend(v6, "fileName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKFaceSupportUnlockAttemptEventRecorder sharedRecorder](NTKFaceSupportUnlockAttemptEventRecorder, "sharedRecorder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __64__NTKDArgonService_argonManager_didExtractKeyDescriptor_toPath___block_invoke;
  v15[3] = &unk_1E6BCE8C0;
  v16 = v10;
  v12 = v10;
  objc_msgSend(v11, "endRecordingForIdentifier:status:errorCode:completion:", v12, 1, 0, v15);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "postNotificationName:object:", CFSTR("NTKArgonManagerDidUpdateNotificationName"), 0);

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "postNotificationName:object:", CFSTR("NTKArgonManagerDidUpdateNotificationName"), 0);

}

void __64__NTKDArgonService_argonManager_didExtractKeyDescriptor_toPath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if (v4)
  {
    _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __64__NTKDArgonService_argonManager_didExtractKeyDescriptor_toPath___block_invoke_cold_1();

  }
  else
  {
    NTKSubmitFaceSupportMessage(a2);
  }

}

- (void)argonManager:(id)a3 failedToExtractKeyDescriptor:(id)a4 error:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a5;
  objc_msgSend(a4, "fileName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKFaceSupportUnlockAttemptEventRecorder sharedRecorder](NTKFaceSupportUnlockAttemptEventRecorder, "sharedRecorder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "code");

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68__NTKDArgonService_argonManager_failedToExtractKeyDescriptor_error___block_invoke;
  v11[3] = &unk_1E6BCE8C0;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v8, "endRecordingForIdentifier:status:errorCode:completion:", v10, 3, v9, v11);

}

void __68__NTKDArgonService_argonManager_failedToExtractKeyDescriptor_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if (v4)
  {
    _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __64__NTKDArgonService_argonManager_didExtractKeyDescriptor_toPath___block_invoke_cold_1();

  }
  else
  {
    NTKSubmitFaceSupportMessage(a2);
  }

}

- (void)argonManager:(id)a3 didRemoveExtractedArgonFolderAtPath:(id)a4
{
  id v4;
  NSObject *v5;

  v4 = a4;
  _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[NTKDArgonService argonManager:didRemoveExtractedArgonFolderAtPath:].cold.1();

}

void __55__NTKDArgonService_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setExportedObject:", 0);

}

- (void)ingestKeyDescriptor:(id)a3 withMethod:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  uint64_t v21;
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  unint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v29 = v8;
    v30 = 2048;
    v31 = a4;
    _os_log_impl(&dword_1B72A3000, v10, OS_LOG_TYPE_DEFAULT, "Ingesting key descriptor %@ with method %lu…", buf, 0x16u);
  }

  -[NTKDArgonService manager](self, "manager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "keyDatabase");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v13 = objc_msgSend(v12, "addKeyDescriptor:error:", v8, &v27);
  v14 = v27;
  v15 = v14;
  if (v13)
  {
    _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v8;
      _os_log_impl(&dword_1B72A3000, v16, OS_LOG_TYPE_DEFAULT, "Key was added %@", buf, 0xCu);
    }

    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __62__NTKDArgonService_ingestKeyDescriptor_withMethod_completion___block_invoke;
    v25[3] = &unk_1E6BCDF60;
    v26 = v9;
    objc_msgSend(v11, "extractKnownKeyDescriptorsIfNeededWithCompletion:", v25);

  }
  else
  {
    v17 = objc_msgSend(v14, "code");
    _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    if (v17 == 1)
    {
      if (v19)
      {
        *(_DWORD *)buf = 138412290;
        v29 = v8;
        _os_log_impl(&dword_1B72A3000, v18, OS_LOG_TYPE_DEFAULT, "Key was already added %@", buf, 0xCu);
      }
    }
    else
    {
      if (v19)
      {
        *(_DWORD *)buf = 138412546;
        v29 = v8;
        v30 = 2112;
        v31 = (unint64_t)v15;
        _os_log_impl(&dword_1B72A3000, v18, OS_LOG_TYPE_DEFAULT, "Key was NOT added %@ - %@", buf, 0x16u);
      }

      +[NTKFaceSupportUnlockAttemptEventRecorder sharedRecorder](NTKFaceSupportUnlockAttemptEventRecorder, "sharedRecorder");
      v18 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "fileName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v15, "code");
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __62__NTKDArgonService_ingestKeyDescriptor_withMethod_completion___block_invoke_161;
      v23[3] = &unk_1E6BCE8C0;
      v24 = v20;
      v22 = v20;
      -[NSObject endRecordingForIdentifier:status:errorCode:completion:](v18, "endRecordingForIdentifier:status:errorCode:completion:", v22, 4, v21, v23);

    }
    if (v9)
      (*((void (**)(id, BOOL, void *))v9 + 2))(v9, v17 == 1, v15);
  }

}

uint64_t __62__NTKDArgonService_ingestKeyDescriptor_withMethod_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

void __62__NTKDArgonService_ingestKeyDescriptor_withMethod_completion___block_invoke_161(uint64_t a1, void *a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if (v4)
  {
    _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __62__NTKDArgonService_ingestKeyDescriptor_withMethod_completion___block_invoke_161_cold_1();

  }
  else
  {
    NTKSubmitFaceSupportMessage(a2);
  }

}

- (void)_setupUserNotificationCenter
{
  UNUserNotificationCenter *v3;
  UNUserNotificationCenter *userNotificationCenter;

  v3 = (UNUserNotificationCenter *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEC7A0]), "initWithBundleIdentifier:", CFSTR("com.apple.Bridge"));
  userNotificationCenter = self->_userNotificationCenter;
  self->_userNotificationCenter = v3;

}

- (void)_checkInForFirstQueryActivity
{
  NSObject *v3;
  void *v4;
  const char *v5;
  void *v6;
  id v7;
  _QWORD handler[4];
  __CFString *v9;
  id v10;
  id v11;
  id buf[2];

  _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "Checking in for first-run activity…", (uint8_t *)buf, 2u);
  }

  -[NTKDArgonService _criteriaForFirstQueryActivity](self, "_criteriaForFirstQueryActivity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(buf, self);
  v5 = (const char *)objc_msgSend(CFSTR("com.apple.nanotimekit.facesupport.launchQuery"), "UTF8String");
  v6 = (void *)*MEMORY[0x1E0C80748];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __49__NTKDArgonService__checkInForFirstQueryActivity__block_invoke;
  handler[3] = &unk_1E6BCE8E8;
  v9 = CFSTR("com.apple.nanotimekit.facesupport.launchQuery");
  v7 = v4;
  v10 = v7;
  objc_copyWeak(&v11, buf);
  xpc_activity_register(v5, v6, handler);
  objc_destroyWeak(&v11);

  objc_destroyWeak(buf);
}

void __49__NTKDArgonService__checkInForFirstQueryActivity__block_invoke(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  void *v4;
  xpc_activity_state_t state;
  NSObject *v6;
  uint64_t v7;
  xpc_object_t v8;
  NSObject *v9;
  uint64_t v10;
  id WeakRetained;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1BCCA7FA8]();
  state = xpc_activity_get_state(v3);
  if (state == 2)
  {
    _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v15 = 138543362;
      v16 = v10;
      _os_log_impl(&dword_1B72A3000, v9, OS_LOG_TYPE_DEFAULT, "Running XPC activity %{public}@", (uint8_t *)&v15, 0xCu);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "_handleFirstQuery");
    if (!xpc_activity_set_state(v3, 5))
    {
      _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        __49__NTKDArgonService__checkInForFirstQueryActivity__block_invoke_cold_1();

    }
  }
  else if (!state)
  {
    _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v15 = 138543362;
      v16 = v7;
      _os_log_impl(&dword_1B72A3000, v6, OS_LOG_TYPE_DEFAULT, "Checking in for XPC activity %{public}@", (uint8_t *)&v15, 0xCu);
    }

    v8 = xpc_activity_copy_criteria(v3);
    if (v8)
    {

    }
    else
    {
      _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = *(_QWORD *)(a1 + 32);
        v15 = 138543362;
        v16 = v14;
        _os_log_impl(&dword_1B72A3000, v13, OS_LOG_TYPE_DEFAULT, "Updating XPC activity criteria for %{public}@", (uint8_t *)&v15, 0xCu);
      }

      xpc_activity_set_criteria(v3, *(xpc_object_t *)(a1 + 40));
    }
  }
  objc_autoreleasePoolPop(v4);

}

- (void)_checkInForDailyQueryActivity
{
  NSObject *v3;
  void *v4;
  const char *v5;
  void *v6;
  id v7;
  _QWORD handler[4];
  __CFString *v9;
  id v10;
  id v11;
  id buf[2];

  _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "Checking in for first-daily activity…", (uint8_t *)buf, 2u);
  }

  -[NTKDArgonService _criteriaForDailyRefreshActiviy](self, "_criteriaForDailyRefreshActiviy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(buf, self);
  v5 = (const char *)objc_msgSend(CFSTR("com.apple.nanotimekit.facesupport.dailyQuery"), "UTF8String");
  v6 = (void *)*MEMORY[0x1E0C80748];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __49__NTKDArgonService__checkInForDailyQueryActivity__block_invoke;
  handler[3] = &unk_1E6BCE8E8;
  v9 = CFSTR("com.apple.nanotimekit.facesupport.dailyQuery");
  v7 = v4;
  v10 = v7;
  objc_copyWeak(&v11, buf);
  xpc_activity_register(v5, v6, handler);
  objc_destroyWeak(&v11);

  objc_destroyWeak(buf);
}

void __49__NTKDArgonService__checkInForDailyQueryActivity__block_invoke(id *a1, void *a2)
{
  _xpc_activity_s *v3;
  void *v4;
  xpc_activity_state_t state;
  NSObject *v6;
  id v7;
  xpc_object_t v8;
  NSObject *v9;
  id v10;
  id WeakRetained;
  NSObject *v12;
  NSObject *v13;
  id v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1BCCA7FA8]();
  state = xpc_activity_get_state(v3);
  if (state == 2)
  {
    _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = a1[4];
      v15 = 138543362;
      v16 = v10;
      _os_log_impl(&dword_1B72A3000, v9, OS_LOG_TYPE_DEFAULT, "Running XPC daily activity %{public}@", (uint8_t *)&v15, 0xCu);
    }

    WeakRetained = objc_loadWeakRetained(a1 + 6);
    if (objc_msgSend(WeakRetained, "_handleDailyQuery"))
    {
      if (!xpc_activity_set_state(v3, 5))
      {
        _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          __49__NTKDArgonService__checkInForDailyQueryActivity__block_invoke_cold_1();

      }
    }
    else
    {
      xpc_activity_unregister((const char *)objc_msgSend(objc_retainAutorelease(a1[4]), "UTF8String"));
    }

  }
  else if (!state)
  {
    _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = a1[4];
      v15 = 138543362;
      v16 = v7;
      _os_log_impl(&dword_1B72A3000, v6, OS_LOG_TYPE_DEFAULT, "Checking in for XPC daily activity %{public}@", (uint8_t *)&v15, 0xCu);
    }

    v8 = xpc_activity_copy_criteria(v3);
    if (v8)
    {

    }
    else
    {
      _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = a1[4];
        v15 = 138543362;
        v16 = v14;
        _os_log_impl(&dword_1B72A3000, v13, OS_LOG_TYPE_DEFAULT, "Updating XPC daily activity criteria for %{public}@", (uint8_t *)&v15, 0xCu);
      }

      xpc_activity_set_criteria(v3, a1[5]);
    }
  }
  objc_autoreleasePoolPop(v4);

}

- (id)_baseCriteriaForArgonActivities
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x1E0C808B8], 1);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x1E0C808A0], 1);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x1E0C808D0], 1);
  xpc_dictionary_set_int64(v2, (const char *)*MEMORY[0x1E0C80790], *MEMORY[0x1E0C807B0]);
  xpc_dictionary_set_int64(v2, (const char *)*MEMORY[0x1E0C80890], 900);
  xpc_dictionary_set_int64(v2, (const char *)*MEMORY[0x1E0C80818], 10240);
  xpc_dictionary_set_int64(v2, (const char *)*MEMORY[0x1E0C80788], *MEMORY[0x1E0C807C8]);
  xpc_dictionary_set_string(v2, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80888]);
  return v2;
}

- (id)_criteriaForFirstQueryActivity
{
  void *v2;

  -[NTKDArgonService _baseCriteriaForArgonActivities](self, "_baseCriteriaForArgonActivities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x1E0C80898], 0);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x1E0C80738], 1);
  return v2;
}

- (id)_criteriaForDailyRefreshActiviy
{
  void *v2;

  -[NTKDArgonService _baseCriteriaForArgonActivities](self, "_baseCriteriaForArgonActivities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x1E0C807A8], *MEMORY[0x1E0C807B8] != 0);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x1E0C80898], 1);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x1E0C80738], 0);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x1E0C808E0], 1);
  return v2;
}

- (void)_handleFirstQuery
{
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];
  uint8_t buf[16];

  _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "Performing first Argon download…", buf, 2u);
  }

  if (-[NTKDArgonService _argonIsComplete](self, "_argonIsComplete"))
  {
    _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1B72A3000, v4, OS_LOG_TYPE_DEFAULT, "Skipping first Argon download - already complete!", v5, 2u);
    }
  }
  else
  {
    -[NTKDArgonService manager](self, "manager");
    v4 = objc_claimAutoreleasedReturnValue();
    -[NSObject refreshWithReason:](v4, "refreshWithReason:", 1);
  }

}

- (BOOL)_handleDailyQuery
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v8[16];
  uint8_t v9[16];
  uint8_t buf[16];

  _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "Performing periodic Argon download…", buf, 2u);
  }

  v4 = -[NTKDArgonService _argonIsComplete](self, "_argonIsComplete");
  if (v4)
  {
    _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "Skipping Argon download - it's done!", v9, 2u);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
    v5 = objc_claimAutoreleasedReturnValue();
    if ((-[NSObject isPaired](v5, "isPaired") & 1) != 0)
    {
      -[NTKDArgonService manager](self, "manager");
      v6 = objc_claimAutoreleasedReturnValue();
      -[NSObject refreshWithReason:](v6, "refreshWithReason:", 2);
    }
    else
    {
      _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_1B72A3000, v6, OS_LOG_TYPE_DEFAULT, "Skipping Argon download - no device paired!", v8, 2u);
      }
    }

  }
  return !v4;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  uint64_t v9;
  uint64_t v10;

  if (a6 == &NTKDArgonServiceKVOContext)
  {
    -[NTKDArgonService push_updatePushConnection](self, "push_updatePushConnection", a3, a4, a5);
  }
  else
  {
    v9 = v6;
    v10 = v7;
    v8.receiver = self;
    v8.super_class = (Class)NTKDArgonService;
    -[NTKDArgonService observeValueForKeyPath:ofObject:change:context:](&v8, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)_addFaceActionTappedFromNotification:(id)a3
{
  -[NTKDArgonService _recordEventOfNotification:action:](self, "_recordEventOfNotification:action:", a3, 1);
}

- (void)_viewFaceActionTappedFromNotification:(id)a3
{
  -[NTKDArgonService _recordEventOfNotification:action:](self, "_recordEventOfNotification:action:", a3, 2);
}

- (void)_viewWhatsNewActionTappedFromNotification:(id)a3
{
  -[NTKDArgonService _recordEventOfNotification:action:](self, "_recordEventOfNotification:action:", a3, 3);
}

- (void)_recordEventOfNotification:(id)a3 action:(int64_t)a4
{
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  _QWORD v16[4];
  id v17;

  objc_msgSend(a3, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
    v7 = objc_claimAutoreleasedReturnValue();
    +[NTKFaceBundleManager sharedManager](NTKFaceBundleManager, "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "faceBundleForBundleIdentifier:onDevice:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v10 = objc_claimAutoreleasedReturnValue();
      +[NTKArgonKeyDescriptor unfilteredKeyDescriptorFromBundle:](NTKArgonKeyDescriptor, "unfilteredKeyDescriptorFromBundle:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        objc_msgSend(v11, "fileName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NTKDArgonService actionRecorder](self, "actionRecorder");
        v14 = objc_claimAutoreleasedReturnValue();
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __54__NTKDArgonService__recordEventOfNotification_action___block_invoke;
        v16[3] = &unk_1E6BCE910;
        v17 = v13;
        v15 = v13;
        -[NSObject endPresentationForIdentifier:withAction:completion:](v14, "endPresentationForIdentifier:withAction:completion:", v15, a4, v16);

      }
      else
      {
        _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          -[NTKDArgonService _recordEventOfNotification:action:].cold.2();
      }

    }
    else
    {
      _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[NTKDArgonService _recordEventOfNotification:action:].cold.1();
    }

  }
  else
  {
    _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[NTKDArgonService _recordEventOfNotification:action:].cold.3();
  }

}

void __54__NTKDArgonService__recordEventOfNotification_action___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if (v4)
  {
    _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __54__NTKDArgonService__recordEventOfNotification_action___block_invoke_cold_1();

  }
  else
  {
    NTKSubmitFaceSupportMessage(a2);
  }

}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  NSObject *v4;
  uint8_t v5[16];

  _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1B72A3000, v4, OS_LOG_TYPE_DEFAULT, "Argon received a public token.", v5, 2u);
  }

}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NTKArgonKeyDescriptor *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v22;
  _QWORD v23[4];
  NSObject *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  NSObject *v29;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v22 = a3;
  v5 = a4;
  _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B72A3000, v6, OS_LOG_TYPE_DEFAULT, "Argon recieved a push message.", buf, 2u);
  }

  objc_msgSend(v5, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("d"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = [NTKArgonKeyDescriptor alloc];
    -[NTKArgonKeyDescriptor argon_initWithJSONRepresentation:](v9, "argon_initWithJSONRepresentation:", v8);
    v10 = objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[NSObject fileName](v10, "fileName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[NTKFaceSupportUnlockAttemptEventRecorder sharedRecorder](NTKFaceSupportUnlockAttemptEventRecorder, "sharedRecorder");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __57__NTKDArgonService_connection_didReceiveIncomingMessage___block_invoke;
      v28[3] = &unk_1E6BCE728;
      v13 = v11;
      v29 = v13;
      objc_msgSend(v12, "beginRecordingForIdentifier:method:completion:", v13, 1, v28);

      +[NTKFaceSupportNotificationPresentationEventRecorder sharedRecorder](NTKFaceSupportNotificationPresentationEventRecorder, "sharedRecorder");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject fileName](v10, "fileName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", CFSTR("t"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "doubleValue");
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __57__NTKDArgonService_connection_didReceiveIncomingMessage___block_invoke_182;
      v26[3] = &unk_1E6BCE728;
      v27 = v15;
      v18 = v15;
      objc_msgSend(v14, "beginPresentationForIdentifier:pushDate:completion:", v18, v17, v26);

      _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        -[NSObject fileName](v10, "fileName");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v31 = v20;
        _os_log_impl(&dword_1B72A3000, v19, OS_LOG_TYPE_DEFAULT, "Argon found a key descriptor in message named %@.", buf, 0xCu);

      }
      objc_initWeak((id *)buf, self);
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __57__NTKDArgonService_connection_didReceiveIncomingMessage___block_invoke_183;
      v23[3] = &unk_1E6BCE938;
      v24 = v10;
      objc_copyWeak(&v25, (id *)buf);
      -[NTKDArgonService ingestKeyDescriptor:withMethod:completion:](self, "ingestKeyDescriptor:withMethod:completion:", v24, 1, v23);
      objc_destroyWeak(&v25);

      objc_destroyWeak((id *)buf);
    }
    else
    {
      _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[NTKDArgonService connection:didReceiveIncomingMessage:].cold.1();
    }

  }
  else
  {
    _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[NTKDArgonService connection:didReceiveIncomingMessage:].cold.2();
  }

}

void __57__NTKDArgonService_connection_didReceiveIncomingMessage___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __57__NTKDArgonService_connection_didReceiveIncomingMessage___block_invoke_cold_1();

  }
}

void __57__NTKDArgonService_connection_didReceiveIncomingMessage___block_invoke_182(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __57__NTKDArgonService_connection_didReceiveIncomingMessage___block_invoke_182_cold_1();

}

void __57__NTKDArgonService_connection_didReceiveIncomingMessage___block_invoke_183(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *WeakRetained;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  v6 = objc_claimAutoreleasedReturnValue();
  WeakRetained = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "fileName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v13 = v8;
      _os_log_impl(&dword_1B72A3000, WeakRetained, OS_LOG_TYPE_DEFAULT, "Argon ingested key descriptor in message named %@.", buf, 0xCu);

    }
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v9 = *(void **)(a1 + 32);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __57__NTKDArgonService_connection_didReceiveIncomingMessage___block_invoke_184;
    v10[3] = &unk_1E6BCE828;
    v11 = v9;
    -[NSObject push_postNotificationForKeyDescriptor:completion:](WeakRetained, "push_postNotificationForKeyDescriptor:completion:", v11, v10);

  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __57__NTKDArgonService_connection_didReceiveIncomingMessage___block_invoke_183_cold_1();
  }

}

void __57__NTKDArgonService_connection_didReceiveIncomingMessage___block_invoke_184(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "fileName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v8;
      _os_log_impl(&dword_1B72A3000, v7, OS_LOG_TYPE_DEFAULT, "Argon displayed user notification for %@.", (uint8_t *)&v9, 0xCu);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __57__NTKDArgonService_connection_didReceiveIncomingMessage___block_invoke_184_cold_1();
  }

}

- (void)_push_userNotification_faceBundleManagerDidUpdate:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[NTKDArgonService userNotificationQueue](self, "userNotificationQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__NTKDArgonService__push_userNotification_faceBundleManagerDidUpdate___block_invoke;
  block[3] = &unk_1E6BCD5F0;
  block[4] = self;
  dispatch_async(v4, block);

}

uint64_t __70__NTKDArgonService__push_userNotification_faceBundleManagerDidUpdate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_push_userNotification_processWaitingNotifications");
}

- (void)_queue_push_userNotification_processWaitingNotifications
{
  NTKDArgonService *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  __int128 v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void (**v20)(void *, _QWORD, id);
  void *v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  id v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  void *v43;
  NSObject *v44;
  void *v45;
  __int128 v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  id obj;
  NTKDArgonService *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _QWORD v63[4];
  id v64;
  void *v65;
  id v66;
  NTKDArgonService *v67;
  id v68;
  void (**v69)(void *, _QWORD, id);
  uint64_t v70;
  _QWORD v71[4];
  id v72;
  _QWORD aBlock[4];
  id v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _QWORD v79[5];
  id v80;
  uint8_t v81[128];
  uint8_t buf[4];
  void *v83;
  __int16 v84;
  void *v85;
  _BYTE v86[128];
  uint64_t v87;

  v2 = self;
  v87 = *MEMORY[0x1E0C80C00];
  -[NTKDArgonService userNotificationQueue](self, "userNotificationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[NTKDArgonService keyDescriptorsAwaitingUserNotifications](v2, "keyDescriptorsAwaitingUserNotifications");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B72A3000, v6, OS_LOG_TYPE_DEFAULT, "Checking key descriptors received via push to see if they have appeared on disk yet to permit user notifications…", buf, 2u);
    }

    v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    +[NTKFaceBundleManager sharedManager](NTKFaceBundleManager, "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
    v9 = objc_claimAutoreleasedReturnValue();
    v79[0] = MEMORY[0x1E0C809B0];
    v79[1] = 3221225472;
    v79[2] = __76__NTKDArgonService__queue_push_userNotification_processWaitingNotifications__block_invoke;
    v79[3] = &unk_1E6BCE960;
    v79[4] = v2;
    v10 = v7;
    v80 = v10;
    v47 = v8;
    v54 = (void *)v9;
    objc_msgSend(v8, "enumerateFaceBundlesOnDevice:includingLegacy:withBlock:", v9, 1, v79);
    v77 = 0u;
    v78 = 0u;
    v75 = 0u;
    v76 = 0u;
    v11 = v10;
    v53 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v75, v86, 16);
    if (v53)
    {
      v52 = *(_QWORD *)v76;
      v48 = *MEMORY[0x1E0CB2FE0];
      v49 = *MEMORY[0x1E0CB28A8];
      *(_QWORD *)&v12 = 138543618;
      v46 = v12;
      obj = v11;
      v51 = v2;
      while (2)
      {
        for (i = 0; i != v53; ++i)
        {
          if (*(_QWORD *)v76 != v52)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_msgSend(v14, "faceClass", v46));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          +[NTKArgonKeyDescriptor unfilteredKeyDescriptorFromBundle:](NTKArgonKeyDescriptor, "unfilteredKeyDescriptorFromBundle:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[NTKDArgonService keyDescriptorsAwaitingUserNotifications](v2, "keyDescriptorsAwaitingUserNotifications");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKey:", v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          aBlock[0] = MEMORY[0x1E0C809B0];
          aBlock[1] = 3221225472;
          aBlock[2] = __76__NTKDArgonService__queue_push_userNotification_processWaitingNotifications__block_invoke_2;
          aBlock[3] = &unk_1E6BCE828;
          v19 = v18;
          v74 = v19;
          v20 = (void (**)(void *, _QWORD, id))_Block_copy(aBlock);
          -[NTKDArgonService keyDescriptorsAwaitingUserNotifications](v2, "keyDescriptorsAwaitingUserNotifications");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "removeObjectForKey:", v16);

          objc_msgSend(v14, "defaultFaceForDevice:", v54);
          v22 = objc_claimAutoreleasedReturnValue();
          _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = v23;
          v57 = (void *)v22;
          v58 = v19;
          if (v22)
          {
            v56 = v15;
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v16, "fileName");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v83 = v25;
              _os_log_impl(&dword_1B72A3000, v24, OS_LOG_TYPE_DEFAULT, "Attempting to schedule user notification for %{public}@", buf, 0xCu);

            }
            objc_msgSend(v16, "fileName");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[NTKDArgonService userNotificationCenter](v2, "userNotificationCenter");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            -[NTKDArgonService userDefaults](v2, "userDefaults");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v55, "BOOLForKey:", CFSTR("FaceSupportNotifications")))
              v28 = 0;
            else
              v28 = 2;
            objc_msgSend(v27, "notificationSettings");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = v28 | (objc_msgSend(v29, "authorizationStatus") == 1);
            if (v30)
            {
              +[NTKFaceSupportNotificationPresentationEventRecorder sharedRecorder](NTKFaceSupportNotificationPresentationEventRecorder, "sharedRecorder");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v71[0] = MEMORY[0x1E0C809B0];
              v71[1] = 3221225472;
              v71[2] = __76__NTKDArgonService__queue_push_userNotification_processWaitingNotifications__block_invoke_193;
              v71[3] = &unk_1E6BCE988;
              v72 = v26;
              v32 = v26;
              objc_msgSend(v31, "endPresentationForIdentifier:status:artworkUsed:errorCode:optOutStatus:completion:", v32, 3, 3, 0, v30, v71);

              objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v49, 3072, &unk_1E6CA8730);
              v33 = (id)objc_claimAutoreleasedReturnValue();

              v20[2](v20, 0, v33);
              v34 = 1;
            }
            else
            {
              v63[0] = MEMORY[0x1E0C809B0];
              v63[1] = 3221225472;
              v63[2] = __76__NTKDArgonService__queue_push_userNotification_processWaitingNotifications__block_invoke_200;
              v63[3] = &unk_1E6BCE9D8;
              v64 = v16;
              v65 = v14;
              v66 = v26;
              v70 = 0;
              v69 = v20;
              v67 = v2;
              v68 = v27;
              v33 = v26;
              objc_msgSend(v14, "argon_generateNotificationContentWithCompletion:", v63);

              v34 = 0;
            }

            v2 = v51;
            v15 = v56;
          }
          else
          {
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v16, "fileName");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend((id)objc_opt_class(), "identifier");
              v36 = v15;
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v46;
              v83 = v35;
              v84 = 2114;
              v85 = v37;
              _os_log_error_impl(&dword_1B72A3000, v24, OS_LOG_TYPE_ERROR, "Couldn't find a face for descriptor %{public}@ - bundle %{public}@", buf, 0x16u);

              v15 = v36;
            }

            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v48, 3, &unk_1E6CA8708);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v20[2](v20, 0, v27);
            v34 = 1;
          }

          if (v34)
          {
            v11 = obj;
            v38 = obj;
            goto LABEL_36;
          }
        }
        v11 = obj;
        v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v86, 16);
        if (v53)
          continue;
        break;
      }
    }

    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    -[NTKDArgonService keyDescriptorsAwaitingUserNotifications](v2, "keyDescriptorsAwaitingUserNotifications");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v59, v81, 16);
    if (v39)
    {
      v40 = v39;
      v41 = *(_QWORD *)v60;
      do
      {
        for (j = 0; j != v40; ++j)
        {
          if (*(_QWORD *)v60 != v41)
            objc_enumerationMutation(v38);
          v43 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * j);
          _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v43, "fileName");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v83 = v45;
            _os_log_impl(&dword_1B72A3000, v44, OS_LOG_TYPE_DEFAULT, "Key descriptor %{public}@ available for user notification, but still waiting for bundle extraction.", buf, 0xCu);

          }
        }
        v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v59, v81, 16);
      }
      while (v40);
    }
LABEL_36:

  }
}

void __76__NTKDArgonService__queue_push_userNotification_processWaitingNotifications__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_msgSend(v7, "faceClass"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKArgonKeyDescriptor unfilteredKeyDescriptorFromBundle:](NTKArgonKeyDescriptor, "unfilteredKeyDescriptorFromBundle:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "keyDescriptorsAwaitingUserNotifications");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
  }

}

void __76__NTKDArgonService__queue_push_userNotification_processWaitingNotifications__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = *(id *)(a1 + 32);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9) + 16))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

void __76__NTKDArgonService__queue_push_userNotification_processWaitingNotifications__block_invoke_193(uint64_t a1, void *a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if (v4)
  {
    _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __76__NTKDArgonService__queue_push_userNotification_processWaitingNotifications__block_invoke_193_cold_1();

  }
  else
  {
    NTKSubmitFaceSupportMessage(a2);
  }

}

void __76__NTKDArgonService__queue_push_userNotification_processWaitingNotifications__block_invoke_200(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v26 = v8;
      v27 = 2114;
      v28 = v7;
      _os_log_impl(&dword_1B72A3000, v11, OS_LOG_TYPE_DEFAULT, "Notification content prepared. Request identifier: %{public}@ - Content %{public}@", buf, 0x16u);
    }

    v12 = *(void **)(a1 + 56);
    v13 = *(_QWORD *)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 32), "fileName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(a1 + 40);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __76__NTKDArgonService__queue_push_userNotification_processWaitingNotifications__block_invoke_202;
    v21[3] = &unk_1E6BCE9B0;
    v22 = *(id *)(a1 + 72);
    objc_msgSend(v12, "_push_sendNotificationForContent:requestIdentifier:toNotificationCenter:identifier:bundle:completion:", v7, v8, v13, v14, v15, v21);

  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __76__NTKDArgonService__queue_push_userNotification_processWaitingNotifications__block_invoke_200_cold_1();

    v16 = objc_msgSend(0, "argon_artworkUsed");
    +[NTKFaceSupportNotificationPresentationEventRecorder sharedRecorder](NTKFaceSupportNotificationPresentationEventRecorder, "sharedRecorder");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(a1 + 48);
    v19 = objc_msgSend(v9, "code");
    v20 = *(_QWORD *)(a1 + 80);
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __76__NTKDArgonService__queue_push_userNotification_processWaitingNotifications__block_invoke_201;
    v23[3] = &unk_1E6BCE988;
    v24 = *(id *)(a1 + 48);
    objc_msgSend(v17, "endPresentationForIdentifier:status:artworkUsed:errorCode:optOutStatus:completion:", v18, 4, v16, v19, v20, v23);

    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }

}

void __76__NTKDArgonService__queue_push_userNotification_processWaitingNotifications__block_invoke_201(uint64_t a1, void *a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if (v4)
  {
    _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __76__NTKDArgonService__queue_push_userNotification_processWaitingNotifications__block_invoke_193_cold_1();

  }
  else
  {
    NTKSubmitFaceSupportMessage(a2);
  }

}

uint64_t __76__NTKDArgonService__queue_push_userNotification_processWaitingNotifications__block_invoke_202(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)push_postNotificationForKeyDescriptor:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  NTKDArgonService *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[NTKDArgonService userNotificationQueue](self, "userNotificationQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__NTKDArgonService_push_postNotificationForKeyDescriptor_completion___block_invoke;
  block[3] = &unk_1E6BCEA00;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __69__NTKDArgonService_push_postNotificationForKeyDescriptor_completion___block_invoke(uint64_t a1)
{
  int v2;
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(MEMORY[0x1E0DC3470], "isRunningInStoreDemoMode");
  _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "fileName");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v5;
      _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "Skipping user notification for %{public}@ - store demo mode", (uint8_t *)&v15, 0xCu);

    }
    v6 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3072, &unk_1E6CA8758);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v7);
  }
  else
  {
    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "fileName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v8;
      _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "Will attempt user notification for %{public}@ shortly", (uint8_t *)&v15, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 40), "keyDescriptorsAwaitingUserNotifications");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", *(_QWORD *)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_msgSend(*(id *)(a1 + 40), "keyDescriptorsAwaitingUserNotifications");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", v11, *(_QWORD *)(a1 + 32));

    }
    objc_msgSend(*(id *)(a1 + 40), "keyDescriptorsAwaitingUserNotifications");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", *(_QWORD *)(a1 + 32));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = _Block_copy(*(const void **)(a1 + 48));
    objc_msgSend(v13, "addObject:", v14);

    objc_msgSend(*(id *)(a1 + 40), "_queue_push_userNotification_processWaitingNotifications");
  }

}

- (void)push_updatePushConnection
{
  NTKDArgonService *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int AppBooleanValue;
  id *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  char v16;
  NSObject *v17;
  const char *v18;
  char v19;
  _QWORD block[5];
  uint8_t buf[4];
  const __CFString *v22;
  __int16 v23;
  void *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__NTKDArgonService_push_updatePushConnection__block_invoke;
  block[3] = &unk_1E6BCD5F0;
  block[4] = v2;
  if (push_updatePushConnection_onceToken != -1)
    dispatch_once(&push_updatePushConnection_onceToken, block);
  -[NTKDArgonService pushQueue](v2, "pushQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    v3 = dispatch_queue_create("com.apple.nanotimekit.facesupport.service.push", v4);

    -[NTKDArgonService setPushQueue:](v2, "setPushQueue:", v3);
  }
  -[NTKDArgonService pushConnection](v2, "pushConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("ArgonSandbox"), CFSTR("com.apple.NanoTimeKit.face"), 0);
    v7 = (id *)MEMORY[0x1E0CFE130];
    if (AppBooleanValue)
      v7 = (id *)MEMORY[0x1E0CFE128];
    v8 = *v7;
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFE148]), "initWithEnvironmentName:namedDelegatePort:queue:", v8, CFSTR("com.apple.aps.nanotimekit.facesupport"), v3);
    objc_msgSend(v5, "setDelegate:", v2);
    -[NTKDArgonService setPushConnection:](v2, "setPushConnection:", v5);

  }
  +[NTKArgonChannelID currentChannelID](NTKArgonChannelID, "currentChannelID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD22E8]), "initWithChannelID:", v9);
  v25[0] = CFSTR("com.apple.aps.nanotimekit.facesupport");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabledTopics:ignoredTopics:", v11, MEMORY[0x1E0C9AA60]);

  objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isPaired"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("F405E6BC-C306-4B65-B1D7-439AB5A152CC"));
    v14 = objc_msgSend(v12, "supportsCapability:", v13);

  }
  else
  {
    v14 = 0;
  }
  -[NTKDArgonService userDefaults](v2, "userDefaults");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "BOOLForKey:", CFSTR("FaceSupportNotifications"));
  if (v14)
  {
    objc_msgSend(v5, "subscribeToChannel:forTopic:", v10, CFSTR("com.apple.aps.nanotimekit.facesupport"));
    _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v22 = CFSTR("com.apple.aps.nanotimekit.facesupport");
      v23 = 2114;
      v24 = v10;
      v18 = "Started push listener for Argon service on topic %{public}@ and channel %{public}@…";
LABEL_20:
      _os_log_impl(&dword_1B72A3000, v17, OS_LOG_TYPE_DEFAULT, v18, buf, 0x16u);
    }
  }
  else
  {
    v19 = v16;
    objc_msgSend(v5, "unsubscribeFromChannel:forTopic:", v10, CFSTR("com.apple.aps.nanotimekit.facesupport"));
    if ((v19 & 1) != 0)
    {
      _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v22 = CFSTR("com.apple.aps.nanotimekit.facesupport");
        v23 = 2114;
        v24 = v10;
        v18 = "Pausing push listener for Argon service on topic %{public}@ and channel %{public}@ - unpaired";
        goto LABEL_20;
      }
    }
    else
    {
      _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v22 = CFSTR("com.apple.aps.nanotimekit.facesupport");
        v23 = 2114;
        v24 = v10;
        v18 = "Pausing push listener for Argon service on topic %{public}@ and channel %{public}@ - opt out";
        goto LABEL_20;
      }
    }
  }

  objc_sync_exit(v2);
}

void __45__NTKDArgonService_push_updatePushConnection__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_push_deviceChanged_, *MEMORY[0x1E0C93E48], 0);

}

- (void)_push_sendNotificationForContent:(id)a3 requestIdentifier:(id)a4 toNotificationCenter:(id)a5 identifier:(id)a6 bundle:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  NTKDArgonService *v38;
  id v39;

  v14 = a4;
  v15 = a6;
  v16 = a8;
  v17 = a7;
  v18 = a5;
  v19 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend((id)objc_opt_class(), "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "userInfo");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (!v21)
    v21 = (void *)MEMORY[0x1E0C9AA70];
  v23 = (void *)objc_msgSend(v21, "mutableCopy");

  objc_msgSend(v23, "setObject:forKey:", v20, CFSTR("bid"));
  v24 = (void *)objc_opt_class();

  v25 = objc_msgSend(v24, "argon_defaultNotificationAction");
  if (v25)
  {
    if (v25 != 1)
      goto LABEL_8;
    v26 = CFSTR("whatsnew");
  }
  else
  {
    v26 = CFSTR("detail");
  }
  objc_msgSend(v23, "setObject:forKey:", v26, CFSTR("defaultaction"));
LABEL_8:
  v27 = (void *)objc_msgSend(v23, "copy");
  objc_msgSend(v19, "setUserInfo:", v27);

  objc_msgSend(MEMORY[0x1E0CEC790], "triggerWithTimeInterval:repeats:", 0, 1.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      -[NTKDArgonService _push_sendNotificationForContent:requestIdentifier:toNotificationCenter:identifier:bundle:completion:].cold.1(v29);

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "UUIDString");
    v14 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0CEC740], "requestWithIdentifier:content:trigger:", v14, v19, v28);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __121__NTKDArgonService__push_sendNotificationForContent_requestIdentifier_toNotificationCenter_identifier_bundle_completion___block_invoke;
  v35[3] = &unk_1E6BCEA28;
  v36 = v15;
  v37 = v19;
  v38 = self;
  v39 = v16;
  v32 = v16;
  v33 = v19;
  v34 = v15;
  objc_msgSend(v18, "addNotificationRequest:withCompletionHandler:", v31, v35);

}

void __121__NTKDArgonService__push_sendNotificationForContent_requestIdentifier_toNotificationCenter_identifier_bundle_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  char v13;
  id v14;
  NSObject *v15;
  void *v16;
  char v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  id v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __121__NTKDArgonService__push_sendNotificationForContent_requestIdentifier_toNotificationCenter_identifier_bundle_completion___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v42 = v6;
    _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "Scheduled user notification for %@", buf, 0xCu);
  }
  v30 = v3;

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v29 = a1;
  objc_msgSend(*(id *)(a1 + 40), "attachments");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v38 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "URL");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = 0;
        v13 = NTKMarkFileAtURLAsPurgeable(v12, &v36);
        v14 = v36;
        if ((v13 & 1) == 0)
        {
          _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v42 = v12;
            v43 = 2112;
            v44 = v14;
            _os_log_error_impl(&dword_1B72A3000, v15, OS_LOG_TYPE_ERROR, "Couldn't cache delete mark file at %@ - %@", buf, 0x16u);
          }

        }
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = 0;
        v17 = objc_msgSend(v16, "removeItemAtURL:error:", v12, &v35);
        v18 = v35;

        if ((v17 & 1) == 0)
        {
          _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v42 = v12;
            v43 = 2112;
            v44 = v18;
            _os_log_error_impl(&dword_1B72A3000, v19, OS_LOG_TYPE_ERROR, "Couldn't remove file at %@ - %@", buf, 0x16u);
          }

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    }
    while (v9);
  }

  if (v30)
    v20 = 2;
  else
    v20 = 1;
  v21 = objc_msgSend(*(id *)(v29 + 40), "argon_artworkUsed");
  +[NTKFaceSupportNotificationPresentationEventRecorder sharedRecorder](NTKFaceSupportNotificationPresentationEventRecorder, "sharedRecorder");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = *(_QWORD *)(v29 + 32);
  v24 = objc_msgSend(v30, "code");
  v25 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __121__NTKDArgonService__push_sendNotificationForContent_requestIdentifier_toNotificationCenter_identifier_bundle_completion___block_invoke_228;
  v33[3] = &unk_1E6BCE988;
  v34 = *(id *)(v29 + 32);
  objc_msgSend(v22, "endPresentationForIdentifier:status:artworkUsed:errorCode:optOutStatus:completion:", v23, v20, v21, v24, 0, v33);

  objc_msgSend(*(id *)(v29 + 48), "actionRecorder");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = *(void **)(v29 + 32);
  v31[0] = v25;
  v31[1] = 3221225472;
  v31[2] = __121__NTKDArgonService__push_sendNotificationForContent_requestIdentifier_toNotificationCenter_identifier_bundle_completion___block_invoke_229;
  v31[3] = &unk_1E6BCE728;
  v32 = v27;
  objc_msgSend(v26, "beginPresentationForIdentifier:completion:", v32, v31);

  v28 = *(_QWORD *)(v29 + 56);
  if (v28)
    (*(void (**)(uint64_t, BOOL, void *))(v28 + 16))(v28, v30 == 0, v30);

}

void __121__NTKDArgonService__push_sendNotificationForContent_requestIdentifier_toNotificationCenter_identifier_bundle_completion___block_invoke_228(uint64_t a1, void *a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if (v4)
  {
    _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __76__NTKDArgonService__queue_push_userNotification_processWaitingNotifications__block_invoke_193_cold_1();

  }
  else
  {
    NTKSubmitFaceSupportMessage(a2);
  }

}

void __121__NTKDArgonService__push_sendNotificationForContent_requestIdentifier_toNotificationCenter_identifier_bundle_completion___block_invoke_229(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __121__NTKDArgonService__push_sendNotificationForContent_requestIdentifier_toNotificationCenter_identifier_bundle_completion___block_invoke_229_cold_1();

}

- (UNUserNotificationCenter)userNotificationCenter
{
  return self->_userNotificationCenter;
}

- (APSConnection)pushConnection
{
  return self->_pushConnection;
}

- (void)setPushConnection:(id)a3
{
  objc_storeStrong((id *)&self->_pushConnection, a3);
}

- (OS_dispatch_queue)pushQueue
{
  return self->_pushQueue;
}

- (void)setPushQueue:(id)a3
{
  objc_storeStrong((id *)&self->_pushQueue, a3);
}

- (OS_dispatch_queue)userNotificationQueue
{
  return self->_userNotificationQueue;
}

- (void)setUserNotificationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_userNotificationQueue, a3);
}

- (NSMutableDictionary)keyDescriptorsAwaitingUserNotifications
{
  return self->_keyDescriptorsAwaitingUserNotifications;
}

- (void)setKeyDescriptorsAwaitingUserNotifications:(id)a3
{
  objc_storeStrong((id *)&self->_keyDescriptorsAwaitingUserNotifications, a3);
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_userDefaults, a3);
}

- (int)notifyToken
{
  return self->_notifyToken;
}

- (int)pushToken
{
  return self->_pushToken;
}

- (NTKFaceSupportNotificationActionEventRecorder)actionRecorder
{
  return self->_actionRecorder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionRecorder, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_keyDescriptorsAwaitingUserNotifications, 0);
  objc_storeStrong((id *)&self->_userNotificationQueue, 0);
  objc_storeStrong((id *)&self->_pushQueue, 0);
  objc_storeStrong((id *)&self->_pushConnection, 0);
  objc_storeStrong((id *)&self->_userNotificationCenter, 0);
  objc_storeStrong((id *)&self->_manager, 0);
}

void __25__NTKDArgonService__init__block_invoke_139_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1B72A3000, log, OS_LOG_TYPE_DEBUG, "NTKDArgonService: New bundles not found. It won't post notification", v1, 2u);
}

void __25__NTKDArgonService__init__block_invoke_145_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_11();
  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(v1 + 32), "fileName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2(&dword_1B72A3000, v0, v3, "NTKDArgonService: Failed to display user notification for %@: %@", v4);

  OUTLINED_FUNCTION_8();
}

void __49__NTKDArgonService_cleanUpStaleBundlesEventually__block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_1B72A3000, v0, v1, "Couldn't get paths of directory %@ to remove: %@");
  OUTLINED_FUNCTION_1();
}

- (void)requestResetOnNextLaunch:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  v3 = 2114;
  v4 = v0;
  _os_log_debug_impl(&dword_1B72A3000, v1, OS_LOG_TYPE_DEBUG, "Reset: Renamed %{public}@ to %{public}@ to trigger stale content removal on next launch", v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

void __64__NTKDArgonService_argonManager_didExtractKeyDescriptor_toPath___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_0(&dword_1B72A3000, v0, v1, "Failed to record success for %@ - %@");
  OUTLINED_FUNCTION_1();
}

- (void)argonManager:didRemoveExtractedArgonFolderAtPath:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1B72A3000, v0, v1, "Argon removed folder at path %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __62__NTKDArgonService_ingestKeyDescriptor_withMethod_completion___block_invoke_161_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_0(&dword_1B72A3000, v0, v1, "Event failure for %@ - %@");
  OUTLINED_FUNCTION_1();
}

void __49__NTKDArgonService__checkInForFirstQueryActivity__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0(&dword_1B72A3000, v0, v1, "Failed to finish XPC activity %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void __49__NTKDArgonService__checkInForDailyQueryActivity__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0(&dword_1B72A3000, v0, v1, "Failed to finish XPC daily activity %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_argonIsComplete
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_1B72A3000, v0, v1, "Cannot determine complete-ness at path %@: %@");
  OUTLINED_FUNCTION_1();
}

- (void)_recordEventOfNotification:action:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_1B72A3000, v0, v1, "Face Action %lu Notification bundle is nil for identifier %@");
  OUTLINED_FUNCTION_1();
}

- (void)_recordEventOfNotification:action:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_1B72A3000, v0, v1, "Face Action %lu Notification key descriptor is nil for identifier %@");
  OUTLINED_FUNCTION_1();
}

- (void)_recordEventOfNotification:action:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_1B72A3000, v0, v1, "Face Action %lu Notification object %@ is not a string");
  OUTLINED_FUNCTION_1();
}

void __54__NTKDArgonService__recordEventOfNotification_action___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_0(&dword_1B72A3000, v0, v1, "Face action not made for %@ - %@");
  OUTLINED_FUNCTION_1();
}

- (void)connection:didReceiveIncomingMessage:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1B72A3000, v0, v1, "Argon missing key descriptor in payload %@.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)connection:didReceiveIncomingMessage:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1B72A3000, v0, v1, "Argon missing descriptor JSON in payload %@.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __57__NTKDArgonService_connection_didReceiveIncomingMessage___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_0(&dword_1B72A3000, v0, v1, "Couldn't record push event for %@ - %@");
  OUTLINED_FUNCTION_1();
}

void __57__NTKDArgonService_connection_didReceiveIncomingMessage___block_invoke_182_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_0(&dword_1B72A3000, v0, v1, "Couldn't record presentation event for %@ - %@");
  OUTLINED_FUNCTION_1();
}

void __57__NTKDArgonService_connection_didReceiveIncomingMessage___block_invoke_183_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_11();
  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(v1 + 32), "fileName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2(&dword_1B72A3000, v0, v3, "Argon failed to ingest key descriptor in message named %@ - %@", v4);

  OUTLINED_FUNCTION_8();
}

void __57__NTKDArgonService_connection_didReceiveIncomingMessage___block_invoke_184_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_11();
  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(v1 + 32), "fileName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2(&dword_1B72A3000, v0, v3, "Argon failed to display user notification for %@: %@.", v4);

  OUTLINED_FUNCTION_8();
}

void __76__NTKDArgonService__queue_push_userNotification_processWaitingNotifications__block_invoke_193_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_0(&dword_1B72A3000, v0, v1, "Couldn't record end presentation for %@ - %@");
  OUTLINED_FUNCTION_1();
}

void __76__NTKDArgonService__queue_push_userNotification_processWaitingNotifications__block_invoke_200_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[12];
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_11();
  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(v2 + 32), "fileName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  v6 = 2114;
  v7 = v4;
  v8 = 2114;
  v9 = v1;
  _os_log_error_impl(&dword_1B72A3000, v0, OS_LOG_TYPE_ERROR, "No notification found for key %{public}@ and matching bundle %{public}@ - %{public}@", v5, 0x20u);

}

- (void)_push_sendNotificationForContent:(os_log_t)log requestIdentifier:toNotificationCenter:identifier:bundle:completion:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B72A3000, log, OS_LOG_TYPE_ERROR, "Request identifier is nil. Generating random identifier.", v1, 2u);
}

void __121__NTKDArgonService__push_sendNotificationForContent_requestIdentifier_toNotificationCenter_identifier_bundle_completion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_0(&dword_1B72A3000, v0, v1, "Couldn't schedule user notification for %@ - %@");
  OUTLINED_FUNCTION_1();
}

void __121__NTKDArgonService__push_sendNotificationForContent_requestIdentifier_toNotificationCenter_identifier_bundle_completion___block_invoke_229_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_0(&dword_1B72A3000, v0, v1, "Couldn't record begin action for %@ - %@");
  OUTLINED_FUNCTION_1();
}

@end

@implementation LSApplicationWorkspace

+ (id)defaultWorkspace
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__LSApplicationWorkspace_defaultWorkspace__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultWorkspace_once != -1)
    dispatch_once(&defaultWorkspace_once, block);
  return (id)defaultWorkspace_gDefaultWorkspace;
}

- (void)getKnowledgeUUID:(id *)a3 andSequenceNumber:(id *)a4
{
  uint64_t v6;
  void *v7;
  uint64_t SequenceNumber;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[6];
  void *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__4;
  v24 = __Block_byref_object_dispose__4;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__4;
  v18 = __Block_byref_object_dispose__4;
  v19 = 0;
  if (_LSCurrentProcessMayMapDatabase())
  {
    v13 = 0;
    if (!_LSContextInit(&v13))
    {
      _LSDatabaseGetCacheGUID();
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v21[5];
      v21[5] = v6;

      SequenceNumber = _LSDatabaseGetSequenceNumber();
      if (SequenceNumber)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", SequenceNumber);
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = (void *)v15[5];
        v15[5] = v9;

      }
      _LSContextDestroy(&v13);
    }

    if (a3)
      goto LABEL_7;
  }
  else
  {
    __LAUNCH_SERVICES_IS_GENERATING_A_SANDBOX_EXCEPTION_BECAUSE_THIS_PROCESS_MAY_NOT_MAP_THE_DATABASE__();
    __LAUNCH_SERVICES_IS_ABORTING_BECAUSE_THIS_PROCESS_MAY_NOT_MAP_THE_DATABASE__();
    +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDReadService, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __61__LSApplicationWorkspace_getKnowledgeUUID_andSequenceNumber___block_invoke;
    v12[3] = &unk_1E10407F0;
    v12[4] = &v20;
    v12[5] = &v14;
    objc_msgSend(v11, "getKnowledgeUUIDAndSequenceNumberWithCompletionHandler:", v12);

    if (a3)
LABEL_7:
      *a3 = objc_retainAutorelease((id)v21[5]);
  }
  if (a4)
    *a4 = objc_retainAutorelease((id)v15[5]);
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
}

id __56__LSApplicationWorkspace_deviceIdentifierForAdvertising__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[5];
  void (*v8[5])(_QWORD, _QWORD);
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__4;
  v13 = __Block_byref_object_dispose__4;
  v14 = 0;
  v2 = MEMORY[0x1E0C809B0];
  v8[0] = (void (*)(_QWORD, _QWORD))MEMORY[0x1E0C809B0];
  v8[1] = (void (*)(_QWORD, _QWORD))3221225472;
  v8[2] = (void (*)(_QWORD, _QWORD))__56__LSApplicationWorkspace_deviceIdentifierForAdvertising__block_invoke_2;
  v8[3] = (void (*)(_QWORD, _QWORD))&unk_1E10407A0;
  v8[4] = (void (*)(_QWORD, _QWORD))&v9;
  +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDDeviceIdentifierService, v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  v7[1] = 3221225472;
  v7[2] = __56__LSApplicationWorkspace_deviceIdentifierForAdvertising__block_invoke_264;
  v7[3] = &unk_1E1040CE8;
  v7[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "getIdentifierOfType:completionHandler:", 1, v7);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
    v4 = 0;
  else
    v4 = (void *)v10[5];
  v5 = v4;

  _Block_object_dispose(&v9, 8);
  return v5;
}

- (id)deviceIdentifierForVendor
{
  id v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__4;
  v10 = __Block_byref_object_dispose__4;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__LSApplicationWorkspace_deviceIdentifierForVendor__block_invoke;
  v5[3] = &unk_1E1040D10;
  v5[4] = &v6;
  v2 = _LSRetryForConnectionInterrupted(v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

id __51__LSApplicationWorkspace_deviceIdentifierForVendor__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[5];
  void (*v8[5])(_QWORD, _QWORD);
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__4;
  v13 = __Block_byref_object_dispose__4;
  v14 = 0;
  v2 = MEMORY[0x1E0C809B0];
  v8[0] = (void (*)(_QWORD, _QWORD))MEMORY[0x1E0C809B0];
  v8[1] = (void (*)(_QWORD, _QWORD))3221225472;
  v8[2] = (void (*)(_QWORD, _QWORD))__51__LSApplicationWorkspace_deviceIdentifierForVendor__block_invoke_2;
  v8[3] = (void (*)(_QWORD, _QWORD))&unk_1E10407A0;
  v8[4] = (void (*)(_QWORD, _QWORD))&v9;
  +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDDeviceIdentifierService, v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  v7[1] = 3221225472;
  v7[2] = __51__LSApplicationWorkspace_deviceIdentifierForVendor__block_invoke_267;
  v7[3] = &unk_1E1040CE8;
  v7[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "getIdentifierOfType:completionHandler:", 0, v7);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
    v4 = 0;
  else
    v4 = (void *)v10[5];
  v5 = v4;

  _Block_object_dispose(&v9, 8);
  return v5;
}

void __65__LSApplicationWorkspace_enumerateBundlesOfType_legacySPI_block___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  if (v3)
  {
    v4 = v3;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v3 = v4;
  }

}

- (void)enumerateBundlesOfType:(unint64_t)a3 legacySPI:(BOOL)a4 block:(id)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  id *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v5 = a4;
  v7 = a5;
  if (v7)
  {
    if (a3 == 6)
    {
      +[LSPlugInQuery pluginQuery](LSPlugInQuery, "pluginQuery");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __65__LSApplicationWorkspace_enumerateBundlesOfType_legacySPI_block___block_invoke;
      v14[3] = &unk_1E1040BD0;
      v9 = &v15;
      v15 = v7;
      enumeratePluginsMatchingQuery(v8, v14);
    }
    else
    {
      +[_LSBundleProxiesOfTypeQuery queryWithType:](_LSBundleProxiesOfTypeQuery, "queryWithType:", a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v10;
      if (!v10)
      {
LABEL_7:

        goto LABEL_8;
      }
      objc_msgSend(v10, "setLegacy:", v5);
      +[_LSQueryContext defaultContext](_LSQueryContext, "defaultContext");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __65__LSApplicationWorkspace_enumerateBundlesOfType_legacySPI_block___block_invoke_2;
      v12[3] = &unk_1E1040BF8;
      v9 = &v13;
      v13 = v7;
      objc_msgSend(v11, "enumerateResolvedResultsOfQuery:withBlock:", v8, v12);

    }
    goto LABEL_7;
  }
LABEL_8:

}

- (BOOL)applicationIsInstalled:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v3 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  if (v3)
  {
    +[_LSApplicationIsInstalledQuery queryWithBundleIdentifier:](_LSApplicationIsInstalledQuery, "queryWithBundleIdentifier:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      +[_LSQueryContext defaultContext](_LSQueryContext, "defaultContext");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __49__LSApplicationWorkspace_applicationIsInstalled___block_invoke;
      v8[3] = &unk_1E103FC78;
      v8[4] = &v9;
      objc_msgSend(v5, "enumerateResolvedResultsOfQuery:withBlock:", v4, v8);

    }
    v6 = *((_BYTE *)v10 + 24) != 0;
  }
  else
  {
    v6 = 0;
  }
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (BOOL)isApplicationAvailableToOpenURLCommon:(id)a3 includePrivateURLSchemes:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v7;
  void *v8;
  void *v9;
  id *v10;
  char v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  int v15;
  BOOL v16;
  _QWORD v18[6];
  void (*v19[5])(_QWORD, _QWORD);
  id obj;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  _QWORD v32[2];

  v6 = a4;
  v32[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__4;
  v25 = __Block_byref_object_dispose__4;
  v26 = 0;
  objc_msgSend(v7, "scheme");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isServer"))
    {
      +[_LSCanOpenURLManager sharedManager](_LSCanOpenURLManager, "sharedManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (id *)(v22 + 5);
      obj = (id)v22[5];
      v11 = objc_msgSend(v9, "canOpenURL:publicSchemes:privateSchemes:XPCConnection:error:", v7, 1, v6, 0, &obj);
      objc_storeStrong(v10, obj);
      *((_BYTE *)v28 + 24) = v11;
    }
    else
    {
      v14 = MEMORY[0x1E0C809B0];
      v19[0] = (void (*)(_QWORD, _QWORD))MEMORY[0x1E0C809B0];
      v19[1] = (void (*)(_QWORD, _QWORD))3221225472;
      v19[2] = (void (*)(_QWORD, _QWORD))__107__LSApplicationWorkspace_URLQueries__isApplicationAvailableToOpenURLCommon_includePrivateURLSchemes_error___block_invoke;
      v19[3] = (void (*)(_QWORD, _QWORD))&unk_1E10407A0;
      v19[4] = (void (*)(_QWORD, _QWORD))&v21;
      +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDOpenService, v19);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v14;
      v18[1] = 3221225472;
      v18[2] = __107__LSApplicationWorkspace_URLQueries__isApplicationAvailableToOpenURLCommon_includePrivateURLSchemes_error___block_invoke_2;
      v18[3] = &unk_1E10409D8;
      v18[4] = &v27;
      v18[5] = &v21;
      objc_msgSend(v9, "canOpenURL:publicSchemes:privateSchemes:completionHandler:", v7, 1, v6, v18);
    }
  }
  else
  {
    v31 = *MEMORY[0x1E0CB2D50];
    v32[0] = CFSTR("Invalid input URL");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl(CFSTR("LSApplicationWorkspaceErrorDomain"), -105, (uint64_t)"-[LSApplicationWorkspace(URLQueries) isApplicationAvailableToOpenURLCommon:includePrivateURLSchemes:error:]", 4613, v9);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v22[5];
    v22[5] = v12;

  }
  v15 = *((unsigned __int8 *)v28 + 24);
  if (a5 && !*((_BYTE *)v28 + 24))
  {
    *a5 = objc_retainAutorelease((id)v22[5]);
    v15 = *((unsigned __int8 *)v28 + 24);
  }
  v16 = v15 != 0;

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v16;
}

void __45__LSApplicationWorkspace_establishConnection__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint8_t v14[16];
  uint8_t buf[16];

  if (!_sObserverConnection)
  {
    if (_LSProcessCanAccessProgressPort_onceToken != -1)
      dispatch_once(&_LSProcessCanAccessProgressPort_onceToken, &__block_literal_global_865);
    if (_LSProcessCanAccessProgressPort_canAccessProgressPort)
    {
      v2 = objc_alloc(MEMORY[0x1E0CB3B38]);
      objc_msgSend((id)__LSDefaultsGetSharedInstance(), "serviceNameForConnectionType:", 5);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)objc_msgSend(v2, "initWithMachServiceName:options:", v3, 4096);

      installProgressInterface();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setRemoteObjectInterface:", v5);

      workspaceObserverInterface();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setExportedInterface:", v6);

      v7 = (void *)_sObserverConnection;
      _sObserverConnection = (uint64_t)v4;

      _LSProgressLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_182882000, v8, OS_LOG_TYPE_DEFAULT, "Establishing xpc connection to lsd", buf, 2u);
      }

      if (_sObserverConnection)
      {
        objc_msgSend((id)_sObserverConnection, "setInvalidationHandler:", &__block_literal_global_135_0);
        objc_msgSend((id)_sObserverConnection, "setInterruptionHandler:", &__block_literal_global_138);
        +[LSApplicationWorkspace _remoteObserver](LSApplicationWorkspace, "_remoteObserver");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)_sObserverConnection, "setExportedObject:", v9);

        objc_msgSend((id)_sObserverConnection, "resume");
        objc_msgSend((id)_sObserverConnection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_144);
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = (void *)_sObserverProxy;
        _sObserverProxy = v10;

        objc_msgSend((id)_sObserverProxy, "_lsPing:reply:", CFSTR("LSWorkspaceObserverPing"), &__block_literal_global_149);
      }
      else
      {
        _LSProgressLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v14 = 0;
          _os_log_impl(&dword_182882000, v12, OS_LOG_TYPE_DEFAULT, "Failed to establish xpc connection to lsd", v14, 2u);
        }

        v13 = (void *)_sObserverProxy;
        _sObserverProxy = 0;

        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
      }
    }
  }
}

- (id)observerProxy
{
  NSObject *v2;
  uint8_t v4[16];

  if (!-[LSApplicationWorkspace establishConnection](self, "establishConnection"))
  {
    _LSDefaultLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_182882000, v2, OS_LOG_TYPE_DEFAULT, "failed to establish connection to xpc service", v4, 2u);
    }

  }
  return (id)_sObserverProxy;
}

- (void)addObserver:(id)a3
{
  id v4;
  int v5;
  NSObject *v6;
  id v7;
  id v8;
  char v9;
  void *v10;
  LSApplicationWorkspace *v11;
  void *v12;
  _QWORD block[5];
  uint8_t buf[4];
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = shouldConnectToLSD(v4);
  _LSDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v15 = (id)objc_opt_class();
    v16 = 2048;
    v17 = v4;
    v7 = v15;
    _os_log_impl(&dword_182882000, v6, OS_LOG_TYPE_INFO, "LSApplicationWorkspace: adding observer %@ @ %p", buf, 0x16u);

  }
  v8 = v4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    mutateSubscriberCountForNotificationName(CFSTR("com.lsinstallprogress.appcontrols.cancel"), &__block_literal_global_883);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    mutateSubscriberCountForNotificationName(CFSTR("com.lsinstallprogress.appcontrols.pause"), &__block_literal_global_883);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    mutateSubscriberCountForNotificationName(CFSTR("com.lsinstallprogress.appcontrols.prioritize"), &__block_literal_global_883);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    mutateSubscriberCountForNotificationName(CFSTR("com.lsinstallprogress.appcontrols.resume"), &__block_literal_global_883);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    mutateSubscriberCountForNotificationName(CFSTR("com.lsinstallprogress.networkusagechanged"), &__block_literal_global_883);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    mutateSubscriberCountForNotificationName(CFSTR("com.apple.LaunchServices.pluginsregistered"), &__block_literal_global_883);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    mutateSubscriberCountForNotificationName(CFSTR("com.apple.LaunchServices.pluginsunregistered"), &__block_literal_global_883);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    mutateSubscriberCountForNotificationName(CFSTR("com.apple.LaunchServices.pluginswillberemoved"), &__block_literal_global_883);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    mutateSubscriberCountForNotificationName(CFSTR("com.apple.LaunchServices.applicationStateChanged"), &__block_literal_global_883);

  if (DeviceManagementLibrary_frameworkLibrary_0
    || (DeviceManagementLibrary_frameworkLibrary_0 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/DeviceManagement.framework/DeviceManagement", 2)) != 0)
  {
    objc_opt_class();
    v9 = (objc_opt_isKindOfClass() & 1) != 0
       ? objc_msgSend((id)objc_opt_class(), "actuallyOverridesDMFObserverMethod")
       : objc_opt_respondsToSelector();
    if ((v9 & 1) != 0)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __38__LSApplicationWorkspace_addObserver___block_invoke;
      block[3] = &unk_1E1040478;
      block[4] = self;
      if (addObserver__onceToken != -1)
        dispatch_once(&addObserver__onceToken, block);
    }
  }
  -[LSApplicationWorkspace remoteObserver](self, "remoteObserver");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = self;
    objc_sync_enter(v11);
    objc_msgSend(v10, "setObservinglsd:", 1);
    objc_msgSend(v10, "addLocalObserver:", v8);
    if (v5)
    {
      -[LSApplicationWorkspace observerProxy](v11, "observerProxy");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObserver");

    }
    objc_sync_exit(v11);

  }
}

- (id)remoteObserver
{
  NSObject *v3;
  LSApplicationWorkspace *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint8_t v9[16];

  if (!-[LSApplicationWorkspace establishConnection](self, "establishConnection"))
  {
    _LSDefaultLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_182882000, v3, OS_LOG_TYPE_DEFAULT, "failed to establish connection to xpc service", v9, 2u);
    }

  }
  v4 = self;
  objc_sync_enter(v4);
  +[LSApplicationWorkspace _remoteObserver](LSApplicationWorkspace, "_remoteObserver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isObservinglsd") & 1) != 0)
    goto LABEL_8;
  +[LSApplicationWorkspace _remoteObserver](LSApplicationWorkspace, "_remoteObserver");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "currentObserverCount");

  if (v7)
  {
    objc_msgSend((id)_sObserverProxy, "addObserver");
    +[LSApplicationWorkspace _remoteObserver](LSApplicationWorkspace, "_remoteObserver");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObservinglsd:", 1);
LABEL_8:

  }
  objc_sync_exit(v4);

  +[LSApplicationWorkspace _remoteObserver](LSApplicationWorkspace, "_remoteObserver");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_remoteObserver
{
  if (_remoteObserver_onceToken != -1)
    dispatch_once(&_remoteObserver_onceToken, &__block_literal_global_126_0);
  return (id)_sRemoteObserver;
}

- (BOOL)establishConnection
{
  NSObject *v2;
  _QWORD block[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 1;
  +[LSApplicationWorkspace progressQueue](LSApplicationWorkspace, "progressQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__LSApplicationWorkspace_establishConnection__block_invoke;
  block[3] = &unk_1E10408D8;
  block[4] = &v5;
  dispatch_sync(v2, block);

  LOBYTE(v2) = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

+ (id)progressQueue
{
  if (progressQueue_once != -1)
    dispatch_once(&progressQueue_once, &__block_literal_global_7);
  return (id)progressQueue_result;
}

- (BOOL)isVersion:(id)a3 greaterThanOrEqualToVersion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  BOOL v10;
  void *v12;
  void *v13;
  _OWORD v14[2];
  _OWORD v15[2];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSApplicationWorkspace.m"), 3493, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("version != nil"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSApplicationWorkspace.m"), 3494, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("minVersion != nil"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v18 = 0u;
  v19 = 0u;
  _LSVersionNumberMakeWithString(&v18, v7);
  v16 = 0u;
  v17 = 0u;
  _LSVersionNumberMakeWithString(&v16, v9);
  v15[0] = v18;
  v15[1] = v19;
  v14[0] = v16;
  v14[1] = v17;
  v10 = _LSVersionNumberCompare(v15, v14) != -1;

  return v10;
}

void __49__LSApplicationWorkspace_applicationIsInstalled___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;

  if (a2)
  {
    v6 = a2;
    objc_msgSend(v6, "propertyListWithClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v7, "BOOLValue");
    *a4 = 1;
  }
}

void __107__LSApplicationWorkspace_URLQueries__isApplicationAvailableToOpenURLCommon_includePrivateURLSchemes_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __42__LSApplicationWorkspace_defaultWorkspace__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)defaultWorkspace_gDefaultWorkspace;
  defaultWorkspace_gDefaultWorkspace = (uint64_t)v1;

}

- (BOOL)allowsAlternateIcons
{
  return objc_msgSend((id)__LSDefaultsGetSharedInstance(), "allowsAlternateIcons");
}

- (id)deviceIdentifierForAdvertising
{
  id v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__4;
  v10 = __Block_byref_object_dispose__4;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__LSApplicationWorkspace_deviceIdentifierForAdvertising__block_invoke;
  v5[3] = &unk_1E1040D10;
  v5[4] = &v6;
  v2 = _LSRetryForConnectionInterrupted(v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)enumerateBundlesOfType:(unint64_t)a3 block:(id)a4
{
  -[LSApplicationWorkspace enumerateBundlesOfType:legacySPI:block:](self, "enumerateBundlesOfType:legacySPI:block:", a3, 0, a4);
}

- (id)applicationsForUserActivityType:(id)a3
{
  return -[LSApplicationWorkspace applicationsForUserActivityType:limit:](self, "applicationsForUserActivityType:limit:", a3, -1);
}

void __41__LSApplicationWorkspace__remoteObserver__block_invoke()
{
  LSApplicationWorkspaceRemoteObserver *v0;
  void *v1;

  v0 = objc_alloc_init(LSApplicationWorkspaceRemoteObserver);
  v1 = (void *)_sRemoteObserver;
  _sRemoteObserver = (uint64_t)v0;

}

void __39__LSApplicationWorkspace_progressQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.launchservices.clientprogress", v2);
  v1 = (void *)progressQueue_result;
  progressQueue_result = (uint64_t)v0;

}

- (id)URLOverrideForURL:(id)a3
{
  LaunchServices::URLOverrides::getURLOverrideCommon((LaunchServices::URLOverrides *)a3, (NSURL *)a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)applicationsForUserActivityType:(id)a3 limit:(unint64_t)a4
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!a3)
    a3 = &stru_1E10473A0;
  +[LSApplicationRecord applicationRecordsForUserActivityType:limit:error:](LSApplicationRecord, "applicationRecordsForUserActivityType:limit:error:", a3, a4, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "compatibilityObject", (_QWORD)v15);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v11;
          if (v11)
          {
            objc_msgSend(v11, "detach");
            objc_msgSend(v5, "addObject:", v12);
          }

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

    v13 = (void *)objc_msgSend(v5, "copy");
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)callbackQueue
{
  if (callbackQueue_once != -1)
    dispatch_once(&callbackQueue_once, &__block_literal_global_123_0);
  return (id)callbackQueue_result;
}

void __39__LSApplicationWorkspace_callbackQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.launchservices.clientcallbacks", v2);
  v1 = (void *)callbackQueue_result;
  callbackQueue_result = (uint64_t)v0;

}

+ (id)activeManagedConfigurationRestrictionUUIDs
{
  return +[LSApplicationRestrictionsManager activeRestrictionIdentifiers]();
}

- (id)systemMode
{
  os_unfair_lock_s *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v10[6];
  void (*v11[5])(_QWORD, _QWORD);
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__4;
  v22 = __Block_byref_object_dispose__4;
  v23 = 0;
  if (objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isServer"))
  {
    +[LSApplicationRestrictionsManager sharedInstance]();
    v2 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
    -[LSApplicationRestrictionsManager systemMode](v2);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v19[5];
    v19[5] = v3;

  }
  else
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__4;
    v16 = __Block_byref_object_dispose__4;
    v17 = 0;
    v5 = MEMORY[0x1E0C809B0];
    v11[0] = (void (*)(_QWORD, _QWORD))MEMORY[0x1E0C809B0];
    v11[1] = (void (*)(_QWORD, _QWORD))3221225472;
    v11[2] = (void (*)(_QWORD, _QWORD))__36__LSApplicationWorkspace_systemMode__block_invoke;
    v11[3] = (void (*)(_QWORD, _QWORD))&unk_1E10407A0;
    v11[4] = (void (*)(_QWORD, _QWORD))&v12;
    +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDReadService, v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __36__LSApplicationWorkspace_systemMode__block_invoke_2;
    v10[3] = &unk_1E10407C8;
    v10[4] = &v12;
    v10[5] = &v18;
    objc_msgSend(v6, "getSystemModeWithCompletionHandler:", v10);
    if (v13[5])
    {
      _LSDefaultLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[LSApplicationWorkspace systemMode].cold.1();

    }
    _Block_object_dispose(&v12, 8);

  }
  v8 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v8;
}

void __36__LSApplicationWorkspace_systemMode__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __36__LSApplicationWorkspace_systemMode__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void **v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v8 = v5;
  }
  else
  {
    v7 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v8 = v11;
  }
  v9 = v8;
  v10 = *v7;
  *v7 = v9;

}

void __61__LSApplicationWorkspace_getKnowledgeUUID_andSequenceNumber___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __45__LSApplicationWorkspace_establishConnection__block_invoke_134()
{
  NSObject *v0;
  NSObject *v1;
  uint8_t v2[16];

  _LSDefaultLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_182882000, v0, OS_LOG_TYPE_DEFAULT, "progress connection invalidationHandler called", v2, 2u);
  }

  +[LSApplicationWorkspace progressQueue](LSApplicationWorkspace, "progressQueue");
  v1 = objc_claimAutoreleasedReturnValue();
  dispatch_sync(v1, &__block_literal_global_137);

}

void __45__LSApplicationWorkspace_establishConnection__block_invoke_136()
{
  void *v0;
  id v1;

  v0 = (void *)_sObserverConnection;
  _sObserverConnection = 0;

  +[LSApplicationWorkspace _remoteObserver](LSApplicationWorkspace, "_remoteObserver");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setObservinglsd:", 0);

}

void __45__LSApplicationWorkspace_establishConnection__block_invoke_2()
{
  NSObject *v0;
  NSObject *v1;
  uint8_t v2[16];

  _LSDefaultLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_182882000, v0, OS_LOG_TYPE_DEFAULT, "interruptionHandler called, re-establishing connection to lsd", v2, 2u);
  }

  +[LSApplicationWorkspace progressQueue](LSApplicationWorkspace, "progressQueue");
  v1 = objc_claimAutoreleasedReturnValue();
  dispatch_sync(v1, &__block_literal_global_140);

}

void __45__LSApplicationWorkspace_establishConnection__block_invoke_139()
{
  void *v0;
  id v1;

  objc_msgSend((id)_sObserverConnection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_142);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObserver");

  +[LSApplicationWorkspace _remoteObserver](LSApplicationWorkspace, "_remoteObserver");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setObservinglsd:", 1);

}

void __45__LSApplicationWorkspace_establishConnection__block_invoke_2_141(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _LSDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v2;
    _os_log_impl(&dword_182882000, v3, OS_LOG_TYPE_DEFAULT, "Error %@ trying to re-establish observing connection to lsd", (uint8_t *)&v5, 0xCu);
  }

  +[LSApplicationWorkspace _remoteObserver](LSApplicationWorkspace, "_remoteObserver");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObservinglsd:", 0);

}

void __45__LSApplicationWorkspace_establishConnection__block_invoke_143(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _LSDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v2;
    _os_log_impl(&dword_182882000, v3, OS_LOG_TYPE_DEFAULT, "Error %@ trying to establish observing connection to lsd", (uint8_t *)&v5, 0xCu);
  }

  +[LSApplicationWorkspace _remoteObserver](LSApplicationWorkspace, "_remoteObserver");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObservinglsd:", 0);

}

void __45__LSApplicationWorkspace_establishConnection__block_invoke_147(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _LSProgressLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_182882000, v3, OS_LOG_TYPE_DEFAULT, "Received %@, xpc connection established", (uint8_t *)&v4, 0xCu);
  }

}

- (id)syncObserverProxy
{
  NSObject *v2;
  NSObject *v3;
  id v4;
  _QWORD block[5];
  uint8_t buf[8];
  uint8_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  if (!-[LSApplicationWorkspace establishConnection](self, "establishConnection"))
  {
    _LSDefaultLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_182882000, v2, OS_LOG_TYPE_DEFAULT, "failed to establish connection to xpc service", buf, 2u);
    }

  }
  *(_QWORD *)buf = 0;
  v8 = buf;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__4;
  v11 = __Block_byref_object_dispose__4;
  v12 = 0;
  +[LSApplicationWorkspace progressQueue](LSApplicationWorkspace, "progressQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__LSApplicationWorkspace_syncObserverProxy__block_invoke;
  block[3] = &unk_1E10408D8;
  block[4] = buf;
  dispatch_sync(v3, block);

  v4 = *((id *)v8 + 5);
  _Block_object_dispose(buf, 8);

  return v4;
}

void __43__LSApplicationWorkspace_syncObserverProxy__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend((id)_sObserverConnection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_150);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __43__LSApplicationWorkspace_syncObserverProxy__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _LSDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_182882000, v3, OS_LOG_TYPE_DEFAULT, "Error %@ trying to establish observing connection to lsd", (uint8_t *)&v4, 0xCu);
  }

}

void __38__LSApplicationWorkspace_addObserver___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[5];

  _LSGetDMFNotificationCenter();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __38__LSApplicationWorkspace_addObserver___block_invoke_2;
  v4[3] = &unk_1E1040940;
  v4[4] = *(_QWORD *)(a1 + 32);
  v3 = (id)objc_msgSend(v2, "addObserverForName:object:queue:usingBlock:", CFSTR("com.apple.launchservices.private._LSDMFPolicyDidChangeNotification"), 0, 0, v4);

}

void __38__LSApplicationWorkspace_addObserver___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "remoteObserver");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "deviceManagementPolicyDidChange:", v4);
}

- (void)removeObserver:(id)a3
{
  id v4;
  int v5;
  NSObject *v6;
  id v7;
  LSApplicationWorkspace *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  _BOOL4 v12;
  void *v13;
  NSObject *v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = shouldConnectToLSD(v4);
  _LSDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v15 = 138412546;
    v16 = (id)objc_opt_class();
    v17 = 2048;
    v18 = v4;
    v7 = v16;
    _os_log_impl(&dword_182882000, v6, OS_LOG_TYPE_INFO, "LSApplicationWorkspace: removing observer %@ @ %p", (uint8_t *)&v15, 0x16u);

  }
  v8 = self;
  objc_sync_enter(v8);
  -[LSApplicationWorkspace remoteObserver](v8, "remoteObserver");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeLocalObserver:", v4);

  -[LSApplicationWorkspace remoteObserver](v8, "remoteObserver");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "currentObserverCount") == 0;

  if (v5)
    v12 = v11;
  else
    v12 = 0;
  if (v12)
  {
    -[LSApplicationWorkspace observerProxy](v8, "observerProxy");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeObserver");

    +[LSApplicationWorkspace progressQueue](LSApplicationWorkspace, "progressQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v14, &__block_literal_global_190);

  }
  performWithLSAWDistributedNotificationNameBasedOnObserverConformance(v4, unsubscribeFromLSAWDistributedNotification);
  objc_sync_exit(v8);

}

uint64_t __41__LSApplicationWorkspace_removeObserver___block_invoke()
{
  return objc_msgSend((id)_sObserverConnection, "invalidate");
}

- (id)applicationProxiesWithPlistFlags:(unsigned int)a3 bundleFlags:(unint64_t)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v5 = *(_QWORD *)&a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[_LSApplicationProxiesWithFlagsQuery queryWithPlistFlags:bundleFlags:](_LSApplicationProxiesWithFlagsQuery, "queryWithPlistFlags:bundleFlags:", v5, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    +[_LSQueryContext defaultContext](_LSQueryContext, "defaultContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __71__LSApplicationWorkspace_applicationProxiesWithPlistFlags_bundleFlags___block_invoke;
    v10[3] = &unk_1E1040988;
    v11 = v6;
    objc_msgSend(v8, "enumerateResolvedResultsOfQuery:withBlock:", v7, v10);

  }
  return v6;
}

uint64_t __71__LSApplicationWorkspace_applicationProxiesWithPlistFlags_bundleFlags___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "addObject:", a2);
  return result;
}

- (id)directionsApplications
{
  return -[LSApplicationWorkspace applicationProxiesWithPlistFlags:bundleFlags:](self, "applicationProxiesWithPlistFlags:bundleFlags:", 256, 0);
}

- (id)applicationsWithUIBackgroundModes
{
  return -[LSApplicationWorkspace applicationProxiesWithPlistFlags:bundleFlags:](self, "applicationProxiesWithPlistFlags:bundleFlags:", 512, 0);
}

- (id)applicationsWithAudioComponents
{
  return -[LSApplicationWorkspace applicationProxiesWithPlistFlags:bundleFlags:](self, "applicationProxiesWithPlistFlags:bundleFlags:", 1024, 0);
}

- (id)applicationsWithVPNPlugins
{
  return -[LSApplicationWorkspace applicationProxiesWithPlistFlags:bundleFlags:](self, "applicationProxiesWithPlistFlags:bundleFlags:", 4096, 0);
}

- (id)applicationForUserActivityType:(id)a3
{
  void *v3;
  void *v4;

  -[LSApplicationWorkspace applicationsForUserActivityType:limit:](self, "applicationsForUserActivityType:limit:", a3, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)applicationForUserActivityDomainName:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  if (!a3)
    a3 = &stru_1E10473A0;
  +[LSApplicationRecord applicationRecordsForUserActivityDomainName:limit:error:](LSApplicationRecord, "applicationRecordsForUserActivityDomainName:limit:error:", a3, 1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "compatibilityObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "detach");
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)openApplicationWithBundleID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v3 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v4 = (void *)MEMORY[0x186DAE7A0]();
  _LSFaultIfRunningOnMainThreadOfShellApp();
  +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDOpenService, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__LSApplicationWorkspace_openApplicationWithBundleID___block_invoke;
  v7[3] = &unk_1E10409B0;
  v7[4] = &v8;
  objc_msgSend(v5, "openApplicationWithIdentifier:options:useClientProcessHandle:completionHandler:", v3, MEMORY[0x1E0C9AA70], 0, v7);

  objc_autoreleasePoolPop(v4);
  LOBYTE(v4) = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return (char)v4;
}

uint64_t __54__LSApplicationWorkspace_openApplicationWithBundleID___block_invoke(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)openURL:(id)a3
{
  return -[LSApplicationWorkspace openURL:withOptions:](self, "openURL:withOptions:", a3, 0);
}

- (BOOL)openURL:(id)a3 withOptions:(id)a4
{
  return -[LSApplicationWorkspace openURL:withOptions:error:](self, "openURL:withOptions:error:", a3, a4, 0);
}

- (BOOL)openURL:(id)a3 withOptions:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  id *v9;
  int FileHandleForOpeningResource;
  id v11;
  uint64_t v12;
  void *v13;
  int v14;
  BOOL v15;
  _QWORD v17[6];
  void (*v18[5])(_QWORD, _QWORD);
  id obj;
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;

  v7 = a3;
  v8 = a4;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__4;
  v25 = __Block_byref_object_dispose__4;
  v26 = 0;
  _LSFaultIfRunningOnMainThreadOfShellApp();
  v9 = (id *)(v22 + 5);
  obj = (id)v22[5];
  v20 = 0;
  FileHandleForOpeningResource = getFileHandleForOpeningResource(v7, 0, 0, &v20, &obj);
  v11 = v20;
  objc_storeStrong(v9, obj);
  if (FileHandleForOpeningResource)
  {
    v12 = MEMORY[0x1E0C809B0];
    v18[0] = (void (*)(_QWORD, _QWORD))MEMORY[0x1E0C809B0];
    v18[1] = (void (*)(_QWORD, _QWORD))3221225472;
    v18[2] = (void (*)(_QWORD, _QWORD))__52__LSApplicationWorkspace_openURL_withOptions_error___block_invoke;
    v18[3] = (void (*)(_QWORD, _QWORD))&unk_1E10407A0;
    v18[4] = (void (*)(_QWORD, _QWORD))&v21;
    +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDOpenService, v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v12;
    v17[1] = 3221225472;
    v17[2] = __52__LSApplicationWorkspace_openURL_withOptions_error___block_invoke_2;
    v17[3] = &unk_1E10409D8;
    v17[4] = &v27;
    v17[5] = &v21;
    objc_msgSend(v13, "openURL:fileHandle:options:completionHandler:", v7, v11, v8, v17);

  }
  v14 = *((unsigned __int8 *)v28 + 24);
  if (a5 && !*((_BYTE *)v28 + 24))
  {
    *a5 = objc_retainAutorelease((id)v22[5]);
    v14 = *((unsigned __int8 *)v28 + 24);
  }
  v15 = v14 != 0;

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v15;
}

void __52__LSApplicationWorkspace_openURL_withOptions_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __52__LSApplicationWorkspace_openURL_withOptions_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)openSensitiveURL:(id)a3 withOptions:(id)a4
{
  return -[LSApplicationWorkspace openSensitiveURL:withOptions:error:](self, "openSensitiveURL:withOptions:error:", a3, a4, 0);
}

- (BOOL)openSensitiveURL:(id)a3 withOptions:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  objc_class *v11;
  id v12;
  void *v13;
  BOOL v14;

  if (a4)
  {
    v9 = a3;
    v10 = (id)objc_msgSend(a4, "mutableCopy");
  }
  else
  {
    v11 = (objc_class *)MEMORY[0x1E0C99E08];
    v12 = a3;
    v10 = objc_alloc_init(v11);
  }
  v13 = v10;
  objc_msgSend(v10, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("LSOpenSensitiveURLOption"));
  v14 = -[LSApplicationWorkspace openURL:withOptions:error:](self, "openURL:withOptions:error:", a3, v13, a5);

  return v14;
}

- (void)_openUserActivity:(id)a3 orUserActivityUUID:(id)a4 activityTypeForUUID:(id)a5 withApplicationProxy:(id)a6 options:(id)a7 completionHandler:(id)a8
{
  unint64_t v14;
  unint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  int v21;
  const __CFAllocator *v22;
  __CFString *v23;
  __CFString *v24;
  __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  NSObject *v40;
  id v41;
  _QWORD block[4];
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  uint64_t v49;
  const __CFString *v50;
  uint64_t v51;
  _QWORD v52[2];

  v52[1] = *MEMORY[0x1E0C80C00];
  v14 = (unint64_t)a3;
  v15 = (unint64_t)a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  if (!v19)
    v19 = (id)objc_msgSend(&__block_literal_global_199, "copy");
  if (_openUserActivity_orUserActivityUUID_activityTypeForUUID_withApplicationProxy_options_completionHandler__once != -1)
  {
    dispatch_once(&_openUserActivity_orUserActivityUUID_activityTypeForUUID_withApplicationProxy_options_completionHandler__once, &__block_literal_global_200);
    if (v14)
      goto LABEL_5;
LABEL_16:
    v21 = 0;
    goto LABEL_17;
  }
  if (!v14)
    goto LABEL_16;
LABEL_5:
  if (v17)
  {
    objc_msgSend(v17, "appState");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isInstalled") ^ 1;
  }
  else
  {
    objc_msgSend((id)v14, "_determineMatchingApplicationBundleIdentifierWithOptions:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      +[LSApplicationProxy applicationProxyForIdentifier:placeholder:](LSApplicationProxy, "applicationProxyForIdentifier:placeholder:", v20, 0);
      v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v41 = v16;
      v22 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      objc_msgSend((id)v14, "_teamIdentifier");
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v14, "activityType");
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v25 = (__CFString *)_LSCopyAdvertisementStringForTeamIdentifierAndActivityType(v22, v23, v24);

      if (v25)
      {
        -[LSApplicationWorkspace applicationForUserActivityType:](self, "applicationForUserActivityType:", v25);
        v17 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v17 = 0;
      }
      v16 = v41;

    }
    v21 = 1;
  }

LABEL_17:
  if (v14 | v15
    && v17
    && objc_msgSend(v17, "isInstalled")
    && (objc_msgSend(v17, "isRestricted") & 1) == 0)
  {
    v40 = _openUserActivity_orUserActivityUUID_activityTypeForUUID_withApplicationProxy_options_completionHandler__openUAQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __130__LSApplicationWorkspace__openUserActivity_orUserActivityUUID_activityTypeForUUID_withApplicationProxy_options_completionHandler___block_invoke_3;
    block[3] = &unk_1E1040A68;
    v43 = (id)v14;
    v44 = (id)v15;
    v45 = v16;
    v48 = v19;
    v46 = v17;
    v47 = v18;
    dispatch_async(v40, block);

  }
  else if (v21)
  {
    objc_msgSend(v17, "bundleIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      objc_msgSend(v17, "bundleIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      +[LSApplicationProxy applicationProxyForSystemPlaceholder:](LSApplicationProxy, "applicationProxyForSystemPlaceholder:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28)
      {
        objc_msgSend((id)v14, "webpageURL");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "bundleIdentifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[LSApplicationWorkspace _LSFailedToOpenURL:withBundle:](self, "_LSFailedToOpenURL:withBundle:", v29, v30);

      }
    }
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -10814, (uint64_t)"-[LSApplicationWorkspace _openUserActivity:orUserActivityUUID:activityTypeForUUID:withApplicationProxy:options:completionHandler:]", 1764, 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v19 + 2))(v19, 0, v31);

  }
  else
  {
    if (v15
      && (objc_msgSend(v17, "appState"),
          v32 = (void *)objc_claimAutoreleasedReturnValue(),
          v33 = objc_msgSend(v32, "isInstalled"),
          v32,
          (v33 & 1) == 0))
    {
      v38 = (void *)*MEMORY[0x1E0CB2F90];
      v51 = *MEMORY[0x1E0CB2938];
      v52[0] = CFSTR("Application must be non-nil and installed.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, &v51, 1);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v38;
      v37 = 1768;
    }
    else
    {
      v34 = (void *)*MEMORY[0x1E0CB2F90];
      v49 = *MEMORY[0x1E0CB2938];
      v50 = CFSTR("invalid input parameters");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v34;
      v37 = 1772;
    }
    _LSMakeNSErrorImpl(v36, -50, (uint64_t)"-[LSApplicationWorkspace _openUserActivity:orUserActivityUUID:activityTypeForUUID:withApplicationProxy:options:completionHandler:]", v37, v35);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v19 + 2))(v19, 0, v39);

  }
}

void __130__LSApplicationWorkspace__openUserActivity_orUserActivityUUID_activityTypeForUUID_withApplicationProxy_options_completionHandler___block_invoke_2()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("LSApplicationWorkspace openUserActivity queue", v2);
  v1 = (void *)_openUserActivity_orUserActivityUUID_activityTypeForUUID_withApplicationProxy_options_completionHandler__openUAQueue;
  _openUserActivity_orUserActivityUUID_activityTypeForUUID_withApplicationProxy_options_completionHandler__openUAQueue = (uint64_t)v0;

}

void __130__LSApplicationWorkspace__openUserActivity_orUserActivityUUID_activityTypeForUUID_withApplicationProxy_options_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void (*v11)(_QWORD, _QWORD);
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  id v15;
  id v16;

  v2 = (void *)MEMORY[0x186DAE7A0]();
  v3 = *(void **)(a1 + 32);
  if (!v3)
  {
    v4 = *(id *)(a1 + 40);
    v8 = *(id *)(a1 + 48);
    v7 = 0;
    v6 = 0;
    goto LABEL_5;
  }
  objc_msgSend(v3, "_uniqueIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  v16 = 0;
  _LSGetDataForUserActivity(v5, &v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v16;
  objc_msgSend(*(id *)(a1 + 32), "activityType");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
LABEL_5:
    v11 = (void (*)(_QWORD, _QWORD))MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __130__LSApplicationWorkspace__openUserActivity_orUserActivityUUID_activityTypeForUUID_withApplicationProxy_options_completionHandler___block_invoke_4;
    v14 = &unk_1E1040A40;
    v15 = *(id *)(a1 + 72);
    +[_LSDService XPCProxyWithErrorHandler:]((uint64_t)_LSDOpenService, &v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "bundleIdentifier", v11, v12, v13, v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "openUserActivityWithUniqueIdentifier:activityData:activityType:bundleIdentifier:options:completionHandler:", v4, v6, v8, v10, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));

    goto LABEL_6;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
LABEL_6:

  objc_autoreleasePoolPop(v2);
}

uint64_t __130__LSApplicationWorkspace__openUserActivity_orUserActivityUUID_activityTypeForUUID_withApplicationProxy_options_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)openUserActivity:(id)a3 withApplicationProxy:(id)a4 options:(id)a5 completionHandler:(id)a6
{
  -[LSApplicationWorkspace _openUserActivity:orUserActivityUUID:activityTypeForUUID:withApplicationProxy:options:completionHandler:](self, "_openUserActivity:orUserActivityUUID:activityTypeForUUID:withApplicationProxy:options:completionHandler:", a3, 0, 0, a4, a5, a6);
}

- (void)openUserActivity:(id)a3 withApplicationProxy:(id)a4 completionHandler:(id)a5
{
  -[LSApplicationWorkspace _openUserActivity:orUserActivityUUID:activityTypeForUUID:withApplicationProxy:options:completionHandler:](self, "_openUserActivity:orUserActivityUUID:activityTypeForUUID:withApplicationProxy:options:completionHandler:", a3, 0, 0, a4, 0, a5);
}

- (void)openUserActivity:(id)a3 usingApplicationRecord:(id)a4 configuration:(id)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSApplicationWorkspace.m"), 1788, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("userActivity != nil"));

  }
  objc_msgSend(v11, "compatibilityObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[LSApplicationWorkspace optionsFromOpenConfiguration:](self, "optionsFromOpenConfiguration:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[LSApplicationWorkspace _openUserActivity:orUserActivityUUID:activityTypeForUUID:withApplicationProxy:options:completionHandler:](self, "_openUserActivity:orUserActivityUUID:activityTypeForUUID:withApplicationProxy:options:completionHandler:", v17, 0, 0, v14, v15, v13);

}

- (void)openUserActivityWithUUID:(id)a3 activityType:(id)a4 usingApplicationRecord:(id)a5 configuration:(id)a6 completionHandler:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (v22)
  {
    if (v13)
      goto LABEL_3;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSApplicationWorkspace.m"), 1801, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("activityType != nil"));

    if (v14)
      goto LABEL_4;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSApplicationWorkspace.m"), 1802, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("appRecord != nil"));

    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSApplicationWorkspace.m"), 1800, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("uuid != nil"));

  if (!v13)
    goto LABEL_6;
LABEL_3:
  if (!v14)
    goto LABEL_7;
LABEL_4:
  objc_msgSend(v14, "compatibilityObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[LSApplicationWorkspace optionsFromOpenConfiguration:](self, "optionsFromOpenConfiguration:", v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[LSApplicationWorkspace _openUserActivity:orUserActivityUUID:activityTypeForUUID:withApplicationProxy:options:completionHandler:](self, "_openUserActivity:orUserActivityUUID:activityTypeForUUID:withApplicationProxy:options:completionHandler:", 0, v22, v13, v17, v18, v16);

}

- (id)operationToOpenResource:(id)a3 usingApplication:(id)a4 uniqueDocumentIdentifier:(id)a5 isContentManaged:(BOOL)a6 sourceAuditToken:(id *)a7 userInfo:(id)a8 options:(id)a9 delegate:(id)a10
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  _LSOpenResourceOperationDelegateWrapper *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  $115C4C562B26FF47E01F9F4EA65B5887 *v27;
  id v28;
  id v29;
  _LSOpenResourceOperationDelegateWrapper *v30;
  id v31;
  id v32;
  id v33;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  _LSOpenResourceOperationDelegateWrapper *v40;
  id v41;
  id v42;
  $115C4C562B26FF47E01F9F4EA65B5887 *v43;
  BOOL v44;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  v18 = a9;
  v19 = a10;
  objc_msgSend(MEMORY[0x1E0CB34C8], "blockOperationWithBlock:", &__block_literal_global_221);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v21 = -[_LSOpenResourceOperationDelegateWrapper initWithOperation:wrappedDelegate:]([_LSOpenResourceOperationDelegateWrapper alloc], "initWithOperation:wrappedDelegate:", v20, v19);

    if (!a7)
      goto LABEL_4;
    goto LABEL_3;
  }
  v21 = 0;
  if (a7)
  {
LABEL_3:
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", a7, 32);
    a7 = (const $115C4C562B26FF47E01F9F4EA65B5887 *)objc_claimAutoreleasedReturnValue();
  }
LABEL_4:
  v22 = (void *)objc_msgSend(v18, "mutableCopy");
  v23 = v22;
  if (v22)
  {
    v24 = v22;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v24 = (id)objc_claimAutoreleasedReturnValue();
  }
  v25 = v24;

  objc_msgSend(v25, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("LSBlockUntilComplete"));
  v26 = v25;

  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __152__LSApplicationWorkspace_operationToOpenResource_usingApplication_uniqueDocumentIdentifier_isContentManaged_sourceAuditToken_userInfo_options_delegate___block_invoke_2;
  v36[3] = &unk_1E1040AE0;
  v37 = v14;
  v38 = v17;
  v39 = v26;
  v40 = v21;
  v41 = v15;
  v42 = v16;
  v44 = a6;
  v43 = ($115C4C562B26FF47E01F9F4EA65B5887 *)a7;
  v27 = (id)a7;
  v28 = v16;
  v29 = v15;
  v30 = v21;
  v31 = v26;
  v32 = v17;
  v33 = v14;
  objc_msgSend(v20, "addExecutionBlock:", v36);

  return v20;
}

void __152__LSApplicationWorkspace_operationToOpenResource_usingApplication_uniqueDocumentIdentifier_isContentManaged_sourceAuditToken_userInfo_options_delegate___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int FileHandleForOpeningResource;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  void (*v19[4])(_QWORD, _QWORD);
  id v20;
  id v21;
  id v22[2];

  _LSFaultIfRunningOnMainThreadOfShellApp();
  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(void **)(a1 + 48);
  v22[0] = 0;
  v21 = 0;
  FileHandleForOpeningResource = getFileHandleForOpeningResource(v2, v3, v4, v22, &v21);
  v6 = v22[0];
  v7 = v21;
  if (FileHandleForOpeningResource)
  {
    v19[0] = (void (*)(_QWORD, _QWORD))MEMORY[0x1E0C809B0];
    v19[1] = (void (*)(_QWORD, _QWORD))3221225472;
    v19[2] = (void (*)(_QWORD, _QWORD))__152__LSApplicationWorkspace_operationToOpenResource_usingApplication_uniqueDocumentIdentifier_isContentManaged_sourceAuditToken_userInfo_options_delegate___block_invoke_3;
    v19[3] = (void (*)(_QWORD, _QWORD))&unk_1E1040A90;
    v20 = *(id *)(a1 + 56);
    +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDOpenService, v19);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 72);
    v16 = *(_QWORD *)(a1 + 64);
    v11 = *(unsigned __int8 *)(a1 + 88);
    v12 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 80)), "bytes");
    v14 = *(_QWORD *)(a1 + 40);
    v13 = *(_QWORD *)(a1 + 48);
    v15 = *(void **)(a1 + 56);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __152__LSApplicationWorkspace_operationToOpenResource_usingApplication_uniqueDocumentIdentifier_isContentManaged_sourceAuditToken_userInfo_options_delegate___block_invoke_4;
    v17[3] = &unk_1E1040AB8;
    v18 = v15;
    objc_msgSend(v8, "performOpenOperationWithURL:fileHandle:bundleIdentifier:documentIdentifier:isContentManaged:sourceAuditToken:userInfo:options:delegate:completionHandler:", v9, v6, v16, v10, v11, v12, v14, v13, v18, v17);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 56), "openResourceOperation:didFailWithError:", 0, v7);
  }

}

uint64_t __152__LSApplicationWorkspace_operationToOpenResource_usingApplication_uniqueDocumentIdentifier_isContentManaged_sourceAuditToken_userInfo_options_delegate___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "openResourceOperation:didFailWithError:", 0, a2);
}

uint64_t __152__LSApplicationWorkspace_operationToOpenResource_usingApplication_uniqueDocumentIdentifier_isContentManaged_sourceAuditToken_userInfo_options_delegate___block_invoke_4(uint64_t a1, int a2, uint64_t a3)
{
  void *v3;

  v3 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v3, "openResourceOperationDidComplete:", 0);
  else
    return objc_msgSend(v3, "openResourceOperation:didFailWithError:", 0, a3);
}

- (id)operationToOpenResource:(id)a3 usingApplication:(id)a4 uniqueDocumentIdentifier:(id)a5 sourceIsManaged:(BOOL)a6 userInfo:(id)a7 options:(id)a8 delegate:(id)a9
{
  return -[LSApplicationWorkspace operationToOpenResource:usingApplication:uniqueDocumentIdentifier:isContentManaged:sourceAuditToken:userInfo:options:delegate:](self, "operationToOpenResource:usingApplication:uniqueDocumentIdentifier:isContentManaged:sourceAuditToken:userInfo:options:delegate:", a3, a4, a5, a6, 0, a7, a8, a9);
}

- (id)operationToOpenResource:(id)a3 usingApplication:(id)a4 uniqueDocumentIdentifier:(id)a5 sourceIsManaged:(BOOL)a6 userInfo:(id)a7 delegate:(id)a8
{
  return -[LSApplicationWorkspace operationToOpenResource:usingApplication:uniqueDocumentIdentifier:isContentManaged:sourceAuditToken:userInfo:options:delegate:](self, "operationToOpenResource:usingApplication:uniqueDocumentIdentifier:isContentManaged:sourceAuditToken:userInfo:options:delegate:", a3, a4, a5, a6, 0, a7, 0, a8);
}

- (id)operationToOpenResource:(id)a3 usingApplication:(id)a4 uniqueDocumentIdentifier:(id)a5 userInfo:(id)a6 delegate:(id)a7
{
  return -[LSApplicationWorkspace operationToOpenResource:usingApplication:uniqueDocumentIdentifier:isContentManaged:sourceAuditToken:userInfo:options:delegate:](self, "operationToOpenResource:usingApplication:uniqueDocumentIdentifier:isContentManaged:sourceAuditToken:userInfo:options:delegate:", a3, a4, a5, 0, 0, a6, 0, a7);
}

- (id)operationToOpenResource:(id)a3 usingApplication:(id)a4 uniqueDocumentIdentifier:(id)a5 userInfo:(id)a6
{
  return -[LSApplicationWorkspace operationToOpenResource:usingApplication:uniqueDocumentIdentifier:userInfo:delegate:](self, "operationToOpenResource:usingApplication:uniqueDocumentIdentifier:userInfo:delegate:", a3, a4, a5, a6, 0);
}

- (id)operationToOpenResource:(id)a3 usingApplication:(id)a4 userInfo:(id)a5
{
  return -[LSApplicationWorkspace operationToOpenResource:usingApplication:uniqueDocumentIdentifier:userInfo:](self, "operationToOpenResource:usingApplication:uniqueDocumentIdentifier:userInfo:", a3, a4, 0, a5);
}

- (id)optionsFromOpenConfiguration:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v3, "frontBoardOptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v3, "frontBoardOptions");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addEntriesFromDictionary:", v6);

    }
    objc_msgSend(v3, "referrerURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("ReferrerURL"));

    if (objc_msgSend(v3, "isSensitive"))
      objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("LSOpenSensitiveURLOption"));
    if ((objc_msgSend(v3, "allowURLOverrides") & 1) == 0)
      objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("NoOverrides"));
    objc_msgSend(v3, "targetConnectionEndpoint");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v3, "targetConnectionEndpoint");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("LSTargetBSServiceConnectionEndpointKey"));

    }
    objc_msgSend(v3, "clickAttribution");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      v12 = getUISOpenApplicationOptionClickAttribution[0]();

      if (v12)
      {
        objc_msgSend(v3, "clickAttribution");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, getUISOpenApplicationOptionClickAttribution[0]());

      }
    }
    objc_msgSend(v3, "pasteSharingToken");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = (void *)v14;
      v16 = getUISOpenApplicationOptionPasteSharingToken[0]();

      if (v16)
      {
        objc_msgSend(v3, "pasteSharingToken");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, getUISOpenApplicationOptionPasteSharingToken[0]());

      }
    }
  }
  objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("LSBlockUntilComplete"));
  v18 = (void *)objc_msgSend(v4, "copy");

  return v18;
}

- (id)openURL:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v8 = a3;
  v9 = a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__4;
  v24 = __Block_byref_object_dispose__4;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__4;
  v18 = __Block_byref_object_dispose__4;
  v19 = 0;
  -[LSApplicationWorkspace optionsFromOpenConfiguration:](self, "optionsFromOpenConfiguration:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __54__LSApplicationWorkspace_openURL_configuration_error___block_invoke;
  v13[3] = &unk_1E1040B08;
  v13[4] = &v20;
  v13[5] = &v14;
  -[LSApplicationWorkspace commonClientOpenURL:options:configuration:synchronous:completionHandler:](self, "commonClientOpenURL:options:configuration:synchronous:completionHandler:", v8, v10, v9, 1, v13);
  if (a5)
    *a5 = objc_retainAutorelease((id)v15[5]);
  v11 = (id)v21[5];

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v11;
}

void __54__LSApplicationWorkspace_openURL_configuration_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (void)openURL:(id)a3 configuration:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[LSApplicationWorkspace optionsFromOpenConfiguration:](self, "optionsFromOpenConfiguration:", v9);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[LSApplicationWorkspace commonClientOpenURL:options:configuration:synchronous:completionHandler:](self, "commonClientOpenURL:options:configuration:synchronous:completionHandler:", v10, v11, v9, 0, v8);

}

- (void)commonClientOpenURL:(id)a3 options:(id)a4 configuration:(id)a5 synchronous:(BOOL)a6 completionHandler:(id)a7
{
  _BOOL4 v8;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  int FileHandleForOpeningResource;
  id v19;
  id v20;
  void (*v21)(_QWORD, _QWORD);
  void (*v22)(_QWORD, _QWORD);
  id *v23;
  id *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  void (*v32[4])(_QWORD, _QWORD);
  id v33;
  id v34;
  void (*v35[4])(_QWORD, _QWORD);
  id v36;
  id v37;
  id v38;
  id v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  _BOOL4 v45;
  uint64_t v46;

  v8 = a6;
  v46 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSApplicationWorkspace.m"), 2087, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("url != nil"));

  }
  _LSDefaultLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    loggableURL(v13);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138478339;
    v41 = v27;
    v42 = 2113;
    v43 = v14;
    v44 = 1024;
    v45 = v8;
    _os_log_debug_impl(&dword_182882000, v17, OS_LOG_TYPE_DEBUG, "Opening URL %{private}@ with options dictionary %{private}@ synchronous: %u", buf, 0x1Cu);

  }
  v39 = 0;
  v38 = 0;
  FileHandleForOpeningResource = getFileHandleForOpeningResource(v13, 0, v14, &v39, &v38);
  v19 = v39;
  v20 = v38;
  if (FileHandleForOpeningResource)
  {
    v21 = (void (*)(_QWORD, _QWORD))MEMORY[0x1E0C809B0];
    if (v8)
    {
      _LSFaultIfRunningOnMainThreadOfShellApp();
      v22 = v21;
      v35[0] = v21;
      v35[1] = (void (*)(_QWORD, _QWORD))3221225472;
      v35[2] = (void (*)(_QWORD, _QWORD))__98__LSApplicationWorkspace_commonClientOpenURL_options_configuration_synchronous_completionHandler___block_invoke;
      v35[3] = (void (*)(_QWORD, _QWORD))&unk_1E1040B30;
      v23 = &v36;
      v36 = v13;
      v24 = &v37;
      v37 = v16;
      +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDOpenService, v35);
      v25 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = (void (*)(_QWORD, _QWORD))MEMORY[0x1E0C809B0];
      v32[0] = (void (*)(_QWORD, _QWORD))MEMORY[0x1E0C809B0];
      v32[1] = (void (*)(_QWORD, _QWORD))3221225472;
      v32[2] = (void (*)(_QWORD, _QWORD))__98__LSApplicationWorkspace_commonClientOpenURL_options_configuration_synchronous_completionHandler___block_invoke_227;
      v32[3] = (void (*)(_QWORD, _QWORD))&unk_1E1040B30;
      v23 = &v33;
      v33 = v13;
      v24 = &v34;
      v34 = v16;
      +[_LSDService XPCProxyWithErrorHandler:]((uint64_t)_LSDOpenService, v32);
      v25 = objc_claimAutoreleasedReturnValue();
    }
    v26 = (void *)v25;

    v29[0] = v22;
    v29[1] = 3221225472;
    v29[2] = __98__LSApplicationWorkspace_commonClientOpenURL_options_configuration_synchronous_completionHandler___block_invoke_228;
    v29[3] = &unk_1E1040B58;
    v30 = v13;
    v31 = v16;
    objc_msgSend(v26, "openURL:fileHandle:options:completionHandler:", v30, v19, v14, v29);

  }
  else
  {
    (*((void (**)(id, _QWORD, id))v16 + 2))(v16, 0, v20);
  }

}

void __98__LSApplicationWorkspace_commonClientOpenURL_options_configuration_synchronous_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  _LSDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __98__LSApplicationWorkspace_commonClientOpenURL_options_configuration_synchronous_completionHandler___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

void __98__LSApplicationWorkspace_commonClientOpenURL_options_configuration_synchronous_completionHandler___block_invoke_227(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  _LSDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __98__LSApplicationWorkspace_commonClientOpenURL_options_configuration_synchronous_completionHandler___block_invoke_227_cold_1();

  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

void __98__LSApplicationWorkspace_commonClientOpenURL_options_configuration_synchronous_completionHandler___block_invoke_228(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _LSDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __98__LSApplicationWorkspace_commonClientOpenURL_options_configuration_synchronous_completionHandler___block_invoke_228_cold_1();

  }
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
  {
    if (a2)
      v8 = MEMORY[0x1E0C9AA70];
    else
      v8 = 0;
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, v8, v5);
  }

}

- (void)openApplicationWithBundleIdentifier:(id)a3 configuration:(id)a4 completionHandler:(id)a5
{
  _LSCommonOpenApplicationWithBundleIdentifier(self, a3, a4, 0, a5);
}

- (void)openApplicationWithBundleIdentifier:(id)a3 usingConfiguration:(id)a4 completionHandler:(id)a5
{
  _LSCommonOpenApplicationWithBundleIdentifier(self, a3, a4, 1, a5);
}

- (id)installedPlugins
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  if (!_LSCurrentProcessMayMapDatabase() && pluginQueryFault_onceToken != -1)
    dispatch_once(&pluginQueryFault_onceToken, &__block_literal_global_894);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[LSPlugInQuery pluginQuery](LSPlugInQuery, "pluginQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__LSApplicationWorkspace_installedPlugins__block_invoke;
  v6[3] = &unk_1E1040B80;
  v4 = v2;
  v7 = v4;
  enumeratePluginsMatchingQuery(v3, v6);

  return v4;
}

void __42__LSApplicationWorkspace_installedPlugins__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  }
  else
  {
    _LSDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_182882000, v6, OS_LOG_TYPE_DEFAULT, "Failed to get all plugins: <%@>", (uint8_t *)&v7, 0xCu);
    }

  }
}

- (id)pluginsWithIdentifiers:(id)a3 protocols:(id)a4 version:(id)a5 applyFilter:(id)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  const __CFString *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v22[4];
  id v23;
  void *v24;

  v8 = a3;
  v9 = a4;
  v10 = a6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v8)
  {
    objc_msgSend(v12, "setValue:forKey:", v8, CFSTR("NSExtensionIdentifier"));
    if (v9)
    {
      objc_msgSend(v13, "setValue:forKey:", v9, CFSTR("NSExtensionPointName"));
      v14 = (id)MEMORY[0x1E0C9AAB0];
      v15 = CFSTR("LSShouldORIdentifiers");
      v12 = v13;
LABEL_6:
      objc_msgSend(v12, "setValue:forKey:", v14, v15);
    }
  }
  else if (v9)
  {
    v15 = CFSTR("NSExtensionPointName");
    v14 = v9;
    goto LABEL_6;
  }
  +[LSPlugInQuery pluginQueryWithQueryDictionary:applyFilter:](LSPlugInQuery, "pluginQueryWithQueryDictionary:applyFilter:", v13, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __79__LSApplicationWorkspace_pluginsWithIdentifiers_protocols_version_applyFilter___block_invoke;
  v22[3] = &unk_1E1040BA8;
  v17 = v11;
  v23 = v17;
  v24 = v13;
  v18 = v13;
  enumeratePluginsMatchingQuery(v16, v22);
  v19 = v24;
  v20 = v17;

  return v20;
}

void __79__LSApplicationWorkspace_pluginsWithIdentifiers_protocols_version_applyFilter___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
  }
  else if (v6)
  {
    _LSDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 40);
      v10 = 138412546;
      v11 = v9;
      v12 = 2112;
      v13 = v7;
      _os_log_impl(&dword_182882000, v8, OS_LOG_TYPE_DEFAULT, "Failed to get plugins matching query %@: <%@>", (uint8_t *)&v10, 0x16u);
    }

  }
}

- (void)enumeratePluginsMatchingQuery:(id)a3 withBlock:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  if (a3)
    v6 = a3;
  else
    v6 = (id)MEMORY[0x1E0C9AA70];
  +[LSPlugInQuery pluginQueryWithQueryDictionary:applyFilter:](LSPlugInQuery, "pluginQueryWithQueryDictionary:applyFilter:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__LSApplicationWorkspace_enumeratePluginsMatchingQuery_withBlock___block_invoke;
  v9[3] = &unk_1E1040BD0;
  v10 = v5;
  v8 = v5;
  enumeratePluginsMatchingQuery(v7, v9);

}

uint64_t __66__LSApplicationWorkspace_enumeratePluginsMatchingQuery_withBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)pluginsMatchingQuery:(id)a3 applyFilter:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, void *);
  void *v20;
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1E0C99DE8];
  v7 = a4;
  objc_msgSend(v6, "arrayWithCapacity:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v9 = v5;
  else
    v9 = (id)MEMORY[0x1E0C9AA70];
  +[LSPlugInQuery pluginQueryWithQueryDictionary:applyFilter:](LSPlugInQuery, "pluginQueryWithQueryDictionary:applyFilter:", v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __59__LSApplicationWorkspace_pluginsMatchingQuery_applyFilter___block_invoke;
  v20 = &unk_1E1040BA8;
  v11 = v8;
  v21 = v11;
  v12 = v5;
  v22 = v12;
  enumeratePluginsMatchingQuery(v10, &v17);
  if (!objc_msgSend(v11, "count", v17, v18, v19, v20))
  {
    _LSDefaultLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v12;
      _os_log_impl(&dword_182882000, v13, OS_LOG_TYPE_DEFAULT, "No plugins found to match query %@", buf, 0xCu);
    }

  }
  v14 = v22;
  v15 = v11;

  return v15;
}

void __59__LSApplicationWorkspace_pluginsMatchingQuery_applyFilter___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
  }
  else if (v6)
  {
    _LSDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 40);
      v10 = 138412546;
      v11 = v9;
      v12 = 2112;
      v13 = v7;
      _os_log_impl(&dword_182882000, v8, OS_LOG_TYPE_DEFAULT, "Failed to get plugins matching query %@: <%@>", (uint8_t *)&v10, 0x16u);
    }

  }
}

uint64_t __65__LSApplicationWorkspace_enumerateBundlesOfType_legacySPI_block___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

- (void)enumerateApplicationsOfType:(unint64_t)a3 legacySPI:(BOOL)a4 block:(id)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v5 = a4;
  v7 = a5;
  if (v7)
  {
    +[_LSApplicationProxiesOfTypeQuery queryWithType:](_LSApplicationProxiesOfTypeQuery, "queryWithType:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "setLegacy:", v5);
      +[_LSQueryContext defaultContext](_LSQueryContext, "defaultContext");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __70__LSApplicationWorkspace_enumerateApplicationsOfType_legacySPI_block___block_invoke;
      v11[3] = &unk_1E1040BF8;
      v12 = v7;
      objc_msgSend(v10, "enumerateResolvedResultsOfQuery:withBlock:", v9, v11);

    }
  }

}

uint64_t __70__LSApplicationWorkspace_enumerateApplicationsOfType_legacySPI_block___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

- (void)enumerateApplicationsOfType:(unint64_t)a3 block:(id)a4
{
  -[LSApplicationWorkspace enumerateApplicationsOfType:legacySPI:block:](self, "enumerateApplicationsOfType:legacySPI:block:", a3, 0, a4);
}

- (id)removedSystemApplications
{
  return 0;
}

- (id)bundleIdentifiersForMachOUUIDs:(id)a3 error:(id *)a4
{
  return mapBundleIdentifiersToUUIDs(1, a3, a4);
}

- (id)machOUUIDsForBundleIdentifiers:(id)a3 error:(id *)a4
{
  return mapBundleIdentifiersToUUIDs(0, a3, a4);
}

- (BOOL)getClaimedActivityTypes:(id *)a3 domains:(id *)a4
{
  int v6;
  CFTypeRef v7;
  CFTypeRef v8;
  CFTypeRef v10;
  CFTypeRef cf;

  v10 = 0;
  cf = 0;
  v6 = _LSCopyClaimedActivityIdentifiersAndDomains(&cf, &v10);
  if (!v6)
  {
    v7 = cf;
    if (cf)
    {
      if (a3)
      {
        *a3 = (id)objc_msgSend((id)cf, "copy");
        v7 = cf;
      }
      CFRelease(v7);
    }
    v8 = v10;
    if (v10)
    {
      if (a4)
      {
        *a4 = (id)objc_msgSend((id)v10, "copy");
        v8 = v10;
      }
      CFRelease(v8);
    }
  }
  return v6 == 0;
}

- (id)registerContainerizedApplicationWithInfoDictionaries:(id)a3 personaUniqueStrings:(id)a4 operationUUID:(id)a5 requestContext:(id)a6 saveObserver:(id)a7 registrationError:(id *)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v26[7];
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__4;
  v44 = __Block_byref_object_dispose__4;
  v45 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__4;
  v38 = __Block_byref_object_dispose__4;
  v39 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__4;
  v32 = __Block_byref_object_dispose__4;
  v33 = 0;
  v18 = (void *)objc_opt_class();
  serviceDomainForRequestContext(v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  _LSDServiceGetXPCConnection(v18, (uint64_t)v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __160__LSApplicationWorkspace_registerContainerizedApplicationWithInfoDictionaries_personaUniqueStrings_operationUUID_requestContext_saveObserver_registrationError___block_invoke;
  v27[3] = &unk_1E10407A0;
  v27[4] = &v28;
  objc_msgSend(v20, "synchronousRemoteObjectProxyWithErrorHandler:", v27);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v21;
  v26[1] = 3221225472;
  v26[2] = __160__LSApplicationWorkspace_registerContainerizedApplicationWithInfoDictionaries_personaUniqueStrings_operationUUID_requestContext_saveObserver_registrationError___block_invoke_2;
  v26[3] = &unk_1E1040C20;
  v26[4] = &v34;
  v26[5] = &v40;
  v26[6] = &v28;
  objc_msgSend(v22, "performPostInstallationRegistration:personaUniqueStrings:operationUUID:reply:", v13, v14, v15, v26);

  handleSaveObserverBehavior(v17, (void *)v35[5], v15, (void *)v29[5]);
  v23 = (void *)v41[5];
  if (a8 && !v23)
  {
    *a8 = objc_retainAutorelease((id)v29[5]);
    v23 = (void *)v41[5];
  }
  v24 = v23;

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);

  _Block_object_dispose(&v40, 8);
  return v24;
}

void __160__LSApplicationWorkspace_registerContainerizedApplicationWithInfoDictionaries_personaUniqueStrings_operationUUID_requestContext_saveObserver_registrationError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __160__LSApplicationWorkspace_registerContainerizedApplicationWithInfoDictionaries_personaUniqueStrings_operationUUID_requestContext_saveObserver_registrationError___block_invoke_2(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(_QWORD *)(a1[4] + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v8;
  v17 = v8;

  v12 = *(_QWORD *)(a1[5] + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v7;
  v14 = v7;

  v15 = *(_QWORD *)(a1[6] + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v9;

}

- (id)registerContainerizedApplicationWithInfoDictionaries:(id)a3 operationUUID:(id)a4 requestContext:(id)a5 saveObserver:(id)a6 registrationError:(id *)a7
{
  return -[LSApplicationWorkspace registerContainerizedApplicationWithInfoDictionaries:personaUniqueStrings:operationUUID:requestContext:saveObserver:registrationError:](self, "registerContainerizedApplicationWithInfoDictionaries:personaUniqueStrings:operationUUID:requestContext:saveObserver:registrationError:", a3, 0, a4, a5, a6, a7);
}

- (id)registerContainerizedApplicationWithInstallationRecord:(id)a3 extensionInstallationRecords:(id)a4 personaUniqueStrings:(id)a5 operationUUID:(id)a6 requestContext:(id)a7 saveObserver:(id)a8 registrationError:(id *)a9
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  LSApplicationWorkspace *v28;
  id *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v28 = self;
  v29 = a9;
  v35 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v14, "count") + 1);
  objc_msgSend(v13, "legacyRecordDictionary");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObject:", v19);

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v20 = v14;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v31;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v31 != v23)
          objc_enumerationMutation(v20);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v24), "legacyRecordDictionary", v28, v29, (_QWORD)v30);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObject:", v25);

        ++v24;
      }
      while (v22 != v24);
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v22);
  }

  -[LSApplicationWorkspace registerContainerizedApplicationWithInfoDictionaries:operationUUID:requestContext:saveObserver:registrationError:](v28, "registerContainerizedApplicationWithInfoDictionaries:operationUUID:requestContext:saveObserver:registrationError:", v18, v15, v16, v17, v29);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (BOOL)unregisterContainerizedApplicationWithBundleIdentifier:(id)a3 operationUUID:(id)a4 unregistrationOperation:(unsigned int)a5 precondition:(id)a6 requestContext:(id)a7 saveObserver:(id)a8 unregistrationError:(id *)a9
{
  uint64_t v12;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  int v24;
  BOOL v25;
  _QWORD v27[7];
  _QWORD v28[5];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;

  v12 = *(_QWORD *)&a5;
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 0;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__4;
  v39 = __Block_byref_object_dispose__4;
  v40 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__4;
  v33 = __Block_byref_object_dispose__4;
  v34 = 0;
  v19 = (void *)objc_opt_class();
  serviceDomainForRequestContext(v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  _LSDServiceGetXPCConnection(v19, (uint64_t)v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __180__LSApplicationWorkspace_unregisterContainerizedApplicationWithBundleIdentifier_operationUUID_unregistrationOperation_precondition_requestContext_saveObserver_unregistrationError___block_invoke;
  v28[3] = &unk_1E10407A0;
  v28[4] = &v35;
  objc_msgSend(v21, "synchronousRemoteObjectProxyWithErrorHandler:", v28);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v22;
  v27[1] = 3221225472;
  v27[2] = __180__LSApplicationWorkspace_unregisterContainerizedApplicationWithBundleIdentifier_operationUUID_unregistrationOperation_precondition_requestContext_saveObserver_unregistrationError___block_invoke_2;
  v27[3] = &unk_1E1040C48;
  v27[4] = &v29;
  v27[5] = &v35;
  v27[6] = &v41;
  objc_msgSend(v23, "performPostUninstallationUnregistrationOfBundleID:operationUUID:unregisterType:precondition:reply:", v14, v15, v12, v16, v27);

  handleSaveObserverBehavior(v18, (void *)v30[5], v15, (void *)v36[5]);
  v24 = *((unsigned __int8 *)v42 + 24);
  if (a9 && !*((_BYTE *)v42 + 24))
  {
    *a9 = objc_retainAutorelease((id)v36[5]);
    v24 = *((unsigned __int8 *)v42 + 24);
  }
  v25 = v24 != 0;

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);

  _Block_object_dispose(&v41, 8);
  return v25;
}

void __180__LSApplicationWorkspace_unregisterContainerizedApplicationWithBundleIdentifier_operationUUID_unregistrationOperation_precondition_requestContext_saveObserver_unregistrationError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __180__LSApplicationWorkspace_unregisterContainerizedApplicationWithBundleIdentifier_operationUUID_unregistrationOperation_precondition_requestContext_saveObserver_unregistrationError___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1[4] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(a1[5] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v11 == 0;
}

- (BOOL)unregisterContainerizedApplicationWithBundleIdentifier:(id)a3 operationUUID:(id)a4 unregistrationOperation:(unsigned int)a5 requestContext:(id)a6 saveObserver:(id)a7 unregistrationError:(id *)a8
{
  return -[LSApplicationWorkspace unregisterContainerizedApplicationWithBundleIdentifier:operationUUID:unregistrationOperation:precondition:requestContext:saveObserver:unregistrationError:](self, "unregisterContainerizedApplicationWithBundleIdentifier:operationUUID:unregistrationOperation:precondition:requestContext:saveObserver:unregistrationError:", a3, a4, *(_QWORD *)&a5, 0, a6, a7, a8);
}

- (BOOL)setPersonaUniqueStrings:(id)a3 forApplicationWithBundleIdentifier:(id)a4 operationUUID:(id)a5 requestContext:(id)a6 saveObserver:(id)a7 error:(id *)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  int v23;
  BOOL v24;
  _QWORD v26[7];
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  char v43;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v43 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__4;
  v38 = __Block_byref_object_dispose__4;
  v39 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__4;
  v32 = __Block_byref_object_dispose__4;
  v33 = 0;
  v18 = (void *)objc_opt_class();
  serviceDomainForRequestContext(v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  _LSDServiceGetXPCConnection(v18, (uint64_t)v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __133__LSApplicationWorkspace_setPersonaUniqueStrings_forApplicationWithBundleIdentifier_operationUUID_requestContext_saveObserver_error___block_invoke;
  v27[3] = &unk_1E10407A0;
  v27[4] = &v34;
  objc_msgSend(v20, "synchronousRemoteObjectProxyWithErrorHandler:", v27);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v21;
  v26[1] = 3221225472;
  v26[2] = __133__LSApplicationWorkspace_setPersonaUniqueStrings_forApplicationWithBundleIdentifier_operationUUID_requestContext_saveObserver_error___block_invoke_2;
  v26[3] = &unk_1E1040C48;
  v26[4] = &v28;
  v26[5] = &v34;
  v26[6] = &v40;
  objc_msgSend(v22, "performUpdateOfPersonasOfBundleID:toPersonaUniqueStrings:operationUUID:reply:", v14, v13, v15, v26);

  handleSaveObserverBehavior(v17, (void *)v29[5], v15, (void *)v35[5]);
  v23 = *((unsigned __int8 *)v41 + 24);
  if (a8 && !*((_BYTE *)v41 + 24))
  {
    *a8 = objc_retainAutorelease((id)v35[5]);
    v23 = *((unsigned __int8 *)v41 + 24);
  }
  v24 = v23 != 0;

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);

  _Block_object_dispose(&v40, 8);
  return v24;
}

void __133__LSApplicationWorkspace_setPersonaUniqueStrings_forApplicationWithBundleIdentifier_operationUUID_requestContext_saveObserver_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __133__LSApplicationWorkspace_setPersonaUniqueStrings_forApplicationWithBundleIdentifier_operationUUID_requestContext_saveObserver_error___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1[4] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(a1[5] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v11 == 0;
}

- (BOOL)sendNotificationOfType:(unsigned int)a3 forApplicationWithBundleIdentifier:(id)a4 requestContext:(id)a5 error:(id *)a6
{
  uint64_t v8;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  const __CFString *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  BOOL v20;
  _QWORD v22[6];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  _QWORD v34[2];

  v8 = *(_QWORD *)&a3;
  v34[1] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__4;
  v27 = __Block_byref_object_dispose__4;
  v28 = 0;
  if (v8 > 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unknown notification type %d"), v8);
    v14 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v14;
    if (v14)
      v15 = (const __CFString *)v14;
    else
      v15 = CFSTR("invalid input parameters");
    v33 = *MEMORY[0x1E0CB2938];
    v34[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"-[LSApplicationWorkspace sendNotificationOfType:forApplicationWithBundleIdentifier:requestContext:error:]", 2639, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v24[5];
    v24[5] = v17;

  }
  else
  {
    v12 = dword_1829FA7B0[(int)v8];
    -[LSApplicationWorkspace syncObserverProxy](self, "syncObserverProxy");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __105__LSApplicationWorkspace_sendNotificationOfType_forApplicationWithBundleIdentifier_requestContext_error___block_invoke;
    v22[3] = &unk_1E1040C70;
    v22[4] = &v23;
    v22[5] = &v29;
    objc_msgSend(v13, "sendNotification:forApplicationWithBundleIdentifier:completion:", v12, v10, v22);
  }

  v19 = *((unsigned __int8 *)v30 + 24);
  if (a6 && !*((_BYTE *)v30 + 24))
  {
    *a6 = objc_retainAutorelease((id)v24[5]);
    v19 = *((unsigned __int8 *)v30 + 24);
  }
  v20 = v19 != 0;
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);
  return v20;
}

void __105__LSApplicationWorkspace_sendNotificationOfType_forApplicationWithBundleIdentifier_requestContext_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v4 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4 == 0;

}

- (BOOL)registerApplicationForRebuildWithInfoDictionaries:(id)a3 personaUniqueStrings:(id)a4 requestContext:(id)a5 registrationError:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  BOOL v18;
  _QWORD v20[6];
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__4;
  v26 = __Block_byref_object_dispose__4;
  v27 = 0;
  v12 = (void *)objc_opt_class();
  serviceDomainForRequestContext(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  _LSDServiceGetXPCConnection(v12, (uint64_t)v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __130__LSApplicationWorkspace_registerApplicationForRebuildWithInfoDictionaries_personaUniqueStrings_requestContext_registrationError___block_invoke;
  v21[3] = &unk_1E10407A0;
  v21[4] = &v22;
  objc_msgSend(v14, "synchronousRemoteObjectProxyWithErrorHandler:", v21);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v15;
  v20[1] = 3221225472;
  v20[2] = __130__LSApplicationWorkspace_registerApplicationForRebuildWithInfoDictionaries_personaUniqueStrings_requestContext_registrationError___block_invoke_2;
  v20[3] = &unk_1E1040C70;
  v20[4] = &v28;
  v20[5] = &v22;
  objc_msgSend(v16, "performRebuildRegistration:personaUniqueStrings:reply:", v9, v10, v20);

  v17 = *((unsigned __int8 *)v29 + 24);
  if (a6 && !*((_BYTE *)v29 + 24))
  {
    *a6 = objc_retainAutorelease((id)v23[5]);
    v17 = *((unsigned __int8 *)v29 + 24);
  }
  v18 = v17 != 0;

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v18;
}

void __130__LSApplicationWorkspace_registerApplicationForRebuildWithInfoDictionaries_personaUniqueStrings_requestContext_registrationError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __130__LSApplicationWorkspace_registerApplicationForRebuildWithInfoDictionaries_personaUniqueStrings_requestContext_registrationError___block_invoke_2(uint64_t a1, void *a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2 == 0;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
}

- (BOOL)registerApplicationForRebuildWithInfoDictionaries:(id)a3 requestContext:(id)a4 registrationError:(id *)a5
{
  return -[LSApplicationWorkspace registerApplicationForRebuildWithInfoDictionaries:personaUniqueStrings:requestContext:registrationError:](self, "registerApplicationForRebuildWithInfoDictionaries:personaUniqueStrings:requestContext:registrationError:", a3, 0, a4, a5);
}

- (BOOL)registerApplicationForRebuildWithInstallationRecord:(id)a3 extensionInstallationRecords:(id)a4 personaUniqueStrings:(id)a5 requestContext:(id)a6 registrationError:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  BOOL v23;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v12, "count") + 1);
  objc_msgSend(v11, "legacyRecordDictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObject:", v16);

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v17 = v12;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v27;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v27 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v21), "legacyRecordDictionary");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v22);

        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v19);
  }

  v23 = -[LSApplicationWorkspace registerApplicationForRebuildWithInfoDictionaries:personaUniqueStrings:requestContext:registrationError:](self, "registerApplicationForRebuildWithInfoDictionaries:personaUniqueStrings:requestContext:registrationError:", v15, v13, v14, a7);
  return v23;
}

- (BOOL)updatePlaceholderMetadataForApplicationWithIdentifier:(id)a3 operationUUID:(id)a4 requestContext:(id)a5 installType:(unint64_t)a6 failure:(unint64_t)a7 saveObserver:(id)a8 error:(id *)a9
{
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL8 v22;
  BOOL v23;
  id v24;
  id v25;
  id v27;
  id v28;
  _QWORD v29[2];
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  v29[0] = CFSTR("LSInstallType");
  v14 = (void *)MEMORY[0x1E0CB37E8];
  v15 = a8;
  v16 = a4;
  v17 = a3;
  objc_msgSend(v14, "numberWithUnsignedInteger:", a6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = CFSTR("PlaceholderFailureReason");
  v30[0] = v18;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = a6 - 7 < 3 && a7 != 0;
  v27 = 0;
  v28 = 0;
  v23 = -[LSApplicationWorkspace updateRecordForApp:withSINF:iTunesMetadata:placeholderMetadata:sendNotification:operationUUID:outSaveToken:error:](self, "updateRecordForApp:withSINF:iTunesMetadata:placeholderMetadata:sendNotification:operationUUID:outSaveToken:error:", v17, 0, 0, v20, v22, v16, &v28, &v27);

  v24 = v28;
  v25 = v27;

  handleSaveObserverBehavior(v15, v24, v16, v25);
  if (a9 && !v23)
    *a9 = objc_retainAutorelease(v25);

  return v23;
}

- (BOOL)updateiTunesMetadataForApplicationWithIdentifier:(id)a3 operationUUID:(id)a4 requestContext:(id)a5 metadataPlist:(id)a6 saveObserver:(id)a7 error:(id *)a8
{
  id v13;
  id v14;
  BOOL v15;
  id v16;
  id v17;
  id v19;
  id v20;

  v19 = 0;
  v20 = 0;
  v13 = a7;
  v14 = a4;
  v15 = -[LSApplicationWorkspace updateRecordForApp:withSINF:iTunesMetadata:placeholderMetadata:sendNotification:operationUUID:outSaveToken:error:](self, "updateRecordForApp:withSINF:iTunesMetadata:placeholderMetadata:sendNotification:operationUUID:outSaveToken:error:", a3, 0, a6, 0, 0, v14, &v20, &v19);
  v16 = v20;
  v17 = v19;
  handleSaveObserverBehavior(v13, v16, v14, v17);

  if (a8 && !v15)
    *a8 = objc_retainAutorelease(v17);

  return v15;
}

- (BOOL)updateSINFMetadataForApplicationWithIdentifier:(id)a3 operationUUID:(id)a4 requestContext:(id)a5 parsedSINFInfo:(id)a6 saveObserver:(id)a7 error:(id *)a8
{
  id v13;
  id v14;
  BOOL v15;
  id v16;
  id v17;
  id v19;
  id v20;

  v19 = 0;
  v20 = 0;
  v13 = a7;
  v14 = a4;
  v15 = -[LSApplicationWorkspace updateRecordForApp:withSINF:iTunesMetadata:placeholderMetadata:sendNotification:operationUUID:outSaveToken:error:](self, "updateRecordForApp:withSINF:iTunesMetadata:placeholderMetadata:sendNotification:operationUUID:outSaveToken:error:", a3, a6, 0, 0, 0, v14, &v20, &v19);
  v16 = v20;
  v17 = v19;
  handleSaveObserverBehavior(v13, v16, v14, v17);

  if (a8 && !v15)
    *a8 = objc_retainAutorelease(v17);

  return v15;
}

- (BOOL)setProgressProportionsByPhase:(id)a3 forInstallOfApplicationWithIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v8 = a3;
  v9 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__4;
  v18 = __Block_byref_object_dispose__4;
  v19 = 0;
  -[LSApplicationWorkspace syncObserverProxy](self, "syncObserverProxy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __100__LSApplicationWorkspace_setProgressProportionsByPhase_forInstallOfApplicationWithIdentifier_error___block_invoke;
  v13[3] = &unk_1E10407A0;
  v13[4] = &v14;
  objc_msgSend(v10, "setProgressProportionsByPhase:forInstallOfApplicationWithIdentifier:completion:", v8, v9, v13);

  v11 = (void *)v15[5];
  if (a5 && v11)
    *a5 = objc_retainAutorelease(v11);
  _Block_object_dispose(&v14, 8);

  return v11 == 0;
}

void __100__LSApplicationWorkspace_setProgressProportionsByPhase_forInstallOfApplicationWithIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)installApplication:(id)a3 withOptions:(id)a4
{
  return -[LSApplicationWorkspace installApplication:withOptions:error:usingBlock:](self, "installApplication:withOptions:error:usingBlock:", a3, a4, 0, 0);
}

- (BOOL)installApplication:(id)a3 withOptions:(id)a4 error:(id *)a5
{
  return -[LSApplicationWorkspace installApplication:withOptions:error:usingBlock:](self, "installApplication:withOptions:error:usingBlock:", a3, a4, a5, 0);
}

- (void)placeholderInstalledForIdentifier:(id)a3 filterDowngrades:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v4 = a4;
  +[LSApplicationProxy applicationProxyForIdentifier:placeholder:](LSApplicationProxy, "applicationProxyForIdentifier:placeholder:", a3, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v6;
  if (!v4
    || (v7 = objc_msgSend(v6, "installType"), v8 = v12, v7 != 8)
    && (v9 = objc_msgSend(v12, "installType"), v8 = v12, v9 != 7)
    && (v10 = objc_msgSend(v12, "installType"), v8 = v12, v10 != 9))
  {
    -[LSApplicationWorkspace installProgressForApplication:withPhase:](self, "installProgressForApplication:withPhase:", v12, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setInstallState:", 5);
    -[LSApplicationWorkspace installPhaseFinishedForProgress:](self, "installPhaseFinishedForProgress:", v11);

    v8 = v12;
  }

}

- (BOOL)installApplication:(id)a3 withOptions:(id)a4 error:(id *)a5 usingBlock:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  int v23;
  BOOL v24;
  _QWORD v26[6];
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  if (!getenv("LS_AVOID_SHIM_FAULTS_TEMPORARILY"))
  {
    _LSInstallLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      -[LSApplicationWorkspace installApplication:withOptions:error:usingBlock:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);

  }
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__4;
  v32 = __Block_byref_object_dispose__4;
  v33 = 0;
  +[_LSInstallerClient syncServerInstallerProxyForShim]();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __74__LSApplicationWorkspace_installApplication_withOptions_error_usingBlock___block_invoke;
  v27[3] = &unk_1E10407A0;
  v27[4] = &v28;
  objc_msgSend(v20, "synchronousRemoteObjectProxyWithErrorHandler:", v27);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v21;
  v26[1] = 3221225472;
  v26[2] = __74__LSApplicationWorkspace_installApplication_withOptions_error_usingBlock___block_invoke_2;
  v26[3] = &unk_1E10409D8;
  v26[4] = &v34;
  v26[5] = &v28;
  objc_msgSend(v22, "performShimmedInstallOfArtifact:options:completion:", v9, v10, v26);

  v23 = *((unsigned __int8 *)v35 + 24);
  if (a5 && !*((_BYTE *)v35 + 24))
  {
    *a5 = objc_retainAutorelease((id)v29[5]);
    v23 = *((unsigned __int8 *)v35 + 24);
  }
  v24 = v23 != 0;
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v34, 8);
  return v24;
}

void __74__LSApplicationWorkspace_installApplication_withOptions_error_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __74__LSApplicationWorkspace_installApplication_withOptions_error_usingBlock___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)installContainerizedApplicationArtifactAtURL:(id)a3 withOptions:(id)a4 error:(id *)a5 progressBlock:(id)a6
{
  return -[LSApplicationWorkspace installContainerizedApplicationArtifactAtURL:withOptions:returningRecordPromise:error:progressBlock:](self, "installContainerizedApplicationArtifactAtURL:withOptions:returningRecordPromise:error:progressBlock:", a3, a4, 0, a5, a6);
}

- (BOOL)installContainerizedApplicationArtifactAtURL:(id)a3 withOptions:(id)a4 returningRecordPromise:(id *)a5 error:(id *)a6 progressBlock:(id)a7
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  int v24;
  BOOL v25;
  _QWORD v27[6];
  _QWORD v28[5];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;

  v10 = a3;
  v11 = a4;
  v12 = a7;
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 0;
  if (!getenv("LS_AVOID_SHIM_FAULTS_TEMPORARILY"))
  {
    _LSInstallLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[LSApplicationWorkspace installContainerizedApplicationArtifactAtURL:withOptions:returningRecordPromise:error:progressBlock:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);

  }
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__4;
  v33 = __Block_byref_object_dispose__4;
  v34 = 0;
  +[_LSInstallerClient syncServerInstallerProxyForShim]();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __126__LSApplicationWorkspace_installContainerizedApplicationArtifactAtURL_withOptions_returningRecordPromise_error_progressBlock___block_invoke;
  v28[3] = &unk_1E10407A0;
  v28[4] = &v29;
  objc_msgSend(v21, "synchronousRemoteObjectProxyWithErrorHandler:", v28);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v22;
  v27[1] = 3221225472;
  v27[2] = __126__LSApplicationWorkspace_installContainerizedApplicationArtifactAtURL_withOptions_returningRecordPromise_error_progressBlock___block_invoke_2;
  v27[3] = &unk_1E10409D8;
  v27[4] = &v35;
  v27[5] = &v29;
  objc_msgSend(v23, "performShimmedInstallOfArtifact:options:completion:", v10, v11, v27);

  v24 = *((unsigned __int8 *)v36 + 24);
  if (a6 && !*((_BYTE *)v36 + 24))
  {
    *a6 = objc_retainAutorelease((id)v30[5]);
    v24 = *((unsigned __int8 *)v36 + 24);
  }
  v25 = v24 != 0;
  _Block_object_dispose(&v29, 8);

  _Block_object_dispose(&v35, 8);
  return v25;
}

void __126__LSApplicationWorkspace_installContainerizedApplicationArtifactAtURL_withOptions_returningRecordPromise_error_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __126__LSApplicationWorkspace_installContainerizedApplicationArtifactAtURL_withOptions_returningRecordPromise_error_progressBlock___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)uninstallContainerizedApplicationWithIdentifier:(id)a3 options:(id)a4 error:(id *)a5 progressBlock:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  int v23;
  BOOL v24;
  _QWORD v26[6];
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  if (!getenv("LS_AVOID_SHIM_FAULTS_TEMPORARILY"))
  {
    _LSInstallLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      -[LSApplicationWorkspace uninstallContainerizedApplicationWithIdentifier:options:error:progressBlock:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);

  }
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__4;
  v32 = __Block_byref_object_dispose__4;
  v33 = 0;
  +[_LSInstallerClient syncServerInstallerProxyForShim]();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __102__LSApplicationWorkspace_uninstallContainerizedApplicationWithIdentifier_options_error_progressBlock___block_invoke;
  v27[3] = &unk_1E10407A0;
  v27[4] = &v28;
  objc_msgSend(v20, "synchronousRemoteObjectProxyWithErrorHandler:", v27);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v21;
  v26[1] = 3221225472;
  v26[2] = __102__LSApplicationWorkspace_uninstallContainerizedApplicationWithIdentifier_options_error_progressBlock___block_invoke_2;
  v26[3] = &unk_1E10409D8;
  v26[4] = &v34;
  v26[5] = &v28;
  objc_msgSend(v22, "performShimmedUninstallOfApplicationWithIdentifier:options:completion:", v9, v10, v26);

  v23 = *((unsigned __int8 *)v35 + 24);
  if (a5 && !*((_BYTE *)v35 + 24))
  {
    *a5 = objc_retainAutorelease((id)v29[5]);
    v23 = *((unsigned __int8 *)v35 + 24);
  }
  v24 = v23 != 0;
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v34, 8);
  return v24;
}

void __102__LSApplicationWorkspace_uninstallContainerizedApplicationWithIdentifier_options_error_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __102__LSApplicationWorkspace_uninstallContainerizedApplicationWithIdentifier_options_error_progressBlock___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)downgradeApplicationToPlaceholder:(id)a3 withOptions:(id)a4 error:(id *)a5
{
  NSObject *v6;
  void *v7;
  void *v8;

  _LSInstallLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    -[LSApplicationWorkspace downgradeApplicationToPlaceholder:withOptions:error:].cold.1();

  _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -4, (uint64_t)"-[LSApplicationWorkspace downgradeApplicationToPlaceholder:withOptions:error:]", 3028, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a5)
    *a5 = objc_retainAutorelease(v7);

  return 0;
}

- (BOOL)uninstallApplication:(id)a3 withOptions:(id)a4
{
  return -[LSApplicationWorkspace uninstallApplication:withOptions:error:usingBlock:](self, "uninstallApplication:withOptions:error:usingBlock:", a3, a4, 0, 0);
}

- (BOOL)uninstallApplication:(id)a3 withOptions:(id)a4 usingBlock:(id)a5
{
  return -[LSApplicationWorkspace uninstallApplication:withOptions:error:usingBlock:](self, "uninstallApplication:withOptions:error:usingBlock:", a3, a4, 0, a5);
}

- (BOOL)uninstallApplication:(id)a3 withOptions:(id)a4 error:(id *)a5 usingBlock:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  int v23;
  BOOL v24;
  _QWORD v26[6];
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  if (!getenv("LS_AVOID_SHIM_FAULTS_TEMPORARILY"))
  {
    _LSInstallLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      -[LSApplicationWorkspace uninstallApplication:withOptions:error:usingBlock:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);

  }
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__4;
  v32 = __Block_byref_object_dispose__4;
  v33 = 0;
  +[_LSInstallerClient syncServerInstallerProxyForShim]();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __76__LSApplicationWorkspace_uninstallApplication_withOptions_error_usingBlock___block_invoke;
  v27[3] = &unk_1E10407A0;
  v27[4] = &v28;
  objc_msgSend(v20, "synchronousRemoteObjectProxyWithErrorHandler:", v27);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v21;
  v26[1] = 3221225472;
  v26[2] = __76__LSApplicationWorkspace_uninstallApplication_withOptions_error_usingBlock___block_invoke_2;
  v26[3] = &unk_1E10409D8;
  v26[4] = &v34;
  v26[5] = &v28;
  objc_msgSend(v22, "performShimmedUninstallOfApplicationWithIdentifier:options:completion:", v9, v10, v26);

  v23 = *((unsigned __int8 *)v35 + 24);
  if (a5 && !*((_BYTE *)v35 + 24))
  {
    *a5 = objc_retainAutorelease((id)v29[5]);
    v23 = *((unsigned __int8 *)v35 + 24);
  }
  v24 = v23 != 0;
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v34, 8);
  return v24;
}

void __76__LSApplicationWorkspace_uninstallApplication_withOptions_error_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __76__LSApplicationWorkspace_uninstallApplication_withOptions_error_usingBlock___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)restoreSystemApplication:(id)a3
{
  return 0;
}

- (BOOL)registerApplicationDictionary:(id)a3 withObserverNotification:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  NSObject *v13;
  void *v14;
  BOOL v15;
  _QWORD v17[2];

  v4 = *(_QWORD *)&a4;
  v17[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("IsPlaceholder"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AE78]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v10 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Path"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
LABEL_11:
    v11 = -50;
    goto LABEL_9;
  }
  v11 = registerApplicationWithDictionary(v6, 1u);
  if (!v11)
  {
    +[LSApplicationProxy applicationProxyForIdentifier:placeholder:](LSApplicationProxy, "applicationProxyForIdentifier:placeholder:", v9, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      -[LSApplicationWorkspace observerProxy](self, "observerProxy");
      v13 = objc_claimAutoreleasedReturnValue();
      v17[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject sendNotification:forApplications:withPlugins:](v13, "sendNotification:forApplications:withPlugins:", v4, v14, 0);

    }
    else
    {
      _LSProgressLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[LSApplicationWorkspace registerApplicationDictionary:withObserverNotification:].cold.1();
    }

    v11 = 0;
  }
LABEL_9:
  v15 = v11 == 0;

  return v15;
}

- (BOOL)registerApplicationDictionary:(id)a3
{
  return -[LSApplicationWorkspace registerApplicationDictionary:withObserverNotification:](self, "registerApplicationDictionary:withObserverNotification:", a3, 7);
}

- (BOOL)registerApplication:(id)a3
{
  OSStatus v3;
  NSObject *v4;
  uint8_t v6[16];

  v3 = LSRegisterURL((CFURLRef)a3, 0);
  if (!v3)
  {
    _LSInstallLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_182882000, v4, OS_LOG_TYPE_DEFAULT, "Not sending applicationsDidInstall notification, please file a bug with Purple LaunchServices if you need this", v6, 2u);
    }

  }
  return v3 == 0;
}

- (BOOL)unregisterApplicationsAtMountPoint:(id)a3 operationUUID:(id)a4 saveObserver:(id)a5 requestContext:(id)a6
{
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  BOOL v17;
  id v19;
  id v20;
  id v21;
  _QWORD v22[6];
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  _QWORD v31[4];
  id v32;
  _BYTE v33[32];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  v21 = a4;
  v19 = a5;
  v9 = a6;
  v30 = 0;
  v31[0] = &v30;
  v31[1] = 0x3032000000;
  v31[2] = __Block_byref_object_copy__4;
  v31[3] = __Block_byref_object_dispose__4;
  v32 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__4;
  v28 = __Block_byref_object_dispose__4;
  v29 = 0;
  v10 = MEMORY[0x1E0C809B0];
  do
  {
    v11 = (void *)objc_opt_class();
    serviceDomainForRequestContext(v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _LSDServiceGetXPCConnection(v11, (uint64_t)v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v23[0] = v10;
    v23[1] = 3221225472;
    v23[2] = __103__LSApplicationWorkspace_unregisterApplicationsAtMountPoint_operationUUID_saveObserver_requestContext___block_invoke;
    v23[3] = &unk_1E10407A0;
    v23[4] = &v30;
    objc_msgSend(v13, "synchronousRemoteObjectProxyWithErrorHandler:", v23);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v10;
    v22[1] = 3221225472;
    v22[2] = __103__LSApplicationWorkspace_unregisterApplicationsAtMountPoint_operationUUID_saveObserver_requestContext___block_invoke_2;
    v22[3] = &unk_1E1040C98;
    v22[4] = &v24;
    v22[5] = &v30;
    objc_msgSend(v14, "unregisterApplicationsAtMountPoint:operationUUID:reply:", v20, v21, v22);

  }
  while (_LSNSErrorIsXPCConnectionInterrupted(*(void **)(v31[0] + 40)));
  handleSaveObserverBehavior(v19, (void *)v25[5], v21, *(void **)(v31[0] + 40));
  if (*(_QWORD *)(v31[0] + 40))
  {
    _LSDefaultLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v20, "absoluteString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[LSApplicationWorkspace unregisterApplicationsAtMountPoint:operationUUID:saveObserver:requestContext:].cold.1(v16, (uint64_t)v31, (uint64_t)v33, v15);
    }

    v17 = *(_QWORD *)(v31[0] + 40) == 0;
  }
  else
  {
    v17 = 1;
  }
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  return v17;
}

void __103__LSApplicationWorkspace_unregisterApplicationsAtMountPoint_operationUUID_saveObserver_requestContext___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __103__LSApplicationWorkspace_unregisterApplicationsAtMountPoint_operationUUID_saveObserver_requestContext___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (BOOL)unregisterApplication:(id)a3
{
  id v3;
  void (*v4)(_QWORD, _QWORD);
  void *v5;
  void *v6;
  NSObject *v7;
  BOOL v8;
  _QWORD v10[5];
  void (*v11[5])(_QWORD, _QWORD);
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v3 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__4;
  v16 = __Block_byref_object_dispose__4;
  v17 = 0;
  v4 = (void (*)(_QWORD, _QWORD))MEMORY[0x1E0C809B0];
  do
  {
    v5 = (void *)v13[5];
    v13[5] = 0;

    v11[0] = v4;
    v11[1] = (void (*)(_QWORD, _QWORD))3221225472;
    v11[2] = (void (*)(_QWORD, _QWORD))__48__LSApplicationWorkspace_unregisterApplication___block_invoke;
    v11[3] = (void (*)(_QWORD, _QWORD))&unk_1E10407A0;
    v11[4] = (void (*)(_QWORD, _QWORD))&v12;
    +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDModifyService, v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v4;
    v10[1] = 3221225472;
    v10[2] = __48__LSApplicationWorkspace_unregisterApplication___block_invoke_2;
    v10[3] = &unk_1E10407A0;
    v10[4] = &v12;
    objc_msgSend(v6, "unregisterApplicationAtURL:reply:", v3, v10);

  }
  while (_LSNSErrorIsXPCConnectionInterrupted((void *)v13[5]));
  if (v13[5])
  {
    _LSDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[LSApplicationWorkspace unregisterApplication:].cold.1();

    v8 = v13[5] == 0;
  }
  else
  {
    v8 = 1;
  }
  _Block_object_dispose(&v12, 8);

  return v8;
}

void __48__LSApplicationWorkspace_unregisterApplication___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __48__LSApplicationWorkspace_unregisterApplication___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  v4 = a2;
  if (v4)
  {
    v5 = v4;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v4 = v5;
  }

}

- (BOOL)updateRecordForApp:(id)a3 withSINF:(id)a4 iTunesMetadata:(id)a5 placeholderMetadata:(id)a6 sendNotification:(int)a7 operationUUID:(id)a8 outSaveToken:(id *)a9 error:(id *)a10
{
  uint64_t v11;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  int v20;
  BOOL v21;
  uint64_t v23;
  id v24;
  id v25;
  _QWORD v26[7];
  void (*v27[5])(_QWORD, _QWORD);
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  char v43;

  v11 = *(_QWORD *)&a7;
  v25 = a3;
  v24 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a8;
  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v43 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__4;
  v38 = __Block_byref_object_dispose__4;
  v39 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__4;
  v32 = __Block_byref_object_dispose__4;
  v33 = 0;
  v18 = MEMORY[0x1E0C809B0];
  v27[0] = (void (*)(_QWORD, _QWORD))MEMORY[0x1E0C809B0];
  v27[1] = (void (*)(_QWORD, _QWORD))3221225472;
  v27[2] = (void (*)(_QWORD, _QWORD))__139__LSApplicationWorkspace_updateRecordForApp_withSINF_iTunesMetadata_placeholderMetadata_sendNotification_operationUUID_outSaveToken_error___block_invoke;
  v27[3] = (void (*)(_QWORD, _QWORD))&unk_1E10407A0;
  v27[4] = (void (*)(_QWORD, _QWORD))&v34;
  +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDModifyService, v27);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v18;
  v26[1] = 3221225472;
  v26[2] = __139__LSApplicationWorkspace_updateRecordForApp_withSINF_iTunesMetadata_placeholderMetadata_sendNotification_operationUUID_outSaveToken_error___block_invoke_2;
  v26[3] = &unk_1E1040CC0;
  v26[4] = &v28;
  v26[5] = &v40;
  v26[6] = &v34;
  LOBYTE(v23) = a9 != 0;
  objc_msgSend(v19, "updateRecordForApp:withSINF:iTunesMetadata:placeholderMetadata:sendNotification:operationUUID:returnSaveToken:completionHandler:", v25, v24, v15, v16, v11, v17, v23, v26);
  _LSContextInvalidate();
  v20 = *((unsigned __int8 *)v41 + 24);
  if (a9 && *((_BYTE *)v41 + 24))
  {
    *a9 = objc_retainAutorelease((id)v29[5]);
    v20 = *((unsigned __int8 *)v41 + 24);
  }
  if (a10 && !v20)
  {
    *a10 = objc_retainAutorelease((id)v35[5]);
    v20 = *((unsigned __int8 *)v41 + 24);
  }
  v21 = v20 != 0;

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);

  _Block_object_dispose(&v40, 8);
  return v21;
}

void __139__LSApplicationWorkspace_updateRecordForApp_withSINF_iTunesMetadata_placeholderMetadata_sendNotification_operationUUID_outSaveToken_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __139__LSApplicationWorkspace_updateRecordForApp_withSINF_iTunesMetadata_placeholderMetadata_sendNotification_operationUUID_outSaveToken_error___block_invoke_2(_QWORD *a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v7 = a3;
  v8 = a4;
  v9 = *(_QWORD *)(a1[4] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v7;
  v13 = v7;

  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = a2;
  v11 = *(_QWORD *)(a1[6] + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v8;

}

- (BOOL)updateSINFWithData:(id)a3 forApplication:(id)a4 options:(id)a5 error:(id *)a6
{
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;

  _LSDefaultLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    -[LSApplicationWorkspace updateSINFWithData:forApplication:options:error:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);

  _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -4, (uint64_t)"-[LSApplicationWorkspace updateSINFWithData:forApplication:options:error:]", 3245, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (a6)
    *a6 = objc_retainAutorelease(v15);

  return 0;
}

- (BOOL)_getBundleIdentifierForBundleAtURL:(id)a3 invokeUpdateBlockAndReregister:(id)a4 error:(id *)a5
{
  const __CFURL *v7;
  uint64_t (**v8)(id, const __CFURL *, NSObject *, id *);
  LSApplicationRecord *v9;
  id v10;
  NSObject *v11;
  int v12;
  id v13;
  BOOL v14;
  OSStatus v15;
  BOOL v16;
  NSObject *v17;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v7 = (const __CFURL *)a3;
  v8 = (uint64_t (**)(id, const __CFURL *, NSObject *, id *))a4;
  v21 = 0;
  v9 = -[LSApplicationRecord initWithURL:allowPlaceholder:error:]([LSApplicationRecord alloc], "initWithURL:allowPlaceholder:error:", v7, 1, &v21);
  v10 = v21;
  if (!v9)
  {
    _LSDefaultLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[LSApplicationWorkspace _getBundleIdentifierForBundleAtURL:invokeUpdateBlockAndReregister:error:].cold.1();
    goto LABEL_14;
  }
  -[LSBundleRecord bundleIdentifier](v9, "bundleIdentifier");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v20 = v10;
    v12 = v8[2](v8, v7, v11, &v20);
    v13 = v20;

    if (v12)
    {
      v14 = 1;
      v15 = LSRegisterURL(v7, 1u);
      v19 = v13;
      v16 = _LSGetNSErrorFromOSStatusImpl(v15, &v19, (uint64_t)"-[LSApplicationWorkspace _getBundleIdentifierForBundleAtURL:invokeUpdateBlockAndReregister:error:]", 3265);
      v10 = v19;

      if (v16)
        goto LABEL_15;
      _LSDefaultLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[LSApplicationWorkspace _getBundleIdentifierForBundleAtURL:invokeUpdateBlockAndReregister:error:].cold.2();
      goto LABEL_13;
    }
    _LSDefaultLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[LSApplicationWorkspace _getBundleIdentifierForBundleAtURL:invokeUpdateBlockAndReregister:error:].cold.3();
  }
  else
  {
    v22 = *MEMORY[0x1E0CB2938];
    v23[0] = CFSTR("provided bundle URL was not a bundle with a bundle identifier");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v17 = objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl(CFSTR("LSApplicationWorkspaceErrorDomain"), 112, (uint64_t)"-[LSApplicationWorkspace _getBundleIdentifierForBundleAtURL:invokeUpdateBlockAndReregister:error:]", 3276, v17);
    v13 = (id)objc_claimAutoreleasedReturnValue();

  }
  v10 = v13;
LABEL_13:

LABEL_14:
  v14 = 0;
LABEL_15:

  if (a5)
    *a5 = objc_retainAutorelease(v10);

  return v14;
}

- (BOOL)updateSINFWithData:(id)a3 forApplicationAtURL:(id)a4 error:(id *)a5
{
  if (a5)
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -4, (uint64_t)"-[LSApplicationWorkspace updateSINFWithData:forApplicationAtURL:error:]", 3313, 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)updateiTunesMetadataWithData:(id)a3 forApplication:(id)a4 options:(id)a5 error:(id *)a6
{
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;

  _LSDefaultLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    -[LSApplicationWorkspace updateiTunesMetadataWithData:forApplication:options:error:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);

  _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -4, (uint64_t)"-[LSApplicationWorkspace updateiTunesMetadataWithData:forApplication:options:error:]", 3325, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (a6)
    *a6 = objc_retainAutorelease(v15);

  return 0;
}

- (BOOL)updateiTunesMetadataWithData:(id)a3 forApplicationAtURL:(id)a4 error:(id *)a5
{
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  _LSDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    -[LSApplicationWorkspace updateiTunesMetadataWithData:forApplicationAtURL:error:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

  if (a5)
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -4, (uint64_t)"-[LSApplicationWorkspace updateiTunesMetadataWithData:forApplicationAtURL:error:]", 3337, 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)updatePlaceholderMetadataForApp:(id)a3 installType:(unint64_t)a4 failure:(unint64_t)a5 underlyingError:(id)a6 source:(unint64_t)a7 outError:(id *)a8
{
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  _BOOL8 v24;
  _BOOL8 v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id *v35;
  void *v37;
  id v38;
  void *v39;
  id v41;
  _QWORD v42[2];
  _QWORD v43[3];

  v43[2] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = (void *)MEMORY[0x1E0CB37E8];
  v15 = a6;
  objc_msgSend(v14, "numberWithUnsignedInteger:", a5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a7);
  v38 = v15;
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v17;
  _LSLogStepStart(11, 0, v13, CFSTR("Updating PlaceholderMetadata for %@ with failure %@ <LSInstallType %@, underlyingError (%@), source %@>"), v18, v19, v20, v21, (uint64_t)v13);

  ((void (*)(void *, uint64_t, uint64_t, void *, uint64_t))softLinkMobileInstallationUpdatePlaceholderMetadata[0])(v13, a4, a5, v15, a7);
  v22 = (id)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    _LSDefaultLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[LSApplicationWorkspace updatePlaceholderMetadataForApp:installType:failure:underlyingError:source:outError:].cold.1();
    v24 = 0;
  }
  else
  {
    v26 = a4 - 7 < 3 && a5 != 0;
    v42[0] = CFSTR("LSInstallType");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v42[1] = CFSTR("PlaceholderFailureReason");
    v43[0] = v27;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v43[1] = v28;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0;
    v24 = -[LSApplicationWorkspace updateRecordForApp:withSINF:iTunesMetadata:placeholderMetadata:sendNotification:operationUUID:outSaveToken:error:](self, "updateRecordForApp:withSINF:iTunesMetadata:placeholderMetadata:sendNotification:operationUUID:outSaveToken:error:", v13, 0, 0, v29, v26, v30, 0, &v41, v37, v38, v39);
    v22 = v41;

    if (!v26)
    {
      v35 = a8;
      goto LABEL_14;
    }
    -[LSApplicationWorkspace observerProxy](self, "observerProxy");
    v23 = objc_claimAutoreleasedReturnValue();
    -[NSObject installationEndedForApplication:withState:](v23, "installationEndedForApplication:withState:", v13, 4);
  }
  v35 = a8;

LABEL_14:
  _LSLogStepFinished(11, v24, v13, CFSTR("Updated PlaceholderMetadata for app with error %@"), v31, v32, v33, v34, (uint64_t)v22);
  if (v35 && !v24)
    *v35 = objc_retainAutorelease(v22);

  return v24;
}

- (BOOL)initiateProgressForApp:(id)a3 withType:(unint64_t)a4
{
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t updated;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v19;
  id v20;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a3;
  objc_msgSend(v6, "numberWithUnsignedInteger:", a4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  _LSLogStepStart(11, 0, v7, CFSTR("Updating PlaceholderMetadata for %@ with LSInstallType %@"), v8, v9, v10, v11, (uint64_t)v7);

  -[LSApplicationWorkspace placeholderInstalledForIdentifier:filterDowngrades:](self, "placeholderInstalledForIdentifier:filterDowngrades:", v7, 0);
  v20 = 0;
  updated = _updatePlaceholderInstallType(self, v7, a4, &v20);
  v13 = v20;
  _LSLogStepFinished(11, updated, v7, CFSTR("Updated PlaceholderMetadata for app with error %@"), v14, v15, v16, v17, (uint64_t)v13);

  return updated;
}

- (BOOL)updatePlaceholderWithBundleIdentifier:(id)a3 withInstallType:(unint64_t)a4 error:(id *)a5
{
  return _updatePlaceholderInstallType(self, a3, a4, a5);
}

- (BOOL)revertContainerizedApplicationWithIdentifier:(id)a3 options:(id)a4 error:(id *)a5 progressBlock:(id)a6
{
  return -[LSApplicationWorkspace revertContainerizedApplicationWithIdentifier:options:returningRecordPromise:error:progressBlock:](self, "revertContainerizedApplicationWithIdentifier:options:returningRecordPromise:error:progressBlock:", a3, a4, 0, a5, a6);
}

- (BOOL)revertContainerizedApplicationWithIdentifier:(id)a3 options:(id)a4 returningRecordPromise:(id *)a5 error:(id *)a6 progressBlock:(id)a7
{
  if (a6)
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -4, (uint64_t)"-[LSApplicationWorkspace revertContainerizedApplicationWithIdentifier:options:returningRecordPromise:error:progressBlock:]", 3437, 0);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)registerPlugin:(id)a3
{
  id v3;
  int v4;

  if (!a3)
    return 0;
  v3 = a3;
  _LSUnregisterPluginsAtURL(v3, 0);
  v4 = _LSRegisterPluginWithInfo(v3, 0);

  return v4 == 0;
}

- (BOOL)unregisterPlugin:(id)a3
{
  id v3;
  BOOL v4;
  id v5;
  NSObject *v6;
  id v8;

  v3 = a3;
  v8 = 0;
  v4 = _LSUnregisterPluginsAtURL(v3, &v8);
  v5 = v8;
  if (!v4)
  {
    _LSDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[LSApplicationWorkspace unregisterPlugin:].cold.1();

  }
  return v4;
}

- (BOOL)garbageCollectDatabaseWithError:(id *)a3
{
  uint64_t v4;
  void *v5;
  int v6;
  BOOL v7;
  _QWORD v9[6];
  void (*v10[5])(_QWORD, _QWORD);
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__4;
  v15 = __Block_byref_object_dispose__4;
  v16 = 0;
  v4 = MEMORY[0x1E0C809B0];
  v10[0] = (void (*)(_QWORD, _QWORD))MEMORY[0x1E0C809B0];
  v10[1] = (void (*)(_QWORD, _QWORD))3221225472;
  v10[2] = (void (*)(_QWORD, _QWORD))__58__LSApplicationWorkspace_garbageCollectDatabaseWithError___block_invoke;
  v10[3] = (void (*)(_QWORD, _QWORD))&unk_1E10407A0;
  v10[4] = (void (*)(_QWORD, _QWORD))&v11;
  +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDModifyService, v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __58__LSApplicationWorkspace_garbageCollectDatabaseWithError___block_invoke_2;
  v9[3] = &unk_1E10409D8;
  v9[4] = &v17;
  v9[5] = &v11;
  objc_msgSend(v5, "garbageCollectDatabaseWithCompletionHandler:", v9);
  v6 = *((unsigned __int8 *)v18 + 24);
  if (a3 && !*((_BYTE *)v18 + 24))
  {
    *a3 = objc_retainAutorelease((id)v12[5]);
    v6 = *((unsigned __int8 *)v18 + 24);
  }
  v7 = v6 != 0;

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);
  return v7;
}

void __58__LSApplicationWorkspace_garbageCollectDatabaseWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __58__LSApplicationWorkspace_garbageCollectDatabaseWithError___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)invalidateIconCache:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  if (IconServicesLibrary_frameworkLibrary_0
    || (IconServicesLibrary_frameworkLibrary_0 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/IconServices.framework/IconServices", 2)) != 0)
  {
    ((void (*)(void *))softLink_ISInvalidateCacheEntriesForBundleIdentifier[0])(v3);
    v4 = 1;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)clearAdvertisingIdentifier
{
  id v2;

  +[_LSDService XPCProxyWithErrorHandler:]((uint64_t)_LSDDeviceIdentifierService, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearAllIdentifiersOfType:", 1);

}

void __56__LSApplicationWorkspace_deviceIdentifierForAdvertising__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  _LSDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __56__LSApplicationWorkspace_deviceIdentifierForAdvertising__block_invoke_2_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __56__LSApplicationWorkspace_deviceIdentifierForAdvertising__block_invoke_264(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  if (!v3)
  {
    _LSDefaultLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      __56__LSApplicationWorkspace_deviceIdentifierForAdvertising__block_invoke_264_cold_1();

  }
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __51__LSApplicationWorkspace_deviceIdentifierForVendor__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  _LSDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __51__LSApplicationWorkspace_deviceIdentifierForVendor__block_invoke_2_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __51__LSApplicationWorkspace_deviceIdentifierForVendor__block_invoke_267(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  if (!v3)
  {
    _LSDefaultLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      __51__LSApplicationWorkspace_deviceIdentifierForVendor__block_invoke_267_cold_1();

  }
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

- (BOOL)urlContainsDeviceIdentifierForAdvertising:(id)a3
{
  id v3;
  id v4;
  id v5;
  char v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v3 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__LSApplicationWorkspace_urlContainsDeviceIdentifierForAdvertising___block_invoke;
  v8[3] = &unk_1E1040D88;
  v4 = v3;
  v9 = v4;
  v10 = &v11;
  v5 = _LSRetryForConnectionInterrupted(v8);
  v6 = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return v6;
}

id __68__LSApplicationWorkspace_urlContainsDeviceIdentifierForAdvertising___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  _QWORD v7[5];
  void (*v8[4])(_QWORD, _QWORD);
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__4;
  v15 = __Block_byref_object_dispose__4;
  v16 = 0;
  v2 = MEMORY[0x1E0C809B0];
  v8[0] = (void (*)(_QWORD, _QWORD))MEMORY[0x1E0C809B0];
  v8[1] = (void (*)(_QWORD, _QWORD))3221225472;
  v8[2] = (void (*)(_QWORD, _QWORD))__68__LSApplicationWorkspace_urlContainsDeviceIdentifierForAdvertising___block_invoke_2;
  v8[3] = (void (*)(_QWORD, _QWORD))&unk_1E1040D38;
  v9 = *(id *)(a1 + 32);
  v10 = &v11;
  +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDDeviceIdentifierService, v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  v7[1] = 3221225472;
  v7[2] = __68__LSApplicationWorkspace_urlContainsDeviceIdentifierForAdvertising___block_invoke_268;
  v7[3] = &unk_1E1040D60;
  v4 = *(_QWORD *)(a1 + 32);
  v7[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "urlContainsDeviceIdentifierForAdvertising:completionHandler:", v4, v7);
  v5 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v5;
}

void __68__LSApplicationWorkspace_urlContainsDeviceIdentifierForAdvertising___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  _LSDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __68__LSApplicationWorkspace_urlContainsDeviceIdentifierForAdvertising___block_invoke_2_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

uint64_t __68__LSApplicationWorkspace_urlContainsDeviceIdentifierForAdvertising___block_invoke_268(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (id)createDeviceIdentifierWithVendorName:(id)a3 bundleIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v5 = a3;
  v6 = a4;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__4;
  v15 = __Block_byref_object_dispose__4;
  v16 = 0;
  +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDDeviceIdentifierService, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __80__LSApplicationWorkspace_createDeviceIdentifierWithVendorName_bundleIdentifier___block_invoke;
  v10[3] = &unk_1E1040CE8;
  v10[4] = &v11;
  objc_msgSend(v7, "getIdentifierOfType:vendorName:bundleIdentifier:completionHandler:", 0, v5, v6, v10);
  v8 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v8;
}

void __80__LSApplicationWorkspace_createDeviceIdentifierWithVendorName_bundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)removeDeviceIdentifierForVendorName:(id)a3 bundleIdentifier:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDDeviceIdentifierService, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clearIdentifiersForUninstallationWithVendorName:bundleIdentifier:", v6, v5);

}

- (id)deviceIdentifierForVendorSeedData
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__4;
  v12 = __Block_byref_object_dispose__4;
  v13 = 0;
  +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDDeviceIdentifierService, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__LSApplicationWorkspace_deviceIdentifierForVendorSeedData__block_invoke;
  v7[3] = &unk_1E1040CE8;
  v7[4] = &v8;
  objc_msgSend(v2, "getIdentifierOfType:completionHandler:", 2, v7);
  v3 = (void *)v9[5];
  if (v3)
  {
    v14[0] = 0;
    v14[1] = 0;
    objc_msgSend(v3, "getUUIDBytes:", v14);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v14, 16);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _LSDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[LSApplicationWorkspace deviceIdentifierForVendorSeedData].cold.1();

    v4 = 0;
  }

  _Block_object_dispose(&v8, 8);
  return v4;
}

void __59__LSApplicationWorkspace_deviceIdentifierForVendorSeedData__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)installProgressForBundleID:(id)a3 makeSynchronous:(unsigned __int8)a4
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  LSApplicationWorkspace *v16;
  id v17;

  v5 = a3;
  _LSProgressLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[LSApplicationWorkspace installProgressForBundleID:makeSynchronous:].cold.2();

  +[LSApplicationWorkspace progressQueue](LSApplicationWorkspace, "progressQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __69__LSApplicationWorkspace_installProgressForBundleID_makeSynchronous___block_invoke;
  v15 = &unk_1E103FCC8;
  v16 = self;
  v8 = v5;
  v17 = v8;
  dispatch_sync(v7, &v12);

  -[LSInstallProgressList progressForBundleID:](self->_observedInstallProgresses, "progressForBundleID:", v8, v12, v13, v14, v15, v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _LSProgressLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[LSApplicationWorkspace installProgressForBundleID:makeSynchronous:].cold.1(v9, v10);

  return v9;
}

void __69__LSApplicationWorkspace_installProgressForBundleID_makeSynchronous___block_invoke(uint64_t a1)
{
  uint64_t *v2;
  void *v3;
  LSInstallProgressList *v4;
  void *v5;
  id *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  id (*v20)(uint64_t, void *);
  void *v21;
  NSObject *v22;
  uint64_t v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = (uint64_t *)(a1 + 32);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  if (!v3)
  {
    v4 = objc_alloc_init(LSInstallProgressList);
    v5 = *(void **)(*v2 + 16);
    *(_QWORD *)(*v2 + 16) = v4;

    v3 = *(void **)(*v2 + 16);
  }
  v7 = *(_QWORD *)(a1 + 40);
  v6 = (id *)(a1 + 40);
  objc_msgSend(v3, "progressForBundleID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {

    goto LABEL_6;
  }
  objc_msgSend(*(id *)(*v2 + 16), "subscriberForBundleID:andPublishingKey:", *v6, *v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
LABEL_6:
    _LSProgressLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      __69__LSApplicationWorkspace_installProgressForBundleID_makeSynchronous___block_invoke_cold_2();
    goto LABEL_8;
  }
  _LSProgressLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    __69__LSApplicationWorkspace_installProgressForBundleID_makeSynchronous___block_invoke_cold_1();

  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __69__LSApplicationWorkspace_installProgressForBundleID_makeSynchronous___block_invoke_271;
  v21 = &unk_1E1040DB0;
  v12 = *v6;
  v13 = *v2;
  v22 = v12;
  v23 = v13;
  v14 = (void *)MEMORY[0x186DAE9BC](&v18);
  objc_msgSend(MEMORY[0x1E0CB38A8], "_addSubscriberForCategory:usingPublishingHandler:", *v6, v14, v18, v19, v20, v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    objc_msgSend(*(id *)(*v2 + 16), "addSubscriber:forPublishingKey:andBundleID:", v15, *v6, *v6);
  _LSProgressLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = *v6;
    *(_DWORD *)buf = 138412290;
    v25 = v17;
    _os_log_impl(&dword_182882000, v16, OS_LOG_TYPE_DEFAULT, "Subscribing to progress for app %@, ", buf, 0xCu);
  }

  v10 = v22;
LABEL_8:

}

id __69__LSApplicationWorkspace_installProgressForBundleID_makeSynchronous___block_invoke_271(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _LSProgressLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "_LSDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    v19 = v5;
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_182882000, v4, OS_LOG_TYPE_DEFAULT, "Got progress %@ for app %@, ", buf, 0x16u);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "setProgress:forBundleID:", v3, *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "remoteObserver");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "applicationInstallsDidChange:", v8);

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __69__LSApplicationWorkspace_installProgressForBundleID_makeSynchronous___block_invoke_272;
  v14[3] = &unk_1E103FCC8;
  v9 = *(id *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  v15 = v9;
  v16 = v10;
  v11 = (void *)objc_msgSend(v14, "copy");
  v12 = (void *)MEMORY[0x186DAE9BC]();

  return v12;
}

void __69__LSApplicationWorkspace_installProgressForBundleID_makeSynchronous___block_invoke_272(int8x16_t *a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  id v5;
  int8x16_t v6;
  _QWORD block[4];
  int8x16_t v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _LSProgressLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[2].i64[0];
    *(_DWORD *)buf = 138412290;
    v10 = v3;
    _os_log_impl(&dword_182882000, v2, OS_LOG_TYPE_DEFAULT, "Unpublishing progress block called for app %@", buf, 0xCu);
  }

  +[LSApplicationWorkspace progressQueue](LSApplicationWorkspace, "progressQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__LSApplicationWorkspace_installProgressForBundleID_makeSynchronous___block_invoke_273;
  block[3] = &unk_1E103FCC8;
  v6 = a1[2];
  v5 = (id)v6.i64[0];
  v8 = vextq_s8(v6, v6, 8uLL);
  dispatch_async(v4, block);

}

void *__69__LSApplicationWorkspace_installProgressForBundleID_makeSynchronous___block_invoke_273(uint64_t a1)
{
  void *result;

  result = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  if (result)
  {
    objc_msgSend(result, "removeProgressForBundleID:", *(_QWORD *)(a1 + 40));
    return (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeSubscriberForPublishingKey:andBundleID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 40));
  }
  return result;
}

- (id)installProgressForApplication:(id)a3 withPhase:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  LSApplicationWorkspace *v10;
  NSMutableDictionary *createdInstallProgresses;
  uint64_t v12;
  NSMutableDictionary *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  _QWORD v21[5];
  id v22;
  _QWORD v23[4];
  NSObject *v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB38A8], "publishingKeyForApp:withPhase:", v8, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = self;
    objc_sync_enter(v10);
    createdInstallProgresses = v10->_createdInstallProgresses;
    if (!createdInstallProgresses)
    {
      v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 0);
      v13 = v10->_createdInstallProgresses;
      v10->_createdInstallProgresses = (NSMutableDictionary *)v12;

      createdInstallProgresses = v10->_createdInstallProgresses;
    }
    -[NSMutableDictionary objectForKeyedSubscript:](createdInstallProgresses, "objectForKeyedSubscript:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      if (objc_msgSend(v7, "isPlaceholder"))
      {
        objc_msgSend(MEMORY[0x1E0CB38A8], "childProgressForBundleID:andPhase:", v8, a4);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[LSApplicationWorkspace syncObserverProxy](v10, "syncObserverProxy");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = MEMORY[0x1E0C809B0];
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __66__LSApplicationWorkspace_installProgressForApplication_withPhase___block_invoke;
        v23[3] = &unk_1E1040A90;
        v24 = v7;
        objc_msgSend(v15, "createInstallProgressForApplication:withPhase:andPublishingString:reply:", v24, a4, v9, v23);

        v21[0] = v16;
        v21[1] = 3221225472;
        v21[2] = __66__LSApplicationWorkspace_installProgressForApplication_withPhase___block_invoke_276;
        v21[3] = &unk_1E103FCC8;
        v21[4] = v10;
        v22 = v8;
        objc_msgSend(v14, "setCancellationHandler:", v21);
        -[NSMutableDictionary setObject:forKeyedSubscript:](v10->_createdInstallProgresses, "setObject:forKeyedSubscript:", v14, v9);
        objc_msgSend(v14, "_publish");
        _LSProgressLog();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v14, "_LSDescription");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v26 = v18;
          _os_log_impl(&dword_182882000, v17, OS_LOG_TYPE_DEFAULT, "Published install progress %@", buf, 0xCu);

        }
        v19 = v24;
      }
      else
      {
        _LSProgressLog();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v26 = v7;
          _os_log_impl(&dword_182882000, v19, OS_LOG_TYPE_DEFAULT, "App %@ is not a placeholder so cannot have progress", buf, 0xCu);
        }
        v14 = 0;
      }

    }
    objc_sync_exit(v10);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

void __66__LSApplicationWorkspace_installProgressForApplication_withPhase___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    _LSProgressLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __66__LSApplicationWorkspace_installProgressForApplication_withPhase___block_invoke_cold_1();

  }
}

void __66__LSApplicationWorkspace_installProgressForApplication_withPhase___block_invoke_276(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "observerProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "installationEndedForApplication:withState:", *(_QWORD *)(a1 + 40), 3);

}

- (BOOL)installPhaseFinishedForProgress:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  LSApplicationWorkspace *v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("bundleID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "substringToIndex:", objc_msgSend(v6, "rangeOfString:options:", CFSTR("."), 4));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "installState");
  if (v8 == 4)
  {
    _LSDefaultLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "_LSDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412546;
      v16 = v6;
      v17 = 2112;
      v18 = v10;
      _os_log_impl(&dword_182882000, v9, OS_LOG_TYPE_DEFAULT, "installPhaseFinishedForProgress: %@ - %@ called", (uint8_t *)&v15, 0x16u);

    }
    -[LSApplicationWorkspace syncObserverProxy](self, "syncObserverProxy");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "installationFailedForApplication:reply:", v7, &__block_literal_global_281);

  }
  _LSDefaultLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[LSApplicationWorkspace installPhaseFinishedForProgress:].cold.1();

  objc_msgSend(v4, "_unpublish");
  v13 = self;
  objc_sync_enter(v13);
  if (v6)
    -[NSMutableDictionary removeObjectForKey:](v13->_createdInstallProgresses, "removeObjectForKey:", v6);
  objc_sync_exit(v13);

  return v8 != 4;
}

- (void)clearCreatedProgressForBundleID:(id)a3
{
  id v4;
  LSApplicationWorkspace *v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSObject *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  void *v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[NSMutableDictionary allKeys](v5->_createdInstallProgresses, "allKeys");
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v7)
  {
    v9 = *(_QWORD *)v15;
    *(_QWORD *)&v8 = 138412290;
    v13 = v8;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v11, "hasPrefix:", v4, v13, (_QWORD)v14))
        {
          -[NSMutableDictionary removeObjectForKey:](v5->_createdInstallProgresses, "removeObjectForKey:", v11);
          _LSProgressLog();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v13;
            v19 = v11;
            _os_log_impl(&dword_182882000, v12, OS_LOG_TYPE_DEFAULT, "Clearing progress for key %@ from cache", buf, 0xCu);
          }

        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (BOOL)_LSPrivateRebuildApplicationDatabasesForSystemApps:(BOOL)a3 internal:(BOOL)a4 user:(BOOL)a5
{
  return -[LSApplicationWorkspace _LSPrivateRebuildApplicationDatabasesForSystemApps:internal:user:uid:](self, "_LSPrivateRebuildApplicationDatabasesForSystemApps:internal:user:uid:", a3, a4, a5, 0);
}

- (BOOL)_LSPrivateRebuildApplicationDatabasesForSystemApps:(BOOL)a3 internal:(BOOL)a4 user:(BOOL)a5 uid:(unsigned int *)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  _BOOL8 v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  const char *v20;
  uint8_t v21;
  _QWORD v23[5];
  uint8_t buf[8];
  uint8_t *v25;
  uint64_t v26;
  char v27;
  uint8_t v28[4];
  const char *v29;
  uint64_t v30;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v30 = *MEMORY[0x1E0C80C00];
  _LSDefaultLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_182882000, v10, OS_LOG_TYPE_DEFAULT, "Rebuilding LS database.", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v25 = buf;
  v26 = 0x2020000000;
  v27 = 0;
  v11 = (void *)MEMORY[0x186DAE7A0]();
  +[_LSDServiceDomain defaultServiceDomain]();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (a6)
  {
    if (*a6)
    {
      v14 = -[_LSDServiceDomain initWithUID:]([_LSDServiceDomain alloc], *a6);
    }
    else
    {
      +[_LSDServiceDomain systemSessionDomain]();
      v14 = objc_claimAutoreleasedReturnValue();
    }
    v15 = (void *)v14;

  }
  else
  {
    v15 = (void *)v12;
  }
  v16 = (void *)objc_opt_class();
  _LSDServiceGetXPCConnection(v16, (uint64_t)v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_283);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __95__LSApplicationWorkspace__LSPrivateRebuildApplicationDatabasesForSystemApps_internal_user_uid___block_invoke_284;
  v23[3] = &unk_1E10409B0;
  v23[4] = buf;
  objc_msgSend(v18, "rebuildApplicationDatabasesForSystem:internal:user:completionHandler:", v9, v8, v7, v23);

  objc_autoreleasePoolPop(v11);
  _LSDefaultLog();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    if (v25[24])
      v20 = "SUCCESS";
    else
      v20 = "FAILED";
    *(_DWORD *)v28 = 136315138;
    v29 = v20;
    _os_log_impl(&dword_182882000, v19, OS_LOG_TYPE_DEFAULT, "%s Finished rebuilding LS database.", v28, 0xCu);
  }

  v21 = v25[24];
  _Block_object_dispose(buf, 8);
  return v21;
}

void __95__LSApplicationWorkspace__LSPrivateRebuildApplicationDatabasesForSystemApps_internal_user_uid___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  _LSDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __95__LSApplicationWorkspace__LSPrivateRebuildApplicationDatabasesForSystemApps_internal_user_uid___block_invoke_cold_1();

}

uint64_t __95__LSApplicationWorkspace__LSPrivateRebuildApplicationDatabasesForSystemApps_internal_user_uid___block_invoke_284(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)rebuildDatabaseContentForFrameworkAtURL:(id)a3 completionHandler:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  void (*v13[4])(_QWORD, _QWORD);
  id v14;

  v5 = a4;
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = (void (*)(_QWORD, _QWORD))MEMORY[0x1E0C809B0];
  v13[1] = (void (*)(_QWORD, _QWORD))3221225472;
  v13[2] = (void (*)(_QWORD, _QWORD))__84__LSApplicationWorkspace_rebuildDatabaseContentForFrameworkAtURL_completionHandler___block_invoke;
  v13[3] = (void (*)(_QWORD, _QWORD))&unk_1E1040A40;
  v7 = v5;
  v14 = v7;
  v8 = a3;
  +[_LSDService XPCProxyWithErrorHandler:]((uint64_t)_LSDModifyService, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __84__LSApplicationWorkspace_rebuildDatabaseContentForFrameworkAtURL_completionHandler___block_invoke_2;
  v11[3] = &unk_1E1040A40;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "refreshContentInFrameworkAtURL:reply:", v8, v11);

}

uint64_t __84__LSApplicationWorkspace_rebuildDatabaseContentForFrameworkAtURL_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL, uint64_t))(result + 16))(result, a2 == 0, a2);
  return result;
}

uint64_t __84__LSApplicationWorkspace_rebuildDatabaseContentForFrameworkAtURL_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL, uint64_t))(result + 16))(result, a2 == 0, a2);
  return result;
}

- (void)noteRestrictionsUpdateForOpensWithCompletion:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void (*v6[4])(_QWORD, _QWORD);
  id v7;

  v3 = a3;
  v6[0] = (void (*)(_QWORD, _QWORD))MEMORY[0x1E0C809B0];
  v6[1] = (void (*)(_QWORD, _QWORD))3221225472;
  v6[2] = (void (*)(_QWORD, _QWORD))__71__LSApplicationWorkspace_noteRestrictionsUpdateForOpensWithCompletion___block_invoke;
  v6[3] = (void (*)(_QWORD, _QWORD))&unk_1E1040A40;
  v7 = v3;
  v4 = v3;
  +[_LSDService XPCProxyWithErrorHandler:]((uint64_t)_LSDOpenService, v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateRestrictionKnowledgeWithCompletionHandler:", v4);

}

uint64_t __71__LSApplicationWorkspace_noteRestrictionsUpdateForOpensWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_LSPrivateUpdateAppRemovalRestrictions
{
  id v2;

  +[LSApplicationRestrictionsManager sharedInstance]();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  -[LSApplicationRestrictionsManager cleanRemovedSystemApplicationsList]((uint64_t)v2);

}

- (void)_LSPrivateSetRemovedSystemAppIdentifiers:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[LSApplicationRestrictionsManager sharedInstance]();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[LSApplicationRestrictionsManager setRemovedSystemApplicationIdentifiers:](v4, v3);

}

- (id)_LSPrivateRemovedSystemAppIdentifiers
{
  void *v2;
  void *v3;

  +[LSApplicationRestrictionsManager sharedInstance]();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[LSApplicationRestrictionsManager removedSystemApplicationIdentifiers](v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_LSPrivateDatabaseNeedsRebuild
{
  unsigned int v2;
  NSObject *v3;
  uint8_t v6[16];

  v2 = _LSGetStatus();
  if ((v2 & 0x200) != 0)
  {
    _LSDefaultLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_182882000, v3, OS_LOG_TYPE_DEFAULT, "Incomplete database seed detected, _LSPrivateDatabaseNeedsRebuild = YES", v6, 2u);
    }

  }
  return (v2 >> 9) & 1;
}

- (void)_LSPrivateNoteMigratorRunning
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)objc_opt_class();
  +[_LSDServiceDomain defaultServiceDomain]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _LSDServiceGetXPCConnection(v2, (uint64_t)v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_287);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "noteMigratorRunningWithReply:", &__block_literal_global_289);

}

void __55__LSApplicationWorkspace__LSPrivateNoteMigratorRunning__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  _LSDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __55__LSApplicationWorkspace__LSPrivateNoteMigratorRunning__block_invoke_cold_1();

}

void __55__LSApplicationWorkspace__LSPrivateNoteMigratorRunning__block_invoke_288(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    _LSDefaultLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __55__LSApplicationWorkspace__LSPrivateNoteMigratorRunning__block_invoke_288_cold_1();

  }
}

- (void)_LSFailedToOpenURL:(id)a3 withBundle:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  _LSDefaultLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138478083;
    v13 = v5;
    v14 = 2113;
    v15 = v6;
    _os_log_impl(&dword_182882000, v7, OS_LOG_TYPE_INFO, "_LSFailedToOpenURL:%{private}@ withBundle:%{private}@", buf, 0x16u);
  }

  +[_LSDService XPCProxyWithErrorHandler:]((uint64_t)_LSDOpenService, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__LSApplicationWorkspace__LSFailedToOpenURL_withBundle___block_invoke;
  v10[3] = &unk_1E1040AB8;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "failedToOpenApplication:withURL:completionHandler:", v9, v5, v10);

}

void __56__LSApplicationWorkspace__LSFailedToOpenURL_withBundle___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _LSDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = 138477827;
      v10 = v8;
      _os_log_impl(&dword_182882000, v7, OS_LOG_TYPE_INFO, "Finished presenting restoration prompt for %{private}@.", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __56__LSApplicationWorkspace__LSFailedToOpenURL_withBundle___block_invoke_cold_1();
  }

}

- (void)_LSClearSchemaCaches
{
  void *v2;

  if (_LSCurrentProcessMayMapDatabase())
  {
    v2 = 0;
    if (!_LSContextInit(&v2))
    {
      _LSSchemaClearAllCaches((uint64_t)v2 + 16);
      _LSContextDestroy(&v2);
    }

  }
}

- (void)sendExtensionNotificationsForSystemModeChangeFrom:(id)a3 to:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  os_unfair_lock_s *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  _LSExtensionsLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v21 = v5;
    v22 = 2112;
    v23 = v6;
    _os_log_impl(&dword_182882000, v7, OS_LOG_TYPE_INFO, "Begin updating extensions for mode change %@ -> %@", buf, 0x16u);
  }

  v8 = (void *)objc_opt_new();
  v9 = (void *)objc_opt_new();
  _LSServer_DatabaseExecutionContext();
  v10 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __79__LSApplicationWorkspace_sendExtensionNotificationsForSystemModeChangeFrom_to___block_invoke;
  v15[3] = &unk_1E1040E58;
  v16 = v6;
  v17 = v8;
  v18 = v5;
  v19 = v9;
  v11 = v9;
  v12 = v5;
  v13 = v8;
  v14 = v6;
  -[LSDBExecutionContext syncRead:](v10, v15);

}

void __79__LSApplicationWorkspace_sendExtensionNotificationsForSystemModeChangeFrom_to___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  id obj;
  id obja;
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
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  uint64_t v52;
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  +[LSExtensionPointRecord enumerator](LSExtensionPointRecord, "enumerator");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v46 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        objc_msgSend(v6, "SDKDictionary");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_opt_class();
        objc_msgSend(v7, "objectForKey:ofClass:valuesOfClass:", CFSTR("LSExtensionRestrictedSystemModes"), v8, objc_opt_class());
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v9, "containsObject:", *(_QWORD *)(a1 + 32)))
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
        if (objc_msgSend(v9, "containsObject:", *(_QWORD *)(a1 + 48)))
          objc_msgSend(*(id *)(a1 + 56), "addObject:", v6);

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
    }
    while (v3);
  }

  v10 = (void *)objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
  objc_msgSend(v10, "minusSet:", *(_QWORD *)(a1 + 56));
  v11 = (void *)objc_msgSend(*(id *)(a1 + 56), "mutableCopy");
  objc_msgSend(v11, "minusSet:", *(_QWORD *)(a1 + 40));
  v12 = (void *)objc_opt_new();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v42;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v42 != v16)
          objc_enumerationMutation(v13);
        +[LSApplicationExtensionRecord enumeratorWithExtensionPointRecord:options:](LSApplicationExtensionRecord, "enumeratorWithExtensionPointRecord:options:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * j), 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "allObjects");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObjectsFromArray:", v19);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
    }
    while (v15);
  }
  obja = v13;

  v20 = (void *)objc_opt_new();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v21 = v10;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v38;
    do
    {
      for (k = 0; k != v23; ++k)
      {
        if (*(_QWORD *)v38 != v24)
          objc_enumerationMutation(v21);
        +[LSApplicationExtensionRecord enumeratorWithExtensionPointRecord:options:](LSApplicationExtensionRecord, "enumeratorWithExtensionPointRecord:options:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * k), 0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "allObjects");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addObjectsFromArray:", v27);

      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
    }
    while (v23);
  }

  if (objc_msgSend(v12, "count"))
  {
    _LSExtensionsLog();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v50 = v12;
      _os_log_impl(&dword_182882000, v28, OS_LOG_TYPE_DEFAULT, "Sending system mode unrestricted app extension installedNotifications for %@", buf, 0xCu);
    }

    +[_LSInstallProgressService sharedInstance](_LSInstallProgressService, "sharedInstance");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "sendNotification:forApplicationExtensionRecords:", CFSTR("com.apple.LaunchServices.pluginsregistered"), v12);

  }
  if (objc_msgSend(v20, "count"))
  {
    _LSExtensionsLog();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v50 = v20;
      _os_log_impl(&dword_182882000, v30, OS_LOG_TYPE_DEFAULT, "Sending system mode restricted app extension uninstalledNotifications for %@", buf, 0xCu);
    }

    +[_LSInstallProgressService sharedInstance](_LSInstallProgressService, "sharedInstance");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "sendNotification:forApplicationExtensionRecords:", CFSTR("com.apple.LaunchServices.pluginsunregistered"), v20);

  }
  _LSExtensionsLog();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
  {
    v33 = *(void **)(a1 + 48);
    v34 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    v50 = v33;
    v51 = 2112;
    v52 = v34;
    _os_log_impl(&dword_182882000, v32, OS_LOG_TYPE_INFO, "Done updating extensions for mode change %@ -> %@", buf, 0x16u);
  }

}

- (void)sendExtensionNotificationsForExtensionBundleIdentifier:(id)a3 changingRestrictionStateTo:(BOOL)a4
{
  id v5;
  os_unfair_lock_s *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  BOOL v10;

  v5 = a3;
  _LSServer_DatabaseExecutionContext();
  v6 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __108__LSApplicationWorkspace_sendExtensionNotificationsForExtensionBundleIdentifier_changingRestrictionStateTo___block_invoke;
  v8[3] = &unk_1E1040E80;
  v9 = v5;
  v10 = a4;
  v7 = v5;
  -[LSDBExecutionContext syncRead:](v6, v8);

}

void __108__LSApplicationWorkspace_sendExtensionNotificationsForExtensionBundleIdentifier_changingRestrictionStateTo___block_invoke(uint64_t a1)
{
  LSApplicationExtensionRecord *v2;
  uint64_t v3;
  LSApplicationExtensionRecord *v4;
  id v5;
  __CFString *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  id v13;
  uint8_t buf[4];
  NSObject *v15;
  __int16 v16;
  _QWORD v17[2];
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v2 = [LSApplicationExtensionRecord alloc];
  v3 = *(_QWORD *)(a1 + 32);
  v13 = 0;
  v4 = -[LSApplicationExtensionRecord initWithBundleIdentifier:error:](v2, "initWithBundleIdentifier:error:", v3, &v13);
  v5 = v13;
  if (v4)
  {
    if (*(_BYTE *)(a1 + 40))
      v6 = CFSTR("com.apple.LaunchServices.pluginsunregistered");
    else
      v6 = CFSTR("com.apple.LaunchServices.pluginsregistered");
    v7 = v6;
    _LSInstallLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v15 = v7;
      v16 = 2112;
      v17[0] = v4;
      _os_log_impl(&dword_182882000, v8, OS_LOG_TYPE_DEFAULT, "Sending %@ for %@", buf, 0x16u);
    }

    +[_LSInstallProgressService sharedInstance](_LSInstallProgressService, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sendNotification:forApplicationExtensionRecords:", v7, v10);

  }
  else
  {
    _LSInstallLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(NSObject **)(a1 + 32);
      v12 = *(unsigned __int8 *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      v15 = v11;
      v16 = 1024;
      LODWORD(v17[0]) = v12;
      WORD2(v17[0]) = 2112;
      *(_QWORD *)((char *)v17 + 6) = v5;
      _os_log_impl(&dword_182882000, v7, OS_LOG_TYPE_DEFAULT, "no record for %@, could not change restriction state to %d: %@", buf, 0x1Cu);
    }
  }

}

- (void)sendApplicationStateChangedNotificationsFor:(id)a3 stateProvider:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  uint64_t v11;
  id v12;
  os_unfair_lock_s *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  id v24;
  void (**v25)(_QWORD);
  _QWORD v26[4];
  id v27;

  v7 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD))a5;
  if (objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isServer"))
  {
    _LSServer_DatabaseExecutionContext();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __95__LSApplicationWorkspace_sendApplicationStateChangedNotificationsFor_stateProvider_completion___block_invoke;
    v26[3] = &unk_1E1040518;
    v12 = v7;
    v27 = v12;
    -[LSDBExecutionContext syncWrite:]((uint64_t)v10, v26);

    _LSServer_DatabaseExecutionContext();
    v13 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
    v22[0] = v11;
    v22[1] = 3221225472;
    v22[2] = __95__LSApplicationWorkspace_sendApplicationStateChangedNotificationsFor_stateProvider_completion___block_invoke_2;
    v22[3] = &unk_1E10406E8;
    v23 = v12;
    v24 = v8;
    v25 = v9;
    -[LSDBExecutionContext syncRead:](v13, v22);

  }
  else
  {
    _LSDefaultLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[LSApplicationWorkspace sendApplicationStateChangedNotificationsFor:stateProvider:completion:].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);

    if (v9)
      v9[2](v9);
  }

}

void __95__LSApplicationWorkspace_sendApplicationStateChangedNotificationsFor_stateProvider_completion___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v2)
  {
    v6 = v2;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v1);
        _LSServer_UpdateDatabaseWithInfo(*(void **)(*((_QWORD *)&v9 + 1) + 8 * v8++), 0, 0, 0, 1, v3, v4, v5);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

  _LSArmSaveTimer(1);
}

void __95__LSApplicationWorkspace_sendApplicationStateChangedNotificationsFor_stateProvider_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  __CFString *v7;
  LSApplicationRecord *v8;
  LSApplicationRecord *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const __CFString *v20;
  void *v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  NSObject *v27;
  const __CFString *v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  __CFNotificationCenter *DistributedCenter;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  NSObject *v59;
  id v60;
  uint64_t v61;
  LSApplicationRecord *v62;
  void *v63;
  const char *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  id v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  _QWORD v75[3];
  _QWORD v76[3];
  uint8_t buf[4];
  const char *v78;
  __int16 v79;
  const __CFString *v80;
  __int16 v81;
  void *v82;
  _BYTE v83[128];
  uint64_t v84;

  v1 = a1;
  v84 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v5 = *(id *)(v1 + 32);
  v58 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v70, v83, 16);
  if (v58)
  {
    v57 = *(_QWORD *)v71;
    v54 = v1;
    v55 = v2;
    v52 = v4;
    v53 = v3;
    v56 = v5;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v71 != v57)
          objc_enumerationMutation(v5);
        v7 = *(__CFString **)(*((_QWORD *)&v70 + 1) + 8 * v6);
        v8 = [LSApplicationRecord alloc];
        v69 = 0;
        v9 = -[LSApplicationRecord initWithBundleIdentifier:allowPlaceholder:error:](v8, "initWithBundleIdentifier:allowPlaceholder:error:", v7, 1, &v69);
        v10 = v69;
        v11 = v10;
        if (v9)
        {
          v60 = v10;
          v61 = v6;
          -[LSApplicationRecord applicationState](v9, "applicationState");
          v59 = objc_claimAutoreleasedReturnValue();
          v12 = -[NSObject isRestrictedWithStateProvider:](v59, "isRestrictedWithStateProvider:", *(_QWORD *)(v1 + 40));
          v62 = v9;
          v13 = MEMORY[0x1E0C9AAA0];
          v76[0] = MEMORY[0x1E0C9AAA0];
          v75[0] = CFSTR("isRemoved");
          v75[1] = CFSTR("isRestricted");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v75[2] = CFSTR("isBlocked");
          v76[1] = v14;
          v76[2] = v13;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v76, v75, 3);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "setObject:forKey:", v15, v7);

          v9 = v62;
          -[LSApplicationRecord applicationExtensionRecords](v62, "applicationExtensionRecords");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v63, "count"))
          {
            if (_LSIsNewsBundleIdentifier(v7))
            {
              v67 = 0u;
              v68 = 0u;
              v65 = 0u;
              v66 = 0u;
              v16 = v63;
              v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
              if (v17)
              {
                v18 = v17;
                v19 = *(_QWORD *)v66;
                v20 = CFSTR(" not");
                if ((_DWORD)v12)
                  v20 = &stru_1E10473A0;
                v64 = (const char *)v20;
                if ((_DWORD)v12)
                  v21 = v3;
                else
                  v21 = v4;
                do
                {
                  for (i = 0; i != v18; ++i)
                  {
                    if (*(_QWORD *)v66 != v19)
                      objc_enumerationMutation(v16);
                    v23 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
                    objc_msgSend(v23, "effectiveBundleIdentifier");
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    if (!_LSIsNewsWidgetBundleIdentifier(v24))
                      goto LABEL_24;
                    +[LSApplicationRestrictionsManager sharedInstance]();
                    v25 = (void *)objc_claimAutoreleasedReturnValue();
                    v26 = -[LSApplicationRestrictionsManager isAppExtensionRestricted:]((_BOOL8)v25, v24);

                    _LSInstallLog();
                    v27 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412546;
                      v28 = CFSTR(" not");
                      if (v26)
                        v28 = &stru_1E10473A0;
                      v78 = v64;
                      v79 = 2112;
                      v80 = v28;
                      _os_log_impl(&dword_182882000, v27, OS_LOG_TYPE_DEFAULT, "Note: News is%@ restricted, news widget is%@ restricted", buf, 0x16u);
                    }

                    if ((_DWORD)v12 == v26)
LABEL_24:
                      objc_msgSend(v21, "addObject:", v23);

                  }
                  v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
                }
                while (v18);
                v1 = v54;
                v2 = v55;
                v4 = v52;
                v3 = v53;
                v5 = v56;
                v9 = v62;
              }
              else
              {
                v5 = v56;
              }
            }
            else
            {
              objc_msgSend(v63, "allObjects");
              v16 = (id)objc_claimAutoreleasedReturnValue();
              if ((_DWORD)v12)
                v31 = v3;
              else
                v31 = v4;
              objc_msgSend(v31, "addObjectsFromArray:", v16);
            }

          }
          v11 = v60;
          v6 = v61;
          v30 = v59;
        }
        else
        {
          _LSInstallLog();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            v78 = "-[LSApplicationWorkspace sendApplicationStateChangedNotificationsFor:stateProvider:completion:]_block_invoke_2";
            v79 = 2112;
            v80 = v7;
            v81 = 2112;
            v82 = v11;
            v30 = v29;
            _os_log_error_impl(&dword_182882000, v29, OS_LOG_TYPE_ERROR, "%s: could not initialize record for bundleID %@: %@", buf, 0x20u);
          }
          else
          {
            v30 = v29;
          }
        }

        ++v6;
      }
      while (v6 != v58);
      v32 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v70, v83, 16);
      v58 = v32;
    }
    while (v32);
  }

  _LSLogStepAsync(7, 1, 0, CFSTR("Sending appStateChangedNotification with payload %@"), v33, v34, v35, v36, (uint64_t)v2);
  _LSInstallLog();
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v78 = (const char *)v2;
    _os_log_impl(&dword_182882000, v37, OS_LOG_TYPE_DEFAULT, "Sending appStateChangedNotification for %@", buf, 0xCu);
  }

  DistributedCenter = CFNotificationCenterGetDistributedCenter();
  CFNotificationCenterPostNotificationWithOptions(DistributedCenter, CFSTR("com.apple.LaunchServices.applicationStateChanged"), 0, (CFDictionaryRef)v2, 1uLL);
  if (objc_msgSend(v4, "count"))
  {
    _LSLogStepAsync(7, 1, 0, CFSTR("Sending installedNotifications for %@"), v39, v40, v41, v42, (uint64_t)v4);
    _LSInstallLog();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v78 = (const char *)v4;
      _os_log_impl(&dword_182882000, v43, OS_LOG_TYPE_DEFAULT, "Sending installedNotifications for %@", buf, 0xCu);
    }

    +[_LSInstallProgressService sharedInstance](_LSInstallProgressService, "sharedInstance");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "sendNotification:forApplicationExtensionRecords:", CFSTR("com.apple.LaunchServices.pluginsregistered"), v4);

  }
  if (objc_msgSend(v3, "count"))
  {
    _LSLogStepAsync(7, 1, 0, CFSTR("Sending uninstalledNotifications for %@"), v45, v46, v47, v48, (uint64_t)v3);
    _LSInstallLog();
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v78 = (const char *)v3;
      _os_log_impl(&dword_182882000, v49, OS_LOG_TYPE_DEFAULT, "Sending uninstalledNotifications for %@", buf, 0xCu);
    }

    +[_LSInstallProgressService sharedInstance](_LSInstallProgressService, "sharedInstance");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "sendNotification:forApplicationExtensionRecords:", CFSTR("com.apple.LaunchServices.pluginsunregistered"), v3);

  }
  v51 = *(_QWORD *)(v1 + 48);
  if (v51)
    (*(void (**)(void))(v51 + 16))();

}

- (id)scanForApplicationStateChangesFromRank:(id)a3 toRank:(id)a4
{
  id v6;
  id v7;
  void *v8;
  os_unfair_lock_s *v9;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isServer"))
  {
    _LSServer_DatabaseExecutionContext();
    v9 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __72__LSApplicationWorkspace_scanForApplicationStateChangesFromRank_toRank___block_invoke;
    v11[3] = &unk_1E1040E58;
    v11[4] = self;
    v12 = v6;
    v13 = v7;
    v14 = v8;
    -[LSDBExecutionContext syncRead:](v9, v11);

  }
  return v8;
}

void __72__LSApplicationWorkspace_scanForApplicationStateChangesFromRank_toRank___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __72__LSApplicationWorkspace_scanForApplicationStateChangesFromRank_toRank___block_invoke_2;
  v3[3] = &unk_1E1040EA8;
  v2 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v2, "enumerateApplicationsOfType:block:", 0, v3);

}

void __72__LSApplicationWorkspace_scanForApplicationStateChangesFromRank_toRank___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "ratingRank");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  LODWORD(v3) = v4 <= (int)objc_msgSend(*(id *)(a1 + 32), "intValue");
  if (((v3 ^ (v4 > (int)objc_msgSend(*(id *)(a1 + 40), "intValue"))) & 1) == 0)
  {
    v5 = *(void **)(a1 + 48);
    objc_msgSend(v7, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

  }
}

- (id)scanForApplicationStateChangesWithAllowlist:(id)a3
{
  id v4;
  void *v5;
  os_unfair_lock_s *v6;
  _QWORD v8[5];
  id v9;
  id v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isServer"))
  {
    _LSServer_DatabaseExecutionContext();
    v6 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __70__LSApplicationWorkspace_scanForApplicationStateChangesWithAllowlist___block_invoke;
    v8[3] = &unk_1E1040EF8;
    v8[4] = self;
    v9 = v4;
    v10 = v5;
    -[LSDBExecutionContext syncRead:](v6, v8);

  }
  return v5;
}

void __70__LSApplicationWorkspace_scanForApplicationStateChangesWithAllowlist___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __70__LSApplicationWorkspace_scanForApplicationStateChangesWithAllowlist___block_invoke_2;
  v3[3] = &unk_1E1040ED0;
  v2 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "enumerateBundlesOfType:block:", 0, v3);

}

void __70__LSApplicationWorkspace_scanForApplicationStateChangesWithAllowlist___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  char v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3) & 1) == 0)
  {
    objc_msgSend(v6, "appState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isAlwaysAvailable");

    if ((v5 & 1) == 0)
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
  }

}

- (id)scanForForDeletableSystemApps
{
  void *v3;
  os_unfair_lock_s *v4;
  _QWORD v6[5];
  id v7;

  v3 = (void *)objc_opt_new();
  if (objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isServer"))
  {
    _LSServer_DatabaseExecutionContext();
    v4 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __55__LSApplicationWorkspace_scanForForDeletableSystemApps__block_invoke;
    v6[3] = &unk_1E1040F48;
    v6[4] = self;
    v7 = v3;
    -[LSDBExecutionContext syncRead:](v4, v6);

  }
  return v3;
}

void __55__LSApplicationWorkspace_scanForForDeletableSystemApps__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __55__LSApplicationWorkspace_scanForForDeletableSystemApps__block_invoke_2;
  v2[3] = &unk_1E1040F20;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "enumerateApplicationsOfType:block:", 1, v2);

}

void __55__LSApplicationWorkspace_scanForForDeletableSystemApps__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(v5, "isDeletableIgnoringRestrictions"))
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v5, "bundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
}

- (BOOL)forceDatabaseSaveForTestingWithError:(id *)a3
{
  uint64_t v4;
  void *v5;
  int v6;
  BOOL v7;
  _QWORD v9[6];
  void (*v10[5])(_QWORD, _QWORD);
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__4;
  v15 = __Block_byref_object_dispose__4;
  v16 = 0;
  v4 = MEMORY[0x1E0C809B0];
  v10[0] = (void (*)(_QWORD, _QWORD))MEMORY[0x1E0C809B0];
  v10[1] = (void (*)(_QWORD, _QWORD))3221225472;
  v10[2] = (void (*)(_QWORD, _QWORD))__63__LSApplicationWorkspace_forceDatabaseSaveForTestingWithError___block_invoke;
  v10[3] = (void (*)(_QWORD, _QWORD))&unk_1E10407A0;
  v10[4] = (void (*)(_QWORD, _QWORD))&v11;
  +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDModifyService, v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __63__LSApplicationWorkspace_forceDatabaseSaveForTestingWithError___block_invoke_2;
  v9[3] = &unk_1E1040C70;
  v9[4] = &v11;
  v9[5] = &v17;
  objc_msgSend(v5, "forceSaveForTestingWithCompletion:", v9);
  _LSContextInvalidate();
  v6 = *((unsigned __int8 *)v18 + 24);
  if (a3 && !*((_BYTE *)v18 + 24))
  {
    *a3 = objc_retainAutorelease((id)v12[5]);
    v6 = *((unsigned __int8 *)v18 + 24);
  }
  v7 = v6 != 0;

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);
  return v7;
}

void __63__LSApplicationWorkspace_forceDatabaseSaveForTestingWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __63__LSApplicationWorkspace_forceDatabaseSaveForTestingWithError___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v4 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4 == 0;

}

- (void)ls_testWithCleanDatabaseWithError:(id *)a3
{
  _BYTE *v4;
  id v5;
  CFTypeRef v6;
  id v8;

  if (!objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isInXCTestRigInsecure"))
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -5500, (uint64_t)"-[LSApplicationWorkspace ls_testWithCleanDatabaseWithError:]", 4206, 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = 0;
    if (!a3)
      goto LABEL_10;
    goto LABEL_8;
  }
  v8 = 0;
  v4 = _LSDatabaseCreateCleanForTesting(&v8);
  v5 = v8;
  if (v4)
  {
    _LSSetLocalDatabase(v4);
    v6 = CFAutorelease(v4);
  }
  else
  {
    v6 = 0;
  }

  if (a3)
  {
LABEL_8:
    if (!v6)
      *a3 = objc_retainAutorelease(v5);
  }
LABEL_10:

  return (void *)v6;
}

- (BOOL)ls_injectUTTypeWithDeclaration:(id)a3 inDatabase:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  int v16;
  uint64_t v18;
  const __CFString *v19;
  const __CFString *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isInXCTestRigInsecure"))
  {
    v13 = 0;
    v14 = 0;
    if (!a5)
      goto LABEL_17;
    goto LABEL_15;
  }
  if (v7 && v8)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("UTTypeDescription"));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
    {
      v21 = v9;
      v22 = v9;
      v20 = CFSTR("LSDefaultLocalizedValue");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = 0;
    }
    v16 = _UTTypeAddWithDeclarationDictionary();
    v14 = v16 == 0;
    if (v16)
    {
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], v16, (uint64_t)"-[LSApplicationWorkspace ls_injectUTTypeWithDeclaration:inDatabase:error:]", 4234, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v15 = (void *)*MEMORY[0x1E0CB2F90];
    v18 = *MEMORY[0x1E0CB2938];
    v19 = CFSTR("invalid input parameters");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl(v15, -50, (uint64_t)"-[LSApplicationWorkspace ls_injectUTTypeWithDeclaration:inDatabase:error:]", 4238, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
  }

  if (a5)
  {
LABEL_15:
    if (!v14)
      *a5 = objc_retainAutorelease(v13);
  }
LABEL_17:

  return v14;
}

- (void)ls_resetTestingDatabase
{
  void *v2;

  if (objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isInXCTestRigInsecure"))
  {
    v2 = 0;
    if (!_LSContextInit(&v2))
    {
      _LSContextUpdate(&v2, 1, 0);
      _LSContextDestroy(&v2);
    }

  }
}

- (void)setHiddenApplications:(id)a3 completion:(id)a4
{
  +[_LSDAppProtectionService setHiddenApplications:completion:](_LSDAppProtectionService, "setHiddenApplications:completion:", a3, a4);
}

- (void)getHiddenApplicationsWithCompletion:(id)a3
{
  +[_LSDAppProtectionService getHiddenApplicationsWithCompletion:](_LSDAppProtectionService, "getHiddenApplicationsWithCompletion:", a3);
}

- (void)setLockedApplications:(id)a3 completion:(id)a4
{
  +[_LSDAppProtectionService setLockedApplications:completion:](_LSDAppProtectionService, "setLockedApplications:completion:", a3, a4);
}

- (void)getLockedApplicationsWithCompletion:(id)a3
{
  +[_LSDAppProtectionService getLockedApplicationsWithCompletion:](_LSDAppProtectionService, "getLockedApplicationsWithCompletion:", a3);
}

- (NSMutableDictionary)createdInstallProgresses
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (LSInstallProgressList)observedInstallProgresses
{
  return (LSInstallProgressList *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observedInstallProgresses, 0);
  objc_storeStrong((id *)&self->_createdInstallProgresses, 0);
}

- (id)pluginsWithIdentifiers:(id)a3 protocols:(id)a4 version:(id)a5 withFilter:(id)a6
{
  id v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  v10 = a6;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __101__LSApplicationWorkspace_DeprecatedEnumeration__pluginsWithIdentifiers_protocols_version_withFilter___block_invoke;
  v14[3] = &unk_1E1040F70;
  v15 = v10;
  v11 = v10;
  -[LSApplicationWorkspace pluginsWithIdentifiers:protocols:version:applyFilter:](self, "pluginsWithIdentifiers:protocols:version:applyFilter:", a3, a4, a5, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __101__LSApplicationWorkspace_DeprecatedEnumeration__pluginsWithIdentifiers_protocols_version_withFilter___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)pluginsWithIdentifiers:(id)a3 protocols:(id)a4 version:(id)a5
{
  return -[LSApplicationWorkspace pluginsWithIdentifiers:protocols:version:applyFilter:](self, "pluginsWithIdentifiers:protocols:version:applyFilter:", a3, a4, a5, &__block_literal_global_520);
}

uint64_t __90__LSApplicationWorkspace_DeprecatedEnumeration__pluginsWithIdentifiers_protocols_version___block_invoke()
{
  return 1;
}

- (void)enumerateBundlesOfType:(unint64_t)a3 usingBlock:(id)a4
{
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __83__LSApplicationWorkspace_DeprecatedEnumeration__enumerateBundlesOfType_usingBlock___block_invoke;
    v8[3] = &unk_1E1040FB8;
    v9 = v6;
    -[LSApplicationWorkspace enumerateBundlesOfType:legacySPI:block:](self, "enumerateBundlesOfType:legacySPI:block:", a3, 1, v8);

  }
}

uint64_t __83__LSApplicationWorkspace_DeprecatedEnumeration__enumerateBundlesOfType_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)applicationsOfType:(unint64_t)a3
{
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__LSApplicationWorkspace_DeprecatedEnumeration__applicationsOfType___block_invoke;
  v8[3] = &unk_1E1040F20;
  v6 = v5;
  v9 = v6;
  -[LSApplicationWorkspace enumerateApplicationsOfType:legacySPI:block:](self, "enumerateApplicationsOfType:legacySPI:block:", a3, 1, v8);

  return v6;
}

uint64_t __68__LSApplicationWorkspace_DeprecatedEnumeration__applicationsOfType___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)legacyApplicationProxiesListWithType:(unint64_t)a3
{
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __86__LSApplicationWorkspace_DeprecatedEnumeration__legacyApplicationProxiesListWithType___block_invoke;
  v8[3] = &unk_1E1040F20;
  v6 = v5;
  v9 = v6;
  -[LSApplicationWorkspace enumerateBundlesOfType:legacySPI:block:](self, "enumerateBundlesOfType:legacySPI:block:", a3, 1, v8);

  return v6;
}

uint64_t __86__LSApplicationWorkspace_DeprecatedEnumeration__legacyApplicationProxiesListWithType___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)allInstalledApplications
{
  return -[LSApplicationWorkspace legacyApplicationProxiesListWithType:](self, "legacyApplicationProxiesListWithType:", 1);
}

- (id)placeholderApplications
{
  return -[LSApplicationWorkspace legacyApplicationProxiesListWithType:](self, "legacyApplicationProxiesListWithType:", 3);
}

- (id)unrestrictedApplications
{
  return -[LSApplicationWorkspace legacyApplicationProxiesListWithType:](self, "legacyApplicationProxiesListWithType:", 4);
}

- (id)allApplications
{
  return -[LSApplicationWorkspace legacyApplicationProxiesListWithType:](self, "legacyApplicationProxiesListWithType:", 0);
}

- (id)applicationsAvailableForOpeningDocument:(id)a3
{
  return (id)objc_msgSend(a3, "applicationsAvailableForOpeningWithStyle:limit:XPCConnection:error:", 0, -1, 0, 0);
}

+ (id)_defaultAppQueue
{
  if (_defaultAppQueue_once != -1)
    dispatch_once(&_defaultAppQueue_once, &__block_literal_global_533);
  return (id)_defaultAppQueue_result;
}

void __55__LSApplicationWorkspace_DefaultApps___defaultAppQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("LS default app setter queue", v2);
  v1 = (void *)_defaultAppQueue_result;
  _defaultAppQueue_result = (uint64_t)v0;

}

- (void)setDefaultURLHandlerForScheme:(id)a3 to:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  LSApplicationWorkspace *v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend((id)objc_opt_class(), "_defaultAppQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __83__LSApplicationWorkspace_DefaultApps__setDefaultURLHandlerForScheme_to_completion___block_invoke;
  v15[3] = &unk_1E1041000;
  v16 = v9;
  v17 = v8;
  v18 = self;
  v19 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async(v11, v15);

}

void __83__LSApplicationWorkspace_DefaultApps__setDefaultURLHandlerForScheme_to_completion___block_invoke(id *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  void (**v10)(id, _QWORD, void *);
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  const __CFString *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(a1[4], "claimRecords");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v20;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v20 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v6), "URLSchemes");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[5], "lowercaseString");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v7, "containsObject:", v8);

        if ((v9 & 1) != 0)
        {

          objc_msgSend((id)objc_opt_class(), "_defaultAppQueue");
          v14 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __83__LSApplicationWorkspace_DefaultApps__setDefaultURLHandlerForScheme_to_completion___block_invoke_2;
          block[3] = &unk_1E1040738;
          v16 = a1[5];
          v17 = a1[4];
          v18 = a1[7];
          dispatch_async(v14, block);

          v12 = v16;
          goto LABEL_12;
        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
      if (v4)
        continue;
      break;
    }
  }

  v10 = (void (**)(id, _QWORD, void *))a1[7];
  if (v10)
  {
    v11 = (void *)*MEMORY[0x1E0CB2F90];
    v23 = *MEMORY[0x1E0CB2938];
    v24 = CFSTR("scheme");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl(v11, -50, (uint64_t)"-[LSApplicationWorkspace(DefaultApps) setDefaultURLHandlerForScheme:to:completion:]_block_invoke", 4394, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v13);

LABEL_12:
  }
}

void __83__LSApplicationWorkspace_DefaultApps__setDefaultURLHandlerForScheme_to_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  int v5;
  _BOOL8 v6;
  id v7;
  uint64_t v8;
  id v9;
  _OWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  if (v4)
    objc_msgSend(v4, "_bundleVersion");
  else
    memset(v10, 0, sizeof(v10));
  v5 = _LSSetSchemeHandler(v2, (uint64_t)v3, v10);
  v9 = 0;
  v6 = _LSGetNSErrorFromOSStatusImpl(v5, &v9, (uint64_t)"-[LSApplicationWorkspace(DefaultApps) setDefaultURLHandlerForScheme:to:completion:]_block_invoke_2", 4388);
  v7 = v9;

  v8 = *(_QWORD *)(a1 + 48);
  if (v8)
    (*(void (**)(uint64_t, _BOOL8, id))(v8 + 16))(v8, v6, v7);

}

- (void)setDefaultWebBrowserToApplicationRecord:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  __int128 v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!v5)
  {
    v7 = 0;
    v8 = 0;
    goto LABEL_5;
  }
  if ((objc_msgSend(v5, "isWebBrowser") & 1) != 0)
  {
    objc_msgSend(v5, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_bundleVersion");
    _LSVersionNumberGetStringRepresentation(&v17);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    objc_msgSend((id)objc_opt_class(), "_defaultAppQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __97__LSApplicationWorkspace_DefaultApps__setDefaultWebBrowserToApplicationRecord_completionHandler___block_invoke;
    v13[3] = &unk_1E1040738;
    v14 = v7;
    v15 = v8;
    v16 = v6;
    v10 = v8;
    v11 = v7;
    dispatch_async(v9, v13);

LABEL_8:
    goto LABEL_9;
  }
  if (v6)
  {
    v12 = (void *)*MEMORY[0x1E0CB2F90];
    v18 = *MEMORY[0x1E0CB2938];
    v19[0] = CFSTR("input application record was not a web browser");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl(v12, -50, (uint64_t)"-[LSApplicationWorkspace(DefaultApps) setDefaultWebBrowserToApplicationRecord:completionHandler:]", 4410, v11);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, id))v6 + 2))(v6, 0, v10);
    goto LABEL_8;
  }
LABEL_9:

}

void __97__LSApplicationWorkspace_DefaultApps__setDefaultWebBrowserToApplicationRecord_completionHandler___block_invoke(uint64_t a1)
{
  int v2;
  _BOOL8 v3;
  id v4;
  uint64_t v5;
  id v6;

  v2 = _LSSetDefaultWebBrowserWithBundleIdentifierAndVersion(*(_QWORD *)(a1 + 32), *(__CFString **)(a1 + 40));
  v6 = 0;
  v3 = _LSGetNSErrorFromOSStatusImpl(v2, &v6, (uint64_t)"-[LSApplicationWorkspace(DefaultApps) setDefaultWebBrowserToApplicationRecord:completionHandler:]_block_invoke", 4422);
  v4 = v6;
  v5 = *(_QWORD *)(a1 + 48);
  if (v5)
    (*(void (**)(uint64_t, _BOOL8, id))(v5 + 16))(v5, v3, v4);

}

- (void)setDefaultMailClientToApplicationRecord:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!v5)
  {
    v7 = 0;
    v18 = kLSVersionNumberNull;
    v19 = *(_OWORD *)algn_1829FAD90;
    goto LABEL_5;
  }
  if ((objc_msgSend(v5, "isMailClient") & 1) != 0)
  {
    objc_msgSend(v5, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v5, "_bundleVersion");
LABEL_5:
    objc_msgSend((id)objc_opt_class(), "_defaultAppQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __97__LSApplicationWorkspace_DefaultApps__setDefaultMailClientToApplicationRecord_completionHandler___block_invoke;
    v13[3] = &unk_1E1041028;
    v14 = v7;
    v16 = v18;
    v17 = v19;
    v15 = v6;
    v9 = v7;
    dispatch_async(v8, v13);

    goto LABEL_8;
  }
  if (v6)
  {
    v10 = (void *)*MEMORY[0x1E0CB2F90];
    v20 = *MEMORY[0x1E0CB2938];
    v21[0] = CFSTR("input application record was not a mail client");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl(v10, -50, (uint64_t)"-[LSApplicationWorkspace(DefaultApps) setDefaultMailClientToApplicationRecord:completionHandler:]", 4442, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v12);

  }
LABEL_8:

}

void __97__LSApplicationWorkspace_DefaultApps__setDefaultMailClientToApplicationRecord_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  __int128 v3;
  int v4;
  _BOOL8 v5;
  id v6;
  uint64_t v7;
  id v8;
  _OWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_OWORD *)(a1 + 64);
  v9[0] = *(_OWORD *)(a1 + 48);
  v9[1] = v3;
  v4 = _LSSetSchemeHandler((uint64_t)CFSTR("mailto"), v2, v9);
  v8 = 0;
  v5 = _LSGetNSErrorFromOSStatusImpl(v4, &v8, (uint64_t)"-[LSApplicationWorkspace(DefaultApps) setDefaultMailClientToApplicationRecord:completionHandler:]_block_invoke", 4449);
  v6 = v8;
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, _BOOL8, id))(v7 + 16))(v7, v5, v6);

}

- (void)relaxApplicationTypeRequirements:(BOOL)a3 forApplicationRecord:(id)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void (*v16[4])(_QWORD, _QWORD);
  id v17;

  v6 = a3;
  v9 = a4;
  v10 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSApplicationWorkspace.m"), 4466, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("appRecord != nil"));

  }
  objc_msgSend(v9, "bundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = &__block_literal_global_543;
  if (v10)
    v12 = v10;
  v16[0] = (void (*)(_QWORD, _QWORD))MEMORY[0x1E0C809B0];
  v16[1] = (void (*)(_QWORD, _QWORD))3221225472;
  v16[2] = (void (*)(_QWORD, _QWORD))__111__LSApplicationWorkspace_DefaultApps__relaxApplicationTypeRequirements_forApplicationRecord_completionHandler___block_invoke_2;
  v16[3] = (void (*)(_QWORD, _QWORD))&unk_1E1040A40;
  v17 = v12;
  v13 = v12;
  +[_LSDService XPCProxyWithErrorHandler:]((uint64_t)_LSDModifyService, v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "relaxApplicationTypeRequirements:forBundleIdentifier:completionHandler:", v6, v11, v13);

}

uint64_t __111__LSApplicationWorkspace_DefaultApps__relaxApplicationTypeRequirements_forApplicationRecord_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)removeAllDefaultApplicationPreferencesWithCompletionHandler:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  if (!v3)
    v3 = &__block_literal_global_544;
  v5 = v3;
  +[_LSDService XPCProxyWithErrorHandler:]((uint64_t)_LSDModifyService, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllHandlersWithCompletionHandler:", v5);

}

- (id)applicationsAvailableForOpeningURL:(id)a3
{
  return -[LSApplicationWorkspace applicationsAvailableForOpeningURL:legacySPI:](self, "applicationsAvailableForOpeningURL:legacySPI:", a3, 0);
}

- (id)applicationsAvailableForOpeningURL:(id)a3 legacySPI:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  void *v24;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v4 = a4;
  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x186DAE7A0]();
  if (v5 && (objc_msgSend(v5, "isFileURL") & 1) == 0)
  {
    +[_LSCanOpenURLManager queryForApplicationsAvailableForOpeningURL:](_LSCanOpenURLManager, "queryForApplicationsAvailableForOpeningURL:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v27 = v6;
      objc_msgSend(v8, "setLegacy:", v4);
      +[_LSQueryContext defaultContext](_LSQueryContext, "defaultContext");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v9;
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "resolveQueries:error:", v11, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "allValues");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
        v15 = v14;
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v7 = v14;
      v16 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v29;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v29 != v18)
              objc_enumerationMutation(v7);
            v20 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
            _LSDefaultLog();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v20, "bundleIdentifier");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "scheme");
              v23 = v5;
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138478083;
              v33 = v22;
              v34 = 2113;
              v35 = v24;
              _os_log_impl(&dword_182882000, v21, OS_LOG_TYPE_DEFAULT, "Found application: %{private}@ to handle url scheme: %{private}@", buf, 0x16u);

              v5 = v23;
            }

          }
          v17 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        }
        while (v17);
      }

      v9 = v26;
      v6 = v27;
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }
  objc_autoreleasePoolPop(v6);

  return v7;
}

- (BOOL)isApplicationAvailableToOpenURL:(id)a3 error:(id *)a4
{
  return -[LSApplicationWorkspace isApplicationAvailableToOpenURLCommon:includePrivateURLSchemes:error:](self, "isApplicationAvailableToOpenURLCommon:includePrivateURLSchemes:error:", a3, 1, a4);
}

void __107__LSApplicationWorkspace_URLQueries__isApplicationAvailableToOpenURLCommon_includePrivateURLSchemes_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)applicationForOpeningResource:(id)a3
{
  void *v3;
  void *v4;

  -[LSApplicationWorkspace applicationsAvailableForOpeningURL:legacySPI:](self, "applicationsAvailableForOpeningURL:legacySPI:", a3, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)applicationsAvailableForHandlingURLScheme:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  if (a3)
  {
    v4 = (objc_class *)MEMORY[0x1E0C99E98];
    v5 = a3;
    v6 = [v4 alloc];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@://"), v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)objc_msgSend(v6, "initWithString:", v7);
    if ((objc_msgSend(v8, "isFileURL") & 1) != 0)
    {
      v9 = 0;
    }
    else
    {
      -[LSApplicationWorkspace applicationsAvailableForOpeningURL:legacySPI:](self, "applicationsAvailableForOpeningURL:legacySPI:", v8, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)publicURLSchemes
{
  NSObject *v3;

  _LSDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    -[LSApplicationWorkspace(DeprecatedURLQueries) publicURLSchemes].cold.1((uint64_t)a2, v3);

  return (id)MEMORY[0x1E0C9AA60];
}

- (id)privateURLSchemes
{
  NSObject *v3;

  _LSDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    -[LSApplicationWorkspace(DeprecatedURLQueries) publicURLSchemes].cold.1((uint64_t)a2, v3);

  return (id)MEMORY[0x1E0C9AA60];
}

- (id)URLOverrideForNewsURL:(id)a3
{
  return a3;
}

- (void)systemMode
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_3(&dword_182882000, v0, v1, "Failed to get system mode with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __98__LSApplicationWorkspace_commonClientOpenURL_options_configuration_synchronous_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_15_0(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 138478083;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_2_0(&dword_182882000, v1, v2, "Failed to open URL synchronously: %{private}@: %{public}@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

void __98__LSApplicationWorkspace_commonClientOpenURL_options_configuration_synchronous_completionHandler___block_invoke_227_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_15_0(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 138478083;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_2_0(&dword_182882000, v1, v2, "Failed to open URL asynchronously %{private}@: %{public}@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

void __98__LSApplicationWorkspace_commonClientOpenURL_options_configuration_synchronous_completionHandler___block_invoke_228_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_15_0(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 138478083;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_2_0(&dword_182882000, v1, v2, "Failed to open URL %{private}@: %{public}@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

- (void)installApplication:(uint64_t)a3 withOptions:(uint64_t)a4 error:(uint64_t)a5 usingBlock:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_1(&dword_182882000, a1, a3, "this process is using %{public}s to install applications, which is deprecated. Use InstallCoordination to install and uninstall applications on this platform.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)installContainerizedApplicationArtifactAtURL:(uint64_t)a3 withOptions:(uint64_t)a4 returningRecordPromise:(uint64_t)a5 error:(uint64_t)a6 progressBlock:(uint64_t)a7 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_1(&dword_182882000, a1, a3, "this process is using %{public}s to install applications, which is unsupported. Use InstallCoordination to install and uninstall applications on this platform.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)uninstallContainerizedApplicationWithIdentifier:(uint64_t)a3 options:(uint64_t)a4 error:(uint64_t)a5 progressBlock:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_1(&dword_182882000, a1, a3, "this process is using %{public}s to uninstall applications, which is deprecated. Use InstallCoordination to install and uninstall applications on this platform.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)downgradeApplicationToPlaceholder:withOptions:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_0(&dword_182882000, v0, v1, "This process is using deprecated SPI. This is a bug in the caller. Use InstallCoordination instead. ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_33();
}

- (void)uninstallApplication:(uint64_t)a3 withOptions:(uint64_t)a4 error:(uint64_t)a5 usingBlock:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_1(&dword_182882000, a1, a3, "this process is using %{public}s to uninstall applications, which is deprecated. Use InstallCoordination to install and uninstall applications on this platform.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)registerApplicationDictionary:withObserverNotification:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[14];
  int v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_23_0();
  v3 = 0;
  OUTLINED_FUNCTION_17_0(&dword_182882000, v0, v1, "Failed to create application proxy for %@, regustration result was %d", v2);
  OUTLINED_FUNCTION_1();
}

- (void)unregisterApplicationsAtMountPoint:(void *)a1 operationUUID:(uint64_t)a2 saveObserver:(uint64_t)a3 requestContext:(NSObject *)a4 .cold.1(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  uint64_t v5;

  v5 = *(_QWORD *)(*(_QWORD *)a2 + 40);
  *(_DWORD *)a3 = 138412546;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = v5;
  OUTLINED_FUNCTION_4_0(&dword_182882000, a4, a3, "Unable to unregister applications at mount point: %@: %@", (uint8_t *)a3);

}

- (void)unregisterApplication:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2_0(&dword_182882000, v0, v1, "Unable to unregister application at %@: %@");
  OUTLINED_FUNCTION_1();
}

- (void)updateSINFWithData:(uint64_t)a3 forApplication:(uint64_t)a4 options:(uint64_t)a5 error:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_1(&dword_182882000, a1, a3, "%s is no longer supported. Adopt InstallCoordination to update iTMD and SINF.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_getBundleIdentifierForBundleAtURL:invokeUpdateBlockAndReregister:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_182882000, v0, v1, "Could not get record by URL: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_getBundleIdentifierForBundleAtURL:invokeUpdateBlockAndReregister:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_182882000, v0, v1, "failed to reregister: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_getBundleIdentifierForBundleAtURL:invokeUpdateBlockAndReregister:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_182882000, v0, v1, "update block failed; not reregistering URL: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)updateiTunesMetadataWithData:(uint64_t)a3 forApplication:(uint64_t)a4 options:(uint64_t)a5 error:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_1(&dword_182882000, a1, a3, "%s is no longer supported. Adopt InstallCoordination to update iTMD and SINF.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)updateiTunesMetadataWithData:(uint64_t)a3 forApplicationAtURL:(uint64_t)a4 error:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_1(&dword_182882000, a1, a3, "%s is no longer supported. Adopt InstallCoordination to update iTMD and SINF.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)updatePlaceholderMetadataForApp:installType:failure:underlyingError:source:outError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_182882000, v0, v1, "MobileInstallatinUpdatePlaceholderMetadata returned error %@, not updating LaunchServices database", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)unregisterPlugin:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_2_0(&dword_182882000, v0, v1, "Error unregistering plugins at URL %@: %@");
  OUTLINED_FUNCTION_1();
}

void __56__LSApplicationWorkspace_deviceIdentifierForAdvertising__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_182882000, v0, v1, "could not retrieve device identifier for advertising! %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __56__LSApplicationWorkspace_deviceIdentifierForAdvertising__block_invoke_264_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_0(&dword_182882000, v0, v1, "advertising identifier returned from service was nil!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_33();
}

void __51__LSApplicationWorkspace_deviceIdentifierForVendor__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_182882000, v0, v1, "could not retrieve device identifier for vendor! %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __51__LSApplicationWorkspace_deviceIdentifierForVendor__block_invoke_267_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_0(&dword_182882000, v0, v1, "vendor identifier returned from service was nil!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_33();
}

void __68__LSApplicationWorkspace_urlContainsDeviceIdentifierForAdvertising___block_invoke_2_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_15_0(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 138740227;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_182882000, v1, v2, "could not retrieve device identifier for advertising while checking url: %{sensitive}@ %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

- (void)deviceIdentifierForVendorSeedData
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_20(&dword_182882000, v0, v1, "Vendor seed UUID is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_33();
}

- (void)installProgressForBundleID:(void *)a1 makeSynchronous:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_LSDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  _os_log_debug_impl(&dword_182882000, a2, OS_LOG_TYPE_DEBUG, "Returning progress %@", v4, 0xCu);

  OUTLINED_FUNCTION_16();
}

- (void)installProgressForBundleID:makeSynchronous:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_182882000, v0, v1, "Getting installProgress for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __69__LSApplicationWorkspace_installProgressForBundleID_makeSynchronous___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_0_1(&dword_182882000, v0, v1, "Attempting subscribe to progress for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __69__LSApplicationWorkspace_installProgressForBundleID_makeSynchronous___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_1_0(&dword_182882000, v0, v1, "NOT subscribing to progress for %@, existing subscriptions %@");
  OUTLINED_FUNCTION_1();
}

void __66__LSApplicationWorkspace_installProgressForApplication_withPhase___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_15_0(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_182882000, v1, v2, "Failed to create install progress for application %@: %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

- (void)installPhaseFinishedForProgress:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_1_0(&dword_182882000, v0, v1, "installPhaseFinishedForProgress: %@ - %@ called, removing progress from cache");
  OUTLINED_FUNCTION_1();
}

void __95__LSApplicationWorkspace__LSPrivateRebuildApplicationDatabasesForSystemApps_internal_user_uid___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_182882000, v0, v1, "error on connection to modify service: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __55__LSApplicationWorkspace__LSPrivateNoteMigratorRunning__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_182882000, v0, v1, "could not note migrator running in lsd: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __55__LSApplicationWorkspace__LSPrivateNoteMigratorRunning__block_invoke_288_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_182882000, v0, v1, "could not note migrator running in lsd: note returned %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __56__LSApplicationWorkspace__LSFailedToOpenURL_withBundle___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_15_0(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 138478083;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_182882000, v1, v2, "*** ERROR *** Presenting restoration prompt for %{private}@: %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

- (void)sendApplicationStateChangedNotificationsFor:(uint64_t)a3 stateProvider:(uint64_t)a4 completion:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_1(&dword_182882000, a1, a3, "Called %s but not in the database server. Please file a bug.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end

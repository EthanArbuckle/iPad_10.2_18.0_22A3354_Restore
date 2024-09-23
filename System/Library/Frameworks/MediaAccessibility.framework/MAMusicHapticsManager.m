@implementation MAMusicHapticsManager

+ (MAMusicHapticsManager)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global);
  return (MAMusicHapticsManager *)(id)sharedManager_Manager;
}

void __38__MAMusicHapticsManager_sharedManager__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedManager_Manager;
  sharedManager_Manager = v0;

}

- (MAMusicHapticsManager)init
{
  MAMusicHapticsManager *v2;
  void *v3;
  void *v4;
  void *v5;
  MAMusicHapticsManager *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  MAMusicHapticsManager *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MAMusicHapticsManager;
  v2 = -[MAMusicHapticsManager init](&v13, sel_init);
  objc_msgSend(getAXSettingsClass(), "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:", CFSTR("hapticMusicActive"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAMusicHapticsManager setMusicHapticsActive:](v2, "setMusicHapticsActive:", objc_msgSend(v4, "BOOLValue"));

  objc_msgSend(getAXSettingsClass(), "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __29__MAMusicHapticsManager_init__block_invoke;
  v11[3] = &unk_1E69284B8;
  v6 = v2;
  v12 = v6;
  objc_msgSend(v5, "registerUpdateBlock:forRetrieveSelector:withListener:", v11, sel_hapticMusicActive, v6);

  v7 = (void *)objc_opt_new();
  -[MAMusicHapticsManager setAhapAvailableCache:](v6, "setAhapAvailableCache:", v7);

  v8 = (void *)objc_opt_new();
  -[MAMusicHapticsManager setAppSupportsCache:](v6, "setAppSupportsCache:", v8);

  v9 = (void *)objc_opt_new();
  -[MAMusicHapticsManager setPendingAvailableObservers:](v6, "setPendingAvailableObservers:", v9);

  -[MAMusicHapticsManager _clearAHAPCache](v6, "_clearAHAPCache");
  return v6;
}

void __29__MAMusicHapticsManager_init__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(getAXSettingsClass(), "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:", CFSTR("hapticMusicActive"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setMusicHapticsActive:", objc_msgSend(v2, "BOOLValue"));

}

- (BOOL)musicHapticsEnabled
{
  return soft_AXSHapticMusicEnabled() != 0;
}

- (void)_clearAHAPCache
{
  dispatch_time_t v3;
  _QWORD block[5];

  v3 = dispatch_time(0, 86400000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__MAMusicHapticsManager__clearAHAPCache__block_invoke;
  block[3] = &unk_1E69284B8;
  block[4] = self;
  dispatch_after(v3, MEMORY[0x1E0C80D38], block);
}

uint64_t __40__MAMusicHapticsManager__clearAHAPCache__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "ahapAvailableCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

  return objc_msgSend(*(id *)(a1 + 32), "_clearAHAPCache");
}

+ (BOOL)musicHapticsEnabled
{
  return soft_AXSHapticMusicEnabled() != 0;
}

- (id)_serviceName
{
  return CFSTR("AXHapticMusicServer");
}

- (id)_hapticMusicServerClient
{
  void *v3;
  void *v4;
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  -[MAMusicHapticsManager client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x2050000000;
    v4 = (void *)getAXUIClientClass_softClass;
    v19 = getAXUIClientClass_softClass;
    if (!getAXUIClientClass_softClass)
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __getAXUIClientClass_block_invoke;
      v15[3] = &unk_1E69283D0;
      v15[4] = &v16;
      __getAXUIClientClass_block_invoke((uint64_t)v15);
      v4 = (void *)v17[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v16, 8);
    v6 = [v5 alloc];
    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("HapticMusicClientAPI-%@"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MAMusicHapticsManager _serviceName](self, "_serviceName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v6, "initWithIdentifier:serviceBundleName:", v10, v11);
    -[MAMusicHapticsManager setClient:](self, "setClient:", v12);

    -[MAMusicHapticsManager client](self, "client");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDelegate:", self);

  }
  -[MAMusicHapticsManager client](self, "client");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)connectionWithServiceWasInterruptedForUserInterfaceClient:(id)a3
{
  -[MAMusicHapticsManager setClient:](self, "setClient:", 0);
}

- (void)appSupportsMusicHaptics:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[2];
  _QWORD v34[3];

  v34[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  HMLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[MAMusicHapticsManager appSupportsMusicHaptics:completionHandler:].cold.2((uint64_t)v6, v8, v9, v10, v11, v12, v13, v14);

  if (v7)
  {
    if (v6)
    {
      -[MAMusicHapticsManager appSupportsCache](self, "appSupportsCache");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", v6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        HMLog();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          -[MAMusicHapticsManager appSupportsMusicHaptics:completionHandler:].cold.1((uint64_t)v16, v17, v18, v19, v20, v21, v22, v23);

        v7[2](v7, objc_msgSend(v16, "BOOLValue"));
      }
      else
      {
        -[MAMusicHapticsManager appSupportedObservers](self, "appSupportedObservers");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v24)
        {
          v25 = (void *)objc_opt_new();
          -[MAMusicHapticsManager setAppSupportedObservers:](self, "setAppSupportedObservers:", v25);

        }
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "UUIDString");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        v28 = (void *)objc_opt_new();
        objc_msgSend(v28, "setObserver:", v7);
        -[MAMusicHapticsManager appSupportedObservers](self, "appSupportedObservers");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setObject:forKeyedSubscript:", v28, v27);

        v33[0] = CFSTR("bundleIdentifier");
        v33[1] = CFSTR("uuid");
        v34[0] = v6;
        v34[1] = v27;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[MAMusicHapticsManager _hapticMusicServerClient](self, "_hapticMusicServerClient");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(getAXAccessQueueClass(), "mainAccessQueue");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "sendAsynchronousMessage:withIdentifier:targetAccessQueue:completion:", v30, 5, v32, 0);

      }
    }
    else
    {
      v7[2](v7, 0);
    }
  }

}

- (void)checkHapticTrackAvailabilityForMediaMatchingCode:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[3];
  _QWORD v28[3];
  uint8_t buf[4];
  id v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  if (v7)
  {
    if (-[MAMusicHapticsManager musicHapticsEnabled](self, "musicHapticsEnabled") && v6)
    {
      -[MAMusicHapticsManager ahapAvailableObservers](self, "ahapAvailableObservers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        v9 = (void *)objc_opt_new();
        -[MAMusicHapticsManager setAhapAvailableObservers:](self, "setAhapAvailableObservers:", v9);

      }
      HMLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v6;
        _os_log_impl(&dword_1B5518000, v10, OS_LOG_TYPE_DEFAULT, "Asking haptic track available: %@", buf, 0xCu);
      }

      -[MAMusicHapticsManager ahapAvailableCache](self, "ahapAvailableCache");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        HMLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v30 = v12;
          _os_log_impl(&dword_1B5518000, v13, OS_LOG_TYPE_INFO, "Has cached value: %@", buf, 0xCu);
        }

        v7[2](v7, objc_msgSend(v12, "BOOLValue"));
        goto LABEL_19;
      }
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "UUIDString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = (void *)objc_opt_new();
      objc_msgSend(v16, "setObserver:", v7);
      -[MAMusicHapticsManager pendingAvailableObservers](self, "pendingAvailableObservers");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKeyedSubscript:", v6);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        -[MAMusicHapticsManager pendingAvailableObservers](self, "pendingAvailableObservers");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKeyedSubscript:", v6);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v20, "addObject:", v16);
        HMLog();
        v21 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
LABEL_18:

LABEL_19:
          goto LABEL_20;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v20, "count"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v30 = v6;
        v31 = 2112;
        v32 = v22;
        _os_log_impl(&dword_1B5518000, v21, OS_LOG_TYPE_INFO, "Someone already asking for this code, will wait: %@ [%@]", buf, 0x16u);
      }
      else
      {
        -[MAMusicHapticsManager ahapAvailableObservers](self, "ahapAvailableObservers");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setObject:forKeyedSubscript:", v16, v15);

        v28[0] = v6;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MAMusicHapticsManager treatCodesAsAdamIDs](self, "treatCodesAsAdamIDs", CFSTR("code"), CFSTR("treatAsAdamID")));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v27[2] = CFSTR("uuid");
        v28[1] = v24;
        v28[2] = v15;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 3);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v25 = (void *)objc_opt_new();
        -[MAMusicHapticsManager pendingAvailableObservers](self, "pendingAvailableObservers");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v25, v6);

        -[MAMusicHapticsManager _hapticMusicServerClient](self, "_hapticMusicServerClient");
        v21 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(getAXAccessQueueClass(), "mainAccessQueue");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject sendAsynchronousMessage:withIdentifier:targetAccessQueue:completion:](v21, "sendAsynchronousMessage:withIdentifier:targetAccessQueue:completion:", v20, 2, v22, 0);
      }

      goto LABEL_18;
    }
    v7[2](v7, 0);
  }
LABEL_20:

}

- (id)addStatusObserverBlock:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__MAMusicHapticsManager_addStatusObserverBlock___block_invoke;
  v8[3] = &unk_1E69284E0;
  v9 = v4;
  v5 = v4;
  -[MAMusicHapticsManager addStatusObserver:](self, "addStatusObserver:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __48__MAMusicHapticsManager_addStatusObserverBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)addStatusObserver:(id)a3
{
  id v4;
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
  _QWORD v16[3];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4 && -[MAMusicHapticsManager musicHapticsEnabled](self, "musicHapticsEnabled"))
  {
    -[MAMusicHapticsManager statusObservers](self, "statusObservers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v6 = (void *)objc_opt_new();
      -[MAMusicHapticsManager setStatusObservers:](self, "setStatusObservers:", v6);

    }
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)objc_opt_new();
    objc_msgSend(v9, "setObserver:", v4);
    -[MAMusicHapticsManager statusObservers](self, "statusObservers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v8);

    v17[0] = v8;
    v16[0] = CFSTR("uuid");
    v16[1] = CFSTR("treatAsAdamID");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MAMusicHapticsManager treatCodesAsAdamIDs](self, "treatCodesAsAdamIDs"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[2] = CFSTR("register");
    v17[1] = v11;
    v17[2] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[MAMusicHapticsManager _hapticMusicServerClient](self, "_hapticMusicServerClient");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(getAXAccessQueueClass(), "mainAccessQueue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sendAsynchronousMessage:withIdentifier:targetAccessQueue:completion:", v12, 3, v14, 0);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)userInterfaceClient:(id)a3 messageFromServerForWithIdentifierShouldBeProcessedAsynchronously:(unint64_t)a4
{
  return 1;
}

- (void)userInterfaceClient:(id)a3 processMessageFromServerAsynchronously:(id)a4 withIdentifier:(unint64_t)a5 completion:(id)a6
{
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  NSObject *v22;
  void (**v23)(_QWORD, _QWORD, _QWORD);
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void (**v42)(_QWORD, _QWORD, _QWORD);
  void *v43;
  NSObject *v44;
  void (**v45)(_QWORD, _QWORD);
  void (**v46)(_QWORD, _QWORD, _QWORD);
  _QWORD block[4];
  id v48;
  char v49;
  _QWORD v50[4];
  id v51;
  id v52;
  char v53;
  _QWORD v54[4];
  void (**v55)(_QWORD, _QWORD, _QWORD);
  id v56;
  uint8_t buf[4];
  id v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a6;
  HMLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[MAMusicHapticsManager userInterfaceClient:processMessageFromServerAsynchronously:withIdentifier:completion:].cold.1((uint64_t)v9, v11, v12, v13, v14, v15, v16, v17);

  switch(a5)
  {
    case 2uLL:
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("uuid"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        -[MAMusicHapticsManager ahapAvailableObservers](self, "ahapAvailableObservers");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "objectForKeyedSubscript:", v18);
        v20 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v20, "observer");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v27)
        {
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("available"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("code"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v30 = 0;
          if ((objc_opt_isKindOfClass() & 1) != 0 && v29)
          {
            v30 = objc_msgSend(v28, "BOOLValue");
            -[MAMusicHapticsManager ahapAvailableCache](self, "ahapAvailableCache");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "setObject:forKeyedSubscript:", v28, v29);

          }
          v46 = (void (**)(_QWORD, _QWORD, _QWORD))v28;
          HMLog();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v58 = v9;
            _os_log_impl(&dword_1B5518000, v32, OS_LOG_TYPE_DEFAULT, "Haptic track available: %@", buf, 0xCu);
          }

          __110__MAMusicHapticsManager_userInterfaceClient_processMessageFromServerAsynchronously_withIdentifier_completion___block_invoke_2(v33, v20, v30);
          -[MAMusicHapticsManager pendingAvailableObservers](self, "pendingAvailableObservers");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "objectForKeyedSubscript:", v29);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v50[0] = MEMORY[0x1E0C809B0];
          v50[1] = 3221225472;
          v50[2] = __110__MAMusicHapticsManager_userInterfaceClient_processMessageFromServerAsynchronously_withIdentifier_completion___block_invoke_228;
          v50[3] = &unk_1E6928598;
          v36 = v29;
          v51 = v36;
          v52 = &__block_literal_global_225;
          v53 = v30;
          objc_msgSend(v35, "enumerateObjectsUsingBlock:", v50);

          if (v29)
          {
            -[MAMusicHapticsManager pendingAvailableObservers](self, "pendingAvailableObservers");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "setObject:forKeyedSubscript:", 0, v36);

          }
          v23 = v46;
          goto LABEL_35;
        }
        goto LABEL_36;
      }
      goto LABEL_37;
    case 5uLL:
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("uuid"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        -[MAMusicHapticsManager appSupportedObservers](self, "appSupportedObservers");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "objectForKeyedSubscript:", v18);
        v20 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v20, "observer");
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        if (v39)
        {
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("supported"));
          v23 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("bundleIdentifier"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v41 = objc_msgSend(v23, "BOOLValue");
            -[MAMusicHapticsManager appSupportsCache](self, "appSupportsCache");
            v42 = v23;
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "setObject:forKeyedSubscript:", v42, v40);

            v23 = v42;
          }
          else
          {
            v41 = 0;
          }
          HMLog();
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v58 = v9;
            _os_log_impl(&dword_1B5518000, v44, OS_LOG_TYPE_DEFAULT, "App supports: %@", buf, 0xCu);
          }

          if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
          {
            objc_msgSend(v20, "observer");
            v45 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
            v45[2](v45, v41);
          }
          else
          {
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __110__MAMusicHapticsManager_userInterfaceClient_processMessageFromServerAsynchronously_withIdentifier_completion___block_invoke_232;
            block[3] = &unk_1E6928570;
            v48 = v20;
            v49 = v41;
            dispatch_async(MEMORY[0x1E0C80D38], block);
            v45 = (void (**)(_QWORD, _QWORD))v48;
          }

          goto LABEL_35;
        }
LABEL_36:

      }
LABEL_37:

      break;
    case 3uLL:
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("uuid"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        -[MAMusicHapticsManager statusObservers](self, "statusObservers");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKeyedSubscript:", v18);
        v20 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v20, "observer");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          HMLog();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v58 = v9;
            _os_log_impl(&dword_1B5518000, v22, OS_LOG_TYPE_DEFAULT, "Status update: %@", buf, 0xCu);
          }

          if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
          {
            objc_msgSend(v20, "observer");
            v23 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("code"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("active"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            ((void (**)(_QWORD, void *, uint64_t))v23)[2](v23, v24, objc_msgSend(v25, "BOOLValue"));

          }
          else
          {
            v54[0] = MEMORY[0x1E0C809B0];
            v54[1] = 3221225472;
            v54[2] = __110__MAMusicHapticsManager_userInterfaceClient_processMessageFromServerAsynchronously_withIdentifier_completion___block_invoke;
            v54[3] = &unk_1E6928508;
            v20 = v20;
            v55 = (void (**)(_QWORD, _QWORD, _QWORD))v20;
            v56 = v9;
            dispatch_async(MEMORY[0x1E0C80D38], v54);

            v23 = v55;
          }
LABEL_35:

          goto LABEL_36;
        }
        goto LABEL_36;
      }
      goto LABEL_37;
  }
  (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);

}

void __110__MAMusicHapticsManager_userInterfaceClient_processMessageFromServerAsynchronously_withIdentifier_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void (**v4)(id, void *, uint64_t);

  objc_msgSend(*(id *)(a1 + 32), "observer");
  v4 = (void (**)(id, void *, uint64_t))objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("code"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("active"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v2, objc_msgSend(v3, "BOOLValue"));

}

void __110__MAMusicHapticsManager_userInterfaceClient_processMessageFromServerAsynchronously_withIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  _QWORD v6[4];
  id v7;
  char v8;

  v4 = a2;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    objc_msgSend(v4, "observer");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v5[2](v5, a3);

  }
  else
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __110__MAMusicHapticsManager_userInterfaceClient_processMessageFromServerAsynchronously_withIdentifier_completion___block_invoke_3;
    v6[3] = &unk_1E6928570;
    v7 = v4;
    v8 = a3;
    dispatch_async(MEMORY[0x1E0C80D38], v6);

  }
}

void __110__MAMusicHapticsManager_userInterfaceClient_processMessageFromServerAsynchronously_withIdentifier_completion___block_invoke_3(uint64_t a1)
{
  void (**v2)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "observer");
  v2 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
  v2[2](v2, *(unsigned __int8 *)(a1 + 40));

}

void __110__MAMusicHapticsManager_userInterfaceClient_processMessageFromServerAsynchronously_withIdentifier_completion___block_invoke_228(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  HMLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412802;
    v11 = v5;
    v12 = 2112;
    v13 = v7;
    v14 = 2112;
    v15 = v8;
    _os_log_impl(&dword_1B5518000, v6, OS_LOG_TYPE_DEFAULT, "Sending haptic track available for pender: %@ %@ [%@]", (uint8_t *)&v10, 0x20u);

  }
  objc_msgSend(v5, "observer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __110__MAMusicHapticsManager_userInterfaceClient_processMessageFromServerAsynchronously_withIdentifier_completion___block_invoke_232(uint64_t a1)
{
  void (**v2)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "observer");
  v2 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
  v2[2](v2, *(unsigned __int8 *)(a1 + 40));

}

- (void)removeStatusObserver:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[MAMusicHapticsManager statusObservers](self, "statusObservers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[MAMusicHapticsManager _hapticMusicServerClient](self, "_hapticMusicServerClient");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = CFSTR("uuid");
      v11[1] = CFSTR("register");
      v12[0] = v4;
      v12[1] = MEMORY[0x1E0C9AAA0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(getAXAccessQueueClass(), "mainAccessQueue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "sendAsynchronousMessage:withIdentifier:targetAccessQueue:completion:", v8, 3, v9, 0);

      -[MAMusicHapticsManager statusObservers](self, "statusObservers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, v4);

    }
  }

}

- (AXUIClient)client
{
  return self->client;
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->client, a3);
}

- (NSMutableDictionary)statusObservers
{
  return self->statusObservers;
}

- (void)setStatusObservers:(id)a3
{
  objc_storeStrong((id *)&self->statusObservers, a3);
}

- (NSMutableDictionary)ahapAvailableObservers
{
  return self->ahapAvailableObservers;
}

- (void)setAhapAvailableObservers:(id)a3
{
  objc_storeStrong((id *)&self->ahapAvailableObservers, a3);
}

- (BOOL)treatCodesAsAdamIDs
{
  return self->treatCodesAsAdamIDs;
}

- (void)setTreatCodesAsAdamIDs:(BOOL)a3
{
  self->treatCodesAsAdamIDs = a3;
}

- (BOOL)musicHapticsActive
{
  return self->musicHapticsActive;
}

- (void)setMusicHapticsActive:(BOOL)a3
{
  self->musicHapticsActive = a3;
}

- (NSMutableDictionary)ahapAvailableCache
{
  return self->ahapAvailableCache;
}

- (void)setAhapAvailableCache:(id)a3
{
  objc_storeStrong((id *)&self->ahapAvailableCache, a3);
}

- (NSMutableDictionary)appSupportsCache
{
  return self->appSupportsCache;
}

- (void)setAppSupportsCache:(id)a3
{
  objc_storeStrong((id *)&self->appSupportsCache, a3);
}

- (NSMutableDictionary)appSupportedObservers
{
  return self->appSupportedObservers;
}

- (void)setAppSupportedObservers:(id)a3
{
  objc_storeStrong((id *)&self->appSupportedObservers, a3);
}

- (NSMutableDictionary)pendingAvailableObservers
{
  return self->pendingAvailableObservers;
}

- (void)setPendingAvailableObservers:(id)a3
{
  objc_storeStrong((id *)&self->pendingAvailableObservers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->pendingAvailableObservers, 0);
  objc_storeStrong((id *)&self->appSupportedObservers, 0);
  objc_storeStrong((id *)&self->appSupportsCache, 0);
  objc_storeStrong((id *)&self->ahapAvailableCache, 0);
  objc_storeStrong((id *)&self->ahapAvailableObservers, 0);
  objc_storeStrong((id *)&self->statusObservers, 0);
  objc_storeStrong((id *)&self->client, 0);
}

- (void)appSupportsMusicHaptics:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B5518000, a2, a3, "Has cached value: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)appSupportsMusicHaptics:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B5518000, a2, a3, "Asking app supports music haptics: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)userInterfaceClient:(uint64_t)a3 processMessageFromServerAsynchronously:(uint64_t)a4 withIdentifier:(uint64_t)a5 completion:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B5518000, a2, a3, "Callback message received: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end

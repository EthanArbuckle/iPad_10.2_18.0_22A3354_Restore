@implementation FMDFMIPManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  return (id)sharedInstance__instance;
}

void __32__FMDFMIPManager_sharedInstance__block_invoke()
{
  FMDFMIPManager *v0;
  void *v1;

  v0 = objc_alloc_init(FMDFMIPManager);
  v1 = (void *)sharedInstance__instance;
  sharedInstance__instance = (uint64_t)v0;

}

- (FMDFMIPManager)init
{
  FMDFMIPManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *serialQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FMDFMIPManager;
  v2 = -[FMDFMIPManager init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.icloud.FindMyDevice.FMDFMIPManager", 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)getConnectedAccessoriesDiscoveryIds:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1CAA4547C]();
  LogCategory_Unspecified();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[FMDFMIPManager getConnectedAccessoriesDiscoveryIds:]";
    _os_log_impl(&dword_1C9939000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  fmdFMIPLastOperationResult = 0;
  +[FMNSXPCConnectionCache sharedCache](FMNSXPCConnectionCache, "sharedCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[FMNSXPCConnectionConfiguration fmipConfiguration](FMNSXPCConnectionConfiguration, "fmipConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resumeConnectionWithConfiguration:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __54__FMDFMIPManager_getConnectedAccessoriesDiscoveryIds___block_invoke;
  v17[3] = &unk_1E829C100;
  v10 = v3;
  v18 = v10;
  objc_msgSend(v8, "addFailureBlock:", v17);
  objc_msgSend(v8, "remoteObjectProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __54__FMDFMIPManager_getConnectedAccessoriesDiscoveryIds___block_invoke_145;
  v14[3] = &unk_1E829C648;
  v12 = v10;
  v15 = v8;
  v16 = v12;
  v13 = v8;
  objc_msgSend(v11, "getConnectedAccessoriesDiscoveryIds:", v14);

  objc_autoreleasePoolPop(v4);
}

- (void)fmipStateWithCompletion:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1CAA4547C]();
  LogCategory_Unspecified();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[FMDFMIPManager fmipStateWithCompletion:]";
    _os_log_impl(&dword_1C9939000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  fmdFMIPLastOperationResult = 0;
  +[FMNSXPCConnectionCache sharedCache](FMNSXPCConnectionCache, "sharedCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[FMNSXPCConnectionConfiguration fmipConfiguration](FMNSXPCConnectionConfiguration, "fmipConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resumeConnectionWithConfiguration:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __42__FMDFMIPManager_fmipStateWithCompletion___block_invoke;
  v17[3] = &unk_1E829C100;
  v10 = v3;
  v18 = v10;
  objc_msgSend(v8, "addFailureBlock:", v17);
  objc_msgSend(v8, "remoteObjectProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __42__FMDFMIPManager_fmipStateWithCompletion___block_invoke_33;
  v14[3] = &unk_1E829C3C8;
  v12 = v10;
  v15 = v8;
  v16 = v12;
  v13 = v8;
  objc_msgSend(v11, "getFMIPStateUsingCallback:", v14);

  objc_autoreleasePoolPop(v4);
}

- (BOOL)lostModeIsActive
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  _BOOL4 v17;
  NSObject *v18;
  int v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1CAA4547C](self, a2);
  LogCategory_Unspecified();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 136315138;
    v21 = "-[FMDFMIPManager lostModeIsActive]";
    _os_log_impl(&dword_1C9939000, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v20, 0xCu);
  }

  fmdFMIPLastOperationResult = 0;
  if (-[FMDFMIPManager _isRunningAsMobileUser](self, "_isRunningAsMobileUser"))
  {
    objc_msgSend(MEMORY[0x1E0D20200], "synchronizeDomain:", kFMDPublicNotBackedUpPrefDomain);
    objc_msgSend(MEMORY[0x1E0D20200], "dictionaryForKey:inDomain:", CFSTR("FMIPLostModeInfo"), kFMDPublicNotBackedUpPrefDomain);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "objectForKey:", CFSTR("lostModeEnabled"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "BOOLValue");

      if ((v8 & 1) != 0)
        goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x1E0D20200], "dictionaryForKey:inDomain:", CFSTR("ClientLostModeInfo"), kFMDPublicNotBackedUpPrefDomain);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = v9;
      objc_msgSend(v9, "objectForKey:", CFSTR("lostModeEnabled"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "BOOLValue");

      if ((v12 & 1) != 0)
        goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x1E0D20200], "synchronizeDomain:", kFMDPostWipePrefDomain);
    objc_msgSend(MEMORY[0x1E0D20200], "dictionaryForKey:inDomain:", CFSTR("FMIPWipeLostModeInfo"), kFMDPostWipePrefDomain);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = v13;
      objc_msgSend(v13, "objectForKey:", CFSTR("lostModeEnabled"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "BOOLValue");

      if ((v16 & 1) != 0)
        goto LABEL_11;
    }
    if (-[FMDFMIPManager _managedLostModeType](self, "_managedLostModeType"))
LABEL_11:
      v17 = 1;
    else
      v17 = -[FMDFMIPManager _needsAckLostModeType](self, "_needsAckLostModeType") != 0;
    LogCategory_Unspecified();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 67109120;
      LODWORD(v21) = v17;
      _os_log_impl(&dword_1C9939000, v18, OS_LOG_TYPE_DEFAULT, "lostModeIsActive = %d", (uint8_t *)&v20, 8u);
    }

  }
  else
  {
    LOBYTE(v17) = 0;
  }
  objc_autoreleasePoolPop(v3);
  return v17;
}

- (BOOL)isManagedLostModeActive
{
  void *v3;
  NSObject *v4;
  BOOL v5;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1CAA4547C](self, a2);
  LogCategory_Unspecified();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[FMDFMIPManager isManagedLostModeActive]";
    _os_log_impl(&dword_1C9939000, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v7, 0xCu);
  }

  fmdFMIPLastOperationResult = 0;
  v5 = -[FMDFMIPManager _managedLostModeType](self, "_managedLostModeType") == 3;
  objc_autoreleasePoolPop(v3);
  return v5;
}

- (BOOL)isLostModeActive
{
  void *v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  const __CFString *v7;
  int v9;
  const char *v10;
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1CAA4547C](self, a2);
  LogCategory_Unspecified();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315138;
    v10 = "-[FMDFMIPManager isLostModeActive]";
    _os_log_impl(&dword_1C9939000, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v9, 0xCu);
  }

  fmdFMIPLastOperationResult = 0;
  v5 = -[FMDFMIPManager _checkLostModeInSharedContainer](self, "_checkLostModeInSharedContainer");
  LogCategory_Unspecified();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if (v5)
      v7 = CFSTR("YES");
    v9 = 136315394;
    v10 = "-[FMDFMIPManager isLostModeActive]";
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_1C9939000, v6, OS_LOG_TYPE_DEFAULT, "%s : %@", (uint8_t *)&v9, 0x16u);
  }

  objc_autoreleasePoolPop(v3);
  return v5;
}

- (unint64_t)_managedLostModeType
{
  void *v2;
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  unint64_t v8;
  NSObject *v9;
  void *v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  id v15;
  uint8_t buf[4];
  unint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[FMDFMIPManager getManagedLostModeFileURL](self, "getManagedLostModeFileURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  LogCategory_Unspecified();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[FMDFMIPManager _managedLostModeType].cold.2();

  v15 = 0;
  objc_msgSend(MEMORY[0x1E0C99D80], "fm_dictionaryWithContentsOfURL:error:", v2, &v15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v15;
  v6 = v5;
  if (v5)
  {
    if ((objc_msgSend(v5, "fm_isFileNotFoundError") & 1) == 0)
    {
      LogCategory_Unspecified();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v17 = (unint64_t)v6;
        _os_log_impl(&dword_1C9939000, v7, OS_LOG_TYPE_DEFAULT, "Could not read managed lost mode file %@", buf, 0xCu);
      }
      v8 = 0;
LABEL_18:

      goto LABEL_19;
    }
  }
  else
  {
    LogCategory_Unspecified();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[FMDFMIPManager _managedLostModeType].cold.1();

    objc_msgSend(v4, "objectForKey:", CFSTR("lostModeEnabled"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "BOOLValue");

    if (v11)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("lostModeType"));
      v12 = objc_claimAutoreleasedReturnValue();
      v7 = v12;
      if (v12)
        v8 = -[NSObject integerValue](v12, "integerValue");
      else
        v8 = 3;
      LogCategory_Unspecified();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v17 = v8;
        _os_log_impl(&dword_1C9939000, v13, OS_LOG_TYPE_DEFAULT, "Managed lost mode type? %lu", buf, 0xCu);
      }

      goto LABEL_18;
    }
  }
  v8 = 0;
LABEL_19:

  return v8;
}

- (unint64_t)_needsAckLostModeType
{
  void *v2;
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  unint64_t v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  id v14;
  uint8_t buf[4];
  unint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[FMDFMIPManager getNeedsLocateAckLostModeFileURL](self, "getNeedsLocateAckLostModeFileURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  LogCategory_Unspecified();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[FMDFMIPManager _needsAckLostModeType].cold.2();

  v14 = 0;
  objc_msgSend(MEMORY[0x1E0C99D80], "fm_dictionaryWithContentsOfURL:error:", v2, &v14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v14;
  v6 = v5;
  if (!v5)
  {
    LogCategory_Unspecified();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[FMDFMIPManager _needsAckLostModeType].cold.1();

    objc_msgSend(v4, "objectForKey:", CFSTR("lostModeEnabled"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "BOOLValue");

    if (v11)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("lostModeType"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v12, "integerValue");

      LogCategory_Unspecified();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v16 = v8;
        _os_log_impl(&dword_1C9939000, v7, OS_LOG_TYPE_DEFAULT, "NeedsLocateAck lost mode type? %lu", buf, 0xCu);
      }
      goto LABEL_13;
    }
LABEL_14:
    v8 = 0;
    goto LABEL_15;
  }
  if ((objc_msgSend(v5, "fm_isFileNotFoundError") & 1) != 0)
    goto LABEL_14;
  LogCategory_Unspecified();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = (unint64_t)v6;
    _os_log_impl(&dword_1C9939000, v7, OS_LOG_TYPE_DEFAULT, "Could not read NeedsLocateAck lost mode file %@", buf, 0xCu);
  }
  v8 = 0;
LABEL_13:

LABEL_15:
  return v8;
}

- (id)lostModeInfo
{
  void *v3;
  NSObject *v4;
  FMDLostModeInfo *v5;
  void *v6;
  void *v7;
  char *v8;
  char *v9;
  NSObject *v10;
  void *v11;
  char v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  char v20;
  NSObject *v21;
  void *v22;
  char v23;
  NSObject *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  char v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  NSObject *v42;
  id v43;
  id v44;
  uint8_t buf[4];
  const char *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1CAA4547C](self, a2);
  LogCategory_Unspecified();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v46 = "-[FMDFMIPManager lostModeInfo]";
    _os_log_impl(&dword_1C9939000, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  fmdFMIPLastOperationResult = 0;
  v5 = 0;
  if (-[FMDFMIPManager _isRunningAsMobileUser](self, "_isRunningAsMobileUser"))
  {
    -[FMDFMIPManager getManagedLostModeFileURL](self, "getManagedLostModeFileURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = 0;
    objc_msgSend(MEMORY[0x1E0C99D80], "fm_dictionaryWithContentsOfURL:error:", v6, &v44);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (char *)v44;
    v9 = v8;
    if (v7)
    {
      LogCategory_Unspecified();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C9939000, v10, OS_LOG_TYPE_DEFAULT, "Checking if device is in managed lost mode", buf, 2u);
      }

      objc_msgSend(v7, "objectForKey:", CFSTR("lostModeEnabled"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "BOOLValue");

      if ((v12 & 1) != 0)
      {
        objc_msgSend(v7, "objectForKey:", CFSTR("lostModeType"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "integerValue");

        if (v14)
          v15 = v14;
        else
          v15 = 3;
        goto LABEL_36;
      }
    }
    else if (v8 && (objc_msgSend(v8, "fm_isFileNotFoundError") & 1) == 0)
    {
      LogCategory_Unspecified();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v46 = v9;
        _os_log_impl(&dword_1C9939000, v16, OS_LOG_TYPE_DEFAULT, "Could not read managed lost mode file %@", buf, 0xCu);
      }

    }
    LogCategory_Unspecified();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C9939000, v17, OS_LOG_TYPE_DEFAULT, "Checking if device is in fmip lost mode", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0D20200], "synchronizeDomain:", kFMDPublicNotBackedUpPrefDomain);
    objc_msgSend(MEMORY[0x1E0D20200], "dictionaryForKey:inDomain:", CFSTR("FMIPLostModeInfo"), kFMDPublicNotBackedUpPrefDomain);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v18, "objectForKey:", CFSTR("lostModeEnabled"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "BOOLValue");

      if ((v20 & 1) != 0)
      {
        v15 = 1;
        v7 = v18;
LABEL_36:
        LogCategory_Unspecified();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C9939000, v34, OS_LOG_TYPE_DEFAULT, "Device is in lost mode", buf, 2u);
        }

        v5 = objc_alloc_init(FMDLostModeInfo);
        -[FMDLostModeInfo setLostModeEnabled:](v5, "setLostModeEnabled:", 1);
        objc_msgSend(v7, "objectForKey:", CFSTR("lostModeMessage"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[FMDLostModeInfo setMessage:](v5, "setMessage:", v35);

        objc_msgSend(v7, "objectForKey:", CFSTR("lostModeOwnerNumber"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[FMDLostModeInfo setPhoneNumber:](v5, "setPhoneNumber:", v36);

        objc_msgSend(v7, "objectForKey:", CFSTR("lostModeFacetimeCapable"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[FMDLostModeInfo setFacetimeCapable:](v5, "setFacetimeCapable:", objc_msgSend(v37, "BOOLValue"));

        objc_msgSend(v7, "objectForKey:", CFSTR("lostModeFootnoteTextPrefKey"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[FMDLostModeInfo setFootnoteText:](v5, "setFootnoteText:", v38);

        objc_msgSend(v7, "objectForKey:", CFSTR("disableSlideToUnlock"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[FMDLostModeInfo setDisableSlideToUnlock:](v5, "setDisableSlideToUnlock:", objc_msgSend(v39, "BOOLValue"));

        -[FMDLostModeInfo setLostModeType:](v5, "setLostModeType:", v15);
        goto LABEL_39;
      }
    }
    LogCategory_Unspecified();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C9939000, v21, OS_LOG_TYPE_DEFAULT, "Checking if device is in client lost mode", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0D20200], "dictionaryForKey:inDomain:", CFSTR("ClientLostModeInfo"), kFMDPublicNotBackedUpPrefDomain);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v7, "objectForKey:", CFSTR("lostModeEnabled"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "BOOLValue");

      if ((v23 & 1) != 0)
      {
        v15 = 2;
        goto LABEL_36;
      }
    }
    LogCategory_Unspecified();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C9939000, v24, OS_LOG_TYPE_DEFAULT, "Checking if device is in wipe lost mode", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0D20200], "synchronizeDomain:", kFMDPostWipePrefDomain);
    objc_msgSend(MEMORY[0x1E0D20200], "dictionaryForKey:inDomain:", CFSTR("FMIPWipeLostModeInfo"), kFMDPostWipePrefDomain);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      objc_msgSend(v25, "objectForKey:", CFSTR("lostModeEnabled"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "BOOLValue");

      if ((v27 & 1) != 0)
      {
        v15 = 4;
        v7 = v25;
        goto LABEL_36;
      }
    }
    -[FMDFMIPManager getNeedsLocateAckLostModeFileURL](self, "getNeedsLocateAckLostModeFileURL");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0;
    objc_msgSend(MEMORY[0x1E0C99D80], "fm_dictionaryWithContentsOfURL:error:", v28, &v43);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v43;

    if (v7)
    {
      LogCategory_Unspecified();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C9939000, v30, OS_LOG_TYPE_DEFAULT, "Checking if device is in needsLocateAck lost mode", buf, 2u);
      }

      objc_msgSend(v7, "objectForKey:", CFSTR("lostModeEnabled"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "BOOLValue");

      if ((v32 & 1) != 0)
      {
        objc_msgSend(v7, "objectForKey:", CFSTR("lostModeType"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v33, "integerValue");

        if (v15)
          goto LABEL_36;
LABEL_49:
        v5 = 0;
LABEL_39:
        LogCategory_Unspecified();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
          -[FMDFMIPManager lostModeInfo].cold.1(v5, v40);

        goto LABEL_42;
      }
    }
    else if (v29 && (objc_msgSend(v29, "fm_isFileNotFoundError") & 1) == 0)
    {
      LogCategory_Unspecified();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v46 = (const char *)v29;
        _os_log_impl(&dword_1C9939000, v42, OS_LOG_TYPE_DEFAULT, "Could not read needsLocateAck lost mode file %@", buf, 0xCu);
      }

    }
    goto LABEL_49;
  }
LABEL_42:
  objc_autoreleasePoolPop(v3);
  return v5;
}

- (id)enableLostModeWithInfo:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  NSObject *v20;
  _QWORD v22[4];
  id v23;
  id v24;
  _BYTE *v25;
  _QWORD v26[4];
  id v27;
  _BYTE *v28;
  _BYTE buf[24];
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1CAA4547C]();
  LogCategory_Unspecified();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "description");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[FMDFMIPManager enableLostModeWithInfo:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v7;
    _os_log_impl(&dword_1C9939000, v6, OS_LOG_TYPE_DEFAULT, "%s with lost mode info %@", buf, 0x16u);

  }
  fmdFMIPLastOperationResult = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[FMDFMIPManager enableLostModeWithInfo:]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D20218]), "initWithDescription:andTimeout:", v8, 5.0);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v30 = __Block_byref_object_copy__0;
  v31 = __Block_byref_object_dispose__0;
  v32 = 0;
  +[FMNSXPCConnectionCache sharedCache](FMNSXPCConnectionCache, "sharedCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[FMNSXPCConnectionConfiguration fmipConfiguration](FMNSXPCConnectionConfiguration, "fmipConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resumeConnectionWithConfiguration:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __41__FMDFMIPManager_enableLostModeWithInfo___block_invoke;
  v26[3] = &unk_1E829C278;
  v28 = buf;
  v14 = v9;
  v27 = v14;
  objc_msgSend(v12, "addFailureBlock:", v26);
  objc_msgSend(v12, "remoteObjectProxy");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v13;
  v22[1] = 3221225472;
  v22[2] = __41__FMDFMIPManager_enableLostModeWithInfo___block_invoke_14;
  v22[3] = &unk_1E829C2A0;
  v25 = buf;
  v16 = v14;
  v23 = v16;
  v17 = v12;
  v24 = v17;
  objc_msgSend(v15, "enableLostModeWithInfo:usingCallback:", v4, v22);
  objc_msgSend(v16, "wait");
  if (objc_msgSend(v16, "timeoutOccurred"))
    v18 = -[FMDFMIPManager newErrorForCode:message:](self, "newErrorForCode:message:", 4, CFSTR("timed out"));
  else
    v18 = *(id *)(*(_QWORD *)&buf[8] + 40);
  v19 = v18;
  if (v18)
  {
    fmdFMIPLastOperationResult = objc_msgSend(v18, "code");
    LogCategory_Unspecified();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[FMDFMIPManager enableLostModeWithInfo:].cold.1();

  }
  _Block_object_dispose(buf, 8);

  objc_autoreleasePoolPop(v5);
  return v19;
}

void __41__FMDFMIPManager_enableLostModeWithInfo___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  LogCategory_Unspecified();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __41__FMDFMIPManager_enableLostModeWithInfo___block_invoke_cold_1();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", kFMDErrorDomain, 13, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;
  v6 = v3;

  objc_msgSend(*(id *)(a1 + 32), "signal");
}

void __41__FMDFMIPManager_enableLostModeWithInfo___block_invoke_14(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "signal");
  objc_msgSend(*(id *)(a1 + 40), "invalidate");

}

- (void)disableLostMode
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1CAA4547C](self, a2);
  LogCategory_Unspecified();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[FMDFMIPManager disableLostMode]";
    _os_log_impl(&dword_1C9939000, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  +[FMNSXPCConnectionCache sharedCache](FMNSXPCConnectionCache, "sharedCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[FMNSXPCConnectionConfiguration fmipConfiguration](FMNSXPCConnectionConfiguration, "fmipConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resumeConnectionWithConfiguration:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addFailureBlock:", &__block_literal_global_18);
  objc_msgSend(v6, "remoteObjectProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __33__FMDFMIPManager_disableLostMode__block_invoke_19;
  v9[3] = &unk_1E829C308;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "disableLostModeUsingCallback:", v9);

  objc_autoreleasePoolPop(v2);
}

void __33__FMDFMIPManager_disableLostMode__block_invoke()
{
  NSObject *v0;

  LogCategory_Unspecified();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __33__FMDFMIPManager_disableLostMode__block_invoke_cold_1();

}

void __33__FMDFMIPManager_disableLostMode__block_invoke_19(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  LogCategory_Unspecified();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1C9939000, v4, OS_LOG_TYPE_DEFAULT, "disableLostMode completed. Error : %@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (void)enableManagedLostModeWithInfo:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  __CFString *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  const __CFString *v24;
  uint8_t buf[4];
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  LogCategory_Unspecified();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v26 = "-[FMDFMIPManager enableManagedLostModeWithInfo:completion:]";
    _os_log_impl(&dword_1C9939000, v8, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s", buf, 0xCu);
  }

  if ((objc_msgSend(v6, "lostModeEnabled") & 1) != 0)
  {
    objc_msgSend(v6, "setDisableSlideToUnlock:", 1);
    objc_msgSend(v6, "setLostModeType:", 3);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __59__FMDFMIPManager_enableManagedLostModeWithInfo_completion___block_invoke;
    v21[3] = &unk_1E829C330;
    v22 = v7;
    -[FMDFMIPManager _updateManagedLostModeWithInfo:completion:](self, "_updateManagedLostModeWithInfo:completion:", v6, v21);
    v9 = v22;
LABEL_9:

    goto LABEL_10;
  }
  LogCategory_Unspecified();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    -[FMDFMIPManager enableManagedLostModeWithInfo:completion:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);

  if (v7)
  {
    v18 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v19 = kFMDErrorDomain;
    v23 = *MEMORY[0x1E0CB2D68];
    v24 = CFSTR("You have passed in lostModeEnabled as NO. This is invalid");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v18, "initWithDomain:code:userInfo:", v19, 0, v9);
    (*((void (**)(id, void *))v7 + 2))(v7, v20);

    goto LABEL_9;
  }
LABEL_10:

}

void __59__FMDFMIPManager_enableManagedLostModeWithInfo_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint8_t v8[16];

  v3 = a2;
  LogCategory_Unspecified();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __59__FMDFMIPManager_enableManagedLostModeWithInfo_completion___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1C9939000, v5, OS_LOG_TYPE_INFO, "Managed lost mode info updated", v8, 2u);
  }

  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.icloud.fmip.lostmode.enable"), 0, 0, 1u);

}

- (void)disableManagedLostModeWithLocatedMessage:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  FMDLostModeInfo *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  __CFString *v20;
  void *v21;
  _QWORD v22[4];
  FMDLostModeInfo *v23;
  _QWORD v24[4];
  id v25;
  FMDFMIPManager *v26;
  id v27;
  uint64_t v28;
  const __CFString *v29;
  uint8_t buf[4];
  const char *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  LogCategory_Unspecified();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v31 = "-[FMDFMIPManager disableManagedLostModeWithLocatedMessage:completion:]";
    _os_log_impl(&dword_1C9939000, v8, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s", buf, 0xCu);
  }

  -[FMDFMIPManager lostModeInfo](self, "lostModeInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "lostModeType") == 3)
  {
    -[FMDFMIPManager _stopAlarm](self, "_stopAlarm");
    if (v6)
    {
      v10 = objc_alloc_init(FMDLostModeInfo);
      -[FMDLostModeInfo setMessage:](v10, "setMessage:", v6);
      -[FMDLostModeInfo setLostModeType:](v10, "setLostModeType:", 5);
      -[FMDLostModeInfo setLostModeEnabled:](v10, "setLostModeEnabled:", 1);
      -[FMDLostModeInfo setDisableSlideToUnlock:](v10, "setDisableSlideToUnlock:", 1);
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __70__FMDFMIPManager_disableManagedLostModeWithLocatedMessage_completion___block_invoke;
      v24[3] = &unk_1E829C358;
      v27 = v7;
      v25 = v9;
      v26 = self;
      -[FMDFMIPManager _updateNeedsLocateAckLostModeWithInfo:completion:](self, "_updateNeedsLocateAckLostModeWithInfo:completion:", v10, v24);

    }
    else
    {
      objc_msgSend(v9, "setLostModeEnabled:", 0);
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __70__FMDFMIPManager_disableManagedLostModeWithLocatedMessage_completion___block_invoke_26;
      v22[3] = &unk_1E829C330;
      v23 = (FMDLostModeInfo *)v7;
      -[FMDFMIPManager _updateManagedLostModeWithInfo:completion:](self, "_updateManagedLostModeWithInfo:completion:", v9, v22);
      v10 = v23;
    }
    goto LABEL_11;
  }
  LogCategory_Unspecified();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    -[FMDFMIPManager disableManagedLostModeWithLocatedMessage:completion:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);

  if (v7)
  {
    v19 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v20 = kFMDErrorDomain;
    v28 = *MEMORY[0x1E0CB2D68];
    v29 = CFSTR("Device is not in managed lost mode. Cannot disable it.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
    v10 = (FMDLostModeInfo *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v19, "initWithDomain:code:userInfo:", v20, 2, v10);
    (*((void (**)(id, void *))v7 + 2))(v7, v21);

LABEL_11:
  }

}

void __70__FMDFMIPManager_disableManagedLostModeWithLocatedMessage_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 48);
    if (v4)
      (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setLostModeEnabled:", 0);
    v6 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(a1 + 40);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __70__FMDFMIPManager_disableManagedLostModeWithLocatedMessage_completion___block_invoke_2;
    v7[3] = &unk_1E829C330;
    v8 = *(id *)(a1 + 48);
    objc_msgSend(v5, "_updateManagedLostModeWithInfo:completion:", v6, v7);

  }
}

void __70__FMDFMIPManager_disableManagedLostModeWithLocatedMessage_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint8_t v8[16];

  v3 = a2;
  LogCategory_Unspecified();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __70__FMDFMIPManager_disableManagedLostModeWithLocatedMessage_completion___block_invoke_2_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1C9939000, v5, OS_LOG_TYPE_INFO, "Managed lost mode info updated to disabled", v8, 2u);
  }

  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.icloud.fmip.lostmode.enable"), 0, 0, 1u);

}

void __70__FMDFMIPManager_disableManagedLostModeWithLocatedMessage_completion___block_invoke_26(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint8_t v8[16];

  v3 = a2;
  LogCategory_Unspecified();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __70__FMDFMIPManager_disableManagedLostModeWithLocatedMessage_completion___block_invoke_2_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1C9939000, v5, OS_LOG_TYPE_INFO, "Managed lost mode info updated to disabled", v8, 2u);
  }

  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.icloud.fmip.lostmode.enable"), 0, 0, 1u);

}

- (void)userDidAckManagedLostModeLocateWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  __CFString *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  uint64_t v21;
  const __CFString *v22;
  uint8_t buf[4];
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  LogCategory_Unspecified();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v24 = "-[FMDFMIPManager userDidAckManagedLostModeLocateWithCompletion:]";
    _os_log_impl(&dword_1C9939000, v5, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s", buf, 0xCu);
  }

  -[FMDFMIPManager lostModeInfo](self, "lostModeInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "lostModeType") == 5)
  {
    -[FMDFMIPManager _stopAlarm](self, "_stopAlarm");
    objc_msgSend(v6, "setLostModeEnabled:", 0);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __64__FMDFMIPManager_userDidAckManagedLostModeLocateWithCompletion___block_invoke;
    v19[3] = &unk_1E829C330;
    v20 = v4;
    -[FMDFMIPManager _updateNeedsLocateAckLostModeWithInfo:completion:](self, "_updateNeedsLocateAckLostModeWithInfo:completion:", v6, v19);
    v7 = v20;
LABEL_9:

    goto LABEL_10;
  }
  LogCategory_Unspecified();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[FMDFMIPManager userDidAckManagedLostModeLocateWithCompletion:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);

  if (v4)
  {
    v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v17 = kFMDErrorDomain;
    v21 = *MEMORY[0x1E0CB2D68];
    v22 = CFSTR("Device is not waiting for locate ack. Invalid state.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithDomain:code:userInfo:", v17, 2, v7);
    (*((void (**)(id, void *))v4 + 2))(v4, v18);

    goto LABEL_9;
  }
LABEL_10:

}

void __64__FMDFMIPManager_userDidAckManagedLostModeLocateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint8_t v8[16];

  v3 = a2;
  LogCategory_Unspecified();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __64__FMDFMIPManager_userDidAckManagedLostModeLocateWithCompletion___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1C9939000, v5, OS_LOG_TYPE_INFO, "NeedsLocateAck lost mode info updated to disabled", v8, 2u);
  }

  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.icloud.fmip.lostmode.enable"), 0, 0, 1u);

}

- (void)playSoundWithOptions:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1CAA4547C]();
  LogCategory_Unspecified();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v23 = "-[FMDFMIPManager playSoundWithOptions:completion:]";
    _os_log_impl(&dword_1C9939000, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  +[FMNSXPCConnectionCache sharedCache](FMNSXPCConnectionCache, "sharedCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FMNSXPCConnectionConfiguration fmipConfiguration](FMNSXPCConnectionConfiguration, "fmipConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resumeConnectionWithConfiguration:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __50__FMDFMIPManager_playSoundWithOptions_completion___block_invoke;
  v20[3] = &unk_1E829C100;
  v13 = v6;
  v21 = v13;
  objc_msgSend(v11, "addFailureBlock:", v20);
  objc_msgSend(v11, "remoteObjectProxy");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __50__FMDFMIPManager_playSoundWithOptions_completion___block_invoke_29;
  v17[3] = &unk_1E829C380;
  v15 = v13;
  v18 = v11;
  v19 = v15;
  v16 = v11;
  objc_msgSend(v14, "playSoundWithOptions:completion:", v5, v17);

  objc_autoreleasePoolPop(v7);
}

void __50__FMDFMIPManager_playSoundWithOptions_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;

  LogCategory_Unspecified();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __50__FMDFMIPManager_playSoundWithOptions_completion___block_invoke_cold_1();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", kFMDErrorDomain, 13, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);

}

uint64_t __50__FMDFMIPManager_playSoundWithOptions_completion___block_invoke_29(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (void)deviceActivationDidSucceed
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1CAA4547C](self, a2);
  LogCategory_Unspecified();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[FMDFMIPManager deviceActivationDidSucceed]";
    _os_log_impl(&dword_1C9939000, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  +[FMNSXPCConnectionCache sharedCache](FMNSXPCConnectionCache, "sharedCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[FMNSXPCConnectionConfiguration fmipConfiguration](FMNSXPCConnectionConfiguration, "fmipConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resumeConnectionWithConfiguration:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addFailureBlock:", &__block_literal_global_30);
  objc_msgSend(v6, "remoteObjectProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__FMDFMIPManager_deviceActivationDidSucceed__block_invoke_31;
  v9[3] = &unk_1E829C308;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "deviceActivationDidSucceedUsingCallback:", v9);

  objc_autoreleasePoolPop(v2);
}

void __44__FMDFMIPManager_deviceActivationDidSucceed__block_invoke()
{
  NSObject *v0;

  LogCategory_Unspecified();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __44__FMDFMIPManager_deviceActivationDidSucceed__block_invoke_cold_1();

}

void __44__FMDFMIPManager_deviceActivationDidSucceed__block_invoke_31(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  LogCategory_Unspecified();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1C9939000, v4, OS_LOG_TYPE_DEFAULT, "deviceActivationDidSucceed completed. Error : %@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (BOOL)lockdownShouldDisableDeviceRestore
{
  void *v2;
  NSObject *v3;
  void *v4;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  const char *v8;
  NSObject *v9;
  const __CFString *v10;
  int v12;
  const char *v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1CAA4547C](self, a2);
  LogCategory_Unspecified();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315138;
    v13 = "-[FMDFMIPManager lockdownShouldDisableDeviceRestore]";
    _os_log_impl(&dword_1C9939000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v12, 0xCu);
  }

  fmdFMIPLastOperationResult = 0;
  +[FMDFMIPSharedStateManager sharedInstance](FMDFMIPSharedStateManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fmipActive");

  LogCategory_Unspecified();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (!v7)
      goto LABEL_9;
    LOWORD(v12) = 0;
    v8 = "FMiP is active. Returning YES to block restore.";
  }
  else
  {
    if (!v7)
      goto LABEL_9;
    LOWORD(v12) = 0;
    v8 = "FMiP inactive. Returning NO to allow restore.";
  }
  _os_log_impl(&dword_1C9939000, v6, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v12, 2u);
LABEL_9:

  LogCategory_Unspecified();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = CFSTR("NO");
    if (v5)
      v10 = CFSTR("YES");
    v12 = 136315394;
    v13 = "-[FMDFMIPManager lockdownShouldDisableDeviceRestore]";
    v14 = 2112;
    v15 = v10;
    _os_log_impl(&dword_1C9939000, v9, OS_LOG_TYPE_DEFAULT, "%s : %@", (uint8_t *)&v12, 0x16u);
  }

  objc_autoreleasePoolPop(v2);
  return v5;
}

- (BOOL)lockdownShouldDisableDevicePairing
{
  void *v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  const __CFString *v7;
  int v9;
  const char *v10;
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1CAA4547C](self, a2);
  LogCategory_Unspecified();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315138;
    v10 = "-[FMDFMIPManager lockdownShouldDisableDevicePairing]";
    _os_log_impl(&dword_1C9939000, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v9, 0xCu);
  }

  fmdFMIPLastOperationResult = 0;
  v5 = -[FMDFMIPManager _checkLostModeInSharedContainer](self, "_checkLostModeInSharedContainer");
  LogCategory_Unspecified();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if (v5)
      v7 = CFSTR("YES");
    v9 = 136315394;
    v10 = "-[FMDFMIPManager lockdownShouldDisableDevicePairing]";
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_1C9939000, v6, OS_LOG_TYPE_DEFAULT, "%s : %@", (uint8_t *)&v9, 0x16u);
  }

  objc_autoreleasePoolPop(v3);
  return v5;
}

- (BOOL)_checkLostModeInSharedContainer
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  +[FMDFMIPSharedStateManager sharedInstance](FMDFMIPSharedStateManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "lostModeType");

  LogCategory_Unspecified();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134217984;
    v7 = v3;
    _os_log_impl(&dword_1C9939000, v4, OS_LOG_TYPE_DEFAULT, "FMiP shared info has lost mode type - %lu", (uint8_t *)&v6, 0xCu);
  }

  return (unint64_t)(v3 - 1) < 3;
}

void __42__FMDFMIPManager_fmipStateWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  LogCategory_Unspecified();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __42__FMDFMIPManager_fmipStateWithCompletion___block_invoke_cold_1();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", kFMDErrorDomain, 13, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
  {
    if (a2 == 3)
      v7 = 3;
    else
      v7 = 4;
    (*(void (**)(uint64_t, uint64_t, void *))(v6 + 16))(v6, v7, v5);
  }

}

void __42__FMDFMIPManager_fmipStateWithCompletion___block_invoke_33(uint64_t a1, uint64_t a2, void *a3)
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
  LogCategory_Unspecified();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __42__FMDFMIPManager_fmipStateWithCompletion___block_invoke_33_cold_1();
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 134217984;
    v10 = a2;
    _os_log_impl(&dword_1C9939000, v7, OS_LOG_TYPE_DEFAULT, "FMIP state : %ld", (uint8_t *)&v9, 0xCu);
  }

  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

- (void)fmipAccountWithCompletion:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1CAA4547C]();
  LogCategory_Unspecified();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[FMDFMIPManager fmipAccountWithCompletion:]";
    _os_log_impl(&dword_1C9939000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  fmdFMIPLastOperationResult = 0;
  +[FMNSXPCConnectionCache sharedCache](FMNSXPCConnectionCache, "sharedCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[FMNSXPCConnectionConfiguration fmipConfiguration](FMNSXPCConnectionConfiguration, "fmipConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resumeConnectionWithConfiguration:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak((id *)buf, v3);
  v9 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __44__FMDFMIPManager_fmipAccountWithCompletion___block_invoke;
  v17[3] = &unk_1E829C100;
  v10 = v3;
  v18 = v10;
  objc_msgSend(v8, "addFailureBlock:", v17);
  objc_msgSend(v8, "remoteObjectProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __44__FMDFMIPManager_fmipAccountWithCompletion___block_invoke_35;
  v14[3] = &unk_1E829C3F0;
  v12 = v10;
  v16 = v12;
  v13 = v8;
  v15 = v13;
  objc_msgSend(v11, "getFmipAccountUsingCallback:", v14);

  objc_destroyWeak((id *)buf);
  objc_autoreleasePoolPop(v4);

}

void __44__FMDFMIPManager_fmipAccountWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  LogCategory_Unspecified();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __44__FMDFMIPManager_fmipAccountWithCompletion___block_invoke_cold_1();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", kFMDErrorDomain, 13, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1CAA455C0](*(_QWORD *)(a1 + 32));
  v5 = (void *)v4;
  if (v4)
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v4 + 16))(v4, 0, 0, v3);

}

void __44__FMDFMIPManager_fmipAccountWithCompletion___block_invoke_35(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  LogCategory_Unspecified();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __44__FMDFMIPManager_fmipAccountWithCompletion___block_invoke_35_cold_1();
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412546;
    v14 = v7;
    v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_1C9939000, v11, OS_LOG_TYPE_DEFAULT, "FMIP account name : %@, dsid: %@", (uint8_t *)&v13, 0x16u);
  }

  v12 = *(_QWORD *)(a1 + 40);
  if (v12)
    (*(void (**)(uint64_t, id, id, id))(v12 + 16))(v12, v7, v8, v9);
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

- (id)fmipAccount
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *, void *, void *);
  void *v17;
  id v18;
  uint64_t *v19;
  __int128 *p_buf;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  _QWORD v29[4];
  id v30;
  __int128 buf;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1CAA4547C](self, a2);
  LogCategory_Unspecified();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[FMDFMIPManager fmipAccount]";
    _os_log_impl(&dword_1C9939000, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
  }

  fmdFMIPLastOperationResult = 0;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__0;
  v34 = __Block_byref_object_dispose__0;
  v35 = 0;
  v28 = 0;
  v29[0] = &v28;
  v29[1] = 0x3032000000;
  v29[2] = __Block_byref_object_copy__0;
  v29[3] = __Block_byref_object_dispose__0;
  v30 = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[FMDFMIPManager fmipAccount]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D20218]), "initWithDescription:andTimeout:", v5, 5.0);
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__0;
  v26 = __Block_byref_object_dispose__0;
  v27 = 0;
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __29__FMDFMIPManager_fmipAccount__block_invoke;
  v17 = &unk_1E829C418;
  v19 = &v22;
  p_buf = &buf;
  v21 = &v28;
  v7 = v6;
  v18 = v7;
  -[FMDFMIPManager fmipAccountWithCompletion:](self, "fmipAccountWithCompletion:", &v14);
  objc_msgSend(v7, "wait");
  if (objc_msgSend(v7, "timeoutOccurred"))
    v8 = -[FMDFMIPManager newErrorForCode:message:](self, "newErrorForCode:message:", 4, CFSTR("timed out"));
  else
    v8 = (id)v23[5];
  v9 = v8;
  if (v8)
  {
    fmdFMIPLastOperationResult = objc_msgSend(v8, "code");
    LogCategory_Unspecified();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[FMDFMIPManager fmipAccount].cold.2();
  }
  else
  {
    LogCategory_Unspecified();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[FMDFMIPManager fmipAccount].cold.1((uint64_t)&buf + 8, (uint64_t)v29, v10);
  }

  if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40) && *(_QWORD *)(v29[0] + 40))
  {
    v11 = objc_alloc(MEMORY[0x1E0C99D80]);
    v12 = (void *)objc_msgSend(v11, "initWithObjectsAndKeys:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40), CFSTR("username"), *(_QWORD *)(v29[0] + 40), CFSTR("personID"), 0, v14, v15, v16, v17);
  }
  else
  {
    v12 = 0;
  }

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&buf, 8);
  objc_autoreleasePoolPop(v3);
  return v12;
}

void __29__FMDFMIPManager_fmipAccount__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;

  v7 = a2;
  v8 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a4);
  v15 = a4;
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v7;
  v11 = v7;

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v8;
  v14 = v8;

  objc_msgSend(*(id *)(a1 + 32), "signal");
}

- (void)didChangeFMIPAccountInfo:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1CAA4547C]();
  LogCategory_Unspecified();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v14 = "-[FMDFMIPManager didChangeFMIPAccountInfo:]";
    _os_log_impl(&dword_1C9939000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  +[FMNSXPCConnectionCache sharedCache](FMNSXPCConnectionCache, "sharedCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[FMNSXPCConnectionConfiguration fmipConfiguration](FMNSXPCConnectionConfiguration, "fmipConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resumeConnectionWithConfiguration:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addFailureBlock:", &__block_literal_global_37);
  objc_msgSend(v8, "remoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __43__FMDFMIPManager_didChangeFMIPAccountInfo___block_invoke_38;
  v11[3] = &unk_1E829C308;
  v12 = v8;
  v10 = v8;
  objc_msgSend(v9, "didChangeFMIPAccountInfo:usingCallback:", v3, v11);

  objc_autoreleasePoolPop(v4);
}

void __43__FMDFMIPManager_didChangeFMIPAccountInfo___block_invoke()
{
  NSObject *v0;

  LogCategory_Unspecified();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __43__FMDFMIPManager_didChangeFMIPAccountInfo___block_invoke_cold_1();

}

void __43__FMDFMIPManager_didChangeFMIPAccountInfo___block_invoke_38(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  LogCategory_Unspecified();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1C9939000, v4, OS_LOG_TYPE_DEFAULT, "didChangeFMIPAccountInfo completed. Error : %@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (id)enableFMIPInContext:(unint64_t)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  NSObject *v19;
  _QWORD v21[4];
  id v22;
  id v23;
  _BYTE *v24;
  _QWORD v25[4];
  id v26;
  _BYTE *v27;
  _BYTE buf[24];
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1CAA4547C](self, a2);
  LogCategory_Unspecified();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[FMDFMIPManager enableFMIPInContext:]";
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = a3;
    _os_log_impl(&dword_1C9939000, v6, OS_LOG_TYPE_DEFAULT, "%s in context %lu", buf, 0x16u);
  }

  fmdFMIPLastOperationResult = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[FMDFMIPManager enableFMIPInContext:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D20218]), "initWithDescription:andTimeout:", v7, 5.0);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v29 = __Block_byref_object_copy__0;
  v30 = __Block_byref_object_dispose__0;
  v31 = 0;
  +[FMNSXPCConnectionCache sharedCache](FMNSXPCConnectionCache, "sharedCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FMNSXPCConnectionConfiguration fmipConfiguration](FMNSXPCConnectionConfiguration, "fmipConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resumeConnectionWithConfiguration:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __38__FMDFMIPManager_enableFMIPInContext___block_invoke;
  v25[3] = &unk_1E829C278;
  v27 = buf;
  v13 = v8;
  v26 = v13;
  objc_msgSend(v11, "addFailureBlock:", v25);
  objc_msgSend(v11, "remoteObjectProxy");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v12;
  v21[1] = 3221225472;
  v21[2] = __38__FMDFMIPManager_enableFMIPInContext___block_invoke_39;
  v21[3] = &unk_1E829C2A0;
  v24 = buf;
  v15 = v13;
  v22 = v15;
  v16 = v11;
  v23 = v16;
  objc_msgSend(v14, "enableFMIPInContext:usingCallback:", a3, v21);
  objc_msgSend(v15, "wait");
  if (objc_msgSend(v15, "timeoutOccurred"))
    v17 = -[FMDFMIPManager newErrorForCode:message:](self, "newErrorForCode:message:", 4, CFSTR("timed out"));
  else
    v17 = *(id *)(*(_QWORD *)&buf[8] + 40);
  v18 = v17;
  if (v17)
  {
    fmdFMIPLastOperationResult = objc_msgSend(v17, "code");
    LogCategory_Unspecified();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[FMDFMIPManager enableFMIPInContext:].cold.1();

  }
  _Block_object_dispose(buf, 8);

  objc_autoreleasePoolPop(v5);
  return v18;
}

void __38__FMDFMIPManager_enableFMIPInContext___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  LogCategory_Unspecified();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __38__FMDFMIPManager_enableFMIPInContext___block_invoke_cold_1();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", kFMDErrorDomain, 13, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;
  v6 = v3;

  objc_msgSend(*(id *)(a1 + 32), "signal");
}

void __38__FMDFMIPManager_enableFMIPInContext___block_invoke_39(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "signal");
  objc_msgSend(*(id *)(a1 + 40), "invalidate");

}

- (id)disableFMIPUsingToken:(id)a3 inContext:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  const char *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  _BYTE *v23;
  _BYTE buf[24];
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  LogCategory_Unspecified();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = "non-nil";
    if (!v6)
      v8 = "nil";
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[FMDFMIPManager disableFMIPUsingToken:inContext:]";
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = v8;
    _os_log_impl(&dword_1C9939000, v7, OS_LOG_TYPE_DEFAULT, "%s with %s token", buf, 0x16u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v25 = __Block_byref_object_copy__0;
  v26 = __Block_byref_object_dispose__0;
  v27 = 0;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D20218]), "initWithDescription:andTimeout:", CFSTR("disableFMIPUsingToken:inContext:"), 20.0);
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __50__FMDFMIPManager_disableFMIPUsingToken_inContext___block_invoke;
  v21 = &unk_1E829C460;
  v23 = buf;
  v10 = v9;
  v22 = v10;
  -[FMDFMIPManager _disableFMIPUsingToken:inContext:completion:](self, "_disableFMIPUsingToken:inContext:completion:", v6, a4, &v18);
  objc_msgSend(v10, "wait", v18, v19, v20, v21);
  if (objc_msgSend(v10, "timeoutOccurred"))
  {
    v11 = -[FMDFMIPManager newErrorForCode:message:](self, "newErrorForCode:message:", 4, CFSTR("timed out"));
    v12 = *(void **)(*(_QWORD *)&buf[8] + 40);
    *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v11;
  }
  else
  {
    v13 = *(_QWORD *)&buf[8];
    v14 = *(id *)(*(_QWORD *)&buf[8] + 40);
    v12 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v14;
  }

  v15 = *(void **)(*(_QWORD *)&buf[8] + 40);
  if (v15)
    fmdFMIPLastOperationResult = 12;
  v16 = v15;

  _Block_object_dispose(buf, 8);
  return v16;
}

void __50__FMDFMIPManager_disableFMIPUsingToken_inContext___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "signal");

}

- (void)disableFMIPUsingToken:(id)a3 inContext:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  const char *v11;
  int v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a3;
  LogCategory_Unspecified();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = "non-nil";
    if (!v9)
      v11 = "nil";
    v12 = 136315394;
    v13 = "-[FMDFMIPManager disableFMIPUsingToken:inContext:completion:]";
    v14 = 2080;
    v15 = v11;
    _os_log_impl(&dword_1C9939000, v10, OS_LOG_TYPE_DEFAULT, "%s with %s token", (uint8_t *)&v12, 0x16u);
  }

  -[FMDFMIPManager _disableFMIPUsingToken:inContext:completion:](self, "_disableFMIPUsingToken:inContext:completion:", v9, a4, v8);
}

- (void)disableFMIPUsingToken:(id)a3 forPairedDeviceWithUDID:(id)a4 withCompletion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  const char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1CAA4547C]();
  LogCategory_Unspecified();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = "non-nil";
    v28 = "-[FMDFMIPManager disableFMIPUsingToken:forPairedDeviceWithUDID:withCompletion:]";
    *(_DWORD *)buf = 136315650;
    if (!v7)
      v12 = "nil";
    v29 = 2112;
    v30 = v8;
    v31 = 2080;
    v32 = v12;
    _os_log_impl(&dword_1C9939000, v11, OS_LOG_TYPE_DEFAULT, "%s for paired device %@ with %s token", buf, 0x20u);
  }

  fmdFMIPLastOperationResult = 0;
  LogCategory_Unspecified();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v28) = v7 != 0;
    _os_log_impl(&dword_1C9939000, v13, OS_LOG_TYPE_DEFAULT, "disableFMIPUsingToken: token present: %i", buf, 8u);
  }

  +[FMNSXPCConnectionCache sharedCache](FMNSXPCConnectionCache, "sharedCache");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[FMNSXPCConnectionConfiguration fmipConfiguration](FMNSXPCConnectionConfiguration, "fmipConfiguration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "resumeConnectionWithConfiguration:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __79__FMDFMIPManager_disableFMIPUsingToken_forPairedDeviceWithUDID_withCompletion___block_invoke;
  v25[3] = &unk_1E829C100;
  v18 = v9;
  v26 = v18;
  objc_msgSend(v16, "addFailureBlock:", v25);
  objc_msgSend(v16, "remoteObjectProxy");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v17;
  v22[1] = 3221225472;
  v22[2] = __79__FMDFMIPManager_disableFMIPUsingToken_forPairedDeviceWithUDID_withCompletion___block_invoke_44;
  v22[3] = &unk_1E829C380;
  v20 = v18;
  v23 = v16;
  v24 = v20;
  v21 = v16;
  objc_msgSend(v19, "disableFMIPUsingToken:forPairedDeviceWithUDID:usingCallback:", v7, v8, v22);

  objc_autoreleasePoolPop(v10);
}

void __79__FMDFMIPManager_disableFMIPUsingToken_forPairedDeviceWithUDID_withCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;

  LogCategory_Unspecified();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __79__FMDFMIPManager_disableFMIPUsingToken_forPairedDeviceWithUDID_withCompletion___block_invoke_cold_1();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", kFMDErrorDomain, 13, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);

}

void __79__FMDFMIPManager_disableFMIPUsingToken_forPairedDeviceWithUDID_withCompletion___block_invoke_44(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  LogCategory_Unspecified();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __79__FMDFMIPManager_disableFMIPUsingToken_forPairedDeviceWithUDID_withCompletion___block_invoke_44_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[FMDFMIPManager disableFMIPUsingToken:forPairedDeviceWithUDID:withCompletion:]_block_invoke";
    _os_log_impl(&dword_1C9939000, v5, OS_LOG_TYPE_DEFAULT, "%s completed", (uint8_t *)&v7, 0xCu);
  }

  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

- (void)disableFMIPForAccount:(id)a3 pairedDeviceWithUDID:(id)a4 withCompletion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  const char *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  const char *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1CAA4547C]();
  LogCategory_Unspecified();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "oneTimeRemoveAuthToken");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = "non-nil";
    v29 = "-[FMDFMIPManager disableFMIPForAccount:pairedDeviceWithUDID:withCompletion:]";
    *(_DWORD *)buf = 136315650;
    if (!v12)
      v13 = "nil";
    v30 = 2112;
    v31 = v8;
    v32 = 2080;
    v33 = v13;
    _os_log_impl(&dword_1C9939000, v11, OS_LOG_TYPE_DEFAULT, "%s for paired device %@ with %s token", buf, 0x20u);

  }
  fmdFMIPLastOperationResult = 0;
  LogCategory_Unspecified();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v29) = v7 != 0;
    _os_log_impl(&dword_1C9939000, v14, OS_LOG_TYPE_DEFAULT, "disableFMIPForAccount: Account present: %i", buf, 8u);
  }

  +[FMNSXPCConnectionCache sharedCache](FMNSXPCConnectionCache, "sharedCache");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[FMNSXPCConnectionConfiguration fmipConfiguration](FMNSXPCConnectionConfiguration, "fmipConfiguration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "resumeConnectionWithConfiguration:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __76__FMDFMIPManager_disableFMIPForAccount_pairedDeviceWithUDID_withCompletion___block_invoke;
  v26[3] = &unk_1E829C100;
  v19 = v9;
  v27 = v19;
  objc_msgSend(v17, "addFailureBlock:", v26);
  objc_msgSend(v17, "remoteObjectProxy");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v18;
  v23[1] = 3221225472;
  v23[2] = __76__FMDFMIPManager_disableFMIPForAccount_pairedDeviceWithUDID_withCompletion___block_invoke_45;
  v23[3] = &unk_1E829C380;
  v21 = v19;
  v24 = v17;
  v25 = v21;
  v22 = v17;
  objc_msgSend(v20, "disableFMIPForAccount:pairedDeviceWithUDID:usingCallback:", v7, v8, v23);

  objc_autoreleasePoolPop(v10);
}

void __76__FMDFMIPManager_disableFMIPForAccount_pairedDeviceWithUDID_withCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;

  LogCategory_Unspecified();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __76__FMDFMIPManager_disableFMIPForAccount_pairedDeviceWithUDID_withCompletion___block_invoke_cold_1();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", kFMDErrorDomain, 13, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);

}

void __76__FMDFMIPManager_disableFMIPForAccount_pairedDeviceWithUDID_withCompletion___block_invoke_45(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  LogCategory_Unspecified();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __76__FMDFMIPManager_disableFMIPForAccount_pairedDeviceWithUDID_withCompletion___block_invoke_45_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[FMDFMIPManager disableFMIPForAccount:pairedDeviceWithUDID:withCompletion:]_block_invoke";
    _os_log_impl(&dword_1C9939000, v5, OS_LOG_TYPE_DEFAULT, "%s completed", (uint8_t *)&v7, 0xCu);
  }

  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

- (void)markAsMissingSupportedForPairedDeviceWithUDID:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1CAA4547C]();
  LogCategory_Unspecified();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v23 = "-[FMDFMIPManager markAsMissingSupportedForPairedDeviceWithUDID:withCompletion:]";
    v24 = 2112;
    v25 = v5;
    _os_log_impl(&dword_1C9939000, v8, OS_LOG_TYPE_DEFAULT, "%s for paired device %@", buf, 0x16u);
  }

  fmdFMIPLastOperationResult = 0;
  +[FMNSXPCConnectionCache sharedCache](FMNSXPCConnectionCache, "sharedCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FMNSXPCConnectionConfiguration fmipConfiguration](FMNSXPCConnectionConfiguration, "fmipConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resumeConnectionWithConfiguration:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __79__FMDFMIPManager_markAsMissingSupportedForPairedDeviceWithUDID_withCompletion___block_invoke;
  v20[3] = &unk_1E829C100;
  v13 = v6;
  v21 = v13;
  objc_msgSend(v11, "addFailureBlock:", v20);
  objc_msgSend(v11, "remoteObjectProxy");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __79__FMDFMIPManager_markAsMissingSupportedForPairedDeviceWithUDID_withCompletion___block_invoke_46;
  v17[3] = &unk_1E829C488;
  v15 = v13;
  v18 = v11;
  v19 = v15;
  v16 = v11;
  objc_msgSend(v14, "markAsMissingSupportedForPairedDeviceWithUDID:usingCallback:", v5, v17);

  objc_autoreleasePoolPop(v7);
}

void __79__FMDFMIPManager_markAsMissingSupportedForPairedDeviceWithUDID_withCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;

  LogCategory_Unspecified();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __79__FMDFMIPManager_markAsMissingSupportedForPairedDeviceWithUDID_withCompletion___block_invoke_cold_1();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", kFMDErrorDomain, 13, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v3);

}

void __79__FMDFMIPManager_markAsMissingSupportedForPairedDeviceWithUDID_withCompletion___block_invoke_46(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  LogCategory_Unspecified();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __79__FMDFMIPManager_markAsMissingSupportedForPairedDeviceWithUDID_withCompletion___block_invoke_46_cold_1();
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315138;
    v10 = "-[FMDFMIPManager markAsMissingSupportedForPairedDeviceWithUDID:withCompletion:]_block_invoke";
    _os_log_impl(&dword_1C9939000, v7, OS_LOG_TYPE_DEFAULT, "%s completed", (uint8_t *)&v9, 0xCu);
  }

  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

- (void)markPairedDeviceWithUDID:(id)a3 asMissingUsingToken:(id)a4 withCompletion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  const char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1CAA4547C]();
  LogCategory_Unspecified();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = "non-nil";
    v28 = "-[FMDFMIPManager markPairedDeviceWithUDID:asMissingUsingToken:withCompletion:]";
    *(_DWORD *)buf = 136315650;
    if (!v8)
      v12 = "nil";
    v29 = 2112;
    v30 = v7;
    v31 = 2080;
    v32 = v12;
    _os_log_impl(&dword_1C9939000, v11, OS_LOG_TYPE_DEFAULT, "%s for paired device %@ with %s token", buf, 0x20u);
  }

  fmdFMIPLastOperationResult = 0;
  LogCategory_Unspecified();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v28) = v8 != 0;
    _os_log_impl(&dword_1C9939000, v13, OS_LOG_TYPE_DEFAULT, "markPairedDeviceWithUDID: token present: %i", buf, 8u);
  }

  +[FMNSXPCConnectionCache sharedCache](FMNSXPCConnectionCache, "sharedCache");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[FMNSXPCConnectionConfiguration fmipConfiguration](FMNSXPCConnectionConfiguration, "fmipConfiguration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "resumeConnectionWithConfiguration:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __78__FMDFMIPManager_markPairedDeviceWithUDID_asMissingUsingToken_withCompletion___block_invoke;
  v25[3] = &unk_1E829C100;
  v18 = v9;
  v26 = v18;
  objc_msgSend(v16, "addFailureBlock:", v25);
  objc_msgSend(v16, "remoteObjectProxy");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v17;
  v22[1] = 3221225472;
  v22[2] = __78__FMDFMIPManager_markPairedDeviceWithUDID_asMissingUsingToken_withCompletion___block_invoke_48;
  v22[3] = &unk_1E829C380;
  v20 = v18;
  v23 = v16;
  v24 = v20;
  v21 = v16;
  objc_msgSend(v19, "markPairedDeviceWithUDID:asMissingUsingToken:callback:", v7, v8, v22);

  objc_autoreleasePoolPop(v10);
}

void __78__FMDFMIPManager_markPairedDeviceWithUDID_asMissingUsingToken_withCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;

  LogCategory_Unspecified();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __78__FMDFMIPManager_markPairedDeviceWithUDID_asMissingUsingToken_withCompletion___block_invoke_cold_1();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", kFMDErrorDomain, 13, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);

}

void __78__FMDFMIPManager_markPairedDeviceWithUDID_asMissingUsingToken_withCompletion___block_invoke_48(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  LogCategory_Unspecified();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __78__FMDFMIPManager_markPairedDeviceWithUDID_asMissingUsingToken_withCompletion___block_invoke_48_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[FMDFMIPManager markPairedDeviceWithUDID:asMissingUsingToken:withCompletion:]_block_invoke";
    _os_log_impl(&dword_1C9939000, v5, OS_LOG_TYPE_DEFAULT, "%s completed", (uint8_t *)&v7, 0xCu);
  }

  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

- (void)isActivationLockAllowedWithCompletion:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1CAA4547C]();
  LogCategory_Unspecified();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[FMDFMIPManager isActivationLockAllowedWithCompletion:]";
    _os_log_impl(&dword_1C9939000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  fmdFMIPLastOperationResult = 0;
  +[FMNSXPCConnectionCache sharedCache](FMNSXPCConnectionCache, "sharedCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[FMNSXPCConnectionConfiguration fmipConfiguration](FMNSXPCConnectionConfiguration, "fmipConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resumeConnectionWithConfiguration:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __56__FMDFMIPManager_isActivationLockAllowedWithCompletion___block_invoke;
  v17[3] = &unk_1E829C100;
  v10 = v3;
  v18 = v10;
  objc_msgSend(v8, "addFailureBlock:", v17);
  objc_msgSend(v8, "remoteObjectProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __56__FMDFMIPManager_isActivationLockAllowedWithCompletion___block_invoke_49;
  v14[3] = &unk_1E829C488;
  v12 = v10;
  v15 = v8;
  v16 = v12;
  v13 = v8;
  objc_msgSend(v11, "isActivationLockAllowedUsingCallback:", v14);

  objc_autoreleasePoolPop(v4);
}

void __56__FMDFMIPManager_isActivationLockAllowedWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;

  LogCategory_Unspecified();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __56__FMDFMIPManager_isActivationLockAllowedWithCompletion___block_invoke_cold_1();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", kFMDErrorDomain, 13, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v3);

}

void __56__FMDFMIPManager_isActivationLockAllowedWithCompletion___block_invoke_49(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  LogCategory_Unspecified();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __56__FMDFMIPManager_isActivationLockAllowedWithCompletion___block_invoke_49_cold_1();
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = a2;
    _os_log_impl(&dword_1C9939000, v7, OS_LOG_TYPE_DEFAULT, "ActivationLockAllowed : %d", (uint8_t *)v9, 8u);
  }

  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

- (void)isActivationLockEnabledWithCompletion:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1CAA4547C]();
  LogCategory_Unspecified();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[FMDFMIPManager isActivationLockEnabledWithCompletion:]";
    _os_log_impl(&dword_1C9939000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  fmdFMIPLastOperationResult = 0;
  +[FMNSXPCConnectionCache sharedCache](FMNSXPCConnectionCache, "sharedCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[FMNSXPCConnectionConfiguration fmipConfiguration](FMNSXPCConnectionConfiguration, "fmipConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resumeConnectionWithConfiguration:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __56__FMDFMIPManager_isActivationLockEnabledWithCompletion___block_invoke;
  v17[3] = &unk_1E829C100;
  v10 = v3;
  v18 = v10;
  objc_msgSend(v8, "addFailureBlock:", v17);
  objc_msgSend(v8, "remoteObjectProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __56__FMDFMIPManager_isActivationLockEnabledWithCompletion___block_invoke_50;
  v14[3] = &unk_1E829C488;
  v12 = v10;
  v15 = v8;
  v16 = v12;
  v13 = v8;
  objc_msgSend(v11, "isActivationLockEnabledUsingCallback:", v14);

  objc_autoreleasePoolPop(v4);
}

void __56__FMDFMIPManager_isActivationLockEnabledWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;

  LogCategory_Unspecified();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __56__FMDFMIPManager_isActivationLockEnabledWithCompletion___block_invoke_cold_1();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", kFMDErrorDomain, 13, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v3);

}

void __56__FMDFMIPManager_isActivationLockEnabledWithCompletion___block_invoke_50(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  LogCategory_Unspecified();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __56__FMDFMIPManager_isActivationLockEnabledWithCompletion___block_invoke_50_cold_1();
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = a2;
    _os_log_impl(&dword_1C9939000, v7, OS_LOG_TYPE_DEFAULT, "ActivationLockEnabled : %d", (uint8_t *)v9, 8u);
  }

  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

- (void)isActivationLockedWithCompletion:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1CAA4547C]();
  LogCategory_Unspecified();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[FMDFMIPManager isActivationLockedWithCompletion:]";
    _os_log_impl(&dword_1C9939000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  fmdFMIPLastOperationResult = 0;
  +[FMNSXPCConnectionCache sharedCache](FMNSXPCConnectionCache, "sharedCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[FMNSXPCConnectionConfiguration fmipConfiguration](FMNSXPCConnectionConfiguration, "fmipConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resumeConnectionWithConfiguration:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __51__FMDFMIPManager_isActivationLockedWithCompletion___block_invoke;
  v17[3] = &unk_1E829C100;
  v10 = v3;
  v18 = v10;
  objc_msgSend(v8, "addFailureBlock:", v17);
  objc_msgSend(v8, "remoteObjectProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __51__FMDFMIPManager_isActivationLockedWithCompletion___block_invoke_51;
  v14[3] = &unk_1E829C488;
  v12 = v10;
  v15 = v8;
  v16 = v12;
  v13 = v8;
  objc_msgSend(v11, "isActivationLockedUsingCallback:", v14);

  objc_autoreleasePoolPop(v4);
}

void __51__FMDFMIPManager_isActivationLockedWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;

  LogCategory_Unspecified();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __51__FMDFMIPManager_isActivationLockedWithCompletion___block_invoke_cold_1();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", kFMDErrorDomain, 13, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v3);

}

void __51__FMDFMIPManager_isActivationLockedWithCompletion___block_invoke_51(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  LogCategory_Unspecified();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __51__FMDFMIPManager_isActivationLockedWithCompletion___block_invoke_51_cold_1();
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = a2;
    _os_log_impl(&dword_1C9939000, v7, OS_LOG_TYPE_DEFAULT, "ActivationLocked : %d", (uint8_t *)v9, 8u);
  }

  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

- (void)enableActivationLockWithCompletion:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1CAA4547C]();
  LogCategory_Unspecified();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[FMDFMIPManager enableActivationLockWithCompletion:]";
    _os_log_impl(&dword_1C9939000, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }

  fmdFMIPLastOperationResult = 0;
  +[FMNSXPCConnectionCache sharedCache](FMNSXPCConnectionCache, "sharedCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[FMNSXPCConnectionConfiguration fmipConfiguration](FMNSXPCConnectionConfiguration, "fmipConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resumeConnectionWithConfiguration:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __53__FMDFMIPManager_enableActivationLockWithCompletion___block_invoke;
  v17[3] = &unk_1E829C100;
  v10 = v3;
  v18 = v10;
  objc_msgSend(v8, "addFailureBlock:", v17);
  objc_msgSend(v8, "remoteObjectProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __53__FMDFMIPManager_enableActivationLockWithCompletion___block_invoke_52;
  v14[3] = &unk_1E829C380;
  v12 = v10;
  v15 = v8;
  v16 = v12;
  v13 = v8;
  objc_msgSend(v11, "enableActivationLockUsingCallback:", v14);

  objc_autoreleasePoolPop(v4);
}

void __53__FMDFMIPManager_enableActivationLockWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;

  LogCategory_Unspecified();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __53__FMDFMIPManager_enableActivationLockWithCompletion___block_invoke_cold_1();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", kFMDErrorDomain, 13, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);

}

void __53__FMDFMIPManager_enableActivationLockWithCompletion___block_invoke_52(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  if (v3)
  {
    LogCategory_Unspecified();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __53__FMDFMIPManager_enableActivationLockWithCompletion___block_invoke_52_cold_1();

  }
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

- (BOOL)needsLostModeExitAuth
{
  void *v3;
  NSObject *v4;
  int v5;
  NSObject *v6;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1CAA4547C](self, a2);
  LogCategory_Unspecified();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[FMDFMIPManager needsLostModeExitAuth]";
    _os_log_impl(&dword_1C9939000, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  fmdFMIPLastOperationResult = 0;
  if (-[FMDFMIPManager _isRunningAsMobileUser](self, "_isRunningAsMobileUser"))
  {
    objc_msgSend(MEMORY[0x1E0D20200], "synchronizeDomain:", kFMDNotBackedUpPrefDomain);
    v5 = objc_msgSend(MEMORY[0x1E0D20200], "BOOLForKey:inDomain:", CFSTR("needsLostModeExitAuth"), kFMDNotBackedUpPrefDomain);
    LogCategory_Unspecified();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 67109120;
      LODWORD(v9) = v5;
      _os_log_impl(&dword_1C9939000, v6, OS_LOG_TYPE_DEFAULT, "needsLostModeExitAuth = %d", (uint8_t *)&v8, 8u);
    }

  }
  else
  {
    LOBYTE(v5) = 0;
  }
  objc_autoreleasePoolPop(v3);
  return v5;
}

- (void)didReceiveLostModeExitAuthToken:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1CAA4547C]();
  LogCategory_Unspecified();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = "non-nil";
    if (!v3)
      v6 = "nil";
    *(_DWORD *)buf = 136315394;
    v16 = "-[FMDFMIPManager didReceiveLostModeExitAuthToken:]";
    v17 = 2080;
    v18 = v6;
    _os_log_impl(&dword_1C9939000, v5, OS_LOG_TYPE_DEFAULT, "%s with %s token", buf, 0x16u);
  }

  fmdFMIPLastOperationResult = 0;
  LogCategory_Unspecified();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v16) = v3 != 0;
    _os_log_impl(&dword_1C9939000, v7, OS_LOG_TYPE_DEFAULT, "didReceiveLostModeExitAuthToken: token present: %i", buf, 8u);
  }

  +[FMNSXPCConnectionCache sharedCache](FMNSXPCConnectionCache, "sharedCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[FMNSXPCConnectionConfiguration fmipConfiguration](FMNSXPCConnectionConfiguration, "fmipConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resumeConnectionWithConfiguration:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "addFailureBlock:", &__block_literal_global_53);
  objc_msgSend(v10, "remoteObjectProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __50__FMDFMIPManager_didReceiveLostModeExitAuthToken___block_invoke_54;
  v13[3] = &unk_1E829C308;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "didReceiveLostModeExitAuthToken:usingCallback:", v3, v13);

  objc_autoreleasePoolPop(v4);
}

void __50__FMDFMIPManager_didReceiveLostModeExitAuthToken___block_invoke()
{
  NSObject *v0;

  LogCategory_Unspecified();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __50__FMDFMIPManager_didReceiveLostModeExitAuthToken___block_invoke_cold_1();

}

void __50__FMDFMIPManager_didReceiveLostModeExitAuthToken___block_invoke_54(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  LogCategory_Unspecified();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1C9939000, v4, OS_LOG_TYPE_DEFAULT, "didReceiveLostModeExitAuthToken completed. Error : %@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (void)initiateLostModeExitAuthWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1CAA4547C]();
  LogCategory_Unspecified();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[FMDFMIPManager initiateLostModeExitAuthWithCompletion:]";
    _os_log_impl(&dword_1C9939000, v6, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v7, 0xCu);
  }

  -[FMDFMIPManager _initiateLostModeExitAuthForIDSDeviceID:withCompletion:](self, "_initiateLostModeExitAuthForIDSDeviceID:withCompletion:", 0, v4);
  objc_autoreleasePoolPop(v5);

}

- (void)initiateLostModeExitAuthForIDSDeviceID:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1CAA4547C]();
  LogCategory_Unspecified();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315138;
    v11 = "-[FMDFMIPManager initiateLostModeExitAuthForIDSDeviceID:withCompletion:]";
    _os_log_impl(&dword_1C9939000, v9, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v10, 0xCu);
  }

  -[FMDFMIPManager _initiateLostModeExitAuthForIDSDeviceID:withCompletion:](self, "_initiateLostModeExitAuthForIDSDeviceID:withCompletion:", v6, v7);
  objc_autoreleasePoolPop(v8);

}

- (void)lowBatteryLocateEnabledWithCompletion:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1CAA4547C]();
  LogCategory_Unspecified();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[FMDFMIPManager lowBatteryLocateEnabledWithCompletion:]";
    _os_log_impl(&dword_1C9939000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  fmdFMIPLastOperationResult = 0;
  +[FMNSXPCConnectionCache sharedCache](FMNSXPCConnectionCache, "sharedCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[FMNSXPCConnectionConfiguration fmipConfiguration](FMNSXPCConnectionConfiguration, "fmipConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resumeConnectionWithConfiguration:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __56__FMDFMIPManager_lowBatteryLocateEnabledWithCompletion___block_invoke;
  v17[3] = &unk_1E829C100;
  v10 = v3;
  v18 = v10;
  objc_msgSend(v8, "addFailureBlock:", v17);
  objc_msgSend(v8, "remoteObjectProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __56__FMDFMIPManager_lowBatteryLocateEnabledWithCompletion___block_invoke_55;
  v14[3] = &unk_1E829C488;
  v12 = v10;
  v15 = v8;
  v16 = v12;
  v13 = v8;
  objc_msgSend(v11, "lowBatteryLocateEnabledUsingCallback:", v14);

  objc_autoreleasePoolPop(v4);
}

void __56__FMDFMIPManager_lowBatteryLocateEnabledWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;

  LogCategory_Unspecified();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __56__FMDFMIPManager_lowBatteryLocateEnabledWithCompletion___block_invoke_cold_1();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", kFMDErrorDomain, 13, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v3);

}

void __56__FMDFMIPManager_lowBatteryLocateEnabledWithCompletion___block_invoke_55(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  LogCategory_Unspecified();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = "NO";
    if ((_DWORD)a2)
      v7 = "YES";
    v9 = 136315394;
    v10 = v7;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1C9939000, v6, OS_LOG_TYPE_DEFAULT, "lowBatteryLocateEnabled : %s, Error : %@", (uint8_t *)&v9, 0x16u);
  }

  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

- (void)setLowBatteryLocateEnabled:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  NSObject *v7;
  const char *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  const char *v25;
  uint64_t v26;

  v4 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (void *)MEMORY[0x1CAA4547C]();
  LogCategory_Unspecified();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = "NO";
    if (v4)
      v8 = "YES";
    *(_DWORD *)buf = 136315394;
    v23 = "-[FMDFMIPManager setLowBatteryLocateEnabled:withCompletion:]";
    v24 = 2080;
    v25 = v8;
    _os_log_impl(&dword_1C9939000, v7, OS_LOG_TYPE_DEFAULT, "%s enabled %s", buf, 0x16u);
  }

  fmdFMIPLastOperationResult = 0;
  +[FMNSXPCConnectionCache sharedCache](FMNSXPCConnectionCache, "sharedCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FMNSXPCConnectionConfiguration fmipConfiguration](FMNSXPCConnectionConfiguration, "fmipConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resumeConnectionWithConfiguration:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __60__FMDFMIPManager_setLowBatteryLocateEnabled_withCompletion___block_invoke;
  v20[3] = &unk_1E829C100;
  v13 = v5;
  v21 = v13;
  objc_msgSend(v11, "addFailureBlock:", v20);
  objc_msgSend(v11, "remoteObjectProxy");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __60__FMDFMIPManager_setLowBatteryLocateEnabled_withCompletion___block_invoke_58;
  v17[3] = &unk_1E829C380;
  v15 = v13;
  v18 = v11;
  v19 = v15;
  v16 = v11;
  objc_msgSend(v14, "setLowBatteryLocateEnabled:usingCallback:", v4, v17);

  objc_autoreleasePoolPop(v6);
}

void __60__FMDFMIPManager_setLowBatteryLocateEnabled_withCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;

  LogCategory_Unspecified();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __60__FMDFMIPManager_setLowBatteryLocateEnabled_withCompletion___block_invoke_cold_1();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", kFMDErrorDomain, 13, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);

}

void __60__FMDFMIPManager_setLowBatteryLocateEnabled_withCompletion___block_invoke_58(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  LogCategory_Unspecified();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_1C9939000, v4, OS_LOG_TYPE_DEFAULT, "setLowBatteryLocateEnabled completed. Error : %@", (uint8_t *)&v6, 0xCu);
  }

  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

- (void)userNotifiedOfActivationLockForAllPairedDevices
{
  void *v2;
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1CAA4547C](self, a2);
  LogCategory_Unspecified();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[FMDFMIPManager userNotifiedOfActivationLockForAllPairedDevices]";
    _os_log_impl(&dword_1C9939000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

  fmdFMIPLastOperationResult = 0;
  objc_autoreleasePoolPop(v2);
}

- (void)userNotifiedOfActivationLockForPairedDevices:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1CAA4547C]();
  LogCategory_Unspecified();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[FMDFMIPManager userNotifiedOfActivationLockForPairedDevices:]";
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_1C9939000, v5, OS_LOG_TYPE_DEFAULT, "%s for paired devices %@", (uint8_t *)&v6, 0x16u);
  }

  fmdFMIPLastOperationResult = 0;
  objc_autoreleasePoolPop(v4);

}

- (id)pathsToPreserveAcrossWipe
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  -[FMDFMIPManager _postWipePrefPath](self, "_postWipePrefPath");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    v6[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v4;
}

- (void)signatureHeadersWithData:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1CAA4547C]();
  LogCategory_Unspecified();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v23 = "-[FMDFMIPManager signatureHeadersWithData:completion:]";
    _os_log_impl(&dword_1C9939000, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  fmdFMIPLastOperationResult = 0;
  +[FMNSXPCConnectionCache sharedCache](FMNSXPCConnectionCache, "sharedCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FMNSXPCConnectionConfiguration fmipConfiguration](FMNSXPCConnectionConfiguration, "fmipConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resumeConnectionWithConfiguration:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __54__FMDFMIPManager_signatureHeadersWithData_completion___block_invoke;
  v20[3] = &unk_1E829C100;
  v13 = v6;
  v21 = v13;
  objc_msgSend(v11, "addFailureBlock:", v20);
  objc_msgSend(v11, "remoteObjectProxy");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __54__FMDFMIPManager_signatureHeadersWithData_completion___block_invoke_60;
  v17[3] = &unk_1E829C4D0;
  v15 = v13;
  v18 = v11;
  v19 = v15;
  v16 = v11;
  objc_msgSend(v14, "signatureHeadersWithData:completion:", v5, v17);

  objc_autoreleasePoolPop(v7);
}

void __54__FMDFMIPManager_signatureHeadersWithData_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;

  LogCategory_Unspecified();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __54__FMDFMIPManager_signatureHeadersWithData_completion___block_invoke_cold_1();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", kFMDErrorDomain, 13, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v3);

}

void __54__FMDFMIPManager_signatureHeadersWithData_completion___block_invoke_60(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    LogCategory_Unspecified();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __54__FMDFMIPManager_signatureHeadersWithData_completion___block_invoke_60_cold_1();

  }
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

- (void)startPlayingSoundForAccessory:(id)a3 duration:(double)a4 rampUpDuration:(double)a5 channels:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  uint8_t buf[4];
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a7;
  v13 = a6;
  +[FMNSXPCConnectionCache sharedCache](FMNSXPCConnectionCache, "sharedCache");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[FMNSXPCConnectionConfiguration helperConfiguration](FMNSXPCConnectionConfiguration, "helperConfiguration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "resumeConnectionWithConfiguration:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __92__FMDFMIPManager_startPlayingSoundForAccessory_duration_rampUpDuration_channels_completion___block_invoke;
  v28[3] = &unk_1E829C100;
  v18 = v12;
  v29 = v18;
  objc_msgSend(v16, "addFailureBlock:", v28);
  objc_msgSend(v16, "remoteObjectProxy");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LogCategory_Unspecified();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = objc_opt_class();
    *(_DWORD *)buf = 138412290;
    v31 = v21;
    _os_log_impl(&dword_1C9939000, v20, OS_LOG_TYPE_DEFAULT, "accessory %@", buf, 0xCu);
  }

  v22 = +[FMDGenericAudioAccessory copyAccessory:](FMDGenericAudioAccessory, "copyAccessory:", v11);
  v25[0] = v17;
  v25[1] = 3221225472;
  v25[2] = __92__FMDFMIPManager_startPlayingSoundForAccessory_duration_rampUpDuration_channels_completion___block_invoke_63;
  v25[3] = &unk_1E829C380;
  v26 = v16;
  v27 = v18;
  v23 = v16;
  v24 = v18;
  objc_msgSend(v19, "startPlayingSoundForAccessory:duration:rampUpDuration:channels:completion:", v22, v13, v25, a4, a5);

}

void __92__FMDFMIPManager_startPlayingSoundForAccessory_duration_rampUpDuration_channels_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;

  LogCategory_Unspecified();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __92__FMDFMIPManager_startPlayingSoundForAccessory_duration_rampUpDuration_channels_completion___block_invoke_cold_1();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", kFMDErrorDomain, 13, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);

}

void __92__FMDFMIPManager_startPlayingSoundForAccessory_duration_rampUpDuration_channels_completion___block_invoke_63(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint8_t v7[16];

  v3 = a2;
  LogCategory_Unspecified();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __92__FMDFMIPManager_startPlayingSoundForAccessory_duration_rampUpDuration_channels_completion___block_invoke_63_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1C9939000, v5, OS_LOG_TYPE_DEFAULT, "playSoundForAccessory sound started", v7, 2u);
  }

  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

- (void)stopPlayingSoundForAccessory:(id)a3 rampDownDuration:(double)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;

  v7 = a5;
  v8 = a3;
  +[FMNSXPCConnectionCache sharedCache](FMNSXPCConnectionCache, "sharedCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FMNSXPCConnectionConfiguration helperConfiguration](FMNSXPCConnectionConfiguration, "helperConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resumeConnectionWithConfiguration:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __75__FMDFMIPManager_stopPlayingSoundForAccessory_rampDownDuration_completion___block_invoke;
  v21[3] = &unk_1E829C100;
  v13 = v7;
  v22 = v13;
  objc_msgSend(v11, "addFailureBlock:", v21);
  objc_msgSend(v11, "remoteObjectProxy");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = +[FMDGenericAudioAccessory copyAccessory:](FMDGenericAudioAccessory, "copyAccessory:", v8);

  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = __75__FMDFMIPManager_stopPlayingSoundForAccessory_rampDownDuration_completion___block_invoke_64;
  v18[3] = &unk_1E829C380;
  v19 = v11;
  v20 = v13;
  v16 = v11;
  v17 = v13;
  objc_msgSend(v14, "stopPlayingForAccessory:rampDownDuration:completion:", v15, v18, a4);

}

void __75__FMDFMIPManager_stopPlayingSoundForAccessory_rampDownDuration_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;

  LogCategory_Unspecified();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __75__FMDFMIPManager_stopPlayingSoundForAccessory_rampDownDuration_completion___block_invoke_cold_1();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", kFMDErrorDomain, 13, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);

}

void __75__FMDFMIPManager_stopPlayingSoundForAccessory_rampDownDuration_completion___block_invoke_64(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint8_t v7[16];

  v3 = a2;
  LogCategory_Unspecified();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __75__FMDFMIPManager_stopPlayingSoundForAccessory_rampDownDuration_completion___block_invoke_64_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1C9939000, v5, OS_LOG_TYPE_DEFAULT, "stopSoundForAccessory sound did stop", v7, 2u);
  }

  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

- (void)waitForRoutableAccessory:(id)a3 timeout:(double)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;

  v7 = a5;
  v8 = a3;
  +[FMNSXPCConnectionCache sharedCache](FMNSXPCConnectionCache, "sharedCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FMNSXPCConnectionConfiguration helperConfiguration](FMNSXPCConnectionConfiguration, "helperConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resumeConnectionWithConfiguration:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __62__FMDFMIPManager_waitForRoutableAccessory_timeout_completion___block_invoke;
  v23[3] = &unk_1E829C100;
  v13 = v7;
  v24 = v13;
  objc_msgSend(v11, "addFailureBlock:", v23);
  objc_msgSend(v11, "remoteObjectProxy");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = +[FMDGenericAudioAccessory copyAccessory:](FMDGenericAudioAccessory, "copyAccessory:", v8);

  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __62__FMDFMIPManager_waitForRoutableAccessory_timeout_completion___block_invoke_65;
  v19[3] = &unk_1E829C4F8;
  v21 = v11;
  v22 = v13;
  v20 = v15;
  v16 = v11;
  v17 = v13;
  v18 = v15;
  objc_msgSend(v14, "waitForRoutableAccessory:timeout:completion:", v18, v19, a4);

}

void __62__FMDFMIPManager_waitForRoutableAccessory_timeout_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;

  LogCategory_Unspecified();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __62__FMDFMIPManager_waitForRoutableAccessory_timeout_completion___block_invoke_cold_1();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", kFMDErrorDomain, 13, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);

}

void __62__FMDFMIPManager_waitForRoutableAccessory_timeout_completion___block_invoke_65(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  LogCategory_Unspecified();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __62__FMDFMIPManager_waitForRoutableAccessory_timeout_completion___block_invoke_65_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_1C9939000, v5, OS_LOG_TYPE_DEFAULT, "Accessory became routable %@", (uint8_t *)&v8, 0xCu);
  }

  v7 = *(_QWORD *)(a1 + 48);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  objc_msgSend(*(id *)(a1 + 40), "invalidate");

}

- (void)soundStoppedForAccessoryIdentifier:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1CAA4547C]();
  LogCategory_Unspecified();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315138;
    v11 = "-[FMDFMIPManager soundStoppedForAccessoryIdentifier:]";
    _os_log_impl(&dword_1C9939000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v10, 0xCu);
  }

  fmdFMIPLastOperationResult = 0;
  +[FMNSXPCConnectionCache sharedCache](FMNSXPCConnectionCache, "sharedCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[FMNSXPCConnectionConfiguration fmipConfiguration](FMNSXPCConnectionConfiguration, "fmipConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resumeConnectionWithConfiguration:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addFailureBlock:", &__block_literal_global_66);
  objc_msgSend(v8, "remoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "soundStoppedForAccessoryIdentifier:", v3);
  objc_msgSend(v8, "invalidate");

  objc_autoreleasePoolPop(v4);
}

void __53__FMDFMIPManager_soundStoppedForAccessoryIdentifier___block_invoke()
{
  NSObject *v0;

  LogCategory_Unspecified();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __53__FMDFMIPManager_soundStoppedForAccessoryIdentifier___block_invoke_cold_1();

}

- (void)clearData:(unint64_t)a3 completion:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (void *)MEMORY[0x1CAA4547C]();
  LogCategory_Unspecified();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "-[FMDFMIPManager clearData:completion:]";
    _os_log_impl(&dword_1C9939000, v7, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  fmdFMIPLastOperationResult = 0;
  +[FMNSXPCConnectionCache sharedCache](FMNSXPCConnectionCache, "sharedCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[FMNSXPCConnectionConfiguration fmipConfiguration](FMNSXPCConnectionConfiguration, "fmipConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resumeConnectionWithConfiguration:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "addFailureBlock:", &__block_literal_global_67);
  objc_msgSend(v10, "remoteObjectProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __39__FMDFMIPManager_clearData_completion___block_invoke_68;
  v14[3] = &unk_1E829C380;
  v12 = v5;
  v15 = v10;
  v16 = v12;
  v13 = v10;
  objc_msgSend(v11, "clearData:completion:", a3, v14);

  objc_autoreleasePoolPop(v6);
}

void __39__FMDFMIPManager_clearData_completion___block_invoke()
{
  NSObject *v0;

  LogCategory_Unspecified();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __39__FMDFMIPManager_clearData_completion___block_invoke_cold_1();

}

uint64_t __39__FMDFMIPManager_clearData_completion___block_invoke_68(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (void)audioAccessorySerialNumbersWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__FMDFMIPManager_audioAccessorySerialNumbersWithCompletion___block_invoke_2;
  v6[3] = &unk_1E829C5E0;
  v7 = v4;
  v5 = v4;
  -[FMDFMIPManager _getAccessoriesWithFilter:completion:](self, "_getAccessoriesWithFilter:completion:", &__block_literal_global_70, v6);

}

uint64_t __60__FMDFMIPManager_audioAccessorySerialNumbersWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "conformsToProtocol:", &unk_1EF925848);
}

void __60__FMDFMIPManager_audioAccessorySerialNumbersWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  objc_msgSend(a3, "fm_map:", &__block_literal_global_138);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __60__FMDFMIPManager_audioAccessorySerialNumbersWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "audioAccessoryInfo");
}

- (void)getAccessoriesWithCompletion:(id)a3
{
  -[FMDFMIPManager _getAccessoriesWithFilter:completion:](self, "_getAccessoriesWithFilter:completion:", &__block_literal_global_141, a3);
}

uint64_t __47__FMDFMIPManager_getAccessoriesWithCompletion___block_invoke()
{
  return 1;
}

- (void)fetchAccessoryConfigurations:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1CAA4547C]();
  LogCategory_Unspecified();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[FMDFMIPManager fetchAccessoryConfigurations:]";
    _os_log_impl(&dword_1C9939000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  fmdFMIPLastOperationResult = 0;
  +[FMNSXPCConnectionCache sharedCache](FMNSXPCConnectionCache, "sharedCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[FMNSXPCConnectionConfiguration fmipConfiguration](FMNSXPCConnectionConfiguration, "fmipConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resumeConnectionWithConfiguration:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __47__FMDFMIPManager_fetchAccessoryConfigurations___block_invoke;
  v17[3] = &unk_1E829C100;
  v10 = v3;
  v18 = v10;
  objc_msgSend(v8, "addFailureBlock:", v17);
  objc_msgSend(v8, "remoteObjectProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __47__FMDFMIPManager_fetchAccessoryConfigurations___block_invoke_142;
  v14[3] = &unk_1E829C380;
  v12 = v10;
  v15 = v8;
  v16 = v12;
  v13 = v8;
  objc_msgSend(v11, "fetchAccessoryConfigurations:", v14);

  objc_autoreleasePoolPop(v4);
}

void __47__FMDFMIPManager_fetchAccessoryConfigurations___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;

  LogCategory_Unspecified();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __47__FMDFMIPManager_fetchAccessoryConfigurations___block_invoke_cold_1();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", kFMDErrorDomain, 13, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);

}

uint64_t __47__FMDFMIPManager_fetchAccessoryConfigurations___block_invoke_142(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (void)removeAccessoryWithDiscoveryId:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1CAA4547C]();
  LogCategory_Unspecified();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v23 = "-[FMDFMIPManager removeAccessoryWithDiscoveryId:completion:]";
    _os_log_impl(&dword_1C9939000, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  fmdFMIPLastOperationResult = 0;
  +[FMNSXPCConnectionCache sharedCache](FMNSXPCConnectionCache, "sharedCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FMNSXPCConnectionConfiguration fmipConfiguration](FMNSXPCConnectionConfiguration, "fmipConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resumeConnectionWithConfiguration:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __60__FMDFMIPManager_removeAccessoryWithDiscoveryId_completion___block_invoke;
  v20[3] = &unk_1E829C100;
  v13 = v6;
  v21 = v13;
  objc_msgSend(v11, "addFailureBlock:", v20);
  objc_msgSend(v11, "remoteObjectProxy");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __60__FMDFMIPManager_removeAccessoryWithDiscoveryId_completion___block_invoke_143;
  v17[3] = &unk_1E829C380;
  v15 = v13;
  v18 = v11;
  v19 = v15;
  v16 = v11;
  objc_msgSend(v14, "removeAccessoryWithDiscoveryId:completion:", v5, v17);

  objc_autoreleasePoolPop(v7);
}

void __60__FMDFMIPManager_removeAccessoryWithDiscoveryId_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;

  LogCategory_Unspecified();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __60__FMDFMIPManager_removeAccessoryWithDiscoveryId_completion___block_invoke_cold_1();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", kFMDErrorDomain, 13, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);

}

uint64_t __60__FMDFMIPManager_removeAccessoryWithDiscoveryId_completion___block_invoke_143(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (void)setPhoneNumber:(id)a3 toAccessoryWithDiscoveryId:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1CAA4547C]();
  LogCategory_Unspecified();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v26 = "-[FMDFMIPManager setPhoneNumber:toAccessoryWithDiscoveryId:completion:]";
    _os_log_impl(&dword_1C9939000, v11, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  fmdFMIPLastOperationResult = 0;
  +[FMNSXPCConnectionCache sharedCache](FMNSXPCConnectionCache, "sharedCache");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[FMNSXPCConnectionConfiguration fmipConfiguration](FMNSXPCConnectionConfiguration, "fmipConfiguration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "resumeConnectionWithConfiguration:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __71__FMDFMIPManager_setPhoneNumber_toAccessoryWithDiscoveryId_completion___block_invoke;
  v23[3] = &unk_1E829C100;
  v16 = v9;
  v24 = v16;
  objc_msgSend(v14, "addFailureBlock:", v23);
  objc_msgSend(v14, "remoteObjectProxy");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v15;
  v20[1] = 3221225472;
  v20[2] = __71__FMDFMIPManager_setPhoneNumber_toAccessoryWithDiscoveryId_completion___block_invoke_144;
  v20[3] = &unk_1E829C380;
  v18 = v16;
  v21 = v14;
  v22 = v18;
  v19 = v14;
  objc_msgSend(v17, "setPhoneNumber:toAccessoryWithDiscoveryId:completion:", v7, v8, v20);

  objc_autoreleasePoolPop(v10);
}

void __71__FMDFMIPManager_setPhoneNumber_toAccessoryWithDiscoveryId_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;

  LogCategory_Unspecified();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __71__FMDFMIPManager_setPhoneNumber_toAccessoryWithDiscoveryId_completion___block_invoke_cold_1();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", kFMDErrorDomain, 13, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);

}

uint64_t __71__FMDFMIPManager_setPhoneNumber_toAccessoryWithDiscoveryId_completion___block_invoke_144(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

void __54__FMDFMIPManager_getConnectedAccessoriesDiscoveryIds___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;

  LogCategory_Unspecified();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __54__FMDFMIPManager_getConnectedAccessoriesDiscoveryIds___block_invoke_cold_1();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", kFMDErrorDomain, 13, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, MEMORY[0x1E0C9AA60], v3);

}

uint64_t __54__FMDFMIPManager_getConnectedAccessoriesDiscoveryIds___block_invoke_145(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (void)registerDeviceForPairingLock:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  LogCategory_Unspecified();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "-[FMDFMIPManager registerDeviceForPairingLock:completion:]";
    _os_log_impl(&dword_1C9939000, v7, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  fmdFMIPLastOperationResult = 0;
  +[FMNSXPCConnectionCache sharedCache](FMNSXPCConnectionCache, "sharedCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[FMNSXPCConnectionConfiguration fmipConfiguration](FMNSXPCConnectionConfiguration, "fmipConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resumeConnectionWithConfiguration:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __58__FMDFMIPManager_registerDeviceForPairingLock_completion___block_invoke;
  v19[3] = &unk_1E829C100;
  v12 = v5;
  v20 = v12;
  objc_msgSend(v10, "addFailureBlock:", v19);
  objc_msgSend(v10, "remoteObjectProxy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __58__FMDFMIPManager_registerDeviceForPairingLock_completion___block_invoke_147;
  v16[3] = &unk_1E829C670;
  v17 = v10;
  v18 = v12;
  v14 = v10;
  v15 = v12;
  objc_msgSend(v13, "registerDeviceForPairingLock:completion:", v6, v16);

}

void __58__FMDFMIPManager_registerDeviceForPairingLock_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;

  LogCategory_Unspecified();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __58__FMDFMIPManager_registerDeviceForPairingLock_completion___block_invoke_cold_1();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", kFMDErrorDomain, 13, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, void *, _QWORD))(v4 + 16))(v4, v3, 0);

}

uint64_t __58__FMDFMIPManager_registerDeviceForPairingLock_completion___block_invoke_147(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (void)updatePairingLockInfo:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  LogCategory_Unspecified();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "-[FMDFMIPManager updatePairingLockInfo:completion:]";
    _os_log_impl(&dword_1C9939000, v7, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  fmdFMIPLastOperationResult = 0;
  +[FMNSXPCConnectionCache sharedCache](FMNSXPCConnectionCache, "sharedCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[FMNSXPCConnectionConfiguration fmipConfiguration](FMNSXPCConnectionConfiguration, "fmipConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resumeConnectionWithConfiguration:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __51__FMDFMIPManager_updatePairingLockInfo_completion___block_invoke;
  v19[3] = &unk_1E829C100;
  v12 = v5;
  v20 = v12;
  objc_msgSend(v10, "addFailureBlock:", v19);
  objc_msgSend(v10, "remoteObjectProxy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __51__FMDFMIPManager_updatePairingLockInfo_completion___block_invoke_149;
  v16[3] = &unk_1E829C380;
  v17 = v10;
  v18 = v12;
  v14 = v10;
  v15 = v12;
  objc_msgSend(v13, "updatePairingLockInfo:completion:", v6, v16);

}

void __51__FMDFMIPManager_updatePairingLockInfo_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;

  LogCategory_Unspecified();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __51__FMDFMIPManager_updatePairingLockInfo_completion___block_invoke_cold_1();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", kFMDErrorDomain, 13, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);

}

uint64_t __51__FMDFMIPManager_updatePairingLockInfo_completion___block_invoke_149(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (void)pairingCheckWith:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  LogCategory_Unspecified();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "-[FMDFMIPManager pairingCheckWith:completion:]";
    _os_log_impl(&dword_1C9939000, v7, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  fmdFMIPLastOperationResult = 0;
  +[FMNSXPCConnectionCache sharedCache](FMNSXPCConnectionCache, "sharedCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[FMNSXPCConnectionConfiguration fmipConfiguration](FMNSXPCConnectionConfiguration, "fmipConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resumeConnectionWithConfiguration:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __46__FMDFMIPManager_pairingCheckWith_completion___block_invoke;
  v19[3] = &unk_1E829C100;
  v12 = v5;
  v20 = v12;
  objc_msgSend(v10, "addFailureBlock:", v19);
  objc_msgSend(v10, "remoteObjectProxy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __46__FMDFMIPManager_pairingCheckWith_completion___block_invoke_150;
  v16[3] = &unk_1E829C698;
  v17 = v10;
  v18 = v12;
  v14 = v10;
  v15 = v12;
  objc_msgSend(v13, "pairingCheckWith:completion:", v6, v16);

}

void __46__FMDFMIPManager_pairingCheckWith_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;

  LogCategory_Unspecified();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __46__FMDFMIPManager_pairingCheckWith_completion___block_invoke_cold_1();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", kFMDErrorDomain, 13, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, void *, _QWORD))(v4 + 16))(v4, v3, 0);

}

uint64_t __46__FMDFMIPManager_pairingCheckWith_completion___block_invoke_150(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (void)_getAccessoriesWithFilter:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1CAA4547C]();
  LogCategory_Unspecified();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[FMDFMIPManager _getAccessoriesWithFilter:completion:]";
    _os_log_impl(&dword_1C9939000, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  fmdFMIPLastOperationResult = 0;
  +[FMNSXPCConnectionCache sharedCache](FMNSXPCConnectionCache, "sharedCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FMNSXPCConnectionConfiguration fmipConfiguration](FMNSXPCConnectionConfiguration, "fmipConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resumeConnectionWithConfiguration:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __55__FMDFMIPManager__getAccessoriesWithFilter_completion___block_invoke;
  v22[3] = &unk_1E829C100;
  v13 = v6;
  v23 = v13;
  objc_msgSend(v11, "addFailureBlock:", v22);
  objc_msgSend(v11, "remoteObjectProxy");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = __55__FMDFMIPManager__getAccessoriesWithFilter_completion___block_invoke_152;
  v18[3] = &unk_1E829C6C0;
  v15 = v5;
  v20 = v15;
  v16 = v13;
  v21 = v16;
  v19 = v11;
  v17 = v11;
  objc_msgSend(v14, "getAccessoriesWithCompletion:", v18);

  objc_autoreleasePoolPop(v7);
}

void __55__FMDFMIPManager__getAccessoriesWithFilter_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;

  LogCategory_Unspecified();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __55__FMDFMIPManager__getAccessoriesWithFilter_completion___block_invoke_cold_1();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", kFMDErrorDomain, 13, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, void *, _QWORD))(v4 + 16))(v4, v3, MEMORY[0x1E0C9AA60]);

}

void __55__FMDFMIPManager__getAccessoriesWithFilter_completion___block_invoke_152(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  LogCategory_Unspecified();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __55__FMDFMIPManager__getAccessoriesWithFilter_completion___block_invoke_152_cold_1();
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v6;
    _os_log_impl(&dword_1C9939000, v8, OS_LOG_TYPE_DEFAULT, "Accessories %@", (uint8_t *)&v11, 0xCu);
  }

  objc_msgSend(v6, "fm_filter:", *(_QWORD *)(a1 + 40));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1 + 48);
  if (v10)
    (*(void (**)(uint64_t, id, void *))(v10 + 16))(v10, v5, v9);
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

- (void)_forceFMWUpgradeAlertWithCompletion:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1CAA4547C]();
  LogCategory_Unspecified();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[FMDFMIPManager _forceFMWUpgradeAlertWithCompletion:]";
    _os_log_impl(&dword_1C9939000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  fmdFMIPLastOperationResult = 0;
  +[FMNSXPCConnectionCache sharedCache](FMNSXPCConnectionCache, "sharedCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[FMNSXPCConnectionConfiguration fmipConfiguration](FMNSXPCConnectionConfiguration, "fmipConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resumeConnectionWithConfiguration:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addFailureBlock:", &__block_literal_global_153);
  objc_msgSend(v8, "remoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __54__FMDFMIPManager__forceFMWUpgradeAlertWithCompletion___block_invoke_154;
  v12[3] = &unk_1E829C380;
  v10 = v3;
  v13 = v8;
  v14 = v10;
  v11 = v8;
  objc_msgSend(v9, "_forceFMWUpgradeAlertUsingCallback:", v12);

  objc_autoreleasePoolPop(v4);
}

void __54__FMDFMIPManager__forceFMWUpgradeAlertWithCompletion___block_invoke()
{
  NSObject *v0;

  LogCategory_Unspecified();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __54__FMDFMIPManager__forceFMWUpgradeAlertWithCompletion___block_invoke_cold_1();

}

uint64_t __54__FMDFMIPManager__forceFMWUpgradeAlertWithCompletion___block_invoke_154(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (void)_stopAlarm
{
  NSObject *v2;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint8_t v4[16];

  LogCategory_Unspecified();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1C9939000, v2, OS_LOG_TYPE_DEFAULT, "Exiting Lost Mode, request to stop the Play Sound.", v4, 2u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.icloud.fmip.lostmode.stopAlarm"), 0, 0, 1u);
}

- (id)newErrorForCode:(int)a3 message:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  __CFString *v8;
  void *v9;
  void *v10;

  v5 = (objc_class *)MEMORY[0x1E0CB35C8];
  v6 = a4;
  v7 = [v5 alloc];
  v8 = kFMDErrorDomain;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v6, *MEMORY[0x1E0CB2D68]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(v7, "initWithDomain:code:userInfo:", v8, a3, v9);
  return v10;
}

- (BOOL)_isRunningAsMobileUser
{
  uid_t v2;
  passwd *v3;
  unsigned int pw_uid;
  NSObject *v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  const __CFString *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = geteuid();
  v3 = getpwnam((const char *)objc_msgSend(CFSTR("mobile"), "cStringUsingEncoding:", 4));
  if (v3)
    pw_uid = v3->pw_uid;
  else
    pw_uid = 501;
  if (v2 != pw_uid)
  {
    fmdFMIPLastOperationResult = 10;
    LogCategory_Unspecified();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = 134218498;
      v8 = v2;
      v9 = 2112;
      v10 = CFSTR("mobile");
      v11 = 2048;
      v12 = pw_uid;
      _os_log_error_impl(&dword_1C9939000, v5, OS_LOG_TYPE_ERROR, "Called from unsupported user (%lu). This can only be called from user %@(%lu)", (uint8_t *)&v7, 0x20u);
    }

  }
  return v2 == pw_uid;
}

- (void)_updateManagedLostModeWithInfo:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;

  v5 = a4;
  v6 = a3;
  +[FMNSXPCConnectionCache sharedCache](FMNSXPCConnectionCache, "sharedCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[FMNSXPCConnectionConfiguration helperConfiguration](FMNSXPCConnectionConfiguration, "helperConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resumeConnectionWithConfiguration:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __60__FMDFMIPManager__updateManagedLostModeWithInfo_completion___block_invoke;
  v18[3] = &unk_1E829C100;
  v11 = v5;
  v19 = v11;
  objc_msgSend(v9, "addFailureBlock:", v18);
  objc_msgSend(v9, "remoteObjectProxy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __60__FMDFMIPManager__updateManagedLostModeWithInfo_completion___block_invoke_155;
  v15[3] = &unk_1E829C380;
  v16 = v9;
  v17 = v11;
  v13 = v9;
  v14 = v11;
  objc_msgSend(v12, "updateManagedLostModeInfo:completion:", v6, v15);

}

void __60__FMDFMIPManager__updateManagedLostModeWithInfo_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;

  LogCategory_Unspecified();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __60__FMDFMIPManager__updateManagedLostModeWithInfo_completion___block_invoke_cold_1();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", kFMDErrorDomain, 13, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);

}

void __60__FMDFMIPManager__updateManagedLostModeWithInfo_completion___block_invoke_155(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint8_t v7[16];

  v3 = a2;
  LogCategory_Unspecified();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __60__FMDFMIPManager__updateManagedLostModeWithInfo_completion___block_invoke_155_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1C9939000, v5, OS_LOG_TYPE_DEFAULT, "updateManagedLostModeInfo completed", v7, 2u);
  }

  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

- (void)_updateNeedsLocateAckLostModeWithInfo:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;

  v5 = a4;
  v6 = a3;
  +[FMNSXPCConnectionCache sharedCache](FMNSXPCConnectionCache, "sharedCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[FMNSXPCConnectionConfiguration helperConfiguration](FMNSXPCConnectionConfiguration, "helperConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resumeConnectionWithConfiguration:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __67__FMDFMIPManager__updateNeedsLocateAckLostModeWithInfo_completion___block_invoke;
  v18[3] = &unk_1E829C100;
  v11 = v5;
  v19 = v11;
  objc_msgSend(v9, "addFailureBlock:", v18);
  objc_msgSend(v9, "remoteObjectProxy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __67__FMDFMIPManager__updateNeedsLocateAckLostModeWithInfo_completion___block_invoke_156;
  v15[3] = &unk_1E829C380;
  v16 = v9;
  v17 = v11;
  v13 = v9;
  v14 = v11;
  objc_msgSend(v12, "updateNeedsLocateAckLostModeInfo:completion:", v6, v15);

}

void __67__FMDFMIPManager__updateNeedsLocateAckLostModeWithInfo_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;

  LogCategory_Unspecified();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __67__FMDFMIPManager__updateNeedsLocateAckLostModeWithInfo_completion___block_invoke_cold_1();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", kFMDErrorDomain, 13, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);

}

void __67__FMDFMIPManager__updateNeedsLocateAckLostModeWithInfo_completion___block_invoke_156(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint8_t v7[16];

  v3 = a2;
  LogCategory_Unspecified();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __67__FMDFMIPManager__updateNeedsLocateAckLostModeWithInfo_completion___block_invoke_156_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1C9939000, v5, OS_LOG_TYPE_DEFAULT, "updateNeedsLocateAckLostModeInfo completed", v7, 2u);
  }

  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

- (void)_initiateLostModeExitAuthForIDSDeviceID:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;

  v5 = a4;
  fmdFMIPLastOperationResult = 0;
  v6 = a3;
  +[FMNSXPCConnectionCache sharedCache](FMNSXPCConnectionCache, "sharedCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[FMNSXPCConnectionConfiguration fmipConfiguration](FMNSXPCConnectionConfiguration, "fmipConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resumeConnectionWithConfiguration:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __73__FMDFMIPManager__initiateLostModeExitAuthForIDSDeviceID_withCompletion___block_invoke;
  v21[3] = &unk_1E829C100;
  v11 = v5;
  v22 = v11;
  objc_msgSend(v9, "addFailureBlock:", v21);
  objc_msgSend(v9, "remoteObjectProxy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = v10;
  v18[1] = 3221225472;
  v18[2] = __73__FMDFMIPManager__initiateLostModeExitAuthForIDSDeviceID_withCompletion___block_invoke_158;
  v18[3] = &unk_1E829C380;
  v19 = v9;
  v20 = v11;
  v15 = v9;
  v16 = v11;
  v17 = (void *)MEMORY[0x1CAA455C0](v18);
  objc_msgSend(v12, "initiateLostModeExitAuthForApp:idsDeviceID:usingCallback:", v14, v6, v17);

}

void __73__FMDFMIPManager__initiateLostModeExitAuthForIDSDeviceID_withCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;

  LogCategory_Unspecified();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __73__FMDFMIPManager__initiateLostModeExitAuthForIDSDeviceID_withCompletion___block_invoke_cold_1();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", kFMDErrorDomain, 13, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);

}

void __73__FMDFMIPManager__initiateLostModeExitAuthForIDSDeviceID_withCompletion___block_invoke_158(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  LogCategory_Unspecified();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_1C9939000, v4, OS_LOG_TYPE_DEFAULT, "initiateLostModeExitAuth completed. Error : %@", (uint8_t *)&v6, 0xCu);
  }

  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

- (void)_disableFMIPUsingToken:(id)a3 inContext:(unint64_t)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  NSObject *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[16];

  v7 = a3;
  v8 = a5;
  v9 = (void *)MEMORY[0x1CAA4547C]();
  fmdFMIPLastOperationResult = 0;
  LogCategory_Unspecified();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9939000, v10, OS_LOG_TYPE_DEFAULT, "Disabling FMIP...", buf, 2u);
  }

  if (objc_msgSend(v7, "length"))
  {
    +[FMNSXPCConnectionCache sharedCache](FMNSXPCConnectionCache, "sharedCache");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[FMNSXPCConnectionConfiguration fmipConfiguration](FMNSXPCConnectionConfiguration, "fmipConfiguration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "resumeConnectionWithConfiguration:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __62__FMDFMIPManager__disableFMIPUsingToken_inContext_completion___block_invoke;
    v22[3] = &unk_1E829C100;
    v15 = v8;
    v23 = v15;
    objc_msgSend(v13, "addFailureBlock:", v22);
    objc_msgSend(v13, "remoteObjectProxy");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v14;
    v19[1] = 3221225472;
    v19[2] = __62__FMDFMIPManager__disableFMIPUsingToken_inContext_completion___block_invoke_159;
    v19[3] = &unk_1E829C380;
    v20 = v13;
    v21 = v15;
    v17 = v13;
    objc_msgSend(v16, "disableFMIPUsingToken:inContext:usingCallback:", v7, a4, v19);

  }
  else
  {
    LogCategory_Unspecified();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[FMDFMIPManager _disableFMIPUsingToken:inContext:completion:].cold.1(v18);

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", kFMDErrorDomain, 1, 0);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (v8)
      (*((void (**)(id, id))v8 + 2))(v8, v17);
  }

  objc_autoreleasePoolPop(v9);
}

void __62__FMDFMIPManager__disableFMIPUsingToken_inContext_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;

  LogCategory_Unspecified();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __62__FMDFMIPManager__disableFMIPUsingToken_inContext_completion___block_invoke_cold_1();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", kFMDErrorDomain, 13, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);

}

void __62__FMDFMIPManager__disableFMIPUsingToken_inContext_completion___block_invoke_159(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  if (v3)
  {
    LogCategory_Unspecified();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __62__FMDFMIPManager__disableFMIPUsingToken_inContext_completion___block_invoke_159_cold_1();

  }
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

- (id)getManagedLostModeFileURL
{
  NSObject *serialQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__FMDFMIPManager_getManagedLostModeFileURL__block_invoke;
  v5[3] = &unk_1E829C6E8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __43__FMDFMIPManager_getManagedLostModeFileURL__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  LogCategory_Unspecified();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __43__FMDFMIPManager_getManagedLostModeFileURL__block_invoke_cold_1(a1, v2);

  objc_msgSend(*(id *)(a1 + 32), "managedLostModeFileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0D20210]);
    v5 = (void *)objc_msgSend(v4, "initWithIdentifier:", FMDManagedSystemGroupContainerIdentifier);
    objc_msgSend(v5, "url");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fm_preferencesPathURLForDomain:", kFMDManagedLostModePrefDomain);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setManagedLostModeFileURL:", v7);

  }
  objc_msgSend(*(id *)(a1 + 32), "managedLostModeFileURL");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

- (id)getNeedsLocateAckLostModeFileURL
{
  NSObject *serialQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__FMDFMIPManager_getNeedsLocateAckLostModeFileURL__block_invoke;
  v5[3] = &unk_1E829C6E8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __50__FMDFMIPManager_getNeedsLocateAckLostModeFileURL__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  LogCategory_Unspecified();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __50__FMDFMIPManager_getNeedsLocateAckLostModeFileURL__block_invoke_cold_1(a1, v2);

  objc_msgSend(*(id *)(a1 + 32), "needsLocateAckLostModeFileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0D20210]);
    v5 = (void *)objc_msgSend(v4, "initWithIdentifier:", FMDManagedSystemGroupContainerIdentifier);
    objc_msgSend(v5, "url");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fm_preferencesPathURLForDomain:", kFMDNeedsLocateAckLostModePrefDomain);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setNeedsLocateAckLostModeFileURL:", v7);

  }
  objc_msgSend(*(id *)(a1 + 32), "needsLocateAckLostModeFileURL");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

- (void)playSoundWithMessage:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  +[FMNSXPCConnectionCache sharedCache](FMNSXPCConnectionCache, "sharedCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[FMNSXPCConnectionConfiguration helperConfiguration](FMNSXPCConnectionConfiguration, "helperConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resumeConnectionWithConfiguration:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __50__FMDFMIPManager_playSoundWithMessage_completion___block_invoke;
  v20[3] = &unk_1E829C100;
  v11 = v6;
  v21 = v11;
  objc_msgSend(v9, "addFailureBlock:", v20);
  objc_msgSend(v9, "remoteObjectProxy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LogCategory_Unspecified();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = objc_opt_class();
    *(_DWORD *)buf = 138412290;
    v23 = v14;
    _os_log_impl(&dword_1C9939000, v13, OS_LOG_TYPE_DEFAULT, "message %@", buf, 0xCu);
  }

  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __50__FMDFMIPManager_playSoundWithMessage_completion___block_invoke_161;
  v17[3] = &unk_1E829C380;
  v18 = v9;
  v19 = v11;
  v15 = v9;
  v16 = v11;
  objc_msgSend(v12, "startPlayingSoundForMessage:completion:", v5, v17);

}

void __50__FMDFMIPManager_playSoundWithMessage_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;

  LogCategory_Unspecified();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __50__FMDFMIPManager_playSoundWithMessage_completion___block_invoke_cold_1();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", kFMDErrorDomain, 13, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);

}

void __50__FMDFMIPManager_playSoundWithMessage_completion___block_invoke_161(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint8_t v7[16];

  v3 = a2;
  LogCategory_Unspecified();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __50__FMDFMIPManager_playSoundWithMessage_completion___block_invoke_161_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1C9939000, v5, OS_LOG_TYPE_DEFAULT, "playSoundWithMessage sound started", v7, 2u);
  }

  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

- (void)stopSoundMessageWithCompletion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[8];
  _QWORD v17[4];
  id v18;

  v3 = a3;
  +[FMNSXPCConnectionCache sharedCache](FMNSXPCConnectionCache, "sharedCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[FMNSXPCConnectionConfiguration helperConfiguration](FMNSXPCConnectionConfiguration, "helperConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resumeConnectionWithConfiguration:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __49__FMDFMIPManager_stopSoundMessageWithCompletion___block_invoke;
  v17[3] = &unk_1E829C100;
  v8 = v3;
  v18 = v8;
  objc_msgSend(v6, "addFailureBlock:", v17);
  objc_msgSend(v6, "remoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LogCategory_Unspecified();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9939000, v10, OS_LOG_TYPE_DEFAULT, "stop message sound", buf, 2u);
  }

  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __49__FMDFMIPManager_stopSoundMessageWithCompletion___block_invoke_162;
  v13[3] = &unk_1E829C380;
  v14 = v6;
  v15 = v8;
  v11 = v6;
  v12 = v8;
  objc_msgSend(v9, "stopSoundMessageWithCompletion:", v13);

}

void __49__FMDFMIPManager_stopSoundMessageWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;

  LogCategory_Unspecified();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __49__FMDFMIPManager_stopSoundMessageWithCompletion___block_invoke_cold_1();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", kFMDErrorDomain, 13, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);

}

void __49__FMDFMIPManager_stopSoundMessageWithCompletion___block_invoke_162(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint8_t v7[16];

  v3 = a2;
  LogCategory_Unspecified();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __49__FMDFMIPManager_stopSoundMessageWithCompletion___block_invoke_162_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1C9939000, v5, OS_LOG_TYPE_DEFAULT, "stopSoundMessageWithCompletion sound stopped", v7, 2u);
  }

  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

- (void)deviceEligibleForRepairWithContext:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v5 = a4;
  v6 = a3;
  +[FMNSXPCConnectionCache sharedCache](FMNSXPCConnectionCache, "sharedCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[FMNSXPCConnectionConfiguration fmipConfiguration](FMNSXPCConnectionConfiguration, "fmipConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resumeConnectionWithConfiguration:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __64__FMDFMIPManager_deviceEligibleForRepairWithContext_completion___block_invoke;
  v12[3] = &unk_1E829C100;
  v13 = v5;
  v10 = v5;
  objc_msgSend(v9, "addFailureBlock:", v12);
  objc_msgSend(v9, "remoteObjectProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "deviceEligibleForRepairWithContext:completion:", v6, v10);

}

void __64__FMDFMIPManager_deviceEligibleForRepairWithContext_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;

  LogCategory_Unspecified();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __64__FMDFMIPManager_deviceEligibleForRepairWithContext_completion___block_invoke_cold_1();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", kFMDErrorDomain, 13, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v3);

}

- (void)enableRepairWithContext:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v5 = a4;
  v6 = a3;
  +[FMNSXPCConnectionCache sharedCache](FMNSXPCConnectionCache, "sharedCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[FMNSXPCConnectionConfiguration fmipConfiguration](FMNSXPCConnectionConfiguration, "fmipConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resumeConnectionWithConfiguration:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __53__FMDFMIPManager_enableRepairWithContext_completion___block_invoke;
  v12[3] = &unk_1E829C100;
  v13 = v5;
  v10 = v5;
  objc_msgSend(v9, "addFailureBlock:", v12);
  objc_msgSend(v9, "remoteObjectProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "enableRepairWithContext:completion:", v6, v10);

}

void __53__FMDFMIPManager_enableRepairWithContext_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;

  LogCategory_Unspecified();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __53__FMDFMIPManager_enableRepairWithContext_completion___block_invoke_cold_1();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", kFMDErrorDomain, 13, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v3);

}

- (void)activationLockInfoFromDeviceWithCompletion:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[16];

  v3 = a3;
  LogCategory_Unspecified();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9939000, v4, OS_LOG_TYPE_DEFAULT, "Framework API: activationLockInfoWithCompletion", buf, 2u);
  }

  +[FMNSXPCConnectionCache sharedCache](FMNSXPCConnectionCache, "sharedCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[FMNSXPCConnectionConfiguration fmipConfiguration](FMNSXPCConnectionConfiguration, "fmipConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resumeConnectionWithConfiguration:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61__FMDFMIPManager_activationLockInfoFromDeviceWithCompletion___block_invoke;
  v10[3] = &unk_1E829C100;
  v11 = v3;
  v8 = v3;
  objc_msgSend(v7, "addFailureBlock:", v10);
  objc_msgSend(v7, "remoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "activationLockInfoFromDeviceWithCompletion:", v8);

}

void __61__FMDFMIPManager_activationLockInfoFromDeviceWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;

  LogCategory_Unspecified();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __61__FMDFMIPManager_activationLockInfoFromDeviceWithCompletion___block_invoke_cold_1();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", kFMDErrorDomain, 13, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v3);

}

- (void)storeOfflineFindingInfo:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v5 = a4;
  v6 = a3;
  +[FMNSXPCConnectionCache sharedCache](FMNSXPCConnectionCache, "sharedCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[FMNSXPCConnectionConfiguration fmipConfiguration](FMNSXPCConnectionConfiguration, "fmipConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resumeConnectionWithConfiguration:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __53__FMDFMIPManager_storeOfflineFindingInfo_completion___block_invoke;
  v12[3] = &unk_1E829C100;
  v13 = v5;
  v10 = v5;
  objc_msgSend(v9, "addFailureBlock:", v12);
  objc_msgSend(v9, "remoteObjectProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "storeOfflineFindingInfo:completion:", v6, v10);

}

void __53__FMDFMIPManager_storeOfflineFindingInfo_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;

  LogCategory_Unspecified();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __53__FMDFMIPManager_storeOfflineFindingInfo_completion___block_invoke_cold_1();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", kFMDErrorDomain, 13, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);

}

- (void)fetchOfflineFindingInfoWithCompletion:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[16];

  v3 = a3;
  LogCategory_Unspecified();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9939000, v4, OS_LOG_TYPE_DEFAULT, "Framework API: fetchOfflineFindingInfoWithCompletion", buf, 2u);
  }

  +[FMNSXPCConnectionCache sharedCache](FMNSXPCConnectionCache, "sharedCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[FMNSXPCConnectionConfiguration fmipConfiguration](FMNSXPCConnectionConfiguration, "fmipConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resumeConnectionWithConfiguration:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__FMDFMIPManager_fetchOfflineFindingInfoWithCompletion___block_invoke;
  v10[3] = &unk_1E829C100;
  v11 = v3;
  v8 = v3;
  objc_msgSend(v7, "addFailureBlock:", v10);
  objc_msgSend(v7, "remoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fetchOfflineFindingInfoWithCompletion:", v8);

}

void __56__FMDFMIPManager_fetchOfflineFindingInfoWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;

  LogCategory_Unspecified();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __56__FMDFMIPManager_fetchOfflineFindingInfoWithCompletion___block_invoke_cold_1();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", kFMDErrorDomain, 13, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v3);

}

- (void)clearOfflineFindingInfoWithCompletion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  +[FMNSXPCConnectionCache sharedCache](FMNSXPCConnectionCache, "sharedCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[FMNSXPCConnectionConfiguration fmipConfiguration](FMNSXPCConnectionConfiguration, "fmipConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resumeConnectionWithConfiguration:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__FMDFMIPManager_clearOfflineFindingInfoWithCompletion___block_invoke;
  v9[3] = &unk_1E829C100;
  v10 = v3;
  v7 = v3;
  objc_msgSend(v6, "addFailureBlock:", v9);
  objc_msgSend(v6, "remoteObjectProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clearOfflineFindingInfoWithCompletion:", v7);

}

void __56__FMDFMIPManager_clearOfflineFindingInfoWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;

  LogCategory_Unspecified();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __56__FMDFMIPManager_clearOfflineFindingInfoWithCompletion___block_invoke_cold_1();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", kFMDErrorDomain, 13, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);

}

- (void)activationLockAuthInfoWithCompletion:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[16];

  v3 = a3;
  LogCategory_Unspecified();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9939000, v4, OS_LOG_TYPE_DEFAULT, "Framework API: activationLockAuthInfo", buf, 2u);
  }

  +[FMNSXPCConnectionCache sharedCache](FMNSXPCConnectionCache, "sharedCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[FMNSXPCConnectionConfiguration fmipConfiguration](FMNSXPCConnectionConfiguration, "fmipConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resumeConnectionWithConfiguration:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __55__FMDFMIPManager_activationLockAuthInfoWithCompletion___block_invoke;
  v10[3] = &unk_1E829C100;
  v11 = v3;
  v8 = v3;
  objc_msgSend(v7, "addFailureBlock:", v10);
  objc_msgSend(v7, "remoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "activationLockAuthInfoWithCompletion:", v8);

}

void __55__FMDFMIPManager_activationLockAuthInfoWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;

  LogCategory_Unspecified();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __61__FMDFMIPManager_activationLockInfoFromDeviceWithCompletion___block_invoke_cold_1();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", kFMDErrorDomain, 13, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v3);

}

- (void)fetchAPNSTokenWithCompletion:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[16];

  v3 = a3;
  LogCategory_Unspecified();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9939000, v4, OS_LOG_TYPE_DEFAULT, "Framework: fetchAPNSTokenWithCompletion", buf, 2u);
  }

  +[FMNSXPCConnectionCache sharedCache](FMNSXPCConnectionCache, "sharedCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[FMNSXPCConnectionConfiguration fmipConfiguration](FMNSXPCConnectionConfiguration, "fmipConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resumeConnectionWithConfiguration:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __47__FMDFMIPManager_fetchAPNSTokenWithCompletion___block_invoke;
  v10[3] = &unk_1E829C100;
  v11 = v3;
  v8 = v3;
  objc_msgSend(v7, "addFailureBlock:", v10);
  objc_msgSend(v7, "remoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fetchAPNSTokenWithCompletion:", v8);

}

void __47__FMDFMIPManager_fetchAPNSTokenWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;

  LogCategory_Unspecified();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __47__FMDFMIPManager_fetchAPNSTokenWithCompletion___block_invoke_cold_1();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", kFMDErrorDomain, 13, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v3);

}

- (void)startLocationMonitoring:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[16];

  v3 = a3;
  LogCategory_SecureLocations();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9939000, v4, OS_LOG_TYPE_DEFAULT, "Framework: startLocationMonitoring", buf, 2u);
  }

  +[FMNSXPCConnectionCache sharedCache](FMNSXPCConnectionCache, "sharedCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[FMNSXPCConnectionConfiguration fmipConfiguration](FMNSXPCConnectionConfiguration, "fmipConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resumeConnectionWithConfiguration:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __42__FMDFMIPManager_startLocationMonitoring___block_invoke;
  v10[3] = &unk_1E829C100;
  v11 = v3;
  v8 = v3;
  objc_msgSend(v7, "addFailureBlock:", v10);
  objc_msgSend(v7, "remoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "startLocationMonitoring:", v8);

}

void __42__FMDFMIPManager_startLocationMonitoring___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;

  LogCategory_SecureLocations();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __42__FMDFMIPManager_startLocationMonitoring___block_invoke_cold_1();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", kFMDErrorDomain, 13, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);

}

- (void)stopLocationMonitoring:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[16];

  v3 = a3;
  LogCategory_SecureLocations();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9939000, v4, OS_LOG_TYPE_DEFAULT, "Framework: stopLocationMonitoring", buf, 2u);
  }

  +[FMNSXPCConnectionCache sharedCache](FMNSXPCConnectionCache, "sharedCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[FMNSXPCConnectionConfiguration fmipConfiguration](FMNSXPCConnectionConfiguration, "fmipConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resumeConnectionWithConfiguration:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __41__FMDFMIPManager_stopLocationMonitoring___block_invoke;
  v10[3] = &unk_1E829C100;
  v11 = v3;
  v8 = v3;
  objc_msgSend(v7, "addFailureBlock:", v10);
  objc_msgSend(v7, "remoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stopLocationMonitoring:", v8);

}

void __41__FMDFMIPManager_stopLocationMonitoring___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;

  LogCategory_SecureLocations();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __41__FMDFMIPManager_stopLocationMonitoring___block_invoke_cold_1();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", kFMDErrorDomain, 13, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);

}

- (void)updatedConfigReceived:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[16];

  v5 = a4;
  v6 = a3;
  LogCategory_SecureLocations();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9939000, v7, OS_LOG_TYPE_DEFAULT, "Framework: updatedConfigReceived", buf, 2u);
  }

  +[FMNSXPCConnectionCache sharedCache](FMNSXPCConnectionCache, "sharedCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[FMNSXPCConnectionConfiguration fmipConfiguration](FMNSXPCConnectionConfiguration, "fmipConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resumeConnectionWithConfiguration:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __51__FMDFMIPManager_updatedConfigReceived_completion___block_invoke;
  v13[3] = &unk_1E829C100;
  v14 = v5;
  v11 = v5;
  objc_msgSend(v10, "addFailureBlock:", v13);
  objc_msgSend(v10, "remoteObjectProxy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "updatedConfigReceived:completion:", v6, v11);

}

void __51__FMDFMIPManager_updatedConfigReceived_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;

  LogCategory_SecureLocations();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __51__FMDFMIPManager_updatedConfigReceived_completion___block_invoke_cold_1();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", kFMDErrorDomain, 13, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);

}

- (void)startLocationMonitoringWithContext:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  LogCategory_SecureLocations();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v5;
    _os_log_impl(&dword_1C9939000, v7, OS_LOG_TYPE_DEFAULT, "Framework: startLocationMonitoringWith %@", buf, 0xCu);
  }

  +[FMNSXPCConnectionCache sharedCache](FMNSXPCConnectionCache, "sharedCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[FMNSXPCConnectionConfiguration fmipConfiguration](FMNSXPCConnectionConfiguration, "fmipConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resumeConnectionWithConfiguration:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64__FMDFMIPManager_startLocationMonitoringWithContext_completion___block_invoke;
  v13[3] = &unk_1E829C100;
  v14 = v6;
  v11 = v6;
  objc_msgSend(v10, "addFailureBlock:", v13);
  objc_msgSend(v10, "remoteObjectProxy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "startLocationMonitoringWithContext:completion:", v5, v11);

}

void __64__FMDFMIPManager_startLocationMonitoringWithContext_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;

  LogCategory_SecureLocations();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __64__FMDFMIPManager_startLocationMonitoringWithContext_completion___block_invoke_cold_1();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", kFMDErrorDomain, 13, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);

}

- (void)startLocationMonitoringWithContext:(id)a3 forcePublish:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  _BOOL4 v20;
  uint64_t v21;

  v6 = a4;
  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  LogCategory_SecureLocations();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v18 = v7;
    v19 = 1024;
    v20 = v6;
    _os_log_impl(&dword_1C9939000, v9, OS_LOG_TYPE_DEFAULT, "Framework: startLocationMonitoringWith %@ forcePublish %d", buf, 0x12u);
  }

  +[FMNSXPCConnectionCache sharedCache](FMNSXPCConnectionCache, "sharedCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[FMNSXPCConnectionConfiguration fmipConfiguration](FMNSXPCConnectionConfiguration, "fmipConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resumeConnectionWithConfiguration:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __77__FMDFMIPManager_startLocationMonitoringWithContext_forcePublish_completion___block_invoke;
  v15[3] = &unk_1E829C100;
  v16 = v8;
  v13 = v8;
  objc_msgSend(v12, "addFailureBlock:", v15);
  objc_msgSend(v12, "remoteObjectProxy");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "startLocationMonitoringWithContext:forcePublish:completion:", v7, v6, v13);

}

void __77__FMDFMIPManager_startLocationMonitoringWithContext_forcePublish_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;

  LogCategory_SecureLocations();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __64__FMDFMIPManager_startLocationMonitoringWithContext_completion___block_invoke_cold_1();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", kFMDErrorDomain, 13, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);

}

- (void)stopLocationMonitoringWithContext:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  LogCategory_SecureLocations();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v5;
    _os_log_impl(&dword_1C9939000, v7, OS_LOG_TYPE_DEFAULT, "Framework: stopLocationMonitoringWith %@", buf, 0xCu);
  }

  +[FMNSXPCConnectionCache sharedCache](FMNSXPCConnectionCache, "sharedCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[FMNSXPCConnectionConfiguration fmipConfiguration](FMNSXPCConnectionConfiguration, "fmipConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resumeConnectionWithConfiguration:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __63__FMDFMIPManager_stopLocationMonitoringWithContext_completion___block_invoke;
  v13[3] = &unk_1E829C100;
  v14 = v6;
  v11 = v6;
  objc_msgSend(v10, "addFailureBlock:", v13);
  objc_msgSend(v10, "remoteObjectProxy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stopLocationMonitoringWithContext:completion:", v5, v11);

}

void __63__FMDFMIPManager_stopLocationMonitoringWithContext_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;

  LogCategory_SecureLocations();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __63__FMDFMIPManager_stopLocationMonitoringWithContext_completion___block_invoke_cold_1();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", kFMDErrorDomain, 13, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);

}

- (void)startLocationMonitoringWithOptions:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  FMDSecureLocationContext *v10;

  v6 = a4;
  v7 = a3;
  v10 = objc_alloc_init(FMDSecureLocationContext);
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("mode"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMDSecureLocationContext setMode:](v10, "setMode:", v8);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("findMyId"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[FMDSecureLocationContext setFindMyId:](v10, "setFindMyId:", v9);
  -[FMDFMIPManager startLocationMonitoringWithContext:completion:](self, "startLocationMonitoringWithContext:completion:", v10, v6);

}

- (void)stopLocationMonitoringWithOptions:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  FMDSecureLocationContext *v10;

  v6 = a4;
  v7 = a3;
  v10 = objc_alloc_init(FMDSecureLocationContext);
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("mode"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMDSecureLocationContext setMode:](v10, "setMode:", v8);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("findMyId"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[FMDSecureLocationContext setFindMyId:](v10, "setFindMyId:", v9);
  -[FMDFMIPManager stopLocationMonitoringWithContext:completion:](self, "stopLocationMonitoringWithContext:completion:", v10, v6);

}

- (void)didAddLocalFindableAccessory:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[16];

  v5 = a4;
  v6 = a3;
  LogCategory_SecureLocations();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9939000, v7, OS_LOG_TYPE_DEFAULT, "Framework: didAddLocalFindableAccessory", buf, 2u);
  }

  +[FMNSXPCConnectionCache sharedCache](FMNSXPCConnectionCache, "sharedCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[FMNSXPCConnectionConfiguration fmipConfiguration](FMNSXPCConnectionConfiguration, "fmipConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resumeConnectionWithConfiguration:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __58__FMDFMIPManager_didAddLocalFindableAccessory_completion___block_invoke;
  v13[3] = &unk_1E829C100;
  v14 = v5;
  v11 = v5;
  objc_msgSend(v10, "addFailureBlock:", v13);
  objc_msgSend(v10, "remoteObjectProxy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "didAddLocalFindableAccessory:completion:", v6, v11);

}

void __58__FMDFMIPManager_didAddLocalFindableAccessory_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;

  LogCategory_SecureLocations();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __58__FMDFMIPManager_didAddLocalFindableAccessory_completion___block_invoke_cold_1();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", kFMDErrorDomain, 13, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);

}

- (void)didRemoveLocalFindableAccessory:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[16];

  v5 = a4;
  v6 = a3;
  LogCategory_SecureLocations();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9939000, v7, OS_LOG_TYPE_DEFAULT, "Framework: didRemoveLocalFindableAccessory", buf, 2u);
  }

  +[FMNSXPCConnectionCache sharedCache](FMNSXPCConnectionCache, "sharedCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[FMNSXPCConnectionConfiguration fmipConfiguration](FMNSXPCConnectionConfiguration, "fmipConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resumeConnectionWithConfiguration:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __61__FMDFMIPManager_didRemoveLocalFindableAccessory_completion___block_invoke;
  v13[3] = &unk_1E829C100;
  v14 = v5;
  v11 = v5;
  objc_msgSend(v10, "addFailureBlock:", v13);
  objc_msgSend(v10, "remoteObjectProxy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "didRemoveLocalFindableAccessory:completion:", v6, v11);

}

void __61__FMDFMIPManager_didRemoveLocalFindableAccessory_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;

  LogCategory_SecureLocations();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __61__FMDFMIPManager_didRemoveLocalFindableAccessory_completion___block_invoke_cold_1();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", kFMDErrorDomain, 13, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);

}

- (void)requireDisableLocationWithCompletion:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[16];

  v3 = a3;
  LogCategory_DisableLocationDisplay();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9939000, v4, OS_LOG_TYPE_DEFAULT, "Framework: requireDisableLocationWithCompletion", buf, 2u);
  }

  +[FMNSXPCConnectionCache sharedCache](FMNSXPCConnectionCache, "sharedCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[FMNSXPCConnectionConfiguration fmipConfiguration](FMNSXPCConnectionConfiguration, "fmipConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resumeConnectionWithConfiguration:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __55__FMDFMIPManager_requireDisableLocationWithCompletion___block_invoke;
  v10[3] = &unk_1E829C100;
  v11 = v3;
  v8 = v3;
  objc_msgSend(v7, "addFailureBlock:", v10);
  objc_msgSend(v7, "remoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "requireDisableLocationWithCompletion:", v8);

}

void __55__FMDFMIPManager_requireDisableLocationWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;

  LogCategory_DisableLocationDisplay();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __55__FMDFMIPManager_requireDisableLocationWithCompletion___block_invoke_cold_1();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", kFMDErrorDomain, 13, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, uint64_t, void *))(v4 + 16))(v4, -1, v3);

}

- (void)disableLocationDisplayWithCompletion:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[16];

  v3 = a3;
  LogCategory_DisableLocationDisplay();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9939000, v4, OS_LOG_TYPE_DEFAULT, "Framework: disableLocationDisplayWithCompletion", buf, 2u);
  }

  +[FMNSXPCConnectionCache sharedCache](FMNSXPCConnectionCache, "sharedCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[FMNSXPCConnectionConfiguration fmipConfiguration](FMNSXPCConnectionConfiguration, "fmipConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resumeConnectionWithConfiguration:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __55__FMDFMIPManager_disableLocationDisplayWithCompletion___block_invoke;
  v10[3] = &unk_1E829C100;
  v11 = v3;
  v8 = v3;
  objc_msgSend(v7, "addFailureBlock:", v10);
  objc_msgSend(v7, "remoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "disableLocationDisplayWithCompletion:", v8);

}

void __55__FMDFMIPManager_disableLocationDisplayWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;

  LogCategory_DisableLocationDisplay();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __55__FMDFMIPManager_disableLocationDisplayWithCompletion___block_invoke_cold_1();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", kFMDErrorDomain, 13, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);

}

- (NSURL)managedLostModeFileURL
{
  return self->_managedLostModeFileURL;
}

- (void)setManagedLostModeFileURL:(id)a3
{
  objc_storeStrong((id *)&self->_managedLostModeFileURL, a3);
}

- (NSURL)needsLocateAckLostModeFileURL
{
  return self->_needsLocateAckLostModeFileURL;
}

- (void)setNeedsLocateAckLostModeFileURL:(id)a3
{
  objc_storeStrong((id *)&self->_needsLocateAckLostModeFileURL, a3);
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_needsLocateAckLostModeFileURL, 0);
  objc_storeStrong((id *)&self->_managedLostModeFileURL, 0);
}

- (BOOL)_quickFetchFMIPEnabledstate
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "fileExistsAtPath:", CFSTR("/var/mobile/Library/Preferences/com.apple.icloud.findmydeviced.FMIPAccounts.plist"));

  return v3;
}

- (id)_postWipePrefPath
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;

  NSHomeDirectoryForUser(CFSTR("mobile"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v2, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fm_preferencesPathURLForDomain:", kFMDPostWipePrefDomain);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    LogCategory_Unspecified();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[FMDFMIPManager(Private) _postWipePrefPath].cold.1(v6);

    v5 = 0;
  }

  return v5;
}

- (void)disableBiometricIDForLostModeWithCompletion:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1CAA4547C]();
  LogCategory_Unspecified();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[FMDFMIPManager(Private) disableBiometricIDForLostModeWithCompletion:]";
    _os_log_impl(&dword_1C9939000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  fmdFMIPLastOperationResult = 0;
  +[FMNSXPCConnectionCache sharedCache](FMNSXPCConnectionCache, "sharedCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[FMNSXPCConnectionConfiguration helperConfiguration](FMNSXPCConnectionConfiguration, "helperConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resumeConnectionWithConfiguration:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __71__FMDFMIPManager_Private__disableBiometricIDForLostModeWithCompletion___block_invoke;
  v17[3] = &unk_1E829C100;
  v10 = v3;
  v18 = v10;
  objc_msgSend(v8, "addFailureBlock:", v17);
  objc_msgSend(v8, "remoteObjectProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __71__FMDFMIPManager_Private__disableBiometricIDForLostModeWithCompletion___block_invoke_6;
  v14[3] = &unk_1E829C380;
  v12 = v10;
  v15 = v8;
  v16 = v12;
  v13 = v8;
  objc_msgSend(v11, "disableBiometricIDWithCompletion:", v14);

  objc_autoreleasePoolPop(v4);
}

void __71__FMDFMIPManager_Private__disableBiometricIDForLostModeWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;

  LogCategory_Unspecified();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __71__FMDFMIPManager_Private__disableBiometricIDForLostModeWithCompletion___block_invoke_cold_1();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", kFMDErrorDomain, 13, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);

}

void __71__FMDFMIPManager_Private__disableBiometricIDForLostModeWithCompletion___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  LogCategory_Unspecified();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __71__FMDFMIPManager_Private__disableBiometricIDForLostModeWithCompletion___block_invoke_6_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[FMDFMIPManager(Private) disableBiometricIDForLostModeWithCompletion:]_block_invoke";
    _os_log_impl(&dword_1C9939000, v5, OS_LOG_TYPE_DEFAULT, "%s completed", (uint8_t *)&v7, 0xCu);
  }

  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

- (void)setDailyLocateReportEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1CAA4547C](self, a2);
  LogCategory_Unspecified();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315138;
    v11 = "-[FMDFMIPManager(Private) setDailyLocateReportEnabled:]";
    _os_log_impl(&dword_1C9939000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v10, 0xCu);
  }

  fmdFMIPLastOperationResult = 0;
  +[FMNSXPCConnectionCache sharedCache](FMNSXPCConnectionCache, "sharedCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[FMNSXPCConnectionConfiguration fmipConfiguration](FMNSXPCConnectionConfiguration, "fmipConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resumeConnectionWithConfiguration:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addFailureBlock:", &__block_literal_global_4);
  objc_msgSend(v8, "remoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDailyLocateReportEnabled:", v3);

  objc_autoreleasePoolPop(v4);
}

void __55__FMDFMIPManager_Private__setDailyLocateReportEnabled___block_invoke()
{
  NSObject *v0;

  LogCategory_Unspecified();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __55__FMDFMIPManager_Private__setDailyLocateReportEnabled___block_invoke_cold_1();

}

- (void)showDailyLocateReport
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1CAA4547C](self, a2);
  LogCategory_Unspecified();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[FMDFMIPManager(Private) showDailyLocateReport]";
    _os_log_impl(&dword_1C9939000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  fmdFMIPLastOperationResult = 0;
  +[FMNSXPCConnectionCache sharedCache](FMNSXPCConnectionCache, "sharedCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[FMNSXPCConnectionConfiguration fmipConfiguration](FMNSXPCConnectionConfiguration, "fmipConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resumeConnectionWithConfiguration:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addFailureBlock:", &__block_literal_global_8_0);
  objc_msgSend(v6, "remoteObjectProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "showDailyLocateReport");

  objc_autoreleasePoolPop(v2);
}

void __48__FMDFMIPManager_Private__showDailyLocateReport__block_invoke()
{
  NSObject *v0;

  LogCategory_Unspecified();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __48__FMDFMIPManager_Private__showDailyLocateReport__block_invoke_cold_1();

}

- (void)addNotificationRequest:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  LogCategory_Unspecified();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "-[FMDFMIPManager(Private) addNotificationRequest:completion:]";
    _os_log_impl(&dword_1C9939000, v7, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  +[FMNSXPCConnectionCache sharedCache](FMNSXPCConnectionCache, "sharedCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[FMNSXPCConnectionConfiguration userNotificationConfiguration](FMNSXPCConnectionConfiguration, "userNotificationConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resumeConnectionWithConfiguration:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __61__FMDFMIPManager_Private__addNotificationRequest_completion___block_invoke;
  v19[3] = &unk_1E829C100;
  v12 = v5;
  v20 = v12;
  objc_msgSend(v10, "addFailureBlock:", v19);
  objc_msgSend(v10, "remoteObjectProxy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __61__FMDFMIPManager_Private__addNotificationRequest_completion___block_invoke_9;
  v16[3] = &unk_1E829C380;
  v17 = v10;
  v18 = v12;
  v14 = v10;
  v15 = v12;
  objc_msgSend(v13, "addNotificationRequest:completion:", v6, v16);

}

void __61__FMDFMIPManager_Private__addNotificationRequest_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;

  LogCategory_Unspecified();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __61__FMDFMIPManager_Private__addNotificationRequest_completion___block_invoke_cold_1();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", kFMDErrorDomain, 13, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);

}

void __61__FMDFMIPManager_Private__addNotificationRequest_completion___block_invoke_9(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  LogCategory_Unspecified();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __61__FMDFMIPManager_Private__addNotificationRequest_completion___block_invoke_9_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[FMDFMIPManager(Private) addNotificationRequest:completion:]_block_invoke";
    _os_log_impl(&dword_1C9939000, v5, OS_LOG_TYPE_DEFAULT, "%s completed", (uint8_t *)&v7, 0xCu);
  }

  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

- (void)removeNotificationWithIdentifier:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  LogCategory_Unspecified();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "-[FMDFMIPManager(Private) removeNotificationWithIdentifier:completion:]";
    _os_log_impl(&dword_1C9939000, v7, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  +[FMNSXPCConnectionCache sharedCache](FMNSXPCConnectionCache, "sharedCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[FMNSXPCConnectionConfiguration userNotificationConfiguration](FMNSXPCConnectionConfiguration, "userNotificationConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resumeConnectionWithConfiguration:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __71__FMDFMIPManager_Private__removeNotificationWithIdentifier_completion___block_invoke;
  v19[3] = &unk_1E829C100;
  v12 = v5;
  v20 = v12;
  objc_msgSend(v10, "addFailureBlock:", v19);
  objc_msgSend(v10, "remoteObjectProxy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __71__FMDFMIPManager_Private__removeNotificationWithIdentifier_completion___block_invoke_10;
  v16[3] = &unk_1E829C380;
  v17 = v10;
  v18 = v12;
  v14 = v10;
  v15 = v12;
  objc_msgSend(v13, "removeNotificationWithIdentifier:completion:", v6, v16);

}

void __71__FMDFMIPManager_Private__removeNotificationWithIdentifier_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;

  LogCategory_Unspecified();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __71__FMDFMIPManager_Private__removeNotificationWithIdentifier_completion___block_invoke_cold_1();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", kFMDErrorDomain, 13, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);

}

void __71__FMDFMIPManager_Private__removeNotificationWithIdentifier_completion___block_invoke_10(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  LogCategory_Unspecified();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __71__FMDFMIPManager_Private__removeNotificationWithIdentifier_completion___block_invoke_10_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[FMDFMIPManager(Private) removeNotificationWithIdentifier:completion:]_block_invoke";
    _os_log_impl(&dword_1C9939000, v5, OS_LOG_TYPE_DEFAULT, "%s completed", (uint8_t *)&v7, 0xCu);
  }

  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

- (void)activationLockVersionWithCompletion:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  v3 = a3;
  v4 = (void *)MEMORY[0x1CAA4547C]();
  LogCategory_Unspecified();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1C9939000, v5, OS_LOG_TYPE_DEFAULT, "Framework (Private) : activationLockVersionWithCompletion", v10, 2u);
  }

  fmdFMIPLastOperationResult = 0;
  +[FMNSXPCConnectionCache sharedCache](FMNSXPCConnectionCache, "sharedCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[FMNSXPCConnectionConfiguration fmipConfiguration](FMNSXPCConnectionConfiguration, "fmipConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resumeConnectionWithConfiguration:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addFailureBlock:", &__block_literal_global_11);
  objc_msgSend(v8, "remoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "activationLockVersionWithCompletion:", v3);

  objc_autoreleasePoolPop(v4);
}

void __63__FMDFMIPManager_Private__activationLockVersionWithCompletion___block_invoke()
{
  NSObject *v0;

  LogCategory_Unspecified();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __63__FMDFMIPManager_Private__activationLockVersionWithCompletion___block_invoke_cold_1();

}

- (void)updateMaskedAppleIDWith:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t v12[16];

  v5 = a4;
  v6 = a3;
  LogCategory_Unspecified();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_1C9939000, v7, OS_LOG_TYPE_DEFAULT, "Framework (Private) : updateMaskedAppleID", v12, 2u);
  }

  fmdFMIPLastOperationResult = 0;
  +[FMNSXPCConnectionCache sharedCache](FMNSXPCConnectionCache, "sharedCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[FMNSXPCConnectionConfiguration fmipConfiguration](FMNSXPCConnectionConfiguration, "fmipConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resumeConnectionWithConfiguration:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "addFailureBlock:", &__block_literal_global_12_0);
  objc_msgSend(v10, "remoteObjectProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "updateMaskedAppleIDWith:completion:", v6, v5);

}

void __62__FMDFMIPManager_Private__updateMaskedAppleIDWith_completion___block_invoke()
{
  NSObject *v0;

  LogCategory_Unspecified();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __62__FMDFMIPManager_Private__updateMaskedAppleIDWith_completion___block_invoke_cold_1();

}

- (void)clearMaskedAppleIDWithCompletion:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  v3 = a3;
  LogCategory_Unspecified();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1C9939000, v4, OS_LOG_TYPE_DEFAULT, "Framework (Private) : clearMaskedAppleID", v9, 2u);
  }

  fmdFMIPLastOperationResult = 0;
  +[FMNSXPCConnectionCache sharedCache](FMNSXPCConnectionCache, "sharedCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[FMNSXPCConnectionConfiguration fmipConfiguration](FMNSXPCConnectionConfiguration, "fmipConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resumeConnectionWithConfiguration:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addFailureBlock:", &__block_literal_global_13);
  objc_msgSend(v7, "remoteObjectProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clearMaskedAppleIDWithCompletion:", v3);

}

void __60__FMDFMIPManager_Private__clearMaskedAppleIDWithCompletion___block_invoke()
{
  NSObject *v0;

  LogCategory_Unspecified();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __60__FMDFMIPManager_Private__clearMaskedAppleIDWithCompletion___block_invoke_cold_1();

}

- (void)_managedLostModeType
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_1C9939000, v0, v1, "Reading Managed Lost Mode file from: %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)_needsAckLostModeType
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_1C9939000, v0, v1, "Reading NeedsLocateAck Lost Mode file from: %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)lostModeInfo
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_1C9939000, a2, v4, "lostModeInfo = %@", v5);

  OUTLINED_FUNCTION_7();
}

- (void)enableLostModeWithInfo:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_1C9939000, v0, v1, "%s: error - %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void __41__FMDFMIPManager_enableLostModeWithInfo___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "XPC error for enableLostModeWithInfo: %li", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __33__FMDFMIPManager_disableLostMode__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "XPC error for disableLostMode %li", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)enableManagedLostModeWithInfo:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9939000, a1, a3, "%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __59__FMDFMIPManager_enableManagedLostModeWithInfo_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "Error updating managed lost mode info : %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)disableManagedLostModeWithLocatedMessage:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9939000, a1, a3, "%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __70__FMDFMIPManager_disableManagedLostModeWithLocatedMessage_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "Error updating managed lost mode info to disabled : %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)userDidAckManagedLostModeLocateWithCompletion:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9939000, a1, a3, "%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __64__FMDFMIPManager_userDidAckManagedLostModeLocateWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "Error updating NeedsLocateAck lost mode into to disabled : %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __50__FMDFMIPManager_playSoundWithOptions_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "XPC error for playSoundWithOptions:completion: %li", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __44__FMDFMIPManager_deviceActivationDidSucceed__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "XPC error for deviceActivationDidSucceed %li", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __42__FMDFMIPManager_fmipStateWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "XPC error for fmipStateWithCompletion: %li", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __42__FMDFMIPManager_fmipStateWithCompletion___block_invoke_33_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "Error fetching the FMIP state : %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __44__FMDFMIPManager_fmipAccountWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "XPC error for fmipAccountWithCompletion: %li", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __44__FMDFMIPManager_fmipAccountWithCompletion___block_invoke_35_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "Error fetching the FMIP account : %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)fmipAccount
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_1C9939000, v0, v1, "%s: error - %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void __43__FMDFMIPManager_didChangeFMIPAccountInfo___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "XPC error for didChangeFMIPAccountInfo: %li", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)enableFMIPInContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_1C9939000, v0, v1, "%s: error - %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void __38__FMDFMIPManager_enableFMIPInContext___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "XPC error for enableFMIPInContext: %li", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __79__FMDFMIPManager_disableFMIPUsingToken_forPairedDeviceWithUDID_withCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "XPC error for disableFMIPUsingToken:forPairedDeviceWithUDID:withCompletion: %li", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __79__FMDFMIPManager_disableFMIPUsingToken_forPairedDeviceWithUDID_withCompletion___block_invoke_44_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_1C9939000, v0, v1, "%s encountered an error : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void __76__FMDFMIPManager_disableFMIPForAccount_pairedDeviceWithUDID_withCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "XPC error for disableFMIPForAccount:pairedDeviceWithUDID:withCompletion: %li", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __76__FMDFMIPManager_disableFMIPForAccount_pairedDeviceWithUDID_withCompletion___block_invoke_45_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_1C9939000, v0, v1, "%s encountered an error : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void __79__FMDFMIPManager_markAsMissingSupportedForPairedDeviceWithUDID_withCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "XPC error for markAsMissingSupportedForPairedDeviceWithUDID:withCompletion: %li", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __79__FMDFMIPManager_markAsMissingSupportedForPairedDeviceWithUDID_withCompletion___block_invoke_46_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_1C9939000, v0, v1, "%s encountered an error : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void __78__FMDFMIPManager_markPairedDeviceWithUDID_asMissingUsingToken_withCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "XPC error for markPairedDeviceWithUDID:asMissingUsingToken:withCompletion:completion: %li", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __78__FMDFMIPManager_markPairedDeviceWithUDID_asMissingUsingToken_withCompletion___block_invoke_48_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_1C9939000, v0, v1, "%s encountered an error : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void __56__FMDFMIPManager_isActivationLockAllowedWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "XPC error for isActivationLockAllowedWithCompletion: %li", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __56__FMDFMIPManager_isActivationLockAllowedWithCompletion___block_invoke_49_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "Error fetching ActivationLockAllowed : %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __56__FMDFMIPManager_isActivationLockEnabledWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "XPC error for isActivationLockEnabledWithCompletion: %li", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __56__FMDFMIPManager_isActivationLockEnabledWithCompletion___block_invoke_50_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "Error fetching ActivationLockEnabled : %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __51__FMDFMIPManager_isActivationLockedWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "XPC error for isActivationLockedWithCompletion: %li", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __51__FMDFMIPManager_isActivationLockedWithCompletion___block_invoke_51_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "Error fetching the ActivationLocked : %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __53__FMDFMIPManager_enableActivationLockWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "XPC error for enableActivationLockWithCompletion: %li", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __53__FMDFMIPManager_enableActivationLockWithCompletion___block_invoke_52_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "Error enabling activaton lock : %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __50__FMDFMIPManager_didReceiveLostModeExitAuthToken___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "XPC error for didReceiveLostModeExitAuthToken: %li", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __56__FMDFMIPManager_lowBatteryLocateEnabledWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "XPC error for lowBatteryLocateEnabledWithCompletion: %li", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __60__FMDFMIPManager_setLowBatteryLocateEnabled_withCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "XPC error for setLowBatteryLocateEnabled:withCompletion: %li", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __54__FMDFMIPManager_signatureHeadersWithData_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "XPC error for signatureHeadersWithData:completion: %li", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __54__FMDFMIPManager_signatureHeadersWithData_completion___block_invoke_60_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "Error completing signature generation : %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __92__FMDFMIPManager_startPlayingSoundForAccessory_duration_rampUpDuration_channels_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "XPC error for startPlayingSoundForAccessory:duration:rampUpDuration:channels:completion: %li", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __92__FMDFMIPManager_startPlayingSoundForAccessory_duration_rampUpDuration_channels_completion___block_invoke_63_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "playSoundForAccessory encountered an error : %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __75__FMDFMIPManager_stopPlayingSoundForAccessory_rampDownDuration_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "XPC error for stopPlayingSoundForAccessory:rampDownDuration:completion %li", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __75__FMDFMIPManager_stopPlayingSoundForAccessory_rampDownDuration_completion___block_invoke_64_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "stopSoundForAccessory encountered an error : %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __62__FMDFMIPManager_waitForRoutableAccessory_timeout_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "XPC error for waitForRoutableAccessory:timeout:completion: %li", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __62__FMDFMIPManager_waitForRoutableAccessory_timeout_completion___block_invoke_65_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "waitForRoutableAccessory encountered an error : %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __53__FMDFMIPManager_soundStoppedForAccessoryIdentifier___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "XPC error for soundStoppedForAccessoryIdentifier: %li", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __39__FMDFMIPManager_clearData_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "XPC error for clearData:completion: %li", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __47__FMDFMIPManager_fetchAccessoryConfigurations___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "XPC error for fetchAccessoryConfigurations: %li", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __60__FMDFMIPManager_removeAccessoryWithDiscoveryId_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "XPC error for removeAccessoryWithDiscoveryId: %li", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __71__FMDFMIPManager_setPhoneNumber_toAccessoryWithDiscoveryId_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "XPC error for setPhoneNumber: %li", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __54__FMDFMIPManager_getConnectedAccessoriesDiscoveryIds___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "XPC error whle trying to get connected accessories %li", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __58__FMDFMIPManager_registerDeviceForPairingLock_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_1C9939000, v0, v1, "XPC error for %s: %li", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void __51__FMDFMIPManager_updatePairingLockInfo_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_1C9939000, v0, v1, "XPC error for %s: %li", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void __46__FMDFMIPManager_pairingCheckWith_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_1C9939000, v0, v1, "XPC error for %s: %li", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void __55__FMDFMIPManager__getAccessoriesWithFilter_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "XPC error for getAccessoriesWithCompletion: %li", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __55__FMDFMIPManager__getAccessoriesWithFilter_completion___block_invoke_152_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "Error getting the accessory list : %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __54__FMDFMIPManager__forceFMWUpgradeAlertWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "XPC error for _forceFMWUpgradeAlertWithCompletion: %li", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __60__FMDFMIPManager__updateManagedLostModeWithInfo_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "XPC error for _updateManagedLostModeWithInfo: %li", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __60__FMDFMIPManager__updateManagedLostModeWithInfo_completion___block_invoke_155_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "updateManagedLostModeInfo encountered an error : %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __67__FMDFMIPManager__updateNeedsLocateAckLostModeWithInfo_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "XPC error for _updateNeedsLocateAckLostModeWithInfo: %li", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __67__FMDFMIPManager__updateNeedsLocateAckLostModeWithInfo_completion___block_invoke_156_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "updateNeedsLocateAckLostModeInfo encountered an error : %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __73__FMDFMIPManager__initiateLostModeExitAuthForIDSDeviceID_withCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "XPC error for _initiateLostModeExitAuthForIDSDeviceID:withCompletion: %li", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_disableFMIPUsingToken:(os_log_t)log inContext:completion:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C9939000, log, OS_LOG_TYPE_ERROR, "Token to disable FMiP cannot be nil", v1, 2u);
}

void __62__FMDFMIPManager__disableFMIPUsingToken_inContext_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "XPC error for _disableFMIPUsingToken:inContext:completion: %li", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __62__FMDFMIPManager__disableFMIPUsingToken_inContext_completion___block_invoke_159_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "_disableFMIPUsingToken:inContext:completion: encountered an error : %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __43__FMDFMIPManager_getManagedLostModeFileURL__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "managedLostModeFileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_1C9939000, a2, v4, "Static URL %@", v5);

  OUTLINED_FUNCTION_7();
}

void __50__FMDFMIPManager_getNeedsLocateAckLostModeFileURL__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "needsLocateAckLostModeFileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_1C9939000, a2, v4, "Static URL %@", v5);

  OUTLINED_FUNCTION_7();
}

void __50__FMDFMIPManager_playSoundWithMessage_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "XPC error for playSoundWithMessage:completion: %li", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __50__FMDFMIPManager_playSoundWithMessage_completion___block_invoke_161_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "playSoundWithMessage encountered an error : %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __49__FMDFMIPManager_stopSoundMessageWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "XPC error for stopSoundMessageWithCompletion: %li", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __49__FMDFMIPManager_stopSoundMessageWithCompletion___block_invoke_162_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "stopSoundMessageWithCompletion encountered an error : %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __64__FMDFMIPManager_deviceEligibleForRepairWithContext_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "XPC error for deviceEligibleForRepairWithContext:completion: %li", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __53__FMDFMIPManager_enableRepairWithContext_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "XPC error for enableRepairWithContext:completion: %li", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __61__FMDFMIPManager_activationLockInfoFromDeviceWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "XPC error for activationLockInfoWithCompletion: %li", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __53__FMDFMIPManager_storeOfflineFindingInfo_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "XPC error for storeOfflineFindingInfo: %li", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __56__FMDFMIPManager_fetchOfflineFindingInfoWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "XPC error for fetchOfflineFindingInfoWithCompletion: %li", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __56__FMDFMIPManager_clearOfflineFindingInfoWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "XPC error for clearOfflineFindingInfoWithCompletion: %li", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __47__FMDFMIPManager_fetchAPNSTokenWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "XPC error for fetchAPNSTokenWithCompletion: %li", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __42__FMDFMIPManager_startLocationMonitoring___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "XPC error for startLocationMonitoring: %li", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __41__FMDFMIPManager_stopLocationMonitoring___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "XPC error for stopLocationMonitoring: %li", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __51__FMDFMIPManager_updatedConfigReceived_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "XPC error for updatedConfigReceived: %li", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __64__FMDFMIPManager_startLocationMonitoringWithContext_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "XPC error for startLocationMonitoringWithContext: %li", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __63__FMDFMIPManager_stopLocationMonitoringWithContext_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "XPC error for stopLocationMonitoringWithContext: %li", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __58__FMDFMIPManager_didAddLocalFindableAccessory_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "XPC error for didAddLocalFindableAccessory: %li", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __61__FMDFMIPManager_didRemoveLocalFindableAccessory_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "XPC error for didRemoveLocalFindableAccessory: %li", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __55__FMDFMIPManager_requireDisableLocationWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "XPC error for requireDisableLocationWithCompletion: %li", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __55__FMDFMIPManager_disableLocationDisplayWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "XPC error for disableLocationDisplayWithCompletion: %li", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __71__FMDFMIPManager_Private__disableBiometricIDForLostModeWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "XPC error for disableBiometricIDForLostModeWithCompletion: %li", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __71__FMDFMIPManager_Private__disableBiometricIDForLostModeWithCompletion___block_invoke_6_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_1C9939000, v0, v1, "%s encountered an error : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void __55__FMDFMIPManager_Private__setDailyLocateReportEnabled___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "XPC error for setDailyLocateReportEnabled: %li", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __48__FMDFMIPManager_Private__showDailyLocateReport__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "XPC error for showDailyLocateReport: %li", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __61__FMDFMIPManager_Private__addNotificationRequest_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "XPC error for addNotificationRequest: %li", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __61__FMDFMIPManager_Private__addNotificationRequest_completion___block_invoke_9_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_1C9939000, v0, v1, "%s encountered an error : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void __71__FMDFMIPManager_Private__removeNotificationWithIdentifier_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "XPC error for removeNotificationWithIdentifier: %li", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __71__FMDFMIPManager_Private__removeNotificationWithIdentifier_completion___block_invoke_10_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_1C9939000, v0, v1, "%s encountered an error : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void __63__FMDFMIPManager_Private__activationLockVersionWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "XPC error for activationLockVersionWithCompletion: %li", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __62__FMDFMIPManager_Private__updateMaskedAppleIDWith_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "XPC error for updateMaskedAppleID: %li", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __60__FMDFMIPManager_Private__clearMaskedAppleIDWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9939000, v0, v1, "XPC error for clearMaskedAppleID: %li", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end

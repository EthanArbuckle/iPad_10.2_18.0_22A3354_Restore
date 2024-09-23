@implementation ENConfigurationManager

- (ENConfigurationStore)configurationStore
{
  return self->_configurationStore;
}

- (ENConfigurationManager)initWithDelegate:(id)a3 activeEntity:(id)a4
{
  id v6;
  id v7;
  ENConfigurationManager *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  ENCloudServerChannel *v11;
  ENConfigurationStore *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ENConfigurationManager;
  v8 = -[ENConfigurationManager init](&v14, sel_init);
  if (v8)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.exposureNotification.configManager.serialQueue", v9);
    -[ENConfigurationManager setSerialQueue:](v8, "setSerialQueue:", v10);

    v11 = objc_alloc_init(ENCloudServerChannel);
    -[ENConfigurationManager setCloudServerChannel:](v8, "setCloudServerChannel:", v11);

    v12 = objc_alloc_init(ENConfigurationStore);
    -[ENConfigurationManager setConfigurationStore:](v8, "setConfigurationStore:", v12);

    -[ENConfigurationManager setDelegate:](v8, "setDelegate:", v6);
    -[ENConfigurationManager setActiveEntity:](v8, "setActiveEntity:", v7);
  }

  return v8;
}

- (void)activate
{
  NSObject *v3;
  _QWORD block[5];

  -[ENConfigurationManager serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__ENConfigurationManager_activate__block_invoke;
  block[3] = &unk_1E87D9C28;
  block[4] = self;
  dispatch_sync(v3, block);

}

uint64_t __34__ENConfigurationManager_activate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activate");
}

- (void)_activate
{
  if (gLogCategory_ENConfigurationManager <= 50
    && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  CFPrefs_RemoveValue();
  CFPrefs_RemoveValue();
  CFPrefs_RemoveValue();
  CFPrefs_RemoveValue();
  -[ENConfigurationManager _scheduleRegionConfigurationRefresh](self, "_scheduleRegionConfigurationRefresh");
}

- (void)dealloc
{
  ENRegionMonitor *regionMonitor;
  void *v4;
  objc_super v5;

  if (gLogCategory_ENConfigurationManager <= 30
    && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  -[ENRegionMonitor setDelegate:](self->_regionMonitor, "setDelegate:", 0);
  regionMonitor = self->_regionMonitor;
  self->_regionMonitor = 0;

  -[ENConfigurationManager serverConfigurationFetchTimer](self, "serverConfigurationFetchTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  -[ENConfigurationManager setServerConfigurationFetchTimer:](self, "setServerConfigurationFetchTimer:", 0);
  v5.receiver = self;
  v5.super_class = (Class)ENConfigurationManager;
  -[ENConfigurationManager dealloc](&v5, sel_dealloc);
}

- (void)_reportErrorMetricForHTTPStatus:(int64_t)a3
{
  id WeakRetained;
  uint64_t v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = WeakRetained;
  if ((unint64_t)a3 <= 0x3E7)
    v6 = (a3 + 10000);
  else
    v6 = 10000;
  objc_msgSend(WeakRetained, "configurationManager:errorDetected:", self, v6);

}

- (void)serverFetchRegionConfiguration:(id)a3 userInitiated:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a5;
  -[ENConfigurationManager serialQueue](self, "serialQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __82__ENConfigurationManager_serverFetchRegionConfiguration_userInitiated_completion___block_invoke;
  v13[3] = &unk_1E87DB200;
  v13[4] = self;
  v14 = v8;
  v16 = a4;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

uint64_t __82__ENConfigurationManager_serverFetchRegionConfiguration_userInitiated_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_serverFetchRegionConfiguration:userInitiated:completion:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

- (void)_serverFetchRegionConfiguration:(id)a3 userInitiated:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  const char *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  unint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  unint64_t v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  _BOOL4 v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  _QWORD v65[7];
  id v66;
  id v67;
  _QWORD v68[5];
  id v69;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  if (gLogCategory_ENConfigurationManager <= 30
    && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
  {
    v10 = "no";
    if (v6)
      v10 = "yes";
    v52 = v8;
    v58 = v10;
    LogPrintF_safe();
  }
  objc_msgSend(v8, "countryCode", v52, v58);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v8, "countryCode");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "uppercaseString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (CFPrefs_GetInt64())
    {
      if (gLogCategory_ENConfigurationManager <= 30
        && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
      -[ENConfigurationManager configurationStore](self, "configurationStore");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v68[0] = MEMORY[0x1E0C809B0];
      v68[1] = 3221225472;
      v68[2] = __83__ENConfigurationManager__serverFetchRegionConfiguration_userInitiated_completion___block_invoke;
      v68[3] = &unk_1E87DB510;
      v68[4] = self;
      v69 = v9;
      objc_msgSend(v14, "allCachedServerResponseConfigurationsWithCompletion:", v68);

      v15 = v69;
LABEL_46:

      goto LABEL_47;
    }
    v60 = v6;
    if (gLogCategory_ENConfigurationManager <= 30
      && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
    {
      v53 = v13;
      LogPrintF_safe();
    }
    +[ENConfigurationManager iCloudServerEndpoint](ENConfigurationManager, "iCloudServerEndpoint", v53);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "URLByAppendingPathComponent:", CFSTR("/v2/app/config"));
    v64 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E00], "dictionary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D60], "date");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "timeIntervalSince1970");
    v20 = (uint64_t)(v19 * 1000.0);

    objc_msgSend(MEMORY[0x1E0CB3938], "stringWithFormat:", CFSTR("%lld"), v20);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKey:");
    objc_msgSend(v13, "uppercaseString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKey:", v21, CFSTR("x-apple-ct-region-identifier"));

    -[ENConfigurationManager configurationStore](self, "configurationStore");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "regionHashForRegion:", v8);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
      objc_msgSend(v17, "setObject:forKey:", v23, CFSTR("x-apple-ct-region-hash"));

    objc_msgSend(MEMORY[0x1E0CB3798], "string");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = GestaltCopyAnswer();
    v26 = (void *)v25;
    if (v25)
      objc_msgSend(v24, "appendFormat:", CFSTR("%@/"), v25);
    v27 = GestaltCopyAnswer();
    if (v27)
      objc_msgSend(v24, "appendString:", v27);
    if (objc_msgSend(v24, "length"))
      objc_msgSend(v17, "setObject:forKey:", v24, CFSTR("x-apple-en-os-version"));
    v61 = (void *)v27;
    v62 = v26;
    if (CFPrefs_GetInt64())
      objc_msgSend(v17, "setObject:forKey:", CFSTR("true"), CFSTR("x-apple-test-application"));
    -[ENConfigurationManager regionRampModeOverride](self, "regionRampModeOverride");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectForKeyedSubscript:", v8);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      -[ENConfigurationManager regionRampModeOverride](self, "regionRampModeOverride");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "objectForKeyedSubscript:", v8);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "unsignedIntegerValue");

      -[ENConfigurationManager regionRampModeOverride](self, "regionRampModeOverride");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setObject:forKeyedSubscript:", 0, v8);

      if (!v32)
      {
LABEL_41:
        +[ENCloudNetworkRequest requestWithURL:httpMethod:headers:parameters:andBody:](ENCloudNetworkRequest, "requestWithURL:httpMethod:headers:parameters:andBody:", v64, 0, v17, MEMORY[0x1E0C9AA68], 0, v54);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[ENConfigurationManager delegate](self, "delegate");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (gLogCategory_ENConfigurationManager <= 30
          && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
        {
          v55 = v35;
          LogPrintF_safe();
        }
        -[ENConfigurationManager cloudServerChannel](self, "cloudServerChannel", v55);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v65[0] = MEMORY[0x1E0C809B0];
        v65[1] = 3221225472;
        v65[2] = __83__ENConfigurationManager__serverFetchRegionConfiguration_userInitiated_completion___block_invoke_3;
        v65[3] = &unk_1E87DB668;
        v65[4] = v35;
        v65[5] = v36;
        v67 = v9;
        v65[6] = self;
        v66 = v8;
        objc_msgSend(v37, "enqueueRequest:withCompletion:", v35, v65);

        v15 = (void *)v64;
        goto LABEL_46;
      }
    }
    else if (CFPrefs_GetInt64())
    {
      if (gLogCategory_ENConfigurationManager <= 30
        && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
      v32 = 1;
    }
    else
    {
      if (gLogCategory_ENConfigurationManager <= 30
        && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
      -[ENConfigurationManager activeEntity](self, "activeEntity");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "entity");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "region");
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      if (v40)
      {
        -[ENConfigurationManager activeEntity](self, "activeEntity");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "entity");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "region");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = -[ENConfigurationManager readCachedRampModeForRegion:](self, "readCachedRampModeForRegion:", v43);

        switch(v44)
        {
          case 0uLL:
            if (gLogCategory_ENConfigurationManager > 30)
              goto LABEL_71;
            if (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize())
              goto LABEL_57;
            break;
          case 1uLL:
            if (gLogCategory_ENConfigurationManager > 30)
              goto LABEL_71;
            if (gLogCategory_ENConfigurationManager == -1 && !_LogCategory_Initialize())
              break;
LABEL_57:
            -[ENConfigurationManager activeEntity](self, "activeEntity");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "entity");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "region");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            LogPrintF_safe();

            break;
          case 2uLL:
            if (gLogCategory_ENConfigurationManager <= 30
              && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
            {
              -[ENConfigurationManager activeEntity](self, "activeEntity");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "entity");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "region");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              LogPrintF_safe();

            }
            goto LABEL_93;
          case 3uLL:
            if (gLogCategory_ENConfigurationManager <= 30
              && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
            {
              -[ENConfigurationManager activeEntity](self, "activeEntity");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "entity");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v50, "region");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              LogPrintF_safe();

            }
            v32 = 3;
            goto LABEL_40;
          default:
            break;
        }
      }
      if (gLogCategory_ENConfigurationManager <= 30
        && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
      {
        v54 = v8;
        LogPrintF_safe();
      }
LABEL_71:
      v51 = -[ENConfigurationManager readCachedRampModeForRegion:](self, "readCachedRampModeForRegion:", v8, v54);
      if (v51)
      {
        v32 = v51;
        if (gLogCategory_ENConfigurationManager <= 30
          && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
        {
          v54 = v8;
          v59 = v32;
          LogPrintF_safe();
        }
        if (v32 != 1)
        {
          if (gLogCategory_ENConfigurationManager <= 30
            && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
          {
            v59 = v32;
            LogPrintF_safe();
          }
          goto LABEL_40;
        }
        if (gLogCategory_ENConfigurationManager <= 30
          && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
        {
          v54 = v8;
          LogPrintF_safe();
        }
      }
      if (!v60)
        goto LABEL_41;
      if (gLogCategory_ENConfigurationManager <= 30
        && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
LABEL_93:
      v32 = 2;
    }
LABEL_40:
    objc_msgSend(MEMORY[0x1E0CB3938], "stringWithFormat:", CFSTR("%lu"), v32, v59);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKey:", v34, CFSTR("x-apple-ramp-mode"));

    goto LABEL_41;
  }
  if (!v9)
    goto LABEL_48;
  ENErrorF();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v13);
LABEL_47:

LABEL_48:
}

void __83__ENConfigurationManager__serverFetchRegionConfiguration_userInitiated_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "serialQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __83__ENConfigurationManager__serverFetchRegionConfiguration_userInitiated_completion___block_invoke_2;
  v6[3] = &unk_1E87DA188;
  v7 = v3;
  v8 = *(id *)(a1 + 40);
  v5 = v3;
  dispatch_async(v4, v6);

}

void __83__ENConfigurationManager__serverFetchRegionConfiguration_userInitiated_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (gLogCategory_ENConfigurationManager <= 30
    && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "count");
    LogPrintF_safe();
  }
  if (objc_msgSend(*(id *)(a1 + 32), "count", v4))
  {
    v2 = 0;
  }
  else
  {
    NSErrorF();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
  {
    v5 = v2;
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 32));
    v2 = v5;
  }

}

void __83__ENConfigurationManager__serverFetchRegionConfiguration_userInitiated_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  char v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  id v60;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v11)
  {
    if (a2 == 200 && v10)
    {
      if (objc_msgSend(v10, "length"))
      {
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Content-Type"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "containsString:", CFSTR("application/json"));

        if (v15)
        {
          if (gLogCategory_ENConfigurationManager <= 30
            && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
          {
            v52 = objc_msgSend(v10, "length");
            LogPrintF_safe();
          }
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("x-apple-ct-region-identifier"), v52);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("x-apple-pt-server-sign1"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v10;
          if (+[ENConfigurationManager verifyAppleServerResponse:signatureHeader:](ENConfigurationManager, "verifyAppleServerResponse:signatureHeader:", v28, v27))
          {
            objc_msgSend(*(id *)(a1 + 56), "countryCode");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v26, "isEqualToString:", v29);

            if ((v30 & 1) != 0)
            {
              objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("x-apple-ct-region-hash"));
              v31 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(a1 + 48), "configurationStore");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = *(_QWORD *)(a1 + 56);
              v59 = (void *)v31;
              v60 = 0;
              LOBYTE(v31) = objc_msgSend(v32, "saveRegionHash:region:error:", v31, v33, &v60);
              v57 = v60;

              if ((v31 & 1) == 0
                && gLogCategory__ENConfigurationManager <= 30
                && (gLogCategory__ENConfigurationManager != -1 || _LogCategory_Initialize()))
              {
                objc_msgSend(*(id *)(a1 + 56), "countryCode");
                v53 = v59;
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                LogPrintF_safe();

              }
              objc_msgSend(MEMORY[0x1E0CB36E0], "JSONObjectWithData:options:error:", v28, 0, 0, v53, v55);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              v43 = objc_msgSend(v42, "isSensitiveLoggingAllowed");

              v44 = v41;
              if (v43
                && gLogCategory_ENConfigurationManager <= 10
                && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
              {
                v54 = v41;
                LogPrintF_safe();
              }
              objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("subdivisions"), v54);
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(*(id *)(a1 + 48), "configurationStore");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v46, "saveCountrySubdivisionList:region:error:", v45, *(_QWORD *)(a1 + 56), 0);

                v44 = v41;
              }
              v58 = v44;
              objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("appConfigs"));
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v47, "count"))
              {
                v48 = *(_QWORD *)(a1 + 64);
                v49 = v57;
                if (v48)
                  (*(void (**)(uint64_t, void *, _QWORD))(v48 + 16))(v48, v47, 0);
              }
              else
              {
                v56 = v26;
                v50 = *(_QWORD *)(a1 + 64);
                if (v50)
                {
                  NSErrorF();
                  v51 = (void *)objc_claimAutoreleasedReturnValue();
                  (*(void (**)(uint64_t, _QWORD, void *))(v50 + 16))(v50, 0, v51);

                }
                objc_msgSend(*(id *)(a1 + 40), "configurationManager:errorDetected:", *(_QWORD *)(a1 + 48), 6002);
                v26 = v56;
                v49 = v57;
              }

              goto LABEL_62;
            }
            if (gLogCategory__ENConfigurationManager <= 30
              && (gLogCategory__ENConfigurationManager != -1 || _LogCategory_Initialize()))
            {
              objc_msgSend(*(id *)(a1 + 56), "countryCode");
              v53 = v26;
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              LogPrintF_safe();

            }
            v39 = *(_QWORD *)(a1 + 64);
            if (v39)
            {
              v53 = v26;
              NSErrorF();
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              (*(void (**)(uint64_t, _QWORD, void *))(v39 + 16))(v39, 0, v40);

            }
            v36 = *(void **)(a1 + 40);
            v37 = *(_QWORD *)(a1 + 48);
            v38 = 6004;
          }
          else
          {
            v34 = *(_QWORD *)(a1 + 64);
            if (v34)
            {
              NSErrorF();
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              (*(void (**)(uint64_t, _QWORD, void *))(v34 + 16))(v34, 0, v35);

            }
            v36 = *(void **)(a1 + 40);
            v37 = *(_QWORD *)(a1 + 48);
            v38 = 6001;
          }
          objc_msgSend(v36, "configurationManager:errorDetected:", v37, v38, v53, v55);
LABEL_62:

          goto LABEL_63;
        }
      }
      goto LABEL_18;
    }
    switch(a2)
    {
      case 503:
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Retry-After"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = *(_QWORD *)(a1 + 64);
        if (v23)
        {
          v52 = (uint64_t)v22;
          NSErrorF();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, _QWORD, void *))(v23 + 16))(v23, 0, v24);

        }
        objc_msgSend(*(id *)(a1 + 48), "_reportErrorMetricForHTTPStatus:", 503, v52);
        break;
      case 404:
        v25 = *(_QWORD *)(a1 + 64);
        if (!v25)
          goto LABEL_63;
        NSErrorF();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, void *))(v25 + 16))(v25, 0, v22);
        break;
      case 304:
        v16 = *(_QWORD *)(a1 + 64);
        if (v16)
        {
          NSErrorF();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, _QWORD, void *))(v16 + 16))(v16, 0, v17);

        }
        v18 = *(void **)(a1 + 48);
        v19 = 304;
        goto LABEL_21;
      default:
LABEL_18:
        v20 = *(_QWORD *)(a1 + 64);
        if (v20)
        {
          NSErrorF();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, _QWORD, void *))(v20 + 16))(v20, 0, v21);

        }
        v18 = *(void **)(a1 + 48);
        v19 = a2;
LABEL_21:
        objc_msgSend(v18, "_reportErrorMetricForHTTPStatus:", v19);
        goto LABEL_63;
    }

    goto LABEL_63;
  }
  v12 = *(_QWORD *)(a1 + 64);
  if (v12)
  {
    v52 = *(_QWORD *)(a1 + 32);
    NSErrorNestedF();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v12 + 16))(v12, 0, v13);

  }
  objc_msgSend(*(id *)(a1 + 40), "configurationManager:errorDetected:", *(_QWORD *)(a1 + 48), 6000, v52);
LABEL_63:

}

- (BOOL)updateRampModeForRegion:(id)a3 rampMode:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  id v13;

  v6 = a3;
  if (gLogCategory_ENConfigurationManager <= 30
    && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  if (v6)
  {
    -[ENConfigurationManager configurationStore](self, "configurationStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "configurationForRegion:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      if (a4 <= 3)
      {
        objc_msgSend(v8, "setEnRampMode:", a4);
        -[ENConfigurationManager configurationStore](self, "configurationStore");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 0;
        v10 = objc_msgSend(v9, "saveRegionConfiguration:error:", v8, &v13);
        v11 = v13;

        if ((v10 & 1) == 0
          && gLogCategory_ENConfigurationManager <= 90
          && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
        {
          LogPrintF_safe();
        }

        goto LABEL_24;
      }
      if (gLogCategory_ENConfigurationManager > 90
        || gLogCategory_ENConfigurationManager == -1 && !_LogCategory_Initialize())
      {
LABEL_21:
        v10 = 0;
LABEL_24:

        goto LABEL_25;
      }
    }
    else if (gLogCategory_ENConfigurationManager > 40
           || gLogCategory_ENConfigurationManager == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_21;
    }
    LogPrintF_safe();
    goto LABEL_21;
  }
  if (gLogCategory_ENConfigurationManager <= 90
    && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  v10 = 0;
LABEL_25:

  return v10;
}

- (BOOL)regionSupportsFeatures:(id)a3 featureFlags:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  char v9;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  if (gLogCategory_ENConfigurationManager <= 30
    && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  if (v6)
  {
    -[ENConfigurationManager configurationStore](self, "configurationStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "serverConfigurationForRegion:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = objc_msgSend(v8, "supportsFeatures:", v4);
    }
    else
    {
      if (gLogCategory_ENConfigurationManager <= 90
        && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
      v9 = 0;
    }

  }
  else
  {
    if (gLogCategory_ENConfigurationManager <= 90
      && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    v9 = 0;
  }

  return v9;
}

- (unint64_t)readCachedRampModeForRegion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v4 = a3;
  if (gLogCategory_ENConfigurationManager <= 30
    && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  if (v4)
  {
    -[ENConfigurationManager configurationStore](self, "configurationStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "configurationForRegion:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = objc_msgSend(v6, "enRampMode");
    }
    else
    {
      if (gLogCategory_ENConfigurationManager <= 90
        && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
      v7 = 0;
    }

  }
  else
  {
    if (gLogCategory_ENConfigurationManager <= 90
      && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    v7 = 0;
  }

  return v7;
}

+ (BOOL)verifyAppleServerResponse:(id)a3 signatureHeader:(id)a4
{
  const __CFData *v5;
  id v6;
  BOOL v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const __CFDictionary *v14;
  __SecKey *v15;
  CFErrorRef v16;
  void *v17;
  int v18;
  uint64_t v20;
  CFErrorRef error;
  _QWORD v22[3];
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  v5 = (const __CFData *)a3;
  v6 = a4;
  if (IsAppleInternalBuild() && CFPrefs_GetInt64())
  {
    if (gLogCategory_ENConfigurationManager <= 30
      && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    v7 = 1;
    goto LABEL_48;
  }
  v7 = 0;
  if (!v5 || !v6)
    goto LABEL_48;
  v8 = (void *)MEMORY[0x1D17A7CB8]();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D58]), "initWithBase64EncodedString:options:", CFSTR("BP6sTAdk49vlNzoEmFS15HX3QjglGJLaTUl1JwGVSn9nAEiZa1dPc811nQVQFKtnYVYhnZswXx63UUM8L/O9aF4="), 0);
  if (IsAppleInternalBuild() && CFPrefs_GetInt64())
  {
    if (gLogCategory_ENConfigurationManager <= 30
      && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D58]), "initWithBase64EncodedString:options:", CFSTR("BLZMQHP6FNq1JzrOft1byshgng28vue0mruB3/Nzx0hhKQA2++MecTBcMWJhh+juPNhjmnKGM/Mpi2WxH8/L5AA="), 0);

    v9 = (void *)v10;
  }
  if (gLogCategory__ENConfigurationManager <= 30
    && (gLogCategory__ENConfigurationManager != -1 || _LogCategory_Initialize()))
  {
    v20 = objc_msgSend(v9, "length");
    LogPrintF_safe();
  }
  error = 0;
  v11 = *MEMORY[0x1E0CD6A48];
  v12 = *MEMORY[0x1E0CD69F0];
  v22[0] = *MEMORY[0x1E0CD6A30];
  v22[1] = v12;
  v13 = *MEMORY[0x1E0CD6A08];
  v23[0] = v11;
  v23[1] = v13;
  v22[2] = *MEMORY[0x1E0CD6A28];
  v23[2] = &unk_1E87EE180;
  objc_msgSend(MEMORY[0x1E0C99D88], "dictionaryWithObjects:forKeys:count:", v23, v22, 3, v20);
  v14 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v15 = SecKeyCreateWithData((CFDataRef)v9, v14, &error);
  v16 = error;
  if (!error)
  {
    objc_msgSend(v6, "utf8ValueSafe");
    NSDataWithHex();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_ENConfigurationManager <= 10
      && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(v17, "length");
      LogPrintF_safe();
    }
    v18 = SecKeyVerifySignature(v15, (SecKeyAlgorithm)*MEMORY[0x1E0CD6DF0], v5, (CFDataRef)v17, &error);
    v7 = v18 != 0;
    if (v18)
    {
      if (gLogCategory_ENConfigurationManager > 50
        || gLogCategory_ENConfigurationManager == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_42;
      }
    }
    else if (gLogCategory__ENConfigurationManager > 90
           || gLogCategory__ENConfigurationManager == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_42;
    }
    LogPrintF_safe();
LABEL_42:

    goto LABEL_43;
  }
  if (gLogCategory__ENConfigurationManager > 90)
  {
    v7 = 0;
LABEL_44:
    CFRelease(v16);
    goto LABEL_45;
  }
  if (gLogCategory__ENConfigurationManager != -1 || _LogCategory_Initialize())
    LogPrintF_safe();
  v7 = 0;
LABEL_43:
  v16 = error;
  if (error)
    goto LABEL_44;
LABEL_45:
  if (v15)
    CFRelease(v15);

  objc_autoreleasePoolPop(v8);
LABEL_48:

  return v7;
}

+ (id)iCloudServerEndpoint
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0C99E90], "URLWithString:", CFSTR("https://gateway.icloud.com/enservice"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (CFPrefs_GetInt64() && IsAppleInternalBuild())
  {
    if (gLogCategory_ENConfigurationManager <= 30
      && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    objc_msgSend(MEMORY[0x1E0C99E90], "URLWithString:", CFSTR("https://gateway-ic3.icloud.com/enservice"));
    v3 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v3;
  }
  return v2;
}

- (void)_scheduleRegionConfigurationRefresh
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  ENXPCTimer *v28;
  ENXPCTimer *v29;
  double v30;
  void *v31;
  _QWORD v32[5];
  id v33;
  id location;
  id v35;

  -[ENConfigurationManager serverConfigurationFetchTimer](self, "serverConfigurationFetchTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ENConfigurationManager serverConfigurationFetchTimer](self, "serverConfigurationFetchTimer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

    -[ENConfigurationManager setServerConfigurationFetchTimer:](self, "setServerConfigurationFetchTimer:", 0);
  }
  -[ENConfigurationManager activeEntity](self, "activeEntity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "region");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
    v10 = 0;
  }
  else
  {
    -[ENConfigurationManager regionMonitor](self, "regionMonitor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0;
    objc_msgSend(v11, "getCurrentRegionVisitWithError:", &v35);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v35;
    objc_msgSend(v12, "region");
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (v9)
  {
    CFPrefs_GetDouble();
    if (v13 > 0.0)
    {
      v14 = v13;
      -[ENConfigurationManager gracePeriodConfigurationFetchTimer](self, "gracePeriodConfigurationFetchTimer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
      {
        objc_msgSend(MEMORY[0x1E0C99D60], "date");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "timeIntervalSince1970");
        if (v14 - v17 <= 0.0)
        {
          v20 = 600.0;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99D60], "date");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "timeIntervalSince1970");
          v20 = v14 - v19;

        }
        -[ENConfigurationManager setupGracePeriodFetchTimerWithDelay:](self, "setupGracePeriodFetchTimerWithDelay:", v20);
      }
    }
    -[ENConfigurationManager configurationStore](self, "configurationStore");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "serverConfigurationForRegion:", v9);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v22, "callbackInterval");
      v24 = v23;
    }
    else
    {
      -[ENConfigurationManager _fetchServerConfigurationsForRegion:userInitiated:completion:](self, "_fetchServerConfigurationsForRegion:userInitiated:completion:", v9, 0, &__block_literal_global_5);
      v24 = 259200.0;
    }
    v25 = v24 + (double)arc4random_uniform(0x15180u);
    CFPrefs_GetDouble();
    v27 = v26;
    if (IsAppleInternalBuild() && v27 > 0.0)
    {
      if (gLogCategory_ENConfigurationManager > 30)
      {
        v25 = v27;
LABEL_28:
        location = 0;
        objc_initWeak(&location, self);
        v28 = [ENXPCTimer alloc];
        v32[0] = MEMORY[0x1E0C809B0];
        v32[1] = 3221225472;
        v32[2] = __61__ENConfigurationManager__scheduleRegionConfigurationRefresh__block_invoke_2;
        v32[3] = &unk_1E87DB6F8;
        objc_copyWeak(&v33, &location);
        v32[4] = self;
        v29 = -[ENXPCTimer initWithName:delay:gracePeriod:cadence:priority:options:block:](v28, "initWithName:delay:gracePeriod:cadence:priority:options:block:", CFSTR("com.apple.bluetooth.exposureNotification.fetchRegionConfiguration"), (unint64_t)v25, 1, 8385, v32, v25, 3600.0);
        -[ENConfigurationManager setServerConfigurationFetchTimer:](self, "setServerConfigurationFetchTimer:", v29);

        objc_destroyWeak(&v33);
        objc_destroyWeak(&location);

        goto LABEL_29;
      }
      if (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize())
      {
        v30 = v27;
        LogPrintF_safe();
      }
      v25 = v27;
    }
    if (gLogCategory_ENConfigurationManager <= 30
      && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(v9, "countryCode", *(_QWORD *)&v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    goto LABEL_28;
  }
  if (gLogCategory_ENConfigurationManager <= 10
    && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
LABEL_29:

}

void __61__ENConfigurationManager__scheduleRegionConfigurationRefresh__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  if (gLogCategory_ENConfigurationManager <= 30
    && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__ENConfigurationManager__scheduleRegionConfigurationRefresh__block_invoke_3;
  v6[3] = &unk_1E87D9CC8;
  objc_copyWeak(&v7, (id *)(a1 + 40));
  v6[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v5, v6);

  objc_destroyWeak(&v7);
}

void __61__ENConfigurationManager__scheduleRegionConfigurationRefresh__block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  id v19;
  id val;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[5];
  id v27;
  id location;
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  val = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(val, "activeEntity");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "entity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "region");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
    v19 = 0;
  }
  else
  {
    objc_msgSend(val, "regionMonitor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0;
    objc_msgSend(v6, "getCurrentRegionVisitWithError:", &v29);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v29;
    objc_msgSend(v7, "region");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (v5)
  {
    location = 0;
    objc_initWeak(&location, val);
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __61__ENConfigurationManager__scheduleRegionConfigurationRefresh__block_invoke_4;
    v26[3] = &unk_1E87DB6B0;
    objc_copyWeak(&v27, &location);
    v26[4] = v5;
    objc_msgSend(val, "fetchServerConfigurationsForRegion:userInitiated:withCompletion:", v5, 0, v26);
    objc_msgSend(*(id *)(a1 + 32), "configurationStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allCachedCountries");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v23 != v12)
            objc_enumerationMutation(v10);
          v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v5, "countryCode");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v14, "isEqualToString:", v15);

          if ((v16 & 1) == 0)
          {
            v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CAA378]), "initWithCountryCode:", v14);
            if (gLogCategory_ENConfigurationManager <= 30
              && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
            {
              v18 = v17;
              LogPrintF_safe();
            }
            objc_msgSend(*(id *)(a1 + 32), "fetchServerConfigurationsForRegion:userInitiated:withCompletion:", v17, 0, &__block_literal_global_157, v18);

          }
        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      }
      while (v11);
    }

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
  else if (gLogCategory__ENConfigurationManager <= 90
         && (gLogCategory__ENConfigurationManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }

}

void __61__ENConfigurationManager__scheduleRegionConfigurationRefresh__block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v9)
  {
    if (gLogCategory__ENConfigurationManager <= 90
      && (gLogCategory__ENConfigurationManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }
  else
  {
    objc_msgSend(WeakRetained, "configurationStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "serverConfigurationForRegion:", *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      if (gLogCategory__ENConfigurationManager <= 30
        && (gLogCategory__ENConfigurationManager != -1 || _LogCategory_Initialize()))
      {
        v8 = *(_QWORD *)(a1 + 32);
        LogPrintF_safe();
        objc_msgSend(WeakRetained, "_processServerConfiguration:forceUpdate:", v6, 1, v8);
      }
      else
      {
        objc_msgSend(WeakRetained, "_processServerConfiguration:forceUpdate:", v6, 1, v7);
      }
    }
    else if (gLogCategory__ENConfigurationManager <= 30
           && (gLogCategory__ENConfigurationManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }

  }
}

- (void)resetConfigurationCache
{
  void *v3;

  if (gLogCategory_ENConfigurationManager <= 30
    && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  -[ENConfigurationManager configurationStore](self, "configurationStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resetStore");

  -[ENConfigurationManager resetConfigurationManager](self, "resetConfigurationManager");
}

- (void)resetConfigurationManager
{
  NSObject *v3;
  _QWORD block[5];

  if (gLogCategory_ENConfigurationManager <= 30
    && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  -[ENConfigurationManager serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__ENConfigurationManager_resetConfigurationManager__block_invoke;
  block[3] = &unk_1E87D9C28;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __51__ENConfigurationManager_resetConfigurationManager__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "serverConfigurationFetchTimer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

  objc_msgSend(*(id *)(a1 + 32), "setServerConfigurationFetchTimer:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "stopGracePeriodTimer");
}

+ (void)_printServerConfiguration:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (gLogCategory_ENConfigurationManager <= 30
    && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        if (gLogCategory_ENConfigurationManager <= 30)
        {
          v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
          if (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize())
          {
            objc_msgSend(v3, "objectForKeyedSubscript:", v9, v10, v11);
            v10 = v9;
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            LogPrintF_safe();

          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (BOOL)isInGracePeriodTransition
{
  ENConfigurationManager *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[ENConfigurationManager serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__ENConfigurationManager_isInGracePeriodTransition__block_invoke;
  v5[3] = &unk_1E87DB0A8;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __51__ENConfigurationManager_isInGracePeriodTransition__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "gracePeriodConfigurationFetchTimer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v2 != 0;

}

- (void)setupGracePeriodFetchTimerWithDelay:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  ENXPCTimer *v9;
  id v10;
  id v11;
  ENXPCTimer *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  id v18;
  id v19;
  id location;

  if (gLogCategory_ENConfigurationManager <= 30
    && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  -[ENConfigurationManager gracePeriodConfigurationFetchTimer](self, "gracePeriodConfigurationFetchTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ENConfigurationManager gracePeriodConfigurationFetchTimer](self, "gracePeriodConfigurationFetchTimer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invalidate");

    -[ENConfigurationManager setGracePeriodConfigurationFetchTimer:](self, "setGracePeriodConfigurationFetchTimer:", 0);
  }
  -[ENConfigurationManager serialQueue](self, "serialQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENConfigurationManager regionMonitor](self, "regionMonitor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  location = 0;
  objc_initWeak(&location, self);
  v9 = [ENXPCTimer alloc];
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __62__ENConfigurationManager_setupGracePeriodFetchTimerWithDelay___block_invoke;
  v16 = &unk_1E87DB748;
  v10 = v7;
  v17 = v10;
  objc_copyWeak(&v19, &location);
  v11 = v8;
  v18 = v11;
  v12 = -[ENXPCTimer initWithName:delay:gracePeriod:priority:options:block:](v9, "initWithName:delay:gracePeriod:priority:options:block:", CFSTR("com.apple.bluetooth.exposureNotification.gracePeriodConfigurationFetchTimer"), 1, 193, &v13, a3, 30.0);
  -[ENConfigurationManager setGracePeriodConfigurationFetchTimer:](self, "setGracePeriodConfigurationFetchTimer:", v12, v13, v14, v15, v16);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

void __62__ENConfigurationManager_setupGracePeriodFetchTimerWithDelay___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  if (gLogCategory_ENConfigurationManager <= 30
    && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  v4 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__ENConfigurationManager_setupGracePeriodFetchTimerWithDelay___block_invoke_2;
  block[3] = &unk_1E87DB720;
  v7 = v3;
  v5 = v3;
  objc_copyWeak(&v9, (id *)(a1 + 48));
  v8 = *(id *)(a1 + 40);
  dispatch_async(v4, block);

  objc_destroyWeak(&v9);
}

void __62__ENConfigurationManager_setupGracePeriodFetchTimerWithDelay___block_invoke_2(id *a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  uint64_t v19;
  id v20;

  objc_msgSend(a1[4], "invalidate");
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "stopGracePeriodTimer");
  CFDataGetTypeID();
  v3 = (void *)CFPrefs_CopyTypedValue();
  if (objc_msgSend(v3, "length"))
  {
    v20 = 0;
    objc_msgSend(MEMORY[0x1E0CB3708], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v3, &v20);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v20;
    if (gLogCategory__ENConfigurationManager <= 90
      && (gLogCategory__ENConfigurationManager != -1 || _LogCategory_Initialize()))
    {
      v18 = v5;
      LogPrintF_safe();
    }

  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(v4, "entity", v18);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "region");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1[5], "getCurrentRegionVisitWithError:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "region");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v7;
  v11 = v9;
  v12 = v11;
  if (v10 == v11)
  {

  }
  else
  {
    if ((v10 == 0) == (v11 != 0))
    {

LABEL_17:
      objc_msgSend(WeakRetained, "configurationStore");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "serverConfigurationForRegion:", v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isSensitiveLoggingAllowed");

        if (v17
          && gLogCategory_ENConfigurationManager <= 30
          && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
        {
          LogPrintF_safe();
          objc_msgSend(WeakRetained, "_processServerConfiguration:forceUpdate:", v15, 1, v15);
        }
        else
        {
          objc_msgSend(WeakRetained, "_processServerConfiguration:forceUpdate:", v15, 1, v19);
        }
      }
      else if (gLogCategory_ENConfigurationManager <= 30
             && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }

      goto LABEL_32;
    }
    v13 = objc_msgSend(v10, "isEqual:", v11);

    if ((v13 & 1) == 0)
      goto LABEL_17;
  }
  if (gLogCategory_ENConfigurationManager <= 30
    && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
LABEL_32:

}

- (void)stopGracePeriodTimer
{
  void *v3;
  void *v4;

  -[ENConfigurationManager gracePeriodConfigurationFetchTimer](self, "gracePeriodConfigurationFetchTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (gLogCategory_ENConfigurationManager <= 30
      && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    -[ENConfigurationManager gracePeriodConfigurationFetchTimer](self, "gracePeriodConfigurationFetchTimer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

    -[ENConfigurationManager setGracePeriodConfigurationFetchTimer:](self, "setGracePeriodConfigurationFetchTimer:", 0);
  }
  CFPrefs_RemoveValue();
}

- (void)_processServerConfiguration:(id)a3 forceUpdate:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  _BOOL8 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;

  v4 = a4;
  v36 = a3;
  -[ENConfigurationManager activeEntity](self, "activeEntity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "entity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "region");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[ENConfigurationManager configurationStore](self, "configurationStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "serverConfigurationForRegion:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  -[ENConfigurationManager updateRegionMonitorModeForCurrentRegion](self, "updateRegionMonitorModeForCurrentRegion");
  +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isSensitiveLoggingAllowed");

  if ((v12 & 1) != 0
    && gLogCategory_ENConfigurationManager <= 30
    && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(v36, "region");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v4;
    v34 = objc_msgSend(v36, "hasSubdivisions");
    v28 = v13;
    LogPrintF_safe();

  }
  if ((objc_msgSend(v10, "enEnabled", v28, v32, v34) & 1) != 0)
  {
    if (v4)
    {
LABEL_19:
      -[ENConfigurationManager configurationStore](self, "configurationStore");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "region");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "configurationForRegion:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      -[ENConfigurationManager delegate](self, "delegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "configurationManager:exposureNotificationRegionConfigurationChanged:", self, v20);

      goto LABEL_31;
    }
  }
  else if ((objc_msgSend(v36, "enEnabled") & 1) != 0 || v4)
  {
    goto LABEL_19;
  }
  -[ENConfigurationManager gracePeriodConfigurationFetchTimer](self, "gracePeriodConfigurationFetchTimer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isSensitiveLoggingAllowed");

  if (v14)
  {
    if (v16
      && gLogCategory_ENConfigurationManager <= 30
      && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
    {
      -[ENConfigurationManager gracePeriodConfigurationFetchTimer](self, "gracePeriodConfigurationFetchTimer");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
  }
  else
  {
    if (v16
      && gLogCategory_ENConfigurationManager <= 30
      && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(v36, "region");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v36, "enVersion");
      v35 = objc_msgSend(v36, "enEnabled");
      v29 = v17;
      LogPrintF_safe();

    }
    if (objc_msgSend(v36, "enEnabled", v29, v33, v35))
      objc_msgSend(v36, "regionTransitionGracePeriod");
    else
      objc_msgSend(v36, "regionDisabledTransitionGracePeriod");
    v23 = v22;
    if (IsAppleInternalBuild())
    {
      CFPrefs_GetDouble();
      if (v24 > 0.0)
      {
        CFPrefs_GetDouble();
        v23 = v25;
        if (gLogCategory_ENConfigurationManager <= 30
          && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
        {
          v30 = v23;
          LogPrintF_safe();
        }
      }
    }
    objc_msgSend(MEMORY[0x1E0C99D60], "date", *(_QWORD *)&v30);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "dateByAddingTimeInterval:", v23);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "timeIntervalSince1970");
    CFPrefs_SetDouble();

    -[ENConfigurationManager setupGracePeriodFetchTimerWithDelay:](self, "setupGracePeriodFetchTimerWithDelay:", v23);
  }
LABEL_31:

}

- (void)refreshServerConfigurationsUponProfileChange
{
  NSObject *v4;
  _QWORD v5[6];

  -[ENConfigurationManager serialQueue](self, "serialQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __70__ENConfigurationManager_refreshServerConfigurationsUponProfileChange__block_invoke;
  v5[3] = &unk_1E87D9E80;
  v5[4] = self;
  v5[5] = a2;
  dispatch_async(v4, v5);

}

void __70__ENConfigurationManager_refreshServerConfigurationsUponProfileChange__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[5];
  id v34;
  id location;
  id v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "activeEntity");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "entity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "region");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (gLogCategory_ENConfigurationManager <= 30
      && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
      objc_msgSend(*(id *)(a1 + 32), "fetchServerConfigurationsForRegion:userInitiated:withCompletion:", v3, 0, &__block_literal_global_183, v3);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "fetchServerConfigurationsForRegion:userInitiated:withCompletion:", v3, 0, &__block_literal_global_183, v23);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "regionMonitor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  objc_msgSend(v4, "getCurrentRegionVisitWithError:", &v36);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v36;
  objc_msgSend(v5, "region");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (gLogCategory_ENConfigurationManager <= 30
    && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v25 = v6;
    v26 = v27;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();

  }
  if (v6 && (objc_msgSend(v6, "isEqual:", v3) & 1) == 0)
  {
    if (gLogCategory_ENConfigurationManager <= 30
      && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
    {
      v23 = v6;
      LogPrintF_safe();
    }
    objc_msgSend(v6, "countryCode", v23, v25, v26);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "countryCode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 32), "updateRegionMonitorModeForCurrentRegion");
      objc_msgSend(*(id *)(a1 + 32), "configurationStore");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "serverConfigurationForRegion:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
        objc_msgSend(*(id *)(a1 + 32), "_processServerConfiguration:forceUpdate:", v11, 1);

    }
    else
    {
      location = 0;
      objc_initWeak(&location, *(id *)(a1 + 32));
      v12 = *(void **)(a1 + 32);
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __70__ENConfigurationManager_refreshServerConfigurationsUponProfileChange__block_invoke_3;
      v33[3] = &unk_1E87DB6B0;
      objc_copyWeak(&v34, &location);
      v33[4] = v6;
      objc_msgSend(v12, "fetchServerConfigurationsForRegion:userInitiated:withCompletion:", v6, 0, v33);
      objc_destroyWeak(&v34);
      objc_destroyWeak(&location);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "configurationStore", v23);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "allCachedCountries");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v15 = v14;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v30 != v17)
          objc_enumerationMutation(v15);
        v19 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v3, "countryCode");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v19, "isEqualToString:", v20) & 1) == 0)
        {
          objc_msgSend(v6, "countryCode");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v19, "isEqualToString:", v21);

          if ((v22 & 1) != 0)
            continue;
          v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CAA378]), "initWithCountryCode:", v19);
          if (gLogCategory_ENConfigurationManager <= 30
            && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
          {
            LogPrintF_safe();
            objc_msgSend(*(id *)(a1 + 32), "fetchServerConfigurationsForRegion:userInitiated:withCompletion:", v20, 0, &__block_literal_global_188, v20);
          }
          else
          {
            objc_msgSend(*(id *)(a1 + 32), "fetchServerConfigurationsForRegion:userInitiated:withCompletion:", v20, 0, &__block_literal_global_188, v24);
          }
        }

      }
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v16);
  }

}

void __70__ENConfigurationManager_refreshServerConfigurationsUponProfileChange__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "updateRegionMonitorModeForCurrentRegion");
  if (v7)
  {
    if (gLogCategory__ENConfigurationManager <= 90
      && (gLogCategory__ENConfigurationManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }
  else
  {
    objc_msgSend(WeakRetained, "configurationStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "serverConfigurationForRegion:", *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      objc_msgSend(WeakRetained, "_processServerConfiguration:forceUpdate:", v6, 1);

  }
}

- (void)fetchServerConfigurationsForRegion:(id)a3 userInitiated:(BOOL)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a5;
  -[ENConfigurationManager serialQueue](self, "serialQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __90__ENConfigurationManager_fetchServerConfigurationsForRegion_userInitiated_withCompletion___block_invoke;
  v13[3] = &unk_1E87DB200;
  v13[4] = self;
  v14 = v8;
  v16 = a4;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

uint64_t __90__ENConfigurationManager_fetchServerConfigurationsForRegion_userInitiated_withCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchServerConfigurationsForRegion:userInitiated:completion:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

- (void)_fetchServerConfigurationsForRegion:(id)a3 userInitiated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __87__ENConfigurationManager__fetchServerConfigurationsForRegion_userInitiated_completion___block_invoke;
  v12[3] = &unk_1E87DA4A8;
  v12[4] = self;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[ENConfigurationManager _serverFetchRegionConfiguration:userInitiated:completion:](self, "_serverFetchRegionConfiguration:userInitiated:completion:", v11, v6, v12);

}

void __87__ENConfigurationManager__fetchServerConfigurationsForRegion_userInitiated_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "serialQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__ENConfigurationManager__fetchServerConfigurationsForRegion_userInitiated_completion___block_invoke_2;
  block[3] = &unk_1E87DB7B0;
  v8 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v12 = v5;
  v13 = v8;
  v14 = v6;
  v15 = *(id *)(a1 + 48);
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __87__ENConfigurationManager__fetchServerConfigurationsForRegion_userInitiated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_saveAndRemoveStaleConfigurations:region:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  result = *(_QWORD *)(a1 + 64);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  return result;
}

- (void)_saveAndRemoveStaleConfigurations:(id)a3 region:(id)a4 error:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  unint64_t v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  uint64_t v41;
  double v42;
  uint64_t v43;
  double v44;
  uint64_t v45;
  id v46;
  void *context;
  id *v48;
  id v49;
  void *v50;
  id v51;
  id v52;
  ENConfigurationManager *val;
  void (**v54)(_QWORD, _QWORD);
  id obj;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _QWORD v60[6];
  _QWORD v61[4];
  id v62;
  id v63;
  void *v64;
  id v65;
  id location;
  id v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v49 = a3;
  v52 = a4;
  v51 = a5;
  val = self;
  -[ENConfigurationManager delegate](self, "delegate");
  v8 = objc_claimAutoreleasedReturnValue();
  v50 = (void *)v8;
  if (v51)
  {
    if (gLogCategory__ENConfigurationManager <= 90
      && (gLogCategory__ENConfigurationManager != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(v52, "regionCode");
      v44 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      v45 = (uint64_t)v51;
      LogPrintF_safe();

    }
    -[ENConfigurationManager configurationStore](self, "configurationStore", *(_QWORD *)&v44, v45);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "configurationForRegion:", v52);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = v51;
      objc_msgSend(v13, "domain");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "isEqualToString:", CFSTR("ENConfigurationManagerErrorDomain")))
      {
        v15 = objc_msgSend(v13, "code");

        if (v15 == 5)
        {
          -[ENConfigurationManager configurationStore](val, "configurationStore");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = 0;
          v17 = objc_msgSend(v16, "removeConfigurationsForRegion:includingSubdivisions:error:", v52, 1, &v67);
          v18 = v67;

          if (v17)
          {
            objc_msgSend(v50, "configurationManager:exposureNotificationRegionConfigurationRemovedForRegion:", val, v52);
          }
          else if (gLogCategory__ENConfigurationManager <= 90
                 && (gLogCategory__ENConfigurationManager != -1 || _LogCategory_Initialize()))
          {
            LogPrintF_safe();
          }

        }
        goto LABEL_118;
      }

    }
    goto LABEL_118;
  }
  if (gLogCategory__ENConfigurationManager <= 30)
  {
    if (gLogCategory__ENConfigurationManager != -1 || (v8 = _LogCategory_Initialize(), (_DWORD)v8))
    {
      v10 = objc_msgSend(v49, "count");
      objc_msgSend(v52, "regionCode");
      v44 = *(double *)&v10;
      v45 = objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
  }
  context = (void *)MEMORY[0x1D17A7CB8](v8, v9);
  location = 0;
  objc_initWeak(&location, self);
  -[ENConfigurationManager configurationStore](self, "configurationStore");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "countryCode");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x1E0C809B0];
  v61[0] = MEMORY[0x1E0C809B0];
  v61[1] = 3221225472;
  v61[2] = __73__ENConfigurationManager__saveAndRemoveStaleConfigurations_region_error___block_invoke;
  v61[3] = &unk_1E87DB800;
  v48 = &v65;
  objc_copyWeak(&v65, &location);
  v22 = v49;
  v62 = v22;
  v23 = v52;
  v63 = v23;
  v64 = v50;
  objc_msgSend(v19, "enumerateCachedRegionServerConfigurationsWithCountryCode:handler:", v20, v61);

  v60[0] = v21;
  v60[1] = 3221225472;
  v60[2] = __73__ENConfigurationManager__saveAndRemoveStaleConfigurations_region_error___block_invoke_3;
  v60[3] = &unk_1E87DB828;
  v60[4] = val;
  v60[5] = v50;
  v54 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17A7E5C](v60);
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  obj = v22;
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
  if (v24)
  {
    v25 = 0;
    v26 = *(_QWORD *)v57;
    while (1)
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v57 != v26)
          objc_enumerationMutation(obj);
        v28 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v27);
        v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CAA390]), "initWithServerResponseDictionary:", v28);
        if (v29)
        {
          if (gLogCategory_ENConfigurationManager <= 30
            && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
          {
            objc_msgSend(v29, "region", *(_QWORD *)&v44, v45, v46, context, v48);
            v44 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
            LogPrintF_safe();

          }
          if (+[ENConfigurationManager isRampModeEnabledFromServerResponse:](ENConfigurationManager, "isRampModeEnabledFromServerResponse:", v28, *(_QWORD *)&v44))
          {
            objc_msgSend(v29, "region");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_msgSend(v30, "isEqual:", v23);

            if (v31)
            {
              v32 = +[ENConfigurationManager rampModeFromServerResponse:](ENConfigurationManager, "rampModeFromServerResponse:", v28);
              if (gLogCategory_ENConfigurationManager <= 30
                && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
              {
                v44 = *(double *)&v23;
                v45 = v32;
                LogPrintF_safe();
              }
              switch(v32)
              {
                case 1uLL:
                  if (gLogCategory_ENConfigurationManager <= 30
                    && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
                  {
                    v44 = *(double *)&v23;
                    v45 = 1;
                    LogPrintF_safe();
                  }
                  ((void (**)(_QWORD, void *))v54)[2](v54, v28);
                  v41 = -[ENConfigurationManager readCachedRampModeForRegion:](val, "readCachedRampModeForRegion:", v23);
                  if (v41 == 1
                    || gLogCategory_ENConfigurationManager > 90
                    || gLogCategory_ENConfigurationManager == -1 && !_LogCategory_Initialize())
                  {
                    goto LABEL_69;
                  }
                  break;
                case 2uLL:
                  if (gLogCategory_ENConfigurationManager <= 30
                    && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
                  {
                    v44 = *(double *)&v23;
                    v45 = 2;
                    LogPrintF_safe();
                  }
                  ((void (**)(_QWORD, void *))v54)[2](v54, v28);
                  v41 = -[ENConfigurationManager readCachedRampModeForRegion:](val, "readCachedRampModeForRegion:", v23);
                  if (v41 == 2
                    || gLogCategory_ENConfigurationManager > 90
                    || gLogCategory_ENConfigurationManager == -1 && !_LogCategory_Initialize())
                  {
                    goto LABEL_69;
                  }
                  break;
                case 3uLL:
                  -[ENConfigurationManager configurationStore](val, "configurationStore");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v29, "region");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v36, "serverConfigurationForRegion:", v37);
                  v38 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v38)
                  {
                    if (gLogCategory_ENConfigurationManager > 30
                      || gLogCategory_ENConfigurationManager == -1 && !_LogCategory_Initialize())
                    {
                      goto LABEL_88;
                    }
LABEL_57:
                    v44 = *(double *)&v23;
                    LogPrintF_safe();
                    goto LABEL_88;
                  }
                  +[ENConfigurationManager randomSelectPercentagePerDayFromServerResponse:](ENConfigurationManager, "randomSelectPercentagePerDayFromServerResponse:", v28);
                  v40 = v39;
                  if (gLogCategory_ENConfigurationManager <= 30
                    && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
                  {
                    v45 = *(_QWORD *)&v40;
                    v44 = *(double *)&v23;
                    LogPrintF_safe();
                  }
                  v42 = (double)arc4random() * 2.32830644e-10;
                  if (gLogCategory_ENConfigurationManager <= 30
                    && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
                  {
                    v44 = v42;
                    LogPrintF_safe();
                  }
                  if (v42 >= v40)
                    goto LABEL_69;
                  if (gLogCategory_ENConfigurationManager <= 30
                    && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
                  {
                    goto LABEL_57;
                  }
LABEL_88:
                  ((void (**)(_QWORD, void *))v54)[2](v54, v28);
                  -[ENConfigurationManager updateRampModeForRegion:rampMode:](val, "updateRampModeForRegion:rampMode:", v23, 3);
LABEL_69:
                  v25 = 1;
                  goto LABEL_70;
                default:
                  if (gLogCategory_ENConfigurationManager <= 90
                    && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
                  {
                    v44 = *(double *)&v23;
                    v45 = v32;
                    LogPrintF_safe();
                  }
                  goto LABEL_69;
              }
              v44 = *(double *)&v41;
              LogPrintF_safe();
              goto LABEL_69;
            }
            if (gLogCategory_ENConfigurationManager <= 30
              && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
            {
              objc_msgSend(v29, "region");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v45 = +[ENConfigurationManager rampModeFromServerResponse:](ENConfigurationManager, "rampModeFromServerResponse:", v28);
              v46 = v23;
              v44 = *(double *)&v33;
              LogPrintF_safe();

            }
          }
          else
          {
            ((void (**)(_QWORD, void *))v54)[2](v54, v28);
            if (gLogCategory_ENConfigurationManager <= 30
              && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
            {
              objc_msgSend(v29, "region");
              v44 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
              LogPrintF_safe();

            }
            objc_msgSend(v29, "region", *(_QWORD *)&v44);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = objc_msgSend(v34, "isEqual:", v23);

            if (v35)
            {
              if (gLogCategory_ENConfigurationManager <= 30
                && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
              {
                LogPrintF_safe();
                -[ENConfigurationManager updateRampModeForRegion:rampMode:](val, "updateRampModeForRegion:rampMode:", v23, 0, v23);
              }
              else
              {
                -[ENConfigurationManager updateRampModeForRegion:rampMode:](val, "updateRampModeForRegion:rampMode:", v23, 0, *(_QWORD *)&v44);
              }
              goto LABEL_69;
            }
          }
        }
        else if (gLogCategory_ENConfigurationManager <= 30
               && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
        {
          v44 = *(double *)&v28;
          LogPrintF_safe();
        }
LABEL_70:

        ++v27;
      }
      while (v24 != v27);
      v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
      v24 = v43;
      if (!v43)
      {

        if ((v25 & 1) != 0)
          goto LABEL_115;
        goto LABEL_108;
      }
    }
  }

LABEL_108:
  if (gLogCategory_ENConfigurationManager <= 30
    && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
LABEL_115:

  objc_destroyWeak(v48);
  objc_destroyWeak(&location);
  objc_autoreleasePoolPop(context);
LABEL_118:

}

void __73__ENConfigurationManager__saveAndRemoveStaleConfigurations_region_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  _QWORD v23[4];
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 1;
  v5 = *(void **)(a1 + 32);
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __73__ENConfigurationManager__saveAndRemoveStaleConfigurations_region_error___block_invoke_2;
  v23[3] = &unk_1E87DB7D8;
  v6 = v3;
  v24 = v6;
  v25 = &v26;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v23);
  if (*((_BYTE *)v27 + 24))
  {
    objc_msgSend(v6, "region");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isCountryCodeEqualToRegion:", *(_QWORD *)(a1 + 40));

    if (v8)
    {
      objc_msgSend(WeakRetained, "configurationStore");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "region");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 0;
      v11 = objc_msgSend(v9, "removeConfigurationsForRegion:includingSubdivisions:error:", v10, 0, &v22);
      v12 = v22;

      if (v11)
      {
        if (gLogCategory__ENConfigurationManager <= 30
          && (gLogCategory__ENConfigurationManager != -1 || _LogCategory_Initialize()))
        {
          objc_msgSend(v6, "region");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = *(_QWORD *)(a1 + 40);
          LogPrintF_safe();

        }
        objc_msgSend(WeakRetained, "activeEntity", v20, v21);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "entity");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "region");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "region");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v15, "isEqual:", v16);

        if (v17)
        {
          v18 = *(void **)(a1 + 48);
          objc_msgSend(v6, "region");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "configurationManager:exposureNotificationRegionConfigurationRemovedForRegion:", WeakRetained, v19);

        }
      }
      else if (gLogCategory__ENConfigurationManager <= 90
             && (gLogCategory__ENConfigurationManager != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }

    }
  }

  _Block_object_dispose(&v26, 8);
}

void __73__ENConfigurationManager__saveAndRemoveStaleConfigurations_region_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  id v11;

  v6 = (objc_class *)MEMORY[0x1E0CAA390];
  v7 = a2;
  v11 = (id)objc_msgSend([v6 alloc], "initWithServerResponseDictionary:", v7);

  objc_msgSend(*(id *)(a1 + 32), "region");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "region");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqual:", v9);

  if (v10)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }

}

void __73__ENConfigurationManager__saveAndRemoveStaleConfigurations_region_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "configurationStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v5 = objc_msgSend(v4, "saveServerConfigurationResponse:error:", v3, &v10);
  v6 = v10;

  if (v5)
  {
    +[ENConfigurationManager _printServerConfiguration:](ENConfigurationManager, "_printServerConfiguration:", v3);
  }
  else if (gLogCategory__ENConfigurationManager <= 90
         && (gLogCategory__ENConfigurationManager != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(v3, "allKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();

    objc_msgSend(*(id *)(a1 + 40), "configurationManager:errorDetected:", *(_QWORD *)(a1 + 32), 6003, v8, v6);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "configurationManager:errorDetected:", *(_QWORD *)(a1 + 32), 6003, v7, v9);
  }

}

- (void)overrideRampModeForRegion:(id)a3 rampMode:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v6 = a3;
  -[ENConfigurationManager regionRampModeOverride](self, "regionRampModeOverride");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99E00]);
    -[ENConfigurationManager setRegionRampModeOverride:](self, "setRegionRampModeOverride:", v8);

  }
  objc_msgSend(MEMORY[0x1E0CB37E0], "numberWithUnsignedInteger:", a4);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[ENConfigurationManager regionRampModeOverride](self, "regionRampModeOverride");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, v6);

}

+ (BOOL)isRampModeEnabledFromServerResponse:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    CFDictionaryGetTypeID();
    CFDictionaryGetTypedValue();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (CFDictionaryGetInt64Ranged() > 1)
    {
      v5 = CFDictionaryGetInt64() != 0;
    }
    else
    {
      if (gLogCategory_ENConfigurationManager <= 30
        && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)serverResponse:(id)a3 isOnRampMode:(unint64_t)a4
{
  id v5;
  BOOL v6;

  v5 = a3;
  objc_opt_class();
  v6 = (objc_opt_isKindOfClass() & 1) != 0
    && +[ENConfigurationManager isRampModeEnabledFromServerResponse:](ENConfigurationManager, "isRampModeEnabledFromServerResponse:", v5)&& +[ENConfigurationManager rampModeFromServerResponse:](ENConfigurationManager, "rampModeFromServerResponse:", v5) == a4;

  return v6;
}

+ (unint64_t)rampModeFromServerResponse:(id)a3
{
  id v3;
  void *v4;
  unint64_t Int64;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    CFDictionaryGetTypeID();
    CFDictionaryGetTypedValue();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    Int64 = CFDictionaryGetInt64();

  }
  else
  {
    Int64 = 0;
  }

  return Int64;
}

+ (double)randomSelectPercentagePerDayFromServerResponse:(id)a3
{
  id v3;
  double v4;
  void *v5;
  double v6;

  v3 = a3;
  objc_opt_class();
  v4 = 0.0;
  if ((objc_opt_isKindOfClass() & 1) != 0
    && +[ENConfigurationManager serverResponse:isOnRampMode:](ENConfigurationManager, "serverResponse:isOnRampMode:", v3, 3))
  {
    CFDictionaryGetTypeID();
    CFDictionaryGetTypedValue();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    CFDictionaryGetDouble();
    v4 = v6 / 100.0;

  }
  return v4;
}

- (void)setActiveEntity:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[ENConfigurationManager serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__ENConfigurationManager_setActiveEntity___block_invoke;
  block[3] = &unk_1E87D9DD8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

uint64_t __42__ENConfigurationManager_setActiveEntity___block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;
  int v4;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "isEqual:", *(_QWORD *)(a1 + 40));
  if ((result & 1) == 0)
  {
    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isSensitiveLoggingAllowed");

    if (v4
      && gLogCategory_ENConfigurationManager <= 30
      && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "_scheduleRegionConfigurationRefresh");
    return objc_msgSend(*(id *)(a1 + 32), "stopGracePeriodTimer");
  }
  return result;
}

- (void)updateRegionMonitorModeForCurrentRegion
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;

  -[ENConfigurationManager regionMonitor](self, "regionMonitor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v4, "getCurrentRegionVisitWithError:", &v16);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v16;
  objc_msgSend(v5, "region");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (gLogCategory_ENConfigurationManager <= 30
    && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
  {
    NSStringFromSelector(a2);
    v14 = v7;
    v15 = v6;
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();

  }
  if (v7)
  {
    -[ENConfigurationManager configurationStore](self, "configurationStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "regionSupportsSubdivisions:", v7);

    -[ENConfigurationManager regionMonitor](self, "regionMonitor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v9)
      v12 = 3;
    else
      v12 = 2;
    objc_msgSend(v10, "updateRegionMonitorMonitoringMode:", v12, v13, v14, v15);

  }
}

- (void)prefsChanged
{
  uint64_t Int64;
  _BOOL4 v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  _BOOL4 v8;
  const char *v9;
  const char *v10;

  if (gLogCategory_ENConfigurationManager <= 30
    && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  Int64 = CFPrefs_GetInt64();
  v4 = Int64 != 0;
  if (self->_prefTestHeaderEnabled != v4)
  {
    if (gLogCategory_ENConfigurationManager <= 30)
    {
      v5 = Int64;
      if (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize())
      {
        v6 = "yes";
        if (v5)
          v7 = "no";
        else
          v7 = "yes";
        if (!v5)
          v6 = "no";
        v9 = v7;
        v10 = v6;
        LogPrintF_safe();
      }
    }
    self->_prefTestHeaderEnabled = v4;
    -[ENConfigurationManager refreshServerConfigurationsUponProfileChange](self, "refreshServerConfigurationsUponProfileChange", v9, v10);
  }
  v8 = CFPrefs_GetInt64() != 0;
  if (self->_prefRampTrialPeriodProfile != v8)
  {
    if (gLogCategory_ENConfigurationManager <= 30
      && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    self->_prefRampTrialPeriodProfile = v8;
    -[ENConfigurationManager refreshServerConfigurationsUponProfileChange](self, "refreshServerConfigurationsUponProfileChange");
  }
}

+ (id)staticRegionForBundleID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  ENDaemonBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLForResource:withExtension:", CFSTR("RegionBundleID"), CFSTR(".plist"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D88], "dictionaryWithContentsOfURL:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)setRegionMonitor:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  ENConfigurationManager *v9;

  v4 = a3;
  -[ENConfigurationManager serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__ENConfigurationManager_setRegionMonitor___block_invoke;
  block[3] = &unk_1E87D9DD8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __43__ENConfigurationManager_setRegionMonitor___block_invoke(uint64_t a1)
{
  void *v2;
  id *v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = (id *)(*(_QWORD *)(a1 + 40) + 40);
  if (v2)
  {
    objc_storeStrong(v3, v2);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "setDelegate:");
  }
  else
  {
    objc_msgSend(*v3, "setDelegate:", 0);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = 0;

  }
}

- (void)regionMonitor:(id)a3 regionDidChange:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  ENConfigurationManager *v11;
  SEL v12;

  v6 = a4;
  -[ENConfigurationManager serialQueue](self, "serialQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__ENConfigurationManager_regionMonitor_regionDidChange___block_invoke;
  block[3] = &unk_1E87DA250;
  v10 = v6;
  v11 = self;
  v12 = a2;
  v8 = v6;
  dispatch_async(v7, block);

}

void __56__ENConfigurationManager_regionMonitor_regionDidChange___block_invoke(uint64_t a1)
{
  void *v1;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  const char *v26;
  const char *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id location;

  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    v3 = v1;
    objc_msgSend(*(id *)(a1 + 40), "configurationStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "serverConfigurationForRegion:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "configurationStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "subdivisionListForRegion:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (gLogCategory_ENConfigurationManager <= 30
      && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "activeEntity");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      v12 = "yes";
      if (v5)
        v13 = "yes";
      else
        v13 = "no";
      if (!v8)
        v12 = "no";
      v26 = v13;
      v27 = v12;
      v24 = v3;
      v25 = v10;
      v23 = v9;
      LogPrintF_safe();

    }
    objc_msgSend(*(id *)(a1 + 40), "activeEntity", v23, v24, v25, v26, v27);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "entity");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "region");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqual:", v3);

    if (v17)
      objc_msgSend(*(id *)(a1 + 40), "stopGracePeriodTimer");
    objc_msgSend(*(id *)(a1 + 40), "serverConfigurationFetchTimer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      if (v5)
      {
LABEL_15:
        v19 = *(void **)(a1 + 40);
        objc_msgSend(v19, "activeEntity");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "_processServerConfiguration:forceUpdate:", v5, v20 == 0);

LABEL_20:
        objc_msgSend(*(id *)(a1 + 40), "delegate");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "configurationManager:didResolveCurrentRegion:", *(_QWORD *)(a1 + 40), 1);

        return;
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "_scheduleRegionConfigurationRefresh");
      if (v5)
        goto LABEL_15;
    }
    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 40), "updateRegionMonitorModeForCurrentRegion");
    }
    else
    {
      location = 0;
      objc_initWeak(&location, *(id *)(a1 + 40));
      v21 = *(void **)(a1 + 40);
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __56__ENConfigurationManager_regionMonitor_regionDidChange___block_invoke_2;
      v28[3] = &unk_1E87DB6B0;
      objc_copyWeak(&v30, &location);
      v29 = v3;
      objc_msgSend(v21, "fetchServerConfigurationsForRegion:userInitiated:withCompletion:", v29, 0, v28);

      objc_destroyWeak(&v30);
      objc_destroyWeak(&location);
    }
    goto LABEL_20;
  }
  if (gLogCategory__ENConfigurationManager <= 90
    && (gLogCategory__ENConfigurationManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
}

void __56__ENConfigurationManager_regionMonitor_regionDidChange___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "updateRegionMonitorModeForCurrentRegion");
  if (v8)
  {
    if (gLogCategory__ENConfigurationManager <= 90
      && (gLogCategory__ENConfigurationManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }
  else
  {
    objc_msgSend(WeakRetained, "configurationStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "serverConfigurationForRegion:", *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(WeakRetained, "activeEntity");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "_processServerConfiguration:forceUpdate:", v6, v7 == 0);

    }
  }

}

- (void)regionMonitor:(id)a3 authorizationStateDidChange:(unint64_t)a4
{
  NSObject *v6;
  _QWORD v7[6];

  -[ENConfigurationManager serialQueue](self, "serialQueue", a3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__ENConfigurationManager_regionMonitor_authorizationStateDidChange___block_invoke;
  v7[3] = &unk_1E87D9E80;
  v7[4] = self;
  v7[5] = a4;
  dispatch_async(v6, v7);

}

void __68__ENConfigurationManager_regionMonitor_authorizationStateDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (gLogCategory_ENConfigurationManager <= 30
    && (gLogCategory_ENConfigurationManager != -1 || _LogCategory_Initialize()))
  {
    +[ENRegionMonitor regionMonitorAuthorizationStateToString:](ENRegionMonitor, "regionMonitorAuthorizationStateToString:", *(_QWORD *)(a1 + 40));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "activeEntity");
    v8 = v2;
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();

  }
  objc_msgSend(*(id *)(a1 + 32), "activeEntity", v8, v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "activeStatus") == 1)
  {
    v3 = *(_QWORD *)(a1 + 40);

    if (v3 == 1)
    {
      objc_msgSend(*(id *)(a1 + 32), "activeEntity");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "entity");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "region");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        objc_msgSend(*(id *)(a1 + 32), "delegate");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "configurationManager:exposureNotificationRegionConfigurationRemovedForRegion:", *(_QWORD *)(a1 + 32), v6);

      }
      objc_msgSend(*(id *)(a1 + 32), "stopGracePeriodTimer");
    }
  }
  else
  {

  }
}

- (ENConfigurationManagerDelegate)delegate
{
  return (ENConfigurationManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setConfigurationStore:(id)a3
{
  objc_storeStrong((id *)&self->_configurationStore, a3);
}

- (ENActiveEntity)activeEntity
{
  return self->_activeEntity;
}

- (ENRegionMonitor)regionMonitor
{
  return self->_regionMonitor;
}

- (BOOL)mobileCountryCodeOverriden
{
  return self->_mobileCountryCodeOverriden;
}

- (void)setMobileCountryCodeOverriden:(BOOL)a3
{
  self->_mobileCountryCodeOverriden = a3;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_delegateQueue, a3);
}

- (ENXPCTimer)serverConfigurationFetchTimer
{
  return self->_serverConfigurationFetchTimer;
}

- (void)setServerConfigurationFetchTimer:(id)a3
{
  objc_storeStrong((id *)&self->_serverConfigurationFetchTimer, a3);
}

- (ENXPCTimer)gracePeriodConfigurationFetchTimer
{
  return self->_gracePeriodConfigurationFetchTimer;
}

- (void)setGracePeriodConfigurationFetchTimer:(id)a3
{
  objc_storeStrong((id *)&self->_gracePeriodConfigurationFetchTimer, a3);
}

- (ENCloudServerChannel)cloudServerChannel
{
  return self->_cloudServerChannel;
}

- (void)setCloudServerChannel:(id)a3
{
  objc_storeStrong((id *)&self->_cloudServerChannel, a3);
}

- (NSMutableDictionary)regionRampModeOverride
{
  return self->_regionRampModeOverride;
}

- (void)setRegionRampModeOverride:(id)a3
{
  objc_storeStrong((id *)&self->_regionRampModeOverride, a3);
}

- (BOOL)prefTestHeaderEnabled
{
  return self->_prefTestHeaderEnabled;
}

- (void)setPrefTestHeaderEnabled:(BOOL)a3
{
  self->_prefTestHeaderEnabled = a3;
}

- (BOOL)prefRampTrialPeriodProfile
{
  return self->_prefRampTrialPeriodProfile;
}

- (void)setPrefRampTrialPeriodProfile:(BOOL)a3
{
  self->_prefRampTrialPeriodProfile = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regionRampModeOverride, 0);
  objc_storeStrong((id *)&self->_cloudServerChannel, 0);
  objc_storeStrong((id *)&self->_gracePeriodConfigurationFetchTimer, 0);
  objc_storeStrong((id *)&self->_serverConfigurationFetchTimer, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_regionMonitor, 0);
  objc_storeStrong((id *)&self->_activeEntity, 0);
  objc_storeStrong((id *)&self->_configurationStore, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

@implementation ENExposureDetectionManager

- (ENExposureDetectionManager)initWithConfigurationStore:(id)a3 downloadManager:(id)a4 exposureDatabase:(id)a5 queue:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  ENExposureDetectionManager *v15;
  ENExposureDetectionManager *v16;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *sessionQueue;
  objc_super v21;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)ENExposureDetectionManager;
  v15 = -[ENExposureDetectionManager init](&v21, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_configurationStore, a3);
    objc_storeStrong((id *)&v16->_downloadManager, a4);
    objc_storeStrong((id *)&v16->_exposureDatabase, a5);
    objc_storeStrong((id *)&v16->_queue, a6);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = dispatch_queue_create("ENSessions", v17);
    sessionQueue = v16->_sessionQueue;
    v16->_sessionQueue = (OS_dispatch_queue *)v18;

    v16->_scheduleDetectionAutomatically = 1;
  }

  return v16;
}

- (void)activate
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__ENExposureDetectionManager_activate__block_invoke;
  block[3] = &unk_1E87D9C28;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __38__ENExposureDetectionManager_activate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activate");
}

- (void)_activate
{
  void *v3;
  NSBackgroundActivityScheduler *v4;
  NSBackgroundActivityScheduler *detectionScheduler;
  ENXPCServiceClient *v6;
  ENXPCServiceClient *xpcServiceClient;

  if (!self->_activated)
  {
    objc_msgSend(MEMORY[0x1E0CB37C8], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__downloadsDidBecomeAvailable_, CFSTR("ENDownloadManagerDownloadsAvailable"), self->_downloadManager);

    -[ENExposureDetectionManager createScheduler](self, "createScheduler");
    v4 = (NSBackgroundActivityScheduler *)objc_claimAutoreleasedReturnValue();
    detectionScheduler = self->_detectionScheduler;
    self->_detectionScheduler = v4;

    -[ENExposureDetectionManager _unscheduleNativeExposureDetection](self, "_unscheduleNativeExposureDetection");
    -[ENExposureDetectionManager createXPCServiceClient](self, "createXPCServiceClient");
    v6 = (ENXPCServiceClient *)objc_claimAutoreleasedReturnValue();
    xpcServiceClient = self->_xpcServiceClient;
    self->_xpcServiceClient = v6;

    self->_activated = 1;
  }
}

- (void)invalidate
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__ENExposureDetectionManager_invalidate__block_invoke;
  block[3] = &unk_1E87D9C28;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __40__ENExposureDetectionManager_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (void)_invalidate
{
  void *v3;
  ENXPCServiceClient *xpcServiceClient;

  if (self->_activated)
  {
    -[ENExposureDetectionManager _unscheduleNativeExposureDetection](self, "_unscheduleNativeExposureDetection");
    objc_msgSend(MEMORY[0x1E0CB37C8], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:", self);

    objc_storeWeak((id *)&self->_delegate, 0);
    -[ENXPCServiceClient invalidate](self->_xpcServiceClient, "invalidate");
    xpcServiceClient = self->_xpcServiceClient;
    self->_xpcServiceClient = 0;

    self->_activated = 0;
  }
}

- (id)_getDelegateWithError:(id *)a3
{
  id WeakRetained;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained;
  }
  else if (a3)
  {
    ENErrorF();
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)_createDetectionSessionWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  ENExposureDetectionDaemonSession *v8;
  ENExposureDetectionDaemonSession *v9;

  -[ENExposureDetectionManager _getDelegateWithError:](self, "_getDelegateWithError:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    v9 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v5, "exposureDetectionManager:advertisementDatabaseQuerySessionWithAttenuationThreshold:error:", self, 255, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (-[ENExposureDatabase openWithError:](self->_exposureDatabase, "openWithError:", a3))
    {
      v8 = -[ENExposureDetectionDaemonSession initWithQueue:]([ENExposureDetectionDaemonSession alloc], "initWithQueue:", self->_sessionQueue);
      -[ENExposureDetectionDaemonSession setAdvertisementDatabaseQuerySession:](v8, "setAdvertisementDatabaseQuerySession:", v7);
      -[ENExposureDetectionDaemonSession setExposureDatabase:](v8, "setExposureDatabase:", self->_exposureDatabase);
      if (-[ENExposureDetectionManager _applyRegionalConfigurationToDetectionSession:delegate:error:](self, "_applyRegionalConfigurationToDetectionSession:delegate:error:", v8, v6, a3))
      {
        v9 = v8;
      }
      else
      {
        v9 = 0;
      }

      goto LABEL_7;
    }
  }
  else if (gLogCategory__ENExposureDetectionManager <= 90
         && (gLogCategory__ENExposureDetectionManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  v9 = 0;
LABEL_7:

LABEL_8:
  return v9;
}

- (BOOL)_applyRegionalConfigurationToDetectionSession:(id)a3 delegate:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a3;
  objc_msgSend(a4, "activeRegionForExposureDetectionManager:", self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[ENConfigurationStore configurationForRegion:](self->_configurationStore, "configurationForRegion:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRegionConfiguration:", v10);

    -[ENConfigurationStore serverConfigurationForRegion:](self->_configurationStore, "serverConfigurationForRegion:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRegionServerConfiguration:", v11);

    -[ENConfigurationStore serverExposureConfigurationForRegion:](self->_configurationStore, "serverExposureConfigurationForRegion:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setServerExposureConfiguration:", v12);

    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v11) = objc_msgSend(v13, "isSensitiveLoggingAllowed");

    if ((_DWORD)v11
      && gLogCategory_ENExposureDetectionManager <= 50
      && (gLogCategory_ENExposureDetectionManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }
  else if (a5)
  {
    ENErrorF();
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v9 != 0;
}

- (id)createDetectionSessionForClient:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *queue;
  void *v11;
  id v12;
  _QWORD block[7];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v8 = a3;
  v9 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__10;
  v19 = __Block_byref_object_dispose__10;
  v20 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__ENExposureDetectionManager_createDetectionSessionForClient_configuration_error___block_invoke;
  block[3] = &unk_1E87D9F68;
  block[4] = self;
  block[5] = &v15;
  block[6] = a5;
  dispatch_sync(queue, block);
  v11 = (void *)v16[5];
  if (v11)
  {
    objc_msgSend(v11, "setClient:", v8);
    objc_msgSend((id)v16[5], "setClientExposureConfiguration:", v9);
    v12 = (id)v16[5];
  }
  else
  {
    v12 = 0;
  }
  _Block_object_dispose(&v15, 8);

  return v12;
}

void __82__ENExposureDetectionManager_createDetectionSessionForClient_configuration_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_createDetectionSessionWithError:", *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)createFileSession
{
  objc_class *v2;
  ENXPCServiceClient *v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0CAA360];
  v3 = self->_xpcServiceClient;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithServiceClient:", v3);

  objc_msgSend(v4, "setFlags:", 1);
  return v4;
}

- (id)createNativeDetectionSessionWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  -[ENExposureDetectionManager _createDetectionSessionWithError:](self, "_createDetectionSessionWithError:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    goto LABEL_16;
  objc_msgSend(v4, "regionConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    if (a3)
      goto LABEL_15;
    goto LABEL_16;
  }
  objc_msgSend(v5, "serverExposureConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    if (a3)
      goto LABEL_15;
    goto LABEL_16;
  }
  objc_msgSend(v5, "regionServerConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    if (a3)
      goto LABEL_15;
    goto LABEL_16;
  }
  objc_msgSend(v5, "regionConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "userConsent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "consent");

  if (v11 != 2)
  {
    if (a3)
    {
LABEL_15:
      ENErrorF();
      v12 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
LABEL_16:
    v12 = 0;
    goto LABEL_7;
  }
  v12 = v5;
LABEL_7:

  return v12;
}

- (void)performNativeExposureDetectionWithResultHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __78__ENExposureDetectionManager_performNativeExposureDetectionWithResultHandler___block_invoke;
  v7[3] = &unk_1E87DA188;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __78__ENExposureDetectionManager_performNativeExposureDetectionWithResultHandler___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __78__ENExposureDetectionManager_performNativeExposureDetectionWithResultHandler___block_invoke_2;
  v2[3] = &unk_1E87DC178;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "_performNativeExposureDetectionWithScheduler:resultHandler:", 0, v2);

}

uint64_t __78__ENExposureDetectionManager_performNativeExposureDetectionWithResultHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_performNativeExposureDetectionWithScheduler:(id)a3 resultHandler:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  id v10;
  void (**v11)(_QWORD);
  id *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id *v16;
  char v17;
  id *v18;
  char v19;
  ENDownloadManager *downloadManager;
  id *v21;
  id v22;
  _BOOL4 v23;
  id *v24;
  void *v25;
  uint64_t v26;
  id v27;
  const char *v28;
  const char *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  uint64_t v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void (**v39)(_QWORD);
  id v40;
  id v41;
  id v42;
  _QWORD v43[4];
  id v44;
  ENExposureDetectionManager *v45;
  id v46;
  id v47;
  uint64_t *v48;
  uint64_t *v49;
  uint64_t *v50;
  id obj;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  char v63;
  id v64;
  id v65;
  id v66;
  id v67;
  _QWORD v68[4];
  id v69;
  id v70;
  uint64_t *v71;
  uint64_t v72;
  id *v73;
  uint64_t v74;
  uint64_t (*v75)(uint64_t, uint64_t);
  void (*v76)(uint64_t);
  id v77;

  v6 = a3;
  v7 = a4;
  if (gLogCategory_ENExposureDetectionManager <= 50
    && (gLogCategory_ENExposureDetectionManager != -1 || _LogCategory_Initialize()))
  {
    v8 = "background";
    if (!v6)
      v8 = "immediate";
    v35 = v8;
    LogPrintF_safe();
  }
  v72 = 0;
  v73 = (id *)&v72;
  v74 = 0x3032000000;
  v75 = __Block_byref_object_copy__10;
  v76 = __Block_byref_object_dispose__10;
  v9 = MEMORY[0x1E0C809B0];
  v77 = 0;
  v68[0] = MEMORY[0x1E0C809B0];
  v68[1] = 3221225472;
  v68[2] = __89__ENExposureDetectionManager__performNativeExposureDetectionWithScheduler_resultHandler___block_invoke;
  v68[3] = &unk_1E87DC1A0;
  v69 = 0;
  v10 = v7;
  v70 = v10;
  v71 = &v72;
  v11 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v68);
  if (self->_enableNativeExposureDetection)
  {
    v12 = v73;
    v67 = v73[5];
    -[ENExposureDetectionManager createNativeDetectionSessionWithError:](self, "createNativeDetectionSessionWithError:", &v67);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v12 + 5, v67);
    if (v13)
    {
      v39 = v11;
      objc_msgSend(v13, "exposureDatabase");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = 0;
      v15 = objc_opt_class();
      v16 = v73;
      v65 = v73[5];
      v17 = objc_msgSend(v14, "getValue:forKey:ofClass:error:", &v66, CFSTR("LastExposureClassification"), v15, &v65);
      v41 = v66;
      objc_storeStrong(v16 + 5, v65);

      if ((v17 & 1) != 0)
      {
        objc_msgSend(v13, "setPreviousExposureClassification:", v41);
        v18 = v73;
        v64 = v73[5];
        v19 = objc_msgSend(v13, "prepareAndReturnError:", &v64);
        objc_storeStrong(v18 + 5, v64);
        if ((v19 & 1) != 0)
        {
          v40 = objc_alloc_init(MEMORY[0x1E0C99E00]);
          v60 = 0;
          v61 = &v60;
          v62 = 0x2020000000;
          v63 = 0;
          v63 = objc_msgSend(v6, "shouldDefer");
          v56 = 0;
          v57 = &v56;
          v58 = 0x2020000000;
          v59 = 0;
          v52 = 0;
          v53 = &v52;
          v54 = 0x2020000000;
          v55 = 0;
          downloadManager = self->_downloadManager;
          v21 = v73;
          obj = v73[5];
          v43[0] = v9;
          v43[1] = 3221225472;
          v43[2] = __89__ENExposureDetectionManager__performNativeExposureDetectionWithScheduler_resultHandler___block_invoke_2;
          v43[3] = &unk_1E87DC1C8;
          v44 = v6;
          v45 = self;
          v48 = &v60;
          v46 = v40;
          v22 = v13;
          v47 = v22;
          v49 = &v52;
          v50 = &v56;
          v23 = -[ENDownloadManager enumerateDownloadsWithError:handler:](downloadManager, "enumerateDownloadsWithError:handler:", &obj, v43);
          objc_storeStrong(v21 + 5, obj);
          if (v23)
          {
            v24 = v73;
            v42 = v73[5];
            objc_msgSend(v22, "finishAndReturnError:", &v42);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_storeStrong(v24 + 5, v42);
          }
          else
          {
            v25 = 0;
          }
          if (gLogCategory_ENExposureDetectionManager <= 50
            && (gLogCategory_ENExposureDetectionManager != -1 || _LogCategory_Initialize()))
          {
            v28 = "";
            v29 = "un";
            if (v25)
              v29 = "";
            if (*((_BYTE *)v61 + 24))
              v28 = " (deferred)";
            v37 = v57[3];
            v38 = v53[3];
            v35 = v29;
            v36 = v28;
            LogPrintF_safe();
          }
          if (v25)
          {
            objc_msgSend(v25, "summary");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(v31, "isSensitiveLoggingAllowed");

            if (v32
              && gLogCategory_ENExposureDetectionManager <= 30
              && (gLogCategory_ENExposureDetectionManager != -1 || _LogCategory_Initialize()))
            {
              objc_msgSend(v30, "daySummaries", v35, v36, v37, v38);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "count");
              LogPrintF_safe();

            }
            CFPrefs_SetValue();
            -[ENExposureDetectionManager _exposureDetectionSession:finishedWithResult:](self, "_exposureDetectionSession:finishedWithResult:", v22, v25);
            -[ENExposureDetectionManager _unscheduleNativeExposureDetection](self, "_unscheduleNativeExposureDetection");
          }
          else
          {
            if (gLogCategory__ENExposureDetectionManager > 90
              || gLogCategory__ENExposureDetectionManager == -1 && !_LogCategory_Initialize())
            {
LABEL_37:
              if (*((_BYTE *)v61 + 24))
                v34 = 2;
              else
                v34 = 1;
              (*((void (**)(id, void *, uint64_t, id))v10 + 2))(v10, v25, v34, v73[5]);
              objc_msgSend(v22, "invalidate");

              _Block_object_dispose(&v52, 8);
              _Block_object_dispose(&v56, 8);
              _Block_object_dispose(&v60, 8);

              goto LABEL_41;
            }
            CUPrintNSError();
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            LogPrintF_safe();
          }

          goto LABEL_37;
        }
        if (gLogCategory__ENExposureDetectionManager <= 90
          && (gLogCategory__ENExposureDetectionManager != -1 || _LogCategory_Initialize()))
        {
          LogPrintF_safe();
        }
      }
      v11[2](v11);
LABEL_41:

      v11 = v39;
      goto LABEL_42;
    }
  }
  else
  {
    ENErrorF();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = v73[5];
    v73[5] = (id)v26;

  }
  v11[2](v11);
  v13 = 0;
LABEL_42:

  _Block_object_dispose(&v72, 8);
}

uint64_t __89__ENExposureDetectionManager__performNativeExposureDetectionWithScheduler_resultHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __89__ENExposureDetectionManager__performNativeExposureDetectionWithScheduler_resultHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, _QWORD *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v18;

  v7 = a2;
  v8 = a3;
  if (!objc_msgSend(*(id *)(a1 + 32), "shouldDefer"))
  {
    v10 = (void *)MEMORY[0x1D17A7CB8]();
    objc_msgSend(v8, "region");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(*(id *)(a1 + 40), "_publicKeyForRegion:dictionary:", v11, *(_QWORD *)(a1 + 48));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        v13 = *(void **)(a1 + 40);
        v14 = *(_QWORD *)(a1 + 56);
        v18 = 0;
        v9 = objc_msgSend(v13, "_processFileAtURL:publicKey:endpoint:session:error:", v7, v12, v8, v14, &v18);
        v15 = v18;

        objc_autoreleasePoolPop(v10);
        if (v9 == 1)
        {
          v16 = *(_QWORD *)(a1 + 80);
          goto LABEL_15;
        }
        if (v9 == 2)
        {
          v16 = *(_QWORD *)(a1 + 72);
LABEL_15:
          ++*(_QWORD *)(*(_QWORD *)(v16 + 8) + 24);
LABEL_16:

          goto LABEL_17;
        }
LABEL_12:
        if (a4)
        {
          v15 = objc_retainAutorelease(v15);
          *a4 = v15;
        }
        goto LABEL_16;
      }
    }
    else
    {

    }
    ENErrorF();
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v10);
    v9 = 0;
    goto LABEL_12;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
  if (a4)
  {
    ENErrorF();
    v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
LABEL_17:

  return v9;
}

- (void)_exposureDetectionSession:(id)a3 finishedWithResult:(id)a4
{
  ENExposureDatabase *exposureDatabase;
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  id v10;
  id WeakRetained;
  void *v12;
  id v13;

  exposureDatabase = self->_exposureDatabase;
  v6 = a4;
  objc_msgSend(v6, "exposureClassification");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ENDefaultExpirationDate();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v9 = -[ENExposureDatabase setValue:forKey:expiryDate:error:](exposureDatabase, "setValue:forKey:expiryDate:error:", v7, CFSTR("LastExposureClassification"), v8, &v13);
  v10 = v13;

  if (!v9
    && gLogCategory__ENExposureDetectionManager <= 90
    && (gLogCategory__ENExposureDetectionManager != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSError();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "exposureDetectionManager:finishedSessionWithResult:", self, v6);

}

- (id)_publicKeyForRegion:(id)a3 dictionary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v18;
  id v19;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = v9;
    }
    else
    {
      -[ENConfigurationStore serverConfigurationForRegion:](self->_configurationStore, "serverConfigurationForRegion:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        objc_msgSend(v11, "publicKey");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = *MEMORY[0x1E0CD6A08];
        v19 = 0;
        +[ENSecKey keyFromBase64String:keyClass:error:](ENSecKey, "keyFromBase64String:keyClass:error:", v13, v14, &v19);
        v10 = (id)objc_claimAutoreleasedReturnValue();
        v15 = v19;

        if (v10)
        {
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, v6);
          v16 = v10;
        }
        else if (gLogCategory__ENExposureDetectionManager <= 90
               && (gLogCategory__ENExposureDetectionManager != -1 || _LogCategory_Initialize()))
        {
          CUPrintNSError();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          LogPrintF_safe();

        }
      }
      else
      {
        if (gLogCategory__ENExposureDetectionManager <= 90
          && (gLogCategory__ENExposureDetectionManager != -1 || _LogCategory_Initialize()))
        {
          LogPrintF_safe();
        }
        v10 = 0;
      }

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (int64_t)_processFileAtURL:(id)a3 publicKey:(id)a4 endpoint:(id)a5 session:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id WeakRetained;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  char v20;
  void *v21;
  char v22;
  char v23;
  id v24;
  int64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v33;
  void *v34;
  id v35;
  void (**v36)(_QWORD);
  id v37;
  id v38;
  _QWORD v39[5];
  id v40;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v11, "path");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isSensitiveLoggingAllowed");

  if (v18
    && gLogCategory_ENExposureDetectionManager <= 10
    && (gLogCategory_ENExposureDetectionManager != -1 || _LogCategory_Initialize()))
  {
    v33 = v16;
    LogPrintF_safe();
  }
  if (v16)
  {
    objc_msgSend(v16, "pathExtension");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("zip"));

    if ((v20 & 1) != 0)
    {
      -[ENExposureDetectionManager createFileSession](self, "createFileSession");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = 0;
      v22 = objc_msgSend(v21, "activateWithArchivePath:error:", v16, &v40);
      v37 = v40;
      if ((v22 & 1) == 0)
      {
        if (gLogCategory__ENExposureDetectionManager <= 90
          && (gLogCategory__ENExposureDetectionManager != -1 || _LogCategory_Initialize()))
        {
          CUPrintNSError();
          v33 = v16;
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          LogPrintF_safe();

        }
        objc_msgSend(WeakRetained, "exposureDetectionManager:errorDetected:", self, 3002, v33, v34);
        v25 = 2;
        goto LABEL_36;
      }
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __81__ENExposureDetectionManager__processFileAtURL_publicKey_endpoint_session_error___block_invoke;
      v39[3] = &unk_1E87D9C28;
      v39[4] = v21;
      v36 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v39);
      v38 = 0;
      v23 = objc_msgSend(v14, "addMatchesFromFileSession:publicKey:endpoint:error:", v21, v12, v13, &v38);
      v24 = v38;
      if ((v23 & 1) != 0)
      {
        v25 = 1;
LABEL_35:

        v36[2](v36);
LABEL_36:

        goto LABEL_37;
      }
      v35 = v24;
      objc_msgSend(v24, "domain");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v26, "isEqualToString:", CFSTR("ENExposureDetectionDaemonSessionErrorDomain")))
      {
        v27 = objc_msgSend(v35, "code");

        if (v27 == 2)
        {
          objc_msgSend(v21, "signatures");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "firstObject");
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if (v29)
          {
            if (gLogCategory__ENExposureDetectionManager > 90
              || gLogCategory__ENExposureDetectionManager == -1 && !_LogCategory_Initialize())
            {
              v31 = 3003;
              goto LABEL_34;
            }
            CUPrintNSError();
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = v16;
            v34 = v30;
            LogPrintF_safe();
            v31 = 3003;
          }
          else
          {
            if (gLogCategory__ENExposureDetectionManager > 90
              || gLogCategory__ENExposureDetectionManager == -1 && !_LogCategory_Initialize())
            {
              v31 = 3001;
              goto LABEL_34;
            }
            CUPrintNSError();
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = v16;
            v34 = v30;
            LogPrintF_safe();
            v31 = 3001;
          }
          goto LABEL_29;
        }
      }
      else
      {

      }
      if (gLogCategory__ENExposureDetectionManager > 90
        || gLogCategory__ENExposureDetectionManager == -1 && !_LogCategory_Initialize())
      {
        v31 = 3004;
        goto LABEL_34;
      }
      CUPrintNSError();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v16;
      v34 = v30;
      LogPrintF_safe();
      v31 = 3004;
LABEL_29:

LABEL_34:
      objc_msgSend(WeakRetained, "exposureDetectionManager:errorDetected:", self, v31, v33, v34);
      v25 = 2;
      v24 = v35;
      goto LABEL_35;
    }
  }
  if (gLogCategory__ENExposureDetectionManager <= 90
    && (gLogCategory__ENExposureDetectionManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  objc_msgSend(WeakRetained, "exposureDetectionManager:errorDetected:", self, 3000, v33);
  v25 = 2;
LABEL_37:

  return v25;
}

uint64_t __81__ENExposureDetectionManager__processFileAtURL_publicKey_endpoint_session_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (void)scheduleNativeExposureDetectionForced:(BOOL)a3
{
  NSObject *queue;
  _QWORD v4[5];
  BOOL v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __68__ENExposureDetectionManager_scheduleNativeExposureDetectionForced___block_invoke;
  v4[3] = &unk_1E87DC1F0;
  v4[4] = self;
  v5 = a3;
  dispatch_async(queue, v4);
}

uint64_t __68__ENExposureDetectionManager_scheduleNativeExposureDetectionForced___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_scheduleNativeExposureDetectionForced:", *(unsigned __int8 *)(a1 + 40));
}

- (void)_scheduleNativeExposureDetectionForced:(BOOL)a3
{
  _BOOL4 v3;
  ENDownloadManager *downloadManager;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  int v12;
  BOOL v13;
  id v14;
  id v15;

  v3 = a3;
  downloadManager = self->_downloadManager;
  v15 = 0;
  -[ENDownloadManager countOfAvailableDownloadsWithError:](downloadManager, "countOfAvailableDownloadsWithError:", &v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v15;
  v8 = v7;
  if (!v6)
  {
    v9 = v7;
    objc_msgSend(v9, "domain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CAA290]) & 1) != 0)
    {
      v11 = objc_msgSend(v9, "code");

      v12 = v11 == 16 ? 30 : 90;
    }
    else
    {

      v12 = 90;
    }
    if (v12 >= gLogCategory_ENExposureDetectionManager
      && (gLogCategory_ENExposureDetectionManager != -1 || _LogCategory_Initialize()))
    {
      v14 = v9;
      LogPrintF_safe();
    }
  }
  if (objc_msgSend(v6, "unsignedIntValue", v14))
    v13 = 0;
  else
    v13 = !v3;
  if (v13)
  {
    -[ENExposureDetectionManager _unscheduleNativeExposureDetection](self, "_unscheduleNativeExposureDetection");
  }
  else if (-[ENExposureDetectionManager _scheduleNativeExposureDetection](self, "_scheduleNativeExposureDetection")
         && gLogCategory_ENExposureDetectionManager <= 30
         && (gLogCategory_ENExposureDetectionManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }

}

- (void)_downloadsDidBecomeAvailable:(id)a3
{
  id v4;

  v4 = a3;
  if (gLogCategory_ENExposureDetectionManager <= 30
    && (gLogCategory_ENExposureDetectionManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  if (self->_scheduleDetectionAutomatically)
    -[ENExposureDetectionManager scheduleNativeExposureDetectionForced:](self, "scheduleNativeExposureDetectionForced:", 0);

}

- (BOOL)_scheduleNativeExposureDetection
{
  NSBackgroundActivityScheduler *detectionScheduler;
  NSBackgroundActivityScheduler *v4;
  NSBackgroundActivityScheduler *v5;
  xpc_object_t v6;
  NSBackgroundActivityScheduler *v7;
  _QWORD v9[5];

  detectionScheduler = self->_detectionScheduler;
  if (detectionScheduler)
  {
    if (gLogCategory_ENExposureDetectionManager <= 10
      && (gLogCategory_ENExposureDetectionManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }
  else
  {
    -[ENExposureDetectionManager createScheduler](self, "createScheduler");
    v4 = (NSBackgroundActivityScheduler *)objc_claimAutoreleasedReturnValue();
    v5 = self->_detectionScheduler;
    self->_detectionScheduler = v4;

    -[NSBackgroundActivityScheduler setQualityOfService:](self->_detectionScheduler, "setQualityOfService:", 17);
    -[NSBackgroundActivityScheduler setInterval:](self->_detectionScheduler, "setInterval:", 900.0);
    -[NSBackgroundActivityScheduler setTolerance:](self->_detectionScheduler, "setTolerance:", 810.0);
    -[NSBackgroundActivityScheduler setRepeats:](self->_detectionScheduler, "setRepeats:", 0);
    v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v6, (const char *)*MEMORY[0x1E0C80738], 1);
    xpc_dictionary_set_BOOL(v6, (const char *)*MEMORY[0x1E0C808B8], 1);
    -[NSBackgroundActivityScheduler _setAdditionalXPCActivityProperties:](self->_detectionScheduler, "_setAdditionalXPCActivityProperties:", v6);
    v7 = self->_detectionScheduler;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __62__ENExposureDetectionManager__scheduleNativeExposureDetection__block_invoke;
    v9[3] = &unk_1E87DC218;
    v9[4] = self;
    -[NSBackgroundActivityScheduler scheduleWithBlock:](v7, "scheduleWithBlock:", v9);
    if (gLogCategory_ENExposureDetectionManager <= 10
      && (gLogCategory_ENExposureDetectionManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }

  }
  return detectionScheduler == 0;
}

void __62__ENExposureDetectionManager__scheduleNativeExposureDetection__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v3 = a2;
  if (gLogCategory_ENExposureDetectionManager <= 50
    && (gLogCategory_ENExposureDetectionManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 40);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__ENExposureDetectionManager__scheduleNativeExposureDetection__block_invoke_2;
  block[3] = &unk_1E87DA188;
  block[4] = v4;
  v8 = v3;
  v6 = v3;
  dispatch_sync(v5, block);

}

void __62__ENExposureDetectionManager__scheduleNativeExposureDetection__block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v3 = *(_QWORD **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v4 = v3[9];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __62__ENExposureDetectionManager__scheduleNativeExposureDetection__block_invoke_3;
  v5[3] = &unk_1E87DC178;
  v6 = v2;
  objc_msgSend(v3, "_performNativeExposureDetectionWithScheduler:resultHandler:", v4, v5);
  objc_msgSend(*(id *)(a1 + 32), "_unscheduleNativeExposureDetection");

}

void __62__ENExposureDetectionManager__scheduleNativeExposureDetection__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  id v8;

  v8 = a2;
  v6 = a4;
  if (!v8
    && gLogCategory__ENExposureDetectionManager <= 90
    && (gLogCategory__ENExposureDetectionManager != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSError();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();

  }
  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));

}

- (void)_unscheduleNativeExposureDetection
{
  NSBackgroundActivityScheduler *detectionScheduler;

  if (self->_detectionScheduler)
  {
    if (gLogCategory_ENExposureDetectionManager <= 30
      && (gLogCategory_ENExposureDetectionManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    -[NSBackgroundActivityScheduler invalidate](self->_detectionScheduler, "invalidate");
    detectionScheduler = self->_detectionScheduler;
    self->_detectionScheduler = 0;

  }
}

- (id)createScheduler
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB34B8]), "initWithIdentifier:", CFSTR("com.apple.ExposureNotification.detection"));
}

- (id)createXPCServiceClient
{
  return objc_alloc_init(MEMORY[0x1E0CAA3F0]);
}

- (ENExposureDetectionManagerDelegate)delegate
{
  return (ENExposureDetectionManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSBackgroundActivityScheduler)detectionScheduler
{
  return self->_detectionScheduler;
}

- (BOOL)enableNativeExposureDetection
{
  return self->_enableNativeExposureDetection;
}

- (void)setEnableNativeExposureDetection:(BOOL)a3
{
  self->_enableNativeExposureDetection = a3;
}

- (BOOL)scheduleDetectionAutomatically
{
  return self->_scheduleDetectionAutomatically;
}

- (void)setScheduleDetectionAutomatically:(BOOL)a3
{
  self->_scheduleDetectionAutomatically = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectionScheduler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sessionQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_xpcServiceClient, 0);
  objc_storeStrong((id *)&self->_exposureDatabase, 0);
  objc_storeStrong((id *)&self->_downloadManager, 0);
  objc_storeStrong((id *)&self->_configurationStore, 0);
}

@end

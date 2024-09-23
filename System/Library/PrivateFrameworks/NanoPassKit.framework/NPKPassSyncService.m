@implementation NPKPassSyncService

- (NPKPassSyncService)initWithPassSyncEngineRole:(unint64_t)a3
{
  id v4;
  dispatch_queue_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NPKPassSyncServiceSyncStatus *v9;
  void *v10;
  void *v11;
  void *v12;
  NPKPassSyncEngine *v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  id location;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)NPKPassSyncService;
  v4 = -[NPKPassSyncService init](&v22, sel_init);
  if (v4)
  {
    v5 = dispatch_queue_create("com.apple.nanopassd.passsync", 0);
    v6 = (void *)*((_QWORD *)v4 + 4);
    *((_QWORD *)v4 + 4) = v5;

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4FCB8]), "initWithService:", CFSTR("com.apple.private.alloy.passbook.general"));
    objc_msgSend(v7, "setProtobufAction:forIncomingRequestsOfType:", sel_syncStateChanged_, 40);
    objc_msgSend(v7, "setProtobufAction:forIncomingRequestsOfType:", sel_syncStateChangeProcessed_, 41);
    objc_msgSend(v7, "setProtobufAction:forIncomingRequestsOfType:", sel_reconciledStateUnrecognized_, 42);
    objc_msgSend(v7, "setProtobufAction:forIncomingRequestsOfType:", sel_proposedReconciledState_, 43);
    objc_msgSend(v7, "setProtobufAction:forIncomingRequestsOfType:", sel_reconciledStateAccepted_, 44);
    objc_msgSend(v7, "setProtobufAction:forIncomingRequestsOfType:", sel_passSettingsChanged_, 31);
    objc_msgSend(v7, "setProtobufAction:forIncomingRequestsOfType:", sel_catalogChanged_, 7);
    objc_msgSend(v7, "setProtobufAction:forIncomingRequestsOfType:", sel_associatedPassDataRequested_, 45);
    objc_msgSend(v7, "addDelegate:queue:", v4, *((_QWORD *)v4 + 4));
    objc_storeStrong((id *)v4 + 3, v7);
    objc_initWeak(&location, v4);
    v8 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, *((dispatch_queue_t *)v4 + 4));
    dispatch_source_set_timer(v8, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    v16 = MEMORY[0x24BDAC760];
    v17 = 3221225472;
    v18 = __49__NPKPassSyncService_initWithPassSyncEngineRole___block_invoke;
    v19 = &unk_24CFE7970;
    objc_copyWeak(&v20, &location);
    dispatch_source_set_event_handler(v8, &v16);
    dispatch_resume(v8);
    objc_storeStrong((id *)v4 + 5, v8);
    v9 = objc_alloc_init(NPKPassSyncServiceSyncStatus);
    v10 = (void *)*((_QWORD *)v4 + 7);
    *((_QWORD *)v4 + 7) = v9;

    objc_msgSend(v4, "_archivedPassSyncEngine", v16, v17, v18, v19);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
      v13 = v11;
    else
      v13 = -[NPKPassSyncEngine initWithRole:]([NPKPassSyncEngine alloc], "initWithRole:", a3);
    v14 = (void *)*((_QWORD *)v4 + 2);
    *((_QWORD *)v4 + 2) = v13;

    objc_msgSend(*((id *)v4 + 2), "setDelegate:", v4);
    objc_msgSend(*((id *)v4 + 2), "setDataSource:", v4);
    objc_destroyWeak(&v20);

    objc_destroyWeak(&location);
  }
  return (NPKPassSyncService *)v4;
}

void __49__NPKPassSyncService_initWithPassSyncEngineRole___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_archiveTimerFired");

}

- (void)start
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  NSObject *passSyncQueue;
  _QWORD block[5];
  uint8_t buf[16];

  pk_Sync_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_Sync_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Pass sync service: starting", buf, 2u);
    }

  }
  passSyncQueue = self->_passSyncQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __27__NPKPassSyncService_start__block_invoke;
  block[3] = &unk_24CFE7998;
  block[4] = self;
  dispatch_async(passSyncQueue, block);
}

uint64_t __27__NPKPassSyncService_start__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_provideUpdatedLibraryStateToSyncEngineAndSyncIfNecessary:", 0);
}

- (void)teardownSync
{
  -[NPKPassSyncService setDropAllMessages:](self, "setDropAllMessages:", 1);
}

- (void)handlePassLibraryChanged
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  uint8_t v6[16];

  pk_Sync_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_Sync_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Pass sync service: pass library changed", v6, 2u);
    }

  }
  -[NPKPassSyncService updatePassLibrary](self, "updatePassLibrary");
}

- (void)updatePassLibrary
{
  NSObject *passSyncQueue;
  _QWORD block[5];

  passSyncQueue = self->_passSyncQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__NPKPassSyncService_updatePassLibrary__block_invoke;
  block[3] = &unk_24CFE7998;
  block[4] = self;
  dispatch_async(passSyncQueue, block);
}

uint64_t __39__NPKPassSyncService_updatePassLibrary__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_provideUpdatedLibraryStateToSyncEngineAndSyncIfNecessary:", 1);
}

- (void)requestAssociatedData:(unint64_t)a3 forPassWithUniqueID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  NPKProtoPassAssociatedDataRequest *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  IDSService *passSyncService;
  id v26;
  void *v27;
  NSObject *v28;
  _BOOL4 v29;
  NSObject *v30;
  NSObject *v31;
  _BOOL4 v32;
  const char *v33;
  NSObject *v34;
  _BOOL4 v35;
  NSObject *p_super;
  uint32_t v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[5];
  _QWORD v41[5];
  uint8_t buf[4];
  id v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("46D8FA11-A747-4C0B-B4F4-0AB1308739B4"));
  NPKPairedOrPairingDevice();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "supportsCapability:", v7);

  if ((v9 & 1) != 0)
  {
    if (v6)
    {
      pk_Sync_log();
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

      if (a3)
      {
        if (v11)
        {
          pk_Sync_log();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            NSStringFromNPKAssociatedPassData(a3);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v43 = v13;
            v44 = 2112;
            v45 = v6;
            _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Requesting associated data:%@ for pass with uniqueID:%@", buf, 0x16u);

          }
        }
        v14 = objc_alloc_init(NPKProtoPassAssociatedDataRequest);
        -[NPKProtoPassAssociatedDataRequest setPassUniqueID:](v14, "setPassUniqueID:", v6);
        -[NPKProtoPassAssociatedDataRequest setPassRequestedData:](v14, "setPassRequestedData:", a3);
        v15 = objc_alloc(MEMORY[0x24BE4FE40]);
        -[NPKProtoPassAssociatedDataRequest data](v14, "data");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(v15, "initWithProtobufData:type:isResponse:", v16, 45, 0);

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("passAssociatedData-%@"), v6);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v40[0] = *MEMORY[0x24BE4FB30];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BE4FD70]);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = *MEMORY[0x24BE4FB18];
        v41[0] = v19;
        v41[1] = v18;
        v21 = *MEMORY[0x24BE4FA78];
        v40[1] = v20;
        v40[2] = v21;
        v22 = *MEMORY[0x24BE4FAE8];
        v41[2] = MEMORY[0x24BDBD1C8];
        v41[3] = MEMORY[0x24BDBD1C8];
        v23 = *MEMORY[0x24BE4FA68];
        v40[3] = v22;
        v40[4] = v23;
        v41[4] = MEMORY[0x24BDBD1C8];
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, v40, 5);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        passSyncService = self->_passSyncService;
        v38[0] = MEMORY[0x24BDAC760];
        v38[1] = 3221225472;
        v38[2] = __64__NPKPassSyncService_requestAssociatedData_forPassWithUniqueID___block_invoke;
        v38[3] = &unk_24CFE79C0;
        v26 = v17;
        v39 = v26;
        NPKProtoSendWithOptions(passSyncService, v26, 200, 0, 0, v38, v24);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        pk_Sync_log();
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);

        if (v29)
        {
          pk_Sync_log();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v43 = v27;
            v44 = 2112;
            v45 = v26;
            _os_log_impl(&dword_213518000, v30, OS_LOG_TYPE_DEFAULT, "Notice: Pass sync service: sent pass associated data request\n\tMessage ID: %@\n\tProtobuf: %@", buf, 0x16u);
          }

        }
        goto LABEL_21;
      }
      if (!v11)
        goto LABEL_22;
      pk_Sync_log();
      v14 = (NPKProtoPassAssociatedDataRequest *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(&v14->super.super.super, OS_LOG_TYPE_DEFAULT))
        goto LABEL_21;
      *(_DWORD *)buf = 138412290;
      v43 = v6;
      v33 = "Warning: missing associated data for pass with uniqueID:%@, will not request pass associated data";
      p_super = &v14->super.super.super;
      v37 = 12;
      goto LABEL_20;
    }
    pk_Sync_log();
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);

    if (v35)
    {
      pk_Sync_log();
      v14 = (NPKProtoPassAssociatedDataRequest *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v14->super.super.super, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v33 = "Warning: missing pass uniqueID, will not request pass associated data";
        goto LABEL_19;
      }
      goto LABEL_21;
    }
  }
  else
  {
    pk_Sync_log();
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);

    if (v32)
    {
      pk_Sync_log();
      v14 = (NPKProtoPassAssociatedDataRequest *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v14->super.super.super, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v33 = "Notice: Paired devices doesn't support request pass associated data";
LABEL_19:
        p_super = &v14->super.super.super;
        v37 = 2;
LABEL_20:
        _os_log_impl(&dword_213518000, p_super, OS_LOG_TYPE_DEFAULT, v33, buf, v37);
      }
LABEL_21:

    }
  }
LABEL_22:

}

void __64__NPKPassSyncService_requestAssociatedData_forPassWithUniqueID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  pk_Sync_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    pk_Sync_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138412546;
      v9 = v7;
      v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_ERROR, "Error: Failed to send pass associated data request: %@ error:%@", (uint8_t *)&v8, 0x16u);
    }

  }
}

- (void)handleSettingsChanged:(unint64_t)a3 forPassWithUniqueID:(id)a4
{
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  NPKProtoPassSettingsChangedRequest *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  IDSService *passSyncService;
  id v22;
  void *v23;
  NSObject *v24;
  _BOOL4 v25;
  NSObject *v26;
  _QWORD v27[4];
  id v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;
  _QWORD v33[5];
  _QWORD v34[6];

  v34[5] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  pk_Sync_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    pk_Sync_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v6;
      _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_DEFAULT, "Notice: Pass sync service: pass settings changed for pass with unique ID %@", buf, 0xCu);
    }

  }
  v10 = objc_alloc_init(NPKProtoPassSettingsChangedRequest);
  -[NPKProtoPassSettingsChangedRequest setUniqueID:](v10, "setUniqueID:", v6);
  -[NPKProtoPassSettingsChangedRequest setPassSettings:](v10, "setPassSettings:", a3);
  v11 = objc_alloc(MEMORY[0x24BE4FE40]);
  -[NPKProtoPassSettingsChangedRequest data](v10, "data");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithProtobufData:type:isResponse:", v12, 31, 0);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("passSettings-%@"), v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = *MEMORY[0x24BE4FB30];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BE4FD70]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *MEMORY[0x24BE4FB18];
  v34[0] = v15;
  v34[1] = v14;
  v17 = *MEMORY[0x24BE4FA78];
  v33[1] = v16;
  v33[2] = v17;
  v18 = *MEMORY[0x24BE4FA68];
  v34[2] = MEMORY[0x24BDBD1C8];
  v34[3] = MEMORY[0x24BDBD1C8];
  v19 = *MEMORY[0x24BE4FAE8];
  v33[3] = v18;
  v33[4] = v19;
  v34[4] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, v33, 5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  passSyncService = self->_passSyncService;
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __64__NPKPassSyncService_handleSettingsChanged_forPassWithUniqueID___block_invoke;
  v27[3] = &unk_24CFE79C0;
  v22 = v13;
  v28 = v22;
  NPKProtoSendWithOptions(passSyncService, v22, 200, 0, 0, v27, v20);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  pk_Sync_log();
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);

  if (v25)
  {
    pk_Sync_log();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v30 = v23;
      v31 = 2112;
      v32 = v22;
      _os_log_impl(&dword_213518000, v26, OS_LOG_TYPE_DEFAULT, "Notice: Pass sync service: sent pass settings\n\tMessage ID: %@\n\tProtobuf: %@", buf, 0x16u);
    }

  }
}

void __64__NPKPassSyncService_handleSettingsChanged_forPassWithUniqueID___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  pk_Sync_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    pk_Sync_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_ERROR, "Error: Failed to send pass settings: %@", (uint8_t *)&v6, 0xCu);
    }

  }
}

- (void)handleCatalogChangeWithCompanionCatalog:(id)a3 watchCatalog:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  NPKProtoCatalog *v11;
  void *v12;
  NPKProtoCatalogChangedRequest *v13;
  void *v14;
  NPKProtoCatalog *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  IDSService *passSyncService;
  id v26;
  void *v27;
  NSObject *v28;
  _BOOL4 v29;
  NSObject *v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[5];
  _QWORD v34[5];
  uint8_t buf[4];
  id v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  pk_Sync_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    pk_Sync_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v36 = v6;
      v37 = 2048;
      v38 = v7;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: Pass sync service: handling catalog changed (companion %p watch %p)", buf, 0x16u);
    }

  }
  v11 = objc_alloc_init(NPKProtoCatalog);
  if (!v6 || (NPKSecureArchiveObject(v6), (v12 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "data");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[NPKProtoCatalog setCatalogData:](v11, "setCatalogData:", v12);
  v13 = objc_alloc_init(NPKProtoCatalogChangedRequest);
  -[NPKProtoCatalogChangedRequest setCompanionCatalog:](v13, "setCompanionCatalog:", v11);
  if (v7)
  {
    NPKSecureArchiveObject(v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = objc_alloc_init(NPKProtoCatalog);
      -[NPKProtoCatalog setCatalogData:](v15, "setCatalogData:", v14);
      -[NPKProtoCatalogChangedRequest setWatchCatalog:](v13, "setWatchCatalog:", v15);

    }
  }
  v16 = objc_alloc(MEMORY[0x24BE4FE40]);
  -[NPKProtoCatalogChangedRequest data](v13, "data");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithProtobufData:type:isResponse:", v17, 7, 0);

  v33[0] = *MEMORY[0x24BE4FB30];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BE4FD70]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = *MEMORY[0x24BE4FB18];
  v34[0] = v19;
  v34[1] = CFSTR("passCatalog");
  v21 = *MEMORY[0x24BE4FA78];
  v33[1] = v20;
  v33[2] = v21;
  v22 = *MEMORY[0x24BE4FA68];
  v34[2] = MEMORY[0x24BDBD1C8];
  v34[3] = MEMORY[0x24BDBD1C8];
  v23 = *MEMORY[0x24BE4FAE8];
  v33[3] = v22;
  v33[4] = v23;
  v34[4] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, v33, 5);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  passSyncService = self->_passSyncService;
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __75__NPKPassSyncService_handleCatalogChangeWithCompanionCatalog_watchCatalog___block_invoke;
  v31[3] = &unk_24CFE79C0;
  v26 = v18;
  v32 = v26;
  NPKProtoSendWithOptions(passSyncService, v26, 200, 0, 0, v31, v24);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  pk_Sync_log();
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);

  if (v29)
  {
    pk_Sync_log();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v36 = v27;
      v37 = 2112;
      v38 = v26;
      _os_log_impl(&dword_213518000, v30, OS_LOG_TYPE_DEFAULT, "Notice: Pass sync service: sent catalog\n\tMessage ID: %@\n\tProtobuf: %@", buf, 0x16u);
    }

  }
}

void __75__NPKPassSyncService_handleCatalogChangeWithCompanionCatalog_watchCatalog___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  pk_Sync_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    pk_Sync_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_ERROR, "Error: Failed to send catalog: %@", (uint8_t *)&v6, 0xCu);
    }

  }
}

- (void)suggestSync
{
  NSObject *passSyncQueue;
  _QWORD block[5];

  passSyncQueue = self->_passSyncQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__NPKPassSyncService_suggestSync__block_invoke;
  block[3] = &unk_24CFE7998;
  block[4] = self;
  dispatch_async(passSyncQueue, block);
}

uint64_t __33__NPKPassSyncService_suggestSync__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_syncWhenAppropriate");
}

- (id)currentLibraryPassSyncStateWithReconciledState:(id)a3
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  pk_General_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

  if (v4)
  {
    pk_General_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136446722;
      v7 = "-[NPKPassSyncService currentLibraryPassSyncStateWithReconciledState:]";
      v8 = 2082;
      v9 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKPassSyncService.m";
      v10 = 2048;
      v11 = 294;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Subclasses must override)", (uint8_t *)&v6, 0x20u);
    }

  }
  _NPKAssertAbort();
}

- (unint64_t)settingsForPassWithUniqueID:(id)a3
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  pk_General_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

  if (v4)
  {
    pk_General_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136446722;
      v7 = "-[NPKPassSyncService settingsForPassWithUniqueID:]";
      v8 = 2082;
      v9 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKPassSyncService.m";
      v10 = 2048;
      v11 = 300;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Subclasses must override)", (uint8_t *)&v6, 0x20u);
    }

  }
  _NPKAssertAbort();
}

- (void)handleIncomingPassSettings:(unint64_t)a3 forPassWithUniqueID:(id)a4
{
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  pk_General_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    pk_General_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 136446722;
      v8 = "-[NPKPassSyncService handleIncomingPassSettings:forPassWithUniqueID:]";
      v9 = 2082;
      v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKPassSyncService.m";
      v11 = 2048;
      v12 = 306;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Subclasses must override)", (uint8_t *)&v7, 0x20u);
    }

  }
  _NPKAssertAbort();
}

- (void)handleIncomingCompanionCatalog:(id)a3 watchCatalog:(id)a4
{
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  pk_General_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    pk_General_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 136446722;
      v8 = "-[NPKPassSyncService handleIncomingCompanionCatalog:watchCatalog:]";
      v9 = 2082;
      v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKPassSyncService.m";
      v11 = 2048;
      v12 = 311;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Subclasses must override)", (uint8_t *)&v7, 0x20u);
    }

  }
  _NPKAssertAbort();
}

- (id)companionCatalogToSendWithStateChange
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  pk_General_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    pk_General_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136446722;
      v6 = "-[NPKPassSyncService companionCatalogToSendWithStateChange]";
      v7 = 2082;
      v8 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKPassSyncService.m";
      v9 = 2048;
      v10 = 316;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Subclasses must override)", (uint8_t *)&v5, 0x20u);
    }

  }
  _NPKAssertAbort();
}

- (id)watchCatalogToSendWithStateChange
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  pk_General_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    pk_General_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136446722;
      v6 = "-[NPKPassSyncService watchCatalogToSendWithStateChange]";
      v7 = 2082;
      v8 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKPassSyncService.m";
      v9 = 2048;
      v10 = 322;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Subclasses must override)", (uint8_t *)&v5, 0x20u);
    }

  }
  _NPKAssertAbort();
}

- (void)syncStateChanged:(id)a3
{
  NSObject *passSyncQueue;
  id v5;
  void *v6;
  NPKProtoPassSyncStateChange *v7;
  void *v8;
  NPKProtoPassSyncStateChange *v9;
  NPKPassSyncChange *v10;
  unsigned int v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  _BOOL4 v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  int v36;
  void *v37;
  __int16 v38;
  unsigned int v39;
  __int16 v40;
  unsigned int v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  passSyncQueue = self->_passSyncQueue;
  v5 = a3;
  dispatch_assert_queue_V2(passSyncQueue);
  +[NPKOSTransaction transactionWithName:](NPKOSTransaction, "transactionWithName:", CFSTR("sync state changed"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = [NPKProtoPassSyncStateChange alloc];
  objc_msgSend(v5, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[NPKProtoPassSyncStateChange initWithData:](v7, "initWithData:", v8);
  v10 = -[NPKPassSyncChange initWithProtoPassSyncChange:]([NPKPassSyncChange alloc], "initWithProtoPassSyncChange:", v9);
  if (!-[NPKProtoPassSyncStateChange hasPassSegmentIndex](v9, "hasPassSegmentIndex"))
  {
LABEL_14:
    -[NPKPassSyncEngine handleStateChange:](self->_passSyncEngine, "handleStateChange:", v10);
    if (-[NPKProtoPassSyncStateChange hasCompanionCatalog](v9, "hasCompanionCatalog")
      || -[NPKProtoPassSyncStateChange hasWatchCatalog](v9, "hasWatchCatalog"))
    {
      +[NPKOSTransaction transactionWithName:](NPKOSTransaction, "transactionWithName:", CFSTR("sync state changed, catalog"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NPKProtoPassSyncStateChange hasCompanionCatalog](v9, "hasCompanionCatalog"))
      {
        -[NPKProtoPassSyncStateChange companionCatalog](v9, "companionCatalog");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "catalogData");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_opt_class();
        NPKSecureUnarchiveObject(v26, v27);
        v28 = objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v28 = 0;
      }
      if (-[NPKProtoPassSyncStateChange hasWatchCatalog](v9, "hasWatchCatalog"))
      {
        -[NPKProtoPassSyncStateChange watchCatalog](v9, "watchCatalog");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "catalogData");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_opt_class();
        NPKSecureUnarchiveObject(v33, v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v35 = 0;
      }
      -[NPKPassSyncService handleIncomingCompanionCatalog:watchCatalog:](self, "handleIncomingCompanionCatalog:watchCatalog:", v28, v35);
      objc_msgSend(v24, "invalidate");

LABEL_26:
      goto LABEL_27;
    }
    goto LABEL_27;
  }
  v11 = -[NPKProtoPassSyncStateChange passSegmentIndex](v9, "passSegmentIndex");
  pk_Sync_log();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

  if (v13)
  {
    pk_Sync_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      -[NPKPassSyncChange changeUUID](v10, "changeUUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 138412802;
      v37 = v15;
      v38 = 1024;
      v39 = v11;
      v40 = 1024;
      v41 = -[NPKProtoPassSyncStateChange passSegmentTotal](v9, "passSegmentTotal");
      _os_log_impl(&dword_213518000, v14, OS_LOG_TYPE_DEFAULT, "Notice: Pass sync service: storing large pass data segment\n\tchange UUID: %@\n\tsegment index: %u\n\ttotal pass segments: %u", (uint8_t *)&v36, 0x18u);

    }
  }
  -[NPKPassSyncChange passData](v10, "passData");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPassSyncChange changeUUID](v10, "changeUUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  NPKStoreLargePassDataSegmentForChangeUUID(v16, v17, v11);

  if (-[NPKProtoPassSyncStateChange hasPassSegmentTotal](v9, "hasPassSegmentTotal")
    && -[NPKProtoPassSyncStateChange passSegmentTotal](v9, "passSegmentTotal") == v11 + 1)
  {
    -[NPKPassSyncChange changeUUID](v10, "changeUUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    NPKDataForLargePassWithChangeUUID(v18, -[NPKProtoPassSyncStateChange passSegmentTotal](v9, "passSegmentTotal"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    pk_Sync_log();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);

    if (v21)
    {
      pk_Sync_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v19, "npkDescription");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = 138412290;
        v37 = v23;
        _os_log_impl(&dword_213518000, v22, OS_LOG_TYPE_DEFAULT, "Notice: Pass sync service: this is the last segment of pass data\n\tretrieved combined pass data: %@", (uint8_t *)&v36, 0xCu);

      }
    }
    if (v19)
    {
      -[NPKPassSyncChange setPassData:](v10, "setPassData:", v19);

      goto LABEL_14;
    }
  }
  pk_Sync_log();
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);

  if (v30)
  {
    pk_Sync_log();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      -[NPKPassSyncChange changeUUID](v10, "changeUUID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 138412290;
      v37 = v31;
      _os_log_impl(&dword_213518000, v28, OS_LOG_TYPE_DEFAULT, "Notice: Pass sync service: not providing state change to sync engine\n\tchange UUID: %@", (uint8_t *)&v36, 0xCu);

    }
    goto LABEL_26;
  }
LABEL_27:
  objc_msgSend(v6, "invalidate");

}

- (void)syncStateChangeProcessed:(id)a3
{
  NSObject *passSyncQueue;
  id v5;
  NPKProtoPassSyncStateChangeProcessed *v6;
  void *v7;
  NPKProtoPassSyncStateChangeProcessed *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;

  passSyncQueue = self->_passSyncQueue;
  v5 = a3;
  dispatch_assert_queue_V2(passSyncQueue);
  +[NPKOSTransaction transactionWithName:](NPKOSTransaction, "transactionWithName:", CFSTR("sync state change processed"));
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v6 = [NPKProtoPassSyncStateChangeProcessed alloc];
  objc_msgSend(v5, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[NPKProtoPassSyncStateChangeProcessed initWithData:](v6, "initWithData:", v7);
  v9 = objc_alloc(MEMORY[0x24BDD1880]);
  -[NPKProtoPassSyncStateChangeProcessed acceptedChangeUUID](v8, "acceptedChangeUUID");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v11 = (void *)objc_msgSend(v9, "initWithUUIDBytes:", objc_msgSend(v10, "bytes"));

  if (-[NPKProtoPassSyncStateChangeProcessed hasChangeAccepted](v8, "hasChangeAccepted"))
    v12 = -[NPKProtoPassSyncStateChangeProcessed changeAccepted](v8, "changeAccepted");
  else
    v12 = 1;
  -[NPKPassSyncEngine handleStateChangeProcessedWithUUID:changeAccepted:fullPassRequired:](self->_passSyncEngine, "handleStateChangeProcessedWithUUID:changeAccepted:fullPassRequired:", v11, v12, -[NPKProtoPassSyncStateChangeProcessed fullPassRequired](v8, "fullPassRequired"));
  objc_msgSend(v13, "invalidate");

}

- (void)reconciledStateUnrecognized:(id)a3
{
  NSObject *passSyncQueue;
  id v5;
  NPKProtoPassSyncReconciledStateUnrecognized *v6;
  void *v7;
  NPKProtoPassSyncReconciledStateUnrecognized *v8;
  void *v9;
  uint64_t v10;
  NPKPassSyncState *v11;
  void *v12;
  NPKPassSyncState *v13;
  id v14;

  passSyncQueue = self->_passSyncQueue;
  v5 = a3;
  dispatch_assert_queue_V2(passSyncQueue);
  +[NPKOSTransaction transactionWithName:](NPKOSTransaction, "transactionWithName:", CFSTR("sync state change processed"));
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v6 = [NPKProtoPassSyncReconciledStateUnrecognized alloc];
  objc_msgSend(v5, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[NPKProtoPassSyncReconciledStateUnrecognized initWithData:](v6, "initWithData:", v7);
  -[NPKProtoPassSyncReconciledStateUnrecognized unrecognizedReconciledStateHash](v8, "unrecognizedReconciledStateHash");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[NPKProtoPassSyncReconciledStateUnrecognized hasUnrecognizedReconciledStateVersion](v8, "hasUnrecognizedReconciledStateVersion");
  v11 = [NPKPassSyncState alloc];
  -[NPKProtoPassSyncReconciledStateUnrecognized libraryPassSyncState](v8, "libraryPassSyncState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[NPKPassSyncState initWithProtoSyncState:](v11, "initWithProtoSyncState:", v12);

  -[NPKPassSyncEngine handleReconciledStateUnrecognizedWithHash:version:passSyncState:](self->_passSyncEngine, "handleReconciledStateUnrecognizedWithHash:version:passSyncState:", v9, v10, v13);
  objc_msgSend(v14, "invalidate");

}

- (void)proposedReconciledState:(id)a3
{
  NSObject *passSyncQueue;
  id v5;
  NPKProtoPassSyncProposedReconciledState *v6;
  void *v7;
  NPKProtoPassSyncProposedReconciledState *v8;
  NPKPassSyncState *v9;
  void *v10;
  NPKPassSyncState *v11;
  id v12;

  passSyncQueue = self->_passSyncQueue;
  v5 = a3;
  dispatch_assert_queue_V2(passSyncQueue);
  +[NPKOSTransaction transactionWithName:](NPKOSTransaction, "transactionWithName:", CFSTR("proposed reconciled state"));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v6 = [NPKProtoPassSyncProposedReconciledState alloc];
  objc_msgSend(v5, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[NPKProtoPassSyncProposedReconciledState initWithData:](v6, "initWithData:", v7);
  v9 = [NPKPassSyncState alloc];
  -[NPKProtoPassSyncProposedReconciledState proposedReconciledState](v8, "proposedReconciledState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[NPKPassSyncState initWithProtoSyncState:](v9, "initWithProtoSyncState:", v10);

  -[NPKPassSyncEngine handleProposedReconciledState:](self->_passSyncEngine, "handleProposedReconciledState:", v11);
  objc_msgSend(v12, "invalidate");

}

- (void)reconciledStateAccepted:(id)a3
{
  NSObject *passSyncQueue;
  id v5;
  NPKProtoPassSyncReconciledStateAccepted *v6;
  void *v7;
  NPKProtoPassSyncReconciledStateAccepted *v8;
  NPKPassSyncEngine *passSyncEngine;
  void *v10;
  id v11;

  passSyncQueue = self->_passSyncQueue;
  v5 = a3;
  dispatch_assert_queue_V2(passSyncQueue);
  +[NPKOSTransaction transactionWithName:](NPKOSTransaction, "transactionWithName:", CFSTR("reconciled state accepted"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v6 = [NPKProtoPassSyncReconciledStateAccepted alloc];
  objc_msgSend(v5, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[NPKProtoPassSyncReconciledStateAccepted initWithData:](v6, "initWithData:", v7);
  passSyncEngine = self->_passSyncEngine;
  -[NPKProtoPassSyncReconciledStateAccepted reconciledStateHash](v8, "reconciledStateHash");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPassSyncEngine handleReconciledStateAcceptedWithHash:](passSyncEngine, "handleReconciledStateAcceptedWithHash:", v10);

  objc_msgSend(v11, "invalidate");
}

- (void)passSettingsChanged:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NPKProtoPassSettingsChangedRequest *v10;
  void *v11;
  NPKProtoPassSettingsChangedRequest *v12;
  void *v13;
  NSObject *v14;
  _BOOL4 v15;
  NSObject *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pk_Sync_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Sync_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "npkDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412290;
      v18 = v8;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Pass sync service: pass settings changed with protobuf %@", (uint8_t *)&v17, 0xCu);

    }
  }
  +[NPKOSTransaction transactionWithName:](NPKOSTransaction, "transactionWithName:", CFSTR("pass settings changed"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = [NPKProtoPassSettingsChangedRequest alloc];
  objc_msgSend(v4, "data");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[NPKProtoPassSettingsChangedRequest initWithData:](v10, "initWithData:", v11);

  -[NPKProtoPassSettingsChangedRequest uniqueID](v12, "uniqueID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13 && -[NPKProtoPassSettingsChangedRequest hasPassSettings](v12, "hasPassSettings"))
  {
    -[NPKPassSyncService handleIncomingPassSettings:forPassWithUniqueID:](self, "handleIncomingPassSettings:forPassWithUniqueID:", -[NPKProtoPassSettingsChangedRequest passSettings](v12, "passSettings"), v13);
  }
  else
  {
    pk_Sync_log();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

    if (v15)
    {
      pk_Sync_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v17) = 0;
        _os_log_impl(&dword_213518000, v16, OS_LOG_TYPE_DEFAULT, "Warning: Pass sync service: No unique ID or no pass settings in protobuf", (uint8_t *)&v17, 2u);
      }

    }
  }
  objc_msgSend(v9, "invalidate");

}

- (void)catalogChanged:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NPKProtoCatalogChangedRequest *v10;
  void *v11;
  NPKProtoCatalogChangedRequest *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pk_Sync_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Sync_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "npkDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138412290;
      v25 = v8;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Pass sync service: catalog changed with protobuf %@", (uint8_t *)&v24, 0xCu);

    }
  }
  +[NPKOSTransaction transactionWithName:](NPKOSTransaction, "transactionWithName:", CFSTR("Catalog changed"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = [NPKProtoCatalogChangedRequest alloc];
  objc_msgSend(v4, "data");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[NPKProtoCatalogChangedRequest initWithData:](v10, "initWithData:", v11);

  -[NPKProtoCatalogChangedRequest companionCatalog](v12, "companionCatalog");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "catalogData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "length");

  if (v15)
  {
    -[NPKProtoCatalogChangedRequest companionCatalog](v12, "companionCatalog");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "catalogData");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_opt_class();
    NPKSecureUnarchiveObject(v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = 0;
  }
  -[NPKProtoCatalogChangedRequest watchCatalog](v12, "watchCatalog");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "catalogData");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_opt_class();
  NPKSecureUnarchiveObject(v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  -[NPKPassSyncService handleIncomingCompanionCatalog:watchCatalog:](self, "handleIncomingCompanionCatalog:watchCatalog:", v19, v23);
  objc_msgSend(v9, "invalidate");

}

- (void)associatedPassDataRequested:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  NPKProtoPassAssociatedDataRequest *v9;
  void *v10;
  NPKProtoPassAssociatedDataRequest *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  _BOOL4 v16;
  NSObject *v17;
  void *v18;
  _BOOL4 v19;
  NSObject *v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pk_Sync_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Sync_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "npkDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138412290;
      v22 = v8;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Pass sync service: associated pass data request with protobuf %@", (uint8_t *)&v21, 0xCu);

    }
  }
  v9 = [NPKProtoPassAssociatedDataRequest alloc];
  objc_msgSend(v4, "data");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[NPKProtoPassAssociatedDataRequest initWithData:](v9, "initWithData:", v10);

  -[NPKProtoPassAssociatedDataRequest passUniqueID](v11, "passUniqueID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NPKProtoPassAssociatedDataRequest hasPassRequestedData](v11, "hasPassRequestedData"))
    v13 = -[NPKProtoPassAssociatedDataRequest passRequestedData](v11, "passRequestedData");
  else
    v13 = 8;
  pk_Sync_log();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v12)
  {
    v16 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

    if (v16)
    {
      pk_Sync_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromNPKAssociatedPassData(v13);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138412546;
        v22 = v18;
        v23 = 2112;
        v24 = v12;
        _os_log_impl(&dword_213518000, v17, OS_LOG_TYPE_DEFAULT, "Notice: Pass sync service: associated pass data request:%@ for Pass with uniqueID:%@", (uint8_t *)&v21, 0x16u);

      }
    }
    -[NPKPassSyncService handleRequestedAssociatedData:forPassWithUniqueID:](self, "handleRequestedAssociatedData:forPassWithUniqueID:", v13, v12);
  }
  else
  {
    v19 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);

    if (v19)
    {
      pk_Sync_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v21) = 0;
        _os_log_impl(&dword_213518000, v20, OS_LOG_TYPE_ERROR, "Error: unexpected associated pass data request with nil uniqueID", (uint8_t *)&v21, 2u);
      }

    }
  }

}

- (void)passSyncEngine:(id)a3 sendStateChange:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NPKProtoCatalog *v14;
  void *v15;
  void *v16;
  NPKProtoCatalog *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  NSObject *v24;
  _BOOL4 v25;
  NSObject *v26;
  uint64_t v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  _QWORD v33[5];
  uint8_t buf[4];
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!self->_dropAllMessages)
  {
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __53__NPKPassSyncService_passSyncEngine_sendStateChange___block_invoke;
    v33[3] = &unk_24CFE79E8;
    v33[4] = self;
    v10 = MEMORY[0x2199B6780](v33);
    objc_msgSend(v7, "passData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "protoPassSyncChange");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPassSyncService companionCatalogToSendWithStateChange](self, "companionCatalogToSendWithStateChange");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = objc_alloc_init(NPKProtoCatalog);
      NPKSecureArchiveObject(v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPKProtoCatalog setCatalogData:](v14, "setCatalogData:", v15);

      objc_msgSend(v12, "setCompanionCatalog:", v14);
    }
    -[NPKPassSyncService watchCatalogToSendWithStateChange](self, "watchCatalogToSendWithStateChange");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = objc_alloc_init(NPKProtoCatalog);
      NPKSecureArchiveObject(v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPKProtoCatalog setCatalogData:](v17, "setCatalogData:", v18);

      objc_msgSend(v12, "setWatchCatalog:", v17);
    }
    v19 = (void *)MEMORY[0x2199B65AC]();
    v20 = v19;
    if (v11)
    {
      if ((unint64_t)objc_msgSend(v11, "length") > 0x500000)
      {
        objc_autoreleasePoolPop(v20);
LABEL_14:
        NPKSegmentsForLargePassDataNoCopy(v11, 0x400000uLL);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v23, "count");
        pk_Sync_log();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);

        if (v25)
        {
          pk_Sync_log();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            v35 = v27;
            _os_log_impl(&dword_213518000, v26, OS_LOG_TYPE_DEFAULT, "Notice: Pass sync service: splitting state change into %u pieces", buf, 8u);
          }

        }
        v28[0] = MEMORY[0x24BDAC760];
        v28[1] = 3221225472;
        v28[2] = __53__NPKPassSyncService_passSyncEngine_sendStateChange___block_invoke_125;
        v28[3] = &unk_24CFE7A10;
        v29 = v12;
        v32 = v27;
        v30 = v7;
        v31 = (id)v10;
        objc_msgSend(v23, "enumerateObjectsUsingBlock:", v28);

        goto LABEL_20;
      }
      objc_msgSend(v12, "data");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "length");

      objc_autoreleasePoolPop(v20);
      if (v22 > 0x500000)
        goto LABEL_14;
    }
    else
    {
      objc_autoreleasePoolPop(v19);
    }
    (*(void (**)(uint64_t, void *, const __CFString *))(v10 + 16))(v10, v12, CFSTR("passSyncStateChange"));
LABEL_20:

LABEL_21:
    goto LABEL_22;
  }
  pk_Sync_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    pk_Sync_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213518000, (os_log_t)v10, OS_LOG_TYPE_DEFAULT, "Warning: Dropping state change message", buf, 2u);
    }
    goto LABEL_21;
  }
LABEL_22:

}

void __53__NPKPassSyncService_passSyncEngine_sendStateChange___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  _BOOL4 v19;
  NSObject *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  _QWORD v28[4];
  _QWORD v29[5];

  v29[4] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x2199B65AC]();
  v8 = objc_alloc(MEMORY[0x24BE4FE40]);
  objc_msgSend(v5, "data");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithProtobufData:type:isResponse:", v9, 40, 0);

  v28[0] = *MEMORY[0x24BE4FB30];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BE4FD70]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x24BE4FA78];
  v29[0] = v11;
  v29[1] = MEMORY[0x24BDBD1C8];
  v13 = *MEMORY[0x24BE4FA68];
  v28[1] = v12;
  v28[2] = v13;
  v28[3] = *MEMORY[0x24BE4FB18];
  v29[2] = MEMORY[0x24BDBD1C8];
  v29[3] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __53__NPKPassSyncService_passSyncEngine_sendStateChange___block_invoke_2;
  v22[3] = &unk_24CFE79C0;
  v16 = v5;
  v23 = v16;
  NPKProtoSendWithOptions(v15, v10, 200, 0, 0, v22, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  pk_Sync_log();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);

  if (v19)
  {
    pk_Sync_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v16, "npkDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v25 = v17;
      v26 = 2112;
      v27 = v21;
      _os_log_impl(&dword_213518000, v20, OS_LOG_TYPE_DEFAULT, "Notice: Pass sync service: sent state change IDS message\n\tMessage ID: %@\n\tProtobuf: %@", buf, 0x16u);

    }
  }

  objc_autoreleasePoolPop(v7);
}

void __53__NPKPassSyncService_passSyncEngine_sendStateChange___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  pk_Sync_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    pk_Sync_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_ERROR, "Error: Failed to send pass sync state change: %@", (uint8_t *)&v6, 0xCu);
    }

  }
}

void __53__NPKPassSyncService_passSyncEngine_sendStateChange___block_invoke_125(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint8_t buf[4];
  int v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "setPassData:", a2);
  objc_msgSend(*(id *)(a1 + 32), "setPassSegmentIndex:", a3);
  objc_msgSend(*(id *)(a1 + 32), "setPassSegmentTotal:", *(unsigned int *)(a1 + 56));
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("passSyncStateChange-%u"), a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  pk_Sync_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    pk_Sync_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 56);
      objc_msgSend(*(id *)(a1 + 40), "changeUUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109634;
      v12 = a3;
      v13 = 1024;
      v14 = v9;
      v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_DEFAULT, "Notice: Pass sync service: sending state change IDS message for segment index %u (%u total segments)\n\tChange UUID: %@", buf, 0x18u);

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)passSyncEngine:(id)a3 sendStateChangeProcessedWithUUID:(id)a4 changeAccepted:(BOOL)a5 fullPassRequired:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  NPKProtoPassSyncStateChangeProcessed *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  IDSService *passSyncService;
  void *v25;
  NSObject *v26;
  _BOOL4 v27;
  NSObject *v28;
  _QWORD v29[4];
  NSObject *v30;
  _BYTE buf[22];
  _QWORD v32[4];
  _QWORD v33[5];

  v6 = a6;
  v7 = a5;
  v33[4] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  if (!self->_dropAllMessages)
  {
    v15 = objc_alloc_init(NPKProtoPassSyncStateChangeProcessed);
    if (v11)
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = 0;
      objc_msgSend(v11, "getUUIDBytes:", buf);
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", buf, 16);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPKProtoPassSyncStateChangeProcessed setAcceptedChangeUUID:](v15, "setAcceptedChangeUUID:", v16);

    }
    -[NPKProtoPassSyncStateChangeProcessed setChangeAccepted:](v15, "setChangeAccepted:", v7);
    -[NPKProtoPassSyncStateChangeProcessed setFullPassRequired:](v15, "setFullPassRequired:", v6);
    v17 = objc_alloc(MEMORY[0x24BE4FE40]);
    -[NPKProtoPassSyncStateChangeProcessed data](v15, "data");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initWithProtobufData:type:isResponse:", v18, 41, 0);

    v32[0] = *MEMORY[0x24BE4FB30];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BE4FD70]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = *MEMORY[0x24BE4FA78];
    v33[0] = v20;
    v33[1] = MEMORY[0x24BDBD1C8];
    v22 = *MEMORY[0x24BE4FA68];
    v32[1] = v21;
    v32[2] = v22;
    v32[3] = *MEMORY[0x24BE4FB18];
    v33[2] = MEMORY[0x24BDBD1C8];
    v33[3] = CFSTR("passSyncStateChangeProcessed");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, v32, 4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    passSyncService = self->_passSyncService;
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __102__NPKPassSyncService_passSyncEngine_sendStateChangeProcessedWithUUID_changeAccepted_fullPassRequired___block_invoke;
    v29[3] = &unk_24CFE79C0;
    v14 = v15;
    v30 = v14;
    NPKProtoSendWithOptions(passSyncService, v19, 200, 0, 0, v29, v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    pk_Sync_log();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);

    if (v27)
    {
      pk_Sync_log();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v25;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v14;
        _os_log_impl(&dword_213518000, v28, OS_LOG_TYPE_DEFAULT, "Notice: Pass sync service: sent state change processed IDS message\n\tMessage ID: %@\n\tProtobuf: %@", buf, 0x16u);
      }

    }
    goto LABEL_12;
  }
  pk_Sync_log();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

  if (v13)
  {
    pk_Sync_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213518000, v14, OS_LOG_TYPE_DEFAULT, "Warning: Dropping state change processed message", buf, 2u);
    }
LABEL_12:

  }
}

void __102__NPKPassSyncService_passSyncEngine_sendStateChangeProcessedWithUUID_changeAccepted_fullPassRequired___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  pk_Sync_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    pk_Sync_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_ERROR, "Error: Failed to send pass sync change accepted: %@", (uint8_t *)&v6, 0xCu);
    }

  }
}

- (void)passSyncEngine:(id)a3 sendReconciledStateUnrecognizedWithHash:(id)a4 version:(unint64_t)a5 currentPassSyncState:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  NPKProtoPassSyncReconciledStateUnrecognized *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  IDSService *passSyncService;
  void *v26;
  NSObject *v27;
  _BOOL4 v28;
  NSObject *v29;
  _QWORD v30[4];
  NSObject *v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  NSObject *v35;
  _QWORD v36[4];
  _QWORD v37[5];

  v37[4] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (!self->_dropAllMessages)
  {
    v16 = objc_alloc_init(NPKProtoPassSyncReconciledStateUnrecognized);
    -[NPKProtoPassSyncReconciledStateUnrecognized setUnrecognizedReconciledStateHash:](v16, "setUnrecognizedReconciledStateHash:", v11);
    -[NPKProtoPassSyncReconciledStateUnrecognized setUnrecognizedReconciledStateVersion:](v16, "setUnrecognizedReconciledStateVersion:", a5);
    objc_msgSend(v12, "protoSyncState");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKProtoPassSyncReconciledStateUnrecognized setLibraryPassSyncState:](v16, "setLibraryPassSyncState:", v17);

    v18 = objc_alloc(MEMORY[0x24BE4FE40]);
    -[NPKProtoPassSyncReconciledStateUnrecognized data](v16, "data");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v18, "initWithProtobufData:type:isResponse:", v19, 42, 0);

    v36[0] = *MEMORY[0x24BE4FB30];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BE4FD70]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *MEMORY[0x24BE4FA78];
    v37[0] = v21;
    v37[1] = MEMORY[0x24BDBD1C8];
    v23 = *MEMORY[0x24BE4FA68];
    v36[1] = v22;
    v36[2] = v23;
    v36[3] = *MEMORY[0x24BE4FB18];
    v37[2] = MEMORY[0x24BDBD1C8];
    v37[3] = CFSTR("passSyncReconciledStateUnrecognized");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, v36, 4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    passSyncService = self->_passSyncService;
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __106__NPKPassSyncService_passSyncEngine_sendReconciledStateUnrecognizedWithHash_version_currentPassSyncState___block_invoke;
    v30[3] = &unk_24CFE79C0;
    v15 = v16;
    v31 = v15;
    NPKProtoSendWithOptions(passSyncService, v20, 200, 0, 0, v30, v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    pk_Sync_log();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);

    if (v28)
    {
      pk_Sync_log();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v33 = v26;
        v34 = 2112;
        v35 = v15;
        _os_log_impl(&dword_213518000, v29, OS_LOG_TYPE_DEFAULT, "Notice: Pass sync service: sent reconciled state unrecognized IDS message\n\tMessage ID: %@\n\tProtobuf: %@", buf, 0x16u);
      }

    }
    goto LABEL_10;
  }
  pk_Sync_log();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

  if (v14)
  {
    pk_Sync_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213518000, v15, OS_LOG_TYPE_DEFAULT, "Warning: Dropping reconciled state unrecognized message", buf, 2u);
    }
LABEL_10:

  }
}

void __106__NPKPassSyncService_passSyncEngine_sendReconciledStateUnrecognizedWithHash_version_currentPassSyncState___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  pk_Sync_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    pk_Sync_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_ERROR, "Error: Failed to send pass sync reconciled state unrecognized: %@", (uint8_t *)&v6, 0xCu);
    }

  }
}

- (void)passSyncEngine:(id)a3 sendProposedReconciledState:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  NPKProtoPassSyncProposedReconciledState *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  IDSService *passSyncService;
  void *v21;
  NSObject *v22;
  _BOOL4 v23;
  NSObject *v24;
  _QWORD v25[4];
  NSObject *v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  NSObject *v30;
  _QWORD v31[4];
  _QWORD v32[5];

  v32[4] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!self->_dropAllMessages)
  {
    v11 = objc_alloc_init(NPKProtoPassSyncProposedReconciledState);
    objc_msgSend(v7, "protoSyncState");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKProtoPassSyncProposedReconciledState setProposedReconciledState:](v11, "setProposedReconciledState:", v12);

    v13 = objc_alloc(MEMORY[0x24BE4FE40]);
    -[NPKProtoPassSyncProposedReconciledState data](v11, "data");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithProtobufData:type:isResponse:", v14, 43, 0);

    v31[0] = *MEMORY[0x24BE4FB30];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BE4FD70]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *MEMORY[0x24BE4FA78];
    v32[0] = v16;
    v32[1] = MEMORY[0x24BDBD1C8];
    v18 = *MEMORY[0x24BE4FA68];
    v31[1] = v17;
    v31[2] = v18;
    v31[3] = *MEMORY[0x24BE4FB18];
    v32[2] = MEMORY[0x24BDBD1C8];
    v32[3] = CFSTR("passSyncReconciledStateUnrecognized");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, v31, 4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    passSyncService = self->_passSyncService;
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __65__NPKPassSyncService_passSyncEngine_sendProposedReconciledState___block_invoke;
    v25[3] = &unk_24CFE79C0;
    v10 = v11;
    v26 = v10;
    NPKProtoSendWithOptions(passSyncService, v15, 200, 0, 0, v25, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    pk_Sync_log();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);

    if (v23)
    {
      pk_Sync_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v28 = v21;
        v29 = 2112;
        v30 = v10;
        _os_log_impl(&dword_213518000, v24, OS_LOG_TYPE_DEFAULT, "Notice: Pass sync service: sent proposed reconciled state IDS message\n\tMessage ID: %@\n\tProtobuf: %@", buf, 0x16u);
      }

    }
    goto LABEL_10;
  }
  pk_Sync_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    pk_Sync_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Warning: Dropping proposed reconciled state message", buf, 2u);
    }
LABEL_10:

  }
}

void __65__NPKPassSyncService_passSyncEngine_sendProposedReconciledState___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  pk_Sync_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    pk_Sync_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_ERROR, "Error: Failed to send pass sync proposed reconciled state message: %@", (uint8_t *)&v6, 0xCu);
    }

  }
}

- (void)passSyncEngine:(id)a3 sendReconciledStateAcceptedWithHash:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  NPKProtoPassSyncReconciledStateAccepted *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  IDSService *passSyncService;
  void *v20;
  NSObject *v21;
  _BOOL4 v22;
  NSObject *v23;
  _QWORD v24[4];
  NSObject *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  NSObject *v29;
  _QWORD v30[4];
  _QWORD v31[5];

  v31[4] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!self->_dropAllMessages)
  {
    v11 = objc_alloc_init(NPKProtoPassSyncReconciledStateAccepted);
    -[NPKProtoPassSyncReconciledStateAccepted setReconciledStateHash:](v11, "setReconciledStateHash:", v7);
    v12 = objc_alloc(MEMORY[0x24BE4FE40]);
    -[NPKProtoPassSyncReconciledStateAccepted data](v11, "data");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithProtobufData:type:isResponse:", v13, 44, 0);

    v30[0] = *MEMORY[0x24BE4FB30];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BE4FD70]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *MEMORY[0x24BE4FA78];
    v31[0] = v15;
    v31[1] = MEMORY[0x24BDBD1C8];
    v17 = *MEMORY[0x24BE4FA68];
    v30[1] = v16;
    v30[2] = v17;
    v30[3] = *MEMORY[0x24BE4FB18];
    v31[2] = MEMORY[0x24BDBD1C8];
    v31[3] = CFSTR("passSyncStateChangeProcessed");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    passSyncService = self->_passSyncService;
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __73__NPKPassSyncService_passSyncEngine_sendReconciledStateAcceptedWithHash___block_invoke;
    v24[3] = &unk_24CFE79C0;
    v10 = v11;
    v25 = v10;
    NPKProtoSendWithOptions(passSyncService, v14, 200, 0, 0, v24, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    pk_Sync_log();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);

    if (v22)
    {
      pk_Sync_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v27 = v20;
        v28 = 2112;
        v29 = v10;
        _os_log_impl(&dword_213518000, v23, OS_LOG_TYPE_DEFAULT, "Notice: Pass sync service: sent reconciled state accepted IDS message\n\tMessage ID: %@\n\tProtobuf: %@", buf, 0x16u);
      }

    }
    goto LABEL_10;
  }
  pk_Sync_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    pk_Sync_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Warning: Dropping reconciled state accepted message", buf, 2u);
    }
LABEL_10:

  }
}

void __73__NPKPassSyncService_passSyncEngine_sendReconciledStateAcceptedWithHash___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  pk_Sync_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    pk_Sync_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_ERROR, "Error: Failed to send pass sync reconciled state accepted: %@", (uint8_t *)&v6, 0xCu);
    }

  }
}

- (void)passSyncEngineStateChanged:(id)a3
{
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  NSObject *passSyncEngineArchiveTimer;
  dispatch_time_t v8;
  uint8_t v9[16];

  pk_Sync_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_Sync_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Pass sync service: got pass sync engine state changed", v9, 2u);
    }

  }
  passSyncEngineArchiveTimer = self->_passSyncEngineArchiveTimer;
  v8 = dispatch_time(0, 1000000000);
  dispatch_source_set_timer(passSyncEngineArchiveTimer, v8, 0xFFFFFFFFFFFFFFFFLL, 0);
}

- (void)passSyncEngine:(id)a3 receivedStateChangeProcessed:(id)a4 changeAccepted:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  _BOOL4 v15;
  uint64_t v16;

  v5 = a5;
  v16 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  pk_Sync_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    pk_Sync_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412546;
      v13 = v7;
      v14 = 1024;
      v15 = v5;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: Pass sync service: received state change processed delegate method invoked\n\tChange: %@\n\tAccepted: %d", (uint8_t *)&v12, 0x12u);
    }

  }
  if (!objc_msgSend(v7, "changeType"))
  {
    objc_msgSend(v7, "uniqueID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPassSyncService handleSettingsChanged:forPassWithUniqueID:](self, "handleSettingsChanged:forPassWithUniqueID:", -[NPKPassSyncService settingsForPassWithUniqueID:](self, "settingsForPassWithUniqueID:", v11), v11);

  }
}

- (void)passSyncEngine:(id)a3 finishedProcessingChange:(id)a4
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  NSObject *passSyncQueue;
  _QWORD block[5];
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  pk_Sync_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    pk_Sync_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v5;
      _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_DEFAULT, "Notice: Pass sync service: finished processing change delegate method invoked\n\tChange: %@", buf, 0xCu);
    }

  }
  passSyncQueue = self->_passSyncQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__NPKPassSyncService_passSyncEngine_finishedProcessingChange___block_invoke;
  block[3] = &unk_24CFE7998;
  block[4] = self;
  dispatch_async(passSyncQueue, block);

}

uint64_t __62__NPKPassSyncService_passSyncEngine_finishedProcessingChange___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint8_t v6[16];

  pk_Sync_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    pk_Sync_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: Companion pass sync service: syncing when appropriate following change processed", v6, 2u);
    }

  }
  return objc_msgSend(*(id *)(a1 + 32), "_provideUpdatedLibraryStateToSyncEngineAndSyncIfNecessary:", 1);
}

- (void)passSyncEngine:(id)a3 requestsAddPassData:(id)a4 forSyncStateItem:(id)a5 completion:(id)a6
{
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  pk_General_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);

  if (v7)
  {
    pk_General_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 136446722;
      v10 = "-[NPKPassSyncService passSyncEngine:requestsAddPassData:forSyncStateItem:completion:]";
      v11 = 2082;
      v12 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKPassSyncService.m";
      v13 = 2048;
      v14 = 686;
      _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Subclasses must override)", (uint8_t *)&v9, 0x20u);
    }

  }
  _NPKAssertAbort();
}

- (void)passSyncEngine:(id)a3 requestsUpdatePassData:(id)a4 forSyncStateItem:(id)a5 baseManifestHashForPartialUpdate:(id)a6 remoteAssetsForPartialUpdate:(id)a7 completion:(id)a8
{
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  int v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  pk_General_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);

  if (v9)
  {
    pk_General_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = 136446722;
      v12 = "-[NPKPassSyncService passSyncEngine:requestsUpdatePassData:forSyncStateItem:baseManifestHashForPartialUpdate"
            ":remoteAssetsForPartialUpdate:completion:]";
      v13 = 2082;
      v14 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKPassSyncService.m";
      v15 = 2048;
      v16 = 691;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Subclasses must override)", (uint8_t *)&v11, 0x20u);
    }

  }
  _NPKAssertAbort();
}

- (void)passSyncEngine:(id)a3 requestsRemovePassWithUniqueID:(id)a4 completion:(id)a5
{
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  pk_General_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);

  if (v6)
  {
    pk_General_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 136446722;
      v9 = "-[NPKPassSyncService passSyncEngine:requestsRemovePassWithUniqueID:completion:]";
      v10 = 2082;
      v11 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKPassSyncService.m";
      v12 = 2048;
      v13 = 696;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Subclasses must override)", (uint8_t *)&v8, 0x20u);
    }

  }
  _NPKAssertAbort();
}

- (id)passSyncEngine:(id)a3 partialDataForPassWithUniqueID:(id)a4 baseManifest:(id)a5 outRemoteAssets:(id *)a6
{
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  pk_General_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);

  if (v7)
  {
    pk_General_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 136446722;
      v10 = "-[NPKPassSyncService passSyncEngine:partialDataForPassWithUniqueID:baseManifest:outRemoteAssets:]";
      v11 = 2082;
      v12 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKPassSyncService.m";
      v13 = 2048;
      v14 = 703;
      _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Subclasses must override)", (uint8_t *)&v9, 0x20u);
    }

  }
  _NPKAssertAbort();
}

- (id)passSyncEngine:(id)a3 dataForPassWithUniqueID:(id)a4
{
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  pk_General_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    pk_General_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 136446722;
      v8 = "-[NPKPassSyncService passSyncEngine:dataForPassWithUniqueID:]";
      v9 = 2082;
      v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKPassSyncService.m";
      v11 = 2048;
      v12 = 709;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Subclasses must override)", (uint8_t *)&v7, 0x20u);
    }

  }
  _NPKAssertAbort();
}

- (id)passSyncEngineNeedsUpdatedPassLibraryState:(id)a3
{
  return -[NPKPassSyncService currentLibraryPassSyncStateWithReconciledState:](self, "currentLibraryPassSyncStateWithReconciledState:", 0);
}

- (void)handleRequestedAssociatedData:(unint64_t)a3 forPassWithUniqueID:(id)a4
{
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  pk_General_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    pk_General_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 136446722;
      v8 = "-[NPKPassSyncService handleRequestedAssociatedData:forPassWithUniqueID:]";
      v9 = 2082;
      v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKPassSyncService.m";
      v11 = 2048;
      v12 = 719;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Subclasses must override)", (uint8_t *)&v7, 0x20u);
    }

  }
  _NPKAssertAbort();
}

- (void)_provideUpdatedLibraryStateToSyncEngineAndSyncIfNecessary:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  _BOOL4 v19;
  NSObject *v20;
  NSObject *v21;
  _BOOL4 v22;
  NSObject *v23;
  NSObject *v24;
  _BOOL4 v25;
  NSObject *v26;
  int v27;
  void *v28;
  __int16 v29;
  const char *v30;
  uint64_t v31;

  v3 = a3;
  v31 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_passSyncQueue);
  v5 = +[NPKPassSyncState minRemoteDevicePassSyncStateVersionSupport](NPKPassSyncState, "minRemoteDevicePassSyncStateVersionSupport");
  +[NPKOSTransaction transactionWithName:](NPKOSTransaction, "transactionWithName:", CFSTR("provide updated libray state"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPassSyncEngine reconciledState](self->_passSyncEngine, "reconciledState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPassSyncService currentLibraryPassSyncStateWithReconciledState:](self, "currentLibraryPassSyncStateWithReconciledState:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "passSyncStateWithVersion:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPassSyncEngine libraryState](self->_passSyncEngine, "libraryState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  pk_Sync_log();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    pk_Sync_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = "no";
      if (v3)
        v14 = "yes";
      v27 = 138412546;
      v28 = v9;
      v29 = 2080;
      v30 = v14;
      _os_log_impl(&dword_213518000, v13, OS_LOG_TYPE_DEFAULT, "Notice: Pass sync service: Providing updated library state\n\tSync state: %@\n\tWill sync if necessary: %s", (uint8_t *)&v27, 0x16u);
    }

  }
  -[NPKPassSyncEngine setLibraryState:](self->_passSyncEngine, "setLibraryState:", v9);
  -[NPKPassSyncEngine setMinSyncStateVersion:](self->_passSyncEngine, "setMinSyncStateVersion:", v5);
  if (v3)
  {
    if ((objc_msgSend(v9, "diffWithBaselineState:representsMaterialDifferenceFromState:", v10, v7) & 1) != 0)
    {
      -[NPKPassSyncEngine processingChange](self->_passSyncEngine, "processingChange");
      v15 = objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
LABEL_12:
        pk_Sync_log();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);

        if (v19)
        {
          pk_Sync_log();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v27) = 0;
            _os_log_impl(&dword_213518000, v20, OS_LOG_TYPE_DEFAULT, "Notice: Pass sync service: requesting sync when appropriate following update to library state", (uint8_t *)&v27, 2u);
          }

        }
        -[NPKPassSyncService _syncWhenAppropriate](self, "_syncWhenAppropriate");
        goto LABEL_26;
      }
      v16 = (void *)v15;
      objc_msgSend(v7, "passSyncStateByApplyingChange:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v9, "diffWithBaselineState:representsMaterialDifferenceFromState:", v10, v17) & 1) != 0)
      {

        goto LABEL_12;
      }
      pk_Sync_log();
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);

      if (v25)
      {
        pk_Sync_log();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v27) = 0;
          _os_log_impl(&dword_213518000, v26, OS_LOG_TYPE_DEFAULT, "Notice: Pass sync service: Not syncing after providing updated library state, since change is already accounted for in processing change on top of reconciled state", (uint8_t *)&v27, 2u);
        }

      }
    }
    else
    {
      pk_Sync_log();
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);

      if (v22)
      {
        pk_Sync_log();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v27) = 0;
          _os_log_impl(&dword_213518000, v23, OS_LOG_TYPE_DEFAULT, "Notice: Pass sync service: Not syncing after providing updated library state, since change is already accounted for in reconciled state", (uint8_t *)&v27, 2u);
        }

      }
    }
  }
LABEL_26:
  objc_msgSend(v6, "invalidate");

}

- (void)_archiveTimerFired
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_passSyncQueue);
  pk_Sync_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_Sync_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Pass sync service: Archive timer fired; writing pass sync engine archive to disk",
        buf,
        2u);
    }

  }
  +[NPKOSTransaction transactionWithName:](NPKOSTransaction, "transactionWithName:", CFSTR("Archive timer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NPKSecureArchiveObject(self->_passSyncEngine);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NPKPassSyncEngineArchivePath();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v7, "writeToFile:options:error:", v8, 1, &v13);
  v9 = v13;

  if (v9)
  {
    pk_Sync_log();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);

    if (v11)
    {
      pk_Sync_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v9;
        _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_ERROR, "Error: Pass sync service: unable to write pass sync engine archive to disk\n\tError: %@", buf, 0xCu);
      }

    }
  }
  objc_msgSend(v6, "invalidate");

}

- (void)_syncWhenAppropriate
{
  NPKPassSyncServiceSyncStatus *passSyncStatus;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t v12[16];
  uint8_t buf[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_passSyncQueue);
  passSyncStatus = self->_passSyncStatus;
  -[NPKPassSyncEngine processingChange](self->_passSyncEngine, "processingChange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPassSyncEngine candidateChange](self->_passSyncEngine, "candidateChange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NPKPassSyncServiceSyncStatus shouldSyncWithCurrentIncomingChange:currentOutgoingChange:currentDate:](passSyncStatus, "shouldSyncWithCurrentIncomingChange:currentOutgoingChange:currentDate:", v4, v5, v6);

  pk_Sync_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    if (v9)
    {
      pk_Sync_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: Pass sync service: Syncing immediately while appropriate", buf, 2u);
      }

    }
    -[NPKPassSyncService _syncNow](self, "_syncNow");
  }
  else
  {
    if (v9)
    {
      pk_Sync_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_213518000, v11, OS_LOG_TYPE_DEFAULT, "Notice: Pass sync service: Setting sync timer because syncing now is not appropriate", v12, 2u);
      }

    }
    -[NPKPassSyncService _ensureSyncTimerIsSet](self, "_ensureSyncTimerIsSet");
  }
}

- (void)_syncNow
{
  id v3;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_passSyncQueue);
  +[NPKOSTransaction transactionWithName:](NPKOSTransaction, "transactionWithName:", CFSTR("Sync now"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[NPKPassSyncServiceSyncStatus reset](self->_passSyncStatus, "reset");
  -[NPKPassSyncEngine syncIfNecessary](self->_passSyncEngine, "syncIfNecessary");
  objc_msgSend(v3, "invalidate");

}

- (void)_ensureSyncTimerIsSet
{
  OS_dispatch_source *passSyncEngineSyncTimer;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  dispatch_time_t v9;
  OS_dispatch_source *v10;
  _QWORD handler[4];
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_passSyncQueue);
  passSyncEngineSyncTimer = self->_passSyncEngineSyncTimer;
  pk_Sync_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (passSyncEngineSyncTimer)
  {
    if (v5)
    {
      pk_Sync_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Pass sync service: Sync timer is already set", buf, 2u);
      }

    }
  }
  else
  {
    if (v5)
    {
      pk_Sync_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v14 = 0x404E000000000000;
        _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Pass sync service: Setting timer for %.2f seconds before syncing", buf, 0xCu);
      }

    }
    v8 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->_passSyncQueue);
    v9 = dispatch_time(0, 0xDF8476000);
    dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0);
    objc_initWeak((id *)buf, self);
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __43__NPKPassSyncService__ensureSyncTimerIsSet__block_invoke;
    handler[3] = &unk_24CFE7970;
    objc_copyWeak(&v12, (id *)buf);
    dispatch_source_set_event_handler(v8, handler);
    dispatch_resume(v8);
    v10 = self->_passSyncEngineSyncTimer;
    self->_passSyncEngineSyncTimer = (OS_dispatch_source *)v8;

    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)buf);
  }
}

void __43__NPKPassSyncService__ensureSyncTimerIsSet__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_syncTimerFired");

}

- (void)_syncTimerFired
{
  NSObject *passSyncEngineSyncTimer;
  OS_dispatch_source *v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_passSyncQueue);
  passSyncEngineSyncTimer = self->_passSyncEngineSyncTimer;
  if (passSyncEngineSyncTimer)
  {
    dispatch_source_cancel(passSyncEngineSyncTimer);
    v4 = self->_passSyncEngineSyncTimer;
    self->_passSyncEngineSyncTimer = 0;

  }
  -[NPKPassSyncService _syncWhenAppropriate](self, "_syncWhenAppropriate");
}

- (id)_archivedPassSyncEngine
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCE50];
  NPKPassSyncEngineArchivePath();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v2, "dataWithContentsOfFile:options:error:", v3, 0, &v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v12;

  if (v5)
  {
    pk_Sync_log();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

    if (v7)
    {
      pk_Sync_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v5;
        _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_DEFAULT, "Warning: Pass sync service: Unable to read pass sync engine archive. This is expected in the case of a fresh device install.\n\tError: %@", buf, 0xCu);
      }

    }
    v9 = 0;
  }
  else
  {
    v10 = objc_opt_class();
    NPKSecureUnarchiveObject(v4, v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (BOOL)dropAllMessages
{
  return self->_dropAllMessages;
}

- (void)setDropAllMessages:(BOOL)a3
{
  self->_dropAllMessages = a3;
}

- (NPKPassSyncEngine)passSyncEngine
{
  return self->_passSyncEngine;
}

- (void)setPassSyncEngine:(id)a3
{
  objc_storeStrong((id *)&self->_passSyncEngine, a3);
}

- (IDSService)passSyncService
{
  return self->_passSyncService;
}

- (void)setPassSyncService:(id)a3
{
  objc_storeStrong((id *)&self->_passSyncService, a3);
}

- (OS_dispatch_queue)passSyncQueue
{
  return self->_passSyncQueue;
}

- (void)setPassSyncQueue:(id)a3
{
  objc_storeStrong((id *)&self->_passSyncQueue, a3);
}

- (OS_dispatch_source)passSyncEngineArchiveTimer
{
  return self->_passSyncEngineArchiveTimer;
}

- (void)setPassSyncEngineArchiveTimer:(id)a3
{
  objc_storeStrong((id *)&self->_passSyncEngineArchiveTimer, a3);
}

- (OS_dispatch_source)passSyncEngineSyncTimer
{
  return self->_passSyncEngineSyncTimer;
}

- (void)setPassSyncEngineSyncTimer:(id)a3
{
  objc_storeStrong((id *)&self->_passSyncEngineSyncTimer, a3);
}

- (NPKPassSyncServiceSyncStatus)passSyncStatus
{
  return self->_passSyncStatus;
}

- (void)setPassSyncStatus:(id)a3
{
  objc_storeStrong((id *)&self->_passSyncStatus, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passSyncStatus, 0);
  objc_storeStrong((id *)&self->_passSyncEngineSyncTimer, 0);
  objc_storeStrong((id *)&self->_passSyncEngineArchiveTimer, 0);
  objc_storeStrong((id *)&self->_passSyncQueue, 0);
  objc_storeStrong((id *)&self->_passSyncService, 0);
  objc_storeStrong((id *)&self->_passSyncEngine, 0);
}

@end

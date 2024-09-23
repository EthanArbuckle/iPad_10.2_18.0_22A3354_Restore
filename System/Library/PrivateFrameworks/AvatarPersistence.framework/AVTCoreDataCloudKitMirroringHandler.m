@implementation AVTCoreDataCloudKitMirroringHandler

- (AVTCoreDataCloudKitMirroringHandler)initWithLogger:(id)a3 blockScheduler:(id)a4
{
  id v7;
  id v8;
  AVTCoreDataCloudKitMirroringHandler *v9;
  AVTCoreDataCloudKitMirroringHandler *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AVTCoreDataCloudKitMirroringHandler;
  v9 = -[AVTCoreDataCloudKitMirroringHandler init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_logger, a3);
    objc_storeStrong((id *)&v10->_blockScheduler, a4);
  }

  return v10;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  -[AVTCoreDataCloudKitMirroringHandler willResetNotificationToken](self, "willResetNotificationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AVTCoreDataCloudKitMirroringHandler notificationCenter](self, "notificationCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTCoreDataCloudKitMirroringHandler willResetNotificationToken](self, "willResetNotificationToken");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:", v5);

  }
  -[AVTCoreDataCloudKitMirroringHandler didResetNotificationToken](self, "didResetNotificationToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[AVTCoreDataCloudKitMirroringHandler notificationCenter](self, "notificationCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTCoreDataCloudKitMirroringHandler didResetNotificationToken](self, "didResetNotificationToken");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObserver:", v8);

  }
  v9.receiver = self;
  v9.super_class = (Class)AVTCoreDataCloudKitMirroringHandler;
  -[AVTCoreDataCloudKitMirroringHandler dealloc](&v9, sel_dealloc);
}

- (void)startObservingResetSyncWithNotificationCenter:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id location;

  v4 = a3;
  -[AVTCoreDataCloudKitMirroringHandler willResetNotificationToken](self, "willResetNotificationToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

LABEL_4:
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("Already observing notifications"));
    goto LABEL_5;
  }
  -[AVTCoreDataCloudKitMirroringHandler didResetNotificationToken](self, "didResetNotificationToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    goto LABEL_4;
LABEL_5:
  -[AVTCoreDataCloudKitMirroringHandler logger](self, "logger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "logStartObservingResetSync");

  objc_initWeak(&location, self);
  -[AVTCoreDataCloudKitMirroringHandler setNotificationCenter:](self, "setNotificationCenter:", v4);
  v8 = *MEMORY[0x24BDBB3F0];
  v9 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __85__AVTCoreDataCloudKitMirroringHandler_startObservingResetSyncWithNotificationCenter___block_invoke;
  v15[3] = &unk_24DD318E0;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v4, "addObserverForName:object:queue:usingBlock:", v8, 0, 0, v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTCoreDataCloudKitMirroringHandler setWillResetNotificationToken:](self, "setWillResetNotificationToken:", v10);

  v11 = *MEMORY[0x24BDBB3E0];
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __85__AVTCoreDataCloudKitMirroringHandler_startObservingResetSyncWithNotificationCenter___block_invoke_2;
  v13[3] = &unk_24DD318E0;
  objc_copyWeak(&v14, &location);
  objc_msgSend(v4, "addObserverForName:object:queue:usingBlock:", v11, 0, 0, v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTCoreDataCloudKitMirroringHandler setDidResetNotificationToken:](self, "setDidResetNotificationToken:", v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __85__AVTCoreDataCloudKitMirroringHandler_startObservingResetSyncWithNotificationCenter___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "willResetSync:", v3);

}

void __85__AVTCoreDataCloudKitMirroringHandler_startObservingResetSyncWithNotificationCenter___block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "didResetSync:", v3);

}

- (void)willResetSync:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  AVTCoreDataCloudKitMirroringHandler *v9;

  v4 = a3;
  -[AVTCoreDataCloudKitMirroringHandler logger](self, "logger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __53__AVTCoreDataCloudKitMirroringHandler_willResetSync___block_invoke;
  v7[3] = &unk_24DD31DF0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  objc_msgSend(v5, "processingWillResetSyncNotification:", v7);

}

void __53__AVTCoreDataCloudKitMirroringHandler_willResetSync___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BDBB3E8]);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v3 = objc_msgSend(v7, "unsignedIntegerValue");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "logger");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "logMissingResetSyncReasonKey");

    v3 = 0;
  }
  objc_msgSend(*(id *)(a1 + 40), "logger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logResetSyncReason:", v3);

  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mirroringHandler:willResetSyncWithReason:", *(_QWORD *)(a1 + 40), v3);

}

- (void)didResetSync:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  AVTCoreDataCloudKitMirroringHandler *v9;

  v4 = a3;
  -[AVTCoreDataCloudKitMirroringHandler logger](self, "logger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __52__AVTCoreDataCloudKitMirroringHandler_didResetSync___block_invoke;
  v7[3] = &unk_24DD31DF0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  objc_msgSend(v5, "processingDidResetSyncNotification:", v7);

}

void __52__AVTCoreDataCloudKitMirroringHandler_didResetSync___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BDBB3E8]);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v3 = objc_msgSend(v7, "unsignedIntegerValue");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "logger");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "logMissingResetSyncReasonKey");

    v3 = 0;
  }
  objc_msgSend(*(id *)(a1 + 40), "logger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logResetSyncReason:", v3);

  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mirroringHandler:didResetSyncWithReason:", *(_QWORD *)(a1 + 40), v3);

}

- (void)scheduleExportChangesWithManagedObjectContext:(id)a3 discretionary:(BOOL)a4 workQueue:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  BOOL v21;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  -[AVTCoreDataCloudKitMirroringHandler blockScheduler](self, "blockScheduler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __127__AVTCoreDataCloudKitMirroringHandler_scheduleExportChangesWithManagedObjectContext_discretionary_workQueue_completionHandler___block_invoke;
  v17[3] = &unk_24DD31E18;
  v17[4] = self;
  v18 = v10;
  v21 = a4;
  v19 = v11;
  v20 = v12;
  v14 = v11;
  v15 = v10;
  v16 = v12;
  objc_msgSend(v13, "performBlock:afterDelay:onQueue:", v17, v14, 0.0);

}

void __127__AVTCoreDataCloudKitMirroringHandler_scheduleExportChangesWithManagedObjectContext_discretionary_workQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "exportInFlight"))
  {
    v2 = *(_QWORD *)(a1 + 56);
    if (v2)
    {
      v7 = *MEMORY[0x24BDD0FD8];
      v8[0] = CFSTR("Export already in flight, try again later");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      +[AVTError errorWithCode:userInfo:](AVTError, "errorWithCode:userInfo:", 720, v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v2 + 16))(v2, 0, v4);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setExportInFlight:", 1);
    objc_msgSend(*(id *)(a1 + 32), "exportChangesWithManagedObjectContext:discretionary:workQueue:completionHandler:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 32), "blockScheduler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __127__AVTCoreDataCloudKitMirroringHandler_scheduleExportChangesWithManagedObjectContext_discretionary_workQueue_completionHandler___block_invoke_2;
    v6[3] = &unk_24DD31D38;
    v6[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "performBlock:afterDelay:onQueue:", v6, *(_QWORD *)(a1 + 48), 3.0);

  }
}

uint64_t __127__AVTCoreDataCloudKitMirroringHandler_scheduleExportChangesWithManagedObjectContext_discretionary_workQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setExportInFlight:", 0);
}

- (void)importChangesWithManagedObjectContext:(id)a3 discretionary:(BOOL)a4 workQueue:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  BOOL v20;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __119__AVTCoreDataCloudKitMirroringHandler_importChangesWithManagedObjectContext_discretionary_workQueue_completionHandler___block_invoke;
  v16[3] = &unk_24DD31EE0;
  v16[4] = self;
  v17 = v11;
  v18 = v10;
  v19 = v12;
  v20 = a4;
  v13 = v12;
  v14 = v10;
  v15 = v11;
  objc_msgSend(v14, "performBlockAndWait:", v16);

}

void __119__AVTCoreDataCloudKitMirroringHandler_importChangesWithManagedObjectContext_discretionary_workQueue_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;
  id v8;
  char v9;

  objc_msgSend(*(id *)(a1 + 32), "logger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __119__AVTCoreDataCloudKitMirroringHandler_importChangesWithManagedObjectContext_discretionary_workQueue_completionHandler___block_invoke_2;
  v4[3] = &unk_24DD31EB8;
  v5 = *(id *)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  v7 = v2;
  v8 = *(id *)(a1 + 56);
  v9 = *(_BYTE *)(a1 + 64);
  v3 = v2;
  objc_msgSend(v3, "importingRecords:", v4);

}

void __119__AVTCoreDataCloudKitMirroringHandler_importChangesWithManagedObjectContext_discretionary_workQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;

  v2 = objc_alloc(MEMORY[0x24BDBB620]);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __119__AVTCoreDataCloudKitMirroringHandler_importChangesWithManagedObjectContext_discretionary_workQueue_completionHandler___block_invoke_3;
  v13[3] = &unk_24DD31E90;
  v14 = *(id *)(a1 + 32);
  v15 = *(id *)(a1 + 40);
  v16 = *(id *)(a1 + 48);
  v17 = *(id *)(a1 + 56);
  v3 = (void *)objc_msgSend(v2, "initWithOptions:completionBlock:", 0, v13);
  objc_msgSend(v3, "options");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVTCoreDataCloudKitMirroringConfiguration configureMirroringRequestOptions:discretionary:](AVTCoreDataCloudKitMirroringConfiguration, "configureMirroringRequestOptions:discretionary:", v4, *(unsigned __int8 *)(a1 + 64));

  v5 = *(void **)(a1 + 40);
  v12 = 0;
  objc_msgSend(v5, "executeRequest:error:", v3, &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v12;

  if (!v6)
  {
    v8 = *(void **)(a1 + 48);
    v9 = objc_msgSend(v7, "code");
    objc_msgSend(v7, "description");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "logMirroringRequestErrorWithCode:description:", v9, v10);

    v11 = *(_QWORD *)(a1 + 56);
    if (v11)
      (*(void (**)(uint64_t, _QWORD, id))(v11 + 16))(v11, 0, v7);
  }

}

void __119__AVTCoreDataCloudKitMirroringHandler_importChangesWithManagedObjectContext_discretionary_workQueue_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;

  v3 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __119__AVTCoreDataCloudKitMirroringHandler_importChangesWithManagedObjectContext_discretionary_workQueue_completionHandler___block_invoke_4;
  v6[3] = &unk_24DD31E68;
  v4 = *(NSObject **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v8 = *(id *)(a1 + 48);
  v9 = v3;
  v10 = *(id *)(a1 + 56);
  v5 = v3;
  dispatch_async(v4, v6);

}

void __119__AVTCoreDataCloudKitMirroringHandler_importChangesWithManagedObjectContext_discretionary_workQueue_completionHandler___block_invoke_4(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __119__AVTCoreDataCloudKitMirroringHandler_importChangesWithManagedObjectContext_discretionary_workQueue_completionHandler___block_invoke_5;
  v3[3] = &unk_24DD31E40;
  v2 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v2, "performBlockAndWait:", v3);

}

void __119__AVTCoreDataCloudKitMirroringHandler_importChangesWithManagedObjectContext_discretionary_workQueue_completionHandler___block_invoke_5(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  v3 = objc_msgSend(*(id *)(a1 + 40), "success");
  objc_msgSend(*(id *)(a1 + 40), "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logImportRequestResult:error:", v3, v5);

  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
  {
    v7 = objc_msgSend(*(id *)(a1 + 40), "success");
    objc_msgSend(*(id *)(a1 + 40), "error");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, v7, v8);

  }
}

- (void)exportChangesWithManagedObjectContext:(id)a3 discretionary:(BOOL)a4 workQueue:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  BOOL v20;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __119__AVTCoreDataCloudKitMirroringHandler_exportChangesWithManagedObjectContext_discretionary_workQueue_completionHandler___block_invoke;
  v16[3] = &unk_24DD31EE0;
  v16[4] = self;
  v17 = v11;
  v18 = v10;
  v19 = v12;
  v20 = a4;
  v13 = v12;
  v14 = v10;
  v15 = v11;
  objc_msgSend(v14, "performBlockAndWait:", v16);

}

void __119__AVTCoreDataCloudKitMirroringHandler_exportChangesWithManagedObjectContext_discretionary_workQueue_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;
  id v8;
  char v9;

  objc_msgSend(*(id *)(a1 + 32), "logger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __119__AVTCoreDataCloudKitMirroringHandler_exportChangesWithManagedObjectContext_discretionary_workQueue_completionHandler___block_invoke_2;
  v4[3] = &unk_24DD31EB8;
  v5 = *(id *)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  v7 = v2;
  v8 = *(id *)(a1 + 56);
  v9 = *(_BYTE *)(a1 + 64);
  v3 = v2;
  objc_msgSend(v3, "exportingRecords:", v4);

}

void __119__AVTCoreDataCloudKitMirroringHandler_exportChangesWithManagedObjectContext_discretionary_workQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;

  v2 = objc_alloc(MEMORY[0x24BDBB618]);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __119__AVTCoreDataCloudKitMirroringHandler_exportChangesWithManagedObjectContext_discretionary_workQueue_completionHandler___block_invoke_3;
  v13[3] = &unk_24DD31E90;
  v14 = *(id *)(a1 + 32);
  v15 = *(id *)(a1 + 40);
  v16 = *(id *)(a1 + 48);
  v17 = *(id *)(a1 + 56);
  v3 = (void *)objc_msgSend(v2, "initWithOptions:completionBlock:", 0, v13);
  objc_msgSend(v3, "options");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVTCoreDataCloudKitMirroringConfiguration configureMirroringRequestOptions:discretionary:](AVTCoreDataCloudKitMirroringConfiguration, "configureMirroringRequestOptions:discretionary:", v4, *(unsigned __int8 *)(a1 + 64));

  v5 = *(void **)(a1 + 40);
  v12 = 0;
  objc_msgSend(v5, "executeRequest:error:", v3, &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v12;

  if (!v6)
  {
    v8 = *(void **)(a1 + 48);
    v9 = objc_msgSend(v7, "code");
    objc_msgSend(v7, "description");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "logMirroringRequestErrorWithCode:description:", v9, v10);

    v11 = *(_QWORD *)(a1 + 56);
    if (v11)
      (*(void (**)(uint64_t, _QWORD, id))(v11 + 16))(v11, 0, v7);
  }

}

void __119__AVTCoreDataCloudKitMirroringHandler_exportChangesWithManagedObjectContext_discretionary_workQueue_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;

  v3 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __119__AVTCoreDataCloudKitMirroringHandler_exportChangesWithManagedObjectContext_discretionary_workQueue_completionHandler___block_invoke_4;
  v6[3] = &unk_24DD31E68;
  v4 = *(NSObject **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v8 = *(id *)(a1 + 48);
  v9 = v3;
  v10 = *(id *)(a1 + 56);
  v5 = v3;
  dispatch_async(v4, v6);

}

void __119__AVTCoreDataCloudKitMirroringHandler_exportChangesWithManagedObjectContext_discretionary_workQueue_completionHandler___block_invoke_4(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __119__AVTCoreDataCloudKitMirroringHandler_exportChangesWithManagedObjectContext_discretionary_workQueue_completionHandler___block_invoke_5;
  v3[3] = &unk_24DD31E40;
  v2 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v2, "performBlockAndWait:", v3);

}

void __119__AVTCoreDataCloudKitMirroringHandler_exportChangesWithManagedObjectContext_discretionary_workQueue_completionHandler___block_invoke_5(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  v3 = objc_msgSend(*(id *)(a1 + 40), "success");
  objc_msgSend(*(id *)(a1 + 40), "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logExportRequestResult:error:", v3, v5);

  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
  {
    v7 = objc_msgSend(*(id *)(a1 + 40), "success");
    objc_msgSend(*(id *)(a1 + 40), "error");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, v7, v8);

  }
}

- (void)resetZoneWithManagedObjectContext:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a3;
  v6 = a4;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __91__AVTCoreDataCloudKitMirroringHandler_resetZoneWithManagedObjectContext_completionHandler___block_invoke;
  v9[3] = &unk_24DD31740;
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  objc_msgSend(v8, "performBlockAndWait:", v9);

}

void __91__AVTCoreDataCloudKitMirroringHandler_resetZoneWithManagedObjectContext_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v2 = objc_alloc(MEMORY[0x24BDBB630]);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __91__AVTCoreDataCloudKitMirroringHandler_resetZoneWithManagedObjectContext_completionHandler___block_invoke_2;
  v10[3] = &unk_24DD31F08;
  v11 = *(id *)(a1 + 32);
  v12 = *(id *)(a1 + 40);
  v3 = (void *)objc_msgSend(v2, "initWithOptions:completionBlock:", 0, v10);
  objc_msgSend(v3, "options");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVTCoreDataCloudKitMirroringConfiguration configureMirroringRequestOptions:](AVTCoreDataCloudKitMirroringConfiguration, "configureMirroringRequestOptions:", v4);

  v5 = *(void **)(a1 + 32);
  v9 = 0;
  objc_msgSend(v5, "executeRequest:error:", v3, &v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v9;
  if (!v6)
  {
    v8 = *(_QWORD *)(a1 + 40);
    if (v8)
      (*(void (**)(uint64_t, _QWORD, id))(v8 + 16))(v8, 0, v7);
  }

}

void __91__AVTCoreDataCloudKitMirroringHandler_resetZoneWithManagedObjectContext_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __91__AVTCoreDataCloudKitMirroringHandler_resetZoneWithManagedObjectContext_completionHandler___block_invoke_3;
  v7[3] = &unk_24DD31768;
  v4 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_msgSend(v4, "performBlockAndWait:", v7);

}

void __91__AVTCoreDataCloudKitMirroringHandler_resetZoneWithManagedObjectContext_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = objc_msgSend(*(id *)(a1 + 32), "success");
  objc_msgSend(*(id *)(a1 + 32), "error");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v3, v4);

}

- (AVTCoreDataCloudKitMirroringHandlerDelegate)delegate
{
  return (AVTCoreDataCloudKitMirroringHandlerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (AVTBlockScheduler)blockScheduler
{
  return self->_blockScheduler;
}

- (NSObject)willResetNotificationToken
{
  return self->_willResetNotificationToken;
}

- (void)setWillResetNotificationToken:(id)a3
{
  objc_storeStrong((id *)&self->_willResetNotificationToken, a3);
}

- (NSObject)didResetNotificationToken
{
  return self->_didResetNotificationToken;
}

- (void)setDidResetNotificationToken:(id)a3
{
  objc_storeStrong((id *)&self->_didResetNotificationToken, a3);
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void)setNotificationCenter:(id)a3
{
  objc_storeStrong((id *)&self->_notificationCenter, a3);
}

- (BOOL)exportInFlight
{
  return self->_exportInFlight;
}

- (void)setExportInFlight:(BOOL)a3
{
  self->_exportInFlight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_didResetNotificationToken, 0);
  objc_storeStrong((id *)&self->_willResetNotificationToken, 0);
  objc_storeStrong((id *)&self->_blockScheduler, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

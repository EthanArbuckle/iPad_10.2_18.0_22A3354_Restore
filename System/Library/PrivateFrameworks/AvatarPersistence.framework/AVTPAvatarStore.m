@implementation AVTPAvatarStore

+ (id)defaultBackendWithWorkQueue:(id)a3 environment:(id)a4
{
  id v4;
  void *v5;
  AVTCoreDataStoreBackend *v6;

  v4 = a4;
  if ((AVTUIIsAvatarUIEnabled_once() & 1) != 0)
  {
    +[AVTCoreDataPersistentStoreConfiguration remoteConfigurationWithEnvironment:](AVTCoreDataPersistentStoreConfiguration, "remoteConfigurationWithEnvironment:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[AVTCoreDataStoreBackend initWithConfiguration:environment:]([AVTCoreDataStoreBackend alloc], "initWithConfiguration:environment:", v5, v4);

  }
  else
  {
    v6 = objc_alloc_init(AVTStubbedStoreBackend);
  }

  return v6;
}

- (AVTPAvatarStore)init
{
  void *v3;
  AVTPAvatarStore *v4;

  +[AVTCoreEnvironment defaultEnvironment](AVTCoreEnvironment, "defaultEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[AVTPAvatarStore initWithEnvironment:](self, "initWithEnvironment:", v3);

  return v4;
}

- (AVTPAvatarStore)initWithEnvironment:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  void *v7;
  AVTPuppetStore *v8;
  AVTStickerUserDefaultsBackend *v9;
  void *v10;
  AVTStickerUserDefaultsBackend *v11;
  AVTPAvatarStore *v12;

  v4 = a3;
  objc_msgSend(v4, "lockProvider");
  v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, const char *))v5)[2](v5, "com.apple.AvatarUI.AVTAvatarStore.backendAcccessQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "defaultBackendWithWorkQueue:environment:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[AVTPuppetStore initWithEnvironment:]([AVTPuppetStore alloc], "initWithEnvironment:", v4);
  v9 = [AVTStickerUserDefaultsBackend alloc];
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[AVTStickerUserDefaultsBackend initWithWorkQueue:environment:userDefaults:](v9, "initWithWorkQueue:environment:userDefaults:", v6, v4, v10);

  v12 = -[AVTPAvatarStore initWithBackend:backendAccessQueue:puppetStore:stickerBackend:environment:](self, "initWithBackend:backendAccessQueue:puppetStore:stickerBackend:environment:", v7, v6, v8, v11, v4);
  return v12;
}

- (AVTPAvatarStore)initWithBackend:(id)a3 backendAccessQueue:(id)a4 puppetStore:(id)a5 stickerBackend:(id)a6 environment:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  AVTPAvatarStore *v17;
  AVTPAvatarStore *v18;
  void (**v19)(_QWORD, _QWORD);
  uint64_t v20;
  OS_dispatch_queue *workQueue;
  void (**v22)(_QWORD, _QWORD);
  uint64_t v23;
  OS_dispatch_queue *puppetStoreAccessQueue;
  uint64_t v25;
  AVTUILogger *logger;
  AVTUILogger *v27;
  void *v28;
  id v30;
  objc_super v31;

  v30 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v31.receiver = self;
  v31.super_class = (Class)AVTPAvatarStore;
  v17 = -[AVTPAvatarStore init](&v31, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_environment, a7);
    objc_storeStrong((id *)&v18->_backend, a3);
    -[AVTStoreBackend setBackendDelegate:](v18->_backend, "setBackendDelegate:", v18);
    objc_storeStrong((id *)&v18->_puppetStore, a5);
    objc_msgSend(v16, "serialQueueProvider");
    v19 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, const char *))v19)[2](v19, "com.apple.AvatarUI.AVTAvatarStore.workQueue");
    v20 = objc_claimAutoreleasedReturnValue();
    workQueue = v18->_workQueue;
    v18->_workQueue = (OS_dispatch_queue *)v20;

    objc_storeStrong((id *)&v18->_backendAccessQueue, a4);
    objc_msgSend(v16, "lockProvider");
    v22 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, const char *))v22)[2](v22, "com.apple.AvatarUI.AVTAvatarStore.puppetStoreAccessQueue");
    v23 = objc_claimAutoreleasedReturnValue();
    puppetStoreAccessQueue = v18->_puppetStoreAccessQueue;
    v18->_puppetStoreAccessQueue = (OS_dispatch_queue *)v23;

    objc_msgSend(v16, "logger");
    v25 = objc_claimAutoreleasedReturnValue();
    logger = v18->_logger;
    v18->_logger = (AVTUILogger *)v25;

    v27 = v18->_logger;
    -[AVTPAvatarStore description](v18, "description");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTUILogger logCreatingStore:](v27, "logCreatingStore:", v28);

    objc_storeStrong((id *)&v18->_stickerBackend, a6);
  }

  return v18;
}

- (BOOL)canCreateAvatar
{
  return -[AVTPAvatarStore canCreateAvatarWithError:](self, "canCreateAvatarWithError:", 0);
}

- (BOOL)canCreateAvatarWithError:(id *)a3
{
  void *v5;
  BOOL v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  if (AVTIsRunningAsSetupUser())
  {
    -[AVTPAvatarStore logger](self, "logger");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "logSkippedFetchingRecordsWithReason:", CFSTR("Running as setup user"));

    return 0;
  }
  else
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x2020000000;
    v18 = 0;
    v9 = 0;
    v10 = &v9;
    v11 = 0x3032000000;
    v12 = __Block_byref_object_copy__3;
    v13 = __Block_byref_object_dispose__3;
    v14 = 0;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __44__AVTPAvatarStore_canCreateAvatarWithError___block_invoke;
    v8[3] = &unk_24DD328E8;
    v8[4] = &v15;
    v8[5] = &v9;
    -[AVTPAvatarStore performBackendWork:](self, "performBackendWork:", v8);
    v6 = *((_BYTE *)v16 + 24) != 0;
    if (a3 && !*((_BYTE *)v16 + 24))
      *a3 = objc_retainAutorelease((id)v10[5]);
    _Block_object_dispose(&v9, 8);

    _Block_object_dispose(&v15, 8);
  }
  return v6;
}

void __44__AVTPAvatarStore_canCreateAvatarWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  char v4;
  id obj;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v3 + 40);
  v4 = objc_msgSend(a2, "canCreateAvatarWithError:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4;
}

- (id)avatarsForFetchRequest:(id)a3 error:(id *)a4
{
  id v6;
  char v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t *v28;
  void *v29;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(_QWORD *, void *);
  void *v34;
  id v35;
  uint64_t *v36;
  uint64_t *v37;
  _QWORD v38[5];
  id v39;
  uint64_t *v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;
  const __CFString *v66;
  _QWORD v67[2];

  v67[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v60 = 0;
  v61 = &v60;
  v62 = 0x3032000000;
  v63 = __Block_byref_object_copy__3;
  v64 = __Block_byref_object_dispose__3;
  v65 = 0;
  v54 = 0;
  v55 = &v54;
  v56 = 0x3032000000;
  v57 = __Block_byref_object_copy__3;
  v58 = __Block_byref_object_dispose__3;
  v59 = 0;
  v48 = 0;
  v49 = &v48;
  v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__3;
  v52 = __Block_byref_object_dispose__3;
  v53 = 0;
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__3;
  v46 = __Block_byref_object_dispose__3;
  v47 = 0;
  v7 = AVTIsRunningAsSetupUser();
  v8 = MEMORY[0x24BDAC760];
  if ((v7 & 1) != 0)
  {
    -[AVTPAvatarStore logger](self, "logger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "logSkippedFetchingRecordsWithReason:", CFSTR("Running as setup user"));

  }
  else
  {
    -[AVTPAvatarStore logger](self, "logger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v8;
    v38[1] = 3221225472;
    v38[2] = __48__AVTPAvatarStore_avatarsForFetchRequest_error___block_invoke;
    v38[3] = &unk_24DD32938;
    v38[4] = self;
    v40 = &v60;
    v39 = v6;
    v41 = &v48;
    objc_msgSend(v10, "fetchingRecords:", v38);

  }
  v31 = v8;
  v32 = 3221225472;
  v33 = __48__AVTPAvatarStore_avatarsForFetchRequest_error___block_invoke_3;
  v34 = &unk_24DD32960;
  v36 = &v54;
  v11 = v6;
  v35 = v11;
  v37 = &v42;
  -[AVTPAvatarStore performPuppetStoreWork:](self, "performPuppetStoreWork:", &v31);
  v12 = (void *)v61[5];
  v13 = v55[5];
  if (v12)
  {
    if (v13)
    {
      objc_msgSend(v12, "arrayByAddingObjectsFromArray:", v31, v32, v33, v34);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    }
    objc_msgSend((id)v43[5], "domain", v31, v32, v33, v34);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "isEqual:", CFSTR("AVTAvatarUIErrorDomain")))
    {
      v20 = objc_msgSend((id)v43[5], "code") == 404;

      if (v20)
      {
        -[AVTPAvatarStore logger](self, "logger");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v43[5], "description");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "logRecordsNotFoundInPuppetStore:", v22);
LABEL_24:

        v28 = v61;
        goto LABEL_25;
      }
    }
    else
    {

    }
    -[AVTPAvatarStore logger](self, "logger");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v43[5], "description");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "logReadingError:", v22);
    goto LABEL_24;
  }
  if (v13)
  {
    objc_msgSend((id)v49[5], "domain", v31, v32, v33, v34);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "isEqual:", CFSTR("AVTAvatarUIErrorDomain")))
    {
      v16 = objc_msgSend((id)v49[5], "code") == 404;

      if (v16)
      {
        -[AVTPAvatarStore logger](self, "logger");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v49[5], "description");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "logRecordsNotFoundInRecordStore:", v18);
LABEL_21:

        v28 = v55;
LABEL_25:
        v14 = (id)v28[5];
LABEL_26:
        v29 = v14;
        v27 = 0;
        if (v14)
          goto LABEL_30;
        goto LABEL_27;
      }
    }
    else
    {

    }
    -[AVTPAvatarStore logger](self, "logger");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v49[5], "description");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "logReadingError:", v18);
    goto LABEL_21;
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array", v31, v32, v33, v34);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v49[5])
    objc_msgSend(v23, "addObject:");
  if (v43[5])
    objc_msgSend(v24, "addObject:");
  v66 = CFSTR("AVTAvatarUIMultipleErrorsKey");
  v25 = (void *)objc_msgSend(v24, "copy");
  v67[0] = v25;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v67, &v66, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVTError errorWithCode:userInfo:](AVTError, "errorWithCode:userInfo:", 666, v26);
  v27 = (id)objc_claimAutoreleasedReturnValue();

LABEL_27:
  if (a4)
  {
    v27 = objc_retainAutorelease(v27);
    v29 = 0;
    *a4 = v27;
  }
  else
  {
    v29 = 0;
  }
LABEL_30:

  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v48, 8);

  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(&v60, 8);

  return v29;
}

void __48__AVTPAvatarStore_avatarsForFetchRequest_error___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  __int128 v5;
  _QWORD v6[4];
  __int128 v7;
  uint64_t v8;

  v2 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __48__AVTPAvatarStore_avatarsForFetchRequest_error___block_invoke_2;
  v6[3] = &unk_24DD32910;
  v5 = *(_OWORD *)(a1 + 40);
  v3 = (id)v5;
  v7 = v5;
  v8 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v2, "performBackendWork:", v6);
  objc_msgSend(*(id *)(a1 + 32), "logger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logFetchedRecords:criteria:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count"), objc_msgSend(*(id *)(a1 + 40), "criteria"));

}

void __48__AVTPAvatarStore_avatarsForFetchRequest_error___block_invoke_2(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id obj;

  v3 = a1[4];
  v4 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(a2, "avatarsForFetchRequest:error:", v3, &obj);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = *(_QWORD *)(a1[5] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __48__AVTPAvatarStore_avatarsForFetchRequest_error___block_invoke_3(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id obj;

  v3 = a1[4];
  v4 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(a2, "avatarPuppetsForFetchRequest:error:", v3, &obj);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = *(_QWORD *)(a1[5] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (void)performBackendWork:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[AVTPAvatarStore backendAccessQueue](self, "backendAccessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__AVTPAvatarStore_performBackendWork___block_invoke;
  block[3] = &unk_24DD31768;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __38__AVTPAvatarStore_performBackendWork___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "backend");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)performPuppetStoreWork:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[AVTPAvatarStore puppetStoreAccessQueue](self, "puppetStoreAccessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__AVTPAvatarStore_performPuppetStoreWork___block_invoke;
  block[3] = &unk_24DD31768;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __42__AVTPAvatarStore_performPuppetStoreWork___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "puppetStore");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)performAsynchronousWork:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  -[AVTPAvatarStore workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v5, v4);

}

- (void)fetchAvatarsForFetchRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __65__AVTPAvatarStore_fetchAvatarsForFetchRequest_completionHandler___block_invoke;
  v10[3] = &unk_24DD31E40;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[AVTPAvatarStore performAsynchronousWork:](self, "performAsynchronousWork:", v10);

}

void __65__AVTPAvatarStore_fetchAvatarsForFetchRequest_completionHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v7 = 0;
  objc_msgSend(v2, "avatarsForFetchRequest:error:", v3, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v7;
  v6 = a1[6];
  if (v6)
    (*(void (**)(uint64_t, void *, id))(v6 + 16))(v6, v4, v5);

}

- (void)saveAvatarRecord:(id)a3 thumbnailAvatar:(id)a4 completionBlock:(id)a5 thumbnailGenerationCompletionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("AVTTypeMismatchException"), CFSTR("Unexpected object class for %@"), v10);
  v14 = v10;
  -[AVTPAvatarStore logger](self, "logger");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __103__AVTPAvatarStore_saveAvatarRecord_thumbnailAvatar_completionBlock_thumbnailGenerationCompletionBlock___block_invoke;
  v20[3] = &unk_24DD329B0;
  v20[4] = self;
  v21 = v14;
  v22 = v11;
  v23 = v12;
  v24 = v13;
  v16 = v13;
  v17 = v11;
  v18 = v12;
  v19 = v14;
  objc_msgSend(v15, "savingRecords:", v20);

}

void __103__AVTPAvatarStore_saveAvatarRecord_thumbnailAvatar_completionBlock_thumbnailGenerationCompletionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __103__AVTPAvatarStore_saveAvatarRecord_thumbnailAvatar_completionBlock_thumbnailGenerationCompletionBlock___block_invoke_2;
  v3[3] = &unk_24DD32988;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v7 = *(id *)(a1 + 56);
  v6 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 64);
  objc_msgSend(v4, "performAsynchronousWork:", v3);

}

void __103__AVTPAvatarStore_saveAvatarRecord_thumbnailAvatar_completionBlock_thumbnailGenerationCompletionBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  id v41;
  void *v42;
  uint64_t v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "imageHandlingDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v44, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0;
  v5 = objc_msgSend(v2, "deleteThumbnailsForAvatarRecordsWithIdentifiers:error:", v4, &v41);
  v6 = v41;

  if ((v5 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "imageHandlingDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "environment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "clearStickersForAvatarRecordIdentifier:withEnvironment:", v8, v9);

    v35 = 0;
    v36 = &v35;
    v37 = 0x3032000000;
    v38 = __Block_byref_object_copy__3;
    v39 = __Block_byref_object_dispose__3;
    v40 = 0;
    v31 = 0;
    v32 = &v31;
    v33 = 0x2020000000;
    v34 = 0;
    v10 = *(void **)(a1 + 32);
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __103__AVTPAvatarStore_saveAvatarRecord_thumbnailAvatar_completionBlock_thumbnailGenerationCompletionBlock___block_invoke_3;
    v27[3] = &unk_24DD32910;
    v29 = &v31;
    v28 = *(id *)(a1 + 40);
    v30 = &v35;
    objc_msgSend(v10, "performBackendWork:", v27);
    if (*((_BYTE *)v32 + 24))
    {
      v11 = *(void **)(a1 + 32);
      if (*(_QWORD *)(a1 + 48))
      {
        objc_msgSend(v11, "imageHandlingDelegate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = *(_QWORD *)(a1 + 40);
        v14 = *(_QWORD *)(a1 + 48);
        v26 = v6;
        v15 = objc_msgSend(v12, "generateThumbnailsForAvatarRecord:avatar:error:", v13, v14, &v26);
        v16 = v26;
      }
      else
      {
        objc_msgSend(v11, "imageHandlingDelegate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = *(_QWORD *)(a1 + 40);
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v43, 1);
        v19 = objc_claimAutoreleasedReturnValue();
        v25 = v6;
        v15 = objc_msgSend(v12, "generateThumbnailsForAvatarRecords:error:", v19, &v25);
        v16 = v25;

        v6 = (id)v19;
      }

      v20 = *(_QWORD *)(a1 + 64);
      if (v20)
        (*(void (**)(uint64_t, uint64_t, id))(v20 + 16))(v20, v15, v16);
      v21 = *(_QWORD *)(a1 + 56);
      if (v21)
        (*(void (**)(uint64_t, _QWORD, uint64_t))(v21 + 16))(v21, *((unsigned __int8 *)v32 + 24), v36[5]);
      v22 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v23;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v42, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "postChangeNotificationForRecordWithIdentifiers:remote:", v24, 0);

      v6 = v16;
    }
    else
    {
      v18 = *(_QWORD *)(a1 + 56);
      if (v18)
        (*(void (**)(uint64_t, _QWORD, uint64_t))(v18 + 16))(v18, 0, v36[5]);
    }

    _Block_object_dispose(&v31, 8);
    _Block_object_dispose(&v35, 8);

  }
  else
  {
    v17 = *(_QWORD *)(a1 + 56);
    if (v17)
      (*(void (**)(uint64_t, _QWORD, id))(v17 + 16))(v17, 0, v6);
  }

}

void __103__AVTPAvatarStore_saveAvatarRecord_thumbnailAvatar_completionBlock_thumbnailGenerationCompletionBlock___block_invoke_3(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  id obj;

  v3 = a1[4];
  v4 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v4 + 40);
  v5 = objc_msgSend(a2, "saveAvatar:error:", v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v5;
}

- (void)deleteAvatar:(id)a3 completionHandler:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  void *v7;
  id v8;

  v8 = a3;
  v6 = (void (**)(id, _QWORD, void *))a4;
  if ((objc_msgSend(v8, "isEditable") & 1) != 0)
  {
    objc_msgSend(v8, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTPAvatarStore deleteAvatarWithIdentifier:completionBlock:](self, "deleteAvatarWithIdentifier:completionBlock:", v7, v6);
  }
  else
  {
    +[AVTError errorWithCode:userInfo:](AVTError, "errorWithCode:userInfo:", 577, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v7);
  }

}

- (void)deleteAvatarWithIdentifier:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[AVTPAvatarStore logger](self, "logger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __62__AVTPAvatarStore_deleteAvatarWithIdentifier_completionBlock___block_invoke;
  v11[3] = &unk_24DD32020;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "deletingRecords:", v11);

}

void __62__AVTPAvatarStore_deleteAvatarWithIdentifier_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __62__AVTPAvatarStore_deleteAvatarWithIdentifier_completionBlock___block_invoke_2;
  v3[3] = &unk_24DD31E40;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v4, "performAsynchronousWork:", v3);

}

void __62__AVTPAvatarStore_deleteAvatarWithIdentifier_completionBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t *v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x24BDAC8D0];
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__3;
  v31 = __Block_byref_object_dispose__3;
  v32 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __62__AVTPAvatarStore_deleteAvatarWithIdentifier_completionBlock___block_invoke_3;
  v19[3] = &unk_24DD32910;
  v21 = &v23;
  v2 = *(void **)(a1 + 32);
  v20 = *(id *)(a1 + 40);
  v22 = &v27;
  objc_msgSend(v2, "performBackendWork:", v19);
  v3 = v24;
  if (*((_BYTE *)v24 + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "imageHandlingDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    v6 = objc_msgSend(v4, "deleteThumbnailsForAvatarRecordsWithIdentifiers:error:", v5, &v18);
    v7 = v18;

    if ((v6 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "logger");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v7, "description");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "logErrorDeletingThumbnailsForIdentifier:error:", v9, v10);

    }
    objc_msgSend(*(id *)(a1 + 32), "stickerBackend");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "deleteRecentStickersWithAvatarIdentifier:stickerIdentifier:completionHandler:", *(_QWORD *)(a1 + 40), 0, 0);

    objc_msgSend(*(id *)(a1 + 32), "imageHandlingDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "environment");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "clearStickersForAvatarRecordIdentifier:withEnvironment:", v13, v14);

    v3 = v24;
  }
  v15 = *(_QWORD *)(a1 + 48);
  if (v15)
  {
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v15 + 16))(v15, *((unsigned __int8 *)v3 + 24), v28[5]);
    v3 = v24;
  }
  if (*((_BYTE *)v3 + 24))
  {
    v16 = *(void **)(a1 + 32);
    v33 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v33, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "postChangeNotificationForRecordWithIdentifiers:remote:", v17, 0);

  }
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);

}

void __62__AVTPAvatarStore_deleteAvatarWithIdentifier_completionBlock___block_invoke_3(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  id obj;

  v3 = a1[4];
  v4 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v4 + 40);
  v5 = objc_msgSend(a2, "deleteAvatarWithIdentifier:error:", v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v5;
}

- (void)duplicateAvatar:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("AVTTypeMismatchException"), CFSTR("Unexpected object class for %@"), v6);
  v8 = v6;
  if ((objc_msgSend(v8, "isEditable") & 1) != 0)
  {
    -[AVTPAvatarStore logger](self, "logger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __51__AVTPAvatarStore_duplicateAvatar_completionBlock___block_invoke;
    v11[3] = &unk_24DD32020;
    v11[4] = self;
    v12 = v8;
    v13 = v7;
    objc_msgSend(v9, "duplicatingRecords:", v11);

  }
  else
  {
    +[AVTError errorWithCode:userInfo:](AVTError, "errorWithCode:userInfo:", 577, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, v10);

  }
}

void __51__AVTPAvatarStore_duplicateAvatar_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __51__AVTPAvatarStore_duplicateAvatar_completionBlock___block_invoke_2;
  v3[3] = &unk_24DD31E40;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v4, "performAsynchronousWork:", v3);

}

void __51__AVTPAvatarStore_duplicateAvatar_completionBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  uint64_t *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  _QWORD v28[5];
  id v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__3;
  v28[4] = __Block_byref_object_dispose__3;
  v29 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__3;
  v26 = __Block_byref_object_dispose__3;
  v27 = 0;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __51__AVTPAvatarStore_duplicateAvatar_completionBlock___block_invoke_3;
  v18[3] = &unk_24DD32910;
  v20 = &v22;
  v2 = *(void **)(a1 + 32);
  v19 = *(id *)(a1 + 40);
  v21 = v28;
  objc_msgSend(v2, "performBackendWork:", v18);
  v3 = v23;
  if (v23[5])
  {
    objc_msgSend(*(id *)(a1 + 32), "imageHandlingDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v23[5];
    v6 = *(_QWORD *)(a1 + 40);
    v17 = 0;
    v7 = objc_msgSend(v4, "generateThumbnailsForDuplicateAvatarRecord:originalRecord:error:", v5, v6, &v17);
    v8 = v17;

    if ((v7 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "logger");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "description");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logErrorDuplicatingThumbnailsForIdentifier:error:", v10, v11);

    }
    v3 = v23;
  }
  v12 = *(_QWORD *)(a1 + 48);
  if (v12)
  {
    (*(void (**)(uint64_t, BOOL))(v12 + 16))(v12, v3[5] != 0);
    v3 = v23;
  }
  v13 = (void *)v3[5];
  if (v13)
  {
    v14 = *(void **)(a1 + 32);
    objc_msgSend(v13, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "postChangeNotificationForRecordWithIdentifiers:remote:", v16, 0);

  }
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(v28, 8);
}

void __51__AVTPAvatarStore_duplicateAvatar_completionBlock___block_invoke_3(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id obj;

  v3 = a1[4];
  v4 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(a2, "duplicateAvatarRecord:error:", v3, &obj);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = *(_QWORD *)(a1[5] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (void)postChangeNotificationForRecordWithIdentifiers:(id)a3 remote:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  AVTPAvatarStore *v13;
  const __CFString *v14;
  _QWORD v15[2];

  v4 = a4;
  v15[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v14 = CFSTR("changedRecordIDs");
    v15[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  -[AVTPAvatarStore logger](self, "logger");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "logPostingChangeNotificationForIdentifiers:", v7);

  -[AVTPAvatarStore environment](self, "environment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "notificationCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v4)
    v13 = 0;
  else
    v13 = self;
  objc_msgSend(v11, "postNotificationName:object:userInfo:", CFSTR("AVTAvatarStoreDidChangeNotification"), v13, v8);

}

+ (unint64_t)maximumNumberOfSavableAvatars
{
  if (AVTUIRestrictMaximumAvatarCount_once())
    return 3;
  else
    return 50;
}

+ (unint64_t)maximumNumberOfFetchableAvatars
{
  return 2 * objc_msgSend(a1, "maximumNumberOfSavableAvatars");
}

- (void)backend:(id)a3 didChangeRecordsWithIdentifiers:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __59__AVTPAvatarStore_backend_didChangeRecordsWithIdentifiers___block_invoke;
  v10[3] = &unk_24DD31FA8;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[AVTPAvatarStore performAsynchronousWork:](self, "performAsynchronousWork:", v10);

}

uint64_t __59__AVTPAvatarStore_backend_didChangeRecordsWithIdentifiers___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  objc_msgSend(*(id *)(a1 + 32), "imageHandlingDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "recordChangeTracker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __59__AVTPAvatarStore_backend_didChangeRecordsWithIdentifiers___block_invoke_2;
  v5[3] = &unk_24DD329D8;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "updateThumbnailsForChangesWithTracker:recordProvider:", v3, v5);

  return objc_msgSend(*(id *)(a1 + 32), "postChangeNotificationForRecordWithIdentifiers:remote:", *(_QWORD *)(a1 + 48), 1);
}

id __59__AVTPAvatarStore_backend_didChangeRecordsWithIdentifiers___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  +[AVTAvatarFetchRequest requestForAvatarWithIdentifier:](AVTAvatarFetchRequest, "requestForAvatarWithIdentifier:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "avatarsForFetchRequest:error:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("AVTTypeMismatchException"), CFSTR("Unexpected object class for %@"), v5);
    v6 = v5;
  }

  return v5;
}

- (void)setStickerBackendDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AVTPAvatarStore stickerBackend](self, "stickerBackend");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStickerBackendDelegate:", v4);

}

- (id)recentStickersForFetchRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[AVTPAvatarStore stickerBackend](self, "stickerBackend");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recentStickersForFetchRequest:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)didUseStickerWithAvatarIdentifier:(id)a3 stickerIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[AVTPAvatarStore stickerBackend](self, "stickerBackend");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "didUseStickerWithAvatarIdentifier:stickerIdentifier:completionHandler:", v10, v9, v8);

}

- (void)deleteRecentStickersWithAvatarIdentifier:(id)a3 stickerIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[AVTPAvatarStore stickerBackend](self, "stickerBackend");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "deleteRecentStickersWithAvatarIdentifier:stickerIdentifier:completionHandler:", v10, v9, v8);

}

- (void)deleteRecentStickersForChangeTracker:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[AVTPAvatarStore stickerBackend](self, "stickerBackend");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deleteRecentStickersForChangeTracker:completionHandler:", v7, v6);

}

- (AVTPBackendImageHandlingDelegate)imageHandlingDelegate
{
  return (AVTPBackendImageHandlingDelegate *)objc_loadWeakRetained((id *)&self->_imageHandlingDelegate);
}

- (void)setImageHandlingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_imageHandlingDelegate, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (OS_dispatch_queue)backendAccessQueue
{
  return self->_backendAccessQueue;
}

- (OS_dispatch_queue)puppetStoreAccessQueue
{
  return self->_puppetStoreAccessQueue;
}

- (AVTCoreEnvironment)environment
{
  return self->_environment;
}

- (AVTStoreBackend)backend
{
  return self->_backend;
}

- (AVTPuppetStore)puppetStore
{
  return self->_puppetStore;
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (AVTStickerBackend)stickerBackend
{
  return self->_stickerBackend;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stickerBackend, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_puppetStore, 0);
  objc_storeStrong((id *)&self->_backend, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_puppetStoreAccessQueue, 0);
  objc_storeStrong((id *)&self->_backendAccessQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_imageHandlingDelegate);
}

@end

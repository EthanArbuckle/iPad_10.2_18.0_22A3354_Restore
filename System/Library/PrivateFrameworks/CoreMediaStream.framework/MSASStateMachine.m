@implementation MSASStateMachine

- (MSASProtocol)protocol
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__4154;
  v11 = __Block_byref_object_dispose__4155;
  v12 = 0;
  -[MSASStateMachine memberQueue](self, "memberQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __28__MSASStateMachine_protocol__block_invoke;
  v6[3] = &unk_1E95BCEF8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (MSASProtocol *)v4;
}

- (MSASPhoneInvitations)phoneInvitations
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__4154;
  v11 = __Block_byref_object_dispose__4155;
  v12 = 0;
  -[MSASStateMachine memberQueue](self, "memberQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__MSASStateMachine_phoneInvitations__block_invoke;
  v6[3] = &unk_1E95BCEF8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (MSASPhoneInvitations *)v4;
}

- (id)_model
{
  return self->_model;
}

- (id)_assetUploader
{
  return self->_assetUploader;
}

- (id)_assetDownloader
{
  return self->_assetDownloader;
}

- (id)_metadataBackoffManager
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__4154;
  v11 = __Block_byref_object_dispose__4155;
  v12 = 0;
  -[MSASStateMachine memberQueue](self, "memberQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__MSASStateMachine__metadataBackoffManager__block_invoke;
  v6[3] = &unk_1E95BCEF8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)memberQueueMetadataBackoffManager
{
  return self->_metadataBackoffManager;
}

- (MSASStateMachine)init
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("MSASStateMachineInitException"), 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise");

  return 0;
}

- (MSASStateMachine)initWithPersonID:(id)a3
{
  return -[MSASStateMachine initWithPersonID:eventQueue:](self, "initWithPersonID:eventQueue:", a3, MEMORY[0x1E0C80D38]);
}

- (MSASStateMachine)initWithPersonID:(id)a3 eventQueue:(id)a4
{
  id v7;
  id v8;
  MSASStateMachine *v9;
  MSASStateMachine *v10;
  MSASPersonModel *v11;
  MSASPersonModel *model;
  void *v13;
  char v14;
  void *v15;
  uint64_t v16;
  MSBackoffManager *metadataBackoffManager;
  MSBackoffManager *v18;
  MSBackoffManager *v19;
  MSBackoffManager *v20;
  uint64_t v21;
  MSBackoffManager *MMCSBackoffManager;
  MSBackoffManager *v23;
  MSBackoffManager *v24;
  MSBackoffManager *v25;
  dispatch_queue_t v26;
  OS_dispatch_queue *workQueue;
  dispatch_queue_t v28;
  OS_dispatch_queue *eventQueue;
  dispatch_queue_t v30;
  OS_dispatch_queue *serverSideConfigQueue;
  dispatch_queue_t v32;
  OS_dispatch_queue *memberQueue;
  MSASAssetUploader *v34;
  MSASAssetUploader *assetUploader;
  MSASAssetDownloader *v36;
  MSASAssetDownloader *assetDownloader;
  void *v38;
  id v39;
  uint64_t v40;
  MSASStateMachine *v41;
  id v42;
  void *v43;
  id v44;
  MSASStateMachine *v45;
  id v46;
  NSObject *v47;
  MSASStateMachine *v48;
  void *v49;
  void *v50;
  MSASStateMachine *v51;
  id v52;
  void *v53;
  void *v54;
  MSASStateMachine *v55;
  id v56;
  uint64_t v57;
  NSString *focusAlbumGUID;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  NSString *focusAssetCollectionGUID;
  uint64_t v63;
  void *v64;
  id v66;
  _QWORD v67[4];
  MSASStateMachine *v68;
  id v69;
  _QWORD v70[4];
  MSASStateMachine *v71;
  id v72;
  _QWORD block[4];
  MSASStateMachine *v74;
  _QWORD v75[4];
  MSASStateMachine *v76;
  id v77;
  _QWORD v78[4];
  MSASStateMachine *v79;
  id v80;
  id location;
  objc_super v82;

  v7 = a3;
  v8 = a4;
  v82.receiver = self;
  v82.super_class = (Class)MSASStateMachine;
  v9 = -[MSASStateMachine init](&v82, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_personID, a3);
    v11 = -[MSASPersonModel initWithPersonID:]([MSASPersonModel alloc], "initWithPersonID:", v7);
    model = v10->_model;
    v10->_model = v11;

    MSASPlatform();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) != 0)
    {
      MSASPlatform();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[MSASPersonModel setShouldDownloadEarliestPhotosFirst:](v10->_model, "setShouldDownloadEarliestPhotosFirst:", objc_msgSend(v15, "shouldDownloadEarliestPhotosFirst"));

    }
    -[MSASModelBase persistentObjectForKey:](v10->_model, "persistentObjectForKey:", CFSTR("metadataBackoffManager"));
    v16 = objc_claimAutoreleasedReturnValue();
    metadataBackoffManager = v10->_metadataBackoffManager;
    v10->_metadataBackoffManager = (MSBackoffManager *)v16;

    v18 = v10->_metadataBackoffManager;
    if (!v18)
    {
      v19 = -[MSBackoffManager initWithInitialInterval:backoffFactor:randomizeFactor:maxBackoffInterval:retryAfterDate:]([MSBackoffManager alloc], "initWithInitialInterval:backoffFactor:randomizeFactor:maxBackoffInterval:retryAfterDate:", 0, 5.0, 2.0, 0.15, 1200.0);
      v20 = v10->_metadataBackoffManager;
      v10->_metadataBackoffManager = v19;

      v18 = v10->_metadataBackoffManager;
    }
    -[MSBackoffManager setDelegate:](v18, "setDelegate:", v10);
    -[MSASModelBase persistentObjectForKey:](v10->_model, "persistentObjectForKey:", CFSTR("MMCSBackoffManager"));
    v21 = objc_claimAutoreleasedReturnValue();
    MMCSBackoffManager = v10->_MMCSBackoffManager;
    v10->_MMCSBackoffManager = (MSBackoffManager *)v21;

    v23 = v10->_MMCSBackoffManager;
    if (!v23)
    {
      v24 = -[MSBackoffManager initWithInitialInterval:backoffFactor:randomizeFactor:maxBackoffInterval:retryAfterDate:]([MSBackoffManager alloc], "initWithInitialInterval:backoffFactor:randomizeFactor:maxBackoffInterval:retryAfterDate:", 0, 5.0, 2.0, 0.15, 1200.0);
      v25 = v10->_MMCSBackoffManager;
      v10->_MMCSBackoffManager = v24;

      v23 = v10->_MMCSBackoffManager;
    }
    -[MSBackoffManager setDelegate:](v23, "setDelegate:", v10);
    v26 = dispatch_queue_create("MSASStateMachine work queue", 0);
    workQueue = v10->_workQueue;
    v10->_workQueue = (OS_dispatch_queue *)v26;

    if (v8)
      v28 = (dispatch_queue_t)v8;
    else
      v28 = dispatch_queue_create("MSASStateMachine event queue", 0);
    eventQueue = v10->_eventQueue;
    v10->_eventQueue = (OS_dispatch_queue *)v28;

    v30 = dispatch_queue_create("MSASStateMachine server side config queue", 0);
    serverSideConfigQueue = v10->_serverSideConfigQueue;
    v10->_serverSideConfigQueue = (OS_dispatch_queue *)v30;

    v32 = dispatch_queue_create("MSASStateMachine member queue", MEMORY[0x1E0C80D50]);
    memberQueue = v10->_memberQueue;
    v10->_memberQueue = (OS_dispatch_queue *)v32;

    v34 = -[MSASAssetTransferer initWithPersonID:]([MSASAssetUploader alloc], "initWithPersonID:", v7);
    assetUploader = v10->_assetUploader;
    v10->_assetUploader = v34;

    -[MSASAssetTransferer setDelegate:](v10->_assetUploader, "setDelegate:", v10);
    -[MSASAssetTransferer setModel:](v10->_assetUploader, "setModel:", v10->_model);
    -[MSASAssetTransferer setBackoffManager:](v10->_assetUploader, "setBackoffManager:", v10->_MMCSBackoffManager);
    v36 = -[MSASAssetTransferer initWithPersonID:]([MSASAssetDownloader alloc], "initWithPersonID:", v7);
    assetDownloader = v10->_assetDownloader;
    v10->_assetDownloader = v36;

    -[MSASAssetTransferer setDelegate:](v10->_assetDownloader, "setDelegate:", v10);
    -[MSASAssetTransferer setModel:](v10->_assetDownloader, "setModel:", v10->_model);
    -[MSASAssetTransferer setBackoffManager:](v10->_assetDownloader, "setBackoffManager:", v10->_MMCSBackoffManager);
    objc_initWeak(&location, v10);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_alloc_init(MEMORY[0x1E0CB3828]);
    v66 = v8;
    v40 = MEMORY[0x1E0C809B0];
    v78[0] = MEMORY[0x1E0C809B0];
    v78[1] = 3221225472;
    v78[2] = __48__MSASStateMachine_initWithPersonID_eventQueue___block_invoke;
    v78[3] = &unk_1E95BB328;
    v41 = v10;
    v79 = v41;
    objc_copyWeak(&v80, &location);
    v42 = (id)objc_msgSend(v38, "addObserverForName:object:queue:usingBlock:", CFSTR("MSASAssetTransfererDidIdle"), 0, v39, v78);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_alloc_init(MEMORY[0x1E0CB3828]);
    v75[0] = v40;
    v75[1] = 3221225472;
    v75[2] = __48__MSASStateMachine_initWithPersonID_eventQueue___block_invoke_3;
    v75[3] = &unk_1E95BB328;
    objc_copyWeak(&v77, &location);
    v45 = v41;
    v76 = v45;
    v46 = (id)objc_msgSend(v43, "addObserverForName:object:queue:usingBlock:", CFSTR("MSASServerSideConfigDidChangeNotification"), 0, v44, v75);

    v47 = v10->_workQueue;
    block[0] = v40;
    block[1] = 3221225472;
    block[2] = __48__MSASStateMachine_initWithPersonID_eventQueue___block_invoke_5;
    block[3] = &unk_1E95BCED0;
    v48 = v45;
    v74 = v48;
    dispatch_sync(v47, block);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v70[0] = v40;
    v70[1] = 3221225472;
    v70[2] = __48__MSASStateMachine_initWithPersonID_eventQueue___block_invoke_6;
    v70[3] = &unk_1E95BB328;
    objc_copyWeak(&v72, &location);
    v51 = v48;
    v71 = v51;
    v52 = (id)objc_msgSend(v49, "addObserverForName:object:queue:usingBlock:", CFSTR("MSASPServerSideConfigurationDidChangeNotification"), 0, v50, v70);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v67[0] = v40;
    v67[1] = 3221225472;
    v67[2] = __48__MSASStateMachine_initWithPersonID_eventQueue___block_invoke_40;
    v67[3] = &unk_1E95BB328;
    objc_copyWeak(&v69, &location);
    v55 = v51;
    v68 = v55;
    v56 = (id)objc_msgSend(v53, "addObserverForName:object:queue:usingBlock:", CFSTR("MSASPDidReceiveRetryAfterNotification"), 0, v54, v67);

    -[MSASStateMachine persistentObjectForKey:](v55, "persistentObjectForKey:", CFSTR("focusAlbumGUID"));
    v57 = objc_claimAutoreleasedReturnValue();
    focusAlbumGUID = v55->_focusAlbumGUID;
    v55->_focusAlbumGUID = (NSString *)v57;

    v59 = (uint64_t)v55->_focusAlbumGUID;
    -[MSASStateMachine _assetDownloader](v55, "_assetDownloader");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setFocusAlbumGUID:", v59);

    -[MSASStateMachine persistentObjectForKey:](v55, "persistentObjectForKey:", CFSTR("focusAssetCollectionGUID"));
    v61 = objc_claimAutoreleasedReturnValue();
    focusAssetCollectionGUID = v55->_focusAssetCollectionGUID;
    v55->_focusAssetCollectionGUID = (NSString *)v61;

    v63 = (uint64_t)v55->_focusAssetCollectionGUID;
    -[MSASStateMachine _assetDownloader](v55, "_assetDownloader");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "setFocusAssetCollectionGUID:", v63);

    objc_destroyWeak(&v69);
    objc_destroyWeak(&v72);

    objc_destroyWeak(&v77);
    objc_destroyWeak(&v80);

    objc_destroyWeak(&location);
    v8 = v66;
  }

  return v10;
}

- (void)workQueueApplyServerSideConfiguration
{
  void *v3;
  void *v4;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL8 v19;
  void *v20;
  MSImageScalingSpecification *v21;
  MSImageScalingSpecification *derivativeImageScalingSpecification;
  void *v23;
  MSImageScalingSpecification *v24;
  MSImageScalingSpecification *thumbnailImageScalingSpecification;
  void *v26;
  void *v27;
  NSArray *v28;
  NSArray *derivativeSpecifications;
  id v30;

  -[MSASStateMachine serverSideConfiguration](self, "serverSideConfiguration");
  v30 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "objectForKey:", CFSTR("com.apple.sharedstreams.config.maxNumRetriesOnFailure.server"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASStateMachine setMaxMetadataRetryCount:](self, "setMaxMetadataRetryCount:", objc_msgSend(v3, "intValue"));

  -[MSASStateMachine _assetUploader](self, "_assetUploader");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "objectForKey:", CFSTR("com.apple.sharedstreams.config.maxUploadAssetBatchSize"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMaxBatchCount:", objc_msgSend(v5, "intValue"));

  -[MSASStateMachine _assetUploader](self, "_assetUploader");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "objectForKey:", CFSTR("com.apple.sharedstreams.config.maxNumRetriesOnFailure.content"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMaxRetryCount:", objc_msgSend(v7, "intValue"));

  -[MSASStateMachine _assetUploader](self, "_assetUploader");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "objectForKey:", CFSTR("com.apple.sharedstreams.config.maxMMCSTokenValidity"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  objc_msgSend(v8, "setMaxMMCSTokenValidityTimeInterval:");

  -[MSASStateMachine _assetDownloader](self, "_assetDownloader");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "objectForKey:", CFSTR("mme.sharedstreams.client.downloadMMCSBatchSize"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMaxBatchCount:", objc_msgSend(v11, "intValue"));

  -[MSASStateMachine _assetDownloader](self, "_assetDownloader");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "objectForKey:", CFSTR("com.apple.sharedstreams.config.maxNumRetriesOnFailure.content"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setMaxRetryCount:", objc_msgSend(v13, "intValue"));

  -[MSASStateMachine _assetDownloader](self, "_assetDownloader");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "objectForKey:", CFSTR("com.apple.sharedstreams.config.maxMMCSTokenValidity"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "doubleValue");
  objc_msgSend(v14, "setMaxMMCSTokenValidityTimeInterval:");

  MSASPlatform();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v30, "objectForKey:", CFSTR("com.apple.sharedstreams.config.switch.3G"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    v19 = v17 && !objc_msgSend(v17, "BOOLValue");
    objc_msgSend(v16, "setSuppressCellular:", v19);

  }
  objc_msgSend(v30, "objectForKey:", CFSTR("com.apple.sharedstreams.config.dimensions.preview"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[MSImageScalingSpecification specificationWithSharedAlbumSpecificationString:](MSImageScalingSpecification, "specificationWithSharedAlbumSpecificationString:", v20);
  v21 = (MSImageScalingSpecification *)objc_claimAutoreleasedReturnValue();
  derivativeImageScalingSpecification = self->_derivativeImageScalingSpecification;
  self->_derivativeImageScalingSpecification = v21;

  -[MSImageScalingSpecification setAssetTypeFlags:](self->_derivativeImageScalingSpecification, "setAssetTypeFlags:", 2);
  objc_msgSend(v30, "objectForKey:", CFSTR("com.apple.sharedstreams.config.dimensions.thumbnail"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[MSImageScalingSpecification specificationWithSharedAlbumSpecificationString:](MSImageScalingSpecification, "specificationWithSharedAlbumSpecificationString:", v23);
  v24 = (MSImageScalingSpecification *)objc_claimAutoreleasedReturnValue();
  thumbnailImageScalingSpecification = self->_thumbnailImageScalingSpecification;
  self->_thumbnailImageScalingSpecification = v24;

  -[MSImageScalingSpecification setAssetTypeFlags:](self->_thumbnailImageScalingSpecification, "setAssetTypeFlags:", 1);
  objc_msgSend(v30, "objectForKey:", CFSTR("com.apple.sharedstreams.config.videoderivatives"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[MSVideoDerivativeSpecification videoDerivativeSpecificationsWithDictionaryArray:](MSVideoDerivativeSpecification, "videoDerivativeSpecificationsWithDictionaryArray:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (NSArray *)objc_msgSend(v27, "mutableCopy");

  -[NSArray addObject:](v28, "addObject:", self->_derivativeImageScalingSpecification);
  -[NSArray addObject:](v28, "addObject:", self->_thumbnailImageScalingSpecification);
  derivativeSpecifications = self->_derivativeSpecifications;
  self->_derivativeSpecifications = v28;

}

- (void)start
{
  NSObject *v3;
  _QWORD block[5];

  -[MSASStateMachine eventQueue](self, "eventQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__MSASStateMachine_start__block_invoke;
  block[3] = &unk_1E95BCED0;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_workQueueEmptyFileTransferQueuesCompletionBlock:(id)a3
{
  void *v4;
  int v5;
  MSASPersonModel *model;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[MSASStateMachine _model](self, "_model");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "itemsForDownloadCountFocusAlbumGUID:focusAssetCollectionGUID:", 0, 0);

  model = self->_model;
  self->_model = 0;

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSASStateMachine personID](self, "personID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    MSPathAlbumSharingSubscribeMMCSLibraryForPersonID(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeItemAtPath:error:", v9, 0);

  }
  v10 = v11;
  if (v11)
  {
    (*((void (**)(id))v11 + 2))(v11);
    v10 = v11;
  }

}

- (void)shutDownCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[MSASStateMachine workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__MSASStateMachine_shutDownCompletionBlock___block_invoke;
  v7[3] = &unk_1E95BCF98;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)purgeEverythingCompletionBlock:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MSASStateMachine _model](self, "_model");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "purgeCompletionBlock:", v4);

}

- (void)stopAssetDownloadsCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[MSASStateMachine workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__MSASStateMachine_stopAssetDownloadsCompletionBlock___block_invoke;
  v7[3] = &unk_1E95BCF98;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)cancelCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[MSASStateMachine workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__MSASStateMachine_cancelCompletionBlock___block_invoke;
  v7[3] = &unk_1E95BCF98;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)workQueueCancelAllCommandsFilteredByAlbumGUID:(id)a3 assetCollectionGUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  SEL v15;
  const char *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  int v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  uint8_t buf[4];
  MSASStateMachine *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v29 = self;
    v30 = 2114;
    v31 = v6;
    v32 = 2114;
    v33 = v7;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Cancelling all commands. Filter album GUID: %{public}@, filter asset collection GUID %{public}@", buf, 0x20u);
  }
  v27 = 0;
  -[MSASStateMachine _model](self, "_model");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  v26 = 0;
  v24 = 0;
  objc_msgSend(v8, "commandAtHeadOfQueueOutParams:outCommandIdentifier:outPersonID:outAlbumGUID:outAssetCollectionGUID:", &v26, &v27, 0, &v25, &v24);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v26;
  v10 = v25;
  v11 = v24;

  if (v9)
  {
    v21 = 0;
    v12 = v11;
    v13 = v10;
    while (!v6 || v13 && objc_msgSend(v6, "isEqualToString:", v13))
    {
      if (!v7)
        goto LABEL_14;
      v14 = 0;
      if (v12)
        goto LABEL_13;
LABEL_18:
      -[MSASStateMachine _model](self, "_model", v20);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v12;
      v23 = v13;
      objc_msgSend(v18, "commandWithMinimumIdentifier:outParams:outCommandIdentifier:outPersonID:outAlbumGUID:outAssetCollectionGUID:", v27 + 1, 0, &v27, 0, &v23, &v22);
      v19 = objc_claimAutoreleasedReturnValue();
      v10 = v23;

      v11 = v22;
      v9 = (void *)v19;
      v12 = v11;
      v13 = v10;
      if (!v19)
        goto LABEL_21;
    }
    if (!v7)
      goto LABEL_18;
    v14 = 1;
    if (!v12)
      goto LABEL_18;
LABEL_13:
    if (((v14 | objc_msgSend(v7, "isEqualToString:", v12, v20) ^ 1) & 1) == 0)
    {
LABEL_14:
      v15 = NSSelectorFromString((NSString *)v9);
      if (v15)
      {
        v16 = v15;
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(self, v16, 2, v20);
      }
      -[MSASStateMachine _model](self, "_model", v20);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "removeCommandIdentifier:", v27);

      ++v21;
      goto LABEL_18;
    }
    goto LABEL_18;
  }
  v21 = 0;
LABEL_21:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v29 = self;
    v30 = 1024;
    LODWORD(v31) = v21;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Cancelled %d commands.", buf, 0x12u);
  }

}

- (void)workQueueCancelCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  NSObject *v8;
  uint64_t v9;
  MSASAssetUploader *assetUploader;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD block[5];
  uint8_t buf[4];
  MSASStateMachine *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_commandState == 2)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v16 = self;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Canceling current operation.", buf, 0xCu);
    }
    -[MSASStateMachine _stopHandlerBlock](self, "_stopHandlerBlock");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[MSASStateMachine _stopHandlerBlock](self, "_stopHandlerBlock");
      v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      -[MSASStateMachine _canceledError](self, "_canceledError");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v6)[2](v6, v7);

    }
  }
  -[MSASStateMachine eventQueue](self, "eventQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__MSASStateMachine_workQueueCancelCompletionBlock___block_invoke;
  block[3] = &unk_1E95BCED0;
  block[4] = self;
  dispatch_async(v8, block);

  -[MSASStateMachine workQueueCancelAllCommandsFilteredByAlbumGUID:assetCollectionGUID:](self, "workQueueCancelAllCommandsFilteredByAlbumGUID:assetCollectionGUID:", 0, 0);
  assetUploader = self->_assetUploader;
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __51__MSASStateMachine_workQueueCancelCompletionBlock___block_invoke_2;
  v12[3] = &unk_1E95BCF98;
  v12[4] = self;
  v13 = v4;
  v11 = v4;
  -[MSASAssetTransferer cancelCompletionBlock:](assetUploader, "cancelCompletionBlock:", v12);

}

- (void)setDaemon:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[MSASStateMachine workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __30__MSASStateMachine_setDaemon___block_invoke;
  v7[3] = &unk_1E95BCFC0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)setPendingRootCtag:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  MSASStateMachine *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MSASStateMachine persistentObjectForKey:](self, "persistentObjectForKey:", CFSTR("rootCtagRetries"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  if (v6)
  {
    -[MSASStateMachine persistentObjectForKey:](self, "persistentObjectForKey:", CFSTR("pendingRootCtag"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isEqualToString:", v7) & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v9 = 138543874;
        v10 = self;
        v11 = 2114;
        v12 = v4;
        v13 = 2114;
        v14 = v7;
        _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Setting a new pending root ctag %{public}@ that is different from existing pending root ctag %{public}@.", (uint8_t *)&v9, 0x20u);
      }
      -[MSASStateMachine setPersistentObject:forKey:](self, "setPersistentObject:forKey:", v4, CFSTR("pendingRootCtag"));
      v6 = 0;
    }

  }
  else
  {
    -[MSASStateMachine setPersistentObject:forKey:](self, "setPersistentObject:forKey:", v4, CFSTR("pendingRootCtag"));
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6 + 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASStateMachine setPersistentObject:forKey:](self, "setPersistentObject:forKey:", v8, CFSTR("rootCtagRetries"));

}

- (void)setRootCtagFromPendingRootCtag
{
  NSObject *v3;
  _QWORD block[5];

  -[MSASStateMachine workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__MSASStateMachine_setRootCtagFromPendingRootCtag__block_invoke;
  block[3] = &unk_1E95BCED0;
  block[4] = self;
  dispatch_async(v3, block);

}

- (id)rootCtagToCheckForChanges
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  int v9;
  MSASStateMachine *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[MSASStateMachine _model](self, "_model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "persistentStringForKey:", CFSTR("rootCtag"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[MSASStateMachine persistentObjectForKey:](self, "persistentObjectForKey:", CFSTR("rootCtagRetries"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  if (v6 < 6)
  {
    v7 = v4;
  }
  else
  {
    -[MSASStateMachine persistentObjectForKey:](self, "persistentObjectForKey:", CFSTR("pendingRootCtag"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v9 = 138544130;
      v10 = self;
      v11 = 2048;
      v12 = 5;
      v13 = 2114;
      v14 = v4;
      v15 = 2114;
      v16 = v7;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Retried %lu times for root ctag %{public}@. Replacing with pending root ctag %{public}@.", (uint8_t *)&v9, 0x2Au);
    }
    -[MSASStateMachine setRootCtagFromPendingRootCtag](self, "setRootCtagFromPendingRootCtag");

  }
  return v7;
}

- (void)setFocusAlbumGUID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[MSASStateMachine workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__MSASStateMachine_setFocusAlbumGUID___block_invoke;
  v7[3] = &unk_1E95BCFC0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)setFocusAssetCollectionGUID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[MSASStateMachine workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__MSASStateMachine_setFocusAssetCollectionGUID___block_invoke;
  v7[3] = &unk_1E95BCFC0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)cancelOutstandingCommandsForAlbumWithGUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[MSASStateMachine _model](self, "_model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel__cancelOutstandingCommandsDisposition_params_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v4, CFSTR("albumGUID"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "enqueueCommandAtHeadOfQueue:params:personID:albumGUID:assetCollectionGUID:", v6, v7, 0, 0, 0);
  -[MSASStateMachine retryOutstandingActivities](self, "retryOutstandingActivities");
}

- (void)cancelOutstandingCommandsForAssetCollectionWithGUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[MSASStateMachine _model](self, "_model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel__cancelOutstandingCommandsDisposition_params_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v4, CFSTR("assetCollectionGUID"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "enqueueCommandAtHeadOfQueue:params:personID:albumGUID:assetCollectionGUID:", v6, v7, 0, 0, 0);
  -[MSASStateMachine retryOutstandingActivities](self, "retryOutstandingActivities");
}

- (void)_cancelOutstandingCommandsDisposition:(int)a3 params:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  int v15;
  uint8_t buf[4];
  MSASStateMachine *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(v6, "objectForKey:", CFSTR("albumGUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("assetCollectionGUID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v17 = self;
    v18 = 2114;
    v19 = v7;
    v20 = 2114;
    v21 = v8;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Canceling outstanding operations for album GUID %{public}@, asset collection GUID %{public}@.", buf, 0x20u);
  }
  -[MSASStateMachine _assetUploader](self, "_assetUploader");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65__MSASStateMachine__cancelOutstandingCommandsDisposition_params___block_invoke;
  v12[3] = &unk_1E95BC488;
  v12[4] = self;
  v13 = v7;
  v14 = v8;
  v15 = a3;
  v10 = v8;
  v11 = v7;
  objc_msgSend(v9, "stopCompletionBlock:", v12);

}

- (id)_serverSideConfigDictionaryByApplyingDefaultsToDictionary:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = _serverSideConfigDictionaryByApplyingDefaultsToDictionary__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_serverSideConfigDictionaryByApplyingDefaultsToDictionary__onceToken, &__block_literal_global_4243);
  v5 = (void *)objc_msgSend((id)_serverSideConfigDictionaryByApplyingDefaultsToDictionary__defaults, "mutableCopy");
  objc_msgSend(v5, "addEntriesFromDictionary:", v4);

  return v5;
}

- (NSDictionary)serverSideConfiguration
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__4154;
  v11 = __Block_byref_object_dispose__4155;
  v12 = 0;
  -[MSASStateMachine serverSideConfigQueue](self, "serverSideConfigQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__MSASStateMachine_serverSideConfiguration__block_invoke;
  v6[3] = &unk_1E95BCEF8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

- (NSString)serverSideConfigurationVersion
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__4154;
  v11 = __Block_byref_object_dispose__4155;
  v12 = 0;
  -[MSASStateMachine serverSideConfigQueue](self, "serverSideConfigQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__MSASStateMachine_serverSideConfigurationVersion__block_invoke;
  v6[3] = &unk_1E95BCEF8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

- (id)serverSideQueueServerSideConfiguration
{
  NSDictionary *serverSideConfiguration;
  void *v4;
  void *v5;
  NSString *serverSideConfigurationVersion;
  NSDictionary *v7;
  NSDictionary *v8;
  void *v9;
  NSString *v10;
  NSString *v11;
  NSDictionary *v13;
  int v14;
  MSASStateMachine *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  NSDictionary *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  serverSideConfiguration = self->_serverSideConfiguration;
  if (!serverSideConfiguration)
  {
    -[MSASStateMachine _model](self, "_model");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "persistentObjectForKey:", CFSTR("serverSideConfig"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      serverSideConfigurationVersion = self->_serverSideConfigurationVersion;
      self->_serverSideConfigurationVersion = 0;

    }
    -[MSASStateMachine _serverSideConfigDictionaryByApplyingDefaultsToDictionary:](self, "_serverSideConfigDictionaryByApplyingDefaultsToDictionary:", v5);
    v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v8 = self->_serverSideConfiguration;
    self->_serverSideConfiguration = v7;

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      v13 = self->_serverSideConfiguration;
      v14 = 138543874;
      v15 = self;
      v16 = 2114;
      v17 = v5;
      v18 = 2114;
      v19 = v13;
      _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Reading persisted server-side config from disk.\nRaw config: %{public}@\nAfter applying defaults: %{public}@", (uint8_t *)&v14, 0x20u);
    }
    -[MSASStateMachine _model](self, "_model");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "persistentStringForKey:", CFSTR("serverSideConfigVersion"));
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    v11 = self->_serverSideConfigurationVersion;
    self->_serverSideConfigurationVersion = v10;

    serverSideConfiguration = self->_serverSideConfiguration;
  }
  return serverSideConfiguration;
}

- (void)setServerSideConfiguration:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[MSASStateMachine serverSideConfigQueue](self, "serverSideConfigQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__MSASStateMachine_setServerSideConfiguration___block_invoke;
  v7[3] = &unk_1E95BCFC0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)serverSideQueueSetServerSideConfiguration:(id)a3
{
  id v4;
  NSDictionary *v5;
  NSDictionary *serverSideConfiguration;
  NSDictionary *v7;
  void *v8;
  NSObject *v9;
  _QWORD block[5];
  uint8_t buf[4];
  MSASStateMachine *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  NSDictionary *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MSASStateMachine _serverSideConfigDictionaryByApplyingDefaultsToDictionary:](self, "_serverSideConfigDictionaryByApplyingDefaultsToDictionary:", v4);
  v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  serverSideConfiguration = self->_serverSideConfiguration;
  self->_serverSideConfiguration = v5;

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v7 = self->_serverSideConfiguration;
    *(_DWORD *)buf = 138543874;
    v12 = self;
    v13 = 2114;
    v14 = v4;
    v15 = 2114;
    v16 = v7;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Setting server-side configuration.\nOriginal server config: %{public}@\nAfter applying defaults: %{public}@", buf, 0x20u);
  }
  -[MSASStateMachine _model](self, "_model");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPersistentObject:forKey:", v4, CFSTR("serverSideConfig"));

  -[MSASStateMachine eventQueue](self, "eventQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__MSASStateMachine_serverSideQueueSetServerSideConfiguration___block_invoke;
  block[3] = &unk_1E95BCED0;
  block[4] = self;
  dispatch_async(v9, block);

}

- (void)refreshServerSideConfig
{
  NSObject *v3;
  _QWORD block[5];

  -[MSASStateMachine workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__MSASStateMachine_refreshServerSideConfig__block_invoke;
  block[3] = &unk_1E95BCED0;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)workQueueRefreshServerSideConfig
{
  void *v3;
  void *v4;
  id v5;

  -[MSASStateMachine _model](self, "_model");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel__sendGetServerSideConfigurationDisposition_params_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASStateMachine personID](self, "personID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enqueueCommand:params:personID:albumGUID:assetCollectionGUID:", v3, 0, v4, 0, 0);

}

- (void)_sendGetServerSideConfigurationDisposition:(int)a3 params:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v7;
  _QWORD v8[9];

  if (!a3)
  {
    v8[7] = v4;
    v8[8] = v5;
    -[MSASStateMachine protocol](self, "protocol", *(_QWORD *)&a3, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __70__MSASStateMachine__sendGetServerSideConfigurationDisposition_params___block_invoke;
    v8[3] = &unk_1E95BB430;
    v8[4] = self;
    objc_msgSend(v7, "getServerSideConfigCompletionBlock:", v8);

  }
}

- (id)latestNextActivityDate
{
  NSObject *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[7];
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
  v21 = __Block_byref_object_copy__4154;
  v22 = __Block_byref_object_dispose__4155;
  v23 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__4154;
  v16 = __Block_byref_object_dispose__4155;
  v17 = 0;
  -[MSASStateMachine memberQueue](self, "memberQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__MSASStateMachine_latestNextActivityDate__block_invoke;
  block[3] = &unk_1E95BB458;
  block[4] = self;
  block[5] = &v18;
  block[6] = &v12;
  dispatch_sync(v3, block);

  if (-[MSASPersonModel countOfEnqueuedCommands](self->_model, "countOfEnqueuedCommands") < 1)
    v4 = 0;
  else
    v4 = (void *)v19[5];
  v5 = v4;
  if (-[MSASPersonModel assetsInDownloadQueue](self->_model, "assetsInDownloadQueue")
    || -[MSASPersonModel assetCollectionsInUploadQueue](self->_model, "assetCollectionsInUploadQueue"))
  {
    v6 = (id)v13[5];
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v5;
    v8 = v7;
    if (!v6 || v7)
    {
      if (v6 && v7 && objc_msgSend(v6, "compare:", v7) == 1)
      {
        v6 = v6;

        v8 = v6;
      }
    }
    else
    {
      v6 = v6;
      v8 = v6;
    }
  }
  else
  {
    v8 = v5;
    v6 = 0;
  }
  v9 = v8;

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);

  return v9;
}

- (id)serverCommunicationBackoffDate
{
  NSObject *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__4154;
  v21 = __Block_byref_object_dispose__4155;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__4154;
  v15 = __Block_byref_object_dispose__4155;
  v16 = 0;
  -[MSASStateMachine memberQueue](self, "memberQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__MSASStateMachine_serverCommunicationBackoffDate__block_invoke;
  block[3] = &unk_1E95BB458;
  block[4] = self;
  block[5] = &v17;
  block[6] = &v11;
  dispatch_sync(v3, block);

  v4 = (id)v18[5];
  v5 = (void *)v12[5];
  if (v5)
  {
    if (!v4)
    {
LABEL_5:
      v7 = v5;

      v4 = v7;
      goto LABEL_6;
    }
    objc_msgSend(v5, "earlierDate:", v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 == v4)
    {
      v5 = (void *)v12[5];
      goto LABEL_5;
    }
  }
LABEL_6:
  v8 = v4;
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

- (void)workQueueUpdateNextActivityDate
{
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD v6[5];
  id v7;
  uint8_t buf[4];
  MSASStateMachine *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[MSASStateMachine latestNextActivityDate](self, "latestNextActivityDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543618;
    v9 = self;
    v10 = 2114;
    v11 = v3;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Computed next activity date: %{public}@", buf, 0x16u);
  }
  -[MSASStateMachine eventQueue](self, "eventQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__MSASStateMachine_workQueueUpdateNextActivityDate__block_invoke;
  v6[3] = &unk_1E95BCFC0;
  v6[4] = self;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

}

- (void)MSBackoffManagerDidUpdateNextExpiryDate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[MSASStateMachine workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__MSASStateMachine_MSBackoffManagerDidUpdateNextExpiryDate___block_invoke;
  v7[3] = &unk_1E95BCFC0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (id)persistentObjectForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MSASStateMachine _model](self, "_model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "persistentObjectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setPersistentObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[MSASStateMachine workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__MSASStateMachine_setPersistentObject_forKey___block_invoke;
  block[3] = &unk_1E95BCE30;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (BOOL)isInRetryState
{
  MSASStateMachine *v2;
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
  -[MSASStateMachine memberQueue](self, "memberQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__MSASStateMachine_isInRetryState__block_invoke;
  v5[3] = &unk_1E95BCEF8;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (BOOL)hasEnqueuedActivities
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[MSASStateMachine _model](self, "_model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "countOfEnqueuedCommands") <= 0)
  {
    -[MSASStateMachine _model](self, "_model");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((int)objc_msgSend(v5, "assetCollectionsInUploadQueue") <= 0)
    {
      -[MSASStateMachine _model](self, "_model");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v6, "hasItemsForDownloadCountFocusAlbumGUID:focusAssetCollectionGUID:", 0, 0);

    }
    else
    {
      v4 = 1;
    }

  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)retryOutstandingActivities
{
  NSObject *v3;
  _QWORD block[5];

  -[MSASStateMachine workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__MSASStateMachine_retryOutstandingActivities__block_invoke;
  block[3] = &unk_1E95BCED0;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)workQueueRetryOutstandingActivities
{
  int v3;
  MSASStateMachine *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (!-[MSASStateMachine isRetryingOutstandingActivities](self, "isRetryingOutstandingActivities"))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      v3 = 138543362;
      v4 = self;
      _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Retrying outstanding activities.", (uint8_t *)&v3, 0xCu);
    }
    -[MSASStateMachine setIsRetryingOutstandingActivities:](self, "setIsRetryingOutstandingActivities:", 1);
    -[MSASStateMachine workQueueCheckForNextCommand](self, "workQueueCheckForNextCommand");
    -[MSASAssetTransferer retryOutstandingActivities](self->_assetUploader, "retryOutstandingActivities");
    -[MSASAssetTransferer retryOutstandingActivities](self->_assetDownloader, "retryOutstandingActivities");
    -[MSASStateMachine setIsRetryingOutstandingActivities:](self, "setIsRetryingOutstandingActivities:", 0);
  }
}

- (void)workQueueCheckForNextCommand
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  uint32_t v10;
  void *v11;
  int v12;
  NSObject *v13;
  _QWORD v14[5];
  _QWORD block[6];
  uint8_t v16[4];
  MSASStateMachine *v17;
  __int16 v18;
  uint64_t v19;
  __int128 buf;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (self->_commandState <= 1u)
  {
    if (-[MSASStateMachine hasShutDown](self, "hasShutDown"))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = self;
        _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Not checking for any commands because we're shutting down.", (uint8_t *)&buf, 0xCu);
      }
      return;
    }
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__4154;
    v23 = __Block_byref_object_dispose__4155;
    v24 = 0;
    -[MSASStateMachine memberQueue](self, "memberQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__MSASStateMachine_workQueueCheckForNextCommand__block_invoke;
    block[3] = &unk_1E95BCEF8;
    block[4] = self;
    block[5] = &buf;
    dispatch_sync(v3, block);

    v5 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v5) = objc_msgSend(v5, "compare:", v6) == 1;

    if ((_DWORD)v5)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v7 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
        *(_DWORD *)v16 = 138543618;
        v17 = self;
        v18 = 2114;
        v19 = v7;
        v8 = MEMORY[0x1E0C81028];
        v9 = "%{public}@: Holding off until %{public}@ before performing next command.";
        v10 = 22;
LABEL_12:
        _os_log_impl(&dword_1D3E94000, v8, OS_LOG_TYPE_DEFAULT, v9, v16, v10);
      }
    }
    else
    {
      MSASPlatform();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "MSASIsAllowedToTransferMetadata");

      if ((v12 & 1) != 0)
      {
        -[MSASStateMachine eventQueue](self, "eventQueue");
        v13 = objc_claimAutoreleasedReturnValue();
        v14[0] = v4;
        v14[1] = 3221225472;
        v14[2] = __48__MSASStateMachine_workQueueCheckForNextCommand__block_invoke_69;
        v14[3] = &unk_1E95BCED0;
        v14[4] = self;
        dispatch_async(v13, v14);

        self->_commandState = 2;
        -[MSASStateMachine workQueuePerformNextCommand](self, "workQueuePerformNextCommand");
      }
      else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v16 = 138543362;
        v17 = self;
        v8 = MEMORY[0x1E0C81028];
        v9 = "%{public}@: Not allowed to transfer metadata at this time. Try again later.";
        v10 = 12;
        goto LABEL_12;
      }
    }
    _Block_object_dispose(&buf, 8);

  }
}

- (void)workQueuePerformNextCommand
{
  NSObject *v3;
  MSASPersonModel *model;
  void *v5;
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  _QWORD *v17;
  NSObject *v18;
  NSDictionary *currentCommandParams;
  NSString *currentCommand;
  void *v21;
  char v22;
  SEL v23;
  const char *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  _QWORD v32[5];
  _QWORD v33[5];
  _QWORD v34[5];
  _QWORD v35[5];
  _QWORD v36[5];
  id v37;
  id v38;
  _QWORD block[5];
  uint8_t buf[4];
  MSASStateMachine *v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if (!-[MSASStateMachine hasShutDown](self, "hasShutDown"))
  {
    model = self->_model;
    v37 = 0;
    v38 = 0;
    -[MSASPersonModel commandAtHeadOfQueueOutParams:outCommandIdentifier:outPersonID:outAlbumGUID:outAssetCollectionGUID:](model, "commandAtHeadOfQueueOutParams:outCommandIdentifier:outPersonID:outAlbumGUID:outAssetCollectionGUID:", &v38, &self->_currentCommandID, &v37, 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v38;
    v3 = v38;
    v7 = v37;
    objc_storeStrong((id *)&self->_currentCommand, v5);
    objc_storeStrong((id *)&self->_currentCommandParams, v6);
    if (!v5)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v41 = self;
        _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: No more commands to perform.", buf, 0xCu);
      }
      -[MSASStateMachine eventQueue](self, "eventQueue");
      v18 = objc_claimAutoreleasedReturnValue();
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __47__MSASStateMachine_workQueuePerformNextCommand__block_invoke_70;
      v36[3] = &unk_1E95BCED0;
      v36[4] = self;
      dispatch_async(v18, v36);

      currentCommandParams = self->_currentCommandParams;
      self->_currentCommandParams = 0;

      currentCommand = self->_currentCommand;
      self->_currentCommand = 0;

      self->_commandState = 0;
      goto LABEL_23;
    }
    if (v7)
    {
      MSASPlatform();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_opt_respondsToSelector();

      MSASPlatform();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if ((v9 & 1) != 0)
      {
        v12 = objc_msgSend(v10, "personIDEnabledForAlbumSharing:", v7);

        if ((v12 & 1) == 0)
        {
LABEL_9:
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v41 = self;
            v42 = 2114;
            v43 = v7;
            _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Retrieved command for personID %{public}@, but Shared Photo Stream has been disabled. Skipping.", buf, 0x16u);
          }
          -[MSASPersonModel removeCommandIdentifier:](self->_model, "removeCommandIdentifier:", self->_currentCommandID);
          self->_commandState = 1;
          -[MSASStateMachine eventQueue](self, "eventQueue");
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = MEMORY[0x1E0C809B0];
          v35[0] = MEMORY[0x1E0C809B0];
          v35[1] = 3221225472;
          v35[2] = __47__MSASStateMachine_workQueuePerformNextCommand__block_invoke_73;
          v35[3] = &unk_1E95BCED0;
          v35[4] = self;
          dispatch_async(v13, v35);

          -[MSASStateMachine workQueueUpdateNextActivityDate](self, "workQueueUpdateNextActivityDate");
          -[MSASStateMachine workQueue](self, "workQueue");
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = v15;
          v34[0] = v14;
          v34[1] = 3221225472;
          v34[2] = __47__MSASStateMachine_workQueuePerformNextCommand__block_invoke_2;
          v34[3] = &unk_1E95BCED0;
          v34[4] = self;
          v17 = v34;
          goto LABEL_22;
        }
      }
      else
      {
        objc_msgSend(v10, "personIDsEnabledForAlbumSharing");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "containsObject:", v7);

        if ((v22 & 1) == 0)
          goto LABEL_9;
      }
    }
    v23 = NSSelectorFromString((NSString *)v5);
    if (v23)
    {
      v24 = v23;
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[NSDictionary objectForKey:](self->_currentCommandParams, "objectForKey:", CFSTR("commandRetryCount"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "intValue");

        v27 = (v26 + 1);
        v28 = (void *)-[NSDictionary mutableCopy](self->_currentCommandParams, "mutableCopy");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v27);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setObject:forKey:", v29, CFSTR("commandRetryCount"));

        -[MSASPersonModel setParams:forCommandWithIdentifier:](self->_model, "setParams:forCommandWithIdentifier:", v28, self->_currentCommandID);
        objc_msgSend(self, v24, 0, v28);

LABEL_23:
        goto LABEL_24;
      }
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v41 = self;
      v42 = 2114;
      v43 = v5;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Unknown command: %{public}@. Skipping.", buf, 0x16u);
    }
    -[MSASPersonModel removeCommandIdentifier:](self->_model, "removeCommandIdentifier:", self->_currentCommandID);
    self->_commandState = 1;
    -[MSASStateMachine eventQueue](self, "eventQueue");
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = MEMORY[0x1E0C809B0];
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __47__MSASStateMachine_workQueuePerformNextCommand__block_invoke_74;
    v33[3] = &unk_1E95BCED0;
    v33[4] = self;
    dispatch_async(v30, v33);

    -[MSASStateMachine workQueueUpdateNextActivityDate](self, "workQueueUpdateNextActivityDate");
    -[MSASStateMachine workQueue](self, "workQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v32[0] = v31;
    v32[1] = 3221225472;
    v32[2] = __47__MSASStateMachine_workQueuePerformNextCommand__block_invoke_2_75;
    v32[3] = &unk_1E95BCED0;
    v32[4] = self;
    v17 = v32;
LABEL_22:
    dispatch_async(v15, v17);

    goto LABEL_23;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v41 = self;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Not performing any more commands because we're shutting down.", buf, 0xCu);
  }
  -[MSASStateMachine eventQueue](self, "eventQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__MSASStateMachine_workQueuePerformNextCommand__block_invoke;
  block[3] = &unk_1E95BCED0;
  block[4] = self;
  dispatch_async(v3, block);
LABEL_24:

}

- (void)workQueueDidFinishCommand
{
  NSObject *v3;
  uint64_t v4;
  NSDictionary *currentCommandParams;
  NSString *currentCommand;
  id stopHandlerBlock;
  NSObject *v8;
  _QWORD v9[5];
  _QWORD block[5];

  if (self->_commandState != 2)
    __assert_rtn("-[MSASStateMachine workQueueDidFinishCommand]", "MSASStateMachine.m", 1055, "_commandState == kMSASCommandStatePerformingCommand");
  self->_commandState = 1;
  -[MSASStateMachine eventQueue](self, "eventQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__MSASStateMachine_workQueueDidFinishCommand__block_invoke;
  block[3] = &unk_1E95BCED0;
  block[4] = self;
  dispatch_async(v3, block);

  -[MSASPersonModel removeCommandIdentifier:](self->_model, "removeCommandIdentifier:", self->_currentCommandID);
  currentCommandParams = self->_currentCommandParams;
  self->_currentCommandParams = 0;

  currentCommand = self->_currentCommand;
  self->_currentCommand = 0;

  stopHandlerBlock = self->_stopHandlerBlock;
  self->_stopHandlerBlock = 0;

  -[MSASStateMachine workQueueUpdateNextActivityDate](self, "workQueueUpdateNextActivityDate");
  -[MSASStateMachine workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __45__MSASStateMachine_workQueueDidFinishCommand__block_invoke_2;
  v9[3] = &unk_1E95BCED0;
  v9[4] = self;
  dispatch_async(v8, v9);

}

- (void)workQueueDidFinishCommandByReplacingCurrentCommandWithCommand:(id)a3 params:(id)a4 personID:(id)a5 albumGUID:(id)a6 assetCollectionGUID:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  NSDictionary *currentCommandParams;
  NSString *currentCommand;
  id stopHandlerBlock;
  NSObject *v27;
  NSObject *v28;
  _QWORD v29[5];
  _QWORD v30[5];
  _QWORD block[5];
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  uint8_t buf[4];
  MSASStateMachine *v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543618;
    v38 = self;
    v39 = 2114;
    v40 = v12;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Command will be replaced by command: %{public}@", buf, 0x16u);
  }
  -[MSASModelBase dbQueue](self->_model, "dbQueue");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __128__MSASStateMachine_workQueueDidFinishCommandByReplacingCurrentCommandWithCommand_params_personID_albumGUID_assetCollectionGUID___block_invoke;
  block[3] = &unk_1E95BC758;
  block[4] = self;
  v32 = v12;
  v33 = v13;
  v34 = v14;
  v35 = v15;
  v36 = v16;
  v19 = v16;
  v20 = v15;
  v21 = v14;
  v22 = v13;
  v23 = v12;
  dispatch_barrier_sync(v17, block);

  self->_commandState = 1;
  currentCommandParams = self->_currentCommandParams;
  self->_currentCommandParams = 0;

  currentCommand = self->_currentCommand;
  self->_currentCommand = 0;

  stopHandlerBlock = self->_stopHandlerBlock;
  self->_stopHandlerBlock = 0;

  -[MSASStateMachine workQueueUpdateNextActivityDate](self, "workQueueUpdateNextActivityDate");
  -[MSASStateMachine eventQueue](self, "eventQueue");
  v27 = objc_claimAutoreleasedReturnValue();
  v30[0] = v18;
  v30[1] = 3221225472;
  v30[2] = __128__MSASStateMachine_workQueueDidFinishCommandByReplacingCurrentCommandWithCommand_params_personID_albumGUID_assetCollectionGUID___block_invoke_2;
  v30[3] = &unk_1E95BCED0;
  v30[4] = self;
  dispatch_async(v27, v30);

  -[MSASStateMachine workQueue](self, "workQueue");
  v28 = objc_claimAutoreleasedReturnValue();
  v29[0] = v18;
  v29[1] = 3221225472;
  v29[2] = __128__MSASStateMachine_workQueueDidFinishCommandByReplacingCurrentCommandWithCommand_params_personID_albumGUID_assetCollectionGUID___block_invoke_3;
  v29[3] = &unk_1E95BCED0;
  v29[4] = self;
  dispatch_async(v28, v29);

}

- (void)workQueueDidFailToFinishCommandDueToTemporaryError:(id)a3
{
  id v4;
  void *v5;
  NSDictionary *currentCommandParams;
  NSString *currentCommand;
  id stopHandlerBlock;
  NSObject *v9;
  void *v10;
  void (**v11)(_QWORD);
  void *v12;
  _QWORD block[5];
  uint8_t buf[4];
  MSASStateMachine *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_commandState != 2)
    __assert_rtn("-[MSASStateMachine workQueueDidFailToFinishCommandDueToTemporaryError:]", "MSASStateMachine.m", 1113, "_commandState == kMSASCommandStatePerformingCommand");
  v5 = v4;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v5, "MSVerboseDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v15 = self;
    v16 = 2114;
    v17 = v12;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Encountered temporary error. Will retry later. Error: %{public}@", buf, 0x16u);

  }
  self->_commandState = 1;
  currentCommandParams = self->_currentCommandParams;
  self->_currentCommandParams = 0;

  currentCommand = self->_currentCommand;
  self->_currentCommand = 0;

  stopHandlerBlock = self->_stopHandlerBlock;
  self->_stopHandlerBlock = 0;

  -[MSASStateMachine workQueueUpdateNextActivityDate](self, "workQueueUpdateNextActivityDate");
  -[MSASStateMachine eventQueue](self, "eventQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__MSASStateMachine_workQueueDidFailToFinishCommandDueToTemporaryError___block_invoke;
  block[3] = &unk_1E95BCED0;
  block[4] = self;
  dispatch_async(v9, block);

  -[MSASStateMachine postCommandCompletionBlock](self, "postCommandCompletionBlock");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[MSASStateMachine postCommandCompletionBlock](self, "postCommandCompletionBlock");
    v11 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
    -[MSASStateMachine setPostCommandCompletionBlock:](self, "setPostCommandCompletionBlock:", 0);
    v11[2](v11);

  }
}

- (void)workQueueDidFinishCommandByLeavingCommandInQueue
{
  NSDictionary *currentCommandParams;
  NSString *currentCommand;
  id stopHandlerBlock;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD v9[5];
  _QWORD block[5];
  uint8_t buf[4];
  MSASStateMachine *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_commandState != 2)
    __assert_rtn("-[MSASStateMachine workQueueDidFinishCommandByLeavingCommandInQueue]", "MSASStateMachine.m", 1131, "_commandState == kMSASCommandStatePerformingCommand");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v12 = self;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Leaving command in queue.", buf, 0xCu);
  }
  self->_commandState = 1;
  currentCommandParams = self->_currentCommandParams;
  self->_currentCommandParams = 0;

  currentCommand = self->_currentCommand;
  self->_currentCommand = 0;

  stopHandlerBlock = self->_stopHandlerBlock;
  self->_stopHandlerBlock = 0;

  -[MSASStateMachine workQueueUpdateNextActivityDate](self, "workQueueUpdateNextActivityDate");
  -[MSASStateMachine eventQueue](self, "eventQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__MSASStateMachine_workQueueDidFinishCommandByLeavingCommandInQueue__block_invoke;
  block[3] = &unk_1E95BCED0;
  block[4] = self;
  dispatch_async(v6, block);

  -[MSASStateMachine workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __68__MSASStateMachine_workQueueDidFinishCommandByLeavingCommandInQueue__block_invoke_2;
  v9[3] = &unk_1E95BCED0;
  v9[4] = self;
  dispatch_async(v8, v9);

}

- (void)workQueueDidFinishCommandDueToCancellation
{
  NSDictionary *currentCommandParams;
  NSString *currentCommand;
  id stopHandlerBlock;
  NSObject *v6;
  void *v7;
  void (**v8)(_QWORD);
  _QWORD block[5];
  uint8_t buf[4];
  MSASStateMachine *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (self->_commandState != 2)
    __assert_rtn("-[MSASStateMachine workQueueDidFinishCommandDueToCancellation]", "MSASStateMachine.m", 1152, "_commandState == kMSASCommandStatePerformingCommand");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v11 = self;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Command finished because it was cancelled.", buf, 0xCu);
  }
  self->_commandState = 0;
  currentCommandParams = self->_currentCommandParams;
  self->_currentCommandParams = 0;

  currentCommand = self->_currentCommand;
  self->_currentCommand = 0;

  stopHandlerBlock = self->_stopHandlerBlock;
  self->_stopHandlerBlock = 0;

  -[MSASStateMachine workQueueUpdateNextActivityDate](self, "workQueueUpdateNextActivityDate");
  -[MSASStateMachine eventQueue](self, "eventQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__MSASStateMachine_workQueueDidFinishCommandDueToCancellation__block_invoke;
  block[3] = &unk_1E95BCED0;
  block[4] = self;
  dispatch_async(v6, block);

  -[MSASStateMachine postCommandCompletionBlock](self, "postCommandCompletionBlock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[MSASStateMachine postCommandCompletionBlock](self, "postCommandCompletionBlock");
    v8 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
    -[MSASStateMachine setPostCommandCompletionBlock:](self, "setPostCommandCompletionBlock:", 0);
    v8[2](v8);

  }
}

- (BOOL)workQueueEndCommandWithError:(id)a3 command:(id)a4 params:(id)a5 albumGUID:(id)a6 assetCollectionGUID:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  BOOL v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  NSObject *v32;
  NSDictionary *currentCommandParams;
  NSString *currentCommand;
  id stopHandlerBlock;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[5];
  _QWORD v41[5];
  _QWORD v42[5];
  _QWORD block[5];
  uint8_t buf[4];
  MSASStateMachine *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  int v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (objc_msgSend(v12, "MSContainsErrorWithDomain:code:", CFSTR("MSASStateMachineErrorDomain"), 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v45 = self;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Command was cancelled.", buf, 0xCu);
    }
    -[MSASStateMachine workQueueDidFinishCommandDueToCancellation](self, "workQueueDidFinishCommandDueToCancellation");
    goto LABEL_17;
  }
  if (objc_msgSend(v12, "MSContainsErrorWithDomain:code:", CFSTR("MSASStateMachineErrorDomain"), 1))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v45 = self;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Command was stopped. Not removing from the command queue.", buf, 0xCu);
    }
    -[MSASStateMachine workQueueDidFinishCommandByLeavingCommandInQueue](self, "workQueueDidFinishCommandByLeavingCommandInQueue");
    goto LABEL_17;
  }
  if (objc_msgSend(v12, "MSIsTemporaryNetworkError"))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v45 = self;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Encountered temporary network problems.", buf, 0xCu);
    }
LABEL_16:
    -[MSASStateMachine workQueueDidFailToFinishCommandDueToTemporaryError:](self, "workQueueDidFailToFinishCommandDueToTemporaryError:", v12);
LABEL_17:
    v18 = 1;
    goto LABEL_18;
  }
  if (objc_msgSend(v12, "MSIsAuthError"))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v12, "MSVerboseDescription");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v45 = self;
      v46 = 2114;
      v47 = v37;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Received authentication error: %{public}@", buf, 0x16u);

    }
    -[MSASStateMachine eventQueue](self, "eventQueue");
    v17 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __94__MSASStateMachine_workQueueEndCommandWithError_command_params_albumGUID_assetCollectionGUID___block_invoke;
    block[3] = &unk_1E95BCED0;
    block[4] = self;
    dispatch_async(v17, block);

    goto LABEL_16;
  }
  if (v13 && objc_msgSend(v12, "MSContainsErrorWithDomain:code:", CFSTR("MSASProtocolErrorDomain"), 18))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v12, "MSVerboseDescription");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v45 = self;
      v46 = 2114;
      v47 = v39;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Encountered visitor authentication failure. Getting new album URL and retrying command. Error: %{public}@", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v15)
      objc_msgSend(v20, "setObject:forKey:", v15, CFSTR("albumGUID"));
    if (v16)
      objc_msgSend(v21, "setObject:forKey:", v16, CFSTR("assetCollectionGUID"));
    objc_msgSend(v21, "setObject:forKey:", v13, CFSTR("command"));
    if (v14)
      objc_msgSend(v21, "setObject:forKey:", v14, CFSTR("params"));
    NSStringFromSelector(sel__getAlbumURLDisposition_params_);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSASStateMachine personID](self, "personID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSASStateMachine workQueueDidFinishCommandByReplacingCurrentCommandWithCommand:params:personID:albumGUID:assetCollectionGUID:](self, "workQueueDidFinishCommandByReplacingCurrentCommandWithCommand:params:personID:albumGUID:assetCollectionGUID:", v22, v21, v23, v15, 0);

    goto LABEL_17;
  }
  if (objc_msgSend(v12, "MSIsFatal"))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v12, "MSVerboseDescription");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v45 = self;
      v46 = 2114;
      v47 = v24;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Encountered fatal error. Not retrying. Error: %{public}@", buf, 0x16u);

    }
LABEL_41:
    v18 = 0;
    goto LABEL_18;
  }
  -[NSDictionary objectForKey:](self->_currentCommandParams, "objectForKey:", CFSTR("errorCount"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "intValue");

  v27 = (v26 + 1);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v12, "MSVerboseDescription");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v45 = self;
    v46 = 2114;
    v47 = v38;
    v48 = 1024;
    v49 = v27;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Encountered error: %{public}@. This command has encountered %d errors so far.", buf, 0x1Cu);

  }
  if ((int)v27 >= -[MSASStateMachine maxMetadataRetryCount](self, "maxMetadataRetryCount"))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v45 = self;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Giving up.", buf, 0xCu);
    }
    goto LABEL_41;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v45 = self;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Retrying.", buf, 0xCu);
  }
  -[MSASStateMachine memberQueue](self, "memberQueue");
  v28 = objc_claimAutoreleasedReturnValue();
  v42[0] = MEMORY[0x1E0C809B0];
  v29 = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __94__MSASStateMachine_workQueueEndCommandWithError_command_params_albumGUID_assetCollectionGUID___block_invoke_81;
  v42[3] = &unk_1E95BCED0;
  v42[4] = self;
  dispatch_barrier_sync(v28, v42);

  v30 = (void *)-[NSDictionary mutableCopy](self->_currentCommandParams, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v27);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setObject:forKey:", v31, CFSTR("errorCount"));

  -[MSASPersonModel setParams:forCommandWithIdentifier:](self->_model, "setParams:forCommandWithIdentifier:", v30, self->_currentCommandID);
  -[MSASStateMachine eventQueue](self, "eventQueue");
  v32 = objc_claimAutoreleasedReturnValue();
  v41[0] = v29;
  v41[1] = 3221225472;
  v41[2] = __94__MSASStateMachine_workQueueEndCommandWithError_command_params_albumGUID_assetCollectionGUID___block_invoke_2;
  v41[3] = &unk_1E95BCED0;
  v41[4] = self;
  dispatch_async(v32, v41);

  currentCommandParams = self->_currentCommandParams;
  self->_currentCommandParams = 0;

  currentCommand = self->_currentCommand;
  self->_currentCommand = 0;

  stopHandlerBlock = self->_stopHandlerBlock;
  self->_stopHandlerBlock = 0;

  v18 = 1;
  self->_commandState = 1;
  -[MSASStateMachine workQueueUpdateNextActivityDate](self, "workQueueUpdateNextActivityDate");
  -[MSASStateMachine workQueue](self, "workQueue");
  v36 = objc_claimAutoreleasedReturnValue();
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __94__MSASStateMachine_workQueueEndCommandWithError_command_params_albumGUID_assetCollectionGUID___block_invoke_3;
  v40[3] = &unk_1E95BCED0;
  v40[4] = self;
  dispatch_async(v36, v40);

LABEL_18:
  return v18;
}

- (id)_URLReauthFailureWithUnderlyingError:(id)a3
{
  void *v3;
  id v4;
  __CFString *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB35C8];
  v4 = a3;
  v5 = (__CFString *)MSCFCopyLocalizedString(CFSTR("ERROR_STATE_CANNOT_REQUEUE_AFTER_URL"));
  objc_msgSend(v3, "MSErrorWithDomain:code:description:underlyingError:", CFSTR("MSASStateMachineErrorDomain"), 4, v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_getAlbumURLDisposition:(int)a3 params:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  id v20;

  v6 = a4;
  objc_msgSend(v6, "objectForKey:", CFSTR("albumGUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("assetCollectionGUID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("command"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("params"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 == 2)
  {
    v12 = (void *)objc_msgSend(v10, "mutableCopy");
    -[MSASStateMachine _canceledError](self, "_canceledError");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v13, CFSTR("error"));

    -[MSASStateMachine _model](self, "_model");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSASStateMachine personID](self, "personID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "enqueueCommandAtHeadOfQueue:params:personID:albumGUID:assetCollectionGUID:", v9, v12, v15, v7, v8);

  }
  else if (!a3)
  {
    -[MSASStateMachine protocol](self, "protocol");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __51__MSASStateMachine__getAlbumURLDisposition_params___block_invoke;
    v16[3] = &unk_1E95BB4E0;
    v16[4] = self;
    v17 = v10;
    v18 = v9;
    v19 = v7;
    v20 = v8;
    objc_msgSend(v11, "getAlbumURLForAlbumWithGUID:completionBlock:", v19, v16);

  }
}

- (id)_canceledError
{
  if (_canceledError_onceToken != -1)
    dispatch_once(&_canceledError_onceToken, &__block_literal_global_87);
  return (id)_canceledError_error;
}

- (id)_stoppedError
{
  if (_stoppedError_onceToken != -1)
    dispatch_once(&_stoppedError_onceToken, &__block_literal_global_90);
  return (id)_stoppedError_error;
}

- (id)_assetCollectionRejectedError
{
  if (_assetCollectionRejectedError_onceToken != -1)
    dispatch_once(&_assetCollectionRejectedError_onceToken, &__block_literal_global_93);
  return (id)_assetCollectionRejectedError_error;
}

- (id)_assetCollectionFailedError
{
  if (_assetCollectionFailedError_onceToken != -1)
    dispatch_once(&_assetCollectionFailedError_onceToken, &__block_literal_global_96);
  return (id)_assetCollectionFailedError_error;
}

- (void)checkForChangesIfMissingRootCtag
{
  void *v3;
  int v4;
  MSASStateMachine *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  -[MSASStateMachine rootCtagToCheckForChanges](self, "rootCtagToCheckForChanges");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v4 = 138543362;
      v5 = self;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: checking for changes because there is no root ctag.", (uint8_t *)&v4, 0xCu);
    }
    -[MSASStateMachine checkForChangesResetSync:info:](self, "checkForChangesResetSync:info:", 0, 0);
  }

}

- (void)checkForChangesResetSync:(BOOL)a3 info:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  -[MSASStateMachine workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__MSASStateMachine_checkForChangesResetSync_info___block_invoke;
  block[3] = &unk_1E95BB570;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, block);

}

- (void)_checkForChangesDisposition:(int)a3 params:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _QWORD block[5];
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  uint8_t buf[4];
  MSASStateMachine *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(v6, "objectForKey:", CFSTR("info"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 2)
  {
    -[MSASStateMachine eventQueue](self, "eventQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__MSASStateMachine__checkForChangesDisposition_params___block_invoke_3;
    block[3] = &unk_1E95BCFC0;
    block[4] = self;
    v17 = v7;
    dispatch_async(v15, block);

  }
  else if (!a3)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("resetSync"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLValue");

    if (v9)
    {
      -[MSASStateMachine _model](self, "_model");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "deletePersistentValueWithKey:", CFSTR("rootCtag"));

    }
    -[MSASStateMachine rootCtagToCheckForChanges](self, "rootCtagToCheckForChanges");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSASStateMachine protocol](self, "protocol");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stopHandlerBlock");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSASStateMachine _setStopHandlerBlock:](self, "_setStopHandlerBlock:", v13);

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      v22 = self;
      v23 = 1024;
      v24 = v9;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Checking for album list updates. Reset sync: %d", buf, 0x12u);
    }
    objc_initWeak((id *)buf, self);
    -[MSASStateMachine protocol](self, "protocol");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __55__MSASStateMachine__checkForChangesDisposition_params___block_invoke;
    v18[3] = &unk_1E95BB5C8;
    v18[4] = self;
    v19 = v7;
    objc_copyWeak(&v20, (id *)buf);
    objc_msgSend(v14, "getChangesRootCtag:completionBlock:", v11, v18);

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);

  }
}

- (void)checkForUpdatesInAlbums:(id)a3 resetSync:(BOOL)a4 info:(id)a5
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
  -[MSASStateMachine workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __59__MSASStateMachine_checkForUpdatesInAlbums_resetSync_info___block_invoke;
  v13[3] = &unk_1E95BC438;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a4;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

- (void)_checkForUpdatesInAlbumDisposition:(int)a3 params:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;
  _QWORD *v29;
  id v30;
  _QWORD v31[5];
  id v32;
  _QWORD *v33;
  _QWORD v34[5];
  id v35;
  _QWORD block[5];
  id v37;
  id v38;
  id v39;
  _BYTE location[12];
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(v6, "objectForKey:", CFSTR("resetSync"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  objc_msgSend(v6, "objectForKey:", CFSTR("album"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("info"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("error"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("commandWasRequeued"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLValue");

  if (a3 == 2)
  {
    -[MSASStateMachine eventQueue](self, "eventQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __62__MSASStateMachine__checkForUpdatesInAlbumDisposition_params___block_invoke_3_122;
    v23[3] = &unk_1E95BCE30;
    v23[4] = self;
    v24 = v9;
    v25 = v10;
    dispatch_async(v15, v23);

  }
  else if (!a3)
  {
    if (v11)
    {
      -[MSASStateMachine eventQueue](self, "eventQueue");
      v14 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __62__MSASStateMachine__checkForUpdatesInAlbumDisposition_params___block_invoke;
      block[3] = &unk_1E95BCE58;
      block[4] = self;
      v37 = v9;
      v38 = v10;
      v39 = v11;
      dispatch_async(v14, block);

      -[MSASStateMachine workQueueDidFinishCommand](self, "workQueueDidFinishCommand");
    }
    else
    {
      v34[0] = 0;
      v34[1] = v34;
      v34[2] = 0x3032000000;
      v34[3] = __Block_byref_object_copy__4154;
      v34[4] = __Block_byref_object_dispose__4155;
      objc_msgSend(MEMORY[0x1E0C99E08], "MSASDictionaryWithCopyOfDictionary:", v10);
      v35 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)location = 138543618;
        *(_QWORD *)&location[4] = self;
        v41 = 2114;
        v42 = v9;
        _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Checking for update in album %{public}@", location, 0x16u);
      }
      -[MSASStateMachine protocol](self, "protocol");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stopHandlerBlock");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[MSASStateMachine _setStopHandlerBlock:](self, "_setStopHandlerBlock:", v17);

      if ((v13 & 1) == 0)
      {
        -[MSASStateMachine eventQueue](self, "eventQueue");
        v18 = objc_claimAutoreleasedReturnValue();
        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __62__MSASStateMachine__checkForUpdatesInAlbumDisposition_params___block_invoke_115;
        v31[3] = &unk_1E95BC2F0;
        v31[4] = self;
        v32 = v9;
        v33 = v34;
        dispatch_async(v18, v31);

      }
      objc_initWeak((id *)location, self);
      -[MSASStateMachine delegate](self, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "GUID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "MSASStateMachineDidRequestAlbumURLStringForAlbumWithGUID:info:", v20, v10);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      -[MSASStateMachine protocol](self, "protocol");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __62__MSASStateMachine__checkForUpdatesInAlbumDisposition_params___block_invoke_2;
      v26[3] = &unk_1E95BB670;
      v26[4] = self;
      objc_copyWeak(&v30, (id *)location);
      v27 = v6;
      v28 = v9;
      v29 = v34;
      objc_msgSend(v22, "albumSummaryAlbum:albumURLString:resetSync:completionBlock:", v28, v21, v8, v26);

      objc_destroyWeak(&v30);
      objc_destroyWeak((id *)location);
      _Block_object_dispose(v34, 8);

    }
  }

}

- (void)_didFinishCheckingUpdatesInAlbumsDisposition:(int)a3 params:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id *v10;
  id *v11;
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;
  uint8_t buf[4];
  MSASStateMachine *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(v6, "objectForKey:", CFSTR("albums"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("info"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 == 2)
  {
    -[MSASStateMachine eventQueue](self, "eventQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __72__MSASStateMachine__didFinishCheckingUpdatesInAlbumsDisposition_params___block_invoke_2;
    v13[3] = &unk_1E95BCE30;
    v13[4] = self;
    v10 = &v14;
    v14 = v7;
    v11 = &v15;
    v15 = v8;
    dispatch_async(v12, v13);

LABEL_7:
    goto LABEL_8;
  }
  if (!a3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      v20 = self;
      v21 = 2048;
      v22 = objc_msgSend(v7, "count");
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Finished checking for updates for %ld albums.", buf, 0x16u);
    }
    -[MSASStateMachine eventQueue](self, "eventQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__MSASStateMachine__didFinishCheckingUpdatesInAlbumsDisposition_params___block_invoke;
    block[3] = &unk_1E95BCE30;
    block[4] = self;
    v10 = &v17;
    v17 = v7;
    v11 = &v18;
    v18 = v8;
    dispatch_async(v9, block);

    -[MSASStateMachine workQueueDidFinishCommand](self, "workQueueDidFinishCommand");
    goto LABEL_7;
  }
LABEL_8:

}

- (void)getAccessControlsForAlbums:(id)a3 info:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[MSASStateMachine workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__MSASStateMachine_getAccessControlsForAlbums_info___block_invoke;
  block[3] = &unk_1E95BCE30;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)_getAccessControlsDisposition:(int)a3 params:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD block[5];
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  MSASStateMachine *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(v6, "objectForKey:", CFSTR("album"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("info"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("error"));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (a3 == 2)
  {
    -[MSASStateMachine eventQueue](self, "eventQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __57__MSASStateMachine__getAccessControlsDisposition_params___block_invoke_2_129;
    v19[3] = &unk_1E95BCE30;
    v19[4] = self;
    v20 = v7;
    v21 = v8;
    dispatch_async(v12, v19);

  }
  else if (!a3)
  {
    if (v9)
    {
      -[MSASStateMachine eventQueue](self, "eventQueue");
      v11 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __57__MSASStateMachine__getAccessControlsDisposition_params___block_invoke;
      block[3] = &unk_1E95BCE58;
      block[4] = self;
      v28 = v7;
      v29 = v8;
      v30 = v10;
      dispatch_async(v11, block);

      -[MSASStateMachine workQueueDidFinishCommand](self, "workQueueDidFinishCommand");
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543618;
        v32 = self;
        v33 = 2114;
        v34 = v7;
        _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Retrieving access controls for album %{public}@", buf, 0x16u);
      }
      -[MSASStateMachine protocol](self, "protocol");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stopHandlerBlock");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[MSASStateMachine _setStopHandlerBlock:](self, "_setStopHandlerBlock:", v14);

      objc_initWeak((id *)buf, self);
      -[MSASStateMachine delegate](self, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "GUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "MSASStateMachineDidRequestAlbumURLStringForAlbumWithGUID:info:", v16, v8);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      -[MSASStateMachine protocol](self, "protocol");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __57__MSASStateMachine__getAccessControlsDisposition_params___block_invoke_125;
      v22[3] = &unk_1E95BB698;
      v22[4] = self;
      objc_copyWeak(&v26, (id *)buf);
      v23 = v6;
      v24 = v7;
      v25 = v8;
      objc_msgSend(v18, "getSharingInfoForAlbum:albumURLString:completionBlock:", v24, v17, v22);

      objc_destroyWeak(&v26);
      objc_destroyWeak((id *)buf);
    }
  }

}

- (void)subscribeToAlbum:(id)a3 info:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[MSASStateMachine workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__MSASStateMachine_subscribeToAlbum_info___block_invoke;
  block[3] = &unk_1E95BCE30;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)_subscribeToAlbumDisposition:(int)a3 params:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD block[5];
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  MSASStateMachine *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(v6, "objectForKey:", CFSTR("album"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("info"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 2)
  {
    -[MSASStateMachine eventQueue](self, "eventQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__MSASStateMachine__subscribeToAlbumDisposition_params___block_invoke_3;
    block[3] = &unk_1E95BCE30;
    block[4] = self;
    v14 = v7;
    v15 = v8;
    dispatch_async(v12, block);

  }
  else if (!a3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v21 = self;
      v22 = 2114;
      v23 = v7;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Subscribing to album %{public}@", buf, 0x16u);
    }
    -[MSASStateMachine protocol](self, "protocol");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stopHandlerBlock");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSASStateMachine _setStopHandlerBlock:](self, "_setStopHandlerBlock:", v10);

    objc_initWeak((id *)buf, self);
    -[MSASStateMachine protocol](self, "protocol");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __56__MSASStateMachine__subscribeToAlbumDisposition_params___block_invoke;
    v16[3] = &unk_1E95BB6F8;
    v16[4] = self;
    objc_copyWeak(&v19, (id *)buf);
    v17 = v7;
    v18 = v8;
    objc_msgSend(v11, "subscribeToAlbum:completionBlock:", v17, v16);

    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
  }

}

- (void)unsubscribeFromAlbum:(id)a3 info:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[MSASStateMachine workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__MSASStateMachine_unsubscribeFromAlbum_info___block_invoke;
  block[3] = &unk_1E95BCE30;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)_unsubscribeFromAlbumDisposition:(int)a3 params:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD block[5];
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  MSASStateMachine *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(v6, "objectForKey:", CFSTR("album"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("info"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 2)
  {
    -[MSASStateMachine eventQueue](self, "eventQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__MSASStateMachine__unsubscribeFromAlbumDisposition_params___block_invoke_3;
    block[3] = &unk_1E95BCE30;
    block[4] = self;
    v14 = v7;
    v15 = v8;
    dispatch_async(v12, block);

  }
  else if (!a3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v21 = self;
      v22 = 2114;
      v23 = v7;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Unsubscribing from album %{public}@", buf, 0x16u);
    }
    -[MSASStateMachine protocol](self, "protocol");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stopHandlerBlock");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSASStateMachine _setStopHandlerBlock:](self, "_setStopHandlerBlock:", v10);

    objc_initWeak((id *)buf, self);
    -[MSASStateMachine protocol](self, "protocol");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __60__MSASStateMachine__unsubscribeFromAlbumDisposition_params___block_invoke;
    v16[3] = &unk_1E95BB6F8;
    v16[4] = self;
    objc_copyWeak(&v19, (id *)buf);
    v17 = v7;
    v18 = v8;
    objc_msgSend(v11, "unsubscribeFromAlbum:completionBlock:", v17, v16);

    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
  }

}

- (void)markAsSpamInvitationForAlbum:(id)a3 invitationGUID:(id)a4 info:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[MSASStateMachine workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __69__MSASStateMachine_markAsSpamInvitationForAlbum_invitationGUID_info___block_invoke;
  v15[3] = &unk_1E95BCE58;
  v15[4] = self;
  v16 = v8;
  v17 = v10;
  v18 = v9;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  dispatch_async(v11, v15);

}

- (void)_markAsSpamInvitationForAlbumDisposition:(int)a3 params:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _QWORD block[5];
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  MSASStateMachine *v20;
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  MSASStateMachine *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("album"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("info"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sharingRelationshipGUID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 2)
  {
    -[MSASStateMachine eventQueue](self, "eventQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__MSASStateMachine__markAsSpamInvitationForAlbumDisposition_params___block_invoke_3;
    block[3] = &unk_1E95BCE58;
    block[4] = self;
    v15 = v7;
    v16 = v9;
    v17 = v8;
    dispatch_async(v13, block);

  }
  else if (!a3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v25 = self;
      v26 = 2114;
      v27 = v7;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Marking as spam invitation for album %{public}@", buf, 0x16u);
    }
    -[MSASStateMachine protocol](self, "protocol");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stopHandlerBlock");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSASStateMachine _setStopHandlerBlock:](self, "_setStopHandlerBlock:", v11);

    objc_initWeak((id *)buf, self);
    -[MSASStateMachine protocol](self, "protocol");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __68__MSASStateMachine__markAsSpamInvitationForAlbumDisposition_params___block_invoke;
    v18[3] = &unk_1E95BB8F8;
    objc_copyWeak(&v23, (id *)buf);
    v19 = v7;
    v20 = self;
    v21 = v9;
    v22 = v8;
    objc_msgSend(v12, "markAsSpamInvitationForAlbum:completionBlock:", v19, v18);

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
  }

}

- (void)markAsSpamInvitationForToken:(id)a3 info:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[MSASStateMachine workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__MSASStateMachine_markAsSpamInvitationForToken_info___block_invoke;
  block[3] = &unk_1E95BCE30;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)_markAsSpamInvitationForTokenDisposition:(int)a3 params:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD block[5];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  MSASStateMachine *v18;
  id v19;
  id v20;
  uint8_t buf[4];
  MSASStateMachine *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("info"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("invitationToken"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 2)
  {
    -[MSASStateMachine eventQueue](self, "eventQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__MSASStateMachine__markAsSpamInvitationForTokenDisposition_params___block_invoke_3;
    block[3] = &unk_1E95BCE30;
    block[4] = self;
    v14 = v8;
    v15 = v7;
    dispatch_async(v12, block);

  }
  else if (!a3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v22 = self;
      v23 = 2114;
      v24 = v8;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Marking as spam invitation for token %{public}@", buf, 0x16u);
    }
    -[MSASStateMachine protocol](self, "protocol");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stopHandlerBlock");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSASStateMachine _setStopHandlerBlock:](self, "_setStopHandlerBlock:", v10);

    objc_initWeak((id *)buf, self);
    -[MSASStateMachine protocol](self, "protocol");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __68__MSASStateMachine__markAsSpamInvitationForTokenDisposition_params___block_invoke;
    v16[3] = &unk_1E95BB6F8;
    objc_copyWeak(&v20, (id *)buf);
    v17 = v8;
    v18 = self;
    v19 = v7;
    objc_msgSend(v11, "markAsSpamInvitationForToken:completionBlock:", v17, v16);

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }

}

- (void)acceptInvitationWithToken:(id)a3 info:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[MSASStateMachine workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __67__MSASStateMachine_acceptInvitationWithToken_info_completionBlock___block_invoke;
  v15[3] = &unk_1E95BBB58;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  dispatch_async(v11, v15);

}

- (void)validateInvitationForAlbum:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[MSASStateMachine workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__MSASStateMachine_validateInvitationForAlbum_completionBlock___block_invoke;
  block[3] = &unk_1E95BC528;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)checkForAssetCollectionUpdates:(id)a3 inAlbum:(id)a4 info:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[MSASStateMachine workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __64__MSASStateMachine_checkForAssetCollectionUpdates_inAlbum_info___block_invoke;
  v15[3] = &unk_1E95BCE58;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

- (void)_checkForAssetCollectionUpdatesDisposition:(int)a3 params:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  _QWORD v32[5];
  id v33;
  id v34;
  id v35;
  _QWORD block[5];
  id v37;
  id v38;
  id v39;
  id v40;
  uint8_t buf[4];
  MSASStateMachine *v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(v6, "objectForKey:", CFSTR("album"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("assetCollections"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("info"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("error"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("commandWasRequeued"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  if (a3 == 2)
  {
    -[MSASStateMachine eventQueue](self, "eventQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __70__MSASStateMachine__checkForAssetCollectionUpdatesDisposition_params___block_invoke_2_160;
    v24[3] = &unk_1E95BCE58;
    v24[4] = self;
    v25 = v8;
    v26 = v7;
    v27 = v9;
    dispatch_async(v14, v24);

  }
  else if (!a3)
  {
    if (v10)
    {
      -[MSASStateMachine eventQueue](self, "eventQueue");
      v13 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __70__MSASStateMachine__checkForAssetCollectionUpdatesDisposition_params___block_invoke;
      block[3] = &unk_1E95BCE80;
      block[4] = self;
      v37 = v8;
      v38 = v7;
      v39 = v9;
      v40 = v10;
      dispatch_async(v13, block);

      -[MSASStateMachine workQueueDidFinishCommand](self, "workQueueDidFinishCommand");
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v15 = objc_msgSend(v8, "count");
        objc_msgSend(v7, "GUID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v42 = self;
        v43 = 2048;
        v44 = v15;
        v45 = 2114;
        v46 = v16;
        _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Getting metadata for %ld photos in album %{public}@.", buf, 0x20u);

      }
      -[MSASStateMachine protocol](self, "protocol");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stopHandlerBlock");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[MSASStateMachine _setStopHandlerBlock:](self, "_setStopHandlerBlock:", v18);

      if ((v12 & 1) == 0)
      {
        -[MSASStateMachine eventQueue](self, "eventQueue");
        v19 = objc_claimAutoreleasedReturnValue();
        v32[0] = MEMORY[0x1E0C809B0];
        v32[1] = 3221225472;
        v32[2] = __70__MSASStateMachine__checkForAssetCollectionUpdatesDisposition_params___block_invoke_154;
        v32[3] = &unk_1E95BCE58;
        v32[4] = self;
        v33 = v8;
        v34 = v7;
        v35 = v9;
        dispatch_async(v19, v32);

      }
      objc_initWeak((id *)buf, self);
      -[MSASStateMachine delegate](self, "delegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "GUID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "MSASStateMachineDidRequestAlbumURLStringForAlbumWithGUID:info:", v21, v9);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      -[MSASStateMachine protocol](self, "protocol");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __70__MSASStateMachine__checkForAssetCollectionUpdatesDisposition_params___block_invoke_2;
      v28[3] = &unk_1E95BB750;
      v28[4] = self;
      objc_copyWeak(&v31, (id *)buf);
      v29 = v7;
      v30 = v9;
      objc_msgSend(v23, "getAssetCollections:inAlbum:albumURLString:completionBlock:", v8, v29, v22, v28);

      objc_destroyWeak(&v31);
      objc_destroyWeak((id *)buf);
    }
  }

}

- (void)checkForCommentChanges:(id)a3 inAlbumWithGUID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[MSASStateMachine workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__MSASStateMachine_checkForCommentChanges_inAlbumWithGUID___block_invoke;
  block[3] = &unk_1E95BCE30;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)_checkForCommentChangesDisposition:(int)a3 params:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  MSASStateMachine *v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  _QWORD block[4];
  id v30;
  MSASStateMachine *v31;
  id v32;
  id v33;
  uint8_t buf[4];
  MSASStateMachine *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(v6, "objectForKey:", CFSTR("commentsChange"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("albumGUID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("info"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("error"));
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (a3 == 2)
  {
    -[MSASStateMachine eventQueue](self, "eventQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __62__MSASStateMachine__checkForCommentChangesDisposition_params___block_invoke_4;
    v19[3] = &unk_1E95BCE30;
    v20 = v7;
    v21 = self;
    v22 = v9;
    dispatch_async(v13, v19);

  }
  else if (!a3)
  {
    if (v10)
    {
      -[MSASStateMachine eventQueue](self, "eventQueue");
      v12 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __62__MSASStateMachine__checkForCommentChangesDisposition_params___block_invoke;
      block[3] = &unk_1E95BCE58;
      v30 = v7;
      v31 = self;
      v32 = v9;
      v33 = v11;
      dispatch_async(v12, block);

      -[MSASStateMachine workQueueDidFinishCommand](self, "workQueueDidFinishCommand");
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543618;
        v35 = self;
        v36 = 2114;
        v37 = v8;
        _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Checking for comment changes in album %{public}@,", buf, 0x16u);
      }
      -[MSASStateMachine protocol](self, "protocol");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stopHandlerBlock");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[MSASStateMachine _setStopHandlerBlock:](self, "_setStopHandlerBlock:", v15);

      objc_initWeak((id *)buf, self);
      -[MSASStateMachine delegate](self, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "MSASStateMachineDidRequestAlbumURLStringForAlbumWithGUID:info:", v8, v9);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      -[MSASStateMachine protocol](self, "protocol");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __62__MSASStateMachine__checkForCommentChangesDisposition_params___block_invoke_163;
      v23[3] = &unk_1E95BB7F8;
      v23[4] = self;
      objc_copyWeak(&v28, (id *)buf);
      v24 = v6;
      v25 = v8;
      v26 = v7;
      v27 = v9;
      objc_msgSend(v18, "getCommentChanges:inAlbumWithGUID:albumURLString:completionBlock:", v26, v25, v17, v23);

      objc_destroyWeak(&v28);
      objc_destroyWeak((id *)buf);
    }
  }

}

- (void)checkForAlbumSyncedStateChangesInAlbums:(id)a3 info:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[MSASStateMachine workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__MSASStateMachine_checkForAlbumSyncedStateChangesInAlbums_info___block_invoke;
  block[3] = &unk_1E95BCE30;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)_checkForAlbumSyncedStateDisposition:(int)a3 params:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id *v18;
  id *v19;
  NSObject *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  MSASStateMachine *v26;
  id v27;
  id v28;
  _QWORD v29[5];
  id v30;
  id v31;
  id v32;
  _QWORD block[5];
  id v34;
  id v35;
  _BYTE location[12];
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(v6, "objectForKey:", CFSTR("album"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("info"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 2)
  {
    -[MSASStateMachine eventQueue](self, "eventQueue");
    v20 = objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __64__MSASStateMachine__checkForAlbumSyncedStateDisposition_params___block_invoke_3_174;
    v21[3] = &unk_1E95BCE30;
    v21[4] = self;
    v22 = v7;
    v23 = v8;
    dispatch_async(v20, v21);

    v18 = &v22;
    v19 = &v23;
LABEL_7:

    goto LABEL_8;
  }
  if (!a3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)location = 138543618;
      *(_QWORD *)&location[4] = self;
      v37 = 2114;
      v38 = v7;
      _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Checking for album synced state changes in album %{public}@", location, 0x16u);
    }
    -[MSASStateMachine protocol](self, "protocol");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stopHandlerBlock");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSASStateMachine _setStopHandlerBlock:](self, "_setStopHandlerBlock:", v10);

    -[MSASStateMachine eventQueue](self, "eventQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__MSASStateMachine__checkForAlbumSyncedStateDisposition_params___block_invoke;
    block[3] = &unk_1E95BCE30;
    block[4] = self;
    v13 = v7;
    v34 = v13;
    v14 = v8;
    v35 = v14;
    dispatch_async(v11, block);

    objc_initWeak((id *)location, self);
    -[MSASStateMachine protocol](self, "protocol");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v12;
    v29[1] = 3221225472;
    v29[2] = __64__MSASStateMachine__checkForAlbumSyncedStateDisposition_params___block_invoke_2;
    v29[3] = &unk_1E95BB820;
    v29[4] = self;
    objc_copyWeak(&v32, (id *)location);
    v16 = v13;
    v30 = v16;
    v17 = v14;
    v31 = v17;
    v24[0] = v12;
    v24[1] = 3221225472;
    v24[2] = __64__MSASStateMachine__checkForAlbumSyncedStateDisposition_params___block_invoke_4;
    v24[3] = &unk_1E95BB848;
    objc_copyWeak(&v28, (id *)location);
    v25 = v16;
    v26 = self;
    v27 = v17;
    objc_msgSend(v15, "getAlbumSyncedStateForAlbum:assetCollectionStateBlock:completionBlock:", v25, v29, v24);

    objc_destroyWeak(&v28);
    objc_destroyWeak(&v32);
    objc_destroyWeak((id *)location);
    v18 = &v34;
    v19 = &v35;
    goto LABEL_7;
  }
LABEL_8:

}

- (void)setAlbumSyncedState:(id)a3 forAlbum:(id)a4 info:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[MSASStateMachine workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __54__MSASStateMachine_setAlbumSyncedState_forAlbum_info___block_invoke;
  v15[3] = &unk_1E95BCE58;
  v15[4] = self;
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async(v11, v15);

}

- (void)_setAlbumSyncedStateDisposition:(int)a3 params:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  _QWORD block[5];
  id v31;
  id v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint8_t buf[4];
  MSASStateMachine *v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(v6, "objectForKey:", CFSTR("album"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("albumState"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("info"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__4154;
  v38 = __Block_byref_object_dispose__4155;
  v39 = 0;
  -[MSASStateMachine eventQueue](self, "eventQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__MSASStateMachine__setAlbumSyncedStateDisposition_params___block_invoke;
  block[3] = &unk_1E95BBCC8;
  v33 = &v34;
  block[4] = self;
  v12 = v7;
  v31 = v12;
  v13 = v9;
  v32 = v13;
  dispatch_sync(v10, block);

  if (a3 == 2)
  {
    -[MSASStateMachine eventQueue](self, "eventQueue");
    v18 = objc_claimAutoreleasedReturnValue();
    v20[0] = v11;
    v20[1] = 3221225472;
    v20[2] = __59__MSASStateMachine__setAlbumSyncedStateDisposition_params___block_invoke_2_183;
    v20[3] = &unk_1E95BCE30;
    v20[4] = self;
    v21 = v12;
    v22 = v13;
    dispatch_async(v18, v20);

  }
  else if (!a3)
  {
    if (v35[5])
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v41 = self;
        v42 = 2114;
        v43 = v12;
        _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Setting synced state for album %{public}@", buf, 0x16u);
      }
      -[MSASStateMachine protocol](self, "protocol");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stopHandlerBlock");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[MSASStateMachine _setStopHandlerBlock:](self, "_setStopHandlerBlock:", v15);

      objc_initWeak((id *)buf, self);
      -[MSASStateMachine protocol](self, "protocol");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v35[5];
      v26[0] = v11;
      v26[1] = 3221225472;
      v26[2] = __59__MSASStateMachine__setAlbumSyncedStateDisposition_params___block_invoke_177;
      v26[3] = &unk_1E95BB878;
      objc_copyWeak(&v29, (id *)buf);
      v27 = v12;
      v28 = v13;
      objc_msgSend(v16, "setAlbumSyncedState:forAlbum:albumStateCtag:completionBlock:", v8, v27, v17, v26);

      objc_destroyWeak(&v29);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v41 = self;
        v42 = 2114;
        v43 = v12;
        _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Not setting synced state for album %{public}@ because we don't have a state ctag.", buf, 0x16u);
      }
      -[MSASStateMachine eventQueue](self, "eventQueue");
      v19 = objc_claimAutoreleasedReturnValue();
      v23[0] = v11;
      v23[1] = 3221225472;
      v23[2] = __59__MSASStateMachine__setAlbumSyncedStateDisposition_params___block_invoke_180;
      v23[3] = &unk_1E95BCE30;
      v23[4] = self;
      v24 = v12;
      v25 = v13;
      dispatch_async(v19, v23);

      -[MSASStateMachine workQueueDidFinishCommand](self, "workQueueDidFinishCommand");
    }
  }

  _Block_object_dispose(&v34, 8);
}

- (void)setAssetCollectionSyncedState:(id)a3 forAssetCollection:(id)a4 album:(id)a5 info:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[MSASStateMachine workQueue](self, "workQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__MSASStateMachine_setAssetCollectionSyncedState_forAssetCollection_album_info___block_invoke;
  block[3] = &unk_1E95BCE80;
  block[4] = self;
  v20 = v11;
  v21 = v12;
  v22 = v10;
  v23 = v13;
  v15 = v13;
  v16 = v10;
  v17 = v12;
  v18 = v11;
  dispatch_async(v14, block);

}

- (void)_setAssetCollectionSyncedStateDisposition:(int)a3 params:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  _QWORD block[5];
  id v30;
  id v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint8_t buf[4];
  MSASStateMachine *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(v6, "objectForKey:", CFSTR("assetCollection"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("album"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("assetCollectionState"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("info"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__4154;
  v37 = __Block_byref_object_dispose__4155;
  v38 = 0;
  -[MSASStateMachine eventQueue](self, "eventQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__MSASStateMachine__setAssetCollectionSyncedStateDisposition_params___block_invoke;
  block[3] = &unk_1E95BBCC8;
  v32 = &v33;
  block[4] = self;
  v13 = v7;
  v30 = v13;
  v14 = v10;
  v31 = v14;
  dispatch_sync(v11, block);

  if (a3 == 2)
  {
    -[MSASStateMachine eventQueue](self, "eventQueue");
    v19 = objc_claimAutoreleasedReturnValue();
    v20[0] = v12;
    v20[1] = 3221225472;
    v20[2] = __69__MSASStateMachine__setAssetCollectionSyncedStateDisposition_params___block_invoke_3;
    v20[3] = &unk_1E95BCE58;
    v20[4] = self;
    v21 = v13;
    v22 = v8;
    v23 = v14;
    dispatch_async(v19, v20);

  }
  else if (!a3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543874;
      v40 = self;
      v41 = 2114;
      v42 = v13;
      v43 = 2114;
      v44 = v8;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Setting synced state for asset collection %{public}@ in album %{public}@", buf, 0x20u);
    }
    -[MSASStateMachine protocol](self, "protocol");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stopHandlerBlock");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSASStateMachine _setStopHandlerBlock:](self, "_setStopHandlerBlock:", v16);

    objc_initWeak((id *)buf, self);
    -[MSASStateMachine protocol](self, "protocol");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v34[5];
    v24[0] = v12;
    v24[1] = 3221225472;
    v24[2] = __69__MSASStateMachine__setAssetCollectionSyncedStateDisposition_params___block_invoke_186;
    v24[3] = &unk_1E95BB948;
    objc_copyWeak(&v28, (id *)buf);
    v25 = v13;
    v26 = v8;
    v27 = v14;
    objc_msgSend(v17, "setAssetCollectionSyncedState:forAssetCollection:inAlbum:assetCollectionStateCtag:completionBlock:", v9, v25, v26, v18, v24);

    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)buf);
  }

  _Block_object_dispose(&v33, 8);
}

- (void)deleteAlbum:(id)a3 info:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  MSASStateMachine *v14;

  v6 = a3;
  v7 = a4;
  -[MSASStateMachine workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__MSASStateMachine_deleteAlbum_info___block_invoke;
  block[3] = &unk_1E95BCE30;
  v12 = v6;
  v13 = v7;
  v14 = self;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)_deleteAlbumDisposition:(int)a3 params:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD block[5];
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  MSASStateMachine *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(v6, "objectForKey:", CFSTR("album"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("info"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 2)
  {
    -[MSASStateMachine eventQueue](self, "eventQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__MSASStateMachine__deleteAlbumDisposition_params___block_invoke_3;
    block[3] = &unk_1E95BCE30;
    block[4] = self;
    v14 = v7;
    v15 = v8;
    dispatch_async(v12, block);

  }
  else if (!a3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v21 = self;
      v22 = 2114;
      v23 = v7;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Deleting album: %{public}@", buf, 0x16u);
    }
    -[MSASStateMachine protocol](self, "protocol");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stopHandlerBlock");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSASStateMachine _setStopHandlerBlock:](self, "_setStopHandlerBlock:", v10);

    objc_initWeak((id *)buf, self);
    -[MSASStateMachine protocol](self, "protocol");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __51__MSASStateMachine__deleteAlbumDisposition_params___block_invoke;
    v16[3] = &unk_1E95BB6F8;
    v16[4] = self;
    objc_copyWeak(&v19, (id *)buf);
    v17 = v7;
    v18 = v8;
    objc_msgSend(v11, "deleteAlbum:completionBlock:", v17, v16);

    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
  }

}

- (void)deleteAssetCollections:(id)a3 inAlbum:(id)a4 info:(id)a5
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
  id v18;
  MSASStateMachine *v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[MSASStateMachine workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __56__MSASStateMachine_deleteAssetCollections_inAlbum_info___block_invoke;
  v15[3] = &unk_1E95BCE58;
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v19 = self;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async(v11, v15);

}

- (void)_deleteAssetCollectionsDisposition:(int)a3 params:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _QWORD block[4];
  id v17;
  MSASStateMachine *v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  MSASStateMachine *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(v6, "objectForKey:", CFSTR("album"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("assetCollections"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("info"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 2)
  {
    -[MSASStateMachine eventQueue](self, "eventQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__MSASStateMachine__deleteAssetCollectionsDisposition_params___block_invoke_3;
    block[3] = &unk_1E95BCE58;
    v17 = v8;
    v18 = self;
    v19 = v7;
    v20 = v9;
    dispatch_async(v15, block);

  }
  else if (!a3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v27 = self;
      v28 = 2048;
      v29 = objc_msgSend(v8, "count");
      v30 = 2114;
      v31 = v7;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Deleting %ld photos in album %{public}@", buf, 0x20u);
    }
    -[MSASStateMachine protocol](self, "protocol");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stopHandlerBlock");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSASStateMachine _setStopHandlerBlock:](self, "_setStopHandlerBlock:", v11);

    -[MSASStateMachine _model](self, "_model");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeAssetCollectionsFromUploadQueue:", v8);

    -[MSASStateMachine _assetUploader](self, "_assetUploader");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "cancelAssetCollections:", v8);

    objc_initWeak((id *)buf, self);
    -[MSASStateMachine protocol](self, "protocol");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __62__MSASStateMachine__deleteAssetCollectionsDisposition_params___block_invoke;
    v21[3] = &unk_1E95BB8F8;
    v21[4] = self;
    objc_copyWeak(&v25, (id *)buf);
    v22 = v8;
    v23 = v7;
    v24 = v9;
    objc_msgSend(v14, "deleteAssetCollections:inAlbum:completionBlock:", v22, v23, v21);

    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)buf);
  }

}

- (void)deleteComments:(id)a3 inAssetCollection:(id)a4 inAlbum:(id)a5 info:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[MSASStateMachine workQueue](self, "workQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__MSASStateMachine_deleteComments_inAssetCollection_inAlbum_info___block_invoke;
  block[3] = &unk_1E95BCE80;
  block[4] = self;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  dispatch_async(v14, block);

}

- (void)_deleteCommentDisposition:(int)a3 params:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  _QWORD block[5];
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  uint8_t buf[4];
  MSASStateMachine *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(v6, "objectForKey:", CFSTR("comment"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("assetCollection"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("album"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("info"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("error"));
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (a3 == 2)
  {
    -[MSASStateMachine eventQueue](self, "eventQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __53__MSASStateMachine__deleteCommentDisposition_params___block_invoke_2_204;
    v19[3] = &unk_1E95BCE80;
    v19[4] = self;
    v20 = v18;
    v21 = v7;
    v22 = v8;
    v23 = v9;
    dispatch_async(v13, v19);

  }
  else if (!a3)
  {
    if (v10)
    {
      -[MSASStateMachine eventQueue](self, "eventQueue");
      v12 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __53__MSASStateMachine__deleteCommentDisposition_params___block_invoke;
      block[3] = &unk_1E95BC758;
      block[4] = self;
      v32 = v18;
      v33 = v7;
      v34 = v8;
      v35 = v9;
      v36 = v11;
      dispatch_async(v12, block);

      -[MSASStateMachine workQueueDidFinishCommand](self, "workQueueDidFinishCommand");
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138544130;
        v38 = self;
        v39 = 2114;
        v40 = v18;
        v41 = 2114;
        v42 = v7;
        v43 = 2114;
        v44 = v8;
        _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Deleting comment %{public}@ from asset collection %{public}@ in album %{public}@.", buf, 0x2Au);
      }
      objc_initWeak((id *)buf, self);
      -[MSASStateMachine delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "GUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "MSASStateMachineDidRequestAlbumURLStringForAlbumWithGUID:info:", v15, v9);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      -[MSASStateMachine protocol](self, "protocol");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __53__MSASStateMachine__deleteCommentDisposition_params___block_invoke_201;
      v24[3] = &unk_1E95BB920;
      v24[4] = self;
      objc_copyWeak(&v30, (id *)buf);
      v25 = v6;
      v26 = v8;
      v27 = v7;
      v28 = v18;
      v29 = v9;
      objc_msgSend(v17, "deleteComment:fromAssetCollection:inAlbum:albumURLString:completionBlock:", v28, v27, v26, v16, v24);

      objc_destroyWeak(&v30);
      objc_destroyWeak((id *)buf);
    }
  }

}

- (void)createAlbum:(id)a3 info:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  MSASStateMachine *v14;

  v6 = a3;
  v7 = a4;
  -[MSASStateMachine workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__MSASStateMachine_createAlbum_info___block_invoke;
  block[3] = &unk_1E95BCE30;
  v12 = v6;
  v13 = v7;
  v14 = self;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)_createAlbumDisposition:(int)a3 params:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD block[5];
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  MSASStateMachine *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(v6, "objectForKey:", CFSTR("album"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("info"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 2)
  {
    -[MSASStateMachine eventQueue](self, "eventQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__MSASStateMachine__createAlbumDisposition_params___block_invoke_3;
    block[3] = &unk_1E95BCE30;
    block[4] = self;
    v14 = v7;
    v15 = v8;
    dispatch_async(v12, block);

  }
  else if (!a3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v21 = self;
      v22 = 2114;
      v23 = v7;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Creating album: %{public}@", buf, 0x16u);
    }
    -[MSASStateMachine protocol](self, "protocol");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stopHandlerBlock");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSASStateMachine _setStopHandlerBlock:](self, "_setStopHandlerBlock:", v10);

    objc_initWeak((id *)buf, self);
    -[MSASStateMachine protocol](self, "protocol");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __51__MSASStateMachine__createAlbumDisposition_params___block_invoke;
    v16[3] = &unk_1E95BB948;
    v16[4] = self;
    objc_copyWeak(&v19, (id *)buf);
    v17 = v7;
    v18 = v8;
    objc_msgSend(v11, "createAlbum:completionBlock:", v17, v16);

    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
  }

}

- (void)updateAlbum:(id)a3 updateAlbumFlags:(int)a4 info:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  MSASStateMachine *v16;
  int v17;

  v8 = a3;
  v9 = a5;
  -[MSASStateMachine workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __54__MSASStateMachine_updateAlbum_updateAlbumFlags_info___block_invoke;
  v13[3] = &unk_1E95BC488;
  v14 = v8;
  v15 = v9;
  v17 = a4;
  v16 = self;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

- (void)_updateAlbumDisposition:(int)a3 params:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _QWORD block[5];
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  MSASStateMachine *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(v6, "objectForKey:", CFSTR("album"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("info"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 2)
  {
    -[MSASStateMachine eventQueue](self, "eventQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__MSASStateMachine__updateAlbumDisposition_params___block_invoke_3;
    block[3] = &unk_1E95BCE30;
    block[4] = self;
    v17 = v7;
    v18 = v8;
    dispatch_async(v15, block);

  }
  else if (!a3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v24 = self;
      v25 = 2114;
      v26 = v7;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Updating album: %{public}@", buf, 0x16u);
    }
    -[MSASStateMachine protocol](self, "protocol");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stopHandlerBlock");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSASStateMachine _setStopHandlerBlock:](self, "_setStopHandlerBlock:", v10);

    objc_initWeak((id *)buf, self);
    -[MSASStateMachine delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "GUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "MSASStateMachineDidRequestAlbumURLStringForAlbumWithGUID:info:", v12, v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[MSASStateMachine protocol](self, "protocol");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __51__MSASStateMachine__updateAlbumDisposition_params___block_invoke;
    v19[3] = &unk_1E95BB6F8;
    v19[4] = self;
    objc_copyWeak(&v22, (id *)buf);
    v20 = v7;
    v21 = v8;
    objc_msgSend(v14, "updateAlbum:albumURLString:completionBlock:", v20, v13, v19);

    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);
  }

}

- (id)_createCopiedAssetsInAssetCollections:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id obj;
  uint64_t v20;
  id v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  uint64_t v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  MSASStateMachine *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  id v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v3;
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
  if (v22)
  {
    v20 = *(_QWORD *)v35;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v35 != v20)
          objc_enumerationMutation(obj);
        v24 = v4;
        +[MSASAssetCollection assetCollectionWithAssetCollection:](MSASAssetCollection, "assetCollectionWithAssetCollection:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v4));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v23 = v5;
        objc_msgSend(v5, "assets");
        v25 = (id)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v30, v46, 16);
        if (v6)
        {
          v7 = v6;
          v28 = *(_QWORD *)v31;
          do
          {
            for (i = 0; i != v7; ++i)
            {
              if (*(_QWORD *)v31 != v28)
                objc_enumerationMutation(v25);
              v9 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
              objc_msgSend(v9, "path");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              if (v10)
              {
                -[MSASStateMachine personID](self, "personID");
                v11 = (void *)objc_claimAutoreleasedReturnValue();
                MSPathAlbumSharingAssetsDirForPersonID(v11);
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3940], "MSMakeUUID");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "stringByAppendingPathComponent:", v13);
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v10, "pathExtension");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "stringByAppendingPathExtension:", v15);
                v16 = (void *)objc_claimAutoreleasedReturnValue();

                v29 = 0;
                LODWORD(v14) = objc_msgSend(v26, "copyItemAtPath:toPath:error:", v10, v16, &v29);
                v17 = v29;
                if ((_DWORD)v14)
                {
                  objc_msgSend(v9, "setPath:", v16);
                }
                else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138544130;
                  v39 = self;
                  v40 = 2112;
                  v41 = v10;
                  v42 = 2112;
                  v43 = v16;
                  v44 = 2114;
                  v45 = v17;
                  _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Cannot copy file from path %@ to %@. Error: %{public}@", buf, 0x2Au);
                }

              }
            }
            v7 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v30, v46, 16);
          }
          while (v7);
        }

        objc_msgSend(v21, "addObject:", v23);
        v4 = v24 + 1;
      }
      while (v24 + 1 != v22);
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
    }
    while (v22);
  }

  return v21;
}

- (void)addAssetCollections:(id)a3 toAlbum:(id)a4 info:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  MSASStateMachine *v19;
  id v20;
  id v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[MSASStateMachine _createCopiedAssetsInAssetCollections:](self, "_createCopiedAssetsInAssetCollections:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASStateMachine workQueue](self, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__MSASStateMachine_addAssetCollections_toAlbum_info___block_invoke;
  block[3] = &unk_1E95BCE80;
  v18 = v8;
  v19 = self;
  v20 = v9;
  v21 = v11;
  v22 = v10;
  v13 = v10;
  v14 = v11;
  v15 = v9;
  v16 = v8;
  dispatch_async(v12, block);

}

- (void)_addAssetCollectionsDisposition:(int)a3 params:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  NSObject *v24;
  uint64_t j;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  MSASPersonModel *model;
  void *v40;
  NSObject *v41;
  MSASAssetUploader *assetUploader;
  void *v43;
  MSASStateMachine *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  id obj;
  _QWORD block[4];
  id v53;
  MSASStateMachine *v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _QWORD v60[5];
  id v61;
  id v62;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _QWORD v72[5];
  id v73;
  id v74;
  id v75;
  id v76;
  _BYTE v77[128];
  _BYTE v78[128];
  uint8_t v79[128];
  uint8_t buf[4];
  MSASStateMachine *v81;
  __int16 v82;
  _BYTE v83[24];
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(v6, "objectForKey:", CFSTR("assetCollections"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("album"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("info"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 2)
  {
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v19 = v7;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v56, v77, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v57;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v57 != v22)
            objc_enumerationMutation(v19);
          -[MSASStateMachine _deleteAssetFilesInAssetCollection:](self, "_deleteAssetFilesInAssetCollection:", *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * i));
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v56, v77, 16);
      }
      while (v21);
    }

    -[MSASStateMachine eventQueue](self, "eventQueue");
    v24 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__MSASStateMachine__addAssetCollectionsDisposition_params___block_invoke_3;
    block[3] = &unk_1E95BCE30;
    v53 = v19;
    v54 = self;
    v55 = v9;
    dispatch_async(v24, block);

  }
  else if (!a3)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("commandRetryCount"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "intValue");

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544130;
      v81 = self;
      v82 = 2048;
      *(_QWORD *)v83 = objc_msgSend(v7, "count");
      *(_WORD *)&v83[8] = 2114;
      *(_QWORD *)&v83[10] = v8;
      *(_WORD *)&v83[18] = 1024;
      *(_DWORD *)&v83[20] = v11;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Adding %ld asset collections to album %{public}@ retry %d.", buf, 0x26u);
    }
    self->_startOfUpload = CFAbsoluteTimeGetCurrent();
    -[MSASStateMachine protocol](self, "protocol");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stopHandlerBlock");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSASStateMachine _setStopHandlerBlock:](self, "_setStopHandlerBlock:", v13);

    if (v11 < 4)
    {
      v44 = self;
      v45 = v9;
      v46 = v8;
      v47 = v7;
      v48 = v6;
      v70 = 0u;
      v71 = 0u;
      v68 = 0u;
      v69 = 0u;
      obj = v7;
      v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v79, 16);
      if (v50)
      {
        v49 = *(_QWORD *)v69;
        do
        {
          for (j = 0; j != v50; ++j)
          {
            if (*(_QWORD *)v69 != v49)
              objc_enumerationMutation(obj);
            v26 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * j);
            v27 = (void *)MEMORY[0x1D8255C20]();
            objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(obj, "count"));
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v64 = 0u;
            v65 = 0u;
            v66 = 0u;
            v67 = 0u;
            objc_msgSend(v26, "assets");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v64, v78, 16);
            if (v30)
            {
              v31 = v30;
              v32 = *(_QWORD *)v65;
              do
              {
                for (k = 0; k != v31; ++k)
                {
                  if (*(_QWORD *)v65 != v32)
                    objc_enumerationMutation(v29);
                  v34 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * k);
                  objc_msgSend(v34, "path");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v35)
                  {
                    objc_msgSend(v34, "path");
                    v36 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v28, "addObject:", v36);

                  }
                }
                v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v64, v78, 16);
              }
              while (v31);
            }

            if (objc_msgSend(v28, "count"))
              objc_msgSend(v26, "setMetadataValue:forKey:", v28, CFSTR("originalPaths"));

            objc_autoreleasePoolPop(v27);
          }
          v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v79, 16);
        }
        while (v50);
      }

      -[MSASStateMachine eventQueue](v44, "eventQueue");
      v37 = objc_claimAutoreleasedReturnValue();
      v60[0] = MEMORY[0x1E0C809B0];
      v60[1] = 3221225472;
      v60[2] = __59__MSASStateMachine__addAssetCollectionsDisposition_params___block_invoke_2;
      v60[3] = &unk_1E95BCE58;
      v60[4] = v44;
      v61 = obj;
      v8 = v46;
      v62 = v46;
      v9 = v45;
      v63 = v45;
      dispatch_async(v37, v60);

      v7 = v47;
      v6 = v48;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138544130;
        v81 = self;
        v82 = 1024;
        *(_DWORD *)v83 = v11;
        *(_WORD *)&v83[4] = 2114;
        *(_QWORD *)&v83[6] = v7;
        *(_WORD *)&v83[14] = 2114;
        *(_QWORD *)&v83[16] = v8;
        _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Retried %d times to add asset collections %{public}@ to album %{public}@.", buf, 0x26u);
      }
      -[MSASStateMachine _assetCollectionFailedError](self, "_assetCollectionFailedError");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v7, "count") < 2)
      {
        -[MSASModelBase beginTransaction](self->_model, "beginTransaction");
        objc_msgSend(v7, "firstObject");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          v81 = self;
          v82 = 2114;
          *(_QWORD *)v83 = v38;
          *(_WORD *)&v83[8] = 2114;
          *(_QWORD *)&v83[10] = v8;
          _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Giving up uploading asset collections %{public}@ to album %{public}@.", buf, 0x20u);
        }
        model = self->_model;
        objc_msgSend(v38, "GUID");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[MSASPersonModel requeuePendingAssetCollectionGUID:](model, "requeuePendingAssetCollectionGUID:", v40);

        -[MSASStateMachine _deleteAssetFilesInAssetCollection:](self, "_deleteAssetFilesInAssetCollection:", v38);
        -[MSASStateMachine eventQueue](self, "eventQueue");
        v41 = objc_claimAutoreleasedReturnValue();
        v72[0] = MEMORY[0x1E0C809B0];
        v72[1] = 3221225472;
        v72[2] = __59__MSASStateMachine__addAssetCollectionsDisposition_params___block_invoke;
        v72[3] = &unk_1E95BCE80;
        v72[4] = self;
        v73 = v38;
        v74 = v8;
        v75 = v9;
        v76 = v14;
        v17 = v38;
        dispatch_async(v41, v72);

        assetUploader = self->_assetUploader;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v17);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[MSASAssetUploader unregisterAssetCollections:](assetUploader, "unregisterAssetCollections:", v43);

        -[MSASModelBase endTransaction](self->_model, "endTransaction");
      }
      else
      {
        v15 = (unint64_t)objc_msgSend(v7, "count") >> 1;
        v16 = objc_msgSend(v7, "count") - v15;
        objc_msgSend(v7, "subarrayWithRange:", 0, v15);
        v17 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "subarrayWithRange:", v15, v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[MSASStateMachine addAssetCollections:toAlbum:info:](self, "addAssetCollections:toAlbum:info:", v17, v8, v9);
        -[MSASStateMachine addAssetCollections:toAlbum:info:](self, "addAssetCollections:toAlbum:info:", v18, v8, v9);

      }
      -[MSASStateMachine workQueueDidFinishCommand](self, "workQueueDidFinishCommand");

    }
  }

}

- (void)continueAddingAssetCollections:(id)a3 skipAssetCollections:(id)a4 toAlbum:(id)a5 info:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  MSASStateMachine *v23;
  id v24;
  id v25;
  id v26;
  id v27;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[MSASStateMachine _createCopiedAssetsInAssetCollections:](self, "_createCopiedAssetsInAssetCollections:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASStateMachine workQueue](self, "workQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __85__MSASStateMachine_continueAddingAssetCollections_skipAssetCollections_toAlbum_info___block_invoke;
  v21[3] = &unk_1E95BC758;
  v22 = v11;
  v23 = self;
  v24 = v10;
  v25 = v14;
  v26 = v12;
  v27 = v13;
  v16 = v13;
  v17 = v12;
  v18 = v14;
  v19 = v10;
  v20 = v11;
  dispatch_async(v15, v21);

}

- (void)_continueAddingAssetCollectionsDisposition:(int)a3 params:(id)a4
{
  id v4;
  void *v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v40;
  id obj;
  uint64_t v42;
  uint64_t v43;
  _QWORD block[6];
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD v50[5];
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t v64[128];
  uint8_t buf[4];
  MSASStateMachine *v66;
  __int16 v67;
  uint64_t v68;
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  objc_msgSend(v4, "objectForKey:", CFSTR("assetCollections"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("album"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v4;
  objc_msgSend(v4, "objectForKey:", CFSTR("info"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  obj = v5;
  v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
  if (v43)
  {
    v42 = *(_QWORD *)v61;
    do
    {
      for (i = 0; i != v43; ++i)
      {
        if (*(_QWORD *)v61 != v42)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
        v8 = (void *)MEMORY[0x1D8255C20]();
        objc_msgSend(v7, "metadata");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKey:", CFSTR("originalPaths"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = 0u;
          v57 = 0u;
          v58 = 0u;
          v59 = 0u;
          v12 = v10;
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v56, v69, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v57;
            do
            {
              for (j = 0; j != v14; ++j)
              {
                if (*(_QWORD *)v57 != v15)
                  objc_enumerationMutation(v12);
                objc_msgSend(v11, "removeItemAtPath:error:", *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * j), 0);
              }
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v56, v69, 16);
            }
            while (v14);
          }

          objc_msgSend(v7, "metadata");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (void *)objc_msgSend(v17, "mutableCopy");

          objc_msgSend(v18, "removeObjectForKey:", CFSTR("originalPaths"));
          objc_msgSend(v7, "setMetadata:", v18);

        }
        objc_autoreleasePoolPop(v8);
      }
      v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
    }
    while (v43);
  }

  if (a3 == 2)
  {
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v26 = obj;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v46, v64, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v47;
      v30 = MEMORY[0x1E0C809B0];
      do
      {
        for (k = 0; k != v28; ++k)
        {
          if (*(_QWORD *)v47 != v29)
            objc_enumerationMutation(v26);
          v32 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * k);
          -[MSASStateMachine _deleteAssetFilesInAssetCollection:](self, "_deleteAssetFilesInAssetCollection:", v32);
          -[MSASStateMachine eventQueue](self, "eventQueue");
          v33 = objc_claimAutoreleasedReturnValue();
          block[0] = v30;
          block[1] = 3221225472;
          block[2] = __70__MSASStateMachine__continueAddingAssetCollectionsDisposition_params___block_invoke_226;
          block[3] = &unk_1E95BCE30;
          block[4] = self;
          block[5] = v32;
          v45 = v40;
          dispatch_async(v33, block);

          -[MSASStateMachine _model](self, "_model");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "GUID");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "requeuePendingAssetCollectionGUID:", v35);

        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v46, v64, 16);
      }
      while (v28);
    }
    v20 = v36;
    v19 = v37;
    goto LABEL_30;
  }
  v20 = v36;
  v19 = v37;
  if (!a3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v21 = objc_msgSend(obj, "count");
      *(_DWORD *)buf = 138543618;
      v66 = self;
      v67 = 2048;
      v68 = v21;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Preparing upload of assets for %ld asset collections.", buf, 0x16u);
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(obj, "count"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSASStateMachine _assetUploader](self, "_assetUploader");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __70__MSASStateMachine__continueAddingAssetCollectionsDisposition_params___block_invoke;
    v50[3] = &unk_1E95BB990;
    v50[4] = self;
    v51 = obj;
    v52 = v22;
    v53 = v23;
    v54 = v36;
    v55 = v40;
    v25 = v23;
    v26 = v22;
    objc_msgSend(v24, "registerAssetCollections:completionBlock:", v51, v50);

LABEL_30:
  }

}

- (void)_sendUploadCompleteDisposition:(int)a3 params:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  CFAbsoluteTime v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _QWORD block[4];
  id v57;
  MSASStateMachine *v58;
  id v59;
  id v60;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _QWORD v70[5];
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  _BYTE v76[128];
  _BYTE v77[128];
  _BYTE v78[128];
  uint8_t v79[128];
  uint8_t buf[4];
  MSASStateMachine *v81;
  __int16 v82;
  uint64_t v83;
  __int16 v84;
  uint64_t v85;
  __int16 v86;
  CFAbsoluteTime v87;
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(v6, "objectForKey:", CFSTR("successfulAssetCollections"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("failedAssetCollectionsAndErrors"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("album"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("info"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 2)
  {
    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    v14 = v46;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v66, v79, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v67;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v67 != v16)
            objc_enumerationMutation(v14);
          -[MSASStateMachine _deleteAssetFilesInAssetCollection:](self, "_deleteAssetFilesInAssetCollection:", *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * v17++), v44);
        }
        while (v15 != v17);
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v66, v79, 16);
      }
      while (v15);
    }

    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v18 = v47;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v62, v78, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v63;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v63 != v20)
            objc_enumerationMutation(v18);
          -[MSASStateMachine _deleteAssetFilesInAssetCollection:](self, "_deleteAssetFilesInAssetCollection:", *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * v21++), v44);
        }
        while (v19 != v21);
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v62, v78, 16);
      }
      while (v19);
    }

    -[MSASStateMachine eventQueue](self, "eventQueue");
    v22 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__MSASStateMachine__sendUploadCompleteDisposition_params___block_invoke_3;
    block[3] = &unk_1E95BCE80;
    v23 = v14;
    v57 = v23;
    v58 = self;
    v59 = v45;
    v60 = v44;
    v24 = v18;
    v61 = v24;
    dispatch_async(v22, block);

    -[MSASStateMachine _model](self, "_model");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "beginTransaction");

    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v26 = v23;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v52, v77, 16);
    if (v27)
    {
      v28 = *(_QWORD *)v53;
      do
      {
        v29 = 0;
        do
        {
          if (*(_QWORD *)v53 != v28)
            objc_enumerationMutation(v26);
          v30 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v29);
          -[MSASStateMachine _model](self, "_model", v44);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "GUID");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "requeuePendingAssetCollectionGUID:", v32);

          -[MSASStateMachine _deleteAssetFilesInAssetCollection:](self, "_deleteAssetFilesInAssetCollection:", v30);
          ++v29;
        }
        while (v27 != v29);
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v52, v77, 16);
      }
      while (v27);
    }

    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v33 = v24;
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v48, v76, 16);
    if (v34)
    {
      v35 = *(_QWORD *)v49;
      do
      {
        v36 = 0;
        do
        {
          if (*(_QWORD *)v49 != v35)
            objc_enumerationMutation(v33);
          v37 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v36);
          -[MSASStateMachine _model](self, "_model", v44);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "GUID");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "requeuePendingAssetCollectionGUID:", v39);

          -[MSASStateMachine _deleteAssetFilesInAssetCollection:](self, "_deleteAssetFilesInAssetCollection:", v37);
          ++v36;
        }
        while (v34 != v36);
        v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v48, v76, 16);
      }
      while (v34);
    }

    -[MSASStateMachine _model](self, "_model");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "endTransaction");

    -[MSASStateMachine _assetUploader](self, "_assetUploader");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "unregisterAssetCollections:", v26);

    -[MSASStateMachine _assetUploader](self, "_assetUploader");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "allKeys");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "unregisterAssetCollections:", v43);

  }
  else if (!a3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_msgSend(v46, "count", v44);
      v8 = objc_msgSend(v47, "count");
      v9 = CFAbsoluteTimeGetCurrent() - self->_startOfUpload;
      *(_DWORD *)buf = 138544130;
      v81 = self;
      v82 = 2048;
      v83 = v7;
      v84 = 2048;
      v85 = v8;
      v86 = 2048;
      v87 = v9;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Sending upload complete for %ld successful photos, and %ld failed photos. Took %.2fs to upload", buf, 0x2Au);
    }
    -[MSASStateMachine protocol](self, "protocol", v44);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stopHandlerBlock");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSASStateMachine _setStopHandlerBlock:](self, "_setStopHandlerBlock:", v11);

    objc_initWeak((id *)buf, self);
    -[MSASStateMachine protocol](self, "protocol");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "allKeys");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v70[0] = MEMORY[0x1E0C809B0];
    v70[1] = 3221225472;
    v70[2] = __58__MSASStateMachine__sendUploadCompleteDisposition_params___block_invoke;
    v70[3] = &unk_1E95BB9E0;
    v70[4] = self;
    objc_copyWeak(&v75, (id *)buf);
    v71 = v46;
    v72 = v45;
    v73 = v44;
    v74 = v47;
    objc_msgSend(v12, "sendUploadCompleteSuccessfulAssetCollections:failedAssetCollections:album:completionBlock:", v71, v13, v72, v70);

    objc_destroyWeak(&v75);
    objc_destroyWeak((id *)buf);
  }

}

- (void)_sendPutAssetCollectionsDisposition:(int)a3 params:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD block[4];
  id v30;
  MSASStateMachine *v31;
  id v32;
  id v33;
  _QWORD v34[5];
  id v35;
  id v36;
  id v37;
  id v38;
  uint8_t v39[128];
  uint8_t buf[4];
  MSASStateMachine *v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(v6, "objectForKey:", CFSTR("successfulAssetCollections"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("album"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("info"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 2)
  {
    -[MSASStateMachine eventQueue](self, "eventQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__MSASStateMachine__sendPutAssetCollectionsDisposition_params___block_invoke_7;
    block[3] = &unk_1E95BCE58;
    v15 = v23;
    v30 = v15;
    v31 = self;
    v32 = v7;
    v33 = v24;
    dispatch_async(v14, block);

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v16 = v15;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v39, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v26;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v26 != v18)
            objc_enumerationMutation(v16);
          v20 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v19);
          -[MSASStateMachine _model](self, "_model");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "GUID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "requeuePendingAssetCollectionGUID:", v22);

          -[MSASStateMachine _deleteAssetFilesInAssetCollection:](self, "_deleteAssetFilesInAssetCollection:", v20);
          ++v19;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v39, 16);
      }
      while (v17);
    }

  }
  else if (!a3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v41 = self;
      v42 = 2048;
      v43 = objc_msgSend(v23, "count");
      v44 = 2114;
      v45 = v7;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Adding %ld photos to album %{public}@.", buf, 0x20u);
    }
    -[MSASStateMachine protocol](self, "protocol");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stopHandlerBlock");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSASStateMachine _setStopHandlerBlock:](self, "_setStopHandlerBlock:", v9);

    objc_initWeak((id *)buf, self);
    -[MSASStateMachine delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "GUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "MSASStateMachineDidRequestAlbumURLStringForAlbumWithGUID:info:", v11, v24);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[MSASStateMachine protocol](self, "protocol");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __63__MSASStateMachine__sendPutAssetCollectionsDisposition_params___block_invoke;
    v34[3] = &unk_1E95BBA30;
    v34[4] = self;
    objc_copyWeak(&v38, (id *)buf);
    v35 = v6;
    v36 = v7;
    v37 = v24;
    objc_msgSend(v13, "putAssetCollections:intoAlbum:albumURLString:completionBlock:", v23, v36, v12, v34);

    objc_destroyWeak(&v38);
    objc_destroyWeak((id *)buf);
  }

}

- (void)_sendGetUploadTokensDisposition:(int)a3 params:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  _QWORD block[5];
  id v33;
  id v34;
  id v35;
  _QWORD v36[5];
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id location;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v31 = a4;
  objc_msgSend(v31, "objectForKey:", CFSTR("assetCollection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "objectForKey:", CFSTR("album"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "objectForKey:", CFSTR("info"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v6, "assets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "arrayWithCapacity:", objc_msgSend(v8, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  objc_msgSend(v6, "assets");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v44 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        objc_msgSend(v14, "MMCSAccessHeader");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15 == 0;

        if (v16)
          objc_msgSend(v9, "addObject:", v14);
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    }
    while (v11);
  }

  if (a3 == 2)
  {
    -[MSASStateMachine eventQueue](self, "eventQueue");
    v25 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__MSASStateMachine__sendGetUploadTokensDisposition_params___block_invoke_3_244;
    block[3] = &unk_1E95BCE58;
    block[4] = self;
    v26 = v6;
    v33 = v26;
    v34 = v30;
    v35 = v29;
    dispatch_async(v25, block);

    -[MSASStateMachine _model](self, "_model");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "GUID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "requeuePendingAssetCollectionGUID:", v28);

    -[MSASStateMachine _deleteAssetFilesInAssetCollection:](self, "_deleteAssetFilesInAssetCollection:", v26);
  }
  else if (!a3)
  {
    -[MSASStateMachine protocol](self, "protocol");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stopHandlerBlock");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSASStateMachine _setStopHandlerBlock:](self, "_setStopHandlerBlock:", v18);

    objc_initWeak(&location, self);
    -[MSASStateMachine delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "GUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "MSASStateMachineDidRequestAlbumURLStringForAlbumWithGUID:info:", v20, v29);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    -[MSASStateMachine protocol](self, "protocol");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "GUID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "GUID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __59__MSASStateMachine__sendGetUploadTokensDisposition_params___block_invoke;
    v36[3] = &unk_1E95BBA58;
    v36[4] = self;
    objc_copyWeak(&v41, &location);
    v37 = v9;
    v38 = v6;
    v39 = v30;
    v40 = v29;
    objc_msgSend(v22, "getUploadTokens:forAssetCollectionWithGUID:inAlbumWithGUID:albumURLString:completionBlock:", v37, v23, v24, v21, v36);

    objc_destroyWeak(&v41);
    objc_destroyWeak(&location);
  }

}

- (void)addSharingRelationships:(id)a3 toOwnedAlbum:(id)a4 info:(id)a5
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
  id v18;
  MSASStateMachine *v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[MSASStateMachine workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __62__MSASStateMachine_addSharingRelationships_toOwnedAlbum_info___block_invoke;
  v15[3] = &unk_1E95BCE58;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v19 = self;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

- (void)_addSharingRelationshipsDisposition:(int)a3 params:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  MSASStateMachine *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(v6, "objectForKey:", CFSTR("sharingRelationships"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("album"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("info"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 2)
  {
    -[MSASStateMachine eventQueue](self, "eventQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __63__MSASStateMachine__addSharingRelationshipsDisposition_params___block_invoke_3;
    v14[3] = &unk_1E95BCE58;
    v14[4] = self;
    v15 = v7;
    v16 = v8;
    v17 = v9;
    dispatch_async(v13, v14);

  }
  else if (!a3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v24 = self;
      v25 = 2048;
      v26 = objc_msgSend(v7, "count");
      v27 = 2114;
      v28 = v8;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Adding %ld sharing relationships to album %{public}@", buf, 0x20u);
    }
    -[MSASStateMachine protocol](self, "protocol");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stopHandlerBlock");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSASStateMachine _setStopHandlerBlock:](self, "_setStopHandlerBlock:", v11);

    objc_initWeak((id *)buf, self);
    -[MSASStateMachine protocol](self, "protocol");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __63__MSASStateMachine__addSharingRelationshipsDisposition_params___block_invoke;
    v18[3] = &unk_1E95BBA88;
    objc_copyWeak(&v22, (id *)buf);
    v19 = v8;
    v20 = v7;
    v21 = v9;
    objc_msgSend(v12, "addSharingRelationships:toAlbum:completionBlock:", v20, v19, v18);

    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);
  }

}

- (void)removeSharingRelationships:(id)a3 fromOwnedAlbum:(id)a4 info:(id)a5
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
  id v18;
  MSASStateMachine *v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[MSASStateMachine workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __67__MSASStateMachine_removeSharingRelationships_fromOwnedAlbum_info___block_invoke;
  v15[3] = &unk_1E95BCE58;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v19 = self;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

- (void)_removeSharingRelationshipsDisposition:(int)a3 params:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _QWORD block[4];
  id v15;
  MSASStateMachine *v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  MSASStateMachine *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(v6, "objectForKey:", CFSTR("sharingRelationships"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("album"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("info"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 2)
  {
    -[MSASStateMachine eventQueue](self, "eventQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66__MSASStateMachine__removeSharingRelationshipsDisposition_params___block_invoke_3;
    block[3] = &unk_1E95BCE58;
    v15 = v7;
    v16 = self;
    v17 = v8;
    v18 = v9;
    dispatch_async(v13, block);

  }
  else if (!a3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v25 = self;
      v26 = 2048;
      v27 = objc_msgSend(v7, "count");
      v28 = 2114;
      v29 = v8;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Removing %ld sharing relationships from album %{public}@", buf, 0x20u);
    }
    -[MSASStateMachine protocol](self, "protocol");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stopHandlerBlock");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSASStateMachine _setStopHandlerBlock:](self, "_setStopHandlerBlock:", v11);

    objc_initWeak((id *)buf, self);
    -[MSASStateMachine protocol](self, "protocol");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __66__MSASStateMachine__removeSharingRelationshipsDisposition_params___block_invoke;
    v19[3] = &unk_1E95BB8F8;
    v19[4] = self;
    objc_copyWeak(&v23, (id *)buf);
    v20 = v8;
    v21 = v7;
    v22 = v9;
    objc_msgSend(v12, "removeSharingRelationships:fromAlbum:completionBlock:", v21, v20, v19);

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
  }

}

- (void)addComments:(id)a3 toAssetCollection:(id)a4 inAlbum:(id)a5 info:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[MSASStateMachine workQueue](self, "workQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__MSASStateMachine_addComments_toAssetCollection_inAlbum_info___block_invoke;
  block[3] = &unk_1E95BCE80;
  block[4] = self;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  dispatch_async(v14, block);

}

- (void)_addCommentDisposition:(int)a3 params:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  _QWORD block[5];
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  uint8_t buf[4];
  MSASStateMachine *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(v6, "objectForKey:", CFSTR("comment"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("assetCollection"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("album"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("info"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("error"));
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (a3 == 2)
  {
    -[MSASStateMachine eventQueue](self, "eventQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __50__MSASStateMachine__addCommentDisposition_params___block_invoke_3;
    v22[3] = &unk_1E95BCE80;
    v22[4] = self;
    v23 = v21;
    v24 = v7;
    v25 = v8;
    v26 = v9;
    dispatch_async(v13, v22);

  }
  else if (!a3)
  {
    if (v10)
    {
      -[MSASStateMachine eventQueue](self, "eventQueue");
      v12 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __50__MSASStateMachine__addCommentDisposition_params___block_invoke;
      block[3] = &unk_1E95BC758;
      block[4] = self;
      v35 = v21;
      v36 = v7;
      v37 = v8;
      v38 = v9;
      v39 = v11;
      dispatch_async(v12, block);

      -[MSASStateMachine workQueueDidFinishCommand](self, "workQueueDidFinishCommand");
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "GUID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v41 = self;
        v42 = 2114;
        v43 = v21;
        v44 = 2114;
        v45 = v14;
        v46 = 2114;
        v47 = v8;
        _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Adding comment %{public}@ to asset collection %{public}@ in album %{public}@.", buf, 0x2Au);

      }
      -[MSASStateMachine protocol](self, "protocol");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stopHandlerBlock");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[MSASStateMachine _setStopHandlerBlock:](self, "_setStopHandlerBlock:", v16);

      objc_initWeak((id *)buf, self);
      -[MSASStateMachine delegate](self, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "GUID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "MSASStateMachineDidRequestAlbumURLStringForAlbumWithGUID:info:", v18, v9);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      -[MSASStateMachine protocol](self, "protocol");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __50__MSASStateMachine__addCommentDisposition_params___block_invoke_257;
      v27[3] = &unk_1E95BBAD8;
      objc_copyWeak(&v33, (id *)buf);
      v28 = v6;
      v29 = v8;
      v30 = v7;
      v31 = v21;
      v32 = v9;
      objc_msgSend(v20, "addComment:toAssetCollection:inAlbum:albumURLString:completionBlock:", v31, v30, v29, v19, v27);

      objc_destroyWeak(&v33);
      objc_destroyWeak((id *)buf);
    }
  }

}

- (void)scheduleEvent:(id)a3 assetCollectionGUID:(id)a4 albumGUID:(id)a5 info:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  MSASStateMachine *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138544130;
    v25 = self;
    v26 = 2114;
    v27 = v10;
    v28 = 2114;
    v29 = v11;
    v30 = 2114;
    v31 = v12;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Scheduling event to fire: %{public}@, asset collection GUID: %{public}@ album GUID: %{public}@", buf, 0x2Au);
  }
  -[MSASStateMachine workQueue](self, "workQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__MSASStateMachine_scheduleEvent_assetCollectionGUID_albumGUID_info___block_invoke;
  block[3] = &unk_1E95BCE80;
  block[4] = self;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  dispatch_async(v14, block);

}

- (void)_scheduleEventDisposition:(int)a3 params:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD block[5];
  id v13;
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  MSASStateMachine *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(v6, "objectForKey:", CFSTR("event"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("assetCollectionGUID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("albumGUID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("info"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!a3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544130;
      v18 = self;
      v19 = 2114;
      v20 = v7;
      v21 = 2114;
      v22 = v8;
      v23 = 2114;
      v24 = v9;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Event fired: %{public}@ for assetCollectionGUID: %{public}@, albumGUID: %{public}@", buf, 0x2Au);
    }
    -[MSASStateMachine eventQueue](self, "eventQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__MSASStateMachine__scheduleEventDisposition_params___block_invoke;
    block[3] = &unk_1E95BCE80;
    block[4] = self;
    v13 = v7;
    v14 = v8;
    v15 = v9;
    v16 = v10;
    dispatch_async(v11, block);

    -[MSASStateMachine workQueueDidFinishCommand](self, "workQueueDidFinishCommand");
  }

}

- (void)setPublicAccessEnabled:(BOOL)a3 forAlbum:(id)a4 info:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  BOOL v21;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[MSASStateMachine workQueue](self, "workQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__MSASStateMachine_setPublicAccessEnabled_forAlbum_info_completionBlock___block_invoke;
  block[3] = &unk_1E95BC5A8;
  v21 = a3;
  block[4] = self;
  v18 = v10;
  v19 = v11;
  v20 = v12;
  v14 = v11;
  v15 = v12;
  v16 = v10;
  dispatch_async(v13, block);

}

- (void)setMultipleContributorsEnabled:(BOOL)a3 forAlbum:(id)a4 info:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  BOOL v21;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[MSASStateMachine workQueue](self, "workQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__MSASStateMachine_setMultipleContributorsEnabled_forAlbum_info_completionBlock___block_invoke;
  block[3] = &unk_1E95BC5A8;
  v21 = a3;
  block[4] = self;
  v18 = v10;
  v19 = v11;
  v20 = v12;
  v14 = v11;
  v15 = v12;
  v16 = v10;
  dispatch_async(v13, block);

}

- (void)videoURLForAssetCollection:(id)a3 inAlbum:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[MSASStateMachine workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __71__MSASStateMachine_videoURLForAssetCollection_inAlbum_completionBlock___block_invoke;
  v15[3] = &unk_1E95BBB58;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

- (void)videoURLsForAssetCollection:(id)a3 forMediaAssetType:(unint64_t)a4 inAlbum:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  unint64_t v21;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  -[MSASStateMachine workQueue](self, "workQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90__MSASStateMachine_videoURLsForAssetCollection_forMediaAssetType_inAlbum_completionBlock___block_invoke;
  block[3] = &unk_1E95BBEE0;
  block[4] = self;
  v18 = v10;
  v20 = v12;
  v21 = a4;
  v19 = v11;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(v13, block);

}

- (void)_deleteAssetFilesInAssetCollection:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  MSASStateMachine *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v3, "GUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v28 = self;
    v29 = 2114;
    v30 = v4;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Cleaning up files for asset collection %{public}@.", buf, 0x16u);

  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v20 = v3;
  objc_msgSend(v3, "assets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    v9 = MEMORY[0x1E0C81028];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x1D8255C20]();
        objc_msgSend(v11, "path");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v11, "path");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v28 = self;
            v29 = 2112;
            v30 = v17;
            _os_log_debug_impl(&dword_1D3E94000, v9, OS_LOG_TYPE_DEBUG, "%{public}@: Deleting asset file: %@", buf, 0x16u);

          }
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "path");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = 0;
          objc_msgSend(v14, "removeItemAtPath:error:", v15, &v22);
          v16 = v22;

          if (v16 && os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v11, "path");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "MSVerboseDescription");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v28 = self;
            v29 = 2112;
            v30 = v18;
            v31 = 2114;
            v32 = v19;
            _os_log_debug_impl(&dword_1D3E94000, v9, OS_LOG_TYPE_DEBUG, "%{public}@: Failed to delete asset file at path %@. Error: %{public}@", buf, 0x20u);

          }
        }
        objc_autoreleasePoolPop(v12);
        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
    }
    while (v7);
  }

}

- (void)_deleteAssetFilesInAssetCollections:(id)a3
{
  id v4;
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
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[MSASStateMachine _deleteAssetFilesInAssetCollection:](self, "_deleteAssetFilesInAssetCollection:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)MSASAssetUploader:(id)a3 didFinishUploadingAssetCollection:(id)a4 intoAlbum:(id)a5 error:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  -[MSASStateMachine workQueue](self, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __88__MSASStateMachine_MSASAssetUploader_didFinishUploadingAssetCollection_intoAlbum_error___block_invoke;
  v16[3] = &unk_1E95BCE58;
  v16[4] = self;
  v17 = v9;
  v18 = v10;
  v19 = v11;
  v13 = v11;
  v14 = v10;
  v15 = v9;
  dispatch_async(v12, v16);

}

- (void)retrieveAssets:(id)a3 inAlbumWithGUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint8_t buf[4];
  MSASStateMachine *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543874;
    v15 = self;
    v16 = 2048;
    v17 = objc_msgSend(v6, "count");
    v18 = 2114;
    v19 = v7;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Retrieving %ld assets in albumGUID %{public}@.", buf, 0x20u);
  }
  -[MSASStateMachine _assetDownloader](self, "_assetDownloader");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __51__MSASStateMachine_retrieveAssets_inAlbumWithGUID___block_invoke;
  v11[3] = &unk_1E95BCE30;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "registerAssets:completionBlock:", v10, v11);

}

- (void)MSASAssetDownloader:(id)a3 willBeginBatchCount:(unint64_t)a4
{
  NSObject *v5;
  _QWORD block[5];

  -[MSASStateMachine workQueue](self, "workQueue", a3, a4);
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__MSASStateMachine_MSASAssetDownloader_willBeginBatchCount___block_invoke;
  block[3] = &unk_1E95BCED0;
  block[4] = self;
  dispatch_async(v5, block);

}

- (void)MSASAssetDownloader:(id)a3 didFinishDownloadingAsset:(id)a4 inAlbumGUID:(id)a5 error:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  -[MSASStateMachine workQueue](self, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __84__MSASStateMachine_MSASAssetDownloader_didFinishDownloadingAsset_inAlbumGUID_error___block_invoke;
  v16[3] = &unk_1E95BCE58;
  v16[4] = self;
  v17 = v10;
  v18 = v11;
  v19 = v9;
  v13 = v9;
  v14 = v11;
  v15 = v10;
  dispatch_async(v12, v16);

}

- (void)workQueueScheduleReauthForAssets:(id)a3 inAlbum:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  MSASStateMachine *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v14 = 138543874;
    v15 = self;
    v16 = 2048;
    v17 = objc_msgSend(v6, "count");
    v18 = 2114;
    v19 = v7;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Scheduling reauthorization for %ld items in album %{public}@", (uint8_t *)&v14, 0x20u);
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
    objc_msgSend(v8, "setObject:forKey:", v7, CFSTR("album"));
  if (v6)
    objc_msgSend(v9, "setObject:forKey:", v6, CFSTR("assets"));
  -[MSASStateMachine _model](self, "_model");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel__sendReauthorizeAssetsForDownloadDisposition_params_);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASStateMachine personID](self, "personID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "GUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "enqueueCommandAtHeadOfQueue:params:personID:albumGUID:assetCollectionGUID:", v11, v9, v12, v13, 0);

  -[MSASStateMachine workQueueRetryOutstandingActivities](self, "workQueueRetryOutstandingActivities");
}

- (void)_sendReauthorizeAssetsForDownloadDisposition:(int)a3 params:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  MSASStateMachine *v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD block[4];
  id v29;
  MSASStateMachine *v30;
  id v31;
  id v32;
  uint8_t buf[4];
  MSASStateMachine *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(v6, "objectForKey:", CFSTR("assets"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("album"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("error"));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (a3 == 2)
  {
    -[MSASStateMachine eventQueue](self, "eventQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __72__MSASStateMachine__sendReauthorizeAssetsForDownloadDisposition_params___block_invoke_286;
    v19[3] = &unk_1E95BCE30;
    v20 = v7;
    v21 = self;
    v22 = v8;
    dispatch_async(v12, v19);

  }
  else if (!a3)
  {
    if (v9)
    {
      -[MSASStateMachine eventQueue](self, "eventQueue");
      v11 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __72__MSASStateMachine__sendReauthorizeAssetsForDownloadDisposition_params___block_invoke;
      block[3] = &unk_1E95BCE58;
      v29 = v7;
      v30 = self;
      v31 = v8;
      v32 = v10;
      dispatch_async(v11, block);

      -[MSASStateMachine workQueueDidFinishCommand](self, "workQueueDidFinishCommand");
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v34 = self;
        v35 = 2048;
        v36 = objc_msgSend(v7, "count");
        v37 = 2114;
        v38 = v8;
        _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Reauthorizing %ld assets download from album %{public}@", buf, 0x20u);
      }
      -[MSASStateMachine protocol](self, "protocol");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stopHandlerBlock");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[MSASStateMachine _setStopHandlerBlock:](self, "_setStopHandlerBlock:", v14);

      objc_initWeak((id *)buf, self);
      -[MSASStateMachine delegate](self, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "GUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "MSASStateMachineDidRequestAlbumURLStringForAlbumWithGUID:info:", v16, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      -[MSASStateMachine protocol](self, "protocol");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __72__MSASStateMachine__sendReauthorizeAssetsForDownloadDisposition_params___block_invoke_282;
      v23[3] = &unk_1E95BBC28;
      v23[4] = self;
      objc_copyWeak(&v27, (id *)buf);
      v24 = v6;
      v25 = v8;
      v26 = v7;
      objc_msgSend(v18, "getTokensForAssets:inAlbum:albumURLString:completionBlock:", v26, v25, v17, v23);

      objc_destroyWeak(&v27);
      objc_destroyWeak((id *)buf);
    }
  }

}

- (void)MSASAssetDownloaderDidFinishBatch:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[MSASStateMachine workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__MSASStateMachine_MSASAssetDownloaderDidFinishBatch___block_invoke;
  block[3] = &unk_1E95BCED0;
  block[4] = self;
  dispatch_async(v4, block);

}

- (MSAlbumSharingDaemon)daemon
{
  return (MSAlbumSharingDaemon *)objc_loadWeakRetained((id *)&self->_daemon);
}

- (NSString)personID
{
  return self->_personID;
}

- (void)setPersonID:(id)a3
{
  objc_storeStrong((id *)&self->_personID, a3);
}

- (id)delegate
{
  return objc_loadWeakRetained(&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->_delegate, a3);
}

- (int)maxMetadataRetryCount
{
  return self->_maxMetadataRetryCount;
}

- (void)setMaxMetadataRetryCount:(int)a3
{
  self->_maxMetadataRetryCount = a3;
}

- (NSString)focusAlbumGUID
{
  return self->_focusAlbumGUID;
}

- (NSString)focusAssetCollectionGUID
{
  return self->_focusAssetCollectionGUID;
}

- (BOOL)isRetryingOutstandingActivities
{
  return self->_isRetryingOutstandingActivities;
}

- (void)setIsRetryingOutstandingActivities:(BOOL)a3
{
  self->_isRetryingOutstandingActivities = a3;
}

- (NSMutableArray)_assetInfoToReauthForDownload
{
  return self->_assetInfoToReauthForDownload;
}

- (void)_setAssetInfoToReauthForDownload:(id)a3
{
  objc_storeStrong((id *)&self->_assetInfoToReauthForDownload, a3);
}

- (id)_stopHandlerBlock
{
  return self->_stopHandlerBlock;
}

- (void)_setStopHandlerBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (void)setProtocol:(id)a3
{
  objc_storeStrong((id *)&self->_protocol, a3);
}

- (void)setPhoneInvitations:(id)a3
{
  objc_storeStrong((id *)&self->_phoneInvitations, a3);
}

- (MSImageScalingSpecification)derivativeImageScalingSpecification
{
  return self->_derivativeImageScalingSpecification;
}

- (MSImageScalingSpecification)thumbnailImageScalingSpecification
{
  return self->_thumbnailImageScalingSpecification;
}

- (NSArray)derivativeSpecifications
{
  return self->_derivativeSpecifications;
}

- (BOOL)hasShutDown
{
  return self->_hasShutDown;
}

- (void)setHasShutDown:(BOOL)a3
{
  self->_hasShutDown = a3;
}

- (NSDictionary)metadataBackoffManagerParameters
{
  return self->_metadataBackoffManagerParameters;
}

- (void)setMetadataBackoffManagerParameters:(id)a3
{
  objc_storeStrong((id *)&self->_metadataBackoffManagerParameters, a3);
}

- (NSDictionary)MMCSBackoffManagerParameters
{
  return self->_MMCSBackoffManagerParameters;
}

- (void)setMMCSBackoffManagerParameters:(id)a3
{
  objc_storeStrong((id *)&self->_MMCSBackoffManagerParameters, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (OS_dispatch_queue)eventQueue
{
  return self->_eventQueue;
}

- (void)setEventQueue:(id)a3
{
  objc_storeStrong((id *)&self->_eventQueue, a3);
}

- (OS_dispatch_queue)serverSideConfigQueue
{
  return self->_serverSideConfigQueue;
}

- (void)setServerSideConfigQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serverSideConfigQueue, a3);
}

- (OS_dispatch_queue)memberQueue
{
  return self->_memberQueue;
}

- (void)setMemberQueue:(id)a3
{
  objc_storeStrong((id *)&self->_memberQueue, a3);
}

- (id)postCommandCompletionBlock
{
  return self->_postCommandCompletionBlock;
}

- (void)setPostCommandCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_postCommandCompletionBlock, 0);
  objc_storeStrong((id *)&self->_memberQueue, 0);
  objc_storeStrong((id *)&self->_serverSideConfigQueue, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_MMCSBackoffManagerParameters, 0);
  objc_storeStrong((id *)&self->_metadataBackoffManagerParameters, 0);
  objc_storeStrong((id *)&self->_derivativeSpecifications, 0);
  objc_storeStrong((id *)&self->_thumbnailImageScalingSpecification, 0);
  objc_storeStrong((id *)&self->_derivativeImageScalingSpecification, 0);
  objc_storeStrong((id *)&self->_phoneInvitations, 0);
  objc_storeStrong((id *)&self->_protocol, 0);
  objc_storeStrong(&self->_stopHandlerBlock, 0);
  objc_storeStrong((id *)&self->_assetInfoToReauthForDownload, 0);
  objc_storeStrong((id *)&self->_focusAssetCollectionGUID, 0);
  objc_storeStrong((id *)&self->_focusAlbumGUID, 0);
  objc_storeStrong((id *)&self->_serverSideConfigurationVersion, 0);
  objc_storeStrong((id *)&self->_serverSideConfiguration, 0);
  objc_destroyWeak(&self->_delegate);
  objc_storeStrong((id *)&self->_personID, 0);
  objc_destroyWeak((id *)&self->_daemon);
  objc_storeStrong((id *)&self->_assetDownloader, 0);
  objc_storeStrong((id *)&self->_assetUploader, 0);
  objc_storeStrong((id *)&self->_MMCSBackoffManager, 0);
  objc_storeStrong((id *)&self->_metadataBackoffManager, 0);
  objc_storeStrong((id *)&self->_currentCommandParams, 0);
  objc_storeStrong((id *)&self->_currentCommand, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

uint64_t __54__MSASStateMachine_MSASAssetDownloaderDidFinishBatch___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v1 = a1;
  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_assetInfoToReauthForDownload");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (!v3)
    return objc_msgSend(*(id *)(v1 + 32), "_setAssetInfoToReauthForDownload:", 0);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v24 = v1;
  objc_msgSend(*(id *)(v1 + 32), "_assetInfoToReauthForDownload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (!v6)
  {
    v8 = 0;
    goto LABEL_17;
  }
  v7 = v6;
  v8 = 0;
  v9 = *(_QWORD *)v26;
  do
  {
    v10 = 0;
    v11 = v8;
    do
    {
      if (*(_QWORD *)v26 != v9)
        objc_enumerationMutation(v5);
      v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v10);
      if (v11
        && (objc_msgSend(v11, "album"),
            v13 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v12, "album"),
            v14 = (void *)objc_claimAutoreleasedReturnValue(),
            v15 = objc_msgSend(v13, "isEqual:", v14),
            v14,
            v13,
            !v15))
      {
        if (!objc_msgSend(v4, "count"))
          goto LABEL_13;
        v17 = *(void **)(v24 + 32);
        objc_msgSend(v11, "album");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "workQueueScheduleReauthForAssets:inAlbum:", v4, v18);

        v19 = (void *)MEMORY[0x1E0C99DE8];
        objc_msgSend(v12, "asset");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "arrayWithObject:", v16);
        v20 = objc_claimAutoreleasedReturnValue();

        v4 = (void *)v20;
      }
      else
      {
        objc_msgSend(v12, "asset");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v16);
      }

LABEL_13:
      v8 = v12;

      ++v10;
      v11 = v8;
    }
    while (v7 != v10);
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  }
  while (v7);
LABEL_17:

  v1 = v24;
  if (objc_msgSend(v4, "count"))
  {
    v21 = *(void **)(v24 + 32);
    objc_msgSend(v8, "album");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "workQueueScheduleReauthForAssets:inAlbum:", v4, v22);

  }
  return objc_msgSend(*(id *)(v1 + 32), "_setAssetInfoToReauthForDownload:", 0);
}

void __72__MSASStateMachine__sendReauthorizeAssetsForDownloadDisposition_params___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
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
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v6);
        objc_msgSend(*(id *)(a1 + 40), "delegate", (_QWORD)v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "MSASStateMachine:didFinishRetrievingAsset:inAlbum:error:", *(_QWORD *)(a1 + 40), v7, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

void __72__MSASStateMachine__sendReauthorizeAssetsForDownloadDisposition_params___block_invoke_282(id *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(a1[4], "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __72__MSASStateMachine__sendReauthorizeAssetsForDownloadDisposition_params___block_invoke_2;
  v16[3] = &unk_1E95BB7D0;
  v17 = v7;
  v11 = v7;
  objc_copyWeak(&v24, a1 + 8);
  v18 = a1[5];
  v19 = a1[6];
  v12 = a1[7];
  v13 = a1[4];
  v20 = v12;
  v21 = v13;
  v22 = v9;
  v23 = v8;
  v14 = v8;
  v15 = v9;
  dispatch_async(v10, v16);

  objc_destroyWeak(&v24);
}

void __72__MSASStateMachine__sendReauthorizeAssetsForDownloadDisposition_params___block_invoke_286(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id obj;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v14 != v4)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        v7 = (void *)MEMORY[0x1D8255C20]();
        objc_msgSend(*(id *)(a1 + 40), "delegate");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = *(void **)(a1 + 40);
        v10 = *(_QWORD *)(a1 + 48);
        objc_msgSend(v9, "_canceledError");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "MSASStateMachine:didFinishRetrievingAsset:inAlbum:error:", v9, v6, v10, v11);

        objc_autoreleasePoolPop(v7);
      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v3);
  }

}

void __72__MSASStateMachine__sendReauthorizeAssetsForDownloadDisposition_params___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  id *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  id v17;
  void *v18;
  NSObject *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  int v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  uint64_t v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t i;
  NSObject *v54;
  id v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  NSObject *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  NSObject *v64;
  id v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  id v70;
  id v71;
  uint64_t v72;
  void *v73;
  void *v74;
  int v75;
  id *v76;
  void *v77;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _QWORD v83[4];
  id v84;
  id v85;
  id v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  _QWORD v99[4];
  id v100;
  _QWORD block[5];
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  _BYTE v106[128];
  _BYTE v107[128];
  _BYTE v108[128];
  _BYTE v109[128];
  uint8_t v110[128];
  uint8_t buf[4];
  id v112;
  __int16 v113;
  uint64_t v114;
  __int16 v115;
  void *v116;
  __int16 v117;
  void *v118;
  uint64_t v119;

  v119 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 32))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
    v2 = *(_QWORD *)(a1 + 32);
    NSStringFromSelector(sel__sendReauthorizeAssetsForDownloadDisposition_params_);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "GUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v2) = objc_msgSend(WeakRetained, "workQueueEndCommandWithError:command:params:albumGUID:assetCollectionGUID:", v2, v3, v4, v5, 0);

    if ((v2 & 1) != 0)
    {
      v75 = 0;
      goto LABEL_49;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v71 = objc_loadWeakRetained((id *)(a1 + 88));
      v72 = objc_msgSend(*(id *)(a1 + 56), "count");
      v73 = *(void **)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 32), "MSVerboseDescription");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v112 = v71;
      v113 = 2048;
      v114 = v72;
      v115 = 2114;
      v116 = v73;
      v117 = 2114;
      v118 = v74;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Failed to authorize %ld assets in album %{public}@. Error: %{public}@", buf, 0x2Au);

    }
    v104 = 0u;
    v105 = 0u;
    v102 = 0u;
    v103 = 0u;
    v50 = *(id *)(a1 + 56);
    v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v102, v110, 16);
    if (v51)
    {
      v52 = *(_QWORD *)v103;
      do
      {
        for (i = 0; i != v51; ++i)
        {
          if (*(_QWORD *)v103 != v52)
            objc_enumerationMutation(v50);
          objc_msgSend(v77, "setObject:forKey:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*((_QWORD *)&v102 + 1) + 8 * i));
        }
        v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v102, v110, 16);
      }
      while (v51);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 64), "memberQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__MSASStateMachine__sendReauthorizeAssetsForDownloadDisposition_params___block_invoke_283;
    block[3] = &unk_1E95BCED0;
    block[4] = *(_QWORD *)(a1 + 64);
    dispatch_barrier_sync(v6, block);

    objc_msgSend(*(id *)(a1 + 64), "eventQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v99[0] = v7;
    v99[1] = 3221225472;
    v99[2] = __72__MSASStateMachine__sendReauthorizeAssetsForDownloadDisposition_params___block_invoke_2_284;
    v99[3] = &unk_1E95BB300;
    v9 = (id *)(a1 + 88);
    objc_copyWeak(&v100, (id *)(a1 + 88));
    dispatch_async(v8, v99);

    objc_msgSend(v77, "addEntriesFromDictionary:", *(_QWORD *)(a1 + 72));
    if (objc_msgSend(*(id *)(a1 + 72), "count"))
    {
      v97 = 0u;
      v98 = 0u;
      v95 = 0u;
      v96 = 0u;
      v10 = *(id *)(a1 + 72);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v95, v109, 16);
      if (v11)
      {
        v12 = *(_QWORD *)v96;
        v13 = MEMORY[0x1E0C81028];
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v96 != v12)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * v14);
            v16 = v13;
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              v17 = objc_loadWeakRetained(v9);
              objc_msgSend(v15, "GUID");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v112 = v17;
              v113 = 2114;
              v114 = (uint64_t)v18;
              _os_log_error_impl(&dword_1D3E94000, v13, OS_LOG_TYPE_ERROR, "%{public}@: Failed to reauthorize asset GUID %{public}@ for redownload.", buf, 0x16u);

            }
            ++v14;
          }
          while (v11 != v14);
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v95, v109, 16);
        }
        while (v11);
      }

    }
    if (objc_msgSend(*(id *)(a1 + 80), "count"))
    {
      v19 = MEMORY[0x1E0C81028];
      v20 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v21 = objc_loadWeakRetained(v9);
        v22 = objc_msgSend(*(id *)(a1 + 80), "count");
        *(_DWORD *)buf = 138543618;
        v112 = v21;
        v113 = 2048;
        v114 = v22;
        _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Successfully reauthorized the download of %ld assets. Trying download again.", buf, 0x16u);

      }
      MSASPlatform();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "shouldLogAtLevel:", 7);

      if (v24)
      {
        v93 = 0u;
        v94 = 0u;
        v91 = 0u;
        v92 = 0u;
        v25 = *(id *)(a1 + 80);
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v91, v108, 16);
        if (v26)
        {
          v27 = *(_QWORD *)v92;
          v28 = MEMORY[0x1E0C81028];
          do
          {
            v29 = 0;
            do
            {
              if (*(_QWORD *)v92 != v27)
                objc_enumerationMutation(v25);
              v30 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * v29);
              v31 = v28;
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v30, "GUID");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v112 = v32;
                _os_log_debug_impl(&dword_1D3E94000, v28, OS_LOG_TYPE_DEBUG, " ...Asset GUID %{public}@", buf, 0xCu);

              }
              ++v29;
            }
            while (v26 != v29);
            v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v91, v108, 16);
          }
          while (v26);
        }

      }
      v33 = objc_loadWeakRetained(v9);
      objc_msgSend(v33, "_model");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "beginTransaction");

      v89 = 0u;
      v90 = 0u;
      v87 = 0u;
      v88 = 0u;
      v35 = *(id *)(a1 + 80);
      v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v87, v107, 16);
      if (v36)
      {
        v37 = *(_QWORD *)v88;
        do
        {
          for (j = 0; j != v36; ++j)
          {
            if (*(_QWORD *)v88 != v37)
              objc_enumerationMutation(v35);
            v39 = *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * j);
            v40 = objc_loadWeakRetained(v9);
            objc_msgSend(v40, "_model");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 48), "GUID");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "enqueueAssetForDownload:inAlbumWithGUID:", v39, v42);

            v43 = objc_loadWeakRetained(v9);
            objc_msgSend(v43, "_assetDownloader");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 48), "GUID");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "didEnqueueAsset:forAlbumGUID:", v39, v45);

          }
          v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v87, v107, 16);
        }
        while (v36);
      }

      v46 = objc_loadWeakRetained(v9);
      objc_msgSend(v46, "_model");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "endTransaction");

      v48 = objc_loadWeakRetained(v9);
      objc_msgSend(v48, "_assetDownloader");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "retryOutstandingActivities");

    }
    objc_destroyWeak(&v100);
  }
  v75 = 1;
LABEL_49:
  if (objc_msgSend(v77, "count"))
  {
    objc_msgSend(*(id *)(a1 + 64), "eventQueue");
    v54 = objc_claimAutoreleasedReturnValue();
    v83[0] = MEMORY[0x1E0C809B0];
    v83[1] = 3221225472;
    v83[2] = __72__MSASStateMachine__sendReauthorizeAssetsForDownloadDisposition_params___block_invoke_285;
    v83[3] = &unk_1E95BBC00;
    v55 = v77;
    v84 = v55;
    v76 = (id *)(a1 + 88);
    objc_copyWeak(&v86, (id *)(a1 + 88));
    v85 = *(id *)(a1 + 48);
    dispatch_async(v54, v83);

    v81 = 0u;
    v82 = 0u;
    v79 = 0u;
    v80 = 0u;
    v56 = v55;
    v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v79, v106, 16);
    if (v57)
    {
      v58 = *(_QWORD *)v80;
      v59 = MEMORY[0x1E0C81028];
      do
      {
        v60 = 0;
        do
        {
          if (*(_QWORD *)v80 != v58)
            objc_enumerationMutation(v56);
          v61 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * v60);
          v62 = (void *)MEMORY[0x1D8255C20]();
          objc_msgSend(v56, "objectForKey:", v61);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = v59;
          if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
          {
            v65 = objc_loadWeakRetained(v76);
            objc_msgSend(v63, "MSVerboseDescription");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v112 = v65;
            v113 = 2114;
            v114 = (uint64_t)v61;
            v115 = 2114;
            v116 = v66;
            _os_log_error_impl(&dword_1D3E94000, v59, OS_LOG_TYPE_ERROR, "%{public}@: Failed to reauthorize asset %{public}@. Error: %{public}@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v62);
          ++v60;
        }
        while (v57 != v60);
        v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v79, v106, 16);
      }
      while (v57);
    }

    v67 = objc_loadWeakRetained(v76);
    objc_msgSend(v67, "_assetDownloader");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "allKeys");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "unregisterAssets:", v69);

    objc_destroyWeak(&v86);
  }
  if (v75)
  {
    v70 = objc_loadWeakRetained((id *)(a1 + 88));
    objc_msgSend(v70, "workQueueDidFinishCommand");

  }
}

uint64_t __72__MSASStateMachine__sendReauthorizeAssetsForDownloadDisposition_params___block_invoke_283(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "reset");
}

void __72__MSASStateMachine__sendReauthorizeAssetsForDownloadDisposition_params___block_invoke_2_284(uint64_t a1)
{
  id *v1;
  void *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "daemon");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "personID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didReceiveAuthSuccessForPersonID:", v4);

}

void __72__MSASStateMachine__sendReauthorizeAssetsForDownloadDisposition_params___block_invoke_285(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  void *v7;
  id WeakRetained;
  void *v9;
  id v10;
  id obj;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v13 != v4)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
        objc_msgSend(WeakRetained, "delegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_loadWeakRetained((id *)(a1 + 48));
        objc_msgSend(v9, "MSASStateMachine:didFinishRetrievingAsset:inAlbum:error:", v10, v6, *(_QWORD *)(a1 + 40), v7);

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v3);
  }

}

void __84__MSASStateMachine_MSASAssetDownloader_didFinishDownloadingAsset_inAlbumGUID_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  MSASAssetInfoToReauthForDownload *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  id v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "MSASStateMachineDidRequestAlbumWithGUID:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(*(id *)(a1 + 48), "MMCSIsAuthorizationError") & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 48), "MSContainsErrorWithDomain:code:", CFSTR("MSASAssetTransferErrorDomain"), 2) & 1) != 0
    || objc_msgSend(*(id *)(a1 + 48), "MSContainsErrorWithDomain:code:", CFSTR("MSASAssetTransferErrorDomain"), 1))
  {
    v4 = objc_alloc_init(MSASAssetInfoToReauthForDownload);
    -[MSASAssetInfoToReauthForDownload setAsset:](v4, "setAsset:", *(_QWORD *)(a1 + 56));
    -[MSASAssetInfoToReauthForDownload setAlbum:](v4, "setAlbum:", v3);
    objc_msgSend(*(id *)(a1 + 32), "_assetInfoToReauthForDownload");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v4);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_assetDownloader");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", *(_QWORD *)(a1 + 56));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unregisterAssets:", v7);

    objc_msgSend(*(id *)(a1 + 32), "eventQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __84__MSASStateMachine_MSASAssetDownloader_didFinishDownloadingAsset_inAlbumGUID_error___block_invoke_2;
    v9[3] = &unk_1E95BCE58;
    v9[4] = *(_QWORD *)(a1 + 32);
    v10 = *(id *)(a1 + 56);
    v11 = v3;
    v12 = *(id *)(a1 + 48);
    dispatch_async(v8, v9);

  }
}

void __84__MSASStateMachine_MSASAssetDownloader_didFinishDownloadingAsset_inAlbumGUID_error___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "MSASStateMachine:didFinishRetrievingAsset:inAlbum:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

void __60__MSASStateMachine_MSASAssetDownloader_willBeginBatchCount___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_setAssetInfoToReauthForDownload:", v2);

}

void __51__MSASStateMachine_retrieveAssets_inAlbumWithGUID___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD block[5];
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__MSASStateMachine_retrieveAssets_inAlbumWithGUID___block_invoke_2;
  block[3] = &unk_1E95BCE30;
  v3 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = *(id *)(a1 + 48);
  dispatch_async(v2, block);

}

void __51__MSASStateMachine_retrieveAssets_inAlbumWithGUID___block_invoke_2(id *a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  _QWORD block[5];
  id v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "_model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beginTransaction");

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v3 = a1[5];
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v7);
        objc_msgSend(a1[4], "_model");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "enqueueAssetForDownload:inAlbumWithGUID:", v8, a1[6]);

        objc_msgSend(a1[4], "_assetDownloader");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "didEnqueueAsset:forAlbumGUID:", v8, a1[6]);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v5);
  }

  objc_msgSend(a1[4], "_model");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "endTransaction");

  objc_msgSend(a1[4], "eventQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__MSASStateMachine_retrieveAssets_inAlbumWithGUID___block_invoke_3;
  block[3] = &unk_1E95BCE30;
  v13 = a1[5];
  block[4] = a1[4];
  v16 = v13;
  v17 = a1[6];
  dispatch_async(v12, block);

  if ((objc_msgSend(a1[4], "hasShutDown") & 1) == 0)
  {
    objc_msgSend(a1[4], "_assetDownloader");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "retryOutstandingActivities");

  }
}

void __51__MSASStateMachine_retrieveAssets_inAlbumWithGUID___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "MSASStateMachine:didFinishEnqueueingAssetsForDownload:inAlbumWithGUID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __88__MSASStateMachine_MSASAssetUploader_didFinishUploadingAssetCollection_intoAlbum_error___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  __CFString **v22;
  id v23;
  void *v24;
  int v25;
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = a1[4];
  objc_msgSend(a1[5], "GUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v3, "MSASStateMachine:didQueryIsAssetCollectionWithGUIDInModel:", v4, v5);

  if ((v4 & 1) != 0)
  {
    v6 = a1[7];
    if (v6)
    {
      if (objc_msgSend(v6, "MMCSIsAuthorizationError"))
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        v9 = a1[6];
        if (v9)
          objc_msgSend(v7, "setObject:forKey:", v9, CFSTR("album"));
        v10 = a1[5];
        if (v10)
          objc_msgSend(v8, "setObject:forKey:", v10, CFSTR("assetCollection"));
        objc_msgSend(a1[4], "_model");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(sel__sendGetUploadTokensDisposition_params_);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[4], "personID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[6], "GUID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "enqueueCommand:params:personID:albumGUID:assetCollectionGUID:", v12, v8, v13, v14, 0);

        goto LABEL_17;
      }
      if ((objc_msgSend(a1[7], "MSContainsErrorWithDomain:code:", CFSTR("MSASAssetTransferErrorDomain"), 3) & 1) != 0)
      {
LABEL_16:
        objc_msgSend(v2, "setObject:forKey:", a1[6], CFSTR("album"));
        objc_msgSend(a1[4], "_model");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(sel__sendUploadCompleteDisposition_params_);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[4], "personID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[6], "GUID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "enqueueCommandAtHeadOfQueue:params:personID:albumGUID:assetCollectionGUID:", v11, v2, v12, v13, 0);
LABEL_17:

        goto LABEL_18;
      }
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKey:", a1[7], a1[5]);
      v22 = kMSASFailedAssetCollectionsAndErrorsKey;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", a1[5]);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = &kMSASSuccessfulAssetCollectionsKey;
    }
    objc_msgSend(v2, "setObject:forKey:", v21, *v22);

    goto LABEL_16;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v23 = a1[4];
    objc_msgSend(a1[5], "GUID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138543618;
    v26 = v23;
    v27 = 2114;
    v28 = v24;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: The uploaded asset collection GUID %{public}@ is no longer in the model. Discontiniuing upload.", (uint8_t *)&v25, 0x16u);

  }
  objc_msgSend(a1[4], "_deleteAssetFilesInAssetCollection:", a1[5]);
  objc_msgSend(a1[4], "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = a1[4];
  v16 = a1[5];
  v17 = a1[6];
  v18 = (void *)MEMORY[0x1E0CB35C8];
  v19 = (__CFString *)MSCFCopyLocalizedString(CFSTR("ERROR_STATE_PHOTO_NOT_IN_MODEL"));
  objc_msgSend(v18, "MSErrorWithDomain:code:description:", CFSTR("MSASStateMachineErrorDomain"), 5, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "MSASStateMachine:didFinishAddingAssetCollection:toAlbum:info:error:", v15, v16, v17, 0, v20);

LABEL_18:
  objc_msgSend(a1[4], "workQueueRetryOutstandingActivities");

}

void __90__MSASStateMachine_videoURLsForAssetCollection_forMediaAssetType_inAlbum_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v36 = v2;
    v37 = 2114;
    v38 = v3;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Getting video URL for asset collection %{public}@.", buf, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "GUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "MSASStateMachineDidRequestAlbumURLStringForAlbumWithGUID:info:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = 0u;
  v31 = 0u;
  v32 = 0u;
  v30 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "assets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v31;
LABEL_5:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v31 != v10)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v11);
      if (objc_msgSend(v12, "mediaAssetType") == *(_QWORD *)(a1 + 64))
        break;
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        if (v9)
          goto LABEL_5;
        goto LABEL_11;
      }
    }
    v13 = v12;

    if (v13)
      goto LABEL_14;
  }
  else
  {
LABEL_11:

  }
  objc_msgSend(*(id *)(a1 + 40), "assets");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "lastObject");
  v13 = (id)objc_claimAutoreleasedReturnValue();

LABEL_14:
  objc_msgSend(*(id *)(a1 + 32), "protocol");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "GUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "GUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __90__MSASStateMachine_videoURLsForAssetCollection_forMediaAssetType_inAlbum_completionBlock___block_invoke_274;
  v23[3] = &unk_1E95BBBD0;
  v23[4] = *(_QWORD *)(a1 + 32);
  v24 = *(id *)(a1 + 48);
  v25 = v6;
  v26 = v13;
  v18 = *(id *)(a1 + 40);
  v20 = *(void **)(a1 + 56);
  v19 = *(_QWORD *)(a1 + 64);
  v27 = v18;
  v29 = v19;
  v28 = v20;
  v21 = v13;
  v22 = v6;
  objc_msgSend(v15, "getVideoURL:forAssetCollectionWithGUID:inAlbumWithGUID:albumURLString:completionBlock:", v21, v16, v17, v22, v23);

}

void __90__MSASStateMachine_videoURLsForAssetCollection_forMediaAssetType_inAlbum_completionBlock___block_invoke_274(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v7 && objc_msgSend(v7, "MSContainsErrorWithDomain:code:", CFSTR("MSASProtocolErrorDomain"), 18))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v21 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v7, "MSVerboseDescription");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v34 = v21;
      v35 = 2114;
      v36 = v22;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Encountered visitor authentication failure. Getting new album URL. Error: %{public}@", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "protocol");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "GUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __90__MSASStateMachine_videoURLsForAssetCollection_forMediaAssetType_inAlbum_completionBlock___block_invoke_275;
    v25[3] = &unk_1E95BBBA8;
    v12 = *(id *)(a1 + 48);
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(a1 + 40);
    v26 = v12;
    v27 = v13;
    v28 = v14;
    v29 = *(id *)(a1 + 56);
    v15 = *(id *)(a1 + 64);
    v17 = *(void **)(a1 + 72);
    v16 = *(_QWORD *)(a1 + 80);
    v30 = v15;
    v32 = v16;
    v31 = v17;
    objc_msgSend(v10, "getAlbumURLForAlbumWithGUID:completionBlock:", v11, v25);

  }
  else
  {
    if (objc_msgSend(v8, "count"))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v18 = *(_QWORD *)(a1 + 32);
        v19 = *(_QWORD *)(a1 + 64);
        v20 = *(_QWORD *)(a1 + 80);
        *(_DWORD *)buf = 138544386;
        v34 = v18;
        v35 = 2114;
        v36 = v8;
        v37 = 2114;
        v38 = v9;
        v39 = 2114;
        v40 = v19;
        v41 = 2048;
        v42 = v20;
        _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Using video URLs %{public}@ with expiration %{public}@ for asset collection %{public}@ and media asset type %ld.", buf, 0x34u);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v23 = *(_QWORD *)(a1 + 32);
      v24 = *(void **)(a1 + 64);
      *(_DWORD *)buf = 138543874;
      v34 = v23;
      v35 = 2114;
      v36 = v24;
      v37 = 2114;
      v38 = v7;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Unable to get a working video URL for asset collection %{public}@. Error: %{public}@.", buf, 0x20u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }

}

void __90__MSASStateMachine_videoURLsForAssetCollection_forMediaAssetType_inAlbum_completionBlock___block_invoke_275(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  id v24;
  uint64_t v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 || !v6 || (objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32)) & 1) != 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v20 = *(_QWORD *)(a1 + 40);
      v21 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      v27 = v20;
      v28 = 2114;
      v29 = v21;
      v30 = 2114;
      v31 = v5;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Unable to get a new album URL for album %{public}@. Error: %{public}@.", buf, 0x20u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v8 = *(_QWORD *)(a1 + 40);
      v9 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      v27 = v8;
      v28 = 2114;
      v29 = v7;
      v30 = 2114;
      v31 = v9;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Requesting video URL using new album URL %{public}@ for album %{public}@.", buf, 0x20u);
    }
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "GUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "MSASStateMachine:didFindNewURLString:forAlbumWithGUID:info:", v11, v7, v12, 0);

    objc_msgSend(*(id *)(a1 + 40), "protocol");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 64), "GUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "GUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __90__MSASStateMachine_videoURLsForAssetCollection_forMediaAssetType_inAlbum_completionBlock___block_invoke_276;
    v22[3] = &unk_1E95BBB80;
    v22[4] = *(_QWORD *)(a1 + 40);
    v17 = *(id *)(a1 + 64);
    v19 = *(void **)(a1 + 72);
    v18 = *(_QWORD *)(a1 + 80);
    v23 = v17;
    v25 = v18;
    v24 = v19;
    objc_msgSend(v13, "getVideoURL:forAssetCollectionWithGUID:inAlbumWithGUID:albumURLString:completionBlock:", v14, v15, v16, v7, v22);

  }
}

void __90__MSASStateMachine_videoURLsForAssetCollection_forMediaAssetType_inAlbum_completionBlock___block_invoke_276(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "count"))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v10 = a1[4];
      v11 = a1[5];
      v12 = a1[7];
      v15 = 138544386;
      v16 = v10;
      v17 = 2114;
      v18 = v8;
      v19 = 2114;
      v20 = v9;
      v21 = 2114;
      v22 = v11;
      v23 = 2048;
      v24 = v12;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Using video URLs %{public}@ with expiration %{public}@ for asset collection %{public}@ and media asset type %ld.", (uint8_t *)&v15, 0x34u);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v13 = a1[4];
    v14 = (void *)a1[5];
    v15 = 138543874;
    v16 = v13;
    v17 = 2114;
    v18 = v14;
    v19 = 2114;
    v20 = v7;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Unable to get a working video URL for asset collection %{public}@. Error: %{public}@.", (uint8_t *)&v15, 0x20u);
  }
  (*(void (**)(void))(a1[6] + 16))();

}

void __71__MSASStateMachine_videoURLForAssetCollection_inAlbum_completionBlock___block_invoke(id *a1)
{
  id v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  __CFString *v22;
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  id v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v2 = a1[4];
    v3 = a1[5];
    *(_DWORD *)buf = 138543618;
    v34 = v2;
    v35 = 2114;
    v36 = v3;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Getting video URL for asset collection %{public}@.", buf, 0x16u);
  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(a1[5], "assets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        if (objc_msgSend(v10, "assetDataAvailableOnServer"))
        {
          v11 = objc_msgSend(v10, "mediaAssetType");
          if (v11 == 6)
          {
            v12 = v10;

            v7 = v12;
          }
          else if (v11 == 7)
          {
            v13 = v10;

            v7 = v13;
            goto LABEL_15;
          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v6);
LABEL_15:

    if (v7)
    {
      objc_msgSend(a1[4], "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[6], "GUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "MSASStateMachineDidRequestAlbumURLStringForAlbumWithGUID:info:", v15, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1[4], "protocol");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "GUID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[6], "GUID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __71__MSASStateMachine_videoURLForAssetCollection_inAlbum_completionBlock___block_invoke_270;
      v25[3] = &unk_1E95BBB30;
      v20 = a1[5];
      v25[4] = a1[4];
      v26 = v20;
      v27 = a1[7];
      objc_msgSend(v17, "getVideoURL:forAssetCollectionWithGUID:inAlbumWithGUID:albumURLString:completionBlock:", v7, v18, v19, v16, v25);

      goto LABEL_21;
    }
  }
  else
  {

  }
  v21 = (void *)MEMORY[0x1E0CB35C8];
  v22 = (__CFString *)MSCFCopyLocalizedString(CFSTR("ERROR_SUBSCRIBER_CANNOT_GET_VIDEO"));
  objc_msgSend(v21, "MSErrorWithDomain:code:description:", CFSTR("MSASSubscriberErrorDomain"), 2, v22);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v23 = a1[4];
    v24 = a1[5];
    *(_DWORD *)buf = 138543618;
    v34 = v23;
    v35 = 2114;
    v36 = v24;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: No asset has been completely uploaded for asset collection %{public}@.", buf, 0x16u);
  }
  (*((void (**)(void))a1[7] + 2))();
LABEL_21:

}

void __71__MSASStateMachine_videoURLForAssetCollection_inAlbum_completionBlock___block_invoke_270(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "objectAtIndex:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v11 = a1[4];
      v12 = (void *)a1[5];
      v15 = 138543874;
      v16 = v11;
      v17 = 2114;
      v18 = v10;
      v19 = 2114;
      v20 = v12;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Using video URL %{public}@ for asset collection %{public}@.", (uint8_t *)&v15, 0x20u);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v13 = a1[4];
      v14 = (void *)a1[5];
      v15 = 138543874;
      v16 = v13;
      v17 = 2114;
      v18 = v14;
      v19 = 2114;
      v20 = v7;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Unable to get a working video URL for asset collection %{public}@. Error:%{public}@", (uint8_t *)&v15, 0x20u);
    }
    v10 = 0;
  }
  (*(void (**)(void))(a1[6] + 16))();

}

void __81__MSASStateMachine_setMultipleContributorsEnabled_forAlbum_info_completionBlock___block_invoke(uint64_t a1)
{
  const __CFString *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _BOOL8 v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    if (*(_BYTE *)(a1 + 64))
      v2 = CFSTR("Enabling");
    else
      v2 = CFSTR("Disabling");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    v13 = v3;
    v14 = 2114;
    v15 = v2;
    v16 = 2114;
    v17 = v4;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: %{public}@ multiple contributors for album %{public}@.", buf, 0x20u);
  }
  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "protocol");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_BYTE *)(a1 + 64) != 0;
  v7 = *(_QWORD *)(a1 + 40);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __81__MSASStateMachine_setMultipleContributorsEnabled_forAlbum_info_completionBlock___block_invoke_269;
  v8[3] = &unk_1E95BBB08;
  objc_copyWeak(&v11, (id *)buf);
  v10 = *(id *)(a1 + 56);
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v5, "setMultipleContributorsEnabled:forAlbum:completionBlock:", v6, v7, v8);

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

void __81__MSASStateMachine_setMultipleContributorsEnabled_forAlbum_info_completionBlock___block_invoke_269(id *a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "eventQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__MSASStateMachine_setMultipleContributorsEnabled_forAlbum_info_completionBlock___block_invoke_2;
  block[3] = &unk_1E95BC528;
  v10 = a1[5];
  v8 = a1[4];
  v9 = v3;
  v6 = v3;
  dispatch_async(v5, block);

}

uint64_t __81__MSASStateMachine_setMultipleContributorsEnabled_forAlbum_info_completionBlock___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __73__MSASStateMachine_setPublicAccessEnabled_forAlbum_info_completionBlock___block_invoke(uint64_t a1)
{
  const __CFString *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _BOOL8 v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    if (*(_BYTE *)(a1 + 64))
      v2 = CFSTR("Enabling");
    else
      v2 = CFSTR("Disabling");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    v13 = v3;
    v14 = 2114;
    v15 = v2;
    v16 = 2114;
    v17 = v4;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: %{public}@ public URL sharing for album %{public}@.", buf, 0x20u);
  }
  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "protocol");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_BYTE *)(a1 + 64) != 0;
  v7 = *(_QWORD *)(a1 + 40);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73__MSASStateMachine_setPublicAccessEnabled_forAlbum_info_completionBlock___block_invoke_268;
  v8[3] = &unk_1E95BBB08;
  objc_copyWeak(&v11, (id *)buf);
  v10 = *(id *)(a1 + 56);
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v5, "setPublicAccessEnabled:forAlbum:completionBlock:", v6, v7, v8);

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

void __73__MSASStateMachine_setPublicAccessEnabled_forAlbum_info_completionBlock___block_invoke_268(id *a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "eventQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__MSASStateMachine_setPublicAccessEnabled_forAlbum_info_completionBlock___block_invoke_2;
  block[3] = &unk_1E95BC528;
  v10 = a1[5];
  v8 = a1[4];
  v9 = v3;
  v6 = v3;
  dispatch_async(v5, block);

}

uint64_t __73__MSASStateMachine_setPublicAccessEnabled_forAlbum_info_completionBlock___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __53__MSASStateMachine__scheduleEventDisposition_params___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "MSASStateMachine:didFireScheduledEvent:forAssetCollectionGUID:albumGUID:info:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

}

void __69__MSASStateMachine_scheduleEvent_assetCollectionGUID_albumGUID_info___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "_model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beginTransaction");

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 40);
  v12 = v3;
  if (v4)
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("event"));
  v5 = *(_QWORD *)(a1 + 48);
  if (v5)
    objc_msgSend(v12, "setObject:forKey:", v5, CFSTR("assetCollectionGUID"));
  v6 = *(_QWORD *)(a1 + 56);
  if (v6)
    objc_msgSend(v12, "setObject:forKey:", v6, CFSTR("albumGUID"));
  v7 = *(_QWORD *)(a1 + 64);
  if (v7)
    objc_msgSend(v12, "setObject:forKey:", v7, CFSTR("info"));
  objc_msgSend(*(id *)(a1 + 32), "_model");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel__scheduleEventDisposition_params_);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "personID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "enqueueCommand:params:personID:albumGUID:assetCollectionGUID:", v9, v12, v10, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));

  objc_msgSend(*(id *)(a1 + 32), "_model");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "endTransaction");

  objc_msgSend(*(id *)(a1 + 32), "workQueueRetryOutstandingActivities");
}

void __50__MSASStateMachine__addCommentDisposition_params___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "MSASStateMachine:didFinishAddingComment:toAssetCollection:inAlbum:info:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));

}

void __50__MSASStateMachine__addCommentDisposition_params___block_invoke_257(id *a1, void *a2, int a3)
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  int v19;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 9);
  objc_msgSend(WeakRetained, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__MSASStateMachine__addCommentDisposition_params___block_invoke_2;
  block[3] = &unk_1E95BBAB0;
  v11 = v5;
  v12 = WeakRetained;
  v13 = a1[4];
  v14 = a1[5];
  v15 = a1[6];
  v16 = a1[7];
  v17 = a1[8];
  v8 = WeakRetained;
  v9 = v5;
  objc_copyWeak(&v18, a1 + 9);
  v19 = a3;
  dispatch_async(v7, block);

  objc_destroyWeak(&v18);
}

void __50__MSASStateMachine__addCommentDisposition_params___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 64);
  objc_msgSend(v2, "_canceledError");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "MSASStateMachine:didFinishAddingComment:toAssetCollection:inAlbum:info:error:", v2, v3, v4, v5, v6, v7);

}

void __50__MSASStateMachine__addCommentDisposition_params___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  id *v10;
  id *v11;
  id *v12;
  id *v13;
  id *v14;
  id *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  id WeakRetained;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  _QWORD block[4];
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  uint8_t buf[4];
  uint64_t v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = *(void **)(a1 + 40);
    NSStringFromSelector(sel__addCommentDisposition_params_);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 56), "GUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 64), "GUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v3, "workQueueEndCommandWithError:command:params:albumGUID:assetCollectionGUID:", v2, v4, v5, v6, v7);

    if ((v8 & 1) != 0)
      return;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v25 = *(_QWORD *)(a1 + 64);
      v24 = *(_QWORD *)(a1 + 72);
      v26 = *(_QWORD *)(a1 + 56);
      v27 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "MSVerboseDescription");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v45 = v27;
      v46 = 2114;
      v47 = v24;
      v48 = 2114;
      v49 = v25;
      v50 = 2114;
      v51 = v26;
      v52 = 2114;
      v53 = v28;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Failed to add comment %{public}@ to asset collection %{public}@ in album %{public}@. Error: %{public}@", buf, 0x34u);

    }
    objc_msgSend(*(id *)(a1 + 40), "eventQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __50__MSASStateMachine__addCommentDisposition_params___block_invoke_258;
    v37[3] = &unk_1E95BC758;
    v10 = &v38;
    v38 = *(id *)(a1 + 40);
    v11 = &v39;
    v39 = *(id *)(a1 + 72);
    v12 = &v40;
    v40 = *(id *)(a1 + 64);
    v13 = &v41;
    v41 = *(id *)(a1 + 56);
    v14 = &v42;
    v42 = *(id *)(a1 + 80);
    v15 = &v43;
    v43 = *(id *)(a1 + 32);
    v16 = v37;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v17 = *(_QWORD *)(a1 + 40);
      v19 = *(_QWORD *)(a1 + 64);
      v18 = *(_QWORD *)(a1 + 72);
      v20 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138544130;
      v45 = v17;
      v46 = 2114;
      v47 = v18;
      v48 = 2114;
      v49 = v19;
      v50 = 2114;
      v51 = v20;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Finished adding comment %{public}@ to asset collection %{public}@ in album %{public}@.", buf, 0x2Au);
    }
    objc_msgSend(*(id *)(a1 + 72), "setID:", *(unsigned int *)(a1 + 96));
    objc_msgSend(*(id *)(a1 + 40), "memberQueue");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__MSASStateMachine__addCommentDisposition_params___block_invoke_259;
    block[3] = &unk_1E95BCED0;
    v10 = &v36;
    v36 = *(id *)(a1 + 40);
    dispatch_barrier_sync(v21, block);

    objc_msgSend(*(id *)(a1 + 40), "eventQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v29[0] = v22;
    v29[1] = 3221225472;
    v29[2] = __50__MSASStateMachine__addCommentDisposition_params___block_invoke_2_260;
    v29[3] = &unk_1E95BCE80;
    v11 = &v30;
    v30 = *(id *)(a1 + 40);
    v12 = &v31;
    v31 = *(id *)(a1 + 72);
    v13 = &v32;
    v32 = *(id *)(a1 + 64);
    v14 = &v33;
    v33 = *(id *)(a1 + 56);
    v15 = &v34;
    v34 = *(id *)(a1 + 80);
    v16 = v29;
  }
  dispatch_async(v9, v16);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  objc_msgSend(WeakRetained, "workQueueDidFinishCommand");

}

void __50__MSASStateMachine__addCommentDisposition_params___block_invoke_258(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "MSASStateMachine:didFinishAddingComment:toAssetCollection:inAlbum:info:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));

}

void __50__MSASStateMachine__addCommentDisposition_params___block_invoke_259(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "memberQueueMetadataBackoffManager");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reset");

}

void __50__MSASStateMachine__addCommentDisposition_params___block_invoke_2_260(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "daemon");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "personID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didReceiveAuthSuccessForPersonID:", v3);

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "MSASStateMachine:didFinishAddingComment:toAssetCollection:inAlbum:info:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), 0);

}

uint64_t __63__MSASStateMachine_addComments_toAssetCollection_inAlbum_info___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id obj;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = objc_msgSend(*(id *)(a1 + 40), "count");
    v4 = *(_QWORD *)(a1 + 48);
    v5 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)buf = 138544130;
    v30 = v2;
    v31 = 2048;
    v32 = v3;
    v33 = 2114;
    v34 = v4;
    v35 = 2114;
    v36 = v5;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Scheduling the addition of %ld comments to asset collection %{public}@ in album %{public}@.", buf, 0x2Au);
  }
  objc_msgSend(*(id *)(a1 + 32), "_model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "beginTransaction");

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = *(id *)(a1 + 40);
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v7)
  {
    v8 = v7;
    v23 = *(_QWORD *)v25;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v25 != v23)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v9);
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKey:", v10, CFSTR("comment"));
        v12 = *(_QWORD *)(a1 + 48);
        if (v12)
          objc_msgSend(v11, "setObject:forKey:", v12, CFSTR("assetCollection"));
        v13 = *(_QWORD *)(a1 + 56);
        if (v13)
          objc_msgSend(v11, "setObject:forKey:", v13, CFSTR("album"));
        v14 = *(_QWORD *)(a1 + 64);
        if (v14)
          objc_msgSend(v11, "setObject:forKey:", v14, CFSTR("info"));
        objc_msgSend(*(id *)(a1 + 32), "_model");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(sel__addCommentDisposition_params_);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "personID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 56), "GUID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "GUID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "enqueueCommand:params:personID:albumGUID:pendingOnAssetCollectionGUID:", v16, v11, v17, v18, v19);

        ++v9;
      }
      while (v8 != v9);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v8);
  }

  objc_msgSend(*(id *)(a1 + 32), "_model");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "endTransaction");

  return objc_msgSend(*(id *)(a1 + 32), "workQueueRetryOutstandingActivities");
}

void __66__MSASStateMachine__removeSharingRelationshipsDisposition_params___block_invoke(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v3 = a2;
  objc_msgSend(a1[4], "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__MSASStateMachine__removeSharingRelationshipsDisposition_params___block_invoke_2;
  v8[3] = &unk_1E95BB8D0;
  v9 = v3;
  v5 = v3;
  objc_copyWeak(&v14, a1 + 8);
  v6 = a1[5];
  v7 = a1[4];
  v10 = v6;
  v11 = v7;
  v12 = a1[6];
  v13 = a1[7];
  dispatch_async(v4, v8);

  objc_destroyWeak(&v14);
}

void __66__MSASStateMachine__removeSharingRelationshipsDisposition_params___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id obj;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v14 != v4)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 40), "delegate");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = *(void **)(a1 + 40);
        v9 = *(_QWORD *)(a1 + 48);
        v10 = *(_QWORD *)(a1 + 56);
        objc_msgSend(v8, "_canceledError");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "MSASStateMachine:didFinishRemovingSharingRelationship:fromOwnedAlbum:info:error:", v8, v6, v9, v10, v11);

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v3);
  }

}

void __66__MSASStateMachine__removeSharingRelationshipsDisposition_params___block_invoke_2(id *a1)
{
  id WeakRetained;
  char v3;
  NSObject *v4;
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  _QWORD block[4];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (a1[4])
  {
    WeakRetained = objc_loadWeakRetained(a1 + 9);
    v3 = objc_msgSend(WeakRetained, "workQueueEndCommandWithError:command:params:albumGUID:assetCollectionGUID:", a1[4], 0, 0, 0, 0);

    if ((v3 & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v14 = objc_loadWeakRetained(a1 + 9);
        v16 = a1[4];
        v15 = a1[5];
        *(_DWORD *)buf = 138543874;
        v31 = v14;
        v32 = 2114;
        v33 = v15;
        v34 = 2114;
        v35 = v16;
        _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Failed to remove sharing relationships from album %{public}@. Error: %{public}@", buf, 0x20u);

      }
      objc_msgSend(a1[6], "eventQueue");
      v4 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __66__MSASStateMachine__removeSharingRelationshipsDisposition_params___block_invoke_252;
      block[3] = &unk_1E95BB6C0;
      v25 = a1[7];
      objc_copyWeak(&v29, a1 + 9);
      v26 = a1[5];
      v27 = a1[8];
      v28 = a1[4];
      dispatch_async(v4, block);

      v5 = objc_loadWeakRetained(a1 + 9);
      objc_msgSend(v5, "workQueueDidFinishCommand");

      objc_destroyWeak(&v29);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v6 = objc_loadWeakRetained(a1 + 9);
      v7 = a1[5];
      *(_DWORD *)buf = 138543618;
      v31 = v6;
      v32 = 2114;
      v33 = v7;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Successfully removed sharing relationships from album %{public}@", buf, 0x16u);

    }
    objc_msgSend(a1[6], "memberQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __66__MSASStateMachine__removeSharingRelationshipsDisposition_params___block_invoke_253;
    v23[3] = &unk_1E95BCED0;
    v23[4] = a1[6];
    dispatch_barrier_sync(v8, v23);

    objc_msgSend(a1[6], "eventQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    v17[0] = v9;
    v17[1] = 3221225472;
    v17[2] = __66__MSASStateMachine__removeSharingRelationshipsDisposition_params___block_invoke_2_254;
    v17[3] = &unk_1E95BB6C0;
    objc_copyWeak(&v22, a1 + 9);
    v18 = a1[7];
    v19 = a1[5];
    v11 = a1[8];
    v12 = a1[6];
    v20 = v11;
    v21 = v12;
    dispatch_async(v10, v17);

    v13 = objc_loadWeakRetained(a1 + 9);
    objc_msgSend(v13, "workQueueDidFinishCommand");

    objc_destroyWeak(&v22);
  }
}

void __66__MSASStateMachine__removeSharingRelationshipsDisposition_params___block_invoke_252(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id WeakRetained;
  void *v9;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v6);
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
        objc_msgSend(WeakRetained, "delegate", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_loadWeakRetained((id *)(a1 + 64));
        objc_msgSend(v9, "MSASStateMachine:didFinishRemovingSharingRelationship:fromOwnedAlbum:info:error:", v10, v7, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

}

uint64_t __66__MSASStateMachine__removeSharingRelationshipsDisposition_params___block_invoke_253(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "reset");
}

void __66__MSASStateMachine__removeSharingRelationshipsDisposition_params___block_invoke_2_254(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 64);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "daemon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "personID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didReceiveAuthSuccessForPersonID:", v6);

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = *(id *)(a1 + 32);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v11);
        v13 = objc_loadWeakRetained(v2);
        objc_msgSend(v13, "delegate", (_QWORD)v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_loadWeakRetained(v2);
        objc_msgSend(v14, "MSASStateMachine:didFinishRemovingSharingRelationship:fromOwnedAlbum:info:error:", v15, v12, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  objc_msgSend(*(id *)(a1 + 56), "phoneInvitations");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "removeSharingRelationships:forAlbum:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __67__MSASStateMachine_removeSharingRelationships_fromOwnedAlbum_info___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    objc_msgSend(v2, "setObject:forKey:", v4, CFSTR("sharingRelationships"));
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("album"));
  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("info"));
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v7 = *(_QWORD *)(a1 + 56);
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v14 = 138543874;
    v15 = v7;
    v16 = 2112;
    v17 = v8;
    v18 = 2114;
    v19 = v9;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Scheduling removal of sharing relationships %@ from album %{public}@", (uint8_t *)&v14, 0x20u);
  }
  objc_msgSend(*(id *)(a1 + 56), "_model");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel__removeSharingRelationshipsDisposition_params_);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "personID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "GUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "enqueueCommand:params:personID:albumGUID:assetCollectionGUID:", v11, v3, v12, v13, 0);

  objc_msgSend(*(id *)(a1 + 56), "workQueueRetryOutstandingActivities");
}

void __63__MSASStateMachine__addSharingRelationshipsDisposition_params___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  objc_msgSend(WeakRetained, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__MSASStateMachine__addSharingRelationshipsDisposition_params___block_invoke_2;
  block[3] = &unk_1E95BB8A8;
  v13 = v5;
  v14 = WeakRetained;
  v15 = a1[4];
  v16 = a1[5];
  v17 = a1[6];
  v9 = WeakRetained;
  v10 = v5;
  objc_copyWeak(&v19, a1 + 7);
  v18 = v6;
  v11 = v6;
  dispatch_async(v8, block);

  objc_destroyWeak(&v19);
}

void __63__MSASStateMachine__addSharingRelationshipsDisposition_params___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "eventQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__MSASStateMachine__addSharingRelationshipsDisposition_params___block_invoke_4;
  v4[3] = &unk_1E95BCE58;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  dispatch_async(v2, v4);

}

void __63__MSASStateMachine__addSharingRelationshipsDisposition_params___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v2, "_canceledError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "MSASStateMachine:didFinishAddingSharingRelationships:toOwnedAlbum:info:error:", v2, v3, v5, v4, v6);

}

void __63__MSASStateMachine__addSharingRelationshipsDisposition_params___block_invoke_2(id *a1)
{
  id v2;
  NSObject *v3;
  id WeakRetained;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  id *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD block[4];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v2 = a1[4];
  if (v2)
  {
    if ((objc_msgSend(a1[5], "workQueueEndCommandWithError:command:params:albumGUID:assetCollectionGUID:", v2, 0, 0, 0, 0) & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v17 = a1[5];
        v16 = a1[6];
        v18 = a1[4];
        *(_DWORD *)buf = 138543874;
        v34 = v17;
        v35 = 2114;
        v36 = v16;
        v37 = 2114;
        v38 = v18;
        _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Failed to add sharing relationships to album %{public}@. Error: %{public}@", buf, 0x20u);
      }
      objc_msgSend(a1[5], "eventQueue");
      v3 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __63__MSASStateMachine__addSharingRelationshipsDisposition_params___block_invoke_247;
      block[3] = &unk_1E95BCE80;
      v28 = a1[5];
      v29 = a1[7];
      v30 = a1[6];
      v31 = a1[8];
      v32 = a1[4];
      dispatch_async(v3, block);

      WeakRetained = objc_loadWeakRetained(a1 + 10);
      objc_msgSend(WeakRetained, "workQueueDidFinishCommand");

    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v5 = a1[5];
      v6 = a1[6];
      *(_DWORD *)buf = 138543618;
      v34 = v5;
      v35 = 2114;
      v36 = v6;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Successfully added sharing relationships to album %{public}@", buf, 0x16u);
    }
    if (objc_msgSend(a1[9], "count"))
    {
      objc_msgSend(a1[5], "phoneInvitations");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = a1[9];
      v9 = a1[6];
      v10 = objc_loadWeakRetained(a1 + 10);
      objc_msgSend(v7, "addPendingPhoneInvitations:toOwnedAlbum:inStateMachin:", v8, v9, v10);

    }
    objc_msgSend(a1[5], "memberQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __63__MSASStateMachine__addSharingRelationshipsDisposition_params___block_invoke_248;
    v25[3] = &unk_1E95BB300;
    objc_copyWeak(&v26, a1 + 10);
    dispatch_barrier_async(v11, v25);

    objc_msgSend(a1[5], "eventQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    v19[0] = v12;
    v19[1] = 3221225472;
    v19[2] = __63__MSASStateMachine__addSharingRelationshipsDisposition_params___block_invoke_2_249;
    v19[3] = &unk_1E95BCE80;
    v15 = a1[5];
    v14 = a1 + 5;
    v20 = v15;
    v21 = v14[2];
    v22 = v14[1];
    v23 = v14[3];
    v24 = *(v14 - 1);
    dispatch_async(v13, v19);

    objc_msgSend(*v14, "workQueueDidFinishCommand");
    objc_destroyWeak(&v26);
  }
}

void __63__MSASStateMachine__addSharingRelationshipsDisposition_params___block_invoke_247(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "MSASStateMachine:didFinishAddingSharingRelationships:toOwnedAlbum:info:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

}

void __63__MSASStateMachine__addSharingRelationshipsDisposition_params___block_invoke_248(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "memberQueueMetadataBackoffManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reset");

}

void __63__MSASStateMachine__addSharingRelationshipsDisposition_params___block_invoke_2_249(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "daemon");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "personID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didReceiveAuthSuccessForPersonID:", v3);

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "MSASStateMachine:didFinishAddingSharingRelationships:toOwnedAlbum:info:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

}

void __62__MSASStateMachine_addSharingRelationships_toOwnedAlbum_info___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    objc_msgSend(v2, "setObject:forKey:", v4, CFSTR("sharingRelationships"));
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("album"));
  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("info"));
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v7 = *(_QWORD *)(a1 + 56);
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v14 = 138543874;
    v15 = v7;
    v16 = 2112;
    v17 = v8;
    v18 = 2114;
    v19 = v9;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Scheduling addition of sharing relationships %@ to album %{public}@", (uint8_t *)&v14, 0x20u);
  }
  objc_msgSend(*(id *)(a1 + 56), "_model");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel__addSharingRelationshipsDisposition_params_);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "personID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "GUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "enqueueCommand:params:personID:albumGUID:assetCollectionGUID:", v11, v3, v12, v13, 0);

  objc_msgSend(*(id *)(a1 + 56), "workQueueRetryOutstandingActivities");
}

void __59__MSASStateMachine__sendGetUploadTokensDisposition_params___block_invoke(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v3 = a2;
  objc_msgSend(a1[4], "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__MSASStateMachine__sendGetUploadTokensDisposition_params___block_invoke_2;
  block[3] = &unk_1E95BB8A8;
  v9 = v3;
  v5 = v3;
  objc_copyWeak(&v15, a1 + 9);
  v10 = a1[5];
  v6 = a1[6];
  v7 = a1[4];
  v11 = v6;
  v12 = v7;
  v13 = a1[7];
  v14 = a1[8];
  dispatch_async(v4, block);

  objc_destroyWeak(&v15);
}

void __59__MSASStateMachine__sendGetUploadTokensDisposition_params___block_invoke_3_244(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_deleteAssetFilesInAssetCollection:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v2, "_canceledError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "MSASStateMachine:didFinishAddingAssetCollection:toAlbum:info:error:", v2, v3, v5, v4, v6);

}

void __59__MSASStateMachine__sendGetUploadTokensDisposition_params___block_invoke_2(id *a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  id *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[5];
  _QWORD v39[4];
  id v40;
  id v41;
  _QWORD block[4];
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  uint8_t buf[4];
  id v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  if (a1[4])
  {
    WeakRetained = objc_loadWeakRetained(a1 + 10);
    v3 = a1[4];
    NSStringFromSelector(sel__sendGetUploadTokensDisposition_params_);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v3) = objc_msgSend(WeakRetained, "workQueueEndCommandWithError:command:params:albumGUID:assetCollectionGUID:", v3, v4, 0, 0, 0);

    if ((v3 & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v33 = objc_loadWeakRetained(a1 + 10);
        v34 = a1[5];
        objc_msgSend(a1[4], "MSVerboseDescription");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v49 = v33;
        v50 = 2114;
        v51 = (uint64_t)v34;
        v52 = 2114;
        v53 = v35;
        _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Failed to get upload tokens for assets %{public}@. Error: %{public}@", buf, 0x20u);

      }
      v5 = objc_loadWeakRetained(a1 + 10);
      objc_msgSend(v5, "_deleteAssetFilesInAssetCollection:", a1[6]);

      objc_msgSend(a1[7], "eventQueue");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = MEMORY[0x1E0C809B0];
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __59__MSASStateMachine__sendGetUploadTokensDisposition_params___block_invoke_240;
      block[3] = &unk_1E95BB6C0;
      objc_copyWeak(&v47, a1 + 10);
      v43 = a1[6];
      v44 = a1[8];
      v45 = a1[9];
      v46 = a1[4];
      dispatch_async(v6, block);

      v8 = objc_loadWeakRetained(a1 + 10);
      objc_msgSend(v8, "_model");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "beginTransaction");

      v10 = objc_loadWeakRetained(a1 + 10);
      objc_msgSend(v10, "_model");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[6], "GUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "requeuePendingAssetCollectionGUID:", v12);

      v13 = objc_loadWeakRetained(a1 + 10);
      objc_msgSend(v13, "_model");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "endTransaction");

      v15 = objc_loadWeakRetained(a1 + 10);
      objc_msgSend(v15, "_assetUploader");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v39[0] = v7;
      v39[1] = 3221225472;
      v39[2] = __59__MSASStateMachine__sendGetUploadTokensDisposition_params___block_invoke_2_241;
      v39[3] = &unk_1E95BBA08;
      objc_copyWeak(&v41, a1 + 10);
      v40 = a1[6];
      objc_msgSend(v16, "stopCompletionBlock:", v39);

      objc_destroyWeak(&v41);
      objc_destroyWeak(&v47);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v17 = objc_loadWeakRetained(a1 + 10);
      v18 = objc_msgSend(a1[5], "count");
      v19 = a1[6];
      *(_DWORD *)buf = 138543874;
      v49 = v17;
      v50 = 2048;
      v51 = v18;
      v52 = 2114;
      v53 = v19;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Successfully obtained %ld upload tokens in asset collection %{public}@.", buf, 0x20u);

    }
    objc_msgSend(a1[7], "memberQueue");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = MEMORY[0x1E0C809B0];
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __59__MSASStateMachine__sendGetUploadTokensDisposition_params___block_invoke_242;
    v38[3] = &unk_1E95BCED0;
    v38[4] = a1[7];
    dispatch_barrier_sync(v20, v38);

    objc_msgSend(a1[7], "eventQueue");
    v22 = objc_claimAutoreleasedReturnValue();
    v36[0] = v21;
    v36[1] = 3221225472;
    v36[2] = __59__MSASStateMachine__sendGetUploadTokensDisposition_params___block_invoke_2_243;
    v36[3] = &unk_1E95BB300;
    v23 = a1 + 10;
    objc_copyWeak(&v37, a1 + 10);
    dispatch_async(v22, v36);

    v24 = objc_loadWeakRetained(a1 + 10);
    objc_msgSend(v24, "_model");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "beginTransaction");

    v26 = objc_loadWeakRetained(a1 + 10);
    objc_msgSend(v26, "_model");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "enqueueAssetCollectionForUpload:album:", a1[6], a1[8]);

    v28 = objc_loadWeakRetained(a1 + 10);
    objc_msgSend(v28, "_model");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "endTransaction");

    v30 = objc_loadWeakRetained(v23);
    objc_msgSend(v30, "_assetUploader");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "retryOutstandingActivities");

    v32 = objc_loadWeakRetained(v23);
    objc_msgSend(v32, "workQueueDidFinishCommand");

    objc_destroyWeak(&v37);
  }
}

void __59__MSASStateMachine__sendGetUploadTokensDisposition_params___block_invoke_240(uint64_t a1)
{
  id *v2;
  void *v3;
  id v4;
  id WeakRetained;

  v2 = (id *)(a1 + 64);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "MSASStateMachine:didFinishAddingAssetCollection:toAlbum:info:error:", v4, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

void __59__MSASStateMachine__sendGetUploadTokensDisposition_params___block_invoke_2_241(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_assetUploader");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unregisterAssetCollections:", v5);

  v6 = objc_loadWeakRetained(v2);
  objc_msgSend(v6, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__MSASStateMachine__sendGetUploadTokensDisposition_params___block_invoke_3;
  block[3] = &unk_1E95BB300;
  objc_copyWeak(&v9, v2);
  dispatch_async(v7, block);

  objc_destroyWeak(&v9);
}

uint64_t __59__MSASStateMachine__sendGetUploadTokensDisposition_params___block_invoke_242(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "reset");
}

void __59__MSASStateMachine__sendGetUploadTokensDisposition_params___block_invoke_2_243(uint64_t a1)
{
  id *v1;
  void *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "daemon");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "personID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didReceiveAuthSuccessForPersonID:", v4);

}

void __59__MSASStateMachine__sendGetUploadTokensDisposition_params___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "workQueueDidFinishCommand");

}

void __63__MSASStateMachine__sendPutAssetCollectionsDisposition_params___block_invoke(id *a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;

  v8 = a2;
  v9 = a4;
  v10 = a5;
  objc_msgSend(a1[4], "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __63__MSASStateMachine__sendPutAssetCollectionsDisposition_params___block_invoke_2;
  v16[3] = &unk_1E95BB7D0;
  v17 = v8;
  v12 = v8;
  objc_copyWeak(&v24, a1 + 8);
  v18 = a1[5];
  v19 = a1[6];
  v20 = v9;
  v13 = a1[4];
  v21 = v10;
  v22 = v13;
  v23 = a1[7];
  v14 = v10;
  v15 = v9;
  dispatch_async(v11, v16);

  objc_destroyWeak(&v24);
}

void __63__MSASStateMachine__sendPutAssetCollectionsDisposition_params___block_invoke_7(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id obj;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v14 != v4)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 40), "_deleteAssetFilesInAssetCollection:", v6);
        objc_msgSend(*(id *)(a1 + 40), "delegate");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = *(void **)(a1 + 40);
        v9 = *(_QWORD *)(a1 + 48);
        v10 = *(_QWORD *)(a1 + 56);
        objc_msgSend(v8, "_canceledError");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "MSASStateMachine:didFinishAddingAssetCollection:toAlbum:info:error:", v8, v6, v9, v10, v11);

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v3);
  }

}

void __63__MSASStateMachine__sendPutAssetCollectionsDisposition_params___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  uint64_t v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t m;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  uint64_t v44;
  void *v45;
  NSObject *v46;
  NSObject *v47;
  id v48;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t n;
  uint64_t v54;
  id v55;
  void *v56;
  id v57;
  void *v58;
  id v59;
  void *v60;
  NSObject *v61;
  id v62;
  uint64_t v63;
  BOOL v64;
  id v65;
  void *v66;
  void *v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t ii;
  void *v72;
  id v73;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  id v78;
  void *v79;
  id v80;
  void *v81;
  id v82;
  uint64_t v83;
  void *v84;
  id v85;
  uint64_t v86;
  void *v87;
  id *v88;
  id *location;
  _QWORD v90[4];
  id v91;
  id v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  _QWORD v97[4];
  id v98;
  id v99;
  id v100;
  uint64_t v101;
  id v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  _QWORD v107[4];
  id v108;
  _QWORD v109[5];
  _QWORD v110[4];
  id v111;
  id v112;
  id v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  _QWORD block[4];
  id v123;
  id v124;
  id v125;
  id v126;
  id v127;
  id v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  _BYTE v137[128];
  _BYTE v138[128];
  _BYTE v139[128];
  _BYTE v140[128];
  _BYTE v141[128];
  uint8_t v142[128];
  uint8_t buf[4];
  id v144;
  __int16 v145;
  uint64_t v146;
  __int16 v147;
  void *v148;
  uint64_t v149;

  v149 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
    v3 = *(_QWORD *)(a1 + 32);
    NSStringFromSelector(sel__sendPutAssetCollectionsDisposition_params_);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "GUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v3) = objc_msgSend(WeakRetained, "workQueueEndCommandWithError:command:params:albumGUID:assetCollectionGUID:", v3, v4, v5, v6, 0);

    if ((v3 & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v82 = objc_loadWeakRetained((id *)(a1 + 88));
        v83 = *(_QWORD *)(a1 + 48);
        objc_msgSend(*(id *)(a1 + 32), "MSVerboseDescription");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v144 = v82;
        v145 = 2114;
        v146 = v83;
        v147 = 2114;
        v148 = v84;
        _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Failed to add photos to album %{public}@. Error: %{public}@", buf, 0x20u);

      }
      v135 = 0u;
      v136 = 0u;
      v133 = 0u;
      v134 = 0u;
      v7 = *(id *)(a1 + 56);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v133, v142, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v134;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v134 != v9)
              objc_enumerationMutation(v7);
            v11 = *(_QWORD *)(*((_QWORD *)&v133 + 1) + 8 * i);
            v12 = objc_loadWeakRetained((id *)(a1 + 88));
            objc_msgSend(v12, "_deleteAssetFilesInAssetCollection:", v11);

          }
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v133, v142, 16);
        }
        while (v8);
      }

      v131 = 0u;
      v132 = 0u;
      v129 = 0u;
      v130 = 0u;
      v13 = *(id *)(a1 + 64);
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v129, v141, 16);
      if (v14)
      {
        v15 = *(_QWORD *)v130;
        do
        {
          for (j = 0; j != v14; ++j)
          {
            if (*(_QWORD *)v130 != v15)
              objc_enumerationMutation(v13);
            v17 = *(_QWORD *)(*((_QWORD *)&v129 + 1) + 8 * j);
            v18 = objc_loadWeakRetained((id *)(a1 + 88));
            objc_msgSend(v18, "_deleteAssetFilesInAssetCollection:", v17);

          }
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v129, v141, 16);
        }
        while (v14);
      }

      objc_msgSend(*(id *)(a1 + 72), "eventQueue");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = MEMORY[0x1E0C809B0];
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __63__MSASStateMachine__sendPutAssetCollectionsDisposition_params___block_invoke_232;
      block[3] = &unk_1E95BB8D0;
      v123 = *(id *)(a1 + 56);
      objc_copyWeak(&v128, (id *)(a1 + 88));
      v124 = *(id *)(a1 + 48);
      v125 = *(id *)(a1 + 80);
      v126 = *(id *)(a1 + 32);
      v127 = *(id *)(a1 + 64);
      dispatch_async(v19, block);

      v21 = objc_loadWeakRetained((id *)(a1 + 88));
      objc_msgSend(v21, "_model");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "beginTransaction");

      v120 = 0u;
      v121 = 0u;
      v118 = 0u;
      v119 = 0u;
      v23 = *(id *)(a1 + 56);
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v118, v140, 16);
      if (v24)
      {
        v25 = *(_QWORD *)v119;
        do
        {
          for (k = 0; k != v24; ++k)
          {
            if (*(_QWORD *)v119 != v25)
              objc_enumerationMutation(v23);
            v27 = *(void **)(*((_QWORD *)&v118 + 1) + 8 * k);
            v28 = objc_loadWeakRetained((id *)(a1 + 88));
            objc_msgSend(v28, "_model");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "GUID");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "requeuePendingAssetCollectionGUID:", v30);

          }
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v118, v140, 16);
        }
        while (v24);
      }

      v116 = 0u;
      v117 = 0u;
      v114 = 0u;
      v115 = 0u;
      v31 = *(id *)(a1 + 64);
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v114, v139, 16);
      if (v32)
      {
        v33 = *(_QWORD *)v115;
        do
        {
          for (m = 0; m != v32; ++m)
          {
            if (*(_QWORD *)v115 != v33)
              objc_enumerationMutation(v31);
            v35 = *(void **)(*((_QWORD *)&v114 + 1) + 8 * m);
            v36 = objc_loadWeakRetained((id *)(a1 + 88));
            objc_msgSend(v36, "_model");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "GUID");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "requeuePendingAssetCollectionGUID:", v38);

          }
          v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v114, v139, 16);
        }
        while (v32);
      }

      v39 = objc_loadWeakRetained((id *)(a1 + 88));
      objc_msgSend(v39, "_model");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "endTransaction");

      v41 = objc_loadWeakRetained((id *)(a1 + 88));
      objc_msgSend(v41, "_assetUploader");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v110[0] = v20;
      v110[1] = 3221225472;
      v110[2] = __63__MSASStateMachine__sendPutAssetCollectionsDisposition_params___block_invoke_2_233;
      v110[3] = &unk_1E95BBC00;
      objc_copyWeak(&v113, (id *)(a1 + 88));
      v111 = *(id *)(a1 + 56);
      v112 = *(id *)(a1 + 64);
      objc_msgSend(v42, "stopCompletionBlock:", v110);

      objc_destroyWeak(&v113);
      objc_destroyWeak(&v128);

    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v43 = objc_loadWeakRetained((id *)(a1 + 88));
      v44 = objc_msgSend(*(id *)(a1 + 56), "count");
      v45 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      v144 = v43;
      v145 = 2048;
      v146 = v44;
      v147 = 2114;
      v148 = v45;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Successfully enqueued %ld photos for upload to album %{public}@.", buf, 0x20u);

    }
    if (objc_msgSend(*(id *)(a1 + 64), "count") && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v85 = objc_loadWeakRetained((id *)(a1 + 88));
      v86 = objc_msgSend(*(id *)(a1 + 64), "count");
      v87 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      v144 = v85;
      v145 = 2048;
      v146 = v86;
      v147 = 2114;
      v148 = v87;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Failed to enqueue %ld photos for upload to album %{public}@.", buf, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 72), "memberQueue");
    v46 = objc_claimAutoreleasedReturnValue();
    v109[0] = MEMORY[0x1E0C809B0];
    v109[1] = 3221225472;
    v109[2] = __63__MSASStateMachine__sendPutAssetCollectionsDisposition_params___block_invoke_234;
    v109[3] = &unk_1E95BCED0;
    v109[4] = *(_QWORD *)(a1 + 72);
    dispatch_barrier_sync(v46, v109);

    objc_msgSend(*(id *)(a1 + 72), "eventQueue");
    v47 = objc_claimAutoreleasedReturnValue();
    v107[0] = MEMORY[0x1E0C809B0];
    v107[1] = 3221225472;
    v107[2] = __63__MSASStateMachine__sendPutAssetCollectionsDisposition_params___block_invoke_2_235;
    v107[3] = &unk_1E95BB300;
    objc_copyWeak(&v108, (id *)(a1 + 88));
    dispatch_async(v47, v107);

    v48 = objc_loadWeakRetained((id *)(a1 + 88));
    objc_msgSend(v48, "_model");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "beginTransaction");

    v105 = 0u;
    v106 = 0u;
    v103 = 0u;
    v104 = 0u;
    v50 = *(id *)(a1 + 56);
    v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v103, v138, 16);
    if (v51)
    {
      v52 = *(_QWORD *)v104;
      do
      {
        for (n = 0; n != v51; ++n)
        {
          if (*(_QWORD *)v104 != v52)
            objc_enumerationMutation(v50);
          v54 = *(_QWORD *)(*((_QWORD *)&v103 + 1) + 8 * n);
          v55 = objc_loadWeakRetained((id *)(a1 + 88));
          objc_msgSend(v55, "_model");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "enqueueAssetCollectionForUpload:album:", v54, *(_QWORD *)(a1 + 48));

        }
        v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v103, v138, 16);
      }
      while (v51);
    }

    v57 = objc_loadWeakRetained((id *)(a1 + 88));
    objc_msgSend(v57, "_model");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "endTransaction");

    v59 = objc_loadWeakRetained((id *)(a1 + 88));
    objc_msgSend(v59, "_assetUploader");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "retryOutstandingActivities");

    objc_msgSend(*(id *)(a1 + 72), "eventQueue");
    v61 = objc_claimAutoreleasedReturnValue();
    v97[0] = MEMORY[0x1E0C809B0];
    v97[1] = 3221225472;
    v97[2] = __63__MSASStateMachine__sendPutAssetCollectionsDisposition_params___block_invoke_3_236;
    v97[3] = &unk_1E95BB6C0;
    v98 = *(id *)(a1 + 64);
    objc_copyWeak(&v102, (id *)(a1 + 88));
    v99 = *(id *)(a1 + 48);
    v62 = *(id *)(a1 + 80);
    v63 = *(_QWORD *)(a1 + 72);
    v100 = v62;
    v101 = v63;
    dispatch_async(v61, v97);

    v64 = objc_msgSend(*(id *)(a1 + 64), "count") == 0;
    v65 = objc_loadWeakRetained((id *)(a1 + 88));
    v66 = v65;
    if (v64)
    {
      objc_msgSend(v65, "workQueueDidFinishCommand", &v102, &v108);

    }
    else
    {
      objc_msgSend(v65, "_model", &v102, &v108);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "beginTransaction");

      v95 = 0u;
      v96 = 0u;
      v93 = 0u;
      v94 = 0u;
      v68 = *(id *)(a1 + 64);
      v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v93, v137, 16);
      if (v69)
      {
        v70 = *(_QWORD *)v94;
        do
        {
          for (ii = 0; ii != v69; ++ii)
          {
            if (*(_QWORD *)v94 != v70)
              objc_enumerationMutation(v68);
            v72 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * ii);
            v73 = objc_loadWeakRetained((id *)(a1 + 88));
            objc_msgSend(v73, "_model");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v72, "GUID");
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v74, "requeuePendingAssetCollectionGUID:", v75);

            v76 = objc_loadWeakRetained((id *)(a1 + 88));
            objc_msgSend(v72, "GUID");
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v76, "cancelOutstandingCommandsForAssetCollectionWithGUID:", v77);

          }
          v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v93, v137, 16);
        }
        while (v69);
      }

      v78 = objc_loadWeakRetained((id *)(a1 + 88));
      objc_msgSend(v78, "_model");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "endTransaction");

      v80 = objc_loadWeakRetained((id *)(a1 + 88));
      objc_msgSend(v80, "_assetUploader");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v90[0] = MEMORY[0x1E0C809B0];
      v90[1] = 3221225472;
      v90[2] = __63__MSASStateMachine__sendPutAssetCollectionsDisposition_params___block_invoke_4;
      v90[3] = &unk_1E95BBA08;
      objc_copyWeak(&v92, (id *)(a1 + 88));
      v91 = *(id *)(a1 + 64);
      objc_msgSend(v81, "stopCompletionBlock:", v90);

      objc_destroyWeak(&v92);
    }

    objc_destroyWeak(v88);
    objc_destroyWeak(location);
  }
}

void __63__MSASStateMachine__sendPutAssetCollectionsDisposition_params___block_invoke_232(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id WeakRetained;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v25;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v25 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v6);
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
        objc_msgSend(WeakRetained, "delegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_loadWeakRetained((id *)(a1 + 72));
        objc_msgSend(v9, "MSASStateMachine:didFinishAddingAssetCollection:toAlbum:info:error:", v10, v7, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v4);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = *(id *)(a1 + 64);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v15);
        v17 = objc_loadWeakRetained((id *)(a1 + 72));
        objc_msgSend(v17, "delegate", (_QWORD)v20);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_loadWeakRetained((id *)(a1 + 72));
        objc_msgSend(v18, "MSASStateMachine:didFinishAddingAssetCollection:toAlbum:info:error:", v19, v16, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v13);
  }

}

void __63__MSASStateMachine__sendPutAssetCollectionsDisposition_params___block_invoke_2_233(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_assetUploader");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unregisterAssetCollections:", *(_QWORD *)(a1 + 32));

  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "_assetUploader");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unregisterAssetCollections:", v7);

  v8 = objc_loadWeakRetained(v2);
  objc_msgSend(v8, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__MSASStateMachine__sendPutAssetCollectionsDisposition_params___block_invoke_3;
  block[3] = &unk_1E95BB300;
  objc_copyWeak(&v11, v2);
  dispatch_async(v9, block);

  objc_destroyWeak(&v11);
}

uint64_t __63__MSASStateMachine__sendPutAssetCollectionsDisposition_params___block_invoke_234(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "reset");
}

void __63__MSASStateMachine__sendPutAssetCollectionsDisposition_params___block_invoke_2_235(uint64_t a1)
{
  id *v1;
  void *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "daemon");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "personID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didReceiveAuthSuccessForPersonID:", v4);

}

void __63__MSASStateMachine__sendPutAssetCollectionsDisposition_params___block_invoke_3_236(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id WeakRetained;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id obj;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  obj = *(id *)(a1 + 32);
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v12)
  {
    v11 = *(_QWORD *)v14;
    do
    {
      v2 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(obj);
        v3 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v2);
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
        objc_msgSend(WeakRetained, "delegate");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_loadWeakRetained((id *)(a1 + 64));
        v7 = *(_QWORD *)(a1 + 40);
        v8 = *(_QWORD *)(a1 + 48);
        objc_msgSend(*(id *)(a1 + 56), "_assetCollectionRejectedError");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "MSASStateMachine:didFinishAddingAssetCollection:toAlbum:info:error:", v6, v3, v7, v8, v9);

        ++v2;
      }
      while (v12 != v2);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v12);
  }

}

void __63__MSASStateMachine__sendPutAssetCollectionsDisposition_params___block_invoke_4(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_assetUploader");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__MSASStateMachine__sendPutAssetCollectionsDisposition_params___block_invoke_5;
  v6[3] = &unk_1E95BBA08;
  v7 = *(id *)(a1 + 32);
  objc_copyWeak(&v8, v2);
  objc_msgSend(v4, "unregisterAssetCollections:completionBlock:", v5, v6);

  objc_destroyWeak(&v8);
}

void __63__MSASStateMachine__sendPutAssetCollectionsDisposition_params___block_invoke_5(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id WeakRetained;
  id *v9;
  id v10;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v15;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v6);
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
        objc_msgSend(WeakRetained, "_deleteAssetFilesInAssetCollection:", v7);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v4);
  }

  v9 = (id *)(a1 + 40);
  v10 = objc_loadWeakRetained(v9);
  objc_msgSend(v10, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__MSASStateMachine__sendPutAssetCollectionsDisposition_params___block_invoke_6;
  block[3] = &unk_1E95BB300;
  objc_copyWeak(&v13, v9);
  dispatch_async(v11, block);

  objc_destroyWeak(&v13);
}

void __63__MSASStateMachine__sendPutAssetCollectionsDisposition_params___block_invoke_6(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "workQueueDidFinishCommand");

}

void __63__MSASStateMachine__sendPutAssetCollectionsDisposition_params___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "workQueueDidFinishCommand");

}

void __58__MSASStateMachine__sendUploadCompleteDisposition_params___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(a1[4], "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__MSASStateMachine__sendUploadCompleteDisposition_params___block_invoke_2;
  block[3] = &unk_1E95BB9B8;
  v17 = v7;
  v11 = v7;
  objc_copyWeak(&v25, a1 + 9);
  v12 = a1[5];
  v13 = a1[4];
  v18 = v12;
  v19 = v13;
  v20 = a1[6];
  v21 = a1[7];
  v22 = a1[8];
  v23 = v8;
  v24 = v9;
  v14 = v9;
  v15 = v8;
  dispatch_async(v10, block);

  objc_destroyWeak(&v25);
}

void __58__MSASStateMachine__sendUploadCompleteDisposition_params___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id obj;
  id obja;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v29 != v4)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 40), "delegate");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = *(void **)(a1 + 40);
        v9 = *(_QWORD *)(a1 + 48);
        v10 = *(_QWORD *)(a1 + 56);
        objc_msgSend(v8, "_canceledError");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "MSASStateMachine:didFinishAddingAssetCollection:toAlbum:info:error:", v8, v6, v9, v10, v11);

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v3);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  obja = *(id *)(a1 + 64);
  v12 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v25;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(obja);
        v16 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j);
        objc_msgSend(*(id *)(a1 + 40), "delegate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = *(_QWORD *)(a1 + 40);
        v19 = *(_QWORD *)(a1 + 48);
        v20 = *(_QWORD *)(a1 + 56);
        objc_msgSend(*(id *)(a1 + 64), "objectForKey:", v16);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "MSASStateMachine:didFinishAddingAssetCollection:toAlbum:info:error:", v18, v16, v19, v20, v21);

      }
      v13 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v13);
  }

}

void __58__MSASStateMachine__sendUploadCompleteDisposition_params___block_invoke_2(id *a1)
{
  id *v1;
  id *v2;
  id WeakRetained;
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  NSObject *v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t k;
  uint64_t v41;
  id v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t m;
  uint64_t v47;
  id v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t n;
  uint64_t v53;
  id v54;
  NSObject *v55;
  id *v56;
  id v57;
  void *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t ii;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  id v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t jj;
  void *v72;
  id v73;
  void *v74;
  void *v75;
  id v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t kk;
  void *v81;
  id v82;
  void *v83;
  void *v84;
  id v85;
  id v86;
  void *v87;
  id v88;
  void *v89;
  id v90;
  void *v91;
  void *v92;
  id v93;
  void *v94;
  void *v95;
  id v96;
  id v97;
  void *v98;
  id obj;
  id obja;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  _QWORD v114[4];
  id v115;
  id v116;
  id v117;
  id v118;
  id v119;
  id v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  _QWORD v133[5];
  _QWORD v134[5];
  id v135;
  id v136;
  id v137;
  id v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  _QWORD block[5];
  id v144;
  id v145;
  id v146;
  id v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  _BYTE v152[128];
  _BYTE v153[128];
  _BYTE v154[128];
  _BYTE v155[128];
  _BYTE v156[128];
  _BYTE v157[128];
  _BYTE v158[128];
  uint8_t v159[128];
  uint8_t buf[4];
  id v161;
  __int16 v162;
  void *v163;
  uint64_t v164;

  v1 = a1;
  v164 = *MEMORY[0x1E0C80C00];
  if (a1[4])
  {
    v2 = a1 + 12;
    WeakRetained = objc_loadWeakRetained(a1 + 12);
    v4 = v1[4];
    NSStringFromSelector(sel__sendUploadCompleteDisposition_params_);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v4) = objc_msgSend(WeakRetained, "workQueueEndCommandWithError:command:params:albumGUID:assetCollectionGUID:", v4, v5, 0, 0, 0);

    if ((v4 & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v97 = objc_loadWeakRetained(v2);
        objc_msgSend(a1[4], "MSVerboseDescription");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v161 = v97;
        v162 = 2114;
        v163 = v98;
        _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Failed to send upload complete. Error: %{public}@", buf, 0x16u);

      }
      v6 = objc_loadWeakRetained(v2);
      objc_msgSend(v6, "_model");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "beginTransaction");

      v150 = 0u;
      v151 = 0u;
      v148 = 0u;
      v149 = 0u;
      obj = a1[5];
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v148, v159, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v149;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v149 != v9)
              objc_enumerationMutation(obj);
            v11 = *(void **)(*((_QWORD *)&v148 + 1) + 8 * i);
            v12 = objc_loadWeakRetained(v2);
            objc_msgSend(v12, "_model");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "GUID");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "requeuePendingAssetCollectionGUID:", v14);

            v15 = objc_loadWeakRetained(v2);
            objc_msgSend(v15, "_deleteAssetFilesInAssetCollection:", v11);

            objc_msgSend(a1[6], "eventQueue");
            v16 = objc_claimAutoreleasedReturnValue();
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __58__MSASStateMachine__sendUploadCompleteDisposition_params___block_invoke_227;
            block[3] = &unk_1E95BB6C0;
            objc_copyWeak(&v147, v2);
            block[4] = v11;
            v144 = a1[7];
            v145 = a1[8];
            v146 = a1[4];
            dispatch_async(v16, block);

            objc_destroyWeak(&v147);
          }
          v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v148, v159, 16);
        }
        while (v8);
      }

      v141 = 0u;
      v142 = 0u;
      v139 = 0u;
      v140 = 0u;
      obja = a1[9];
      v17 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v139, v158, 16);
      if (v17)
      {
        v18 = *(_QWORD *)v140;
        do
        {
          for (j = 0; j != v17; ++j)
          {
            if (*(_QWORD *)v140 != v18)
              objc_enumerationMutation(obja);
            v20 = *(void **)(*((_QWORD *)&v139 + 1) + 8 * j);
            v21 = objc_loadWeakRetained(v2);
            objc_msgSend(v21, "_model");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "GUID");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "requeuePendingAssetCollectionGUID:", v23);

            v24 = objc_loadWeakRetained(v2);
            objc_msgSend(v24, "_deleteAssetFilesInAssetCollection:", v20);

            objc_msgSend(a1[6], "eventQueue");
            v25 = objc_claimAutoreleasedReturnValue();
            v134[0] = MEMORY[0x1E0C809B0];
            v134[1] = 3221225472;
            v134[2] = __58__MSASStateMachine__sendUploadCompleteDisposition_params___block_invoke_2_228;
            v134[3] = &unk_1E95BB6C0;
            objc_copyWeak(&v138, v2);
            v134[4] = v20;
            v135 = a1[7];
            v136 = a1[8];
            v137 = a1[9];
            dispatch_async(v25, v134);

            objc_destroyWeak(&v138);
          }
          v17 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v139, v158, 16);
        }
        while (v17);
      }

      v26 = objc_loadWeakRetained(v2);
      objc_msgSend(v26, "_model");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "endTransaction");

      v28 = objc_loadWeakRetained(v2);
      objc_msgSend(v28, "_assetUploader");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "unregisterAssetCollections:", a1[5]);

      v30 = objc_loadWeakRetained(v2);
      objc_msgSend(v30, "_assetUploader");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[9], "allKeys");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "unregisterAssetCollections:", v32);

      v33 = objc_loadWeakRetained(v2);
      objc_msgSend(v33, "workQueueDidFinishCommand");

    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v34 = objc_loadWeakRetained(v1 + 12);
      *(_DWORD *)buf = 138543362;
      v161 = v34;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Successfully sent upload complete.", buf, 0xCu);

      v1 = a1;
    }
    objc_msgSend(v1[6], "memberQueue");
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = MEMORY[0x1E0C809B0];
    v133[0] = MEMORY[0x1E0C809B0];
    v133[1] = 3221225472;
    v133[2] = __58__MSASStateMachine__sendUploadCompleteDisposition_params___block_invoke_229;
    v133[3] = &unk_1E95BCED0;
    v133[4] = v1[6];
    dispatch_barrier_sync(v35, v133);

    v131 = 0u;
    v132 = 0u;
    v129 = 0u;
    v130 = 0u;
    v37 = a1[10];
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v129, v157, 16);
    if (v38)
    {
      v39 = *(_QWORD *)v130;
      do
      {
        for (k = 0; k != v38; ++k)
        {
          if (*(_QWORD *)v130 != v39)
            objc_enumerationMutation(v37);
          v41 = *(_QWORD *)(*((_QWORD *)&v129 + 1) + 8 * k);
          v42 = objc_loadWeakRetained(a1 + 12);
          objc_msgSend(v42, "_deleteAssetFilesInAssetCollection:", v41);

        }
        v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v129, v157, 16);
      }
      while (v38);
    }

    v127 = 0u;
    v128 = 0u;
    v125 = 0u;
    v126 = 0u;
    v43 = a1[11];
    v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v125, v156, 16);
    if (v44)
    {
      v45 = *(_QWORD *)v126;
      do
      {
        for (m = 0; m != v44; ++m)
        {
          if (*(_QWORD *)v126 != v45)
            objc_enumerationMutation(v43);
          v47 = *(_QWORD *)(*((_QWORD *)&v125 + 1) + 8 * m);
          v48 = objc_loadWeakRetained(a1 + 12);
          objc_msgSend(v48, "_deleteAssetFilesInAssetCollection:", v47);

        }
        v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v125, v156, 16);
      }
      while (v44);
    }

    v123 = 0u;
    v124 = 0u;
    v121 = 0u;
    v122 = 0u;
    v49 = a1[9];
    v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v121, v155, 16);
    if (v50)
    {
      v51 = *(_QWORD *)v122;
      do
      {
        for (n = 0; n != v50; ++n)
        {
          if (*(_QWORD *)v122 != v51)
            objc_enumerationMutation(v49);
          v53 = *(_QWORD *)(*((_QWORD *)&v121 + 1) + 8 * n);
          v54 = objc_loadWeakRetained(a1 + 12);
          objc_msgSend(v54, "_deleteAssetFilesInAssetCollection:", v53);

        }
        v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v121, v155, 16);
      }
      while (v50);
    }

    objc_msgSend(a1[6], "eventQueue");
    v55 = objc_claimAutoreleasedReturnValue();
    v114[0] = v36;
    v114[1] = 3221225472;
    v114[2] = __58__MSASStateMachine__sendUploadCompleteDisposition_params___block_invoke_2_230;
    v114[3] = &unk_1E95BB8D0;
    v56 = a1 + 12;
    objc_copyWeak(&v120, a1 + 12);
    v115 = a1[10];
    v116 = a1[7];
    v117 = a1[8];
    v118 = a1[11];
    v119 = a1[9];
    dispatch_async(v55, v114);

    v57 = objc_loadWeakRetained(a1 + 12);
    objc_msgSend(v57, "_model");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "beginTransaction");

    v112 = 0u;
    v113 = 0u;
    v110 = 0u;
    v111 = 0u;
    v59 = a1[10];
    v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v110, v154, 16);
    if (v60)
    {
      v61 = *(_QWORD *)v111;
      do
      {
        for (ii = 0; ii != v60; ++ii)
        {
          if (*(_QWORD *)v111 != v61)
            objc_enumerationMutation(v59);
          v63 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * ii);
          v64 = objc_loadWeakRetained(v56);
          objc_msgSend(v64, "_model");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "GUID");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "requeuePendingAssetCollectionGUID:", v66);

          v67 = objc_loadWeakRetained(v56);
          objc_msgSend(v67, "_deleteAssetFilesInAssetCollection:", v63);

        }
        v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v110, v154, 16);
      }
      while (v60);
    }

    v108 = 0u;
    v109 = 0u;
    v106 = 0u;
    v107 = 0u;
    v68 = a1[11];
    v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v106, v153, 16);
    if (v69)
    {
      v70 = *(_QWORD *)v107;
      do
      {
        for (jj = 0; jj != v69; ++jj)
        {
          if (*(_QWORD *)v107 != v70)
            objc_enumerationMutation(v68);
          v72 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * jj);
          v73 = objc_loadWeakRetained(v56);
          objc_msgSend(v73, "_model");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "GUID");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "requeuePendingAssetCollectionGUID:", v75);

          v76 = objc_loadWeakRetained(v56);
          objc_msgSend(v76, "_deleteAssetFilesInAssetCollection:", v72);

        }
        v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v106, v153, 16);
      }
      while (v69);
    }

    v104 = 0u;
    v105 = 0u;
    v102 = 0u;
    v103 = 0u;
    v77 = a1[9];
    v78 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v102, v152, 16);
    if (v78)
    {
      v79 = *(_QWORD *)v103;
      do
      {
        for (kk = 0; kk != v78; ++kk)
        {
          if (*(_QWORD *)v103 != v79)
            objc_enumerationMutation(v77);
          v81 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * kk);
          v82 = objc_loadWeakRetained(v56);
          objc_msgSend(v82, "_model");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "GUID");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "requeuePendingAssetCollectionGUID:", v84);

          v85 = objc_loadWeakRetained(v56);
          objc_msgSend(v85, "_deleteAssetFilesInAssetCollection:", v81);

        }
        v78 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v102, v152, 16);
      }
      while (v78);
    }

    v86 = objc_loadWeakRetained(v56);
    objc_msgSend(v86, "_model");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "endTransaction");

    v88 = objc_loadWeakRetained(v56);
    objc_msgSend(v88, "_assetUploader");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "unregisterAssetCollections:", a1[10]);

    v90 = objc_loadWeakRetained(v56);
    objc_msgSend(v90, "_assetUploader");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[11], "allKeys");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "unregisterAssetCollections:", v92);

    v93 = objc_loadWeakRetained(v56);
    objc_msgSend(v93, "_assetUploader");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[9], "allKeys");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "unregisterAssetCollections:", v95);

    v96 = objc_loadWeakRetained(v56);
    objc_msgSend(v96, "workQueueDidFinishCommand");

    objc_destroyWeak(&v120);
  }
}

void __58__MSASStateMachine__sendUploadCompleteDisposition_params___block_invoke_227(uint64_t a1)
{
  id *v2;
  void *v3;
  id v4;
  id WeakRetained;

  v2 = (id *)(a1 + 64);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "MSASStateMachine:didFinishAddingAssetCollection:toAlbum:info:error:", v4, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

void __58__MSASStateMachine__sendUploadCompleteDisposition_params___block_invoke_2_228(uint64_t a1)
{
  id *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id WeakRetained;

  v2 = (id *)(a1 + 64);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_loadWeakRetained(v2);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "objectForKey:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "MSASStateMachine:didFinishAddingAssetCollection:toAlbum:info:error:", v4, v5, v6, v7, v8);

}

uint64_t __58__MSASStateMachine__sendUploadCompleteDisposition_params___block_invoke_229(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "reset");
}

void __58__MSASStateMachine__sendUploadCompleteDisposition_params___block_invoke_2_230(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id obj;
  id obja;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
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
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 72);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(WeakRetained, "daemon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "personID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didReceiveAuthSuccessForPersonID:", v6);

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v7 = *(id *)(a1 + 32);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v47;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v47 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * v11);
        v13 = objc_loadWeakRetained(v2);
        objc_msgSend(v13, "delegate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_loadWeakRetained(v2);
        objc_msgSend(v14, "MSASStateMachine:didFinishAddingAssetCollection:toAlbum:info:error:", v15, v12, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
    }
    while (v9);
  }

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = *(id *)(a1 + 56);
  v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
  if (v36)
  {
    v34 = *(_QWORD *)v43;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v43 != v34)
          objc_enumerationMutation(obj);
        v17 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v16);
        v18 = objc_loadWeakRetained(v2);
        objc_msgSend(v18, "delegate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_loadWeakRetained(v2);
        v21 = *(_QWORD *)(a1 + 40);
        v22 = *(_QWORD *)(a1 + 48);
        objc_msgSend(*(id *)(a1 + 56), "objectForKey:", v17);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "MSASStateMachine:didFinishAddingAssetCollection:toAlbum:info:error:", v20, v17, v21, v22, v23);

        ++v16;
      }
      while (v36 != v16);
      v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
    }
    while (v36);
  }

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  obja = *(id *)(a1 + 64);
  v37 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
  if (v37)
  {
    v35 = *(_QWORD *)v39;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v39 != v35)
          objc_enumerationMutation(obja);
        v25 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v24);
        v26 = objc_loadWeakRetained(v2);
        objc_msgSend(v26, "delegate");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_loadWeakRetained(v2);
        v29 = *(_QWORD *)(a1 + 40);
        v30 = *(_QWORD *)(a1 + 48);
        objc_msgSend(*(id *)(a1 + 64), "objectForKey:", v25);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "MSASStateMachine:didFinishAddingAssetCollection:toAlbum:info:error:", v28, v25, v29, v30, v31);

        ++v24;
      }
      while (v37 != v24);
      v37 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
    }
    while (v37);
  }

}

void __70__MSASStateMachine__continueAddingAssetCollectionsDisposition_params___block_invoke(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v3 = a2;
  objc_msgSend(a1[4], "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__MSASStateMachine__continueAddingAssetCollectionsDisposition_params___block_invoke_2;
  block[3] = &unk_1E95BB4B8;
  v9 = a1[5];
  v10 = v3;
  v11 = a1[6];
  v5 = a1[7];
  v6 = a1[4];
  v12 = v5;
  v13 = v6;
  v14 = a1[8];
  v15 = a1[9];
  v7 = v3;
  dispatch_async(v4, block);

}

void __70__MSASStateMachine__continueAddingAssetCollectionsDisposition_params___block_invoke_226(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v2, "_canceledError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "MSASStateMachine:didFinishAddingAssetCollection:toAlbum:info:error:", v2, v3, 0, v4, v5);

}

void __70__MSASStateMachine__continueAddingAssetCollectionsDisposition_params___block_invoke_2(uint64_t a1)
{
  unint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  uint64_t v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v2 = 0;
    do
    {
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", v2);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", v2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4 == v5)
        objc_msgSend(*(id *)(a1 + 48), "addObject:", v3);
      else
        objc_msgSend(*(id *)(a1 + 56), "setObject:forKey:", v4, v3);

      ++v2;
    }
    while (v2 < objc_msgSend(*(id *)(a1 + 32), "count"));
  }
  if (objc_msgSend(*(id *)(a1 + 56), "count"))
  {
    objc_msgSend(*(id *)(a1 + 64), "_model");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "beginTransaction");

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v7 = *(id *)(a1 + 56);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v32;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v32 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v11);
          objc_msgSend(*(id *)(a1 + 64), "_model", (_QWORD)v31);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "GUID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "requeuePendingAssetCollectionGUID:", v14);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
      }
      while (v9);
    }

    objc_msgSend(*(id *)(a1 + 64), "_model");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "endTransaction");

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", *(_QWORD *)(a1 + 56), CFSTR("failedAssetCollectionsAndErrors"));
    v17 = *(_QWORD *)(a1 + 72);
    if (v17)
      objc_msgSend(v16, "setObject:forKey:", v17, CFSTR("album"));
    v18 = *(_QWORD *)(a1 + 80);
    if (v18)
      objc_msgSend(v16, "setObject:forKey:", v18, CFSTR("info"));
    objc_msgSend(*(id *)(a1 + 64), "_model", (_QWORD)v31);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel__sendUploadCompleteDisposition_params_);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 64), "personID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 72), "GUID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "enqueueCommand:params:personID:albumGUID:assetCollectionGUID:", v20, v16, v21, v22, 0);

    objc_msgSend(*(id *)(a1 + 64), "workQueueRetryOutstandingActivities");
  }
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKey:", *(_QWORD *)(a1 + 48), CFSTR("successfulAssetCollections"));
    v24 = *(_QWORD *)(a1 + 72);
    if (v24)
      objc_msgSend(v23, "setObject:forKey:", v24, CFSTR("album"));
    v25 = *(_QWORD *)(a1 + 80);
    if (v25)
      objc_msgSend(v23, "setObject:forKey:", v25, CFSTR("info"));
    v26 = *(void **)(a1 + 64);
    NSStringFromSelector(sel__sendPutAssetCollectionsDisposition_params_);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 64), "personID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 72), "GUID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "workQueueDidFinishCommandByReplacingCurrentCommandWithCommand:params:personID:albumGUID:assetCollectionGUID:", v27, v23, v28, v29, 0);

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v30 = *(_QWORD *)(a1 + 64);
      *(_DWORD *)buf = 138543362;
      v36 = v30;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: No valid asset collections to send to the metadata server.", buf, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 64), "workQueueDidFinishCommand");
  }
}

void __85__MSASStateMachine_continueAddingAssetCollections_skipAssetCollections_toAlbum_info___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v2 = *(_QWORD *)(a1 + 40);
      v3 = objc_msgSend(*(id *)(a1 + 32), "count");
      *(_DWORD *)buf = 138543618;
      v32 = v2;
      v33 = 2048;
      v34 = v3;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Skipping publication of %ld asset collections.", buf, 0x16u);
    }
    objc_msgSend(*(id *)(a1 + 40), "_deleteAssetFilesInAssetCollections:", *(_QWORD *)(a1 + 48));
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v4 = *(id *)(a1 + 32);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v27;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v27 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v8);
          objc_msgSend(*(id *)(a1 + 40), "_model", (_QWORD)v26);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "GUID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "requeuePendingAssetCollectionGUID:", v11);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v6);
    }

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", (_QWORD)v26);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (*(_QWORD *)(a1 + 48))
    objc_msgSend(v12, "setObject:forKey:", *(_QWORD *)(a1 + 56), CFSTR("assetCollections"));
  v14 = *(_QWORD *)(a1 + 64);
  if (v14)
    objc_msgSend(v13, "setObject:forKey:", v14, CFSTR("album"));
  v15 = *(_QWORD *)(a1 + 72);
  if (v15)
    objc_msgSend(v13, "setObject:forKey:", v15, CFSTR("info"));
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v16 = *(_QWORD *)(a1 + 40);
    v17 = objc_msgSend(*(id *)(a1 + 48), "count");
    *(_DWORD *)buf = 138543618;
    v32 = v16;
    v33 = 2048;
    v34 = v17;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Scheduling addition of %ld asset collections.", buf, 0x16u);
  }
  v18 = *(_QWORD *)(a1 + 40);
  if (*(_DWORD *)(v18 + 8) == 2)
  {
    v19 = *(void **)(v18 + 24);
    NSStringFromSelector(sel__addAssetCollectionsDisposition_params_);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v19) = objc_msgSend(v19, "isEqualToString:", v20);

    if ((v19 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v25 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      v32 = v25;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Not expecting derivatives to arrive from plugin. Proceeding anyway.", buf, 0xCu);
    }
  }
  v21 = *(void **)(a1 + 40);
  NSStringFromSelector(sel__continueAddingAssetCollectionsDisposition_params_);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "personID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 64), "GUID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "workQueueDidFinishCommandByReplacingCurrentCommandWithCommand:params:personID:albumGUID:assetCollectionGUID:", v22, v13, v23, v24, 0);

}

void __59__MSASStateMachine__addAssetCollectionsDisposition_params___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "MSASStateMachine:didFinishAddingAssetCollection:toAlbum:info:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

}

void __59__MSASStateMachine__addAssetCollectionsDisposition_params___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v2, "derivativeSpecifications");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "MSASStateMachine:didRequestAssetsForAddingAssetCollections:inAlbum:specifications:info:", v2, v3, v4, v5, *(_QWORD *)(a1 + 56));

}

void __59__MSASStateMachine__addAssetCollectionsDisposition_params___block_invoke_3(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 40), "delegate", (_QWORD)v12);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = *(void **)(a1 + 40);
        v10 = *(_QWORD *)(a1 + 48);
        objc_msgSend(v9, "_canceledError");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "MSASStateMachine:didFinishAddingAssetCollection:toAlbum:info:error:", v9, v7, 0, v10, v11);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }

}

void __53__MSASStateMachine_addAssetCollections_toAlbum_info___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v20;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v20 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v6);
        objc_msgSend(*(id *)(a1 + 40), "_model", (_QWORD)v19);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "GUID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "GUID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addPendingAssetCollectionGUID:albumGUID:", v9, v10);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v4);
  }

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(v11, "setObject:forKey:", *(_QWORD *)(a1 + 56), CFSTR("assetCollections"));
  v13 = *(_QWORD *)(a1 + 48);
  if (v13)
    objc_msgSend(v12, "setObject:forKey:", v13, CFSTR("album"));
  v14 = *(_QWORD *)(a1 + 64);
  if (v14)
    objc_msgSend(v12, "setObject:forKey:", v14, CFSTR("info"));
  objc_msgSend(*(id *)(a1 + 40), "_model", (_QWORD)v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel__addAssetCollectionsDisposition_params_);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "personID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "GUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "enqueueCommand:params:personID:albumGUID:assetCollectionGUID:", v16, v12, v17, v18, 0);

  objc_msgSend(*(id *)(a1 + 40), "workQueueRetryOutstandingActivities");
}

void __51__MSASStateMachine__updateAlbumDisposition_params___block_invoke(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v3 = a2;
  objc_msgSend(a1[4], "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__MSASStateMachine__updateAlbumDisposition_params___block_invoke_2;
  block[3] = &unk_1E95BB6C0;
  v9 = v3;
  v5 = v3;
  objc_copyWeak(&v13, a1 + 7);
  v6 = a1[5];
  v7 = a1[4];
  v10 = v6;
  v11 = v7;
  v12 = a1[6];
  dispatch_async(v4, block);

  objc_destroyWeak(&v13);
}

void __51__MSASStateMachine__updateAlbumDisposition_params___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v2, "_canceledError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "MSASStateMachine:didFinishUpdatingAlbum:info:error:", v2, v3, v4, v5);

}

void __51__MSASStateMachine__updateAlbumDisposition_params___block_invoke_2(id *a1)
{
  id WeakRetained;
  char v3;
  NSObject *v4;
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[5];
  _QWORD block[4];
  id v22;
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (a1[4])
  {
    WeakRetained = objc_loadWeakRetained(a1 + 8);
    v3 = objc_msgSend(WeakRetained, "workQueueEndCommandWithError:command:params:albumGUID:assetCollectionGUID:", a1[4], 0, 0, 0, 0);

    if ((v3 & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v12 = objc_loadWeakRetained(a1 + 8);
        v13 = a1[5];
        objc_msgSend(a1[4], "MSVerboseDescription");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v27 = v12;
        v28 = 2114;
        v29 = v13;
        v30 = 2114;
        v31 = v14;
        _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Failed to update album %{public}@. Error: %{public}@", buf, 0x20u);

      }
      objc_msgSend(a1[6], "eventQueue");
      v4 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __51__MSASStateMachine__updateAlbumDisposition_params___block_invoke_212;
      block[3] = &unk_1E95BB780;
      objc_copyWeak(&v25, a1 + 8);
      v22 = a1[5];
      v23 = a1[7];
      v24 = a1[4];
      dispatch_async(v4, block);

      v5 = objc_loadWeakRetained(a1 + 8);
      objc_msgSend(v5, "workQueueDidFinishCommand");

      objc_destroyWeak(&v25);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v6 = objc_loadWeakRetained(a1 + 8);
      v7 = a1[5];
      *(_DWORD *)buf = 138543618;
      v27 = v6;
      v28 = 2114;
      v29 = v7;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Successfully updated album %{public}@", buf, 0x16u);

    }
    objc_msgSend(a1[6], "memberQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __51__MSASStateMachine__updateAlbumDisposition_params___block_invoke_213;
    v20[3] = &unk_1E95BCED0;
    v20[4] = a1[6];
    dispatch_barrier_sync(v8, v20);

    objc_msgSend(a1[6], "eventQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    v15[0] = v9;
    v15[1] = 3221225472;
    v15[2] = __51__MSASStateMachine__updateAlbumDisposition_params___block_invoke_2_214;
    v15[3] = &unk_1E95BB780;
    objc_copyWeak(&v19, a1 + 8);
    v16 = a1[5];
    v17 = a1[7];
    v18 = a1[4];
    dispatch_async(v10, v15);

    v11 = objc_loadWeakRetained(a1 + 8);
    objc_msgSend(v11, "workQueueDidFinishCommand");

    objc_destroyWeak(&v19);
  }
}

void __51__MSASStateMachine__updateAlbumDisposition_params___block_invoke_212(uint64_t a1)
{
  id *v2;
  void *v3;
  id v4;
  id WeakRetained;

  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "MSASStateMachine:didFinishUpdatingAlbum:info:error:", v4, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __51__MSASStateMachine__updateAlbumDisposition_params___block_invoke_213(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "reset");
}

void __51__MSASStateMachine__updateAlbumDisposition_params___block_invoke_2_214(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "daemon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "personID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didReceiveAuthSuccessForPersonID:", v6);

  v9 = objc_loadWeakRetained(v2);
  objc_msgSend(v9, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_loadWeakRetained(v2);
  objc_msgSend(v7, "MSASStateMachine:didFinishUpdatingAlbum:info:error:", v8, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __54__MSASStateMachine_updateAlbum_updateAlbumFlags_info___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v10 = v2;
  if (v3)
    objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("album"));
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    objc_msgSend(v10, "setObject:forKey:", v4, CFSTR("info"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 56));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v5, CFSTR("albumFlags"));

  objc_msgSend(*(id *)(a1 + 48), "_model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel__updateAlbumDisposition_params_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "personID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "GUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "enqueueCommand:params:personID:albumGUID:assetCollectionGUID:", v7, v10, v8, v9, 0);

  objc_msgSend(*(id *)(a1 + 48), "workQueueRetryOutstandingActivities");
}

void __51__MSASStateMachine__createAlbumDisposition_params___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v5 = a2;
  v6 = a3;
  objc_msgSend(a1[4], "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __51__MSASStateMachine__createAlbumDisposition_params___block_invoke_2;
  v12[3] = &unk_1E95BB8D0;
  v13 = v5;
  v8 = v5;
  objc_copyWeak(&v18, a1 + 7);
  v9 = a1[5];
  v10 = a1[4];
  v14 = v9;
  v15 = v10;
  v16 = a1[6];
  v17 = v6;
  v11 = v6;
  dispatch_async(v7, v12);

  objc_destroyWeak(&v18);
}

void __51__MSASStateMachine__createAlbumDisposition_params___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v2, "_canceledError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "MSASStateMachine:didFinishCreatingAlbum:info:error:", v2, v3, v4, v5);

}

void __51__MSASStateMachine__createAlbumDisposition_params___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  char v3;
  NSObject *v4;
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[5];
  _QWORD block[4];
  id v22;
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    v3 = objc_msgSend(WeakRetained, "workQueueEndCommandWithError:command:params:albumGUID:assetCollectionGUID:", *(_QWORD *)(a1 + 32), 0, 0, 0, 0);

    if ((v3 & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v12 = objc_loadWeakRetained((id *)(a1 + 72));
        v13 = *(_QWORD *)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 32), "MSVerboseDescription");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v27 = v12;
        v28 = 2114;
        v29 = v13;
        v30 = 2114;
        v31 = v14;
        _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Failed to create album %{public}@. Error: %{public}@", buf, 0x20u);

      }
      objc_msgSend(*(id *)(a1 + 48), "eventQueue");
      v4 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __51__MSASStateMachine__createAlbumDisposition_params___block_invoke_207;
      block[3] = &unk_1E95BB780;
      objc_copyWeak(&v25, (id *)(a1 + 72));
      v22 = *(id *)(a1 + 40);
      v23 = *(id *)(a1 + 56);
      v24 = *(id *)(a1 + 32);
      dispatch_async(v4, block);

      v5 = objc_loadWeakRetained((id *)(a1 + 72));
      objc_msgSend(v5, "workQueueDidFinishCommand");

      objc_destroyWeak(&v25);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v6 = objc_loadWeakRetained((id *)(a1 + 72));
      v7 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v27 = v6;
      v28 = 2114;
      v29 = v7;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Successfully created album %{public}@", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 48), "memberQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __51__MSASStateMachine__createAlbumDisposition_params___block_invoke_208;
    v20[3] = &unk_1E95BCED0;
    v20[4] = *(_QWORD *)(a1 + 48);
    dispatch_barrier_sync(v8, v20);

    objc_msgSend(*(id *)(a1 + 40), "setCtag:", *(_QWORD *)(a1 + 64));
    objc_msgSend(*(id *)(a1 + 48), "eventQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    v15[0] = v9;
    v15[1] = 3221225472;
    v15[2] = __51__MSASStateMachine__createAlbumDisposition_params___block_invoke_2_209;
    v15[3] = &unk_1E95BB780;
    objc_copyWeak(&v19, (id *)(a1 + 72));
    v16 = *(id *)(a1 + 40);
    v17 = *(id *)(a1 + 56);
    v18 = *(id *)(a1 + 32);
    dispatch_async(v10, v15);

    v11 = objc_loadWeakRetained((id *)(a1 + 72));
    objc_msgSend(v11, "workQueueDidFinishCommand");

    objc_destroyWeak(&v19);
  }
}

void __51__MSASStateMachine__createAlbumDisposition_params___block_invoke_207(uint64_t a1)
{
  id *v2;
  void *v3;
  id v4;
  id WeakRetained;

  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "MSASStateMachine:didFinishCreatingAlbum:info:error:", v4, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __51__MSASStateMachine__createAlbumDisposition_params___block_invoke_208(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "reset");
}

void __51__MSASStateMachine__createAlbumDisposition_params___block_invoke_2_209(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "daemon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "personID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didReceiveAuthSuccessForPersonID:", v6);

  v9 = objc_loadWeakRetained(v2);
  objc_msgSend(v9, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_loadWeakRetained(v2);
  objc_msgSend(v7, "MSASStateMachine:didFinishCreatingAlbum:info:error:", v8, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __37__MSASStateMachine_createAlbum_info___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v9 = v2;
  if (v3)
    objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("album"));
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    objc_msgSend(v9, "setObject:forKey:", v4, CFSTR("info"));
  objc_msgSend(*(id *)(a1 + 48), "_model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel__createAlbumDisposition_params_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "personID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "GUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enqueueCommand:params:personID:albumGUID:assetCollectionGUID:", v6, v9, v7, v8, 0);

  objc_msgSend(*(id *)(a1 + 48), "workQueueRetryOutstandingActivities");
}

void __53__MSASStateMachine__deleteCommentDisposition_params___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "MSASStateMachine:didFinishDeletingComment:inAssetCollection:inAlbum:info:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));

}

void __53__MSASStateMachine__deleteCommentDisposition_params___block_invoke_201(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v3 = a2;
  objc_msgSend(a1[4], "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__MSASStateMachine__deleteCommentDisposition_params___block_invoke_2;
  v8[3] = &unk_1E95BB7D0;
  v9 = v3;
  v5 = v3;
  objc_copyWeak(&v16, a1 + 10);
  v10 = a1[5];
  v11 = a1[6];
  v12 = a1[7];
  v6 = a1[8];
  v7 = a1[4];
  v13 = v6;
  v14 = v7;
  v15 = a1[9];
  dispatch_async(v4, v8);

  objc_destroyWeak(&v16);
}

void __53__MSASStateMachine__deleteCommentDisposition_params___block_invoke_2_204(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 64);
  objc_msgSend(v2, "_canceledError");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "MSASStateMachine:didFinishDeletingComment:inAssetCollection:inAlbum:info:error:", v2, v3, v4, v5, v6, v7);

}

void __53__MSASStateMachine__deleteCommentDisposition_params___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id *v9;
  id v10;
  id *v11;
  id *v12;
  id *v13;
  id *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  _QWORD block[4];
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  uint8_t buf[4];
  id v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
    v3 = *(_QWORD *)(a1 + 32);
    NSStringFromSelector(sel__deleteCommentDisposition_params_);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "GUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "GUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v3) = objc_msgSend(WeakRetained, "workQueueEndCommandWithError:command:params:albumGUID:assetCollectionGUID:", v3, v4, v5, v6, v7);

    if ((v3 & 1) != 0)
      return;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v21 = objc_loadWeakRetained((id *)(a1 + 88));
      v22 = *(_QWORD *)(a1 + 56);
      v23 = *(_QWORD *)(a1 + 64);
      v24 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 32), "MSVerboseDescription");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v40 = v21;
      v41 = 2114;
      v42 = v23;
      v43 = 2114;
      v44 = v22;
      v45 = 2114;
      v46 = v24;
      v47 = 2114;
      v48 = v25;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Failed to delete comment %{public}@ from asset collection %{public}@ in album %{public}@. Error: %{public}@", buf, 0x34u);

    }
    objc_msgSend(*(id *)(a1 + 72), "eventQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__MSASStateMachine__deleteCommentDisposition_params___block_invoke_202;
    block[3] = &unk_1E95BB8D0;
    v9 = &v38;
    objc_copyWeak(&v38, (id *)(a1 + 88));
    v33 = *(id *)(a1 + 64);
    v34 = *(id *)(a1 + 56);
    v35 = *(id *)(a1 + 48);
    v36 = *(id *)(a1 + 80);
    v37 = *(id *)(a1 + 32);
    dispatch_async(v8, block);

    v10 = objc_loadWeakRetained((id *)(a1 + 88));
    objc_msgSend(v10, "workQueueDidFinishCommand");

    v11 = &v33;
    v12 = &v34;
    v13 = &v35;
    v14 = &v36;
    v15 = v37;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v16 = objc_loadWeakRetained((id *)(a1 + 88));
      v18 = *(_QWORD *)(a1 + 56);
      v17 = *(_QWORD *)(a1 + 64);
      v19 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138544130;
      v40 = v16;
      v41 = 2114;
      v42 = v17;
      v43 = 2114;
      v44 = v18;
      v45 = 2114;
      v46 = v19;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Successfully deleted comment %{public}@ from asset collection %{public}@ in album %{public}@.", buf, 0x2Au);

    }
    objc_msgSend(*(id *)(a1 + 72), "eventQueue");
    v20 = objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __53__MSASStateMachine__deleteCommentDisposition_params___block_invoke_203;
    v26[3] = &unk_1E95BB6C0;
    v9 = &v31;
    objc_copyWeak(&v31, (id *)(a1 + 88));
    v27 = *(id *)(a1 + 64);
    v28 = *(id *)(a1 + 56);
    v29 = *(id *)(a1 + 48);
    v30 = *(id *)(a1 + 80);
    dispatch_async(v20, v26);

    v15 = objc_loadWeakRetained((id *)(a1 + 88));
    objc_msgSend(v15, "workQueueDidFinishCommand");
    v11 = &v27;
    v12 = &v28;
    v13 = &v29;
    v14 = &v30;
  }

  objc_destroyWeak(v9);
}

void __53__MSASStateMachine__deleteCommentDisposition_params___block_invoke_202(uint64_t a1)
{
  id *v2;
  void *v3;
  id v4;
  id WeakRetained;

  v2 = (id *)(a1 + 72);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(WeakRetained, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "MSASStateMachine:didFinishDeletingComment:inAssetCollection:inAlbum:info:error:", v4, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

}

void __53__MSASStateMachine__deleteCommentDisposition_params___block_invoke_203(uint64_t a1)
{
  id *v2;
  void *v3;
  id v4;
  id WeakRetained;

  v2 = (id *)(a1 + 64);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "MSASStateMachine:didFinishDeletingComment:inAssetCollection:inAlbum:info:error:", v4, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 0);

}

uint64_t __66__MSASStateMachine_deleteComments_inAssetCollection_inAlbum_info___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id obj;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = objc_msgSend(*(id *)(a1 + 40), "count");
    v4 = *(_QWORD *)(a1 + 48);
    v5 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)buf = 138544130;
    v30 = v2;
    v31 = 2048;
    v32 = v3;
    v33 = 2114;
    v34 = v4;
    v35 = 2114;
    v36 = v5;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Scheduling deletion of %ld comments in asset collection %{public}@ in album %{public}@.", buf, 0x2Au);
  }
  objc_msgSend(*(id *)(a1 + 32), "_model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "beginTransaction");

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = *(id *)(a1 + 40);
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v7)
  {
    v8 = v7;
    v23 = *(_QWORD *)v25;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v25 != v23)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v9);
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKey:", v10, CFSTR("comment"));
        v12 = *(_QWORD *)(a1 + 48);
        if (v12)
          objc_msgSend(v11, "setObject:forKey:", v12, CFSTR("assetCollection"));
        v13 = *(_QWORD *)(a1 + 56);
        if (v13)
          objc_msgSend(v11, "setObject:forKey:", v13, CFSTR("album"));
        v14 = *(_QWORD *)(a1 + 64);
        if (v14)
          objc_msgSend(v11, "setObject:forKey:", v14, CFSTR("info"));
        objc_msgSend(*(id *)(a1 + 32), "_model");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(sel__deleteCommentDisposition_params_);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "personID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 56), "GUID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "GUID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "enqueueCommand:params:personID:albumGUID:pendingOnAssetCollectionGUID:", v16, v11, v17, v18, v19);

        ++v9;
      }
      while (v8 != v9);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v8);
  }

  objc_msgSend(*(id *)(a1 + 32), "_model");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "endTransaction");

  return objc_msgSend(*(id *)(a1 + 32), "workQueueRetryOutstandingActivities");
}

void __62__MSASStateMachine__deleteAssetCollectionsDisposition_params___block_invoke(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v3 = a2;
  objc_msgSend(a1[4], "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__MSASStateMachine__deleteAssetCollectionsDisposition_params___block_invoke_2;
  v8[3] = &unk_1E95BB8D0;
  v9 = v3;
  v5 = v3;
  objc_copyWeak(&v14, a1 + 8);
  v10 = a1[5];
  v6 = a1[6];
  v7 = a1[4];
  v11 = v6;
  v12 = v7;
  v13 = a1[7];
  dispatch_async(v4, v8);

  objc_destroyWeak(&v14);
}

void __62__MSASStateMachine__deleteAssetCollectionsDisposition_params___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id obj;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v14 != v4)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 40), "delegate");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = *(void **)(a1 + 40);
        v9 = *(_QWORD *)(a1 + 48);
        v10 = *(_QWORD *)(a1 + 56);
        objc_msgSend(v8, "_canceledError");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "MSASStateMachine:didFinishDeletingAssetCollection:inAlbum:info:error:", v8, v6, v9, v10, v11);

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v3);
  }

}

void __62__MSASStateMachine__deleteAssetCollectionsDisposition_params___block_invoke_2(id *a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[5];
  _QWORD block[4];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  id v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (a1[4])
  {
    WeakRetained = objc_loadWeakRetained(a1 + 9);
    v3 = a1[4];
    NSStringFromSelector(sel__deleteAssetCollectionsDisposition_params_);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v3) = objc_msgSend(WeakRetained, "workQueueEndCommandWithError:command:params:albumGUID:assetCollectionGUID:", v3, v4, 0, 0, 0);

    if ((v3 & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v14 = objc_loadWeakRetained(a1 + 9);
        v15 = objc_msgSend(a1[5], "count");
        v16 = a1[6];
        objc_msgSend(a1[4], "MSVerboseDescription");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v34 = v14;
        v35 = 2048;
        v36 = v15;
        v37 = 2114;
        v38 = v16;
        v39 = 2114;
        v40 = v17;
        _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Failed to delete %ld asset collections in album %{public}@. Error: %{public}@", buf, 0x2Au);

      }
      objc_msgSend(a1[7], "eventQueue");
      v5 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __62__MSASStateMachine__deleteAssetCollectionsDisposition_params___block_invoke_196;
      block[3] = &unk_1E95BB6C0;
      v28 = a1[5];
      objc_copyWeak(&v32, a1 + 9);
      v29 = a1[6];
      v30 = a1[8];
      v31 = a1[4];
      dispatch_async(v5, block);

      v6 = objc_loadWeakRetained(a1 + 9);
      objc_msgSend(v6, "workQueueDidFinishCommand");

      objc_destroyWeak(&v32);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v7 = objc_loadWeakRetained(a1 + 9);
      v8 = objc_msgSend(a1[5], "count");
      v9 = a1[6];
      *(_DWORD *)buf = 138543874;
      v34 = v7;
      v35 = 2048;
      v36 = v8;
      v37 = 2114;
      v38 = v9;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Successfully deleted %ld photos in album %{public}@", buf, 0x20u);

    }
    objc_msgSend(a1[7], "memberQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __62__MSASStateMachine__deleteAssetCollectionsDisposition_params___block_invoke_197;
    v26[3] = &unk_1E95BCED0;
    v26[4] = a1[7];
    dispatch_barrier_sync(v10, v26);

    objc_msgSend(a1[7], "eventQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    v18 = v11;
    v19 = 3221225472;
    v20 = __62__MSASStateMachine__deleteAssetCollectionsDisposition_params___block_invoke_2_198;
    v21 = &unk_1E95BB780;
    objc_copyWeak(&v25, a1 + 9);
    v22 = a1[5];
    v23 = a1[6];
    v24 = a1[8];
    dispatch_async(v12, &v18);

    v13 = objc_loadWeakRetained(a1 + 9);
    objc_msgSend(v13, "workQueueDidFinishCommand", v18, v19, v20, v21);

    objc_destroyWeak(&v25);
  }
}

void __62__MSASStateMachine__deleteAssetCollectionsDisposition_params___block_invoke_196(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id WeakRetained;
  void *v9;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v6);
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
        objc_msgSend(WeakRetained, "delegate", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_loadWeakRetained((id *)(a1 + 64));
        objc_msgSend(v9, "MSASStateMachine:didFinishDeletingAssetCollection:inAlbum:info:error:", v10, v7, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

}

uint64_t __62__MSASStateMachine__deleteAssetCollectionsDisposition_params___block_invoke_197(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "reset");
}

void __62__MSASStateMachine__deleteAssetCollectionsDisposition_params___block_invoke_2_198(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "daemon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "personID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didReceiveAuthSuccessForPersonID:", v6);

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = *(id *)(a1 + 32);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v11);
        v13 = objc_loadWeakRetained(v2);
        objc_msgSend(v13, "delegate", (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_loadWeakRetained(v2);
        objc_msgSend(v14, "MSASStateMachine:didFinishDeletingAssetCollection:inAlbum:info:error:", v15, v12, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

}

void __56__MSASStateMachine_deleteAssetCollections_inAlbum_info___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v10 = v2;
  if (v3)
    objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("album"));
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    objc_msgSend(v10, "setObject:forKey:", v4, CFSTR("assetCollections"));
  v5 = *(_QWORD *)(a1 + 48);
  if (v5)
    objc_msgSend(v10, "setObject:forKey:", v5, CFSTR("info"));
  objc_msgSend(*(id *)(a1 + 56), "_model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel__deleteAssetCollectionsDisposition_params_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "personID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "GUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "enqueueCommand:params:personID:albumGUID:assetCollectionGUID:", v7, v10, v8, v9, 0);

  objc_msgSend(*(id *)(a1 + 56), "workQueueRetryOutstandingActivities");
}

void __51__MSASStateMachine__deleteAlbumDisposition_params___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__MSASStateMachine__deleteAlbumDisposition_params___block_invoke_2;
  block[3] = &unk_1E95BB6C0;
  v8 = v3;
  v5 = v3;
  objc_copyWeak(&v12, (id *)(a1 + 56));
  v6 = *(void **)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = v6;
  v11 = *(id *)(a1 + 48);
  dispatch_async(v4, block);

  objc_destroyWeak(&v12);
}

void __51__MSASStateMachine__deleteAlbumDisposition_params___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v2, "_canceledError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "MSASStateMachine:didFinishDeletingAlbum:info:error:", v2, v3, v4, v5);

}

void __51__MSASStateMachine__deleteAlbumDisposition_params___block_invoke_2(id *a1)
{
  id WeakRetained;
  char v3;
  NSObject *v4;
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  _QWORD block[4];
  id v21;
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (a1[4])
  {
    WeakRetained = objc_loadWeakRetained(a1 + 8);
    v3 = objc_msgSend(WeakRetained, "workQueueEndCommandWithError:command:params:albumGUID:assetCollectionGUID:", a1[4], 0, 0, 0, 0);

    if ((v3 & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v12 = objc_loadWeakRetained(a1 + 8);
        objc_msgSend(a1[4], "MSVerboseDescription");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v26 = v12;
        v27 = 2114;
        v28 = v13;
        _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Failed to delete album. Error: %{public}@", buf, 0x16u);

      }
      objc_msgSend(a1[5], "eventQueue");
      v4 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __51__MSASStateMachine__deleteAlbumDisposition_params___block_invoke_191;
      block[3] = &unk_1E95BB780;
      objc_copyWeak(&v24, a1 + 8);
      v21 = a1[6];
      v22 = a1[7];
      v23 = a1[4];
      dispatch_async(v4, block);

      v5 = objc_loadWeakRetained(a1 + 8);
      objc_msgSend(v5, "workQueueDidFinishCommand");

      objc_destroyWeak(&v24);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v6 = objc_loadWeakRetained(a1 + 8);
      v7 = a1[6];
      *(_DWORD *)buf = 138543618;
      v26 = v6;
      v27 = 2114;
      v28 = v7;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Successfully deleted album %{public}@", buf, 0x16u);

    }
    objc_msgSend(a1[5], "memberQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __51__MSASStateMachine__deleteAlbumDisposition_params___block_invoke_192;
    v19[3] = &unk_1E95BCED0;
    v19[4] = a1[5];
    dispatch_barrier_sync(v8, v19);

    objc_msgSend(a1[5], "eventQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    v14[0] = v9;
    v14[1] = 3221225472;
    v14[2] = __51__MSASStateMachine__deleteAlbumDisposition_params___block_invoke_2_193;
    v14[3] = &unk_1E95BB780;
    objc_copyWeak(&v18, a1 + 8);
    v15 = a1[6];
    v16 = a1[7];
    v17 = a1[4];
    dispatch_async(v10, v14);

    v11 = objc_loadWeakRetained(a1 + 8);
    objc_msgSend(v11, "workQueueDidFinishCommand");

    objc_destroyWeak(&v18);
  }
}

void __51__MSASStateMachine__deleteAlbumDisposition_params___block_invoke_191(uint64_t a1)
{
  id *v2;
  void *v3;
  id v4;
  id WeakRetained;

  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "MSASStateMachine:didFinishDeletingAlbum:info:error:", v4, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __51__MSASStateMachine__deleteAlbumDisposition_params___block_invoke_192(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "reset");
}

void __51__MSASStateMachine__deleteAlbumDisposition_params___block_invoke_2_193(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "daemon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "personID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didReceiveAuthSuccessForPersonID:", v6);

  v9 = objc_loadWeakRetained(v2);
  objc_msgSend(v9, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_loadWeakRetained(v2);
  objc_msgSend(v7, "MSASStateMachine:didFinishDeletingAlbum:info:error:", v8, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __37__MSASStateMachine_deleteAlbum_info___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v9 = v2;
  if (v3)
    objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("album"));
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    objc_msgSend(v9, "setObject:forKey:", v4, CFSTR("info"));
  objc_msgSend(*(id *)(a1 + 48), "_model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel__deleteAlbumDisposition_params_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "personID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "GUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enqueueCommand:params:personID:albumGUID:assetCollectionGUID:", v6, v9, v7, v8, 0);

  objc_msgSend(*(id *)(a1 + 48), "workQueueRetryOutstandingActivities");
}

void __69__MSASStateMachine__setAssetCollectionSyncedStateDisposition_params___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "GUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "MSASStateMachineDidRequestAssetCollectionStateCtagForAssetCollectionWithGUID:info:", v2, *(_QWORD *)(a1 + 48));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __69__MSASStateMachine__setAssetCollectionSyncedStateDisposition_params___block_invoke_186(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  objc_msgSend(WeakRetained, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__MSASStateMachine__setAssetCollectionSyncedStateDisposition_params___block_invoke_2;
  block[3] = &unk_1E95BB8A8;
  v13 = v5;
  v14 = WeakRetained;
  v15 = a1[4];
  v16 = a1[5];
  v17 = a1[6];
  v9 = WeakRetained;
  v10 = v5;
  objc_copyWeak(&v19, a1 + 7);
  v18 = v6;
  v11 = v6;
  dispatch_async(v8, block);

  objc_destroyWeak(&v19);
}

void __69__MSASStateMachine__setAssetCollectionSyncedStateDisposition_params___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v2, "_canceledError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "MSASStateMachine:didFinishSettingSyncedStateForAssetCollection:inAlbum:assetStateCtag:info:error:", v2, v3, v5, 0, v4, v6);

}

void __69__MSASStateMachine__setAssetCollectionSyncedStateDisposition_params___block_invoke_2(id *a1)
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id *v9;
  id *v10;
  id *v11;
  id *v12;
  id *v13;
  NSObject *v14;
  id WeakRetained;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD block[4];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = a1[4];
  v2 = a1[5];
  if (v3)
  {
    if ((objc_msgSend(v2, "workQueueEndCommandWithError:command:params:albumGUID:assetCollectionGUID:", v3, 0, 0, 0, 0) & 1) != 0)return;
    if (objc_msgSend(a1[4], "MSContainsErrorWithDomain:code:", *MEMORY[0x1E0C930A8], 400))
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
LABEL_9:
        objc_msgSend(a1[5], "eventQueue");
        v14 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __69__MSASStateMachine__setAssetCollectionSyncedStateDisposition_params___block_invoke_187;
        block[3] = &unk_1E95BCE80;
        v9 = &v29;
        v29 = a1[5];
        v10 = &v30;
        v30 = a1[6];
        v11 = &v31;
        v31 = a1[7];
        v12 = &v32;
        v32 = a1[8];
        v13 = &v33;
        v33 = a1[4];
        dispatch_async(v14, block);

        WeakRetained = objc_loadWeakRetained(a1 + 10);
        objc_msgSend(WeakRetained, "workQueueDidFinishCommand");

        goto LABEL_10;
      }
      v4 = a1[6];
      v5 = a1[7];
      v6 = a1[5];
      objc_msgSend(a1[4], "MSVerboseDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v35 = v6;
      v36 = 2114;
      v37 = v4;
      v38 = 2114;
      v39 = v5;
      v40 = 2114;
      v41 = v7;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Can't set synced state for asset collection %{public}@ in album %{public}@. This is not an error. Status: %{public}@", buf, 0x2Au);
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_9;
      v16 = a1[6];
      v17 = a1[7];
      v18 = a1[5];
      objc_msgSend(a1[4], "MSVerboseDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v35 = v18;
      v36 = 2114;
      v37 = v16;
      v38 = 2114;
      v39 = v17;
      v40 = 2114;
      v41 = v7;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Failed to set synced state for asset collection %{public}@ in album %{public}@. Error: %{public}@", buf, 0x2Au);
    }

    goto LABEL_9;
  }
  objc_msgSend(v2, "eventQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __69__MSASStateMachine__setAssetCollectionSyncedStateDisposition_params___block_invoke_2_188;
  v22 = &unk_1E95BCE80;
  v9 = &v23;
  v23 = a1[5];
  v10 = &v24;
  v24 = a1[6];
  v11 = &v25;
  v25 = a1[7];
  v12 = &v26;
  v26 = a1[9];
  v13 = &v27;
  v27 = a1[8];
  dispatch_async(v8, &v19);

  objc_msgSend(a1[5], "workQueueDidFinishCommand", v19, v20, v21, v22);
LABEL_10:

}

void __69__MSASStateMachine__setAssetCollectionSyncedStateDisposition_params___block_invoke_187(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "MSASStateMachine:didFinishSettingSyncedStateForAssetCollection:inAlbum:assetStateCtag:info:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

}

void __69__MSASStateMachine__setAssetCollectionSyncedStateDisposition_params___block_invoke_2_188(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "MSASStateMachine:didFinishSettingSyncedStateForAssetCollection:inAlbum:assetStateCtag:info:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), 0);

}

void __80__MSASStateMachine_setAssetCollectionSyncedState_forAssetCollection_album_info___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 48);
    v16 = 138543874;
    v17 = v2;
    v18 = 2114;
    v19 = v3;
    v20 = 2114;
    v21 = v4;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Scheduling setting asset collection synced state for asset collection %{public}@ in album %{public}@", (uint8_t *)&v16, 0x20u);
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("assetCollection"));
  v8 = *(_QWORD *)(a1 + 48);
  if (v8)
    objc_msgSend(v6, "setObject:forKey:", v8, CFSTR("album"));
  v9 = *(_QWORD *)(a1 + 56);
  if (v9)
    objc_msgSend(v6, "setObject:forKey:", v9, CFSTR("assetCollectionState"));
  v10 = *(_QWORD *)(a1 + 64);
  if (v10)
    objc_msgSend(v6, "setObject:forKey:", v10, CFSTR("info"));
  objc_msgSend(*(id *)(a1 + 32), "_model");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel__setAssetCollectionSyncedStateDisposition_params_);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "personID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "GUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "GUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "enqueueCommand:params:personID:albumGUID:assetCollectionGUID:", v12, v6, v13, v14, v15);

  objc_msgSend(*(id *)(a1 + 32), "workQueueRetryOutstandingActivities");
}

void __59__MSASStateMachine__setAlbumSyncedStateDisposition_params___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "GUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "MSASStateMachineDidRequestAlbumStateCtagForAlbumWithGUID:info:", v2, *(_QWORD *)(a1 + 48));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __59__MSASStateMachine__setAlbumSyncedStateDisposition_params___block_invoke_177(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__MSASStateMachine__setAlbumSyncedStateDisposition_params___block_invoke_2;
  block[3] = &unk_1E95BCE80;
  v13 = v5;
  v14 = WeakRetained;
  v15 = a1[4];
  v16 = a1[5];
  v17 = v6;
  v9 = v6;
  v10 = WeakRetained;
  v11 = v5;
  dispatch_async(v8, block);

}

void __59__MSASStateMachine__setAlbumSyncedStateDisposition_params___block_invoke_180(uint64_t a1)
{
  void *v2;
  __CFString *v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0CB35C8];
  v3 = (__CFString *)MSCFCopyLocalizedString(CFSTR("ERROR_STATE_ALBUM_STATE_CTAG_MISSING"));
  objc_msgSend(v2, "MSErrorWithDomain:code:description:", CFSTR("MSASStateMachineErrorDomain"), 3, v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "MSASStateMachine:didFinishSettingSyncedStateForAlbum:info:error:newAlbumStateCtag:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v5, 0);

}

void __59__MSASStateMachine__setAlbumSyncedStateDisposition_params___block_invoke_2_183(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v2, "_canceledError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "MSASStateMachine:didFinishSettingSyncedStateForAlbum:info:error:newAlbumStateCtag:", v2, v3, v4, v5, 0);

}

void __59__MSASStateMachine__setAlbumSyncedStateDisposition_params___block_invoke_2(id *a1)
{
  id v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  id *v8;
  id *v9;
  id *v10;
  id *v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a1[4];
  v2 = a1[5];
  if (v3)
  {
    if ((objc_msgSend(v2, "workQueueEndCommandWithError:command:params:albumGUID:assetCollectionGUID:", v3, 0, 0, 0, 0) & 1) != 0)return;
    if (objc_msgSend(a1[4], "MSContainsErrorWithDomain:code:", *MEMORY[0x1E0C930A8], 400))
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
LABEL_9:
        objc_msgSend(a1[5], "eventQueue");
        v12 = objc_claimAutoreleasedReturnValue();
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __59__MSASStateMachine__setAlbumSyncedStateDisposition_params___block_invoke_178;
        v21[3] = &unk_1E95BCE58;
        v8 = &v22;
        v22 = a1[5];
        v9 = &v23;
        v23 = a1[6];
        v10 = &v24;
        v24 = a1[7];
        v11 = &v25;
        v25 = a1[4];
        dispatch_async(v12, v21);

        objc_msgSend(a1[5], "workQueueDidFinishCommand");
        goto LABEL_10;
      }
      v5 = a1[5];
      v4 = a1[6];
      objc_msgSend(a1[4], "MSVerboseDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v27 = v5;
      v28 = 2114;
      v29 = v4;
      v30 = 2114;
      v31 = v6;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Can't set synced state for album %{public}@. This is not an error. Status: %{public}@", buf, 0x20u);
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_9;
      v14 = a1[5];
      v13 = a1[6];
      objc_msgSend(a1[4], "MSVerboseDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v27 = v14;
      v28 = 2114;
      v29 = v13;
      v30 = 2114;
      v31 = v6;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Failed to set synced state for album %{public}@. Error: %{public}@", buf, 0x20u);
    }

    goto LABEL_9;
  }
  objc_msgSend(v2, "eventQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__MSASStateMachine__setAlbumSyncedStateDisposition_params___block_invoke_2_179;
  block[3] = &unk_1E95BCE80;
  v8 = &v16;
  v16 = a1[5];
  v9 = &v17;
  v17 = a1[6];
  v10 = &v18;
  v18 = a1[7];
  v11 = &v19;
  v19 = a1[4];
  v20 = a1[8];
  dispatch_async(v7, block);

  objc_msgSend(a1[5], "workQueueDidFinishCommand");
LABEL_10:

}

void __59__MSASStateMachine__setAlbumSyncedStateDisposition_params___block_invoke_178(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "MSASStateMachine:didFinishSettingSyncedStateForAlbum:info:error:newAlbumStateCtag:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 0);

}

void __59__MSASStateMachine__setAlbumSyncedStateDisposition_params___block_invoke_2_179(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "MSASStateMachine:didFinishSettingSyncedStateForAlbum:info:error:newAlbumStateCtag:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

}

void __54__MSASStateMachine_setAlbumSyncedState_forAlbum_info___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    v13 = 138543618;
    v14 = v2;
    v15 = 2114;
    v16 = v3;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Scheduling setting album synced state for album %{public}@", (uint8_t *)&v13, 0x16u);
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("album"));
  v7 = *(_QWORD *)(a1 + 48);
  if (v7)
    objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("albumState"));
  v8 = *(_QWORD *)(a1 + 56);
  if (v8)
    objc_msgSend(v5, "setObject:forKey:", v8, CFSTR("info"));
  objc_msgSend(*(id *)(a1 + 32), "_model");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel__setAlbumSyncedStateDisposition_params_);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "personID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "GUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "enqueueCommand:params:personID:albumGUID:assetCollectionGUID:", v10, v5, v11, v12, 0);

  objc_msgSend(*(id *)(a1 + 32), "workQueueRetryOutstandingActivities");
}

void __64__MSASStateMachine__checkForAlbumSyncedStateDisposition_params___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "MSASStateMachine:willCheckForAlbumSyncedStateChangesInAlbum:info:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __64__MSASStateMachine__checkForAlbumSyncedStateDisposition_params___block_invoke_2(id *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(a1[4], "eventQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __64__MSASStateMachine__checkForAlbumSyncedStateDisposition_params___block_invoke_3;
  v14[3] = &unk_1E95BB8D0;
  objc_copyWeak(&v20, a1 + 7);
  v15 = v8;
  v16 = v7;
  v17 = a1[5];
  v18 = v9;
  v19 = a1[6];
  v11 = v9;
  v12 = v7;
  v13 = v8;
  dispatch_async(v10, v14);

  objc_destroyWeak(&v20);
}

void __64__MSASStateMachine__checkForAlbumSyncedStateDisposition_params___block_invoke_4(id *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  char v11;
  NSObject *v12;
  id *v13;
  id v14;
  id *v15;
  id *v16;
  id *v17;
  NSObject *v18;
  id WeakRetained;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  _QWORD block[4];
  id v34;
  id v35;
  id v36;
  id v37;
  uint8_t buf[4];
  id v39;
  __int16 v40;
  id v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (!v7)
  {
    objc_msgSend(a1[5], "eventQueue");
    v18 = objc_claimAutoreleasedReturnValue();
    v23 = MEMORY[0x1E0C809B0];
    v24 = 3221225472;
    v25 = __64__MSASStateMachine__checkForAlbumSyncedStateDisposition_params___block_invoke_2_172;
    v26 = &unk_1E95BB8D0;
    v13 = &v32;
    objc_copyWeak(&v32, a1 + 7);
    v27 = v8;
    v28 = a1[4];
    v29 = a1[6];
    v30 = 0;
    v31 = v9;
    dispatch_async(v18, &v23);

    WeakRetained = objc_loadWeakRetained(a1 + 7);
    objc_msgSend(WeakRetained, "workQueueDidFinishCommand", v23, v24, v25, v26, v27, v28, v29);

    v15 = &v27;
    v16 = &v28;
    v17 = &v29;
    v14 = v30;
LABEL_7:

    objc_destroyWeak(v13);
    goto LABEL_8;
  }
  v10 = objc_loadWeakRetained(a1 + 7);
  v11 = objc_msgSend(v10, "workQueueEndCommandWithError:command:params:albumGUID:assetCollectionGUID:", v7, 0, 0, 0, 0);

  if ((v11 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v20 = objc_loadWeakRetained(a1 + 7);
      v21 = a1[4];
      objc_msgSend(v7, "MSVerboseDescription");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v39 = v20;
      v40 = 2114;
      v41 = v21;
      v42 = 2114;
      v43 = v22;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Failed to check for synced state changes in album %{public}@. Error: %{public}@", buf, 0x20u);

    }
    objc_msgSend(a1[5], "eventQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__MSASStateMachine__checkForAlbumSyncedStateDisposition_params___block_invoke_171;
    block[3] = &unk_1E95BB780;
    v13 = &v37;
    objc_copyWeak(&v37, a1 + 7);
    v34 = a1[4];
    v35 = a1[6];
    v36 = v7;
    dispatch_async(v12, block);

    v14 = objc_loadWeakRetained(a1 + 7);
    objc_msgSend(v14, "workQueueDidFinishCommand");
    v15 = &v34;
    v16 = &v35;
    v17 = &v36;
    goto LABEL_7;
  }
LABEL_8:

}

void __64__MSASStateMachine__checkForAlbumSyncedStateDisposition_params___block_invoke_3_174(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v2, "_canceledError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "MSASStateMachine:didFinishCheckingForAlbumSyncedStateChangesInAlbum:info:error:newAlbumStateCtag:", v2, v3, v4, v5, 0);

}

void __64__MSASStateMachine__checkForAlbumSyncedStateDisposition_params___block_invoke_171(uint64_t a1)
{
  id *v2;
  void *v3;
  id v4;
  id WeakRetained;

  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "MSASStateMachine:didFinishCheckingForAlbumSyncedStateChangesInAlbum:info:error:newAlbumStateCtag:", v4, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);

}

void __64__MSASStateMachine__checkForAlbumSyncedStateDisposition_params___block_invoke_2_172(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;

  v2 = (id *)(a1 + 72);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(WeakRetained, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v4, "MSASStateMachine:didFindAlbumSyncedState:forAlbum:info:", v5, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  v8 = objc_loadWeakRetained(v2);
  objc_msgSend(v8, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_loadWeakRetained(v2);
  objc_msgSend(v6, "MSASStateMachine:didFinishCheckingForAlbumSyncedStateChangesInAlbum:info:error:newAlbumStateCtag:", v7, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

}

void __64__MSASStateMachine__checkForAlbumSyncedStateDisposition_params___block_invoke_3(uint64_t a1)
{
  id *v2;
  void *v3;
  id v4;
  id WeakRetained;

  v2 = (id *)(a1 + 72);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(WeakRetained, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "MSASStateMachine:didFindAssetCollectionSyncedState:forAssetCollectionGUID:inAlbum:assetCollectionStateCtag:info:", v4, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

}

uint64_t __65__MSASStateMachine_checkForAlbumSyncedStateChangesInAlbums_info___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v26 = v2;
    v27 = 2114;
    v28 = v3;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Scheduling checking for album synced state changes in albums %{public}@", buf, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_model");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "beginTransaction");

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = *(id *)(a1 + 40);
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v8);
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v9)
          objc_msgSend(v10, "setObject:forKey:", v9, CFSTR("album"));
        v12 = *(_QWORD *)(a1 + 48);
        if (v12)
          objc_msgSend(v11, "setObject:forKey:", v12, CFSTR("info"));
        objc_msgSend(*(id *)(a1 + 32), "_model");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(sel__checkForAlbumSyncedStateDisposition_params_);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "personID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "GUID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "enqueueCommand:params:personID:albumGUID:assetCollectionGUID:", v14, v11, v15, v16, 0);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v6);
  }

  objc_msgSend(*(id *)(a1 + 32), "_model");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "endTransaction");

  return objc_msgSend(*(id *)(a1 + 32), "workQueueRetryOutstandingActivities");
}

void __62__MSASStateMachine__checkForCommentChangesDisposition_params___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
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
  objc_msgSend(*(id *)(a1 + 32), "allKeys", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v6);
        objc_msgSend(*(id *)(a1 + 40), "delegate");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "MSASStateMachine:didFinishCheckingForCommentChangesInAssetCollectionWithGUID:largestCommentID:info:error:", *(_QWORD *)(a1 + 40), v7, 0, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

void __62__MSASStateMachine__checkForCommentChangesDisposition_params___block_invoke_163(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;

  v5 = a2;
  v6 = a3;
  objc_msgSend(a1[4], "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62__MSASStateMachine__checkForCommentChangesDisposition_params___block_invoke_2;
  v12[3] = &unk_1E95BB7D0;
  v13 = v5;
  v8 = v5;
  objc_copyWeak(&v20, a1 + 9);
  v14 = a1[5];
  v15 = a1[6];
  v9 = a1[7];
  v10 = a1[4];
  v16 = v9;
  v17 = v10;
  v18 = v6;
  v19 = a1[8];
  v11 = v6;
  dispatch_async(v7, v12);

  objc_destroyWeak(&v20);
}

void __62__MSASStateMachine__checkForCommentChangesDisposition_params___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "allKeys", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 40), "delegate");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = *(void **)(a1 + 40);
        v10 = *(_QWORD *)(a1 + 48);
        objc_msgSend(v9, "_canceledError");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "MSASStateMachine:didFinishCheckingForCommentChangesInAssetCollectionWithGUID:largestCommentID:info:error:", v9, v7, 0, v10, v11);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }

}

void __62__MSASStateMachine__checkForCommentChangesDisposition_params___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[5];
  _QWORD block[4];
  id v29;
  id v30;
  id v31;
  id v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
    v3 = *(_QWORD *)(a1 + 32);
    NSStringFromSelector(sel__checkForCommentChangesDisposition_params_);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v3) = objc_msgSend(WeakRetained, "workQueueEndCommandWithError:command:params:albumGUID:assetCollectionGUID:", v3, v4, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);

    if ((v3 & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v14 = objc_loadWeakRetained((id *)(a1 + 88));
        v15 = *(_QWORD *)(a1 + 48);
        v16 = *(_QWORD *)(a1 + 56);
        objc_msgSend(*(id *)(a1 + 32), "MSVerboseDescription");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v34 = v14;
        v35 = 2114;
        v36 = v16;
        v37 = 2114;
        v38 = v15;
        v39 = 2114;
        v40 = v17;
        _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Failed to check for comment changes in asset collections %{public}@ in album %{public}@. Error: %{public}@", buf, 0x2Au);

      }
      objc_msgSend(*(id *)(a1 + 64), "eventQueue");
      v5 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __62__MSASStateMachine__checkForCommentChangesDisposition_params___block_invoke_164;
      block[3] = &unk_1E95BB780;
      v29 = *(id *)(a1 + 72);
      objc_copyWeak(&v32, (id *)(a1 + 88));
      v30 = *(id *)(a1 + 80);
      v31 = *(id *)(a1 + 32);
      dispatch_async(v5, block);

      v6 = objc_loadWeakRetained((id *)(a1 + 88));
      objc_msgSend(v6, "workQueueDidFinishCommand");

      objc_destroyWeak(&v32);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v7 = objc_loadWeakRetained((id *)(a1 + 88));
      v9 = *(_QWORD *)(a1 + 48);
      v8 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138543874;
      v34 = v7;
      v35 = 2114;
      v36 = v8;
      v37 = 2114;
      v38 = v9;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Successfully checked for comment changes %{public}@ in album %{public}@.", buf, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 64), "memberQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __62__MSASStateMachine__checkForCommentChangesDisposition_params___block_invoke_165;
    v27[3] = &unk_1E95BCED0;
    v27[4] = *(_QWORD *)(a1 + 64);
    dispatch_barrier_sync(v10, v27);

    objc_msgSend(*(id *)(a1 + 64), "eventQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    v18 = v11;
    v19 = 3221225472;
    v20 = __62__MSASStateMachine__checkForCommentChangesDisposition_params___block_invoke_2_166;
    v21 = &unk_1E95BB6C0;
    objc_copyWeak(&v26, (id *)(a1 + 88));
    v22 = *(id *)(a1 + 72);
    v23 = *(id *)(a1 + 56);
    v24 = *(id *)(a1 + 48);
    v25 = *(id *)(a1 + 80);
    dispatch_async(v12, &v18);

    v13 = objc_loadWeakRetained((id *)(a1 + 88));
    objc_msgSend(v13, "workQueueDidFinishCommand", v18, v19, v20, v21);

    objc_destroyWeak(&v26);
  }
}

void __62__MSASStateMachine__checkForCommentChangesDisposition_params___block_invoke_164(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id WeakRetained;
  void *v9;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "allKeys", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v6);
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
        objc_msgSend(WeakRetained, "delegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_loadWeakRetained((id *)(a1 + 56));
        objc_msgSend(v9, "MSASStateMachine:didFinishCheckingForCommentChangesInAssetCollectionWithGUID:largestCommentID:info:error:", v10, v7, 0, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

}

uint64_t __62__MSASStateMachine__checkForCommentChangesDisposition_params___block_invoke_165(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "reset");
}

void __62__MSASStateMachine__checkForCommentChangesDisposition_params___block_invoke_2_166(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;

  v2 = (id *)(a1 + 64);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "daemon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "personID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didReceiveAuthSuccessForPersonID:", v6);

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__MSASStateMachine__checkForCommentChangesDisposition_params___block_invoke_3;
  v8[3] = &unk_1E95BB7A8;
  v7 = *(void **)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  objc_copyWeak(&v12, v2);
  v10 = *(id *)(a1 + 48);
  v11 = *(id *)(a1 + 56);
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v8);

  objc_destroyWeak(&v12);
}

void __62__MSASStateMachine__checkForCommentChangesDisposition_params___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  id WeakRetained;
  void *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "intValue");

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if (objc_msgSend(v14, "type", (_QWORD)v24) == 2)
        {
          if ((int)objc_msgSend(v14, "deletionIndex") > (int)v8)
            v8 = objc_msgSend(v14, "deletionIndex");
        }
        else
        {
          objc_msgSend(v14, "comment");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "ID");

          if (v16 > (int)v8)
          {
            objc_msgSend(v14, "comment");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v8 = objc_msgSend(v17, "ID");

          }
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v11);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "delegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(v19, "MSASStateMachine:didFindCommentChanges:inAssetCollectionWithGUID:inAlbumWithGUID:info:", v20, v9, v5, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  v21 = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(v21, "delegate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(v22, "MSASStateMachine:didFinishCheckingForCommentChangesInAssetCollectionWithGUID:largestCommentID:info:error:", v23, v5, v8, *(_QWORD *)(a1 + 48), 0);

}

void __59__MSASStateMachine_checkForCommentChanges_inAlbumWithGUID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 48);
    v12 = 138543874;
    v13 = v2;
    v14 = 2114;
    v15 = v3;
    v16 = 2114;
    v17 = v4;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Scheduling checking for comment changes %{public}@ in album %{public}@.", (uint8_t *)&v12, 0x20u);
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("commentsChange"));
  v8 = *(_QWORD *)(a1 + 48);
  if (v8)
    objc_msgSend(v6, "setObject:forKey:", v8, CFSTR("albumGUID"));
  objc_msgSend(*(id *)(a1 + 32), "_model");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel__checkForCommentChangesDisposition_params_);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "personID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "enqueueCommand:params:personID:albumGUID:assetCollectionGUID:", v10, v6, v11, *(_QWORD *)(a1 + 48), 0);

  objc_msgSend(*(id *)(a1 + 32), "workQueueRetryOutstandingActivities");
}

void __70__MSASStateMachine__checkForAssetCollectionUpdatesDisposition_params___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "MSASStateMachine:didFinishUpdatingAssetCollections:inAlbum:info:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

}

void __70__MSASStateMachine__checkForAssetCollectionUpdatesDisposition_params___block_invoke_154(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "MSASStateMachine:willUpdateAssetCollections:inAlbum:info:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

void __70__MSASStateMachine__checkForAssetCollectionUpdatesDisposition_params___block_invoke_2(id *a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;

  v8 = a2;
  v9 = a4;
  v10 = a5;
  objc_msgSend(a1[4], "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__MSASStateMachine__checkForAssetCollectionUpdatesDisposition_params___block_invoke_3;
  block[3] = &unk_1E95BB8A8;
  v18 = v8;
  v12 = v8;
  objc_copyWeak(&v24, a1 + 7);
  v13 = a1[5];
  v14 = a1[4];
  v19 = v13;
  v20 = v14;
  v21 = v9;
  v22 = a1[6];
  v23 = v10;
  v15 = v10;
  v16 = v9;
  dispatch_async(v11, block);

  objc_destroyWeak(&v24);
}

void __70__MSASStateMachine__checkForAssetCollectionUpdatesDisposition_params___block_invoke_2_160(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "MSASStateMachine:willUpdateAssetCollections:inAlbum:info:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v3, "_canceledError");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "MSASStateMachine:didFinishUpdatingAssetCollections:inAlbum:info:error:", v3, v4, v6, v5, v7);

}

void __70__MSASStateMachine__checkForAssetCollectionUpdatesDisposition_params___block_invoke_3(id *a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  __CFString *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  _QWORD v25[5];
  _QWORD block[4];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (a1[4])
  {
    WeakRetained = objc_loadWeakRetained(a1 + 10);
    v3 = a1[4];
    objc_msgSend(a1[5], "GUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v3) = objc_msgSend(WeakRetained, "workQueueEndCommandWithError:command:params:albumGUID:assetCollectionGUID:", v3, 0, 0, v4, 0);

    if ((v3 & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v23 = objc_loadWeakRetained(a1 + 10);
        objc_msgSend(a1[4], "MSVerboseDescription");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v33 = v23;
        v34 = 2114;
        v35 = v24;
        _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Failed to get metadata. Error: %{public}@", buf, 0x16u);

      }
      objc_msgSend(a1[6], "eventQueue");
      v5 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __70__MSASStateMachine__checkForAssetCollectionUpdatesDisposition_params___block_invoke_155;
      block[3] = &unk_1E95BB6C0;
      objc_copyWeak(&v31, a1 + 10);
      v27 = a1[7];
      v28 = a1[5];
      v29 = a1[8];
      v30 = a1[4];
      dispatch_async(v5, block);

      v6 = objc_loadWeakRetained(a1 + 10);
      objc_msgSend(v6, "workQueueDidFinishCommand");

      objc_destroyWeak(&v31);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v7 = objc_loadWeakRetained(a1 + 10);
      *(_DWORD *)buf = 138543362;
      v33 = v7;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Successfully checked for asset collection updates.", buf, 0xCu);

    }
    objc_msgSend(a1[6], "memberQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __70__MSASStateMachine__checkForAssetCollectionUpdatesDisposition_params___block_invoke_156;
    v25[3] = &unk_1E95BCED0;
    v25[4] = a1[6];
    dispatch_barrier_sync(v8, v25);

    v9 = objc_loadWeakRetained(a1 + 10);
    objc_msgSend(v9, "daemon");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_loadWeakRetained(a1 + 10);
    objc_msgSend(v11, "personID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "didReceiveAuthSuccessForPersonID:", v12);

    v13 = objc_loadWeakRetained(a1 + 10);
    objc_msgSend(v13, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_loadWeakRetained(a1 + 10);
    objc_msgSend(v14, "MSASStateMachine:didFinishUpdatingAssetCollections:inAlbum:info:error:", v15, a1[7], a1[5], a1[8], a1[4]);

    if (objc_msgSend(a1[9], "count"))
    {
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v17 = (__CFString *)MSCFCopyLocalizedString(CFSTR("ERROR_MSAS_SUB_NO_METADATA"));
      objc_msgSend(v16, "MSErrorWithDomain:code:description:", CFSTR("MSASSubscriberErrorDomain"), 1, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = objc_loadWeakRetained(a1 + 10);
      objc_msgSend(v19, "delegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_loadWeakRetained(a1 + 10);
      objc_msgSend(v20, "MSASStateMachine:didFinishUpdatingAssetCollections:inAlbum:info:error:", v21, a1[9], a1[5], a1[8], v18);

    }
    v22 = objc_loadWeakRetained(a1 + 10);
    objc_msgSend(v22, "workQueueDidFinishCommand");

  }
}

void __70__MSASStateMachine__checkForAssetCollectionUpdatesDisposition_params___block_invoke_155(uint64_t a1)
{
  id *v2;
  void *v3;
  id v4;
  id WeakRetained;

  v2 = (id *)(a1 + 64);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "MSASStateMachine:didFinishUpdatingAssetCollections:inAlbum:info:error:", v4, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

uint64_t __70__MSASStateMachine__checkForAssetCollectionUpdatesDisposition_params___block_invoke_156(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "reset");
}

void __64__MSASStateMachine_checkForAssetCollectionUpdates_inAlbum_info___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = objc_msgSend(*(id *)(a1 + 40), "count");
    objc_msgSend(*(id *)(a1 + 48), "GUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543874;
    v15 = v2;
    v16 = 2048;
    v17 = v3;
    v18 = 2114;
    v19 = v4;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Scheduling update of metadata for %ld photos in album %{public}@", (uint8_t *)&v14, 0x20u);

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("assetCollections"));
  v8 = *(_QWORD *)(a1 + 48);
  if (v8)
    objc_msgSend(v6, "setObject:forKey:", v8, CFSTR("album"));
  v9 = *(_QWORD *)(a1 + 56);
  if (v9)
    objc_msgSend(v6, "setObject:forKey:", v9, CFSTR("info"));
  objc_msgSend(*(id *)(a1 + 32), "_model");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel__checkForAssetCollectionUpdatesDisposition_params_);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "personID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "GUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "enqueueCommand:params:personID:albumGUID:assetCollectionGUID:", v11, v6, v12, v13, 0);

  objc_msgSend(*(id *)(a1 + 32), "workQueueRetryOutstandingActivities");
}

void __63__MSASStateMachine_validateInvitationForAlbum_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v2 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v8 = v2;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Validating invitation token.", buf, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "protocol");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__MSASStateMachine_validateInvitationForAlbum_completionBlock___block_invoke_150;
  v5[3] = &unk_1E95BC500;
  v4 = *(_QWORD *)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v3, "validateInvitationForAlbum:completionBlock:", v4, v5);

}

void __63__MSASStateMachine_validateInvitationForAlbum_completionBlock___block_invoke_150(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "eventQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__MSASStateMachine_validateInvitationForAlbum_completionBlock___block_invoke_2;
  block[3] = &unk_1E95BCF70;
  v7 = *(id *)(a1 + 40);
  v12 = a2;
  v10 = v5;
  v11 = v7;
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __63__MSASStateMachine_validateInvitationForAlbum_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

void __67__MSASStateMachine_acceptInvitationWithToken_info_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;
  id v7;
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v2 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v9 = v2;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Accepting invitation using token.", buf, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "protocol");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67__MSASStateMachine_acceptInvitationWithToken_info_completionBlock___block_invoke_149;
  v5[3] = &unk_1E95BB720;
  v4 = *(_QWORD *)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v7 = *(id *)(a1 + 56);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v3, "acceptInvitationWithToken:completionBlock:", v4, v5);

}

void __67__MSASStateMachine_acceptInvitationWithToken_info_completionBlock___block_invoke_149(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(a1[4], "eventQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__MSASStateMachine_acceptInvitationWithToken_info_completionBlock___block_invoke_2;
  block[3] = &unk_1E95BC528;
  v9 = a1[6];
  v7 = a1[5];
  v8 = v3;
  v5 = v3;
  dispatch_async(v4, block);

}

uint64_t __67__MSASStateMachine_acceptInvitationWithToken_info_completionBlock___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __68__MSASStateMachine__markAsSpamInvitationForTokenDisposition_params___block_invoke(id *a1, void *a2)
{
  id v3;
  id WeakRetained;
  char v5;
  NSObject *v6;
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  _QWORD block[4];
  id v23;
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    WeakRetained = objc_loadWeakRetained(a1 + 7);
    v5 = objc_msgSend(WeakRetained, "workQueueEndCommandWithError:command:params:albumGUID:assetCollectionGUID:", v3, 0, 0, 0, 0);

    if ((v5 & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v14 = objc_loadWeakRetained(a1 + 7);
        v15 = a1[4];
        *(_DWORD *)buf = 138543874;
        v28 = v14;
        v29 = 2114;
        v30 = v15;
        v31 = 2114;
        v32 = v3;
        _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Failed to mark as spam invitation for token %{public}@. Error: %{public}@", buf, 0x20u);

      }
      objc_msgSend(a1[5], "eventQueue");
      v6 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __68__MSASStateMachine__markAsSpamInvitationForTokenDisposition_params___block_invoke_147;
      block[3] = &unk_1E95BB780;
      objc_copyWeak(&v26, a1 + 7);
      v23 = a1[4];
      v24 = a1[6];
      v25 = v3;
      dispatch_async(v6, block);

      v7 = objc_loadWeakRetained(a1 + 7);
      objc_msgSend(v7, "workQueueDidFinishCommand");

      objc_destroyWeak(&v26);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v8 = objc_loadWeakRetained(a1 + 7);
      v9 = a1[4];
      *(_DWORD *)buf = 138543618;
      v28 = v8;
      v29 = 2114;
      v30 = v9;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Successfully marked as spam invitation for token %{public}@", buf, 0x16u);

    }
    objc_msgSend(a1[5], "memberQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __68__MSASStateMachine__markAsSpamInvitationForTokenDisposition_params___block_invoke_148;
    v21[3] = &unk_1E95BCED0;
    v21[4] = a1[5];
    dispatch_barrier_sync(v10, v21);

    objc_msgSend(a1[5], "eventQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    v16[0] = v11;
    v16[1] = 3221225472;
    v16[2] = __68__MSASStateMachine__markAsSpamInvitationForTokenDisposition_params___block_invoke_2;
    v16[3] = &unk_1E95BB780;
    objc_copyWeak(&v20, a1 + 7);
    v17 = a1[4];
    v18 = a1[6];
    v19 = 0;
    dispatch_async(v12, v16);

    v13 = objc_loadWeakRetained(a1 + 7);
    objc_msgSend(v13, "workQueueDidFinishCommand");

    objc_destroyWeak(&v20);
  }

}

void __68__MSASStateMachine__markAsSpamInvitationForTokenDisposition_params___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v2, "_canceledError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "MSASStateMachine:didFinishMarkingAsSpamInvitationForToken:info:error:", v2, v3, v4, v5);

}

void __68__MSASStateMachine__markAsSpamInvitationForTokenDisposition_params___block_invoke_147(uint64_t a1)
{
  id *v2;
  void *v3;
  id v4;
  id WeakRetained;

  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "MSASStateMachine:didFinishMarkingAsSpamInvitationForToken:info:error:", v4, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __68__MSASStateMachine__markAsSpamInvitationForTokenDisposition_params___block_invoke_148(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "reset");
}

void __68__MSASStateMachine__markAsSpamInvitationForTokenDisposition_params___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "daemon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "personID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didReceiveAuthSuccessForPersonID:", v6);

  v9 = objc_loadWeakRetained(v2);
  objc_msgSend(v9, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_loadWeakRetained(v2);
  objc_msgSend(v7, "MSASStateMachine:didFinishMarkingAsSpamInvitationForToken:info:error:", v8, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __54__MSASStateMachine_markAsSpamInvitationForToken_info___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    v8 = 138543618;
    v9 = v2;
    v10 = 2114;
    v11 = v3;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Scheduling mark as spam invitation for token %{public}@", (uint8_t *)&v8, 0x16u);
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), CFSTR("info"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), CFSTR("invitationToken"));
  objc_msgSend(*(id *)(a1 + 32), "_model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel__markAsSpamInvitationForTokenDisposition_params_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "personID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enqueueCommand:params:personID:albumGUID:assetCollectionGUID:", v6, v4, v7, 0, 0);

  objc_msgSend(*(id *)(a1 + 32), "workQueueRetryOutstandingActivities");
}

void __68__MSASStateMachine__markAsSpamInvitationForAlbumDisposition_params___block_invoke(id *a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  char v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[5];
  _QWORD block[4];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    WeakRetained = objc_loadWeakRetained(a1 + 8);
    objc_msgSend(a1[4], "GUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(WeakRetained, "workQueueEndCommandWithError:command:params:albumGUID:assetCollectionGUID:", v3, 0, 0, v5, 0);

    if ((v6 & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v15 = objc_loadWeakRetained(a1 + 8);
        v16 = a1[4];
        *(_DWORD *)buf = 138543874;
        v33 = v15;
        v34 = 2114;
        v35 = v16;
        v36 = 2114;
        v37 = v3;
        _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Failed to mark as spam invitation for album %{public}@. Error: %{public}@", buf, 0x20u);

      }
      objc_msgSend(a1[5], "eventQueue");
      v7 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __68__MSASStateMachine__markAsSpamInvitationForAlbumDisposition_params___block_invoke_143;
      block[3] = &unk_1E95BB6C0;
      objc_copyWeak(&v31, a1 + 8);
      v27 = a1[4];
      v28 = a1[6];
      v29 = a1[7];
      v30 = v3;
      dispatch_async(v7, block);

      v8 = objc_loadWeakRetained(a1 + 8);
      objc_msgSend(v8, "workQueueDidFinishCommand");

      objc_destroyWeak(&v31);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v9 = objc_loadWeakRetained(a1 + 8);
      v10 = a1[4];
      *(_DWORD *)buf = 138543618;
      v33 = v9;
      v34 = 2114;
      v35 = v10;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Successfully marked as spam invitation for album %{public}@", buf, 0x16u);

    }
    objc_msgSend(a1[5], "memberQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __68__MSASStateMachine__markAsSpamInvitationForAlbumDisposition_params___block_invoke_144;
    v25[3] = &unk_1E95BCED0;
    v25[4] = a1[5];
    dispatch_barrier_sync(v11, v25);

    objc_msgSend(a1[5], "eventQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    v17 = v12;
    v18 = 3221225472;
    v19 = __68__MSASStateMachine__markAsSpamInvitationForAlbumDisposition_params___block_invoke_2;
    v20 = &unk_1E95BB780;
    objc_copyWeak(&v24, a1 + 8);
    v21 = a1[4];
    v22 = a1[6];
    v23 = a1[7];
    dispatch_async(v13, &v17);

    v14 = objc_loadWeakRetained(a1 + 8);
    objc_msgSend(v14, "workQueueDidFinishCommand", v17, v18, v19, v20);

    objc_destroyWeak(&v24);
  }

}

void __68__MSASStateMachine__markAsSpamInvitationForAlbumDisposition_params___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v2, "_canceledError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "MSASStateMachine:didFinishMarkingAsSpamInvitationForAlbum:invitationGUID:info:error:", v2, v3, v5, v4, v6);

}

void __68__MSASStateMachine__markAsSpamInvitationForAlbumDisposition_params___block_invoke_143(uint64_t a1)
{
  id *v2;
  void *v3;
  id v4;
  id WeakRetained;

  v2 = (id *)(a1 + 64);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "MSASStateMachine:didFinishMarkingAsSpamInvitationForAlbum:invitationGUID:info:error:", v4, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

uint64_t __68__MSASStateMachine__markAsSpamInvitationForAlbumDisposition_params___block_invoke_144(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "reset");
}

void __68__MSASStateMachine__markAsSpamInvitationForAlbumDisposition_params___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "daemon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "personID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didReceiveAuthSuccessForPersonID:", v6);

  v9 = objc_loadWeakRetained(v2);
  objc_msgSend(v9, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_loadWeakRetained(v2);
  objc_msgSend(v7, "MSASStateMachine:didFinishMarkingAsSpamInvitationForAlbum:invitationGUID:info:error:", v8, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);

}

void __69__MSASStateMachine_markAsSpamInvitationForAlbum_invitationGUID_info___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    v9 = 138543618;
    v10 = v2;
    v11 = 2114;
    v12 = v3;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Scheduling mark as spam invitation for album %{public}@", (uint8_t *)&v9, 0x16u);
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), CFSTR("album"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), CFSTR("info"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 56), CFSTR("sharingRelationshipGUID"));
  objc_msgSend(*(id *)(a1 + 32), "_model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel__markAsSpamInvitationForAlbumDisposition_params_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "personID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "GUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enqueueCommand:params:personID:albumGUID:assetCollectionGUID:", v6, v4, v7, v8, 0);

  objc_msgSend(*(id *)(a1 + 32), "workQueueRetryOutstandingActivities");
}

void __60__MSASStateMachine__unsubscribeFromAlbumDisposition_params___block_invoke(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v3 = a2;
  objc_msgSend(a1[4], "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__MSASStateMachine__unsubscribeFromAlbumDisposition_params___block_invoke_2;
  block[3] = &unk_1E95BB6C0;
  v9 = v3;
  v5 = v3;
  objc_copyWeak(&v13, a1 + 7);
  v6 = a1[5];
  v7 = a1[4];
  v10 = v6;
  v11 = v7;
  v12 = a1[6];
  dispatch_async(v4, block);

  objc_destroyWeak(&v13);
}

void __60__MSASStateMachine__unsubscribeFromAlbumDisposition_params___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v2, "_canceledError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "MSASStateMachine:didFinishUnsubscribingFromAlbum:info:error:", v2, v3, v4, v5);

}

void __60__MSASStateMachine__unsubscribeFromAlbumDisposition_params___block_invoke_2(id *a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  _QWORD block[4];
  id v25;
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (a1[4])
  {
    WeakRetained = objc_loadWeakRetained(a1 + 8);
    v3 = a1[4];
    objc_msgSend(a1[5], "GUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v3) = objc_msgSend(WeakRetained, "workQueueEndCommandWithError:command:params:albumGUID:assetCollectionGUID:", v3, 0, 0, v4, 0);

    if ((v3 & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v13 = objc_loadWeakRetained(a1 + 8);
        v15 = a1[4];
        v14 = a1[5];
        *(_DWORD *)buf = 138543874;
        v30 = v13;
        v31 = 2114;
        v32 = v14;
        v33 = 2114;
        v34 = v15;
        _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Failed to unsubscribe from album %{public}@. Error: %{public}@", buf, 0x20u);

      }
      objc_msgSend(a1[6], "eventQueue");
      v5 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __60__MSASStateMachine__unsubscribeFromAlbumDisposition_params___block_invoke_138;
      block[3] = &unk_1E95BB780;
      objc_copyWeak(&v28, a1 + 8);
      v25 = a1[5];
      v26 = a1[7];
      v27 = a1[4];
      dispatch_async(v5, block);

      v6 = objc_loadWeakRetained(a1 + 8);
      objc_msgSend(v6, "workQueueDidFinishCommand");

      objc_destroyWeak(&v28);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v7 = objc_loadWeakRetained(a1 + 8);
      v8 = a1[5];
      *(_DWORD *)buf = 138543618;
      v30 = v7;
      v31 = 2114;
      v32 = v8;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Successfully unsubscribed from album %{public}@", buf, 0x16u);

    }
    objc_msgSend(a1[6], "memberQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __60__MSASStateMachine__unsubscribeFromAlbumDisposition_params___block_invoke_139;
    v23[3] = &unk_1E95BCED0;
    v23[4] = a1[6];
    dispatch_barrier_sync(v9, v23);

    objc_msgSend(a1[6], "eventQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    v16 = v10;
    v17 = 3221225472;
    v18 = __60__MSASStateMachine__unsubscribeFromAlbumDisposition_params___block_invoke_2_140;
    v19 = &unk_1E95BBC00;
    objc_copyWeak(&v22, a1 + 8);
    v20 = a1[5];
    v21 = a1[7];
    dispatch_async(v11, &v16);

    v12 = objc_loadWeakRetained(a1 + 8);
    objc_msgSend(v12, "workQueueDidFinishCommand", v16, v17, v18, v19);

    objc_destroyWeak(&v22);
  }
}

void __60__MSASStateMachine__unsubscribeFromAlbumDisposition_params___block_invoke_138(uint64_t a1)
{
  id *v2;
  void *v3;
  id v4;
  id WeakRetained;

  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "MSASStateMachine:didFinishUnsubscribingFromAlbum:info:error:", v4, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __60__MSASStateMachine__unsubscribeFromAlbumDisposition_params___block_invoke_139(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "reset");
}

void __60__MSASStateMachine__unsubscribeFromAlbumDisposition_params___block_invoke_2_140(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "daemon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "personID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didReceiveAuthSuccessForPersonID:", v6);

  v9 = objc_loadWeakRetained(v2);
  objc_msgSend(v9, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_loadWeakRetained(v2);
  objc_msgSend(v7, "MSASStateMachine:didFinishUnsubscribingFromAlbum:info:error:", v8, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0);

}

void __46__MSASStateMachine_unsubscribeFromAlbum_info___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    v12 = 138543618;
    v13 = v2;
    v14 = 2114;
    v15 = v3;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Scheduling unsubscription from album %{public}@", (uint8_t *)&v12, 0x16u);
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("album"));
  v7 = *(_QWORD *)(a1 + 48);
  if (v7)
    objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("info"));
  objc_msgSend(*(id *)(a1 + 32), "_model");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel__unsubscribeFromAlbumDisposition_params_);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "personID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "GUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "enqueueCommand:params:personID:albumGUID:assetCollectionGUID:", v9, v5, v10, v11, 0);

  objc_msgSend(*(id *)(a1 + 32), "workQueueRetryOutstandingActivities");
}

void __56__MSASStateMachine__subscribeToAlbumDisposition_params___block_invoke(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v3 = a2;
  objc_msgSend(a1[4], "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__MSASStateMachine__subscribeToAlbumDisposition_params___block_invoke_2;
  block[3] = &unk_1E95BB6C0;
  v9 = v3;
  v5 = v3;
  objc_copyWeak(&v13, a1 + 7);
  v6 = a1[5];
  v7 = a1[4];
  v10 = v6;
  v11 = v7;
  v12 = a1[6];
  dispatch_async(v4, block);

  objc_destroyWeak(&v13);
}

void __56__MSASStateMachine__subscribeToAlbumDisposition_params___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v2, "_canceledError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "MSASStateMachine:didFinishSubscribingToAlbum:info:error:", v2, v3, v4, v5);

}

void __56__MSASStateMachine__subscribeToAlbumDisposition_params___block_invoke_2(id *a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  _QWORD block[4];
  id v25;
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (a1[4])
  {
    WeakRetained = objc_loadWeakRetained(a1 + 8);
    v3 = a1[4];
    objc_msgSend(a1[5], "GUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v3) = objc_msgSend(WeakRetained, "workQueueEndCommandWithError:command:params:albumGUID:assetCollectionGUID:", v3, 0, 0, v4, 0);

    if ((v3 & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v13 = objc_loadWeakRetained(a1 + 8);
        v15 = a1[4];
        v14 = a1[5];
        *(_DWORD *)buf = 138543874;
        v30 = v13;
        v31 = 2114;
        v32 = v14;
        v33 = 2114;
        v34 = v15;
        _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Failed to subscribe to album %{public}@. Error: %{public}@", buf, 0x20u);

      }
      objc_msgSend(a1[6], "eventQueue");
      v5 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __56__MSASStateMachine__subscribeToAlbumDisposition_params___block_invoke_132;
      block[3] = &unk_1E95BB780;
      objc_copyWeak(&v28, a1 + 8);
      v25 = a1[5];
      v26 = a1[7];
      v27 = a1[4];
      dispatch_async(v5, block);

      v6 = objc_loadWeakRetained(a1 + 8);
      objc_msgSend(v6, "workQueueDidFinishCommand");

      objc_destroyWeak(&v28);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v7 = objc_loadWeakRetained(a1 + 8);
      v8 = a1[5];
      *(_DWORD *)buf = 138543618;
      v30 = v7;
      v31 = 2114;
      v32 = v8;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Successfully subscribed to album %{public}@", buf, 0x16u);

    }
    objc_msgSend(a1[6], "memberQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __56__MSASStateMachine__subscribeToAlbumDisposition_params___block_invoke_133;
    v23[3] = &unk_1E95BCED0;
    v23[4] = a1[6];
    dispatch_barrier_sync(v9, v23);

    objc_msgSend(a1[6], "eventQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    v16 = v10;
    v17 = 3221225472;
    v18 = __56__MSASStateMachine__subscribeToAlbumDisposition_params___block_invoke_2_134;
    v19 = &unk_1E95BBC00;
    objc_copyWeak(&v22, a1 + 8);
    v20 = a1[5];
    v21 = a1[7];
    dispatch_async(v11, &v16);

    v12 = objc_loadWeakRetained(a1 + 8);
    objc_msgSend(v12, "workQueueDidFinishCommand", v16, v17, v18, v19);

    objc_destroyWeak(&v22);
  }
}

void __56__MSASStateMachine__subscribeToAlbumDisposition_params___block_invoke_132(uint64_t a1)
{
  id *v2;
  void *v3;
  id v4;
  id WeakRetained;

  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "MSASStateMachine:didFinishSubscribingToAlbum:info:error:", v4, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __56__MSASStateMachine__subscribeToAlbumDisposition_params___block_invoke_133(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "reset");
}

void __56__MSASStateMachine__subscribeToAlbumDisposition_params___block_invoke_2_134(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "daemon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "personID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didReceiveAuthSuccessForPersonID:", v6);

  v9 = objc_loadWeakRetained(v2);
  objc_msgSend(v9, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_loadWeakRetained(v2);
  objc_msgSend(v7, "MSASStateMachine:didFinishSubscribingToAlbum:info:error:", v8, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0);

}

void __42__MSASStateMachine_subscribeToAlbum_info___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    v12 = 138543618;
    v13 = v2;
    v14 = 2114;
    v15 = v3;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Scheduling subscription to album %{public}@", (uint8_t *)&v12, 0x16u);
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("album"));
  v7 = *(_QWORD *)(a1 + 48);
  if (v7)
    objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("info"));
  objc_msgSend(*(id *)(a1 + 32), "_model");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel__subscribeToAlbumDisposition_params_);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "personID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "GUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "enqueueCommand:params:personID:albumGUID:assetCollectionGUID:", v9, v5, v10, v11, 0);

  objc_msgSend(*(id *)(a1 + 32), "workQueueRetryOutstandingActivities");
}

void __57__MSASStateMachine__getAccessControlsDisposition_params___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "MSASStateMachine:didFinishGettingAccessControls:forAlbum:info:error:", *(_QWORD *)(a1 + 32), 0, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

void __57__MSASStateMachine__getAccessControlsDisposition_params___block_invoke_125(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;

  v5 = a2;
  v6 = a3;
  objc_msgSend(a1[4], "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__MSASStateMachine__getAccessControlsDisposition_params___block_invoke_2;
  block[3] = &unk_1E95BB8A8;
  v13 = v5;
  v8 = v5;
  objc_copyWeak(&v19, a1 + 8);
  v14 = a1[5];
  v9 = a1[6];
  v10 = a1[4];
  v15 = v9;
  v16 = v10;
  v17 = a1[7];
  v18 = v6;
  v11 = v6;
  dispatch_async(v7, block);

  objc_destroyWeak(&v19);
}

void __57__MSASStateMachine__getAccessControlsDisposition_params___block_invoke_2_129(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v2, "_canceledError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "MSASStateMachine:didFinishGettingAccessControls:forAlbum:info:error:", v2, 0, v3, v4, v5);

}

void __57__MSASStateMachine__getAccessControlsDisposition_params___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id *v8;
  id *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[7];
  id v19;
  _QWORD block[7];
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
    v3 = *(_QWORD *)(a1 + 32);
    NSStringFromSelector(sel__getAccessControlsDisposition_params_);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "GUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v3) = objc_msgSend(WeakRetained, "workQueueEndCommandWithError:command:params:albumGUID:assetCollectionGUID:", v3, v4, v5, v6, 0);

    if ((v3 & 1) != 0)
      return;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v15 = objc_loadWeakRetained((id *)(a1 + 80));
      v16 = *(_QWORD *)(a1 + 48);
      v17 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      v23 = v15;
      v24 = 2114;
      v25 = v16;
      v26 = 2114;
      v27 = v17;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Failed to retrieve access controls for album %{public}@. Error: %{public}@", buf, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 56), "eventQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__MSASStateMachine__getAccessControlsDisposition_params___block_invoke_126;
    block[3] = &unk_1E95BB780;
    v8 = (id *)block;
    v9 = &v21;
    objc_copyWeak(&v21, (id *)(a1 + 80));
    block[4] = *(id *)(a1 + 48);
    block[5] = *(id *)(a1 + 64);
    block[6] = *(id *)(a1 + 32);
    dispatch_async(v7, block);

    v10 = objc_loadWeakRetained((id *)(a1 + 80));
    objc_msgSend(v10, "workQueueDidFinishCommand");
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v11 = objc_loadWeakRetained((id *)(a1 + 80));
      v12 = objc_msgSend(*(id *)(a1 + 72), "count");
      v13 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      v23 = v11;
      v24 = 2048;
      v25 = v12;
      v26 = 2114;
      v27 = v13;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Successfully retrieved %ld access control entries for album %{public}@", buf, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 56), "eventQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __57__MSASStateMachine__getAccessControlsDisposition_params___block_invoke_127;
    v18[3] = &unk_1E95BB780;
    v8 = (id *)v18;
    v9 = &v19;
    objc_copyWeak(&v19, (id *)(a1 + 80));
    v18[4] = *(id *)(a1 + 72);
    v18[5] = *(id *)(a1 + 48);
    v18[6] = *(id *)(a1 + 64);
    dispatch_async(v14, v18);

    v10 = objc_loadWeakRetained((id *)(a1 + 80));
    objc_msgSend(v10, "workQueueDidFinishCommand");
  }

  objc_destroyWeak(v9);
}

void __57__MSASStateMachine__getAccessControlsDisposition_params___block_invoke_126(uint64_t a1)
{
  id *v2;
  void *v3;
  id v4;
  id WeakRetained;

  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "MSASStateMachine:didFinishGettingAccessControls:forAlbum:info:error:", v4, 0, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __57__MSASStateMachine__getAccessControlsDisposition_params___block_invoke_127(uint64_t a1)
{
  id *v2;
  void *v3;
  id v4;
  id WeakRetained;

  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "MSASStateMachine:didFinishGettingAccessControls:forAlbum:info:error:", v4, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);

}

uint64_t __52__MSASStateMachine_getAccessControlsForAlbums_info___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v26 = v2;
    v27 = 2114;
    v28 = v3;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Scheduling retrieval of ACL for albums %{public}@", buf, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_model");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "beginTransaction");

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = *(id *)(a1 + 40);
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v8);
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v9)
          objc_msgSend(v10, "setObject:forKey:", v9, CFSTR("album"));
        v12 = *(_QWORD *)(a1 + 48);
        if (v12)
          objc_msgSend(v11, "setObject:forKey:", v12, CFSTR("info"));
        objc_msgSend(*(id *)(a1 + 32), "_model");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(sel__getAccessControlsDisposition_params_);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "personID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "GUID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "enqueueCommand:params:personID:albumGUID:assetCollectionGUID:", v14, v11, v15, v16, 0);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v6);
  }

  objc_msgSend(*(id *)(a1 + 32), "_model");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "endTransaction");

  return objc_msgSend(*(id *)(a1 + 32), "workQueueRetryOutstandingActivities");
}

void __72__MSASStateMachine__didFinishCheckingUpdatesInAlbumsDisposition_params___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "MSASStateMachine:didFinishCheckingForUpdatesInAlbums:info:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __72__MSASStateMachine__didFinishCheckingUpdatesInAlbumsDisposition_params___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "MSASStateMachine:didFinishCheckingForUpdatesInAlbums:info:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __62__MSASStateMachine__checkForUpdatesInAlbumDisposition_params___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "MSASStateMachine:didFinishCheckingForUpdatesInAlbum:info:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

void __62__MSASStateMachine__checkForUpdatesInAlbumDisposition_params___block_invoke_115(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "MSASStateMachine:willCheckForUpdatesInAlbum:info:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

}

void __62__MSASStateMachine__checkForUpdatesInAlbumDisposition_params___block_invoke_2(uint64_t a1, void *a2, char a3, void *a4, char a5, void *a6, void *a7)
{
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  id v34;
  char v35;
  char v36;

  v13 = a2;
  v14 = a4;
  v15 = a6;
  v16 = a7;
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v17 = objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __62__MSASStateMachine__checkForUpdatesInAlbumDisposition_params___block_invoke_3;
  v25[3] = &unk_1E95BB648;
  v26 = v13;
  v18 = v13;
  objc_copyWeak(&v34, (id *)(a1 + 64));
  v27 = *(id *)(a1 + 40);
  v19 = *(id *)(a1 + 48);
  v20 = *(_QWORD *)(a1 + 32);
  v28 = v19;
  v29 = v20;
  v21 = *(_QWORD *)(a1 + 56);
  v35 = a3;
  v30 = v15;
  v31 = v14;
  v36 = a5;
  v32 = v16;
  v33 = v21;
  v22 = v16;
  v23 = v14;
  v24 = v15;
  dispatch_async(v17, v25);

  objc_destroyWeak(&v34);
}

void __62__MSASStateMachine__checkForUpdatesInAlbumDisposition_params___block_invoke_3_122(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "MSASStateMachine:willCheckForUpdatesInAlbum:info:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v3, "_canceledError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "MSASStateMachine:didFinishCheckingForUpdatesInAlbum:info:error:", v3, v4, v5, v6);

}

void __62__MSASStateMachine__checkForUpdatesInAlbumDisposition_params___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id *v8;
  id v9;
  uint64_t v10;
  id v11;
  id *v12;
  id *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  NSObject *v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  NSObject *v31;
  id v32;
  void *v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  id v37;
  id v38;
  uint64_t v39;
  void *v40;
  id v41;
  uint64_t v42;
  void *v43;
  id v44;
  void *v45;
  _QWORD v46[4];
  id v47;
  id v48;
  id v49;
  id v50;
  uint64_t v51;
  id v52;
  _QWORD v53[5];
  _QWORD v54[4];
  id v55;
  _QWORD v56[2];
  id v57;
  _QWORD block[4];
  id v59;
  _QWORD v60[2];
  id v61;
  uint8_t buf[4];
  id v63;
  __int16 v64;
  uint64_t v65;
  __int16 v66;
  void *v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
    v3 = *(_QWORD *)(a1 + 32);
    NSStringFromSelector(sel__checkForUpdatesInAlbumDisposition_params_);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "GUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v3) = objc_msgSend(WeakRetained, "workQueueEndCommandWithError:command:params:albumGUID:assetCollectionGUID:", v3, v4, v5, v6, 0);

    if ((v3 & 1) != 0)
      return;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v38 = objc_loadWeakRetained((id *)(a1 + 96));
      v39 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 32), "MSVerboseDescription");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v63 = v38;
      v64 = 2114;
      v65 = v39;
      v66 = 2114;
      v67 = v40;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Could not complete checking for updates for album %{public}@. Error: %{public}@", buf, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 56), "eventQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__MSASStateMachine__checkForUpdatesInAlbumDisposition_params___block_invoke_116;
    block[3] = &unk_1E95BB5F8;
    v8 = &v61;
    objc_copyWeak(&v61, (id *)(a1 + 96));
    v9 = *(id *)(a1 + 64);
    v10 = *(_QWORD *)(a1 + 88);
    v59 = v9;
    v60[1] = v10;
    v60[0] = *(id *)(a1 + 32);
    dispatch_async(v7, block);

    v11 = objc_loadWeakRetained((id *)(a1 + 96));
    objc_msgSend(v11, "workQueueDidFinishCommand");

    v12 = &v59;
    v13 = (id *)v60;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v14 = objc_loadWeakRetained((id *)(a1 + 96));
      objc_msgSend(*(id *)(a1 + 64), "GUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v63 = v14;
      v64 = 2114;
      v65 = (uint64_t)v15;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Finished checking for updates in album %{public}@.", buf, 0x16u);

    }
    if (*(_BYTE *)(a1 + 104))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v16 = objc_loadWeakRetained((id *)(a1 + 96));
        objc_msgSend(*(id *)(a1 + 64), "GUID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v63 = v16;
        v64 = 2114;
        v65 = (uint64_t)v17;
        _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Album %{public}@ was reset synced.", buf, 0x16u);

      }
      v18 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
      objc_msgSend(*(id *)(a1 + 48), "GUID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (id)objc_msgSend(v18, "MSASAddIsAlbumResetSyncAlbumGUID:", v19);

      v21 = (id)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "MSASAddNotInterestingKey");
    }
    objc_msgSend(*(id *)(a1 + 56), "eventQueue");
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = MEMORY[0x1E0C809B0];
    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = __62__MSASStateMachine__checkForUpdatesInAlbumDisposition_params___block_invoke_117;
    v54[3] = &unk_1E95BB5F8;
    v8 = &v57;
    objc_copyWeak(&v57, (id *)(a1 + 96));
    v24 = *(id *)(a1 + 64);
    v25 = *(_QWORD *)(a1 + 88);
    v55 = v24;
    v56[1] = v25;
    v56[0] = *(id *)(a1 + 32);
    dispatch_async(v22, v54);

    if (objc_msgSend(*(id *)(a1 + 72), "count"))
    {
      v26 = MEMORY[0x1E0C81028];
      v27 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        v41 = objc_loadWeakRetained((id *)(a1 + 96));
        v42 = objc_msgSend(*(id *)(a1 + 72), "count");
        objc_msgSend(*(id *)(a1 + 64), "GUID");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v63 = v41;
        v64 = 2048;
        v65 = v42;
        v66 = 2114;
        v67 = v43;
        _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Found changes to %lu asset collections in album %{public}@.", buf, 0x20u);

      }
      v28 = objc_loadWeakRetained((id *)(a1 + 96));
      objc_msgSend(v28, "delegate");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_loadWeakRetained((id *)(a1 + 96));
      objc_msgSend(v29, "MSASStateMachine:didFindAssetCollectionChanges:forAlbum:info:", v30, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40));

    }
    if (*(_BYTE *)(a1 + 105) && *(_QWORD *)(a1 + 64))
    {
      v31 = MEMORY[0x1E0C81028];
      v32 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        v44 = objc_loadWeakRetained((id *)(a1 + 96));
        objc_msgSend(*(id *)(a1 + 64), "GUID");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v63 = v44;
        v64 = 2114;
        v65 = (uint64_t)v45;
        _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Found sharing info changes to album %{public}@.", buf, 0x16u);

      }
      v33 = *(void **)(a1 + 56);
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", *(_QWORD *)(a1 + 64));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "getAccessControlsForAlbums:info:", v34, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40));

    }
    objc_msgSend(*(id *)(a1 + 56), "memberQueue");
    v35 = objc_claimAutoreleasedReturnValue();
    v53[0] = v23;
    v53[1] = 3221225472;
    v53[2] = __62__MSASStateMachine__checkForUpdatesInAlbumDisposition_params___block_invoke_119;
    v53[3] = &unk_1E95BCED0;
    v53[4] = *(_QWORD *)(a1 + 56);
    dispatch_barrier_sync(v35, v53);

    objc_msgSend(*(id *)(a1 + 56), "eventQueue");
    v36 = objc_claimAutoreleasedReturnValue();
    v46[0] = v23;
    v46[1] = 3221225472;
    v46[2] = __62__MSASStateMachine__checkForUpdatesInAlbumDisposition_params___block_invoke_2_120;
    v46[3] = &unk_1E95BB620;
    v47 = *(id *)(a1 + 64);
    v48 = *(id *)(a1 + 80);
    v49 = *(id *)(a1 + 48);
    objc_copyWeak(&v52, (id *)(a1 + 96));
    v51 = *(_QWORD *)(a1 + 88);
    v50 = *(id *)(a1 + 32);
    dispatch_async(v36, v46);

    v37 = objc_loadWeakRetained((id *)(a1 + 96));
    objc_msgSend(v37, "workQueueDidFinishCommand");

    objc_destroyWeak(&v52);
    v12 = &v55;
    v13 = (id *)v56;
  }

  objc_destroyWeak(v8);
}

void __62__MSASStateMachine__checkForUpdatesInAlbumDisposition_params___block_invoke_116(uint64_t a1)
{
  id *v2;
  void *v3;
  id v4;
  id WeakRetained;

  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "MSASStateMachine:didFinishCheckingForUpdatesInAlbum:info:error:", v4, *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(a1 + 40));

}

void __62__MSASStateMachine__checkForUpdatesInAlbumDisposition_params___block_invoke_117(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  int v11;
  id v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    v3 = *(_QWORD *)(a1 + 32);
    v11 = 138543618;
    v12 = WeakRetained;
    v13 = 2114;
    v14 = v3;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Saving album %{public}@.", (uint8_t *)&v11, 0x16u);

  }
  v4 = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(v4, "daemon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(v6, "personID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didReceiveAuthSuccessForPersonID:", v7);

  v8 = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(v8, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(v9, "MSASStateMachine:didFindChangesInAlbum:info:error:", v10, *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(a1 + 40));

}

uint64_t __62__MSASStateMachine__checkForUpdatesInAlbumDisposition_params___block_invoke_119(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "reset");
}

void __62__MSASStateMachine__checkForUpdatesInAlbumDisposition_params___block_invoke_2_120(uint64_t a1)
{
  int v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id WeakRetained;

  v2 = objc_msgSend(*(id *)(a1 + 32), "useForeignCtag");
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    objc_msgSend(v3, "setForeignCtag:", v4);
    objc_msgSend(*(id *)(a1 + 48), "ctag");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setCtag:", v5);

  }
  else
  {
    objc_msgSend(v3, "setCtag:", v4);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(WeakRetained, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(v6, "MSASStateMachine:didFinishCheckingForUpdatesInAlbum:info:error:", v7, *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(_QWORD *)(a1 + 56));

}

void __59__MSASStateMachine_checkForUpdatesInAlbums_resetSync_info___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v33 = v2;
    v34 = 2114;
    v35 = v3;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Scheduling check for updates in albums %{public}@", buf, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_model");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "beginTransaction");

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = *(id *)(a1 + 40);
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v28;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v28 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v8);
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v9)
          objc_msgSend(v10, "setObject:forKey:", v9, CFSTR("album"));
        v12 = *(_QWORD *)(a1 + 48);
        if (v12)
          objc_msgSend(v11, "setObject:forKey:", v12, CFSTR("info"));
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 56));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKey:", v13, CFSTR("resetSync"));

        objc_msgSend(*(id *)(a1 + 32), "_model");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(sel__checkForUpdatesInAlbumDisposition_params_);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "personID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "GUID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "enqueueCommand:params:personID:albumGUID:assetCollectionGUID:", v15, v11, v16, v17, 0);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  v20 = *(_QWORD *)(a1 + 40);
  if (v20)
    objc_msgSend(v18, "setObject:forKey:", v20, CFSTR("albums"));
  v21 = *(_QWORD *)(a1 + 48);
  if (v21)
    objc_msgSend(v19, "setObject:forKey:", v21, CFSTR("info"));
  objc_msgSend(*(id *)(a1 + 32), "_model");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel__didFinishCheckingUpdatesInAlbumsDisposition_params_);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "personID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "enqueueCommand:params:personID:albumGUID:assetCollectionGUID:", v23, v19, v24, 0, 0);

  objc_msgSend(*(id *)(a1 + 32), "_model");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "endTransaction");

  objc_msgSend(*(id *)(a1 + 32), "workQueueRetryOutstandingActivities");
}

void __55__MSASStateMachine__checkForChangesDisposition_params___block_invoke(id *a1, void *a2, char a3, void *a4, void *a5, void *a6, void *a7)
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD block[4];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  char v33;

  v13 = a2;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  objc_msgSend(a1[4], "workQueue");
  v18 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__MSASStateMachine__checkForChangesDisposition_params___block_invoke_2;
  block[3] = &unk_1E95BB5A0;
  v25 = v13;
  v26 = a1[5];
  v27 = v14;
  v28 = a1[4];
  v33 = a3;
  v19 = v14;
  v20 = v13;
  objc_copyWeak(&v32, a1 + 6);
  v29 = v17;
  v30 = v15;
  v31 = v16;
  v21 = v16;
  v22 = v15;
  v23 = v17;
  dispatch_async(v18, block);

  objc_destroyWeak(&v32);
}

void __55__MSASStateMachine__checkForChangesDisposition_params___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "_canceledError");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "MSASStateMachine:didFinishCheckingForChangesInfo:error:", v3, v2, v4);

}

void __55__MSASStateMachine__checkForChangesDisposition_params___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  id *v4;
  id WeakRetained;
  char v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  id *v22;
  id v23;
  void *v24;
  void *v25;
  __CFString *v26;
  void *v27;
  id v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[5];
  _QWORD block[4];
  id v34;
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  uint8_t buf[4];
  id v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99E08], "MSASDictionaryWithCopyOfDictionary:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
LABEL_2:
    v4 = (id *)(a1 + 88);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
    v6 = objc_msgSend(WeakRetained, "workQueueEndCommandWithError:command:params:albumGUID:assetCollectionGUID:", v2, 0, 0, 0, 0);

    if ((v6 & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v28 = objc_loadWeakRetained((id *)(a1 + 88));
        objc_msgSend(v2, "MSVerboseDescription");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v44 = v28;
        v45 = 2114;
        v46 = v29;
        _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Failed to check for changes. Error: %{public}@", buf, 0x16u);

      }
      objc_msgSend(*(id *)(a1 + 56), "eventQueue");
      v7 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __55__MSASStateMachine__checkForChangesDisposition_params___block_invoke_107;
      block[3] = &unk_1E95BBC00;
      objc_copyWeak(&v36, v4);
      v34 = v3;
      v2 = v2;
      v35 = v2;
      dispatch_async(v7, block);

      v8 = objc_loadWeakRetained(v4);
      objc_msgSend(v8, "workQueueDidFinishCommand");

      objc_destroyWeak(&v36);
    }
    goto LABEL_17;
  }
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 56), "setPendingRootCtag:");
    if (*(_BYTE *)(a1 + 96))
    {
      v9 = (id)objc_msgSend(v3, "MSASAddIsGlobalResetSync");
      v10 = (id)objc_msgSend(v3, "MSASAddNotInterestingKey");
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v11 = objc_loadWeakRetained((id *)(a1 + 88));
        *(_DWORD *)buf = 138543362;
        v44 = v11;
        _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Global reset sync found.", buf, 0xCu);

      }
      v12 = objc_loadWeakRetained((id *)(a1 + 88));
      objc_msgSend(v12, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_loadWeakRetained((id *)(a1 + 88));
      objc_msgSend(v13, "MSASStateMachineDidFindGlobalResetSync:info:", v14, v3);

    }
    objc_msgSend(*(id *)(a1 + 56), "eventQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __55__MSASStateMachine__checkForChangesDisposition_params___block_invoke_101;
    v37[3] = &unk_1E95BB6C0;
    objc_copyWeak(&v42, (id *)(a1 + 88));
    v38 = *(id *)(a1 + 64);
    v39 = *(id *)(a1 + 72);
    v40 = *(id *)(a1 + 80);
    v41 = *(id *)(a1 + 40);
    dispatch_async(v15, v37);

    objc_destroyWeak(&v42);
  }
  else
  {
    v24 = (void *)MEMORY[0x1E0CB35C8];
    v25 = (void *)MEMORY[0x1E0CB3940];
    v26 = (__CFString *)MSCFCopyLocalizedString(CFSTR("ERROR_MSAS_SUB_MISSING_FIELD_P_FIELD"));
    objc_msgSend(v25, "stringWithFormat:", v26, CFSTR("rootctag"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "MSErrorWithDomain:code:description:", CFSTR("MSASSubscriberErrorDomain"), 0, v27);
    v2 = (id)objc_claimAutoreleasedReturnValue();

    if (v2)
      goto LABEL_2;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v16 = objc_loadWeakRetained((id *)(a1 + 88));
    *(_DWORD *)buf = 138543362;
    v44 = v16;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Successfully checked for changes updates.", buf, 0xCu);

  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v17 = objc_loadWeakRetained((id *)(a1 + 88));
    v18 = *(void **)(a1 + 48);
    *(_DWORD *)buf = 138543618;
    v44 = v17;
    v45 = 2114;
    v46 = v18;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: New root ctag: %{public}@", buf, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 56), "memberQueue");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __55__MSASStateMachine__checkForChangesDisposition_params___block_invoke_108;
  v32[3] = &unk_1E95BCED0;
  v32[4] = *(_QWORD *)(a1 + 56);
  dispatch_barrier_sync(v19, v32);

  objc_msgSend(*(id *)(a1 + 56), "eventQueue");
  v21 = objc_claimAutoreleasedReturnValue();
  v30[0] = v20;
  v30[1] = 3221225472;
  v30[2] = __55__MSASStateMachine__checkForChangesDisposition_params___block_invoke_2_109;
  v30[3] = &unk_1E95BB300;
  v22 = (id *)(a1 + 88);
  objc_copyWeak(&v31, v22);
  dispatch_async(v21, v30);

  v23 = objc_loadWeakRetained(v22);
  objc_msgSend(v23, "workQueueDidFinishCommand");

  objc_destroyWeak(&v31);
  v2 = 0;
LABEL_17:

}

void __55__MSASStateMachine__checkForChangesDisposition_params___block_invoke_101(uint64_t a1)
{
  id *v2;
  void *v3;
  id v4;
  id WeakRetained;

  v2 = (id *)(a1 + 64);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "MSASStateMachine:didFindSyncedKeyValueChangesForAlbumGUIDS:albumChanges:accessControlChangesForAlbumGUIDS:info:", v4, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

void __55__MSASStateMachine__checkForChangesDisposition_params___block_invoke_107(uint64_t a1)
{
  id *v2;
  void *v3;
  id v4;
  id WeakRetained;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "MSASStateMachine:didFinishCheckingForChangesInfo:error:", v4, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

uint64_t __55__MSASStateMachine__checkForChangesDisposition_params___block_invoke_108(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "reset");
}

void __55__MSASStateMachine__checkForChangesDisposition_params___block_invoke_2_109(uint64_t a1)
{
  id *v1;
  void *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "daemon");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "personID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didReceiveAuthSuccessForPersonID:", v4);

}

uint64_t __50__MSASStateMachine_checkForChangesResetSync_info___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 48)
    || (objc_msgSend(*(id *)(a1 + 32), "_model"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        NSStringFromSelector(sel__checkForChangesDisposition_params_),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        v18 = objc_msgSend(v16, "countOfEnqueuedCommand:", v17),
        v17,
        v16,
        v18 < 1))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v2 = *(_QWORD *)(a1 + 32);
      v3 = *(unsigned __int8 *)(a1 + 48);
      v20 = 138543618;
      v21 = v2;
      v22 = 1024;
      v23 = v3;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Scheduling check for changes. Reset sync: %d", (uint8_t *)&v20, 0x12u);
    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("resetSync"));

    v6 = *(_QWORD *)(a1 + 40);
    if (v6)
      objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("info"));
    objc_msgSend(*(id *)(a1 + 32), "serverSideConfigurationVersion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v8 = *(_QWORD *)(a1 + 32);
        v20 = 138543362;
        v21 = v8;
        _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Scheduling retrieval of server side configuration because we don't have it yet.", (uint8_t *)&v20, 0xCu);
      }
      objc_msgSend(*(id *)(a1 + 32), "_model");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel__sendGetServerSideConfigurationDisposition_params_);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "personID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "enqueueCommand:params:personID:albumGUID:assetCollectionGUID:", v10, 0, v11, 0, 0);

    }
    objc_msgSend(*(id *)(a1 + 32), "_model");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel__checkForChangesDisposition_params_);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "personID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "enqueueCommand:params:personID:albumGUID:assetCollectionGUID:", v13, v4, v14, 0, 0);

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v19 = *(_QWORD *)(a1 + 32);
    v20 = 138543362;
    v21 = v19;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Not scheduling another check for changes because there is already one scheduled.", (uint8_t *)&v20, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "workQueueRetryOutstandingActivities");
}

void __47__MSASStateMachine__assetCollectionFailedError__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  __CFString *v3;

  v0 = (void *)MEMORY[0x1E0CB35C8];
  v3 = (__CFString *)MSCFCopyLocalizedString(CFSTR("ERROR_STATE_PHOTO_FAILED"));
  objc_msgSend(v0, "MSErrorWithDomain:code:description:", CFSTR("MSASStateMachineErrorDomain"), 2, v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_assetCollectionFailedError_error;
  _assetCollectionFailedError_error = v1;

}

void __49__MSASStateMachine__assetCollectionRejectedError__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  __CFString *v3;

  v0 = (void *)MEMORY[0x1E0CB35C8];
  v3 = (__CFString *)MSCFCopyLocalizedString(CFSTR("ERROR_STATE_PHOTO_REJECTED"));
  objc_msgSend(v0, "MSErrorWithDomain:code:description:", CFSTR("MSASStateMachineErrorDomain"), 2, v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_assetCollectionRejectedError_error;
  _assetCollectionRejectedError_error = v1;

}

void __33__MSASStateMachine__stoppedError__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  __CFString *v3;

  v0 = (void *)MEMORY[0x1E0CB35C8];
  v3 = (__CFString *)MSCFCopyLocalizedString(CFSTR("ERROR_STATE_STOPPED"));
  objc_msgSend(v0, "MSErrorWithDomain:code:description:", CFSTR("MSASStateMachineErrorDomain"), 1, v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_stoppedError_error;
  _stoppedError_error = v1;

}

void __34__MSASStateMachine__canceledError__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  __CFString *v3;

  v0 = (void *)MEMORY[0x1E0CB35C8];
  v3 = (__CFString *)MSCFCopyLocalizedString(CFSTR("ERROR_STATE_CANCELED"));
  objc_msgSend(v0, "MSErrorWithDomain:code:description:", CFSTR("MSASStateMachineErrorDomain"), 0, v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_canceledError_error;
  _canceledError_error = v1;

}

void __51__MSASStateMachine__getAlbumURLDisposition_params___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  objc_msgSend(a1[4], "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__MSASStateMachine__getAlbumURLDisposition_params___block_invoke_2;
  block[3] = &unk_1E95BB4B8;
  v11 = a1[5];
  v12 = v5;
  v13 = a1[4];
  v14 = a1[6];
  v15 = a1[7];
  v16 = a1[8];
  v17 = v6;
  v8 = v6;
  v9 = v5;
  dispatch_async(v7, block);

}

void __51__MSASStateMachine__getAlbumURLDisposition_params___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("commandWasRequeued"));

  v5 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(a1 + 48);
  if (v5)
  {
    if ((objc_msgSend(v4, "workQueueEndCommandWithError:command:params:albumGUID:assetCollectionGUID:", v5, 0, 0, 0, 0) & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 48), "_URLReauthFailureWithUnderlyingError:", *(_QWORD *)(a1 + 40));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKey:", v6, CFSTR("error"));

      v7 = *(void **)(a1 + 48);
      v8 = *(_QWORD *)(a1 + 56);
      objc_msgSend(v7, "personID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "workQueueDidFinishCommandByReplacingCurrentCommandWithCommand:params:personID:albumGUID:assetCollectionGUID:", v8, v2, v9, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));

    }
  }
  else
  {
    objc_msgSend(v4, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 48);
    v12 = *(_QWORD *)(a1 + 80);
    v13 = *(_QWORD *)(a1 + 64);
    objc_msgSend(v2, "objectForKey:", CFSTR("info"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "MSASStateMachine:didFindNewURLString:forAlbumWithGUID:info:", v11, v12, v13, v14);

    objc_msgSend(v2, "objectForKey:", CFSTR("album"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[MSASAlbum albumWithAlbum:](MSASAlbum, "albumWithAlbum:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v16, "setURLString:", *(_QWORD *)(a1 + 80));
      objc_msgSend(v2, "setObject:forKey:", v16, CFSTR("album"));
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v21 = *(_QWORD *)(a1 + 48);
        v22 = 138543362;
        v23 = v21;
        _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Cannot retry a command after a URL validation error, because the command does not have an album parameter.", (uint8_t *)&v22, 0xCu);
      }
      objc_msgSend(*(id *)(a1 + 48), "_URLReauthFailureWithUnderlyingError:", 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKey:", v17, CFSTR("error"));

    }
    v18 = *(void **)(a1 + 48);
    v19 = *(_QWORD *)(a1 + 56);
    objc_msgSend(v18, "personID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "workQueueDidFinishCommandByReplacingCurrentCommandWithCommand:params:personID:albumGUID:assetCollectionGUID:", v19, v2, v20, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));

  }
}

void __94__MSASStateMachine_workQueueEndCommandWithError_command_params_albumGUID_assetCollectionGUID___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "daemon");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "personID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didReceiveAuthFailureForPersonID:", v2);

}

uint64_t __94__MSASStateMachine_workQueueEndCommandWithError_command_params_albumGUID_assetCollectionGUID___block_invoke_81(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "backoff");
}

void __94__MSASStateMachine_workQueueEndCommandWithError_command_params_albumGUID_assetCollectionGUID___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 96));
  objc_msgSend(WeakRetained, "releaseBusy");

}

uint64_t __94__MSASStateMachine_workQueueEndCommandWithError_command_params_albumGUID_assetCollectionGUID___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "workQueueCheckForNextCommand");
}

void __62__MSASStateMachine_workQueueDidFinishCommandDueToCancellation__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 96));
  objc_msgSend(WeakRetained, "releaseBusy");

}

void __68__MSASStateMachine_workQueueDidFinishCommandByLeavingCommandInQueue__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 96));
  objc_msgSend(WeakRetained, "releaseBusy");

}

uint64_t __68__MSASStateMachine_workQueueDidFinishCommandByLeavingCommandInQueue__block_invoke_2(uint64_t a1)
{
  void *v2;
  void (**v3)(_QWORD);

  objc_msgSend(*(id *)(a1 + 32), "postCommandCompletionBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "postCommandCompletionBlock");
    v3 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setPostCommandCompletionBlock:", 0);
    v3[2](v3);

  }
  return objc_msgSend(*(id *)(a1 + 32), "workQueueCheckForNextCommand");
}

void __71__MSASStateMachine_workQueueDidFailToFinishCommandDueToTemporaryError___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 96));
  objc_msgSend(WeakRetained, "releaseBusy");

}

uint64_t __128__MSASStateMachine_workQueueDidFinishCommandByReplacingCurrentCommandWithCommand_params_personID_albumGUID_assetCollectionGUID___block_invoke(_QWORD *a1)
{
  objc_msgSend(*(id *)(a1[4] + 16), "dbQueueBeginTransaction");
  objc_msgSend(*(id *)(a1[4] + 16), "dbQueueRemoveCommandIdentifier:", *(_QWORD *)(a1[4] + 32));
  objc_msgSend(*(id *)(a1[4] + 16), "dbQueueEnqueueCommand:params:personID:albumGUID:assetCollectionGUID:sequenceNumber:", a1[5], a1[6], a1[7], a1[8], a1[9], *(_QWORD *)(a1[4] + 32));
  return objc_msgSend(*(id *)(a1[4] + 16), "dbQueueEndTransaction");
}

void __128__MSASStateMachine_workQueueDidFinishCommandByReplacingCurrentCommandWithCommand_params_personID_albumGUID_assetCollectionGUID___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 96));
  objc_msgSend(WeakRetained, "releaseBusy");

}

uint64_t __128__MSASStateMachine_workQueueDidFinishCommandByReplacingCurrentCommandWithCommand_params_personID_albumGUID_assetCollectionGUID___block_invoke_3(uint64_t a1)
{
  void *v2;
  void (**v3)(_QWORD);

  objc_msgSend(*(id *)(a1 + 32), "postCommandCompletionBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "postCommandCompletionBlock");
    v3 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setPostCommandCompletionBlock:", 0);
    v3[2](v3);

  }
  return objc_msgSend(*(id *)(a1 + 32), "workQueueCheckForNextCommand");
}

void __45__MSASStateMachine_workQueueDidFinishCommand__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 96));
  objc_msgSend(WeakRetained, "releaseBusy");

}

uint64_t __45__MSASStateMachine_workQueueDidFinishCommand__block_invoke_2(uint64_t a1)
{
  void *v2;
  void (**v3)(_QWORD);

  objc_msgSend(*(id *)(a1 + 32), "postCommandCompletionBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "postCommandCompletionBlock");
    v3 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setPostCommandCompletionBlock:", 0);
    v3[2](v3);

  }
  return objc_msgSend(*(id *)(a1 + 32), "workQueueCheckForNextCommand");
}

void __47__MSASStateMachine_workQueuePerformNextCommand__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 96));
  objc_msgSend(WeakRetained, "releaseBusy");

}

void __47__MSASStateMachine_workQueuePerformNextCommand__block_invoke_70(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 96));
  objc_msgSend(WeakRetained, "releaseBusy");

}

void __47__MSASStateMachine_workQueuePerformNextCommand__block_invoke_73(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 96));
  objc_msgSend(WeakRetained, "releaseBusy");

}

uint64_t __47__MSASStateMachine_workQueuePerformNextCommand__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "workQueueCheckForNextCommand");
}

void __47__MSASStateMachine_workQueuePerformNextCommand__block_invoke_74(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 96));
  objc_msgSend(WeakRetained, "releaseBusy");

}

uint64_t __47__MSASStateMachine_workQueuePerformNextCommand__block_invoke_2_75(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "workQueueCheckForNextCommand");
}

void __48__MSASStateMachine_workQueueCheckForNextCommand__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "nextExpiryDate");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __48__MSASStateMachine_workQueueCheckForNextCommand__block_invoke_69(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 96));
  objc_msgSend(WeakRetained, "retainBusy");

}

uint64_t __46__MSASStateMachine_retryOutstandingActivities__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "workQueueRetryOutstandingActivities");
}

uint64_t __34__MSASStateMachine_isInRetryState__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 32) + 8) == 1;
  return result;
}

void __47__MSASStateMachine_setPersistentObject_forKey___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_model");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPersistentObject:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __60__MSASStateMachine_MSBackoffManagerDidUpdateNextExpiryDate___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[5];
  _QWORD block[4];
  id v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 1;
  objc_msgSend(*(id *)(a1 + 32), "memberQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__MSASStateMachine_MSBackoffManagerDidUpdateNextExpiryDate___block_invoke_2;
  block[3] = &unk_1E95BC2F0;
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 32);
  v11 = v4;
  v12 = v5;
  v13 = &v14;
  dispatch_sync(v2, block);

  if (*((_BYTE *)v15 + 24))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v19 = v7;
      v20 = 2114;
      v21 = v8;
      _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Updated backoff time for backoff manager %{public}@", buf, 0x16u);
    }
    objc_msgSend(*(id *)(a1 + 32), "workQueueUpdateNextActivityDate");
  }
  objc_msgSend(*(id *)(a1 + 32), "eventQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v9[1] = 3221225472;
  v9[2] = __60__MSASStateMachine_MSBackoffManagerDidUpdateNextExpiryDate___block_invoke_68;
  v9[3] = &unk_1E95BCED0;
  v9[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v6, v9);

  _Block_object_dispose(&v14, 8);
}

void __60__MSASStateMachine_MSBackoffManagerDidUpdateNextExpiryDate___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  uint64_t v16;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  if (v2 == *(_QWORD *)(v3 + 64))
  {
    v17 = (id)objc_msgSend(*(id *)(a1 + 32), "copyParameters");
    objc_msgSend(*(id *)(a1 + 40), "MMCSBackoffManagerParameters");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      objc_msgSend(*(id *)(a1 + 40), "MMCSBackoffManagerParameters");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isEqualToDictionary:", v17);

      if ((v7 & 1) != 0)
        goto LABEL_11;
    }
    objc_msgSend(*(id *)(a1 + 40), "setMMCSBackoffManagerParameters:", v17);
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(void **)(v8 + 16);
    v10 = *(_QWORD *)(v8 + 64);
    v11 = CFSTR("MMCSBackoffManager");
    goto LABEL_13;
  }
  if (v2 == *(_QWORD *)(v3 + 56))
  {
    v17 = (id)objc_msgSend(*(id *)(a1 + 32), "copyParameters");
    objc_msgSend(*(id *)(a1 + 40), "metadataBackoffManagerParameters");
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)v12;
      objc_msgSend(*(id *)(a1 + 40), "metadataBackoffManagerParameters");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToDictionary:", v17);

      if ((v15 & 1) != 0)
      {
LABEL_11:
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
LABEL_14:

        return;
      }
    }
    objc_msgSend(*(id *)(a1 + 40), "setMetadataBackoffManagerParameters:", v17);
    v16 = *(_QWORD *)(a1 + 40);
    v9 = *(void **)(v16 + 16);
    v10 = *(_QWORD *)(v16 + 56);
    v11 = CFSTR("metadataBackoffManager");
LABEL_13:
    objc_msgSend(v9, "setPersistentObject:forKey:", v10, v11);
    goto LABEL_14;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v19 = v3;
    v20 = 2114;
    v21 = v2;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Received event for unknown backoff manager %{public}@", buf, 0x16u);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
}

void __60__MSASStateMachine_MSBackoffManagerDidUpdateNextExpiryDate___block_invoke_68(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "MSASStateMachineDidUpdateServerCommunicationBackoffDate:", *(_QWORD *)(a1 + 32));

}

void __51__MSASStateMachine_workQueueUpdateNextActivityDate__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 96));
  objc_msgSend(WeakRetained, "setNextActivityDate:forPersonID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104));

}

void __50__MSASStateMachine_serverCommunicationBackoffDate__block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(a1[4] + 56), "nextExpiryDate");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[5] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(a1[4] + 64), "nextExpiryDate");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __42__MSASStateMachine_latestNextActivityDate__block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(a1[4] + 56), "nextExpiryDate");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[5] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(a1[4] + 64), "nextExpiryDate");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __70__MSASStateMachine__sendGetServerSideConfigurationDisposition_params___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  uint64_t v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__MSASStateMachine__sendGetServerSideConfigurationDisposition_params___block_invoke_2;
  block[3] = &unk_1E95BCE30;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v5;
  v13 = v8;
  v14 = v6;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

void __70__MSASStateMachine__sendGetServerSideConfigurationDisposition_params___block_invoke_2(id *a1)
{
  id v2;
  id v3;
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  uint64_t v15;
  _QWORD *v16;
  void *v17;
  _QWORD *v18;
  void *v19;
  id v20;
  NSObject *v21;
  _QWORD v22[5];
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  _QWORD v27[5];
  _QWORD block[5];
  uint8_t buf[4];
  id v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a1[4];
  v2 = a1[5];
  if (v3)
  {
    if (objc_msgSend(v2, "workQueueEndCommandWithError:command:params:albumGUID:assetCollectionGUID:", v3, 0, 0, 0, 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v4 = a1[5];
        objc_msgSend(a1[4], "MSVerboseDescription");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v30 = v4;
        v31 = 2114;
        v32 = v5;
        _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Failed to retrieve server-side configuration. Error: %{public}@", buf, 0x16u);

      }
    }
    else
    {
      objc_msgSend(a1[5], "workQueueDidFinishCommand");
    }
  }
  else
  {
    objc_msgSend(v2, "memberQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70__MSASStateMachine__sendGetServerSideConfigurationDisposition_params___block_invoke_62;
    block[3] = &unk_1E95BCED0;
    block[4] = a1[5];
    dispatch_barrier_sync(v6, block);

    objc_msgSend(a1[5], "eventQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v27[0] = v7;
    v27[1] = 3221225472;
    v27[2] = __70__MSASStateMachine__sendGetServerSideConfigurationDisposition_params___block_invoke_2_63;
    v27[3] = &unk_1E95BCED0;
    v27[4] = a1[5];
    dispatch_async(v8, v27);

    objc_msgSend(a1[6], "objectForKey:", CFSTR("com.apple.sharedstreams.config.configVersion"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v10 = a1[5];
      *(_DWORD *)buf = 138543618;
      v30 = v10;
      v31 = 2114;
      v32 = v9;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Retrieved server-side config version: %{public}@", buf, 0x16u);
    }
    objc_msgSend(a1[5], "_model");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dbQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    v23[0] = v7;
    v23[1] = 3221225472;
    v23[2] = __70__MSASStateMachine__sendGetServerSideConfigurationDisposition_params___block_invoke_64;
    v23[3] = &unk_1E95BCE30;
    v24 = v11;
    v13 = v9;
    v25 = v13;
    v26 = a1[6];
    v14 = v11;
    dispatch_barrier_sync(v12, v23);

    objc_msgSend(a1[5], "_serverSideConfigDictionaryByApplyingDefaultsToDictionary:", a1[6]);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = a1[5];
    v17 = (void *)v16[15];
    v16[15] = v15;

    v18 = a1[5];
    v19 = (void *)v18[16];
    v18[16] = v13;
    v20 = v13;

    objc_msgSend(a1[5], "eventQueue");
    v21 = objc_claimAutoreleasedReturnValue();
    v22[0] = v7;
    v22[1] = 3221225472;
    v22[2] = __70__MSASStateMachine__sendGetServerSideConfigurationDisposition_params___block_invoke_2_65;
    v22[3] = &unk_1E95BCED0;
    v22[4] = a1[5];
    dispatch_async(v21, v22);

    objc_msgSend(a1[5], "workQueueDidFinishCommand");
  }
}

uint64_t __70__MSASStateMachine__sendGetServerSideConfigurationDisposition_params___block_invoke_62(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "reset");
}

void __70__MSASStateMachine__sendGetServerSideConfigurationDisposition_params___block_invoke_2_63(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "daemon");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "personID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didReceiveAuthSuccessForPersonID:", v2);

}

uint64_t __70__MSASStateMachine__sendGetServerSideConfigurationDisposition_params___block_invoke_64(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "dbQueueBeginTransaction");
  objc_msgSend(*(id *)(a1 + 32), "dbQueueSetPersistentString:forKey:", *(_QWORD *)(a1 + 40), CFSTR("serverSideConfigVersion"));
  objc_msgSend(*(id *)(a1 + 32), "dbQueueSetPersistentObject:forKey:", *(_QWORD *)(a1 + 48), CFSTR("serverSideConfig"));
  return objc_msgSend(*(id *)(a1 + 32), "dbQueueEndTransaction");
}

void __70__MSASStateMachine__sendGetServerSideConfigurationDisposition_params___block_invoke_2_65(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "daemon");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "personID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendServerSideConfigurationDidChangeNotificationForPersonID:", v2);

}

uint64_t __43__MSASStateMachine_refreshServerSideConfig__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "workQueueRefreshServerSideConfig");
}

void __62__MSASStateMachine_serverSideQueueSetServerSideConfiguration___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "daemon");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "personID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendServerSideConfigurationDidChangeNotificationForPersonID:", v2);

}

uint64_t __47__MSASStateMachine_setServerSideConfiguration___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "serverSideQueueSetServerSideConfiguration:", *(_QWORD *)(a1 + 40));
}

void __50__MSASStateMachine_serverSideConfigurationVersion__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 128));
}

void __43__MSASStateMachine_serverSideConfiguration__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "serverSideQueueServerSideConfiguration");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __78__MSASStateMachine__serverSideConfigDictionaryByApplyingDefaultsToDictionary___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v12 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 3);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 3);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 10);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 60);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 60.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 600.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 1800.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1200);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dictionaryWithObjectsAndKeys:", v13, CFSTR("com.apple.sharedstreams.config.maxNumRetriesOnFailure.server"), v0, CFSTR("com.apple.sharedstreams.config.maxNumRetriesOnFailure.network"), v1, CFSTR("com.apple.sharedstreams.config.maxNumRetriesOnFailure.content"), v2, CFSTR("com.apple.sharedstreams.config.maxUploadAssetBatchSize"), v3, CFSTR("mme.sharedstreams.client.downloadMMCSBatchSize"), CFSTR("1536:2048:2560"), CFSTR("com.apple.sharedstreams.config.dimensions.preview"), CFSTR("256:332:455"), CFSTR("com.apple.sharedstreams.config.dimensions.thumbnail"), v4, CFSTR("com.apple.sharedstreams.config.switch.3G"), v5,
    CFSTR("com.apple.sharedstreams.config.defaultRetryAfterInSeconds"),
    v6,
    CFSTR("com.apple.sharedstreams.config.maxActiveTimeAfterPush"),
    v7,
    CFSTR("com.apple.sharedstreams.config.maxActiveTimeAfterLossOfForeground"),
    v8,
    CFSTR("com.apple.sharedstreams.config.maxActiveTimeAfterGlobalResetSync"),
    v9,
    CFSTR("com.apple.sharedstreams.config.maxMMCSTokenValidity"),
    0);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)_serverSideConfigDictionaryByApplyingDefaultsToDictionary__defaults;
  _serverSideConfigDictionaryByApplyingDefaultsToDictionary__defaults = v10;

}

void __65__MSASStateMachine__cancelOutstandingCommandsDisposition_params___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  id v6;
  int v7;

  objc_msgSend(*(id *)(a1 + 32), "_assetDownloader");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __65__MSASStateMachine__cancelOutstandingCommandsDisposition_params___block_invoke_2;
  v4[3] = &unk_1E95BC488;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = *(id *)(a1 + 48);
  v7 = *(_DWORD *)(a1 + 56);
  objc_msgSend(v2, "stopCompletionBlock:", v4);

}

void __65__MSASStateMachine__cancelOutstandingCommandsDisposition_params___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  id v6;
  int v7;

  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __65__MSASStateMachine__cancelOutstandingCommandsDisposition_params___block_invoke_3;
  v4[3] = &unk_1E95BC488;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = *(id *)(a1 + 48);
  v7 = *(_DWORD *)(a1 + 56);
  dispatch_async(v2, v4);

}

void __65__MSASStateMachine__cancelOutstandingCommandsDisposition_params___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char v15;
  char v16;
  void *v17;
  char v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id obj;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  uint8_t v56[128];
  uint8_t buf[4];
  uint64_t v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v41 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v58 = v41;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Removing upload items...", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemsForUpload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v4;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
  if (v5)
  {
    v6 = v5;
    v46 = *(_QWORD *)v52;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v52 != v46)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v7);
        v9 = (void *)MEMORY[0x1D8255C20]();
        objc_msgSend(v8, "object");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "album");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        v13 = *(_QWORD *)(a1 + 48);
        if (*(_QWORD *)(a1 + 40))
        {
          objc_msgSend(v11, "GUID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqualToString:", *(_QWORD *)(a1 + 40));
          v16 = v15;
          if (!v13)
          {

            if ((v16 & 1) == 0)
              goto LABEL_19;
LABEL_17:
            objc_msgSend(v2, "addObject:", v10);
            goto LABEL_19;
          }
          if ((v15 & 1) != 0)
          {
            objc_msgSend(v10, "GUID");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "isEqualToString:", *(_QWORD *)(a1 + 48));

            if ((v18 & 1) != 0)
              goto LABEL_17;
          }
          else
          {

          }
        }
        else
        {
          if (!v13)
            goto LABEL_17;
          objc_msgSend(v10, "GUID");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "isEqualToString:", *(_QWORD *)(a1 + 48));

          if (v20)
            goto LABEL_17;
        }
LABEL_19:
        if ((unint64_t)objc_msgSend(v2, "count") >= 0x15)
        {
          objc_msgSend(*(id *)(a1 + 32), "_assetUploader");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "unregisterAssetCollections:", v2);

          objc_msgSend(*(id *)(a1 + 32), "_model");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "removeAssetCollectionsFromUploadQueue:", v2);

          objc_msgSend(v2, "removeAllObjects");
        }

        objc_autoreleasePoolPop(v9);
        ++v7;
      }
      while (v6 != v7);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
    }
    while (v6);
  }

  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_assetUploader");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "unregisterAssetCollections:", v2);

    objc_msgSend(*(id *)(a1 + 32), "_model");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "removeAssetCollectionsFromUploadQueue:", v2);

  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v42 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v58 = v42;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Finished removing upload items...", buf, 0xCu);
  }

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v43 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v58 = v43;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Removing download items...", buf, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "_model");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "nextItemsForDownloadFocusAlbumGUID:focusAssetCollectionGUID:maxCount:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 10);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  while (objc_msgSend(v26, "count"))
  {
    v27 = (void *)MEMORY[0x1D8255C20]();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v26, "count"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v29 = v26;
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v48;
      do
      {
        v33 = 0;
        do
        {
          if (*(_QWORD *)v48 != v32)
            objc_enumerationMutation(v29);
          objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * v33), "object");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "addObject:", v34);

          ++v33;
        }
        while (v31 != v33);
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
      }
      while (v31);
    }

    objc_msgSend(*(id *)(a1 + 32), "_assetDownloader");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "unregisterAssets:", v28);

    objc_msgSend(*(id *)(a1 + 32), "_model");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "removeAssetsFromDownloadQueue:", v28);

    objc_msgSend(*(id *)(a1 + 32), "_model");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "nextItemsForDownloadFocusAlbumGUID:focusAssetCollectionGUID:maxCount:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 10);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v27);
  }

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v44 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v58 = v44;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Finished removing download items...", buf, 0xCu);
  }
  if (!*(_DWORD *)(a1 + 56))
  {
    if (*(_QWORD *)(a1 + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "_model");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "requeuePendingAssetCollectionsWithAlbumGUID:", *(_QWORD *)(a1 + 40));

    }
    if (*(_QWORD *)(a1 + 48))
    {
      objc_msgSend(*(id *)(a1 + 32), "_model");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "requeuePendingAssetCollectionGUID:", *(_QWORD *)(a1 + 48));

      v40 = *(_QWORD *)(a1 + 48);
    }
    else
    {
      v40 = 0;
    }
    objc_msgSend(*(id *)(a1 + 32), "workQueueCancelAllCommandsFilteredByAlbumGUID:assetCollectionGUID:", *(_QWORD *)(a1 + 40), v40);
    objc_msgSend(*(id *)(a1 + 32), "workQueueDidFinishCommand");
  }
}

uint64_t __48__MSASStateMachine_setFocusAssetCollectionGUID___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 144), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setPersistentObject:forKey:", *(_QWORD *)(a1 + 40), CFSTR("focusAssetCollectionGUID"));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "setFocusAssetCollectionGUID:", *(_QWORD *)(a1 + 40));
}

uint64_t __38__MSASStateMachine_setFocusAlbumGUID___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 136), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setPersistentObject:forKey:", *(_QWORD *)(a1 + 40), CFSTR("focusAlbumGUID"));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "setFocusAlbumGUID:", *(_QWORD *)(a1 + 40));
}

void __50__MSASStateMachine_setRootCtagFromPendingRootCtag__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "persistentObjectForKey:", CFSTR("pendingRootCtag"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v8 = v2;
    v4 = objc_msgSend(v2, "length");
    v3 = v8;
    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "_model");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setPersistentString:forKey:", v8, CFSTR("rootCtag"));

      objc_msgSend(*(id *)(a1 + 32), "_model");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "deletePersistentValueWithKey:", CFSTR("pendingRootCtag"));

      objc_msgSend(*(id *)(a1 + 32), "_model");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "deletePersistentValueWithKey:", CFSTR("rootCtagRetries"));

      v3 = v8;
    }
  }

}

uint64_t __30__MSASStateMachine_setDaemon___block_invoke(uint64_t a1)
{
  objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 96), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "setDaemon:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "setDaemon:", *(_QWORD *)(a1 + 40));
}

void __51__MSASStateMachine_workQueueCancelCompletionBlock___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "daemon");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "retainBusy");

}

void __51__MSASStateMachine_workQueueCancelCompletionBlock___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__MSASStateMachine_workQueueCancelCompletionBlock___block_invoke_3;
  v4[3] = &unk_1E95BCF98;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_async(v2, v4);

}

void __51__MSASStateMachine_workQueueCancelCompletionBlock___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(v1 + 80);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__MSASStateMachine_workQueueCancelCompletionBlock___block_invoke_4;
  v4[3] = &unk_1E95BCF98;
  v4[4] = v1;
  v5 = v2;
  objc_msgSend(v3, "cancelCompletionBlock:", v4);

}

void __51__MSASStateMachine_workQueueCancelCompletionBlock___block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  id v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "eventQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__MSASStateMachine_workQueueCancelCompletionBlock___block_invoke_5;
  v4[3] = &unk_1E95BCF98;
  v3 = *(id *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_async(v2, v4);

}

void __51__MSASStateMachine_workQueueCancelCompletionBlock___block_invoke_5(uint64_t a1)
{
  NSObject *v2;
  id v3;

  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "eventQueue");
    v2 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v2, *(dispatch_block_t *)(a1 + 40));

  }
  objc_msgSend(*(id *)(a1 + 32), "daemon");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "releaseBusy");

}

uint64_t __42__MSASStateMachine_cancelCompletionBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "workQueueCancelCompletionBlock:", *(_QWORD *)(a1 + 40));
}

void __54__MSASStateMachine_stopAssetDownloadsCompletionBlock___block_invoke(uint64_t a1)
{
  NSObject *v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "stopCompletionBlock:", 0);
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "eventQueue");
    v2 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v2, *(dispatch_block_t *)(a1 + 40));

  }
}

void __44__MSASStateMachine_shutDownCompletionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setHasShutDown:", 1);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObserver:", *(_QWORD *)(a1 + 32));

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v10 = v3;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Shutting down uploader.", buf, 0xCu);
  }
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(void **)(v4 + 72);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__MSASStateMachine_shutDownCompletionBlock___block_invoke_47;
  v7[3] = &unk_1E95BCF98;
  v7[4] = v4;
  v8 = v5;
  objc_msgSend(v6, "shutDownCompletionBlock:", v7);

}

void __44__MSASStateMachine_shutDownCompletionBlock___block_invoke_47(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v2 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v9 = v2;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Shutting down downloader.", buf, 0xCu);
  }
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = *(void **)(v3 + 80);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__MSASStateMachine_shutDownCompletionBlock___block_invoke_48;
  v6[3] = &unk_1E95BCF98;
  v6[4] = v3;
  v7 = v4;
  objc_msgSend(v5, "shutDownCompletionBlock:", v6);

}

void __44__MSASStateMachine_shutDownCompletionBlock___block_invoke_48(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__MSASStateMachine_shutDownCompletionBlock___block_invoke_2;
  v4[3] = &unk_1E95BCF98;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_async(v2, v4);

}

void __44__MSASStateMachine_shutDownCompletionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  _DWORD *v3;
  uint64_t v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v2 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v17 = v2;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Shutting down state machine.", buf, 0xCu);
  }
  v3 = *(_DWORD **)(a1 + 32);
  if (v3[2] == 2)
  {
    objc_initWeak(&location, v3);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __44__MSASStateMachine_shutDownCompletionBlock___block_invoke_49;
    v12[3] = &unk_1E95BB398;
    objc_copyWeak(&v14, &location);
    v13 = *(id *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "setPostCommandCompletionBlock:", v12);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v17 = v4;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Stopping current operation.", buf, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 32), "_stopHandlerBlock");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "_stopHandlerBlock");
      v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "_stoppedError");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v6)[2](v6, v7);

    }
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "protocol");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __44__MSASStateMachine_shutDownCompletionBlock___block_invoke_51;
    v10[3] = &unk_1E95BCF98;
    v9 = *(void **)(a1 + 40);
    v10[4] = *(_QWORD *)(a1 + 32);
    v11 = v9;
    objc_msgSend(v8, "shutDownCompletionBlock:", v10);

  }
}

void __44__MSASStateMachine_shutDownCompletionBlock___block_invoke_49(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "protocol");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__MSASStateMachine_shutDownCompletionBlock___block_invoke_2_50;
  v5[3] = &unk_1E95BCF98;
  v6 = WeakRetained;
  v7 = *(id *)(a1 + 32);
  v4 = WeakRetained;
  objc_msgSend(v3, "shutDownCompletionBlock:", v5);

}

void __44__MSASStateMachine_shutDownCompletionBlock___block_invoke_51(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__MSASStateMachine_shutDownCompletionBlock___block_invoke_2_52;
  v4[3] = &unk_1E95BCF98;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_async(v2, v4);

}

uint64_t __44__MSASStateMachine_shutDownCompletionBlock___block_invoke_2_52(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_workQueueEmptyFileTransferQueuesCompletionBlock:", *(_QWORD *)(a1 + 40));
}

void __44__MSASStateMachine_shutDownCompletionBlock___block_invoke_2_50(uint64_t a1)
{
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__MSASStateMachine_shutDownCompletionBlock___block_invoke_3;
  v3[3] = &unk_1E95BCF98;
  v4 = *(id *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  dispatch_async(v2, v3);

}

uint64_t __44__MSASStateMachine_shutDownCompletionBlock___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_workQueueEmptyFileTransferQueuesCompletionBlock:", *(_QWORD *)(a1 + 40));
}

void __25__MSASStateMachine_start__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "MSASStateMachineDidStart:", *(_QWORD *)(a1 + 32));

}

void __48__MSASStateMachine_initWithPersonID_eventQueue___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__MSASStateMachine_initWithPersonID_eventQueue___block_invoke_2;
  block[3] = &unk_1E95BB300;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  dispatch_async(v2, block);

  objc_destroyWeak(&v4);
}

void __48__MSASStateMachine_initWithPersonID_eventQueue___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id WeakRetained;
  void *v6;
  int v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;

  objc_msgSend(a2, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("personID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "personID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqualToString:", v6);

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "workQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __48__MSASStateMachine_initWithPersonID_eventQueue___block_invoke_4;
    v9[3] = &unk_1E95BBA08;
    objc_copyWeak(&v11, (id *)(a1 + 40));
    v10 = *(id *)(a1 + 32);
    dispatch_async(v8, v9);

    objc_destroyWeak(&v11);
  }

}

uint64_t __48__MSASStateMachine_initWithPersonID_eventQueue___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "workQueueApplyServerSideConfiguration");
}

void __48__MSASStateMachine_initWithPersonID_eventQueue___block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id *v5;
  id WeakRetained;
  void *v7;
  int v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;

  objc_msgSend(a2, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("personID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "personID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "isEqualToString:", v7);

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "workQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __48__MSASStateMachine_initWithPersonID_eventQueue___block_invoke_7;
    v10[3] = &unk_1E95BBA08;
    objc_copyWeak(&v12, v5);
    v11 = v4;
    dispatch_async(v9, v10);

    objc_destroyWeak(&v12);
  }

}

void __48__MSASStateMachine_initWithPersonID_eventQueue___block_invoke_40(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  int v10;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;

  v3 = a2;
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("personID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKey:", CFSTR("retryAfterDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "personID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v5, "isEqualToString:", v9);

  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 32), "workQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__MSASStateMachine_initWithPersonID_eventQueue___block_invoke_2_41;
    block[3] = &unk_1E95BBC00;
    v13 = *(id *)(a1 + 32);
    v14 = v7;
    objc_copyWeak(&v15, (id *)(a1 + 40));
    dispatch_async(v11, block);

    objc_destroyWeak(&v15);
  }

}

void __48__MSASStateMachine_initWithPersonID_eventQueue___block_invoke_2_41(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id WeakRetained;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    v6 = 138543618;
    v7 = v2;
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Received retry-after from metadata server with date :%{public}@", (uint8_t *)&v6, 0x16u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_metadataBackoffManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didReceiveRetryAfterDate:", *(_QWORD *)(a1 + 40));

}

void __48__MSASStateMachine_initWithPersonID_eventQueue___block_invoke_7(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  void *v5;
  id v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v7 = 138543362;
    v8 = WeakRetained;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Server-side config has changed. We will refetch the config and try again.", (uint8_t *)&v7, 0xCu);

  }
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v3, "_model");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel__sendGetServerSideConfigurationDisposition_params_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enqueueCommandAtHeadOfQueue:params:personID:albumGUID:assetCollectionGUID:", v5, 0, *(_QWORD *)(a1 + 32), 0, 0);

  v6 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v6, "workQueueRetryOutstandingActivities");

}

void __48__MSASStateMachine_initWithPersonID_eventQueue___block_invoke_4(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  id v7;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_model");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "persistentStringForKey:", CFSTR("serverSideConfigVersion"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "protocol");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setServerSideConfigVersion:", v7);

  v6 = objc_loadWeakRetained(v2);
  objc_msgSend(v6, "workQueueApplyServerSideConfiguration");

}

void __48__MSASStateMachine_initWithPersonID_eventQueue___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "workQueueUpdateNextActivityDate");

}

void __43__MSASStateMachine__metadataBackoffManager__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 56));
}

void __36__MSASStateMachine_phoneInvitations__block_invoke(uint64_t a1)
{
  void *v2;
  MSASPhoneInvitations *v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 176);
  if (!v2)
  {
    v3 = objc_alloc_init(MSASPhoneInvitations);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 176);
    *(_QWORD *)(v4 + 176) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 176);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
}

void __28__MSASStateMachine_protocol__block_invoke(uint64_t a1)
{
  void *v2;
  MSASProtocol *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 168);
  if (!v2)
  {
    v3 = [MSASProtocol alloc];
    objc_msgSend(*(id *)(a1 + 32), "personID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[MSASProtocol initWithPersonID:](v3, "initWithPersonID:", v4);
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 168);
    *(_QWORD *)(v6 + 168) = v5;

    objc_msgSend(*(id *)(a1 + 32), "serverSideConfigurationVersion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "setServerSideConfigVersion:", v8);

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 168);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
}

@end

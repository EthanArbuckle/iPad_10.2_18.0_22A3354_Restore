@implementation CPUINowPlayingManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_4);
  return (id)sharedManager___manager;
}

uint64_t __38__CPUINowPlayingManager_sharedManager__block_invoke()
{
  CPUINowPlayingManager *v0;
  void *v1;

  v0 = objc_alloc_init(CPUINowPlayingManager);
  v1 = (void *)sharedManager___manager;
  sharedManager___manager = (uint64_t)v0;

  return objc_msgSend((id)sharedManager___manager, "_setupRequestController");
}

- (CPUINowPlayingManager)init
{
  CPUINowPlayingManager *v2;
  CPUINowPlayingManager *v3;
  id v4;
  uint64_t v5;
  CARObserverHashTable *stateObservers;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CPUINowPlayingManager;
  v2 = -[CPUINowPlayingManager init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_throttleBehavior = 0;
    v4 = objc_alloc(MEMORY[0x24BE15228]);
    v5 = objc_msgSend(v4, "initWithProtocol:callbackQueue:", &unk_2551B2568, MEMORY[0x24BDAC9B8]);
    stateObservers = v3->_stateObservers;
    v3->_stateObservers = (CARObserverHashTable *)v5;

  }
  return v3;
}

- (CPUINowPlayingManager)initWithBundleIdentifier:(id)a3
{
  id v5;
  CPUINowPlayingManager *v6;
  CPUINowPlayingManager *v7;

  v5 = a3;
  v6 = -[CPUINowPlayingManager init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bundleIdentifier, a3);
    -[CPUINowPlayingManager _setupRequestController](v7, "_setupRequestController");
  }

  return v7;
}

- (void)setThrottleBehavior:(unint64_t)a3
{
  CPUIThrottle *metadataThrottle;
  CPUIThrottle *v5;
  CPUIThrottle *v6;

  if (self->_throttleBehavior != a3)
  {
    self->_throttleBehavior = a3;
    if (a3)
    {
      metadataThrottle = self->_metadataThrottle;
      if (metadataThrottle)
      {
        -[CPUIThrottle unthrottle](metadataThrottle, "unthrottle");
      }
      else
      {
        v5 = -[CPUIThrottle initWithBase:factor:max:]([CPUIThrottle alloc], "initWithBase:factor:max:", 15.0, 1.5, 90.0);
        v6 = self->_metadataThrottle;
        self->_metadataThrottle = v5;

      }
    }
  }
}

- (void)_setupRequestController
{
  MPRequestResponseController *v3;
  MPRequestResponseController *requestController;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  CPUINowPlayingManager *v40;
  void *v41;
  uint8_t buf[8];
  _QWORD v43[2];
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD v52[3];
  _QWORD v53[3];
  _QWORD v54[5];
  uint64_t v55;
  _QWORD v56[3];

  v56[1] = *MEMORY[0x24BDAC8D0];
  v3 = (MPRequestResponseController *)objc_alloc_init(MEMORY[0x24BDDCB90]);
  v40 = self;
  requestController = self->_requestController;
  self->_requestController = v3;

  MRMediaRemoteSetWantsNowPlayingNotifications();
  v37 = objc_alloc(MEMORY[0x24BDDCB30]);
  v55 = *MEMORY[0x24BDDC2F8];
  v36 = objc_alloc(MEMORY[0x24BDDCB30]);
  v5 = *MEMORY[0x24BDDC100];
  v54[0] = *MEMORY[0x24BDDC160];
  v54[1] = v5;
  v6 = *MEMORY[0x24BDDC0F8];
  v54[2] = *MEMORY[0x24BDDC0D8];
  v54[3] = v6;
  v54[4] = *MEMORY[0x24BDDC150];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v54, 5);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = *MEMORY[0x24BDDC388];
  v7 = (void *)MEMORY[0x24BDDCB30];
  v51 = *MEMORY[0x24BDDBDD8];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v51, 1);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "propertySetWithProperties:", v39);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v38;
  v52[1] = *MEMORY[0x24BDDC378];
  v8 = objc_alloc(MEMORY[0x24BDDCB30]);
  v50 = *MEMORY[0x24BDDBDA0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v50, 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = *MEMORY[0x24BDDC270];
  v9 = (void *)MEMORY[0x24BDDCB30];
  v47 = *MEMORY[0x24BDDBDD0];
  v10 = v47;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v47, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "propertySetWithProperties:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v8, "initWithProperties:relationships:", v35, v13);
  v53[1] = v14;
  v52[2] = *MEMORY[0x24BDDC380];
  v15 = (void *)MEMORY[0x24BDDCB30];
  v46 = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v46, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "propertySetWithProperties:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v53[2] = v17;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v53, v52, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v36, "initWithProperties:relationships:", v41, v18);
  v56[0] = v19;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v56, &v55, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v37, "initWithProperties:relationships:", 0, v20);

  v22 = objc_alloc(MEMORY[0x24BDDCB30]);
  v44 = *MEMORY[0x24BDDC2D8];
  v23 = (void *)MEMORY[0x24BDDCB30];
  v24 = *MEMORY[0x24BDDC000];
  v43[0] = *MEMORY[0x24BDDC050];
  v43[1] = v24;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v43, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "propertySetWithProperties:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v26;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v22, "initWithProperties:relationships:", 0, v27);

  v29 = objc_alloc_init(MEMORY[0x24BE64D78]);
  objc_msgSend(v29, "setTracklistRange:", 1, 1);
  objc_msgSend(v29, "setQueueItemProperties:", v21);
  objc_msgSend(v29, "setPlayingItemProperties:", v21);
  objc_msgSend(MEMORY[0x24BE64D70], "pathWithRoute:bundleID:playerID:", 0, 0, 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setPlayerPath:", v30);

  objc_msgSend(v29, "setQueueSectionProperties:", v28);
  -[CPUINowPlayingManager requestController](v40, "requestController");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setRequest:", v29);

  -[CPUINowPlayingManager requestController](v40, "requestController");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setDelegate:", v40);

  CarPlayUIGeneralLogging();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21B6EC000, v33, OS_LOG_TYPE_DEFAULT, "Beginning automatic mediaplayer response loading.", buf, 2u);
  }

  -[CPUINowPlayingManager requestController](v40, "requestController");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "beginAutomaticResponseLoading");

}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  CarPlayUIGeneralLogging();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21B6EC000, v3, OS_LOG_TYPE_DEFAULT, "Ending automatic mediaplayer response loading.", buf, 2u);
  }

  MRMediaRemoteSetWantsNowPlayingNotifications();
  v4.receiver = self;
  v4.super_class = (Class)CPUINowPlayingManager;
  -[CPUINowPlayingManager dealloc](&v4, sel_dealloc);
}

- (void)addNowPlayingObserver:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  char v7;
  _QWORD v8[4];
  id v9;
  CPUINowPlayingManager *v10;

  v4 = a3;
  -[CARObserverHashTable addObserver:](self->_stateObservers, "addObserver:", v4);
  -[CPUINowPlayingManager snapshot](self, "snapshot");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __47__CPUINowPlayingManager_addNowPlayingObserver___block_invoke;
      v8[3] = &unk_24DF24460;
      v9 = v4;
      v10 = self;
      dispatch_async(MEMORY[0x24BDAC9B8], v8);

    }
  }

}

void __47__CPUINowPlayingManager_addNowPlayingObserver___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  objc_msgSend(v2, "snapshot");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "nowPlayingManager:didUpdateSnapshot:", v2, v3);

}

- (void)removeNowPlayingObserver:(id)a3
{
  -[CARObserverHashTable removeObserver:](self->_stateObservers, "removeObserver:", a3);
}

- (void)performCommandRequest:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  v6 = (void *)MEMORY[0x24BE64D60];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __58__CPUINowPlayingManager_performCommandRequest_completion___block_invoke;
  v8[3] = &unk_24DF244B0;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "performRequest:options:completion:", a3, 0x10000, v8);

}

void __58__CPUINowPlayingManager_performCommandRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v3 = a2;
  if (*(_QWORD *)(a1 + 32))
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __58__CPUINowPlayingManager_performCommandRequest_completion___block_invoke_2;
    v4[3] = &unk_24DF24488;
    v6 = *(id *)(a1 + 32);
    v5 = v3;
    dispatch_async(MEMORY[0x24BDAC9B8], v4);

  }
}

uint64_t __58__CPUINowPlayingManager_performCommandRequest_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)controller:(id)a3 defersResponseReplacement:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  CPUINowPlayingManager *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__CPUINowPlayingManager_controller_defersResponseReplacement___block_invoke;
  block[3] = &unk_24DF244D8;
  v12 = self;
  v13 = v7;
  v11 = v6;
  v8 = v6;
  v9 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __62__CPUINowPlayingManager_controller_defersResponseReplacement___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  CPUINowPlayingSnapshot *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  uint8_t buf[4];
  const __CFString *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 48);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  objc_msgSend(*(id *)(a1 + 32), "response");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CPUINowPlayingSnapshot initWithResponse:]([CPUINowPlayingSnapshot alloc], "initWithResponse:", v3);
  if (objc_msgSend(*(id *)(a1 + 40), "throttleBehavior") != 1)
    goto LABEL_24;
  -[CPUINowPlayingSnapshot song](v4, "song");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "contentItemID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    v10 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v6, "library");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "numberWithLongLong:", objc_msgSend(v11, "persistentID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringValue");
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[CPUINowPlayingSnapshot song](v4, "song");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "title");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v9, "length") || !objc_msgSend(v14, "length"))
  {
LABEL_23:

LABEL_24:
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 24), v4);
    objc_msgSend(*(id *)(a1 + 40), "stateObservers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "nowPlayingManager:didUpdateSnapshot:", *(_QWORD *)(a1 + 40), v4);
    goto LABEL_25;
  }
  objc_msgSend(*(id *)(a1 + 40), "lastContentItemIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v15, "length"))
    goto LABEL_21;
  objc_msgSend(*(id *)(a1 + 40), "lastContentItemIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "isEqualToString:", v16))
  {
LABEL_20:

LABEL_21:
    goto LABEL_22;
  }
  objc_msgSend(*(id *)(a1 + 40), "lastContentItemTitle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v17, "length"))
  {

    goto LABEL_20;
  }
  objc_msgSend(*(id *)(a1 + 40), "lastContentItemTitle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v14, "isEqualToString:", v18);

  if ((v30 & 1) != 0)
  {
LABEL_22:
    objc_msgSend(*(id *)(a1 + 40), "setLastContentItemIdentifier:", v9);
    objc_msgSend(*(id *)(a1 + 40), "setLastContentItemTitle:", v14);
    objc_msgSend(*(id *)(a1 + 40), "metadataThrottle");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "unthrottle");

    objc_msgSend(*(id *)(a1 + 40), "metadataThrottle");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "incrementAttempts");

    goto LABEL_23;
  }
  objc_msgSend(*(id *)(a1 + 40), "metadataThrottle");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "incrementAttempts");

  if ((v20 & 1) != 0)
    goto LABEL_23;
  CarPlayUIGeneralLogging();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "bundleIdentifier");
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)v22;
    v24 = CFSTR("[all]");
    if (v22)
      v24 = (const __CFString *)v22;
    *(_DWORD *)buf = 138412546;
    v32 = v24;
    v33 = 2112;
    v34 = v9;
    _os_log_impl(&dword_21B6EC000, v21, OS_LOG_TYPE_DEFAULT, "Throttling snapshot update for app %@ with content item identifier %@", buf, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 40), "stateObservers");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = *(void **)(a1 + 40);
  objc_msgSend(v26, "bundleIdentifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "nowPlayingManager:didThrottleUpdateForBundleIdentifier:", v26, v27);

LABEL_25:
}

- (BOOL)controller:(id)a3 shouldRetryFailedRequestWithError:(id)a4
{
  return 1;
}

- (unint64_t)throttleBehavior
{
  return self->_throttleBehavior;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (CPUINowPlayingSnapshot)snapshot
{
  return self->_snapshot;
}

- (MPRequestResponseController)requestController
{
  return self->_requestController;
}

- (void)setRequestController:(id)a3
{
  objc_storeStrong((id *)&self->_requestController, a3);
}

- (CARObserverHashTable)stateObservers
{
  return self->_stateObservers;
}

- (void)setStateObservers:(id)a3
{
  objc_storeStrong((id *)&self->_stateObservers, a3);
}

- (CPUIThrottle)metadataThrottle
{
  return self->_metadataThrottle;
}

- (void)setMetadataThrottle:(id)a3
{
  objc_storeStrong((id *)&self->_metadataThrottle, a3);
}

- (NSString)lastContentItemIdentifier
{
  return self->_lastContentItemIdentifier;
}

- (void)setLastContentItemIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)lastContentItemTitle
{
  return self->_lastContentItemTitle;
}

- (void)setLastContentItemTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastContentItemTitle, 0);
  objc_storeStrong((id *)&self->_lastContentItemIdentifier, 0);
  objc_storeStrong((id *)&self->_metadataThrottle, 0);
  objc_storeStrong((id *)&self->_stateObservers, 0);
  objc_storeStrong((id *)&self->_requestController, 0);
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end

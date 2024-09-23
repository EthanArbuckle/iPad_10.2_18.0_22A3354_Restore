@implementation MCDPlayableContentViewController

- (MCDPlayableContentViewController)initWithBundleID:(id)a3 stack:(id)a4
{
  id v6;
  id v7;
  MCDPlayableContentViewController *v8;
  uint64_t v9;
  NSString *bundleID;
  NSObject *v11;
  MCDPCModel *v12;
  MCDPCModel *model;
  NSOperationQueue *v14;
  NSOperationQueue *modelInvalidationQueue;
  void *v16;
  objc_super v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)MCDPlayableContentViewController;
  v8 = -[MCDPlayableContentViewController init](&v18, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    bundleID = v8->_bundleID;
    v8->_bundleID = (NSString *)v9;

    MCDGeneralLogging();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v6;
      _os_log_impl(&dword_22FBAA000, v11, OS_LOG_TYPE_DEFAULT, "Initializing a new view for bundle: %@", buf, 0xCu);
    }

    v12 = -[MCDPCModel initWithBundleID:]([MCDPCModel alloc], "initWithBundleID:", v8->_bundleID);
    model = v8->_model;
    v8->_model = v12;

    v14 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    modelInvalidationQueue = v8->_modelInvalidationQueue;
    v8->_modelInvalidationQueue = v14;

    -[NSOperationQueue setQualityOfService:](v8->_modelInvalidationQueue, "setQualityOfService:", 25);
    -[NSOperationQueue setMaxConcurrentOperationCount:](v8->_modelInvalidationQueue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setName:](v8->_modelInvalidationQueue, "setName:", CFSTR("com.apple.MusicCarDisplayUI.playableContent.invalidate"));
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v8, sel__modelDidInvalidate_, CFSTR("didInvalidate"), 0);
    objc_msgSend(v16, "addObserver:selector:name:object:", v8, sel__nowPlayingIdentifiersChanged_, *MEMORY[0x24BE655E8], 0);
    objc_storeStrong((id *)&v8->_stackToRebuild, a4);

  }
  return v8;
}

- (MCDPlayableContentViewController)initWithBundleID:(id)a3
{
  return -[MCDPlayableContentViewController initWithBundleID:stack:](self, "initWithBundleID:stack:", a3, 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MCDPlayableContentViewController;
  -[MCDPlayableContentViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  if (self->_bundleID)
    v4 = MRMediaRemoteApplicationSupportsSectionedBrowsing() != 0;
  else
    v4 = 0;
  self->_hasSectionedContent = v4;
  -[MCDPlayableContentViewController _setupView](self, "_setupView");
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  NSString *bundleID;
  MCDPCModel *model;
  NSArray *stackToRebuild;
  MCDPCContainer *rootContainer;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MCDPlayableContentViewController;
  -[MCDPlayableContentViewController viewWillDisappear:](&v9, sel_viewWillDisappear_, a3);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  bundleID = self->_bundleID;
  self->_bundleID = 0;

  model = self->_model;
  self->_model = 0;

  stackToRebuild = self->_stackToRebuild;
  self->_stackToRebuild = 0;

  rootContainer = self->_rootContainer;
  self->_rootContainer = 0;

}

- (void)_nowPlayingIdentifiersChanged:(id)a3
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;

  v3 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__MCDPlayableContentViewController__nowPlayingIdentifiersChanged___block_invoke;
  block[3] = &unk_24FD78200;
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __66__MCDPlayableContentViewController__nowPlayingIdentifiersChanged___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "valueForKey:", *MEMORY[0x24BE65A60]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  MCDGeneralLogging();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_22FBAA000, v3, OS_LOG_TYPE_DEFAULT, "Received kMRMediaRemoteBrowsableContentNowPlayingIdentifiersUpdatedNotification", v5, 2u);
  }

  +[MCDBrowsableContentUtilities sharedInstance](MCDBrowsableContentUtilities, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNowPlayingIdentifiers:", v2);

}

- (id)_createSectionedRootViewController
{
  MCDPCContainer *v3;
  MCDPCContainer *rootContainer;

  if (!self->_rootContainer)
  {
    -[MCDPCModel containerForRoot](self->_model, "containerForRoot");
    v3 = (MCDPCContainer *)objc_claimAutoreleasedReturnValue();
    rootContainer = self->_rootContainer;
    self->_rootContainer = v3;

  }
  -[MCDPlayableContentViewController setNavigationBarHidden:](self, "setNavigationBarHidden:", 1);
  return -[MCDBrowsableContentNavigationController initWithBundleID:model:]([MCDBrowsableContentNavigationController alloc], "initWithBundleID:model:", self->_bundleID, self->_model);
}

- (id)_createRootViewController
{
  MCDPCContainer *v3;
  MCDPCContainer *rootContainer;

  if (!self->_rootContainer)
  {
    -[MCDPCModel containerForRoot](self->_model, "containerForRoot");
    v3 = (MCDPCContainer *)objc_claimAutoreleasedReturnValue();
    rootContainer = self->_rootContainer;
    self->_rootContainer = v3;

  }
  return -[MCDBrowsableContentTableViewController initWithContainer:tabbedBrowsing:]([MCDBrowsableContentTableViewController alloc], "initWithContainer:tabbedBrowsing:", self->_rootContainer, 0);
}

- (void)_setupView
{
  BOOL v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  MCDNowPlayingViewController *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject **v12;
  void *v13;
  _BOOL4 hasSectionedContent;
  NSObject *v15;
  _BOOL4 v16;
  uint64_t v17;
  _QWORD block[5];
  uint8_t buf[8];
  NSObject *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  if (!self->_hasLoaded)
  {
    if (self->_bundleID)
      v3 = MRMediaRemoteApplicationSupportsBrowsableContent() != 0;
    else
      v3 = 0;
    self->_hasBrowsableContent = v3;
    +[MCDBrowsableContentUtilities sharedInstance](MCDBrowsableContentUtilities, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNowPlayingIdentifiers:", 0);

    if (!self->_hasBrowsableContent)
    {
      MCDGeneralLogging();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22FBAA000, v7, OS_LOG_TYPE_DEFAULT, "App does not use browsable content API, pushing to now playing", buf, 2u);
      }

      v8 = [MCDNowPlayingViewController alloc];
      -[MCDPCModel bundleID](self->_model, "bundleID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCDPCModel appTitle](self->_model, "appTitle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[MCDNowPlayingViewController initWithPlayableBundleID:appName:](v8, "initWithPlayableBundleID:appName:", v9, v10);

      v20 = v6;
      v11 = (void *)MEMORY[0x24BDBCE30];
      v12 = &v20;
      goto LABEL_13;
    }
    if (self->_stackToRebuild)
    {
      MCDGeneralLogging();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22FBAA000, v5, OS_LOG_TYPE_DEFAULT, "Rebuilding stack for app launch", buf, 2u);
      }

      dispatch_get_global_queue(2, 0);
      v6 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __46__MCDPlayableContentViewController__setupView__block_invoke;
      block[3] = &unk_24FD78200;
      block[4] = self;
      dispatch_async(v6, block);
      goto LABEL_14;
    }
    if (!self->_hasLoaded)
    {
      hasSectionedContent = self->_hasSectionedContent;
      MCDGeneralLogging();
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
      if (hasSectionedContent)
      {
        if (v16)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22FBAA000, v15, OS_LOG_TYPE_DEFAULT, "Creating view controller for sectioned browsing", buf, 2u);
        }

        -[MCDPlayableContentViewController _createSectionedRootViewController](self, "_createSectionedRootViewController");
        v17 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v16)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22FBAA000, v15, OS_LOG_TYPE_DEFAULT, "Creating view controller for table view browsing", buf, 2u);
        }

        -[MCDPlayableContentViewController _createRootViewController](self, "_createRootViewController");
        v17 = objc_claimAutoreleasedReturnValue();
      }
      v6 = v17;
      v21[0] = v17;
      v11 = (void *)MEMORY[0x24BDBCE30];
      v12 = (NSObject **)v21;
LABEL_13:
      objc_msgSend(v11, "arrayWithObjects:count:", v12, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCDPlayableContentViewController setViewControllers:animated:](self, "setViewControllers:animated:", v13, 0);

      self->_hasLoaded = 1;
LABEL_14:

    }
  }
}

_BYTE *__46__MCDPlayableContentViewController__setupView__block_invoke(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (!result[1434])
  {
    objc_msgSend(result, "_populateStack");
    result = *(_BYTE **)(a1 + 32);
  }
  result[1434] = 1;
  return result;
}

- (void)setViewControllers:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  objc_super v7;
  _QWORD block[5];

  v4 = a4;
  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    v7.receiver = self;
    v7.super_class = (Class)MCDPlayableContentViewController;
    -[MCDPlayableContentViewController setViewControllers:animated:](&v7, sel_setViewControllers_animated_, v6, v4);
  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __64__MCDPlayableContentViewController_setViewControllers_animated___block_invoke;
    block[3] = &unk_24FD78200;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }

}

uint64_t __64__MCDPlayableContentViewController_setViewControllers_animated___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1434) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_setupView");
}

- (void)refreshNavigationStackForLaunch
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  int v6;
  void *v7;
  char isKindOfClass;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  id v17;
  int v18;
  NSObject *v19;
  NSObject *v20;
  MCDNowPlayingViewController *v21;
  void *v22;
  void *v23;
  int v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[16];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  -[MCDPCModel playableContentPlaybackManager](self->_model, "playableContentPlaybackManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentPlayingSong");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = -[MCDPCModel isCurrentPlayingApp](self->_model, "isCurrentPlayingApp");
  else
    v5 = 0;

  -[MCDPCModel bundleID](self->_model, "bundleID");
  v6 = MRMediaRemoteApplicationSupportsImmediatePlayback();
  -[MCDPlayableContentViewController visibleViewController](self, "visibleViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0 && v5)
  {
    MCDGeneralLogging();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22FBAA000, v9, OS_LOG_TYPE_DEFAULT, "Now Playing view already frontmost when Now Playing app tapped", buf, 2u);
    }
LABEL_32:

    return;
  }
  v24 = v6;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[MCDPlayableContentViewController viewControllers](self, "viewControllers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v26;
LABEL_10:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v26 != v13)
        objc_enumerationMutation(v10);
      v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v14);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      if (v12 == ++v14)
      {
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
        if (v12)
          goto LABEL_10;
        goto LABEL_16;
      }
    }
    v9 = v15;

    if (!v9)
      goto LABEL_21;
    MCDGeneralLogging();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22FBAA000, v16, OS_LOG_TYPE_DEFAULT, "popping from view controller to Now Playing view", buf, 2u);
    }

    v17 = (id)-[MCDPlayableContentViewController popToViewController:animated:](self, "popToViewController:animated:", v9, 0);
    goto LABEL_32;
  }
LABEL_16:

LABEL_21:
  if (v24)
    v18 = 1;
  else
    v18 = v5;
  if (v18 == 1)
  {
    if (v24)
    {
      MCDGeneralLogging();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22FBAA000, v19, OS_LOG_TYPE_DEFAULT, "Sending play command since the app supports immediate playback", buf, 2u);
      }

      MRMediaRemoteSendCommandToApp();
    }
    MCDGeneralLogging();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22FBAA000, v20, OS_LOG_TYPE_DEFAULT, "Show Now Playing view on app foreground", buf, 2u);
    }

    v21 = [MCDNowPlayingViewController alloc];
    -[MCDPCModel bundleID](self->_model, "bundleID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCDPCModel appTitle](self->_model, "appTitle");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[MCDNowPlayingViewController initWithPlayableBundleID:appName:](v21, "initWithPlayableBundleID:appName:", v22, v23);

    -[NSObject setShowNavigationBar:](v9, "setShowNavigationBar:", self->_hasSectionedContent);
    -[MCDPlayableContentViewController pushViewController:animated:](self, "pushViewController:animated:", v9, 0);
    goto LABEL_32;
  }
}

- (void)_modelDidInvalidate:(id)a3
{
  void *v4;
  unint64_t v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[5];
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  -[MCDPlayableContentViewController modelInvalidationQueue](self, "modelInvalidationQueue", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "operationCount");

  if (v5 < 4)
  {
    -[MCDPlayableContentViewController modelInvalidationQueue](self, "modelInvalidationQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __56__MCDPlayableContentViewController__modelDidInvalidate___block_invoke;
    v8[3] = &unk_24FD78200;
    v8[4] = self;
    -[NSObject addOperationWithBlock:](v6, "addOperationWithBlock:", v8);
  }
  else
  {
    MCDGeneralLogging();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[MCDPlayableContentViewController bundleID](self, "bundleID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v10 = v7;
      _os_log_impl(&dword_22FBAA000, v6, OS_LOG_TYPE_DEFAULT, "Cancelling extra model invalidation for %{public}@.", buf, 0xCu);

    }
  }

}

void __56__MCDPlayableContentViewController__modelDidInvalidate___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  const char *v6;
  unint64_t v7;
  intptr_t (*v8)(uint64_t);
  void *v9;
  dispatch_semaphore_t v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  intptr_t (*v20)(uint64_t);
  const char *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t *v31;
  id v32;
  void *v33;
  void *v34;
  _QWORD v35[5];
  id v36;
  _QWORD v37[4];
  id v38;
  NSObject *v39;
  __int128 *v40;
  uint64_t *v41;
  uint64_t *v42;
  uint64_t *v43;
  _QWORD v44[4];
  id v45;
  NSObject *v46;
  __int128 *p_buf;
  uint64_t *v48;
  uint64_t *v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  _QWORD block[6];
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t v67;
  uint8_t v68[4];
  void *v69;
  __int128 buf;
  uint64_t v71;
  uint64_t (*v72)(uint64_t, uint64_t);
  void (*v73)(uint64_t);
  id v74;
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  MCDGeneralLogging();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "bundleID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_22FBAA000, v2, OS_LOG_TYPE_DEFAULT, "Playable content invalidated, refreshing all index paths for %{public}@", (uint8_t *)&buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v71 = 0x3032000000;
  v72 = __Block_byref_object_copy_;
  v73 = __Block_byref_object_dispose_;
  v74 = 0;
  v64 = 0;
  v65 = &v64;
  v66 = 0x2020000000;
  v67 = 0;
  v58 = 0;
  v59 = &v58;
  v60 = 0x3032000000;
  v61 = __Block_byref_object_copy_;
  v62 = __Block_byref_object_dispose_;
  v63 = 0;
  v5 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__MCDPlayableContentViewController__modelDidInvalidate___block_invoke_34;
  block[3] = &unk_24FD784A8;
  block[4] = *(_QWORD *)(a1 + 32);
  block[5] = &v58;
  dispatch_sync(MEMORY[0x24BDAC9B8], block);
  v51 = 0;
  v52 = &v51;
  v53 = 0x3032000000;
  v54 = __Block_byref_object_copy_;
  v55 = __Block_byref_object_dispose_;
  objc_msgSend((id)v59[5], "firstObject");
  v56 = (id)objc_claimAutoreleasedReturnValue();
  if (v52[5])
  {
    v6 = "Adding MCDBrowsableContentTableViewController after model invalidate";
    v7 = 0x24FD77000uLL;
    v8 = __56__MCDPlayableContentViewController__modelDidInvalidate___block_invoke_35;
    v9 = &unk_24FD784D0;
    v34 = v4;
    do
    {
      v10 = dispatch_semaphore_create(0);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = (id)v52[5];
        MCDGeneralLogging();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v68 = 0;
          _os_log_impl(&dword_22FBAA000, v12, OS_LOG_TYPE_DEFAULT, v6, v68, 2u);
        }

        objc_msgSend(v4, "addObject:", v11);
        v44[0] = v5;
        v44[1] = 3221225472;
        v44[2] = v8;
        v44[3] = v9;
        p_buf = &buf;
        v13 = v11;
        v45 = v13;
        v48 = &v64;
        v49 = &v58;
        v50 = &v51;
        v14 = v10;
        v46 = v14;
        objc_msgSend(v13, "reloadWithCompletion:", v44);
        dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v15 = (id)v52[5];
          MCDGeneralLogging();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            v17 = v7;
            v18 = v5;
            v19 = v9;
            v20 = v8;
            v21 = v6;
            v22 = a1;
            objc_msgSend(*(id *)(a1 + 32), "bundleID");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v68 = 138543362;
            v69 = v23;
            _os_log_impl(&dword_22FBAA000, v16, OS_LOG_TYPE_DEFAULT, "Adding MCDBrowsableNavigationController to view controllers after model invalidate for %{public}@", v68, 0xCu);

            a1 = v22;
            v6 = v21;
            v8 = v20;
            v9 = v19;
            v5 = v18;
            v7 = v17;
            v4 = v34;
          }

          objc_msgSend(v4, "addObject:", v15);
          v37[0] = v5;
          v37[1] = 3221225472;
          v37[2] = __56__MCDPlayableContentViewController__modelDidInvalidate___block_invoke_36;
          v37[3] = v9;
          v40 = &buf;
          v13 = v15;
          v38 = v13;
          v41 = &v64;
          v42 = &v58;
          v43 = &v51;
          v24 = v10;
          v39 = v24;
          objc_msgSend(v13, "invalidateAndReloadTabsWithCompletion:", v37);
          dispatch_semaphore_wait(v24, 0xFFFFFFFFFFFFFFFFLL);

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            MCDGeneralLogging();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(*(id *)(a1 + 32), "bundleID");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v68 = 138543362;
              v69 = v26;
              _os_log_impl(&dword_22FBAA000, v25, OS_LOG_TYPE_DEFAULT, "Adding now playing view controller for model invalidate for %{public}@", v68, 0xCu);

            }
            objc_msgSend(v4, "addObject:", v52[5]);
            v27 = v65[3];
            if (v27 + 1 >= (unint64_t)objc_msgSend((id)v59[5], "count"))
            {
              v30 = (void *)v52[5];
              v52[5] = 0;
            }
            else
            {
              v28 = (void *)v59[5];
              ++v65[3];
              objc_msgSend(v28, "objectAtIndexedSubscript:");
              v29 = objc_claimAutoreleasedReturnValue();
              v30 = (void *)v52[5];
              v52[5] = v29;
            }

            v31 = (uint64_t *)*((_QWORD *)&buf + 1);
          }
          else
          {
            v31 = v52;
          }
          v13 = (id)v31[5];
          v31[5] = 0;
        }
      }

    }
    while (v52[5]);
  }
  v35[0] = v5;
  v35[1] = 3221225472;
  v35[2] = __56__MCDPlayableContentViewController__modelDidInvalidate___block_invoke_37;
  v35[3] = &unk_24FD781B0;
  v35[4] = *(_QWORD *)(a1 + 32);
  v36 = v4;
  v32 = v4;
  v33 = (void *)MEMORY[0x24BDAC9B8];
  dispatch_sync(MEMORY[0x24BDAC9B8], v35);

  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v58, 8);

  _Block_object_dispose(&v64, 8);
  _Block_object_dispose(&buf, 8);

}

void __56__MCDPlayableContentViewController__modelDidInvalidate___block_invoke_34(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "viewControllers");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  MCDGeneralLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "bundleID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v8 = 138543618;
    v9 = v6;
    v10 = 2114;
    v11 = v7;
    _os_log_impl(&dword_22FBAA000, v5, OS_LOG_TYPE_DEFAULT, "Fetched current view controllers to reload after playable content invalidated for %{public}@: %{public}@", (uint8_t *)&v8, 0x16u);

  }
}

intptr_t __56__MCDPlayableContentViewController__modelDidInvalidate___block_invoke_35(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  _BOOL4 v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  uint64_t v20;
  int v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "container");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) + 1;
  if (v5 < objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "objectAtIndexedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) + 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "container");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isValidForRefreshedParent:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

      MCDGeneralLogging();
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      if (v8)
      {
        if (v10)
        {
          LOWORD(v22) = 0;
          _os_log_impl(&dword_22FBAA000, v9, OS_LOG_TYPE_DEFAULT, "Container is valid for table view", (uint8_t *)&v22, 2u);
        }

        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), v6);
        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
        goto LABEL_17;
      }
      if (!v10)
        goto LABEL_15;
      LOWORD(v22) = 0;
      v17 = "Container isn't valid for refreshed parent for table views";
      v18 = v9;
      v19 = 2;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
        objc_msgSend(v13, "objectAtIndexedSubscript:");
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
        v16 = *(void **)(v15 + 40);
        *(_QWORD *)(v15 + 40) = v14;
LABEL_16:

LABEL_17:
        return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
      }
      MCDGeneralLogging();
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
LABEL_15:

        v20 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
        v16 = *(void **)(v20 + 40);
        *(_QWORD *)(v20 + 40) = 0;
        goto LABEL_16;
      }
      v22 = 138543362;
      v23 = v6;
      v17 = "Next view controller is neither a table view nor now playing view when current VC is a table view, which sho"
            "uldn't be here: %{public}@";
      v18 = v9;
      v19 = 12;
    }
    _os_log_impl(&dword_22FBAA000, v18, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v22, v19);
    goto LABEL_15;
  }
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = 0;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

intptr_t __56__MCDPlayableContentViewController__modelDidInvalidate___block_invoke_36(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  _BOOL4 v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  uint64_t v24;
  int v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "container");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) + 1;
  if (v5 < objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "objectAtIndexedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) + 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "selectedViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "container");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

      objc_msgSend(v6, "container");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isValidForRefreshedParent:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

      MCDGeneralLogging();
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      if (v12)
      {
        if (v14)
        {
          LOWORD(v26) = 0;
          _os_log_impl(&dword_22FBAA000, v13, OS_LOG_TYPE_DEFAULT, "Container is valid for tab bar", (uint8_t *)&v26, 2u);
        }

        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), v6);
        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
        goto LABEL_17;
      }
      if (!v14)
        goto LABEL_15;
      LOWORD(v26) = 0;
      v21 = "Container isn't valid for tab bar";
      v22 = v13;
      v23 = 2;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
        objc_msgSend(v17, "objectAtIndexedSubscript:");
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
        v20 = *(void **)(v19 + 40);
        *(_QWORD *)(v19 + 40) = v18;
LABEL_16:

LABEL_17:
        return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
      }
      MCDGeneralLogging();
      v13 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
LABEL_15:

        v24 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
        v20 = *(void **)(v24 + 40);
        *(_QWORD *)(v24 + 40) = 0;
        goto LABEL_16;
      }
      v26 = 138543362;
      v27 = v6;
      v21 = "Next view controller is neither a table view nor a now playing view when current VC is a tab bar, which shou"
            "ldn't be here: %{public}@";
      v22 = v13;
      v23 = 12;
    }
    _os_log_impl(&dword_22FBAA000, v22, OS_LOG_TYPE_DEFAULT, v21, (uint8_t *)&v26, v23);
    goto LABEL_15;
  }
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = 0;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t __56__MCDPlayableContentViewController__modelDidInvalidate___block_invoke_37(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  MCDGeneralLogging();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "bundleID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_22FBAA000, v2, OS_LOG_TYPE_DEFAULT, "Setting view controllers after model invalidate for %{public}@", (uint8_t *)&v5, 0xCu);

  }
  return objc_msgSend(*(id *)(a1 + 32), "setViewControllers:animated:", *(_QWORD *)(a1 + 40), 0);
}

- (void)_populateStack
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  MCDPCContainer *rootContainer;
  MCDPCContainer *v10;
  MCDPCContainer *v11;
  uint64_t v12;
  void *v13;
  dispatch_semaphore_t v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  MCDPlayableContentViewController *v21;
  _QWORD v22[4];
  NSObject *v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  id *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;

  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy_;
  v43 = __Block_byref_object_dispose_;
  v44 = 0;
  v33 = 0;
  v34 = (id *)&v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy_;
  v37 = __Block_byref_object_dispose_;
  v38 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy_;
  v31 = __Block_byref_object_dispose_;
  v32 = 0;
  -[NSArray objectEnumerator](self->_stackToRebuild, "objectEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nextObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  if (v4)
  {
    do
    {
      objc_msgSend(v4, "indexPath");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "length");

      if (!v8)
      {
        rootContainer = self->_rootContainer;
        if (!rootContainer)
        {
          -[MCDPCModel containerForRoot](self->_model, "containerForRoot");
          v10 = (MCDPCContainer *)objc_claimAutoreleasedReturnValue();
          v11 = self->_rootContainer;
          self->_rootContainer = v10;

          rootContainer = self->_rootContainer;
        }
        objc_storeStrong(v34 + 5, rootContainer);
      }
      if (v34[5])
        objc_msgSend(v5, "addObject:");
      objc_msgSend(v3, "nextObject");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v40[5];
      v40[5] = v12;

      v14 = dispatch_semaphore_create(0);
      v15 = v34[5];
      v22[0] = v6;
      v22[1] = 3221225472;
      v22[2] = __50__MCDPlayableContentViewController__populateStack__block_invoke;
      v22[3] = &unk_24FD784F8;
      v24 = &v39;
      v25 = &v27;
      v26 = &v33;
      v16 = v14;
      v23 = v16;
      objc_msgSend(v15, "refreshWithCompletion:", v22);
      dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
      v17 = (id)v40[5];

      objc_storeStrong(v34 + 5, (id)v28[5]);
      v4 = v17;
    }
    while (v17);
  }
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __50__MCDPlayableContentViewController__populateStack__block_invoke_2;
  block[3] = &unk_24FD781B0;
  v20 = v5;
  v21 = self;
  v18 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(&v39, 8);
}

intptr_t __50__MCDPlayableContentViewController__populateStack__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v2)
  {
    objc_msgSend(v2, "indexPath");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "containerAtIndex:", objc_msgSend(v3, "indexAtPosition:", objc_msgSend(v3, "length") - 1));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "isValidForRefreshedParent:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)) & 1) == 0)
    {
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = 0;

    }
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __50__MCDPlayableContentViewController__populateStack__block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  MCDBrowsableContentTableViewController *v9;
  MCDBrowsableContentTableViewController *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7);
        v9 = [MCDBrowsableContentTableViewController alloc];
        v10 = -[MCDBrowsableContentTableViewController initWithContainer:](v9, "initWithContainer:", v8, (_QWORD)v11);
        -[MCDBrowsableContentTableViewController reloadWithCompletion:](v10, "reloadWithCompletion:", 0);
        objc_msgSend(v2, "addObject:", v10);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  objc_msgSend(*(id *)(a1 + 40), "setViewControllers:animated:", v2, 0);
}

- (id)currentStack
{
  NSObject *v3;
  void *v4;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  MCDGeneralLogging();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[MCDPlayableContentViewController viewControllers](self, "viewControllers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v22 = v4;
    _os_log_impl(&dword_22FBAA000, v3, OS_LOG_TYPE_DEFAULT, "current stack: %@", buf, 0xCu);

  }
  if (self->_hasSectionedContent)
    return 0;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[MCDPlayableContentViewController viewControllers](self, "viewControllers", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
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
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v12, "container");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          +[_MCDStackItem stackItemWithContainer:](_MCDStackItem, "stackItemWithContainer:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v6, "addObject:", v14);
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v6, "count") == 1)
    v15 = 0;
  else
    v15 = v6;

  return v15;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSOperationQueue)modelInvalidationQueue
{
  return self->_modelInvalidationQueue;
}

- (void)setModelInvalidationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_modelInvalidationQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelInvalidationQueue, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_stackToRebuild, 0);
  objc_storeStrong((id *)&self->_rootContainer, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end

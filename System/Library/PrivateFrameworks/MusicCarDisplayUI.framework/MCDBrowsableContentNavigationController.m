@implementation MCDBrowsableContentNavigationController

- (MCDBrowsableContentNavigationController)initWithBundleID:(id)a3 model:(id)a4
{
  id v6;
  id v7;
  MCDBrowsableContentNavigationController *v8;
  uint64_t v9;
  NSString *bundleID;
  dispatch_queue_t v11;
  OS_dispatch_queue *serialQueue;
  uint64_t v13;
  MCDPCContainer *container;
  void *v15;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)MCDBrowsableContentNavigationController;
  v8 = -[MCDBrowsableContentNavigationController initWithNibName:bundle:](&v17, sel_initWithNibName_bundle_, 0, 0);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    bundleID = v8->_bundleID;
    v8->_bundleID = (NSString *)v9;

    objc_storeStrong((id *)&v8->_model, a4);
    v11 = dispatch_queue_create("com.apple.MusicCarDisplayUI.playableContent.navigationController", 0);
    serialQueue = v8->_serialQueue;
    v8->_serialQueue = (OS_dispatch_queue *)v11;

    -[MCDPCModel containerForRoot](v8->_model, "containerForRoot");
    v13 = objc_claimAutoreleasedReturnValue();
    container = v8->_container;
    v8->_container = (MCDPCContainer *)v13;

    -[MCDPCContainer setDelegate:](v8->_container, "setDelegate:", v8);
    -[MCDBrowsableContentNavigationController setDelegate:](v8, "setDelegate:", v8);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v8, sel__appRegisteredForContent_, CFSTR("appReadyToFetch"), v8->_model);
    objc_msgSend(v15, "addObserver:selector:name:object:", v8, sel__nowPlayingDidChange_, CFSTR("nowPlayingChange"), v8->_model);

  }
  return v8;
}

- (void)_appRegisteredForContent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  +[MCDMediaRemoteSerialQueueManager sharedInstance](MCDMediaRemoteSerialQueueManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __68__MCDBrowsableContentNavigationController__appRegisteredForContent___block_invoke;
  v10 = &unk_24FD78188;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v5, "addOperation:cancelAllOperations:", &v7, 1);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", v7, v8, v9, v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("appReadyToFetch"), 0);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __68__MCDBrowsableContentNavigationController__appRegisteredForContent___block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__MCDBrowsableContentNavigationController__appRegisteredForContent___block_invoke_2;
  block[3] = &unk_24FD78188;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_sync(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v2);
}

void __68__MCDBrowsableContentNavigationController__appRegisteredForContent___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  MCDGeneralLogging();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22FBAA000, v2, OS_LOG_TYPE_DEFAULT, "Loading content in tab controller for the first time since app registered", buf, 2u);
  }

  objc_msgSend(WeakRetained, "container");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __68__MCDBrowsableContentNavigationController__appRegisteredForContent___block_invoke_19;
  v5[3] = &unk_24FD78200;
  v6 = WeakRetained;
  v4 = WeakRetained;
  objc_msgSend(v3, "refreshWithCompletion:", v5);

}

void __68__MCDBrowsableContentNavigationController__appRegisteredForContent___block_invoke_19(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__MCDBrowsableContentNavigationController__appRegisteredForContent___block_invoke_2_20;
  block[3] = &unk_24FD78200;
  v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __68__MCDBrowsableContentNavigationController__appRegisteredForContent___block_invoke_2_20(uint64_t a1)
{
  uint64_t result;
  NSObject *v3;
  uint8_t v4[16];

  objc_msgSend(*(id *)(a1 + 32), "setDidFinishInitialLoad:", 1);
  result = objc_msgSend(*(id *)(a1 + 32), "visible");
  if ((_DWORD)result)
  {
    MCDGeneralLogging();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_22FBAA000, v3, OS_LOG_TYPE_DEFAULT, "finished loading content after the view appeared, setting tabs", v4, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_updateNowPlayingButtonVisibility");
    objc_msgSend(*(id *)(a1 + 32), "_loadAllHostTabs");
    return objc_msgSend(*(id *)(a1 + 32), "setDidFinishInitialViewAppear:", 1);
  }
  return result;
}

- (void)_nowPlayingDidChange:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  MCDGeneralLogging();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_22FBAA000, v4, OS_LOG_TYPE_DEFAULT, "Received MCDPCNowPlayingDidChangeNotificationName", v5, 2u);
  }

  -[MCDBrowsableContentNavigationController _updateNowPlayingButtonVisibility](self, "_updateNowPlayingButtonVisibility");
}

- (void)_updateNowPlayingButtonVisibility
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __76__MCDBrowsableContentNavigationController__updateNowPlayingButtonVisibility__block_invoke;
  block[3] = &unk_24FD78200;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __76__MCDBrowsableContentNavigationController__updateNowPlayingButtonVisibility__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  const char *v9;
  uint8_t *v10;
  void *v11;
  _BOOL4 v12;
  _QWORD *v13;
  uint64_t v14;
  id v15;
  void *v16;
  double Height;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  __int16 v23;
  uint8_t v24[16];
  uint8_t v25[16];
  __int16 v26;
  uint8_t buf[16];
  CGRect v28;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1232), "playableContentPlaybackManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentPlayingSong");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1232), "isCurrentPlayingApp"))
  {
    v4 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 1208);

    if (v4)
    {
      MCDGeneralLogging();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22FBAA000, v5, OS_LOG_TYPE_DEFAULT, "Showing Now Playing button in tab bar", buf, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "_accessoryView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      MCDGeneralLogging();
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
      if (v6)
      {
        if (v8)
        {
          v26 = 0;
          v9 = "Accessory view already set.";
          v10 = (uint8_t *)&v26;
LABEL_17:
          _os_log_impl(&dword_22FBAA000, v7, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
          goto LABEL_18;
        }
        goto LABEL_18;
      }
      if (v8)
      {
        *(_WORD *)v25 = 0;
        _os_log_impl(&dword_22FBAA000, v7, OS_LOG_TYPE_DEFAULT, "Showing Now Playing button in tab bar", v25, 2u);
      }

      v13 = *(_QWORD **)(a1 + 32);
      v14 = v13[156];
      if (!v14)
      {
        v15 = objc_alloc(MEMORY[0x24BE153A0]);
        objc_msgSend(*(id *)(a1 + 32), "tabBar");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "bounds");
        Height = CGRectGetHeight(v28);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1232), "bundleID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v15, "initWithFrame:bundleIdentifier:", v18, 0.0, 0.0, 0.0, Height);
        v20 = *(_QWORD *)(a1 + 32);
        v21 = *(void **)(v20 + 1248);
        *(_QWORD *)(v20 + 1248) = v19;

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1248), "nowPlayingButton");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel__nowPlayingButtonTapped_, 64);

        v13 = *(_QWORD **)(a1 + 32);
        v14 = v13[156];
      }
LABEL_14:
      objc_msgSend(v13, "_setAccessoryView:", v14);
      return;
    }
  }
  else
  {

  }
  objc_msgSend(*(id *)(a1 + 32), "_accessoryView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  MCDGeneralLogging();
  v7 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v12)
    {
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_22FBAA000, v7, OS_LOG_TYPE_DEFAULT, "Hiding Now Playing button in tab bar", v24, 2u);
    }

    v13 = *(_QWORD **)(a1 + 32);
    v14 = 0;
    goto LABEL_14;
  }
  if (v12)
  {
    v23 = 0;
    v9 = "No Now Playing button hide needed.";
    v10 = (uint8_t *)&v23;
    goto LABEL_17;
  }
LABEL_18:

}

- (void)_nowPlayingButtonTapped:(id)a3
{
  MCDNowPlayingViewController *v4;
  void *v5;
  void *v6;
  MCDNowPlayingViewController *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];

  v4 = [MCDNowPlayingViewController alloc];
  -[MCDPCModel bundleID](self->_model, "bundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCDPCModel appTitle](self->_model, "appTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MCDNowPlayingViewController initWithPlayableBundleID:appName:](v4, "initWithPlayableBundleID:appName:", v5, v6);

  MCDGeneralLogging();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_22FBAA000, v8, OS_LOG_TYPE_DEFAULT, "Now playing button tapped in tab bar, pushing to Now Playing screen", v11, 2u);
  }

  -[MCDBrowsableContentNavigationController navigationController](self, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setNavigationBarHidden:", 0);

  -[MCDBrowsableContentNavigationController navigationController](self, "navigationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pushViewController:animated:", v7, 1);

}

- (void)container:(id)a3 didInvalidateIndicies:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  MCDGeneralLogging();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v18 = v9;
    v19 = 2114;
    v20 = v7;
    _os_log_impl(&dword_22FBAA000, v8, OS_LOG_TYPE_DEFAULT, "Some content has invalidated, preparing to reload tab views for container: %{public}@, indicies: %{public}@", buf, 0x16u);

  }
  objc_initWeak((id *)buf, self);
  +[MCDMediaRemoteSerialQueueManager sharedInstance](MCDMediaRemoteSerialQueueManager, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __75__MCDBrowsableContentNavigationController_container_didInvalidateIndicies___block_invoke;
  v13[3] = &unk_24FD78A18;
  objc_copyWeak(&v16, (id *)buf);
  v11 = v6;
  v14 = v11;
  v12 = v7;
  v15 = v12;
  objc_msgSend(v10, "addOperation:cancelAllOperations:", v13, 0);

  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);

}

void __75__MCDBrowsableContentNavigationController_container_didInvalidateIndicies___block_invoke(id *a1)
{
  _QWORD block[4];
  id v3;
  id v4;
  id v5;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __75__MCDBrowsableContentNavigationController_container_didInvalidateIndicies___block_invoke_2;
  block[3] = &unk_24FD78A18;
  objc_copyWeak(&v5, a1 + 6);
  v3 = a1[4];
  v4 = a1[5];
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v5);
}

void __75__MCDBrowsableContentNavigationController_container_didInvalidateIndicies___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (objc_msgSend(WeakRetained, "visible"))
  {
    objc_msgSend(WeakRetained, "viewControllers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      MCDGeneralLogging();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "identifier");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = *(_QWORD *)(a1 + 40);
        v13 = 138543618;
        v14 = v5;
        v15 = 2114;
        v16 = v6;
        _os_log_impl(&dword_22FBAA000, v4, OS_LOG_TYPE_DEFAULT, "Reloading specific tabs since they are invalid for container: %{public}@, indicies: %{public}@", (uint8_t *)&v13, 0x16u);

      }
      objc_msgSend(WeakRetained, "updateTitleAndTabBarItemsAtIndexes:", *(_QWORD *)(a1 + 40));
    }
    else if (objc_msgSend(WeakRetained, "didFinishInitialLoad"))
    {
      MCDGeneralLogging();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = *(_QWORD *)(a1 + 40);
        v13 = 138543618;
        v14 = v11;
        v15 = 2114;
        v16 = v12;
        _os_log_impl(&dword_22FBAA000, v10, OS_LOG_TYPE_DEFAULT, "Reloading all host tabs since table views are nil for container: %{public}@, indicies: %{public}@", (uint8_t *)&v13, 0x16u);

      }
      objc_msgSend(WeakRetained, "_loadAllHostTabs");
    }
  }
  else
  {
    MCDGeneralLogging();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 40);
      v13 = 138543618;
      v14 = v8;
      v15 = 2114;
      v16 = v9;
      _os_log_impl(&dword_22FBAA000, v7, OS_LOG_TYPE_DEFAULT, "Tab view not visible for container indicies reload: %{public}@, indicies: %{public}@", (uint8_t *)&v13, 0x16u);

    }
  }

}

- (void)_loadAllHostTabs
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  dispatch_time_t v12;
  void *v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  _QWORD block[5];
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  -[MCDBrowsableContentNavigationController container](self, "container");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "cachedCount");

  MCDGeneralLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      -[MCDBrowsableContentNavigationController bundleID](self, "bundleID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v7;
      v31 = 2050;
      v32 = v4;
      _os_log_impl(&dword_22FBAA000, v5, OS_LOG_TYPE_DEFAULT, "Number of tabs returned from client %{public}@: %{public}ld", buf, 0x16u);

    }
    v8 = v4;
  }
  else
  {
    if (v6)
    {
      -[MCDBrowsableContentNavigationController bundleID](self, "bundleID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v9;
      _os_log_impl(&dword_22FBAA000, v5, OS_LOG_TYPE_DEFAULT, "No tabs available from host, loading default tabs for %{public}@", buf, 0xCu);

    }
    if (!-[MCDBrowsableContentNavigationController hasInvalidatedDummyTabs](self, "hasInvalidatedDummyTabs"))
    {
      MCDGeneralLogging();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        -[MCDBrowsableContentNavigationController bundleID](self, "bundleID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v30 = v11;
        _os_log_impl(&dword_22FBAA000, v10, OS_LOG_TYPE_DEFAULT, "Scheduling dummy tab reload for %{public}@", buf, 0xCu);

      }
      -[MCDBrowsableContentNavigationController setHasInvalidatedDummyTabs:](self, "setHasInvalidatedDummyTabs:", 1);
      v12 = dispatch_time(0, 2000000000);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __59__MCDBrowsableContentNavigationController__loadAllHostTabs__block_invoke;
      block[3] = &unk_24FD78200;
      block[4] = self;
      dispatch_after(v12, MEMORY[0x24BDAC9B8], block);
    }
    v8 = 3;
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MCDBrowsableContentNavigationController selectedIndex](self, "selectedIndex") == 0x7FFFFFFFFFFFFFFFLL)
    v15 = 0;
  else
    v15 = -[MCDBrowsableContentNavigationController selectedIndex](self, "selectedIndex");
  v16 = 0;
  *(_QWORD *)&v14 = 138543618;
  v27 = v14;
  do
  {
    -[MCDBrowsableContentNavigationController _hostTabAtIndex:dummyTab:](self, "_hostTabAtIndex:dummyTab:", v16, v4 == 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      if (v4)
      {
        MCDGeneralLogging();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
        if (v15 == v16)
        {
          if (v19)
          {
            objc_msgSend(v17, "container");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "identifier");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v27;
            v30 = v21;
            v31 = 2050;
            v32 = v15;
            _os_log_impl(&dword_22FBAA000, v18, OS_LOG_TYPE_DEFAULT, "Refreshing view controller %{public}@ because it is the selected index: %{public}ld", buf, 0x16u);

          }
          objc_msgSend(v17, "reloadWithCompletion:", 0);
        }
        else
        {
          if (v19)
          {
            objc_msgSend(v17, "container");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "identifier");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v30 = v25;
            _os_log_impl(&dword_22FBAA000, v18, OS_LOG_TYPE_DEFAULT, "View controller %{public}@ is not selected but is reloaded, begin loading item", buf, 0xCu);

          }
          objc_msgSend(v17, "container");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "beginLoadingItemWithCompletion:", 0);

        }
      }
      else
      {
        MCDGeneralLogging();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          -[MCDBrowsableContentNavigationController bundleID](self, "bundleID");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v30 = v23;
          _os_log_impl(&dword_22FBAA000, v22, OS_LOG_TYPE_DEFAULT, "Dummy tab, no need to refresh in %{public}@", buf, 0xCu);

        }
      }
      objc_msgSend(v13, "addObject:", v17, v27);
    }

    ++v16;
  }
  while (v8 != v16);
  -[MCDBrowsableContentNavigationController setViewControllers:](self, "setViewControllers:", v13);

}

uint64_t __59__MCDBrowsableContentNavigationController__loadAllHostTabs__block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_22FBAA000, v2, OS_LOG_TYPE_DEFAULT, "Performing dummy tab reload for %{public}@", (uint8_t *)&v5, 0xCu);

  }
  return objc_msgSend(*(id *)(a1 + 32), "invalidateAndReloadTabsWithCompletion:", 0);
}

- (void)invalidateAndReloadTabsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  +[MCDMediaRemoteSerialQueueManager sharedInstance](MCDMediaRemoteSerialQueueManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __81__MCDBrowsableContentNavigationController_invalidateAndReloadTabsWithCompletion___block_invoke;
  v7[3] = &unk_24FD78740;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "addOperation:cancelAllOperations:", v7, 0);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __81__MCDBrowsableContentNavigationController_invalidateAndReloadTabsWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint8_t buf[16];

  MCDGeneralLogging();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22FBAA000, v2, OS_LOG_TYPE_DEFAULT, "Reloading tabs after invalidate", buf, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "container");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __81__MCDBrowsableContentNavigationController_invalidateAndReloadTabsWithCompletion___block_invoke_27;
  v6[3] = &unk_24FD78690;
  v7 = WeakRetained;
  v8 = *(id *)(a1 + 32);
  v5 = WeakRetained;
  objc_msgSend(v4, "refreshWithCompletion:", v6);

}

void __81__MCDBrowsableContentNavigationController_invalidateAndReloadTabsWithCompletion___block_invoke_27(uint64_t a1)
{
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  uint8_t buf[16];

  MCDGeneralLogging();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22FBAA000, v2, OS_LOG_TYPE_DEFAULT, "Finished reloading tabs after invalidate", buf, 2u);
  }

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __81__MCDBrowsableContentNavigationController_invalidateAndReloadTabsWithCompletion___block_invoke_28;
  v3[3] = &unk_24FD78690;
  v4 = *(id *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x24BDAC9B8], v3);

}

uint64_t __81__MCDBrowsableContentNavigationController_invalidateAndReloadTabsWithCompletion___block_invoke_28(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_loadAllHostTabs");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)tabBarController:(id)a3 didSelectViewController:(id)a4
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a4;
  MCDGeneralLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_22FBAA000, v5, OS_LOG_TYPE_DEFAULT, "Tab selected, reloading content for %{public}@", (uint8_t *)&v7, 0xCu);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "reloadWithCompletion:", 0);

}

- (id)_tabBarItemForViewController:(id)a3 fromItem:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  char v15;
  NSObject *v16;
  _BOOL4 v17;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  const __CFString *v23;
  id v24;
  NSObject *v26;
  int v27;
  NSObject *v28;
  __int16 v29;
  const __CFString *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "artworkImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageWithRenderingMode:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "tabBarItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    MCDGeneralLogging();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
LABEL_14:

      MCDGeneralLogging();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v6, "title");
        v21 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "artworkImage");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = CFSTR("NO");
        if (!v22)
          v23 = CFSTR("YES");
        v27 = 138412546;
        v28 = v21;
        v29 = 2112;
        v30 = v23;
        _os_log_impl(&dword_22FBAA000, v20, OS_LOG_TYPE_DEFAULT, "Creating tab bar item for item: %@, artwork is nil? %@", (uint8_t *)&v27, 0x16u);

      }
      v24 = objc_alloc(MEMORY[0x24BEBD9E8]);
      objc_msgSend(v6, "title");
      v16 = objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v24, "initWithTitle:image:selectedImage:", v16, v8, v8);
      goto LABEL_19;
    }
    objc_msgSend(v6, "title");
    v16 = objc_claimAutoreleasedReturnValue();
    v27 = 138412290;
    v28 = v16;
    _os_log_impl(&dword_22FBAA000, v10, OS_LOG_TYPE_DEFAULT, "No existing tab bar item and artwork for item: %@", (uint8_t *)&v27, 0xCu);
    goto LABEL_13;
  }
  objc_msgSend(v5, "tabBarItem");
  v10 = objc_claimAutoreleasedReturnValue();
  MCDGeneralLogging();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "title");
    v12 = objc_claimAutoreleasedReturnValue();
    v27 = 138412290;
    v28 = v12;
    _os_log_impl(&dword_22FBAA000, v11, OS_LOG_TYPE_DEFAULT, "Examining existing tab bar item and artwork for item: %@", (uint8_t *)&v27, 0xCu);

  }
  -[NSObject title](v10, "title");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "title");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "isEqualToString:", v14);

  if ((v15 & 1) == 0)
  {
    MCDGeneralLogging();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "title");
      v18 = objc_claimAutoreleasedReturnValue();
      v27 = 138412290;
      v28 = v18;
      v19 = "Titles differ; invalidating tab bar item: %@";
      goto LABEL_12;
    }
LABEL_13:

    goto LABEL_14;
  }
  MCDGeneralLogging();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v17)
    {
      objc_msgSend(v6, "title");
      v18 = objc_claimAutoreleasedReturnValue();
      v27 = 138412290;
      v28 = v18;
      v19 = "New image provided; invalidating tab bar item: %@";
LABEL_12:
      _os_log_impl(&dword_22FBAA000, v16, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v27, 0xCu);

      goto LABEL_13;
    }
    goto LABEL_13;
  }
  if (v17)
  {
    objc_msgSend(v6, "title");
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = 138412290;
    v28 = v26;
    _os_log_impl(&dword_22FBAA000, v16, OS_LOG_TYPE_DEFAULT, "Repurposing tab bar item and artwork for tab bar item: %@", (uint8_t *)&v27, 0xCu);

  }
LABEL_19:

  return v10;
}

- (id)_hostTabAtIndex:(unint64_t)a3 dummyTab:(BOOL)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  MCDBrowsableContentTableViewController *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  char v27;
  int v28;
  void *v29;
  __int16 v30;
  const __CFString *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  if (a4)
    return -[MCDBrowsableContentTableViewController initWithContainer:tabbedBrowsing:]([MCDBrowsableContentTableViewController alloc], "initWithContainer:tabbedBrowsing:", 0, 1);
  -[MCDBrowsableContentNavigationController container](self, "container");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "containerAtIndex:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[MCDBrowsableContentNavigationController container](self, "container");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cachedItemForIndex:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "isContainer") && (objc_msgSend(v10, "isPlayable") & 1) == 0)
  {
    objc_msgSend(v10, "title");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCDBrowsableContentNavigationController viewControllers](self, "viewControllers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v14 <= a3)
    {
      v11 = 0;
    }
    else
    {
      -[MCDBrowsableContentNavigationController viewControllers](self, "viewControllers");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndexedSubscript:", a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v11, "container");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "isEqualToString:", v18);

    if ((v19 & 1) == 0)
    {
      v20 = -[MCDBrowsableContentTableViewController initWithContainer:tabbedBrowsing:]([MCDBrowsableContentTableViewController alloc], "initWithContainer:tabbedBrowsing:", v8, 1);

      v11 = v20;
    }
    MCDGeneralLogging();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v10, "title");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "artworkImage");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = CFSTR("NO");
      if (!v23)
        v24 = CFSTR("YES");
      v28 = 138412546;
      v29 = v22;
      v30 = 2112;
      v31 = v24;
      _os_log_impl(&dword_22FBAA000, v21, OS_LOG_TYPE_DEFAULT, "Adding view controller for tab: %@, artwork is nil? %@", (uint8_t *)&v28, 0x16u);

    }
    objc_msgSend(v11, "setTitle:", v12);
    -[MCDBrowsableContentNavigationController _tabBarItemForViewController:fromItem:](self, "_tabBarItemForViewController:fromItem:", v11, v10);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "tabBarItem");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if ((v27 & 1) == 0)
      objc_msgSend(v11, "setTabBarItem:", v25);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)updateTitleAndTabBarItemsAtIndexes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint64_t v11;

  v4 = a3;
  -[MCDBrowsableContentNavigationController viewControllers](self, "viewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v7 = objc_msgSend(v6, "count");
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __78__MCDBrowsableContentNavigationController_updateTitleAndTabBarItemsAtIndexes___block_invoke;
  v9[3] = &unk_24FD78AB0;
  v10 = v6;
  v11 = v7;
  v9[4] = self;
  v8 = v6;
  objc_msgSend(v4, "enumerateIndexesUsingBlock:", v9);

  -[MCDBrowsableContentNavigationController setViewControllers:](self, "setViewControllers:", v8);
}

void __78__MCDBrowsableContentNavigationController_updateTitleAndTabBarItemsAtIndexes___block_invoke(uint64_t a1, unint64_t a2)
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  int v14;
  void *v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 48) > a2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1216), "cachedItemForIndex:", a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isContainer") && (objc_msgSend(v4, "isPlayable") & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      MCDGeneralLogging();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v4, "title");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "artworkImage");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = CFSTR("NO");
        if (!v8)
          v9 = CFSTR("YES");
        v14 = 138412546;
        v15 = v7;
        v16 = 2112;
        v17 = v9;
        _os_log_impl(&dword_22FBAA000, v6, OS_LOG_TYPE_DEFAULT, "Adding title for tab: %@, artwork is nil? %@", (uint8_t *)&v14, 0x16u);

      }
      objc_msgSend(v4, "title");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setTitle:", v10);

      objc_msgSend(*(id *)(a1 + 32), "_tabBarItemForViewController:fromItem:", v5, v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "tabBarItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqual:", v12);

      if ((v13 & 1) == 0)
        objc_msgSend(v5, "setTabBarItem:", v11);

    }
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MCDBrowsableContentNavigationController;
  -[MCDBrowsableContentNavigationController viewWillAppear:](&v8, sel_viewWillAppear_, a3);
  -[MCDBrowsableContentNavigationController traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCDBrowsableContentNavigationController setHasCarScreen:](self, "setHasCarScreen:", objc_msgSend(v4, "userInterfaceIdiom") == 3);

  if (-[MCDBrowsableContentNavigationController didFinishInitialLoad](self, "didFinishInitialLoad")
    && !-[MCDBrowsableContentNavigationController didFinishInitialViewAppear](self, "didFinishInitialViewAppear"))
  {
    MCDGeneralLogging();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_22FBAA000, v6, OS_LOG_TYPE_DEFAULT, "Container finished initial load when viewWillAppear is called, start loading host tabs", v7, 2u);
    }

    -[MCDBrowsableContentNavigationController _updateNowPlayingButtonVisibility](self, "_updateNowPlayingButtonVisibility");
    -[MCDBrowsableContentNavigationController _loadAllHostTabs](self, "_loadAllHostTabs");
    -[MCDBrowsableContentNavigationController setDidFinishInitialViewAppear:](self, "setDidFinishInitialViewAppear:", 1);
  }
  else
  {
    MCDGeneralLogging();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_22FBAA000, v5, OS_LOG_TYPE_DEFAULT, "viewWillAppear called for MCDBrowsableContentNavigationController, but container isn't finished loading yet", v7, 2u);
    }

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MCDBrowsableContentNavigationController;
  -[MCDBrowsableContentNavigationController viewDidAppear:](&v7, sel_viewDidAppear_, a3);
  -[MCDBrowsableContentNavigationController setVisible:](self, "setVisible:", 1);
  if (-[MCDBrowsableContentNavigationController didFinishInitialViewAppear](self, "didFinishInitialViewAppear")
    || !-[MCDBrowsableContentNavigationController didFinishInitialLoad](self, "didFinishInitialLoad"))
  {
    if (!-[MCDBrowsableContentNavigationController didFinishInitialViewAppear](self, "didFinishInitialViewAppear")
      && !-[MCDBrowsableContentNavigationController didFinishInitialViewAppear](self, "didFinishInitialViewAppear"))
    {
      MCDGeneralLogging();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_22FBAA000, v5, OS_LOG_TYPE_DEFAULT, "viewDidAppear called for MCDBrowsableContentNavigationController, but container isn't finished loading yet", v6, 2u);
      }

    }
  }
  else
  {
    MCDGeneralLogging();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_22FBAA000, v4, OS_LOG_TYPE_DEFAULT, "Container finished initial load when viewDidAppear is called, start loading host tabs", v6, 2u);
    }

    -[MCDBrowsableContentNavigationController _updateNowPlayingButtonVisibility](self, "_updateNowPlayingButtonVisibility");
    -[MCDBrowsableContentNavigationController _loadAllHostTabs](self, "_loadAllHostTabs");
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MCDBrowsableContentNavigationController;
  -[MCDBrowsableContentNavigationController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[MCDBrowsableContentNavigationController setVisible:](self, "setVisible:", 0);
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  NSObject *v5;
  uint8_t v6[16];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MCDBrowsableContentNavigationController;
  -[MCDBrowsableContentNavigationController traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, a3);
  -[MCDBrowsableContentNavigationController traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCDBrowsableContentNavigationController setHasCarScreen:](self, "setHasCarScreen:", objc_msgSend(v4, "userInterfaceIdiom") == 3);

  MCDGeneralLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_22FBAA000, v5, OS_LOG_TYPE_DEFAULT, "traitCollectionDidChange is called", v6, 2u);
  }

}

- (MCDPCContainer)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
  objc_storeStrong((id *)&self->_container, a3);
}

- (UITabBarController)tabBarController
{
  return self->_tabBarController;
}

- (void)setTabBarController:(id)a3
{
  objc_storeStrong((id *)&self->_tabBarController, a3);
}

- (MCDPCModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (CPUINowPlayingButtonWrapperView)nowPlayingButtonView
{
  return self->_nowPlayingButtonView;
}

- (void)setNowPlayingButtonView:(id)a3
{
  objc_storeStrong((id *)&self->_nowPlayingButtonView, a3);
}

- (BOOL)hasCarScreen
{
  return self->_hasCarScreen;
}

- (void)setHasCarScreen:(BOOL)a3
{
  self->_hasCarScreen = a3;
}

- (BOOL)didFinishInitialLoad
{
  return self->_didFinishInitialLoad;
}

- (void)setDidFinishInitialLoad:(BOOL)a3
{
  self->_didFinishInitialLoad = a3;
}

- (BOOL)didFinishInitialViewAppear
{
  return self->_didFinishInitialViewAppear;
}

- (void)setDidFinishInitialViewAppear:(BOOL)a3
{
  self->_didFinishInitialViewAppear = a3;
}

- (BOOL)visible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (BOOL)hasInvalidatedDummyTabs
{
  return self->_hasInvalidatedDummyTabs;
}

- (void)setHasInvalidatedDummyTabs:(BOOL)a3
{
  self->_hasInvalidatedDummyTabs = a3;
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
  objc_storeStrong((id *)&self->_nowPlayingButtonView, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_tabBarController, 0);
  objc_storeStrong((id *)&self->_container, 0);
}

@end

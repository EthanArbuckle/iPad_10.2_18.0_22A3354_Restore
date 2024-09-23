@implementation ASOOverlayViewController

- (ASOOverlayViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  ASOOverlayViewController *v4;
  ASOOverlayViewController *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *viewServiceQueue;
  NSOperationQueue *v9;
  NSOperationQueue *presentationQueue;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)ASOOverlayViewController;
  v4 = -[UIApplicationRotationFollowingController initWithNibName:bundle:](&v12, sel_initWithNibName_bundle_, 0, 0);
  v5 = v4;
  if (v4)
  {
    v4->_isViewServiceLoading = 0;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.AppStoreOverlays.viewServiceLoader", v6);
    viewServiceQueue = v5->_viewServiceQueue;
    v5->_viewServiceQueue = (OS_dispatch_queue *)v7;

    v9 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    presentationQueue = v5->_presentationQueue;
    v5->_presentationQueue = v9;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v5->_presentationQueue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setSuspended:](v5->_presentationQueue, "setSuspended:", 1);
  }
  return v5;
}

- (void)viewDidLoad
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)ASOOverlayViewController;
  -[ASOOverlayViewController viewDidLoad](&v12, sel_viewDidLoad);
  -[ASOOverlayViewController setViewRespectsSystemMinimumLayoutMargins:](self, "setViewRespectsSystemMinimumLayoutMargins:", 0);
  -[ASOOverlayViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInsetsLayoutMarginsFromSafeArea:", 0);

  v4 = *MEMORY[0x24BDF7718];
  v5 = *(double *)(MEMORY[0x24BDF7718] + 8);
  v6 = *(double *)(MEMORY[0x24BDF7718] + 16);
  v7 = *(double *)(MEMORY[0x24BDF7718] + 24);
  -[ASOOverlayViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLayoutMargins:", v4, v5, v6, v7);

  -[ASOOverlayViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setUserInteractionEnabled:", 0);

  -[ASOOverlayViewController loadViewServiceIfNeeded](self, "loadViewServiceIfNeeded");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:selector:name:object:", self, sel_didEnterBackground, *MEMORY[0x24BDF7528], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:selector:name:object:", self, sel_didEnterBackground, *MEMORY[0x24BDD0C18], 0);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)ASOOverlayViewController;
  -[ASOOverlayViewController viewDidLayoutSubviews](&v23, sel_viewDidLayoutSubviews);
  -[ASOOverlayViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[ASOOverlayViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layoutMargins");
  v14 = v5 + v13;
  v16 = v7 + v15;
  v18 = v9 - (v13 + v17);
  v20 = v11 - (v15 + v19);

  -[ASOOverlayViewController remoteViewController](self, "remoteViewController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setFrame:", v14, v16, v18, v20);

}

- (void)presentOverlay:(id)a3
{
  id v4;
  void *v5;
  ASORemoteOverlay *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  ASOViewRenderOverlayRequested();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASOOverlayViewController loadViewServiceIfNeeded](self, "loadViewServiceIfNeeded");
  v6 = -[ASORemoteOverlay initWithOverlay:contextProvider:hostSpan:]([ASORemoteOverlay alloc], "initWithOverlay:contextProvider:hostSpan:", v4, self, v5);
  -[ASOOverlayViewController presentationQueue](self, "presentationQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASORemoteOverlay presentOverlayOperation](v6, "presentOverlayOperation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addOperation:", v8);

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "overlayConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASOOverlayViewController presentationQueue](self, "presentationQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412802;
    v12 = v4;
    v13 = 2112;
    v14 = v9;
    v15 = 2048;
    v16 = objc_msgSend(v10, "operationCount");
    _os_log_impl(&dword_20D888000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Queue the presentation of %@ with configuration %@ (queue size: %lu)", (uint8_t *)&v11, 0x20u);

  }
}

- (void)dismissOverlay
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  -[ASOOverlayViewController presentationQueue](self, "presentationQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ASORemoteOverlay dismissOverlayOperationWithContextProvider:](ASORemoteOverlay, "dismissOverlayOperationWithContextProvider:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addOperation:", v4);

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    -[ASOOverlayViewController presentationQueue](self, "presentationQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 134217984;
    v7 = objc_msgSend(v5, "operationCount");
    _os_log_impl(&dword_20D888000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "View controller did queue dismissal (queue size: %lu)", (uint8_t *)&v6, 0xCu);

  }
}

- (void)failAllQueuedOverlaysWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t i;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "localizedDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v24 = v5;
    _os_log_impl(&dword_20D888000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Sending failed events to all overlays because of error: %@", buf, 0xCu);

  }
  -[ASOOverlayViewController presentationQueue](self, "presentationQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSuspended:", 1);

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[ASOOverlayViewController presentationQueue](self, "presentationQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "operations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v19;
    v13 = MEMORY[0x24BDACB70];
    *(_QWORD *)&v10 = 138412290;
    v17 = v10;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v8);
        v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if ((objc_msgSend(v15, "isCancelled", v17) & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v17;
              v24 = v15;
              _os_log_impl(&dword_20D888000, v13, OS_LOG_TYPE_INFO, "Cancelling operation in presentation queue: %@", buf, 0xCu);
            }
            objc_msgSend(v15, "remoteOverlay");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "finishWithError:", v4);

          }
          objc_msgSend(v15, "cancel");
        }
      }
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

}

- (void)loadViewServiceIfNeeded
{
  NSObject *v3;
  _QWORD block[5];

  -[ASOOverlayViewController viewServiceQueue](self, "viewServiceQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__ASOOverlayViewController_loadViewServiceIfNeeded__block_invoke;
  block[3] = &unk_24C7D7E08;
  block[4] = self;
  dispatch_async(v3, block);

}

void __51__ASOOverlayViewController_loadViewServiceIfNeeded__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  dispatch_time_t v5;
  _QWORD v6[4];
  NSObject *v7;

  v2 = dispatch_group_create();
  dispatch_group_enter(v2);
  v3 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __51__ASOOverlayViewController_loadViewServiceIfNeeded__block_invoke_2;
  v6[3] = &unk_24C7D7F40;
  v7 = v2;
  v4 = v2;
  objc_msgSend(v3, "_loadViewServiceIfNeeded:", v6);
  v5 = dispatch_time(0, 10000000000);
  dispatch_group_wait(v4, v5);

}

void __51__ASOOverlayViewController_loadViewServiceIfNeeded__block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)_loadViewServiceIfNeeded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  _BOOL4 v10;
  __int16 v11;
  _BOOL4 v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ASOOverlayViewController remoteViewController](self, "remoteViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

    goto LABEL_4;
  }
  if (-[ASOOverlayViewController isViewServiceLoading](self, "isViewServiceLoading"))
  {
LABEL_4:
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      -[ASOOverlayViewController remoteViewController](self, "remoteViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109376;
      v10 = v6 != 0;
      v11 = 1024;
      v12 = -[ASOOverlayViewController isViewServiceLoading](self, "isViewServiceLoading");
      _os_log_impl(&dword_20D888000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Not loading view service because the service is already loaded (%d) or is currently loading (%d)", buf, 0xEu);

    }
    goto LABEL_9;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D888000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Attempt to start loading overlay view service", buf, 2u);
  }
  -[ASOOverlayViewController setIsViewServiceLoading:](self, "setIsViewServiceLoading:", 1);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __53__ASOOverlayViewController__loadViewServiceIfNeeded___block_invoke;
  v7[3] = &unk_24C7D7F90;
  v7[4] = self;
  v8 = v4;
  -[ASOOverlayViewController _loadRemoteViewController:](self, "_loadRemoteViewController:", v7);

LABEL_9:
}

void __53__ASOOverlayViewController__loadViewServiceIfNeeded___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
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
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D888000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Did finish view service load attempt", buf, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "setIsViewServiceLoading:", 0);
  if (v7 && v8 && !v9)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D888000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Successfully loaded view service", buf, 2u);
    }
    objc_msgSend(*(id *)(a1 + 32), "setRemoteViewController:", v7);
    objc_msgSend(*(id *)(a1 + 32), "addChildViewController:", v7);
    objc_msgSend(*(id *)(a1 + 32), "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v11);

    objc_msgSend(v7, "didMoveToParentViewController:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setNeedsLayout");

    objc_msgSend(*(id *)(a1 + 32), "setContext:", v8);
    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __53__ASOOverlayViewController__loadViewServiceIfNeeded___block_invoke_14;
    v19[3] = &unk_24C7D7F68;
    objc_copyWeak(&v20, (id *)buf);
    objc_msgSend(*(id *)(a1 + 32), "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_auxiliaryConnection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setInvalidationHandler:", v19);

    objc_msgSend(*(id *)(a1 + 32), "presentationQueue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setSuspended:", 0);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "localizedDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v22 = v16;
      _os_log_impl(&dword_20D888000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "An error occurred while loading the view service: %@", buf, 0xCu);

    }
    v17 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SKErrorDomain"), 0, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "failAllQueuedOverlaysWithError:", v18);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __53__ASOOverlayViewController__loadViewServiceIfNeeded___block_invoke_14(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint8_t v8[16];

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_20D888000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Extension auxiliary connection invalidated", v8, 2u);
  }
  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SKErrorDomain"), 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "failAllQueuedOverlaysWithError:", v4);

  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "remoteViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "disconnect");

}

- (void)_loadRemoteViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x24BDD1550];
  v10 = *MEMORY[0x24BDD0C30];
  v11[0] = CFSTR("com.apple.AppStoreOverlays.ViewService");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __54__ASOOverlayViewController__loadRemoteViewController___block_invoke;
  v8[3] = &unk_24C7D8008;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "extensionsWithMatchingAttributes:completion:", v6, v8);

}

void __54__ASOOverlayViewController__loadRemoteViewController___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD block[4];
  id v13;
  uint64_t v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v5, "count");
  if (v6 || !v7)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "localizedDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v17 = v11;
      _os_log_impl(&dword_20D888000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Unable to find the overlay view service extension with error: %@", buf, 0xCu);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v5;
      _os_log_impl(&dword_20D888000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Did find overlay view service extension: %@", buf, 0xCu);
    }
    objc_msgSend(v5, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __54__ASOOverlayViewController__loadRemoteViewController___block_invoke_20;
    block[3] = &unk_24C7D7FE0;
    v13 = v8;
    v9 = *(id *)(a1 + 40);
    v14 = *(_QWORD *)(a1 + 32);
    v15 = v9;
    v10 = v8;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

void __54__ASOOverlayViewController__loadRemoteViewController___block_invoke_20(uint64_t a1)
{
  void *v2;
  id v3;
  int8x16_t v4;
  _QWORD v5[4];
  int8x16_t v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __54__ASOOverlayViewController__loadRemoteViewController___block_invoke_2;
  v5[3] = &unk_24C7D7FB8;
  v7 = *(id *)(a1 + 48);
  v4 = *(int8x16_t *)(a1 + 32);
  v3 = (id)v4.i64[0];
  v6 = vextq_s8(v4, v4, 8uLL);
  objc_msgSend(v2, "instantiateViewControllerWithInputItems:connectionHandler:", MEMORY[0x24BDBD1A8], v5);

}

void __54__ASOOverlayViewController__loadRemoteViewController___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void (*v13)(void);
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v8 || v9)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v10, "localizedDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412290;
      v15 = v12;
      _os_log_impl(&dword_20D888000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Unable to instantiate remote view controller with error: %@", (uint8_t *)&v14, 0xCu);

    }
    v13 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412290;
      v15 = v8;
      _os_log_impl(&dword_20D888000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Remote view controller (%@) is not an ASORemoteViewController", (uint8_t *)&v14, 0xCu);
    }
    v13 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
LABEL_15:
    v13();
    goto LABEL_16;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    LOWORD(v14) = 0;
    _os_log_impl(&dword_20D888000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Did instantiate remote view controller.", (uint8_t *)&v14, 2u);
  }
  objc_msgSend(v8, "setDelegate:", *(_QWORD *)(a1 + 32));
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v14 = 138412290;
    v15 = v7;
    _os_log_impl(&dword_20D888000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Getting context for extension (request UUID: %@)", (uint8_t *)&v14, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 40), "_extensionContextForUUID:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

LABEL_16:
}

- (void)willStartPresentingOverlay:(id)a3 transitionContext:(id)a4
{
  id v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_20D888000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Will start presenting overlay %@.", (uint8_t *)&v7, 0xCu);
  }
  -[ASOOverlayViewController setCurrentOverlay:](self, "setCurrentOverlay:", v5);
  -[ASOOverlayViewController overlayManager](self, "overlayManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "willStartPresentingOverlay");

}

- (void)didFinishDismissingOverlay:(id)a3
{
  void *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v6 = 138412290;
    v7 = a3;
    _os_log_impl(&dword_20D888000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Did finish presenting overlay %@.", (uint8_t *)&v6, 0xCu);
  }
  -[ASOOverlayViewController setCurrentOverlay:](self, "setCurrentOverlay:", 0);
  -[ASOOverlayViewController overlayManager](self, "overlayManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didFinishDismissingOverlay");

}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[ASOOverlayViewController remoteViewController](self, "remoteViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "willMoveToParentViewController:", 0);

  -[ASOOverlayViewController remoteViewController](self, "remoteViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeFromSuperview");

  -[ASOOverlayViewController remoteViewController](self, "remoteViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "didMoveToParentViewController:", 0);

  -[ASOOverlayViewController setContext:](self, "setContext:", 0);
  -[ASOOverlayViewController setRemoteViewController:](self, "setRemoteViewController:", 0);
  -[ASOOverlayViewController presentationQueue](self, "presentationQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSuspended:", 1);

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SKErrorDomain"), 0, 0);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[ASOOverlayViewController currentOverlay](self, "currentOverlay");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[ASOOverlayViewController currentOverlay](self, "currentOverlay");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "finishWithError:", v12);

    -[ASOOverlayViewController setCurrentOverlay:](self, "setCurrentOverlay:", 0);
    -[ASOOverlayViewController overlayManager](self, "overlayManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "didFinishDismissingOverlay");

  }
}

- (void)didReceiveMemoryWarning
{
  uint8_t v3[16];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ASOOverlayViewController;
  -[ASOOverlayViewController didReceiveMemoryWarning](&v4, sel_didReceiveMemoryWarning);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_20D888000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "App hosting overlay did receive memory warning", v3, 2u);
  }
  -[ASOOverlayViewController shutdownViewServiceIfOverlayOffScreen](self, "shutdownViewServiceIfOverlayOffScreen");
}

- (void)didEnterBackground
{
  uint8_t v3[16];

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_20D888000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "App hosting overlay did enter background", v3, 2u);
  }
  -[ASOOverlayViewController shutdownViewServiceIfOverlayOffScreen](self, "shutdownViewServiceIfOverlayOffScreen");
}

- (void)shutdownViewServiceIfOverlayOffScreen
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  id v6;
  uint8_t v7[16];
  uint8_t buf[16];

  -[ASOOverlayViewController currentOverlay](self, "currentOverlay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v4)
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_20D888000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Not shutting down view service because overlay is on-screen", v7, 2u);
    }
  }
  else
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D888000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Shutting down view service because overlay is off-screen", buf, 2u);
    }
    -[ASOOverlayViewController remoteViewController](self, "remoteViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "disconnect");

  }
}

- (ASORemoteViewController)remoteViewController
{
  return self->_remoteViewController;
}

- (void)setRemoteViewController:(id)a3
{
  objc_storeStrong((id *)&self->_remoteViewController, a3);
}

- (ASOHostContext)context
{
  return (ASOHostContext *)objc_loadWeakRetained((id *)&self->_context);
}

- (void)setContext:(id)a3
{
  objc_storeWeak((id *)&self->_context, a3);
}

- (ASORemoteOverlay)currentOverlay
{
  return self->_currentOverlay;
}

- (void)setCurrentOverlay:(id)a3
{
  objc_storeStrong((id *)&self->_currentOverlay, a3);
}

- (OS_dispatch_queue)viewServiceQueue
{
  return self->_viewServiceQueue;
}

- (void)setViewServiceQueue:(id)a3
{
  objc_storeStrong((id *)&self->_viewServiceQueue, a3);
}

- (BOOL)isViewServiceLoading
{
  return self->_isViewServiceLoading;
}

- (void)setIsViewServiceLoading:(BOOL)a3
{
  self->_isViewServiceLoading = a3;
}

- (NSOperationQueue)presentationQueue
{
  return self->_presentationQueue;
}

- (void)setPresentationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_presentationQueue, a3);
}

- (ASOOverlayManager)overlayManager
{
  return (ASOOverlayManager *)objc_loadWeakRetained((id *)&self->_overlayManager);
}

- (void)setOverlayManager:(id)a3
{
  objc_storeWeak((id *)&self->_overlayManager, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_overlayManager);
  objc_storeStrong((id *)&self->_presentationQueue, 0);
  objc_storeStrong((id *)&self->_viewServiceQueue, 0);
  objc_storeStrong((id *)&self->_currentOverlay, 0);
  objc_destroyWeak((id *)&self->_context);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
}

@end

@implementation NUArticleViewController

- (NUArticleViewController)initWithArticleDataProvider:(id)a3 scrollViewController:(id)a4 appStateMonitor:(id)a5 keyCommandManager:(id)a6 loadingListeners:(id)a7 headerBlueprintProvider:(id)a8 debugSettingsProvider:(id)a9 videoPlayerViewControllerManager:(id)a10 articleScrollPositionManager:(id)a11 chromeControl:(id)a12 spotlightManager:(id)a13
{
  id v18;
  id v19;
  id v20;
  NUArticleViewController *v21;
  FCObservable *v22;
  FCObservable *articleViewStyler;
  NFEventManager *v24;
  NFEventManager *eventManager;
  uint64_t v26;
  UIScrollView *scrollView;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NFEventManager *v33;
  uint64_t v34;
  NFEventManager *v35;
  NFEventManager *v36;
  NFEventManager *v37;
  NFEventManager *v38;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v51;
  id v52;
  _QWORD v53[4];
  id v54;
  _QWORD v55[4];
  id v56;
  _QWORD v57[4];
  id v58;
  _QWORD v59[4];
  id v60;
  _QWORD v61[4];
  id v62;
  id location;
  objc_super v64;

  v49 = a3;
  v18 = a6;
  v51 = a4;
  v19 = a5;
  v52 = a6;
  v48 = a7;
  v41 = a8;
  v47 = a8;
  v20 = a9;
  v46 = a10;
  v45 = a11;
  v44 = a12;
  v43 = a13;
  v64.receiver = self;
  v64.super_class = (Class)NUArticleViewController;
  v21 = -[NUArticleViewController init](&v64, sel_init);
  if (v21)
  {
    v22 = (FCObservable *)objc_alloc_init(MEMORY[0x24BE6CC80]);
    articleViewStyler = v21->_articleViewStyler;
    v21->_articleViewStyler = v22;

    v24 = (NFEventManager *)objc_alloc_init(MEMORY[0x24BE6CF58]);
    eventManager = v21->_eventManager;
    v21->_eventManager = v24;

    objc_storeStrong((id *)&v21->_articleDataProvider, a3);
    objc_storeStrong((id *)&v21->_keyCommandManager, v18);
    objc_storeStrong((id *)&v21->_debugSettingsProvider, a9);
    objc_storeStrong((id *)&v21->_videoPlayerViewControllerManager, a10);
    objc_storeStrong((id *)&v21->_articleScrollPositionManager, a11);
    objc_storeStrong((id *)&v21->_chromeControl, a12);
    objc_storeStrong((id *)&v21->_spotlightManager, a13);
    objc_msgSend(v20, "addObserver:", v21);
    objc_storeStrong((id *)&v21->_scrollViewController, a4);
    objc_msgSend(v51, "scrollView");
    v26 = objc_claimAutoreleasedReturnValue();
    scrollView = v21->_scrollView;
    v21->_scrollView = (UIScrollView *)v26;

    -[UIScrollView setAllowsKeyboardScrolling:](v21->_scrollView, "setAllowsKeyboardScrolling:", 0);
    -[SXScrollViewController setDelegate:](v21->_scrollViewController, "setDelegate:", v21);
    objc_msgSend(v51, "scrollView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "registerScrollView:", v28);

    objc_storeStrong((id *)&v21->_loadingListeners, a7);
    objc_storeStrong((id *)&v21->_documentSectionBlueprintProvider, v41);
    v21->_presentationMode = 1;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addObserver:selector:name:object:", v21, sel_applicationWillEnterForeground_, *MEMORY[0x24BDF75D0], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addObserver:selector:name:object:", v21, sel_applicationDidBecomeActive_, *MEMORY[0x24BDF7510], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addObserver:selector:name:object:", v21, sel_nowPlayingWillDisappear_, CFSTR("NUNowPlayingViewControllerWillDisappearNotification"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addObserver:selector:name:object:", v21, sel_nowPlayingDidDisappear_, CFSTR("NUNowPlayingViewControllerDidDisappearNotification"), 0);

    objc_initWeak(&location, v21);
    v33 = v21->_eventManager;
    v34 = MEMORY[0x24BDAC760];
    v61[0] = MEMORY[0x24BDAC760];
    v61[1] = 3221225472;
    v61[2] = __266__NUArticleViewController_initWithArticleDataProvider_scrollViewController_appStateMonitor_keyCommandManager_loadingListeners_headerBlueprintProvider_debugSettingsProvider_videoPlayerViewControllerManager_articleScrollPositionManager_chromeControl_spotlightManager___block_invoke;
    v61[3] = &unk_24D5A2B30;
    objc_copyWeak(&v62, &location);
    -[NFEventManager triggerOnEvent:block:](v33, "triggerOnEvent:block:", CFSTR("appWillEnterForegroundEvent"), v61);
    v35 = v21->_eventManager;
    v59[0] = v34;
    v59[1] = 3221225472;
    v59[2] = __266__NUArticleViewController_initWithArticleDataProvider_scrollViewController_appStateMonitor_keyCommandManager_loadingListeners_headerBlueprintProvider_debugSettingsProvider_videoPlayerViewControllerManager_articleScrollPositionManager_chromeControl_spotlightManager___block_invoke_2;
    v59[3] = &unk_24D5A2B30;
    objc_copyWeak(&v60, &location);
    -[NFEventManager triggerOnEvent:block:](v35, "triggerOnEvent:block:", CFSTR("nowPlayingWillDisappearEvent"), v59);
    v42 = v20;
    v36 = v21->_eventManager;
    v57[0] = v34;
    v57[1] = 3221225472;
    v57[2] = __266__NUArticleViewController_initWithArticleDataProvider_scrollViewController_appStateMonitor_keyCommandManager_loadingListeners_headerBlueprintProvider_debugSettingsProvider_videoPlayerViewControllerManager_articleScrollPositionManager_chromeControl_spotlightManager___block_invoke_3;
    v57[3] = &unk_24D5A2B30;
    objc_copyWeak(&v58, &location);
    -[NFEventManager triggerOnEvent:block:](v36, "triggerOnEvent:block:", CFSTR("viewWillAppearEvent"), v57);
    v37 = v21->_eventManager;
    v55[0] = v34;
    v55[1] = 3221225472;
    v55[2] = __266__NUArticleViewController_initWithArticleDataProvider_scrollViewController_appStateMonitor_keyCommandManager_loadingListeners_headerBlueprintProvider_debugSettingsProvider_videoPlayerViewControllerManager_articleScrollPositionManager_chromeControl_spotlightManager___block_invoke_4;
    v55[3] = &unk_24D5A2B30;
    objc_copyWeak(&v56, &location);
    -[NFEventManager triggerOnEvent:block:](v37, "triggerOnEvent:block:", CFSTR("viewWillAppearEvent"), v55);
    v38 = v21->_eventManager;
    v53[0] = v34;
    v53[1] = 3221225472;
    v53[2] = __266__NUArticleViewController_initWithArticleDataProvider_scrollViewController_appStateMonitor_keyCommandManager_loadingListeners_headerBlueprintProvider_debugSettingsProvider_videoPlayerViewControllerManager_articleScrollPositionManager_chromeControl_spotlightManager___block_invoke_5;
    v53[3] = &unk_24D5A2B30;
    objc_copyWeak(&v54, &location);
    -[NFEventManager triggerOnEvent:block:](v38, "triggerOnEvent:block:", CFSTR("viewDidDisappearEvent"), v53);
    objc_destroyWeak(&v54);
    objc_destroyWeak(&v56);
    objc_destroyWeak(&v58);
    objc_destroyWeak(&v60);
    objc_destroyWeak(&v62);
    objc_destroyWeak(&location);
    v20 = v42;
  }

  return v21;
}

void __266__NUArticleViewController_initWithArticleDataProvider_scrollViewController_appStateMonitor_keyCommandManager_loadingListeners_headerBlueprintProvider_debugSettingsProvider_videoPlayerViewControllerManager_articleScrollPositionManager_chromeControl_spotlightManager___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "scrollToAudioPositionAndHideMessageAfterEvent:", CFSTR("appDidEnterForegroundEvent"));

}

void __266__NUArticleViewController_initWithArticleDataProvider_scrollViewController_appStateMonitor_keyCommandManager_loadingListeners_headerBlueprintProvider_debugSettingsProvider_videoPlayerViewControllerManager_articleScrollPositionManager_chromeControl_spotlightManager___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "scrollToAudioPositionAndHideMessageAfterEvent:", CFSTR("nowPlayingDidDisappearEvent"));

}

void __266__NUArticleViewController_initWithArticleDataProvider_scrollViewController_appStateMonitor_keyCommandManager_loadingListeners_headerBlueprintProvider_debugSettingsProvider_videoPlayerViewControllerManager_articleScrollPositionManager_chromeControl_spotlightManager___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "scrollToAudioPositionAndHideMessageAfterEvent:", CFSTR("viewDidAppearEvent"));

}

void __266__NUArticleViewController_initWithArticleDataProvider_scrollViewController_appStateMonitor_keyCommandManager_loadingListeners_headerBlueprintProvider_debugSettingsProvider_videoPlayerViewControllerManager_articleScrollPositionManager_chromeControl_spotlightManager___block_invoke_4(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "articleDataProvider");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setRelativePriority:", 1);

}

void __266__NUArticleViewController_initWithArticleDataProvider_scrollViewController_appStateMonitor_keyCommandManager_loadingListeners_headerBlueprintProvider_debugSettingsProvider_videoPlayerViewControllerManager_articleScrollPositionManager_chromeControl_spotlightManager___block_invoke_5(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "articleDataProvider");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setRelativePriority:", 0);

}

- (void)viewDidLoad
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
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
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
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  _QWORD v57[4];
  id v58;
  _QWORD v59[4];
  id v60;
  _QWORD v61[4];
  id v62;
  _QWORD v63[4];
  id v64;
  _QWORD v65[4];
  id v66;
  _QWORD v67[4];
  id v68;
  _QWORD v69[4];
  id v70;
  id location;
  objc_super v72;
  const __CFString *v73;
  _QWORD v74[2];
  _QWORD v75[3];

  v75[1] = *MEMORY[0x24BDAC8D0];
  v72.receiver = self;
  v72.super_class = (Class)NUArticleViewController;
  -[NUArticleViewController viewDidLoad](&v72, sel_viewDidLoad);
  -[NUArticleViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  -[NUArticleViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPreservesSuperviewLayoutMargins:", 1);

  -[NUArticleViewController scrollViewController](self, "scrollViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUArticleViewController addChildViewController:](self, "addChildViewController:", v6);

  -[NUArticleViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUArticleViewController scrollViewController](self, "scrollViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v9);

  -[NUArticleViewController scrollViewController](self, "scrollViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "didMoveToParentViewController:", self);

  -[NUArticleViewController scrollViewController](self, "scrollViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "scrollView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_setContentInsetAdjustmentBehavior:", 2);

  -[NUArticleViewController scrollViewController](self, "scrollViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "scrollView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_setIndicatorInsetAdjustmentBehavior:", 1);

  -[NUArticleViewController scrollViewController](self, "scrollViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "scrollView");
  v16 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v16, "_accessibilitySetOpaqueElementScrollsContentIntoView:", 1);

  -[NUArticleViewController loadingDelegate](self, "loadingDelegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v16) = objc_opt_respondsToSelector();

  if ((v16 & 1) != 0)
  {
    -[NUArticleViewController loadingDelegate](self, "loadingDelegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "loadingWillStart");

  }
  -[NUArticleViewController loadingDelegate](self, "loadingDelegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_opt_respondsToSelector();

  if ((v20 & 1) != 0)
  {
    -[NUArticleViewController loadingDelegate](self, "loadingDelegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "loadingDidStart");

  }
  objc_initWeak(&location, self);
  -[NUArticleViewController eventManager](self, "eventManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)MEMORY[0x24BDBCF20];
  v75[0] = CFSTR("silexContextDidLoadEvent");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v75, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setWithArray:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v69[0] = MEMORY[0x24BDAC760];
  v69[1] = 3221225472;
  v69[2] = __38__NUArticleViewController_viewDidLoad__block_invoke;
  v69[3] = &unk_24D5A2B30;
  objc_copyWeak(&v70, &location);
  objc_msgSend(v22, "triggerOnceWhenAllEventsHaveOccurred:block:", v25, v69);

  -[NUArticleViewController eventManager](self, "eventManager");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)MEMORY[0x24BDBCF20];
  v74[0] = CFSTR("viewDidAppearEvent");
  v74[1] = CFSTR("silexContextDidLoadEvent");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v74, 2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setWithArray:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v67[0] = MEMORY[0x24BDAC760];
  v67[1] = 3221225472;
  v67[2] = __38__NUArticleViewController_viewDidLoad__block_invoke_3;
  v67[3] = &unk_24D5A2B30;
  objc_copyWeak(&v68, &location);
  objc_msgSend(v26, "triggerAlwaysWhenAllEventsHaveOccurred:block:", v29, v67);

  -[NUArticleViewController eventManager](self, "eventManager");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)MEMORY[0x24BDBCF20];
  v73 = CFSTR("viewDidDisappearEvent");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v73, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setWithArray:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v65[0] = MEMORY[0x24BDAC760];
  v65[1] = 3221225472;
  v65[2] = __38__NUArticleViewController_viewDidLoad__block_invoke_5;
  v65[3] = &unk_24D5A2B30;
  objc_copyWeak(&v66, &location);
  objc_msgSend(v30, "triggerAlwaysWhenAllEventsHaveOccurred:block:", v33, v65);

  -[NUArticleViewController documentSectionBlueprintProvider](self, "documentSectionBlueprintProvider");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "observableHeaderBlueprint");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v63[0] = MEMORY[0x24BDAC760];
  v63[1] = 3221225472;
  v63[2] = __38__NUArticleViewController_viewDidLoad__block_invoke_7;
  v63[3] = &unk_24D5A2B58;
  objc_copyWeak(&v64, &location);
  objc_msgSend(v35, "observe:", v63);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "disposeOn:", self);

  -[NUArticleViewController documentSectionBlueprintProvider](self, "documentSectionBlueprintProvider");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "observableContentOverlayBlueprintData");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v61[0] = MEMORY[0x24BDAC760];
  v61[1] = 3221225472;
  v61[2] = __38__NUArticleViewController_viewDidLoad__block_invoke_9;
  v61[3] = &unk_24D5A2B80;
  objc_copyWeak(&v62, &location);
  objc_msgSend(v38, "observe:", v61);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "disposeOn:", self);

  -[NUArticleViewController documentSectionBlueprintProvider](self, "documentSectionBlueprintProvider");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "observableFooterBlueprint");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v59[0] = MEMORY[0x24BDAC760];
  v59[1] = 3221225472;
  v59[2] = __38__NUArticleViewController_viewDidLoad__block_invoke_11;
  v59[3] = &unk_24D5A2B58;
  objc_copyWeak(&v60, &location);
  objc_msgSend(v41, "observe:", v59);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "disposeOn:", self);

  -[NUArticleViewController documentSectionBlueprintProvider](self, "documentSectionBlueprintProvider");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "observableHeaderBlueprint");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "value");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUArticleViewController updateScrollViewControllerWithHeaderBlueprint:](self, "updateScrollViewControllerWithHeaderBlueprint:", v45);

  -[NUArticleViewController documentSectionBlueprintProvider](self, "documentSectionBlueprintProvider");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "observableContentOverlayBlueprintData");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "value");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "blueprint");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUArticleViewController documentSectionBlueprintProvider](self, "documentSectionBlueprintProvider");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "observableContentOverlayBlueprintData");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "value");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "topOffset");
  -[NUArticleViewController updateScrollViewControllerWithContentOverlayBlueprint:topOffset:](self, "updateScrollViewControllerWithContentOverlayBlueprint:topOffset:", v49);

  -[NUArticleViewController documentSectionBlueprintProvider](self, "documentSectionBlueprintProvider");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "observableFooterBlueprint");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "value");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUArticleViewController updateScrollViewControllerWithFooterBlueprint:](self, "updateScrollViewControllerWithFooterBlueprint:", v55);

  -[NUArticleViewController articleDataProvider](self, "articleDataProvider");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57[0] = MEMORY[0x24BDAC760];
  v57[1] = 3221225472;
  v57[2] = __38__NUArticleViewController_viewDidLoad__block_invoke_13;
  v57[3] = &unk_24D5A2BF8;
  objc_copyWeak(&v58, &location);
  objc_msgSend(v56, "loadContextWithCompletionBlock:", v57);

  objc_destroyWeak(&v58);
  objc_destroyWeak(&v60);
  objc_destroyWeak(&v62);
  objc_destroyWeak(&v64);
  objc_destroyWeak(&v66);
  objc_destroyWeak(&v68);
  objc_destroyWeak(&v70);
  objc_destroyWeak(&location);
}

void __38__NUArticleViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v9 = WeakRetained;
    v2 = WeakRetained;
    objc_msgSend(v2, "loadingDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_respondsToSelector();

    if ((v4 & 1) != 0)
    {
      objc_msgSend(v2, "loadingDelegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "loadingWillFinishWithError:", 0);

    }
    objc_msgSend(v2, "loadingDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      objc_msgSend(v2, "loadingDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "loadingDidFinishWithError:", 0);

    }
    WeakRetained = v9;
  }

}

void __38__NUArticleViewController_viewDidLoad__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "articleDataProvider");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "prefetchAssets");

    WeakRetained = v3;
  }

}

void __38__NUArticleViewController_viewDidLoad__block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "articleDataProvider");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "cancelAssetPrefetch");

    WeakRetained = v3;
  }

}

void __38__NUArticleViewController_viewDidLoad__block_invoke_7(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "updateScrollViewControllerWithHeaderBlueprint:", v5);

}

void __38__NUArticleViewController_viewDidLoad__block_invoke_9(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(v7, "blueprint");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "topOffset");
    objc_msgSend(v5, "updateScrollViewControllerWithContentOverlayBlueprint:topOffset:", v6);

  }
}

void __38__NUArticleViewController_viewDidLoad__block_invoke_11(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "updateScrollViewControllerWithFooterBlueprint:", v5);

}

void __38__NUArticleViewController_viewDidLoad__block_invoke_13(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  char v27;
  _QWORD v28[5];
  id v29;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    v12 = WeakRetained;
    objc_msgSend(v12, "articleDataProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "article");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "headline");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v12, "scrollView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v12, "useTransparentNavigationBar");
      objc_msgSend(v12, "nu_adjustInsetsForScrollView:transparentNavigationBar:withEdgeInsets:", v16, v17, *MEMORY[0x24BDF7718], *(double *)(MEMORY[0x24BDF7718] + 8), *(double *)(MEMORY[0x24BDF7718] + 16), *(double *)(MEMORY[0x24BDF7718] + 24));

    }
    if (!v7 || v9)
    {
      objc_msgSend(v12, "loadingDelegate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_opt_respondsToSelector();

      if ((v24 & 1) != 0)
      {
        objc_msgSend(v12, "loadingDelegate");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "loadingWillFinishWithError:", v9);

      }
      objc_msgSend(v12, "loadingDelegate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_opt_respondsToSelector();

      if ((v27 & 1) == 0)
        goto LABEL_15;
      objc_msgSend(v12, "loadingDelegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "loadingDidFinishWithError:", v9);
    }
    else
    {
      objc_msgSend(v12, "articleDataProvider");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "article");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "headline");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "videoURL");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v12, "shouldAutoPlayVideo") && v21)
      {
        objc_msgSend(v12, "videoPlayerViewControllerManager");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "configureAutoplayForVideoWithURL:analyticsRouter:", v21, 0);

        objc_msgSend(v12, "setShouldAutoPlayVideo:", 0);
      }
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __38__NUArticleViewController_viewDidLoad__block_invoke_15;
      v28[3] = &unk_24D5A1D30;
      v28[4] = v12;
      v29 = v7;
      objc_msgSend(v8, "registerFontsWithCompletion:", v28);

    }
LABEL_15:

  }
}

void __38__NUArticleViewController_viewDidLoad__block_invoke_15(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  CFTimeInterval v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  UIAccessibilityNotifications v41;
  void *v42;
  void *v43;
  _QWORD v44[4];
  id v45;
  CFTimeInterval v46;
  _QWORD v47[5];
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  const __CFString *v52;
  uint8_t buf[4];
  void *v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "loadingListeners");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v49;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v49 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v6);
        objc_msgSend(*(id *)(a1 + 32), "articleDataProvider");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "article");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "didLoadArticle:withContext:", v9, *(_QWORD *)(a1 + 40));

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
    }
    while (v4);
  }

  v10 = MEMORY[0x24BDAC760];
  v47[0] = MEMORY[0x24BDAC760];
  v47[1] = 3221225472;
  v47[2] = __38__NUArticleViewController_viewDidLoad__block_invoke_16;
  v47[3] = &unk_24D5A2BA8;
  v47[4] = *(_QWORD *)(a1 + 32);
  __38__NUArticleViewController_viewDidLoad__block_invoke_16((uint64_t)v47);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(*(id *)(a1 + 32), "setPresentationMode:", 0);
  NUArticleLoadLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "articleDataProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "articleID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v54 = v14;
    _os_log_impl(&dword_216817000, v12, OS_LOG_TYPE_DEFAULT, "Article did finish loading, starting layout, articleID=%{public}@", buf, 0xCu);

  }
  v15 = CACurrentMediaTime();
  objc_msgSend(*(id *)(a1 + 32), "articleDataProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "articleID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "eventManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x24BDBCF20];
  v52 = CFSTR("silexContextDidLoadEvent");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v52, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setWithArray:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v10;
  v44[1] = 3221225472;
  v44[2] = __38__NUArticleViewController_viewDidLoad__block_invoke_229;
  v44[3] = &unk_24D5A2BD0;
  v22 = v17;
  v45 = v22;
  v46 = v15;
  objc_msgSend(v18, "triggerOnceWhenAllEventsHaveOccurred:block:", v21, v44);

  objc_msgSend(*(id *)(a1 + 32), "scrollViewController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "loadContext:analyticsReporting:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 32), "updatePresentationAttributes");
  if (v11)
  {
    objc_msgSend(*(id *)(a1 + 32), "scrollViewController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "updateScrollPosition:animated:", v11, 0);

    objc_msgSend(*(id *)(a1 + 32), "setDidRestoreScrollPosition:", 1);
  }
  objc_msgSend(*(id *)(a1 + 32), "articleDataProvider");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "article");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "headline");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "articleDataProvider");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "article");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "headline");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "role");

  if (v31 == 3)
  {
    objc_msgSend(*(id *)(a1 + 32), "scrollViewController");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "scrollView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setAccessibilityLabel:", 0);
  }
  else
  {
    objc_msgSend(v27, "title");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "sourceName");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "length");

    if (v35)
    {
      v36 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v27, "sourceName");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "title");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "stringWithFormat:", CFSTR("%@, %@"), v37, v38);
      v39 = objc_claimAutoreleasedReturnValue();

      v32 = (void *)v39;
    }
    objc_msgSend(*(id *)(a1 + 32), "scrollViewController");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "scrollView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setAccessibilityLabel:", v32);

  }
  v41 = *MEMORY[0x24BDF72C8];
  objc_msgSend(*(id *)(a1 + 32), "scrollViewController");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "scrollView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v41, v43);

}

id __38__NUArticleViewController_viewDidLoad__block_invoke_16(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "articleDataProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "article");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "headline");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = v4;
    objc_msgSend(*(id *)(a1 + 32), "articleScrollPositionManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scrollPositionForHeadline:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v7, "position");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __38__NUArticleViewController_viewDidLoad__block_invoke_229(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  CFTimeInterval v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  CFTimeInterval v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  NUArticleLoadLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = CACurrentMediaTime() - *(double *)(a1 + 40);
    v5 = 138543618;
    v6 = v3;
    v7 = 2048;
    v8 = v4;
    _os_log_impl(&dword_216817000, v2, OS_LOG_TYPE_DEFAULT, "Article did finish initial layout, articleID=%{public}@, duration=%f", (uint8_t *)&v5, 0x16u);
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NUArticleViewController;
  -[NUArticleViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[NUArticleViewController eventManager](self, "eventManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fireEvent:", CFSTR("viewWillAppearEvent"));

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NUArticleViewController;
  -[NUArticleViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  -[NUArticleViewController eventManager](self, "eventManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fireEvent:", CFSTR("viewDidAppearEvent"));

}

- (void)viewSafeAreaInsetsDidChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NUArticleViewController;
  -[NUArticleViewController viewSafeAreaInsetsDidChange](&v8, sel_viewSafeAreaInsetsDidChange);
  -[NUArticleViewController articleDataProvider](self, "articleDataProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "article");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "headline");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NUArticleViewController scrollView](self, "scrollView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NUArticleViewController useTransparentNavigationBar](self, "useTransparentNavigationBar");
    -[UIViewController nu_adjustInsetsForScrollView:transparentNavigationBar:withEdgeInsets:](self, "nu_adjustInsetsForScrollView:transparentNavigationBar:withEdgeInsets:", v6, v7, *MEMORY[0x24BDF7718], *(double *)(MEMORY[0x24BDF7718] + 8), *(double *)(MEMORY[0x24BDF7718] + 16), *(double *)(MEMORY[0x24BDF7718] + 24));

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NUArticleViewController;
  -[NUArticleViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[NUArticleViewController setArticleIsPresentingFullscreen:](self, "setArticleIsPresentingFullscreen:", 0);
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NUArticleViewController;
  -[NUArticleViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  -[NUArticleViewController eventManager](self, "eventManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fireEvent:", CFSTR("viewDidDisappearEvent"));

}

- (BOOL)becomeFirstResponder
{
  void *v3;
  objc_super v5;

  -[NUArticleViewController scrollViewController](self, "scrollViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "becomeFirstResponder");

  v5.receiver = self;
  v5.super_class = (Class)NUArticleViewController;
  return -[NUArticleViewController becomeFirstResponder](&v5, sel_becomeFirstResponder);
}

- (BOOL)canBecomeFirstResponder
{
  return 0;
}

- (BOOL)resignFirstResponder
{
  void *v3;
  objc_super v5;

  -[NUArticleViewController scrollViewController](self, "scrollViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resignFirstResponder");

  v5.receiver = self;
  v5.super_class = (Class)NUArticleViewController;
  return -[NUArticleViewController resignFirstResponder](&v5, sel_resignFirstResponder);
}

- (UIResponder)responder
{
  void *v2;
  void *v3;

  -[NUArticleViewController scrollViewController](self, "scrollViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "responder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIResponder *)v3;
}

- (void)applicationWillEnterForeground:(id)a3
{
  id v3;

  -[NUArticleViewController eventManager](self, "eventManager", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fireEvent:", CFSTR("appWillEnterForegroundEvent"));

}

- (void)applicationDidBecomeActive:(id)a3
{
  id v3;

  -[NUArticleViewController eventManager](self, "eventManager", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fireEvent:", CFSTR("appDidEnterForegroundEvent"));

}

- (void)nowPlayingWillDisappear:(id)a3
{
  id v3;

  -[NUArticleViewController eventManager](self, "eventManager", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fireEvent:", CFSTR("nowPlayingWillDisappearEvent"));

}

- (void)nowPlayingDidDisappear:(id)a3
{
  id v3;

  -[NUArticleViewController eventManager](self, "eventManager", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fireEvent:", CFSTR("nowPlayingDidDisappearEvent"));

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)NUArticleViewController;
  -[NUArticleViewController viewDidLayoutSubviews](&v26, sel_viewDidLayoutSubviews);
  -[NUArticleViewController scrollViewController](self, "scrollViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentationAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "canvasSize");
  v6 = v5;
  v8 = v7;
  -[NUArticleViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v11 = v10;
  v13 = v12;

  if (v6 != v11 || v8 != v13)
    -[NUArticleViewController updatePresentationAttributes](self, "updatePresentationAttributes");
  -[NUArticleViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bounds");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  -[NUArticleViewController scrollViewController](self, "scrollViewController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setFrame:", v17, v19, v21, v23);

}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NUArticleViewController;
  -[NUArticleViewController traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, a3);
  -[NUArticleViewController articleDataProvider](self, "articleDataProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "article");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "headline");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NUArticleViewController scrollView](self, "scrollView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[NUArticleViewController useTransparentNavigationBar](self, "useTransparentNavigationBar");
    -[UIViewController nu_adjustInsetsForScrollView:transparentNavigationBar:withEdgeInsets:](self, "nu_adjustInsetsForScrollView:transparentNavigationBar:withEdgeInsets:", v7, v8, *MEMORY[0x24BDF7718], *(double *)(MEMORY[0x24BDF7718] + 8), *(double *)(MEMORY[0x24BDF7718] + 16), *(double *)(MEMORY[0x24BDF7718] + 24));

  }
}

- (int64_t)preferredStatusBarStyle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  objc_super v9;

  -[NUArticleViewController articleViewStyler](self, "articleViewStyler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NUArticleViewController articleViewStyler](self, "articleViewStyler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v6, "statusBarStyle");

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)NUArticleViewController;
    v7 = -[NUArticleViewController preferredStatusBarStyle](&v9, sel_preferredStatusBarStyle);
  }

  return (int64_t)v7;
}

- (void)scrollViewControllerDidLayoutContent:(id)a3
{
  void *v4;

  -[NUArticleViewController eventManager](self, "eventManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fireEvent:", CFSTR("silexContextDidLoadEvent"));

  -[NUArticleViewController setPresentationMode:](self, "setPresentationMode:", 0);
  -[NUArticleViewController updatePresentationAttributes](self, "updatePresentationAttributes");
  -[NUArticleViewController updateTextSelectionForPaywallPresentation](self, "updateTextSelectionForPaywallPresentation");
}

- (void)scrollViewController:(id)a3 didApplyDocumentStyle:(id)a4
{
  id v5;
  NUArticleViewStyler *v6;
  void *v7;
  void *v8;
  void *v9;
  NUArticleViewStyler *v10;

  if (a4)
  {
    v5 = a4;
    v6 = [NUArticleViewStyler alloc];
    objc_msgSend(v5, "backgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "topBackgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = -[NUArticleViewStyler initWithBackgroundColor:topBackgroundColor:](v6, "initWithBackgroundColor:topBackgroundColor:", v7, v8);
    -[NUArticleViewController articleViewStyler](self, "articleViewStyler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "next:", v10);

  }
}

- (void)scrollViewControllerRequestsFullscreen:(id)a3
{
  -[NUArticleViewController setArticleIsPresentingFullscreen:](self, "setArticleIsPresentingFullscreen:", 1);
}

- (void)willReturnToFullscreen:(id)a3
{
  -[NUArticleViewController setArticleIsPresentingFullscreen:](self, "setArticleIsPresentingFullscreen:", 1);
}

- (void)scrollViewControllerWillDismissFullscreen:(id)a3
{
  -[NUArticleViewController setArticleIsPresentingFullscreen:](self, "setArticleIsPresentingFullscreen:", 0);
}

- (void)scrollViewControllerDismissFullscreen:(id)a3
{
  -[NUArticleViewController setArticleIsPresentingFullscreen:](self, "setArticleIsPresentingFullscreen:", 0);
}

- (double)navigationBarHeightForScrollViewController:(id)a3
{
  BOOL v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  double MaxY;
  CGRect v11;

  v4 = -[NUArticleViewController useTransparentNavigationBar](self, "useTransparentNavigationBar", a3);
  -[NUArticleViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isNavigationBarHidden");

  if ((v6 & 1) != 0 || v4)
    return 0.0;
  -[NUArticleViewController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "navigationBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  MaxY = CGRectGetMaxY(v11);

  return MaxY;
}

- (double)toolBarHeightForScrollViewController:(id)a3
{
  void *v4;
  char v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  void *v17;
  double Height;
  double v19;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  -[NUArticleViewController navigationController](self, "navigationController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isToolbarHidden");

  v6 = 0.0;
  if ((v5 & 1) == 0)
  {
    -[NUArticleViewController navigationController](self, "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "toolbar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "frame");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;

    v21.origin.x = v10;
    v21.origin.y = v12;
    v21.size.width = v14;
    v21.size.height = v16;
    if (!CGRectIsNull(v21))
    {
      v22.origin.x = v10;
      v22.origin.y = v12;
      v22.size.width = v14;
      v22.size.height = v16;
      if (!CGRectIsEmpty(v22))
      {
        -[NUArticleViewController view](self, "view");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "bounds");
        Height = CGRectGetHeight(v23);
        v24.origin.x = v10;
        v24.origin.y = v12;
        v24.size.width = v14;
        v24.size.height = v16;
        v19 = Height - CGRectGetMinY(v24);

        return fmax(v19, 0.0);
      }
    }
  }
  return v6;
}

- (void)scrollViewController:(id)a3 enableNavigation:(BOOL)a4
{
  _BOOL8 v4;
  id v5;

  v4 = a4;
  -[UIViewController navigationControl](self, "navigationControl", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enableNavigation:", v4);

}

- (void)scrollViewControllerDidScroll:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  id v9;

  -[NUArticleViewController scrollViewController](self, "scrollViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isTracking");

  if (v6)
  {
    -[NUArticleViewController manualScrollingStartDate](self, "manualScrollingStartDate");
    v7 = objc_claimAutoreleasedReturnValue();
    v9 = (id)v7;
    if (v7)
    {
      -[NUArticleViewController setManualScrollingStartDate:](self, "setManualScrollingStartDate:", v7);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NUArticleViewController setManualScrollingStartDate:](self, "setManualScrollingStartDate:", v8);

    }
  }
}

- (void)scrollViewControllerDidScrollToBottomOfPrimaryContent:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[NUArticleViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[NUArticleViewController delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "articleViewControllerDidScrollToBottomOfPrimaryContent:", self);

  }
}

- (void)scrollViewControllerDidStopScrolling:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  _BOOL4 v11;
  uint64_t v12;

  -[NUArticleViewController scrollViewController](self, "scrollViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NUArticleViewController scrollViewController](self, "scrollViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scrollPosition");
    v12 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v12;
    if (v12)
    {
      -[NUArticleViewController delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_opt_respondsToSelector();

      if ((v9 & 1) != 0)
      {
        -[NUArticleViewController delegate](self, "delegate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "articleViewController:didScrollToPosition:", self, v12);

      }
      v11 = -[NUArticleViewController shouldSaveScrollPosition](self, "shouldSaveScrollPosition");
      v7 = (void *)v12;
      if (v11)
      {
        -[NUArticleViewController saveScrollPosition:](self, "saveScrollPosition:", v12);
        v7 = (void *)v12;
      }
    }

  }
}

- (BOOL)useTransparentNavigationBar
{
  void *v4;
  void *v5;
  void *v6;
  char v7;

  if (-[NUArticleViewController shouldDisableTransparentNavigationBar](self, "shouldDisableTransparentNavigationBar"))
    return 0;
  -[NUArticleViewController articleDataProvider](self, "articleDataProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "article");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "headline");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "useTransparentNavigationBar");

  return v7;
}

- (void)reportEvent:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[NUArticleViewController analyticsReporting](self, "analyticsReporting");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[NUArticleViewController analyticsReporting](self, "analyticsReporting");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reportEvent:", v7);

  }
}

- (void)setArticleContext:(id)a3
{
  NUArticleContext *v5;

  v5 = (NUArticleContext *)a3;
  if (self->_articleContext != v5)
  {
    objc_storeStrong((id *)&self->_articleContext, a3);
    -[NUArticleViewController setShouldAutoPlayVideo:](self, "setShouldAutoPlayVideo:", -[NUArticleContext shouldAutoPlayVideo](v5, "shouldAutoPlayVideo"));
    -[NUArticleViewController setShouldDisableTransparentNavigationBar:](self, "setShouldDisableTransparentNavigationBar:", -[NUArticleContext shouldDisableTransparentNavigationBar](v5, "shouldDisableTransparentNavigationBar"));
  }

}

- (void)setArticleIsPresentingFullscreen:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  if (self->_articleIsPresentingFullscreen != a3)
  {
    v3 = a3;
    self->_articleIsPresentingFullscreen = a3;
    -[NUArticleViewController chromeControl](self, "chromeControl");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "prefersChromeHidden:fromViewController:", v3, self);

  }
}

- (void)scrollToTopAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  id v9;

  v3 = a3;
  -[NUArticleViewController scrollViewController](self, "scrollViewController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUArticleViewController scrollViewController](self, "scrollViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scrollView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "adjustedContentInset");
  objc_msgSend(v5, "setContentOffset:animated:", v3, 0.0, -v8);

}

- (void)setContentSizeCategory:(id)a3
{
  void *v4;
  id v5;

  objc_storeStrong((id *)&self->_contentSizeCategory, a3);
  -[NUArticleViewController currentPresentationAttributes](self, "currentPresentationAttributes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[NUArticleViewController scrollViewController](self, "scrollViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updatePresentationWithAttributes:", v5);

}

- (NSString)contentSizeCategory
{
  NSString *contentSizeCategory;
  NSString *v3;
  void *v4;

  contentSizeCategory = self->_contentSizeCategory;
  if (contentSizeCategory)
  {
    v3 = contentSizeCategory;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (NSString)selectedText
{
  void *v2;
  void *v3;

  -[NUArticleViewController scrollViewController](self, "scrollViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setContentScale:(int64_t)a3
{
  void *v4;
  id v5;

  self->_contentScale = a3;
  -[NUArticleViewController currentPresentationAttributes](self, "currentPresentationAttributes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[NUArticleViewController scrollViewController](self, "scrollViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updatePresentationWithAttributes:", v5);

}

- (void)updateScrollViewControllerWithHeaderBlueprint:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NUArticleViewController scrollViewController](self, "scrollViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applyHeaderBlueprint:", v4);

}

- (void)updateScrollViewControllerWithContentOverlayBlueprint:(id)a3 topOffset:(double)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[NUArticleViewController scrollViewController](self, "scrollViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "applyContentOverlayBlueprint:topOffset:", v6, a4);

  -[NUArticleViewController updateTextSelectionForPaywallPresentation](self, "updateTextSelectionForPaywallPresentation");
}

- (void)updateScrollViewControllerWithFooterBlueprint:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NUArticleViewController scrollViewController](self, "scrollViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applyFooterBlueprint:", v4);

}

- (void)updatePresentationAttributes
{
  void *v3;
  id v4;

  -[NUArticleViewController scrollViewController](self, "scrollViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NUArticleViewController currentPresentationAttributes](self, "currentPresentationAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updatePresentationWithAttributes:", v3);

}

- (id)currentPresentationAttributes
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  unint64_t v8;
  double v9;
  void *v10;
  void *v11;

  v3 = (void *)objc_opt_new();
  -[NUArticleViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v3, "setCanvasSize:", v5, v6);

  -[NUArticleViewController contentSizeCategory](self, "contentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContentSizeCategory:", v7);

  v8 = -[NUArticleViewController contentScale](self, "contentScale") - 1;
  v9 = 1.0;
  if (v8 <= 0xA)
    v9 = dbl_21684DAE8[v8];
  objc_msgSend(v3, "setContentScaleFactor:", v9);
  -[NUArticleViewController debugSettingsProvider](self, "debugSettingsProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEnableViewportDebugging:", objc_msgSend(v10, "viewportDebuggingEnabled"));

  -[NUArticleViewController debugSettingsProvider](self, "debugSettingsProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTestingConditionEnabled:", objc_msgSend(v11, "testingConditionEnabled"));

  objc_msgSend(v3, "setPresentationMode:", -[NUArticleViewController presentationMode](self, "presentationMode"));
  objc_msgSend(v3, "setUseTransparentToolbar:", -[NUArticleViewController useTransparentNavigationBar](self, "useTransparentNavigationBar"));
  return v3;
}

- (void)updateScrollPositionFromContext
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[NUArticleViewController articleContext](self, "articleContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scrollPosition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NUArticleViewController setPresentationMode:](self, "setPresentationMode:", 0);
    -[NUArticleViewController updatePresentationAttributes](self, "updatePresentationAttributes");
    -[NUArticleViewController scrollViewController](self, "scrollViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUArticleViewController articleContext](self, "articleContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scrollPosition");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateScrollPosition:animated:", v7, 0);

    -[NUArticleViewController setDidRestoreScrollPosition:](self, "setDidRestoreScrollPosition:", 1);
    -[NUArticleViewController articleContext](self, "articleContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scrollPosition");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUArticleViewController saveScrollPosition:](self, "saveScrollPosition:", v9);

    -[NUArticleViewController setArticleContext:](self, "setArticleContext:", 0);
  }
}

- (BOOL)shouldSaveScrollPosition
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  -[NUArticleViewController scrollViewController](self, "scrollViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 0;
  if (-[NUArticleViewController didRestoreScrollPosition](self, "didRestoreScrollPosition"))
    return 1;
  -[NUArticleViewController manualScrollingStartDate](self, "manualScrollingStartDate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    return 0;
  v6 = (void *)v5;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUArticleViewController manualScrollingStartDate](self, "manualScrollingStartDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceDate:", v8);
  v10 = v9;

  return v10 > 10.0;
}

- (void)saveScrollPosition:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  -[NUArticleViewController articleDataProvider](self, "articleDataProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "article");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "headline");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = v6;
    -[NUArticleViewController articleScrollPositionManager](self, "articleScrollPositionManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPosition:headline:", v9, v7);

  }
}

- (void)scrollToAudioPositionAndHideMessageAfterEvent:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[NUArticleViewController articleDataProvider](self, "articleDataProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "article");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "headline");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = v6;
    -[NUArticleViewController articleScrollPositionManager](self, "articleScrollPositionManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scrollPositionForHeadline:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = v9;
      if (objc_msgSend(v10, "source") == 1)
      {
        -[NUArticleViewController scrollViewController](self, "scrollViewController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "position");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "updateScrollPosition:animated:", v12, 0);

        -[NUArticleViewController setDidRestoreScrollPosition:](self, "setDidRestoreScrollPosition:", 1);
        -[NUArticleViewController showArticleMessage:hideAfterEvent:](self, "showArticleMessage:hideAfterEvent:", 0, v13);
      }

    }
  }

}

- (void)showArticleMessage:(int64_t)a3 hideAfterEvent:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[5];
  id v12;

  v6 = a4;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__0;
  v11[4] = __Block_byref_object_dispose__0;
  -[NUArticleViewController articleMessager](self, "articleMessager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "showMessage:", a3);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NUArticleViewController eventManager](self, "eventManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __61__NUArticleViewController_showArticleMessage_hideAfterEvent___block_invoke;
    v10[3] = &unk_24D5A2C20;
    v10[4] = v11;
    objc_msgSend(v8, "triggerOnceWhenAnyEventHasOccurred:block:", v9, v10);

  }
  _Block_object_dispose(v11, 8);

}

void __61__NUArticleViewController_showArticleMessage_hideAfterEvent___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

}

- (id)articleMessager
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[NUArticleViewController navigationController](self, "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "topViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_bottomPalette");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  FCProtocolCast();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_parentOrPresentingViewControllerFor:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(v3, "parentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(v3, "presentingViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (BOOL)scrollViewController:(id)a3 shouldOccludeAccessibilityElement:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  char v9;

  v5 = a4;
  +[NUArticleViewController _parentOrPresentingViewControllerFor:](NUArticleViewController, "_parentOrPresentingViewControllerFor:", self);
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    while ((objc_opt_respondsToSelector() & 1) == 0)
    {
      +[NUArticleViewController _parentOrPresentingViewControllerFor:](NUArticleViewController, "_parentOrPresentingViewControllerFor:", v7);
      v8 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v8;
      if (!v8)
        goto LABEL_5;
    }
    v9 = objc_msgSend(v7, "shouldOccludeAccessibilityElement:", v5);

  }
  else
  {
LABEL_5:
    v9 = 0;
  }

  return v9;
}

- (BOOL)accessibilityShouldScrollForScrollViewController:(id)a3 defaultValue:(BOOL)a4
{
  uint64_t v4;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = a4;
  v6 = a3;
  +[NUArticleViewController _parentOrPresentingViewControllerFor:](NUArticleViewController, "_parentOrPresentingViewControllerFor:", self);
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    while ((objc_opt_respondsToSelector() & 1) == 0)
    {
      +[NUArticleViewController _parentOrPresentingViewControllerFor:](NUArticleViewController, "_parentOrPresentingViewControllerFor:", v8);
      v9 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v9;
      if (!v9)
        goto LABEL_7;
    }
    objc_msgSend(v6, "scrollView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v4) = objc_msgSend(v8, "accessibilityShouldScroll:defaultValue:", v10, v4);

  }
LABEL_7:

  return v4;
}

- (BOOL)isPreviewingOrShowingHardPaywall
{
  void *v2;
  uint64_t v3;

  +[NUArticleViewController _parentOrPresentingViewControllerFor:](NUArticleViewController, "_parentOrPresentingViewControllerFor:", self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    while (!objc_msgSend(v2, "conformsToProtocol:", &unk_254E85C98))
    {
      +[NUArticleViewController _parentOrPresentingViewControllerFor:](NUArticleViewController, "_parentOrPresentingViewControllerFor:", v2);
      v3 = objc_claimAutoreleasedReturnValue();

      v2 = (void *)v3;
      if (!v3)
        goto LABEL_9;
    }
    if ((objc_msgSend(v2, "isPreviewing") & 1) != 0)
      LOBYTE(v3) = 1;
    else
      LOBYTE(v3) = objc_msgSend(v2, "isShowingHardPaywall");
  }
  else
  {
    LOBYTE(v3) = 0;
  }
LABEL_9:

  return v3;
}

- (void)updateTextSelectionForPaywallPresentation
{
  _BOOL4 v3;
  id v4;

  v3 = -[NUArticleViewController isPreviewingOrShowingHardPaywall](self, "isPreviewingOrShowingHardPaywall");
  -[NUArticleViewController scrollViewController](self, "scrollViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextSelectionEnabled:", !v3);

}

- (NULoadingDelegate)loadingDelegate
{
  return (NULoadingDelegate *)objc_loadWeakRetained((id *)&self->_loadingDelegate);
}

- (void)setLoadingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_loadingDelegate, a3);
}

- (int64_t)contentScale
{
  return self->_contentScale;
}

- (NUArticleViewControllerDelegate)delegate
{
  return (NUArticleViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SXAnalyticsReporting)analyticsReporting
{
  return (SXAnalyticsReporting *)objc_loadWeakRetained((id *)&self->_analyticsReporting);
}

- (void)setAnalyticsReporting:(id)a3
{
  objc_storeWeak((id *)&self->_analyticsReporting, a3);
}

- (FCObservable)articleViewStyler
{
  return self->_articleViewStyler;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (NUArticleContext)articleContext
{
  return self->_articleContext;
}

- (SXScrollViewController)scrollViewController
{
  return self->_scrollViewController;
}

- (NUArticleDataProvider)articleDataProvider
{
  return self->_articleDataProvider;
}

- (NUEndOfArticleDataProvider)endOfArticleDataProvider
{
  return self->_endOfArticleDataProvider;
}

- (NFEventManager)eventManager
{
  return self->_eventManager;
}

- (NUArticleKeyCommandManager)keyCommandManager
{
  return self->_keyCommandManager;
}

- (NSHashTable)loadingListeners
{
  return self->_loadingListeners;
}

- (NUDocumentSectionBlueprintProvider)documentSectionBlueprintProvider
{
  return self->_documentSectionBlueprintProvider;
}

- (NUANFDebugSettingsProvider)debugSettingsProvider
{
  return self->_debugSettingsProvider;
}

- (BOOL)articleIsPresentingFullscreen
{
  return self->_articleIsPresentingFullscreen;
}

- (unint64_t)presentationMode
{
  return self->_presentationMode;
}

- (void)setPresentationMode:(unint64_t)a3
{
  self->_presentationMode = a3;
}

- (SXVideoPlayerViewControllerManager)videoPlayerViewControllerManager
{
  return self->_videoPlayerViewControllerManager;
}

- (NUArticleScrollPositionManagerType)articleScrollPositionManager
{
  return self->_articleScrollPositionManager;
}

- (BOOL)didRestoreScrollPosition
{
  return self->_didRestoreScrollPosition;
}

- (void)setDidRestoreScrollPosition:(BOOL)a3
{
  self->_didRestoreScrollPosition = a3;
}

- (NSDate)manualScrollingStartDate
{
  return self->_manualScrollingStartDate;
}

- (void)setManualScrollingStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_manualScrollingStartDate, a3);
}

- (NUSpotlightManager)spotlightManager
{
  return self->_spotlightManager;
}

- (NUChromeControl)chromeControl
{
  return self->_chromeControl;
}

- (double)articleLoadedTime
{
  return self->_articleLoadedTime;
}

- (void)setArticleLoadedTime:(double)a3
{
  self->_articleLoadedTime = a3;
}

- (BOOL)shouldAutoPlayVideo
{
  return self->_shouldAutoPlayVideo;
}

- (void)setShouldAutoPlayVideo:(BOOL)a3
{
  self->_shouldAutoPlayVideo = a3;
}

- (BOOL)shouldDisableTransparentNavigationBar
{
  return self->_shouldDisableTransparentNavigationBar;
}

- (void)setShouldDisableTransparentNavigationBar:(BOOL)a3
{
  self->_shouldDisableTransparentNavigationBar = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chromeControl, 0);
  objc_storeStrong((id *)&self->_spotlightManager, 0);
  objc_storeStrong((id *)&self->_manualScrollingStartDate, 0);
  objc_storeStrong((id *)&self->_articleScrollPositionManager, 0);
  objc_storeStrong((id *)&self->_videoPlayerViewControllerManager, 0);
  objc_storeStrong((id *)&self->_debugSettingsProvider, 0);
  objc_storeStrong((id *)&self->_documentSectionBlueprintProvider, 0);
  objc_storeStrong((id *)&self->_loadingListeners, 0);
  objc_storeStrong((id *)&self->_keyCommandManager, 0);
  objc_storeStrong((id *)&self->_eventManager, 0);
  objc_storeStrong((id *)&self->_endOfArticleDataProvider, 0);
  objc_storeStrong((id *)&self->_articleDataProvider, 0);
  objc_storeStrong((id *)&self->_scrollViewController, 0);
  objc_storeStrong((id *)&self->_articleContext, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_articleViewStyler, 0);
  objc_destroyWeak((id *)&self->_analyticsReporting);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contentSizeCategory, 0);
  objc_destroyWeak((id *)&self->_loadingDelegate);
}

@end

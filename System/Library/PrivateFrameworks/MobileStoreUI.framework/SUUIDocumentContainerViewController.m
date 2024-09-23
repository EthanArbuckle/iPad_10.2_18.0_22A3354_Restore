@implementation SUUIDocumentContainerViewController

- (SUUIDocumentContainerViewController)initWithDocument:(id)a3 options:(id)a4 clientContext:(id)a5
{
  id v9;
  id v10;
  id v11;
  objc_class *v12;
  void *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  SUUIDocumentContainerViewController *v17;
  SUUIDocumentContainerViewController *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  NSDictionary *presentationOptions;
  void *v29;
  void *v30;
  void *v31;
  _BOOL4 v32;
  SUUIMetricsPageRenderEvent *v33;
  NSString *urlString;
  void *v35;
  SUUIDocumentContainerViewController *v36;
  SUUIMetricsDOMChangeQueue *v37;
  void *v39;
  void *v40;
  _QWORD v41[4];
  SUUIDocumentContainerViewController *v42;
  objc_super v43;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v11)
  {
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "debugDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("[%@]: Missing client context for %@"), v13, v14);

    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("[%@]: Document options %@"), v16, v10);

  }
  v43.receiver = self;
  v43.super_class = (Class)SUUIDocumentContainerViewController;
  v17 = -[SUUIDocumentContainerViewController init](&v43, sel_init);
  v18 = v17;
  if (v17)
  {
    -[SUUIViewController setClientContext:](v17, "setClientContext:", v11);
    objc_msgSend(v10, "objectForKey:", CFSTR("sidepackType"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", CFSTR("url"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong((id *)&v18->_urlString, v20);
    objc_msgSend(v9, "templateElement");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v40 = v21;
      -[SUUIDocumentContainerViewController _sidepackViewControllerWithOptions:clientContext:](v18, "_sidepackViewControllerWithOptions:clientContext:", v10, v11);
      v22 = (id)objc_claimAutoreleasedReturnValue();
      -[SUUIDocumentContainerViewController navigationItem](v18, "navigationItem");
      v23 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "_setExistingNavigationItem:", v23);
    }
    else if (v21 || !v20)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v22 = v18;
        v18 = 0;
        goto LABEL_24;
      }
      v25 = -[SUUIDocumentContainerViewController _newViewControllerWithTemplateElement:options:clientContext:](v18, "_newViewControllerWithTemplateElement:options:clientContext:", v21, v10, v11);
      v26 = v21;
      v23 = v25;
      v40 = v26;
      if (v25)
      {
        v23 = v25;
        v18->_templateViewElementType = objc_msgSend(v26, "elementType");
      }
      v22 = v23;
    }
    else
    {
      v40 = 0;
      v22 = objc_alloc_init(MEMORY[0x24BEBDB08]);
      objc_msgSend(v22, "view");
      v23 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setBackgroundColor:", v24);

    }
    if (!v22)
    {
      v22 = v18;
      v18 = 0;
LABEL_23:
      v21 = v40;
LABEL_24:

      goto LABEL_25;
    }
    v39 = v19;
    objc_storeStrong((id *)&v18->_document, a3);
    -[IKAppDocument setDelegate:](v18->_document, "setDelegate:", v18);
    v18->_scrollingTabAppearanceStatus.progress = 1.0;
    *(_QWORD *)&v18->_scrollingTabAppearanceStatus.isBouncingOffTheEdge = 0;
    -[SUUIDocumentContainerViewController _setChildViewController:](v18, "_setChildViewController:", v22);
    v27 = objc_msgSend(v10, "copy");
    presentationOptions = v18->_presentationOptions;
    v18->_presentationOptions = (NSDictionary *)v27;

    -[IKAppDocument onLoad](v18->_document, "onLoad");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addObserver:selector:name:object:", v18, sel__SUUI_applicationDidEnterBackground_, *MEMORY[0x24BEBDF98], 0);
    objc_msgSend(v29, "addObserver:selector:name:object:", v18, sel_documentDidSendMessage_, 0x251210E48, v18->_document);
    objc_msgSend(v11, "applicationController");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "options");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v31, "pageRenderMetricsEnabled"))
    {
      v32 = +[SUUIMetricsPageRenderEvent shouldCollectPageRenderDataForDocument:](SUUIMetricsPageRenderEvent, "shouldCollectPageRenderDataForDocument:", v18->_document);

      v19 = v39;
      if (!v32)
      {
LABEL_22:

        goto LABEL_23;
      }
      v33 = objc_alloc_init(SUUIMetricsPageRenderEvent);
      -[SUUIDocumentContainerViewController setPageRenderEvent:](v18, "setPageRenderEvent:", v33);

      urlString = v18->_urlString;
      -[SUUIDocumentContainerViewController pageRenderEvent](v18, "pageRenderEvent");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setPageURL:", urlString);

      v41[0] = MEMORY[0x24BDAC760];
      v41[1] = 3221225472;
      v41[2] = __78__SUUIDocumentContainerViewController_initWithDocument_options_clientContext___block_invoke;
      v41[3] = &unk_2511FDB00;
      v36 = v18;
      v42 = v36;
      +[SUUIMetricsAppLaunchEvent withPendingLaunchEvent:](SUUIMetricsAppLaunchEvent, "withPendingLaunchEvent:", v41);
      v37 = objc_alloc_init(SUUIMetricsDOMChangeQueue);
      -[SUUIDocumentContainerViewController setDomChangeTimingQueue:](v36, "setDomChangeTimingQueue:", v37);

      v30 = v42;
    }
    else
    {

    }
    v19 = v39;
    goto LABEL_22;
  }
LABEL_25:

  return v18;
}

void __78__SUUIDocumentContainerViewController_initWithDocument_options_clientContext___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "launchCorrelationKey");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "pageRenderEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLaunchCorrelationKey:", v4);

}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEC8B00], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEBDF98], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEBE008], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, 0x251210E48, self->_document);
  if (-[NSSet count](self->_personalizationItems, "count"))
  {
    +[SUUIItemStateCenter defaultCenter](SUUIItemStateCenter, "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endObservingLibraryItems:", self->_personalizationItems);

  }
  if (-[SUUIDocumentContainerViewController _appearState](self, "_appearState") == 3)
    -[IKAppDocument onDisappear](self->_document, "onDisappear");
  -[IKAppDocument setDelegate:](self->_document, "setDelegate:", 0);
  -[SUUIMediaQueryEvaluator setDelegate:](self->_mediaQueryEvaluator, "setDelegate:", 0);
  -[SUUINavigationBarController setParentViewController:](self->_navigationBarController, "setParentViewController:", 0);
  -[SSVLoadURLOperation setOutputBlock:](self->_loadURLOperation, "setOutputBlock:", 0);
  -[SSVLoadURLOperation cancel](self->_loadURLOperation, "cancel");

  v5.receiver = self;
  v5.super_class = (Class)SUUIDocumentContainerViewController;
  -[SUUIViewController dealloc](&v5, sel_dealloc);
}

+ (BOOL)allowsChildViewControllerNavigationBarManagement
{
  return 1;
}

- (void)suui_viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[UIViewController suui_viewWillAppear:](self->_childViewController, "suui_viewWillAppear:", v3);
  v5.receiver = self;
  v5.super_class = (Class)SUUIDocumentContainerViewController;
  -[SUUIViewController suui_viewWillAppear:](&v5, sel_suui_viewWillAppear_, v3);
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (id)childViewControllerForStatusBarHidden
{
  return self->_childViewController;
}

- (id)childViewControllerForStatusBarStyle
{
  return self->_childViewController;
}

- (id)contentScrollView
{
  void *v2;
  objc_super v4;

  if (self->_childViewController)
  {
    -[UIViewController contentScrollView](self->_childViewController, "contentScrollView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)SUUIDocumentContainerViewController;
    -[SUUIDocumentContainerViewController contentScrollView](&v4, sel_contentScrollView);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  UIViewController *childViewController;
  void *v14;
  double v15;

  -[IKAppDocument templateElement](self->_document, "templateElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "style");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ikBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "color");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v15 = 1.0;
    if (objc_msgSend(v6, "getRed:green:blue:alpha:", 0, 0, 0, &v15))
      v7 = v15 <= 0.00000011920929;
    else
      v7 = 0;
    if (v7)
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor", v15);
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = v6;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  v10 = objc_alloc(MEMORY[0x24BEBDB00]);
  objc_msgSend(MEMORY[0x24BEBDB58], "keyWindow");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v12 = (void *)objc_msgSend(v10, "initWithFrame:");

  objc_msgSend(v12, "setBackgroundColor:", v9);
  childViewController = self->_childViewController;
  if (childViewController)
  {
    -[UIViewController view](childViewController, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAutoresizingMask:", 18);
    objc_msgSend(v12, "bounds");
    objc_msgSend(v14, "setFrame:");
    objc_msgSend(v12, "addSubview:", v14);

  }
  -[SUUIDocumentContainerViewController setView:](self, "setView:", v12);

}

- (id)previewMenuItems
{
  return (id)-[UIViewController previewMenuItems](self->_childViewController, "previewMenuItems");
}

- (void)reloadData
{
  if (self->_urlString)
  {
    if (!self->_loadURLOperation)
      -[SUUIDocumentContainerViewController _enqueueLoadURLOperation](self, "_enqueueLoadURLOperation");
  }
}

- (void)setPreferredContentSize:(CGSize)a3
{
  double height;
  double width;
  objc_super v6;

  height = a3.height;
  width = a3.width;
  v6.receiver = self;
  v6.super_class = (Class)SUUIDocumentContainerViewController;
  -[SUUIDocumentContainerViewController setPreferredContentSize:](&v6, sel_setPreferredContentSize_);
  -[UIViewController setPreferredContentSize:](self->_childViewController, "setPreferredContentSize:", width, height);
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  uint64_t v3;

  -[SUUIViewController clientContext](self, "clientContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = SUUIUserInterfaceIdiom(v2);

  if (v3 == 1)
    return 30;
  if (SUUIAllowsLandscapePhone())
    return 26;
  return 2;
}

- (void)willMoveToParentViewController:(id)a3
{
  id v4;
  UIViewController *v5;
  objc_super v6;

  v4 = a3;
  if (v4)
  {
    v5 = self->_childViewController;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[UIViewController delayPresentationIfNeededForParentViewController:](v5, "delayPresentationIfNeededForParentViewController:", v4);

  }
  v6.receiver = self;
  v6.super_class = (Class)SUUIDocumentContainerViewController;
  -[SUUIDocumentContainerViewController willMoveToParentViewController:](&v6, sel_willMoveToParentViewController_, v4);

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  objc_super v13;

  v3 = a3;
  -[SUUIDocumentContainerViewController pageRenderEvent](self, "pageRenderEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pageAppearTime");
  v7 = v6;

  if (v7 < 2.22044605e-16)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSince1970");
    v10 = v9;
    -[SUUIDocumentContainerViewController pageRenderEvent](self, "pageRenderEvent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPageAppearTime:", v10);

    -[SUUIDocumentContainerViewController _submitPageRenderIfPossible](self, "_submitPageRenderIfPossible");
  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "postNotificationName:object:", CFSTR("SUUIApplicationPageDidDisplayNotification"), self);

  -[IKAppDocument onAppear](self->_document, "onAppear");
  v13.receiver = self;
  v13.super_class = (Class)SUUIDocumentContainerViewController;
  -[SUUIDocumentContainerViewController viewDidAppear:](&v13, sel_viewDidAppear_, v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  objc_super v10;

  v3 = a3;
  -[SUUIDocumentContainerViewController pageRenderEvent](self, "pageRenderEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSince1970");
    v8 = v7;
    -[SUUIDocumentContainerViewController pageRenderEvent](self, "pageRenderEvent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPageDisappearTime:", v8);

  }
  -[IKAppDocument onDisappear](self->_document, "onDisappear");
  v10.receiver = self;
  v10.super_class = (Class)SUUIDocumentContainerViewController;
  -[SUUIDocumentContainerViewController viewDidDisappear:](&v10, sel_viewDidDisappear_, v3);
}

- (void)viewDidLayoutSubviews
{
  CGSize *p_viewSize;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double width;
  double height;
  void *v12;
  CGFloat v13;
  CGFloat v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  objc_super v25;

  p_viewSize = &self->_viewSize;
  -[SUUIDocumentContainerViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  width = p_viewSize->width;
  height = p_viewSize->height;

  if (width != v6 || height != v8)
  {
    -[SUUIDocumentContainerViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    p_viewSize->width = v13;
    p_viewSize->height = v14;

    v15 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", p_viewSize->height);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v16, CFSTR("height"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", p_viewSize->width);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v17, CFSTR("width"));

    -[SUUIDocumentContainerViewController _sendOnViewAttributesChangeWithAttributes:viewWillAppear:](self, "_sendOnViewAttributesChangeWithAttributes:viewWillAppear:", v15, 0);
    -[SUUIMediaQueryEvaluator reloadData](self->_mediaQueryEvaluator, "reloadData");

  }
  -[SUUIDocumentContainerViewController _reloadNavigationBarControllerIfNeeded](self, "_reloadNavigationBarControllerIfNeeded");
  v25.receiver = self;
  v25.super_class = (Class)SUUIDocumentContainerViewController;
  -[SUUIDocumentContainerViewController viewDidLayoutSubviews](&v25, sel_viewDidLayoutSubviews);
  -[SUUIDocumentContainerViewController bottomLayoutGuide](self, "bottomLayoutGuide");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "length");
  v20 = v19;

  -[SUUIDocumentContainerViewController topLayoutGuide](self, "topLayoutGuide");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "length");
  v23 = v22;

  if (vabdd_f64(self->_lastBottomLayoutGuideLength, v20) > 0.00000011920929
    || vabdd_f64(self->_lastTopLayoutGuideLength, v23) > 0.00000011920929)
  {
    self->_lastBottomLayoutGuideLength = v20;
    self->_lastTopLayoutGuideLength = v23;
    if (-[UIViewController isViewLoaded](self->_childViewController, "isViewLoaded"))
    {
      -[UIViewController view](self->_childViewController, "view");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setNeedsLayout");

    }
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  CGSize *p_viewSize;
  void *v6;
  CGFloat v7;
  CGFloat v8;
  void *v9;
  void *v10;
  NSSet *v11;
  NSSet *personalizationItems;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  id v35;
  void *v36;
  uint64_t v37;
  const __CFString *v38;
  NSNumber *orientationAtDisappear;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v48;
  void *v49;
  void *sizeAtDisappear;
  void *v51;
  uint64_t v52;
  void *v53;
  char v54;
  void *v55;
  double v56;
  double v57;
  double v58;
  double v59;
  void *v60;
  objc_super v61;

  v3 = a3;
  p_viewSize = &self->_viewSize;
  -[SUUIDocumentContainerViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  p_viewSize->width = v7;
  p_viewSize->height = v8;

  -[SUUIDocumentContainerViewController reloadData](self, "reloadData");
  if (!self->_personalizationItems)
  {
    -[IKAppDocument templateElement](self->_document, "templateElement");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "personalizationLibraryItems");
      v11 = (NSSet *)objc_claimAutoreleasedReturnValue();
      personalizationItems = self->_personalizationItems;
      self->_personalizationItems = v11;

      +[SUUIItemStateCenter defaultCenter](SUUIItemStateCenter, "defaultCenter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "beginObservingLibraryItems:", self->_personalizationItems);

    }
  }
  -[SUUIDocumentContainerViewController _reloadNavigationBarControllerIfNeeded](self, "_reloadNavigationBarControllerIfNeeded");
  if (-[SUUIDocumentContainerViewController _shouldFillNavigationBarContentsBasedOnNavigationBarViewElement](self, "_shouldFillNavigationBarContentsBasedOnNavigationBarViewElement"))
  {
    -[SUUIDocumentContainerViewController _navigationBarViewElement](self, "_navigationBarViewElement");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIDocumentContainerViewController navigationItem](self, "navigationItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setHidesBackButton:animated:", objc_msgSend(v14, "hidesBackButton"), 0);

    objc_msgSend(v14, "style");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "visibility");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("hidden"));

    -[SUUIDocumentContainerViewController navigationController](self, "navigationController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setNavigationBarHidden:animated:", v18, v3);

  }
  -[SUUIViewController forceOrientationBackToSupportedOrientation](self, "forceOrientationBackToSupportedOrientation");
  -[SUUIDocumentContainerViewController contentScrollView](self, "contentScrollView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "contentInset");
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;

  if (v22 == 0.0)
  {
    -[SUUIDocumentContainerViewController topLayoutGuide](self, "topLayoutGuide");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "length");
    v31 = v30;

    if (v22 != v31)
    {
      -[SUUIDocumentContainerViewController topLayoutGuide](self, "topLayoutGuide");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "length");
      v34 = v33;

      -[SUUIDocumentContainerViewController _setNavigationControllerContentInsetAdjustment:](self, "_setNavigationControllerContentInsetAdjustment:", v34, v24, v26, v28);
    }
  }
  v35 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (self->_orientationAtDisappear)
  {
    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "statusBarOrientation");

    if (v37 != -[NSNumber integerValue](self->_orientationAtDisappear, "integerValue"))
    {
      if ((unint64_t)(v37 - 3) >= 2)
        v38 = CFSTR("portrait");
      else
        v38 = CFSTR("landscape");
      objc_msgSend(v35, "setObject:forKey:", v38, CFSTR("orientation"));
    }
    orientationAtDisappear = self->_orientationAtDisappear;
    self->_orientationAtDisappear = 0;

  }
  if (self->_sizeAtDisappear)
  {
    -[SUUIDocumentContainerViewController view](self, "view");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "frame");
    v42 = v41;
    v44 = v43;

    -[NSValue CGSizeValue](self->_sizeAtDisappear, "CGSizeValue");
    if (v46 != v42 || v45 != v44)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v44);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setObject:forKey:", v48, CFSTR("height"));

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v42);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setObject:forKey:", v49, CFSTR("width"));

    }
    sizeAtDisappear = self->_sizeAtDisappear;
    self->_sizeAtDisappear = 0;
    goto LABEL_24;
  }
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(v51, "userInterfaceIdiom");

  if ((v52 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v53, "SUUI_isFullscreen");

    if ((v54 & 1) == 0)
    {
      -[SUUIDocumentContainerViewController view](self, "view");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "frame");
      v57 = v56;
      v59 = v58;

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setObject:forKey:", v60, CFSTR("height"));

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v57);
      sizeAtDisappear = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setObject:forKey:", sizeAtDisappear, CFSTR("width"));
LABEL_24:

    }
  }
  if (objc_msgSend(v35, "count"))
  {
    -[SUUIDocumentContainerViewController _sendOnViewAttributesChangeWithAttributes:viewWillAppear:](self, "_sendOnViewAttributesChangeWithAttributes:viewWillAppear:", v35, 1);
    -[SUUIMediaQueryEvaluator reloadData](self->_mediaQueryEvaluator, "reloadData");
  }
  v61.receiver = self;
  v61.super_class = (Class)SUUIDocumentContainerViewController;
  -[SUUIViewController viewWillAppear:](&v61, sel_viewWillAppear_, v3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  void *v6;
  NSNumber *v7;
  NSNumber *orientationAtDisappear;
  void *v9;
  void *v10;
  double v11;
  double v12;
  NSValue *v13;
  NSValue *sizeAtDisappear;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  objc_super v19;

  v3 = a3;
  v5 = objc_alloc(MEMORY[0x24BDD16E0]);
  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (NSNumber *)objc_msgSend(v5, "initWithInteger:", objc_msgSend(v6, "statusBarOrientation"));
  orientationAtDisappear = self->_orientationAtDisappear;
  self->_orientationAtDisappear = v7;

  v9 = (void *)MEMORY[0x24BDD1968];
  -[SUUIDocumentContainerViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  objc_msgSend(v9, "valueWithCGSize:", v11, v12);
  v13 = (NSValue *)objc_claimAutoreleasedReturnValue();
  sizeAtDisappear = self->_sizeAtDisappear;
  self->_sizeAtDisappear = v13;

  -[SUUIDocumentContainerViewController navigationController](self, "navigationController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "viewControllers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "containsObject:", self);

  if ((v17 & 1) == 0)
  {
    -[IKAppDocument navigationBarElement](self->_document, "navigationBarElement");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 8, 0, 0, 0, 0);

  }
  v19.receiver = self;
  v19.super_class = (Class)SUUIDocumentContainerViewController;
  -[SUUIDocumentContainerViewController viewWillDisappear:](&v19, sel_viewWillDisappear_, v3);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  objc_super v14;
  _QWORD v15[5];
  CGAffineTransform v16;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  -[NSDictionary objectForKey:](self->_presentationOptions, "objectForKey:", CFSTR("type"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("popover"));

  if ((v9 & 1) == 0)
  {
    self->_viewSize.width = width;
    self->_viewSize.height = height;
    v10 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", height);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v11, CFSTR("height"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", width);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v12, CFSTR("width"));

    if (v7)
      objc_msgSend(v7, "targetTransform");
    else
      memset(&v16, 0, sizeof(v16));
    if (!CGAffineTransformIsIdentity(&v16))
    {
      if (width <= height)
        v13 = CFSTR("portrait");
      else
        v13 = CFSTR("landscape");
      objc_msgSend(v10, "setObject:forKey:", v13, CFSTR("orientation"));
    }
    -[SUUIDocumentContainerViewController _sendOnViewAttributesChangeWithAttributes:viewWillAppear:](self, "_sendOnViewAttributesChangeWithAttributes:viewWillAppear:", v10, -[SUUIDocumentContainerViewController _appearState](self, "_appearState") == 1);
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __90__SUUIDocumentContainerViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
    v15[3] = &unk_2511F4640;
    v15[4] = self;
    objc_msgSend(v7, "animateAlongsideTransition:completion:", 0, v15);
    v14.receiver = self;
    v14.super_class = (Class)SUUIDocumentContainerViewController;
    -[SUUIDocumentContainerViewController viewWillTransitionToSize:withTransitionCoordinator:](&v14, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
    -[SUUIDocumentContainerViewController _reloadNavigationPalette](self, "_reloadNavigationPalette");

  }
}

uint64_t __90__SUUIDocumentContainerViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1104), "reloadData");
}

- (id)toolbarItems
{
  return -[SUUIToolbarController toolbarItems](self->_toolbarController, "toolbarItems");
}

- (id)pendingSizeTransitionCompletion
{
  return _Block_copy(self->_pendingSizeTransitionCompletion);
}

- (BOOL)document:(id)a3 evaluateStyleMediaQuery:(id)a4
{
  id v5;
  SUUIMediaQueryEvaluator *mediaQueryEvaluator;
  SUUIMediaQueryEvaluator *v7;
  SUUIMediaQueryEvaluator *v8;
  BOOL v9;

  v5 = a4;
  mediaQueryEvaluator = self->_mediaQueryEvaluator;
  if (!mediaQueryEvaluator)
  {
    v7 = objc_alloc_init(SUUIMediaQueryEvaluator);
    v8 = self->_mediaQueryEvaluator;
    self->_mediaQueryEvaluator = v7;

    -[SUUIMediaQueryEvaluator setDelegate:](self->_mediaQueryEvaluator, "setDelegate:", self);
    mediaQueryEvaluator = self->_mediaQueryEvaluator;
  }
  v9 = -[SUUIMediaQueryEvaluator evaluateMediaQuery:](mediaQueryEvaluator, "evaluateMediaQuery:", v5);

  return v9;
}

- (void)document:(id)a3 runTestWithName:(id)a4 options:(id)a5
{
  id v7;
  id v8;

  v8 = a4;
  v7 = a5;
  if (-[UIViewController conformsToProtocol:](self->_childViewController, "conformsToProtocol:", &unk_2571C66C8))-[UIViewController performTestWithName:options:](self->_childViewController, "performTestWithName:options:", v8, v7);

}

- (void)documentDidUpdate:(id)a3
{
  id v4;
  void *v5;
  int v6;
  int v7;
  NSObject *v8;
  int v9;
  void *v10;
  id v11;
  double Current;
  double v13;
  double v14;
  void *v15;
  void *v16;
  NSNumber *pageResponseAbsoluteTime;
  void *v18;
  double v19;
  double v20;
  void *v21;
  unint64_t v22;
  void *v23;
  NSSet *v24;
  NSSet *v25;
  NSSet *personalizationItems;
  UIViewController *v27;
  void *v28;
  NSDictionary *presentationOptions;
  void *v30;
  void *v31;
  void *v32;
  SUUINavigationBarController *navigationBarController;
  void *v34;
  NSArray *v35;
  NSArray *searchBarControllers;
  SUUINavigationBarController *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  SUUIToolbarController *toolbarController;
  void *v47;
  SUUIToolbarController *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  int *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  int v58;
  void *v59;
  __int16 v60;
  double v61;
  __int16 v62;
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!self->_pageResponseAbsoluteTime)
    goto LABEL_13;
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldLog");
  if (objc_msgSend(v5, "shouldLogToDisk"))
    v7 = v6 | 2;
  else
    v7 = v6;
  objc_msgSend(v5, "OSLogObject");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    v9 = v7;
  else
    v9 = v7 & 2;
  if (!v9)
    goto LABEL_11;
  v10 = (void *)objc_opt_class();
  v11 = v10;
  Current = CFAbsoluteTimeGetCurrent();
  -[NSNumber doubleValue](self->_pageResponseAbsoluteTime, "doubleValue");
  v14 = Current - v13;
  -[NSDictionary objectForKey:](self->_presentationOptions, "objectForKey:", CFSTR("url"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = 138412802;
  v59 = v10;
  v60 = 2048;
  v61 = v14;
  v62 = 2112;
  v63 = v15;
  LODWORD(v55) = 32;
  v54 = &v58;
  v16 = (void *)_os_log_send_and_compose_impl();

  if (v16)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v16, 4, &v58, v55);
    v8 = objc_claimAutoreleasedReturnValue();
    free(v16);
    v54 = (int *)v8;
    SSFileLog();
LABEL_11:

  }
  pageResponseAbsoluteTime = self->_pageResponseAbsoluteTime;
  self->_pageResponseAbsoluteTime = 0;

LABEL_13:
  objc_msgSend(MEMORY[0x24BDBCE60], "date", v54);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "timeIntervalSince1970");
  v20 = v19;

  objc_msgSend(v4, "templateElement");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v22 = objc_msgSend(v21, "elementType");
  else
    v22 = 0;
  +[SUUIItemStateCenter defaultCenter](SUUIItemStateCenter, "defaultCenter");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = self->_personalizationItems;
  objc_msgSend(v21, "personalizationLibraryItems");
  v25 = (NSSet *)objc_claimAutoreleasedReturnValue();
  personalizationItems = self->_personalizationItems;
  self->_personalizationItems = v25;

  if (-[NSSet count](self->_personalizationItems, "count"))
    objc_msgSend(v23, "beginObservingLibraryItems:", self->_personalizationItems);
  if (-[NSSet count](v24, "count"))
    objc_msgSend(v23, "endObservingLibraryItems:", v24);
  if (v22 == self->_templateViewElementType)
  {
    v27 = self->_childViewController;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[UIViewController documentDidUpdate:](v27, "documentDidUpdate:", v4);
    if (SUUIViewControllerIsVisible(self->_childViewController))
    {
      v57 = *MEMORY[0x24BDBCB80];
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v57, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "performSelector:withObject:afterDelay:inModes:", sel_onUpdate, 0, v28, 0.0);

    }
  }
  else
  {
    if (v22)
    {
      presentationOptions = self->_presentationOptions;
      -[SUUIViewController clientContext](self, "clientContext");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[SUUIDocumentContainerViewController _newViewControllerWithTemplateElement:options:clientContext:](self, "_newViewControllerWithTemplateElement:options:clientContext:", v21, presentationOptions, v30);

    }
    else
    {
      v27 = 0;
    }
    -[SUUIDocumentContainerViewController _setChildViewController:](self, "_setChildViewController:", v27);
    self->_templateViewElementType = v22;
  }

  -[SUUIDocumentContainerViewController _navigationBarViewElement](self, "_navigationBarViewElement");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIDocumentContainerViewController navigationItem](self, "navigationItem");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  navigationBarController = self->_navigationBarController;
  v56 = v4;
  if (v31)
  {
    -[SUUINavigationBarController navigationBarViewElement](navigationBarController, "navigationBarViewElement");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34 == v31)
    {
      -[SUUINavigationBarController updateNavigationItem:](self->_navigationBarController, "updateNavigationItem:", v32);
      -[SUUIDocumentContainerViewController _reloadNavigationPalette](self, "_reloadNavigationPalette");
    }
    else
    {
      -[SUUIDocumentContainerViewController _reloadNavigationBarController](self, "_reloadNavigationBarController");
    }
  }
  else
  {
    -[SUUINavigationBarController existingSearchBarControllers](navigationBarController, "existingSearchBarControllers");
    v35 = (NSArray *)objc_claimAutoreleasedReturnValue();
    searchBarControllers = self->_searchBarControllers;
    self->_searchBarControllers = v35;

    -[SUUINavigationBarController detachFromNavigationItem:](self->_navigationBarController, "detachFromNavigationItem:", v32);
    -[SUUINavigationBarController setParentViewController:](self->_navigationBarController, "setParentViewController:", 0);
    v37 = self->_navigationBarController;
    self->_navigationBarController = 0;

  }
  -[SUUIDocumentContainerViewController prefersNavigationBarHidden](self, "prefersNavigationBarHidden");
  if (-[SUUIDocumentContainerViewController _shouldFillNavigationBarContentsBasedOnNavigationBarViewElement](self, "_shouldFillNavigationBarContentsBasedOnNavigationBarViewElement"))
  {
    v38 = objc_msgSend(v31, "hidesBackButton");
    -[SUUIDocumentContainerViewController navigationItem](self, "navigationItem");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setHidesBackButton:", v38);

    objc_msgSend(v31, "style");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "visibility");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "isEqualToString:", CFSTR("hidden"));

    -[SUUIDocumentContainerViewController navigationController](self, "navigationController");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setNavigationBarHidden:animated:", v42, 0);

  }
  -[SUUIDocumentContainerViewController _reloadDefaultBarButtonItems](self, "_reloadDefaultBarButtonItems");
  -[SUUIDocumentContainerViewController _toolbarViewElement](self, "_toolbarViewElement");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIDocumentContainerViewController navigationController](self, "navigationController");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  toolbarController = self->_toolbarController;
  if (v44)
  {
    -[SUUIToolbarController toolbarViewElement](toolbarController, "toolbarViewElement");
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    if (v47 == v44)
      -[SUUIToolbarController updateToolbarForNavigationController:](self->_toolbarController, "updateToolbarForNavigationController:", v45);
    else
      -[SUUIDocumentContainerViewController _reloadToolbar](self, "_reloadToolbar");
  }
  else
  {
    -[SUUIToolbarController detachFromNavigationController:](toolbarController, "detachFromNavigationController:", v45);
    -[SUUIToolbarController setDelegate:](self->_toolbarController, "setDelegate:", 0);
    v48 = self->_toolbarController;
    self->_toolbarController = 0;

  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "postNotificationName:object:", CFSTR("SUUIApplicationPageDidUpdateNotification"), self);

  -[SUUIDocumentContainerViewController domChangeTimingQueue](self, "domChangeTimingQueue");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "oldestPendingChange");
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  if (v51)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "timeIntervalSince1970");
    objc_msgSend(v51, "setRenderEndTime:");

    objc_msgSend(v51, "setRenderStartTime:", v20);
    -[SUUIDocumentContainerViewController pageRenderEvent](self, "pageRenderEvent");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "addDOMChange:", v51);

  }
  -[SUUIDocumentContainerViewController _submitPageRenderIfPossible](self, "_submitPageRenderIfPossible");

}

- (void)documentScrollToTop:(id)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  id v7;

  -[SUUIDocumentContainerViewController contentScrollView](self, "contentScrollView", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v7 = v3;
    objc_msgSend(v3, "contentOffset");
    v5 = v4;
    objc_msgSend(v7, "contentInset");
    objc_msgSend(v7, "setContentOffset:animated:", 0, v5, -v6);
    v3 = v7;
  }

}

- (id)impressionableViewElementsForDocument:(id)a3
{
  UIViewController *v3;
  void *v4;

  v3 = self->_childViewController;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UIViewController impressionableViewElements](v3, "impressionableViewElements");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)documentDidSendMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", 0x251210E68);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", 0x251210E88);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "isEqualToString:", 0x251210DC8))
  {
    -[SUUIDocumentContainerViewController _onReportPlatformJsonTimes:](self, "_onReportPlatformJsonTimes:", v7);
  }
  else if (objc_msgSend(v8, "isEqualToString:", 0x251210DE8))
  {
    -[SUUIDocumentContainerViewController _onReportDOMChange:](self, "_onReportDOMChange:", v7);
  }
  else if (objc_msgSend(v8, "isEqualToString:", 0x251210E08))
  {
    -[SUUIDocumentContainerViewController _onReportRequestTimes:](self, "_onReportRequestTimes:", v7);
  }
  else if (objc_msgSend(v8, "isEqualToString:", 0x251210E28))
  {
    -[SUUIDocumentContainerViewController _onReportDocumentReady:](self, "_onReportDocumentReady:", v7);
  }

}

- (void)resourceLoaderDidBeginLoading:(id)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  id v11;

  -[SUUIDocumentContainerViewController pageRenderEvent](self, "pageRenderEvent", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resourceRequestStartTime");
  v6 = v5;

  if (v6 < 2.22044605e-16)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSince1970");
    v9 = v8;
    -[SUUIDocumentContainerViewController pageRenderEvent](self, "pageRenderEvent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setResourceRequestStartTime:", v9);

  }
  -[SUUIDocumentContainerViewController pageRenderEvent](self, "pageRenderEvent");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setResourceRequestEndTime:", 0.0);

}

- (void)resourceLoader:(id)a3 didLoadAllForReason:(int64_t)a4
{
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  if (a4 == 1)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSince1970");
    v8 = v7;
    -[SUUIDocumentContainerViewController pageRenderEvent](self, "pageRenderEvent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setResourceRequestOnScreenEndTime:", v8);

  }
  if (objc_msgSend(v15, "isIdle"))
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSince1970");
    v12 = v11;
    -[SUUIDocumentContainerViewController pageRenderEvent](self, "pageRenderEvent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setResourceRequestEndTime:", v12);

    -[SUUIDocumentContainerViewController _submitPageRenderIfPossible](self, "_submitPageRenderIfPossible");
  }
  else
  {
    -[SUUIDocumentContainerViewController pageRenderEvent](self, "pageRenderEvent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setResourceRequestEndTime:", 0.0);

  }
}

- (id)mediaQueryEvaluator:(id)a3 valueForKey:(id)a4
{
  id v5;
  void *v6;
  double height;
  void *v8;
  void *v10;

  v5 = a4;
  if (objc_msgSend(v5, "isEqualToString:", 0x2511FED48))
  {
    v6 = (void *)MEMORY[0x24BDD16E0];
    height = self->_viewSize.height;
LABEL_5:
    objc_msgSend(v6, "numberWithDouble:", height);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  if (objc_msgSend(v5, "isEqualToString:", 0x2511FEE08))
  {
    v6 = (void *)MEMORY[0x24BDD16E0];
    height = self->_viewSize.width;
    goto LABEL_5;
  }
  if (objc_msgSend(v5, "isEqualToString:", 0x2512120C8))
  {
    objc_msgSend(MEMORY[0x24BEC8BC8], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    SUUIMediaQueryNetworkTypeString(objc_msgSend(v10, "networkType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
LABEL_6:

  return v8;
}

- (void)mediaQueryEvaluatorDidChange:(id)a3
{
  SUUIMediaQueryEvaluator *mediaQueryEvaluator;
  char v5;
  UIViewController *childViewController;
  IKAppDocument *document;

  -[SUUIMediaQueryEvaluator setDelegate:](self->_mediaQueryEvaluator, "setDelegate:", self);
  mediaQueryEvaluator = self->_mediaQueryEvaluator;
  self->_mediaQueryEvaluator = 0;

  -[IKAppDocument setViewElementStylesDirty](self->_document, "setViewElementStylesDirty");
  if (-[UIViewController conformsToProtocol:](self->_childViewController, "conformsToProtocol:", &unk_25719F978))
  {
    v5 = objc_opt_respondsToSelector();
    childViewController = self->_childViewController;
    document = self->_document;
    if ((v5 & 1) != 0)
      -[UIViewController documentMediaQueriesDidUpdate:](childViewController, "documentMediaQueriesDidUpdate:", document);
    else
      -[UIViewController documentDidUpdate:](childViewController, "documentDidUpdate:", document);
  }
}

- (void)getModalSourceViewForElementIdentifier:(id)a3 completionBlock:(id)a4
{
  void (**v6)(id, SUUIModalSourceViewProvider *);
  void *v7;
  SUUIModalSourceViewProvider *v8;
  SUUIModalSourceViewProvider *v9;
  id v10;

  v10 = a3;
  v6 = (void (**)(id, SUUIModalSourceViewProvider *))a4;
  -[SUUINavigationBarController barButtonItemForElementIdentifier:](self->_navigationBarController, "barButtonItemForElementIdentifier:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = objc_alloc_init(SUUIModalSourceViewProvider);
    -[SUUIModalSourceViewProvider setSourceButtonBarItem:](v8, "setSourceButtonBarItem:", v7);
    v6[2](v6, v8);
  }
  else
  {
    -[SUUINavigationBarController viewForElementIdentifier:](self->_navigationBarController, "viewForElementIdentifier:", v10);
    v8 = (SUUIModalSourceViewProvider *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = objc_alloc_init(SUUIModalSourceViewProvider);
      -[SUUIModalSourceViewProvider setOriginalSourceView:](v9, "setOriginalSourceView:", v8);
      v6[2](v6, v9);

    }
    else if ((-[UIViewController conformsToProtocol:](self->_childViewController, "conformsToProtocol:", &unk_257211EF0) & 1) != 0)
    {
      -[UIViewController getModalSourceViewForElementIdentifier:completionBlock:](self->_childViewController, "getModalSourceViewForElementIdentifier:completionBlock:", v10, v6);
    }
    else
    {
      v6[2](v6, 0);
    }
  }

}

- (id)additionalLeftBarButtonItemForNavigationBarController:(id)a3
{
  void *v4;
  void *v5;

  -[SUUIViewController clientContext](self, "clientContext", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "additionalLeftBarButtonItemForDocumentContainerViewController:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)additionalRightBarButtonItemForNavigationBarController:(id)a3
{
  void *v4;
  void *v5;

  -[SUUIViewController clientContext](self, "clientContext", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "additionalRightBarButtonItemForDocumentContainerViewController:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)navigationBarTitleTextTintColor
{
  void *v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UIViewController navigationBarTitleTextTintColor](self->_childViewController, "navigationBarTitleTextTintColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (int64_t)navigationBarTintAdjustmentMode
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[UIViewController navigationBarTintAdjustmentMode](self->_childViewController, "navigationBarTintAdjustmentMode");
  else
    return 0;
}

- (id)navigationBarTintColor
{
  void *v3;
  void *v4;

  if (-[UIViewController conformsToProtocol:](self->_childViewController, "conformsToProtocol:", &unk_257201C40))
  {
    -[UIViewController navigationBarTintColor](self->_childViewController, "navigationBarTintColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SUUIDocumentContainerViewController _navigationBarViewElement](self, "_navigationBarViewElement");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tintColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (BOOL)prefersNavigationBarBackgroundViewHidden
{
  void *v4;
  char v5;

  if (-[UIViewController conformsToProtocol:](self->_childViewController, "conformsToProtocol:", &unk_257201C40))return -[UIViewController prefersNavigationBarBackgroundViewHidden](self->_childViewController, "prefersNavigationBarBackgroundViewHidden");
  -[SUUIDocumentContainerViewController _navigationBarViewElement](self, "_navigationBarViewElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isTransparent");

  return v5;
}

- (BOOL)prefersNavigationBarHidden
{
  if (-[UIViewController conformsToProtocol:](self->_childViewController, "conformsToProtocol:", &unk_257201C40)&& (objc_opt_respondsToSelector() & 1) != 0)
  {
    return -[UIViewController prefersNavigationBarHidden](self->_childViewController, "prefersNavigationBarHidden");
  }
  else
  {
    return 0;
  }
}

- (UIView)navigationPaletteView
{
  void *v3;

  -[SUUINavigationBarController navigationPaletteView](self->_navigationBarController, "navigationPaletteView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    if (-[UIViewController conformsToProtocol:](self->_childViewController, "conformsToProtocol:", &unk_25719F978)&& (objc_opt_respondsToSelector() & 1) != 0)
    {
      -[UIViewController navigationPaletteView](self->_childViewController, "navigationPaletteView");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }
  }
  return (UIView *)v3;
}

- (void)scrollingTabAppearanceStatusWasUpdated:(id)a3
{
  $D35E09B864CB17FEE2308AEA3FA0107F *p_scrollingTabAppearanceStatus;

  p_scrollingTabAppearanceStatus = &self->_scrollingTabAppearanceStatus;
  self->_scrollingTabAppearanceStatus = ($D35E09B864CB17FEE2308AEA3FA0107F)a3;
  if (-[UIViewController conformsToProtocol:](self->_childViewController, "conformsToProtocol:", &unk_25719F6E0))-[UIViewController scrollingTabAppearanceStatusWasUpdated:](self->_childViewController, "scrollingTabAppearanceStatusWasUpdated:", *(_QWORD *)&p_scrollingTabAppearanceStatus->progress, *(_QWORD *)&p_scrollingTabAppearanceStatus->isBouncingOffTheEdge);
}

- (UIScrollView)scrollingTabNestedPagingScrollView
{
  void *v3;

  if (-[UIViewController conformsToProtocol:](self->_childViewController, "conformsToProtocol:", &unk_25719F7A8))
  {
    -[UIViewController scrollingTabNestedPagingScrollView](self->_childViewController, "scrollingTabNestedPagingScrollView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (UIScrollView *)v3;
}

- (id)scrollingTabViewControllerInNestedPagingScrollViewAtPageIndex:(unint64_t)a3
{
  void *v5;

  if (-[UIViewController conformsToProtocol:](self->_childViewController, "conformsToProtocol:", &unk_25719F7A8))
  {
    -[UIViewController scrollingTabViewControllerInNestedPagingScrollViewAtPageIndex:](self->_childViewController, "scrollingTabViewControllerInNestedPagingScrollViewAtPageIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)performTestWithName:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  char v8;

  v6 = a3;
  v7 = a4;
  if (-[UIViewController conformsToProtocol:](self->_childViewController, "conformsToProtocol:", &unk_2571C66C8))v8 = -[UIViewController performTestWithName:options:](self->_childViewController, "performTestWithName:options:", v6, v7);
  else
    v8 = 0;

  return v8;
}

- (void)_onReportPlatformJsonTimes:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  id v18;

  v18 = a3;
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("jsonParseStartTime"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[SUUIDocumentContainerViewController pageRenderEvent](self, "pageRenderEvent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "platformJsonParseStartTime");
    v7 = v6;

    if (v7 < 2.22044605e-16)
    {
      +[SUUIMetricsUtilities timeIntervalFromJSTime:](SUUIMetricsUtilities, "timeIntervalFromJSTime:", v4);
      v9 = v8;
      -[SUUIDocumentContainerViewController pageRenderEvent](self, "pageRenderEvent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setPlatformJsonParseStartTime:", v9);

    }
  }
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("jsonParseEndTime"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[SUUIDocumentContainerViewController pageRenderEvent](self, "pageRenderEvent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "platformJsonParseEndTime");
    v14 = v13;

    if (v14 < 2.22044605e-16)
    {
      +[SUUIMetricsUtilities timeIntervalFromJSTime:](SUUIMetricsUtilities, "timeIntervalFromJSTime:", v11);
      v16 = v15;
      -[SUUIDocumentContainerViewController pageRenderEvent](self, "pageRenderEvent");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setPlatformJsonParseEndTime:", v16);

    }
  }

}

- (void)_onReportDOMChange:(id)a3
{
  id v4;
  void *v5;
  SUUIMetricsDOMChange *v6;

  v4 = a3;
  v6 = -[SUUIMetricsDOMChange initWithReportDomBuildTimesMessagePayload:]([SUUIMetricsDOMChange alloc], "initWithReportDomBuildTimesMessagePayload:", v4);

  if (v6)
  {
    -[SUUIDocumentContainerViewController domChangeTimingQueue](self, "domChangeTimingQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addPendingChange:", v6);

  }
}

- (void)_onReportRequestTimes:(id)a3
{
  void *v4;
  SUUIMetricsRequestInfo *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[SUUIDocumentContainerViewController pageRenderEvent](self, "pageRenderEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = -[SUUIMetricsRequestInfo initWithReportRequestTimesMessagePayload:]([SUUIMetricsRequestInfo alloc], "initWithReportRequestTimesMessagePayload:", v7);
    if (v5)
    {
      -[SUUIDocumentContainerViewController pageRenderEvent](self, "pageRenderEvent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addRequest:", v5);

    }
  }

}

- (void)_onReportDocumentReady:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  id v20;

  v20 = a3;
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("clientCorrelationKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("clientCorrelationKey"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIDocumentContainerViewController pageRenderEvent](self, "pageRenderEvent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setClientCorrelationKey:", v5);

  }
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("metricsBase"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("metricsBase"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIDocumentContainerViewController pageRenderEvent](self, "pageRenderEvent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setMetricsBase:", v8);

  }
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("documentReadyTime"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("documentReadyTime"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[SUUIMetricsUtilities timeIntervalFromJSTime:](SUUIMetricsUtilities, "timeIntervalFromJSTime:", v11);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSince1970");
  }
  v13 = v12;
  -[SUUIDocumentContainerViewController pageRenderEvent](self, "pageRenderEvent");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPageUserReadyTime:", v13);

  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("userInteractionTime"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("userInteractionTime"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[SUUIMetricsUtilities timeIntervalFromJSTime:](SUUIMetricsUtilities, "timeIntervalFromJSTime:", v16);
    v18 = v17;
    -[SUUIDocumentContainerViewController pageRenderEvent](self, "pageRenderEvent");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setPageRequestedTime:", v18);

  }
  -[SUUIDocumentContainerViewController _submitPageRenderIfPossible](self, "_submitPageRenderIfPossible");

}

- (void)_submitPageRenderIfPossible
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;

  -[SUUIDocumentContainerViewController pageRenderEvent](self, "pageRenderEvent");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v14, "isReadyForSubmission") & 1) != 0)
  {
    -[SUUIDocumentContainerViewController domChangeTimingQueue](self, "domChangeTimingQueue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEmpty");

    if (v4)
    {
      -[SUUIDocumentContainerViewController pageRenderEvent](self, "pageRenderEvent");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIViewController clientContext](self, "clientContext");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendSamplingPropertiesFromClientContext:", v6);

      -[SUUIViewController clientContext](self, "clientContext");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_applicationController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIDocumentContainerViewController pageRenderEvent](self, "pageRenderEvent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "recordMetricsEvent:flushImmediately:", v9, 0);

      if (+[SUUIMetricsUtilities shouldLogTimingMetrics](SUUIMetricsUtilities, "shouldLogTimingMetrics"))
      {
        SSDebugLevel();
        SSDebugFileLevel();
        -[SUUIDocumentContainerViewController pageRenderEvent](self, "pageRenderEvent");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        SSDebugLog();

      }
      if (+[SUUIMetricsUtilities showEventNotifications](SUUIMetricsUtilities, "showEventNotifications", v13))
      {
        -[SUUIDocumentContainerViewController pageRenderEvent](self, "pageRenderEvent");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[SUUIStatusBarAlertCenter sharedCenter](SUUIStatusBarAlertCenter, "sharedCenter");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v15[0] = MEMORY[0x24BDAC760];
        v15[1] = 3221225472;
        v15[2] = __66__SUUIDocumentContainerViewController__submitPageRenderIfPossible__block_invoke;
        v15[3] = &unk_2511F47C0;
        v16 = v10;
        v12 = v10;
        objc_msgSend(v11, "showMessage:withStyle:forDuration:actionBlock:", CFSTR("Page Rendered"), 0, v15, 0.0);

      }
      -[SUUIDocumentContainerViewController setPageRenderEvent:](self, "setPageRenderEvent:", 0);
      -[SUUIDocumentContainerViewController setDomChangeTimingQueue:](self, "setDomChangeTimingQueue:", 0);
    }
  }
  else
  {

  }
}

uint64_t __66__SUUIDocumentContainerViewController__submitPageRenderIfPossible__block_invoke(uint64_t a1)
{
  return +[SUUIObjectInspectorViewController showInspectableObject:](SUUIObjectInspectorViewController, "showInspectableObject:", *(_QWORD *)(a1 + 32));
}

- (void)_reloadNavigationItemContents
{
  id v3;

  if (-[SUUIDocumentContainerViewController _shouldFillNavigationBarContentsBasedOnNavigationBarViewElement](self, "_shouldFillNavigationBarContentsBasedOnNavigationBarViewElement"))
  {
    -[SUUIDocumentContainerViewController navigationItem](self, "navigationItem");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[SUUINavigationBarController detachFromNavigationItem:](self->_navigationBarController, "detachFromNavigationItem:", v3);
    -[SUUINavigationBarController attachToNavigationItem:](self->_navigationBarController, "attachToNavigationItem:", v3);

  }
}

- (BOOL)_makeSearchBarFirstResponderOnLoad
{
  return self->_makeSearchBarFirstResponderOnLoad;
}

- (BOOL)_selectSearchBarContentOnBecomingFirstResponder
{
  return self->_selectSearchBarContentOnBecomingFirstResponder;
}

- (void)_setMakeSearchBarFirstResponderOnLoad:(BOOL)a3
{
  self->_makeSearchBarFirstResponderOnLoad = a3;
}

- (void)_setSelectSearchBarContentOnBecomingFirstResponder:(BOOL)a3
{
  self->_selectSearchBarContentOnBecomingFirstResponder = a3;
}

- (void)_networkTypeChangeNotification:(id)a3
{
  dispatch_time_t v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v3 = dispatch_time(0, 5000000000);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __70__SUUIDocumentContainerViewController__networkTypeChangeNotification___block_invoke;
  v4[3] = &unk_2511F53F8;
  objc_copyWeak(&v5, &location);
  dispatch_after(v3, MEMORY[0x24BDAC9B8], v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __70__SUUIDocumentContainerViewController__networkTypeChangeNotification___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_reloadPageData");

}

- (void)_SUUI_applicationDidEnterBackground:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  id v10;

  -[SUUIDocumentContainerViewController pageRenderEvent](self, "pageRenderEvent", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSince1970");
    v7 = v6;
    -[SUUIDocumentContainerViewController pageRenderEvent](self, "pageRenderEvent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPageDisappearTime:", v7);

  }
  if (SUUIViewControllerIsVisible(self))
    -[IKAppDocument onDisappear](self->_document, "onDisappear");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x24BEBE008];
  objc_msgSend(v10, "removeObserver:name:object:", self, *MEMORY[0x24BEBE008], 0);
  objc_msgSend(v10, "addObserver:selector:name:object:", self, sel__SUUI_applicationWillEnterForeground_, v9, 0);

}

- (void)_SUUI_applicationWillEnterForeground:(id)a3
{
  id v4;

  if (SUUIViewControllerIsVisible(self))
    -[IKAppDocument onAppear](self->_document, "onAppear");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x24BEBE008], 0);

}

- (void)_enqueueLoadURLOperation
{
  void *v3;
  void *v4;
  SSVLoadURLOperation *v5;
  SSVLoadURLOperation *loadURLOperation;
  SSVLoadURLOperation *v7;
  void *v8;
  SSVLoadURLOperation *v9;
  void *v10;
  int v11;
  int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSString *urlString;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *, void *);
  void *v24;
  id v25;
  id location;
  int v27;
  void *v28;
  __int16 v29;
  NSString *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", self->_urlString);
  -[SUUIViewController clientContext](self, "clientContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (SSVLoadURLOperation *)objc_msgSend(v4, "newLoadStoreURLOperationWithURL:", v3);
  loadURLOperation = self->_loadURLOperation;
  self->_loadURLOperation = v5;

  v7 = self->_loadURLOperation;
  +[SSVURLDataConsumer consumer](SUUIURLResolverDataConsumer, "consumer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSVLoadURLOperation setDataConsumer:](v7, "setDataConsumer:", v8);

  objc_initWeak(&location, self);
  v9 = self->_loadURLOperation;
  v21 = MEMORY[0x24BDAC760];
  v22 = 3221225472;
  v23 = __63__SUUIDocumentContainerViewController__enqueueLoadURLOperation__block_invoke;
  v24 = &unk_2511FE0A0;
  objc_copyWeak(&v25, &location);
  -[SSVLoadURLOperation setOutputBlock:](v9, "setOutputBlock:", &v21);
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "shouldLog");
  v12 = objc_msgSend(v10, "shouldLogToDisk");
  objc_msgSend(v10, "OSLogObject");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12)
    v11 |= 2u;
  if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    v11 &= 2u;
  if (!v11)
    goto LABEL_8;
  v15 = (void *)objc_opt_class();
  urlString = self->_urlString;
  v27 = 138412546;
  v28 = v15;
  v29 = 2112;
  v30 = urlString;
  v17 = v15;
  LODWORD(v20) = 22;
  v18 = (void *)_os_log_send_and_compose_impl();

  if (v18)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v18, 4, &v27, v20, v21, v22, v23, v24);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    free(v18);
    SSFileLog();
LABEL_8:

  }
  -[SUUIViewController operationQueue](self, "operationQueue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addOperation:", self->_loadURLOperation);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

}

void __63__SUUIDocumentContainerViewController__enqueueLoadURLOperation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__SUUIDocumentContainerViewController__enqueueLoadURLOperation__block_invoke_2;
  block[3] = &unk_2511F5128;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v12);
}

void __63__SUUIDocumentContainerViewController__enqueueLoadURLOperation__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_finishLoadOperationWithResponse:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_finishLegacyProtocolOperationForResponse:(id)a3 dataProvider:(id)a4 dictionary:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSString *v12;
  NSString *urlString;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  IKAppDocument *document;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  v8 = a5;
  objc_msgSend(a4, "redirectURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[SUUIDocumentContainerViewController _redirectToURL:](self, "_redirectToURL:", v9);
  }
  else
  {
    objc_msgSend(v21, "URLResponse");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "absoluteString");
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    urlString = self->_urlString;
    self->_urlString = v12;

    -[SUUIDocumentContainerViewController _setChildViewController:](self, "_setChildViewController:", 0);
    objc_msgSend(v8, "objectForKey:", *MEMORY[0x24BEC8C90]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC8B90]), "initWithDialogDictionary:", v14),
          v16 = objc_msgSend(v15, "kind"),
          v15,
          v16 != 1))
    {
      -[SUUIViewController clientContext](self, "clientContext");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      document = self->_document;
      objc_msgSend(v21, "data");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "URLResponse");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "sendOnPageResponseWithDocument:data:URLResponse:performanceMetrics:", document, v19, v20, 0);

    }
  }

}

- (void)_finishLoadOperationWithResponse:(id)a3 error:(id)a4
{
  id v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  int v36;
  NSObject *v37;
  int v38;
  void *v39;
  NSString *v40;
  id v41;
  void *v42;
  _BYTE *v43;
  void *v44;
  int v45;
  NSObject *v46;
  int v47;
  void *v48;
  NSString *urlString;
  id v50;
  void *v51;
  _BYTE *v52;
  void *v53;
  void *v54;
  void *v55;
  SUUIErrorDocumentViewController *v56;
  void *v57;
  SUUIErrorDocumentViewController *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  SUUILegacyNativeViewController *v64;
  void *v65;
  SUUILegacyNativeViewController *v66;
  void *v67;
  void *v68;
  NSNumber *v69;
  NSNumber *pageResponseAbsoluteTime;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  IKAppDocument *document;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  NSString *v81;
  SSVLoadURLOperation *loadURLOperation;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  _BYTE *v88;
  uint64_t v89;
  void *v90;
  void *v91;
  NSString *v92;
  _QWORD v93[4];
  id v94;
  id v95;
  id v96;
  id v97;
  id from;
  _QWORD v99[4];
  id v100;
  _QWORD v101[3];
  _QWORD v102[3];
  _BYTE location[12];
  __int16 v104;
  NSString *v105;
  __int16 v106;
  NSString *v107;
  uint64_t v108;

  v108 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (NSString *)a4;
  v92 = v7;
  if (v6 && !v7)
  {
    objc_msgSend(v6, "URLResponse");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "allHeaderFields");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    ISDictionaryValueForCaseInsensitiveString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      objc_msgSend(v91, "MIMEType");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[SSVLoadURLOperation metricsPageEvent](self->_loadURLOperation, "metricsPageEvent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[SUUIDocumentContainerViewController pageRenderEvent](self, "pageRenderEvent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "clientCorrelationKey");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        objc_msgSend(v10, "clientCorrelationKey");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUUIDocumentContainerViewController pageRenderEvent](self, "pageRenderEvent");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setClientCorrelationKey:", v13);

        objc_msgSend(v10, "requestStartTime");
        v16 = v15;
        -[SUUIDocumentContainerViewController pageRenderEvent](self, "pageRenderEvent");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setPlatformRequestStartTime:", v16);

        objc_msgSend(v10, "responseStartTime");
        v19 = v18;
        -[SUUIDocumentContainerViewController pageRenderEvent](self, "pageRenderEvent");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setPlatformResponseStartTime:", v19);

        objc_msgSend(v10, "responseEndTime");
        v22 = v21;
        -[SUUIDocumentContainerViewController pageRenderEvent](self, "pageRenderEvent");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setPlatformResponseEndTime:", v22);

        v24 = objc_msgSend(v10, "isCachedResponse");
        -[SUUIDocumentContainerViewController pageRenderEvent](self, "pageRenderEvent");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setPlatformResponseWasCached:", v24);

      }
    }
    if (objc_msgSend(v9, "rangeOfString:options:", CFSTR("itml"), 1) != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v44, "shouldLog");
      if (objc_msgSend(v44, "shouldLogToDisk"))
        v45 |= 2u;
      objc_msgSend(v44, "OSLogObject");
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
        v47 = v45;
      else
        v47 = v45 & 2;
      if (v47)
      {
        v48 = (void *)objc_opt_class();
        urlString = self->_urlString;
        *(_DWORD *)location = 138412546;
        *(_QWORD *)&location[4] = v48;
        v104 = 2112;
        v105 = urlString;
        v50 = v48;
        LODWORD(v89) = 22;
        v88 = location;
        v51 = (void *)_os_log_send_and_compose_impl();

        if (v51)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v51, 4, location, v89);
          v52 = (_BYTE *)objc_claimAutoreleasedReturnValue();
          free(v51);
          v88 = v52;
          SSFileLog();

        }
      }
      else
      {

      }
      v69 = (NSNumber *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithDouble:", CFAbsoluteTimeGetCurrent());
      pageResponseAbsoluteTime = self->_pageResponseAbsoluteTime;
      self->_pageResponseAbsoluteTime = v69;

      v101[0] = CFSTR("requestStartTime");
      objc_msgSend(v10, "requestStartTime");
      +[SUUIMetricsUtilities jsTimeFromTimeInterval:](SUUIMetricsUtilities, "jsTimeFromTimeInterval:");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v102[0] = v71;
      v101[1] = CFSTR("responseStartTime");
      objc_msgSend(v10, "responseStartTime");
      +[SUUIMetricsUtilities jsTimeFromTimeInterval:](SUUIMetricsUtilities, "jsTimeFromTimeInterval:");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v102[1] = v72;
      v101[2] = CFSTR("responseEndTime");
      objc_msgSend(v10, "responseEndTime");
      +[SUUIMetricsUtilities jsTimeFromTimeInterval:](SUUIMetricsUtilities, "jsTimeFromTimeInterval:");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v102[2] = v73;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v102, v101, 3);
      v74 = (void *)objc_claimAutoreleasedReturnValue();

      -[SUUIViewController clientContext](self, "clientContext");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      document = self->_document;
      objc_msgSend(v6, "data");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "URLResponse");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "sendOnPageResponseWithDocument:data:URLResponse:performanceMetrics:", document, v77, v78, v74);

      goto LABEL_42;
    }
    if (objc_msgSend(v9, "rangeOfString:options:", CFSTR("application/json"), 1) == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (objc_msgSend(v9, "rangeOfString:options:", CFSTR("html"), 1) == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (objc_msgSend(v9, "rangeOfString:options:", CFSTR("text/xml"), 1) != 0x7FFFFFFFFFFFFFFFLL)
        {
          v26 = (void *)MEMORY[0x24BDD1770];
          objc_msgSend(v6, "data");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "propertyListWithData:options:format:error:", v27, 0, 0, 0);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v28, "objectForKey:", CFSTR("page-type"));
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            if (v29
              && (objc_msgSend(v28, "objectForKey:", CFSTR("items")),
                  v30 = (void *)objc_claimAutoreleasedReturnValue(),
                  v30,
                  v29,
                  v30))
            {
              v31 = objc_alloc_init(MEMORY[0x24BEC8DC8]);
              objc_msgSend(v31, "loadFromDictionary:", v28);
              -[SSVLoadURLOperation URLRequest](self->_loadURLOperation, "URLRequest");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "URLResponse");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              -[SUUIDocumentContainerViewController _showLegacyStorePageWithRequest:page:pageType:URLResponse:](self, "_showLegacyStorePageWithRequest:page:pageType:URLResponse:", v32, v31, 0, v33);

            }
            else
            {
              v83 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC8C00]), "initWithPropertyList:", v28);
              objc_msgSend(MEMORY[0x24BEC8C08], "provider");
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v84, "setShouldProcessAuthenticationDialogs:", 1);
              objc_msgSend(v84, "setShouldProcessDialogs:", 0);
              objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
              v85 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v85, "activeAccount");
              v90 = (void *)objc_claimAutoreleasedReturnValue();

              if (v90)
              {
                v86 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1DC0]), "initWithAccount:", v90);
                objc_msgSend(v84, "setAuthenticationContext:", v86);

              }
              objc_msgSend(v83, "setDataProvider:", v84);
              objc_initWeak((id *)location, v83);
              objc_initWeak(&from, self);
              v93[0] = MEMORY[0x24BDAC760];
              v93[1] = 3221225472;
              v93[2] = __78__SUUIDocumentContainerViewController__finishLoadOperationWithResponse_error___block_invoke_225;
              v93[3] = &unk_2511FE0C8;
              objc_copyWeak(&v96, (id *)location);
              objc_copyWeak(&v97, &from);
              v94 = v6;
              v95 = v28;
              objc_msgSend(v83, "setCompletionBlock:", v93);
              -[SUUIViewController operationQueue](self, "operationQueue");
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v87, "addOperation:", v83);

              objc_destroyWeak(&v97);
              objc_destroyWeak(&v96);
              objc_destroyWeak(&from);
              objc_destroyWeak((id *)location);

            }
          }

        }
        goto LABEL_42;
      }
      -[SSVLoadURLOperation URLRequest](self->_loadURLOperation, "URLRequest");
      v66 = (SUUILegacyNativeViewController *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "data");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "URLResponse");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIDocumentContainerViewController _showLegacyStorePageWithRequest:page:pageType:URLResponse:](self, "_showLegacyStorePageWithRequest:page:pageType:URLResponse:", v66, v79, 1, v80);

    }
    else
    {
      v64 = [SUUILegacyNativeViewController alloc];
      objc_msgSend(v6, "data");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = -[SUUILegacyNativeViewController initWithData:fromOperation:](v64, "initWithData:fromOperation:", v65, self->_loadURLOperation);

      -[SUUIViewController clientContext](self, "clientContext");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIViewController setClientContext:](v66, "setClientContext:", v67);

      -[SUUIDocumentContainerViewController navigationItem](self, "navigationItem");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUILegacyNativeViewController _setExistingNavigationItem:](v66, "_setExistingNavigationItem:", v68);

      -[SUUILegacyNativeViewController reloadData](v66, "reloadData");
      -[SUUIDocumentContainerViewController _setChildViewController:](self, "_setChildViewController:", v66);
    }

LABEL_42:
    v81 = self->_urlString;
    self->_urlString = 0;

    goto LABEL_43;
  }
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "shouldLog");
  if (objc_msgSend(v34, "shouldLogToDisk"))
    v36 = v35 | 2;
  else
    v36 = v35;
  objc_msgSend(v34, "OSLogObject");
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    v38 = v36;
  else
    v38 = v36 & 2;
  if (v38)
  {
    v39 = (void *)objc_opt_class();
    v40 = self->_urlString;
    *(_DWORD *)location = 138412802;
    *(_QWORD *)&location[4] = v39;
    v104 = 2112;
    v105 = v92;
    v106 = 2112;
    v107 = v40;
    v41 = v39;
    LODWORD(v89) = 32;
    v88 = location;
    v42 = (void *)_os_log_send_and_compose_impl();

    if (v42)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v42, 4, location, v89);
      v43 = (_BYTE *)objc_claimAutoreleasedReturnValue();
      free(v42);
      v88 = v43;
      SSFileLog();

    }
  }
  else
  {

  }
  objc_storeStrong((id *)&self->_beforeErrorChildViewController, self->_childViewController);
  -[UIViewController view](self->_beforeErrorChildViewController, "view");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "backgroundColor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v54)
  {
    -[SUUIDocumentContainerViewController view](self, "view");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "backgroundColor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v56 = [SUUIErrorDocumentViewController alloc];
  -[SUUIViewController clientContext](self, "clientContext");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = -[SUUIErrorDocumentViewController initWithBackgroundColor:clientContext:](v56, "initWithBackgroundColor:clientContext:", v54, v57);

  objc_initWeak((id *)location, self);
  v99[0] = MEMORY[0x24BDAC760];
  v99[1] = 3221225472;
  v99[2] = __78__SUUIDocumentContainerViewController__finishLoadOperationWithResponse_error___block_invoke;
  v99[3] = &unk_2511F53F8;
  objc_copyWeak(&v100, (id *)location);
  -[SUUIErrorDocumentViewController setRetryActionBlock:](v58, "setRetryActionBlock:", v99);
  -[SUUIDocumentContainerViewController _setChildViewController:](self, "_setChildViewController:", v58);
  v59 = +[SUUIMetricsUtilities newErrorPageEvent](SUUIMetricsUtilities, "newErrorPageEvent");
  objc_msgSend(v59, "setPageURL:", self->_urlString);
  objc_msgSend(v59, "setPageType:", CFSTR("SUUIDocumentContainerViewController"));
  -[SUUIViewController clientContext](self, "clientContext");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "_applicationController");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "recordMetricsEvent:flushImmediately:", v59, 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEC8BC8], "sharedInstance");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "addObserver:selector:name:object:", self, sel__networkTypeChangeNotification_, *MEMORY[0x24BEC8B00], v63);

  objc_destroyWeak(&v100);
  objc_destroyWeak((id *)location);

LABEL_43:
  -[SSVLoadURLOperation setOutputBlock:](self->_loadURLOperation, "setOutputBlock:", 0, v88);
  loadURLOperation = self->_loadURLOperation;
  self->_loadURLOperation = 0;

}

void __78__SUUIDocumentContainerViewController__finishLoadOperationWithResponse_error___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  id v2;
  void *v3;
  void *v4;
  _QWORD *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "_reloadPageData");
    v2 = +[SUUIMetricsUtilities newErrorRetryClickEvent](SUUIMetricsUtilities, "newErrorRetryClickEvent");
    objc_msgSend(v2, "setPageURL:", v5[153]);
    objc_msgSend(v2, "setPageType:", CFSTR("SUUIDocumentContainerViewController"));
    objc_msgSend(v5, "clientContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_applicationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "recordMetricsEvent:flushImmediately:", v2, 0);

    WeakRetained = v5;
  }

}

void __78__SUUIDocumentContainerViewController__finishLoadOperationWithResponse_error___block_invoke_225(id *a1)
{
  id WeakRetained;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t);
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v4 = MEMORY[0x24BDAC760];
  v5 = 3221225472;
  v6 = __78__SUUIDocumentContainerViewController__finishLoadOperationWithResponse_error___block_invoke_2;
  v7 = &unk_2511F5420;
  objc_copyWeak(&v11, a1 + 7);
  v8 = a1[4];
  v3 = WeakRetained;
  v9 = v3;
  v10 = a1[5];
  dispatch_async(MEMORY[0x24BDAC9B8], &v4);
  objc_msgSend(v3, "setCompletionBlock:", 0, v4, v5, v6, v7);

  objc_destroyWeak(&v11);
}

void __78__SUUIDocumentContainerViewController__finishLoadOperationWithResponse_error___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "dataProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_finishLegacyProtocolOperationForResponse:dataProvider:dictionary:", v2, v3, *(_QWORD *)(a1 + 48));

}

- (id)_navigationBarViewElement
{
  void *v3;
  void *v4;

  if (-[SUUIDocumentContainerViewController _shouldFillNavigationBarContentsBasedOnNavigationBarViewElement](self, "_shouldFillNavigationBarContentsBasedOnNavigationBarViewElement"))
  {
    -[IKAppDocument navigationBarElement](self->_document, "navigationBarElement");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      -[IKAppDocument templateElement](self->_document, "templateElement");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v4, "navigationBarElement");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v3 = 0;
      }

    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)_toolbarViewElement
{
  return (id)-[IKAppDocument toolbarElement](self->_document, "toolbarElement");
}

- (id)_newViewControllerWithTemplateElement:(id)a3 options:(id)a4 clientContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  uint64_t v15;
  __objc2_class *v16;
  __objc2_class *v17;
  SUUIPhysicalCirclesDocumentViewController *v18;
  id v19;
  void *v20;
  int v21;
  __objc2_class **v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SUUIViewController clientContext](self, "clientContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "documentViewControllerForTemplateViewElement:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(v9, "objectForKey:", CFSTR("type"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqual:", 0x25120FF28);
    v15 = objc_msgSend(v8, "elementType");
    if (v15 <= 82)
    {
      if (v15 <= 36)
      {
        if (v15 > 26)
        {
          if (v15 == 27)
          {
            v16 = SUUIContentUnavailableDocumentViewController;
            goto LABEL_43;
          }
          if (v15 == 34)
          {
            v16 = SUUIEditorDocumentViewController;
            goto LABEL_43;
          }
        }
        else
        {
          if (v15 == 17)
          {
            v19 = v8;
            objc_msgSend(v19, "type");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("modern"));

            v22 = off_2511F2ED8;
            if (!v21)
              v22 = off_2511F2BF0;
            v12 = (void *)objc_msgSend(objc_alloc(*v22), "initWithTemplateElement:", v19);

            goto LABEL_45;
          }
          if (v15 == 25)
          {
            v16 = SUUICommentDocumentViewController;
LABEL_43:
            v18 = (SUUIPhysicalCirclesDocumentViewController *)objc_msgSend([v16 alloc], "initWithTemplateElement:", v8);
            goto LABEL_44;
          }
        }
        goto LABEL_45;
      }
      if (v15 <= 70)
      {
        if (v15 == 37)
        {
          v16 = SUUIExploreDocumentViewController;
          goto LABEL_43;
        }
        if (v15 == 65)
        {
          v16 = SUUILoadingDocumentViewController;
          goto LABEL_43;
        }
LABEL_45:

        goto LABEL_46;
      }
      if (v15 == 71)
      {
        v16 = SUUIMenuBarTemplateDocumentViewController;
        goto LABEL_43;
      }
      if (v15 != 78)
        goto LABEL_45;
      goto LABEL_30;
    }
    if (v15 > 120)
    {
      if (v15 <= 131)
      {
        if (v15 == 121)
        {
          v16 = SUUISignInDocumentViewController;
          goto LABEL_43;
        }
        if (v15 != 129)
          goto LABEL_45;
        v17 = SUUISplitViewDocumentViewController;
        goto LABEL_27;
      }
      if (v15 != 132)
      {
        if (v15 == 148)
        {
          v16 = SUUITrendingSearchDocumentViewController;
          goto LABEL_43;
        }
        goto LABEL_45;
      }
    }
    else
    {
      if (v15 <= 92)
      {
        if (v15 == 83)
        {
          v16 = SUUIPanelDocumentViewController;
          goto LABEL_43;
        }
        if (v15 != 85)
          goto LABEL_45;
LABEL_30:
        v18 = -[SUUIPhysicalCirclesDocumentViewController initWithPhysicalCirclesTemplateViewElement:]([SUUIPhysicalCirclesDocumentViewController alloc], "initWithPhysicalCirclesTemplateViewElement:", v8);
        goto LABEL_44;
      }
      if (v15 != 93)
      {
        if (v15 != 115)
          goto LABEL_45;
        v17 = SUUISettingsDocumentViewController;
LABEL_27:
        v18 = (SUUIPhysicalCirclesDocumentViewController *)objc_msgSend([v17 alloc], "initWithTemplateElement:clientContext:", v8, v10);
LABEL_44:
        v12 = v18;
        goto LABEL_45;
      }
    }
    v18 = -[SUUIStackDocumentViewController initWithTemplateElement:layoutStyle:]([SUUIStackDocumentViewController alloc], "initWithTemplateElement:layoutStyle:", v8, v14);
    goto LABEL_44;
  }
LABEL_46:
  objc_msgSend(v12, "setClientContext:", v10);

  return v12;
}

- (void)_redirectToURL:(id)a3
{
  SSVLoadURLOperation *loadURLOperation;
  id v5;
  SSVLoadURLOperation *v6;
  NSString *v7;
  NSString *urlString;

  loadURLOperation = self->_loadURLOperation;
  v5 = a3;
  -[SSVLoadURLOperation setOutputBlock:](loadURLOperation, "setOutputBlock:", 0);
  -[SSVLoadURLOperation cancel](self->_loadURLOperation, "cancel");
  v6 = self->_loadURLOperation;
  self->_loadURLOperation = 0;

  objc_msgSend(v5, "absoluteString");
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();

  urlString = self->_urlString;
  self->_urlString = v7;

  -[SUUIDocumentContainerViewController _enqueueLoadURLOperation](self, "_enqueueLoadURLOperation");
}

- (void)_reloadDefaultBarButtonItems
{
  UIViewController *v3;
  NSArray *v4;
  NSArray *defaultLeftBarButtonItems;
  void *v6;
  id v7;
  NSArray *v8;
  NSArray *v9;
  id v10;

  -[SUUIDocumentContainerViewController navigationItem](self, "navigationItem");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v3 = self->_childViewController;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UIViewController leftBarButtonItemsForDocument:](v3, "leftBarButtonItemsForDocument:", self->_document);
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  defaultLeftBarButtonItems = self->_defaultLeftBarButtonItems;
  if (defaultLeftBarButtonItems != v4 && !-[NSArray isEqualToArray:](defaultLeftBarButtonItems, "isEqualToArray:", v4))
  {
    objc_msgSend(v10, "leftBarButtonItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v6, "mutableCopy");

    if (v7)
    {
      if (self->_defaultLeftBarButtonItems)
        objc_msgSend(v7, "removeObjectsInArray:");
    }
    else
    {
      v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    }
    v8 = (NSArray *)-[NSArray copy](v4, "copy");
    v9 = self->_defaultLeftBarButtonItems;
    self->_defaultLeftBarButtonItems = v8;

    if (!objc_msgSend(v7, "count") && -[NSArray count](self->_defaultLeftBarButtonItems, "count"))
      objc_msgSend(v7, "addObjectsFromArray:", self->_defaultLeftBarButtonItems);
    objc_msgSend(v10, "setLeftBarButtonItems:animated:", v7, 0);

  }
}

- (void)_reloadPageData
{
  void *v3;
  uint64_t v4;
  UIViewController *beforeErrorChildViewController;
  id v6;

  if (self->_urlString && !self->_loadURLOperation)
  {
    objc_msgSend(MEMORY[0x24BEC8BC8], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "networkType");

    if (v4)
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x24BEC8B00], 0);
      -[SUUIDocumentContainerViewController _setChildViewController:](self, "_setChildViewController:", self->_beforeErrorChildViewController);
      beforeErrorChildViewController = self->_beforeErrorChildViewController;
      self->_beforeErrorChildViewController = 0;

      -[SUUIDocumentContainerViewController _enqueueLoadURLOperation](self, "_enqueueLoadURLOperation");
    }
  }
}

- (void)_reloadNavigationBarControllerIfNeeded
{
  if (self->_navigationBarController)
  {
    -[SUUIDocumentContainerViewController _reloadNavigationPalette](self, "_reloadNavigationPalette");
  }
  else
  {
    -[SUUIDocumentContainerViewController _reloadNavigationBarController](self, "_reloadNavigationBarController");
    -[SUUIDocumentContainerViewController _reloadDefaultBarButtonItems](self, "_reloadDefaultBarButtonItems");
    -[SUUIDocumentContainerViewController _reloadToolbar](self, "_reloadToolbar");
  }
}

- (void)_reloadNavigationBarController
{
  void *v3;
  SUUINavigationBarController *navigationBarController;
  NSArray *v5;
  NSArray *searchBarControllers;
  void *v7;
  int v8;
  void *v9;
  SUUINavigationBarController *v10;
  SUUINavigationBarController *v11;
  void *v12;
  SUUINavigationBarController *v13;
  void *v14;
  void *v15;
  id v16;

  -[SUUIDocumentContainerViewController _navigationBarViewElement](self, "_navigationBarViewElement");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  -[SUUIDocumentContainerViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  navigationBarController = self->_navigationBarController;
  if (navigationBarController)
  {
    -[SUUINavigationBarController existingSearchBarControllers](navigationBarController, "existingSearchBarControllers");
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    searchBarControllers = self->_searchBarControllers;
    self->_searchBarControllers = v5;

    if (self->_makeSearchBarFirstResponderOnLoad)
    {
      -[NSArray firstObject](self->_searchBarControllers, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      self->_makeSearchBarFirstResponderOnLoad = 0;
    }
    else
    {
      v7 = 0;
    }
    objc_msgSend(v16, "firstChildForElementType:", 106);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = self->_navigationBarController;
    if (v9)
    {
      -[SUUINavigationBarController detachNavigationItemControllers](v10, "detachNavigationItemControllers");
      v8 = 1;
    }
    else
    {
      -[SUUINavigationBarController detachFromNavigationItem:](v10, "detachFromNavigationItem:", v3);
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
    v7 = 0;
  }
  if (-[UIViewController conformsToProtocol:](self->_childViewController, "conformsToProtocol:", &unk_25719F830))
  {
    -[UIViewController navigationBarControllerWithViewElement:](self->_childViewController, "navigationBarControllerWithViewElement:", v16);
    v11 = (SUUINavigationBarController *)objc_claimAutoreleasedReturnValue();
    if (v11)
      goto LABEL_15;
  }
  else
  {
    v11 = 0;
  }
  if (v16)
    v11 = -[SUUINavigationBarController initWithNavigationBarViewElement:]([SUUINavigationBarController alloc], "initWithNavigationBarViewElement:", v16);
LABEL_15:
  if (v11)
  {
    -[SUUIViewController clientContext](self, "clientContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUINavigationBarController setClientContext:](v11, "setClientContext:", v12);

    -[SUUINavigationBarController setDelegate:](v11, "setDelegate:", self);
    -[SUUINavigationBarController setParentViewController:](v11, "setParentViewController:", self);
    -[SUUINavigationBarController setReusableSearchBarControllers:](v11, "setReusableSearchBarControllers:", self->_searchBarControllers);
    -[SUUINavigationBarController attachToNavigationItem:](v11, "attachToNavigationItem:", v3);
  }
  else if (v8)
  {
    -[SUUINavigationBarController detachFromNavigationItem:](self->_navigationBarController, "detachFromNavigationItem:", v3);
  }
  v13 = self->_navigationBarController;
  self->_navigationBarController = v11;

  if (objc_msgSend(v7, "canBecomeActive"))
  {
    objc_msgSend(v7, "becomeActive");
    if (self->_selectSearchBarContentOnBecomingFirstResponder)
    {
      objc_msgSend(v7, "searchBar");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "searchField");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "selectAll:", 0);

      self->_selectSearchBarContentOnBecomingFirstResponder = 0;
    }
  }
  -[SUUIDocumentContainerViewController _reloadNavigationPalette](self, "_reloadNavigationPalette");

}

- (void)_reloadNavigationPalette
{
  SUUIDocumentContainerViewController *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[SUUIDocumentContainerViewController navigationController](self, "navigationController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "topViewController");
  v3 = (SUUIDocumentContainerViewController *)objc_claimAutoreleasedReturnValue();

  if (v3 == self)
  {
    -[SUUIViewController clientContext](self, "clientContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[SUUINavigationControllerAssistant assistantForNavigationController:clientContext:](SUUINavigationControllerAssistant, "assistantForNavigationController:clientContext:", v8, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[SUUIDocumentContainerViewController navigationPaletteView](self, "navigationPaletteView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPaletteView:animated:", v6, 0);
    -[SUUIDocumentContainerViewController _navigationBarViewElement](self, "_navigationBarViewElement");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidesShadow:", objc_msgSend(v7, "hidesShadow"));

  }
}

- (void)_reloadToolbar
{
  void *v3;
  SUUIToolbarController *v4;
  SUUIToolbarController *v5;
  SUUIToolbarController *toolbarController;
  id v7;

  -[SUUIDocumentContainerViewController _toolbarViewElement](self, "_toolbarViewElement");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[SUUIDocumentContainerViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SUUIToolbarController initWithToolbarViewElement:]([SUUIToolbarController alloc], "initWithToolbarViewElement:", v7);
  v5 = v4;
  if (v4)
  {
    -[SUUIToolbarController setDelegate:](v4, "setDelegate:", self);
    -[SUUIToolbarController updateToolbarForNavigationController:](v5, "updateToolbarForNavigationController:", v3);
  }
  toolbarController = self->_toolbarController;
  self->_toolbarController = v5;

}

- (void)_sendOnViewAttributesChangeWithAttributes:(id)a3 viewWillAppear:(BOOL)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  uint64_t v11;
  id pendingSizeTransitionCompletion;
  void *v13;
  id v14;
  dispatch_time_t v15;
  _QWORD v16[5];
  _QWORD aBlock[5];
  id v18;
  id v19;
  BOOL v20;
  id location;

  v6 = a3;
  objc_initWeak(&location, self);
  v7 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __96__SUUIDocumentContainerViewController__sendOnViewAttributesChangeWithAttributes_viewWillAppear___block_invoke;
  aBlock[3] = &unk_2511FE0F0;
  objc_copyWeak(&v19, &location);
  v20 = a4;
  aBlock[4] = self;
  v8 = v6;
  v18 = v8;
  v9 = (void (**)(_QWORD))_Block_copy(aBlock);
  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "applicationState");

  if (v11 == 2)
  {
    pendingSizeTransitionCompletion = self->_pendingSizeTransitionCompletion;
    v13 = _Block_copy(v9);
    v14 = self->_pendingSizeTransitionCompletion;
    self->_pendingSizeTransitionCompletion = v13;

    if (!pendingSizeTransitionCompletion)
    {
      v15 = dispatch_time(0, 100000000);
      v16[0] = v7;
      v16[1] = 3221225472;
      v16[2] = __96__SUUIDocumentContainerViewController__sendOnViewAttributesChangeWithAttributes_viewWillAppear___block_invoke_2;
      v16[3] = &unk_2511F47C0;
      v16[4] = self;
      dispatch_after(v15, MEMORY[0x24BDAC9B8], v16);
    }
  }
  else
  {
    v9[2](v9);
  }

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

void __96__SUUIDocumentContainerViewController__sendOnViewAttributesChangeWithAttributes_viewWillAppear___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (objc_msgSend(WeakRetained, "isViewLoaded"))
  {
    objc_msgSend(WeakRetained, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v5 = 1;
    else
      v5 = *(_BYTE *)(a1 + 56) != 0;

  }
  else
  {
    v5 = *(_BYTE *)(a1 + 56) != 0;
  }
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    if (!v5)
      goto LABEL_12;
    goto LABEL_11;
  }
  if ((v5 & SUUIAllowsLandscapePhone() & 1) != 0)
  {
LABEL_11:
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(void **)(*(_QWORD *)(a1 + 32) + 1064);
    v11[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "onViewAttributesChangeWithArguments:completion:", v10, 0);

  }
LABEL_12:

}

void __96__SUUIDocumentContainerViewController__sendOnViewAttributesChangeWithAttributes_viewWillAppear___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void (**v4)(void);

  objc_msgSend(*(id *)(a1 + 32), "pendingSizeTransitionCompletion");
  v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  if (v4)
    v4[2]();
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 1232);
  *(_QWORD *)(v2 + 1232) = 0;

}

- (void)_setChildViewController:(id)a3
{
  UIViewController *v5;
  UIViewController **p_childViewController;
  UIViewController *childViewController;
  void *v8;
  UIViewController *v9;
  void *v10;
  void *v11;
  UIViewController *v12;

  v5 = (UIViewController *)a3;
  p_childViewController = &self->_childViewController;
  childViewController = self->_childViewController;
  if (childViewController != v5)
  {
    v12 = v5;
    -[UIViewController willMoveToParentViewController:](childViewController, "willMoveToParentViewController:", 0);
    if (-[UIViewController isViewLoaded](*p_childViewController, "isViewLoaded"))
    {
      -[UIViewController view](*p_childViewController, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeFromSuperview");

    }
    -[UIViewController removeFromParentViewController](*p_childViewController, "removeFromParentViewController");
    objc_storeStrong((id *)&self->_childViewController, a3);
    -[SUUIDocumentContainerViewController _setNavigationControllerContentInsetAdjustment:](self, "_setNavigationControllerContentInsetAdjustment:", *MEMORY[0x24BEBE158], *(double *)(MEMORY[0x24BEBE158] + 8), *(double *)(MEMORY[0x24BEBE158] + 16), *(double *)(MEMORY[0x24BEBE158] + 24));
    if (*p_childViewController)
    {
      -[SUUIDocumentContainerViewController addChildViewController:](self, "addChildViewController:");
      v9 = *p_childViewController;
      -[SUUIDocumentContainerViewController preferredContentSize](self, "preferredContentSize");
      -[UIViewController setPreferredContentSize:](v9, "setPreferredContentSize:");
      if (-[SUUIDocumentContainerViewController _appearState](self, "_appearState") == 1
        || -[SUUIDocumentContainerViewController _appearState](self, "_appearState") == 2)
      {
        -[UIViewController beginAppearanceTransition:animated:](*p_childViewController, "beginAppearanceTransition:animated:", 1, 0);
      }
      -[SUUIDocumentContainerViewController view](self, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIViewController view](*p_childViewController, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setAutoresizingMask:", 18);
      objc_msgSend(v10, "bounds");
      objc_msgSend(v11, "setFrame:");
      objc_msgSend(v10, "insertSubview:atIndex:", v11, 0);
      -[UIViewController didMoveToParentViewController:](*p_childViewController, "didMoveToParentViewController:", self);
      -[UIViewController setNeedsScrollingSegmentContentScrollViewUpdate](self, "setNeedsScrollingSegmentContentScrollViewUpdate");

    }
    -[SUUIDocumentContainerViewController _reloadDefaultBarButtonItems](self, "_reloadDefaultBarButtonItems");
    -[SUUIDocumentContainerViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
    v5 = v12;
  }

}

- (BOOL)_shouldFillNavigationBarContentsBasedOnNavigationBarViewElement
{
  int v3;
  void *v4;
  char isKindOfClass;

  v3 = -[SUUIDocumentContainerViewController _appearState](self, "_appearState");
  if (v3)
  {
    v3 = objc_msgSend((id)objc_opt_class(), "allowsChildViewControllerNavigationBarManagement");
    if (v3)
    {
      -[SUUIDocumentContainerViewController parentViewController](self, "parentViewController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        LOBYTE(v3) = 0;
      }
      else if (-[UIViewController conformsToProtocol:](self->_childViewController, "conformsToProtocol:", &unk_25719F978)&& (objc_opt_respondsToSelector() & 1) != 0)
      {
        LOBYTE(v3) = -[UIViewController managesNavigationBarContents](self->_childViewController, "managesNavigationBarContents") ^ 1;
      }
      else
      {
        LOBYTE(v3) = 1;
      }
    }
  }
  return v3;
}

- (void)_showAccountViewControllerWithURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  -[SUUIViewController clientContext](self, "clientContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clientInterface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC8CC0]), "initWithExternalAccountURL:", v4);

  objc_msgSend(v7, "setCanMoveToOverlay:", 0);
  objc_msgSend(v7, "setClientInterface:", v6);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v7);
  if (SUUIUserInterfaceIdiom(v5) == 1)
    objc_msgSend(v8, "setModalPresentationStyle:", 2);
  -[SUUIDocumentContainerViewController transitionCoordinator](self, "transitionCoordinator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __73__SUUIDocumentContainerViewController__showAccountViewControllerWithURL___block_invoke;
    v10[3] = &unk_2511FB0A8;
    v10[4] = self;
    v11 = v8;
    objc_msgSend(v9, "animateAlongsideTransition:completion:", 0, v10);

  }
  else
  {
    -[SUUIDocumentContainerViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);
  }

}

uint64_t __73__SUUIDocumentContainerViewController__showAccountViewControllerWithURL___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);
}

- (void)_showLegacyStorePageWithRequest:(id)a3 page:(id)a4 pageType:(int64_t)a5 URLResponse:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a6;
  v10 = a4;
  v11 = a3;
  -[SUUIViewController clientContext](self, "clientContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v12, "newLegacyStorePageViewControllerForURLResponse:", v19);
  if (!v13)
    v13 = objc_alloc_init(MEMORY[0x24BEC8DB8]);
  objc_msgSend(v13, "clientInterface");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    objc_msgSend(v12, "clientInterface");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setClientInterface:", v15);

  }
  objc_msgSend(v13, "setCanMoveToOverlay:", 0);
  objc_msgSend(v13, "setShouldAdjustContentOffsets:", 0);
  -[SUUIDocumentContainerViewController navigationItem](self, "navigationItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_setExistingNavigationItem:", v16);

  objc_msgSend(v13, "setExternalRequest:", 1);
  -[SUUIDocumentContainerViewController _setChildViewController:](self, "_setChildViewController:", v13);
  objc_msgSend(v19, "URL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "reloadWithStorePage:ofType:forURL:", v10, a5, v17);

  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB2008]), "initWithURLRequest:", v11);
  objc_msgSend(v13, "setURLRequestProperties:", v18);

}

- (id)_sidepackViewControllerWithOptions:(id)a3 clientContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  SUUIItem *v9;
  uint64_t v10;
  __objc2_class **v11;
  void *v12;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "objectForKey:", CFSTR("sidepackType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", 0x251212F08))
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("sidepackData"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SUUIItem initWithLookupDictionary:]([SUUIItem alloc], "initWithLookupDictionary:", v8);
      v10 = SUUIUserInterfaceIdiom(v6);
      v11 = off_2511F2D18;
      if (v10 != 1)
        v11 = off_2511F2D28;
      v12 = (void *)objc_msgSend(objc_alloc(*v11), "initWithItem:", v9);
      objc_msgSend(v12, "setClientContext:", v6);

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)childViewController
{
  return self->_childViewController;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UIViewController animationControllerForPresentedController:presentingController:sourceController:](self->_childViewController, "animationControllerForPresentedController:presentingController:sourceController:", v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UIViewController animationControllerForDismissedController:](self->_childViewController, "animationControllerForDismissedController:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (SUUIMetricsPageRenderEvent)pageRenderEvent
{
  return self->_pageRenderEvent;
}

- (void)setPageRenderEvent:(id)a3
{
  objc_storeStrong((id *)&self->_pageRenderEvent, a3);
}

- (SUUIMetricsDOMChangeQueue)domChangeTimingQueue
{
  return self->_domChangeTimingQueue;
}

- (void)setDomChangeTimingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_domChangeTimingQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domChangeTimingQueue, 0);
  objc_storeStrong((id *)&self->_pageRenderEvent, 0);
  objc_storeStrong(&self->_pendingSizeTransitionCompletion, 0);
  objc_storeStrong((id *)&self->_urlString, 0);
  objc_storeStrong((id *)&self->_sizeAtDisappear, 0);
  objc_storeStrong((id *)&self->_searchBarControllers, 0);
  objc_storeStrong((id *)&self->_presentationOptions, 0);
  objc_storeStrong((id *)&self->_personalizationItems, 0);
  objc_storeStrong((id *)&self->_pageResponseAbsoluteTime, 0);
  objc_storeStrong((id *)&self->_orientationAtDisappear, 0);
  objc_storeStrong((id *)&self->_toolbarController, 0);
  objc_storeStrong((id *)&self->_navigationBarController, 0);
  objc_storeStrong((id *)&self->_mediaQueryEvaluator, 0);
  objc_storeStrong((id *)&self->_loadURLOperation, 0);
  objc_storeStrong((id *)&self->_document, 0);
  objc_storeStrong((id *)&self->_defaultLeftBarButtonItems, 0);
  objc_storeStrong((id *)&self->_childViewController, 0);
  objc_storeStrong((id *)&self->_beforeErrorChildViewController, 0);
}

@end

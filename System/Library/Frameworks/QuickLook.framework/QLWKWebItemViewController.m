@implementation QLWKWebItemViewController

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[QLWKWebItemViewController generatedDocument](self, "generatedDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x24BE7BEF0];
    -[QLWKWebItemViewController generatedDocument](self, "generatedDocument");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unregisterPreview:", v5);

  }
  v6.receiver = self;
  v6.super_class = (Class)QLWKWebItemViewController;
  -[QLWKWebItemViewController dealloc](&v6, sel_dealloc);
}

- (void)loadView
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  NSString *previewContentType;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  WKWebView *v17;
  WKWebView *webView;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  NSLayoutConstraint *v28;
  NSLayoutConstraint *leftConstraint;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  void *v35;
  NSLayoutConstraint *v36;
  NSLayoutConstraint *rightConstraint;
  void *v38;
  void *v39;
  WKWebView *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  const __CFString *v45;
  WKWebView *v46;
  const __CFString *v47;
  _QWORD v48[2];

  v48[1] = *MEMORY[0x24BDAC8D0];
  if (!self->_webView)
  {
    v3 = (void *)objc_opt_new();
    -[QLWKWebItemViewController setView:](self, "setView:", v3);

    QLFrameworkBundle();
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "URLForResource:withExtension:subdirectory:localization:", CFSTR("QLWebKitBundle"), CFSTR("wkbundle"), CFSTR("PlugIns"), 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc_init(MEMORY[0x24BDFA978]);
    v43 = (void *)v4;
    objc_msgSend(v5, "setInjectedBundleURL:", v4);
    objc_msgSend(v5, "setJITEnabled:", 0);
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFA8E8]), "_initWithConfiguration:", v5);
    previewContentType = self->_previewContentType;
    v47 = CFSTR("contentType");
    v48[0] = previewContentType;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v48, &v47, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setObjectsForBundleParametersWithDictionary:", v8);

    v9 = objc_alloc(MEMORY[0x24BDFA920]);
    -[QLItemViewController presentingDelegate](self, "presentingDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hostApplicationBundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v9, "ql_initWithForegroundPriorityAndSourceBundleIdentifier:", v11);

    objc_msgSend(v12, "setProcessPool:", v6);
    if (+[QLWKWebItemViewController _shouldDisableJavaScriptForContentType:](QLWKWebItemViewController, "_shouldDisableJavaScriptForContentType:", self->_previewContentType))
    {
      objc_msgSend(v12, "defaultWebpagePreferences");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setAllowsContentJavaScript:", 0);

      objc_msgSend(MEMORY[0x24BDBCF20], "set");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_setAllowedNetworkHosts:", v14);

    }
    v15 = objc_alloc(MEMORY[0x24BDFA918]);
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bounds");
    v17 = (WKWebView *)objc_msgSend(v15, "initWithFrame:configuration:", v12);
    webView = self->_webView;
    self->_webView = v17;

    -[WKWebView setNavigationDelegate:](self->_webView, "setNavigationDelegate:", self);
    -[WKWebView scrollView](self->_webView, "scrollView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setDelegate:", self);

    -[WKWebView setAccessibilityIdentifier:](self->_webView, "setAccessibilityIdentifier:", CFSTR("QLWKWebViewControllerWkWebViewAccessibilityIdentifier"));
    -[WKWebView setAllowsLinkPreview:](self->_webView, "setAllowsLinkPreview:", 0);
    -[QLWKWebItemViewController _registerRemoteProxy](self, "_registerRemoteProxy");
    -[QLWKWebItemViewController view](self, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addSubview:", self->_webView);

    -[QLWKWebItemViewController scrollView](self, "scrollView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setContentInsetAdjustmentBehavior:", 2);

    -[WKWebView setTranslatesAutoresizingMaskIntoConstraints:](self->_webView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[WKWebView leftAnchor](self->_webView, "leftAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLWKWebItemViewController view](self, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "leftAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLItemViewController appearance](self, "appearance");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "peripheryInsets");
    objc_msgSend(v22, "constraintEqualToAnchor:constant:", v24, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "ql_activatedConstraint");
    v28 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    leftConstraint = self->_leftConstraint;
    self->_leftConstraint = v28;

    -[QLWKWebItemViewController view](self, "view");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "rightAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[WKWebView rightAnchor](self->_webView, "rightAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLItemViewController appearance](self, "appearance");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "peripheryInsets");
    objc_msgSend(v31, "constraintEqualToAnchor:constant:", v32, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "ql_activatedConstraint");
    v36 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    rightConstraint = self->_rightConstraint;
    self->_rightConstraint = v36;

    -[QLWKWebItemViewController view](self, "view");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void *)MEMORY[0x24BDD1628];
    v40 = self->_webView;
    v45 = CFSTR("webView");
    v46 = v40;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[webView]|"), 0, 0, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addConstraints:", v42);

  }
}

- (id)scrubView
{
  QLScrubView *scrubView;
  QLScrubView *v4;
  QLScrubView *v5;
  void *v6;

  scrubView = self->_scrubView;
  if (!scrubView)
  {
    v4 = objc_alloc_init(QLScrubView);
    v5 = self->_scrubView;
    self->_scrubView = v4;

    -[QLScrubView setDataSource:](self->_scrubView, "setDataSource:", self);
    -[QLScrubView setDelegate:](self->_scrubView, "setDelegate:", self);
    -[QLScrubView setHidden:](self->_scrubView, "setHidden:", 1);
    -[QLItemViewController appearance](self, "appearance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "topInset");
    -[QLScrubView setTopOffset:](self->_scrubView, "setTopOffset:");

    -[QLScrubView reloadThumbnails](self->_scrubView, "reloadThumbnails");
    scrubView = self->_scrubView;
  }
  return scrubView;
}

- (void)_registerRemoteProxy
{
  void *v3;
  QLWebKitThumbnailGenerator *v4;
  QLWebKitThumbnailGenerator *thumbnailGenerator;
  void *v6;
  QLWebKitPaginator *v7;
  QLWebKitPaginator *paginator;
  id v9;

  -[WKWebView _remoteObjectRegistry](self->_webView, "_remoteObjectRegistry");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDFA9B0], "remoteObjectInterfaceWithProtocol:", &unk_254A1AA10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remoteObjectProxyWithInterface:", v3);
  v4 = (QLWebKitThumbnailGenerator *)objc_claimAutoreleasedReturnValue();
  thumbnailGenerator = self->_thumbnailGenerator;
  self->_thumbnailGenerator = v4;

  objc_msgSend(MEMORY[0x24BDFA9B0], "remoteObjectInterfaceWithProtocol:", &unk_254A1AA70);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remoteObjectProxyWithInterface:", v6);
  v7 = (QLWebKitPaginator *)objc_claimAutoreleasedReturnValue();
  paginator = self->_paginator;
  self->_paginator = v7;

}

- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  id v8;
  NSString *v9;
  NSString *previewContentType;
  void *v11;
  id completionHandler;
  NSOperationQueue *v13;
  NSOperationQueue *operationQueue;
  NSCache *v15;
  NSCache *indexToThumbnailsCache;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;

  v23 = a3;
  v8 = a5;
  objc_msgSend(a4, "contentType");
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  previewContentType = self->_previewContentType;
  self->_previewContentType = v9;

  v11 = _Block_copy(v8);
  completionHandler = self->_completionHandler;
  self->_completionHandler = v11;

  -[QLWKWebItemViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  v13 = (NSOperationQueue *)objc_opt_new();
  operationQueue = self->_operationQueue;
  self->_operationQueue = v13;

  -[NSOperationQueue setMaxConcurrentOperationCount:](self->_operationQueue, "setMaxConcurrentOperationCount:", 1);
  v15 = (NSCache *)objc_opt_new();
  indexToThumbnailsCache = self->_indexToThumbnailsCache;
  self->_indexToThumbnailsCache = v15;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[QLWKWebItemViewController webView](self, "webView");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v18 = (id)objc_msgSend(v17, "loadFileURL:allowingReadAccessToURL:", v23, v23);
  }
  else
  {
    v19 = (void *)MEMORY[0x24BE7BEF0];
    v17 = v23;
    objc_msgSend(v19, "registerPreview:", v17);
    -[QLWKWebItemViewController webView](self, "webView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "previewRequest");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (id)objc_msgSend(v20, "loadRequest:", v21);

    -[QLWKWebItemViewController setGeneratedDocument:](self, "setGeneratedDocument:", v17);
  }

}

- (void)previewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)QLWKWebItemViewController;
  -[QLItemViewController previewWillAppear:](&v10, sel_previewWillAppear_, a3);
  -[QLWKWebItemViewController webView](self, "webView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE7BF00], "protocolScheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setURLSchemeHandler:forURLScheme:", self, v6);

  -[QLWKWebItemViewController webView](self, "webView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE7BEE8], "protocolScheme");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setURLSchemeHandler:forURLScheme:", self, v9);

}

- (void)previewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  if (!-[QLItemViewController didAppearOnce](self, "didAppearOnce"))
  {
    -[QLWKWebItemViewController scrollView](self, "scrollView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLWKWebItemViewController scrollView](self, "scrollView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "minimumZoomScale");
    objc_msgSend(v5, "setZoomScale:animated:", 0);

  }
  v7.receiver = self;
  v7.super_class = (Class)QLWKWebItemViewController;
  -[QLItemViewController previewDidAppear:](&v7, sel_previewDidAppear_, v3);
  -[QLWKWebItemViewController _updateScrubberVisibilityAnimated:](self, "_updateScrubberVisibilityAnimated:", v3);
}

- (void)previewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v3 = a3;
  -[QLWKWebItemViewController webView](self, "webView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE7BF00], "protocolScheme");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setURLSchemeHandler:forURLScheme:", 0, v7);

  -[QLWKWebItemViewController webView](self, "webView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE7BEE8], "protocolScheme");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setURLSchemeHandler:forURLScheme:", 0, v10);

  v11.receiver = self;
  v11.super_class = (Class)QLWKWebItemViewController;
  -[QLItemViewController previewWillDisappear:](&v11, sel_previewWillDisappear_, v3);
}

- (void)previewBecameFullScreen:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  objc_super v7;

  v4 = a4;
  v7.receiver = self;
  v7.super_class = (Class)QLWKWebItemViewController;
  -[QLItemViewController previewBecameFullScreen:animated:](&v7, sel_previewBecameFullScreen_animated_);
  self->_fullScreen = a3;
  -[QLWKWebItemViewController _updateScrubberVisibilityAnimated:](self, "_updateScrubberVisibilityAnimated:", v4);
}

- (void)setAppearance:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  CGFloat v11;
  CGFloat v12;
  void *v13;
  void *v14;
  objc_super v15;

  v4 = a4;
  v6 = a3;
  -[QLItemViewController appearance](self, "appearance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "presentationMode");

  v15.receiver = self;
  v15.super_class = (Class)QLWKWebItemViewController;
  -[QLItemViewController setAppearance:animated:](&v15, sel_setAppearance_animated_, v6, v4);
  v9 = objc_msgSend(v6, "presentationMode");

  if (v8 != v9)
    -[QLWKWebItemViewController _updateScrubberVisibilityAnimated:](self, "_updateScrubberVisibilityAnimated:", v4);
  -[WKWebView scrollView](self->_webView, "scrollView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contentOffset");
  self->_scrollViewTopOffset.x = v11;
  self->_scrollViewTopOffset.y = v12;

  -[QLItemViewController appearance](self, "appearance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "topInset");
  -[QLScrubView setTopOffset:](self->_scrubView, "setTopOffset:");

  -[QLItemViewController appearance](self, "appearance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bottomInset");
  -[QLScrubView setBottomOffset:](self->_scrubView, "setBottomOffset:");

  -[QLScrubView setNeedsLayout](self->_scrubView, "setNeedsLayout");
  -[QLWKWebItemViewController _updateConstraintConstants:](self, "_updateConstraintConstants:", v4);
}

- (id)scrollView
{
  return -[WKWebView scrollView](self->_webView, "scrollView");
}

- (BOOL)automaticallyUpdateScrollViewContentOffset
{
  return 1;
}

- (BOOL)automaticallyUpdateScrollViewContentInset
{
  return 1;
}

- (BOOL)automaticallyUpdateScrollViewIndicatorInset
{
  return 0;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  double v9;
  BOOL v10;
  objc_super v11;
  _QWORD v12[5];
  _QWORD v13[5];
  BOOL v14;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  -[QLWKWebItemViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v10 = v9 != height;

  v12[4] = self;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __80__QLWKWebItemViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v13[3] = &unk_24C725410;
  v13[4] = self;
  v14 = v10;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __80__QLWKWebItemViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v12[3] = &unk_24C724B78;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v13, v12);
  v11.receiver = self;
  v11.super_class = (Class)QLWKWebItemViewController;
  -[QLWKWebItemViewController viewWillTransitionToSize:withTransitionCoordinator:](&v11, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);

}

uint64_t __80__QLWKWebItemViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateScrubberVisibilityAnimated:reloadThumbnailsIfNeeded:", 0, *(unsigned __int8 *)(a1 + 40));
}

void __80__QLWKWebItemViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  double *v1;
  double v2;
  double v3;
  void *v4;
  id v5;

  v1 = *(double **)(a1 + 32);
  v2 = v1[139];
  v3 = v1[140];
  objc_msgSend(v1, "webView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentOffset:", v2, v3);

}

- (BOOL)shouldAcceptTouch:(id)a3 ofGestureRecognizer:(id)a4
{
  id v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  char v16;
  BOOL v17;
  uint64_t v18;
  QLScrubView *v19;
  QLScrubView *v20;
  QLScrubView *scrubView;
  objc_super v23;

  v6 = a3;
  v23.receiver = self;
  v23.super_class = (Class)QLWKWebItemViewController;
  v7 = -[QLItemViewController shouldAcceptTouch:ofGestureRecognizer:](&v23, sel_shouldAcceptTouch_ofGestureRecognizer_, v6, a4);
  v8 = (void *)MEMORY[0x24BE7BFB8];
  -[QLItemViewController context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contentType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v8, "isSpreadSheetDocumentType:", v10);

  if ((_DWORD)v8)
  {
    objc_msgSend(v6, "locationInView:", self->_webView);
    v12 = v11;
    -[QLItemViewController appearance](self, "appearance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "topInset");
    v15 = v12 - v14;

    if (v15 >= 55.0)
      v16 = v7;
    else
      v16 = 0;
    if ((v16 & 1) == 0)
      goto LABEL_6;
  }
  else if (!v7)
  {
LABEL_6:
    v17 = 0;
    goto LABEL_14;
  }
  objc_msgSend(v6, "view");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (QLScrubView *)v18;
    do
    {
      v20 = v19;
      scrubView = self->_scrubView;
      -[QLScrubView superview](v19, "superview");
      v19 = (QLScrubView *)objc_claimAutoreleasedReturnValue();

    }
    while (v19 && v20 != scrubView);
    v17 = v20 != scrubView;

  }
  else
  {
    v17 = 1;
  }
LABEL_14:

  return v17;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v5;
  id v6;
  char isKindOfClass;
  char v8;

  v5 = a4;
  v6 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_opt_class();
    v8 = objc_opt_isKindOfClass();
  }
  else
  {
    v8 = 0;
  }

  return v8 & 1;
}

- (BOOL)canSwipeToDismiss
{
  return 0;
}

- (BOOL)canPinchToDismiss
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  BOOL v8;

  -[WKWebView scrollView](self->_webView, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "zoomScale");
  v5 = floor(v4 * 1000.0);
  -[WKWebView scrollView](self->_webView, "scrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "minimumZoomScale");
  v8 = v5 <= floor(v7 * 1000.0);

  return v8;
}

- (BOOL)canClickToToggleFullscreen
{
  return 0;
}

- (int64_t)preferredWhitePointAdaptivityStyle
{
  return 1;
}

- (id)_renderer
{
  UIPrintPageRenderer *renderer;
  UIPrintPageRenderer *v3;
  UIPrintPageRenderer *v5;
  UIPrintPageRenderer *v6;
  void *v7;

  renderer = self->_renderer;
  if (renderer)
  {
    v3 = renderer;
  }
  else
  {
    v5 = (UIPrintPageRenderer *)objc_alloc_init(MEMORY[0x24BDF6CE8]);
    v6 = self->_renderer;
    self->_renderer = v5;

    -[WKWebView _webViewPrintFormatter](self->_webView, "_webViewPrintFormatter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintPageRenderer addPrintFormatter:startingAtPageAtIndex:](self->_renderer, "addPrintFormatter:startingAtPageAtIndex:", v7, 0);
    v3 = self->_renderer;

  }
  return v3;
}

- (void)_prepareThumbnailView
{
  QLWebKitThumbnailGenerator *thumbnailGenerator;
  _QWORD v3[5];

  thumbnailGenerator = self->_thumbnailGenerator;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __50__QLWKWebItemViewController__prepareThumbnailView__block_invoke;
  v3[3] = &unk_24C725438;
  v3[4] = self;
  -[QLWebKitThumbnailGenerator thumbnailInformationWithCompletionBlock:](thumbnailGenerator, "thumbnailInformationWithCompletionBlock:", v3);
}

uint64_t __50__QLWKWebItemViewController__prepareThumbnailView__block_invoke(uint64_t a1, uint64_t a2, double a3, double a4)
{
  double *v4;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1192) = a2;
  v4 = (double *)(*(_QWORD *)(a1 + 32) + 1200);
  *v4 = a3;
  v4[1] = a4;
  return QLRunInMainThread();
}

uint64_t __50__QLWKWebItemViewController__prepareThumbnailView__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateScrubberVisibilityAnimated:reloadThumbnailsIfNeeded:", 1, 1);
}

- (void)_updateScrubberVisibilityAnimated:(BOOL)a3
{
  -[QLWKWebItemViewController _updateScrubberVisibilityAnimated:reloadThumbnailsIfNeeded:](self, "_updateScrubberVisibilityAnimated:reloadThumbnailsIfNeeded:", a3, 0);
}

- (void)_updateScrubberVisibilityAnimated:(BOOL)a3 reloadThumbnailsIfNeeded:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  id v7;

  v4 = a4;
  v5 = a3;
  -[QLWKWebItemViewController traitCollection](self, "traitCollection");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[QLWKWebItemViewController _updateScrubberForTraitCollection:animated:reloadThumbnailsIfNeeded:](self, "_updateScrubberForTraitCollection:animated:reloadThumbnailsIfNeeded:", v7, v5, v4);

}

- (void)_updateScrubberForTraitCollection:(id)a3 animated:(BOOL)a4 reloadThumbnailsIfNeeded:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  void *v8;
  _BOOL4 fullScreen;
  id v10;

  v5 = a5;
  v6 = a4;
  v10 = a3;
  if (-[QLItemViewController didAppearOnce](self, "didAppearOnce") && self->_thumbnailCount >= 2)
  {
    if (objc_msgSend(v10, "horizontalSizeClass") == 2)
    {
      -[QLItemViewController appearance](self, "appearance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "presentationMode") == 4)
      {

      }
      else
      {
        fullScreen = self->_fullScreen;

        if (!fullScreen)
        {
          -[QLWKWebItemViewController _showScrubberIfNeeded:reloadThumbnails:](self, "_showScrubberIfNeeded:reloadThumbnails:", v6, v5);
          goto LABEL_8;
        }
      }
    }
    -[QLWKWebItemViewController _hideScrubberIfNeeded:](self, "_hideScrubberIfNeeded:", v6);
  }
LABEL_8:

}

- (void)_showScrubberIfNeeded:(BOOL)a3 reloadThumbnails:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD aBlock[5];
  _QWORD v18[5];
  _QWORD v19[5];
  id v20;
  _QWORD v21[5];

  v4 = a4;
  v5 = a3;
  -[QLWKWebItemViewController traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "horizontalSizeClass") == 2)
  {

  }
  else
  {
    -[QLItemViewController appearance](self, "appearance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "presentationMode");

    if (v9 == 4)
      return;
  }
  -[QLWKWebItemViewController scrubView](self, "scrubView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    if ((objc_msgSend(v10, "isHidden") & 1) == 0)
    {
      if (v4)
      {
        v21[0] = MEMORY[0x24BDAC760];
        v21[1] = 3221225472;
        v21[2] = __68__QLWKWebItemViewController__showScrubberIfNeeded_reloadThumbnails___block_invoke;
        v21[3] = &unk_24C724B00;
        v21[4] = self;
        objc_msgSend(MEMORY[0x24BEBDB00], "performWithoutAnimation:", v21);
      }
      goto LABEL_15;
    }
    objc_msgSend(v11, "superview");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      if (!v4)
      {
LABEL_9:
        objc_msgSend(v11, "selectPageNumber:", -[QLWKWebItemViewController currentPageNumber](self, "currentPageNumber"));
        objc_msgSend(v11, "setHidden:", 0);
        -[QLWKWebItemViewController view](self, "view");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setNeedsLayout");

        aBlock[0] = MEMORY[0x24BDAC760];
        aBlock[1] = 3221225472;
        aBlock[2] = __68__QLWKWebItemViewController__showScrubberIfNeeded_reloadThumbnails___block_invoke_4;
        aBlock[3] = &unk_24C724B00;
        aBlock[4] = self;
        v14 = _Block_copy(aBlock);
        v15 = v14;
        if (v5)
          objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:completion:", v14, 0, 0.2);
        else
          (*((void (**)(void *))v14 + 2))(v14);

        goto LABEL_15;
      }
    }
    else
    {
      v16 = (void *)MEMORY[0x24BEBDB00];
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __68__QLWKWebItemViewController__showScrubberIfNeeded_reloadThumbnails___block_invoke_2;
      v19[3] = &unk_24C724778;
      v19[4] = self;
      v20 = v11;
      objc_msgSend(v16, "performWithoutAnimation:", v19);

      if (!v4)
        goto LABEL_9;
    }
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __68__QLWKWebItemViewController__showScrubberIfNeeded_reloadThumbnails___block_invoke_3;
    v18[3] = &unk_24C724B00;
    v18[4] = self;
    objc_msgSend(MEMORY[0x24BEBDB00], "performWithoutAnimation:", v18);
    goto LABEL_9;
  }
LABEL_15:

}

uint64_t __68__QLWKWebItemViewController__showScrubberIfNeeded_reloadThumbnails___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1184), "reloadThumbnails");
}

void __68__QLWKWebItemViewController__showScrubberIfNeeded_reloadThumbnails___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  uint64_t v27;
  const __CFString *v28;
  void *v29;
  const __CFString *v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addSubview:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 40), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD1628];
  v5 = *(_QWORD *)(a1 + 40);
  v30 = CFSTR("scrubber");
  v31[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[scrubber]|"), 0, 0, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addConstraints:", v7);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDD1628];
  v28 = CFSTR("scrubberWidth");
  v10 = (void *)MEMORY[0x24BDD16E0];
  +[QLScrubView defaultWidth](QLScrubView, "defaultWidth");
  objc_msgSend(v10, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(a1 + 40);
  v26 = CFSTR("scrubber");
  v27 = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:[scrubber(scrubberWidth)]"), 0, v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addConstraints:", v15);

  v16 = (void *)MEMORY[0x24BDD1628];
  v17 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[QLScrubView defaultWidth](QLScrubView, "defaultWidth");
  objc_msgSend(v16, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v17, 6, 0, v18, 6, 1.0, v19);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = *(_QWORD *)(a1 + 32);
  v22 = *(void **)(v21 + 1216);
  *(_QWORD *)(v21 + 1216) = v20;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addConstraint:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1216));

  objc_msgSend(*(id *)(a1 + 32), "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setNeedsLayout");

  objc_msgSend(*(id *)(a1 + 32), "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "layoutIfNeeded");

}

uint64_t __68__QLWKWebItemViewController__showScrubberIfNeeded_reloadThumbnails___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1184), "reloadThumbnails");
}

void __68__QLWKWebItemViewController__showScrubberIfNeeded_reloadThumbnails___block_invoke_4(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1216), "setConstant:", 0.0);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutIfNeeded");

}

- (unint64_t)currentPageNumber
{
  CGSize *p_pageSize;
  void *v4;
  double height;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  unint64_t result;

  p_pageSize = &self->_pageSize;
  -[WKWebView scrollView](self->_webView, "scrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "zoomScale");
  height = p_pageSize->height;
  -[WKWebView scrollView](self->_webView, "scrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "zoomScale");
  v8 = v7;

  -[WKWebView scrollView](self->_webView, "scrollView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  v11 = v10;

  -[WKWebView scrollView](self->_webView, "scrollView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "contentOffset");
  v14 = v13;

  result = self->_thumbnailCount;
  if ((uint64_t)result >= 1)
    return (unint64_t)((v11 * 0.5 + v14) / (height * v8));
  return result;
}

- (void)_hideScrubberIfNeeded:(BOOL)a3
{
  _BOOL4 v3;
  QLScrubView *v5;
  QLScrubView *v6;
  void *v7;
  uint64_t v8;
  void (**v9)(_QWORD);
  void (**v10)(void *, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  QLScrubView *v15;
  _QWORD aBlock[5];

  v3 = a3;
  v5 = self->_scrubView;
  v6 = v5;
  if (v5 && (-[QLScrubView isHidden](v5, "isHidden") & 1) == 0)
  {
    -[QLWKWebItemViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNeedsLayout");

    v8 = MEMORY[0x24BDAC760];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __51__QLWKWebItemViewController__hideScrubberIfNeeded___block_invoke;
    aBlock[3] = &unk_24C724B00;
    aBlock[4] = self;
    v9 = (void (**)(_QWORD))_Block_copy(aBlock);
    v11 = v8;
    v12 = 3221225472;
    v13 = __51__QLWKWebItemViewController__hideScrubberIfNeeded___block_invoke_2;
    v14 = &unk_24C724B28;
    v15 = v6;
    v10 = (void (**)(void *, uint64_t))_Block_copy(&v11);
    if (v3)
    {
      objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:completion:", v9, v10, 0.2, v11, v12, v13, v14);
    }
    else
    {
      v9[2](v9);
      v10[2](v10, 1);
    }

  }
}

void __51__QLWKWebItemViewController__hideScrubberIfNeeded___block_invoke(uint64_t a1)
{
  id v2;

  +[QLScrubView defaultWidth](QLScrubView, "defaultWidth");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1216), "setConstant:");
  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutIfNeeded");

}

uint64_t __51__QLWKWebItemViewController__hideScrubberIfNeeded___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setHidden:", 1);
}

- (WKWebView)webView
{
  return self->_webView;
}

- (void)_scrollToPage:(int64_t)a3
{
  QLWebKitPaginator *paginator;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  id v11;
  _QWORD v12[5];

  if (a3)
  {
    paginator = self->_paginator;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __43__QLWKWebItemViewController__scrollToPage___block_invoke;
    v12[3] = &unk_24C725460;
    v12[4] = self;
    -[QLWebKitPaginator boundsForPageAtIndex:withCompletionBlock:](paginator, "boundsForPageAtIndex:withCompletionBlock:", a3, v12);
  }
  else
  {
    -[WKWebView scrollView](self->_webView, "scrollView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentOffset");
    v7 = v6;
    -[QLItemViewController appearance](self, "appearance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "topInset");
    v10 = -v9;

    -[WKWebView scrollView](self->_webView, "scrollView");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setContentOffset:animated:", 0, v7, v10);

  }
}

void __43__QLWKWebItemViewController__scrollToPage___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v3 = a2;
  v2 = v3;
  QLRunInMainThread();

}

void __43__QLWKWebItemViewController__scrollToPage___block_invoke_2(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
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
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  id v33;

  objc_msgSend(*(id *)(a1 + 32), "CGRectValue");
  v3 = v2;
  v5 = v4;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1240), "scrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "zoomScale");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1240), "scrollView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "zoomScale");
  v9 = v3 * v8;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1240), "scrollView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "zoomScale");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1240), "scrollView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "zoomScale");
  v13 = v5 * v12;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1240), "scrollView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "contentSize");
  v16 = v15;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1240), "scrollView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "frame");
  v19 = v18;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1240), "scrollView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "contentOffset");
  v22 = v21;

  objc_msgSend(*(id *)(a1 + 40), "appearance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "topInset");
  v25 = v19 - v24 - v13;

  v26 = v25 * 0.5;
  if (v25 <= 0.0)
    v26 = 0.0;
  v27 = v9 - v26;
  objc_msgSend(*(id *)(a1 + 40), "appearance");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "bottomInset");
  v30 = v16 - v29;

  if (v19 + v27 >= v30)
  {
    objc_msgSend(*(id *)(a1 + 40), "appearance");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "bottomInset");
    v27 = v16 - v19 + v32;

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1240), "scrollView");
  v33 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setContentOffset:animated:", 0, v22, v27);

}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  void (**completionHandler)(id, id, id, id);
  id v7;

  completionHandler = (void (**)(id, id, id, id))self->_completionHandler;
  if (completionHandler)
  {
    completionHandler[2](completionHandler, a5, a3, a4);
    v7 = self->_completionHandler;
    self->_completionHandler = 0;

  }
}

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
  void (**completionHandler)(id, id, id, id);
  id v7;

  completionHandler = (void (**)(id, id, id, id))self->_completionHandler;
  if (completionHandler)
  {
    completionHandler[2](completionHandler, a5, a3, a4);
    v7 = self->_completionHandler;
    self->_completionHandler = 0;

  }
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  QLWebKitPaginator *paginator;
  void (**completionHandler)(id, _QWORD);
  id v7;
  _QWORD v8[5];

  -[QLWKWebItemViewController _prepareThumbnailView](self, "_prepareThumbnailView", a3, a4);
  paginator = self->_paginator;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __57__QLWKWebItemViewController_webView_didFinishNavigation___block_invoke;
  v8[3] = &unk_24C725460;
  v8[4] = self;
  -[QLWebKitPaginator sizeForPageAtIndex:withCompletionBlock:](paginator, "sizeForPageAtIndex:withCompletionBlock:", 0, v8);
  completionHandler = (void (**)(id, _QWORD))self->_completionHandler;
  if (completionHandler)
  {
    completionHandler[2](completionHandler, 0);
    v7 = self->_completionHandler;
    self->_completionHandler = 0;

  }
}

uint64_t __57__QLWKWebItemViewController_webView_didFinishNavigation___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  v2 = (_QWORD *)(*(_QWORD *)(a1 + 32) + 1168);
  result = objc_msgSend(a2, "CGSizeValue");
  *v2 = v4;
  v2[1] = v5;
  return result;
}

- (void)_webViewDidRequestPasswordForQuickLookDocument:(id)a3
{
  void (**completionHandler)(id, _QWORD, id);
  id v5;

  completionHandler = (void (**)(id, _QWORD, id))self->_completionHandler;
  if (completionHandler)
  {
    completionHandler[2](completionHandler, 0, a3);
    v5 = self->_completionHandler;
    self->_completionHandler = 0;

  }
}

- (void)webViewWebContentProcessDidTerminate:(id)a3
{
  uint64_t v4;
  void (**completionHandler)(id, uint64_t);
  id v6;
  id v7;

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.quicklook.WKWebItemViewController"), 1, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  completionHandler = (void (**)(id, uint64_t))self->_completionHandler;
  v7 = (id)v4;
  if (completionHandler)
  {
    completionHandler[2](completionHandler, v4);
    v6 = self->_completionHandler;
    self->_completionHandler = 0;

  }
  else
  {
    -[QLItemViewController notifyDelegatesDidFailWithError:](self, "notifyDelegatesDidFailWithError:");
  }

}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  id v7;
  void (**v8)(id, uint64_t);
  void *v9;
  void *v10;
  int v11;
  NSObject **v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = (void (**)(id, uint64_t))a5;
  if (objc_msgSend(v7, "navigationType")
    || (objc_msgSend(v7, "request"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v9, "URL"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "isSpringboardHandledURL"),
        v10,
        v9,
        !v11))
  {
    v8[2](v8, 1);
  }
  else
  {
    v12 = (NSObject **)MEMORY[0x24BE7BF48];
    v13 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v13 = *v12;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v13;
      objc_msgSend(v7, "request");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "URL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138412290;
      v21 = v16;
      _os_log_impl(&dword_20D4F5000, v14, OS_LOG_TYPE_DEFAULT, "Forwarding URL to client from web preview: %@ #AnyItemViewController", (uint8_t *)&v20, 0xCu);

    }
    v8[2](v8, 0);
    -[QLItemViewController delegate](self, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "request");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "URL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "previewItemViewController:wantsToOpenURL:", self, v19);

  }
}

- (void)webView:(id)a3 startURLSchemeTask:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, uint64_t, uint64_t);
  void *v13;
  id v14;
  QLWKWebItemViewController *v15;

  v5 = a4;
  objc_msgSend(MEMORY[0x24BDD1850], "sharedSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "request");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __56__QLWKWebItemViewController_webView_startURLSchemeTask___block_invoke;
  v13 = &unk_24C725488;
  v14 = v5;
  v15 = self;
  v8 = v5;
  objc_msgSend(v6, "dataTaskWithRequest:completionHandler:", v7, &v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[QLWKWebItemViewController setGeneratedDocumentURLSessionTask:](self, "setGeneratedDocumentURLSessionTask:", v9, v10, v11, v12, v13);
  objc_msgSend(v9, "resume");

}

void __56__QLWKWebItemViewController_webView_startURLSchemeTask___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  id v8;

  v8 = a2;
  v7 = *(void **)(a1 + 32);
  if (a3)
  {
    objc_msgSend(v7, "didReceiveResponse:", a3);
    objc_msgSend(*(id *)(a1 + 32), "didReceiveData:", v8);
    objc_msgSend(*(id *)(a1 + 32), "didFinish");
  }
  else
  {
    objc_msgSend(v7, "didFailWithError:", a4);
  }
  objc_msgSend(*(id *)(a1 + 40), "setGeneratedDocumentURLSessionTask:", 0);

}

- (void)webView:(id)a3 stopURLSchemeTask:(id)a4
{
  id v4;

  -[QLWKWebItemViewController generatedDocumentURLSessionTask](self, "generatedDocumentURLSessionTask", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancel");

}

- (int64_t)numberOfPagesInScrubView:(id)a3
{
  return self->_thumbnailCount;
}

- (void)scrubView:(id)a3 thumbnailForPage:(int64_t)a4 size:(CGSize)a5 withCompletionBlock:(id)a6
{
  CGFloat height;
  CGFloat width;
  id v11;
  void (**v12)(id, void *);
  void *v13;
  QLAsynchronousBlockOperation *v14;
  QLAsynchronousBlockOperation *v15;
  _QWORD v16[5];
  void (**v17)(id, void *);
  id v18[4];
  id location;

  height = a5.height;
  width = a5.width;
  v11 = a3;
  v12 = (void (**)(id, void *))a6;
  -[QLWKWebItemViewController _thumbnailAtIndex:](self, "_thumbnailAtIndex:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v12[2](v12, v13);
  }
  else
  {
    objc_initWeak(&location, self);
    v14 = [QLAsynchronousBlockOperation alloc];
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __81__QLWKWebItemViewController_scrubView_thumbnailForPage_size_withCompletionBlock___block_invoke;
    v16[3] = &unk_24C7254D8;
    v16[4] = self;
    v18[1] = (id)a4;
    v18[2] = *(id *)&width;
    v18[3] = *(id *)&height;
    objc_copyWeak(v18, &location);
    v17 = v12;
    v15 = -[QLAsynchronousBlockOperation initWithBlock:](v14, "initWithBlock:", v16);
    -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v15);

    objc_destroyWeak(v18);
    objc_destroyWeak(&location);
  }

}

void __81__QLWKWebItemViewController_scrubView_thumbnailForPage_size_withCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11[2];

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 1152);
  v5 = *(_QWORD *)(a1 + 56);
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGSize:", *(double *)(a1 + 64), *(double *)(a1 + 72));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __81__QLWKWebItemViewController_scrubView_thumbnailForPage_size_withCompletionBlock___block_invoke_2;
  v8[3] = &unk_24C7254B0;
  objc_copyWeak(v11, (id *)(a1 + 48));
  v11[1] = *(id *)(a1 + 56);
  v9 = *(id *)(a1 + 40);
  v7 = v3;
  v10 = v7;
  objc_msgSend(v4, "thumbnailForPage:size:withCompletionBlock:", v5, v6, v8);

  objc_destroyWeak(v11);
}

void __81__QLWKWebItemViewController_scrubView_thumbnailForPage_size_withCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject **v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "_addThumbnailToCache:atIndex:", v3, *(_QWORD *)(a1 + 56));

  }
  else
  {
    v5 = (NSObject **)MEMORY[0x24BE7BF48];
    v6 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v6 = *v5;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 56);
      v8 = 134217984;
      v9 = v7;
      _os_log_impl(&dword_20D4F5000, v6, OS_LOG_TYPE_ERROR, "Did not obtain thumbnail for page at index: %ld #AnyItemViewController", (uint8_t *)&v8, 0xCu);
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (CGSize)scrubView:(id)a3 pageSizeAtIndex:(unint64_t)a4
{
  double width;
  double height;
  CGSize result;

  width = self->_thumbnailSize.width;
  height = self->_thumbnailSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (id)_thumbnailAtIndex:(unint64_t)a3
{
  NSCache *v5;
  NSCache *indexToThumbnailsCache;
  void *v7;
  void *v8;

  v5 = self->_indexToThumbnailsCache;
  objc_sync_enter(v5);
  indexToThumbnailsCache = self->_indexToThumbnailsCache;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCache objectForKey:](indexToThumbnailsCache, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v5);
  return v8;
}

- (void)_addThumbnailToCache:(id)a3 atIndex:(unint64_t)a4
{
  NSCache *v6;
  NSCache *indexToThumbnailsCache;
  void *v8;
  id v9;

  v9 = a3;
  v6 = self->_indexToThumbnailsCache;
  objc_sync_enter(v6);
  indexToThumbnailsCache = self->_indexToThumbnailsCache;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCache setObject:forKey:](indexToThumbnailsCache, "setObject:forKey:", v9, v8);

  objc_sync_exit(v6);
}

- (void)scrubView:(id)a3 didSelectPageAtIndex:(unint64_t)a4
{
  -[QLWKWebItemViewController _scrollToPage:](self, "_scrollToPage:", a4);
}

- (void)numberOfPagesWithSize:(CGSize)a3 completionHandler:(id)a4
{
  id v4;
  id v5;

  v5 = a4;
  v4 = v5;
  QLRunInMainThreadSync();

}

void __69__QLWKWebItemViewController_numberOfPagesWithSize_completionHandler___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  id v16;

  v2 = *(double *)(a1 + 48);
  v3 = *(double *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "_renderer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPrintableRect:", 0.0, 0.0, v2, v3);

  objc_msgSend(*(id *)(a1 + 32), "_renderer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "printableRect");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(*(id *)(a1 + 32), "_renderer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPaperRect:", v7, v9, v11, v13);

  v15 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_renderer");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t))(v15 + 16))(v15, objc_msgSend(v16, "numberOfPages"));

}

- (void)pdfDataForPageAtIndex:(int64_t)a3 withCompletionHandler:(id)a4
{
  id v4;
  id v5;

  v5 = a4;
  v4 = v5;
  QLRunInMainThreadSync();

}

void __73__QLWKWebItemViewController_pdfDataForPageAtIndex_withCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  void *v12;
  void *v13;
  NSMutableData *data;
  CGRect v15;

  data = (NSMutableData *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_renderer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "printableRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v15.origin.x = v4;
  v15.origin.y = v6;
  v15.size.width = v8;
  v15.size.height = v10;
  UIGraphicsBeginPDFContextToData(data, v15, 0);
  UIGraphicsBeginPDFPage();
  objc_msgSend(*(id *)(a1 + 32), "_renderer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "printFormattersForPageAtIndex:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "rectForPageAtIndex:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v13, "drawInRect:forPageAtIndex:", *(_QWORD *)(a1 + 48));
  UIGraphicsEndPDFContext();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)provideCurrentPageAndVisibleRectWithCompletionHandler:(id)a3
{
  (*((void (**)(id, _QWORD, double, double, double, double))a3 + 2))(a3, 0, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
}

- (void)scrollViewDidScroll:(id)a3
{
  unint64_t v4;

  v4 = -[QLWKWebItemViewController currentPageNumber](self, "currentPageNumber", a3);
  if ((-[QLScrubView isHidden](self->_scrubView, "isHidden") & 1) == 0)
    -[QLScrubView selectPageNumber:](self->_scrubView, "selectPageNumber:", v4);
}

- (void)transitionDidStart:(BOOL)a3
{
  if (!a3)
    -[QLWKWebItemViewController _hideScrubberIfNeeded:](self, "_hideScrubberIfNeeded:", 1);
}

- (void)transitionWillFinish:(BOOL)a3 didComplete:(BOOL)a4
{
  if (!a3 && !a4)
    -[QLWKWebItemViewController _updateScrubberVisibilityAnimated:](self, "_updateScrubberVisibilityAnimated:", 1);
}

- (void)buttonPressedWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_super v9;

  v6 = a4;
  v7 = a3;
  -[QLWKWebItemViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endEditing:", 0);

  v9.receiver = self;
  v9.super_class = (Class)QLWKWebItemViewController;
  -[QLItemViewController buttonPressedWithIdentifier:completionHandler:](&v9, sel_buttonPressedWithIdentifier_completionHandler_, v7, v6);

}

- (void)_updateConstraintConstants:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  _QWORD aBlock[5];

  v3 = a3;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__QLWKWebItemViewController__updateConstraintConstants___block_invoke;
  aBlock[3] = &unk_24C724B00;
  aBlock[4] = self;
  v4 = _Block_copy(aBlock);
  v5 = v4;
  if (v3)
    objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:", v4, 0.2);
  else
    (*((void (**)(void *))v4 + 2))(v4);

}

void __56__QLWKWebItemViewController__updateConstraintConstants___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  void *v4;
  double v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "appearance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "peripheryInsets");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1224), "setConstant:", v3);

  objc_msgSend(*(id *)(a1 + 32), "appearance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "peripheryInsets");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1232), "setConstant:", v5);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNeedsLayout");

}

+ (BOOL)_shouldDisableJavaScriptForContentType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(MEMORY[0x24BE7BFB8], "isIWorkDocumentType:", v3) & 1) != 0)
    LOBYTE(v4) = 0;
  else
    v4 = objc_msgSend(MEMORY[0x24BE7BFB8], "isOfficeDocumentType:", v3) ^ 1;

  return v4;
}

- (void)setWebView:(id)a3
{
  objc_storeStrong((id *)&self->_webView, a3);
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_operationQueue, a3);
}

- (NSCache)indexToThumbnailsCache
{
  return self->_indexToThumbnailsCache;
}

- (void)setIndexToThumbnailsCache:(id)a3
{
  objc_storeStrong((id *)&self->_indexToThumbnailsCache, a3);
}

- (QLPreviewParts)generatedDocument
{
  return (QLPreviewParts *)objc_getProperty(self, a2, 1264, 1);
}

- (void)setGeneratedDocument:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1264);
}

- (NSURLSessionDataTask)generatedDocumentURLSessionTask
{
  return (NSURLSessionDataTask *)objc_getProperty(self, a2, 1272, 1);
}

- (void)setGeneratedDocumentURLSessionTask:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1272);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generatedDocumentURLSessionTask, 0);
  objc_storeStrong((id *)&self->_generatedDocument, 0);
  objc_storeStrong((id *)&self->_indexToThumbnailsCache, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_rightConstraint, 0);
  objc_storeStrong((id *)&self->_leftConstraint, 0);
  objc_storeStrong((id *)&self->_scrubberRightConstraint, 0);
  objc_storeStrong((id *)&self->_scrubView, 0);
  objc_storeStrong((id *)&self->_paginator, 0);
  objc_storeStrong((id *)&self->_thumbnailGenerator, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_previewContentType, 0);
}

@end

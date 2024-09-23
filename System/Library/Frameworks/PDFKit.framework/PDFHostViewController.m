@implementation PDFHostViewController

+ (BOOL)useIOSurfaceForTiles
{
  return sUseIOSurfaceForTiles == 1;
}

+ (void)setUseIOSurfaceForTiles:(BOOL)a3
{
  sUseIOSurfaceForTiles = a3;
}

+ (void)createHostView:(id)a3 forExtensionIdentifier:(id)a4
{
  id v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a3;
  v6 = (__CFString *)a4;
  if (v6)
    v7 = v6;
  else
    v7 = CFSTR("com.apple.PDFKit.PDFExtensionView");
  +[PDFHostViewController loadExtension:](PDFHostViewController, "loadExtension:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __63__PDFHostViewController_createHostView_forExtensionIdentifier___block_invoke;
  v11[3] = &unk_24C25D160;
  v12 = v8;
  v13 = v5;
  v9 = v5;
  v10 = v8;
  objc_msgSend(v10, "instantiateViewControllerWithInputItems:connectionHandler:", 0, v11);

}

void __63__PDFHostViewController_createHostView_forExtensionIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD *v7;
  void *v8;
  PDFHostViewControllerPrivate *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    objc_msgSend(*(id *)(a1 + 32), "_extensionContextForUUID:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc_init(PDFHostViewControllerPrivate);
    v10 = (void *)v7[184];
    v7[184] = v9;

    objc_storeStrong((id *)(v7[184] + 8), *(id *)(a1 + 32));
    objc_msgSend(v8, "_auxiliaryConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "remoteObjectProxy");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v7[184];
    v14 = *(void **)(v13 + 16);
    *(_QWORD *)(v13 + 16) = v12;

    objc_msgSend(v8, "setHostViewController:", v7);
    if (!*(_QWORD *)(v7[184] + 16))
    {
      NSLog(CFSTR("PDFHostViewController proxy failed to initialize."));
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    if (sUseIOSurfaceForTiles != 2)
    {
      v15 = *(void **)(v7[184] + 16);
      v18[0] = CFSTR("function");
      v18[1] = CFSTR("value");
      v19[0] = CFSTR("setUseIOSurfaceForTiles");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", sUseIOSurfaceForTiles == 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19[1] = v16;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "hostToExtension:", v17);

    }
    objc_msgSend(v7, "setup");
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    NSLog(CFSTR("PDFHostViewController failed to initialize."));
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)setup
{
  PDFExtensionTopView *v3;
  void *v4;
  uint64_t v5;
  PDFHostViewControllerPrivate *v6;
  PDFExtensionTopView *topView;
  void *v8;
  void *v9;
  PDFExtensionTopView *v10;
  void *v11;
  PDFHostViewControllerPrivate *v12;
  PDFPasswordViewController *passwordViewController;
  PDFHostViewControllerPrivate *v14;
  NSString *password;
  CGPoint v16;

  v3 = [PDFExtensionTopView alloc];
  -[PDFHostViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v5 = -[PDFExtensionTopView initWithFrame:](v3, "initWithFrame:");
  v6 = self->_private;
  topView = v6->topView;
  v6->topView = (PDFExtensionTopView *)v5;

  -[PDFExtensionTopView setAutoresizingMask:](self->_private->topView, "setAutoresizingMask:", 18);
  -[PDFHostViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", self->_private->topView);

  -[PDFHostViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bringSubviewToFront:", self->_private->topView);

  v10 = self->_private->topView;
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.001);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFExtensionTopView setBackgroundColor:](v10, "setBackgroundColor:", v11);

  v12 = self->_private;
  passwordViewController = v12->passwordViewController;
  v12->passwordViewController = 0;

  v14 = self->_private;
  password = v14->password;
  v14->password = 0;

  self->_private->isUnlocked = 1;
  self->_private->currentPageIndex = 0;
  self->_private->pageCount = 0;
  self->_private->documentViewSize = (CGSize)*MEMORY[0x24BDBF148];
  self->_private->minScaleFactor = 1.0;
  self->_private->maxScaleFactor = 5.0;
  self->_private->hasSelection = 0;
  v16 = (CGPoint)*MEMORY[0x24BDBEFB0];
  self->_private->topLeftSelectionPoint = (CGPoint)*MEMORY[0x24BDBEFB0];
  self->_private->bottomRightSelectionPoint = v16;
  self->_private->pdfViewIsRotating = 0;
  self->_private->pdfViewNeedsUpdate = 0;
  self->_private->hostScrollViewObserverIsActive = 0;
  -[PDFHostViewController _gestureInit](self, "_gestureInit");
  -[PDFHostViewController _setupExtensionInterruptionBlock](self, "_setupExtensionInterruptionBlock");
}

- (void)dealloc
{
  PDFHostViewControllerPrivate *v3;
  id WeakRetained;
  objc_super v5;

  v3 = self->_private;
  if (v3->hostScrollViewObserverIsActive)
  {
    v3->hostScrollViewObserverIsActive = 0;
    WeakRetained = objc_loadWeakRetained((id *)&self->_private->hostScrollView);
    objc_msgSend(WeakRetained, "removeObserver:forKeyPath:context:", self, CFSTR("contentInset"), CFSTR("PDFHostViewController.contentInsetPropertyObservationContext"));

    v3 = self->_private;
  }
  -[PDFExtensionProtocol hostToExtension:](v3->extensionProxy, "hostToExtension:", &unk_24C27DA50);
  v5.receiver = self;
  v5.super_class = (Class)PDFHostViewController;
  -[_UIRemoteViewController dealloc](&v5, sel_dealloc);
}

- (void)_setupExtensionInterruptionBlock
{
  NSExtension *extension;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  extension = self->_private->extension;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __57__PDFHostViewController__setupExtensionInterruptionBlock__block_invoke;
  v4[3] = &unk_24C25D188;
  objc_copyWeak(&v5, &location);
  -[NSExtension setRequestInterruptionBlock:](extension, "setRequestInterruptionBlock:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __57__PDFHostViewController__setupExtensionInterruptionBlock__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void (**v3)(_QWORD);
  _QWORD v4[4];
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __57__PDFHostViewController__setupExtensionInterruptionBlock__block_invoke_2;
    v4[3] = &unk_24C25C350;
    v5 = WeakRetained;
    v3 = (void (**)(_QWORD))MEMORY[0x20BD1AEB4](v4);
    if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
      v3[2](v3);
    else
      dispatch_async(MEMORY[0x24BDAC9B8], v3);

  }
}

void __57__PDFHostViewController__setupExtensionInterruptionBlock__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1472) + 24));
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "setContentOffset:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
    objc_msgSend(WeakRetained, "setContentSize:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1472);
    if (*(_BYTE *)(v3 + 378))
    {
      *(_BYTE *)(v3 + 378) = 0;
      objc_msgSend(WeakRetained, "removeObserver:forKeyPath:context:", *(_QWORD *)(a1 + 32), CFSTR("contentInset"), CFSTR("PDFHostViewController.contentInsetPropertyObservationContext"));
    }
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1472) + 64), "removeFromSuperview");
  v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1472) + 32));
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "pdfHostViewControllerExtensionProcessDidCrash:", *(_QWORD *)(a1 + 32));

}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_private->hostViewControllerDelegate, a3);
}

- (void)setDocumentData:(id)a3 withScrollView:(id)a4
{
  id v6;
  id v7;
  PDFExtensionProtocol *extensionProxy;
  void *v9;
  id WeakRetained;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  PDFHostViewControllerPrivate *v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  PDFHostViewControllerPrivate *v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  _QWORD v25[2];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    extensionProxy = self->_private->extensionProxy;
    v25[0] = CFSTR("function");
    v25[1] = CFSTR("data");
    v26[0] = CFSTR("setDocumentData");
    v26[1] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFExtensionProtocol hostToExtension:](extensionProxy, "hostToExtension:", v9);

    WeakRetained = objc_loadWeakRetained((id *)&self->_private->hostScrollView);
    v11 = v7;
    if (WeakRetained != v7)
    {
      v12 = WeakRetained;
      objc_storeWeak((id *)&self->_private->hostScrollView, v7);
      v11 = objc_loadWeakRetained((id *)&self->_private->hostScrollView);

      objc_msgSend(v7, "panGestureRecognizer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "requireGestureRecognizerToFail:", self->_private->longPressGestureRecognizer);

      objc_msgSend(v7, "panGestureRecognizer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "requireGestureRecognizerToFail:", self->_private->panGestureRecognizer);

      objc_msgSend(v11, "addObserver:forKeyPath:options:context:", self, CFSTR("contentInset"), 1, CFSTR("PDFHostViewController.contentInsetPropertyObservationContext"));
      self->_private->hostScrollViewObserverIsActive = 1;
    }
    -[PDFHostViewController _resetPDFHostViewControllerViews](self, "_resetPDFHostViewControllerViews");
    v15 = self->_private;
    objc_msgSend(v7, "frame");
    v15->scrollViewFrame.origin.x = v16;
    v15->scrollViewFrame.origin.y = v17;
    v15->scrollViewFrame.size.width = v18;
    v15->scrollViewFrame.size.height = v19;
    v20 = self->_private;
    objc_msgSend(v7, "contentInset");
    v20->contentInset.top = v21;
    v20->contentInset.left = v22;
    v20->contentInset.bottom = v23;
    v20->contentInset.right = v24;
    -[PDFHostViewController updatePDFViewLayout](self, "updatePDFViewLayout");

  }
}

- (void)_resetPDFHostViewControllerViews
{
  double v3;
  double v4;
  void *v5;
  PDFPasswordViewController *passwordViewController;
  PDFPasswordViewController *v7;
  void *v8;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_private->hostScrollView);
  objc_msgSend(WeakRetained, "setMinimumZoomScale:", 1.0);
  objc_msgSend(WeakRetained, "setMaximumZoomScale:", 1.0);
  objc_msgSend(WeakRetained, "setZoomScale:", 1.0);
  objc_msgSend(WeakRetained, "frame");
  objc_msgSend(WeakRetained, "setContentSize:", v3, v4);
  -[PDFHostViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "frame");
  objc_msgSend(v5, "setFrame:");

  passwordViewController = self->_private->passwordViewController;
  if (passwordViewController)
  {
    v7 = passwordViewController;
    -[PDFPasswordViewController clearPasswordField](v7, "clearPasswordField");
    -[PDFPasswordViewController viewIfLoaded](self->_private->passwordViewController, "viewIfLoaded");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "removeFromSuperview");
  }

}

+ (id)backgroundColor
{
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "secondarySystemBackgroundColor");
}

- (int64_t)currentPageIndex
{
  return self->_private->currentPageIndex;
}

- (int64_t)pageCount
{
  return self->_private->pageCount;
}

- (double)minimumZoomScale
{
  return self->_private->minScaleFactor;
}

- (double)maximumZoomScale
{
  return self->_private->maxScaleFactor;
}

- (void)findString:(id)a3 withOptions:(unint64_t)a4
{
  __CFString *v6;
  __CFString *v7;
  PDFExtensionProtocol *extensionProxy;
  void *v9;
  void *v10;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x24BDAC8D0];
  v6 = (__CFString *)a3;
  if (v6)
    v7 = v6;
  else
    v7 = &stru_24C25F170;
  extensionProxy = self->_private->extensionProxy;
  v11[0] = CFSTR("function");
  v11[1] = CFSTR("string");
  v12[0] = CFSTR("findString");
  v12[1] = v7;
  v11[2] = CFSTR("options");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFExtensionProtocol hostToExtension:](extensionProxy, "hostToExtension:", v10);

  if (!-[__CFString length](v7, "length"))
    -[PDFHostViewController findStringUpdate:done:](self, "findStringUpdate:done:", 0, 1);

}

- (void)cancelFindString
{
  -[PDFExtensionProtocol hostToExtension:](self->_private->extensionProxy, "hostToExtension:", &unk_24C27DA78);
}

- (void)cancelFindStringWithHighlightsCleared:(BOOL)a3
{
  PDFExtensionProtocol *extensionProxy;
  void *v4;
  void *v5;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  extensionProxy = self->_private->extensionProxy;
  v6[0] = CFSTR("function");
  v6[1] = CFSTR("clearHighlights");
  v7[0] = CFSTR("cancelFindStringWithHighlightsCleared");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFExtensionProtocol hostToExtension:](extensionProxy, "hostToExtension:", v5);

}

- (void)focusOnSearchResultAtIndex:(unint64_t)a3
{
  PDFExtensionProtocol *extensionProxy;
  void *v4;
  void *v5;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  extensionProxy = self->_private->extensionProxy;
  v6[0] = CFSTR("function");
  v6[1] = CFSTR("searchIndex");
  v7[0] = CFSTR("focusOnSearchResultAtIndex");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFExtensionProtocol hostToExtension:](extensionProxy, "hostToExtension:", v5);

}

- (void)clearSearchHighlights
{
  -[PDFExtensionProtocol hostToExtension:](self->_private->extensionProxy, "hostToExtension:", &unk_24C27DAA0);
}

- (void)goToPageIndex:(int64_t)a3
{
  PDFExtensionProtocol *extensionProxy;
  void *v6;
  void *v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  extensionProxy = self->_private->extensionProxy;
  v8[0] = CFSTR("function");
  v8[1] = CFSTR("pageIndex");
  v9[0] = CFSTR("goToPageIndex");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFExtensionProtocol hostToExtension:](extensionProxy, "hostToExtension:", v7);

  -[PDFPageLabelView setCurrentPageNumber:forPageCount:](self->_private->pageLabelView, "setCurrentPageNumber:forPageCount:", a3 + 1, self->_private->pageCount);
}

- (void)goToPageIndex:(int64_t)a3 withViewFrustum:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  id WeakRetained;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->hostScrollView);
  -[PDFHostViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "convertRect:toView:", WeakRetained, x, y, width, height);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  objc_msgSend(WeakRetained, "scrollRectToVisible:animated:", 0, v12, v14, v16, v18);
  v19 = objc_loadWeakRetained((id *)&self->_private->hostViewControllerDelegate);
  if (v19 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v19, "pdfHostViewController:goToPageIndex:withViewFrustum:", self, a3, x, y, width, height);
  -[PDFPageLabelView setCurrentPageNumber:forPageCount:](self->_private->pageLabelView, "setCurrentPageNumber:forPageCount:", a3 + 1, self->_private->pageCount);

}

- (void)viewDidLayoutSubviews
{
  PDFHostViewControllerPrivate *v2;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  id WeakRetained;
  CGRect v9;

  v2 = self->_private;
  if (v2->isUnlocked)
  {
    WeakRetained = objc_loadWeakRetained((id *)&v2->hostScrollView);
    objc_msgSend(WeakRetained, "frame");
    v9.origin.x = v4;
    v9.origin.y = v5;
    v9.size.width = v6;
    v9.size.height = v7;
    if (PDFRectEqualToRect(self->_private->scrollViewFrame, v9) || self->_private->pdfViewIsRotating)
    {
      -[PDFHostViewController updatePDFViewLayout](self, "updatePDFViewLayout");
    }
    else
    {
      -[PDFHostViewController beginPDFViewRotation](self, "beginPDFViewRotation");
      -[PDFHostViewController endPDFViewRotation](self, "endPDFViewRotation");
    }

  }
}

- (CGSize)_documentViewSize
{
  PDFHostViewControllerPrivate *v2;
  double width;
  double height;
  id WeakRetained;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  v2 = self->_private;
  width = v2->documentViewSize.width;
  height = v2->documentViewSize.height;
  if (width == *MEMORY[0x24BDBF148] && height == *(double *)(MEMORY[0x24BDBF148] + 8))
  {
    WeakRetained = objc_loadWeakRetained((id *)&v2->hostScrollView);
    objc_msgSend(WeakRetained, "frame");
    width = v7;
    height = v8;

  }
  v9 = width;
  v10 = height;
  result.height = v10;
  result.width = v9;
  return result;
}

- (UIEdgeInsets)_pdfViewInsets
{
  PDFHostViewControllerPrivate *v2;
  double v3;
  double MaxInsets;
  double v5;
  double v6;
  double v7;
  UIEdgeInsets result;

  v2 = self->_private;
  -[PDFHostViewController _pdfViewSafeAreaInsets](self, "_pdfViewSafeAreaInsets");
  MaxInsets = PDFEdgeInsetsGetMaxInsets(v2->contentInset.top, v2->contentInset.left, v2->contentInset.bottom, v2->contentInset.right, v3);
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = MaxInsets;
  return result;
}

- (UIEdgeInsets)_pdfViewSafeAreaInsets
{
  PDFHostViewControllerPrivate *v2;
  id WeakRetained;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  PDFHostViewControllerPrivate *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  UIEdgeInsets result;

  v2 = self->_private;
  if (v2->isUnlocked)
  {
    WeakRetained = objc_loadWeakRetained((id *)&v2->hostScrollView);
    objc_msgSend(WeakRetained, "safeAreaInsets");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;

    v13 = self->_private;
    v14 = 0.0;
    if (v13->contentInset.top <= v6)
      v15 = v6;
    else
      v15 = 0.0;
    if (v13->contentInset.left <= v8)
      v16 = v8;
    else
      v16 = 0.0;
    if (v13->contentInset.bottom <= v10)
      v17 = v10;
    else
      v17 = 0.0;
    if (v13->contentInset.right <= v12)
      v14 = v12;
  }
  else
  {
    v15 = *MEMORY[0x24BDF7718];
    v16 = *(double *)(MEMORY[0x24BDF7718] + 8);
    v17 = *(double *)(MEMORY[0x24BDF7718] + 16);
    v14 = *(double *)(MEMORY[0x24BDF7718] + 24);
  }
  result.right = v14;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

- (CGRect)_insetBoundsInDocument
{
  id WeakRetained;
  PDFHostViewControllerPrivate *v4;
  double left;
  double top;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  CGRect result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_private->hostScrollView);
  objc_msgSend(WeakRetained, "bounds");
  v4 = self->_private;
  top = v4->contentInset.top;
  left = v4->contentInset.left;
  v8 = v7 + left;
  v10 = v9 + top;
  v12 = v11 - (left + v4->contentInset.right);
  v14 = v13 - (top + v4->contentInset.bottom);
  -[PDFHostViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "convertRect:toView:", v15, v8, v10, v12, v14);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  -[PDFHostViewController _pdfViewSafeAreaInsets](self, "_pdfViewSafeAreaInsets");
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;
  -[PDFHostViewController _hostScrollViewZoomScale](self, "_hostScrollViewZoomScale");
  v33 = PDFRectScale(v25, v27, v29, v31, 1.0 / v32);
  v36 = v21 - (v34 + v35);
  v38 = v23 - (v33 + v37);

  v39 = v17;
  v40 = v19;
  v41 = v36;
  v42 = v38;
  result.size.height = v42;
  result.size.width = v41;
  result.origin.y = v40;
  result.origin.x = v39;
  return result;
}

- (double)_hostScrollViewZoomScale
{
  id WeakRetained;
  double v4;
  double v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_private->hostScrollView);
  objc_msgSend(WeakRetained, "zoomScale");
  v5 = CGFloatClamp(v4, self->_private->minScaleFactor, self->_private->maxScaleFactor);

  return v5;
}

- (void)updatePDFViewLayout
{
  id WeakRetained;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  PDFHostViewControllerPrivate *v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  PDFHostViewControllerPrivate *v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  PDFHostViewControllerPrivate *v39;
  PDFHostViewControllerPrivate *v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  double v45;
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
  double v57;
  void *v58;
  PDFExtensionProtocol *extensionProxy;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  _QWORD v65[4];
  _QWORD v66[4];
  _QWORD v67[4];
  _QWORD v68[5];
  _QWORD v69[7];

  v69[5] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->hostScrollView);
  objc_msgSend(WeakRetained, "frame");
  v8 = v7;
  v9 = self->_private;
  if (v9->scrollViewFrame.size.width == v5)
  {
    v10 = v6;
    if (v9->scrollViewFrame.size.height == v6)
    {
      v11 = v4;
      v12 = v5;
      objc_msgSend(WeakRetained, "contentInset");
      v9->contentInset.top = v13;
      v9->contentInset.left = v14;
      v9->contentInset.bottom = v15;
      v9->contentInset.right = v16;
      objc_msgSend(WeakRetained, "bounds");
      v18 = v17;
      v20 = v19;
      v22 = v21;
      v24 = v23;
      -[PDFHostViewController view](self, "view");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "convertRect:toView:", v25, v18, v20, v22, v24);
      v27 = v26;
      v29 = v28;
      v31 = v30;
      v33 = v32;

      v34 = self->_private;
      -[PDFHostViewController _insetBoundsInDocument](self, "_insetBoundsInDocument");
      v34->insetBoundsInDocument.origin.x = v35;
      v34->insetBoundsInDocument.origin.y = v36;
      v34->insetBoundsInDocument.size.width = v37;
      v34->insetBoundsInDocument.size.height = v38;
      v39 = self->_private;
      v39->scrollViewFrame.origin.x = v8;
      v39->scrollViewFrame.origin.y = v11;
      v39->scrollViewFrame.size.width = v12;
      v39->scrollViewFrame.size.height = v10;
      v40 = self->_private;
      -[PDFHostViewController _pdfViewSafeAreaInsets](self, "_pdfViewSafeAreaInsets");
      v40->pdfSafeAreaInsets.top = v41;
      v40->pdfSafeAreaInsets.left = v42;
      v40->pdfSafeAreaInsets.bottom = v43;
      v40->pdfSafeAreaInsets.right = v44;
      -[PDFHostViewController _hostScrollViewZoomScale](self, "_hostScrollViewZoomScale");
      v57 = v45;
      extensionProxy = self->_private->extensionProxy;
      v69[0] = CFSTR("updatePDFViewLayout");
      v68[0] = CFSTR("function");
      v68[1] = CFSTR("boundsInDocument");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v27);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v67[0] = v64;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v29);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v67[1] = v63;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v31);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v67[2] = v62;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v33);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v67[3] = v61;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v67, 4);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v69[1] = v60;
      v68[2] = CFSTR("scrollViewFrame");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v8);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v66[0] = v58;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v11);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v66[1] = v56;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v12);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v66[2] = v55;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v10);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v66[3] = v54;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v66, 4);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v69[2] = v53;
      v68[3] = CFSTR("safeAreaInsets");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_private->pdfSafeAreaInsets.top);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v65[0] = v46;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_private->pdfSafeAreaInsets.left);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v65[1] = v47;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_private->pdfSafeAreaInsets.bottom);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v65[2] = v48;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_private->pdfSafeAreaInsets.right);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v65[3] = v49;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v65, 4);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v69[3] = v50;
      v68[4] = CFSTR("zoomScale");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v57);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v69[4] = v51;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v69, v68, 5);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[PDFExtensionProtocol hostToExtension:](extensionProxy, "hostToExtension:", v52);

      v9 = self->_private;
    }
  }
  -[PDFPageLabelView updateEffect](v9->pageLabelView, "updateEffect");

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  PDFHostViewControllerPrivate *v7;
  id WeakRetained;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  PDFHostViewControllerPrivate *v13;
  objc_super v14;

  if (a6 == CFSTR("PDFHostViewController.contentInsetPropertyObservationContext"))
  {
    v7 = self->_private;
    WeakRetained = objc_loadWeakRetained((id *)&v7->hostScrollView);
    objc_msgSend(WeakRetained, "contentInset");
    v7->contentInset.top = v9;
    v7->contentInset.left = v10;
    v7->contentInset.bottom = v11;
    v7->contentInset.right = v12;

    v13 = self->_private;
    if (v13->pdfViewNeedsUpdate)
    {
      v13->pdfViewNeedsUpdate = 0;
      -[PDFHostViewController _endPDFViewRotationAnimated:withUpdate:](self, "_endPDFViewRotationAnimated:withUpdate:", 1, 0);
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)PDFHostViewController;
    -[PDFHostViewController observeValueForKeyPath:ofObject:change:context:](&v14, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (id)pageNumberIndicator
{
  PDFPageLabelView *pageLabelView;
  PDFPageLabelView *v4;
  PDFHostViewControllerPrivate *v5;
  PDFPageLabelView *v6;

  pageLabelView = self->_private->pageLabelView;
  if (!pageLabelView)
  {
    v4 = -[PDFPageLabelView initWithFrame:]([PDFPageLabelView alloc], "initWithFrame:", 10.0, 10.0, 75.0, 35.0);
    v5 = self->_private;
    v6 = v5->pageLabelView;
    v5->pageLabelView = v4;

    pageLabelView = self->_private->pageLabelView;
  }
  return pageLabelView;
}

- (void)snapshotViewRect:(CGRect)a3 snapshotWidth:(id)a4 afterScreenUpdates:(BOOL)a5 withResult:(id)a6
{
  _BOOL8 v7;
  double height;
  double width;
  double y;
  double x;
  id v13;
  uint64_t v14;
  PDFHostViewControllerPrivate *v15;
  id snapshotCompletion;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  PDFExtensionProtocol *extensionProxy;
  void *v23;
  void *v24;
  _QWORD v25[4];
  _QWORD v26[4];
  _QWORD v27[5];

  v7 = a5;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v27[4] = *MEMORY[0x24BDAC8D0];
  v13 = a4;
  v14 = MEMORY[0x20BD1AEB4](a6);
  v15 = self->_private;
  snapshotCompletion = v15->snapshotCompletion;
  v15->snapshotCompletion = (id)v14;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", x);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v17;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", y);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v18;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", width);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v19;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", height);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  extensionProxy = self->_private->extensionProxy;
  v25[0] = CFSTR("function");
  v25[1] = CFSTR("rect");
  v26[0] = CFSTR("snapshotViewRect");
  v26[1] = v21;
  v26[2] = v13;
  v25[2] = CFSTR("width");
  v25[3] = CFSTR("afterScreenUpdates");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v7);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v23;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFExtensionProtocol hostToExtension:](extensionProxy, "hostToExtension:", v24);

}

- (void)recievedSnapshotViewRect:(id)a3
{
  void (**snapshotCompletion)(id, id);

  if (a3)
  {
    snapshotCompletion = (void (**)(id, id))self->_private->snapshotCompletion;
    if (snapshotCompletion)
      snapshotCompletion[2](snapshotCompletion, a3);
  }
}

- (void)_setMinimumZoomScale:(double)a3
{
  PDFExtensionProtocol *extensionProxy;
  void *v4;
  void *v5;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  extensionProxy = self->_private->extensionProxy;
  v6[0] = CFSTR("function");
  v6[1] = CFSTR("minimumZoomScale");
  v7[0] = CFSTR("setMinimumZoomScale");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFExtensionProtocol hostToExtension:](extensionProxy, "hostToExtension:", v5);

}

- (void)_setMaximumZoomScale:(double)a3
{
  PDFExtensionProtocol *extensionProxy;
  void *v4;
  void *v5;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  extensionProxy = self->_private->extensionProxy;
  v6[0] = CFSTR("function");
  v6[1] = CFSTR("maximumZoomScale");
  v7[0] = CFSTR("setMaximumZoomScale");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFExtensionProtocol hostToExtension:](extensionProxy, "hostToExtension:", v5);

}

- (void)copy:(id)a3
{
  -[PDFExtensionProtocol hostToExtension:](self->_private->extensionProxy, "hostToExtension:", &unk_24C27DAC8);
}

- (void)selectAll:(id)a3
{
  -[PDFExtensionProtocol hostToExtension:](self->_private->extensionProxy, "hostToExtension:", &unk_24C27DAF0);
}

- (void)setupDocumentViewSize:(CGSize)a3
{
  id WeakRetained;

  self->_private->documentViewSize = a3;
  -[PDFHostViewController updateDocumentViewSize](self, "updateDocumentViewSize");
  -[PDFHostViewController updateAutoScaleFactor](self, "updateAutoScaleFactor");
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->hostScrollView);
  objc_msgSend(WeakRetained, "setZoomScale:", self->_private->minScaleFactor);
  objc_msgSend(WeakRetained, "setContentOffset:", PDFPointMake(-self->_private->contentInset.left, -self->_private->contentInset.top));

}

- (void)updateDocumentViewSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  __n128 v17;
  __n128 v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  BOOL v31;
  void *v32;
  double v33;
  double v34;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  id WeakRetained;
  CGRect v44;
  CGRect v45;

  WeakRetained = objc_loadWeakRetained((id *)&self->_private->hostScrollView);
  -[PDFHostViewController _hostScrollViewZoomScale](self, "_hostScrollViewZoomScale");
  v4 = v3;
  -[PDFHostViewController _documentViewSize](self, "_documentViewSize");
  v6 = v5;
  v8 = v7;
  v9 = -[PDFHostViewController _pdfViewSafeAreaInsets](self, "_pdfViewSafeAreaInsets");
  v14 = PDFSizeMake(v9, v11 + v10 + v6 * v4, v13 + v12 + v8 * v4);
  v16 = v15;
  v17.n128_u64[0] = 0;
  v18.n128_u64[0] = 0;
  v19 = PDFRectMake(v17, v18, v14, v16);
  v21 = v20;
  v23 = v22;
  v25 = v24;
  -[PDFHostViewController view](self, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "frame");
  v45.origin.x = v27;
  v45.origin.y = v28;
  v45.size.width = v29;
  v45.size.height = v30;
  v44.origin.x = v19;
  v44.origin.y = v21;
  v44.size.width = v23;
  v44.size.height = v25;
  v31 = PDFRectEqualToRect(v44, v45);

  if (!v31)
  {
    -[PDFHostViewController view](self, "view");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setFrame:", v19, v21, v23, v25);

  }
  objc_msgSend(WeakRetained, "contentSize");
  if (v14 != v34 || v16 != v33)
  {
    objc_msgSend(WeakRetained, "contentOffset");
    v37 = v36;
    v39 = v38;
    objc_msgSend(WeakRetained, "setContentSize:", v14, v16);
    objc_msgSend(WeakRetained, "contentOffset");
    if (v37 != v41 || v39 != v40)
      objc_msgSend(WeakRetained, "setContentOffset:", v37, v39);
  }

}

- (void)updateAutoScaleFactor
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_private->hostScrollView);
  -[PDFHostViewController _documentViewSize](self, "_documentViewSize");
  v4 = v3;
  -[PDFHostViewController _pdfViewInsets](self, "_pdfViewInsets");
  v7 = v5 + v6;
  objc_msgSend(WeakRetained, "bounds");
  v9 = (v8 - v7) / v4;
  if (v9 <= 0.00000011920929)
    v9 = 1.0;
  self->_private->minScaleFactor = v9;
  self->_private->maxScaleFactor = self->_private->minScaleFactor + 5.0;
  objc_msgSend(WeakRetained, "setMinimumZoomScale:", self->_private->minScaleFactor);
  objc_msgSend(WeakRetained, "setMaximumZoomScale:", self->_private->maxScaleFactor);
  -[PDFHostViewController _setMinimumZoomScale:](self, "_setMinimumZoomScale:", self->_private->minScaleFactor);
  -[PDFHostViewController _setMaximumZoomScale:](self, "_setMaximumZoomScale:", self->_private->maxScaleFactor);

}

- (void)documentIsLocked:(BOOL)a3
{
  self->_private->isUnlocked = !a3;
  if (a3)
    -[PDFHostViewController _appendPasswordUI](self, "_appendPasswordUI");
}

- (void)updateCurrentPageIndex:(int64_t)a3
{
  id WeakRetained;

  self->_private->currentPageIndex = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->hostViewControllerDelegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "pdfHostViewController:updateCurrentPageIndex:", self, a3);
  -[PDFPageLabelView setCurrentPageNumber:forPageCount:](self->_private->pageLabelView, "setCurrentPageNumber:forPageCount:", self->_private->currentPageIndex + 1, self->_private->pageCount);

}

- (void)updatePageCount:(int64_t)a3
{
  id WeakRetained;

  self->_private->pageCount = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->hostViewControllerDelegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "pdfHostViewController:updatePageCount:", self, a3);
  -[PDFPageLabelView setCurrentPageNumber:forPageCount:](self->_private->pageLabelView, "setCurrentPageNumber:forPageCount:", self->_private->currentPageIndex + 1, self->_private->pageCount);

}

- (void)findStringUpdate:(unint64_t)a3 done:(BOOL)a4
{
  _BOOL8 v4;
  id WeakRetained;
  void *v8;
  char v9;
  void *v10;

  v4 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->hostViewControllerDelegate);
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v10 = WeakRetained;
    v9 = objc_opt_respondsToSelector();
    v8 = v10;
    if ((v9 & 1) != 0)
    {
      objc_msgSend(v10, "pdfHostViewController:findStringUpdate:done:", self, a3, v4);
      v8 = v10;
    }
  }

}

- (void)showSelectionRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double CenterPoint;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  id WeakRetained;
  CGRect v46;
  CGRect v47;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->hostScrollView);
  -[PDFHostViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "convertRect:fromView:", v8, x, y, width, height);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  objc_msgSend(WeakRetained, "bounds");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  -[PDFHostViewController _pdfViewInsets](self, "_pdfViewInsets");
  v44 = v25;
  v42 = v27;
  v43 = v26;
  v46.origin.x = PDFEdgeInsetsInsetRect(v18, v20, v22, v24, v25, v28, v26, v27);
  v47.origin.x = v10;
  v47.origin.y = v12;
  v47.size.width = v14;
  v47.size.height = v16;
  if (!PDFRectContainsRect(v46, v47))
  {
    CenterPoint = PDFRectGetCenterPoint(v10, v12, v14);
    v31 = v30;
    objc_msgSend(WeakRetained, "contentSize");
    v33 = v32;
    v35 = v34;
    v36 = PDFRectMakeFromCenter(CenterPoint, v31, v22);
    v38 = v37;
    if (v42 + v33 - v22 >= 0.0)
      v39 = v42 + v33 - v22;
    else
      v39 = 0.0;
    v40 = CGFloatClamp(v36, 0.0, v39);
    if (v43 + v35 - v24 >= 0.0)
      v41 = v43 + v35 - v24;
    else
      v41 = 0.0;
    objc_msgSend(WeakRetained, "setContentOffset:animated:", 1, v40, CGFloatClamp(v38, -v44, v41));
  }

}

- (void)setHasSelection:(BOOL)a3
{
  self->_private->hasSelection = a3;
}

- (void)setTextSelectionPoints:(CGPoint)a3 right:(CGPoint)a4
{
  self->_private->topLeftSelectionPoint = a3;
  self->_private->bottomRightSelectionPoint = a4;
}

- (void)showTextSelectionMenu:(BOOL)a3 selectionRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  _BOOL4 v8;
  id v10;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3;
  objc_msgSend(MEMORY[0x24BDF6BB0], "sharedMenuController");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[PDFExtensionTopView becomeFirstResponder](self->_private->topView, "becomeFirstResponder");
    objc_msgSend(v10, "showMenuFromView:rect:", self->_private->topView, x, y, width, height);
  }
  else
  {
    objc_msgSend(v10, "hideMenu");
  }

}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  return sel_copy_ == a3 || sel_selectAll_ == a3;
}

- (void)zoomToRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  id WeakRetained;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!PDFRectIsEmpty(a3))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_private->hostScrollView);
    objc_msgSend(WeakRetained, "frame");
    v9 = CGFloatClamp((v8 - self->_private->contentInset.left - self->_private->contentInset.right) / width, self->_private->minScaleFactor, self->_private->maxScaleFactor);
    objc_msgSend(WeakRetained, "zoomToRect:animated:", 1, x - self->_private->contentInset.left / v9 * 0.5, y - self->_private->contentInset.top / v9 * 0.5, width, height);
    -[PDFHostViewController updatePDFViewLayout](self, "updatePDFViewLayout");

  }
}

- (void)goToURL:(id)a3 atLocation:(CGPoint)a4
{
  double y;
  double x;
  id WeakRetained;
  id v8;

  y = a4.y;
  x = a4.x;
  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->hostViewControllerDelegate);
  if (WeakRetained)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "pdfHostViewController:goToURL:atLocation:", self, v8, x, y);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "pdfHostViewController:goToURL:", self, v8);
  }

}

- (void)goToPageIndex:(int64_t)a3 pageFrame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;
  id WeakRetained;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->hostScrollView);
  -[PDFHostViewController _hostScrollViewZoomScale](self, "_hostScrollViewZoomScale");
  if (v10 > self->_private->minScaleFactor)
    objc_msgSend(WeakRetained, "setZoomScale:animated:", 0);
  -[PDFHostViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "convertRect:toView:", WeakRetained, x, y, width, height);
  v13 = v12;

  objc_msgSend(WeakRetained, "contentOffset");
  v15 = v14;
  -[PDFHostViewController _pdfViewInsets](self, "_pdfViewInsets");
  v17 = v13 - v16;
  v18 = -self->_private->contentInset.top;
  -[PDFHostViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "frame");
  v21 = v20;
  objc_msgSend(WeakRetained, "bounds");
  v23 = CGFloatClamp(v17, v18, v21 - v22);

  objc_msgSend(WeakRetained, "setContentOffset:", v15, v23);
  v24 = objc_loadWeakRetained((id *)&self->_private->hostViewControllerDelegate);
  if (v24 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v24, "pdfHostViewController:goToPageIndex:", self, a3);

}

- (void)goToDestination:(int64_t)a3 point:(CGPoint)a4
{
  double y;
  double x;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  id v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  id WeakRetained;

  y = a4.y;
  x = a4.x;
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->hostScrollView);
  -[PDFHostViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertPoint:toView:", WeakRetained, x, y);
  v10 = v9;
  v12 = v11;

  -[PDFHostViewController _pdfViewInsets](self, "_pdfViewInsets");
  v14 = v13;
  v16 = v10 - v15;
  v17 = -self->_private->contentInset.left;
  -[PDFHostViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "frame");
  v20 = v19;
  objc_msgSend(WeakRetained, "bounds");
  v22 = CGFloatClamp(v16, v17, v20 - v21);

  v23 = v12 - v14;
  v24 = -self->_private->contentInset.top;
  -[PDFHostViewController view](self, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "frame");
  v27 = v26;
  objc_msgSend(WeakRetained, "bounds");
  v29 = CGFloatClamp(v23, v24, v27 - v28);

  objc_msgSend(WeakRetained, "setContentOffset:", PDFPointMake(v22, v29));
  v30 = objc_loadWeakRetained((id *)&self->_private->hostViewControllerDelegate);
  if (v30 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "bounds");
    v32 = v31;
    v34 = v33;
    v36 = v35;
    v38 = v37;
    -[PDFHostViewController view](self, "view");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "convertRect:toView:", v39, v32, v34, v36, v38);
    v41 = v40;
    v43 = v42;
    v45 = v44;
    v47 = v46;

    objc_msgSend(v30, "pdfHostViewController:goToPageIndex:withViewFrustum:", self, a3, v41, v43, v45, v47);
  }

}

- (void)didCopyString:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x24BDF6C40];
  v4 = a3;
  objc_msgSend(v3, "generalPasteboard");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setString:", v4);

}

- (void)didCopyData:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x24BDF6C40];
  v4 = a3;
  objc_msgSend(v3, "generalPasteboard");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forPasteboardType:", v4, CFSTR("Apple Web Archive pasteboard type"));

}

- (void)_appendPasswordUI
{
  PDFPasswordViewController *passwordViewController;
  PDFPasswordViewController *v4;
  PDFHostViewControllerPrivate *v5;
  PDFPasswordViewController *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  id v10;

  passwordViewController = self->_private->passwordViewController;
  if (!passwordViewController)
  {
    v4 = -[PDFPasswordViewController initWithDelegate:]([PDFPasswordViewController alloc], "initWithDelegate:", self);
    v5 = self->_private;
    v6 = v5->passwordViewController;
    v5->passwordViewController = v4;

    passwordViewController = self->_private->passwordViewController;
  }
  -[PDFPasswordViewController view](passwordViewController, "view");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[PDFHostViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v10);

  objc_msgSend(v10, "setAutoresizingMask:", 18);
  -[PDFHostViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  objc_msgSend(v10, "setFrame:");

  -[PDFPasswordViewController clearPasswordField](self->_private->passwordViewController, "clearPasswordField");
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->hostViewControllerDelegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "pdfHostViewControllerDocumentDidRequestPassword:", self);

}

- (BOOL)userDidEnterPassword:(id)a3 forPasswordViewController:(id)a4
{
  id v6;
  void *v7;
  PDFExtensionProtocol *extensionProxy;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = v6;
  if (v6 && !self->_private->isUnlocked && objc_msgSend(v6, "length"))
  {
    objc_storeStrong((id *)&self->_private->password, a3);
    extensionProxy = self->_private->extensionProxy;
    v11[0] = CFSTR("function");
    v11[1] = CFSTR("password");
    v12[0] = CFSTR("unlockWithPassword");
    v12[1] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFExtensionProtocol hostToExtension:](extensionProxy, "hostToExtension:", v9);

  }
  return 1;
}

- (void)updateDocumentIsLocked:(BOOL)a3
{
  PDFHostViewControllerPrivate *v4;
  PDFPasswordViewController *passwordViewController;
  void *v6;
  id WeakRetained;
  void *v8;
  char v9;
  void *v10;

  self->_private->isUnlocked = !a3;
  v4 = self->_private;
  passwordViewController = v4->passwordViewController;
  if (!a3)
  {
    if (passwordViewController)
    {
      -[PDFPasswordViewController view](passwordViewController, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeFromSuperview");

      v4 = self->_private;
    }
    WeakRetained = objc_loadWeakRetained((id *)&v4->hostViewControllerDelegate);
    v8 = WeakRetained;
    if (WeakRetained)
    {
      v10 = WeakRetained;
      v9 = objc_opt_respondsToSelector();
      v8 = v10;
      if ((v9 & 1) != 0)
      {
        objc_msgSend(v10, "pdfHostViewController:documentDidUnlockWithPassword:", self, self->_private->password);
        v8 = v10;
      }
    }

  }
  else
  {
    -[PDFPasswordViewController presentInvalidPasswordAlertWithParentViewController:](passwordViewController, "presentInvalidPasswordAlertWithParentViewController:", self);
  }
}

- (void)didLongPressURL:(id)a3 atLocation:(CGPoint)a4 withAnnotationRect:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  double v9;
  double v10;
  id WeakRetained;
  void *v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v9 = a4.y;
  v10 = a4.x;
  v19 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->hostViewControllerDelegate);
  if (WeakRetained)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "pdfHostViewController:didLongPressURL:atLocation:withAnnotationRect:", self, v19, v10, v9, x, y, width, height);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[PDFHostViewController view](self, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_loadWeakRetained((id *)&self->_private->hostScrollView);
      objc_msgSend(v13, "convertPoint:toView:", v14, v10, v9);
      v16 = v15;
      v18 = v17;

      objc_msgSend(WeakRetained, "pdfHostViewController:didLongPressURL:atLocation:", self, v19, v16, v18);
    }
  }

}

- (void)didLongPressPageIndex:(int64_t)a3 atLocation:(CGPoint)a4 withAnnotationRect:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  double v9;
  double v10;
  void *v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id WeakRetained;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v9 = a4.y;
  v10 = a4.x;
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->hostViewControllerDelegate);
  if (WeakRetained)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "pdfHostViewController:didLongPressPageIndex:atLocation:withAnnotationRect:", self, a3, v10, v9, x, y, width, height);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[PDFHostViewController view](self, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_loadWeakRetained((id *)&self->_private->hostScrollView);
      objc_msgSend(v13, "convertPoint:toView:", v14, v10, v9);
      v16 = v15;
      v18 = v17;

      objc_msgSend(WeakRetained, "pdfHostViewController:didLongPressPageIndex:atLocation:", self, a3, v16, v18);
    }
  }

}

- (void)_gestureInit
{
  uint64_t v3;
  PDFHostViewControllerPrivate *v4;
  UILongPressGestureRecognizer *longPressGestureRecognizer;
  void *v6;
  PDFPanGestureRecognizer *v7;
  PDFHostViewControllerPrivate *v8;
  PDFPanGestureRecognizer *panGestureRecognizer;
  void *v10;
  uint64_t v11;
  PDFHostViewControllerPrivate *v12;
  UITapGestureRecognizer *tapGestureRecognizer;
  void *v14;
  uint64_t v15;
  PDFHostViewControllerPrivate *v16;
  UITapGestureRecognizer *doubleTapGestureRecognizer;
  void *v18;
  uint64_t v19;
  PDFHostViewControllerPrivate *v20;
  UIPointerInteraction *pointerInteraction;
  void *v22;
  PDFHostViewControllerPrivate *v23;
  id pdfPointerCompletionHandler;

  v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6BA0]), "initWithTarget:action:", self, sel_handleGesture_);
  v4 = self->_private;
  longPressGestureRecognizer = v4->longPressGestureRecognizer;
  v4->longPressGestureRecognizer = (UILongPressGestureRecognizer *)v3;

  -[UILongPressGestureRecognizer setDelegate:](self->_private->longPressGestureRecognizer, "setDelegate:", self);
  -[PDFHostViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addGestureRecognizer:", self->_private->longPressGestureRecognizer);

  v7 = -[PDFPanGestureRecognizer initWithTarget:action:]([PDFPanGestureRecognizer alloc], "initWithTarget:action:", self, sel_handleGesture_);
  v8 = self->_private;
  panGestureRecognizer = v8->panGestureRecognizer;
  v8->panGestureRecognizer = v7;

  -[PDFPanGestureRecognizer setDelegate:](self->_private->panGestureRecognizer, "setDelegate:", self);
  -[PDFPanGestureRecognizer _setHysteresis:](self->_private->panGestureRecognizer, "_setHysteresis:", 8.0);
  -[PDFHostViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addGestureRecognizer:", self->_private->panGestureRecognizer);

  v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", self, sel_handleGesture_);
  v12 = self->_private;
  tapGestureRecognizer = v12->tapGestureRecognizer;
  v12->tapGestureRecognizer = (UITapGestureRecognizer *)v11;

  -[UITapGestureRecognizer setNumberOfTapsRequired:](self->_private->tapGestureRecognizer, "setNumberOfTapsRequired:", 1);
  -[UITapGestureRecognizer setDelegate:](self->_private->tapGestureRecognizer, "setDelegate:", self);
  -[PDFHostViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addGestureRecognizer:", self->_private->tapGestureRecognizer);

  v15 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", self, sel_handleGesture_);
  v16 = self->_private;
  doubleTapGestureRecognizer = v16->doubleTapGestureRecognizer;
  v16->doubleTapGestureRecognizer = (UITapGestureRecognizer *)v15;

  -[UITapGestureRecognizer setNumberOfTapsRequired:](self->_private->doubleTapGestureRecognizer, "setNumberOfTapsRequired:", 2);
  -[UITapGestureRecognizer setDelegate:](self->_private->doubleTapGestureRecognizer, "setDelegate:", self);
  -[PDFHostViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addGestureRecognizer:", self->_private->doubleTapGestureRecognizer);

  -[UITapGestureRecognizer requireGestureRecognizerToFail:](self->_private->tapGestureRecognizer, "requireGestureRecognizerToFail:", self->_private->longPressGestureRecognizer);
  -[PDFPanGestureRecognizer requireGestureRecognizerToFail:](self->_private->panGestureRecognizer, "requireGestureRecognizerToFail:", self->_private->longPressGestureRecognizer);
  -[UITapGestureRecognizer requireGestureRecognizerToFail:](self->_private->tapGestureRecognizer, "requireGestureRecognizerToFail:", self->_private->doubleTapGestureRecognizer);
  self->_private->recentGestureIsIndirectTouch = 0;
  v19 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6C78]), "initWithDelegate:", self);
  v20 = self->_private;
  pointerInteraction = v20->pointerInteraction;
  v20->pointerInteraction = (UIPointerInteraction *)v19;

  -[PDFHostViewController view](self, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addInteraction:", self->_private->pointerInteraction);

  v23 = self->_private;
  pdfPointerCompletionHandler = v23->pdfPointerCompletionHandler;
  v23->pdfPointerCompletionHandler = 0;

}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  self->_private->recentGestureIsIndirectTouch = objc_msgSend(a4, "_isPointerTouch", a3);
  return 1;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  void *v5;
  PDFHostViewControllerPrivate *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  PDFHostViewControllerPrivate *v12;
  char v13;
  id WeakRetained;
  double v15;
  BOOL v16;

  v4 = a3;
  v5 = v4;
  v6 = self->_private;
  if (v6->tapGestureRecognizer == v4)
  {
    if (v6->hasSelection)
      goto LABEL_18;
    -[PDFHostViewController handleGesture:](self, "handleGesture:", v4);
  }
  else if (v6->doubleTapGestureRecognizer == v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&v6->hostScrollView);
    -[PDFHostViewController _hostScrollViewZoomScale](self, "_hostScrollViewZoomScale");
    if (v15 <= self->_private->minScaleFactor)
    {

      goto LABEL_18;
    }
    objc_msgSend(WeakRetained, "setZoomScale:animated:", 1);

  }
  else
  {
    if (v6->longPressGestureRecognizer != v4)
    {
      if (v6->panGestureRecognizer == v4)
      {
        -[PDFHostViewController view](self, "view");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "locationOfFirstTouchInView:", v7);
        v9 = v8;
        v11 = v10;

        v12 = self->_private;
        if (v12->hasSelection)
        {
          v13 = !-[PDFHostViewController _isTouchingLollipopAtLocationOfFirstTouch:](self, "_isTouchingLollipopAtLocationOfFirstTouch:", v9, v11);
          v12 = self->_private;
        }
        else
        {
          v13 = 1;
        }
        if (!v12->recentGestureIsIndirectTouch && (v13 & 1) != 0)
          goto LABEL_17;
      }
LABEL_18:
      v16 = 1;
      goto LABEL_19;
    }
    if (!v6->hasSelection)
      goto LABEL_18;
  }
LABEL_17:
  v16 = 0;
LABEL_19:

  return v16;
}

- (void)handleGesture:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  PDFPanGestureRecognizer *panGestureRecognizer;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  PDFExtensionProtocol *extensionProxy;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[6];
  _QWORD v31[6];
  _QWORD v32[2];
  _QWORD v33[4];

  v33[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[PDFHostViewController _typeForGestureRecognizer:](self, "_typeForGestureRecognizer:", v4);
  -[PDFHostViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v6);
  v8 = v7;
  v10 = v9;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v11;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  panGestureRecognizer = self->_private->panGestureRecognizer;
  -[PDFHostViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFPanGestureRecognizer locationOfFirstTouchInView:](panGestureRecognizer, "locationOfFirstTouchInView:", v15);
  v17 = v16;
  v19 = v18;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v20;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v21;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  extensionProxy = self->_private->extensionProxy;
  v31[0] = CFSTR("handleGesture");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v5, CFSTR("function"), CFSTR("gestureType"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v24;
  v30[2] = CFSTR("state");
  v25 = (void *)MEMORY[0x24BDD16E0];
  v26 = objc_msgSend(v4, "state");

  objc_msgSend(v25, "numberWithInteger:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v27;
  v31[3] = v13;
  v30[3] = CFSTR("location");
  v30[4] = CFSTR("locationOfFirstTouch");
  v31[4] = v22;
  v30[5] = CFSTR("isIndirectTouch");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_private->recentGestureIsIndirectTouch);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v31[5] = v28;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 6);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFExtensionProtocol hostToExtension:](extensionProxy, "hostToExtension:", v29);

}

- (unint64_t)_typeForGestureRecognizer:(id)a3
{
  id v4;
  PDFHostViewControllerPrivate *v5;
  unint64_t v6;

  v4 = a3;
  v5 = self->_private;
  if (v5->tapGestureRecognizer == v4)
  {
    v6 = 0;
  }
  else if (v5->doubleTapGestureRecognizer == v4)
  {
    v6 = 1;
  }
  else if (v5->longPressGestureRecognizer == v4)
  {
    v6 = 2;
  }
  else if (v5->panGestureRecognizer == v4)
  {
    v6 = 3;
  }
  else
  {
    v6 = 4;
  }

  return v6;
}

- (BOOL)_isTouchingLollipopAtLocationOfFirstTouch:(CGPoint)a3
{
  PDFHostViewControllerPrivate *v3;
  double y;
  double x;
  id WeakRetained;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  char v13;
  char v14;
  PDFHostViewControllerPrivate *v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  BOOL v26;

  v3 = self->_private;
  if (!v3->hasSelection)
    return 0;
  y = a3.y;
  x = a3.x;
  WeakRetained = objc_loadWeakRetained((id *)&v3->hostScrollView);
  -[PDFHostViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertPoint:toView:", WeakRetained, x, y);
  v10 = v9;
  v12 = v11;

  v13 = 1;
  do
  {
    v14 = v13;
    v15 = self->_private;
    if ((v14 & 1) != 0)
      v16 = 136;
    else
      v16 = 152;
    if ((v14 & 1) != 0)
      v17 = 144;
    else
      v17 = 160;
    v18 = *(double *)((char *)&v15->super.isa + v17);
    v19 = *(double *)((char *)&v15->super.isa + v16);
    -[PDFHostViewController view](self, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "convertPoint:toView:", WeakRetained, v19, v18);
    v22 = v21;
    v24 = v23;

    v25 = sqrt((v12 - v24) * (v12 - v24) + (v10 - v22) * (v10 - v22)) / PDFScreenGetBackingScaleFactor();
    v26 = v25 < 10.0;
    if (v25 < 10.0)
      break;
    v13 = 0;
  }
  while ((v14 & 1) != 0);

  return v26;
}

- (void)_pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5 completion:(id)a6
{
  id v8;
  uint64_t v9;
  PDFHostViewControllerPrivate *v10;
  id pdfPointerCompletionHandler;
  double v12;
  double v13;
  PDFExtensionProtocol *extensionProxy;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  if (self->_private->pdfPointerCompletionHandler != a6)
  {
    v9 = MEMORY[0x20BD1AEB4](a6);
    v10 = self->_private;
    pdfPointerCompletionHandler = v10->pdfPointerCompletionHandler;
    v10->pdfPointerCompletionHandler = (id)v9;

  }
  objc_msgSend(v8, "location");
  v13 = v12;
  extensionProxy = self->_private->extensionProxy;
  v20[0] = CFSTR("function");
  v20[1] = CFSTR("location");
  v21[0] = CFSTR("pointerRegionForLocation");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v15;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v17;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFExtensionProtocol hostToExtension:](extensionProxy, "hostToExtension:", v18);

}

- (void)completePointerInteractionRegionForRequest:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  id v18;

  v4 = a3;
  if (self->_private->pdfPointerCompletionHandler)
  {
    v18 = v4;
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("PDFPointerRegionText"));

    if (v6)
    {
      v7 = (void *)MEMORY[0x24BDF6C88];
      objc_msgSend(v18, "rect");
      v9 = v8;
      v11 = v10;
      v13 = v12;
      v15 = v14;
      objc_msgSend(v18, "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "regionWithRect:identifier:", v16, v9, v11, v13, v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v17 = 0;
    }
    (*((void (**)(void))self->_private->pdfPointerCompletionHandler + 2))();

    v4 = v18;
  }

}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  int v13;
  double v14;
  void *v15;

  v5 = a4;
  -[PDFHostViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rect");
  objc_msgSend(v6, "convertRect:toView:", 0);
  v8 = v7;

  objc_msgSend(v5, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("PDFPointerRegionLink"));

  v11 = 0;
  if ((v10 & 1) == 0)
  {
    objc_msgSend(v5, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("PDFPointerRegionText"));

    if (v13)
    {
      objc_msgSend(MEMORY[0x24BDF6C90], "beamWithPreferredLength:axis:", 2, v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
  }
  objc_msgSend(MEMORY[0x24BDF6ED0], "_maximumBeamSnappingLength");
  objc_msgSend(MEMORY[0x24BDF6C98], "styleWithShape:constrainedAxes:", v11, 2 * (v8 <= v14));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)beginPDFViewRotation
{
  PDFHostViewControllerPrivate *v3;
  CGFloat v4;
  double v5;
  double v6;
  PDFHostViewControllerPrivate *v7;
  CGFloat v8;
  CGFloat v9;
  double v10;
  id WeakRetained;

  self->_private->pdfViewIsRotating = 1;
  v3 = self->_private;
  v3->documentViewCenter.x = PDFRectGetCenterPoint(v3->insetBoundsInDocument.origin.x, v3->insetBoundsInDocument.origin.y, v3->insetBoundsInDocument.size.width);
  v3->documentViewCenter.y = v4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->hostScrollView);
  -[PDFHostViewController _documentViewSize](self, "_documentViewSize");
  v6 = v5;
  v7 = self->_private;
  v8 = v7->pdfSafeAreaInsets.left + v7->pdfSafeAreaInsets.right;
  v9 = v7->contentInset.left + v7->contentInset.right;
  objc_msgSend(WeakRetained, "zoomScale");
  self->_private->horizontalScaleFactor = v6 * v10 / (self->_private->scrollViewFrame.size.width - v8 - v9);

}

- (void)endPDFViewRotation
{
  -[PDFHostViewController _endPDFViewRotationAnimated:withUpdate:](self, "_endPDFViewRotationAnimated:withUpdate:", 0, 1);
}

- (void)_endPDFViewRotationAnimated:(BOOL)a3 withUpdate:(BOOL)a4
{
  _BOOL8 v5;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double horizontalScaleFactor;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  PDFHostViewControllerPrivate *v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  id WeakRetained;

  v5 = a3;
  -[PDFHostViewController updateDocumentViewSize](self, "updateDocumentViewSize");
  -[PDFHostViewController updateAutoScaleFactor](self, "updateAutoScaleFactor");
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->hostScrollView);
  -[PDFHostViewController _documentViewSize](self, "_documentViewSize");
  v8 = v7;
  v10 = v9;
  -[PDFHostViewController _pdfViewInsets](self, "_pdfViewInsets");
  v13 = v11 + v12;
  horizontalScaleFactor = self->_private->horizontalScaleFactor;
  objc_msgSend(WeakRetained, "bounds");
  v16 = CGFloatClamp(horizontalScaleFactor * (v15 - v13) / v8, self->_private->minScaleFactor, self->_private->maxScaleFactor);
  objc_msgSend(WeakRetained, "setZoomScale:animated:", v5);
  -[PDFHostViewController _insetBoundsInDocument](self, "_insetBoundsInDocument");
  v18 = v17;
  v20 = v19;
  objc_msgSend(WeakRetained, "contentInset");
  v25 = PDFRectScale(v21, v22, v23, v24, 1.0 / v16);
  v27 = v26;
  v30 = CGFloatClamp(self->_private->documentViewCenter.x - v18 * 0.5 - v28, -v28, v8 - v18 - v28 - v29);
  v31 = CGFloatClamp(self->_private->documentViewCenter.y - v20 * 0.5 - v25, -v25, v10 - v20 - v25 - v27);
  objc_msgSend(WeakRetained, "setContentOffset:animated:", v5, PDFPointMake(v16 * v30, v16 * v31));
  v32 = self->_private;
  objc_msgSend(WeakRetained, "frame");
  v32->scrollViewFrame.origin.x = v33;
  v32->scrollViewFrame.origin.y = v34;
  v32->scrollViewFrame.size.width = v35;
  v32->scrollViewFrame.size.height = v36;
  self->_private->pdfViewIsRotating = 0;
  self->_private->pdfViewNeedsUpdate = a4;
  -[PDFHostViewController updatePDFViewLayout](self, "updatePDFViewLayout");

}

- (void)endPDFViewRotationWithContentInset:(UIEdgeInsets)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double horizontalScaleFactor;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  PDFHostViewControllerPrivate *v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  id WeakRetained;

  self->_private->contentInset = a3;
  -[PDFHostViewController updateDocumentViewSize](self, "updateDocumentViewSize");
  -[PDFHostViewController updateAutoScaleFactor](self, "updateAutoScaleFactor");
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->hostScrollView);
  -[PDFHostViewController _documentViewSize](self, "_documentViewSize");
  v5 = v4;
  v7 = v6;
  -[PDFHostViewController _pdfViewInsets](self, "_pdfViewInsets");
  v10 = v8 + v9;
  horizontalScaleFactor = self->_private->horizontalScaleFactor;
  objc_msgSend(WeakRetained, "bounds");
  v13 = CGFloatClamp(horizontalScaleFactor * (v12 - v10) / v5, self->_private->minScaleFactor, self->_private->maxScaleFactor);
  objc_msgSend(WeakRetained, "setZoomScale:");
  -[PDFHostViewController _insetBoundsInDocument](self, "_insetBoundsInDocument");
  v15 = v14;
  v17 = v16;
  v18 = PDFRectScale(self->_private->contentInset.top, self->_private->contentInset.left, self->_private->contentInset.bottom, self->_private->contentInset.right, 1.0 / v13);
  v20 = v19;
  v23 = CGFloatClamp(self->_private->documentViewCenter.x - v15 * 0.5 - v21, -v21, v5 - v15 - v21 - v22);
  v24 = CGFloatClamp(self->_private->documentViewCenter.y - v17 * 0.5 - v18, -v18, v7 - v17 - v18 - v20);
  objc_msgSend(WeakRetained, "setContentOffset:", PDFPointMake(v13 * v23, v13 * v24));
  v25 = self->_private;
  objc_msgSend(WeakRetained, "frame");
  v25->scrollViewFrame.origin.x = v26;
  v25->scrollViewFrame.origin.y = v27;
  v25->scrollViewFrame.size.width = v28;
  v25->scrollViewFrame.size.height = v29;
  self->_private->pdfViewIsRotating = 0;
  -[PDFHostViewController updatePDFViewLayout](self, "updatePDFViewLayout");

}

- (void)killExtensionProcess
{
  -[NSExtension _kill:](self->_private->extension, "_kill:", 9);
}

+ (id)loadExtension:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  _QWORD block[4];
  id v9;

  v3 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__PDFHostViewController_loadExtension___block_invoke;
  block[3] = &unk_24C25C350;
  v9 = v3;
  v4 = loadExtension__onceToken;
  v5 = v3;
  if (v4 != -1)
    dispatch_once(&loadExtension__onceToken, block);
  v6 = (id)loadExtension__extension;

  return v6;
}

void __39__PDFHostViewController_loadExtension___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  BOOL v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 32);
  v7 = 0;
  objc_msgSend(MEMORY[0x24BDD1550], "extensionWithIdentifier:error:", v2, &v7);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v7;
  v5 = (void *)loadExtension__extension;
  loadExtension__extension = v3;

  if (loadExtension__extension)
    v6 = v4 == 0;
  else
    v6 = 0;
  if (!v6)
    NSLog(CFSTR("PDFHostViewController failed to load extension \"%@\". error: %@"), *(_QWORD *)(a1 + 32), v4);

}

+ (id)serviceViewControllerInterface
{
  return +[XPCExtensionInterface extensionInterface](XPCExtensionInterface, "extensionInterface");
}

+ (id)exportedInterface
{
  return +[XPCExtensionInterface hostInterface](XPCExtensionInterface, "hostInterface");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_private, 0);
}

@end

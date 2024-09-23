@implementation LinkPreviewViewController

- (LinkPreviewViewController)initWithTabDocument:(id)a3
{
  id v4;
  LinkPreviewViewController *v5;
  LinkPreviewViewController *v6;
  LinkPreviewViewController *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LinkPreviewViewController;
  v5 = -[LinkPreviewViewController init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_previewTabDocument, v4);
    objc_msgSend(v4, "setLinkPreviewViewController:", v6);
    objc_msgSend(v4, "beginSuppressingProgressAnimation");
    v7 = v6;
  }

  return v6;
}

- (void)loadView
{
  id v3;
  _SFBrowserView *v4;
  _SFBrowserView *browserView;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _SFBrowserView *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id WeakRetained;

  v3 = objc_alloc(MEMORY[0x1E0CD5670]);
  v4 = (_SFBrowserView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  browserView = self->_browserView;
  self->_browserView = v4;

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  -[_SFBrowserView setBackgroundColor:](self->_browserView, "setBackgroundColor:");

  -[_SFBrowserView setContentReadyForDisplay](self->_browserView, "setContentReadyForDisplay");
  -[_SFBrowserView setAutoresizingMask:](self->_browserView, "setAutoresizingMask:", 18);
  -[LinkPreviewViewController setView:](self, "setView:", self->_browserView);
  WeakRetained = objc_loadWeakRetained((id *)&self->_previewTabDocument);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD56F8]), "initWithMinimumPreviewUI:", 0);
  -[_SFBrowserView setPreviewHeader:](self->_browserView, "setPreviewHeader:", v6);

  -[_SFBrowserView previewHeader](self->_browserView, "previewHeader");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "progressView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "navigationBarItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fluidProgressController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "registerObserver:", v8);

  objc_msgSend(WeakRetained, "navigationBarItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fluidProgressStateSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "progressState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setProgressToCurrentPositionForState:", v13);

  v14 = self->_browserView;
  objc_msgSend(WeakRetained, "webView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFBrowserView addWebView:](v14, "addWebView:", v15);

  -[_SFBrowserView currentWebView](self->_browserView, "currentWebView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAutoresizingMask:", 18);

  -[_SFBrowserView previewHeader](self->_browserView, "previewHeader");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setAccessibilityIdentifier:", CFSTR("LinkPreview"));

}

- (_SFLinkPreviewHeader)previewHeader
{
  void *v2;
  void *v3;

  -[LinkPreviewViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "previewHeader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (_SFLinkPreviewHeader *)v3;
}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LinkPreviewViewController;
  -[LinkPreviewViewController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  -[LinkPreviewViewController preferredContentSize](self, "preferredContentSize");
  -[_SFBrowserView setUnscaledWebViewWidth:](self->_browserView, "setUnscaledWebViewWidth:");
}

- (void)viewDidAppear:(BOOL)a3
{
  dispatch_time_t v4;
  _QWORD block[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LinkPreviewViewController;
  -[LinkPreviewViewController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  v4 = dispatch_time(0, 250000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__LinkPreviewViewController_viewDidAppear___block_invoke;
  block[3] = &unk_1E9CF31B0;
  block[4] = self;
  dispatch_after(v4, MEMORY[0x1E0C80D38], block);
}

void __43__LinkPreviewViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 976));
  objc_msgSend(WeakRetained, "endSuppressingProgressAnimationAnimated:", 0);

}

- (void)updatePreviewLoadingUIWithURLString:(id)a3
{
  -[_SFBrowserView updatePreviewHeaderWithURLString:](self->_browserView, "updatePreviewHeaderWithURLString:", a3);
}

- (void)willCommitPreviewedWebView
{
  void *v3;
  void *v4;
  id WeakRetained;
  __int128 v6;

  -[_SFBrowserView currentWebView](self->_browserView, "currentWebView", *MEMORY[0x1E0C9BAA8], *(_QWORD *)(MEMORY[0x1E0C9BAA8] + 8), *(_QWORD *)(MEMORY[0x1E0C9BAA8] + 16), *(_QWORD *)(MEMORY[0x1E0C9BAA8] + 24), *(_QWORD *)(MEMORY[0x1E0C9BAA8] + 32), *(_QWORD *)(MEMORY[0x1E0C9BAA8] + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTransform:", &v6);

  -[_SFBrowserView previewHeader](self->_browserView, "previewHeader");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);

  -[_SFBrowserView addWebView:](self->_browserView, "addWebView:", 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_previewTabDocument);
  objc_msgSend(WeakRetained, "setLinkPreviewViewController:", 0);

}

- (void)displayHostedScreenTimeView
{
  LinkPreviewViewController *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  -[SFScreenTimeOverlayViewController parentViewController](self->_screenTimeOverlayViewController, "parentViewController");
  v3 = (LinkPreviewViewController *)objc_claimAutoreleasedReturnValue();

  if (v3 != self)
    -[LinkPreviewViewController addChildViewController:](self, "addChildViewController:", self->_screenTimeOverlayViewController);
  -[_SFBrowserView frame](self->_browserView, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[SFScreenTimeOverlayViewController view](self->_screenTimeOverlayViewController, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  -[LinkPreviewViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFScreenTimeOverlayViewController view](self->_screenTimeOverlayViewController, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFBrowserView previewHeader](self->_browserView, "previewHeader");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "insertSubview:belowSubview:", v14, v15);

  if (v3 != self)
    -[SFScreenTimeOverlayViewController didMoveToParentViewController:](self->_screenTimeOverlayViewController, "didMoveToParentViewController:", self);
}

- (id)currentFluidProgressStateSource
{
  return objc_loadWeakRetained((id *)&self->_previewTabDocument);
}

- (SFScreenTimeOverlayViewController)screenTimeOverlayViewController
{
  return self->_screenTimeOverlayViewController;
}

- (void)setScreenTimeOverlayViewController:(id)a3
{
  objc_storeStrong((id *)&self->_screenTimeOverlayViewController, a3);
}

- (TabDocument)previewTabDocument
{
  return (TabDocument *)objc_loadWeakRetained((id *)&self->_previewTabDocument);
}

- (_SFBrowserView)browserView
{
  return self->_browserView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_browserView, 0);
  objc_destroyWeak((id *)&self->_previewTabDocument);
  objc_storeStrong((id *)&self->_screenTimeOverlayViewController, 0);
}

@end

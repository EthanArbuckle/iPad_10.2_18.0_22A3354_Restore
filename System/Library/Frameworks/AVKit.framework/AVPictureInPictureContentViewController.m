@implementation AVPictureInPictureContentViewController

- (AVPictureInPictureContentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  AVPictureInPictureContentViewController *v4;
  AVPictureInPictureContentViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVPictureInPictureContentViewController;
  v4 = -[AVPictureInPictureContentViewController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
    -[AVPictureInPictureContentViewController setPreferredContentSize:](v4, "setPreferredContentSize:", 100.0, 100.0);
  return v5;
}

- (AVPlayerController)playerController
{
  return self->_playerController;
}

- (void)setPlayerController:(id)a3
{
  AVPlayerController *v5;
  AVPlayerController *v6;

  v5 = (AVPlayerController *)a3;
  if (self->_playerController != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_playerController, a3);
    v5 = v6;
  }

}

- (void)setContentSource:(id)a3
{
  AVPictureInPictureControllerContentSource **p_contentSource;
  id WeakRetained;
  void *v6;
  id obj;

  obj = a3;
  p_contentSource = &self->_contentSource;
  WeakRetained = objc_loadWeakRetained((id *)p_contentSource);

  v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_contentSource, obj);
    v6 = obj;
  }

}

- (void)startObservingSourceView
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __67__AVPictureInPictureContentViewController_startObservingSourceView__block_invoke;
  v2[3] = &unk_1E5BB4A40;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x1E0C80D38], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (void)stopObservingSourceView
{
  void *v3;

  -[AVPictureInPictureContentViewController observeSourceViewTimer](self, "observeSourceViewTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[AVPictureInPictureContentViewController setObserveSourceViewTimer:](self, "setObserveSourceViewTimer:", 0);
}

- (CGRect)avkit_videoRectInWindow
{
  void *v3;
  char v4;
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
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGRect result;

  -[AVPictureInPictureContentViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[AVPictureInPictureContentViewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pictureInPictureContentViewControllerVideoFrameInWindow:", self);
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
  }
  else
  {
    -[AVPictureInPictureContentViewController contentSource](self, "contentSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "activeSourceView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "window");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPictureInPictureContentViewController contentSource](self, "contentSource");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "activeSourceView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bounds");
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;
    -[AVPictureInPictureContentViewController contentSource](self, "contentSource");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "activeSourceView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "convertRect:fromView:", v27, v19, v21, v23, v25);
    v7 = v28;
    v9 = v29;
    v11 = v30;
    v13 = v31;

  }
  v32 = v7;
  v33 = v9;
  v34 = v11;
  v35 = v13;
  result.size.height = v35;
  result.size.width = v34;
  result.origin.y = v33;
  result.origin.x = v32;
  return result;
}

- (BOOL)avkit_isVisible
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  id v7;
  int v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  -[AVPictureInPictureContentViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[AVPictureInPictureContentViewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPictureInPictureContentViewController contentSource](self, "contentSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "activeSourceView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    LOBYTE(v8) = objc_msgSend(v5, "pictureInPictureContentViewController:isViewVisible:", self, v7);
  }
  else
  {
    -[AVPictureInPictureContentViewController contentSource](self, "contentSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "activeSourceView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "window");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_msgSend(v7, "isHiddenOrHasHiddenAncestor") & 1) == 0)
    {
      objc_msgSend(v7, "bounds");
      objc_msgSend(v9, "convertRect:fromView:", v7);
      v11 = v10;
      v13 = v12;
      v15 = v14;
      v17 = v16;
      objc_msgSend(v9, "bounds");
      v25.origin.x = v18;
      v25.origin.y = v19;
      v25.size.width = v20;
      v25.size.height = v21;
      v23.origin.x = v11;
      v23.origin.y = v13;
      v23.size.width = v15;
      v23.size.height = v17;
      v24 = CGRectIntersection(v23, v25);
      v8 = !CGRectIsEmpty(v24);
    }
    else
    {
      LOBYTE(v8) = 0;
    }

    v6 = v7;
  }

  return v8;
}

- (UIWindow)avkit_window
{
  void *v2;
  void *v3;
  void *v4;

  -[AVPictureInPictureContentViewController contentSource](self, "contentSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeSourceView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIWindow *)v4;
}

- (id)avkit_pictureInPictureViewController
{
  AVPictureInPictureViewController *v3;

  -[AVPictureInPictureContentViewController pictureInPictureViewController](self, "pictureInPictureViewController");
  v3 = (AVPictureInPictureViewController *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = objc_alloc_init(AVPictureInPictureViewController);
    -[AVPictureInPictureContentViewController setPictureInPictureViewController:](self, "setPictureInPictureViewController:", v3);
  }
  return v3;
}

- (void)avkit_startRoutingVideoToPictureInPictureViewController:(id)a3
{
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
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  -[AVPictureInPictureContentViewController parentViewController](self, "parentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[AVPictureInPictureContentViewController _removeFromParent](self, "_removeFromParent");
  objc_msgSend(v18, "addChildViewController:", self);
  objc_msgSend(v18, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[AVPictureInPictureContentViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

  -[AVPictureInPictureContentViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAutoresizingMask:", 18);

  objc_msgSend(v18, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPictureInPictureContentViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addSubview:", v17);

  -[AVPictureInPictureContentViewController didMoveToParentViewController:](self, "didMoveToParentViewController:", v18);
}

- (void)avkit_stopRoutingVideoToPictureInPictureViewController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AVPictureInPictureContentViewController parentViewController](self, "parentViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
    -[AVPictureInPictureContentViewController _removeFromParent](self, "_removeFromParent");
}

- (int64_t)avkit_contentSourceType
{
  return 3;
}

- (BOOL)avkit_wantsManagedSecondScreenPlayback
{
  return 0;
}

- (void)_observeSourceView
{
  _BOOL8 v3;

  v3 = -[AVPictureInPictureContentViewController avkit_isVisible](self, "avkit_isVisible");
  -[AVPictureInPictureContentViewController avkit_videoRectInWindow](self, "avkit_videoRectInWindow");
  -[AVPictureInPictureContentViewController _setLastKnownIsVisible:videoRectInWindow:](self, "_setLastKnownIsVisible:videoRectInWindow:", v3);
}

- (void)_setLastKnownIsVisible:(BOOL)a3 videoRectInWindow:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  _BOOL8 v8;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  BOOL v14;
  id v15;
  CGRect v16;
  CGRect v17;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3;
  if (-[AVPictureInPictureContentViewController lastKnownIsVisible](self, "lastKnownIsVisible") == a3)
  {
    -[AVPictureInPictureContentViewController lastKnownVideoRectInWindow](self, "lastKnownVideoRectInWindow");
    v17.origin.x = v10;
    v17.origin.y = v11;
    v17.size.width = v12;
    v17.size.height = v13;
    v16.origin.x = x;
    v16.origin.y = y;
    v16.size.width = width;
    v16.size.height = height;
    v14 = CGRectEqualToRect(v16, v17);
    -[AVPictureInPictureContentViewController setLastKnownIsVisible:](self, "setLastKnownIsVisible:", v8);
    -[AVPictureInPictureContentViewController setLastKnownVideoRectInWindow:](self, "setLastKnownVideoRectInWindow:", x, y, width, height);
    if (v14)
      return;
  }
  else
  {
    -[AVPictureInPictureContentViewController setLastKnownIsVisible:](self, "setLastKnownIsVisible:", v8);
    -[AVPictureInPictureContentViewController setLastKnownVideoRectInWindow:](self, "setLastKnownVideoRectInWindow:", x, y, width, height);
  }
  -[AVPictureInPictureContentViewController pictureInPictureController](self, "pictureInPictureController");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "contentSourceVideoRectInWindowChanged");

}

- (void)_removeFromParent
{
  void *v3;

  -[AVPictureInPictureContentViewController willMoveToParentViewController:](self, "willMoveToParentViewController:", 0);
  -[AVPictureInPictureContentViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[AVPictureInPictureContentViewController removeFromParentViewController](self, "removeFromParentViewController");
}

- (AVPictureInPictureContentViewControllerDelegate)delegate
{
  return (AVPictureInPictureContentViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AVPictureInPictureViewController)pictureInPictureViewController
{
  return (AVPictureInPictureViewController *)objc_loadWeakRetained((id *)&self->_pictureInPictureViewController);
}

- (void)setPictureInPictureViewController:(id)a3
{
  objc_storeWeak((id *)&self->_pictureInPictureViewController, a3);
}

- (NSTimer)observeSourceViewTimer
{
  return self->_observeSourceViewTimer;
}

- (void)setObserveSourceViewTimer:(id)a3
{
  objc_storeStrong((id *)&self->_observeSourceViewTimer, a3);
}

- (CGRect)lastKnownVideoRectInWindow
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_lastKnownVideoRectInWindow.origin.x;
  y = self->_lastKnownVideoRectInWindow.origin.y;
  width = self->_lastKnownVideoRectInWindow.size.width;
  height = self->_lastKnownVideoRectInWindow.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setLastKnownVideoRectInWindow:(CGRect)a3
{
  self->_lastKnownVideoRectInWindow = a3;
}

- (BOOL)lastKnownIsVisible
{
  return self->_lastKnownIsVisible;
}

- (void)setLastKnownIsVisible:(BOOL)a3
{
  self->_lastKnownIsVisible = a3;
}

- (AVPictureInPictureController)pictureInPictureController
{
  return (AVPictureInPictureController *)objc_loadWeakRetained((id *)&self->_pictureInPictureController);
}

- (void)setPictureInPictureController:(id)a3
{
  objc_storeWeak((id *)&self->_pictureInPictureController, a3);
}

- (AVPictureInPictureControllerContentSource)contentSource
{
  return (AVPictureInPictureControllerContentSource *)objc_loadWeakRetained((id *)&self->_contentSource);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_contentSource);
  objc_destroyWeak((id *)&self->_pictureInPictureController);
  objc_storeStrong((id *)&self->_observeSourceViewTimer, 0);
  objc_destroyWeak((id *)&self->_pictureInPictureViewController);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_playerController, 0);
}

void __67__AVPictureInPictureContentViewController_startObservingSourceView__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_observeSourceView");

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "observeSourceViewTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = objc_loadWeakRetained(v1);
    v6 = (void *)MEMORY[0x1E0C99E88];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __67__AVPictureInPictureContentViewController_startObservingSourceView__block_invoke_2;
    v8[3] = &unk_1E5BB49A8;
    objc_copyWeak(&v9, v1);
    objc_msgSend(v6, "scheduledTimerWithTimeInterval:repeats:block:", 1, v8, 2.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObserveSourceViewTimer:", v7);

    objc_destroyWeak(&v9);
  }
}

void __67__AVPictureInPictureContentViewController_startObservingSourceView__block_invoke_2(id *a1, void *a2)
{
  id WeakRetained;
  id v4;
  id v5;

  v5 = a2;
  a1 += 4;
  WeakRetained = objc_loadWeakRetained(a1);
  objc_msgSend(WeakRetained, "_observeSourceView");

  v4 = objc_loadWeakRetained(a1);
  if (!v4)
    objc_msgSend(v5, "invalidate");

}

@end

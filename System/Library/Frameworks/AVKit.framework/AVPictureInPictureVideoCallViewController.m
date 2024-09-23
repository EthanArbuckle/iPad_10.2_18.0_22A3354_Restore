@implementation AVPictureInPictureVideoCallViewController

- (AVPictureInPictureVideoCallViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  AVPictureInPictureVideoCallViewController *v4;
  AVPictureInPictureVideoCallViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVPictureInPictureVideoCallViewController;
  v4 = -[AVPictureInPictureVideoCallViewController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
    -[AVPictureInPictureVideoCallViewController setPreferredContentSize:](v4, "setPreferredContentSize:", 100.0, 100.0);
  return v5;
}

- (void)startObservingSourceView
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __69__AVPictureInPictureVideoCallViewController_startObservingSourceView__block_invoke;
  v2[3] = &unk_1E5BB4A40;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x1E0C80D38], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (void)stopObservingSourceView
{
  void *v3;
  id v4;

  -[AVPictureInPictureVideoCallViewController observeSourceViewTimer](self, "observeSourceViewTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[AVPictureInPictureVideoCallViewController setObserveSourceViewTimer:](self, "setObserveSourceViewTimer:", 0);
  -[AVPictureInPictureVideoCallViewController videoCallPlayerController](self, "videoCallPlayerController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPictureInPicturePossible:", 0);

}

- (CGRect)avkit_videoRectInWindow
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
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
  CGRect result;

  -[AVPictureInPictureVideoCallViewController contentSource](self, "contentSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeVideoCallSourceView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPictureInPictureVideoCallViewController contentSource](self, "contentSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activeVideoCallSourceView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[AVPictureInPictureVideoCallViewController contentSource](self, "contentSource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "activeVideoCallSourceView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convertRect:fromView:", v17, v9, v11, v13, v15);
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;

  v26 = v19;
  v27 = v21;
  v28 = v23;
  v29 = v25;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (void)setPreferredContentSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  objc_super v7;

  height = a3.height;
  width = a3.width;
  v7.receiver = self;
  v7.super_class = (Class)AVPictureInPictureVideoCallViewController;
  -[AVPictureInPictureVideoCallViewController setPreferredContentSize:](&v7, sel_setPreferredContentSize_);
  -[AVPictureInPictureVideoCallViewController videoCallPlayerController](self, "videoCallPlayerController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setContentDimensions:", width, height);

}

- (BOOL)avkit_isVisible
{
  void *v2;
  void *v3;
  char v4;

  -[AVPictureInPictureVideoCallViewController contentSource](self, "contentSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeVideoCallSourceView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "avkit_isInAWindowAndVisible");

  return v4;
}

- (UIWindow)avkit_window
{
  void *v2;
  void *v3;
  void *v4;

  -[AVPictureInPictureVideoCallViewController contentSource](self, "contentSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeVideoCallSourceView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIWindow *)v4;
}

- (AVVideoCallPlayerController)videoCallPlayerController
{
  AVVideoCallPlayerController **p_videoCallPlayerController;
  AVVideoCallPlayerController *v4;
  void *v5;

  p_videoCallPlayerController = &self->_videoCallPlayerController;
  v4 = self->_videoCallPlayerController;
  if (!v4)
  {
    v4 = objc_alloc_init(AVVideoCallPlayerController);
    -[AVPictureInPictureVideoCallViewController contentSource](self, "contentSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVVideoCallPlayerController setContentSource:](v4, "setContentSource:", v5);

    -[AVPictureInPictureVideoCallViewController preferredContentSize](self, "preferredContentSize");
    -[AVVideoCallPlayerController setContentDimensions:](v4, "setContentDimensions:");
    -[AVVideoCallPlayerController setPictureInPicturePossible:](v4, "setPictureInPicturePossible:", 1);
    objc_storeStrong((id *)p_videoCallPlayerController, v4);
  }
  return v4;
}

- (id)avkit_pictureInPictureViewController
{
  AVPictureInPictureViewController *v3;

  -[AVPictureInPictureVideoCallViewController pictureInPictureViewController](self, "pictureInPictureViewController");
  v3 = (AVPictureInPictureViewController *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = objc_alloc_init(AVPictureInPictureViewController);
    -[AVPictureInPictureVideoCallViewController setPictureInPictureViewController:](self, "setPictureInPictureViewController:", v3);
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
  -[AVPictureInPictureVideoCallViewController parentViewController](self, "parentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[AVPictureInPictureVideoCallViewController _removeFromParent](self, "_removeFromParent");
  objc_msgSend(v18, "addChildViewController:", self);
  objc_msgSend(v18, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[AVPictureInPictureVideoCallViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

  -[AVPictureInPictureVideoCallViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAutoresizingMask:", 18);

  objc_msgSend(v18, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPictureInPictureVideoCallViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addSubview:", v17);

  -[AVPictureInPictureVideoCallViewController didMoveToParentViewController:](self, "didMoveToParentViewController:", v18);
}

- (void)avkit_stopRoutingVideoToPictureInPictureViewController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AVPictureInPictureVideoCallViewController parentViewController](self, "parentViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
    -[AVPictureInPictureVideoCallViewController _removeFromParent](self, "_removeFromParent");
}

- (int64_t)avkit_contentSourceType
{
  return 2;
}

- (BOOL)avkit_wantsManagedSecondScreenPlayback
{
  return 0;
}

- (void)_observeSourceView
{
  _BOOL8 v3;

  v3 = -[AVPictureInPictureVideoCallViewController avkit_isVisible](self, "avkit_isVisible");
  -[AVPictureInPictureVideoCallViewController avkit_videoRectInWindow](self, "avkit_videoRectInWindow");
  -[AVPictureInPictureVideoCallViewController _setLastKnownIsVisible:videoRectInWindow:](self, "_setLastKnownIsVisible:videoRectInWindow:", v3);
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
  if (-[AVPictureInPictureVideoCallViewController lastKnownIsVisible](self, "lastKnownIsVisible") == a3)
  {
    -[AVPictureInPictureVideoCallViewController lastKnownVideoRectInWindow](self, "lastKnownVideoRectInWindow");
    v17.origin.x = v10;
    v17.origin.y = v11;
    v17.size.width = v12;
    v17.size.height = v13;
    v16.origin.x = x;
    v16.origin.y = y;
    v16.size.width = width;
    v16.size.height = height;
    v14 = CGRectEqualToRect(v16, v17);
    -[AVPictureInPictureVideoCallViewController setLastKnownIsVisible:](self, "setLastKnownIsVisible:", v8);
    -[AVPictureInPictureVideoCallViewController setLastKnownVideoRectInWindow:](self, "setLastKnownVideoRectInWindow:", x, y, width, height);
    if (v14)
      return;
  }
  else
  {
    -[AVPictureInPictureVideoCallViewController setLastKnownIsVisible:](self, "setLastKnownIsVisible:", v8);
    -[AVPictureInPictureVideoCallViewController setLastKnownVideoRectInWindow:](self, "setLastKnownVideoRectInWindow:", x, y, width, height);
  }
  -[AVPictureInPictureVideoCallViewController pictureInPictureController](self, "pictureInPictureController");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "contentSourceVideoRectInWindowChanged");

}

- (void)_removeFromParent
{
  void *v3;

  -[AVPictureInPictureVideoCallViewController willMoveToParentViewController:](self, "willMoveToParentViewController:", 0);
  -[AVPictureInPictureVideoCallViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[AVPictureInPictureVideoCallViewController removeFromParentViewController](self, "removeFromParentViewController");
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

- (void)setContentSource:(id)a3
{
  objc_storeWeak((id *)&self->_contentSource, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_contentSource);
  objc_destroyWeak((id *)&self->_pictureInPictureController);
  objc_storeStrong((id *)&self->_observeSourceViewTimer, 0);
  objc_destroyWeak((id *)&self->_pictureInPictureViewController);
  objc_storeStrong((id *)&self->_videoCallPlayerController, 0);
}

void __69__AVPictureInPictureVideoCallViewController_startObservingSourceView__block_invoke(uint64_t a1)
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
    v8[2] = __69__AVPictureInPictureVideoCallViewController_startObservingSourceView__block_invoke_2;
    v8[3] = &unk_1E5BB49A8;
    objc_copyWeak(&v9, v1);
    objc_msgSend(v6, "scheduledTimerWithTimeInterval:repeats:block:", 1, v8, 2.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObserveSourceViewTimer:", v7);

    objc_destroyWeak(&v9);
  }
}

void __69__AVPictureInPictureVideoCallViewController_startObservingSourceView__block_invoke_2(id *a1, void *a2)
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

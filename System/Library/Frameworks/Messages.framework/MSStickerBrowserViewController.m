@implementation MSStickerBrowserViewController

- (MSStickerBrowserViewController)init
{
  return -[MSStickerBrowserViewController initWithStickerSize:](self, "initWithStickerSize:", 1);
}

- (MSStickerBrowserViewController)initWithCoder:(id)a3
{
  MSStickerBrowserViewController *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MSStickerBrowserViewController;
  result = -[MSStickerBrowserViewController initWithCoder:](&v4, sel_initWithCoder_, a3);
  if (result)
    result->_stickerSize = 1;
  return result;
}

- (MSStickerBrowserViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  MSStickerBrowserViewController *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MSStickerBrowserViewController;
  result = -[MSStickerBrowserViewController initWithNibName:bundle:](&v5, sel_initWithNibName_bundle_, 0, 0);
  if (result)
    result->_stickerSize = 1;
  return result;
}

- (MSStickerBrowserViewController)initWithStickerSize:(MSStickerSize)stickerSize
{
  MSStickerBrowserViewController *result;
  CGSize v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MSStickerBrowserViewController;
  result = -[MSStickerBrowserViewController initWithNibName:bundle:](&v6, sel_initWithNibName_bundle_, 0, 0);
  if (result)
  {
    v5 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    result->_initialFrameBeforeAppearance.origin = (CGPoint)*MEMORY[0x1E0C9D648];
    result->_initialFrameBeforeAppearance.size = v5;
    result->_stickerSize = stickerSize;
  }
  return result;
}

- (void)loadView
{
  MSStickerBrowserView *v3;
  MSStickerSize v4;
  MSStickerBrowserView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MSStickerBrowserViewController;
  -[MSStickerBrowserViewController loadView](&v13, sel_loadView);
  -[MSStickerBrowserViewController setViewHasAppeared:](self, "setViewHasAppeared:", 0);
  v3 = [MSStickerBrowserView alloc];
  v4 = -[MSStickerBrowserViewController stickerSize](self, "stickerSize");
  v5 = -[MSStickerBrowserView initWithFrame:stickerSize:](v3, "initWithFrame:stickerSize:", v4, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[MSStickerBrowserView setDataSource:](v5, "setDataSource:", self);
  -[MSStickerBrowserViewController setStickerBrowserView:](self, "setStickerBrowserView:", v5);
  -[MSStickerBrowserViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v5);

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  MSStickerBrowserStateRestorationInfo(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count"))
  {
    -[MSStickerBrowserViewController stickerBrowserView](self, "stickerBrowserView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "restoreFromState:", v9);

  }
  -[MSStickerBrowserViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHitTestsAsOpaque:", 1);

}

- (void)_setContentOverlayInsets:(UIEdgeInsets)a3
{
  double bottom;
  double top;
  objc_super v6;

  bottom = a3.bottom;
  top = a3.top;
  v6.receiver = self;
  v6.super_class = (Class)MSStickerBrowserViewController;
  -[MSStickerBrowserViewController _setContentOverlayInsets:](&v6, sel__setContentOverlayInsets_, a3.top, a3.left, a3.bottom, a3.right);
  -[MSStickerBrowserViewController _setNavigationControllerContentInsetAdjustment:](self, "_setNavigationControllerContentInsetAdjustment:", top, 0.0, bottom, 0.0);
}

- (void)viewDidLayoutSubviews
{
  MSStickerSize v3;
  void *v4;
  uint64_t v5;
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
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)MSStickerBrowserViewController;
  -[MSStickerBrowserViewController viewDidLayoutSubviews](&v17, sel_viewDidLayoutSubviews);
  v3 = -[MSStickerBrowserViewController stickerSize](self, "stickerSize");
  -[MSStickerBrowserViewController stickerBrowserView](self, "stickerBrowserView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "stickerSize");

  if (v3 != v5)
  {
    -[MSStickerBrowserViewController stickerBrowserView](self, "stickerBrowserView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reloadData");

  }
  -[MSStickerBrowserViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  -[MSStickerBrowserViewController stickerBrowserView](self, "stickerBrowserView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MSStickerBrowserViewController;
  -[MSStickerBrowserViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[MSStickerBrowserViewController setInitialFrameBeforeAppearance:](self, "setInitialFrameBeforeAppearance:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MSStickerBrowserViewController;
  -[MSStickerBrowserViewController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  if (!-[MSStickerBrowserViewController viewHasAppeared](self, "viewHasAppeared"))
  {
    -[MSStickerBrowserViewController extensionContext](self, "extensionContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_remoteViewDidBecomeReadyForDisplay");

    -[MSStickerBrowserViewController setViewHasAppeared:](self, "setViewHasAppeared:", 1);
  }
  -[MSStickerBrowserViewController stickerBrowserView](self, "stickerBrowserView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_startAnimating");

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MSStickerBrowserViewController;
  -[MSStickerBrowserViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  -[MSStickerBrowserViewController stickerBrowserView](self, "stickerBrowserView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_stopAnimating");

}

- (void)willTransitionToPresentationStyle:(unint64_t)a3
{
  id v3;

  -[MSStickerBrowserViewController stickerBrowserView](self, "stickerBrowserView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInteractionEnabled:", 0);

}

- (void)didTransitionToPresentationStyle:(unint64_t)a3
{
  id v3;

  -[MSStickerBrowserViewController stickerBrowserView](self, "stickerBrowserView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInteractionEnabled:", 1);

}

- (int64_t)numberOfStickersInStickerBrowserView:(id)a3
{
  return 0;
}

- (id)stickerBrowserView:(id)a3 stickerAtIndex:(int64_t)a4
{
  return 0;
}

- (void)updateSnapshotWithCompletionBlock:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  void *v15;
  double v16;
  CGFloat v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  CGSize v22;

  v4 = (void (**)(id, void *))a3;
  -[MSStickerBrowserViewController stickerBrowserView](self, "stickerBrowserView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stateRestorationInfo");
  v21 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  MSStickerBrowserStateRestorationInfoPath(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "writeToFile:atomically:", v8, 1);

  -[MSStickerBrowserViewController stickerBrowserView](self, "stickerBrowserView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "prepareForSnapshotting");

  -[MSStickerBrowserViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v12 = v11;
  v14 = v13;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "scale");
  v17 = v16;
  v22.width = v12;
  v22.height = v14;
  UIGraphicsBeginImageContextWithOptions(v22, 0, v17);

  -[MSStickerBrowserViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "renderInContext:", UIGraphicsGetCurrentContext());

  UIGraphicsGetImageFromCurrentImageContext();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  v4[2](v4, v20);

}

- (void)enableUserInteraction
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__MSStickerBrowserViewController_enableUserInteraction__block_invoke;
  block[3] = &unk_1EA25C5A0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __55__MSStickerBrowserViewController_enableUserInteraction__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "stickerBrowserView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setUserInteractionEnabled:", 1);

}

- (void)disableUserInteraction
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__MSStickerBrowserViewController_disableUserInteraction__block_invoke;
  block[3] = &unk_1EA25C5A0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __56__MSStickerBrowserViewController_disableUserInteraction__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "stickerBrowserView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setUserInteractionEnabled:", 0);

}

- (CGRect)initialFrameBeforeAppearance
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_initialFrameBeforeAppearance.origin.x;
  y = self->_initialFrameBeforeAppearance.origin.y;
  width = self->_initialFrameBeforeAppearance.size.width;
  height = self->_initialFrameBeforeAppearance.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setInitialFrameBeforeAppearance:(CGRect)a3
{
  self->_initialFrameBeforeAppearance = a3;
}

- (MSStickerBrowserView)stickerBrowserView
{
  return self->_stickerBrowserView;
}

- (void)setStickerBrowserView:(id)a3
{
  objc_storeStrong((id *)&self->_stickerBrowserView, a3);
}

- (MSStickerSize)stickerSize
{
  return self->_stickerSize;
}

- (BOOL)viewHasAppeared
{
  return self->_viewHasAppeared;
}

- (void)setViewHasAppeared:(BOOL)a3
{
  self->_viewHasAppeared = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stickerBrowserView, 0);
}

@end

@implementation MPAVRoutingSheet

- (MPAVRoutingSheet)initWithAVItemType:(int64_t)a3
{
  MPAVRoutingSheet *v4;
  UIView *v5;
  UIView *controlsView;
  UIView *v7;
  void *v8;
  UIView *v9;
  UIView *backgroundView;
  UIView *v11;
  void *v12;
  uint64_t v13;
  UIButton *dismissBackgroundButton;
  UIButton *v15;
  void *v16;
  uint64_t v17;
  UIButton *dismissControlsViewButton;
  UIButton *v19;
  void *v20;
  MPAVOutputDeviceRoutingDataSource *v21;
  MPAVRoutingController *v22;
  objc_class *v23;
  void *v24;
  MPAVRoutingController *v25;
  MPAVRoutingViewController *v26;
  MPAVRoutingViewController *routingViewController;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  UIView *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *cancelButton;
  uint64_t v38;
  UIButton *v39;
  UIButton *v40;
  UIButton *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  objc_super v49;

  v49.receiver = self;
  v49.super_class = (Class)MPAVRoutingSheet;
  v4 = -[MPAVRoutingSheet initWithFrame:](&v49, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v4)
  {
    v5 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    controlsView = v4->_controlsView;
    v4->_controlsView = v5;

    v7 = v4->_controlsView;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v7, "setBackgroundColor:", v8);

    v9 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    backgroundView = v4->_backgroundView;
    v4->_backgroundView = v9;

    v11 = v4->_backgroundView;
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v11, "setBackgroundColor:", v12);

    -[UIView setAlpha:](v4->_backgroundView, "setAlpha:", 0.0);
    -[MPAVRoutingSheet addSubview:](v4, "addSubview:", v4->_backgroundView);
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 0);
    v13 = objc_claimAutoreleasedReturnValue();
    dismissBackgroundButton = v4->_dismissBackgroundButton;
    v4->_dismissBackgroundButton = (UIButton *)v13;

    v15 = v4->_dismissBackgroundButton;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setBackgroundColor:](v15, "setBackgroundColor:", v16);

    -[UIButton addTarget:action:forControlEvents:](v4->_dismissBackgroundButton, "addTarget:action:forControlEvents:", v4, sel__cancelButtonAction_, 64);
    -[MPAVRoutingSheet addSubview:](v4, "addSubview:", v4->_dismissBackgroundButton);
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 0);
    v17 = objc_claimAutoreleasedReturnValue();
    dismissControlsViewButton = v4->_dismissControlsViewButton;
    v4->_dismissControlsViewButton = (UIButton *)v17;

    v19 = v4->_dismissControlsViewButton;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setBackgroundColor:](v19, "setBackgroundColor:", v20);

    -[UIButton addTarget:action:forControlEvents:](v4->_dismissControlsViewButton, "addTarget:action:forControlEvents:", v4, sel__cancelButtonAction_, 64);
    -[UIView addSubview:](v4->_controlsView, "addSubview:", v4->_dismissControlsViewButton);
    v21 = objc_alloc_init(MPAVOutputDeviceRoutingDataSource);
    v22 = [MPAVRoutingController alloc];
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[MPAVRoutingController initWithDataSource:name:](v22, "initWithDataSource:name:", v21, v24);

    v26 = -[MPAVRoutingViewController initWithStyle:routingController:]([MPAVRoutingViewController alloc], "initWithStyle:routingController:", 0, v25);
    routingViewController = v4->_routingViewController;
    v4->_routingViewController = v26;

    -[MPAVRoutingViewController viewDidAppear:](v4->_routingViewController, "viewDidAppear:", 0);
    -[MPAVRoutingViewController setDelegate:](v4->_routingViewController, "setDelegate:", v4);
    -[MPAVRoutingViewController view](v4->_routingViewController, "view");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "layer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setCornerRadius:", 10.0);

    -[MPAVRoutingViewController view](v4->_routingViewController, "view");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "layer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setMasksToBounds:", 1);

    -[MPAVRoutingViewController _tableView](v4->_routingViewController, "_tableView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "_setSeparatorBackdropOverlayBlendMode:", 1);

    v33 = v4->_controlsView;
    -[MPAVRoutingViewController view](v4->_routingViewController, "view");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v33, "addSubview:", v34);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (dyld_program_sdk_at_least())
    {
      objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
      v36 = objc_claimAutoreleasedReturnValue();
      cancelButton = v4->_cancelButton;
      v4->_cancelButton = (UIButton *)v36;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 0);
      v38 = objc_claimAutoreleasedReturnValue();
      v39 = v4->_cancelButton;
      v4->_cancelButton = (UIButton *)v38;

      v40 = v4->_cancelButton;
      objc_msgSend(v35, "colorWithAlphaComponent:", 0.2);
      cancelButton = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton setTitleColor:forState:](v40, "setTitleColor:forState:", cancelButton, 1);
    }

    v41 = v4->_cancelButton;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setBackgroundColor:](v41, "setBackgroundColor:", v42);

    -[UIButton setTitleColor:forState:](v4->_cancelButton, "setTitleColor:forState:", v35, 0);
    -[UIButton addTarget:action:forControlEvents:](v4->_cancelButton, "addTarget:action:forControlEvents:", v4, sel__cancelButtonAction_, 64);
    -[UIView _setVisualAltitude:](v4->_controlsView, "_setVisualAltitude:", *MEMORY[0x1E0DC5AC8] * 1.5);
    -[UIButton titleLabel](v4->_cancelButton, "titleLabel");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC37E8], "boldSystemFontOfSize:", 19.0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setFont:", v44);

    -[UIButton layer](v4->_cancelButton, "layer");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setCornerRadius:", 10.0);

    -[UIButton layer](v4->_cancelButton, "layer");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setMasksToBounds:", 1);

    -[UIView addSubview:](v4->_controlsView, "addSubview:", v4->_cancelButton);
    -[MPAVRoutingSheet addSubview:](v4, "addSubview:", v4->_controlsView);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPAVRoutingSheet setBackgroundColor:](v4, "setBackgroundColor:", v47);

    -[MPAVRoutingSheet setAVItemType:](v4, "setAVItemType:", a3);
    -[MPAVRoutingSheet _updateDismissButtonText](v4, "_updateDismissButtonText");

  }
  return v4;
}

- (MPAVRoutingSheet)initWithFrame:(CGRect)a3
{
  return -[MPAVRoutingSheet initWithAVItemType:](self, "initWithAVItemType:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)dealloc
{
  objc_super v3;

  -[MPAVRoutingSheet dismiss](self, "dismiss");
  -[MPAVRoutingViewController viewDidDisappear:](self->_routingViewController, "viewDidDisappear:", 0);
  v3.receiver = self;
  v3.super_class = (Class)MPAVRoutingSheet;
  -[MPAVRoutingSheet dealloc](&v3, sel_dealloc);
}

- (int64_t)avItemType
{
  return -[MPAVRoutingViewController avItemType](self->_routingViewController, "avItemType");
}

- (void)setAVItemType:(int64_t)a3
{
  -[MPAVRoutingViewController setAVItemType:](self->_routingViewController, "setAVItemType:", a3);
}

- (void)setMirroringOnly:(BOOL)a3
{
  uint64_t v3;

  self->_mirroringOnly = a3;
  if (a3)
    v3 = 2;
  else
    v3 = 0;
  -[MPAVRoutingViewController setMirroringStyle:](self->_routingViewController, "setMirroringStyle:", v3);
}

- (void)layoutSubviews
{
  _QWORD v3[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MPAVRoutingSheet;
  -[MPAVRoutingSheet layoutSubviews](&v4, sel_layoutSubviews);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __34__MPAVRoutingSheet_layoutSubviews__block_invoke;
  v3[3] = &unk_1E3163508;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v3);
}

- (void)tintColorDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MPAVRoutingSheet;
  -[MPAVRoutingSheet tintColorDidChange](&v4, sel_tintColorDidChange);
  -[MPAVRoutingSheet tintColor](self, "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTitleColor:forState:](self->_cancelButton, "setTitleColor:forState:", v3, 0);
  -[MPAVRoutingViewController _setTableCellsContentColor:](self->_routingViewController, "_setTableCellsContentColor:", v3);

}

- (void)showInView:(id)a3 withCompletionHandler:(id)a4
{
  void *v5;
  id completionHandler;
  _MPAVRoutingSheetSecureWindow *v7;
  void *v8;
  UIWindow *v9;
  UIWindow *presentationWindow;
  UIWindow *v11;
  void *v12;
  id v13;

  v5 = (void *)objc_msgSend(a4, "copy", a3);
  completionHandler = self->_completionHandler;
  self->_completionHandler = v5;

  v7 = [_MPAVRoutingSheetSecureWindow alloc];
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v9 = -[_MPAVRoutingSheetSecureWindow initWithFrame:](v7, "initWithFrame:");
  presentationWindow = self->_presentationWindow;
  self->_presentationWindow = v9;

  -[UIWindow setWindowLevel:](self->_presentationWindow, "setWindowLevel:", *MEMORY[0x1E0DC5628]);
  v11 = self->_presentationWindow;
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIWindow setBackgroundColor:](v11, "setBackgroundColor:", v12);

  v13 = objc_alloc_init(MEMORY[0x1E0DC3F20]);
  objc_msgSend(v13, "setView:", self);
  -[MPAVRoutingSheet _updateRoutingSheetFrame](self, "_updateRoutingSheetFrame");
  -[UIWindow setRootViewController:](self->_presentationWindow, "setRootViewController:", v13);
  -[UIWindow makeKeyAndVisible](self->_presentationWindow, "makeKeyAndVisible");
  -[MPAVRoutingSheet _animateControls:withCompletionHandler:](self, "_animateControls:withCompletionHandler:", 1, 0);

}

- (void)dismiss
{
  void *v3;
  _QWORD v4[5];

  -[MPAVRoutingSheet superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __27__MPAVRoutingSheet_dismiss__block_invoke;
    v4[3] = &unk_1E31631D8;
    v4[4] = self;
    -[MPAVRoutingSheet _animateControls:withCompletionHandler:](self, "_animateControls:withCompletionHandler:", 0, v4);
  }
}

- (void)routingViewControllerDidUpdateContents:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __59__MPAVRoutingSheet_routingViewControllerDidUpdateContents___block_invoke;
  v3[3] = &unk_1E3163508;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingDefaultTimingWithOptions:animations:completion:", 0, v3, 0);
}

- (void)_animateControls:(BOOL)a3 withCompletionHandler:(id)a4
{
  _BOOL4 v4;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  _QWORD v17[13];
  BOOL v18;

  v4 = a3;
  v6 = a4;
  -[MPAVRoutingSheet layoutIfNeeded](self, "layoutIfNeeded");
  -[MPAVRoutingSheet _controlsViewFrame](self, "_controlsViewFrame");
  v10 = v7;
  v11 = v8;
  v13 = v12;
  v14 = v9;
  v15 = v8 + v9 + 8.0;
  if (v4)
    v16 = 0.0;
  else
    v16 = 0.5;
  if (v4)
    v8 = v8 + v9 + 8.0;
  -[UIView setFrame:](self->_controlsView, "setFrame:", v7, v8);
  -[UIView setAlpha:](self->_backgroundView, "setAlpha:", v16);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __59__MPAVRoutingSheet__animateControls_withCompletionHandler___block_invoke;
  v17[3] = &unk_1E315F5D8;
  v17[4] = self;
  v18 = v4;
  *(double *)&v17[5] = v10;
  *(double *)&v17[6] = v11;
  v17[7] = v13;
  *(double *)&v17[8] = v14;
  *(double *)&v17[9] = v10;
  *(double *)&v17[10] = v15;
  v17[11] = v13;
  *(double *)&v17[12] = v14;
  objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingDefaultTimingWithOptions:animations:completion:", 0, v17, v6);

}

- (void)_updateRoutingSheetFrame
{
  -[UIWindow bounds](self->_presentationWindow, "bounds");
  -[MPAVRoutingSheet setFrame:](self, "setFrame:");
}

- (void)_updateDismissButtonText
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  id v8;

  -[MPAVRoutingViewController _routingController](self->_routingViewController, "_routingController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "wirelessDisplayRouteIsPicked");

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
    v7 = CFSTR("DONE");
  else
    v7 = CFSTR("CANCEL");
  objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_1E3163D10, CFSTR("MediaPlayer"));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[UIButton setTitle:forState:](self->_cancelButton, "setTitle:forState:", v8, 0);
}

- (CGRect)_routingViewFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect v12;
  CGRect result;

  -[MPAVRoutingSheet _maxRoutingViewSize](self, "_maxRoutingViewSize");
  v4 = v3;
  v6 = v5;
  -[MPAVRoutingViewController preferredContentSize](self->_routingViewController, "preferredContentSize");
  if (v7 < v6)
    v6 = v7;
  -[MPAVRoutingSheet _cancelButtonFrame](self, "_cancelButtonFrame");
  v8 = CGRectGetMinY(v12) + -8.0 - v6;
  v9 = 8.0;
  v10 = v4;
  v11 = v6;
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v8;
  result.origin.x = v9;
  return result;
}

- (CGRect)_cancelButtonFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect result;

  -[MPAVRoutingSheet _maxRoutingViewSize](self, "_maxRoutingViewSize");
  v4 = v3 + 8.0;
  -[MPAVRoutingSheet _maxRoutingViewSize](self, "_maxRoutingViewSize");
  v6 = v5;
  -[MPAVRoutingViewController _normalCellHeight](self->_routingViewController, "_normalCellHeight");
  v8 = v7;
  v9 = 8.0;
  v10 = v4;
  v11 = v6;
  result.size.height = v8;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (CGRect)_controlsViewFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  -[MPAVRoutingSheet bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[MPAVRoutingSheet _maxRoutingViewSize](self, "_maxRoutingViewSize");
  v12 = v11 + 8.0;
  -[MPAVRoutingSheet _cancelButtonFrame](self, "_cancelButtonFrame");
  v14 = v12 + v13;
  -[MPAVRoutingSheet safeAreaInsets](self, "safeAreaInsets");
  v16 = v6 + v10 - v14 + -8.0 - v15;
  v17 = v4;
  v18 = v8;
  v19 = v14;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v16;
  result.origin.x = v17;
  return result;
}

- (CGSize)_maxRoutingViewSize
{
  double v2;
  double v3;
  double v4;
  CGSize result;
  CGRect v6;

  -[MPAVRoutingSheet bounds](self, "bounds");
  v2 = rint(v6.size.width + -16.0);
  v3 = rint(CGRectGetHeight(v6) * 0.666666667);
  v4 = v2;
  result.height = v3;
  result.width = v4;
  return result;
}

- (BOOL)mirroringOnly
{
  return self->_mirroringOnly;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_routingViewController, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_controlsView, 0);
  objc_storeStrong((id *)&self->_dismissControlsViewButton, 0);
  objc_storeStrong((id *)&self->_dismissBackgroundButton, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_presentationWindow, 0);
}

uint64_t __59__MPAVRoutingSheet__animateControls_withCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  double *v3;
  double *v4;
  double *v5;
  double *v6;
  double v7;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 448);
  v3 = (double *)(a1 + 72);
  v4 = (double *)(a1 + 80);
  v5 = (double *)(a1 + 88);
  if (*(_BYTE *)(a1 + 104))
    v6 = (double *)(a1 + 64);
  else
    v6 = (double *)(a1 + 96);
  if (*(_BYTE *)(a1 + 104))
  {
    v5 = (double *)(a1 + 56);
    v4 = (double *)(a1 + 48);
    v3 = (double *)(a1 + 40);
  }
  objc_msgSend(v2, "setFrame:", *v3, *v4, *v5, *v6);
  v7 = 0.5;
  if (!*(_BYTE *)(a1 + 104))
    v7 = 0.0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setAlpha:", v7);
}

uint64_t __59__MPAVRoutingSheet_routingViewControllerDidUpdateContents___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;

  objc_msgSend(*(id *)(a1 + 32), "_routingViewFrame");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFrame:", v3, v5, v7, v9);

  return objc_msgSend(*(id *)(a1 + 32), "_updateDismissButtonText");
}

uint64_t __27__MPAVRoutingSheet_dismiss__block_invoke(uint64_t result, int a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (a2)
  {
    v2 = result;
    objc_msgSend(*(id *)(result + 32), "removeFromSuperview");
    objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 416), "setHidden:", 1);
    v3 = *(_QWORD *)(v2 + 32);
    v4 = *(void **)(v3 + 416);
    *(_QWORD *)(v3 + 416) = 0;

    result = *(_QWORD *)(*(_QWORD *)(v2 + 32) + 472);
    if (result)
      return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __34__MPAVRoutingSheet_layoutSubviews__block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;

  objc_msgSend(*(id *)(a1 + 32), "bounds");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setFrame:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setFrame:", v3, v5, v7, v9);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAutoresizingMask:", 0);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_routingViewFrame");
  objc_msgSend(v11, "setFrame:");

  v12 = *(_QWORD **)(a1 + 32);
  v13 = (void *)v12[57];
  objc_msgSend(v12, "_cancelButtonFrame");
  objc_msgSend(v13, "setFrame:");
  objc_msgSend(*(id *)(a1 + 32), "_controlsViewFrame");
  v15 = v14;
  v17 = v16;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "setFrame:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setFrame:", 0.0, 0.0, v15, v17);
}

@end

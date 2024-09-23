@implementation CKVideoMessageRecordingViewController

- (CKVideoMessageRecordingViewController)initWithPresentationView:(id)a3
{
  id v5;
  CKVideoMessageRecordingViewController *v6;
  CKVideoMessageRecordingViewController *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CKVideoMessageRecordingViewController;
  v6 = -[CKVideoMessageRecordingViewController init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_presentationView, a3);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel__previewWarmedUp_, *MEMORY[0x1E0C8A1D8], 0);
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel__applicationDidEnterBackground_, *MEMORY[0x1E0CEB288], 0);
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel__applicationWillEnterForeground_, *MEMORY[0x1E0CEB350], 0);

  }
  return v7;
}

- (void)viewDidLoad
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
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
  void *v26;
  void *v27;
  void *v28;
  CKRecordingElapsedTimeView *v29;
  CKRecordingElapsedTimeView *v30;
  void *v31;
  void *v32;
  void *v33;
  CGFloat v34;
  void *v35;
  CGFloat v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  CGFloat v42;
  CGFloat v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  double v52;
  CGFloat v53;
  double v54;
  CGFloat v55;
  double v56;
  double v57;
  double v58;
  double v59;
  void *v60;
  double Width;
  double v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  objc_super v68;
  _QWORD v69[3];
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;

  v69[2] = *MEMORY[0x1E0C80C00];
  v68.receiver = self;
  v68.super_class = (Class)CKVideoMessageRecordingViewController;
  -[CKVideoMessageRecordingViewController viewDidLoad](&v68, sel_viewDidLoad);
  v3 = objc_alloc_init(MEMORY[0x1E0CEA648]);
  v4 = objc_alloc(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "_properties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithDictionary:", v5);

  v7 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v6, "setValue:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CEC070]);
  v8 = MEMORY[0x1E0C9AAA0];
  objc_msgSend(v6, "setValue:forKey:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0CEC090]);
  objc_msgSend(v6, "setValue:forKey:", v8, *MEMORY[0x1E0CEC058]);
  objc_msgSend(v6, "setValue:forKey:", v7, *MEMORY[0x1E0CEC010]);
  objc_msgSend(v3, "_setProperties:", v6);
  objc_msgSend(v3, "setAllowsEditing:", 0);
  v9 = 1;
  objc_msgSend(v3, "setSourceType:", 1);
  objc_msgSend(v3, "_setImagePickerSavingOptions:", 4);
  v10 = *MEMORY[0x1E0CA5B90];
  v69[0] = *MEMORY[0x1E0CA5BF8];
  v69[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMediaTypes:", v11);

  objc_msgSend(v3, "setCameraCaptureMode:", 1);
  objc_msgSend(v3, "setVideoQuality:", 0);
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", CFSTR("kCKVideoMessagingCameraDevice"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    v9 = objc_msgSend(v13, "integerValue");
  v67 = v13;
  if (v9 >= 1)
    v14 = 1;
  else
    v14 = v9;
  objc_msgSend(v3, "setCameraDevice:", v14);
  objc_msgSend(v3, "setShowsCameraControls:", 0);
  objc_msgSend(v3, "setDelegate:", self);
  -[CKVideoMessageRecordingViewController setCameraViewController:](self, "setCameraViewController:", v3);
  -[CKVideoMessageRecordingViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bounds");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  -[CKVideoMessageRecordingViewController addChildViewController:](self, "addChildViewController:", v3);
  -[CKVideoMessageRecordingViewController cameraViewController](self, "cameraViewController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "setFrame:", v17, v19, v21, v23);
  objc_msgSend(v25, "setAlpha:", 0.0);
  objc_msgSend(v3, "didMoveToParentViewController:", self);
  v65 = v25;
  v66 = v15;
  objc_msgSend(v15, "addSubview:", v25);
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v17, v19, v21, v23);
  objc_msgSend(v26, "setAutoresizingMask:", 18);
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", 0.0, 0.0, v21, 40.0);
  objc_msgSend(v27, "setAutoresizingMask:", 18);
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, 0.3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setBackgroundColor:", v28);

  objc_msgSend(v27, "setOpaque:", 0);
  objc_msgSend(v26, "addSubview:", v27);
  -[CKVideoMessageRecordingViewController setTopBackgroundView:](self, "setTopBackgroundView:", v27);
  v29 = [CKRecordingElapsedTimeView alloc];
  v30 = -[CKRecordingElapsedTimeView initWithFrame:](v29, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[CKRecordingElapsedTimeView setAutoresizingMask:](v30, "setAutoresizingMask:", 5);
  -[CKVideoMessageRecordingViewController setTimerView:](self, "setTimerView:", v30);
  -[CKVideoMessageRecordingViewController timerView](self, "timerView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "sizeToFit");

  -[CKVideoMessageRecordingViewController timerView](self, "timerView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setHidden:", 1);

  -[CKVideoMessageRecordingViewController topBackgroundView](self, "topBackgroundView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "frame");
  v34 = CGRectGetWidth(v70) * 0.5;
  -[CKVideoMessageRecordingViewController topBackgroundView](self, "topBackgroundView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "frame");
  v36 = CGRectGetHeight(v71) * 0.5;
  -[CKVideoMessageRecordingViewController timerView](self, "timerView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "frame");
  v39 = v38;
  v41 = v40;
  v42 = v34 - v38 * 0.5;
  v43 = v36 - v40 * 0.5;

  -[CKVideoMessageRecordingViewController timerView](self, "timerView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setFrame:", v42, v43, v39, v41);

  -[CKVideoMessageRecordingViewController topBackgroundView](self, "topBackgroundView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKVideoMessageRecordingViewController timerView](self, "timerView");
  v46 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "addSubview:", v46);

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v46) = objc_msgSend(v47, "BOOLForKey:", CFSTR("CKSwapCameraButton"));

  if ((v46 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 0);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA638], "ckImageNamed:", CFSTR("CameraToggle"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "_flatImageWithColor:", v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setImage:forState:", v51, 0);

    objc_msgSend(v48, "setOpaque:", 0);
    objc_msgSend(v48, "sizeToFit");
    objc_msgSend(v48, "addTarget:action:forControlEvents:", self, sel_swapCamera_, 64);
    objc_msgSend(v48, "frame");
    v53 = v52;
    v55 = v54;
    v57 = v56;
    v59 = v58;
    -[CKVideoMessageRecordingViewController topBackgroundView](self, "topBackgroundView");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "frame");
    Width = CGRectGetWidth(v72);
    v73.origin.x = v53;
    v73.origin.y = v55;
    v73.size.width = v57;
    v73.size.height = v59;
    v62 = Width - CGRectGetWidth(v73) + -10.0;

    objc_msgSend(v48, "setFrame:", v62, 10.0, v57, v59);
    objc_msgSend(v48, "setAutoresizingMask:", 1);
    -[CKVideoMessageRecordingViewController topBackgroundView](self, "topBackgroundView");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "addSubview:", v48);

    -[CKVideoMessageRecordingViewController setSwapCameraButton:](self, "setSwapCameraButton:", v48);
  }
  -[CKVideoMessageRecordingViewController cameraViewController](self, "cameraViewController");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setCameraOverlayView:", v26);

}

- (void)presentVideoActionMenuController
{
  CKVideoCancelActionMenuItemView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CKVideoCancelActionMenuItemView *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  CKActionMenuItem *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  CKRecordActionMenuItem *v28;
  CKActionMenuController *v29;
  void *v30;
  CKActionMenuController *v31;
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
  double v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  CKVideoCancelActionMenuItemView *v51;
  CKVideoCancelActionMenuItem *v52;
  _QWORD v53[3];
  _QWORD v54[3];
  _QWORD v55[5];

  v55[3] = *MEMORY[0x1E0C80C00];
  v3 = [CKVideoCancelActionMenuItemView alloc];
  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v8 = -[CKVideoCancelActionMenuItemView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], v5, v6, v7);
  -[CKVideoCancelActionMenuItemView sizeToFit](v8, "sizeToFit");
  v51 = v8;
  v52 = -[CKActionMenuItem initWithView:label:target:action:]([CKVideoCancelActionMenuItem alloc], "initWithView:label:target:action:", v8, 0, self, sel_cancelMenuItemAction_);
  objc_msgSend(MEMORY[0x1E0DC1350], "ck_cui_cameraModeDialFontForContentSize:", *MEMORY[0x1E0CEB420]);
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "ck_cui_cameraKerningForFont:", v9);
  v10 = objc_claimAutoreleasedReturnValue();
  v54[0] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x1E0DC1150];
  v55[0] = v11;
  v55[1] = v10;
  v49 = (void *)v10;
  v13 = *MEMORY[0x1E0DC1138];
  v54[1] = v12;
  v54[2] = v13;
  v50 = (void *)v9;
  v55[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 3);
  v14 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D0D0F8], "actionMenuShutterButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setMode:animated:", 0, 0);
  objc_msgSend(v15, "setUserInteractionEnabled:", 0);
  objc_msgSend(v15, "sizeToFit");
  v16 = objc_alloc(MEMORY[0x1E0CB3498]);
  CKFrameworkBundle();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("PHOTO"), &stru_1E276D870, CFSTR("ChatKit"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v16, "initWithString:attributes:", v18, v14);

  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v4, v5, v6, v7);
  v47 = (void *)v19;
  objc_msgSend(v20, "setAttributedText:", v19);
  objc_msgSend(v20, "sizeToFit");
  v21 = -[CKActionMenuItem initWithView:label:target:action:]([CKActionMenuItem alloc], "initWithView:label:target:action:", v15, v20, self, sel_photoMenuItemAction_);
  -[CKVideoMessageRecordingViewController setPhotoMenuItem:](self, "setPhotoMenuItem:", v21);
  objc_msgSend(MEMORY[0x1E0D0D0F8], "actionMenuShutterButton");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setMode:animated:", 1, 0);
  objc_msgSend(v22, "setUserInteractionEnabled:", 0);
  objc_msgSend(v22, "sizeToFit");
  v23 = objc_alloc(MEMORY[0x1E0CB3498]);
  CKFrameworkBundle();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("VIDEO"), &stru_1E276D870, CFSTR("ChatKit"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = (void *)v14;
  v26 = (void *)objc_msgSend(v23, "initWithString:attributes:", v25, v14);

  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v4, v5, v6, v7);
  objc_msgSend(v27, "setAttributedText:", v26);
  objc_msgSend(v27, "sizeToFit");
  v28 = -[CKActionMenuItem initWithView:label:target:action:]([CKRecordActionMenuItem alloc], "initWithView:label:target:action:", v22, v27, self, sel_videoMenuItemAction_);
  v29 = [CKActionMenuController alloc];
  v53[0] = v28;
  v53[1] = v21;
  v53[2] = v52;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 3);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = -[CKActionMenuController initWithActionMenuItems:defaultActionIndex:blurEffectStyle:](v29, "initWithActionMenuItems:defaultActionIndex:blurEffectStyle:", v30, 2, 2);

  -[CKActionMenuController setDelegate:](v31, "setDelegate:", self);
  -[CKVideoMessageRecordingViewController setVideoActionMenuController:](self, "setVideoActionMenuController:", v31);
  -[UIView frame](self->_presentationView, "frame");
  v33 = v32;
  v35 = v34;
  v37 = v36;
  v39 = v38;
  if (CKMainScreenScale_once_71 != -1)
    dispatch_once(&CKMainScreenScale_once_71, &__block_literal_global_177);
  v40 = *(double *)&CKMainScreenScale_sMainScreenScale_71;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_71 == 0.0)
    v40 = 1.0;
  v41 = v33 * v40 + floor((v37 * v40 - v6 * v40) * 0.5);
  v42 = v35 * v40 + floor((v39 * v40 - v7 * v40) * 0.5);
  v43 = 1.0 / v40;
  v44 = v43 * v41;
  v45 = v43 * v42;
  -[UIView superview](self->_presentationView, "superview");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKActionMenuController presentActionMenuFromPoint:inView:animated:](v31, "presentActionMenuFromPoint:inView:animated:", v46, 1, v44, v45);

}

- (void)presentWithCompletion:(id)a3
{
  _CKVideoMessageRecordingWindow *v4;
  void *v5;
  UIWindow *v6;
  UIWindow *overlayWindow;
  void *v8;
  void *v9;
  void (**v10)(void);

  v10 = (void (**)(void))a3;
  v4 = [_CKVideoMessageRecordingWindow alloc];
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v6 = -[_CKVideoMessageRecordingWindow initWithFrame:](v4, "initWithFrame:");
  overlayWindow = self->_overlayWindow;
  self->_overlayWindow = v6;

  -[UIWindow setRootViewController:](self->_overlayWindow, "setRootViewController:", self);
  -[UIWindow setHidden:](self->_overlayWindow, "setHidden:", 0);
  -[CKVideoMessageRecordingViewController cameraViewController](self, "cameraViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIWindow bounds](self->_overlayWindow, "bounds");
  objc_msgSend(v9, "setFrame:");

  self->_presented = 1;
  -[CKVideoMessageRecordingViewController presentVideoActionMenuController](self, "presentVideoActionMenuController");
  if (self->_previewWarmedUp)
    -[CKVideoMessageRecordingViewController _animateVideoIn](self, "_animateVideoIn");
  if (v10)
    v10[2]();
  -[CKVideoMessageRecordingViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");

}

- (void)_previewWarmedUp:(id)a3
{
  if (self->_presented)
    -[CKVideoMessageRecordingViewController _animateVideoIn](self, "_animateVideoIn", a3);
  self->_previewWarmedUp = 1;
}

- (void)dismissWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  UIWindow *overlayWindow;
  UIWindow *v6;
  dispatch_time_t v7;
  UIWindow *v8;
  UIWindow *v9;
  UIWindow *v10;
  void *v11;
  _QWORD block[4];
  UIWindow *v13;

  v4 = (void (**)(_QWORD))a3;
  overlayWindow = self->_overlayWindow;
  if (overlayWindow)
  {
    v6 = overlayWindow;
    v7 = dispatch_time(0, 250000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__CKVideoMessageRecordingViewController_dismissWithCompletion___block_invoke;
    block[3] = &unk_1E274A208;
    v13 = v6;
    v8 = v6;
    dispatch_after(v7, MEMORY[0x1E0C80D38], block);

    v9 = self->_overlayWindow;
  }
  else
  {
    v9 = 0;
  }
  -[UIWindow setHidden:](v9, "setHidden:", 1);
  v10 = self->_overlayWindow;
  self->_overlayWindow = 0;

  -[CKVideoMessageRecordingViewController videoActionMenuController](self, "videoActionMenuController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDelegate:", 0);
  -[CKVideoMessageRecordingViewController setVideoActionMenuController:](self, "setVideoActionMenuController:", 0);
  objc_msgSend(v11, "dismissActionMenuAnimated:", 1);
  if (v4)
    v4[2](v4);

}

uint64_t __63__CKVideoMessageRecordingViewController_dismissWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setRootViewController:", 0);
}

- (BOOL)shouldAutorotate
{
  return 0;
}

- (void)_animateVideoIn
{
  _QWORD v2[5];
  _QWORD v3[5];

  if (!self->_showingVideo)
  {
    self->_showingVideo = 1;
    v2[4] = self;
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __56__CKVideoMessageRecordingViewController__animateVideoIn__block_invoke;
    v3[3] = &unk_1E274A208;
    v3[4] = self;
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __56__CKVideoMessageRecordingViewController__animateVideoIn__block_invoke_2;
    v2[3] = &unk_1E274A1B8;
    objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:completion:", v3, v2, 0.3);
  }
}

void __56__CKVideoMessageRecordingViewController__animateVideoIn__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "cameraViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

uint64_t __56__CKVideoMessageRecordingViewController__animateVideoIn__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "recording");
  if ((result & 1) == 0)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "triedToRecord");
    if ((_DWORD)result)
      return objc_msgSend(*(id *)(a1 + 32), "record");
  }
  return result;
}

- (void)swapCamera:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[CKVideoMessageRecordingViewController cameraViewController](self, "cameraViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "cameraDevice");

  if (!v5)
  {
    -[CKVideoMessageRecordingViewController cameraViewController](self, "cameraViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = 1;
    goto LABEL_5;
  }
  if (v5 == 1)
  {
    -[CKVideoMessageRecordingViewController cameraViewController](self, "cameraViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = 0;
LABEL_5:
    objc_msgSend(v6, "setCameraDevice:", v8);

  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[CKVideoMessageRecordingViewController cameraViewController](self, "cameraViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "numberWithInteger:", objc_msgSend(v10, "cameraDevice"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", v11, CFSTR("kCKVideoMessagingCameraDevice"));

}

- (void)actionMenuControllerWillDismissActionMenu:(id)a3 animated:(BOOL)a4
{
  if (!-[CKVideoMessageRecordingViewController sending](self, "sending", a3, a4))
    -[CKVideoMessageRecordingViewController cancel](self, "cancel");
}

- (void)record
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;

  if (!-[CKVideoMessageRecordingViewController recording](self, "recording"))
  {
    -[CKVideoMessageRecordingViewController cameraViewController](self, "cameraViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKVideoMessageRecordingViewController setRecording:](self, "setRecording:", objc_msgSend(v3, "startVideoCapture"));

    if (-[CKVideoMessageRecordingViewController recording](self, "recording"))
    {
      -[CKVideoMessageRecordingViewController photoMenuItem](self, "photoMenuItem");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setEnabled:animated:", 0, 1);

      -[CKVideoMessageRecordingViewController timerView](self, "timerView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setHidden:", 0);

      -[CKVideoMessageRecordingViewController timerView](self, "timerView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "startTimer");

      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "BOOLForKey:", CFSTR("CKSwapCameraButton"));

      if ((v8 & 1) == 0)
      {
        -[CKVideoMessageRecordingViewController swapCameraButton](self, "swapCameraButton");
        v9 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setHidden:", 1);

      }
    }
    else
    {
      -[CKVideoMessageRecordingViewController setTriedToRecord:](self, "setTriedToRecord:", 1);
    }
  }
}

- (void)videoMenuItemAction:(id)a3
{
  _QWORD v4[5];
  _QWORD v5[5];

  if ((objc_msgSend(a3, "isSelected") & 1) != 0)
  {
    -[CKVideoMessageRecordingViewController record](self, "record");
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __61__CKVideoMessageRecordingViewController_videoMenuItemAction___block_invoke_2;
    v4[3] = &unk_1E274A208;
    v4[4] = self;
    +[CKActionMenuItem animate:completion:](CKActionMenuItem, "animate:completion:", v4, 0);
  }
  else if (-[CKVideoMessageRecordingViewController recording](self, "recording"))
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __61__CKVideoMessageRecordingViewController_videoMenuItemAction___block_invoke;
    v5[3] = &unk_1E274A208;
    v5[4] = self;
    -[CKVideoMessageRecordingViewController stopRecordingWithCompletionBlock:](self, "stopRecordingWithCompletionBlock:", v5);
  }
}

uint64_t __61__CKVideoMessageRecordingViewController_videoMenuItemAction___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "send");
}

void __61__CKVideoMessageRecordingViewController_videoMenuItemAction___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "videoActionMenuController", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "actionMenuItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6), "label");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setAlpha:", 0.0);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)takePictureWithCompletionBlock:(id)a3
{
  id v4;

  -[CKVideoMessageRecordingViewController setMediaExportCompletionBlock:](self, "setMediaExportCompletionBlock:", a3);
  -[CKVideoMessageRecordingViewController cameraViewController](self, "cameraViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "takePicture");

}

- (void)photoMenuItemAction:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __61__CKVideoMessageRecordingViewController_photoMenuItemAction___block_invoke;
  v3[3] = &unk_1E274A208;
  v3[4] = self;
  -[CKVideoMessageRecordingViewController takePictureWithCompletionBlock:](self, "takePictureWithCompletionBlock:", v3);
}

uint64_t __61__CKVideoMessageRecordingViewController_photoMenuItemAction___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "send");
}

- (void)stopRecordingWithCompletionBlock:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(void);

  v6 = (void (**)(void))a3;
  -[CKVideoMessageRecordingViewController timerView](self, "timerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endTimer");

  if (-[CKVideoMessageRecordingViewController recording](self, "recording"))
  {
    -[CKVideoMessageRecordingViewController setRecording:](self, "setRecording:", 0);
    -[CKVideoMessageRecordingViewController setMediaExportCompletionBlock:](self, "setMediaExportCompletionBlock:", v6);
    -[CKVideoMessageRecordingViewController cameraViewController](self, "cameraViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stopVideoCapture");

  }
  else if (v6)
  {
    v6[2]();
  }

}

- (void)send
{
  void *v3;
  void *v4;
  void *v5;

  -[CKVideoMessageRecordingViewController setSending:](self, "setSending:", 1);
  -[CKVideoMessageRecordingViewController videoMessageDelegate](self, "videoMessageDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKVideoMessageRecordingViewController mediaObjectForSending](self, "mediaObjectForSending");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKVideoMessageRecordingViewController captureError](self, "captureError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ckVideoMessageRecordingViewController:mediaObjectCaptured:error:", self, v4, v5);

  -[CKVideoMessageRecordingViewController setMediaObjectForSending:](self, "setMediaObjectForSending:", 0);
  -[CKVideoMessageRecordingViewController setCaptureError:](self, "setCaptureError:", 0);
}

- (void)cancel
{
  void *v3;
  id v4;

  -[CKVideoMessageRecordingViewController setCanceled:](self, "setCanceled:", 1);
  -[CKVideoMessageRecordingViewController cameraViewController](self, "cameraViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[CKVideoMessageRecordingViewController stopRecordingWithCompletionBlock:](self, "stopRecordingWithCompletionBlock:", 0);
  -[CKVideoMessageRecordingViewController videoMessageDelegate](self, "videoMessageDelegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ckVideoMessageRecordingViewControllerRecordingCanceled:", self);

}

- (void)ckVideoRecorderRecordingCanceled:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CKVideoMessageRecordingViewController videoMessageDelegate](self, "videoMessageDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ckVideoMessageRecordingViewControllerRecordingCanceled:", self);

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "outputFileURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "removeItemAtURL:error:", v6, 0);
}

- (void)ckVideoRecorder:(id)a3 videoCaptured:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void (**v14)(void);
  void *v15;
  id v16;
  id v17;

  v17 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v8)
  {
    if (!v9)
    {
      +[CKMediaObjectManager sharedInstance](CKMediaObjectManager, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "mediaObjectWithFileURL:filename:transcoderUserInfo:", v8, CFSTR("Video Message.mov"), 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_6;
    }
  }
  else
  {
    v16 = v9;
    _IMWarn();
  }
  v12 = 0;
LABEL_6:
  -[CKVideoMessageRecordingViewController setMediaObjectForSending:](self, "setMediaObjectForSending:", v12, v16);
  -[CKVideoMessageRecordingViewController setCaptureError:](self, "setCaptureError:", v10);
  -[CKVideoMessageRecordingViewController mediaExportCompletionBlock](self, "mediaExportCompletionBlock");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[CKVideoMessageRecordingViewController mediaExportCompletionBlock](self, "mediaExportCompletionBlock");
    v14 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v14[2]();

    -[CKVideoMessageRecordingViewController setMediaExportCompletionBlock:](self, "setMediaExportCompletionBlock:", 0);
  }
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeItemAtURL:error:", v8, 0);

  }
}

- (void)ckVideoRecorder:(id)a3 imageDataCaptured:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void (**v14)(void);
  id v15;

  v15 = a3;
  v8 = a4;
  v9 = a5;
  if (v8)
  {
    +[CKImageData UTITypeForData:](CKImageData, "UTITypeForData:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKMediaObjectManager sharedInstance](CKMediaObjectManager, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "mediaObjectWithData:UTIType:filename:transcoderUserInfo:", v8, v10, 0, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  -[CKVideoMessageRecordingViewController setMediaObjectForSending:](self, "setMediaObjectForSending:", v12);
  -[CKVideoMessageRecordingViewController setCaptureError:](self, "setCaptureError:", v9);
  -[CKVideoMessageRecordingViewController mediaExportCompletionBlock](self, "mediaExportCompletionBlock");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[CKVideoMessageRecordingViewController mediaExportCompletionBlock](self, "mediaExportCompletionBlock");
    v14 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v14[2]();

    -[CKVideoMessageRecordingViewController setMediaExportCompletionBlock:](self, "setMediaExportCompletionBlock:", 0);
  }

}

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  id v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void (**v20)(void);
  _QWORD v21[5];

  v5 = a4;
  if (-[CKVideoMessageRecordingViewController canceled](self, "canceled"))
    goto LABEL_21;
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0CEB6C0]);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (UTTypeConformsTo(v6, (CFStringRef)*MEMORY[0x1E0CA5BF8]))
  {
    objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0CEB6C8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0CEC080]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0CEC078]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "doubleValue");
      v11 = v10;
      objc_msgSend(v8, "doubleValue");
      if (v11 - v12 <= 2.22044605e-16)
      {
        v13 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKey:", v8, *MEMORY[0x1E0D37F08]);
        objc_msgSend(v13, "setObject:forKey:", v9, *MEMORY[0x1E0D37ED8]);
      }
      +[CKMediaObjectManager sharedInstance](CKMediaObjectManager, "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "mediaObjectWithFileURL:filename:transcoderUserInfo:", v7, CFSTR("Video Message.mov"), v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_14;
    }
    goto LABEL_13;
  }
  if (!UTTypeConformsTo(v6, (CFStringRef)*MEMORY[0x1E0CA5B90]))
  {
    v16 = 0;
    goto LABEL_15;
  }
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0CEC048]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
LABEL_13:
    _IMWarn();
    v16 = 0;
    goto LABEL_14;
  }
  +[CKImageData UTITypeForData:](CKImageData, "UTITypeForData:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKMediaObjectManager sharedInstance](CKMediaObjectManager, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "mediaObjectWithData:UTIType:filename:transcoderUserInfo:", v7, v14, 0, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
LABEL_15:
  -[CKVideoMessageRecordingViewController setMediaObjectForSending:](self, "setMediaObjectForSending:", v16);
  -[CKVideoMessageRecordingViewController mediaExportCompletionBlock](self, "mediaExportCompletionBlock");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
    goto LABEL_19;
  if (-[CKVideoMessageRecordingViewController recording](self, "recording"))
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __93__CKVideoMessageRecordingViewController_imagePickerController_didFinishPickingMediaWithInfo___block_invoke;
    v21[3] = &unk_1E274A208;
    v21[4] = self;
    -[CKVideoMessageRecordingViewController stopRecordingWithCompletionBlock:](self, "stopRecordingWithCompletionBlock:", v21);
  }
  -[CKVideoMessageRecordingViewController mediaExportCompletionBlock](self, "mediaExportCompletionBlock");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
LABEL_19:
    -[CKVideoMessageRecordingViewController mediaExportCompletionBlock](self, "mediaExportCompletionBlock");
    v20 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v20[2]();

    -[CKVideoMessageRecordingViewController setMediaExportCompletionBlock:](self, "setMediaExportCompletionBlock:", 0);
  }

LABEL_21:
}

uint64_t __93__CKVideoMessageRecordingViewController_imagePickerController_didFinishPickingMediaWithInfo___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "send");
}

- (void)_cleanupCamera
{
  void *v3;
  UIImagePickerController *cameraViewController;
  id v5;

  if (-[UIImagePickerController isViewLoaded](self->_cameraViewController, "isViewLoaded"))
  {
    -[UIImagePickerController view](self->_cameraViewController, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeFromSuperview");

  }
  -[CKVideoMessageRecordingViewController removeChildViewController:](self, "removeChildViewController:", self->_cameraViewController);
  -[UIImagePickerController setDelegate:](self->_cameraViewController, "setDelegate:", 0);
  cameraViewController = self->_cameraViewController;
  self->_cameraViewController = 0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

}

- (void)dealloc
{
  void *v3;
  UIView *presentationView;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:", self);
  -[CKActionMenuController setDelegate:](self->_videoActionMenuController, "setDelegate:", 0);
  -[CKVideoMessageRecordingViewController _cleanupCamera](self, "_cleanupCamera");
  presentationView = self->_presentationView;
  self->_presentationView = 0;

  v5.receiver = self;
  v5.super_class = (Class)CKVideoMessageRecordingViewController;
  -[CKVideoMessageRecordingViewController dealloc](&v5, sel_dealloc);
}

- (CKVideoMessageRecordingViewControllerDelegate)videoMessageDelegate
{
  return (CKVideoMessageRecordingViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_videoMessageDelegate);
}

- (void)setVideoMessageDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_videoMessageDelegate, a3);
}

- (UIView)topBackgroundView
{
  return self->_topBackgroundView;
}

- (void)setTopBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_topBackgroundView, a3);
}

- (CKRecordingElapsedTimeView)timerView
{
  return self->_timerView;
}

- (void)setTimerView:(id)a3
{
  objc_storeStrong((id *)&self->_timerView, a3);
}

- (CKActionMenuController)videoActionMenuController
{
  return self->_videoActionMenuController;
}

- (void)setVideoActionMenuController:(id)a3
{
  objc_storeStrong((id *)&self->_videoActionMenuController, a3);
}

- (CKActionMenuItem)photoMenuItem
{
  return self->_photoMenuItem;
}

- (void)setPhotoMenuItem:(id)a3
{
  objc_storeStrong((id *)&self->_photoMenuItem, a3);
}

- (UIButton)swapCameraButton
{
  return self->_swapCameraButton;
}

- (void)setSwapCameraButton:(id)a3
{
  objc_storeStrong((id *)&self->_swapCameraButton, a3);
}

- (BOOL)recording
{
  return self->_recording;
}

- (void)setRecording:(BOOL)a3
{
  self->_recording = a3;
}

- (BOOL)sending
{
  return self->_sending;
}

- (void)setSending:(BOOL)a3
{
  self->_sending = a3;
}

- (BOOL)canceled
{
  return self->_canceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

- (BOOL)triedToRecord
{
  return self->_triedToRecord;
}

- (void)setTriedToRecord:(BOOL)a3
{
  self->_triedToRecord = a3;
}

- (unint64_t)enableCancel
{
  return self->_enableCancel;
}

- (void)setEnableCancel:(unint64_t)a3
{
  self->_enableCancel = a3;
}

- (CKMediaObject)mediaObjectForSending
{
  return self->_mediaObjectForSending;
}

- (void)setMediaObjectForSending:(id)a3
{
  objc_storeStrong((id *)&self->_mediaObjectForSending, a3);
}

- (NSError)captureError
{
  return self->_captureError;
}

- (void)setCaptureError:(id)a3
{
  objc_storeStrong((id *)&self->_captureError, a3);
}

- (id)mediaExportCompletionBlock
{
  return self->_mediaExportCompletionBlock;
}

- (void)setMediaExportCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1064);
}

- (UIImagePickerController)cameraViewController
{
  return self->_cameraViewController;
}

- (void)setCameraViewController:(id)a3
{
  objc_storeStrong((id *)&self->_cameraViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraViewController, 0);
  objc_storeStrong(&self->_mediaExportCompletionBlock, 0);
  objc_storeStrong((id *)&self->_captureError, 0);
  objc_storeStrong((id *)&self->_mediaObjectForSending, 0);
  objc_storeStrong((id *)&self->_swapCameraButton, 0);
  objc_storeStrong((id *)&self->_photoMenuItem, 0);
  objc_storeStrong((id *)&self->_videoActionMenuController, 0);
  objc_storeStrong((id *)&self->_timerView, 0);
  objc_storeStrong((id *)&self->_topBackgroundView, 0);
  objc_destroyWeak((id *)&self->_videoMessageDelegate);
  objc_storeStrong((id *)&self->_overlayWindow, 0);
  objc_storeStrong((id *)&self->_presentationView, 0);
}

@end

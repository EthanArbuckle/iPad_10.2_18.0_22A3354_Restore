@implementation AXGestureRecorderMainViewController

- (void)_commonInit
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;

  v3 = (void *)objc_opt_new();
  -[AXGestureRecorderMainViewController setStyleProvider:](self, "setStyleProvider:", v3);
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setRecorderType:", -[AXGestureRecorderMainViewController recorderType](self, "recorderType"));
  objc_msgSend(v4, "setStyleProvider:", v3);
  objc_msgSend(v4, "setDelegate:", self);
  -[AXGestureRecorderMainViewController addChildViewController:](self, "addChildViewController:", v4);
  -[AXGestureRecorderMainViewController setGestureRecorderViewController:](self, "setGestureRecorderViewController:", v4);
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0DC4868];
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __50__AXGestureRecorderMainViewController__commonInit__block_invoke;
  v12 = &unk_1E76AB680;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v5, "addObserverForName:object:queue:usingBlock:", v7, 0, v6, &v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXGestureRecorderMainViewController setAppDidResignActiveNotificationHandlerToken:](self, "setAppDidResignActiveNotificationHandlerToken:", v8, v9, v10, v11, v12);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __50__AXGestureRecorderMainViewController__commonInit__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setDisableSystemGesturesAssertion:", 0);

}

- (AXGestureRecorderMainViewController)init
{
  return -[AXGestureRecorderMainViewController initWithType:](self, "initWithType:", 0);
}

- (AXGestureRecorderMainViewController)initWithType:(int64_t)a3
{
  AXGestureRecorderMainViewController *v4;
  AXGestureRecorderMainViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AXGestureRecorderMainViewController;
  v4 = -[AXGestureRecorderMainViewController init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    -[AXGestureRecorderMainViewController setRecorderType:](v4, "setRecorderType:", a3);
    -[AXGestureRecorderMainViewController _commonInit](v5, "_commonInit");
  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXGestureRecorderMainViewController appDidResignActiveNotificationHandlerToken](self, "appDidResignActiveNotificationHandlerToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", v4);

  -[AXGestureRecorderMainViewController _releaseOutlets](self, "_releaseOutlets");
  -[AXGestureRecorderViewController setDelegate:](self->_gestureRecorderViewController, "setDelegate:", 0);
  v5.receiver = self;
  v5.super_class = (Class)AXGestureRecorderMainViewController;
  -[AXGestureRecorderMainViewController dealloc](&v5, sel_dealloc);
}

- (void)loadView
{
  id v3;
  void *v4;
  void *v5;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v10;
  double v11;
  double v12;
  AXGestureRecorderControlsView *v13;
  UIView *v14;
  UIView *topView;
  void *v16;
  UIView *v17;
  UIView *lineView;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  double v29;
  double v30;
  double v31;
  id v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
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
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  _QWORD v64[6];
  CGRect v65;
  CGRect v66;

  v64[4] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0DC3F10]);
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v5 = (void *)objc_msgSend(v3, "initWithFrame:");

  objc_msgSend(v5, "setAutoresizingMask:", 18);
  objc_msgSend(v5, "setAutoresizesSubviews:", 1);
  -[AXGestureRecorderMainViewController setView:](self, "setView:", v5);
  objc_msgSend(v5, "bounds");
  x = v65.origin.x;
  y = v65.origin.y;
  width = v65.size.width;
  height = v65.size.height;
  v10 = CGRectGetWidth(v65);
  v66.origin.x = x;
  v66.origin.y = y;
  v66.size.width = width;
  v66.size.height = height;
  v11 = CGRectGetHeight(v66);
  if (-[AXGestureRecorderMainViewController recorderType](self, "recorderType") != 2)
  {
    +[AXGestureRecorderControlsView defaultHeight](AXGestureRecorderControlsView, "defaultHeight");
    v13 = -[AXGestureRecorderControlsView initWithFrame:]([AXGestureRecorderControlsView alloc], "initWithFrame:", 0.0, v11 - v12, v10, v12);
    -[AXGestureRecorderControlsView setAutoresizingMask:](v13, "setAutoresizingMask:", 10);
    -[AXGestureRecorderControlsView setDelegate:](v13, "setDelegate:", self);
    objc_msgSend(v5, "addSubview:", v13);
    -[AXGestureRecorderMainViewController setControlsView:](self, "setControlsView:", v13);

  }
  v14 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  topView = self->_topView;
  self->_topView = v14;

  objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemGroupedBackgroundColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_topView, "setBackgroundColor:", v16);

  v17 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  lineView = self->_lineView;
  self->_lineView = v17;

  objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_lineView, "setBackgroundColor:", v19);

  objc_msgSend(v5, "addSubview:", self->_topView);
  -[UIView addSubview:](self->_topView, "addSubview:", self->_lineView);
  -[AXGestureRecorderMainViewController gestureRecorderViewController](self, "gestureRecorderViewController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "gestureRecorderView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "setFrame:", 0.0, 0.0, v10, v11);
  objc_msgSend(v21, "setAutoresizingMask:", 18);
  v62 = v21;
  objc_msgSend(v5, "insertSubview:atIndex:", v21, 0);
  -[AXGestureRecorderMainViewController _defaultInstructionalText](self, "_defaultInstructionalText");
  v22 = objc_claimAutoreleasedReturnValue();
  -[AXGestureRecorderMainViewController styleProvider](self, "styleProvider");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "instructionsLabelFont");
  v24 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "instructionsLabelTextColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "instructionsLabelBackgroundColor");
  v26 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "instructionsLabelShadowColor");
  v27 = objc_claimAutoreleasedReturnValue();
  v60 = v23;
  objc_msgSend(v23, "instructionsLabelShadowOffset");
  v29 = v28;
  v31 = v30;
  v32 = objc_alloc(MEMORY[0x1E0DC3990]);
  v33 = (void *)objc_msgSend(v32, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v33, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v59 = (void *)v24;
  objc_msgSend(v33, "setFont:", v24);
  objc_msgSend(v33, "setAdjustsFontSizeToFitWidth:", 1);
  v58 = v25;
  objc_msgSend(v33, "setTextColor:", v25);
  v57 = (void *)v26;
  objc_msgSend(v33, "setBackgroundColor:", v26);
  v56 = (void *)v27;
  objc_msgSend(v33, "setShadowColor:", v27);
  objc_msgSend(v33, "setShadowOffset:", v29, v31);
  v61 = (void *)v22;
  objc_msgSend(v33, "setText:", v22);
  objc_msgSend(v33, "setTextAlignment:", 1);
  objc_msgSend(v33, "setLineBreakMode:", 4);
  objc_msgSend(v33, "setNumberOfLines:", 0);
  objc_msgSend(v33, "setUserInteractionEnabled:", 0);
  objc_msgSend(v33, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(v33, "setIsAccessibilityElement:", 0);
  objc_msgSend(v5, "addSubview:", v33);
  -[AXGestureRecorderMainViewController setInstructionsLabel:](self, "setInstructionsLabel:", v33);
  -[AXGestureRecorderMainViewController styleProvider](self, "styleProvider");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "instructionsLabelHorizontalInset");
  v36 = v35;

  objc_msgSend(v5, "safeAreaLayoutGuide");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v33, "leadingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "leadingAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v38;
  objc_msgSend(v38, "constraintEqualToAnchor:constant:", v36);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v64[0] = v53;
  objc_msgSend(v37, "trailingAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "trailingAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v39;
  objc_msgSend(v39, "constraintEqualToAnchor:constant:", v36);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v64[1] = v50;
  objc_msgSend(v33, "topAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "topAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v40;
  objc_msgSend(v40, "constraintEqualToAnchor:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v64[2] = v42;
  objc_msgSend(v33, "bottomAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXGestureRecorderMainViewController controlsView](self, "controlsView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = v5;
  if (v44)
  {
    -[AXGestureRecorderMainViewController controlsView](self, "controlsView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "topAnchor");
  }
  else
  {
    objc_msgSend(v37, "bottomAnchor");
  }
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v64[3] = v46;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 4);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "activateConstraints:", v47);

  if (v44)
  {

    v45 = v25;
  }

}

- (void)viewDidLoad
{
  void *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)AXGestureRecorderMainViewController;
  -[AXGestureRecorderMainViewController viewDidLoad](&v16, sel_viewDidLoad);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancelButtonTapped_);
  if (-[AXGestureRecorderMainViewController recorderType](self, "recorderType") == 2)
    v4 = CFSTR("ChoosePointNavControllerTitle");
  else
    v4 = CFSTR("CustomGesturesNavControllerTitle");
  AXUILocalizedStringForKey(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXGestureRecorderMainViewController setTitle:](self, "setTitle:", v5);

  -[AXGestureRecorderMainViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLeftBarButtonItem:", v3);

  if (-[AXGestureRecorderMainViewController recorderType](self, "recorderType") != 2)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 3, self, sel__saveButtonTapped_);
    objc_msgSend(v7, "setEnabled:", 0);
    -[AXGestureRecorderMainViewController navigationItem](self, "navigationItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRightBarButtonItem:", v7);

    -[AXGestureRecorderMainViewController setSaveButton:](self, "setSaveButton:", v7);
  }
  -[AXGestureRecorderMainViewController _setLeftButtonIdentifier:enabled:rightButtonIdentifier:enabled:animate:completion:](self, "_setLeftButtonIdentifier:enabled:rightButtonIdentifier:enabled:animate:completion:", 3, 0, 2, 0, 0, &__block_literal_global_3);
  switch(-[AXGestureRecorderMainViewController recorderType](self, "recorderType"))
  {
    case 0:
      -[AXGestureRecorderMainViewController controlsView](self, "controlsView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setMiddleButton:", 0);
      goto LABEL_13;
    case 1:
    case 3:
      -[AXGestureRecorderMainViewController controlsView](self, "controlsView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "makeButton");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      AXUILocalizedStringForKey(CFSTR("CustomGesturesHideControls"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setTitle:forState:", v11, 0);

      objc_msgSend(v10, "addTarget:action:forControlEvents:", self, sel__hideChromeButtonTapped_, 64);
      -[AXGestureRecorderMainViewController controlsView](self, "controlsView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setMiddleButton:", v10);
      goto LABEL_12;
    case 2:
      -[AXGestureRecorderMainViewController controlsView](self, "controlsView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
        _AXAssert();
      v14 = objc_alloc(MEMORY[0x1E0DC34F0]);
      AXUILocalizedStringForKey(CFSTR("CustomGesturesHideControls"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v14, "initWithTitle:style:target:action:", v15, 0, self, sel__hideChromeButtonTapped_);

      -[AXGestureRecorderMainViewController navigationItem](self, "navigationItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setRightBarButtonItem:", v10);
LABEL_12:

LABEL_13:
      break;
    default:
      break;
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AXGestureRecorderMainViewController;
  -[AXGestureRecorderMainViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  objc_msgSend(MEMORY[0x1E0CF4E60], "assertionWithType:identifier:", *MEMORY[0x1E0CF49C0], CFSTR("AST Gesture Recorder"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXGestureRecorderMainViewController setDisableSystemGesturesAssertion:](self, "setDisableSystemGesturesAssertion:", v4);

  -[AXGestureRecorderMainViewController _reset](self, "_reset");
  -[AXGestureRecorderMainViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutSubviews");

}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AXGestureRecorderMainViewController;
  -[AXGestureRecorderMainViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[AXGestureRecorderMainViewController setDisableSystemGesturesAssertion:](self, "setDisableSystemGesturesAssertion:", 0);
}

- (BOOL)_ignoreAppSupportedOrientations
{
  return 1;
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
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
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)AXGestureRecorderMainViewController;
  -[AXGestureRecorderMainViewController viewDidLayoutSubviews](&v20, sel_viewDidLayoutSubviews);
  -[AXGestureRecorderMainViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5;

  -[AXGestureRecorderMainViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeAreaLayoutGuide");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layoutFrame");
  -[UIView setFrame:](self->_topView, "setFrame:", 0.0, 0.0, v6, v9);

  -[UIView bounds](self->_topView, "bounds");
  v11 = v10;
  -[UIView bounds](self->_topView, "bounds");
  v13 = v12;
  -[UIView bounds](self->_topView, "bounds");
  v15 = v13 + v14 + -1.0;
  -[UIView bounds](self->_topView, "bounds");
  v17 = v16;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "scale");
  -[UIView setFrame:](self->_lineView, "setFrame:", v11, v15, v17, 1.0 / v19);

}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AXGestureRecorderMainViewController;
  -[AXGestureRecorderMainViewController viewWillTransitionToSize:withTransitionCoordinator:](&v6, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  -[AXGestureRecorderMainViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutSubviews");

}

- (void)_saveButtonTapped:(id)a3
{
  int64_t v4;

  v4 = -[AXGestureRecorderMainViewController recorderType](self, "recorderType", a3);
  switch(v4)
  {
    case 3:
      goto LABEL_4;
    case 1:
      -[AXGestureRecorderMainViewController _saveReplayableGesture](self, "_saveReplayableGesture");
      break;
    case 0:
LABEL_4:
      -[AXGestureRecorderMainViewController _saveWithMessage:](self, "_saveWithMessage:", 0);
      return;
    default:
      -[AXGestureRecorderMainViewController recorderType](self, "recorderType");
      _AXAssert();
      break;
  }
}

- (void)_unhideChrome
{
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  _QWORD v6[5];

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__unhideChrome, 0);
  -[AXGestureRecorderMainViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNavigationBarHidden:animated:", 0, 1);

  v4 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__AXGestureRecorderMainViewController__unhideChrome__block_invoke;
  v6[3] = &unk_1E76AB330;
  v6[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v6, 0.25);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __52__AXGestureRecorderMainViewController__unhideChrome__block_invoke_2;
  v5[3] = &unk_1E76AB330;
  v5[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v5, 0.25);
  UIAccessibilityPostNotification(*MEMORY[0x1E0DC4578], 0);
}

void __52__AXGestureRecorderMainViewController__unhideChrome__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "controlsView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

void __52__AXGestureRecorderMainViewController__unhideChrome__block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "instructionsLabel");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

- (void)_hideChrome
{
  void *v3;
  _QWORD v4[5];

  -[AXGestureRecorderMainViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNavigationBarHidden:animated:", 1, 1);

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__AXGestureRecorderMainViewController__hideChrome__block_invoke;
  v4[3] = &unk_1E76AB330;
  v4[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v4, 0.25);
  UIAccessibilityPostNotification(*MEMORY[0x1E0DC4578], 0);
}

void __50__AXGestureRecorderMainViewController__hideChrome__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "controlsView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

- (void)_hideChromeButtonTapped:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  _QWORD v11[5];

  v4 = (void *)MEMORY[0x1E0CB3940];
  AXUILocalizedStringForKey(CFSTR("CustomHideChromeInstructionsFormat"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringWithFormat:", v5, 10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXGestureRecorderMainViewController instructionsLabel](self, "instructionsLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v6);

  -[AXGestureRecorderMainViewController instructionsLabel](self, "instructionsLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "alpha");
  v10 = v9;

  if (v10 != 1.0)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __63__AXGestureRecorderMainViewController__hideChromeButtonTapped___block_invoke;
    v11[3] = &unk_1E76AB330;
    v11[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v11, 0.25);
  }
  -[AXGestureRecorderMainViewController _hideChrome](self, "_hideChrome");
  -[AXGestureRecorderMainViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__unhideChrome, 0, 10.0);
}

void __63__AXGestureRecorderMainViewController__hideChromeButtonTapped___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "instructionsLabel");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

- (void)_setLeftButtonIdentifier:(unint64_t)a3 enabled:(BOOL)a4 rightButtonIdentifier:(unint64_t)a5 enabled:(BOOL)a6 animate:(BOOL)a7 completion:(id)a8
{
  _BOOL8 v8;
  _BOOL8 v10;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  unsigned int v19;
  unsigned int v20;

  v8 = a6;
  v10 = a4;
  v13 = a8;
  -[AXGestureRecorderMainViewController setLeftButtonIdentifier:](self, "setLeftButtonIdentifier:", a3);
  -[AXGestureRecorderMainViewController setRightButtonIdentifier:](self, "setRightButtonIdentifier:", a5);
  v19 = 2;
  v20 = 2;
  v18 = 0;
  -[AXGestureRecorderMainViewController _getButtonPropertiesForIdentifier:enabled:color:title:](self, "_getButtonPropertiesForIdentifier:enabled:color:title:", a3, v10, &v20, &v18);
  v14 = v18;
  v17 = 0;
  -[AXGestureRecorderMainViewController _getButtonPropertiesForIdentifier:enabled:color:title:](self, "_getButtonPropertiesForIdentifier:enabled:color:title:", a5, v8, &v19, &v17);
  v15 = v17;
  -[AXGestureRecorderMainViewController controlsView](self, "controlsView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setLeftButtonColor:title:enabled:rightButtonColor:title:enabled:animationDuration:completion:", v20, v14, v10, v19, v15, v8, 0.0, v13);

}

- (void)_getButtonPropertiesForIdentifier:(unint64_t)a3 enabled:(BOOL)a4 color:(int *)a5 title:(id *)a6
{
  int v7;
  char v8;
  __CFString *v9;
  id v10;

  switch(a3)
  {
    case 1uLL:
      v8 = 0;
      if (a4)
        v7 = 2;
      else
        v7 = 1;
      v9 = CFSTR("RE_RECORD");
      if (a5)
        goto LABEL_12;
      break;
    case 2uLL:
    case 4uLL:
      v7 = 0;
      v8 = 0;
      v9 = CFSTR("Stop");
      if (a5)
        goto LABEL_12;
      break;
    case 3uLL:
      v8 = 0;
      v9 = CFSTR("Play");
      v7 = 1;
      if (a5)
        goto LABEL_12;
      break;
    default:
      v7 = 0;
      v9 = 0;
      v8 = 1;
      if (a5)
LABEL_12:
        *a5 = v7;
      break;
  }
  if (a6)
  {
    if ((v8 & 1) != 0)
    {
      v10 = 0;
    }
    else
    {
      AXUILocalizedStringForKey(v9);
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    *a6 = v10;
  }
}

- (void)_updateProgressView:(id)a3
{
  double Current;
  double v5;
  float v6;
  void *v7;
  void *v8;
  double v9;
  id v10;

  Current = CFAbsoluteTimeGetCurrent();
  -[AXGestureRecorderMainViewController gestureRecordingDidStartTimeInterval](self, "gestureRecordingDidStartTimeInterval");
  v6 = (Current - v5) / 60.0;
  if (v6 >= 1.0)
  {
    -[AXGestureRecorderMainViewController _manageDisplayLinkManager:](self, "_manageDisplayLinkManager:", 0);
    if (-[AXGestureRecorderMainViewController _isForRealTimeGesture](self, "_isForRealTimeGesture"))
    {
      -[AXGestureRecorderMainViewController gestureRecorderViewController](self, "gestureRecorderViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "freezeAllDynamicFingerPaths");

      -[AXGestureRecorderMainViewController gestureRecorderViewController](self, "gestureRecorderViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "preventFurtherRecording");

    }
    v6 = 1.0;
  }
  -[AXGestureRecorderMainViewController controlsView](self, "controlsView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v9 = v6;
  objc_msgSend(v10, "setProgress:", v9);

}

- (void)_clearProgressView
{
  void *v3;
  double v4;

  -[AXGestureRecorderMainViewController controlsView](self, "controlsView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = 0;
  objc_msgSend(v3, "setProgress:", v4);

  -[AXGestureRecorderMainViewController _manageDisplayLinkManager:](self, "_manageDisplayLinkManager:", 0);
}

- (void)_enterWaitingMode
{
  void *v3;

  -[AXGestureRecorderMainViewController _setLeftButtonIdentifier:enabled:rightButtonIdentifier:enabled:animate:completion:](self, "_setLeftButtonIdentifier:enabled:rightButtonIdentifier:enabled:animate:completion:", 3, 1, 1, 1, 1, &__block_literal_global_233);
  -[AXGestureRecorderMainViewController gestureRecorderViewController](self, "gestureRecorderViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preventFurtherRecording");

  -[AXGestureRecorderMainViewController _clearProgressView](self, "_clearProgressView");
}

- (void)_enterReplayMode
{
  void *v3;
  double v4;
  id v5;

  -[AXGestureRecorderMainViewController setInReplayMode:](self, "setInReplayMode:", 1);
  -[AXGestureRecorderMainViewController _setLeftButtonIdentifier:enabled:rightButtonIdentifier:enabled:animate:completion:](self, "_setLeftButtonIdentifier:enabled:rightButtonIdentifier:enabled:animate:completion:", 3, 0, 1, 0, 1, &__block_literal_global_234);
  -[AXGestureRecorderMainViewController controlsView](self, "controlsView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = 0;
  objc_msgSend(v3, "setProgress:", v4);

  -[AXGestureRecorderMainViewController setGestureRecordingDidStartTimeInterval:](self, "setGestureRecordingDidStartTimeInterval:", CFAbsoluteTimeGetCurrent());
  -[AXGestureRecorderMainViewController _manageDisplayLinkManager:](self, "_manageDisplayLinkManager:", 1);
  -[AXGestureRecorderMainViewController gestureRecorderViewController](self, "gestureRecorderViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "replayRecordedGesture");

}

- (void)_releaseOutlets
{
  -[AXGestureRecorderMainViewController setControlsView:](self, "setControlsView:", 0);
  -[AXGestureRecorderMainViewController setInstructionsLabel:](self, "setInstructionsLabel:", 0);
  -[AXGestureRecorderMainViewController setSaveButton:](self, "setSaveButton:", 0);
}

- (void)_reset
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[AXGestureRecorderMainViewController saveButton](self, "saveButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEnabled:", 0);

  -[AXGestureRecorderMainViewController _defaultInstructionalText](self, "_defaultInstructionalText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXGestureRecorderMainViewController instructionsLabel](self, "instructionsLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

  -[AXGestureRecorderMainViewController instructionsLabel](self, "instructionsLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", 1.0);

  -[AXGestureRecorderMainViewController _setLeftButtonIdentifier:enabled:rightButtonIdentifier:enabled:animate:completion:](self, "_setLeftButtonIdentifier:enabled:rightButtonIdentifier:enabled:animate:completion:", 3, 0, 2, 0, 0, &__block_literal_global_235);
  -[AXGestureRecorderMainViewController controlsView](self, "controlsView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = 0;
  objc_msgSend(v7, "setProgress:", v8);

  -[AXGestureRecorderMainViewController gestureRecorderViewController](self, "gestureRecorderViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deleteAllFingerPaths");

  -[AXGestureRecorderMainViewController gestureRecorderViewController](self, "gestureRecorderViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hideStaticView");

  -[AXGestureRecorderMainViewController gestureRecorderViewController](self, "gestureRecorderViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setNeedsLayout");

  -[AXGestureRecorderMainViewController setGestureRecordingDidStartTimeInterval:](self, "setGestureRecordingDidStartTimeInterval:", 0.0);
  -[AXGestureRecorderMainViewController _manageDisplayLinkManager:](self, "_manageDisplayLinkManager:", 0);
}

- (void)_hide
{
  -[AXGestureRecorderMainViewController _reset](self, "_reset");
  -[AXGestureRecorderMainViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, &__block_literal_global_236);
}

- (void)_saveWithMessage:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  _QWORD v16[5];
  _QWORD v17[4];
  id v18;
  AXGestureRecorderMainViewController *v19;

  v4 = (void *)MEMORY[0x1E0DC3450];
  v5 = a3;
  AXUILocalizedStringForKey(CFSTR("SaveAlertTitle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v6, v5, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0DC3448];
  AXUILocalizedStringForKey(CFSTR("CANCEL"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "actionWithTitle:style:handler:", v9, 1, &__block_literal_global_244);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addAction:", v10);
  v11 = (void *)MEMORY[0x1E0DC3448];
  AXUILocalizedStringForKey(CFSTR("SAVE"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __56__AXGestureRecorderMainViewController__saveWithMessage___block_invoke_2;
  v17[3] = &unk_1E76AB788;
  v18 = v7;
  v19 = self;
  v14 = v7;
  objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 0, v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "addAction:", v15);
  v16[0] = v13;
  v16[1] = 3221225472;
  v16[2] = __56__AXGestureRecorderMainViewController__saveWithMessage___block_invoke_4;
  v16[3] = &unk_1E76AB7B0;
  v16[4] = self;
  objc_msgSend(v14, "addTextFieldWithConfigurationHandler:", v16);
  -[AXGestureRecorderMainViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v14, 1, 0);

}

void __56__AXGestureRecorderMainViewController__saveWithMessage___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "textFields");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(a1 + 40), "_canSaveGestureWithName:", v4))
  {
    objc_msgSend(*(id *)(a1 + 40), "_didSaveGestureWithName:", v4);
    objc_msgSend(*(id *)(a1 + 40), "_reset");
  }
  else
  {
    AXPerformBlockOnMainThreadAfterDelay();
  }

}

void __56__AXGestureRecorderMainViewController__saveWithMessage___block_invoke_3(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  AXUILocalizedStringForKey(CFSTR("name.in.use"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_saveWithMessage:", v2);

}

void __56__AXGestureRecorderMainViewController__saveWithMessage___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  AXUILocalizedStringForKey(CFSTR("GestureNamePlaceholder"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPlaceholder:", v3);

  objc_msgSend(v4, "setDelegate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "setAutocapitalizationType:", 2);
  objc_msgSend(v4, "setAutocorrectionType:", 1);
  objc_msgSend(v4, "setEnablesReturnKeyAutomatically:", 1);

}

- (BOOL)_canSaveGestureWithName:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  char v8;

  v4 = a3;
  -[AXGestureRecorderMainViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[AXGestureRecorderMainViewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "gestureRecorder:canSaveGestureWithName:", self, v4);

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (void)_didSaveGestureWithName:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  id v14;

  v14 = a3;
  if (-[AXGestureRecorderMainViewController recorderType](self, "recorderType") == 3)
  {
    -[AXGestureRecorderMainViewController gestureRecorderViewController](self, "gestureRecorderViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "recordedReplayableGestureRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = objc_alloc_init(MEMORY[0x1E0CF4E90]);
      objc_msgSend(v6, "setName:", v14);
      objc_msgSend(v6, "addPointsFromReplayableGesture:", v5);
      -[AXGestureRecorderMainViewController delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_opt_respondsToSelector();

      if ((v8 & 1) != 0)
      {
        -[AXGestureRecorderMainViewController delegate](self, "delegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "gestureRecorder:saveNamedReplayableGesture:", self, v6);

      }
    }
    -[AXGestureRecorderMainViewController _hide](self, "_hide");
  }
  else
  {
    if (-[AXGestureRecorderMainViewController recorderType](self, "recorderType"))
      goto LABEL_9;
    -[AXGestureRecorderMainViewController gestureRecorderViewController](self, "gestureRecorderViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "recordedGesturePropertyListRepresentationWithName:", v14);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[AXGestureRecorderMainViewController delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_opt_respondsToSelector();

      if ((v12 & 1) != 0)
      {
        -[AXGestureRecorderMainViewController delegate](self, "delegate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "gestureRecorder:saveGestureWithPropertyListRepresentation:", self, v5);

      }
    }
  }

LABEL_9:
  -[AXGestureRecorderMainViewController _hide](self, "_hide");

}

- (void)_saveReplayableGesture
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  id v7;

  -[AXGestureRecorderMainViewController gestureRecorderViewController](self, "gestureRecorderViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recordedReplayableGestureRepresentation");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[AXGestureRecorderMainViewController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      -[AXGestureRecorderMainViewController delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "gestureRecorder:saveReplayableGesture:", self, v7);

    }
  }
  -[AXGestureRecorderMainViewController _hide](self, "_hide");

}

- (void)_savePoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  char v7;
  void *v8;

  y = a3.y;
  x = a3.x;
  -[AXGestureRecorderMainViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[AXGestureRecorderMainViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "gestureRecorder:savePoint:", self, x, y);

  }
  AXPerformBlockOnMainThreadAfterDelay();
}

uint64_t __50__AXGestureRecorderMainViewController__savePoint___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_hide");
}

- (id)_defaultInstructionalText
{
  unint64_t v2;
  void *v3;

  v2 = -[AXGestureRecorderMainViewController recorderType](self, "recorderType");
  if (v2 > 3)
  {
    v3 = 0;
  }
  else
  {
    AXUILocalizedStringForKey(off_1E76AB818[v2]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (BOOL)_isForRealTimeGesture
{
  return AXGestureRecorderTypeIsForRealTimeGesture(-[AXGestureRecorderMainViewController recorderType](self, "recorderType"));
}

- (void)_manageDisplayLinkManager:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  void *v6;

  v3 = a3;
  v5 = -[AXGestureRecorderMainViewController isDisplayLinkInEffect](self, "isDisplayLinkInEffect");
  if (v3)
  {
    if (v5)
      return;
    objc_msgSend(MEMORY[0x1E0CF4E70], "currentDisplayLinkManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addTarget:selector:", self, sel__updateProgressView_);
  }
  else
  {
    if (!v5)
      return;
    objc_msgSend(MEMORY[0x1E0CF4E70], "currentDisplayLinkManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeTarget:selector:", self, sel__updateProgressView_);
  }

  -[AXGestureRecorderMainViewController setIsDisplayLinkInEffect:](self, "setIsDisplayLinkInEffect:", v3);
}

- (double)maximumDurationOfRecordedGestureForGestureRecorderViewController:(id)a3
{
  return 60.0;
}

- (void)gestureRecorderViewController:(id)a3 didStartRecordingAtomicFingerPathAtPoint:(CGPoint)a4
{
  double y;
  double x;
  void *v7;
  double v8;
  void *v9;
  double v10;
  _QWORD v11[5];

  y = a4.y;
  x = a4.x;
  if (-[AXGestureRecorderMainViewController recorderType](self, "recorderType", a3) == 2)
  {
    -[AXGestureRecorderMainViewController _savePoint:](self, "_savePoint:", x, y);
    -[AXGestureRecorderMainViewController _enterWaitingMode](self, "_enterWaitingMode");
  }
  else
  {
    -[AXGestureRecorderMainViewController saveButton](self, "saveButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEnabled:", 1);

    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __110__AXGestureRecorderMainViewController_gestureRecorderViewController_didStartRecordingAtomicFingerPathAtPoint___block_invoke;
    v11[3] = &unk_1E76AB330;
    v11[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v11, 0.25);
    if (-[AXGestureRecorderMainViewController rightButtonIdentifier](self, "rightButtonIdentifier") == 2)
      -[AXGestureRecorderMainViewController _setLeftButtonIdentifier:enabled:rightButtonIdentifier:enabled:animate:completion:](self, "_setLeftButtonIdentifier:enabled:rightButtonIdentifier:enabled:animate:completion:", 3, 0, 2, 1, 1, &__block_literal_global_272);
    if (!-[AXGestureRecorderMainViewController recorderType](self, "recorderType")
      || (-[AXGestureRecorderMainViewController gestureRecordingDidStartTimeInterval](self, "gestureRecordingDidStartTimeInterval"), v8 == 0.0))
    {
      -[AXGestureRecorderMainViewController controlsView](self, "controlsView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v10) = 0;
      objc_msgSend(v9, "setProgress:", v10);

      -[AXGestureRecorderMainViewController setGestureRecordingDidStartTimeInterval:](self, "setGestureRecordingDidStartTimeInterval:", CFAbsoluteTimeGetCurrent());
    }
    -[AXGestureRecorderMainViewController _manageDisplayLinkManager:](self, "_manageDisplayLinkManager:", 1);
  }
}

void __110__AXGestureRecorderMainViewController_gestureRecorderViewController_didStartRecordingAtomicFingerPathAtPoint___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "instructionsLabel");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

- (void)gestureRecorderViewControllerDidStopRecordingAtomicFingerPath:(id)a3
{
  void *v4;
  char v5;

  if (!-[AXGestureRecorderMainViewController _isForRealTimeGesture](self, "_isForRealTimeGesture", a3))
  {
    objc_msgSend(MEMORY[0x1E0CF4E70], "currentDisplayLinkManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isPaused");

    if ((v5 & 1) == 0)
      -[AXGestureRecorderMainViewController _clearProgressView](self, "_clearProgressView");
  }
}

- (void)gestureRecorderViewControllerDidFinishReplayingRecordedGesture:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  v4 = a3;
  -[AXGestureRecorderMainViewController _clearProgressView](self, "_clearProgressView");
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __102__AXGestureRecorderMainViewController_gestureRecorderViewControllerDidFinishReplayingRecordedGesture___block_invoke;
  v5[3] = &unk_1E76AB7F8;
  objc_copyWeak(&v6, &location);
  -[AXGestureRecorderMainViewController _setLeftButtonIdentifier:enabled:rightButtonIdentifier:enabled:animate:completion:](self, "_setLeftButtonIdentifier:enabled:rightButtonIdentifier:enabled:animate:completion:", 3, 1, 1, 1, 1, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

void __102__AXGestureRecorderMainViewController_gestureRecorderViewControllerDidFinishReplayingRecordedGesture___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_manageDisplayLinkManager:", 0);

}

- (BOOL)isChromeVisibleForGestureRecorderViewController:(id)a3
{
  void *v3;
  char v4;

  -[AXGestureRecorderMainViewController navigationController](self, "navigationController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isNavigationBarHidden") ^ 1;

  return v4;
}

- (void)gestureRecorderViewController:(id)a3 setChromeVisible:(BOOL)a4
{
  if (a4)
    -[AXGestureRecorderMainViewController _unhideChrome](self, "_unhideChrome", a3);
  else
    -[AXGestureRecorderMainViewController _hideChrome](self, "_hideChrome", a3);
}

- (void)gestureRecorderControlsView:(id)a3 buttonTappedAtIndex:(unint64_t)a4
{
  id v6;
  unint64_t v7;
  BOOL v8;
  id v9;

  v6 = a3;
  if (a4 == 1)
  {
    v9 = v6;
    v7 = -[AXGestureRecorderMainViewController rightButtonIdentifier](self, "rightButtonIdentifier");
  }
  else
  {
    if (a4)
      goto LABEL_13;
    v9 = v6;
    v7 = -[AXGestureRecorderMainViewController leftButtonIdentifier](self, "leftButtonIdentifier");
  }
  if (v7 == 1)
  {
    -[AXGestureRecorderMainViewController _reset](self, "_reset");
  }
  else if (v7 == 3)
  {
    -[AXGestureRecorderMainViewController _enterReplayMode](self, "_enterReplayMode");
  }
  else
  {
    v8 = v7 == 2;
    v6 = v9;
    if (!v8)
      goto LABEL_13;
    -[AXGestureRecorderMainViewController _enterWaitingMode](self, "_enterWaitingMode");
  }
  v6 = v9;
LABEL_13:

}

- (AXGestureRecorderStyleProvider)styleProvider
{
  return self->_styleProvider;
}

- (void)setStyleProvider:(id)a3
{
  objc_storeStrong((id *)&self->_styleProvider, a3);
}

- (AXGestureRecorderViewController)gestureRecorderViewController
{
  return self->_gestureRecorderViewController;
}

- (void)setGestureRecorderViewController:(id)a3
{
  objc_storeStrong((id *)&self->_gestureRecorderViewController, a3);
}

- (AXGestureRecorderControlsView)controlsView
{
  return self->_controlsView;
}

- (void)setControlsView:(id)a3
{
  objc_storeStrong((id *)&self->_controlsView, a3);
}

- (UILabel)instructionsLabel
{
  return self->_instructionsLabel;
}

- (void)setInstructionsLabel:(id)a3
{
  objc_storeStrong((id *)&self->_instructionsLabel, a3);
}

- (UIBarButtonItem)saveButton
{
  return self->_saveButton;
}

- (void)setSaveButton:(id)a3
{
  objc_storeStrong((id *)&self->_saveButton, a3);
}

- (unint64_t)leftButtonIdentifier
{
  return self->_leftButtonIdentifier;
}

- (void)setLeftButtonIdentifier:(unint64_t)a3
{
  self->_leftButtonIdentifier = a3;
}

- (unint64_t)rightButtonIdentifier
{
  return self->_rightButtonIdentifier;
}

- (void)setRightButtonIdentifier:(unint64_t)a3
{
  self->_rightButtonIdentifier = a3;
}

- (double)gestureRecordingDidStartTimeInterval
{
  return self->_gestureRecordingDidStartTimeInterval;
}

- (void)setGestureRecordingDidStartTimeInterval:(double)a3
{
  self->_gestureRecordingDidStartTimeInterval = a3;
}

- (BOOL)isInReplayMode
{
  return self->_inReplayMode;
}

- (void)setInReplayMode:(BOOL)a3
{
  self->_inReplayMode = a3;
}

- (AXGestureRecorderMainViewControllerDelegate)delegate
{
  return (AXGestureRecorderMainViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIView)topView
{
  return self->_topView;
}

- (void)setTopView:(id)a3
{
  objc_storeStrong((id *)&self->_topView, a3);
}

- (UIView)lineView
{
  return self->_lineView;
}

- (void)setLineView:(id)a3
{
  objc_storeStrong((id *)&self->_lineView, a3);
}

- (AXAssertion)disableSystemGesturesAssertion
{
  return self->_disableSystemGesturesAssertion;
}

- (void)setDisableSystemGesturesAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_disableSystemGesturesAssertion, a3);
}

- (id)appDidResignActiveNotificationHandlerToken
{
  return objc_loadWeakRetained(&self->_appDidResignActiveNotificationHandlerToken);
}

- (void)setAppDidResignActiveNotificationHandlerToken:(id)a3
{
  objc_storeWeak(&self->_appDidResignActiveNotificationHandlerToken, a3);
}

- (int64_t)recorderType
{
  return self->_recorderType;
}

- (void)setRecorderType:(int64_t)a3
{
  self->_recorderType = a3;
}

- (BOOL)isDisplayLinkInEffect
{
  return self->_isDisplayLinkInEffect;
}

- (void)setIsDisplayLinkInEffect:(BOOL)a3
{
  self->_isDisplayLinkInEffect = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_appDidResignActiveNotificationHandlerToken);
  objc_storeStrong((id *)&self->_disableSystemGesturesAssertion, 0);
  objc_storeStrong((id *)&self->_lineView, 0);
  objc_storeStrong((id *)&self->_topView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_saveButton, 0);
  objc_storeStrong((id *)&self->_instructionsLabel, 0);
  objc_storeStrong((id *)&self->_controlsView, 0);
  objc_storeStrong((id *)&self->_gestureRecorderViewController, 0);
  objc_storeStrong((id *)&self->_styleProvider, 0);
}

@end

@implementation ICDocCamImageQuadEditViewController

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ICDocCamImageQuadEditViewController;
  -[ICDocCamImageQuadEditViewController dealloc](&v4, sel_dealloc);
}

- (ICDocCamImageQuadEditViewController)initWithImage:(id)a3 quad:(id)a4 scanDataDelegate:(id)a5 orientation:(int64_t)a6 completionHandler:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  ICDocCamImageQuadEditViewController *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  ICDocCamImageQuad *quad;
  ICDocCamImageQuad *v37;
  NSObject *v38;
  ICDocCamImageQuad *v39;
  ICDocCamImageQuad *v40;
  uint64_t v41;
  ICDocCamImageQuad *initialQuad;
  uint64_t v43;
  id completionHandler;
  CAShapeLayer *v45;
  CAShapeLayer *overlayMask;
  id v47;
  UIBezierPath *v48;
  UIBezierPath *overlayMaskPath;
  double v50;
  uint64_t v51;
  UIColor *knobColor;
  objc_super v54;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v54.receiver = self;
  v54.super_class = (Class)ICDocCamImageQuadEditViewController;
  v18 = -[ICDocCamImageQuadEditViewController initWithNibName:bundle:](&v54, sel_initWithNibName_bundle_, 0, v17);

  if (!v18)
    goto LABEL_16;
  if (!v13)
  {
    v19 = os_log_create("com.apple.documentcamera", ");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[ICDocCamImageQuadEditViewController initWithImage:quad:scanDataDelegate:orientation:completionHandler:].cold.3(v19, v20, v21, v22, v23, v24, v25, v26);

    if (v16)
      goto LABEL_11;
    goto LABEL_8;
  }
  if (!v16)
  {
LABEL_8:
    v27 = os_log_create("com.apple.documentcamera", ");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      -[ICDocCamImageQuadEditViewController initWithImage:quad:scanDataDelegate:orientation:completionHandler:].cold.2(v27, v28, v29, v30, v31, v32, v33, v34);

  }
LABEL_11:
  v35 = objc_msgSend(v14, "copy");
  quad = v18->_quad;
  v18->_quad = (ICDocCamImageQuad *)v35;

  v37 = v18->_quad;
  if (!v37)
  {
    v38 = os_log_create("com.apple.documentcamera", ");
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      -[ICDocCamImageQuadEditViewController initWithImage:quad:scanDataDelegate:orientation:completionHandler:].cold.1(v38);

    +[ICDocCamImageQuad quadFromCGRect:](ICDocCamImageQuad, "quadFromCGRect:", 0.05, 0.05, 0.9, 0.9);
    v39 = (ICDocCamImageQuad *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamImageQuad flipPointsWithSourceFrame:](v39, "flipPointsWithSourceFrame:", 0.0, 0.0, 1.0, 1.0);
    v40 = v18->_quad;
    v18->_quad = v39;

    v37 = v18->_quad;
  }
  -[ICDocCamImageQuad clampQuadToRect:](v37, "clampQuadToRect:", 0.0, 0.0, 1.0, 1.0);
  v18->_orientation = a6;
  -[ICDocCamImageQuad applyOrientation:boundingBox:](v18->_quad, "applyOrientation:boundingBox:", a6, 0.0, 0.0, 1.0, 1.0);
  v41 = objc_msgSend(v14, "copy");
  initialQuad = v18->_initialQuad;
  v18->_initialQuad = (ICDocCamImageQuad *)v41;

  -[ICDocCamImageQuad clampQuadToRect:](v18->_initialQuad, "clampQuadToRect:", 0.0, 0.0, 1.0, 1.0);
  -[ICDocCamImageQuad applyOrientation:boundingBox:](v18->_initialQuad, "applyOrientation:boundingBox:", v18->_orientation, 0.0, 0.0, 1.0, 1.0);
  objc_storeStrong((id *)&v18->_image, a3);
  v43 = objc_msgSend(v16, "copy");
  completionHandler = v18->_completionHandler;
  v18->_completionHandler = (id)v43;

  v18->_invisibleButtonContainer = 0;
  v45 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x24BDE5758]);
  overlayMask = v18->_overlayMask;
  v18->_overlayMask = v45;

  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v47 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CAShapeLayer setFillColor:](v18->_overlayMask, "setFillColor:", objc_msgSend(v47, "CGColor"));

  v48 = (UIBezierPath *)objc_alloc_init(MEMORY[0x24BDF6870]);
  overlayMaskPath = v18->_overlayMaskPath;
  v18->_overlayMaskPath = v48;

  objc_storeStrong((id *)&v18->_scanDataDelegate, a5);
  v18->_shouldAdjustForApectFitIfNecessary = 1;
  -[ICDocCamImageQuadEditOverlay knobHeight](v18->_overlay, "knobHeight");
  v18->_knobHeight = v50;
  -[ICDocCamImageQuadEditOverlay knobColor](v18->_overlay, "knobColor");
  v51 = objc_claimAutoreleasedReturnValue();
  knobColor = v18->_knobColor;
  v18->_knobColor = (UIColor *)v51;

  v18->_didPressSave = 0;
  v18->_didCallCompletion = 0;
  -[ICDocCamImageQuadEditViewController setModalPresentationStyle:](v18, "setModalPresentationStyle:", 0);
LABEL_16:

  return v18;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  id v47;
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
  objc_super v59;
  _QWORD v60[5];

  v60[3] = *MEMORY[0x24BDAC8D0];
  v59.receiver = self;
  v59.super_class = (Class)ICDocCamImageQuadEditViewController;
  -[ICDocCamImageQuadEditViewController viewDidLoad](&v59, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BDF6950], "dc_editBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamImageQuadEditViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[ICDocCamImageQuadEditViewController setUpImageView](self, "setUpImageView");
  v5 = objc_alloc(MEMORY[0x24BDF6F90]);
  -[ICDocCamImageQuadEditViewController imageView](self, "imageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v7 = (void *)objc_msgSend(v5, "initWithFrame:");

  -[ICDocCamImageQuadEditViewController backgroundImageView](self, "backgroundImageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v8);

  -[ICDocCamImageQuadEditViewController imageView](self, "imageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v7;
  objc_msgSend(v7, "addSubview:", v9);

  objc_msgSend(MEMORY[0x24BDF6950], "dc_barColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamImageQuadEditViewController buttonContainer](self, "buttonContainer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBackgroundColor:", v10);

  -[ICDocCamImageQuadEditViewController scrollView](self, "scrollView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setMinimumZoomScale:", 0.01);

  -[ICDocCamImageQuadEditViewController scrollView](self, "scrollView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setMaximumZoomScale:", 20.0);

  -[ICDocCamImageQuadEditViewController imageView](self, "imageView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bounds");
  v16 = v15;
  v18 = v17;
  -[ICDocCamImageQuadEditViewController scrollView](self, "scrollView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setContentSize:", v16, v18);

  -[ICDocCamImageQuadEditViewController scrollView](self, "scrollView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addSubview:", v7);

  -[ICDocCamImageQuadEditViewController scrollView](self, "scrollView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setDelegate:", self);

  -[ICDocCamImageQuadEditViewController quad](self, "quad");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamImageQuadEditViewController overlay](self, "overlay");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setQuad:", v22);

  -[ICDocCamImageQuadEditViewController overlay](self, "overlay");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setDelegate:", self);

  -[ICDocCamImageQuadEditViewController overlay](self, "overlay");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamImageQuadEditViewController image](self, "image");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setImage:orientation:", v26, -[ICDocCamImageQuadEditViewController orientation](self, "orientation"));

  -[ICDocCamImageQuadEditViewController buttonContainerHeightConstraint](self, "buttonContainerHeightConstraint");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constant");
  v29 = v28;

  -[ICDocCamImageQuadEditViewController buttonContainer](self, "buttonContainer");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "topAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamImageQuadEditViewController view](self, "view");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "safeAreaLayoutGuide");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "bottomAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "constraintEqualToAnchor:constant:", v53, -v29);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v60[0] = v52;
  -[ICDocCamImageQuadEditViewController buttonContainer](self, "buttonContainer");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "leadingAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamImageQuadEditViewController view](self, "view");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "safeAreaLayoutGuide");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "leadingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintEqualToAnchor:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v60[1] = v32;
  -[ICDocCamImageQuadEditViewController buttonContainer](self, "buttonContainer");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "trailingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamImageQuadEditViewController view](self, "view");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "safeAreaLayoutGuide");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "trailingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v60[2] = v38;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v60, 3);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v48);
  -[ICDocCamImageQuadEditViewController updateButtonTitles](self, "updateButtonTitles");
  -[ICDocCamImageQuadEditViewController placard](self, "placard");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "layer");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setCornerRadius:", 4.0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "addObserver:selector:name:object:", self, sel_scanWasDeleted_, CFSTR("DCScanWasDeletedNotification"), 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "addObserver:selector:name:object:", self, sel_applicationWillResignActive_, *MEMORY[0x24BDF75D8], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "addObserver:selector:name:object:", self, sel_contentSizeCategoryDidChange_, *MEMORY[0x24BDF7670], 0);

  -[ICDocCamImageQuadEditViewController setupAccessibility](self, "setupAccessibility");
  -[ICDocCamImageQuadEditViewController cancelButton](self, "cancelButton");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_alloc_init(MEMORY[0x24BDF6C78]);
  objc_msgSend(v44, "addInteraction:", v45);

  -[ICDocCamImageQuadEditViewController saveButton](self, "saveButton");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_alloc_init(MEMORY[0x24BDF6C78]);
  objc_msgSend(v46, "addInteraction:", v47);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)ICDocCamImageQuadEditViewController;
  -[ICDocCamImageQuadEditViewController viewWillAppear:](&v6, sel_viewWillAppear_);
  -[ICDocCamImageQuadEditViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNavigationBarHidden:animated:", 1, v3);

  -[ICDocCamImageQuadEditViewController updateFonts](self, "updateFonts");
  -[ICDocCamImageQuadEditViewController setDidCallCompletion:](self, "setDidCallCompletion:", 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  _QWORD v14[4];
  id v15;
  id location;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)ICDocCamImageQuadEditViewController;
  -[ICDocCamImageQuadEditViewController viewDidAppear:](&v17, sel_viewDidAppear_, a3);
  -[ICDocCamImageQuadEditViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend((id)v5, "interfaceOrientation");

  -[ICDocCamImageQuadEditViewController startOrientationIsPortrait](self, "startOrientationIsPortrait");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v7, "BOOLValue");

  if ((v5 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", (unint64_t)(v6 - 1) < 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamImageQuadEditViewController setStartOrientationIsPortrait:](self, "setStartOrientationIsPortrait:", v8);

  }
  objc_initWeak(&location, self);
  v9 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __53__ICDocCamImageQuadEditViewController_viewDidAppear___block_invoke;
  v14[3] = &unk_24C5B7CE0;
  objc_copyWeak(&v15, &location);
  dc_dispatchMainAfterDelay(v14, 5.0);
  -[ICDocCamImageQuadEditViewController overlay](self, "overlay");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "accessibilityElements");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], v12);

  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __53__ICDocCamImageQuadEditViewController_viewDidAppear___block_invoke_4;
  v13[3] = &unk_24C5B7AE0;
  v13[4] = self;
  dc_dispatchMainAfterDelay(v13, 1.0);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __53__ICDocCamImageQuadEditViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  id *v1;
  void *v2;
  double v3;
  id v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  id WeakRetained;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "placard");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alpha");
  if (v3 == 0.0)
  {

  }
  else
  {
    v4 = objc_loadWeakRetained(v1);
    objc_msgSend(v4, "placard");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isHidden");

    if ((v6 & 1) == 0)
    {
      v7 = (void *)MEMORY[0x24BDF6F90];
      v8 = MEMORY[0x24BDAC760];
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __53__ICDocCamImageQuadEditViewController_viewDidAppear___block_invoke_2;
      v12[3] = &unk_24C5B7CE0;
      objc_copyWeak(&v13, v1);
      v10[0] = v8;
      v10[1] = 3221225472;
      v10[2] = __53__ICDocCamImageQuadEditViewController_viewDidAppear___block_invoke_3;
      v10[3] = &unk_24C5B8690;
      objc_copyWeak(&v11, v1);
      objc_msgSend(v7, "animateWithDuration:animations:completion:", v12, v10, 0.5);
      objc_destroyWeak(&v11);
      objc_destroyWeak(&v13);
    }
  }
}

void __53__ICDocCamImageQuadEditViewController_viewDidAppear___block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "placard");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

void __53__ICDocCamImageQuadEditViewController_viewDidAppear___block_invoke_3(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "placard");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setHidden:", 1);

}

void __53__ICDocCamImageQuadEditViewController_viewDidAppear___block_invoke_4(uint64_t a1)
{
  UIAccessibilityNotifications v1;
  void *v2;
  id v3;

  v1 = *MEMORY[0x24BDF71E8];
  objc_msgSend(*(id *)(a1 + 32), "userPromptLabel");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v1, v2);

}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (void)setInCaptureMode:(BOOL)a3
{
  self->_inCaptureMode = a3;
  -[ICDocCamImageQuadEditViewController updateButtonTitles](self, "updateButtonTitles");
}

- (void)setUpImageView
{
  ICDocCamImageQuadEditImageView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  ICDocCamImageQuadEditImageView *v8;
  ICDocCamImageQuadEditImageView *v9;
  char matched;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;

  -[ICDocCamImageQuadEditViewController image](self, "image");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v3 = [ICDocCamImageQuadEditImageView alloc];
  v4 = *MEMORY[0x24BDBF090];
  v5 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v6 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v7 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v8 = -[ICDocCamImageQuadEditImageView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x24BDBF090], v5, v6, v7);
  v9 = -[ICDocCamImageQuadEditImageView initWithFrame:]([ICDocCamImageQuadEditImageView alloc], "initWithFrame:", v4, v5, v6, v7);
  -[ICDocCamImageQuadEditImageView setImage:orientation:](v8, "setImage:orientation:", v15, -[ICDocCamImageQuadEditViewController orientation](self, "orientation"));
  -[ICDocCamImageQuadEditImageView setImage:orientation:](v9, "setImage:orientation:", v15, -[ICDocCamImageQuadEditViewController orientation](self, "orientation"));
  matched = dc_clockwiseRotationsFromUpToMatchOrientation(-[ICDocCamImageQuadEditViewController orientation](self, "orientation"));
  objc_msgSend(v15, "size");
  v12 = v11;
  objc_msgSend(v15, "size");
  if ((matched & 1) != 0)
    v14 = v12;
  else
    v14 = v13;
  if ((matched & 1) != 0)
    v12 = v13;
  -[ICDocCamImageQuadEditImageView setFrame:](v8, "setFrame:", 0.0, 0.0, v12, v14);
  -[ICDocCamImageQuadEditImageView setFrame:](v9, "setFrame:", 0.0, 0.0, v12, v14);
  -[ICDocCamImageQuadEditViewController setImageView:](self, "setImageView:", v8);
  -[ICDocCamImageQuadEditViewController setBackgroundImageView:](self, "setBackgroundImageView:", v9);
  -[ICDocCamImageQuadEditImageView setImageOpacity:](v9, "setImageOpacity:", 0.7);

}

- (void)updateButtonTitles
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Cancel"), CFSTR("Cancel"), CFSTR("Localizable"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Done"), CFSTR("Done"), CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ICDocCamImageQuadEditViewController inCaptureMode](self, "inCaptureMode"))
  {
    +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Retake"), CFSTR("Retake"), CFSTR("Localizable"));
    v4 = objc_claimAutoreleasedReturnValue();

    +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Keep Scan"), CFSTR("Keep Scan"), CFSTR("Localizable"));
    v5 = objc_claimAutoreleasedReturnValue();

    v8 = (id)v4;
    v3 = (void *)v5;
  }
  -[ICDocCamImageQuadEditViewController cancelButton](self, "cancelButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:forState:", v8, 0);

  -[ICDocCamImageQuadEditViewController saveButton](self, "saveButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:forState:", v3, 0);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  ICDocCamImageQuadEditOverlay *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  ICDocCamImageQuadEditOverlay *v38;
  objc_super v39;
  _QWORD v40[5];
  ICDocCamImageQuadEditOverlay *v41;
  _QWORD v42[5];
  ICDocCamImageQuadEditOverlay *v43;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  -[ICDocCamImageQuadEditViewController adjustedQuad](self, "adjustedQuad");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamImageQuadEditViewController setQuad:](self, "setQuad:", v8);

  if (objc_msgSend(v7, "isAnimated"))
  {
    -[ICDocCamImageQuadEditViewController overlay](self, "overlay");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "unselectAllKnobs");

    -[ICDocCamImageQuadEditViewController overlay](self, "overlay");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setHidden:", 1);

    -[ICDocCamImageQuadEditViewController imageView](self, "imageView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamImageQuadEditViewController imageView](self, "imageView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    -[ICDocCamImageQuadEditViewController imageView](self, "imageView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "superview");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "convertRect:toView:", v22, v14, v16, v18, v20);
    v24 = v23;
    v26 = v25;
    v28 = v27;
    v30 = v29;

    v31 = -[ICDocCamImageQuadEditOverlay initWithFrame:]([ICDocCamImageQuadEditOverlay alloc], "initWithFrame:", v24, v26, v28, v30);
    -[ICDocCamImageQuadEditOverlay setAutoresizingMask:](v31, "setAutoresizingMask:", 18);
    -[ICDocCamImageQuadEditOverlay setIsTempOverlay:](v31, "setIsTempOverlay:", 1);
    -[ICDocCamImageQuadEditViewController overlay](self, "overlay");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamImageQuadEditOverlay setTempOverlayQuadIsValid:](v31, "setTempOverlayQuadIsValid:", objc_msgSend(v32, "isQuadValid"));

    -[ICDocCamImageQuadEditViewController adjustedQuad](self, "adjustedQuad");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamImageQuadEditOverlay setQuad:](v31, "setQuad:", v33);

    -[ICDocCamImageQuadEditOverlay setDelegate:](v31, "setDelegate:", self);
    -[ICDocCamImageQuadEditOverlay setImage:orientation:](v31, "setImage:orientation:", 0, -[ICDocCamImageQuadEditViewController orientation](self, "orientation"));
    -[ICDocCamImageQuadEditViewController imageView](self, "imageView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "superview");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addSubview:", v31);

    -[ICDocCamImageQuadEditViewController scrollView](self, "scrollView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "zoomScale");
    -[ICDocCamImageQuadEditOverlay setTempOverlayMagnification:animationDuration:](v31, "setTempOverlayMagnification:animationDuration:");

    v37 = MEMORY[0x24BDAC760];
    v42[0] = MEMORY[0x24BDAC760];
    v42[1] = 3221225472;
    v42[2] = __90__ICDocCamImageQuadEditViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
    v42[3] = &unk_24C5B86B8;
    v42[4] = self;
    v43 = v31;
    v40[0] = v37;
    v40[1] = 3221225472;
    v40[2] = __90__ICDocCamImageQuadEditViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
    v40[3] = &unk_24C5B86B8;
    v40[4] = self;
    v41 = v43;
    v38 = v43;
    objc_msgSend(v7, "animateAlongsideTransition:completion:", v42, v40);

  }
  v39.receiver = self;
  v39.super_class = (Class)ICDocCamImageQuadEditViewController;
  -[ICDocCamImageQuadEditViewController viewWillTransitionToSize:withTransitionCoordinator:](&v39, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);

}

void __90__ICDocCamImageQuadEditViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  if ((objc_msgSend(v3, "showImageAsAspectFit") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setShouldAdjustForApectFitIfNecessary:", 1);
    objc_msgSend(*(id *)(a1 + 32), "updateToAspectFitIfNecessary");
  }
  v5 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "scrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "zoomScale");
  v8 = v7;
  objc_msgSend(v4, "transitionDuration");
  v10 = v9;

  objc_msgSend(v5, "setTempOverlayMagnification:animationDuration:", v8, v10);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setNeedsUpdateConstraints");

}

uint64_t __90__ICDocCamImageQuadEditViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "overlay");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHidden:", 0);

  return objc_msgSend(*(id *)(a1 + 40), "removeFromSuperview");
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  float v15;
  float v16;
  void *v17;
  void *v18;
  uint64_t v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)ICDocCamImageQuadEditViewController;
  -[ICDocCamImageQuadEditViewController viewDidLayoutSubviews](&v20, sel_viewDidLayoutSubviews);
  -[ICDocCamImageQuadEditViewController centerAndScaleImageInScrollView](self, "centerAndScaleImageInScrollView");
  -[ICDocCamImageQuadEditViewController imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  -[ICDocCamImageQuadEditViewController imageView](self, "imageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v8 = v7;

  -[ICDocCamImageQuadEditViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  v11 = v10;
  -[ICDocCamImageQuadEditViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");
  v14 = v13;

  if ((unint64_t)(-[UIViewController dc_effectiveInterfaceOrientation](self, "dc_effectiveInterfaceOrientation")
                        - 3) > 1
    || (v15 = v11 / v14 * 100.0, v16 = v5 / v8 * 100.0, (float)(roundf(v16) / 100.0) >= (float)(roundf(v15) / 100.0)))
  {
    objc_msgSend(MEMORY[0x24BDF6950], "dc_barColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamImageQuadEditViewController buttonContainer](self, "buttonContainer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setBackgroundColor:", v17);
    v19 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamImageQuadEditViewController buttonContainer](self, "buttonContainer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setBackgroundColor:", v17);
    v19 = 1;
  }

  -[ICDocCamImageQuadEditViewController setInvisibleButtonContainer:](self, "setInvisibleButtonContainer:", v19);
}

- (void)applicationWillResignActive:(id)a3
{
  id v3;

  -[ICDocCamImageQuadEditViewController overlay](self, "overlay", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unselectAllKnobs");

}

- (CGRect)unitImageRectForOverlayRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  void *v28;
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
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[ICDocCamImageQuadEditViewController overlay](self, "overlay");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamImageQuadEditViewController scrollView](self, "scrollView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertRect:toView:", v9, x, y, width, height);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  -[ICDocCamImageQuadEditViewController imageView](self, "imageView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamImageQuadEditViewController scrollView](self, "scrollView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "convertRect:fromView:", v19, v11, v13, v15, v17);
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;

  -[ICDocCamImageQuadEditViewController imageView](self, "imageView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "frame");
  DCTSDNormalizedSubrectInRect(v21, v23, v25, v27);
  v30 = v29;
  v32 = v31;
  v34 = v33;
  v36 = v35;

  v37 = v30;
  v38 = v32;
  v39 = v34;
  v40 = v36;
  result.size.height = v40;
  result.size.width = v39;
  result.origin.y = v38;
  result.origin.x = v37;
  return result;
}

- (CGRect)imageFrameInOverlayCoordinates
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
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
  CGRect result;

  -[ICDocCamImageQuadEditViewController imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamImageQuadEditViewController imageView](self, "imageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[ICDocCamImageQuadEditViewController scrollView](self, "scrollView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "convertRect:toView:", v13, v6, v8, v10, v12);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  -[ICDocCamImageQuadEditViewController overlay](self, "overlay");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamImageQuadEditViewController scrollView](self, "scrollView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "convertRect:fromView:", v23, v15, v17, v19, v21);
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;

  v32 = v25;
  v33 = v27;
  v34 = v29;
  v35 = v31;
  result.size.height = v35;
  result.size.width = v34;
  result.origin.y = v33;
  result.origin.x = v32;
  return result;
}

- (double)currentZoomFactorForOverlay
{
  void *v2;
  double v3;
  double v4;

  -[ICDocCamImageQuadEditViewController scrollView](self, "scrollView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "zoomScale");
  v4 = v3;

  return v4;
}

- (id)quadForOverlay:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  double v29;
  double v30;
  void *v31;

  v4 = a3;
  -[ICDocCamImageQuadEditViewController quad](self, "quad");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ICDocCamImageQuadEditViewController uiQuadForOverlay:](self, "uiQuadForOverlay:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[ICDocCamImageQuadEditViewController overlay](self, "overlay");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "frame");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    -[ICDocCamImageQuadEditViewController buttonContainer](self, "buttonContainer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "frame");
    v21 = DCTSDRectSubtractingRect(v9, v11, v13, v15, v17, v18, v19, v20);
    v23 = v22;
    v25 = v24;
    v27 = v26;

    v28 = DCTSDCenterOfRect(v21, v23, v25, v27);
    if (v25 >= v27)
      v30 = v27;
    else
      v30 = v25;
    +[ICDocCamImageQuad quadFromCGRect:](ICDocCamImageQuad, "quadFromCGRect:", DCTSDRectWithCenterAndSize(v28, v29, v30 * 0.8));
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v31 = (void *)v6;

  return v31;
}

- (CGRect)rectAvailableForDefaultRect
{
  void *v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
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
  double v25;
  double v26;
  double v27;
  CGRect result;

  -[ICDocCamImageQuadEditViewController overlay](self, "overlay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[ICDocCamImageQuadEditViewController buttonContainer](self, "buttonContainer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");
  v17 = DCTSDRectSubtractingRect(v5, v7, v9, v11, v13, v14, v15, v16);
  v19 = v18;
  v21 = v20;
  v23 = v22;

  v24 = v17;
  v25 = v19;
  v26 = v21;
  v27 = v23;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (void)selectedKnobDidChange:(id)a3
{
  void *v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[5];

  -[ICDocCamImageQuadEditViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
    -[ICDocCamImageQuadEditViewController overlay](self, "overlay");
  else
    -[ICDocCamImageQuadEditViewController buttonContainer](self, "buttonContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bringSubviewToFront:", v6);

  v7[4] = self;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __61__ICDocCamImageQuadEditViewController_selectedKnobDidChange___block_invoke;
  v8[3] = &unk_24C5B7AE0;
  v8[4] = self;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61__ICDocCamImageQuadEditViewController_selectedKnobDidChange___block_invoke_2;
  v7[3] = &unk_24C5B7B78;
  objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:completion:", v8, v7, 0.15);
}

void __61__ICDocCamImageQuadEditViewController_selectedKnobDidChange___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "placard");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

void __61__ICDocCamImageQuadEditViewController_selectedKnobDidChange___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "placard");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setHidden:", 1);

}

- (void)selectedKnobDidPanToRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  void *v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  BOOL v15;
  void *v16;
  uint64_t v17;
  void *v18;
  double v19;
  void *v20;
  _QWORD v21[5];
  BOOL v22;
  CGRect v23;
  CGRect v24;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[ICDocCamImageQuadEditViewController overlay](self, "overlay");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamImageQuadEditViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertRect:toView:", v9, x, y, width, height);

  -[ICDocCamImageQuadEditViewController buttonContainer](self, "buttonContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");
  v24.origin.x = v11;
  v24.origin.y = v12;
  v24.size.width = v13;
  v24.size.height = v14;
  v23.origin.x = x;
  v23.origin.y = y;
  v23.size.width = width;
  v23.size.height = height;
  v15 = CGRectIntersectsRect(v23, v24);

  if (!-[ICDocCamImageQuadEditViewController invisibleButtonContainer](self, "invisibleButtonContainer"))
  {
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __64__ICDocCamImageQuadEditViewController_selectedKnobDidPanToRect___block_invoke;
    v21[3] = &unk_24C5B86E0;
    v21[4] = self;
    v22 = v15;
    objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:options:animations:completion:", 4, v21, 0, 0.25, 0.0);
  }
  -[ICDocCamImageQuadEditViewController setDidAdjustQuad:](self, "setDidAdjustQuad:", 1);
  -[ICDocCamImageQuadEditViewController overlay](self, "overlay");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isQuadValid");

  -[ICDocCamImageQuadEditViewController saveButton](self, "saveButton");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setEnabled:", v17);

  if ((_DWORD)v17)
    v19 = 1.0;
  else
    v19 = 0.5;
  -[ICDocCamImageQuadEditViewController saveButton](self, "saveButton");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setAlpha:", v19);

  -[ICDocCamImageQuadEditViewController updateOverlayScrimMask](self, "updateOverlayScrimMask");
}

void __64__ICDocCamImageQuadEditViewController_selectedKnobDidPanToRect___block_invoke(uint64_t a1)
{
  double v1;
  id v2;

  if (*(_BYTE *)(a1 + 40))
    v1 = 0.0;
  else
    v1 = 1.0;
  objc_msgSend(*(id *)(a1 + 32), "buttonContainer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", v1);

}

- (void)overlayDidLayout:(id)a3
{
  objc_msgSend(a3, "unselectAllKnobs");
  -[ICDocCamImageQuadEditViewController updateOverlayScrimMask](self, "updateOverlayScrimMask");
}

- (void)updateOverlayScrimMask
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  -[ICDocCamImageQuadEditViewController overlay](self, "overlay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "adjustedQuad");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamImageQuadEditViewController overlay](self, "overlay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamImageQuadEditViewController imageView](self, "imageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "quadByConvertingFromView:toView:isNormalized:", v5, v6, 0);
  v25 = (id)objc_claimAutoreleasedReturnValue();

  -[ICDocCamImageQuadEditViewController overlayMaskPath](self, "overlayMaskPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllPoints");
  objc_msgSend(v25, "topLeft");
  objc_msgSend(v7, "moveToPoint:");
  objc_msgSend(v25, "topRight");
  objc_msgSend(v7, "addLineToPoint:");
  objc_msgSend(v25, "bottomRight");
  objc_msgSend(v7, "addLineToPoint:");
  objc_msgSend(v25, "bottomLeft");
  objc_msgSend(v7, "addLineToPoint:");
  objc_msgSend(v7, "closePath");
  -[ICDocCamImageQuadEditViewController imageView](self, "imageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  -[ICDocCamImageQuadEditViewController overlayMask](self, "overlayMask");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);

  v19 = objc_retainAutorelease(v7);
  v20 = objc_msgSend(v19, "CGPath");
  -[ICDocCamImageQuadEditViewController overlayMask](self, "overlayMask");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setPath:", v20);

  -[ICDocCamImageQuadEditViewController overlayMask](self, "overlayMask");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamImageQuadEditViewController imageView](self, "imageView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "layer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setMask:", v22);

}

- (void)centerAndScaleImageInScrollView
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  int v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  _BOOL4 v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  void *v45;

  -[ICDocCamImageQuadEditViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "interfaceOrientation") - 1;

  -[ICDocCamImageQuadEditViewController startOrientationIsPortrait](self, "startOrientationIsPortrait");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  -[ICDocCamImageQuadEditViewController scrollView](self, "scrollView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;
  -[ICDocCamImageQuadEditViewController imageView](self, "imageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "frame");
  v13 = v10 / v12;

  -[ICDocCamImageQuadEditViewController scrollView](self, "scrollView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bounds");
  v16 = v15;
  -[ICDocCamImageQuadEditViewController imageView](self, "imageView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "frame");
  v19 = v16 / v18;

  v20 = -[ICDocCamImageQuadEditViewController showImageAsAspectFit](self, "showImageAsAspectFit");
  if (v19 >= v13)
    v21 = v13;
  else
    v21 = v19;
  if (v5 >= 2)
    v22 = v19;
  else
    v22 = v13;
  if (v20 | (v5 < 2) ^ v7)
    v23 = v21;
  else
    v23 = v22;
  -[ICDocCamImageQuadEditViewController scrollView](self, "scrollView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setZoomScale:", v23);

  -[ICDocCamImageQuadEditViewController scrollView](self, "scrollView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamImageQuadEditViewController imageView](self, "imageView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "center");
  v28 = v27;
  v30 = v29;
  -[ICDocCamImageQuadEditViewController imageView](self, "imageView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "superview");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "convertPoint:fromView:", v32, v28, v30);
  v34 = v33;
  v36 = v35;

  -[ICDocCamImageQuadEditViewController scrollView](self, "scrollView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "contentOffset");

  -[ICDocCamImageQuadEditViewController scrollView](self, "scrollView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "center");
  v40 = -(v39 - v34);

  -[ICDocCamImageQuadEditViewController scrollView](self, "scrollView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "center");
  v43 = -(v42 - v36);

  -[ICDocCamImageQuadEditViewController scrollView](self, "scrollView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setContentOffset:", v40, v43);

  -[ICDocCamImageQuadEditViewController scrollView](self, "scrollView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "layoutIfNeeded");

  -[ICDocCamImageQuadEditViewController updateOverlayScrimMask](self, "updateOverlayScrimMask");
  -[ICDocCamImageQuadEditViewController updateToAspectFitIfNecessary](self, "updateToAspectFitIfNecessary");
}

- (void)updateToAspectFitIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;

  if (-[ICDocCamImageQuadEditViewController shouldAdjustForApectFitIfNecessary](self, "shouldAdjustForApectFitIfNecessary"))
  {
    -[ICDocCamImageQuadEditViewController setShouldAdjustForApectFitIfNecessary:](self, "setShouldAdjustForApectFitIfNecessary:", 0);
    if (!-[ICDocCamImageQuadEditViewController showImageAsAspectFit](self, "showImageAsAspectFit"))
    {
      -[ICDocCamImageQuadEditViewController overlay](self, "overlay");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setNeedsLayout");

      -[ICDocCamImageQuadEditViewController overlay](self, "overlay");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "layoutIfNeeded");

      -[ICDocCamImageQuadEditViewController overlay](self, "overlay");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "containsPointOutsideOfOverlayBounds");

      if ((v6 & 1) == 0)
      {
        -[ICDocCamImageQuadEditViewController setShowImageAsAspectFit:](self, "setShowImageAsAspectFit:", 1);
        -[ICDocCamImageQuadEditViewController centerAndScaleImageInScrollView](self, "centerAndScaleImageInScrollView");
        -[ICDocCamImageQuadEditViewController overlay](self, "overlay");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setNeedsLayout");

        -[ICDocCamImageQuadEditViewController overlay](self, "overlay");
        v8 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "layoutIfNeeded");

      }
    }
  }
}

- (id)uiInitialQuadForOverlay:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;

  v4 = a3;
  -[ICDocCamImageQuadEditViewController initialQuad](self, "initialQuad");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamImageQuadEditViewController imageView](self, "imageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamImageQuadEditViewController scrollView](self, "scrollView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "quadByConvertingFromView:toView:isNormalized:", v6, v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICDocCamImageQuadEditViewController scrollView](self, "scrollView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "quadByConvertingFromView:toView:isNormalized:", v9, v4, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "bounds");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  objc_msgSend(v10, "flipPointsWithSourceFrame:", v12, v14, v16, v18);
  return v10;
}

- (id)uiQuadForOverlay:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;

  v4 = a3;
  -[ICDocCamImageQuadEditViewController quad](self, "quad");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamImageQuadEditViewController imageView](self, "imageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamImageQuadEditViewController scrollView](self, "scrollView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "quadByConvertingFromView:toView:isNormalized:", v6, v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICDocCamImageQuadEditViewController scrollView](self, "scrollView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "quadByConvertingFromView:toView:isNormalized:", v9, v4, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "bounds");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  objc_msgSend(v10, "flipPointsWithSourceFrame:", v12, v14, v16, v18);
  return v10;
}

- (id)adjustedQuad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;

  -[ICDocCamImageQuadEditViewController overlay](self, "overlay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "adjustedQuad");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICDocCamImageQuadEditViewController overlay](self, "overlay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamImageQuadEditViewController scrollView](self, "scrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "quadByConvertingFromView:toView:isNormalized:", v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICDocCamImageQuadEditViewController scrollView](self, "scrollView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamImageQuadEditViewController imageView](self, "imageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamImageQuadEditViewController imageView](self, "imageView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");
  objc_msgSend(v7, "normalizedQuadByConvertingFromView:toView:toViewSize:", v8, v9, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "flipPointsWithSourceFrame:", 0.0, 0.0, 1.0, 1.0);
  -[ICDocCamImageQuadEditViewController image](self, "image");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "size");
  v16 = v15;
  -[ICDocCamImageQuadEditViewController image](self, "image");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "size");
  objc_msgSend(v13, "setBoundingBox:", 0.0, 0.0, v16, v18);

  return v13;
}

- (id)finalQuad
{
  uint64_t v3;
  void *v4;
  void *v5;

  if (-[ICDocCamImageQuadEditViewController didAdjustQuad](self, "didAdjustQuad")
    || (-[ICDocCamImageQuadEditViewController quad](self, "quad"), (v3 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[ICDocCamImageQuadEditViewController adjustedQuad](self, "adjustedQuad");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)v3;
    -[ICDocCamImageQuadEditViewController quad](self, "quad");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v5, "removeOrientation:boundingBox:", -[ICDocCamImageQuadEditViewController orientation](self, "orientation"), 0.0, 0.0, 1.0, 1.0);
  objc_msgSend(v5, "orientIfNecessary");
  return v5;
}

- (void)saveButtonPressed:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  -[ICDocCamImageQuadEditViewController overlay](self, "overlay", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isDraggingKnob");

  if ((v5 & 1) == 0)
  {
    -[ICDocCamImageQuadEditViewController setDidPressSave:](self, "setDidPressSave:", 1);
    -[ICDocCamImageQuadEditViewController image](self, "image");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[ICDocCamImageQuadEditViewController finalQuad](self, "finalQuad");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamImageQuadEditViewController callCompletionHandler:withImage:quad:preparingForDismissal:](self, "callCompletionHandler:withImage:quad:preparingForDismissal:", 1, v7, v6, 0);

  }
}

- (void)cancelButtonPressed:(id)a3
{
  void *v4;
  char v5;

  -[ICDocCamImageQuadEditViewController overlay](self, "overlay", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isDraggingKnob");

  if ((v5 & 1) == 0)
    -[ICDocCamImageQuadEditViewController callCompletionHandler:withImage:quad:preparingForDismissal:](self, "callCompletionHandler:withImage:quad:preparingForDismissal:", 0, 0, 0, 0);
}

- (id)viewForZoomingInScrollView:(id)a3
{
  void *v3;
  void *v4;

  -[ICDocCamImageQuadEditViewController imageView](self, "imageView", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)scanWasDeleted:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __54__ICDocCamImageQuadEditViewController_scanWasDeleted___block_invoke;
  v7[3] = &unk_24C5B7BF0;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dc_performBlockOnMainThread(v7);

}

void __54__ICDocCamImageQuadEditViewController_scanWasDeleted___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;

  objc_msgSend(*(id *)(a1 + 32), "scanDataDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 40));

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "callCompletionHandler:withImage:quad:preparingForDismissal:", 0, 0, 0, 0);
    objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
  }
}

- (void)setupAccessibility
{
  id v2;

  -[ICDocCamImageQuadEditViewController userPromptLabel](self, "userPromptLabel");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIsAccessibilityElement:", 0);

}

- (void)updateFonts
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDF6A70], "dc_preferredFontForTextStyle:adjustedForDefaultSize:", *MEMORY[0x24BDF77B0], 16.0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ICDocCamImageQuadEditViewController userPromptLabel](self, "userPromptLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v4);

}

- (id)quadForOverlay
{
  void *v3;
  void *v4;

  -[ICDocCamImageQuadEditViewController overlay](self, "overlay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamImageQuadEditViewController quadForOverlay:](self, "quadForOverlay:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)finalQuadFromOverlay
{
  void *v3;
  uint64_t v4;
  void *v5;

  if (-[ICDocCamImageQuadEditViewController didPressSave](self, "didPressSave")
    && -[ICDocCamImageQuadEditViewController didAdjustQuad](self, "didAdjustQuad"))
  {
    -[ICDocCamImageQuadEditViewController overlay](self, "overlay");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "adjustedQuad");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[ICDocCamImageQuadEditViewController overlay](self, "overlay");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamImageQuadEditViewController uiInitialQuadForOverlay:](self, "uiInitialQuadForOverlay:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;

  return v5;
}

- (void)callCompletionHandler:(BOOL)a3 withImage:(id)a4 quad:(id)a5 preparingForDismissal:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v8;
  id v10;
  void (**v11)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  id v12;

  v6 = a6;
  v8 = a3;
  v12 = a4;
  v10 = a5;
  if (!-[ICDocCamImageQuadEditViewController didCallCompletion](self, "didCallCompletion"))
  {
    -[ICDocCamImageQuadEditViewController setDidCallCompletion:](self, "setDidCallCompletion:", 1);
    -[ICDocCamImageQuadEditViewController completionHandler](self, "completionHandler");
    v11 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _BOOL8, id, id, _BOOL8))v11)[2](v11, v8, v12, v10, v6);

  }
}

- (void)prepareForDismissal
{
  void *v3;
  id v4;

  -[ICDocCamImageQuadEditViewController setDidPressSave:](self, "setDidPressSave:", 1);
  -[ICDocCamImageQuadEditViewController image](self, "image");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ICDocCamImageQuadEditViewController finalQuad](self, "finalQuad");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamImageQuadEditViewController callCompletionHandler:withImage:quad:preparingForDismissal:](self, "callCompletionHandler:withImage:quad:preparingForDismissal:", 1, v4, v3, 1);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollView, a3);
}

- (ICDocCamImageQuadEditImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (ICDocCamImageQuadEditImageView)backgroundImageView
{
  return self->_backgroundImageView;
}

- (void)setBackgroundImageView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundImageView, a3);
}

- (UIView)buttonContainer
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_buttonContainer);
}

- (void)setButtonContainer:(id)a3
{
  objc_storeWeak((id *)&self->_buttonContainer, a3);
}

- (ICDocCamImageQuadEditOverlay)overlay
{
  return self->_overlay;
}

- (void)setOverlay:(id)a3
{
  objc_storeStrong((id *)&self->_overlay, a3);
}

- (double)knobHeight
{
  return self->_knobHeight;
}

- (UIColor)knobColor
{
  return self->_knobColor;
}

- (UIView)placard
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_placard);
}

- (void)setPlacard:(id)a3
{
  objc_storeWeak((id *)&self->_placard, a3);
}

- (UIImage)image
{
  return self->_image;
}

- (DCScanDataDelegate)scanDataDelegate
{
  return self->_scanDataDelegate;
}

- (BOOL)showImageAsAspectFit
{
  return self->_showImageAsAspectFit;
}

- (void)setShowImageAsAspectFit:(BOOL)a3
{
  self->_showImageAsAspectFit = a3;
}

- (BOOL)inCaptureMode
{
  return self->_inCaptureMode;
}

- (CAShapeLayer)overlayMask
{
  return self->_overlayMask;
}

- (void)setOverlayMask:(id)a3
{
  objc_storeStrong((id *)&self->_overlayMask, a3);
}

- (UIBezierPath)overlayMaskPath
{
  return self->_overlayMaskPath;
}

- (void)setOverlayMaskPath:(id)a3
{
  objc_storeStrong((id *)&self->_overlayMaskPath, a3);
}

- (ICDocCamImageQuad)quad
{
  return self->_quad;
}

- (void)setQuad:(id)a3
{
  objc_storeStrong((id *)&self->_quad, a3);
}

- (ICDocCamImageQuad)initialQuad
{
  return self->_initialQuad;
}

- (void)setInitialQuad:(id)a3
{
  objc_storeStrong((id *)&self->_initialQuad, a3);
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1096);
}

- (UIButton)cancelButton
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_cancelButton);
}

- (void)setCancelButton:(id)a3
{
  objc_storeWeak((id *)&self->_cancelButton, a3);
}

- (UIButton)saveButton
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_saveButton);
}

- (void)setSaveButton:(id)a3
{
  objc_storeWeak((id *)&self->_saveButton, a3);
}

- (UILabel)userPromptLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_userPromptLabel);
}

- (void)setUserPromptLabel:(id)a3
{
  objc_storeWeak((id *)&self->_userPromptLabel, a3);
}

- (NSLayoutConstraint)buttonContainerHeightConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_buttonContainerHeightConstraint);
}

- (void)setButtonContainerHeightConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_buttonContainerHeightConstraint, a3);
}

- (NSNumber)startOrientationIsPortrait
{
  return self->_startOrientationIsPortrait;
}

- (void)setStartOrientationIsPortrait:(id)a3
{
  objc_storeStrong((id *)&self->_startOrientationIsPortrait, a3);
}

- (BOOL)didAdjustQuad
{
  return self->_didAdjustQuad;
}

- (void)setDidAdjustQuad:(BOOL)a3
{
  self->_didAdjustQuad = a3;
}

- (BOOL)shouldAdjustForApectFitIfNecessary
{
  return self->_shouldAdjustForApectFitIfNecessary;
}

- (void)setShouldAdjustForApectFitIfNecessary:(BOOL)a3
{
  self->_shouldAdjustForApectFitIfNecessary = a3;
}

- (BOOL)invisibleButtonContainer
{
  return self->_invisibleButtonContainer;
}

- (void)setInvisibleButtonContainer:(BOOL)a3
{
  self->_invisibleButtonContainer = a3;
}

- (BOOL)didPressSave
{
  return self->_didPressSave;
}

- (void)setDidPressSave:(BOOL)a3
{
  self->_didPressSave = a3;
}

- (BOOL)didCallCompletion
{
  return self->_didCallCompletion;
}

- (void)setDidCallCompletion:(BOOL)a3
{
  self->_didCallCompletion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startOrientationIsPortrait, 0);
  objc_destroyWeak((id *)&self->_buttonContainerHeightConstraint);
  objc_destroyWeak((id *)&self->_userPromptLabel);
  objc_destroyWeak((id *)&self->_saveButton);
  objc_destroyWeak((id *)&self->_cancelButton);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_initialQuad, 0);
  objc_storeStrong((id *)&self->_quad, 0);
  objc_storeStrong((id *)&self->_overlayMaskPath, 0);
  objc_storeStrong((id *)&self->_overlayMask, 0);
  objc_storeStrong((id *)&self->_scanDataDelegate, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_destroyWeak((id *)&self->_placard);
  objc_storeStrong((id *)&self->_knobColor, 0);
  objc_storeStrong((id *)&self->_overlay, 0);
  objc_destroyWeak((id *)&self->_buttonContainer);
  objc_storeStrong((id *)&self->_backgroundImageView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
}

- (void)initWithImage:(os_log_t)log quad:scanDataDelegate:orientation:completionHandler:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20CE8E000, log, OS_LOG_TYPE_ERROR, "Trying to load recrop for scan, but the quad is nil, setting starting UI recrop to a 95%% unit rect", v1, 2u);
}

- (void)initWithImage:(uint64_t)a3 quad:(uint64_t)a4 scanDataDelegate:(uint64_t)a5 orientation:(uint64_t)a6 completionHandler:(uint64_t)a7 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20CE8E000, a1, a3, "invalid nil value for '%s'", a5, a6, a7, a8, 2u);
}

- (void)initWithImage:(uint64_t)a3 quad:(uint64_t)a4 scanDataDelegate:(uint64_t)a5 orientation:(uint64_t)a6 completionHandler:(uint64_t)a7 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20CE8E000, a1, a3, "invalid nil value for '%s'", a5, a6, a7, a8, 2u);
}

@end

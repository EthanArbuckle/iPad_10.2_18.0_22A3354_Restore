@implementation AVTPoseCaptureViewController

+ (CGRect)borderMaskRectForContentRect:(CGRect)a3
{
  return CGRectInset(a3, 1.0, 1.0);
}

- (AVTPoseCaptureViewController)initWithSelectedRecord:(id)a3 avtViewSessionProvider:(id)a4
{
  id v7;
  id v8;
  AVTPoseCaptureViewController *v9;
  AVTPoseCaptureViewController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AVTPoseCaptureViewController;
  v9 = -[AVTPoseCaptureViewController initWithNibName:bundle:](&v12, sel_initWithNibName_bundle_, 0, 0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_avatarRecord, a3);
    objc_storeStrong((id *)&v10->_avtViewSessionProvider, a4);
  }

  return v10;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  UIView *v5;
  UIView *headerView;
  void *v7;
  void *v8;
  id v9;
  UIImageView *v10;
  UIImageView *snapshotImageView;
  void *v12;
  uint64_t v13;
  void *v14;
  UIBarButtonItem *v15;
  UIBarButtonItem *doneButton;
  UIBarButtonItem *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  id v39;
  void *v40;
  void *v41;
  UIView *v42;
  UIView *borderMaskView;
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
  objc_super v60;
  _QWORD v61[10];

  v61[8] = *MEMORY[0x1E0C80C00];
  v60.receiver = self;
  v60.super_class = (Class)AVTPoseCaptureViewController;
  -[AVTPoseCaptureViewController viewDidLoad](&v60, sel_viewDidLoad);
  -[AVTPoseCaptureViewController backgroundColor](self, "backgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTPoseCaptureViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
  headerView = self->_headerView;
  self->_headerView = v5;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_headerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[AVTPoseCaptureViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", self->_headerView);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_headerView, "setBackgroundColor:", v8);

  v9 = objc_alloc(MEMORY[0x1E0CEA658]);
  v10 = (UIImageView *)objc_msgSend(v9, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  snapshotImageView = self->_snapshotImageView;
  self->_snapshotImageView = v10;

  -[UIImageView setContentMode:](self->_snapshotImageView, "setContentMode:", 1);
  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_snapshotImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIImageView setHidden:](self->_snapshotImageView, "setHidden:", 1);
  -[UIImageView setAlpha:](self->_snapshotImageView, "setAlpha:", 0.0);
  -[AVTPoseCaptureViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", self->_snapshotImageView);

  v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_didTapCancel_);
  -[AVTPoseCaptureViewController navigationItem](self, "navigationItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = (void *)v13;
  objc_msgSend(v14, "setLeftBarButtonItem:", v13);

  v15 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_didTapDone_);
  doneButton = self->_doneButton;
  self->_doneButton = v15;

  v17 = self->_doneButton;
  -[AVTPoseCaptureViewController navigationItem](self, "navigationItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setRightBarButtonItem:", v17);

  -[AVTPoseCaptureViewController updateHeaderHeightConstraint](self, "updateHeaderHeightConstraint");
  -[AVTPoseCaptureViewController updatePaddingConstant](self, "updatePaddingConstant");
  -[UIView topAnchor](self->_headerView, "topAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTPoseCaptureViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "topAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:constant:", v21, (double)-[AVTPoseCaptureViewController topPadding](self, "topPadding"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTPoseCaptureViewController setHeaderTopAnchor:](self, "setHeaderTopAnchor:", v22);

  -[AVTPoseCaptureViewController headerTopAnchor](self, "headerTopAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v61[0] = v58;
  -[UIView leadingAnchor](self->_headerView, "leadingAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTPoseCaptureViewController view](self, "view");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "leadingAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "constraintEqualToAnchor:", v55);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v61[1] = v54;
  -[UIView trailingAnchor](self->_headerView, "trailingAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTPoseCaptureViewController view](self, "view");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "trailingAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "constraintEqualToAnchor:", v51);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v61[2] = v50;
  -[AVTPoseCaptureViewController headerHeightConstraint](self, "headerHeightConstraint");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v61[3] = v49;
  -[UIImageView heightAnchor](self->_snapshotImageView, "heightAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView heightAnchor](self->_headerView, "heightAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintEqualToAnchor:", v47);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v61[4] = v46;
  -[UIImageView widthAnchor](self->_snapshotImageView, "widthAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView widthAnchor](self->_headerView, "widthAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v61[5] = v24;
  -[UIImageView centerXAnchor](self->_snapshotImageView, "centerXAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](self->_headerView, "centerXAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v61[6] = v27;
  -[UIImageView centerYAnchor](self->_snapshotImageView, "centerYAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerYAnchor](self->_headerView, "centerYAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v61[7] = v30;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 8);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v31);
  v32 = AVTUIIsFacetrackingSupported();
  self->_allowFacetracking = v32;
  if ((v32 & 1) != 0)
  {
    -[AVTPoseCaptureViewController setMode:](self, "setMode:", 1);
    -[UIBarButtonItem setEnabled:](self->_doneButton, "setEnabled:", 0);
  }
  else
  {
    -[AVTPoseCaptureViewController setMode:](self, "setMode:", 0);
  }
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "scale");
  v35 = v34;
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "nativeScale");
  v38 = v37;

  if (v35 != v38)
  {
    v39 = objc_alloc(MEMORY[0x1E0CEABB0]);
    v40 = (void *)objc_opt_class();
    -[AVTPoseCaptureViewController view](self, "view");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "bounds");
    objc_msgSend(v40, "borderMaskRectForContentRect:");
    v42 = (UIView *)objc_msgSend(v39, "initWithFrame:");
    borderMaskView = self->_borderMaskView;
    self->_borderMaskView = v42;

    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_borderMaskView, "setBackgroundColor:", v44);

    -[UIView setMaskView:](self->_headerView, "setMaskView:", self->_borderMaskView);
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVTPoseCaptureViewController;
  -[AVTPoseCaptureViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[AVTPoseCaptureViewController beginAVTViewSessionWithDidBeginBlock:](self, "beginAVTViewSessionWithDidBeginBlock:", 0);
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVTPoseCaptureViewController;
  -[AVTPoseCaptureViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  -[AVTPoseCaptureViewController avtViewSession](self, "avtViewSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tearDownWithCompletionHandler:", 0);

}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVTPoseCaptureViewController;
  -[AVTPoseCaptureViewController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  -[AVTPoseCaptureViewController updateHeaderHeightConstraint](self, "updateHeaderHeightConstraint");
  -[AVTPoseCaptureViewController updatePaddingConstant](self, "updatePaddingConstant");
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVTPoseCaptureViewController;
  -[AVTPoseCaptureViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[AVTPoseCaptureViewController updateAVTViewContainerFrame](self, "updateAVTViewContainerFrame");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)AVTPoseCaptureViewController;
  v7 = a4;
  -[AVTPoseCaptureViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[AVTPoseCaptureViewController updatePaddingConstant](self, "updatePaddingConstant");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __83__AVTPoseCaptureViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1EA51D1B0;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

}

void __83__AVTPoseCaptureViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "updateHeaderHeightConstraint");
  objc_msgSend(*(id *)(a1 + 32), "updateAVTViewContainerFrame");
  objc_msgSend(*(id *)(a1 + 32), "avtViewSession");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "avtView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateInterfaceOrientation");

}

- (void)updateHeaderHeightConstraint
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  _BOOL4 v8;
  double v9;
  void *v10;
  void *v11;
  id v12;

  -[AVTPoseCaptureViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  -[AVTPoseCaptureViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v8 = v5 > v7;

  v9 = dbl_1DCA69FB0[v8];
  -[AVTPoseCaptureViewController headerHeightConstraint](self, "headerHeightConstraint");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[AVTPoseCaptureViewController headerHeightConstraint](self, "headerHeightConstraint");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setConstant:", v9);
  }
  else
  {
    -[UIView heightAnchor](self->_headerView, "heightAnchor");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToConstant:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTPoseCaptureViewController setHeaderHeightConstraint:](self, "setHeaderHeightConstraint:", v11);

  }
}

- (void)updatePaddingConstant
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  BOOL v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  id v28;

  -[AVTPoseCaptureViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "horizontalSizeClass");

  -[AVTPoseCaptureViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v8 = v7;

  v9 = v8 * 0.08;
  if (v8 * 0.08 < 20.0)
    v9 = 20.0;
  v10 = v8 * 0.15;
  if (v8 * 0.15 < 20.0)
    v10 = 20.0;
  if (v5 == 2)
    v11 = 44.0;
  else
    v11 = v9;
  if (v5 == 2)
    v12 = 78.0;
  else
    v12 = v10;
  -[AVTPoseCaptureViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "frame");
  v15 = v14;
  -[AVTPoseCaptureViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "frame");
  v18 = v17;

  v19 = v15 <= v18;
  if (v15 <= v18)
    v20 = v12;
  else
    v20 = 20.0;
  if (v19)
    v21 = v11;
  else
    v21 = 20.0;
  -[AVTPoseCaptureViewController setTopPadding:](self, "setTopPadding:", (uint64_t)v21);
  -[AVTPoseCaptureViewController setBottomPadding:](self, "setBottomPadding:", (uint64_t)v20);
  v22 = (double)-[AVTPoseCaptureViewController topPadding](self, "topPadding");
  -[AVTPoseCaptureViewController view](self, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "safeAreaInsets");
  v25 = v24 + v22;
  -[AVTPoseCaptureViewController headerTopAnchor](self, "headerTopAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setConstant:", v25);

  v27 = (double)--[AVTPoseCaptureViewController bottomPadding](self, "bottomPadding");
  -[AVTPoseCaptureViewController captureButtonBottomAnchor](self, "captureButtonBottomAnchor");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setConstant:", v27);

}

- (void)updateAVTViewContainerFrame
{
  void *v3;
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
  id v15;

  -[AVTPoseCaptureViewController avtViewContainer](self, "avtViewContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTPoseCaptureViewController headerView](self, "headerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
  {
    -[AVTPoseCaptureViewController headerView](self, "headerView");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bounds");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    -[AVTPoseCaptureViewController avtViewContainer](self, "avtViewContainer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

  }
}

- (void)setMode:(unint64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id location;

  if (self->_mode == a3)
    return;
  self->_mode = a3;
  switch(a3)
  {
    case 2uLL:
      -[AVTPoseCaptureViewController createCaptureButtonIfNeeded](self, "createCaptureButtonIfNeeded");
      -[AVTPoseCaptureViewController createDiscardButtonIfNeeded](self, "createDiscardButtonIfNeeded");
      -[AVTPoseCaptureViewController discardButton](self, "discardButton");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = 0;
      goto LABEL_8;
    case 1uLL:
      objc_initWeak(&location, self);
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __40__AVTPoseCaptureViewController_setMode___block_invoke;
      v8[3] = &unk_1EA51D1D8;
      objc_copyWeak(&v9, &location);
      -[AVTPoseCaptureViewController beginAVTViewSessionWithDidBeginBlock:](self, "beginAVTViewSessionWithDidBeginBlock:", v8);
      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);
      return;
    case 0uLL:
      -[AVTPoseCaptureViewController discardButton](self, "discardButton");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = 1;
LABEL_8:
      objc_msgSend(v4, "setHidden:", v6);

      -[AVTPoseCaptureViewController captureButton](self, "captureButton");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setHidden:", 1);

      break;
  }
}

void __40__AVTPoseCaptureViewController_setMode___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "mode") == 1)
  {
    objc_msgSend(WeakRetained, "createCaptureButtonIfNeeded");
    objc_msgSend(WeakRetained, "discardButton");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "setHidden:", 1);

    objc_msgSend(WeakRetained, "captureButton");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setHidden:", 0);

  }
}

- (void)beginAVTViewSessionWithDidBeginBlock:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id location;

  v4 = (void (**)(id, void *))a3;
  -[AVTPoseCaptureViewController avtViewSession](self, "avtViewSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isActive");

  if (v6)
  {
    if (v4)
    {
      -[AVTPoseCaptureViewController avtViewSession](self, "avtViewSession");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v7);

    }
  }
  else
  {
    -[AVTPoseCaptureViewController postSessionDidBecomeActiveHandler](self, "postSessionDidBecomeActiveHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[AVTPoseCaptureViewController postSessionDidBecomeActiveHandler](self, "postSessionDidBecomeActiveHandler");
      v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v9[2](v9, 0);

    }
    -[AVTPoseCaptureViewController setPostSessionDidBecomeActiveHandler:](self, "setPostSessionDidBecomeActiveHandler:", v4);
    objc_initWeak(&location, self);
    -[AVTPoseCaptureViewController avtViewSessionProvider](self, "avtViewSessionProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __69__AVTPoseCaptureViewController_beginAVTViewSessionWithDidBeginBlock___block_invoke;
    v15[3] = &unk_1EA51D1D8;
    objc_copyWeak(&v16, &location);
    v13[0] = v11;
    v13[1] = 3221225472;
    v13[2] = __69__AVTPoseCaptureViewController_beginAVTViewSessionWithDidBeginBlock___block_invoke_2;
    v13[3] = &unk_1EA51D200;
    objc_copyWeak(&v14, &location);
    objc_msgSend(v10, "sessionWithDidBecomeActiveHandler:tearDownHandler:", v15, v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTPoseCaptureViewController setAvtViewSession:](self, "setAvtViewSession:", v12);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

}

void __69__AVTPoseCaptureViewController_beginAVTViewSessionWithDidBeginBlock___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "beginUsingAVTViewFromSession:", v6);
  objc_msgSend(WeakRetained, "postSessionDidBecomeActiveHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(WeakRetained, "postSessionDidBecomeActiveHandler");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v5)[2](v5, v6);

  }
  objc_msgSend(WeakRetained, "setPostSessionDidBecomeActiveHandler:", 0);

}

void __69__AVTPoseCaptureViewController_beginAVTViewSessionWithDidBeginBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  void (**v6)(_QWORD);
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a2;
  v5 = (id *)(a1 + 32);
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(v20, "avtViewContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "tapGestureRecognizer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeGestureRecognizer:", v9);

  objc_msgSend(WeakRetained, "setTapGestureRecognizer:", 0);
  objc_msgSend(WeakRetained, "avtViewSessionProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "faceTrackingManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "userInfoView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "superview");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    objc_msgSend(v12, "superview");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "headerView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15 == v16)
    {
      objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
      objc_msgSend(v12, "removeFromSuperview");
    }
  }
  objc_msgSend(WeakRetained, "avtViewSessionProvider");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "faceTrackingManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setDelegate:", 0);

  objc_msgSend(v20, "avtViewContainer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "removeFromSuperview");

  objc_msgSend(WeakRetained, "setAvtViewSession:", 0);
  v6[2](v6);

}

- (void)beginUsingAVTViewFromSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  objc_msgSend(v4, "avtViewContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTPoseCaptureViewController setAvtViewContainer:](self, "setAvtViewContainer:", v5);

  -[AVTPoseCaptureViewController avtViewContainer](self, "avtViewContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", 1.0);

  -[AVTPoseCaptureViewController headerView](self, "headerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTPoseCaptureViewController avtViewContainer](self, "avtViewContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v8);

  -[AVTPoseCaptureViewController updateAVTViewContainerFrame](self, "updateAVTViewContainerFrame");
  -[AVTPoseCaptureViewController avatarRecord](self, "avatarRecord");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __61__AVTPoseCaptureViewController_beginUsingAVTViewFromSession___block_invoke;
  v11[3] = &unk_1EA51D228;
  v11[4] = self;
  v12 = v4;
  v10 = v4;
  -[AVTPoseCaptureViewController configureAVTViewSession:withAvatarRecord:completionBlock:](self, "configureAVTViewSession:withAvatarRecord:completionBlock:", v10, v9, v11);

}

void __61__AVTPoseCaptureViewController_beginUsingAVTViewFromSession___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", *(_QWORD *)(a1 + 32), sel_didTapAvatarView_);
  objc_msgSend(*(id *)(a1 + 32), "setTapGestureRecognizer:", v2);

  objc_msgSend(*(id *)(a1 + 40), "avtViewContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "tapGestureRecognizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addGestureRecognizer:", v4);

  objc_msgSend(*(id *)(a1 + 32), "avtViewSessionProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "faceTrackingManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFaceTrackingManagementPaused:", 0);

  v7 = *(void **)(a1 + 32);
  objc_msgSend(v7, "avtViewSessionProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "faceTrackingManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDelegate:", v7);

  objc_msgSend(*(id *)(a1 + 32), "avtViewSessionProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "faceTrackingManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "resumeFaceTrackingIfNeededAnimated:", 0);

  objc_msgSend(*(id *)(a1 + 32), "configureUserInfoLabel");
  objc_msgSend(*(id *)(a1 + 32), "view");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setNeedsLayout");

}

- (void)configureAVTViewSession:(id)a3 withAvatarRecord:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _BOOL8 allowFacetracking;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v8 = a5;
  v9 = a4;
  objc_msgSend(v19, "avtView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updateInterfaceOrientation");

  v11 = AVTUIShowTrackingLostReticle_once();
  objc_msgSend(v19, "avtView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setEnableReticle:", v11);

  allowFacetracking = self->_allowFacetracking;
  objc_msgSend(v19, "avtView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setEnableFaceTracking:", allowFacetracking);

  -[AVTPoseCaptureViewController backgroundColor](self, "backgroundColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[AVTPoseCaptureViewController backgroundColor](self, "backgroundColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "avtView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setBackgroundColor:", v16);

  }
  objc_msgSend(v19, "avtViewUpdater");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAvatarRecord:completionHandler:", v9, v8);

}

- (void)configureUserInfoLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  if (!-[AVTPoseCaptureViewController shouldHideUserInfoView](self, "shouldHideUserInfoView")
    && self->_allowFacetracking)
  {
    -[AVTPoseCaptureViewController avtViewSessionProvider](self, "avtViewSessionProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "faceTrackingManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userInfoView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[AVTPoseCaptureViewController backgroundColor](self, "backgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setContainerBackgroundColor:", v6);

    -[AVTPoseCaptureViewController headerView](self, "headerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v5);

    objc_msgSend(v5, "leadingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTPoseCaptureViewController headerView](self, "headerView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "leadingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v17;
    objc_msgSend(v5, "trailingAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTPoseCaptureViewController headerView](self, "headerView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "trailingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v11;
    objc_msgSend(v5, "bottomAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTPoseCaptureViewController headerView](self, "headerView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bottomAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v16);
  }
}

- (void)didTapAvatarView:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  id v7;

  -[AVTPoseCaptureViewController avtViewSession](self, "avtViewSession", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isActive");

  if (v5)
  {
    -[AVTPoseCaptureViewController avtViewSessionProvider](self, "avtViewSessionProvider");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "faceTrackingManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "resumeFaceTrackingIfNeededAnimated:", 1);

  }
}

- (void)createCaptureButtonIfNeeded
{
  void *v3;
  AVTRecordingButton *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[5];

  v32[4] = *MEMORY[0x1E0C80C00];
  -[AVTPoseCaptureViewController captureButton](self, "captureButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(AVTRecordingButton);
    -[AVTPoseCaptureViewController setCaptureButton:](self, "setCaptureButton:", v4);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemBlueColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTPoseCaptureViewController captureButton](self, "captureButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCenterCircleColor:", v5);

    -[AVTPoseCaptureViewController captureButton](self, "captureButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setIgnoresLongPress:", 1);

    -[AVTPoseCaptureViewController captureButton](self, "captureButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addTarget:action:forControlEvents:", self, sel_didTapCaptureButton_, 64);

    -[AVTPoseCaptureViewController captureButton](self, "captureButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[AVTPoseCaptureViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTPoseCaptureViewController captureButton](self, "captureButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v11);

    -[AVTPoseCaptureViewController captureButton](self, "captureButton");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bottomAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTPoseCaptureViewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bottomAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:constant:", v15, (double)--[AVTPoseCaptureViewController bottomPadding](self, "bottomPadding"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTPoseCaptureViewController setCaptureButtonBottomAnchor:](self, "setCaptureButtonBottomAnchor:", v16);

    -[AVTPoseCaptureViewController captureButton](self, "captureButton");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "widthAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToConstant:", 79.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v29;
    -[AVTPoseCaptureViewController captureButton](self, "captureButton");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "heightAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTPoseCaptureViewController captureButton](self, "captureButton");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "widthAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = v19;
    -[AVTPoseCaptureViewController captureButton](self, "captureButton");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "centerXAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTPoseCaptureViewController view](self, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "centerXAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v32[2] = v24;
    -[AVTPoseCaptureViewController captureButtonBottomAnchor](self, "captureButtonBottomAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v32[3] = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 4);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v26);
  }
}

- (void)createDiscardButtonIfNeeded
{
  void *v3;
  AVTCircularButton *v4;
  AVTCircularButton *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[5];

  v33[4] = *MEMORY[0x1E0C80C00];
  -[AVTPoseCaptureViewController discardButton](self, "discardButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = [AVTCircularButton alloc];
    v5 = -[AVTCircularButton initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[AVTPoseCaptureViewController setDiscardButton:](self, "setDiscardButton:", v5);

    objc_msgSend(MEMORY[0x1E0CEA478], "redColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTPoseCaptureViewController discardButton](self, "discardButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTintColor:", v6);

    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:weight:", 5, 38.0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTPoseCaptureViewController discardButton](self, "discardButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSymbolImageWithName:configuration:", CFSTR("trash.fill"), v32);

    -[AVTPoseCaptureViewController discardButton](self, "discardButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addTarget:action:forControlEvents:", self, sel_didTapDiscardButton_, 64);

    -[AVTPoseCaptureViewController discardButton](self, "discardButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[AVTPoseCaptureViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTPoseCaptureViewController discardButton](self, "discardButton");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v12);

    -[AVTPoseCaptureViewController discardButton](self, "discardButton");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "widthAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToConstant:", 69.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v29;
    -[AVTPoseCaptureViewController discardButton](self, "discardButton");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "heightAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTPoseCaptureViewController discardButton](self, "discardButton");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "widthAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v25);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = v24;
    -[AVTPoseCaptureViewController discardButton](self, "discardButton");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "centerXAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTPoseCaptureViewController captureButton](self, "captureButton");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "centerXAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v33[2] = v16;
    -[AVTPoseCaptureViewController discardButton](self, "discardButton");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "centerYAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTPoseCaptureViewController captureButton](self, "captureButton");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "centerYAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v33[3] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v22);
  }
}

- (void)didTapCaptureButton:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];

  v4 = (void *)MEMORY[0x1E0D006A8];
  -[AVTPoseCaptureViewController avtViewSession](self, "avtViewSession", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "avtView");
  v6 = objc_claimAutoreleasedReturnValue();
  -[AVTPoseCaptureViewController avtViewSession](self, "avtViewSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "avtView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "snapshotAVTView:matchingViewSize:highQuality:logger:", v6, v8, 1, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVTPoseCaptureViewController delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[AVTPoseCaptureViewController delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __52__AVTPoseCaptureViewController_didTapCaptureButton___block_invoke;
    v12[3] = &unk_1EA51CDE8;
    v12[4] = self;
    objc_msgSend(v11, "poseCaptureViewController:willCaptureAvatarImage:completion:", self, v9, v12);

  }
  else
  {
    -[AVTPoseCaptureViewController switchToReviewMode:](self, "switchToReviewMode:", v9);
  }

}

uint64_t __52__AVTPoseCaptureViewController_didTapCaptureButton___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "switchToReviewMode:", a2);
}

- (void)switchToReviewMode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  _QWORD v20[5];
  const __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AVTPoseCaptureViewController snapshotImageView](self, "snapshotImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v4);

  -[AVTPoseCaptureViewController snapshotImageView](self, "snapshotImageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", 0);

  v19[4] = self;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __51__AVTPoseCaptureViewController_switchToReviewMode___block_invoke;
  v20[3] = &unk_1EA51D188;
  v20[4] = self;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __51__AVTPoseCaptureViewController_switchToReviewMode___block_invoke_2;
  v19[3] = &unk_1EA51D250;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:completion:", v20, v19, 0.4);
  -[AVTPoseCaptureViewController avtViewSession](self, "avtViewSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "avtView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "avatar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "physicsState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = CFSTR("memoji");
  v22[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc(MEMORY[0x1E0D00650]);
  -[AVTPoseCaptureViewController avtViewSession](self, "avtViewSession");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "avtView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "avatar");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "pose");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v12, "initWithPose:physicsStates:", v16, v11);

  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D00690]), "initWithName:pose:props:shaders:camera:options:", CFSTR("custom_capture"), v17, 0, 0, 0, 0);
  -[AVTPoseCaptureViewController setAdHocConfiguration:](self, "setAdHocConfiguration:", v18);

  -[AVTPoseCaptureViewController setMode:](self, "setMode:", 2);
  -[UIBarButtonItem setEnabled:](self->_doneButton, "setEnabled:", 1);

}

void __51__AVTPoseCaptureViewController_switchToReviewMode___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "headerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "snapshotImageView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 1.0);

}

void __51__AVTPoseCaptureViewController_switchToReviewMode___block_invoke_2(uint64_t a1, int a2)
{
  id v2;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "headerView");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setHidden:", 1);

  }
}

- (void)switchToCaptureMode
{
  void *v3;
  _QWORD v4[5];
  _QWORD v5[5];

  -[AVTPoseCaptureViewController setMode:](self, "setMode:", 1);
  -[UIBarButtonItem setEnabled:](self->_doneButton, "setEnabled:", 0);
  -[AVTPoseCaptureViewController headerView](self, "headerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 0);

  v4[4] = self;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__AVTPoseCaptureViewController_switchToCaptureMode__block_invoke;
  v5[3] = &unk_1EA51D188;
  v5[4] = self;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__AVTPoseCaptureViewController_switchToCaptureMode__block_invoke_2;
  v4[3] = &unk_1EA51D250;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:completion:", v5, v4, 0.4);
}

void __51__AVTPoseCaptureViewController_switchToCaptureMode__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "headerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "snapshotImageView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

}

void __51__AVTPoseCaptureViewController_switchToCaptureMode__block_invoke_2(uint64_t a1, int a2)
{
  void *v3;
  id v4;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "snapshotImageView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setImage:", 0);

    objc_msgSend(*(id *)(a1 + 32), "snapshotImageView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHidden:", 1);

  }
}

- (void)didTapCancel:(id)a3
{
  id v4;

  -[AVTPoseCaptureViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "poseCaptureViewControllerDidCancel:", self);

}

- (void)didTapDone:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[AVTPoseCaptureViewController delegate](self, "delegate", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[AVTPoseCaptureViewController adHocConfiguration](self, "adHocConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTPoseCaptureViewController avatarRecord](self, "avatarRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "poseCaptureViewController:didCapturePoseWithConfiguration:avatar:", self, v4, v5);

}

- (BOOL)isModalInPresentation
{
  return 1;
}

- (int64_t)interfaceOrientationForFaceTrackingManager:(id)a3
{
  void *v3;
  void *v4;
  int64_t v5;

  -[AVTPoseCaptureViewController view](self, "view", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_windowInterfaceOrientation");

  return v5;
}

- (AVTPoseCaptureViewControllerDelegate)delegate
{
  return (AVTPoseCaptureViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (BOOL)shouldHideUserInfoView
{
  return self->_shouldHideUserInfoView;
}

- (void)setShouldHideUserInfoView:(BOOL)a3
{
  self->_shouldHideUserInfoView = a3;
}

- (AVTAvatarRecord)avatarRecord
{
  return self->_avatarRecord;
}

- (void)setAvatarRecord:(id)a3
{
  objc_storeStrong((id *)&self->_avatarRecord, a3);
}

- (unint64_t)mode
{
  return self->_mode;
}

- (AVTViewSessionProvider)avtViewSessionProvider
{
  return self->_avtViewSessionProvider;
}

- (AVTViewSession)avtViewSession
{
  return self->_avtViewSession;
}

- (void)setAvtViewSession:(id)a3
{
  objc_storeStrong((id *)&self->_avtViewSession, a3);
}

- (UIView)avtViewContainer
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_avtViewContainer);
}

- (void)setAvtViewContainer:(id)a3
{
  objc_storeWeak((id *)&self->_avtViewContainer, a3);
}

- (id)postSessionDidBecomeActiveHandler
{
  return self->_postSessionDidBecomeActiveHandler;
}

- (void)setPostSessionDidBecomeActiveHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1032);
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, a3);
}

- (BOOL)allowFacetracking
{
  return self->_allowFacetracking;
}

- (void)setAllowFacetracking:(BOOL)a3
{
  self->_allowFacetracking = a3;
}

- (UIView)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_headerView, a3);
}

- (NSLayoutConstraint)headerHeightConstraint
{
  return self->_headerHeightConstraint;
}

- (void)setHeaderHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_headerHeightConstraint, a3);
}

- (UIImageView)snapshotImageView
{
  return self->_snapshotImageView;
}

- (void)setSnapshotImageView:(id)a3
{
  objc_storeStrong((id *)&self->_snapshotImageView, a3);
}

- (UIView)borderMaskView
{
  return self->_borderMaskView;
}

- (void)setBorderMaskView:(id)a3
{
  objc_storeStrong((id *)&self->_borderMaskView, a3);
}

- (AVTRecordingButton)captureButton
{
  return self->_captureButton;
}

- (void)setCaptureButton:(id)a3
{
  objc_storeStrong((id *)&self->_captureButton, a3);
}

- (AVTCircularButton)discardButton
{
  return self->_discardButton;
}

- (void)setDiscardButton:(id)a3
{
  objc_storeStrong((id *)&self->_discardButton, a3);
}

- (UIBarButtonItem)doneButton
{
  return self->_doneButton;
}

- (void)setDoneButton:(id)a3
{
  objc_storeStrong((id *)&self->_doneButton, a3);
}

- (NSLayoutConstraint)headerTopAnchor
{
  return self->_headerTopAnchor;
}

- (void)setHeaderTopAnchor:(id)a3
{
  objc_storeStrong((id *)&self->_headerTopAnchor, a3);
}

- (int64_t)topPadding
{
  return self->_topPadding;
}

- (void)setTopPadding:(int64_t)a3
{
  self->_topPadding = a3;
}

- (NSLayoutConstraint)captureButtonBottomAnchor
{
  return self->_captureButtonBottomAnchor;
}

- (void)setCaptureButtonBottomAnchor:(id)a3
{
  objc_storeStrong((id *)&self->_captureButtonBottomAnchor, a3);
}

- (int64_t)bottomPadding
{
  return self->_bottomPadding;
}

- (void)setBottomPadding:(int64_t)a3
{
  self->_bottomPadding = a3;
}

- (AVTStickerConfiguration)adHocConfiguration
{
  return self->_adHocConfiguration;
}

- (void)setAdHocConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_adHocConfiguration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adHocConfiguration, 0);
  objc_storeStrong((id *)&self->_captureButtonBottomAnchor, 0);
  objc_storeStrong((id *)&self->_headerTopAnchor, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_discardButton, 0);
  objc_storeStrong((id *)&self->_captureButton, 0);
  objc_storeStrong((id *)&self->_borderMaskView, 0);
  objc_storeStrong((id *)&self->_snapshotImageView, 0);
  objc_storeStrong((id *)&self->_headerHeightConstraint, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong(&self->_postSessionDidBecomeActiveHandler, 0);
  objc_destroyWeak((id *)&self->_avtViewContainer);
  objc_storeStrong((id *)&self->_avtViewSession, 0);
  objc_storeStrong((id *)&self->_avtViewSessionProvider, 0);
  objc_storeStrong((id *)&self->_avatarRecord, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

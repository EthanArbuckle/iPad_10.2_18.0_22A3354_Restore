@implementation PKTextInputDebugViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)loadView
{
  PKTexInputDebugContainerView *v3;
  PKTexInputDebugContainerView *v4;

  v3 = [PKTexInputDebugContainerView alloc];
  v4 = -[PKTexInputDebugContainerView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[PKTextInputDebugViewController setView:](self, "setView:", v4);

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKTextInputDebugViewController;
  -[PKTextInputDebugViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[PKTextInputDebugViewController _setupStatusView](self, "_setupStatusView");
  -[PKTextInputDebugViewController setStatusViewAnchorCorner:](self, "setStatusViewAnchorCorner:", 8);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKTextInputDebugViewController;
  -[PKTextInputDebugViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__handleAutoreloadTimerFired, 0, 1, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputDebugViewController set_autoreloadTimer:](self, "set_autoreloadTimer:", v4);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKTextInputDebugViewController;
  -[PKTextInputDebugViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  -[PKTextInputDebugViewController _autoreloadTimer](self, "_autoreloadTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  -[PKTextInputDebugViewController set_autoreloadTimer:](self, "set_autoreloadTimer:", 0);
}

- (void)_setupStatusView
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  objc_class *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
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
  _QWORD v64[4];
  _QWORD v65[3];
  _QWORD v66[2];
  _QWORD v67[7];

  v67[5] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v8 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], v5, v6, v7);
  -[PKTextInputDebugViewController set_statusContainerView:](self, "set_statusContainerView:", v8);
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v8, "setOpaque:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTintColor:", v9);

  objc_msgSend(v8, "setClipsToBounds:", 1);
  objc_msgSend(v8, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCornerRadius:", 12.0);

  -[PKTextInputDebugViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v8);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3E68]), "initWithFrame:", v4, v5, v6, v7);
  -[PKTextInputDebugViewController set_statusViewToolbar:](self, "set_statusViewToolbar:", v12);
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v12, "setOpaque:", 0);
  objc_msgSend(v8, "addSubview:", v12);
  v61 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
  v13 = objc_alloc(MEMORY[0x1E0DC34F0]);
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("ant.fill"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "initWithImage:style:target:action:", v14, 0, self, sel__handleRadarButton_);

  v60 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", CFSTR("Targets"), 0, self, sel__handleTargetsButton_);
  v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", CFSTR("Log"), 0, self, sel__handleLogButton_);
  v57 = (void *)v15;
  v58 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel__handleCloseButton_);
  v16 = (void *)v15;
  v67[0] = v15;
  v67[1] = v61;
  v67[2] = v60;
  v67[3] = v59;
  v67[4] = v58;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setItems:", v17);

  objc_msgSend(v16, "setEnabled:", os_variant_has_internal_diagnostics());
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D48]), "initWithFrame:style:", 0, v4, v5, v6, v7);
  -[PKTextInputDebugViewController set_statusTableView:](self, "set_statusTableView:", v18);
  objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v18, "setAllowsSelection:", 0);
  objc_msgSend(v8, "addSubview:", v18);
  objc_msgSend(v18, "setDataSource:", self);
  objc_msgSend(v18, "setDelegate:", self);
  v19 = objc_opt_class();
  v20 = (objc_class *)objc_opt_class();
  NSStringFromClass(v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "registerClass:forCellReuseIdentifier:", v19, v21);

  objc_msgSend(v18, "setOpaque:", 0);
  objc_msgSend(v18, "setSeparatorStyle:", 0);
  objc_msgSend(v18, "setEstimatedRowHeight:", 30.0);
  objc_msgSend(v18, "setRowHeight:", *MEMORY[0x1E0DC53D8]);
  objc_msgSend(v18, "setSectionHeaderHeight:", 28.0);
  objc_msgSend(v18, "setContentInset:", 0.0, 0.0, 12.0, 0.0);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.7);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v22);

  v23 = v12;
  objc_msgSend(v12, "setBarStyle:", 1);
  v24 = objc_alloc_init(MEMORY[0x1E0DC3870]);
  objc_msgSend(v12, "setBackgroundImage:forToolbarPosition:barMetrics:", v24, 0, 0);

  v25 = objc_alloc_init(MEMORY[0x1E0DC3870]);
  objc_msgSend(v12, "setShadowImage:forToolbarPosition:", v25, 0);

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setBackgroundColor:", v26);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "heightAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToConstant:", 500.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v66[0] = v28;
  objc_msgSend(v8, "widthAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToConstant:", 320.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v66[1] = v30;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 2);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "addObjectsFromArray:", v31);

  v32 = v23;
  objc_msgSend(v23, "topAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "topAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "constraintEqualToAnchor:", v52);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v65[0] = v33;
  objc_msgSend(v23, "leadingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = v8;
  objc_msgSend(v8, "leadingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v65[1] = v36;
  v56 = v32;
  objc_msgSend(v32, "trailingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trailingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v65[2] = v39;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 3);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "addObjectsFromArray:", v40);

  objc_msgSend(v18, "topAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "bottomAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "constraintEqualToAnchor:", v53);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v64[0] = v51;
  objc_msgSend(v18, "bottomAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "bottomAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToAnchor:", v49);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v64[1] = v41;
  objc_msgSend(v18, "leadingAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "leadingAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v64[2] = v44;
  objc_msgSend(v18, "trailingAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "trailingAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v64[3] = v47;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 4);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "addObjectsFromArray:", v48);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v63);
}

- (void)setStatusViewAnchorCorner:(unint64_t)a3
{
  if (self->_statusViewAnchorCorner != a3)
  {
    self->_statusViewAnchorCorner = a3;
    -[PKTextInputDebugViewController _updateStatusView](self, "_updateStatusView");
  }
}

- (void)setElementsController:(id)a3
{
  PKTextInputElementsController *v5;
  PKTextInputElementsController *v6;

  v5 = (PKTextInputElementsController *)a3;
  if (self->_elementsController != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_elementsController, a3);
    -[PKTextInputDebugViewController setNeedsReloadTargetsVisualization](self, "setNeedsReloadTargetsVisualization");
    v5 = v6;
  }

}

- (void)setNeedsReloadDebugStateData
{
  if (!-[PKTextInputDebugViewController _needsReloadData](self, "_needsReloadData"))
  {
    -[PKTextInputDebugViewController set_needsReloadData:](self, "set_needsReloadData:", 1);
    -[PKTextInputDebugViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__reloadDebugStateData, 0, 0.0);
  }
}

- (void)setNeedsReloadTargetsVisualization
{
  if (!-[PKTextInputDebugViewController _needsReloadTargetsVisualization](self, "_needsReloadTargetsVisualization"))
  {
    -[PKTextInputDebugViewController set_needsReloadTargetsVisualization:](self, "set_needsReloadTargetsVisualization:", 1);
    -[PKTextInputDebugViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__reloadTargetsVisualization, 0, 0.0);
  }
}

- (void)_updateStatusView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  -[PKTextInputDebugViewController _statusViewPositionConstraints](self, "_statusViewPositionConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3718];
    -[PKTextInputDebugViewController _statusViewPositionConstraints](self, "_statusViewPositionConstraints");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deactivateConstraints:", v5);

    -[PKTextInputDebugViewController set_statusViewPositionConstraints:](self, "set_statusViewPositionConstraints:", 0);
  }
  -[PKTextInputDebugViewController _statusContainerView](self, "_statusContainerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PKTextInputDebugViewController statusViewAnchorCorner](self, "statusViewAnchorCorner");
  switch(v7)
  {
    case 4uLL:
      objc_msgSend(v6, "bottomAnchor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTextInputDebugViewController view](self, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "bottomAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v17;
      objc_msgSend(v17, "constraintEqualToAnchor:constant:", v10, -60.0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v11;
      objc_msgSend(v6, "leadingAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTextInputDebugViewController view](self, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "leadingAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "constraintEqualToAnchor:constant:", v14, 22.0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v23[1] = v15;
      v16 = v23;
      break;
    case 2uLL:
      objc_msgSend(v6, "topAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTextInputDebugViewController view](self, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "topAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v18;
      objc_msgSend(v18, "constraintEqualToAnchor:constant:", v10, 60.0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v11;
      objc_msgSend(v6, "trailingAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTextInputDebugViewController view](self, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "trailingAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "constraintEqualToAnchor:constant:", v14, -22.0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v24[1] = v15;
      v16 = v24;
      break;
    case 1uLL:
      objc_msgSend(v6, "topAnchor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTextInputDebugViewController view](self, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "topAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v8;
      objc_msgSend(v8, "constraintEqualToAnchor:constant:", v10, 60.0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = v11;
      objc_msgSend(v6, "leadingAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTextInputDebugViewController view](self, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "leadingAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "constraintEqualToAnchor:constant:", v14, 22.0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v25[1] = v15;
      v16 = v25;
      break;
    default:
      objc_msgSend(v6, "bottomAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTextInputDebugViewController view](self, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "bottomAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v19;
      objc_msgSend(v19, "constraintEqualToAnchor:constant:", v10, -60.0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v11;
      objc_msgSend(v6, "trailingAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTextInputDebugViewController view](self, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "trailingAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "constraintEqualToAnchor:constant:", v14, -22.0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v22[1] = v15;
      v16 = v22;
      break;
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v20);
  -[PKTextInputDebugViewController set_statusViewPositionConstraints:](self, "set_statusViewPositionConstraints:", v20);

}

- (void)_reloadDebugStateData
{
  void *v3;

  -[PKTextInputDebugViewController _statusTableView](self, "_statusTableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

  -[PKTextInputDebugViewController set_needsReloadData:](self, "set_needsReloadData:", 0);
}

- (void)_setVisualizeTargets:(BOOL)a3
{
  if (self->__visualizeTargets != a3)
  {
    self->__visualizeTargets = a3;
    -[PKTextInputDebugViewController _updateTargetsVisualizationView](self, "_updateTargetsVisualizationView");
    if (self->__visualizeTargets)
      -[PKTextInputDebugViewController setNeedsReloadTargetsVisualization](self, "setNeedsReloadTargetsVisualization");
  }
}

- (void)_updateTargetsVisualizationView
{
  _BOOL4 v3;
  void *v4;
  PKTextInputDebugTargetsView *v5;
  void *v6;
  PKTextInputDebugTargetsView *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  id v13;

  v3 = -[PKTextInputDebugViewController _visualizeTargets](self, "_visualizeTargets");
  -[PKTextInputDebugViewController _targetsContainerView](self, "_targetsContainerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 || v4)
  {
    if (v4)
      v11 = v3;
    else
      v11 = 1;
    if ((v11 & 1) == 0)
    {
      -[PKTextInputDebugViewController _targetsContainerView](self, "_targetsContainerView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeFromSuperview");

      -[PKTextInputDebugViewController set_targetsContainerView:](self, "set_targetsContainerView:", 0);
    }
  }
  else
  {
    v5 = [PKTextInputDebugTargetsView alloc];
    -[PKTextInputDebugViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v7 = -[PKTextInputDebugTargetsView initWithFrame:](v5, "initWithFrame:");
    -[PKTextInputDebugViewController set_targetsContainerView:](self, "set_targetsContainerView:", v7);

    -[PKTextInputDebugViewController _targetsContainerView](self, "_targetsContainerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAutoresizingMask:", 18);

    -[PKTextInputDebugViewController view](self, "view");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    -[PKTextInputDebugViewController _targetsContainerView](self, "_targetsContainerView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTextInputDebugViewController _statusContainerView](self, "_statusContainerView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "insertSubview:belowSubview:", v9, v10);

  }
}

- (void)_reloadTargetsVisualization
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  if (-[PKTextInputDebugViewController _visualizeTargets](self, "_visualizeTargets"))
  {
    -[PKTextInputDebugViewController elementsController](self, "elementsController");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    if (v3)
      v5 = *(void **)(v3 + 40);
    else
      v5 = 0;
    v6 = v5;
    objc_msgSend(v6, "allValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x1E0C9AA60];
    if (v7)
      v8 = v7;
    v9 = v8;

    -[PKTextInputDebugViewController _targetsContainerView](self, "_targetsContainerView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setVisualizationElements:", v9);

  }
  -[PKTextInputDebugViewController set_needsReloadTargetsVisualization:](self, "set_needsReloadTargetsVisualization:", 0);
}

- (void)_handleCloseButton:(id)a3
{
  id v4;

  -[PKTextInputDebugViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "debugViewControllerNeedsDismiss:", self);

}

- (void)_handleTargetsButton:(id)a3
{
  -[PKTextInputDebugViewController _setVisualizeTargets:](self, "_setVisualizeTargets:", -[PKTextInputDebugViewController _visualizeTargets](self, "_visualizeTargets", a3) ^ 1);
}

- (void)_handleLogButton:(id)a3
{
  void *v3;
  void *v4;
  NSObject *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[PKTextInputDebugViewController introspectorDataSource](self, "introspectorDataSource", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fullDebugStateDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = os_log_create("com.apple.pencilkit", "PencilTextInput");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1BE213000, v5, OS_LOG_TYPE_DEFAULT, "Pencil Text Input State:\n%@", (uint8_t *)&v6, 0xCu);
  }

}

- (void)_handleRadarButton:(id)a3
{
  PKTextInputDebugSharpenerLog *v4;
  PKTextInputDebugRadarViewController *v5;
  void *v6;
  id v7;

  -[PKTextInputDebugViewController debugLogController](self, "debugLogController", a3);
  v4 = (PKTextInputDebugSharpenerLog *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputDebugLogController sharpenerLogWithCurrentContent](v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v5 = -[PKTextInputDebugRadarViewController initWithSharpenerLog:]([PKTextInputDebugRadarViewController alloc], "initWithSharpenerLog:", v7);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v5);
  objc_msgSend(v6, "setModalPresentationStyle:", 2);
  -[PKTextInputDebugViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  void *v5;
  int64_t v6;

  -[PKTextInputDebugViewController introspectorDataSource](self, "introspectorDataSource", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "debugStateKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  objc_class *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v6, "section"))
    -[PKTextInputDebugViewController _configureCell:forItemAtIndex:](self, "_configureCell:forItemAtIndex:", v10, objc_msgSend(v6, "item"));

  return v10;
}

- (void)_configureCell:(id)a3 forItemAtIndex:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;

  v6 = a3;
  -[PKTextInputDebugViewController introspectorDataSource](self, "introspectorDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "debugStateKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", a4);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  -[PKTextInputDebugViewController introspectorDataSource](self, "introspectorDataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "debugStateTitleForStateKey:", v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKTextInputDebugViewController introspectorDataSource](self, "introspectorDataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "debugStateDescriptionForStateKey:", v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKTextInputDebugViewController introspectorDataSource](self, "introspectorDataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "debugStateCanShowDetailsForStateKey:", v15);

  objc_msgSend(v6, "setTitleText:", v10);
  objc_msgSend(v6, "setValueAttributedText:", v12);
  objc_msgSend(v6, "setShowDetailsButton:", v14);
  objc_msgSend(v6, "setStatusKey:", v15);
  objc_msgSend(v6, "setDelegate:", self);

}

- (void)debugViewTableCellDidTapDetailsButton:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "statusKey");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PKTextInputDebugViewController introspectorDataSource](self, "introspectorDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "debugStateDetailViewControllerForStateKey:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v5);
    objc_msgSend(v6, "setModalPresentationStyle:", 2);
    -[PKTextInputDebugViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);

  }
}

- (PKTextInputDebugStateIntrospector)introspectorDataSource
{
  return self->_introspectorDataSource;
}

- (void)setIntrospectorDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_introspectorDataSource, a3);
}

- (PKTextInputDebugViewControllerDelegate)delegate
{
  return (PKTextInputDebugViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PKTextInputDebugLogController)debugLogController
{
  return self->_debugLogController;
}

- (void)setDebugLogController:(id)a3
{
  objc_storeStrong((id *)&self->_debugLogController, a3);
}

- (PKTextInputElementsController)elementsController
{
  return self->_elementsController;
}

- (unint64_t)statusViewAnchorCorner
{
  return self->_statusViewAnchorCorner;
}

- (UIView)_statusContainerView
{
  return self->__statusContainerView;
}

- (void)set_statusContainerView:(id)a3
{
  objc_storeStrong((id *)&self->__statusContainerView, a3);
}

- (UITableView)_statusTableView
{
  return self->__statusTableView;
}

- (void)set_statusTableView:(id)a3
{
  objc_storeStrong((id *)&self->__statusTableView, a3);
}

- (UIToolbar)_statusViewToolbar
{
  return self->__statusViewToolbar;
}

- (void)set_statusViewToolbar:(id)a3
{
  objc_storeStrong((id *)&self->__statusViewToolbar, a3);
}

- (PKTextInputDebugTargetsView)_targetsContainerView
{
  return self->__targetsContainerView;
}

- (void)set_targetsContainerView:(id)a3
{
  objc_storeStrong((id *)&self->__targetsContainerView, a3);
}

- (NSArray)_statusViewPositionConstraints
{
  return self->__statusViewPositionConstraints;
}

- (void)set_statusViewPositionConstraints:(id)a3
{
  objc_storeStrong((id *)&self->__statusViewPositionConstraints, a3);
}

- (BOOL)_visualizeTargets
{
  return self->__visualizeTargets;
}

- (BOOL)_needsReloadData
{
  return self->__needsReloadData;
}

- (void)set_needsReloadData:(BOOL)a3
{
  self->__needsReloadData = a3;
}

- (BOOL)_needsReloadTargetsVisualization
{
  return self->__needsReloadTargetsVisualization;
}

- (void)set_needsReloadTargetsVisualization:(BOOL)a3
{
  self->__needsReloadTargetsVisualization = a3;
}

- (NSTimer)_autoreloadTimer
{
  return self->__autoreloadTimer;
}

- (void)set_autoreloadTimer:(id)a3
{
  objc_storeStrong((id *)&self->__autoreloadTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__autoreloadTimer, 0);
  objc_storeStrong((id *)&self->__statusViewPositionConstraints, 0);
  objc_storeStrong((id *)&self->__targetsContainerView, 0);
  objc_storeStrong((id *)&self->__statusViewToolbar, 0);
  objc_storeStrong((id *)&self->__statusTableView, 0);
  objc_storeStrong((id *)&self->__statusContainerView, 0);
  objc_storeStrong((id *)&self->_elementsController, 0);
  objc_storeStrong((id *)&self->_debugLogController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_introspectorDataSource, 0);
}

@end

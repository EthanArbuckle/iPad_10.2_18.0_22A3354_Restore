@implementation QLImageAnalysisManager

- (QLImageAnalysisManager)initWithDelegate:(id)a3 presentingView:(id)a4
{
  id v6;
  id v7;
  QLImageAnalysisManager *v8;
  QLImageAnalysisManager *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)QLImageAnalysisManager;
  v8 = -[QLImageAnalysisManager init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[QLImageAnalysisManager setDelegate:](v8, "setDelegate:", v6);
    objc_storeWeak((id *)&v9->_presentingView, v7);
  }
  -[QLImageAnalysisManager _setupImageAnalysis](v9, "_setupImageAnalysis");
  -[QLImageAnalysisManager _setupNotificationsObservation](v9, "_setupNotificationsObservation");
  -[QLImageAnalysisManager startImageAnalysis](v9, "startImageAnalysis");
  -[QLImageAnalysisManager setupAnalysisButtonsContainer](v9, "setupAnalysisButtonsContainer");

  return v9;
}

- (void)_setupImageAnalysis
{
  id v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc_init(MEMORY[0x24BEBFF28]);
  -[QLImageAnalysisManager setImageInteraction:](self, "setImageInteraction:", v3);

  v4 = -[QLImageAnalysisManager _defaultInteractionTypes](self, "_defaultInteractionTypes");
  -[QLImageAnalysisManager imageInteraction](self, "imageInteraction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActiveInteractionTypes:", v4);

  -[QLImageAnalysisManager imageInteraction](self, "imageInteraction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", self);

  -[QLImageAnalysisManager imageInteraction](self, "imageInteraction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAutomaticallyShowVisualSearchResults:", 1);

  -[QLImageAnalysisManager delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "imageAnalysisView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLImageAnalysisManager imageInteraction](self, "imageInteraction");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addInteraction:", v10);

  -[QLImageAnalysisManager _updateAnalysisButtonWithAnimation:](self, "_updateAnalysisButtonWithAnimation:", 1);
}

- (void)_setupNotificationsObservation
{
  double v2;
  uint64_t v4;
  double v5;
  void *v6;
  double Helper_x8__DDDetectionControllerDidDismissActionNotification;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  gotLoadHelper_x8__DDDetectionControllerWillPresentActionNotification(v2);
  v11 = **(id **)(v4 + 912);
  if (v11)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_dataDetectorDetectionControllerWillPresentAction_, v11, 0);

  }
  Helper_x8__DDDetectionControllerDidDismissActionNotification = gotLoadHelper_x8__DDDetectionControllerDidDismissActionNotification(v5);
  v9 = **(_QWORD **)(v8 + 904);
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", Helper_x8__DDDetectionControllerDidDismissActionNotification);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", self, sel_dataDetectorDetectionControllerDidDismissAction_, v9, 0);

  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)QLImageAnalysisManager;
  -[QLImageAnalysisManager dealloc](&v4, sel_dealloc);
}

- (void)_setupAnalysisButtonsContainerInView:(id)a3
{
  id v4;
  UIView *v5;
  UIView *bottomRightButtonsContainer;
  void *v7;
  void *v8;
  NSLayoutConstraint *v9;
  NSLayoutConstraint *bottomRightButtonsContainerRightConstraint;
  double v11;
  void *v12;
  void *v13;
  NSLayoutConstraint *v14;
  NSLayoutConstraint *bottomRightButtonsContainerBottomConstraint;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSLayoutConstraint *v25;
  NSLayoutConstraint *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  UIView *v31;
  UIView *visualSearchViewContainer;
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
  UIView *v45;
  UIView *analysisButtonContainer;
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
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  _QWORD v94[4];
  id v95;
  _QWORD v96[8];
  _QWORD v97[8];
  _QWORD v98[6];

  v98[4] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((_os_feature_enabled_impl() & 1) == 0 && !self->_bottomRightButtonsContainer)
  {
    v5 = (UIView *)objc_opt_new();
    bottomRightButtonsContainer = self->_bottomRightButtonsContainer;
    self->_bottomRightButtonsContainer = v5;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_bottomRightButtonsContainer, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v4, "addSubview:", self->_bottomRightButtonsContainer);
    objc_msgSend(v4, "rightAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView rightAnchor](self->_bottomRightButtonsContainer, "rightAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:", v8);
    v9 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    bottomRightButtonsContainerRightConstraint = self->_bottomRightButtonsContainerRightConstraint;
    self->_bottomRightButtonsContainerRightConstraint = v9;

    LODWORD(v11) = 1148829696;
    -[NSLayoutConstraint setPriority:](self->_bottomRightButtonsContainerRightConstraint, "setPriority:", v11);
    objc_msgSend(v4, "bottomAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](self->_bottomRightButtonsContainer, "bottomAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v13);
    v14 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    bottomRightButtonsContainerBottomConstraint = self->_bottomRightButtonsContainerBottomConstraint;
    self->_bottomRightButtonsContainerBottomConstraint = v14;

    LODWORD(v16) = 1148829696;
    -[NSLayoutConstraint setPriority:](self->_bottomRightButtonsContainerBottomConstraint, "setPriority:", v16);
    v17 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v4, "rightAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView rightAnchor](self->_bottomRightButtonsContainer, "rightAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintGreaterThanOrEqualToAnchor:constant:", v19, 16.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v98[0] = v20;
    v93 = v4;
    objc_msgSend(v4, "safeAreaLayoutGuide");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](self->_bottomRightButtonsContainer, "bottomAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintGreaterThanOrEqualToAnchor:constant:", v23, 12.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = self->_bottomRightButtonsContainerRightConstraint;
    v26 = self->_bottomRightButtonsContainerBottomConstraint;
    v98[1] = v24;
    v98[2] = v25;
    v98[3] = v26;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v98, 4);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "activateConstraints:", v27);

    -[QLImageAnalysisManager imageInteraction](self, "imageInteraction");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "visualSearchCornerView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v29, "superview");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v30)
    {
      v31 = (UIView *)objc_opt_new();
      visualSearchViewContainer = self->_visualSearchViewContainer;
      self->_visualSearchViewContainer = v31;

      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_visualSearchViewContainer, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UIView addSubview:](self->_bottomRightButtonsContainer, "addSubview:", self->_visualSearchViewContainer);
      objc_msgSend(v29, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UIView addSubview:](self->_visualSearchViewContainer, "addSubview:", v29);
      v73 = (void *)MEMORY[0x24BDD1628];
      objc_msgSend(v29, "topAnchor");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView topAnchor](self->_visualSearchViewContainer, "topAnchor");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "constraintEqualToAnchor:", v89);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v97[0] = v87;
      objc_msgSend(v29, "bottomAnchor");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView bottomAnchor](self->_visualSearchViewContainer, "bottomAnchor");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "constraintEqualToAnchor:", v83);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v97[1] = v81;
      objc_msgSend(v29, "trailingAnchor");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView trailingAnchor](self->_visualSearchViewContainer, "trailingAnchor");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "constraintEqualToAnchor:", v77);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v97[2] = v75;
      objc_msgSend(v29, "leadingAnchor");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView leadingAnchor](self->_visualSearchViewContainer, "leadingAnchor");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "constraintEqualToAnchor:", v69);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v97[3] = v67;
      -[UIView trailingAnchor](self->_visualSearchViewContainer, "trailingAnchor");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView trailingAnchor](self->_bottomRightButtonsContainer, "trailingAnchor");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "constraintEqualToAnchor:", v63);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v97[4] = v61;
      -[UIView bottomAnchor](self->_visualSearchViewContainer, "bottomAnchor");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView bottomAnchor](self->_bottomRightButtonsContainer, "bottomAnchor");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "constraintEqualToAnchor:", v57);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v97[5] = v33;
      -[UIView widthAnchor](self->_visualSearchViewContainer, "widthAnchor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView widthAnchor](self->_bottomRightButtonsContainer, "widthAnchor");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "constraintLessThanOrEqualToAnchor:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v97[6] = v36;
      -[UIView heightAnchor](self->_visualSearchViewContainer, "heightAnchor");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView heightAnchor](self->_bottomRightButtonsContainer, "heightAnchor");
      v38 = v29;
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "constraintLessThanOrEqualToAnchor:", v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v97[7] = v40;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v97, 8);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "activateConstraints:", v41);

      v29 = v38;
    }
    -[QLImageAnalysisManager imageInteraction](self, "imageInteraction");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "analysisButton");
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v43, "superview");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v44)
    {
      v45 = (UIView *)objc_opt_new();
      analysisButtonContainer = self->_analysisButtonContainer;
      self->_analysisButtonContainer = v45;

      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_analysisButtonContainer, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UIView addSubview:](self->_bottomRightButtonsContainer, "addSubview:", self->_analysisButtonContainer);
      objc_msgSend(v43, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UIView addSubview:](self->_analysisButtonContainer, "addSubview:", v43);
      v72 = (void *)MEMORY[0x24BDD1628];
      objc_msgSend(v43, "topAnchor");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView topAnchor](self->_analysisButtonContainer, "topAnchor");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "constraintEqualToAnchor:", v88);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v96[0] = v86;
      objc_msgSend(v43, "bottomAnchor");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView bottomAnchor](self->_analysisButtonContainer, "bottomAnchor");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "constraintEqualToAnchor:", v82);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v96[1] = v80;
      objc_msgSend(v43, "trailingAnchor");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView trailingAnchor](self->_analysisButtonContainer, "trailingAnchor");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "constraintEqualToAnchor:", v76);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v96[2] = v74;
      objc_msgSend(v43, "leadingAnchor");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView leadingAnchor](self->_analysisButtonContainer, "leadingAnchor");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "constraintEqualToAnchor:", v68);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v96[3] = v66;
      -[UIView trailingAnchor](self->_analysisButtonContainer, "trailingAnchor");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView trailingAnchor](self->_bottomRightButtonsContainer, "trailingAnchor");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "constraintEqualToAnchor:", v62);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v96[4] = v60;
      -[UIView bottomAnchor](self->_analysisButtonContainer, "bottomAnchor");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView bottomAnchor](self->_bottomRightButtonsContainer, "bottomAnchor");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "constraintEqualToAnchor:", v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v96[5] = v48;
      -[UIView widthAnchor](self->_analysisButtonContainer, "widthAnchor");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView widthAnchor](self->_bottomRightButtonsContainer, "widthAnchor");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "constraintLessThanOrEqualToAnchor:", v50);
      v92 = v29;
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v96[6] = v51;
      -[UIView heightAnchor](self->_analysisButtonContainer, "heightAnchor");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView heightAnchor](self->_bottomRightButtonsContainer, "heightAnchor");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "constraintLessThanOrEqualToAnchor:", v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v96[7] = v54;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v96, 8);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "activateConstraints:", v55);

      v29 = v92;
    }
    v56 = (void *)MEMORY[0x24BEBDB00];
    v94[0] = MEMORY[0x24BDAC760];
    v94[1] = 3221225472;
    v94[2] = __63__QLImageAnalysisManager__setupAnalysisButtonsContainerInView___block_invoke;
    v94[3] = &unk_24C724B00;
    v4 = v93;
    v95 = v93;
    objc_msgSend(v56, "performWithoutAnimation:", v94);

  }
}

uint64_t __63__QLImageAnalysisManager__setupAnalysisButtonsContainerInView___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (unint64_t)_defaultInteractionTypes
{
  if (_os_feature_enabled_impl())
    return 9;
  else
    return 1;
}

- (id)image
{
  void *v2;
  void *v3;

  -[QLImageAnalysisManager delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageForAnalysis");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (VKCImageAnalyzer)imageAnalyzer
{
  VKCImageAnalyzer *imageAnalyzer;
  id v4;
  void *v5;
  void *v6;

  imageAnalyzer = self->_imageAnalyzer;
  if (!imageAnalyzer)
  {
    v4 = objc_alloc_init(MEMORY[0x24BEBFF30]);
    -[QLImageAnalysisManager setImageAnalyzer:](self, "setImageAnalyzer:", v4);

    -[QLImageAnalysisManager imageAnalysisQueue](self, "imageAnalysisQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLImageAnalysisManager imageAnalyzer](self, "imageAnalyzer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCallbackQueue:", v5);

    imageAnalyzer = self->_imageAnalyzer;
  }
  return imageAnalyzer;
}

- (void)_updateAnalysisButtonWithAnimation:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  int v7;
  _BOOL4 isImageAnalysisPopoverPresented;
  uint64_t v9;
  void *v10;
  id v11;

  v3 = a3;
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    -[QLImageAnalysisManager imageInteraction](self, "imageInteraction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "analysis");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    v6 = v11;
    if (v11)
    {
      v7 = objc_msgSend(v11, "hasResultsForAnalysisTypes:", 29);
      if (self->_isFullScreen)
      {
        if (-[QLImageAnalysisManager isVisualSearchEnabled](self, "isVisualSearchEnabled"))
          isImageAnalysisPopoverPresented = self->_isImageAnalysisPopoverPresented;
        else
          isImageAnalysisPopoverPresented = 0;
      }
      else
      {
        isImageAnalysisPopoverPresented = 1;
      }
      v9 = v7 & isImageAnalysisPopoverPresented ^ 1u;
      -[QLImageAnalysisManager imageInteraction](self, "imageInteraction");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setActionInfoViewHidden:animated:", v9, v3);

      v6 = v11;
    }

  }
  else
  {
    -[QLImageAnalysisManager _updateAnalysisButtonContainerWithAnimation:](self, "_updateAnalysisButtonContainerWithAnimation:", v3);
  }
}

- (void)_updateAnalysisButtonContainerWithAnimation:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  int v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  char v12;
  void *v13;
  char v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  char v20;

  v3 = a3;
  -[QLImageAnalysisManager imageInteraction](self, "imageInteraction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "analysis");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = objc_msgSend(v6, "hasResultsForAnalysisTypes:", 13);
  else
    v7 = 0;
  v8 = v7 & !-[QLImageAnalysisManager isVisualSearchEnabled](self, "isVisualSearchEnabled");
  if (self->_isFullScreen)
  {
    -[QLImageAnalysisManager imageInteraction](self, "imageInteraction");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "analysisButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "state");

    v12 = v8 ^ 1;
    if (v11 != 4)
      v12 = 1;
    if ((v12 & 1) == 0)
      goto LABEL_8;
LABEL_12:
    v16 = 0;
    goto LABEL_13;
  }
  if ((v8 & 1) == 0)
    goto LABEL_12;
LABEL_8:
  -[UIView setHidden:](self->_analysisButtonContainer, "setHidden:", 0);
  -[QLImageAnalysisManager delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) != 0)
  {
    -[QLImageAnalysisManager delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "imageAnalyzerWantsUpdateOverlayViews");

  }
  v16 = 1;
LABEL_13:
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __70__QLImageAnalysisManager__updateAnalysisButtonContainerWithAnimation___block_invoke;
  v19[3] = &unk_24C724CF8;
  v19[4] = self;
  v20 = v16;
  v17 = _Block_copy(v19);
  v18 = v17;
  if (v3)
    objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:delay:options:animations:completion:", 5242880, v17, 0, 0.4, 0.0);
  else
    (*((void (**)(void *))v17 + 2))(v17);

}

uint64_t __70__QLImageAnalysisManager__updateAnalysisButtonContainerWithAnimation___block_invoke(uint64_t a1)
{
  double v1;

  v1 = 1.0;
  if (!*(_BYTE *)(a1 + 40))
    v1 = 0.0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setAlpha:", v1);
}

- (void)_activateInteractionTypes:(unint64_t)a3
{
  void *v5;

  -[QLImageAnalysisManager imageInteraction](self, "imageInteraction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActiveInteractionTypes:", a3);

  -[QLImageAnalysisManager _updateAnalysisButtonWithAnimation:](self, "_updateAnalysisButtonWithAnimation:", 1);
  -[QLImageAnalysisManager _updateInfoButtonWithAnimation:](self, "_updateInfoButtonWithAnimation:", 1);
}

- (void)setupAnalysisButtonsContainer
{
  id WeakRetained;
  id v4;

  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_presentingView);

    if (WeakRetained)
    {
      v4 = objc_loadWeakRetained((id *)&self->_presentingView);
      -[QLImageAnalysisManager _setupAnalysisButtonsContainerInView:](self, "_setupAnalysisButtonsContainerInView:", v4);

    }
  }
}

- (id)imageAnalysisQueue
{
  if (imageAnalysisQueue_once != -1)
    dispatch_once(&imageAnalysisQueue_once, &__block_literal_global_12);
  return (id)imageAnalysisQueue_imageAnalysisQueue;
}

void __44__QLImageAnalysisManager_imageAnalysisQueue__block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, 0);
  attr = objc_claimAutoreleasedReturnValue();

  v1 = dispatch_queue_create("com.apple.quicklook.image-analysis", attr);
  v2 = (void *)imageAnalysisQueue_imageAnalysisQueue;
  imageAnalysisQueue_imageAnalysisQueue = (uint64_t)v1;

}

- (void)startImageAnalysis
{
  void *v3;
  NSObject **v4;
  NSObject *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[QLImageAnalysisManager image](self, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (NSObject **)MEMORY[0x24BE7BF48];
  v5 = *MEMORY[0x24BE7BF48];
  if (v3)
  {
    if (!v5)
    {
      QLSInitLogging();
      v5 = *v4;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v16 = 138412290;
      v17 = v3;
      _os_log_impl(&dword_20D4F5000, v5, OS_LOG_TYPE_INFO, "Creating image analysis request for image: %@ #ImageAnalysis", (uint8_t *)&v16, 0xCu);
    }
    -[QLImageAnalysisManager delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "shouldDetectMachineReadableCode");

    if (v7)
      v8 = -1;
    else
      v8 = -13;
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBFF38]), "initWithImage:requestType:", v3, v8);
    -[QLImageAnalysisManager delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      -[QLImageAnalysisManager delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "clientPreviewOptions");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("imageURL"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setImageURL:", v14);

      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("pageURL"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setPageURL:", v15);

    }
    -[QLImageAnalysisManager _startImageAnalysisWithRequest:](self, "_startImageAnalysisWithRequest:", v9);

  }
  else
  {
    if (!v5)
    {
      QLSInitLogging();
      v5 = *v4;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_20D4F5000, v5, OS_LOG_TYPE_ERROR, "Could not create image analysis request because image is nil #ImageAnalysis", (uint8_t *)&v16, 2u);
    }
  }

}

- (void)_startImageAnalysisWithRequest:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  -[QLImageAnalysisManager cancelAllRequests](self, "cancelAllRequests");
  -[QLImageAnalysisManager imageInteraction](self, "imageInteraction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAnalysis:", 0);

  objc_initWeak(&location, self);
  -[QLImageAnalysisManager imageAnalysisQueue](self, "imageAnalysisQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__QLImageAnalysisManager__startImageAnalysisWithRequest___block_invoke;
  block[3] = &unk_24C725348;
  objc_copyWeak(&v10, &location);
  v7 = v4;
  v9 = v7;
  dispatch_async(v6, block);

  -[QLImageAnalysisManager _updateInfoButtonWithAnimation:](self, "_updateInfoButtonWithAnimation:", 1);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __57__QLImageAnalysisManager__startImageAnalysisWithRequest___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  NSObject **v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = (NSObject **)MEMORY[0x24BE7BF48];
    v5 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v5 = *v4;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v12 = v6;
      _os_log_impl(&dword_20D4F5000, v5, OS_LOG_TYPE_INFO, "Processing image analysis request: %@ #ImageAnalysis", buf, 0xCu);
    }
    objc_msgSend(WeakRetained, "imageAnalyzer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __57__QLImageAnalysisManager__startImageAnalysisWithRequest___block_invoke_48;
    v9[3] = &unk_24C726580;
    objc_copyWeak(&v10, v2);
    objc_msgSend(WeakRetained, "setImageAnalysisRequestId:", objc_msgSend(v7, "processRequest:progressHandler:completionHandler:", v8, 0, v9));

    objc_destroyWeak(&v10);
  }

}

void __57__QLImageAnalysisManager__startImageAnalysisWithRequest___block_invoke_48(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  NSObject **v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  NSObject **v15;
  NSObject *v16;
  id *v17;
  id WeakRetained;
  id v19;
  id v20;
  _QWORD block[4];
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    if (objc_msgSend(v6, "code") == -2
      && (objc_msgSend(v7, "domain"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.VisionKit.ImageAnalyzer")),
          v8,
          v9))
    {
      v10 = (NSObject **)MEMORY[0x24BE7BF48];
      v11 = *MEMORY[0x24BE7BF48];
      if (!*MEMORY[0x24BE7BF48])
      {
        QLSInitLogging();
        v11 = *v10;
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v7;
        v12 = "Image analysis cancelled: %@ #ImageAnalysis";
        v13 = v11;
        v14 = OS_LOG_TYPE_INFO;
LABEL_12:
        _os_log_impl(&dword_20D4F5000, v13, v14, v12, buf, 0xCu);
      }
    }
    else
    {
      v15 = (NSObject **)MEMORY[0x24BE7BF48];
      v16 = *MEMORY[0x24BE7BF48];
      if (!*MEMORY[0x24BE7BF48])
      {
        QLSInitLogging();
        v16 = *v15;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v7;
        v12 = "Image analysis failed with error %@ #ImageAnalysis";
        v13 = v16;
        v14 = OS_LOG_TYPE_ERROR;
        goto LABEL_12;
      }
    }
  }
  v17 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v17);
  objc_msgSend(WeakRetained, "setImageAnalysisRequestId:", 0);

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__QLImageAnalysisManager__startImageAnalysisWithRequest___block_invoke_51;
  block[3] = &unk_24C724610;
  objc_copyWeak(&v24, v17);
  v22 = v5;
  v23 = v7;
  v19 = v7;
  v20 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v24);
}

void __57__QLImageAnalysisManager__startImageAnalysisWithRequest___block_invoke_51(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_handleImageAnalysis:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_handleImageAnalysis:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  dispatch_time_t v11;
  void *v12;
  _QWORD block[5];

  v6 = a3;
  v7 = a4;
  -[QLImageAnalysisManager imageInteraction](self, "imageInteraction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v6 || v7)
    v10 = 0;
  else
    v10 = v6;
  objc_msgSend(v8, "setAnalysis:", v10);

  -[QLImageAnalysisManager _updateAnalysisButtonWithAnimation:](self, "_updateAnalysisButtonWithAnimation:", 1);
  -[QLImageAnalysisManager _updateInfoButtonWithAnimation:](self, "_updateInfoButtonWithAnimation:", 1);
  if (self->_shouldEnterVisualSearchAfterNextAnalysis)
  {
    self->_shouldEnterVisualSearchAfterNextAnalysis = 0;
    -[QLImageAnalysisManager activateVisualSearchInteraction](self, "activateVisualSearchInteraction");
  }
  else if (self->_shouldHighlightTextAndDDAfterNextAnalysis)
  {
    self->_shouldHighlightTextAndDDAfterNextAnalysis = 0;
    v11 = dispatch_time(0, 10000000);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __53__QLImageAnalysisManager__handleImageAnalysis_error___block_invoke;
    block[3] = &unk_24C724B00;
    block[4] = self;
    dispatch_after(v11, MEMORY[0x24BDAC9B8], block);
  }
  else if (self->_shouldUpliftSubjectAfterNextAnalysis)
  {
    self->_shouldUpliftSubjectAfterNextAnalysis = 0;
    -[QLImageAnalysisManager imageInteraction](self, "imageInteraction");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSubjectHighlightActive:", 1);

  }
}

void __53__QLImageAnalysisManager__handleImageAnalysis_error___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "imageInteraction");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setHighlightSelectableItems:", 1);

}

- (void)_updateInfoButtonWithAnimation:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  id v7;

  v3 = a3;
  -[QLImageAnalysisManager delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[QLImageAnalysisManager delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageAnalyzerWantsUpdateInfoButtonWithAnimation:", v3);

  }
}

- (void)updateBottomRightContainerPositionForImageView:(id)a3 view:(id)a4
{
  id v6;
  id v7;
  double MaxX;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  if (a3)
  {
    if (a4)
    {
      v6 = a4;
      v7 = a3;
      objc_msgSend(v7, "bounds");
      MaxX = CGRectGetMaxX(v23);
      objc_msgSend(v7, "bounds");
      objc_msgSend(v7, "convertPoint:toView:", v6, MaxX, CGRectGetMaxY(v24));
      v10 = v9;
      v12 = v11;

      objc_msgSend(v6, "frame");
      v13 = CGRectGetMaxX(v25) - v10 + 16.0;
      objc_msgSend(v6, "frame");
      v15 = v14;
      v17 = v16;
      v19 = v18;
      v21 = v20;

      v26.origin.x = v15;
      v26.origin.y = v17;
      v26.size.width = v19;
      v26.size.height = v21;
      v22 = CGRectGetMaxY(v26) - v12 + 12.0;
      -[NSLayoutConstraint setConstant:](self->_bottomRightButtonsContainerRightConstraint, "setConstant:", v13);
      -[NSLayoutConstraint setConstant:](self->_bottomRightButtonsContainerBottomConstraint, "setConstant:", v22);
    }
  }
}

- (void)updateForFullScreen:(BOOL)a3 animated:(BOOL)a4
{
  void *v5;
  _BOOL4 v6;
  _BOOL4 v7;
  char v8;
  void *v9;
  _QWORD v10[5];
  char v11;

  self->_isFullScreen = a3;
  -[QLImageAnalysisManager _updateAnalysisButtonWithAnimation:](self, "_updateAnalysisButtonWithAnimation:", a4);
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    -[QLImageAnalysisManager imageInteraction](self, "imageInteraction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
      goto LABEL_10;
    v6 = -[QLImageAnalysisManager isVisualSearchEnabled](self, "isVisualSearchEnabled");
    if (v6)
      v6 = -[QLImageAnalysisManager hasResultsForVisualSearch](self, "hasResultsForVisualSearch");
    v7 = !self->_isFullScreen || self->_isImageAnalysisPopoverPresented;
    if (v7 && v6)
    {
      -[UIView setHidden:](self->_visualSearchViewContainer, "setHidden:", 0);
      v8 = 1;
    }
    else
    {
LABEL_10:
      v8 = 0;
    }
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __55__QLImageAnalysisManager_updateForFullScreen_animated___block_invoke;
    v10[3] = &unk_24C724CF8;
    v10[4] = self;
    v11 = v8;
    v9 = _Block_copy(v10);
    objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:delay:options:animations:completion:", 5242880, v9, 0, 0.4, 0.0);

  }
}

uint64_t __55__QLImageAnalysisManager_updateForFullScreen_animated___block_invoke(uint64_t a1)
{
  double v1;

  v1 = 1.0;
  if (!*(_BYTE *)(a1 + 40))
    v1 = 0.0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setAlpha:", v1);
}

- (void)stopImageAnalysis
{
  void *v3;
  void *v4;
  void *v5;
  UIView *bottomRightButtonsContainer;

  -[QLImageAnalysisManager _updateInfoButtonWithAnimation:](self, "_updateInfoButtonWithAnimation:", 1);
  -[QLImageAnalysisManager cancelAllRequests](self, "cancelAllRequests");
  -[QLImageAnalysisManager delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageAnalysisView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLImageAnalysisManager imageInteraction](self, "imageInteraction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeInteraction:", v5);

  -[UIView removeFromSuperview](self->_bottomRightButtonsContainer, "removeFromSuperview");
  bottomRightButtonsContainer = self->_bottomRightButtonsContainer;
  self->_bottomRightButtonsContainer = 0;

}

- (void)cancelAllRequests
{
  NSObject **v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = (NSObject **)MEMORY[0x24BE7BF48];
  v4 = *MEMORY[0x24BE7BF48];
  if (!*MEMORY[0x24BE7BF48])
  {
    QLSInitLogging();
    v4 = *v3;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_20D4F5000, v4, OS_LOG_TYPE_INFO, "Cancel all image analysis requests #ImageAnalysis", v6, 2u);
  }
  -[QLImageAnalysisManager imageAnalyzer](self, "imageAnalyzer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancelAllRequests");

}

- (QLToolbarButton)imageAnalysisToolbarButton
{
  QLToolbarButton *v3;
  QLToolbarButton *imageAnalysisToolbarButton;
  void *v5;

  if (!self->_imageAnalysisToolbarButton)
  {
    v3 = (QLToolbarButton *)objc_msgSend(objc_alloc(MEMORY[0x24BE7BFD8]), "initWithIdentifier:", CFSTR("QLVisualSearchButton"));
    imageAnalysisToolbarButton = self->_imageAnalysisToolbarButton;
    self->_imageAnalysisToolbarButton = v3;

    -[QLToolbarButton setPlacement:](self->_imageAnalysisToolbarButton, "setPlacement:", 0);
    -[QLToolbarButton setAccessibilityIdentifier:](self->_imageAnalysisToolbarButton, "setAccessibilityIdentifier:", CFSTR("QLOverlayImageAnalysisButtonAccessibilityIdentifier"));
  }
  -[QLImageAnalysisManager infoButtonGlyphName](self, "infoButtonGlyphName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLToolbarButton setSymbolImageName:](self->_imageAnalysisToolbarButton, "setSymbolImageName:", v5);

  -[QLToolbarButton setUseInternalSymbolImage:](self->_imageAnalysisToolbarButton, "setUseInternalSymbolImage:", 1);
  return self->_imageAnalysisToolbarButton;
}

- (BOOL)hasAnalysis
{
  void *v2;
  void *v3;
  BOOL v4;

  -[QLImageAnalysisManager imageInteraction](self, "imageInteraction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "analysis");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)isAnalysisOngoing
{
  return -[QLImageAnalysisManager imageAnalysisRequestId](self, "imageAnalysisRequestId") != 0;
}

- (BOOL)addInteractionIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  BOOL v8;

  -[QLImageAnalysisManager delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageAnalysisView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[QLImageAnalysisManager imageInteraction](self, "imageInteraction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5
      && (objc_msgSend(v4, "interactions"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v6, "containsObject:", v5),
          v6,
          (v7 & 1) == 0))
    {
      objc_msgSend(v4, "addInteraction:", v5);
      v8 = 1;
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)enableMarkupMode:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  id v10;

  v3 = a3;
  -[QLImageAnalysisManager delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageAnalysisView");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[QLImageAnalysisManager imageInteraction](self, "imageInteraction");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v3 || !v6)
    {
      if (v3)
      {
        objc_msgSend(v10, "interactions");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "containsObject:", v7);

        if (v9)
        {
          if ((objc_msgSend(v7, "activeInteractionTypes") & 4) != 0)
            -[QLImageAnalysisManager _activateInteractionTypes:](self, "_activateInteractionTypes:", -[QLImageAnalysisManager _defaultInteractionTypes](self, "_defaultInteractionTypes"));
          -[QLImageAnalysisManager cancelAllRequests](self, "cancelAllRequests");
          objc_msgSend(v7, "setAnalysis:", 0);
          objc_msgSend(v10, "removeInteraction:", v7);
        }
      }
    }
    else
    {
      objc_msgSend(v10, "addInteraction:", v6);
    }

  }
}

- (BOOL)isInteractionActive
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[QLImageAnalysisManager delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageAnalysisView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[QLImageAnalysisManager imageInteraction](self, "imageInteraction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v4, "interactions");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "containsObject:", v5);

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)hasResultsForVisualSearch
{
  void *v2;
  void *v3;
  char v4;

  -[QLImageAnalysisManager imageInteraction](self, "imageInteraction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "analysis");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "hasResultsForAnalysisTypes:", 16);
  else
    v4 = 0;

  return v4;
}

- (BOOL)isVisualSearchEnabled
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[QLImageAnalysisManager imageInteraction](self, "imageInteraction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = ((unint64_t)objc_msgSend(v2, "activeInteractionTypes") >> 2) & 1;
  else
    LOBYTE(v4) = 0;

  return v4;
}

- (id)infoButtonGlyphName
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  void *v15;

  -[QLImageAnalysisManager imageInteraction](self, "imageInteraction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_7;
  -[QLImageAnalysisManager imageInteraction](self, "imageInteraction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "visualSearchResultItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    -[QLImageAnalysisManager imageInteraction](self, "imageInteraction");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "visualSearchResultItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0
        && (objc_msgSend(v3, "infoButtonGlyphName"),
            v9 = (void *)objc_claimAutoreleasedReturnValue(),
            v9,
            v9))
      {
        objc_msgSend(v3, "infoButtonGlyphName");
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = CFSTR("info.circle.and.sparkles");
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v3, "filledInfoButtonGlyphName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(v3, "filledInfoButtonGlyphName");
          v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_9;
        }
      }
LABEL_8:
      v11 = CFSTR("info.circle.and.sparkles.fill");
LABEL_9:

      goto LABEL_10;
    }
LABEL_7:
    v10 = CFSTR("info.circle.and.sparkles");
    goto LABEL_8;
  }
  v10 = CFSTR("info.circle.and.sparkles");
  v11 = CFSTR("info.circle.and.sparkles.fill");
LABEL_10:
  if (-[QLImageAnalysisManager isVisualSearchEnabled](self, "isVisualSearchEnabled"))
    v12 = v11;
  else
    v12 = v10;
  v13 = v12;

  return v13;
}

- (BOOL)isTextSelectionEnabled
{
  void *v2;
  void *v3;
  char v4;

  -[QLImageAnalysisManager imageInteraction](self, "imageInteraction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && (objc_msgSend(v2, "activeInteractionTypes") & 1) != 0)
    v4 = objc_msgSend(v3, "highlightSelectableItems");
  else
    v4 = 0;

  return v4;
}

- (BOOL)isImageSubjectHighlightingEnabled
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[QLImageAnalysisManager imageInteraction](self, "imageInteraction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = ((unint64_t)objc_msgSend(v2, "activeInteractionTypes") >> 3) & 1;
  else
    LOBYTE(v4) = 0;

  return v4;
}

- (void)infoButtonTapped
{
  unint64_t v3;

  if (-[QLImageAnalysisManager isVisualSearchEnabled](self, "isVisualSearchEnabled"))
    v3 = -[QLImageAnalysisManager _defaultInteractionTypes](self, "_defaultInteractionTypes");
  else
    v3 = 4;
  -[QLImageAnalysisManager _activateInteractionTypes:](self, "_activateInteractionTypes:", v3);
}

- (void)shouldHideInteraction:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a4;
  v5 = a3;
  -[QLImageAnalysisManager delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageAnalysisView");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[QLImageAnalysisManager imageInteraction](self, "imageInteraction");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v13, "interactions");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "containsObject:", v8);

      if (v5 && v10)
      {
        -[QLImageAnalysisManager delegate](self, "delegate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "imageAnalysisView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "removeInteraction:", v8);
LABEL_8:

        -[QLImageAnalysisManager _updateAnalysisButtonWithAnimation:](self, "_updateAnalysisButtonWithAnimation:", v4);
        -[QLImageAnalysisManager _updateInfoButtonWithAnimation:](self, "_updateInfoButtonWithAnimation:", v4);
        goto LABEL_9;
      }
      if (((v5 | v10) & 1) == 0)
      {
        -[QLImageAnalysisManager delegate](self, "delegate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "imageAnalysisView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addInteraction:", v8);
        goto LABEL_8;
      }
    }
LABEL_9:

  }
}

- (void)activateVisualSearchInteraction
{
  -[QLImageAnalysisManager _activateInteractionTypes:](self, "_activateInteractionTypes:", 4);
}

- (BOOL)dataDetectorExistsAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  char v6;

  y = a3.y;
  x = a3.x;
  -[QLImageAnalysisManager imageInteraction](self, "imageInteraction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "dataDetectorExistsAtPoint:", x, y);

  return v6;
}

- (BOOL)textExistsAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  char v6;

  y = a3.y;
  x = a3.x;
  -[QLImageAnalysisManager imageInteraction](self, "imageInteraction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "textExistsAtPoint:", x, y);

  return v6;
}

- (BOOL)imageSubjectExistsAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  char v6;

  y = a3.y;
  x = a3.x;
  -[QLImageAnalysisManager imageInteraction](self, "imageInteraction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "imageSubjectExistsAtPoint:", x, y);

  return v6;
}

- (BOOL)visualSearchExistsAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  char v6;

  y = a3.y;
  x = a3.x;
  -[QLImageAnalysisManager imageInteraction](self, "imageInteraction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "visualSearchExistsAtPoint:", x, y);

  return v6;
}

- (BOOL)actionInfoItemExistsAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  char v6;

  y = a3.y;
  x = a3.x;
  -[QLImageAnalysisManager imageInteraction](self, "imageInteraction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "actionInfoItemExistsAtPoint:", x, y);

  return v6;
}

- (BOOL)hasActiveTextSelection
{
  void *v2;
  char v3;

  -[QLImageAnalysisManager imageInteraction](self, "imageInteraction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasActiveTextSelection");

  return v3;
}

- (void)adjustImageInteractionForScrollView:(id)a3
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
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  id v23;

  v23 = a3;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    -[QLImageAnalysisManager delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageAnalysisView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23 && v5)
    {
      objc_msgSend(v23, "bounds");
      objc_msgSend(v23, "convertRect:toView:", v5);
      v7 = v6;
      v9 = v8;
      v11 = v10;
      v13 = v12;
      objc_msgSend(v5, "bounds");
      v15 = v7 / v14;
      objc_msgSend(v5, "bounds");
      v17 = v9 / v16;
      objc_msgSend(v5, "bounds");
      v19 = v11 / v18;
      objc_msgSend(v5, "bounds");
      v21 = v13 / v20;
      -[QLImageAnalysisManager imageInteraction](self, "imageInteraction");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "scrollViewDidZoomToUnitRect:", v15, v17, v19, v21);

    }
  }

}

- (BOOL)imageAnalysisInteraction:(id)a3 shouldBeginAtPoint:(CGPoint)a4 forAnalysisType:(unint64_t)a5
{
  double y;
  double x;
  id v7;
  char v8;
  char v9;
  char v10;
  char v11;
  char v12;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v8 = objc_msgSend(v7, "textExistsAtPoint:", x, y);
  v9 = objc_msgSend(v7, "imageSubjectExistsAtPoint:", x, y);
  v10 = objc_msgSend(v7, "dataDetectorExistsAtPoint:", x, y);
  v11 = objc_msgSend(v7, "visualSearchExistsAtPoint:", x, y);
  v12 = 1;
  if ((v8 & 1) == 0 && (v9 & 1) == 0 && (v10 & 1) == 0 && (v11 & 1) == 0)
    v12 = objc_msgSend(v7, "hasActiveTextSelection");

  return v12;
}

- (void)imageAnalysisPopoverWillAppear
{
  void *v3;
  char v4;
  id v5;

  self->_isImageAnalysisPopoverPresented = 1;
  -[QLImageAnalysisManager delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[QLImageAnalysisManager delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageAnalysisInteractionWillPresentVisualSearchController");

  }
}

- (void)imageAnalysisPopoverDidDisappear
{
  void *v3;
  char v4;
  id v5;

  self->_isImageAnalysisPopoverPresented = 0;
  -[QLImageAnalysisManager delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[QLImageAnalysisManager delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageAnalysisInteractionDidDismissVisualSearchController");

  }
}

- (void)imageAnalysisInteraction:(id)a3 prepareForCalloutAction:(SEL)a4 competion:(id)a5
{
  void *v7;
  void *v8;
  void (**v9)(void);

  v9 = (void (**)(void))a5;
  NSStringFromSelector(a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("_define:"), CFSTR("_translate:"), CFSTR("_share:"), CFSTR("_addShortcut:"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "containsObject:", v7))
    -[QLImageAnalysisManager imageAnalysisPopoverWillAppear](self, "imageAnalysisPopoverWillAppear");
  v9[2]();

}

- (id)presentingViewControllerForImageAnalysisInteraction:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[QLImageAnalysisManager delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentingViewControllerForImageAnalysisInteraction:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)shouldStartImageAnalysisForPresentationMode:(unint64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFBLL) != 0 && a3 != 5;
}

- (QLImageAnalysisManagerDelegate)delegate
{
  return (QLImageAnalysisManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)shouldHighlightTextAndDDAfterNextAnalysis
{
  return self->_shouldHighlightTextAndDDAfterNextAnalysis;
}

- (void)setShouldHighlightTextAndDDAfterNextAnalysis:(BOOL)a3
{
  self->_shouldHighlightTextAndDDAfterNextAnalysis = a3;
}

- (BOOL)shouldEnterVisualSearchAfterNextAnalysis
{
  return self->_shouldEnterVisualSearchAfterNextAnalysis;
}

- (void)setShouldEnterVisualSearchAfterNextAnalysis:(BOOL)a3
{
  self->_shouldEnterVisualSearchAfterNextAnalysis = a3;
}

- (BOOL)shouldUpliftSubjectAfterNextAnalysis
{
  return self->_shouldUpliftSubjectAfterNextAnalysis;
}

- (void)setShouldUpliftSubjectAfterNextAnalysis:(BOOL)a3
{
  self->_shouldUpliftSubjectAfterNextAnalysis = a3;
}

- (VKCImageAnalysisInteraction)imageInteraction
{
  return self->_imageInteraction;
}

- (void)setImageInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_imageInteraction, a3);
}

- (void)setImageAnalyzer:(id)a3
{
  objc_storeStrong((id *)&self->_imageAnalyzer, a3);
}

- (int)imageAnalysisRequestId
{
  return self->_imageAnalysisRequestId;
}

- (void)setImageAnalysisRequestId:(int)a3
{
  self->_imageAnalysisRequestId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageAnalyzer, 0);
  objc_storeStrong((id *)&self->_imageInteraction, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_bottomRightButtonsContainerBottomConstraint, 0);
  objc_storeStrong((id *)&self->_bottomRightButtonsContainerRightConstraint, 0);
  objc_storeStrong((id *)&self->_visualSearchViewContainer, 0);
  objc_storeStrong((id *)&self->_analysisButtonContainer, 0);
  objc_storeStrong((id *)&self->_bottomRightButtonsContainer, 0);
  objc_destroyWeak((id *)&self->_presentingView);
  objc_storeStrong((id *)&self->_imageAnalysisToolbarButton, 0);
}

@end

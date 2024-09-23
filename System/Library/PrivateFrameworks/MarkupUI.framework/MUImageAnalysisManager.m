@implementation MUImageAnalysisManager

- (MUImageAnalysisManager)initWithDelegate:(id)a3 presentingView:(id)a4
{
  id v6;
  id v7;
  MUImageAnalysisManager *v8;
  MUImageAnalysisManager *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MUImageAnalysisManager;
  v8 = -[MUImageAnalysisManager init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[MUImageAnalysisManager setDelegate:](v8, "setDelegate:", v6);
    -[MUImageAnalysisManager setPresentingView:](v9, "setPresentingView:", v7);
  }
  -[MUImageAnalysisManager _setupImageAnalysis](v9, "_setupImageAnalysis");
  -[MUImageAnalysisManager _setupNotificationsObservation](v9, "_setupNotificationsObservation");
  -[MUImageAnalysisManager startImageAnalysis](v9, "startImageAnalysis");
  -[MUImageAnalysisManager setupAnalysisButtonsContainer](v9, "setupAnalysisButtonsContainer");

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
  -[MUImageAnalysisManager setImageInteraction:](self, "setImageInteraction:", v3);

  v4 = -[MUImageAnalysisManager _defaultInteractionTypes](self, "_defaultInteractionTypes");
  -[MUImageAnalysisManager imageInteraction](self, "imageInteraction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActiveInteractionTypes:", v4);

  -[MUImageAnalysisManager imageInteraction](self, "imageInteraction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", self);

  -[MUImageAnalysisManager imageInteraction](self, "imageInteraction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAutomaticallyShowVisualSearchResults:", 1);

  -[MUImageAnalysisManager delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "imageAnalysisView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUImageAnalysisManager imageInteraction](self, "imageInteraction");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addInteraction:", v10);

  -[MUImageAnalysisManager _updateAnalysisButtonWithAnimation:](self, "_updateAnalysisButtonWithAnimation:", 1);
}

- (void)_setupNotificationsObservation
{
  id *v3;
  void *v4;
  id v5;
  void *v6;
  void **v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v3 = (id *)getDDDetectionControllerWillPresentActionNotificationSymbolLoc_ptr;
  v16 = getDDDetectionControllerWillPresentActionNotificationSymbolLoc_ptr;
  if (!getDDDetectionControllerWillPresentActionNotificationSymbolLoc_ptr)
  {
    v4 = (void *)DataDetectorsUILibrary();
    v3 = (id *)dlsym(v4, "DDDetectionControllerWillPresentActionNotification");
    v14[3] = (uint64_t)v3;
    getDDDetectionControllerWillPresentActionNotificationSymbolLoc_ptr = (uint64_t)v3;
  }
  _Block_object_dispose(&v13, 8);
  if (!v3)
    +[MUImageReader imageDescriptionFromSourceContent:].cold.1();
  v5 = *v3;
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", v13);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_dataDetectorDetectionControllerWillPresentAction_, v5, 0);

  }
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v7 = (void **)getDDDetectionControllerDidDismissActionNotificationSymbolLoc_ptr;
  v16 = getDDDetectionControllerDidDismissActionNotificationSymbolLoc_ptr;
  if (!getDDDetectionControllerDidDismissActionNotificationSymbolLoc_ptr)
  {
    v8 = (void *)DataDetectorsUILibrary();
    v7 = (void **)dlsym(v8, "DDDetectionControllerDidDismissActionNotification");
    v14[3] = (uint64_t)v7;
    getDDDetectionControllerDidDismissActionNotificationSymbolLoc_ptr = (uint64_t)v7;
  }
  _Block_object_dispose(&v13, 8);
  if (!v7)
    +[MUImageReader imageDescriptionFromSourceContent:].cold.1();
  v9 = *v7;
  if (*v7)
  {
    v10 = (void *)MEMORY[0x24BDD16D0];
    v11 = v9;
    objc_msgSend(v10, "defaultCenter", v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", self, sel_dataDetectorDetectionControllerDidDismissAction_, v11, 0);

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
  v4.super_class = (Class)MUImageAnalysisManager;
  -[MUImageAnalysisManager dealloc](&v4, sel_dealloc);
}

- (void)_setupAnalysisButtonsContainerInView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  MUImageAnalysisManager *v23;
  void *v24;
  void *v25;
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
  MUImageAnalysisManager *v90;
  void *v91;
  _QWORD v92[4];
  id v93;
  _QWORD v94[8];
  _QWORD v95[8];
  _QWORD v96[6];

  v96[4] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    -[MUImageAnalysisManager bottomRightButtonsContainer](self, "bottomRightButtonsContainer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v6 = (void *)objc_opt_new();
      -[MUImageAnalysisManager setBottomRightButtonsContainer:](self, "setBottomRightButtonsContainer:", v6);
      objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v4, "addSubview:", v6);
      objc_msgSend(v4, "rightAnchor");
      v90 = self;
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "rightAnchor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "constraintEqualToAnchor:", v8);
      v9 = objc_claimAutoreleasedReturnValue();

      -[MUImageAnalysisManager setBottomRightButtonsContainerRightConstraint:](v90, "setBottomRightButtonsContainerRightConstraint:", v9);
      LODWORD(v10) = 1148829696;
      -[NSLayoutConstraint setPriority:](v90->_bottomRightButtonsContainerRightConstraint, "setPriority:", v10);
      objc_msgSend(v4, "bottomAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "bottomAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "constraintEqualToAnchor:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      -[MUImageAnalysisManager setBottomRightButtonsContainerBottomConstraint:](v90, "setBottomRightButtonsContainerBottomConstraint:", v13);
      LODWORD(v14) = 1148829696;
      objc_msgSend(v13, "setPriority:", v14);
      v83 = (void *)MEMORY[0x24BDD1628];
      objc_msgSend(v4, "rightAnchor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "rightAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "constraintGreaterThanOrEqualToAnchor:constant:", v16, 16.0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v96[0] = v17;
      v88 = v4;
      objc_msgSend(v4, "safeAreaLayoutGuide");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "bottomAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v89 = v6;
      objc_msgSend(v6, "bottomAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "constraintGreaterThanOrEqualToAnchor:constant:", v20, 12.0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v96[1] = v21;
      v96[2] = v9;
      v86 = v13;
      v87 = (void *)v9;
      v96[3] = v13;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v96, 4);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "activateConstraints:", v22);

      v23 = v90;
      -[MUImageAnalysisManager imageInteraction](v90, "imageInteraction");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "visualSearchCornerView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v25, "superview");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v26)
      {
        v27 = (void *)objc_opt_new();
        -[MUImageAnalysisManager setVisualSearchViewContainer:](v90, "setVisualSearchViewContainer:", v27);
        objc_msgSend(v27, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        objc_msgSend(v89, "addSubview:", v27);
        objc_msgSend(v25, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        objc_msgSend(v27, "addSubview:", v25);
        v63 = (void *)MEMORY[0x24BDD1628];
        objc_msgSend(v25, "topAnchor");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "topAnchor");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "constraintEqualToAnchor:", v81);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v95[0] = v79;
        objc_msgSend(v25, "bottomAnchor");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "bottomAnchor");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "constraintEqualToAnchor:", v75);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v95[1] = v73;
        objc_msgSend(v25, "trailingAnchor");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "trailingAnchor");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "constraintEqualToAnchor:", v69);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v95[2] = v67;
        objc_msgSend(v25, "leadingAnchor");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "leadingAnchor");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "constraintEqualToAnchor:", v61);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v95[3] = v59;
        objc_msgSend(v27, "trailingAnchor");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "trailingAnchor");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "constraintEqualToAnchor:", v55);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v95[4] = v53;
        objc_msgSend(v27, "bottomAnchor");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "bottomAnchor");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "constraintEqualToAnchor:", v49);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v95[5] = v28;
        objc_msgSend(v27, "widthAnchor");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "widthAnchor");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "constraintLessThanOrEqualToAnchor:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v95[6] = v31;
        objc_msgSend(v27, "heightAnchor");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "heightAnchor");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "constraintLessThanOrEqualToAnchor:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v95[7] = v34;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v95, 8);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "activateConstraints:", v35);

        v23 = v90;
      }
      -[MUImageAnalysisManager imageInteraction](v23, "imageInteraction");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "analysisButton");
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v37, "superview");
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v38)
      {
        v39 = (void *)objc_opt_new();
        -[MUImageAnalysisManager setAnalysisButtonContainer:](v23, "setAnalysisButtonContainer:", v39);
        objc_msgSend(v39, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        objc_msgSend(v89, "addSubview:", v39);
        objc_msgSend(v37, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        objc_msgSend(v39, "addSubview:", v37);
        v66 = (void *)MEMORY[0x24BDD1628];
        objc_msgSend(v37, "topAnchor");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "topAnchor");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "constraintEqualToAnchor:", v85);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        v94[0] = v82;
        objc_msgSend(v37, "bottomAnchor");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "bottomAnchor");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "constraintEqualToAnchor:", v78);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        v94[1] = v76;
        objc_msgSend(v37, "trailingAnchor");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "trailingAnchor");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "constraintEqualToAnchor:", v72);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v94[2] = v70;
        objc_msgSend(v37, "leadingAnchor");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "leadingAnchor");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "constraintEqualToAnchor:", v64);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v94[3] = v62;
        objc_msgSend(v39, "trailingAnchor");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "trailingAnchor");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "constraintEqualToAnchor:", v58);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v94[4] = v56;
        objc_msgSend(v39, "bottomAnchor");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "bottomAnchor");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "constraintEqualToAnchor:", v52);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v94[5] = v50;
        objc_msgSend(v39, "widthAnchor");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "widthAnchor");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "constraintLessThanOrEqualToAnchor:", v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v94[6] = v42;
        objc_msgSend(v39, "heightAnchor");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "heightAnchor");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "constraintLessThanOrEqualToAnchor:", v44);
        v45 = v25;
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v94[7] = v46;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v94, 8);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "activateConstraints:", v47);

        v25 = v45;
      }
      v48 = (void *)MEMORY[0x24BDF6F90];
      v92[0] = MEMORY[0x24BDAC760];
      v92[1] = 3221225472;
      v92[2] = __63__MUImageAnalysisManager__setupAnalysisButtonsContainerInView___block_invoke;
      v92[3] = &unk_24E5D4068;
      v4 = v88;
      v93 = v88;
      objc_msgSend(v48, "performWithoutAnimation:", v92);

    }
  }

}

uint64_t __63__MUImageAnalysisManager__setupAnalysisButtonsContainerInView___block_invoke(uint64_t a1)
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

  -[MUImageAnalysisManager delegate](self, "delegate");
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
    -[MUImageAnalysisManager setImageAnalyzer:](self, "setImageAnalyzer:", v4);

    -[MUImageAnalysisManager imageAnalysisQueue](self, "imageAnalysisQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUImageAnalysisManager imageAnalyzer](self, "imageAnalyzer");
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
  _BOOL4 v8;
  uint64_t v9;
  void *v10;
  id v11;

  v3 = a3;
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    -[MUImageAnalysisManager imageInteraction](self, "imageInteraction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "analysis");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    v6 = v11;
    if (v11)
    {
      v7 = objc_msgSend(v11, "hasResultsForAnalysisTypes:", 29);
      if (-[MUImageAnalysisManager isFullScreen](self, "isFullScreen"))
      {
        v8 = -[MUImageAnalysisManager isVisualSearchEnabled](self, "isVisualSearchEnabled");
        if (v8)
          v8 = -[MUImageAnalysisManager isImageAnalysisPopoverPresented](self, "isImageAnalysisPopoverPresented");
      }
      else
      {
        v8 = 1;
      }
      v9 = v7 & v8 ^ 1u;
      -[MUImageAnalysisManager imageInteraction](self, "imageInteraction");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setActionInfoViewHidden:animated:", v9, v3);

      v6 = v11;
    }

  }
  else
  {
    -[MUImageAnalysisManager _updateAnalysisButtonContainerWithAnimation:](self, "_updateAnalysisButtonContainerWithAnimation:", v3);
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
  void *v11;
  void *v12;
  char v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  char v18;
  id location;

  v3 = a3;
  -[MUImageAnalysisManager imageInteraction](self, "imageInteraction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "analysis");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = objc_msgSend(v6, "hasResultsForAnalysisTypes:", 13);
  else
    v7 = 0;
  v8 = v7 & !-[MUImageAnalysisManager isVisualSearchEnabled](self, "isVisualSearchEnabled");
  if (-[MUImageAnalysisManager isFullScreen](self, "isFullScreen"))
  {
    -[MUImageAnalysisManager imageInteraction](self, "imageInteraction");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "analysisButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "state") != 4)
      LOBYTE(v8) = 0;

  }
  if ((v8 & 1) != 0)
  {
    -[MUImageAnalysisManager analysisButtonContainer](self, "analysisButtonContainer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setHidden:", 0);

    -[MUImageAnalysisManager delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v12, "imageAnalyzerWantsUpdateOverlayViews");
    v13 = 1;
  }
  else
  {
    -[MUImageAnalysisManager delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
  }
  objc_initWeak(&location, self);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __70__MUImageAnalysisManager__updateAnalysisButtonContainerWithAnimation___block_invoke;
  v16[3] = &unk_24E5D4788;
  objc_copyWeak(&v17, &location);
  v18 = v13;
  v14 = MEMORY[0x2207DC5F0](v16);
  v15 = (void *)v14;
  if (v3)
    objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:options:animations:completion:", 5242880, v14, 0, 0.4, 0.0);
  else
    (*(void (**)(uint64_t))(v14 + 16))(v14);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __70__MUImageAnalysisManager__updateAnalysisButtonContainerWithAnimation___block_invoke(uint64_t a1)
{
  double v1;
  void *v2;
  id WeakRetained;

  if (*(_BYTE *)(a1 + 40))
    v1 = 1.0;
  else
    v1 = 0.0;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "analysisButtonContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", v1);

}

- (void)_activateInteractionTypes:(unint64_t)a3
{
  void *v5;

  -[MUImageAnalysisManager imageInteraction](self, "imageInteraction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActiveInteractionTypes:", a3);

  -[MUImageAnalysisManager _updateAnalysisButtonWithAnimation:](self, "_updateAnalysisButtonWithAnimation:", 1);
  -[MUImageAnalysisManager _updateInfoButtonWithAnimation:](self, "_updateInfoButtonWithAnimation:", 1);
}

- (void)setupAnalysisButtonsContainer
{
  void *v3;
  void *v4;

  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    -[MUImageAnalysisManager presentingView](self, "presentingView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = v3;
      -[MUImageAnalysisManager _setupAnalysisButtonsContainerInView:](self, "_setupAnalysisButtonsContainerInView:", v3);
      v3 = v4;
    }

  }
}

- (id)imageAnalysisQueue
{
  if (imageAnalysisQueue_once != -1)
    dispatch_once(&imageAnalysisQueue_once, &__block_literal_global_2);
  return (id)imageAnalysisQueue_queue;
}

void __44__MUImageAnalysisManager_imageAnalysisQueue__block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, 0);
  attr = objc_claimAutoreleasedReturnValue();

  v1 = dispatch_queue_create("com.apple.markup.image-analysis", attr);
  v2 = (void *)imageAnalysisQueue_queue;
  imageAnalysisQueue_queue = (uint64_t)v1;

}

- (void)startImageAnalysis
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[MUImageAnalysisManager image](self, "image");
  v3 = objc_claimAutoreleasedReturnValue();
  v9 = (id)v3;
  if (v3)
  {
    NSLog(CFSTR("Creating image analysis request for image: %@"), v3);
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBFF38]), "initWithImage:requestType:", v9, -1);
    -[MUImageAnalysisManager delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v5, "clientPreviewOptions");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("imageURL"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setImageURL:", v7);

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("pageURL"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setPageURL:", v8);

    }
    -[MUImageAnalysisManager _startImageAnalysisWithRequest:](self, "_startImageAnalysisWithRequest:", v4);

  }
  else
  {
    NSLog(CFSTR("Could not create image analysis request because image is nil"));
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
  -[MUImageAnalysisManager cancelAllRequests](self, "cancelAllRequests");
  -[MUImageAnalysisManager imageInteraction](self, "imageInteraction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAnalysis:", 0);

  objc_initWeak(&location, self);
  -[MUImageAnalysisManager imageAnalysisQueue](self, "imageAnalysisQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__MUImageAnalysisManager__startImageAnalysisWithRequest___block_invoke;
  block[3] = &unk_24E5D42D0;
  objc_copyWeak(&v10, &location);
  v7 = v4;
  v9 = v7;
  dispatch_async(v6, block);

  -[MUImageAnalysisManager _updateInfoButtonWithAnimation:](self, "_updateInfoButtonWithAnimation:", 1);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __57__MUImageAnalysisManager__startImageAnalysisWithRequest___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    NSLog(CFSTR("Processing image analysis request: %@"), *(_QWORD *)(a1 + 32));
    objc_msgSend(WeakRetained, "imageAnalyzer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __57__MUImageAnalysisManager__startImageAnalysisWithRequest___block_invoke_2;
    v6[3] = &unk_24E5D47D0;
    objc_copyWeak(&v7, v2);
    objc_msgSend(WeakRetained, "setImageAnalysisRequestId:", objc_msgSend(v4, "processRequest:progressHandler:completionHandler:", v5, 0, v6));

    objc_destroyWeak(&v7);
  }

}

void __57__MUImageAnalysisManager__startImageAnalysisWithRequest___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  id *v10;
  id WeakRetained;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;

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
          (v9 & 1) != 0))
    {
      NSLog(CFSTR("Image analysis cancelled: %@"), v7);
    }
    else
    {
      NSLog(CFSTR("Image analysis failed with error %@"), v7);
    }
  }
  v10 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v10);
  objc_msgSend(WeakRetained, "setImageAnalysisRequestId:", 0);

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__MUImageAnalysisManager__startImageAnalysisWithRequest___block_invoke_3;
  block[3] = &unk_24E5D4130;
  objc_copyWeak(&v17, v10);
  v15 = v5;
  v16 = v7;
  v12 = v7;
  v13 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v17);
}

void __57__MUImageAnalysisManager__startImageAnalysisWithRequest___block_invoke_3(uint64_t a1)
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
  -[MUImageAnalysisManager imageInteraction](self, "imageInteraction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v6 || v7)
    v10 = 0;
  else
    v10 = v6;
  objc_msgSend(v8, "setAnalysis:", v10);

  -[MUImageAnalysisManager _updateAnalysisButtonWithAnimation:](self, "_updateAnalysisButtonWithAnimation:", 1);
  -[MUImageAnalysisManager _updateInfoButtonWithAnimation:](self, "_updateInfoButtonWithAnimation:", 1);
  if (self->_shouldEnterVisualSearchAfterNextAnalysis)
  {
    self->_shouldEnterVisualSearchAfterNextAnalysis = 0;
    -[MUImageAnalysisManager activateVisualSearchInteraction](self, "activateVisualSearchInteraction");
  }
  else if (self->_shouldHighlightTextAndDDAfterNextAnalysis)
  {
    self->_shouldHighlightTextAndDDAfterNextAnalysis = 0;
    v11 = dispatch_time(0, 10000000);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __53__MUImageAnalysisManager__handleImageAnalysis_error___block_invoke;
    block[3] = &unk_24E5D4068;
    block[4] = self;
    dispatch_after(v11, MEMORY[0x24BDAC9B8], block);
  }
  else if (self->_shouldUpliftSubjectAfterNextAnalysis)
  {
    self->_shouldUpliftSubjectAfterNextAnalysis = 0;
    -[MUImageAnalysisManager imageInteraction](self, "imageInteraction");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSubjectHighlightActive:", 1);

  }
}

void __53__MUImageAnalysisManager__handleImageAnalysis_error___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "imageInteraction");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setHighlightSelectableItems:", 1);

}

- (void)_updateInfoButtonWithAnimation:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;

  v3 = a3;
  -[MUImageAnalysisManager delegate](self, "delegate");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    v7 = (void *)v4;
    v6 = objc_opt_respondsToSelector();
    v5 = v7;
    if ((v6 & 1) != 0)
    {
      objc_msgSend(v7, "imageAnalyzerWantsUpdateInfoButtonWithAnimation:", v3);
      v5 = v7;
    }
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
  void *v23;
  id v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  if (a3)
  {
    if (a4)
    {
      v6 = a4;
      v7 = a3;
      objc_msgSend(v7, "bounds");
      MaxX = CGRectGetMaxX(v25);
      objc_msgSend(v7, "bounds");
      objc_msgSend(v7, "convertPoint:toView:", v6, MaxX, CGRectGetMaxY(v26));
      v10 = v9;
      v12 = v11;

      objc_msgSend(v6, "frame");
      v13 = CGRectGetMaxX(v27) - v10 + 16.0;
      objc_msgSend(v6, "frame");
      v15 = v14;
      v17 = v16;
      v19 = v18;
      v21 = v20;

      v28.origin.x = v15;
      v28.origin.y = v17;
      v28.size.width = v19;
      v28.size.height = v21;
      v22 = CGRectGetMaxY(v28) - v12 + 12.0;
      -[MUImageAnalysisManager bottomRightButtonsContainerRightConstraint](self, "bottomRightButtonsContainerRightConstraint");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setConstant:", v13);

      -[MUImageAnalysisManager bottomRightButtonsContainerBottomConstraint](self, "bottomRightButtonsContainerBottomConstraint");
      v24 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setConstant:", v22);

    }
  }
}

- (void)updateForFullScreen:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  _BOOL4 v7;
  _BOOL4 v8;
  void *v9;
  char v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  char v14;
  id location;

  v4 = a4;
  -[MUImageAnalysisManager setIsFullScreen:](self, "setIsFullScreen:", a3);
  -[MUImageAnalysisManager _updateAnalysisButtonWithAnimation:](self, "_updateAnalysisButtonWithAnimation:", v4);
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    -[MUImageAnalysisManager imageInteraction](self, "imageInteraction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6
      && (!-[MUImageAnalysisManager isVisualSearchEnabled](self, "isVisualSearchEnabled")
        ? (v7 = 0)
        : (v7 = -[MUImageAnalysisManager hasResultsForVisualSearch](self, "hasResultsForVisualSearch")),
          !-[MUImageAnalysisManager isFullScreen](self, "isFullScreen")
        ? (v8 = 1)
        : (v8 = -[MUImageAnalysisManager isImageAnalysisPopoverPresented](self, "isImageAnalysisPopoverPresented")),
          v8 && v7))
    {
      -[MUImageAnalysisManager visualSearchViewContainer](self, "visualSearchViewContainer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setHidden:", 0);

      v10 = 1;
    }
    else
    {
      v10 = 0;
    }
    objc_initWeak(&location, self);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __55__MUImageAnalysisManager_updateForFullScreen_animated___block_invoke;
    v12[3] = &unk_24E5D4788;
    objc_copyWeak(&v13, &location);
    v14 = v10;
    v11 = (void *)MEMORY[0x2207DC5F0](v12);
    objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:options:animations:completion:", 5242880, v11, 0, 0.4, 0.0);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);

  }
}

void __55__MUImageAnalysisManager_updateForFullScreen_animated___block_invoke(uint64_t a1)
{
  double v1;
  void *v2;
  id WeakRetained;

  if (*(_BYTE *)(a1 + 40))
    v1 = 1.0;
  else
    v1 = 0.0;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "visualSearchViewContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", v1);

}

- (void)stopImageAnalysis
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[MUImageAnalysisManager _updateInfoButtonWithAnimation:](self, "_updateInfoButtonWithAnimation:", 1);
  -[MUImageAnalysisManager cancelAllRequests](self, "cancelAllRequests");
  -[MUImageAnalysisManager delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageAnalysisView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUImageAnalysisManager imageInteraction](self, "imageInteraction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeInteraction:", v5);

  -[MUImageAnalysisManager bottomRightButtonsContainer](self, "bottomRightButtonsContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeFromSuperview");

  -[MUImageAnalysisManager setBottomRightButtonsContainer:](self, "setBottomRightButtonsContainer:", 0);
}

- (void)cancelAllRequests
{
  id v3;

  NSLog(CFSTR("Cancel all image analysis requests"), a2);
  -[MUImageAnalysisManager imageAnalyzer](self, "imageAnalyzer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelAllRequests");

}

- (BOOL)hasAnalysis
{
  void *v2;
  void *v3;
  BOOL v4;

  -[MUImageAnalysisManager imageInteraction](self, "imageInteraction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "analysis");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)isAnalysisOngoing
{
  return -[MUImageAnalysisManager imageAnalysisRequestId](self, "imageAnalysisRequestId") != 0;
}

- (BOOL)addInteractionIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  BOOL v8;

  -[MUImageAnalysisManager delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageAnalysisView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MUImageAnalysisManager imageInteraction](self, "imageInteraction");
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
  -[MUImageAnalysisManager delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageAnalysisView");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[MUImageAnalysisManager imageInteraction](self, "imageInteraction");
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
            -[MUImageAnalysisManager _activateInteractionTypes:](self, "_activateInteractionTypes:", -[MUImageAnalysisManager _defaultInteractionTypes](self, "_defaultInteractionTypes"));
          -[MUImageAnalysisManager cancelAllRequests](self, "cancelAllRequests");
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

  -[MUImageAnalysisManager delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageAnalysisView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MUImageAnalysisManager imageInteraction](self, "imageInteraction");
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

  -[MUImageAnalysisManager imageInteraction](self, "imageInteraction");
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

  -[MUImageAnalysisManager imageInteraction](self, "imageInteraction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = ((unint64_t)objc_msgSend(v2, "activeInteractionTypes") >> 2) & 1;
  else
    LOBYTE(v4) = 0;

  return v4;
}

- (NSString)infoButtonGlyphName
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[MUImageAnalysisManager imageInteraction](self, "imageInteraction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MUImageAnalysisManager imageInteraction](self, "imageInteraction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "visualSearchResultItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v7, "infoButtonGlyphName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
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
  return (NSString *)v8;
}

- (NSString)filledInfoButtonGlyphName
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[MUImageAnalysisManager imageInteraction](self, "imageInteraction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MUImageAnalysisManager imageInteraction](self, "imageInteraction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "visualSearchResultItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v7, "filledInfoButtonGlyphName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
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
  return (NSString *)v8;
}

- (BOOL)isTextSelectionEnabled
{
  void *v2;
  void *v3;
  char v4;

  -[MUImageAnalysisManager imageInteraction](self, "imageInteraction");
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

  -[MUImageAnalysisManager imageInteraction](self, "imageInteraction");
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

  if (-[MUImageAnalysisManager isVisualSearchEnabled](self, "isVisualSearchEnabled"))
    v3 = -[MUImageAnalysisManager _defaultInteractionTypes](self, "_defaultInteractionTypes");
  else
    v3 = 4;
  -[MUImageAnalysisManager _activateInteractionTypes:](self, "_activateInteractionTypes:", v3);
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
  id v12;

  v4 = a4;
  v5 = a3;
  -[MUImageAnalysisManager delegate](self, "delegate");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "imageAnalysisView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[MUImageAnalysisManager imageInteraction](self, "imageInteraction");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v7, "interactions");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "containsObject:", v8);

      if (v5 && v10)
      {
        objc_msgSend(v12, "imageAnalysisView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "removeInteraction:", v8);
LABEL_8:

        -[MUImageAnalysisManager _updateAnalysisButtonWithAnimation:](self, "_updateAnalysisButtonWithAnimation:", v4);
        -[MUImageAnalysisManager _updateInfoButtonWithAnimation:](self, "_updateInfoButtonWithAnimation:", v4);
        goto LABEL_9;
      }
      if (((v5 | v10) & 1) == 0)
      {
        objc_msgSend(v12, "imageAnalysisView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addInteraction:", v8);
        goto LABEL_8;
      }
    }
LABEL_9:

  }
}

- (void)activateVisualSearchInteraction
{
  -[MUImageAnalysisManager _activateInteractionTypes:](self, "_activateInteractionTypes:", 4);
}

- (BOOL)dataDetectorExistsAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  char v6;

  y = a3.y;
  x = a3.x;
  -[MUImageAnalysisManager imageInteraction](self, "imageInteraction");
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
  -[MUImageAnalysisManager imageInteraction](self, "imageInteraction");
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
  -[MUImageAnalysisManager imageInteraction](self, "imageInteraction");
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
  -[MUImageAnalysisManager imageInteraction](self, "imageInteraction");
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
  -[MUImageAnalysisManager imageInteraction](self, "imageInteraction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "actionInfoItemExistsAtPoint:", x, y);

  return v6;
}

- (BOOL)hasActiveTextSelection
{
  void *v2;
  char v3;

  -[MUImageAnalysisManager imageInteraction](self, "imageInteraction");
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
    -[MUImageAnalysisManager delegate](self, "delegate");
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
      -[MUImageAnalysisManager imageInteraction](self, "imageInteraction");
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
  id v3;

  -[MUImageAnalysisManager setIsImageAnalysisPopoverPresented:](self, "setIsImageAnalysisPopoverPresented:", 1);
  -[MUImageAnalysisManager delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "imageAnalysisInteractionWillPresentVisualSearchController");

}

- (void)imageAnalysisPopoverDidDisappear
{
  id v3;

  -[MUImageAnalysisManager setIsImageAnalysisPopoverPresented:](self, "setIsImageAnalysisPopoverPresented:", 0);
  -[MUImageAnalysisManager delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "imageAnalysisInteractionDidDismissVisualSearchController");

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
    -[MUImageAnalysisManager imageAnalysisPopoverWillAppear](self, "imageAnalysisPopoverWillAppear");
  v9[2]();

}

- (id)presentingViewControllerForImageAnalysisInteraction:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MUImageAnalysisManager delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentingViewControllerForImageAnalysisInteraction:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)shouldStartImageAnalysisForPresentationMode:(unint64_t)a3
{
  return a3 == 0;
}

- (MUImageAnalysisManagerDelegate)delegate
{
  return (MUImageAnalysisManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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

- (UIView)visualSearchViewContainer
{
  return self->_visualSearchViewContainer;
}

- (void)setVisualSearchViewContainer:(id)a3
{
  objc_storeStrong((id *)&self->_visualSearchViewContainer, a3);
}

- (UIView)analysisButtonContainer
{
  return self->_analysisButtonContainer;
}

- (void)setAnalysisButtonContainer:(id)a3
{
  objc_storeStrong((id *)&self->_analysisButtonContainer, a3);
}

- (UIView)bottomRightButtonsContainer
{
  return self->_bottomRightButtonsContainer;
}

- (void)setBottomRightButtonsContainer:(id)a3
{
  objc_storeStrong((id *)&self->_bottomRightButtonsContainer, a3);
}

- (NSLayoutConstraint)bottomRightButtonsContainerRightConstraint
{
  return self->_bottomRightButtonsContainerRightConstraint;
}

- (void)setBottomRightButtonsContainerRightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_bottomRightButtonsContainerRightConstraint, a3);
}

- (NSLayoutConstraint)bottomRightButtonsContainerBottomConstraint
{
  return self->_bottomRightButtonsContainerBottomConstraint;
}

- (void)setBottomRightButtonsContainerBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_bottomRightButtonsContainerBottomConstraint, a3);
}

- (UIView)presentingView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_presentingView);
}

- (void)setPresentingView:(id)a3
{
  objc_storeWeak((id *)&self->_presentingView, a3);
}

- (int)imageAnalysisRequestId
{
  return self->_imageAnalysisRequestId;
}

- (void)setImageAnalysisRequestId:(int)a3
{
  self->_imageAnalysisRequestId = a3;
}

- (BOOL)isFullScreen
{
  return self->_isFullScreen;
}

- (void)setIsFullScreen:(BOOL)a3
{
  self->_isFullScreen = a3;
}

- (BOOL)isImageAnalysisPopoverPresented
{
  return self->_isImageAnalysisPopoverPresented;
}

- (void)setIsImageAnalysisPopoverPresented:(BOOL)a3
{
  self->_isImageAnalysisPopoverPresented = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentingView);
  objc_storeStrong((id *)&self->_bottomRightButtonsContainerBottomConstraint, 0);
  objc_storeStrong((id *)&self->_bottomRightButtonsContainerRightConstraint, 0);
  objc_storeStrong((id *)&self->_bottomRightButtonsContainer, 0);
  objc_storeStrong((id *)&self->_analysisButtonContainer, 0);
  objc_storeStrong((id *)&self->_visualSearchViewContainer, 0);
  objc_storeStrong((id *)&self->_imageAnalyzer, 0);
  objc_storeStrong((id *)&self->_imageInteraction, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

@implementation WFCameraOverlayView

- (WFCameraOverlayView)initWithFrame:(CGRect)a3
{
  WFCameraOverlayView *v3;
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
  void *v19;
  WFCameraFlashButton *v20;
  void *v21;
  WFCameraShutterButton *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
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
  WFCameraFlashButton *v79;
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
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  WFVolumeButtonManager *v117;
  WFVolumeButtonManager *v118;
  void *v120;
  void *v121;
  WFCameraFlashButton *v122;
  void *v123;
  _QWORD v124[4];
  id v125;
  id location;
  objc_super v127;

  v127.receiver = self;
  v127.super_class = (Class)WFCameraOverlayView;
  v3 = -[WFCameraOverlayView initWithFrame:](&v127, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x24BEBDB00]);
    objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBackgroundColor:", v5);

    -[WFCameraOverlayView addSubview:](v3, "addSubview:", v4);
    objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    WFLocalizedString(CFSTR("Switches between the front and back facing cameras"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAccessibilityHint:", v7);

    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTintColor:", v8);

    objc_msgSend(MEMORY[0x24BEC14E0], "actionKitImageNamed:", CFSTR("CameraFlip"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UIImage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setImage:forState:", v10, 0);

    WFLocalizedString(CFSTR("Camera flip"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAccessibilityLabel:", v11);

    objc_msgSend(v6, "addTarget:action:forControlEvents:", v3, sel_flipPressed, 64);
    v123 = v6;
    -[WFCameraOverlayView setFlipButton:](v3, "setFlipButton:", v6);
    v12 = objc_alloc_init(MEMORY[0x24BEBD708]);
    objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTextColor:", v13);

    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 18.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFont:", v14);

    objc_msgSend(v12, "setNumberOfLines:", 2);
    objc_msgSend(v12, "setTextAlignment:", 1);
    objc_msgSend(v4, "addSubview:", v12);
    -[WFCameraOverlayView setPhotosLabel:](v3, "setPhotosLabel:", v12);
    -[WFCameraOverlayView updatePhotosLabel](v3, "updatePhotosLabel");
    objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTintColor:", v16);

    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 18.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "titleLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setFont:", v17);

    WFLocalizedString(CFSTR("Cancel"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTitle:forState:", v19, 0);

    objc_msgSend(v15, "addTarget:action:forControlEvents:", v3, sel_cancelPressed, 64);
    objc_msgSend(v4, "addSubview:", v15);
    v20 = objc_alloc_init(WFCameraFlashButton);
    -[WFCameraFlashButton setTranslatesAutoresizingMaskIntoConstraints:](v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[WFCameraOverlayView pickerController](v3, "pickerController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFCameraFlashButton setFlashMode:](v20, "setFlashMode:", objc_msgSend(v21, "cameraFlashMode"));

    -[WFCameraFlashButton addTarget:action:forControlEvents:](v20, "addTarget:action:forControlEvents:", v3, sel_flashValueChanged, 4096);
    -[WFCameraOverlayView addSubview:](v3, "addSubview:", v20);
    -[WFCameraOverlayView setFlashButton:](v3, "setFlashButton:", v20);
    v22 = objc_alloc_init(WFCameraShutterButton);
    -[WFCameraShutterButton setTranslatesAutoresizingMaskIntoConstraints:](v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[WFCameraShutterButton addTarget:action:forControlEvents:](v22, "addTarget:action:forControlEvents:", v3, sel_shutterPressed, 64);
    objc_msgSend(v4, "addSubview:", v22);
    -[WFCameraOverlayView setShutterButton:](v3, "setShutterButton:", v22);
    v23 = objc_alloc_init(MEMORY[0x24BEBDB00]);
    objc_msgSend(v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setBackgroundColor:", v24);

    objc_msgSend(v23, "setAlpha:", 0.0);
    -[WFCameraOverlayView addSubview:](v3, "addSubview:", v23);
    -[WFCameraOverlayView sendSubviewToBack:](v3, "sendSubviewToBack:", v23);
    -[WFCameraOverlayView setFlashView:](v3, "setFlashView:", v23);
    -[WFCameraShutterButton centerXAnchor](v22, "centerXAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "centerXAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addConstraint:", v27);

    -[WFCameraShutterButton centerYAnchor](v22, "centerYAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "centerYAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addConstraint:", v30);

    v120 = v23;
    _NSDictionaryOfVariableBindings(CFSTR("sidebarView, flashView"), v4, v23, 0);
    v31 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[flashView]|"), 0, 0, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFCameraOverlayView addConstraints:](v3, "addConstraints:", v32);

    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[flashView]|"), 0, 0, v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFCameraOverlayView addConstraints:](v3, "addConstraints:", v33);

    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "userInterfaceIdiom");

    v121 = (void *)v31;
    v122 = v20;
    if (v35 == 1)
    {
      v36 = v123;
      objc_msgSend(v4, "addSubview:", v123);
      -[WFCameraFlashButton removeFromSuperview](v20, "removeFromSuperview");
      objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[sidebarView]|"), 0, 0, v31);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFCameraOverlayView addConstraints:](v3, "addConstraints:", v37);

      objc_msgSend(v4, "rightAnchor");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFCameraOverlayView rightAnchor](v3, "rightAnchor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "constraintEqualToAnchor:", v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFCameraOverlayView addConstraint:](v3, "addConstraint:", v40);

      objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4, 7, 0, 0, 0, 1.0, 102.0);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addConstraint:", v41);

      objc_msgSend(v15, "centerXAnchor");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "centerXAnchor");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "constraintEqualToAnchor:", v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addConstraint:", v44);

      objc_msgSend(v15, "centerYAnchor");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "bottomAnchor");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "constraintEqualToAnchor:constant:", v46, -40.0);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addConstraint:", v47);

      objc_msgSend(v15, "centerXAnchor");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "centerXAnchor");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "constraintEqualToAnchor:", v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addConstraint:", v50);

      objc_msgSend(v15, "leadingAnchor");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "layoutMarginsGuide");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "leadingAnchor");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "constraintGreaterThanOrEqualToAnchor:", v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addConstraint:", v54);

      objc_msgSend(v15, "trailingAnchor");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "layoutMarginsGuide");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "trailingAnchor");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "constraintLessThanOrEqualToAnchor:", v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addConstraint:", v58);

      objc_msgSend(v123, "centerXAnchor");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "centerXAnchor");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "constraintEqualToAnchor:", v60);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addConstraint:", v61);

      objc_msgSend(v123, "centerYAnchor");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "topAnchor");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "constraintEqualToAnchor:constant:", v63, 40.0);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addConstraint:", v64);

      objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v12, 10, 0, v4, 10, 1.5, 0.0);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addConstraint:", v65);

      objc_msgSend(v12, "centerXAnchor");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "centerXAnchor");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "constraintEqualToAnchor:", v67);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addConstraint:", v68);

      objc_msgSend(v12, "leadingAnchor");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "layoutMarginsGuide");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "leadingAnchor");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "constraintGreaterThanOrEqualToAnchor:", v71);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addConstraint:", v72);

      objc_msgSend(v12, "trailingAnchor");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "layoutMarginsGuide");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "trailingAnchor");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "constraintLessThanOrEqualToAnchor:", v75);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addConstraint:", v76);

    }
    else
    {
      -[WFCameraOverlayView addSubview:](v3, "addSubview:", v123);
      objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-[sidebarView]-|"), 0, 0, v31);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFCameraOverlayView addConstraints:](v3, "addConstraints:", v77);

      -[WFCameraFlashButton topAnchor](v20, "topAnchor");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFCameraOverlayView safeAreaLayoutGuide](v3, "safeAreaLayoutGuide");
      v79 = v20;
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "topAnchor");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "constraintEqualToAnchor:", v81);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFCameraOverlayView addConstraint:](v3, "addConstraint:", v82);

      objc_msgSend(v4, "bottomAnchor");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFCameraOverlayView layoutMarginsGuide](v3, "layoutMarginsGuide");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "bottomAnchor");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "constraintEqualToAnchor:", v85);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFCameraOverlayView addConstraint:](v3, "addConstraint:", v86);

      objc_msgSend(v123, "topAnchor");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFCameraOverlayView layoutMarginsGuide](v3, "layoutMarginsGuide");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "topAnchor");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "constraintEqualToAnchor:", v89);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFCameraOverlayView addConstraint:](v3, "addConstraint:", v90);

      objc_msgSend(v123, "rightAnchor");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFCameraOverlayView layoutMarginsGuide](v3, "layoutMarginsGuide");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "rightAnchor");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "constraintEqualToAnchor:", v93);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFCameraOverlayView addConstraint:](v3, "addConstraint:", v94);

      -[WFCameraFlashButton leftAnchor](v79, "leftAnchor");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFCameraOverlayView layoutMarginsGuide](v3, "layoutMarginsGuide");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "leftAnchor");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "constraintEqualToAnchor:", v97);
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFCameraOverlayView addConstraint:](v3, "addConstraint:", v98);

      objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4, 8, 0, 0, 0, 1.0, 102.0);
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addConstraint:", v99);

      objc_msgSend(v15, "centerYAnchor");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "centerYAnchor");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "constraintEqualToAnchor:", v101);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addConstraint:", v102);

      objc_msgSend(v15, "leadingAnchor");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "layoutMarginsGuide");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v104, "leadingAnchor");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "constraintEqualToAnchor:", v105);
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addConstraint:", v106);

      objc_msgSend(v15, "trailingAnchor");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFCameraShutterButton leadingAnchor](v22, "leadingAnchor");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v107, "constraintLessThanOrEqualToAnchor:constant:", v108, -10.0);
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addConstraint:", v109);

      objc_msgSend(v12, "centerYAnchor");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "centerYAnchor");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v110, "constraintEqualToAnchor:", v111);
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addConstraint:", v112);

      objc_msgSend(v12, "trailingAnchor");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "layoutMarginsGuide");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v114, "trailingAnchor");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v113, "constraintEqualToAnchor:", v115);
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addConstraint:", v116);

      objc_msgSend(v12, "leadingAnchor");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFCameraShutterButton trailingAnchor](v22, "trailingAnchor");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "constraintGreaterThanOrEqualToAnchor:constant:", v74, 10.0);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addConstraint:", v75);
      v36 = v123;
    }

    -[WFCameraOverlayView updateButtons](v3, "updateButtons");
    objc_initWeak(&location, v3);
    v117 = [WFVolumeButtonManager alloc];
    v124[0] = MEMORY[0x24BDAC760];
    v124[1] = 3221225472;
    v124[2] = __37__WFCameraOverlayView_initWithFrame___block_invoke;
    v124[3] = &unk_24E3428F8;
    objc_copyWeak(&v125, &location);
    v118 = -[WFVolumeButtonManager initWithPressHandler:](v117, "initWithPressHandler:", v124);
    -[WFCameraOverlayView setVolumeButtonManager:](v3, "setVolumeButtonManager:", v118);

    objc_destroyWeak(&v125);
    objc_destroyWeak(&location);

  }
  return v3;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double MinY;
  CGFloat MaxY;
  void *v17;
  CGAffineTransform v18;
  CGAffineTransform v19;
  objc_super v20;
  CGRect v21;
  CGRect v22;

  v20.receiver = self;
  v20.super_class = (Class)WFCameraOverlayView;
  -[WFCameraOverlayView layoutSubviews](&v20, sel_layoutSubviews);
  -[WFCameraOverlayView flipButton](self, "flipButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", self);

  if (v5)
  {
    -[WFCameraOverlayView flipButton](self, "flipButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "frame");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;

    v21.origin.x = v8;
    v21.origin.y = v10;
    v21.size.width = v12;
    v21.size.height = v14;
    MinY = CGRectGetMinY(v21);
    v22.origin.x = v8;
    v22.origin.y = v10;
    v22.size.width = v12;
    v22.size.height = v14;
    MaxY = CGRectGetMaxY(v22);
    CGAffineTransformMakeTranslation(&v19, 0.0, MinY + MaxY);
    -[WFCameraOverlayView pickerController](self, "pickerController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v19;
    objc_msgSend(v17, "setCameraViewTransform:", &v18);

  }
}

- (void)shutterPressed
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[WFCameraOverlayView shutterButton](self, "shutterButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEnabled:", 0);

  -[WFCameraOverlayView setTakenPhotos:](self, "setTakenPhotos:", -[WFCameraOverlayView takenPhotos](self, "takenPhotos") + 1);
  -[WFCameraOverlayView pickerController](self, "pickerController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "takePicture");

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __37__WFCameraOverlayView_shutterPressed__block_invoke;
  v5[3] = &unk_24E343958;
  v5[4] = self;
  objc_msgSend(MEMORY[0x24BEBDB00], "animateKeyframesWithDuration:delay:options:animations:completion:", 0, v5, 0, 0.200000003, 0.0);
}

- (void)updatePhotosLabel
{
  void *v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  int64_t takenPhotos;
  int64_t totalPhotos;
  void *v16;
  void *v17;
  id v18;

  if (self->_totalPhotos > 1)
  {
    v3 = (void *)MEMORY[0x24BDD17C8];
    v4 = CFSTR("of %d\nphotos");
    v5 = CFSTR("of %d\nphotos");
    if (objc_msgSend(CFSTR("of %d\nphotos"), "length"))
    {
      v6 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(CFSTR("of %d\nphotos"), "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(" "));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ (Pluralization)"), v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      WFCurrentBundle();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedStringForKey:value:table:", v8, CFSTR("of %d\nphotos"), 0);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = CFSTR("of %d\nphotos");
    }

    objc_msgSend(v3, "localizedStringWithFormat:", v4, self->_totalPhotos);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\\n"), CFSTR("\n"));
    v18 = (id)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x24BDD17C8];
    WFLocalizedString(CFSTR("%1$d %2$@"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    takenPhotos = self->_takenPhotos;
    if (takenPhotos + 1 < self->_totalPhotos)
      totalPhotos = takenPhotos + 1;
    else
      totalPhotos = self->_totalPhotos;
    objc_msgSend(v12, "localizedStringWithFormat:", v13, totalPhotos, v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFCameraOverlayView photosLabel](self, "photosLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setText:", v16);

  }
  else
  {
    -[WFCameraOverlayView photosLabel](self, "photosLabel");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setText:", 0);
  }

}

- (void)setTakenPhotos:(int64_t)a3
{
  self->_takenPhotos = a3;
  -[WFCameraOverlayView updatePhotosLabel](self, "updatePhotosLabel");
}

- (void)setTotalPhotos:(int64_t)a3
{
  self->_totalPhotos = a3;
  -[WFCameraOverlayView updatePhotosLabel](self, "updatePhotosLabel");
}

- (void)flipPressed
{
  void *v3;
  _BOOL8 v4;
  void *v5;

  -[WFCameraOverlayView pickerController](self, "pickerController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "cameraDevice") != 1;

  -[WFCameraOverlayView pickerController](self, "pickerController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCameraDevice:", v4);

  -[WFCameraOverlayView updateButtons](self, "updateButtons");
}

- (void)cancelPressed
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;

  -[WFCameraOverlayView pickerController](self, "pickerController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[WFCameraOverlayView pickerController](self, "pickerController");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFCameraOverlayView pickerController](self, "pickerController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imagePickerControllerDidCancel:", v7);

  }
}

- (void)flashValueChanged
{
  uint64_t v3;
  void *v4;
  id v5;

  -[WFCameraOverlayView flashButton](self, "flashButton");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v5, "flashMode");
  -[WFCameraOverlayView pickerController](self, "pickerController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCameraFlashMode:", v3);

}

- (void)setPickerController:(id)a3
{
  objc_storeWeak((id *)&self->_pickerController, a3);
  -[WFCameraOverlayView updateButtons](self, "updateButtons");
}

- (void)updateFlipButton
{
  __CFString *v3;
  void *v4;
  void *v5;
  id v6;

  -[WFCameraOverlayView pickerController](self, "pickerController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "cameraDevice"))
    v3 = CFSTR("Camera chooser - front facing");
  else
    v3 = CFSTR("Camera chooser - rear facing");
  WFLocalizedString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCameraOverlayView flipButton](self, "flipButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v4);

}

- (void)updateButtons
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  -[WFCameraOverlayView pickerController](self, "pickerController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "cameraDevice");

  v5 = objc_msgSend(MEMORY[0x24BEBD658], "isFlashAvailableForCameraDevice:", v4);
  if ((v5 & 1) == 0)
  {
    -[WFCameraOverlayView pickerController](self, "pickerController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCameraFlashMode:", -1);

  }
  v7 = objc_msgSend(MEMORY[0x24BEBD658], "isCameraDeviceAvailable:", v4 != 1);
  -[WFCameraOverlayView flipButton](self, "flipButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEnabled:", v7);

  -[WFCameraOverlayView flashButton](self, "flashButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHidden:", v5 ^ 1u);

  -[WFCameraOverlayView pickerController](self, "pickerController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "cameraFlashMode");
  -[WFCameraOverlayView flashButton](self, "flashButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFlashMode:", v11);

  -[WFCameraOverlayView updateFlipButton](self, "updateFlipButton");
}

- (UIImagePickerController)pickerController
{
  return (UIImagePickerController *)objc_loadWeakRetained((id *)&self->_pickerController);
}

- (WFCameraShutterButton)shutterButton
{
  return (WFCameraShutterButton *)objc_loadWeakRetained((id *)&self->_shutterButton);
}

- (void)setShutterButton:(id)a3
{
  objc_storeWeak((id *)&self->_shutterButton, a3);
}

- (int64_t)takenPhotos
{
  return self->_takenPhotos;
}

- (int64_t)totalPhotos
{
  return self->_totalPhotos;
}

- (WFCameraFlashButton)flashButton
{
  return (WFCameraFlashButton *)objc_loadWeakRetained((id *)&self->_flashButton);
}

- (void)setFlashButton:(id)a3
{
  objc_storeWeak((id *)&self->_flashButton, a3);
}

- (UIView)flashView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_flashView);
}

- (void)setFlashView:(id)a3
{
  objc_storeWeak((id *)&self->_flashView, a3);
}

- (UIButton)flipButton
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_flipButton);
}

- (void)setFlipButton:(id)a3
{
  objc_storeWeak((id *)&self->_flipButton, a3);
}

- (UILabel)photosLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_photosLabel);
}

- (void)setPhotosLabel:(id)a3
{
  objc_storeWeak((id *)&self->_photosLabel, a3);
}

- (WFVolumeButtonManager)volumeButtonManager
{
  return self->_volumeButtonManager;
}

- (void)setVolumeButtonManager:(id)a3
{
  objc_storeStrong((id *)&self->_volumeButtonManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_volumeButtonManager, 0);
  objc_destroyWeak((id *)&self->_photosLabel);
  objc_destroyWeak((id *)&self->_flipButton);
  objc_destroyWeak((id *)&self->_flashView);
  objc_destroyWeak((id *)&self->_flashButton);
  objc_destroyWeak((id *)&self->_shutterButton);
  objc_destroyWeak((id *)&self->_pickerController);
}

uint64_t __37__WFCameraOverlayView_shutterPressed__block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD v4[5];
  _QWORD v5[5];

  v2 = MEMORY[0x24BDAC760];
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __37__WFCameraOverlayView_shutterPressed__block_invoke_2;
  v5[3] = &unk_24E343958;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BEBDB00], "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v5, 0.0, 0.5);
  v4[0] = v2;
  v4[1] = 3221225472;
  v4[2] = __37__WFCameraOverlayView_shutterPressed__block_invoke_3;
  v4[3] = &unk_24E343958;
  v4[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(MEMORY[0x24BEBDB00], "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v4, 0.5, 0.5);
}

void __37__WFCameraOverlayView_shutterPressed__block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "flashView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

void __37__WFCameraOverlayView_shutterPressed__block_invoke_3(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "flashView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

void __37__WFCameraOverlayView_initWithFrame___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "shutterPressed");

}

@end

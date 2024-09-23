@implementation LAPSPasscodeViewController

- (LAPSPasscodeViewController)initWithConfiguration:(id)a3
{
  id v5;
  LAPSPasscodeViewController *v6;
  LAPSPasscodeViewController *v7;
  id *p_config;
  uint64_t v9;
  LAPSPasscodeType *passcodeType;
  void *v11;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)LAPSPasscodeViewController;
  v6 = -[LAPSPasscodeViewController init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    p_config = (id *)&v6->_config;
    objc_storeStrong((id *)&v6->_config, a3);
    objc_msgSend(*p_config, "passcodeType");
    v9 = objc_claimAutoreleasedReturnValue();
    passcodeType = v7->_passcodeType;
    v7->_passcodeType = (LAPSPasscodeType *)v9;

    objc_msgSend(*p_config, "optionsConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_isPasscodeRecoveryEnabled = objc_msgSend(v11, "isPasscodeRecoveryEnabled");

  }
  return v7;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LAPSPasscodeViewController;
  -[LAPSPasscodeViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[LAPSPasscodeViewController _setup](self, "_setup");
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)LAPSPasscodeViewController;
  -[LAPSPasscodeViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  if (!-[LAPSPasscodeViewControllerConfiguration shouldAvoidBecomingFirstResponderOnStart](self->_config, "shouldAvoidBecomingFirstResponderOnStart"))-[LACUIPasscodeField becomeFirstResponder](self->_passcodeFieldVC, "becomeFirstResponder");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)LAPSPasscodeViewController;
  -[LAPSPasscodeViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  if (!-[LAPSPasscodeViewControllerConfiguration shouldAvoidBecomingFirstResponderOnStart](self->_config, "shouldAvoidBecomingFirstResponderOnStart"))-[LACUIPasscodeField becomeFirstResponder](self->_passcodeFieldVC, "becomeFirstResponder");
}

- (void)viewDidLayoutSubviews
{
  UIScrollView **p_scrollView;
  id WeakRetained;
  double v5;
  double v6;
  id v7;
  double v8;
  double v9;
  id v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)LAPSPasscodeViewController;
  -[LAPSPasscodeViewController viewDidLayoutSubviews](&v11, sel_viewDidLayoutSubviews);
  p_scrollView = &self->_scrollView;
  WeakRetained = objc_loadWeakRetained((id *)p_scrollView);
  objc_msgSend(WeakRetained, "contentSize");
  v6 = v5;
  v7 = objc_loadWeakRetained((id *)p_scrollView);
  objc_msgSend(v7, "frame");
  v9 = v8;

  if (v6 > v9)
  {
    v10 = objc_loadWeakRetained((id *)p_scrollView);
    objc_msgSend(v10, "_flashScrollIndicatorsPersistingPreviousFlashes");

  }
}

- (BOOL)canBecomeFirstResponder
{
  return -[LACUIPasscodeField canBecomeFirstResponder](self->_passcodeFieldVC, "canBecomeFirstResponder");
}

- (BOOL)becomeFirstResponder
{
  return -[LACUIPasscodeField becomeFirstResponder](self->_passcodeFieldVC, "becomeFirstResponder");
}

- (BOOL)resignFirstResponder
{
  return -[LACUIPasscodeField resignFirstResponder](self->_passcodeFieldVC, "resignFirstResponder");
}

- (id)navigationItem
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  -[LAPSPasscodeViewController parentViewController](self, "parentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)LAPSPasscodeViewController;
    -[LAPSPasscodeViewController navigationItem](&v9, sel_navigationItem);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (void)willMoveToParentViewController:(id)a3
{
  id WeakRetained;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)LAPSPasscodeViewController;
  -[LAPSPasscodeViewController willMoveToParentViewController:](&v8, sel_willMoveToParentViewController_);
  WeakRetained = objc_loadWeakRetained((id *)&self->_optionsButton);
  objc_msgSend(WeakRetained, "setHidden:", a3 == 0);

  -[LAPSPasscodeViewController presentedViewController](self, "presentedViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[LAPSPasscodeViewController presentedViewController](self, "presentedViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 0, &__block_literal_global_0);

  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)shakeWithCompletion:(id)a3
{
  -[LACUIPasscodeField shakeWithCompletion:](self->_passcodeFieldVC, "shakeWithCompletion:", a3);
}

- (void)focus
{
  -[LACUIPasscodeField setAcceptInputs:](self->_passcodeFieldVC, "setAcceptInputs:", 1);
  -[LACUIPasscodeField becomeFirstResponder](self->_passcodeFieldVC, "becomeFirstResponder");
}

- (void)clear
{
  -[LACUIPasscodeField clear](self->_passcodeFieldVC, "clear");
}

- (void)unfocus
{
  -[LACUIPasscodeField setAcceptInputs:](self->_passcodeFieldVC, "setAcceptInputs:", 0);
}

- (void)showSpinner
{
  id v2;
  id v3;
  void *v4;
  id v5;

  -[LAPSPasscodeViewController navigationItem](self, "navigationItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_alloc(MEMORY[0x24BEBD410]);
  v3 = objc_alloc_init(MEMORY[0x24BEBD398]);
  objc_msgSend(v3, "startAnimating");
  v4 = (void *)objc_msgSend(v2, "initWithCustomView:", v3);
  objc_msgSend(v5, "setRightBarButtonItem:", v4);

}

- (void)setHeader:(id)a3
{
  id v4;
  int v5;
  void *v6;
  id WeakRetained;
  id v8;

  v4 = a3;
  v8 = v4;
  if (v4 && objc_msgSend(v4, "length"))
  {
    v5 = 0;
    v6 = v8;
  }
  else
  {
    -[LAPSPasscodeViewControllerConfiguration prompt](self->_config, "prompt");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 1;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_header);
  objc_msgSend(WeakRetained, "setText:", v6);

  if (v5)
}

- (void)setFooter:(id)a3
{
  id v4;
  id WeakRetained;
  uint64_t v6;
  id v7;
  id v8;

  v4 = a3;
  v8 = v4;
  if (v4 && objc_msgSend(v4, "length"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_footer);
    objc_msgSend(WeakRetained, "setText:", v8);

    v6 = 0;
  }
  else
  {
    v6 = 1;
  }
  v7 = objc_loadWeakRetained((id *)&self->_footer);
  objc_msgSend(v7, "setHidden:", v6);

}

- (void)setErrorMessage:(id)a3
{
  id v4;
  id WeakRetained;
  uint64_t v6;
  id v7;
  id v8;

  v4 = a3;
  v8 = v4;
  if (v4 && objc_msgSend(v4, "length"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_errorCapsule);
    objc_msgSend(WeakRetained, "setText:", v8);

    v6 = 0;
  }
  else
  {
    v6 = 1;
  }
  v7 = objc_loadWeakRetained((id *)&self->_errorCapsuleContainer);
  objc_msgSend(v7, "setHidden:", v6);

  -[LAPSPasscodeViewController _layoutIfNeeded](self, "_layoutIfNeeded");
}

- (void)_setup
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  double v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
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
  double v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  double v53;
  id v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  void *v59;
  uint64_t v60;
  LACUIPasscodeField *passcodeFieldVC;
  void *v62;
  id v63;
  id v64;
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
  id v75;
  void *v76;
  void *v77;
  double v78;
  void *v79;
  id v80;
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
  id v98;
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
  uint64_t v114;
  void *v115;
  id *location;
  id *locationa;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  id WeakRetained;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  id v153;
  void *v154;
  void *v155;
  void *v156;
  id v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  LAPSPasscodeViewController *v172;
  id obj;
  _QWORD v174[6];
  uint64_t v175;
  void *v176;
  _QWORD v177[4];
  void *v178;
  _QWORD v179[5];
  _QWORD v180[5];
  _QWORD v181[4];
  _QWORD v182[4];

  v182[2] = *MEMORY[0x24BDAC8D0];
  -[LAPSPasscodeViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemGroupedBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  -[LAPSPasscodeViewControllerConfiguration title](self->_config, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeViewController setTitle:](self, "setTitle:", v5);

  -[LAPSPasscodeViewController _setupNavigationItem](self, "_setupNavigationItem");
  v6 = objc_alloc_init(MEMORY[0x24BEBD918]);
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v6, "setShowsHorizontalScrollIndicator:", 0);
  -[LAPSPasscodeViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v6);

  v169 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v6, "centerXAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v172 = self;
  -[LAPSPasscodeViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "centerXAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v182[0] = v11;
  obj = v6;
  objc_msgSend(v6, "widthAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "widthAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "userInterfaceIdiom");

  v17 = 0.85;
  if ((v16 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    v17 = 1.0;
  objc_msgSend(v12, "constraintEqualToAnchor:multiplier:", v14, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v182[1] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v182, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v169, "activateConstraints:", v19);

  v20 = objc_alloc(MEMORY[0x24BE60838]);
  -[LAPSPasscodeViewController view](v172, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v20, "initWithView:", v21);

  objc_msgSend(v6, "bottomAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v170 = v22;
  objc_msgSend(v22, "topAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v168 = v25;
  objc_msgSend(v25, "setActive:", 1);
  v26 = objc_alloc_init(MEMORY[0x24BEBD718]);
  -[LAPSPasscodeViewController view](v172, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addLayoutGuide:", v26);

  v135 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v26, "topAnchor");
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeViewController view](v172, "view");
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v165, "topAnchor");
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v161, "constraintEqualToAnchor:", v158);
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  v181[0] = v154;
  objc_msgSend(v26, "heightAnchor");
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeViewController view](v172, "view");
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v150, "heightAnchor");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v145, "constraintEqualToAnchor:multiplier:", v140, 0.5);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v181[1] = v130;
  objc_msgSend(v26, "leadingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeViewController view](v172, "view");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "leadingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v181[2] = v31;
  objc_msgSend(v26, "trailingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeViewController view](v172, "view");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "trailingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v181[3] = v35;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v181, 4);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "activateConstraints:", v36);

  LODWORD(v28) = -[LAPSPasscodeViewController _isAccessibilityTextEnabled](v172, "_isAccessibilityTextEnabled");
  objc_msgSend(obj, "topAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v164 = v26;
  if ((_DWORD)v28)
  {
    objc_msgSend(v26, "topAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 20.0;
  }
  else
  {
    objc_msgSend(v26, "centerYAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = -40.0;
  }
  objc_msgSend(v37, "constraintEqualToAnchor:constant:", v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setActive:", 1);

  objc_storeWeak((id *)&v172->_scrollView, obj);
  v41 = objc_alloc_init(MEMORY[0x24BEBD978]);
  objc_msgSend(v41, "setAxis:", 1);
  objc_msgSend(v41, "setAlignment:", 0);
  objc_msgSend(v41, "setDistribution:", 3);
  objc_msgSend(v41, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[LAPSPasscodeViewController _mainStackSpacing](v172, "_mainStackSpacing");
  objc_msgSend(v41, "setSpacing:");
  objc_msgSend(obj, "addSubview:", v41);
  v141 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v41, "topAnchor");
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "topAnchor");
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v166, "constraintEqualToAnchor:", v162);
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  v180[0] = v159;
  objc_msgSend(v41, "bottomAnchor");
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "bottomAnchor");
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v155, "constraintEqualToAnchor:", v151);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  v180[1] = v146;
  objc_msgSend(v41, "leadingAnchor");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "leadingAnchor");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "constraintEqualToAnchor:", v131);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v180[2] = v42;
  objc_msgSend(v41, "trailingAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "trailingAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v180[3] = v45;
  objc_msgSend(v41, "widthAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "widthAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:", v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v180[4] = v48;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v180, 5);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "activateConstraints:", v49);

  objc_msgSend(v41, "setLayoutMarginsRelativeArrangement:", 1);
  -[LAPSPasscodeViewController _mainStackInsets](v172, "_mainStackInsets");
  objc_msgSend(v41, "setDirectionalLayoutMargins:");
  objc_storeWeak((id *)&v172->_stack, v41);
  v50 = objc_alloc_init(MEMORY[0x24BEBD708]);
  -[LAPSPasscodeViewControllerConfiguration prompt](v172->_config, "prompt");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setText:", v51);

  objc_msgSend(v50, "setNumberOfLines:", 0);
  v114 = *MEMORY[0x24BEBE1D0];
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setFont:", v52);

  objc_msgSend(v50, "setTextAlignment:", 1);
  objc_msgSend(v41, "addArrangedSubview:", v50);
  LODWORD(v53) = 1144750080;
  objc_msgSend(v50, "setContentHuggingPriority:forAxis:", 1, v53);
  v160 = v50;
  objc_storeWeak((id *)&v172->_header, v50);
  v54 = objc_alloc_init(MEMORY[0x24BEBD978]);
  -[LAPSPasscodeViewController _bodyStackSpacing](v172, "_bodyStackSpacing");
  objc_msgSend(v54, "setSpacing:");
  objc_msgSend(v54, "setAxis:", 1);
  objc_msgSend(v54, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[LAPSPasscodeViewController _bodyStackHorizontalPadding](v172, "_bodyStackHorizontalPadding");
  v56 = v55;
  -[LAPSPasscodeViewController _bodyStackHorizontalPadding](v172, "_bodyStackHorizontalPadding");
  objc_msgSend(v54, "setDirectionalLayoutMargins:", 0.0, v56, 0.0, v57);
  objc_msgSend(v54, "setLayoutMarginsRelativeArrangement:", 1);
  v163 = v41;
  v58 = v41;
  v59 = v54;
  v167 = v54;
  objc_msgSend(v58, "addArrangedSubview:", v54);
  v60 = objc_msgSend(objc_alloc(MEMORY[0x24BE60848]), "initWithStyle:", -[LAPSPasscodeViewController _styleWithPasscodeType:](v172, "_styleWithPasscodeType:", v172->_passcodeType));
  passcodeFieldVC = v172->_passcodeFieldVC;
  v172->_passcodeFieldVC = (LACUIPasscodeField *)v60;

  -[LACUIPasscodeField setCanShowInLockScreen:](v172->_passcodeFieldVC, "setCanShowInLockScreen:", -[LAPSPasscodeViewController _canShowWhileLocked](v172, "_canShowWhileLocked"));
  -[LAPSPasscodeViewController addChildViewController:](v172, "addChildViewController:", v172->_passcodeFieldVC);
  -[LACUIPasscodeField view](v172->_passcodeFieldVC, "view");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "addArrangedSubview:", v62);

  -[LACUIPasscodeField setDelegate:](v172->_passcodeFieldVC, "setDelegate:", v172);
  -[LACUIPasscodeField didMoveToParentViewController:](v172->_passcodeFieldVC, "didMoveToParentViewController:", v172);
  v63 = objc_alloc_init(MEMORY[0x24BEBDB00]);
  v64 = objc_alloc_init(MEMORY[0x24BE60820]);
  objc_msgSend(v64, "setNumberOfLines:", 0);
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE220]);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setFont:", v65);

  objc_msgSend(v64, "setStyle:", 1);
  objc_msgSend(v64, "setTextAlignment:", 1);
  objc_msgSend(v64, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v63, "addSubview:", v64);
  v127 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v64, "topAnchor");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "topAnchor");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v156, "constraintEqualToAnchor:", v152);
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  v179[0] = v147;
  objc_msgSend(v64, "bottomAnchor");
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "bottomAnchor");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v142, "constraintEqualToAnchor:", v137);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  v179[1] = v132;
  objc_msgSend(v64, "leadingAnchor");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "leadingAnchor");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "constraintGreaterThanOrEqualToAnchor:", v121);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v179[2] = v118;
  objc_msgSend(v64, "trailingAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "trailingAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "constraintLessThanOrEqualToAnchor:", v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v179[3] = v68;
  objc_msgSend(v64, "centerXAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "centerXAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "constraintEqualToAnchor:", v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v179[4] = v71;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v179, 5);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "activateConstraints:", v72);

  v73 = v167;
  objc_msgSend(v167, "addArrangedSubview:", v63);
  objc_storeWeak((id *)&v172->_errorCapsule, v64);
  objc_storeWeak((id *)&v172->_errorCapsuleContainer, v63);
  -[LAPSPasscodeViewControllerConfiguration errorMessage](v172->_config, "errorMessage");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeViewController setErrorMessage:](v172, "setErrorMessage:", v74);

  v75 = objc_alloc_init(MEMORY[0x24BEBD708]);
  objc_msgSend(v75, "setNumberOfLines:", 0);
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1F0]);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "setFont:", v76);

  objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "setTextColor:", v77);

  objc_msgSend(v75, "setTextAlignment:", 1);
  objc_msgSend(v167, "addArrangedSubview:", v75);
  LODWORD(v78) = 1144750080;
  objc_msgSend(v75, "setContentHuggingPriority:forAxis:", 1, v78);
  objc_storeWeak((id *)&v172->_footer, v75);
  -[LAPSPasscodeViewControllerConfiguration footer](v172->_config, "footer");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeViewController setFooter:](v172, "setFooter:", v79);

  if (-[LAPSPasscodeViewController _shouldShowPasscodeOptionsButton](v172, "_shouldShowPasscodeOptionsButton")
    && !-[LAPSPasscodeViewController _shouldShowPasscodeOptionsNavigationItem](v172, "_shouldShowPasscodeOptionsNavigationItem"))
  {
    v80 = objc_alloc_init(MEMORY[0x24BEBDB00]);
    -[LAPSPasscodeViewController view](v172, "view");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "backgroundColor");
    v157 = v63;
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "setBackgroundColor:", v82);

    objc_msgSend(v80, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[LAPSPasscodeViewController view](v172, "view");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = v80;
    objc_msgSend(v83, "addSubview:", v80);

    v85 = (void *)MEMORY[0x24BDD1628];
    v178 = v168;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v178, 1);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "deactivateConstraints:", v86);

    v119 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v80, "topAnchor");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&v172->_scrollView);
    objc_msgSend(WeakRetained, "bottomAnchor");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v143, "constraintEqualToAnchor:constant:", v138, 8.0);
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    v177[0] = v133;
    objc_msgSend(v80, "bottomAnchor");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v170, "topAnchor");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v128, "constraintEqualToAnchor:", v125);
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    v177[1] = v122;
    objc_msgSend(v80, "leadingAnchor");
    location = (id *)objc_claimAutoreleasedReturnValue();
    -[LAPSPasscodeViewController view](v172, "view");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "leadingAnchor");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(location, "constraintEqualToAnchor:", v88);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v177[2] = v89;
    objc_msgSend(v80, "trailingAnchor");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    -[LAPSPasscodeViewController view](v172, "view");
    v153 = v64;
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "trailingAnchor");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "constraintEqualToAnchor:", v92);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v177[3] = v93;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v177, 4);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "activateConstraints:", v94);

    objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 1);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "titleLabel");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "setNumberOfLines:", 0);

    objc_msgSend(v95, "titleLabel");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "setTextAlignment:", 1);

    v98 = objc_alloc(MEMORY[0x24BDD1458]);
    -[LAPSPasscodeViewControllerConfiguration optionsConfiguration](v172->_config, "optionsConfiguration");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "title");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v175 = *MEMORY[0x24BEBB360];
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", v114);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v176 = v101;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v176, &v175, 1);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = (void *)objc_msgSend(v98, "initWithString:attributes:", v100, v102);
    objc_msgSend(v95, "setAttributedTitle:forState:", v103, 0);

    objc_msgSend(v95, "addTarget:action:forControlEvents:", v172, sel__showPasscodeOptions_, 64);
    objc_msgSend(v84, "addSubview:", v95);
    objc_msgSend(v95, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v123 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v95, "heightAnchor");
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "titleLabel");
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v171, "heightAnchor");
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v149, "constraintEqualToAnchor:", v144);
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    v174[0] = v139;
    objc_msgSend(v95, "topAnchor");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "topAnchor");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v134, "constraintEqualToAnchor:", v129);
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    v174[1] = v126;
    objc_msgSend(v95, "leadingAnchor");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "leadingAnchor");
    locationa = (id *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "constraintGreaterThanOrEqualToAnchor:constant:", locationa, 10.0);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v174[2] = v115;
    objc_msgSend(v95, "trailingAnchor");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "trailingAnchor");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "constraintLessThanOrEqualToAnchor:constant:", v112, -10.0);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v174[3] = v111;
    objc_msgSend(v95, "centerXAnchor");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "centerXAnchor");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "constraintEqualToAnchor:", v105);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v174[4] = v106;
    objc_msgSend(v95, "bottomAnchor");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "bottomAnchor");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "constraintEqualToAnchor:constant:", v108, -8.0);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    v174[5] = v109;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v174, 6);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "activateConstraints:", v110);

    v73 = v167;
    v64 = v153;

    objc_storeWeak((id *)&v172->_optionsButton, v95);
    v63 = v157;

  }
}

- (void)_setupNavigationItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[5];

  -[LAPSPasscodeViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeViewControllerConfiguration title](self->_config, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v4);

  -[LAPSPasscodeViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidesBackButton:animated:", 1, 0);

  if (!-[LAPSPasscodeViewController _shouldShowNextButton](self, "_shouldShowNextButton")
    && !-[LAPSPasscodeViewController _shouldShowPasscodeOptionsNavigationItem](self, "_shouldShowPasscodeOptionsNavigationItem"))
  {
    -[LAPSPasscodeViewController navigationItem](self, "navigationItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setLeftBarButtonItem:", 0);

    -[LAPSPasscodeViewController navigationItem](self, "navigationItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __50__LAPSPasscodeViewController__setupNavigationItem__block_invoke_3;
    v19[3] = &unk_24FDCD5A0;
    v19[4] = self;
    __50__LAPSPasscodeViewController__setupNavigationItem__block_invoke_3((uint64_t)v19);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setRightBarButtonItem:", v18);

    goto LABEL_8;
  }
  -[LAPSPasscodeViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __50__LAPSPasscodeViewController__setupNavigationItem__block_invoke;
  v21[3] = &unk_24FDCD5A0;
  v21[4] = self;
  __50__LAPSPasscodeViewController__setupNavigationItem__block_invoke((uint64_t)v21);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLeftBarButtonItem:", v8);

  if (-[LAPSPasscodeViewController _shouldShowNextButton](self, "_shouldShowNextButton"))
  {
    -[LAPSPasscodeViewController navigationItem](self, "navigationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v7;
    v20[1] = 3221225472;
    v20[2] = __50__LAPSPasscodeViewController__setupNavigationItem__block_invoke_2;
    v20[3] = &unk_24FDCD5A0;
    v20[4] = self;
    __50__LAPSPasscodeViewController__setupNavigationItem__block_invoke_2((uint64_t)v20);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setRightBarButtonItem:", v10);

    -[LAPSPasscodeViewController navigationItem](self, "navigationItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "rightBarButtonItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setEnabled:", self->_isNextButtonEnabled);

  }
  if (-[LAPSPasscodeViewController _shouldShowPasscodeOptionsNavigationItem](self, "_shouldShowPasscodeOptionsNavigationItem"))
  {
    v13 = objc_alloc(MEMORY[0x24BEBD410]);
    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("ellipsis"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithImage:style:target:action:", v14, 0, self, sel__showPasscodeOptions_);

    -[LAPSPasscodeViewController navigationItem](self, "navigationItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setRightBarButtonItem:", v15);

    objc_storeWeak((id *)&self->_optionsItem, v15);
LABEL_8:

  }
}

id __50__LAPSPasscodeViewController__setupNavigationItem__block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, *(_QWORD *)(a1 + 32), sel__cancel_);
}

id __50__LAPSPasscodeViewController__setupNavigationItem__block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x24BEBD410]);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "nextButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithTitle:style:target:action:", v3, 0, *(_QWORD *)(a1 + 32), sel__next_);

  return v4;
}

id __50__LAPSPasscodeViewController__setupNavigationItem__block_invoke_3(uint64_t a1)
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, *(_QWORD *)(a1 + 32), sel__cancel_);
}

- (void)_setNextButtonEnabled:(BOOL)a3
{
  self->_isNextButtonEnabled = a3;
  -[LAPSPasscodeViewController _setupNavigationItem](self, "_setupNavigationItem");
}

- (void)_setPasscodeType:(id)a3
{
  objc_storeStrong((id *)&self->_passcodeType, a3);
  -[LAPSPasscodeViewController _setupNavigationItem](self, "_setupNavigationItem");
}

- (void)_submitPasscode:(id)a3
{
  int64_t v4;
  id WeakRetained;
  LAPSPasscode *v6;
  id v7;

  v7 = a3;
  v4 = -[LAPSPasscodeViewController _styleWithPasscodeType:](self, "_styleWithPasscodeType:", self->_passcodeType);
  if (v4 != -[LACUIPasscodeField style](self->_passcodeFieldVC, "style"))
    -[LAPSPasscodeViewController _submitPasscode:].cold.1();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = -[LAPSPasscode initWithLocalizedPasscode:type:]([LAPSPasscode alloc], "initWithLocalizedPasscode:type:", v7, self->_passcodeType);
  objc_msgSend(WeakRetained, "passcodeViewController:verifyPasscode:", self, v6);

}

- (void)_cancel:(id)a3
{
  id v4;

  +[LAPSErrorBuilder userCanceledError](LAPSErrorBuilder, "userCanceledError", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeViewController _finishWithError:](self, "_finishWithError:", v4);

}

- (void)_next:(id)a3
{
  -[LACUIPasscodeField submit](self->_passcodeFieldVC, "submit", a3);
}

- (void)_showPasscodeOptions:(id)a3
{
  LAPSPasscodeOptionsPresentationController *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[5];

  v4 = objc_alloc_init(LAPSPasscodeOptionsPresentationController);
  v5 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __51__LAPSPasscodeViewController__showPasscodeOptions___block_invoke;
  v8[3] = &unk_24FDCD5C8;
  v8[4] = self;
  __51__LAPSPasscodeViewController__showPasscodeOptions___block_invoke((uint64_t)v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __51__LAPSPasscodeViewController__showPasscodeOptions___block_invoke_3;
  v7[3] = &unk_24FDCD5F0;
  v7[4] = self;
  -[LAPSPasscodeOptionsPresentationController presentPasscodeOptions:completion:](v4, "presentPasscodeOptions:completion:", v6, v7);

}

LAPSPasscodeOptionsPresentationRequest *__51__LAPSPasscodeViewController__showPasscodeOptions___block_invoke(uint64_t a1)
{
  LAPSPasscodeOptionsPresentationRequest *v2;
  id WeakRetained;
  id v4;
  void *v5;
  _QWORD v7[5];

  v2 = -[LAPSPasscodeOptionsPresentationRequest initWithSourceViewController:]([LAPSPasscodeOptionsPresentationRequest alloc], "initWithSourceViewController:", *(_QWORD *)(a1 + 32));
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1048));
  -[LAPSPasscodeOptionsPresentationRequest setSourceView:](v2, "setSourceView:", WeakRetained);

  v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1056));
  -[LAPSPasscodeOptionsPresentationRequest setSourceItem:](v2, "setSourceItem:", v4);

  -[LAPSPasscodeOptionsPresentationRequest setPresentationStyle:](v2, "setPresentationStyle:", objc_msgSend(*(id *)(a1 + 32), "_passcodeOptionsPresentationStyle"));
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51__LAPSPasscodeViewController__showPasscodeOptions___block_invoke_2;
  v7[3] = &unk_24FDCD460;
  v7[4] = *(_QWORD *)(a1 + 32);
  __51__LAPSPasscodeViewController__showPasscodeOptions___block_invoke_2((uint64_t)v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeOptionsPresentationRequest setConfig:](v2, "setConfig:", v5);

  -[LAPSPasscodeOptionsPresentationRequest setAnimated:](v2, "setAnimated:", 1);
  -[LAPSPasscodeOptionsPresentationRequest setDelegate:](v2, "setDelegate:", *(_QWORD *)(a1 + 32));
  return v2;
}

LAPSPasscodeOptionsViewControllerConfiguration *__51__LAPSPasscodeViewController__showPasscodeOptions___block_invoke_2(uint64_t a1)
{
  LAPSPasscodeOptionsViewControllerConfiguration *v2;
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

  v2 = objc_alloc_init(LAPSPasscodeOptionsViewControllerConfiguration);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "optionsConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeOptionsViewControllerConfiguration setTitle:](v2, "setTitle:", v4);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "optionsConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancelTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeOptionsViewControllerConfiguration setCancelTitle:](v2, "setCancelTitle:", v6);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "optionsConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "passcodeRecoveryEnabledTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeOptionsViewControllerConfiguration setPasscodeRecoveryEnabledTitle:](v2, "setPasscodeRecoveryEnabledTitle:", v8);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "optionsConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "passcodeRecoveryDisabledTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeOptionsViewControllerConfiguration setPasscodeRecoveryDisabledTitle:](v2, "setPasscodeRecoveryDisabledTitle:", v10);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "optionsConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allowedPasscodeTypes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeOptionsViewControllerConfiguration setAllowedPasscodeTypes:](v2, "setAllowedPasscodeTypes:", v12);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "optionsConfiguration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeOptionsViewControllerConfiguration setIsPasscodeRecoverySupported:](v2, "setIsPasscodeRecoverySupported:", objc_msgSend(v13, "isPasscodeRecoverySupported"));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "optionsConfiguration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeOptionsViewControllerConfiguration setIsPasscodeRecoveryRestricted:](v2, "setIsPasscodeRecoveryRestricted:", objc_msgSend(v14, "isPasscodeRecoveryRestricted"));

  -[LAPSPasscodeOptionsViewControllerConfiguration setIsPasscodeRecoveryEnabled:](v2, "setIsPasscodeRecoveryEnabled:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 984));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "optionsConfiguration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeOptionsViewControllerConfiguration setIsPasscodeRecoveryOptionVisible:](v2, "setIsPasscodeRecoveryOptionVisible:", objc_msgSend(v15, "isPasscodeRecoveryOptionVisible"));

  -[LAPSPasscodeOptionsViewControllerConfiguration setSelectedPasscodeType:](v2, "setSelectedPasscodeType:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 976));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "optionsConfiguration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "passcodeRecoveryTitle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeOptionsViewControllerConfiguration setPasscodeRecoveryTitle:](v2, "setPasscodeRecoveryTitle:", v17);

  return v2;
}

void __51__LAPSPasscodeViewController__showPasscodeOptions___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "setAcceptInputs:", 0);
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "resignFirstResponder");
}

- (void)_finishWithError:(id)a3
{
  id WeakRetained;
  char v5;
  id v6;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v6, "passcodeViewController:didCancelWithError:", self, v7);

  }
}

- (int64_t)_styleWithPasscodeType:(id)a3
{
  int64_t result;

  result = objc_msgSend(a3, "identifier");
  if ((unint64_t)(result - 1) >= 3)
    return 0;
  return result;
}

- (BOOL)_shouldShowPasscodeOptionsNavigationItem
{
  return 0;
}

- (BOOL)_shouldShowPasscodeOptionsButton
{
  void *v2;
  BOOL v3;

  -[LAPSPasscodeViewControllerConfiguration optionsConfiguration](self->_config, "optionsConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)_passcodeTypeAllowsVariableLength
{
  return -[LAPSPasscodeType length](self->_passcodeType, "length") == -1;
}

- (int64_t)_passcodeOptionsPresentationStyle
{
  return 0;
}

- (double)_bodyStackHorizontalPadding
{
  return 27.0;
}

- (BOOL)_isAccessibilityTextEnabled
{
  void *v2;
  void *v3;
  NSString *v4;
  BOOL IsAccessibilityCategory;

  -[LAPSPasscodeViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  return IsAccessibilityCategory;
}

- (double)_bottomPadding
{
  return 20.0;
}

- (NSDirectionalEdgeInsets)_mainStackInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  NSDirectionalEdgeInsets result;

  -[LAPSPasscodeViewController _accessibilitySpacing](self, "_accessibilitySpacing");
  v3 = v2;
  v4 = v2;
  v5 = v2;
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

- (double)_accessibilitySpacing
{
  return 20.0;
}

- (void)_layoutIfNeeded
{
  id WeakRetained;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
  objc_msgSend(WeakRetained, "layoutIfNeeded");

  -[LAPSPasscodeViewController view](self, "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutIfNeeded");

}

- (void)passcodeField:(id)a3 didSubmitPasscode:(id)a4
{
  id v6;
  LACUIPasscodeField *v7;

  v7 = (LACUIPasscodeField *)a3;
  v6 = a4;
  if (self->_passcodeFieldVC != v7)
    -[LAPSPasscodeViewController passcodeField:didSubmitPasscode:].cold.1();
  if (-[LAPSPasscodeType allowsLength:](self->_passcodeType, "allowsLength:", objc_msgSend(v6, "length")))
    -[LAPSPasscodeViewController _submitPasscode:](self, "_submitPasscode:", v6);

}

- (void)passcodeField:(id)a3 didChangePasscodeLength:(unint64_t)a4
{
  LACUIPasscodeField *v6;
  LACUIPasscodeField *v7;

  v6 = (LACUIPasscodeField *)a3;
  if (self->_passcodeFieldVC != v6)
    -[LAPSPasscodeViewController passcodeField:didChangePasscodeLength:].cold.1();
  v7 = v6;
  -[LAPSPasscodeViewController _setNextButtonEnabled:](self, "_setNextButtonEnabled:", -[LAPSPasscodeType allowsLength:](self->_passcodeType, "allowsLength:", a4));

}

- (void)passcodeOptionsViewController:(id)a3 didSelectPasscodeType:(id)a4
{
  id WeakRetained;
  char v6;
  id v7;
  id v8;

  v8 = a4;
  -[LAPSPasscodeViewController _setPasscodeType:](self, "_setPasscodeType:", v8);
  -[LACUIPasscodeField setStyle:](self->_passcodeFieldVC, "setStyle:", -[LAPSPasscodeViewController _styleWithPasscodeType:](self, "_styleWithPasscodeType:", v8));
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v7, "passcodeViewController:didSelectPasscodeType:", self, v8);

  }
}

- (void)passcodeOptionsViewController:(id)a3 didSetPasscodeRecoveryEnabled:(BOOL)a4
{
  _BOOL8 v4;
  LAPSPasscodeViewControllerDelegate **p_delegate;
  id WeakRetained;
  char v8;
  id v9;

  v4 = a4;
  self->_isPasscodeRecoveryEnabled = a4;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v9, "passcodeViewController:didSetPasscodeRecoveryEnabled:", self, v4);

  }
}

- (void)passcodeOptionsViewControllerDidDisappear:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
  objc_msgSend(WeakRetained, "_scrollToTopIfPossible:", 1);

  -[LACUIPasscodeField setAcceptInputs:](self->_passcodeFieldVC, "setAcceptInputs:", 1);
  -[LACUIPasscodeField becomeFirstResponder](self->_passcodeFieldVC, "becomeFirstResponder");
}

- (LAPSPasscodeViewControllerDelegate)delegate
{
  return (LAPSPasscodeViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_bottomAreaLayoutGuide);
  objc_destroyWeak((id *)&self->_optionsItem);
  objc_destroyWeak((id *)&self->_optionsButton);
  objc_destroyWeak((id *)&self->_errorCapsuleContainer);
  objc_destroyWeak((id *)&self->_errorCapsule);
  objc_destroyWeak((id *)&self->_footer);
  objc_destroyWeak((id *)&self->_header);
  objc_destroyWeak((id *)&self->_stack);
  objc_destroyWeak((id *)&self->_scrollView);
  objc_storeStrong((id *)&self->_passcodeFieldVC, 0);
  objc_storeStrong((id *)&self->_passcodeType, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

- (void)_submitPasscode:.cold.1()
{
  __assert_rtn("-[LAPSPasscodeViewController _submitPasscode:]", "LAPSPasscodeViewController.m", 434, "[self _styleWithPasscodeType:_passcodeType] == [_passcodeFieldVC style]");
}

- (void)passcodeField:didSubmitPasscode:.cold.1()
{
  __assert_rtn("-[LAPSPasscodeViewController passcodeField:didSubmitPasscode:]", "LAPSPasscodeViewController.m", 580, "passcodeField == _passcodeFieldVC");
}

- (void)passcodeField:didChangePasscodeLength:.cold.1()
{
  __assert_rtn("-[LAPSPasscodeViewController passcodeField:didChangePasscodeLength:]", "LAPSPasscodeViewController.m", 589, "passcodeField == _passcodeFieldVC");
}

@end

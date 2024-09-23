@implementation AKSignatureCreationViewController_iOS

- (AKSignatureCreationViewController_iOS)initWithController:(id)a3
{
  id v4;
  AKSignatureCreationViewController_iOS *v5;
  AKSignatureCreationViewController_iOS *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AKSignatureCreationViewController_iOS;
  v5 = -[AKSignatureCreationViewController_iOS initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, 0, 0);
  v6 = v5;
  if (v5)
  {
    -[AKSignatureCreationViewController_iOS setController:](v5, "setController:", v4);
    +[AKController akBundle](AKController, "akBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("New Signature"), &stru_24F1A83D0, CFSTR("AKSignatureCreationViewController_iOS"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKSignatureCreationViewController_iOS setTitle:](v6, "setTitle:", v8);

    -[AKSignatureCreationViewController_iOS setPreferredContentSize:](v6, "setPreferredContentSize:", 540.0, 388.0);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v6, sel__applicationDidBecomeActive_, *MEMORY[0x24BDF7510], 0);

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)AKSignatureCreationViewController_iOS;
  -[AKSignatureCreationViewController_iOS dealloc](&v4, sel_dealloc);
}

- (void)loadView
{
  id v3;
  id v4;

  v3 = objc_alloc(MEMORY[0x24BDF6F90]);
  v4 = (id)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[AKSignatureCreationViewController_iOS setView:](self, "setView:", v4);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
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
  id v24;
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
  double v50;
  void *v51;
  double v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  uint64_t *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  AKSignatureBaselineView *v64;
  void *v65;
  AKSignatureBaselineView *v66;
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
  void *v94;
  void *v95;
  uint64_t v96;
  void *v97;
  void *v98;
  double v99;
  double v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  AKInkSignatureView *v106;
  void *v107;
  AKInkSignatureView *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  uint64_t v115;
  void *v116;
  void *v117;
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
  objc_super v141;
  _QWORD v142[2];
  uint64_t v143;
  _QWORD v144[2];
  uint64_t v145;
  id v146;
  _QWORD v147[4];

  v147[2] = *MEMORY[0x24BDAC8D0];
  v141.receiver = self;
  v141.super_class = (Class)AKSignatureCreationViewController_iOS;
  -[AKSignatureCreationViewController_iOS viewDidLoad](&v141, sel_viewDidLoad);
  -[AKSignatureCreationViewController_iOS traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "userInterfaceStyle") == 2)
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  else
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKSignatureCreationViewController_iOS view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

  v6 = objc_alloc(MEMORY[0x24BDF6BE0]);
  v7 = *MEMORY[0x24BDBF090];
  v8 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v9 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v10 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v11 = (void *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x24BDBF090], v8, v9, v10);
  -[AKSignatureCreationViewController_iOS setNavBar:](self, "setNavBar:", v11);

  -[AKSignatureCreationViewController_iOS navBar](self, "navBar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[AKSignatureCreationViewController_iOS navBar](self, "navBar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDelegate:", self);

  -[AKSignatureCreationViewController_iOS view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKSignatureCreationViewController_iOS navBar](self, "navBar");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addSubview:", v15);

  _NSDictionaryOfVariableBindings(CFSTR("_navBar"), self->_navBar, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKSignatureCreationViewController_iOS view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[_navBar]|"), 0, 0, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addConstraints:", v18);

  -[UINavigationBar topAnchor](self->_navBar, "topAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKSignatureCreationViewController_iOS view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "safeAreaLayoutGuide");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "topAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v139 = v23;
  objc_msgSend(v23, "setActive:", 1);
  v24 = objc_alloc_init(MEMORY[0x24BDF6C00]);
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", v7, v8, v9, v10);
  -[AKSignatureCreationViewController_iOS setTitleLabel:](self, "setTitleLabel:", v25);

  -[AKSignatureCreationViewController_iOS title](self, "title");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKSignatureCreationViewController_iOS titleLabel](self, "titleLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setText:", v26);

  -[AKSignatureCreationViewController_iOS navBar](self, "navBar");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "standardAppearance");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "titleTextAttributes");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "objectForKeyedSubscript:", *MEMORY[0x24BDF65F8]);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKSignatureCreationViewController_iOS titleLabel](self, "titleLabel");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setFont:", v31);

  -[AKSignatureCreationViewController_iOS titleLabel](self, "titleLabel");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setTextAlignment:", 1);

  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6880]), "initWithFrame:", v7, v8, v9, v10);
  -[AKSignatureCreationViewController_iOS setDownArrowButton:](self, "setDownArrowButton:", v34);

  -[AKSignatureCreationViewController_iOS downArrowButton](self, "downArrowButton");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "addTarget:action:forControlEvents:", self, sel__showSignatureDescriptionSelectionAlert, 1);

  -[AKSignatureCreationViewController_iOS downArrowButton](self, "downArrowButton");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("chevron.down"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setImage:forState:", v37, 0);

  -[AKSignatureCreationViewController_iOS downArrowButton](self, "downArrowButton");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setContentEdgeInsets:", 8.0, 8.0, 8.0, 8.0);

  v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6DD0]), "initWithFrame:", v7, v8, v9, v10);
  objc_msgSend(v39, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v39, "setAlignment:", 3);
  objc_msgSend(v39, "setAxis:", 0);
  -[AKSignatureCreationViewController_iOS titleLabel](self, "titleLabel");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addArrangedSubview:", v40);

  -[AKSignatureCreationViewController_iOS downArrowButton](self, "downArrowButton");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addArrangedSubview:", v41);

  -[AKSignatureCreationViewController_iOS titleLabel](self, "titleLabel");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v147[0] = v42;
  -[AKSignatureCreationViewController_iOS downArrowButton](self, "downArrowButton");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v147[1] = v43;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v147, 2);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setAccessibilityElements:", v44);

  objc_msgSend(v24, "setTitleView:", v39);
  v138 = v39;
  objc_msgSend(v39, "trailingAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKSignatureCreationViewController_iOS downArrowButton](self, "downArrowButton");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "trailingAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:constant:", v47, 0.0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setActive:", 1);

  -[AKSignatureCreationViewController_iOS downArrowButton](self, "downArrowButton");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v50) = 1144750080;
  objc_msgSend(v49, "setContentCompressionResistancePriority:forAxis:", 0, v50);

  -[AKSignatureCreationViewController_iOS titleLabel](self, "titleLabel");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v52) = 1132068864;
  objc_msgSend(v51, "setContentCompressionResistancePriority:forAxis:", 0, v52);

  -[AKSignatureCreationViewController_iOS navBar](self, "navBar");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v146 = v24;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v146, 1);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setItems:", v54);

  v55 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancel_);
  v56 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 0, self, sel__done_);
  v140 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 6, 0, 0);
  objc_msgSend(v140, "setWidth:", 16.0);
  -[AKSignatureCreationViewController_iOS presentationController](self, "presentationController");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend(v57, "presentationStyle");

  v136 = (void *)v55;
  v137 = (void *)v56;
  if (v58 == 7)
  {
    v145 = v56;
    v59 = &v145;
  }
  else
  {
    v144[0] = v55;
    v144[1] = v140;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v144, 2);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setLeftBarButtonItems:", v60);

    v143 = v56;
    v59 = &v143;
  }
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v59, 1);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setRightBarButtonItems:", v61);

  -[AKSignatureCreationViewController_iOS view](self, "view");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKSignatureCreationViewController_iOS navBar](self, "navBar");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "addSubview:", v63);

  v64 = [AKSignatureBaselineView alloc];
  -[AKSignatureCreationViewController_iOS view](self, "view");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "bounds");
  v66 = -[AKSignatureBaselineView initWithFrame:](v64, "initWithFrame:");
  -[AKSignatureCreationViewController_iOS setBaselineView:](self, "setBaselineView:", v66);

  -[AKSignatureCreationViewController_iOS baselineView](self, "baselineView");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[AKSignatureCreationViewController_iOS view](self, "view");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKSignatureCreationViewController_iOS baselineView](self, "baselineView");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKSignatureCreationViewController_iOS navBar](self, "navBar");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "insertSubview:aboveSubview:", v69, v70);

  v71 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", v7, v8, v9, v10);
  -[AKSignatureCreationViewController_iOS setLabel:](self, "setLabel:", v71);

  -[AKSignatureCreationViewController_iOS label](self, "label");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 12.0);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKSignatureCreationViewController_iOS label](self, "label");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "setFont:", v73);

  -[AKSignatureCreationViewController_iOS label](self, "label");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "setTextAlignment:", 1);

  objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.6, 0.8);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKSignatureCreationViewController_iOS label](self, "label");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "setTextColor:", v76);

  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKSignatureCreationViewController_iOS label](self, "label");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "setBackgroundColor:", v78);

  +[AKController akBundle](AKController, "akBundle");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v135 = v24;
  objc_msgSend(v80, "localizedStringForKey:value:table:", CFSTR("Sign your name using your finger."), &stru_24F1A83D0, CFSTR("AKSignatureCreationViewController_iOS"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKSignatureCreationViewController_iOS label](self, "label");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setText:", v81);

  -[AKSignatureCreationViewController_iOS view](self, "view");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKSignatureCreationViewController_iOS label](self, "label");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKSignatureCreationViewController_iOS baselineView](self, "baselineView");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "insertSubview:aboveSubview:", v84, v85);

  v86 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6880]), "initWithFrame:", v7, v8, v9, v10);
  -[AKSignatureCreationViewController_iOS setClearButton:](self, "setClearButton:", v86);

  -[AKSignatureCreationViewController_iOS clearButton](self, "clearButton");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[AKSignatureCreationViewController_iOS clearButton](self, "clearButton");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("arrow.counterclockwise"));
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "setImage:forState:", v89, 0);

  -[AKSignatureCreationViewController_iOS clearButton](self, "clearButton");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  +[AKController akBundle](AKController, "akBundle");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "localizedStringForKey:value:table:", CFSTR("Clear"), &stru_24F1A83D0, CFSTR("AKSignatureCreationViewController_iOS"));
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "setTitle:forState:", v92, 0);

  -[AKSignatureCreationViewController_iOS clearButton](self, "clearButton");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "tintColor");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "setTitleColor:forState:", v94, 0);

  -[AKSignatureCreationViewController_iOS clearButton](self, "clearButton");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = objc_msgSend(v95, "effectiveUserInterfaceLayoutDirection");

  -[AKSignatureCreationViewController_iOS clearButton](self, "clearButton");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = v97;
  if (v96 == 1)
    v99 = -8.0;
  else
    v99 = 8.0;
  if (v96 == 1)
    v100 = 8.0;
  else
    v100 = -8.0;
  objc_msgSend(v97, "setTitleEdgeInsets:", 0.0, v99, 0.0, v100);

  -[AKSignatureCreationViewController_iOS clearButton](self, "clearButton");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "setContentEdgeInsets:", 11.0, 2.0, 11.0, 10.0);

  -[AKSignatureCreationViewController_iOS clearButton](self, "clearButton");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "addTarget:action:forControlEvents:", self, sel__clear_, 64);

  -[AKSignatureCreationViewController_iOS view](self, "view");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKSignatureCreationViewController_iOS clearButton](self, "clearButton");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKSignatureCreationViewController_iOS navBar](self, "navBar");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "insertSubview:aboveSubview:", v104, v105);

  v106 = [AKInkSignatureView alloc];
  -[AKSignatureCreationViewController_iOS view](self, "view");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "bounds");
  v108 = -[AKInkSignatureView initWithFrame:](v106, "initWithFrame:");
  -[AKSignatureCreationViewController_iOS setSignatureView:](self, "setSignatureView:", v108);

  -[AKSignatureCreationViewController_iOS signatureView](self, "signatureView");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKSignatureCreationViewController_iOS signatureView](self, "signatureView");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "setBackgroundColor:", v110);

  -[AKSignatureCreationViewController_iOS view](self, "view");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKSignatureCreationViewController_iOS signatureView](self, "signatureView");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKSignatureCreationViewController_iOS navBar](self, "navBar");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "insertSubview:belowSubview:", v113, v114);

  _NSDictionaryOfVariableBindings(CFSTR("_baselineView, _navBar, _label, _signatureView, _clearButton"), self->_baselineView, self->_navBar, self->_label, self->_signatureView, self->_clearButton, 0);
  v115 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[_baselineView(20)]-[_label]-8-[_clearButton]"), 0, 0, v115);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "addObjectsFromArray:", v117);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[_label]|"), 0, 0, v115);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "addObjectsFromArray:", v118);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[_signatureView]|"), 0, 0, v115);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "addObjectsFromArray:", v119);

  v134 = (void *)v115;
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[_baselineView]|"), 0, 0, v115);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "addObjectsFromArray:", v120);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[_navBar][_signatureView]|"), 0, 0, v115);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "addObjectsFromArray:", v121);

  -[AKSignatureCreationViewController_iOS clearButton](self, "clearButton");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v133, "bottomAnchor");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKSignatureCreationViewController_iOS view](self, "view");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "safeAreaLayoutGuide");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "bottomAnchor");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "constraintEqualToAnchor:constant:", v123, -8.0);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v142[0] = v124;
  -[AKSignatureCreationViewController_iOS clearButton](self, "clearButton");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "centerXAnchor");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKSignatureCreationViewController_iOS view](self, "view");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "centerXAnchor");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "constraintEqualToAnchor:", v128);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v142[1] = v129;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v142, 2);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "addObjectsFromArray:", v130);

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v116);
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)becomeFirstResponder
{
  void *v3;
  void *v4;
  AKSignatureCreationViewController_iOS *v5;
  _BOOL4 v6;
  objc_super v9;

  -[AKSignatureCreationViewController_iOS view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstResponder");
  v5 = (AKSignatureCreationViewController_iOS *)objc_claimAutoreleasedReturnValue();

  v9.receiver = self;
  v9.super_class = (Class)AKSignatureCreationViewController_iOS;
  v6 = -[AKSignatureCreationViewController_iOS becomeFirstResponder](&v9, sel_becomeFirstResponder);
  if (v6 && v5 != self)
    -[AKSignatureCreationViewController_iOS setResponderToRestore:](self, "setResponderToRestore:", v5);

  return v6;
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AKSignatureCreationViewController_iOS;
  -[AKSignatureCreationViewController_iOS viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  if ((-[AKSignatureCreationViewController_iOS isFirstResponder](self, "isFirstResponder") & 1) == 0)
    -[AKSignatureCreationViewController_iOS becomeFirstResponder](self, "becomeFirstResponder");
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  -[AKSignatureCreationViewController_iOS resignFirstResponder](self, "resignFirstResponder");
  -[AKSignatureCreationViewController_iOS responderToRestore](self, "responderToRestore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "becomeFirstResponder");
  -[AKSignatureCreationViewController_iOS setResponderToRestore:](self, "setResponderToRestore:", 0);
  v7.receiver = self;
  v7.super_class = (Class)AKSignatureCreationViewController_iOS;
  -[AKSignatureCreationViewController_iOS viewDidDisappear:](&v7, sel_viewDidDisappear_, v3);

}

- (void)didReceiveMemoryWarning
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)AKSignatureCreationViewController_iOS;
  -[AKSignatureCreationViewController_iOS didReceiveMemoryWarning](&v2, sel_didReceiveMemoryWarning);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  _QWORD v14[5];
  _QWORD v15[5];
  objc_super v16;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)AKSignatureCreationViewController_iOS;
  -[AKSignatureCreationViewController_iOS viewWillTransitionToSize:withTransitionCoordinator:](&v16, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[AKSignatureCreationViewController_iOS view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;
  v12 = v11;

  if (width != v10 || height != v12)
  {
    v14[4] = self;
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = sub_228FFC80C;
    v15[3] = &unk_24F1A7970;
    v15[4] = self;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = sub_228FFC840;
    v14[3] = &unk_24F1A7970;
    objc_msgSend(v7, "animateAlongsideTransition:completion:", v15, v14);
  }

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AKSignatureCreationViewController_iOS;
  v4 = a3;
  -[AKSignatureCreationViewController_iOS traitCollectionDidChange:](&v11, sel_traitCollectionDidChange_, v4);
  -[AKSignatureCreationViewController_iOS traitCollection](self, "traitCollection", v11.receiver, v11.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceStyle");
  v7 = objc_msgSend(v4, "userInterfaceStyle");

  if (v6 != v7)
  {
    -[AKSignatureCreationViewController_iOS traitCollection](self, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "userInterfaceStyle") == 2)
      objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    else
      objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKSignatureCreationViewController_iOS view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBackgroundColor:", v9);

  }
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[5];
  char v12;
  _QWORD v13[5];
  id v14;
  char v15;
  objc_super v16;

  v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)AKSignatureCreationViewController_iOS;
  v7 = a4;
  -[AKSignatureCreationViewController_iOS willTransitionToTraitCollection:withTransitionCoordinator:](&v16, sel_willTransitionToTraitCollection_withTransitionCoordinator_, v6, v7);
  -[AKSignatureCreationViewController_iOS traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "horizontalSizeClass");
  LOBYTE(v9) = v9 != objc_msgSend(v6, "horizontalSizeClass");

  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = sub_228FFCAAC;
  v13[3] = &unk_24F1A7998;
  v15 = v9;
  v13[4] = self;
  v14 = v6;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = sub_228FFCB18;
  v11[3] = &unk_24F1A79C0;
  v12 = v9;
  v11[4] = self;
  v10 = v6;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v13, v11);

}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (void)_validateButtons
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[AKSignatureCreationViewController_iOS navBar](self, "navBar", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rightBarButtonItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if ((char *)objc_msgSend(v10, "action") == sel__clear_)
        {
          -[AKSignatureCreationViewController_iOS signatureView](self, "signatureView");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setEnabled:", objc_msgSend(v11, "hasStrokes"));

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_cancel:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  -[AKSignatureCreationViewController_iOS controller](self, "controller", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "controllerWillDismissSignatureCaptureView:", v4);
  -[AKSignatureCreationViewController_iOS presentingViewController](self, "presentingViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = sub_228FFCDC0;
  v8[3] = &unk_24F1A7328;
  v8[4] = self;
  objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, v8);

  -[AKSignatureCreationViewController_iOS signatureView](self, "signatureView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clear");

}

- (void)_clear:(id)a3
{
  id v3;

  -[AKSignatureCreationViewController_iOS signatureView](self, "signatureView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clear");

}

- (void)_done:(id)a3
{
  void *v4;
  void *v5;
  const CGPath *v6;
  id v7;
  AKSignature *v8;
  AKSignature *v9;
  void *v10;
  int64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;

  -[AKSignatureCreationViewController_iOS controller](self, "controller", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKSignatureCreationViewController_iOS signatureView](self, "signatureView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v6 = (const CGPath *)objc_msgSend(v5, "copyPotracedPathAndReturnDrawing:", &v20);
  v7 = v20;

  v8 = 0;
  if (!CGPathIsEmpty(v6))
  {
    v9 = [AKSignature alloc];
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[AKSignatureCreationViewController_iOS descriptionTag](self, "descriptionTag");
    -[AKSignatureCreationViewController_iOS customDescription](self, "customDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[AKSignature initWithDrawing:path:baselineOffset:creationDate:descriptionTag:customDescription:](v9, "initWithDrawing:path:baselineOffset:creationDate:descriptionTag:customDescription:", v7, v6, v10, v11, v12, 0.0);

  }
  CGPathRelease(v6);
  -[AKSignatureCreationViewController_iOS signatureView](self, "signatureView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "clear");

  if (v8)
  {
    objc_msgSend(v4, "signatureModelController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "insertObject:inSignaturesAtIndex:", v8, 0);

    objc_msgSend(v4, "signatureModelController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setSelectedSignature:", v8);

    -[AKSignatureCreationViewController_iOS delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v16, "signatureCreationControllerDidCreateSignature:", self);

  }
  objc_msgSend(v4, "delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v17, "controllerWillDismissSignatureCaptureView:", v4);
  -[AKSignatureCreationViewController_iOS presentingViewController](self, "presentingViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = sub_228FFD014;
  v19[3] = &unk_24F1A7328;
  v19[4] = self;
  objc_msgSend(v18, "dismissViewControllerAnimated:completion:", 1, v19);

  NSLog(CFSTR("Added signature %@"), v8);
}

- (void)_notifyDidDismiss
{
  id v3;

  -[AKSignatureCreationViewController_iOS delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "signatureCreationControllerDidDismiss:", self);

}

- (void)_applicationDidBecomeActive:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[AKSignatureCreationViewController_iOS firstResponder](self, "firstResponder", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "textFields");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "becomeFirstResponder");

  }
}

- (int64_t)positionForBar:(id)a3
{
  return 3;
}

- (void)_showSignatureDescriptionSelectionAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
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
  void *v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id from;
  id location[2];

  objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKSignatureCreationViewController_iOS downArrowButton](self, "downArrowButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "popoverPresentationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSourceView:", v4);

  -[AKSignatureCreationViewController_iOS downArrowButton](self, "downArrowButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend(v3, "popoverPresentationController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setSourceRect:", v8, v10, v12, v14);

  objc_msgSend(v3, "popoverPresentationController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 1;
  objc_msgSend(v16, "setPermittedArrowDirections:", 1);

  objc_initWeak(location, self);
  objc_initWeak(&from, v3);
  v18 = MEMORY[0x24BDAC760];
  do
  {
    +[AKSignatureDescription stringValueForSignatureDescriptionTag:](AKSignatureDescription, "stringValueForSignatureDescriptionTag:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x24BDF67E8];
    v41[0] = v18;
    v41[1] = 3221225472;
    v41[2] = sub_228FFD580;
    v41[3] = &unk_24F1A79E8;
    objc_copyWeak(&v43, location);
    v21 = v19;
    v42 = v21;
    objc_msgSend(v20, "actionWithTitle:style:handler:", v21, 0, v41);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "_setChecked:", v17 == -[AKSignatureCreationViewController_iOS descriptionTag](self, "descriptionTag"));
    objc_msgSend(v3, "addAction:", v22);

    objc_destroyWeak(&v43);
    ++v17;
  }
  while (v17 != 6);
  v23 = (void *)MEMORY[0x24BDF67E8];
  +[AKController akBundle](AKController, "akBundle");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("Custom Label"), &stru_24F1A83D0, CFSTR("AKSignatureCreationViewController_iOS"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v18;
  v38[1] = 3221225472;
  v38[2] = sub_228FFD5BC;
  v38[3] = &unk_24F1A7A10;
  objc_copyWeak(&v39, &from);
  objc_copyWeak(&v40, location);
  objc_msgSend(v23, "actionWithTitle:style:handler:", v25, 0, v38);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "_setChecked:", -[AKSignatureCreationViewController_iOS descriptionTag](self, "descriptionTag") == -1);
  objc_msgSend(v3, "addAction:", v26);
  v27 = (void *)MEMORY[0x24BDF67E8];
  +[AKController akBundle](AKController, "akBundle");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("No Label"), &stru_24F1A83D0, CFSTR("AKSignatureCreationViewController_iOS"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v18;
  v35[1] = 3221225472;
  v35[2] = sub_228FFD69C;
  v35[3] = &unk_24F1A7A10;
  objc_copyWeak(&v36, &from);
  objc_copyWeak(&v37, location);
  objc_msgSend(v27, "actionWithTitle:style:handler:", v29, 2, v35);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addAction:", v30);

  v31 = (void *)MEMORY[0x24BDF67E8];
  +[AKController akBundle](AKController, "akBundle");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("Cancel"), &stru_24F1A83D0, CFSTR("AKSignatureCreationViewController_iOS"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "actionWithTitle:style:handler:", v33, 1, 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addAction:", v34);

  -[AKSignatureCreationViewController_iOS presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v3, 1, 0);
  objc_destroyWeak(&v37);
  objc_destroyWeak(&v36);

  objc_destroyWeak(&v40);
  objc_destroyWeak(&v39);
  objc_destroyWeak(&from);
  objc_destroyWeak(location);

}

- (void)showEditCustomDescriptionAlert
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
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id from;
  id location[2];

  v3 = (void *)MEMORY[0x24BDF67F0];
  +[AKController akBundle](AKController, "akBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Custom Label"), &stru_24F1A83D0, CFSTR("AKSignatureCreationViewController_iOS"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v5, 0, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(location, self);
  objc_initWeak(&from, v6);
  v7 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = sub_228FFDA7C;
  v21[3] = &unk_24F1A7A38;
  objc_copyWeak(&v22, location);
  objc_msgSend(v6, "addTextFieldWithConfigurationHandler:", v21);
  v8 = (void *)MEMORY[0x24BDF67E8];
  +[AKController akBundle](AKController, "akBundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Cancel"), &stru_24F1A83D0, CFSTR("AKSignatureCreationViewController_iOS"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v7;
  v19[1] = 3221225472;
  v19[2] = sub_228FFDB44;
  v19[3] = &unk_24F1A7A60;
  objc_copyWeak(&v20, &from);
  objc_msgSend(v8, "actionWithTitle:style:handler:", v10, 1, v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v11);

  v12 = (void *)MEMORY[0x24BDF67E8];
  +[AKController akBundle](AKController, "akBundle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Done"), &stru_24F1A83D0, CFSTR("AKSignatureCreationViewController_iOS"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  v16[1] = 3221225472;
  v16[2] = sub_228FFDB78;
  v16[3] = &unk_24F1A7A10;
  objc_copyWeak(&v17, &from);
  objc_copyWeak(&v18, location);
  objc_msgSend(v12, "actionWithTitle:style:handler:", v14, 0, v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v15);

  -[AKSignatureCreationViewController_iOS presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&from);
  objc_destroyWeak(location);

}

- (void)_removeSignatureDescription
{
  void *v3;
  void *v4;
  id v5;

  -[AKSignatureCreationViewController_iOS setDescriptionTag:](self, "setDescriptionTag:", 0);
  -[AKSignatureCreationViewController_iOS setCustomDescription:](self, "setCustomDescription:", 0);
  +[AKController akBundle](AKController, "akBundle");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("New Signature"), &stru_24F1A83D0, CFSTR("AKSignatureCreationViewController_iOS"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKSignatureCreationViewController_iOS titleLabel](self, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v3);

}

- (void)_updateSignatureDescriptionWithStringValue:(id)a3
{
  void *v4;
  void *v5;
  int64_t v6;
  int64_t v7;
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  +[AKSignatureDescription stringValueForSignatureDescriptionTag:](AKSignatureDescription, "stringValueForSignatureDescriptionTag:", -[AKSignatureCreationViewController_iOS descriptionTag](self, "descriptionTag"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKSignatureCreationViewController_iOS undoManager](self, "undoManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerUndoWithTarget:selector:object:", self, sel__updateSignatureDescriptionWithStringValue_, v4);

  v6 = +[AKSignatureDescription signatureDescriptionTagFromStringValue:](AKSignatureDescription, "signatureDescriptionTagFromStringValue:", v10);
  if (v6)
  {
    v7 = v6;
    -[AKSignatureCreationViewController_iOS setDescriptionTag:](self, "setDescriptionTag:", v6);
    if (v7 == -1)
      v8 = v10;
    else
      v8 = 0;
    -[AKSignatureCreationViewController_iOS setCustomDescription:](self, "setCustomDescription:", v8);
    -[AKSignatureCreationViewController_iOS titleLabel](self, "titleLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", v10);

  }
  else
  {
    -[AKSignatureCreationViewController_iOS _removeSignatureDescription](self, "_removeSignatureDescription");
  }

}

- (id)undoManager
{
  void *v3;
  id v4;

  -[AKSignatureCreationViewController_iOS _undoManager](self, "_undoManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDD1898]);
    -[AKSignatureCreationViewController_iOS set_undoManager:](self, "set_undoManager:", v4);

  }
  return -[AKSignatureCreationViewController_iOS _undoManager](self, "_undoManager");
}

- (void)motionEnded:(int64_t)a3 withEvent:(id)a4
{
  id v4;

  if (a3 == 1)
  {
    -[AKSignatureCreationViewController_iOS undoManager](self, "undoManager", 1, a4);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "undo");

  }
}

- (AKSignatureCreationControllerDelegate)delegate
{
  return (AKSignatureCreationControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UINavigationBar)navBar
{
  return self->_navBar;
}

- (void)setNavBar:(id)a3
{
  objc_storeStrong((id *)&self->_navBar, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UIButton)downArrowButton
{
  return self->_downArrowButton;
}

- (void)setDownArrowButton:(id)a3
{
  objc_storeStrong((id *)&self->_downArrowButton, a3);
}

- (UIButton)clearButton
{
  return self->_clearButton;
}

- (void)setClearButton:(id)a3
{
  objc_storeStrong((id *)&self->_clearButton, a3);
}

- (AKSmoothPathView)pathView
{
  return self->_pathView;
}

- (void)setPathView:(id)a3
{
  objc_storeStrong((id *)&self->_pathView, a3);
}

- (AKInkSignatureView)signatureView
{
  return self->_signatureView;
}

- (void)setSignatureView:(id)a3
{
  objc_storeStrong((id *)&self->_signatureView, a3);
}

- (AKSignatureBaselineView)baselineView
{
  return self->_baselineView;
}

- (void)setBaselineView:(id)a3
{
  objc_storeStrong((id *)&self->_baselineView, a3);
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (AKController)controller
{
  return (AKController *)objc_loadWeakRetained((id *)&self->_controller);
}

- (void)setController:(id)a3
{
  objc_storeWeak((id *)&self->_controller, a3);
}

- (UIResponder)responderToRestore
{
  return (UIResponder *)objc_loadWeakRetained((id *)&self->_responderToRestore);
}

- (void)setResponderToRestore:(id)a3
{
  objc_storeWeak((id *)&self->_responderToRestore, a3);
}

- (int64_t)descriptionTag
{
  return self->_descriptionTag;
}

- (void)setDescriptionTag:(int64_t)a3
{
  self->_descriptionTag = a3;
}

- (NSString)customDescription
{
  return self->_customDescription;
}

- (void)setCustomDescription:(id)a3
{
  objc_storeStrong((id *)&self->_customDescription, a3);
}

- (NSUndoManager)_undoManager
{
  return self->__undoManager;
}

- (void)set_undoManager:(id)a3
{
  objc_storeStrong((id *)&self->__undoManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__undoManager, 0);
  objc_storeStrong((id *)&self->_customDescription, 0);
  objc_destroyWeak((id *)&self->_responderToRestore);
  objc_destroyWeak((id *)&self->_controller);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_baselineView, 0);
  objc_storeStrong((id *)&self->_signatureView, 0);
  objc_storeStrong((id *)&self->_pathView, 0);
  objc_storeStrong((id *)&self->_clearButton, 0);
  objc_storeStrong((id *)&self->_downArrowButton, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_navBar, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

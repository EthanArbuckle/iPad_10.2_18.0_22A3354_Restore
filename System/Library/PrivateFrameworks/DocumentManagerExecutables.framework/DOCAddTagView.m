@implementation DOCAddTagView

- (DOCAddTagView)initWithFrame:(CGRect)a3
{
  DOCAddTagView *v3;
  uint64_t v4;
  CAShapeLayer *backgroundShapeLayer;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UILabel *v10;
  UILabel *addNewTagLabel;
  void *v12;
  void *v13;
  double v14;
  DOCTagDotView *v15;
  DOCTagDotView *tagDotView;
  void *v17;
  DOCAddTagViewTextField *v18;
  DOCAddTagViewTextField *tagNameTextField;
  double v20;
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
  void *v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  _TtC26DocumentManagerExecutables33DOCTextFieldRoundedBackgroundView *v49;
  _TtC26DocumentManagerExecutables33DOCTextFieldRoundedBackgroundView *backgroundDuringTextInput;
  _TtC26DocumentManagerExecutables33DOCTextFieldRoundedBackgroundView *v51;
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
  double v62;
  double v63;
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
  uint64_t v77;
  NSArray *notificationObservances;
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
  void *v117;
  void *v118;
  void *v119;
  _QWORD v120[4];
  id v121;
  id location;
  _QWORD v123[4];
  DOCAddTagView *v124;
  objc_super v125;
  void *v126;
  _QWORD v127[9];
  _QWORD v128[6];

  v128[4] = *MEMORY[0x24BDAC8D0];
  v125.receiver = self;
  v125.super_class = (Class)DOCAddTagView;
  v3 = -[DOCAddTagView initWithFrame:](&v125, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDE5758], "layer");
    v4 = objc_claimAutoreleasedReturnValue();
    backgroundShapeLayer = v3->_backgroundShapeLayer;
    v3->_backgroundShapeLayer = (CAShapeLayer *)v4;

    -[CAShapeLayer setFillColor:](v3->_backgroundShapeLayer, "setFillColor:", 0);
    -[DOCAddTagView layer](v3, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSublayer:", v3->_backgroundShapeLayer);

    v7 = (void *)MEMORY[0x24BEBB520];
    +[DOCTagAppearance pickerList](DOCTagAppearance, "pickerList");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "titleTextStyle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "preferredFontForTextStyle:", v9);
    v119 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    addNewTagLabel = v3->_addNewTagLabel;
    v3->_addNewTagLabel = v10;

    _DocumentManagerBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Add New Tag [Action Title]"), CFSTR("Add New Tag…"), CFSTR("Localizable"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v3->_addNewTagLabel, "setText:", v13);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_addNewTagLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setFont:](v3->_addNewTagLabel, "setFont:", v119);
    -[UILabel setAdjustsFontForContentSizeCategory:](v3->_addNewTagLabel, "setAdjustsFontForContentSizeCategory:", 1);
    LODWORD(v14) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v3->_addNewTagLabel, "setContentCompressionResistancePriority:forAxis:", 1, v14);
    v15 = -[DOCTagDotView initWithDefaultTagDimension:adjustsSizeForContentSizeCategory:]([DOCTagDotView alloc], "initWithDefaultTagDimension:adjustsSizeForContentSizeCategory:", 1, DOCDefaultTagDimension());
    tagDotView = v3->_tagDotView;
    v3->_tagDotView = v15;

    objc_msgSend(MEMORY[0x24BE2DF20], "untitledTagForRendering:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCTagDotView setItemTag:](v3->_tagDotView, "setItemTag:", v17);

    v18 = objc_alloc_init(DOCAddTagViewTextField);
    tagNameTextField = v3->_tagNameTextField;
    v3->_tagNameTextField = v18;

    -[DOCAddTagViewTextField setFont:](v3->_tagNameTextField, "setFont:", v119);
    -[DOCAddTagViewTextField setAdjustsFontForContentSizeCategory:](v3->_tagNameTextField, "setAdjustsFontForContentSizeCategory:", 1);
    -[DOCAddTagViewTextField setTranslatesAutoresizingMaskIntoConstraints:](v3->_tagNameTextField, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v20) = 1148846080;
    -[DOCAddTagViewTextField setContentCompressionResistancePriority:forAxis:](v3->_tagNameTextField, "setContentCompressionResistancePriority:forAxis:", 1, v20);
    -[DOCAddTagViewTextField setEnablesReturnKeyAutomatically:](v3->_tagNameTextField, "setEnablesReturnKeyAutomatically:", 1);
    -[DOCAddTagViewTextField setDelegate:](v3->_tagNameTextField, "setDelegate:", v3);
    v116 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD908]), "initWithDelegate:", v3);
    -[DOCAddTagViewTextField addInteraction:](v3->_tagNameTextField, "addInteraction:", v116);
    -[DOCAddTagViewTextField addTarget:action:forControlEvents:](v3->_tagNameTextField, "addTarget:action:forControlEvents:", v3, sel_textFieldDidChange_, 0x20000);
    -[DOCAddTagView tagDotView](v3, "tagDotView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCAddTagView addSubview:](v3, "addSubview:", v21);

    -[DOCAddTagView addNewTagLabel](v3, "addNewTagLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCAddTagView addSubview:](v3, "addSubview:", v22);

    -[DOCAddTagView tagNameTextField](v3, "tagNameTextField");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCAddTagView addSubview:](v3, "addSubview:", v23);

    +[DOCTagAppearance makerUI](DOCTagAppearance, "makerUI");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v13) = objc_msgSend(v24, "inputFieldShowsLeadingDot");

    if ((_DWORD)v13)
    {
      -[DOCAddTagView tagNameTextField](v3, "tagNameTextField");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "leadingAnchor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[DOCAddTagView addNewTagLabel](v3, "addNewTagLabel");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "leadingAnchor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "constraintEqualToAnchor:", v28);
      v115 = (void *)objc_claimAutoreleasedReturnValue();

      -[DOCAddTagView addNewTagLabel](v3, "addNewTagLabel");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "trailingAnchor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[DOCAddTagView tagNameTextField](v3, "tagNameTextField");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "trailingAnchor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "constraintEqualToAnchor:", v32);
    }
    else
    {
      +[DOCTagAppearance pickerList](DOCTagAppearance, "pickerList");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "spacing_leadingEdgeToDot");
      v35 = v34;

      -[DOCAddTagView tagNameTextField](v3, "tagNameTextField");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "leadingAnchor");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[DOCAddTagView layoutMarginsGuide](v3, "layoutMarginsGuide");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "leadingAnchor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "constraintEqualToAnchor:constant:", v39, v35);
      v115 = (void *)objc_claimAutoreleasedReturnValue();

      -[DOCAddTagView addNewTagLabel](v3, "addNewTagLabel");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "trailingAnchor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[DOCAddTagView tagNameTextField](v3, "tagNameTextField");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "trailingAnchor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "constraintEqualToAnchor:constant:", v32, v35);
    }
    v108 = (void *)objc_claimAutoreleasedReturnValue();

    +[DOCTagAppearance makerUI](DOCTagAppearance, "makerUI");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "inputFieldRoundedCornerBackgroundMargins");
    v42 = v41;
    v44 = v43;
    v46 = v45;
    v48 = v47;

    if (v44 != *(double *)(MEMORY[0x24BEBD250] + 8)
      || v42 != *MEMORY[0x24BEBD250]
      || v48 != *(double *)(MEMORY[0x24BEBD250] + 24)
      || v46 != *(double *)(MEMORY[0x24BEBD250] + 16))
    {
      -[DOCAddTagView tagNameTextField](v3, "tagNameTextField");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = (_TtC26DocumentManagerExecutables33DOCTextFieldRoundedBackgroundView *)objc_opt_new();
      -[DOCTextFieldRoundedBackgroundView setTranslatesAutoresizingMaskIntoConstraints:](v49, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      backgroundDuringTextInput = v3->_backgroundDuringTextInput;
      v3->_backgroundDuringTextInput = v49;
      v51 = v49;

      -[DOCAddTagView addSubview:](v3, "addSubview:", v51);
      v102 = (void *)MEMORY[0x24BDD1628];
      -[DOCTextFieldRoundedBackgroundView topAnchor](v51, "topAnchor");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v117, "topAnchor");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v113, "constraintEqualToAnchor:constant:", v111, -v42);
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      v128[0] = v109;
      -[DOCTextFieldRoundedBackgroundView bottomAnchor](v51, "bottomAnchor");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v117, "bottomAnchor");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "constraintEqualToAnchor:constant:", v104, v46);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v128[1] = v52;
      -[DOCTextFieldRoundedBackgroundView leadingAnchor](v51, "leadingAnchor");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v117, "leadingAnchor");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "constraintEqualToAnchor:constant:", v54, -v44);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v128[2] = v55;
      -[DOCTextFieldRoundedBackgroundView trailingAnchor](v51, "trailingAnchor");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v117, "trailingAnchor");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "constraintEqualToAnchor:constant:", v57, v48);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v128[3] = v58;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v128, 4);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "activateConstraints:", v59);

      v60 = (void *)MEMORY[0x24BEBDB00];
      v123[0] = MEMORY[0x24BDAC760];
      v123[1] = 3221225472;
      v123[2] = __31__DOCAddTagView_initWithFrame___block_invoke;
      v123[3] = &unk_24E3279E8;
      v124 = v3;
      objc_msgSend(v60, "performWithoutAnimation:", v123);

    }
    +[DOCTagAppearance pickerList](DOCTagAppearance, "pickerList");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "cellInteriorLayoutMargins");
    -[DOCAddTagView setDirectionalLayoutMargins:](v3, "setDirectionalLayoutMargins:");

    v80 = (void *)MEMORY[0x24BDD1628];
    -[DOCAddTagView leadingAnchor](v3, "leadingAnchor");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCAddTagView tagDotView](v3, "tagDotView");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "leadingAnchor");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    +[DOCTagAppearance pickerList](DOCTagAppearance, "pickerList");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "spacing_leadingEdgeToDot");
    objc_msgSend(v112, "constraintEqualToAnchor:constant:", v110, -v62);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v127[0] = v107;
    -[DOCAddTagView tagDotView](v3, "tagDotView");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "trailingAnchor");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCAddTagView addNewTagLabel](v3, "addNewTagLabel");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "leadingAnchor");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    +[DOCTagAppearance pickerList](DOCTagAppearance, "pickerList");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "spacing_dotToTitle");
    objc_msgSend(v100, "constraintEqualToAnchor:constant:", v99, -v63);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v127[1] = v98;
    -[DOCAddTagView addNewTagLabel](v3, "addNewTagLabel");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "trailingAnchor");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCAddTagView layoutMarginsGuide](v3, "layoutMarginsGuide");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "trailingAnchor");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "constraintEqualToAnchor:", v94);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v127[2] = v93;
    v127[3] = v115;
    v127[4] = v108;
    -[DOCAddTagView addNewTagLabel](v3, "addNewTagLabel");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "firstBaselineAnchor");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCAddTagView layoutMarginsGuide](v3, "layoutMarginsGuide");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "topAnchor");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v89, 0.979591837);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v127[5] = v88;
    -[DOCAddTagView layoutMarginsGuide](v3, "layoutMarginsGuide");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "bottomAnchor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCAddTagView addNewTagLabel](v3, "addNewTagLabel");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "lastBaselineAnchor");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v84, 1.12);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v127[6] = v83;
    -[DOCAddTagView tagDotView](v3, "tagDotView");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "centerYAnchor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCAddTagView addNewTagLabel](v3, "addNewTagLabel");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "centerYAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "constraintEqualToAnchor:", v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v127[7] = v66;
    -[DOCAddTagView addNewTagLabel](v3, "addNewTagLabel");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "firstBaselineAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCAddTagView tagNameTextField](v3, "tagNameTextField");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "firstBaselineAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "constraintEqualToAnchor:", v70);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v127[8] = v71;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v127, 9);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "activateConstraints:", v72);

    v73 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", v3, sel_handleTapGesture_);
    -[DOCAddTagView addGestureRecognizer:](v3, "addGestureRecognizer:", v73);

    objc_initWeak(&location, v3);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v120[0] = MEMORY[0x24BDAC760];
    v120[1] = 3221225472;
    v120[2] = __31__DOCAddTagView_initWithFrame___block_invoke_2;
    v120[3] = &unk_24E327A58;
    objc_copyWeak(&v121, &location);
    objc_msgSend(v74, "addObserverForName:object:queue:usingBlock:", *MEMORY[0x24BEBDDB8], 0, v75, v120);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v126 = v76;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v126, 1);
    v77 = objc_claimAutoreleasedReturnValue();
    notificationObservances = v3->_notificationObservances;
    v3->_notificationObservances = (NSArray *)v77;

    -[DOCAddTagView setupHoverEffects](v3, "setupHoverEffects");
    objc_destroyWeak(&v121);
    objc_destroyWeak(&location);

  }
  return v3;
}

uint64_t __31__DOCAddTagView_initWithFrame___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateBackground");
}

void __31__DOCAddTagView_initWithFrame___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateBackground");

}

- (void)dealloc
{
  void *v3;
  NSArray *notificationObservances;
  id v5;
  objc_super v6;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  notificationObservances = self->_notificationObservances;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __24__DOCAddTagView_dealloc__block_invoke;
  v7[3] = &unk_24E327A80;
  v8 = v3;
  v5 = v3;
  -[NSArray enumerateObjectsUsingBlock:](notificationObservances, "enumerateObjectsUsingBlock:", v7);

  v6.receiver = self;
  v6.super_class = (Class)DOCAddTagView;
  -[DOCAddTagView dealloc](&v6, sel_dealloc);
}

uint64_t __24__DOCAddTagView_dealloc__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeObserver:", a2);
}

- (BOOL)isEditing
{
  void *v2;
  char v3;

  -[DOCAddTagView tagNameTextField](self, "tagNameTextField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEditing");

  return v3;
}

- (void)setupHoverEffects
{
  void *v3;
  void *v4;

  -[DOCAddTagViewTextField setHoverStyle:](self->_tagNameTextField, "setHoverStyle:", 0);
  +[DOCTagAppearance pickerList](DOCTagAppearance, "pickerList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cellContentHoverStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DOCAddTagView setHoverStyle:](self, "setHoverStyle:", v4);

  -[DOCAddTagView updateHoverEffects](self, "updateHoverEffects");
}

- (void)updateHoverEffects
{
  uint64_t v3;
  id v4;

  v3 = -[DOCAddTagView isEditing](self, "isEditing") ^ 1;
  -[DOCAddTagView hoverStyle](self, "hoverStyle");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", v3);

}

- (void)updateBackground
{
  _BOOL8 v3;

  -[DOCAddTagView _updateShapeLayerAttributes](self, "_updateShapeLayerAttributes");
  -[DOCAddTagView _updateBorderPath](self, "_updateBorderPath");
  if (self->_backgroundDuringTextInput)
  {
    v3 = -[DOCAddTagView isEditing](self, "isEditing");
    -[DOCTextFieldRoundedBackgroundView setHidden:](self->_backgroundDuringTextInput, "setHidden:", v3 ^ 1);
    -[CAShapeLayer setHidden:](self->_backgroundShapeLayer, "setHidden:", v3);
  }
  -[DOCAddTagView updateHoverEffects](self, "updateHoverEffects");
}

- (void)_updateShapeLayerAttributes
{
  void *v3;
  int v4;
  void *v5;
  id v6;
  id v7;
  _BOOL4 IsBoldTextEnabled;
  double v9;
  id v10;

  -[DOCAddTagView backgroundShapeLayer](self, "backgroundShapeLayer");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  +[DOCTagAppearance pickerList](DOCTagAppearance, "pickerList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "addTagCellShowsDashedBorder");

  if (v4)
  {
    if (-[DOCAddTagView isEditing](self, "isEditing"))
    {
      v5 = 0;
    }
    else if (UIAccessibilityIsBoldTextEnabled())
    {
      v5 = &unk_24E33E940;
    }
    else
    {
      v5 = &unk_24E33E958;
    }
    objc_msgSend(v10, "setLineDashPattern:", v5);
    IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
    v9 = 1.0;
    if (IsBoldTextEnabled)
      v9 = 2.0;
    objc_msgSend(v10, "setLineWidth:", v9);
    objc_msgSend(MEMORY[0x24BEBD4B8], "separatorColor");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v10, "setStrokeColor:", objc_msgSend(v6, "CGColor"));
  }
  else
  {
    +[DOCTagAppearance pickerList](DOCTagAppearance, "pickerList");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "backgroundColorForTag:selected:", 0, 0);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v10, "setFillColor:", objc_msgSend(v7, "CGColor"));

  }
}

- (void)_updateBorderPath
{
  void *v3;
  double v4;
  CGFloat v5;
  double x;
  double y;
  double width;
  double height;
  void *v10;
  void *v11;
  void *v12;
  double v13;
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
  id v25;
  CGRect v26;
  CGRect v27;

  -[DOCAddTagView backgroundShapeLayer](self, "backgroundShapeLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lineWidth");
  v5 = v4 * 0.5;

  -[DOCAddTagView bounds](self, "bounds");
  v27 = CGRectInset(v26, v5, v5);
  x = v27.origin.x;
  y = v27.origin.y;
  width = v27.size.width;
  height = v27.size.height;
  if (CGRectIsNull(v27))
  {
    v10 = 0;
  }
  else
  {
    v11 = (void *)MEMORY[0x24BEBD420];
    +[DOCTagAppearance pickerList](DOCTagAppearance, "pickerList");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "cellCornerRadius");
    objc_msgSend(v11, "bezierPathWithRoundedRect:cornerRadius:", x, y, width, height, v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v25 = objc_retainAutorelease(v10);
  v14 = objc_msgSend(v25, "CGPath");
  -[DOCAddTagView backgroundShapeLayer](self, "backgroundShapeLayer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setPath:", v14);

  -[DOCAddTagView bounds](self, "bounds");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  -[DOCAddTagView backgroundShapeLayer](self, "backgroundShapeLayer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setFrame:", v17, v19, v21, v23);

}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  BOOL v16;
  objc_super v17;
  CGRect v18;
  CGRect v19;

  v17.receiver = self;
  v17.super_class = (Class)DOCAddTagView;
  -[DOCAddTagView layoutSubviews](&v17, sel_layoutSubviews);
  -[DOCAddTagView backgroundShapeLayer](self, "backgroundShapeLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[DOCAddTagView bounds](self, "bounds");
  v19.origin.x = v12;
  v19.origin.y = v13;
  v19.size.width = v14;
  v19.size.height = v15;
  v18.origin.x = v5;
  v18.origin.y = v7;
  v18.size.width = v9;
  v18.size.height = v11;
  v16 = CGRectEqualToRect(v18, v19);

  if (!v16)
    -[DOCAddTagView updateBackground](self, "updateBackground");
}

- (void)commit
{
  void *v3;
  id v4;

  -[DOCAddTagView tagNameTextField](self, "tagNameTextField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DOCAddTagView textFieldShouldReturn:](self, "textFieldShouldReturn:", v3);

  -[DOCAddTagView endEditing:](self, "endEditing:", 0);
  -[DOCAddTagView tagNameTextField](self, "tagNameTextField");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", &stru_24E330BE0);

}

- (void)cancel
{
  -[DOCAddTagView endEditing:](self, "endEditing:", 1);
  -[DOCAddTagView setShowingAddNewTagLabel:](self, "setShowingAddNewTagLabel:", 1);
}

- (void)handleTapGesture:(id)a3
{
  id v3;

  -[DOCAddTagView tagNameTextField](self, "tagNameTextField", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "becomeFirstResponder");

}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v4;

  -[DOCAddTagView setShowingAddNewTagLabel:](self, "setShowingAddNewTagLabel:", 0);
  -[DOCAddTagView updateBackground](self, "updateBackground");
  -[DOCAddTagView delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addTagTextFieldDidBeginEditing:", self);

}

- (void)textFieldDidEndEditing:(id)a3
{
  void *v4;
  int v5;
  id v6;

  -[DOCAddTagView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "addTagTextFieldShouldEndEditing:", self);

  if (v5)
  {
    -[DOCAddTagView setShowingAddNewTagLabel:](self, "setShowingAddNewTagLabel:", 1);
    -[DOCAddTagView updateBackground](self, "updateBackground");
    -[DOCAddTagView delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addTagTextFieldDidEndEditing:", self);

  }
}

- (void)setShowingAddNewTagLabel:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v3 = a3;
  -[DOCAddTagView addNewTagLabel](self, "addNewTagLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    objc_msgSend(v5, "setHidden:", 0);

    -[DOCAddTagView tagDotView](self, "tagDotView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidden:", 0);

    -[DOCAddTagView tagNameTextField](self, "tagNameTextField");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", &stru_24E330BE0);

    -[DOCAddTagView tagNameTextField](self, "tagNameTextField");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPlaceholder:", &stru_24E330BE0);
  }
  else
  {
    objc_msgSend(v5, "setHidden:", 1);

    +[DOCTagAppearance makerUI](DOCTagAppearance, "makerUI");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "inputFieldShowsLeadingDot") ^ 1;
    -[DOCAddTagView tagDotView](self, "tagDotView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setHidden:", v10);

    _DocumentManagerBundle();
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Tag Name"), CFSTR("Tag Name"), CFSTR("Localizable"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCAddTagView tagNameTextField](self, "tagNameTextField");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setPlaceholder:", v12);

  }
}

- (void)textFieldDidChange:(id)a3
{
  id v4;

  -[DOCAddTagView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addTagTextFieldDidChange:", self);

}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;

  v4 = a3;
  -[DOCAddTagView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DOCAddTagView tagNameTextField](self, "tagNameTextField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "addTagTextField:userDidCreateTagWithName:", self, v7);

  if (v8)
    objc_msgSend(v4, "resignFirstResponder");

  return v8;
}

- (NSString)text
{
  void *v2;
  void *v3;

  -[DOCAddTagView tagNameTextField](self, "tagNameTextField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)scribbleInteractionShouldDelayFocus:(id)a3
{
  return 1;
}

- (void)scribbleInteractionWillBeginWriting:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __53__DOCAddTagView_scribbleInteractionWillBeginWriting___block_invoke;
  v3[3] = &unk_24E3279E8;
  v3[4] = self;
  objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:", v3, 0.2);
}

uint64_t __53__DOCAddTagView_scribbleInteractionWillBeginWriting___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setShowingAddNewTagLabel:", 0);
}

- (DOCAddTagTextFieldDelegate)delegate
{
  return (DOCAddTagTextFieldDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (DOCTagDotView)tagDotView
{
  return self->_tagDotView;
}

- (UILabel)addNewTagLabel
{
  return self->_addNewTagLabel;
}

- (DOCAddTagViewTextField)tagNameTextField
{
  return self->_tagNameTextField;
}

- (CAShapeLayer)backgroundShapeLayer
{
  return self->_backgroundShapeLayer;
}

- (NSArray)notificationObservances
{
  return self->_notificationObservances;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationObservances, 0);
  objc_storeStrong((id *)&self->_backgroundShapeLayer, 0);
  objc_storeStrong((id *)&self->_tagNameTextField, 0);
  objc_storeStrong((id *)&self->_addNewTagLabel, 0);
  objc_storeStrong((id *)&self->_tagDotView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_backgroundDuringTextInput, 0);
}

@end

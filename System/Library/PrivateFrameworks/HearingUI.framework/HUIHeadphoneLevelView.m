@implementation HUIHeadphoneLevelView

- (HUIHeadphoneLevelView)init
{
  HUIHeadphoneLevelView *v2;
  void *v3;
  uint64_t v4;
  NSNumberFormatter *dbFormatter;
  NSNumberFormatter *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  MTMaterialView *backgroundView;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  UIView *centerContainer;
  id v22;
  void *v23;
  uint64_t v24;
  UIVisualEffectView *titleContainer;
  uint64_t v26;
  UIView *subtitleContainer;
  uint64_t v28;
  UILabel *titleLabel;
  void *v30;
  UILabel *v31;
  void *v32;
  void *v33;
  UILabel *v34;
  void *v35;
  UILabel *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  UILabel *subtitleLeftLabel;
  uint64_t v41;
  void *v42;
  UILabel *v43;
  void *v44;
  void *v45;
  UILabel *v46;
  void *v47;
  UILabel *v48;
  void *v49;
  uint64_t v50;
  UILabel *subtitleRightLabel;
  UILabel *v52;
  void *v53;
  void *v54;
  UILabel *v55;
  void *v56;
  UILabel *v57;
  uint64_t v58;
  id v59;
  void *v60;
  uint64_t v61;
  UIVisualEffectView *labelContainer;
  uint64_t v63;
  UILabel *minLabel;
  UILabel *v65;
  void *v66;
  UILabel *v67;
  void *v68;
  void *v69;
  UILabel *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  uint64_t v74;
  UILabel *thresholdLabel;
  UILabel *v76;
  void *v77;
  UILabel *v78;
  void *v79;
  void *v80;
  UILabel *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  UILabel *maxLabel;
  UILabel *v86;
  void *v87;
  UILabel *v88;
  void *v89;
  void *v90;
  UILabel *v91;
  void *v92;
  UILabel *v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  HUIHeadphoneLevelGroup *levelGroup;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  objc_super v105;
  _QWORD v106[5];

  v106[4] = *MEMORY[0x24BDAC8D0];
  v105.receiver = self;
  v105.super_class = (Class)HUIHeadphoneLevelView;
  v2 = -[HUIHeadphoneLevelView init](&v105, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_updateConstraints, *MEMORY[0x24BEBE088], 0);

    -[HUIHeadphoneLevelView setClipsToBounds:](v2, "setClipsToBounds:", 1);
    -[HUIHeadphoneLevelView _setContinuousCornerRadius:](v2, "_setContinuousCornerRadius:", 37.0);
    v2->_isRTL = objc_msgSend(MEMORY[0x24BEBDB00], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[HUIHeadphoneLevelView semanticContentAttribute](v2, "semanticContentAttribute")) == 1;
    v4 = objc_opt_new();
    dbFormatter = v2->_dbFormatter;
    v2->_dbFormatter = (NSNumberFormatter *)v4;

    -[NSNumberFormatter setNumberStyle:](v2->_dbFormatter, "setNumberStyle:", 1);
    -[NSNumberFormatter setMaximumFractionDigits:](v2->_dbFormatter, "setMaximumFractionDigits:", 0);
    v6 = v2->_dbFormatter;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSNumberFormatter stringFromNumber:](v6, "stringFromNumber:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSNumberFormatter setNotANumberSymbol:](v6, "setNotANumberSymbol:", v8);

    HUICCBackgroundMaterialView();
    v9 = objc_claimAutoreleasedReturnValue();
    backgroundView = v2->_backgroundView;
    v2->_backgroundView = (MTMaterialView *)v9;

    -[MTMaterialView setTranslatesAutoresizingMaskIntoConstraints:](v2->_backgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MTMaterialView setUserInteractionEnabled:](v2->_backgroundView, "setUserInteractionEnabled:", 1);
    -[HUIHeadphoneLevelView insertSubview:atIndex:](v2, "insertSubview:atIndex:", v2->_backgroundView, 0);
    v99 = (void *)MEMORY[0x24BDD1628];
    -[MTMaterialView leadingAnchor](v2->_backgroundView, "leadingAnchor");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUIHeadphoneLevelView leadingAnchor](v2, "leadingAnchor");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "constraintEqualToAnchor:", v102);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v106[0] = v101;
    -[MTMaterialView trailingAnchor](v2->_backgroundView, "trailingAnchor");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUIHeadphoneLevelView trailingAnchor](v2, "trailingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v106[1] = v12;
    -[MTMaterialView topAnchor](v2->_backgroundView, "topAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUIHeadphoneLevelView topAnchor](v2, "topAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v106[2] = v15;
    -[MTMaterialView bottomAnchor](v2->_backgroundView, "bottomAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUIHeadphoneLevelView bottomAnchor](v2, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v106[3] = v18;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v106, 4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "activateConstraints:", v19);

    v20 = objc_opt_new();
    centerContainer = v2->_centerContainer;
    v2->_centerContainer = (UIView *)v20;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v2->_centerContainer, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUIHeadphoneLevelView addSubview:](v2, "addSubview:", v2->_centerContainer);
    v22 = objc_alloc(MEMORY[0x24BEBDB38]);
    objc_msgSend(MEMORY[0x24BEBDAF0], "controlCenterSecondaryVibrancyEffect");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v22, "initWithEffect:", v23);
    titleContainer = v2->_titleContainer;
    v2->_titleContainer = (UIVisualEffectView *)v24;

    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](v2->_titleContainer, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v2->_centerContainer, "addSubview:", v2->_titleContainer);
    v26 = objc_opt_new();
    subtitleContainer = v2->_subtitleContainer;
    v2->_subtitleContainer = (UIView *)v26;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v2->_subtitleContainer, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v2->_centerContainer, "addSubview:", v2->_subtitleContainer);
    v28 = objc_opt_new();
    titleLabel = v2->_titleLabel;
    v2->_titleLabel = (UILabel *)v28;

    objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x24BEBE218], 32770, 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v2->_titleLabel;
    v32 = (void *)MEMORY[0x24BEBB520];
    objc_msgSend(v30, "pointSize");
    objc_msgSend(v32, "fontWithDescriptor:size:", v30);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v31, "setFont:", v33);

    v34 = v2->_titleLabel;
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v34, "setTextColor:", v35);

    -[UILabel setNumberOfLines:](v2->_titleLabel, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](v2->_titleLabel, "setTextAlignment:", 4);
    v36 = v2->_titleLabel;
    hearingLocString();
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v36, "setText:", v37);

    -[UILabel setBaselineAdjustment:](v2->_titleLabel, "setBaselineAdjustment:", 0);
    -[UILabel setClipsToBounds:](v2->_titleLabel, "setClipsToBounds:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v2->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIVisualEffectView contentView](v2->_titleContainer, "contentView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addSubview:", v2->_titleLabel);

    v39 = objc_opt_new();
    subtitleLeftLabel = v2->_subtitleLeftLabel;
    v2->_subtitleLeftLabel = (UILabel *)v39;

    v41 = *MEMORY[0x24BEBE1D0];
    objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x24BEBE1D0], 2, 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    v43 = v2->_subtitleLeftLabel;
    v44 = (void *)MEMORY[0x24BEBB520];
    objc_msgSend(v42, "pointSize");
    objc_msgSend(v44, "fontWithDescriptor:size:", v42);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v43, "setFont:", v45);

    v46 = v2->_subtitleLeftLabel;
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v46, "setTextColor:", v47);

    -[UILabel setNumberOfLines:](v2->_subtitleLeftLabel, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](v2->_subtitleLeftLabel, "setTextAlignment:", 4);
    v48 = v2->_subtitleLeftLabel;
    hearingLocString();
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v48, "setText:", v49);

    -[UILabel setClipsToBounds:](v2->_subtitleLeftLabel, "setClipsToBounds:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v2->_subtitleLeftLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v2->_subtitleContainer, "addSubview:", v2->_subtitleLeftLabel);
    v50 = objc_opt_new();
    subtitleRightLabel = v2->_subtitleRightLabel;
    v2->_subtitleRightLabel = (UILabel *)v50;

    objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", v41, 2, 0);
    v104 = (void *)objc_claimAutoreleasedReturnValue();

    v52 = v2->_subtitleRightLabel;
    v53 = (void *)MEMORY[0x24BEBB520];
    objc_msgSend(v104, "pointSize");
    objc_msgSend(v53, "fontWithDescriptor:size:", v104);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v52, "setFont:", v54);

    v55 = v2->_subtitleRightLabel;
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v55, "setTextColor:", v56);

    -[UILabel setNumberOfLines:](v2->_subtitleRightLabel, "setNumberOfLines:", 0);
    v57 = v2->_subtitleRightLabel;
    if (-[HUIHeadphoneLevelView isRTL](v2, "isRTL"))
      v58 = 0;
    else
      v58 = 2;
    -[UILabel setTextAlignment:](v57, "setTextAlignment:", v58);
    -[UILabel setClipsToBounds:](v2->_subtitleRightLabel, "setClipsToBounds:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v2->_subtitleRightLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v2->_subtitleContainer, "addSubview:", v2->_subtitleRightLabel);
    v59 = objc_alloc(MEMORY[0x24BEBDB38]);
    objc_msgSend(MEMORY[0x24BEBDAF0], "controlCenterSecondaryVibrancyEffect");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v59, "initWithEffect:", v60);
    labelContainer = v2->_labelContainer;
    v2->_labelContainer = (UIVisualEffectView *)v61;

    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](v2->_labelContainer, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v2->_centerContainer, "addSubview:", v2->_labelContainer);
    v63 = objc_opt_new();
    minLabel = v2->_minLabel;
    v2->_minLabel = (UILabel *)v63;

    v65 = v2->_minLabel;
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v65, "setTextColor:", v66);

    v67 = v2->_minLabel;
    -[HUIHeadphoneLevelView dbFormatter](v2, "dbFormatter");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "stringFromNumber:", &unk_24DD6B218);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v67, "setText:", v69);

    v70 = v2->_minLabel;
    v71 = *MEMORY[0x24BEBE1E0];
    objc_msgSend(MEMORY[0x24BEBB520], "_preferredFontForTextStyle:variant:", *MEMORY[0x24BEBE1E0], 0);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v70, "setFont:", v72);

    -[UILabel setNumberOfLines:](v2->_minLabel, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](v2->_minLabel, "setTextAlignment:", 4);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v2->_minLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIVisualEffectView contentView](v2->_labelContainer, "contentView");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "addSubview:", v2->_minLabel);

    v74 = objc_opt_new();
    thresholdLabel = v2->_thresholdLabel;
    v2->_thresholdLabel = (UILabel *)v74;

    v76 = v2->_thresholdLabel;
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v76, "setTextColor:", v77);

    v78 = v2->_thresholdLabel;
    -[HUIHeadphoneLevelView dbFormatter](v2, "dbFormatter");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "stringFromNumber:", &unk_24DD6B230);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v78, "setText:", v80);

    v81 = v2->_thresholdLabel;
    objc_msgSend(MEMORY[0x24BEBB520], "_preferredFontForTextStyle:variant:", v71, 0);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v81, "setFont:", v82);

    -[UILabel setNumberOfLines:](v2->_thresholdLabel, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](v2->_thresholdLabel, "setTextAlignment:", 1);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v2->_thresholdLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIVisualEffectView contentView](v2->_labelContainer, "contentView");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "addSubview:", v2->_thresholdLabel);

    v84 = objc_opt_new();
    maxLabel = v2->_maxLabel;
    v2->_maxLabel = (UILabel *)v84;

    v86 = v2->_maxLabel;
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v86, "setTextColor:", v87);

    v88 = v2->_maxLabel;
    -[HUIHeadphoneLevelView dbFormatter](v2, "dbFormatter");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "stringFromNumber:", &unk_24DD6B248);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v88, "setText:", v90);

    v91 = v2->_maxLabel;
    objc_msgSend(MEMORY[0x24BEBB520], "_preferredFontForTextStyle:variant:", v71, 0);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v91, "setFont:", v92);

    -[UILabel setNumberOfLines:](v2->_maxLabel, "setNumberOfLines:", 0);
    v93 = v2->_maxLabel;
    if (-[HUIHeadphoneLevelView isRTL](v2, "isRTL"))
      v94 = 0;
    else
      v94 = 2;
    -[UILabel setTextAlignment:](v93, "setTextAlignment:", v94);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v2->_maxLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIVisualEffectView contentView](v2->_labelContainer, "contentView");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "addSubview:", v2->_maxLabel);

    v96 = objc_opt_new();
    levelGroup = v2->_levelGroup;
    v2->_levelGroup = (HUIHeadphoneLevelGroup *)v96;

    -[HUIHeadphoneLevelGroup setTranslatesAutoresizingMaskIntoConstraints:](v2->_levelGroup, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v2->_centerContainer, "addSubview:", v2->_levelGroup);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)HUIHeadphoneLevelView;
  -[HUIHeadphoneLevelView dealloc](&v4, sel_dealloc);
}

- (void)layoutSubviews
{
  int v3;
  NSObject *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;
  uint8_t buf[4];
  int v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9.receiver = self;
  v9.super_class = (Class)HUIHeadphoneLevelView;
  -[HUIHeadphoneLevelView layoutSubviews](&v9, sel_layoutSubviews);
  v3 = -[HUIHeadphoneLevelView layoutViewSize](self, "layoutViewSize");
  if (v3 != (_DWORD)Layout)
  {
    HCLogSoundMeter();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = -[HUIHeadphoneLevelView layoutViewSize](self, "layoutViewSize");
      *(_DWORD *)buf = 67109376;
      v11 = v5;
      v12 = 1024;
      v13 = Layout;
      _os_log_impl(&dword_21A95E000, v4, OS_LOG_TYPE_INFO, "Headphone level layout size doesn't match anymore %i -> %i. Rebuilding constraints", buf, 0xEu);
    }

    -[HUIHeadphoneLevelView setLayoutViewSize:](self, "setLayoutViewSize:", Layout);
    v6 = (void *)MEMORY[0x24BDD1628];
    -[HUIHeadphoneLevelView viewConstraints](self, "viewConstraints");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deactivateConstraints:", v7);

    -[HUIHeadphoneLevelView setViewConstraints:](self, "setViewConstraints:", 0);
    -[HUIHeadphoneLevelView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    -[HUIHeadphoneLevelView levelGroup](self, "levelGroup");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNeedsLayout");

  }
}

- (void)updateConstraints
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
  UILabel *thresholdLabel;
  uint64_t v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  char v28;
  _QWORD *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  UILabel *subtitleRightLabel;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  UILabel *v48;
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
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  objc_super v163;
  _QWORD v164[5];
  _QWORD v165[5];
  _QWORD v166[19];
  _QWORD v167[17];

  v167[15] = *MEMORY[0x24BDAC8D0];
  -[HUIHeadphoneLevelView viewConstraints](self, "viewConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v161 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerYAnchor](self->_centerContainer, "centerYAnchor");
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUIHeadphoneLevelView centerYAnchor](self, "centerYAnchor");
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v158, "constraintEqualToAnchor:", v154);
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    v167[0] = v150;
    -[UIView topAnchor](self->_centerContainer, "topAnchor");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUIHeadphoneLevelView topAnchor](self, "topAnchor");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v146, "constraintEqualToAnchor:constant:", v142, 10.0);
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    v167[1] = v138;
    -[UIView bottomAnchor](self->_centerContainer, "bottomAnchor");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUIHeadphoneLevelView bottomAnchor](self, "bottomAnchor");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v134, "constraintEqualToAnchor:constant:", v130, -10.0);
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    v167[2] = v126;
    -[UIView leadingAnchor](self->_centerContainer, "leadingAnchor");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUIHeadphoneLevelView leadingAnchor](self, "leadingAnchor");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v124, "constraintEqualToAnchor:constant:", v122, 20.0);
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    v167[3] = v120;
    -[UIView trailingAnchor](self->_centerContainer, "trailingAnchor");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUIHeadphoneLevelView trailingAnchor](self, "trailingAnchor");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "constraintEqualToAnchor:constant:", v116, -20.0);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    v167[4] = v114;
    -[UIVisualEffectView topAnchor](self->_titleContainer, "topAnchor");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](self->_centerContainer, "topAnchor");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "constraintEqualToAnchor:", v110);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v167[5] = v108;
    -[UIVisualEffectView leadingAnchor](self->_titleContainer, "leadingAnchor");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](self->_centerContainer, "leadingAnchor");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "constraintEqualToAnchor:", v104);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v167[6] = v101;
    -[UIVisualEffectView trailingAnchor](self->_titleContainer, "trailingAnchor");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](self->_centerContainer, "trailingAnchor");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "constraintEqualToAnchor:", v97);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v167[7] = v95;
    -[UIView topAnchor](self->_subtitleContainer, "topAnchor");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView bottomAnchor](self->_titleContainer, "bottomAnchor");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "constraintEqualToAnchor:", v91);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v167[8] = v88;
    -[UIView leadingAnchor](self->_subtitleContainer, "leadingAnchor");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView leadingAnchor](self->_titleContainer, "leadingAnchor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "constraintEqualToAnchor:", v85);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v167[9] = v83;
    -[UIView trailingAnchor](self->_subtitleContainer, "trailingAnchor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView trailingAnchor](self->_titleContainer, "trailingAnchor");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "constraintEqualToAnchor:", v79);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v167[10] = v77;
    -[UIVisualEffectView topAnchor](self->_labelContainer, "topAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUIHeadphoneLevelGroup bottomAnchor](self->_levelGroup, "bottomAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "constraintEqualToAnchor:", v73);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v167[11] = v71;
    -[UIVisualEffectView bottomAnchor](self->_labelContainer, "bottomAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](self->_centerContainer, "bottomAnchor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "constraintEqualToAnchor:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v167[12] = v6;
    -[UIVisualEffectView leadingAnchor](self->_labelContainer, "leadingAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUIHeadphoneLevelGroup leadingAnchor](self->_levelGroup, "leadingAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v167[13] = v9;
    -[UIVisualEffectView trailingAnchor](self->_labelContainer, "trailingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUIHeadphoneLevelGroup trailingAnchor](self->_levelGroup, "trailingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v167[14] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v167, 15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v162, "addObjectsFromArray:", v13);

    LODWORD(v10) = -[HUIHeadphoneLevelView isRTL](self, "isRTL");
    -[HUIHeadphoneLevelGroup topAnchor](self->_levelGroup, "topAnchor");
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](self->_subtitleContainer, "bottomAnchor");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v155, "constraintEqualToAnchor:", v151);
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    v166[0] = v147;
    -[HUIHeadphoneLevelGroup leadingAnchor](self->_levelGroup, "leadingAnchor");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](self->_subtitleContainer, "leadingAnchor");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v143, "constraintEqualToAnchor:", v139);
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    v166[1] = v135;
    -[HUIHeadphoneLevelGroup trailingAnchor](self->_levelGroup, "trailingAnchor");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](self->_subtitleContainer, "trailingAnchor");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v131, "constraintEqualToAnchor:", v127);
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    v166[2] = v125;
    -[UILabel topAnchor](self->_titleLabel, "topAnchor");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView topAnchor](self->_titleContainer, "topAnchor");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "constraintEqualToAnchor:", v121);
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    v166[3] = v119;
    -[UILabel bottomAnchor](self->_titleLabel, "bottomAnchor");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView bottomAnchor](self->_titleContainer, "bottomAnchor");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "constraintEqualToAnchor:", v115);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    v166[4] = v113;
    -[UILabel leadingAnchor](self->_titleLabel, "leadingAnchor");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView leadingAnchor](self->_titleContainer, "leadingAnchor");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "constraintEqualToAnchor:", v109);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v166[5] = v107;
    -[UILabel trailingAnchor](self->_titleLabel, "trailingAnchor");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView trailingAnchor](self->_titleContainer, "trailingAnchor");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "constraintEqualToAnchor:", v103);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    v166[6] = v102;
    -[UILabel topAnchor](self->_subtitleLeftLabel, "topAnchor");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](self->_subtitleContainer, "topAnchor");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "constraintEqualToAnchor:", v98);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v166[7] = v96;
    -[UILabel leadingAnchor](self->_subtitleLeftLabel, "leadingAnchor");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](self->_subtitleContainer, "leadingAnchor");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "constraintEqualToAnchor:", v92);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v166[8] = v90;
    -[UILabel leadingAnchor](self->_minLabel, "leadingAnchor");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView contentView](self->_labelContainer, "contentView");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "leadingAnchor");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "constraintEqualToAnchor:", v84);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v166[9] = v82;
    -[UILabel topAnchor](self->_minLabel, "topAnchor");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView contentView](self->_labelContainer, "contentView");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "topAnchor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "constraintEqualToAnchor:", v76);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v166[10] = v74;
    -[UILabel bottomAnchor](self->_minLabel, "bottomAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView contentView](self->_labelContainer, "contentView");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "bottomAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "constraintEqualToAnchor:", v68);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v166[11] = v67;
    v14 = (void *)MEMORY[0x24BDD1628];
    thresholdLabel = self->_thresholdLabel;
    -[UIVisualEffectView contentView](self->_labelContainer, "contentView");
    v16 = objc_claimAutoreleasedReturnValue();
    v66 = (void *)v16;
    v17 = 1.38888884;
    if ((_DWORD)v10)
      v17 = 0.611111104;
    objc_msgSend(v14, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", thresholdLabel, 9, 0, v16, 9, v17, 0.0);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v166[12] = v65;
    -[UILabel widthAnchor](self->_thresholdLabel, "widthAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView contentView](self->_labelContainer, "contentView");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "widthAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "constraintEqualToAnchor:", v62);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v166[13] = v61;
    -[UILabel topAnchor](self->_thresholdLabel, "topAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView contentView](self->_labelContainer, "contentView");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "topAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "constraintEqualToAnchor:", v58);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v166[14] = v57;
    -[UILabel bottomAnchor](self->_thresholdLabel, "bottomAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView contentView](self->_labelContainer, "contentView");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "bottomAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "constraintEqualToAnchor:", v54);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v166[15] = v53;
    -[UILabel trailingAnchor](self->_maxLabel, "trailingAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView contentView](self->_labelContainer, "contentView");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "trailingAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintEqualToAnchor:", v50);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v166[16] = v49;
    -[UILabel topAnchor](self->_maxLabel, "topAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView contentView](self->_labelContainer, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "topAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v166[17] = v21;
    -[UILabel bottomAnchor](self->_maxLabel, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView contentView](self->_labelContainer, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "bottomAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v166[18] = v25;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v166, 19);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v162, "addObjectsFromArray:", v26);

    v27 = *MEMORY[0x24BEBE068];
    v28 = objc_msgSend(v161, "isEqualToString:", *MEMORY[0x24BEBE068]);
    v29 = (_QWORD *)MEMORY[0x24BEBE060];
    if ((v28 & 1) != 0 || (objc_msgSend(v161, "isEqualToString:", *MEMORY[0x24BEBE060]) & 1) != 0)
      v30 = 1;
    else
      v30 = objc_msgSend(v161, "isEqualToString:", *MEMORY[0x24BEBE058]);
    -[UILabel setHidden:](self->_maxLabel, "setHidden:", v30);
    if ((objc_msgSend(v161, "isEqualToString:", v27) & 1) != 0
      || (objc_msgSend(v161, "isEqualToString:", *v29) & 1) != 0
      || objc_msgSend(v161, "isEqualToString:", *MEMORY[0x24BEBE058]))
    {
      -[UILabel bottomAnchor](self->_subtitleLeftLabel, "bottomAnchor");
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel topAnchor](self->_subtitleRightLabel, "topAnchor");
      v152 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v156, "constraintEqualToAnchor:", v152);
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      v165[0] = v148;
      -[UILabel trailingAnchor](self->_subtitleLeftLabel, "trailingAnchor");
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel trailingAnchor](self->_subtitleRightLabel, "trailingAnchor");
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v159, "constraintEqualToAnchor:", v144);
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      v165[1] = v140;
      -[UILabel bottomAnchor](self->_subtitleRightLabel, "bottomAnchor");
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView bottomAnchor](self->_subtitleContainer, "bottomAnchor");
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v136, "constraintEqualToAnchor:", v132);
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      v165[2] = v128;
      -[UILabel leadingAnchor](self->_subtitleRightLabel, "leadingAnchor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView leadingAnchor](self->_subtitleContainer, "leadingAnchor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "constraintEqualToAnchor:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v165[3] = v33;
      -[UILabel trailingAnchor](self->_subtitleRightLabel, "trailingAnchor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView trailingAnchor](self->_subtitleContainer, "trailingAnchor");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "constraintEqualToAnchor:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v165[4] = v36;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v165, 5);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v162;
      objc_msgSend(v162, "addObjectsFromArray:", v37);

      subtitleRightLabel = self->_subtitleRightLabel;
      v40 = 4;
    }
    else
    {
      -[UILabel bottomAnchor](self->_subtitleLeftLabel, "bottomAnchor");
      v157 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView bottomAnchor](self->_subtitleContainer, "bottomAnchor");
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v157, "constraintEqualToAnchor:", v153);
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      v164[0] = v149;
      -[UILabel trailingAnchor](self->_subtitleLeftLabel, "trailingAnchor");
      v160 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel leadingAnchor](self->_subtitleRightLabel, "leadingAnchor");
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v160, "constraintEqualToAnchor:constant:", v145, -12.0);
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      v164[1] = v141;
      -[UILabel topAnchor](self->_subtitleRightLabel, "topAnchor");
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView topAnchor](self->_subtitleContainer, "topAnchor");
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v137, "constraintEqualToAnchor:", v133);
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      v164[2] = v129;
      -[UILabel bottomAnchor](self->_subtitleRightLabel, "bottomAnchor");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView bottomAnchor](self->_subtitleContainer, "bottomAnchor");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "constraintEqualToAnchor:", v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v164[3] = v43;
      -[UILabel trailingAnchor](self->_subtitleRightLabel, "trailingAnchor");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView trailingAnchor](self->_subtitleContainer, "trailingAnchor");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "constraintEqualToAnchor:", v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v164[4] = v46;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v164, 5);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v162;
      objc_msgSend(v162, "addObjectsFromArray:", v47);

      v48 = self->_subtitleRightLabel;
      if (-[HUIHeadphoneLevelView isRTL](self, "isRTL"))
        v40 = 0;
      else
        v40 = 2;
      subtitleRightLabel = v48;
    }
    -[UILabel setTextAlignment:](subtitleRightLabel, "setTextAlignment:", v40);
    -[HUIHeadphoneLevelView setViewConstraints:](self, "setViewConstraints:", v38);
    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v38);

  }
  v163.receiver = self;
  v163.super_class = (Class)HUIHeadphoneLevelView;
  -[HUIHeadphoneLevelView updateConstraints](&v163, sel_updateConstraints);
}

- (void)updateViewsWithSlowLeq:(double)a3 fastLeq:(double)a4 andThreshold:(unint64_t)a5
{
  id v8[4];
  id location;

  objc_initWeak(&location, self);
  objc_copyWeak(v8, &location);
  v8[1] = *(id *)&a3;
  v8[2] = (id)a5;
  v8[3] = *(id *)&a4;
  AXPerformBlockOnMainThread();
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
}

void __69__HUIHeadphoneLevelView_updateViewsWithSlowLeq_fastLeq_andThreshold___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;

  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dbFormatter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", round(*(double *)(a1 + 40)));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromNumber:", v5);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  v6 = objc_loadWeakRetained(v2);
  objc_msgSend(v6, "subtitleLeftLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_loadWeakRetained(v2);
  objc_msgSend(v8, "formatLevelRating:threshold:", v18, *(_QWORD *)(a1 + 48));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAttributedText:", v9);

  v10 = objc_loadWeakRetained(v2);
  objc_msgSend(v10, "subtitleRightLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_loadWeakRetained(v2);
  objc_msgSend(v12, "subtitleRightLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "font");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "formatLevel:baseFont:", v18, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAttributedText:", v15);

  v16 = objc_loadWeakRetained(v2);
  objc_msgSend(v16, "levelGroup");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "updateWithExposure:withThreshold:", *(_QWORD *)(a1 + 48), *(double *)(a1 + 56));

}

- (id)formatLevelRating:(id)a3 threshold:(unint64_t)a4
{
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;

  colorForThreshold(a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    if (a4 != 100 && a4 != 80)
    {
      v6 = 0;
      v7 = 0;
      goto LABEL_8;
    }
    v6 = CFSTR("exclamationmark.triangle.fill");
  }
  else
  {
    v6 = CFSTR("checkmark.circle.fill");
  }
  hearingLocString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
  attributedStringWithImage(v6, v5, v7, (void *)*MEMORY[0x24BEBE250], 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)formatLevel:(id)a3 baseFont:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = a4;
  v7 = a3;
  hearingLocString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "rangeOfString:options:", v7, 0);
  v12 = v11;

  v13 = *MEMORY[0x24BEBB598];
  v18[0] = *MEMORY[0x24BEBB5A0];
  v18[1] = v13;
  v19[0] = &unk_24DD6B260;
  v19[1] = &unk_24DD6B278;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  attributedStringWithFeatureSettings(v9, v6, v15, v10, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)contentValue
{
  return (id)MEMORY[0x24BDBD1C8];
}

- (BOOL)enabled
{
  return 1;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[UILabel accessibilityLabel](self->_titleLabel, "accessibilityLabel");
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[UILabel accessibilityLabel](self->_subtitleLeftLabel, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel accessibilityLabel](self->_subtitleRightLabel, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUIHeadphoneLevelView;
  return *MEMORY[0x24BEBDF50] | -[HUIHeadphoneLevelView accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (id)_accessibilityUserTestingChildren
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  -[HUIHeadphoneLevelView centerContainer](self, "centerContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)module
{
  return self->module;
}

- (void)setModule:(unint64_t)a3
{
  self->module = a3;
}

- (HACCContentModuleDelegate)delegate
{
  return (HACCContentModuleDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (MTMaterialView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (UIView)centerContainer
{
  return self->_centerContainer;
}

- (void)setCenterContainer:(id)a3
{
  objc_storeStrong((id *)&self->_centerContainer, a3);
}

- (UIVisualEffectView)titleContainer
{
  return self->_titleContainer;
}

- (void)setTitleContainer:(id)a3
{
  objc_storeStrong((id *)&self->_titleContainer, a3);
}

- (UIView)subtitleContainer
{
  return self->_subtitleContainer;
}

- (void)setSubtitleContainer:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleContainer, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)subtitleLeftLabel
{
  return self->_subtitleLeftLabel;
}

- (void)setSubtitleLeftLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLeftLabel, a3);
}

- (UILabel)subtitleRightLabel
{
  return self->_subtitleRightLabel;
}

- (void)setSubtitleRightLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleRightLabel, a3);
}

- (UIVisualEffectView)labelContainer
{
  return self->_labelContainer;
}

- (void)setLabelContainer:(id)a3
{
  objc_storeStrong((id *)&self->_labelContainer, a3);
}

- (UILabel)minLabel
{
  return self->_minLabel;
}

- (void)setMinLabel:(id)a3
{
  objc_storeStrong((id *)&self->_minLabel, a3);
}

- (UILabel)thresholdLabel
{
  return self->_thresholdLabel;
}

- (void)setThresholdLabel:(id)a3
{
  objc_storeStrong((id *)&self->_thresholdLabel, a3);
}

- (UILabel)maxLabel
{
  return self->_maxLabel;
}

- (void)setMaxLabel:(id)a3
{
  objc_storeStrong((id *)&self->_maxLabel, a3);
}

- (HUIHeadphoneLevelGroup)levelGroup
{
  return self->_levelGroup;
}

- (void)setLevelGroup:(id)a3
{
  objc_storeStrong((id *)&self->_levelGroup, a3);
}

- (NSNumberFormatter)dbFormatter
{
  return self->_dbFormatter;
}

- (void)setDbFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_dbFormatter, a3);
}

- (NSArray)viewConstraints
{
  return self->_viewConstraints;
}

- (void)setViewConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_viewConstraints, a3);
}

- (int)layoutViewSize
{
  return self->_layoutViewSize;
}

- (void)setLayoutViewSize:(int)a3
{
  self->_layoutViewSize = a3;
}

- (BOOL)isRTL
{
  return self->_isRTL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewConstraints, 0);
  objc_storeStrong((id *)&self->_dbFormatter, 0);
  objc_storeStrong((id *)&self->_levelGroup, 0);
  objc_storeStrong((id *)&self->_maxLabel, 0);
  objc_storeStrong((id *)&self->_thresholdLabel, 0);
  objc_storeStrong((id *)&self->_minLabel, 0);
  objc_storeStrong((id *)&self->_labelContainer, 0);
  objc_storeStrong((id *)&self->_subtitleRightLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLeftLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_subtitleContainer, 0);
  objc_storeStrong((id *)&self->_titleContainer, 0);
  objc_storeStrong((id *)&self->_centerContainer, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_destroyWeak((id *)&self->delegate);
}

@end

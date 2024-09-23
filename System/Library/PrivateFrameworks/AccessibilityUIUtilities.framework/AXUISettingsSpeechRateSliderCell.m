@implementation AXUISettingsSpeechRateSliderCell

- (BOOL)_accessibilityIgnoreInternalLabels
{
  return 1;
}

- (Class)sliderCellClass
{
  return (Class)objc_opt_class();
}

- (AXUISettingsSpeechRateSliderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  AXUISettingsSpeechRateSliderCell *v7;
  AXUISettingsSpeechRateSliderCell *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  UIButton *slowButton;
  double v27;
  void *v28;
  uint64_t v29;
  UIButton *fastButton;
  void *v31;
  void *v32;
  double v33;
  void *v34;
  UILabel *v35;
  UILabel *valueLabel;
  void *v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  double v47;
  void *v48;
  double v49;
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
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  double (**v94)(void);
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
  id v152;
  void *v153;
  id v154;
  void *v155;
  _QWORD v156[4];
  id v157;
  _QWORD v158[4];
  id v159;
  _QWORD v160[4];
  id v161;
  _QWORD v162[4];
  id v163;
  id location;
  objc_super v165;
  _QWORD v166[7];
  _QWORD v167[7];
  _QWORD v168[7];
  _QWORD v169[3];
  _QWORD v170[3];

  v170[1] = *MEMORY[0x1E0C80C00];
  v165.receiver = self;
  v165.super_class = (Class)AXUISettingsSpeechRateSliderCell;
  v152 = a4;
  v154 = a5;
  v7 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v165, sel_initWithStyle_reuseIdentifier_specifier_, a3, v152);
  v8 = v7;
  if (v7)
  {
    v9 = objc_alloc(-[AXUISettingsSpeechRateSliderCell sliderCellClass](v7, "sliderCellClass"));
    v155 = (void *)objc_msgSend(v9, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v155, "setPostTickColor:", v10);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemLightGrayColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v155, "setTrackFillColor:", v11);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v155, "setMinimumTrackTintColor:", v12);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v155, "setMaximumTrackTintColor:", v13);

    objc_msgSend(v155, "setTickHeight:", 16.0);
    -[AXUISettingsSpeechRateSliderCell setSliderView:](v8, "setSliderView:", v155);
    objc_msgSend(v155, "setContinuous:", 1);
    objc_msgSend(v154, "propertyForKey:", *MEMORY[0x1E0D807F0]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUISettingsSpeechRateSliderCell setDefaultValue:](v8, "setDefaultValue:", v14);

    -[AXUISettingsSpeechRateSliderCell defaultValue](v8, "defaultValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v170[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v170, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v155, "setTicks:", v16);

    objc_msgSend(v155, "addTarget:action:forControlEvents:", v8, sel_handleSliderBeingDragged_, 4096);
    objc_msgSend(v155, "addTarget:action:forControlEvents:", v8, sel_handleSliderDidFinishDrag_, 192);
    objc_msgSend(v155, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v17) = 1148846080;
    objc_msgSend(v155, "setContentCompressionResistancePriority:forAxis:", 1, v17);
    -[AXUISettingsSpeechRateSliderCell contentView](v8, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addSubview:", v155);

    objc_initWeak(&location, v8);
    v19 = (void *)MEMORY[0x1E0DC3428];
    v20 = MEMORY[0x1E0C809B0];
    v162[0] = MEMORY[0x1E0C809B0];
    v162[1] = 3221225472;
    v162[2] = __76__AXUISettingsSpeechRateSliderCell_initWithStyle_reuseIdentifier_specifier___block_invoke;
    v162[3] = &unk_1E76AB8B8;
    objc_copyWeak(&v163, &location);
    objc_msgSend(v19, "actionWithTitle:image:identifier:handler:", &stru_1E76AC698, 0, 0, v162);
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x1E0DC3428];
    v160[0] = v20;
    v160[1] = 3221225472;
    v160[2] = __76__AXUISettingsSpeechRateSliderCell_initWithStyle_reuseIdentifier_specifier___block_invoke_2;
    v160[3] = &unk_1E76AB8B8;
    objc_copyWeak(&v161, &location);
    objc_msgSend(v21, "actionWithTitle:image:identifier:handler:", &stru_1E76AC698, 0, 0, v160);
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v153, "setPreferredSymbolConfigurationForImage:", v22);

    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("tortoise.fill"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "imageWithTintColor:renderingMode:", v24, 1);
    v141 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v153, v143);
    v25 = objc_claimAutoreleasedReturnValue();
    slowButton = v8->_slowButton;
    v8->_slowButton = (UIButton *)v25;

    -[UIButton _setWantsAccessibilityUnderline:](v8->_slowButton, "_setWantsAccessibilityUnderline:", 0);
    LODWORD(v27) = 1144750080;
    -[UIButton setContentHuggingPriority:forAxis:](v8->_slowButton, "setContentHuggingPriority:forAxis:", 0, v27);
    -[UIButton setImage:forState:](v8->_slowButton, "setImage:forState:", v141, 0);
    -[AXUISettingsSpeechRateSliderCell contentView](v8, "contentView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addSubview:", v8->_slowButton);

    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v153, v142);
    v29 = objc_claimAutoreleasedReturnValue();
    fastButton = v8->_fastButton;
    v8->_fastButton = (UIButton *)v29;

    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("hare.fill"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "imageWithTintColor:renderingMode:", v32, 1);
    v140 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIButton setImage:forState:](v8->_fastButton, "setImage:forState:", v140, 0);
    -[UIButton _setWantsAccessibilityUnderline:](v8->_fastButton, "_setWantsAccessibilityUnderline:", 0);
    LODWORD(v33) = 1144750080;
    -[UIButton setContentHuggingPriority:forAxis:](v8->_fastButton, "setContentHuggingPriority:forAxis:", 0, v33);
    -[UIButton setContentHorizontalAlignment:](v8->_fastButton, "setContentHorizontalAlignment:", 3);
    -[UIButton setContentVerticalAlignment:](v8->_fastButton, "setContentVerticalAlignment:", 3);
    -[AXUISettingsSpeechRateSliderCell contentView](v8, "contentView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addSubview:", v8->_fastButton);

    v35 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    valueLabel = v8->_valueLabel;
    v8->_valueLabel = v35;

    -[UILabel setAdjustsFontForContentSizeCategory:](v8->_valueLabel, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v8->_valueLabel, "setFont:", v37);

    LODWORD(v38) = 1144750080;
    -[UILabel setContentHuggingPriority:forAxis:](v8->_valueLabel, "setContentHuggingPriority:forAxis:", 0, v38);
    -[AXUISettingsSpeechRateSliderCell labelColor](v8, "labelColor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v8->_valueLabel, "setTextColor:", v39);

    -[AXUISettingsSpeechRateSliderCell contentView](v8, "contentView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addSubview:", v8->_valueLabel);

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v8->_fastButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v8->_slowButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v8->_valueLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v158[0] = v20;
    v158[1] = 3221225472;
    v158[2] = __76__AXUISettingsSpeechRateSliderCell_initWithStyle_reuseIdentifier_specifier___block_invoke_3;
    v158[3] = &unk_1E76AB680;
    objc_copyWeak(&v159, &location);
    v43 = (id)objc_msgSend(v41, "addObserverForName:object:queue:usingBlock:", *MEMORY[0x1E0DC44E0], 0, v42, v158);

    -[AXUISettingsSpeechRateSliderCell _updateButtonShapes](v8, "_updateButtonShapes");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v156[0] = v20;
    v156[1] = 3221225472;
    v156[2] = __76__AXUISettingsSpeechRateSliderCell_initWithStyle_reuseIdentifier_specifier___block_invoke_4;
    v156[3] = &unk_1E76AB680;
    objc_copyWeak(&v157, &location);
    v46 = (id)objc_msgSend(v44, "addObserverForName:object:queue:usingBlock:", *MEMORY[0x1E0DC48E8], 0, v45, v156);

    objc_msgSend(v154, "propertyForKey:", CFSTR("SpeechRateProperty"));
    v94 = (double (**)(void))objc_claimAutoreleasedReturnValue();
    v47 = v94[2]();
    -[AXUISettingsSpeechRateSliderCell sliderView](v8, "sliderView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v49 = v47;
    objc_msgSend(v48, "setValue:", v49);

    -[AXUISettingsSpeechRateSliderCell _updateAccessibilityValueBlock](v8, "_updateAccessibilityValueBlock");
    -[UILabel topAnchor](v8->_valueLabel, "topAnchor");
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v155, "bottomAnchor");
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v148, "constraintEqualToAnchor:constant:", v144, 5.0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v169[0] = v50;
    -[UILabel bottomAnchor](v8->_valueLabel, "bottomAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUISettingsSpeechRateSliderCell contentView](v8, "contentView");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "bottomAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintEqualToAnchor:constant:", v53, -5.0);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v169[1] = v54;
    -[UILabel centerXAnchor](v8->_valueLabel, "centerXAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUISettingsSpeechRateSliderCell contentView](v8, "contentView");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "centerXAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "constraintEqualToAnchor:constant:", v57, 0.0);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v169[2] = v58;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v169, 3);
    v87 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v155, "leadingAnchor");
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton trailingAnchor](v8->_slowButton, "trailingAnchor");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v149, "constraintEqualToAnchor:constant:", v145, 10.0);
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    v168[0] = v137;
    objc_msgSend(v155, "trailingAnchor");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton leadingAnchor](v8->_fastButton, "leadingAnchor");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v134, "constraintEqualToAnchor:constant:", v131, -10.0);
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    v168[1] = v128;
    objc_msgSend(v155, "centerYAnchor");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton centerYAnchor](v8->_fastButton, "centerYAnchor");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "constraintEqualToAnchor:constant:", v122, 0.0);
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    v168[2] = v119;
    -[UIButton topAnchor](v8->_slowButton, "topAnchor");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUISettingsSpeechRateSliderCell contentView](v8, "contentView");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "topAnchor");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "constraintEqualToAnchor:constant:", v110, 5.0);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v168[3] = v107;
    -[UIButton topAnchor](v8->_fastButton, "topAnchor");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUISettingsSpeechRateSliderCell contentView](v8, "contentView");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "topAnchor");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "constraintEqualToAnchor:constant:", v98, 5.0);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v168[4] = v95;
    -[UIButton leadingAnchor](v8->_slowButton, "leadingAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUISettingsSpeechRateSliderCell contentView](v8, "contentView");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "leadingAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "constraintEqualToAnchor:constant:", v61, 0.0);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v168[5] = v62;
    -[UIButton trailingAnchor](v8->_fastButton, "trailingAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUISettingsSpeechRateSliderCell contentView](v8, "contentView");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "trailingAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "constraintEqualToAnchor:constant:", v65, 0.0);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v168[6] = v66;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v168, 7);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUISettingsSpeechRateSliderCell setButtonConstraints:](v8, "setButtonConstraints:", v67);

    objc_msgSend(v155, "leadingAnchor");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUISettingsSpeechRateSliderCell contentView](v8, "contentView");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v150, "leadingAnchor");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v146, "constraintEqualToAnchor:constant:", v138, 15.0);
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    v167[0] = v135;
    objc_msgSend(v155, "trailingAnchor");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUISettingsSpeechRateSliderCell contentView](v8, "contentView");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "trailingAnchor");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v129, "constraintEqualToAnchor:constant:", v126, -15.0);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    v167[1] = v123;
    objc_msgSend(v155, "topAnchor");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUISettingsSpeechRateSliderCell contentView](v8, "contentView");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "topAnchor");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "constraintEqualToAnchor:constant:", v114, 5.0);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v167[2] = v111;
    -[UIButton bottomAnchor](v8->_slowButton, "bottomAnchor");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUISettingsSpeechRateSliderCell contentView](v8, "contentView");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "bottomAnchor");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "constraintEqualToAnchor:constant:", v102, -5.0);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v167[3] = v99;
    -[UIButton bottomAnchor](v8->_fastButton, "bottomAnchor");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUISettingsSpeechRateSliderCell contentView](v8, "contentView");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "bottomAnchor");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "constraintEqualToAnchor:constant:", v90, -5.0);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v167[4] = v88;
    -[UIButton leadingAnchor](v8->_slowButton, "leadingAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUISettingsSpeechRateSliderCell contentView](v8, "contentView");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "leadingAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "constraintEqualToAnchor:constant:", v70, 0.0);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v167[5] = v71;
    -[UIButton trailingAnchor](v8->_fastButton, "trailingAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUISettingsSpeechRateSliderCell contentView](v8, "contentView");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "trailingAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "constraintEqualToAnchor:constant:", v74, 0.0);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v167[6] = v75;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v167, 7);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUISettingsSpeechRateSliderCell setLargeTextButtonConstraints:](v8, "setLargeTextButtonConstraints:", v76);

    objc_msgSend(v155, "leadingAnchor");
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUISettingsSpeechRateSliderCell contentView](v8, "contentView");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v151, "leadingAnchor");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v147, "constraintEqualToAnchor:constant:", v139, 15.0);
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    v166[0] = v136;
    objc_msgSend(v155, "trailingAnchor");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUISettingsSpeechRateSliderCell contentView](v8, "contentView");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v133, "trailingAnchor");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v130, "constraintEqualToAnchor:constant:", v127, -15.0);
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    v166[1] = v124;
    objc_msgSend(v155, "topAnchor");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUISettingsSpeechRateSliderCell contentView](v8, "contentView");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "topAnchor");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "constraintEqualToAnchor:constant:", v115, 5.0);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    v166[2] = v112;
    -[UIButton bottomAnchor](v8->_slowButton, "bottomAnchor");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUISettingsSpeechRateSliderCell contentView](v8, "contentView");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "bottomAnchor");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "constraintEqualToAnchor:constant:", v103, -5.0);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v166[3] = v100;
    -[UIButton bottomAnchor](v8->_fastButton, "bottomAnchor");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUISettingsSpeechRateSliderCell contentView](v8, "contentView");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "bottomAnchor");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "constraintEqualToAnchor:constant:", v91, -5.0);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v166[4] = v89;
    -[UIButton leadingAnchor](v8->_slowButton, "leadingAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUISettingsSpeechRateSliderCell contentView](v8, "contentView");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "leadingAnchor");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "constraintEqualToAnchor:constant:", v79, -20.0);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v166[5] = v80;
    -[UIButton trailingAnchor](v8->_fastButton, "trailingAnchor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUISettingsSpeechRateSliderCell contentView](v8, "contentView");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "trailingAnchor");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "constraintEqualToAnchor:constant:", v83, 20.0);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v166[6] = v84;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v166, 7);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUISettingsSpeechRateSliderCell setExtraLargeTextButtonConstraints:](v8, "setExtraLargeTextButtonConstraints:", v85);

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v87);
    -[AXUISettingsSpeechRateSliderCell _updateTextSizeLayout](v8, "_updateTextSizeLayout");
    -[AXUISettingsSpeechRateSliderCell setNeedsLayout](v8, "setNeedsLayout");
    -[AXUISettingsSpeechRateSliderCell layoutIfNeeded](v8, "layoutIfNeeded");

    objc_destroyWeak(&v157);
    objc_destroyWeak(&v159);

    objc_destroyWeak(&v161);
    objc_destroyWeak(&v163);
    objc_destroyWeak(&location);

  }
  return v8;
}

void __76__AXUISettingsSpeechRateSliderCell_initWithStyle_reuseIdentifier_specifier___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_changeSpeechRateFromButton:", 0);

}

void __76__AXUISettingsSpeechRateSliderCell_initWithStyle_reuseIdentifier_specifier___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_changeSpeechRateFromButton:", 1);

}

void __76__AXUISettingsSpeechRateSliderCell_initWithStyle_reuseIdentifier_specifier___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateButtonShapes");

}

void __76__AXUISettingsSpeechRateSliderCell_initWithStyle_reuseIdentifier_specifier___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateTextSizeLayout");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AXUISettingsSpeechRateSliderCell;
  -[AXUISettingsSpeechRateSliderCell _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[AXUISettingsSpeechRateSliderCell _updateAccessibilityValueBlock](self, "_updateAccessibilityValueBlock");
}

- (void)_updateTextSizeLayout
{
  void *v3;
  NSString *v4;
  _BOOL4 IsAccessibilityCategory;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  -[AXUISettingsSpeechRateSliderCell traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  if (IsAccessibilityCategory)
  {
    -[AXUISettingsSpeechRateSliderCell traitCollection](self, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "preferredContentSizeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0DC48B8]);

    v9 = (void *)MEMORY[0x1E0CB3718];
    if (v8)
    {
      -[AXUISettingsSpeechRateSliderCell largeTextButtonConstraints](self, "largeTextButtonConstraints");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "deactivateConstraints:", v10);

      v11 = (void *)MEMORY[0x1E0CB3718];
      -[AXUISettingsSpeechRateSliderCell buttonConstraints](self, "buttonConstraints");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "deactivateConstraints:", v12);

      v13 = (void *)MEMORY[0x1E0CB3718];
      -[AXUISettingsSpeechRateSliderCell extraLargeTextButtonConstraints](self, "extraLargeTextButtonConstraints");
    }
    else
    {
      -[AXUISettingsSpeechRateSliderCell buttonConstraints](self, "buttonConstraints");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "deactivateConstraints:", v19);

      v20 = (void *)MEMORY[0x1E0CB3718];
      -[AXUISettingsSpeechRateSliderCell extraLargeTextButtonConstraints](self, "extraLargeTextButtonConstraints");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "deactivateConstraints:", v21);

      v13 = (void *)MEMORY[0x1E0CB3718];
      -[AXUISettingsSpeechRateSliderCell largeTextButtonConstraints](self, "largeTextButtonConstraints");
    }
    v14 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = (void *)MEMORY[0x1E0CB3718];
    -[AXUISettingsSpeechRateSliderCell extraLargeTextButtonConstraints](self, "extraLargeTextButtonConstraints");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "deactivateConstraints:", v16);

    v17 = (void *)MEMORY[0x1E0CB3718];
    -[AXUISettingsSpeechRateSliderCell largeTextButtonConstraints](self, "largeTextButtonConstraints");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "deactivateConstraints:", v18);

    v13 = (void *)MEMORY[0x1E0CB3718];
    -[AXUISettingsSpeechRateSliderCell buttonConstraints](self, "buttonConstraints");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v22 = (id)v14;
  objc_msgSend(v13, "activateConstraints:");

}

- (void)_updateAccessibilityValueBlock
{
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;
  id location;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_initWeak(&location, self);
    v3 = MEMORY[0x1E0C809B0];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __66__AXUISettingsSpeechRateSliderCell__updateAccessibilityValueBlock__block_invoke;
    v7[3] = &unk_1E76AB8E0;
    objc_copyWeak(&v8, &location);
    -[AXUISettingsSpeechRateSliderCell _setAccessibilityValueBlock:](self, "_setAccessibilityValueBlock:", v7);
    -[AXUISettingsSpeechRateSliderCell sliderView](self, "sliderView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = v3;
    v5[1] = 3221225472;
    v5[2] = __66__AXUISettingsSpeechRateSliderCell__updateAccessibilityValueBlock__block_invoke_2;
    v5[3] = &unk_1E76AB8E0;
    objc_copyWeak(&v6, &location);
    objc_msgSend(v4, "_setAccessibilityValueBlock:", v5);

    objc_destroyWeak(&v6);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

id __66__AXUISettingsSpeechRateSliderCell__updateAccessibilityValueBlock__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  void *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[155], "text");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id __66__AXUISettingsSpeechRateSliderCell__updateAccessibilityValueBlock__block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  void *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[155], "text");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)_updateButtonShapes
{
  UIButton *slowButton;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v27;
  id obj;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[4];
  _QWORD v40[2];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  slowButton = self->_slowButton;
  v40[0] = self->_fastButton;
  v40[1] = slowButton;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 2);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v36;
    v6 = *MEMORY[0x1E0C9D648];
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v25 = *(_QWORD *)v36;
    do
    {
      v10 = 0;
      v27 = v4;
      do
      {
        if (*(_QWORD *)v36 != v5)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v10);
        if (UIAccessibilityButtonShapesEnabled())
        {
          v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v6, v7, v8, v9);
          objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
          objc_msgSend(v12, "layer");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setCornerRadius:", 8.0);

          -[AXUISettingsSpeechRateSliderCell traitCollection](self, "traitCollection");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "userInterfaceStyle");

          if (v15 == 2)
            objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemBackgroundColor");
          else
            objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setBackgroundColor:", v17, v25);

          objc_msgSend(v12, "setTag:", 123456);
          objc_msgSend(v12, "setUserInteractionEnabled:", 0);
          objc_msgSend(v11, "addSubview:", v12);
          v30 = (void *)MEMORY[0x1E0CB3718];
          objc_msgSend(v12, "centerXAnchor");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "centerXAnchor");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "constraintEqualToAnchor:", v34);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v39[0] = v33;
          objc_msgSend(v12, "centerYAnchor");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "centerYAnchor");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "constraintEqualToAnchor:", v31);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v39[1] = v29;
          objc_msgSend(v12, "widthAnchor");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "widthAnchor");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "constraintEqualToAnchor:multiplier:", v19, 0.8);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v39[2] = v20;
          objc_msgSend(v12, "heightAnchor");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "heightAnchor");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "constraintEqualToAnchor:multiplier:", v22, 0.8);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v39[3] = v23;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 4);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "activateConstraints:", v24);

          v5 = v25;
          v4 = v27;
        }
        else
        {
          objc_msgSend(v11, "subviews");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (void *)objc_msgSend(v12, "copy");
          objc_msgSend(v16, "enumerateObjectsUsingBlock:", &__block_literal_global_4);
        }

        ++v10;
      }
      while (v4 != v10);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    }
    while (v4);
  }

}

void __55__AXUISettingsSpeechRateSliderCell__updateButtonShapes__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (objc_msgSend(v2, "tag") == 123456)
    objc_msgSend(v2, "removeFromSuperview");

}

- (void)applyHapticIfNecessary:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  UIImpactFeedbackGenerator *hapticGenerator;
  UIImpactFeedbackGenerator *v12;
  UIImpactFeedbackGenerator *v13;
  double (**v14)(double, double);

  v4 = a3;
  -[PSTableCell specifier](self, "specifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "propertyForKey:", CFSTR("SpeechShouldPlayHapticDistance"));
  v14 = (double (**)(double, double))objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "doubleValue");
  v7 = v6;

  -[AXUISettingsSpeechRateSliderCell defaultValue](self, "defaultValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v14[2](v7, v9);

  if (v10 >= 0.01 || self->_hapticPlayedValue)
  {
    if (v10 > 0.02)
      self->_hapticPlayedValue = 0;
  }
  else
  {
    hapticGenerator = self->_hapticGenerator;
    if (!hapticGenerator)
    {
      v12 = (UIImpactFeedbackGenerator *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3898]), "initWithStyle:", 1);
      v13 = self->_hapticGenerator;
      self->_hapticGenerator = v12;

      hapticGenerator = self->_hapticGenerator;
    }
    -[UIImpactFeedbackGenerator impactOccurred](hapticGenerator, "impactOccurred");
    self->_hapticPlayedValue = 1;
  }

}

- (void)_changeValueBySpeechRateIncrementWithSnapToDefault:(double)a3 snapThreshold:(double)a4
{
  void *v7;
  void *v8;
  float v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  double (**v18)(_QWORD, double);
  float v19;
  void *v20;
  double v21;
  double (**v22)(double);

  -[PSTableCell specifier](self, "specifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "propertyForKey:", CFSTR("SpeechRateFormatterProperty"));
  v22 = (double (**)(double))objc_claimAutoreleasedReturnValue();

  -[AXUISettingsSpeechRateSliderCell sliderView](self, "sliderView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "value");
  v10 = v22[2](v9) / 100.0;

  v11 = v22[2](1.0) / 100.0;
  v12 = fmax(v10 + a3, 0.0);
  if (v11 >= v12)
    v13 = v12;
  else
    v13 = v11;
  -[AXUISettingsSpeechRateSliderCell defaultValue](self, "defaultValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "doubleValue");
  v15 = vabdd_f64(v13, ((double (*)(void))v22[2])() / 100.0);

  if (v15 < a4)
  {
    -[AXUISettingsSpeechRateSliderCell defaultValue](self, "defaultValue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "doubleValue");
    v13 = ((double (*)(void))v22[2])() / 100.0;

  }
  -[PSTableCell specifier](self, "specifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "propertyForKey:", CFSTR("SpeechRateForSliderValueProperty"));
  v18 = (double (**)(_QWORD, double))objc_claimAutoreleasedReturnValue();

  v19 = v18[2](v18, v13);
  -[AXUISettingsSpeechRateSliderCell sliderView](self, "sliderView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v21 = v19;
  objc_msgSend(v20, "setValue:", v21);

}

- (void)handleSliderBeingDragged:(id)a3
{
  id v4;
  void *v5;
  int v6;
  int v7;
  double v8;
  void *v9;

  v4 = a3;
  -[AXUISettingsSpeechRateSliderCell _changeValueBySpeechRateIncrementWithSnapToDefault:snapThreshold:](self, "_changeValueBySpeechRateIncrementWithSnapToDefault:snapThreshold:", 0.0, 0.03);
  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "value");
  v7 = v6;

  LODWORD(v8) = v7;
  objc_msgSend(v5, "numberWithFloat:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUISettingsSpeechRateSliderCell applyHapticIfNecessary:](self, "applyHapticIfNecessary:", v9);

  -[AXUISettingsSpeechRateSliderCell updateValue](self, "updateValue");
}

- (CGPoint)accessibilityActivationPoint
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  -[AXUISettingsSpeechRateSliderCell sliderView](self, "sliderView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityActivationPoint");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (void)handleSliderDidFinishDrag:(id)a3
{
  -[AXUISettingsSpeechRateSliderCell updateValue](self, "updateValue", a3);
  -[AXUISettingsSpeechRateSliderCell userSelectedValue](self, "userSelectedValue");
}

- (void)_changeSpeechRateFromButton:(BOOL)a3
{
  double v4;

  v4 = -0.1;
  if (a3)
    v4 = 0.1;
  -[AXUISettingsSpeechRateSliderCell _changeValueBySpeechRateIncrementWithSnapToDefault:snapThreshold:](self, "_changeValueBySpeechRateIncrementWithSnapToDefault:snapThreshold:", v4, 0.05);
  -[AXUISettingsSpeechRateSliderCell updateValue](self, "updateValue");
  -[AXUISettingsSpeechRateSliderCell userSelectedValue](self, "userSelectedValue");
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AXUISettingsSpeechRateSliderCell;
  -[PSTableCell layoutSubviews](&v3, sel_layoutSubviews);
  -[AXUISettingsSpeechRateSliderCell updateValue](self, "updateValue");
}

- (double)displayValue
{
  void *v3;
  double (**v4)(_QWORD, double);
  void *v5;
  float v6;
  double v7;

  -[PSTableCell specifier](self, "specifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "propertyForKey:", CFSTR("SpeechRateFormatterProperty"));
  v4 = (double (**)(_QWORD, double))objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AXUISettingsSpeechRateSliderCell sliderView](self, "sliderView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "value");
    v7 = v4[2](v4, v6);

  }
  else
  {
    v7 = 0.0;
  }

  return v7;
}

- (void)updateValue
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  float v8;
  float v9;
  void *v10;
  float v11;
  float v12;
  void *v13;
  float v14;
  float v15;
  void *v16;
  float v17;
  float v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  float v25;
  uint64_t v26;
  void (**v27)(double);

  AXUILocalizedStringForKey(CFSTR("SPEECH_RATE_PERCENTAGE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUISettingsSpeechRateSliderCell displayValue](self, "displayValue");
  v26 = v4;
  AXCFormattedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_valueLabel, "setText:", v5, v26);

  -[AXUISettingsSpeechRateSliderCell sliderView](self, "sliderView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNeedsDisplay");

  -[AXUISettingsSpeechRateSliderCell sliderView](self, "sliderView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "value");
  v9 = v8;
  -[AXUISettingsSpeechRateSliderCell sliderView](self, "sliderView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "minimumValue");
  v12 = v11;

  if (v9 <= v12)
  {
    v19 = 1209;
    if (self->_playedSlowBounce)
      goto LABEL_9;
    v20 = 1232;
    goto LABEL_8;
  }
  -[AXUISettingsSpeechRateSliderCell sliderView](self, "sliderView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "value");
  v15 = v14;
  -[AXUISettingsSpeechRateSliderCell sliderView](self, "sliderView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "maximumValue");
  v18 = v17;

  v19 = 1210;
  if (v15 < v18)
  {
    self->_playedFastBounce = 0;
    self->_playedSlowBounce = 0;
    goto LABEL_9;
  }
  if (!self->_playedFastBounce)
  {
    v20 = 1224;
LABEL_8:
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v20), "imageView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CE86C8], "effect");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addSymbolEffect:", v22);

    *((_BYTE *)&self->super.super.super.super.super.isa + v19) = 1;
  }
LABEL_9:
  -[PSTableCell specifier](self, "specifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "propertyForKey:", CFSTR("SpeechRateChangedProperty"));
  v27 = (void (**)(double))objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    -[AXUISettingsSpeechRateSliderCell sliderView](self, "sliderView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "value");
    v27[2](v25);

  }
}

- (void)userSelectedValue
{
  void *v2;
  void *v3;
  id v4;

  -[PSTableCell specifier](self, "specifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "propertyForKey:", CFSTR("SpeechRateSelectedProperty"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v3 = v4;
  if (v4)
  {
    (*((void (**)(id))v4 + 2))(v4);
    v3 = v4;
  }

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x1E0DC4650];
}

- (void)accessibilityIncrement
{
  -[AXUISettingsSpeechRateSliderCell _changeSpeechRateFromButton:](self, "_changeSpeechRateFromButton:", 1);
}

- (void)accessibilityDecrement
{
  -[AXUISettingsSpeechRateSliderCell _changeSpeechRateFromButton:](self, "_changeSpeechRateFromButton:", 0);
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[PSTableCell specifier](self, "specifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)labelColor
{
  void *v2;
  int v3;

  objc_msgSend(MEMORY[0x1E0D804B8], "appearance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "usesDarkTheme");

  if (v3)
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)newControl
{
  AXUISettingsTickMarkSlider *v2;
  AXUISettingsTickMarkSlider *v3;

  v2 = [AXUISettingsTickMarkSlider alloc];
  v3 = -[AXUISettingsTickMarkSlider initWithFrame:](v2, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[AXUISettingsTickMarkSlider setTicks:](v3, "setTicks:", &unk_1E76C23D0);
  return v3;
}

- (UISlider)sliderView
{
  return self->_sliderView;
}

- (void)setSliderView:(id)a3
{
  objc_storeStrong((id *)&self->_sliderView, a3);
}

- (UIButton)fastButton
{
  return self->_fastButton;
}

- (void)setFastButton:(id)a3
{
  objc_storeStrong((id *)&self->_fastButton, a3);
}

- (UIButton)slowButton
{
  return self->_slowButton;
}

- (void)setSlowButton:(id)a3
{
  objc_storeStrong((id *)&self->_slowButton, a3);
}

- (UILabel)valueLabel
{
  return self->_valueLabel;
}

- (void)setValueLabel:(id)a3
{
  objc_storeStrong((id *)&self->_valueLabel, a3);
}

- (NSNumber)defaultValue
{
  return self->_defaultValue;
}

- (void)setDefaultValue:(id)a3
{
  objc_storeStrong((id *)&self->_defaultValue, a3);
}

- (NSArray)buttonConstraints
{
  return self->_buttonConstraints;
}

- (void)setButtonConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_buttonConstraints, a3);
}

- (NSArray)largeTextButtonConstraints
{
  return self->_largeTextButtonConstraints;
}

- (void)setLargeTextButtonConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_largeTextButtonConstraints, a3);
}

- (NSArray)extraLargeTextButtonConstraints
{
  return self->_extraLargeTextButtonConstraints;
}

- (void)setExtraLargeTextButtonConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_extraLargeTextButtonConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extraLargeTextButtonConstraints, 0);
  objc_storeStrong((id *)&self->_largeTextButtonConstraints, 0);
  objc_storeStrong((id *)&self->_buttonConstraints, 0);
  objc_storeStrong((id *)&self->_defaultValue, 0);
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_slowButton, 0);
  objc_storeStrong((id *)&self->_fastButton, 0);
  objc_storeStrong((id *)&self->_sliderView, 0);
  objc_storeStrong((id *)&self->_hapticGenerator, 0);
}

@end

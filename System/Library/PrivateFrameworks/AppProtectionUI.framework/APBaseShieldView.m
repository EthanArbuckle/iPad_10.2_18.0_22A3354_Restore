@implementation APBaseShieldView

- (APBaseShieldView)initWithApplication:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  APApplication *shieldedApplication;
  id v13;
  APBaseShieldView *v14;
  id v16;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x24BDC1540]);
  objc_msgSend(v4, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v7 = (void *)objc_msgSend(v5, "initWithBundleIdentifier:allowPlaceholder:error:", v6, 1, &v16);
  v8 = v16;

  if (v7)
  {
    objc_msgSend(v7, "localizedName");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    APUIDefaultFrameworkLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[APBaseShieldView initWithApplication:].cold.1(v4);

    objc_msgSend(v4, "bundleIdentifier");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v9;
  shieldedApplication = self->_shieldedApplication;
  self->_shieldedApplication = (APApplication *)v4;
  v13 = v4;

  v14 = -[APBaseShieldView initWithLocalizedApplicationName:useHiddenStyle:needEmergencyCallButton:](self, "initWithLocalizedApplicationName:useHiddenStyle:needEmergencyCallButton:", v11, objc_msgSend(v13, "isHidden"), applicationRequiresEmergencyCallButton(v13));
  return v14;
}

- (APBaseShieldView)initWithConfig:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  APApplication *v18;
  APApplication *shieldedApplication;
  APBaseShieldView *v20;
  uint64_t v21;
  APSystemAppOutlet *outlet;
  void *v23;
  id v25;

  v4 = a3;
  objc_msgSend(v4, "localizedName");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    v7 = 0;
  }
  else
  {
    v8 = objc_alloc(MEMORY[0x24BDC1540]);
    objc_msgSend(v4, "application");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    v11 = (void *)objc_msgSend(v8, "initWithBundleIdentifier:allowPlaceholder:error:", v10, 1, &v25);
    v7 = v25;

    if (v11)
    {
      objc_msgSend(v11, "localizedName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      APUIDefaultFrameworkLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[APBaseShieldView initWithConfig:].cold.1(v4);

      objc_msgSend(v4, "application");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "bundleIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  objc_msgSend(v4, "application");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isHidden");

  objc_msgSend(v4, "application");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = applicationRequiresEmergencyCallButton(v16);

  objc_msgSend(v4, "application");
  v18 = (APApplication *)objc_claimAutoreleasedReturnValue();
  shieldedApplication = self->_shieldedApplication;
  self->_shieldedApplication = v18;

  v20 = -[APBaseShieldView initWithLocalizedApplicationName:useHiddenStyle:needEmergencyCallButton:](self, "initWithLocalizedApplicationName:useHiddenStyle:needEmergencyCallButton:", v6, v15, v17);
  if (v20)
  {
    objc_msgSend(v4, "outlet");
    v21 = objc_claimAutoreleasedReturnValue();
    outlet = v20->_outlet;
    v20->_outlet = (APSystemAppOutlet *)v21;

    -[APSystemAppOutlet addShield:](v20->_outlet, "addShield:", v20);
    objc_msgSend(v4, "delegate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v20->_delegate, v23);

  }
  return v20;
}

- (APBaseShieldView)initWithLocalizedApplicationName:(id)a3
{
  return -[APBaseShieldView initWithLocalizedApplicationName:useHiddenStyle:needEmergencyCallButton:](self, "initWithLocalizedApplicationName:useHiddenStyle:needEmergencyCallButton:", a3, 0, 0);
}

- (APBaseShieldView)initWithLocalizedApplicationName:(id)a3 hidden:(BOOL)a4
{
  return -[APBaseShieldView initWithLocalizedApplicationName:useHiddenStyle:needEmergencyCallButton:](self, "initWithLocalizedApplicationName:useHiddenStyle:needEmergencyCallButton:", a3, a4, 0);
}

- (APBaseShieldView)initWithLocalizedApplicationName:(id)a3 useHiddenStyle:(BOOL)a4 needEmergencyCallButton:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  id v8;
  APBaseShieldView *v9;
  APBaseShieldView *v10;
  id v11;
  void *v12;
  uint64_t v13;
  UIVisualEffectView *visualEffectView;
  UILabel *v15;
  UILabel *label;
  UILabel *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  __CFString *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  UILabel *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  UIAccessibilityElement *labelsElement;
  UIAccessibilityElement *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  void *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  uint64_t v87;
  UIButton *unlockButton;
  uint64_t v89;
  UIButton *emergencyCallButton;
  UIButton *v91;
  void *v92;
  void *v93;
  UIButton *v94;
  void *v95;
  id v96;
  double v97;
  double v98;
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
  _BOOL4 v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  id v166;
  _BOOL4 v167;
  _QWORD v168[16];
  uint64_t v169;
  _QWORD v170[3];

  v5 = a5;
  v6 = a4;
  v170[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = -[APBaseShieldView init](self, "init");
  v10 = v9;
  if (v9)
  {
    v157 = v5;
    v9->_shieldStyle = 0;
    v11 = objc_alloc(MEMORY[0x24BEBDB38]);
    objc_msgSend(MEMORY[0x24BEBD428], "effectWithStyle:", 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "initWithEffect:", v12);
    visualEffectView = v10->_visualEffectView;
    v10->_visualEffectView = (UIVisualEffectView *)v13;

    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](v10->_visualEffectView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[APBaseShieldView addSubview:](v10, "addSubview:", v10->_visualEffectView);
    v167 = v6;
    -[UIVisualEffectView setHidden:](v10->_visualEffectView, "setHidden:", v6);
    v15 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    label = v10->_label;
    v10->_label = v15;

    v17 = v10->_label;
    objc_msgSend(MEMORY[0x24BEBD5F0], "defaultMetrics");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD5E0], "systemFontOfSize:weight:", 18.0, *MEMORY[0x24BEBE268]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "scaledFontForFont:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v17, "setFont:", v20);

    v21 = APGetPreferredAuthenticationMechanism() - 1;
    if (v21 >= 3)
    {
      APUIDefaultFrameworkLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[APBaseShieldView initWithLocalizedApplicationName:useHiddenStyle:needEmergencyCallButton:].cold.2(v23, v24, v25, v26, v27, v28, v29, v30);

      v22 = 0;
    }
    else
    {
      v22 = off_2507A0070[v21];
    }
    v166 = v8;
    if (v167)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("APP"), &stru_2507A0B80, CFSTR("Localizable"));
      v32 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v32 = v8;
    }
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "localizedStringForKey:value:table:", v22, &stru_2507A0B80, CFSTR("Localizable"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v34, v32);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = objc_msgSend(v35, "rangeOfString:", CFSTR("\n"));
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithDynamicProvider:", &__block_literal_global_2);
    v37 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithDynamicProvider:", &__block_literal_global_31);
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", v35);
    v40 = v39;
    v164 = v35;
    v165 = v32;
    v162 = (void *)v38;
    v163 = (void *)v37;
    if (v36 == 0x7FFFFFFFFFFFFFFFLL)
    {
      APUIDefaultFrameworkLog();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        -[APBaseShieldView initWithLocalizedApplicationName:useHiddenStyle:needEmergencyCallButton:].cold.1(v41, v42, v43, v44, v45, v46, v47, v48);

      v49 = *MEMORY[0x24BEBD278];
      v50 = objc_msgSend(v35, "length");
      v51 = v40;
      v52 = v49;
      v53 = v37;
      v54 = 0;
    }
    else
    {
      v55 = v37;
      v56 = *MEMORY[0x24BEBD278];
      objc_msgSend(v39, "addAttribute:value:range:", *MEMORY[0x24BEBD278], v55, 0, v36);
      v50 = objc_msgSend(v35, "length") - v36;
      v51 = v40;
      v52 = v56;
      v53 = v38;
      v54 = v36;
    }
    objc_msgSend(v51, "addAttribute:value:range:", v52, v53, v54, v50);
    v161 = v40;
    -[UILabel setAttributedText:](v10->_label, "setAttributedText:", v40);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v10->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v10->_label, "setNumberOfLines:", 0);
    -[UILabel setAccessibilityIdentifier:](v10->_label, "setAccessibilityIdentifier:", CFSTR("appProtectionShieldIdentifier"));
    -[UILabel setTextAlignment:](v10->_label, "setTextAlignment:", 1);
    v57 = v10->_label;
    v58 = *MEMORY[0x24BEBE248];
    objc_msgSend(MEMORY[0x24BEBD5E0], "preferredFontForTextStyle:", *MEMORY[0x24BEBE248]);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v57, "setFont:", v59);

    -[APBaseShieldView addSubview:](v10, "addSubview:", v10->_label);
    -[APBaseShieldView setAccessibilityIdentifier:](v10, "setAccessibilityIdentifier:", CFSTR("appProtectionShieldIdentifier"));
    v60 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD380]), "initWithAccessibilityContainer:", v10);
    labelsElement = v10->_labelsElement;
    v10->_labelsElement = (UIAccessibilityElement *)v60;

    v62 = v10->_labelsElement;
    v63 = (void *)MEMORY[0x24BDD17C8];
    -[UILabel accessibilityLabel](v10->_label, "accessibilityLabel");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "stringWithFormat:", CFSTR("%@"), v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAccessibilityElement setAccessibilityLabel:](v62, "setAccessibilityLabel:", v65);

    v169 = *MEMORY[0x24BEBD270];
    objc_msgSend(MEMORY[0x24BEBD5F0], "defaultMetrics");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD5E0], "preferredFontForTextStyle:", v58);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "scaledFontForFont:", v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v170[0] = v68;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v170, &v169, 1);
    v69 = objc_claimAutoreleasedReturnValue();

    v70 = (void *)MEMORY[0x24BDD17C8];
    APGetPreferredAuthenticationMechanismLocKey();
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "stringWithFormat:", CFSTR("TRY_%@_AGAIN"), v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    APUILocStr(v72);
    v73 = objc_claimAutoreleasedReturnValue();

    v74 = objc_alloc(MEMORY[0x24BDD1458]);
    v75 = (void *)MEMORY[0x24BDD17C8];
    APGetPreferredAuthenticationMechanismLocalizedDescription();
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v159 = (void *)v73;
    objc_msgSend(v75, "stringWithFormat:", v73, v76);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v160 = (void *)v69;
    v78 = (void *)objc_msgSend(v74, "initWithString:attributes:", v77, v69);

    objc_msgSend(MEMORY[0x24BEBD438], "filledButtonConfiguration");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "setButtonSize:", 3);
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithDynamicProvider:", &__block_literal_global_44);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "setBaseForegroundColor:", v80);

    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "setBaseBackgroundColor:", v81);

    objc_msgSend(v79, "setAttributedTitle:", v78);
    v82 = objc_alloc(MEMORY[0x24BEBDB38]);
    objc_msgSend(MEMORY[0x24BEBD428], "effectWithStyle:", 4);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = objc_msgSend(v82, "initWithEffect:", v83);

    objc_msgSend(MEMORY[0x24BEBD408], "clearConfiguration");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v155 = (void *)v84;
    objc_msgSend(v85, "setCustomView:", v84);
    v154 = v85;
    objc_msgSend(v79, "setBackground:", v85);
    objc_msgSend(v79, "background");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "setCornerRadius:", 28.0);

    objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 0);
    v87 = objc_claimAutoreleasedReturnValue();
    unlockButton = v10->_unlockButton;
    v10->_unlockButton = (UIButton *)v87;

    v156 = v79;
    -[UIButton setConfiguration:](v10->_unlockButton, "setConfiguration:", v79);
    -[UIButton addTarget:action:forControlEvents:](v10->_unlockButton, "addTarget:action:forControlEvents:", v10, sel_unlockTapped_, 0x2000);
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v10->_unlockButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton setHidden:](v10->_unlockButton, "setHidden:", 1);
    -[APBaseShieldView addSubview:](v10, "addSubview:", v10->_unlockButton);
    if (v10->_shieldStyle == 1)
    {
      -[UILabel setHidden:](v10->_label, "setHidden:", 1);
      -[UIButton setHidden:](v10->_unlockButton, "setHidden:", 0);
    }
    objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 1);
    v89 = objc_claimAutoreleasedReturnValue();
    emergencyCallButton = v10->_emergencyCallButton;
    v10->_emergencyCallButton = (UIButton *)v89;

    -[UIButton addTarget:action:forControlEvents:](v10->_emergencyCallButton, "addTarget:action:forControlEvents:", v10, sel_emergencyTapped_, 0x2000);
    v91 = v10->_emergencyCallButton;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "localizedStringForKey:value:table:", CFSTR("EMERGENCY_CALL"), &stru_2507A0B80, CFSTR("Localizable"));
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](v91, "setTitle:forState:", v93, 0);

    v94 = v10->_emergencyCallButton;
    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitleColor:forState:](v94, "setTitleColor:forState:", v95, 0);

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v10->_emergencyCallButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton setHidden:](v10->_emergencyCallButton, "setHidden:", !v157);
    -[APBaseShieldView addSubview:](v10, "addSubview:", v10->_emergencyCallButton);
    v96 = objc_alloc_init(MEMORY[0x24BEBD718]);
    -[APBaseShieldView addLayoutGuide:](v10, "addLayoutGuide:", v96);
    objc_msgSend(v96, "topAnchor");
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    -[APBaseShieldView topAnchor](v10, "topAnchor");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v152, "constraintEqualToAnchor:", v151);
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    v168[0] = v150;
    objc_msgSend(v96, "heightAnchor");
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    -[APBaseShieldView heightAnchor](v10, "heightAnchor");
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v149, "constraintEqualToAnchor:multiplier:", v148, 0.45);
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    v168[1] = v147;
    -[UILabel topAnchor](v10->_label, "topAnchor");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    v153 = v96;
    objc_msgSend(v96, "bottomAnchor");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v146, "constraintEqualToAnchor:", v145);
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    v168[2] = v144;
    -[UILabel centerXAnchor](v10->_label, "centerXAnchor");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    -[APBaseShieldView centerXAnchor](v10, "centerXAnchor");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v143, "constraintEqualToAnchor:", v142);
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    v168[3] = v141;
    -[UILabel widthAnchor](v10->_label, "widthAnchor");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    -[APBaseShieldView widthAnchor](v10, "widthAnchor");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v140, "constraintLessThanOrEqualToAnchor:", v139);
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    v168[4] = v138;
    -[UIVisualEffectView topAnchor](v10->_visualEffectView, "topAnchor");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    -[APBaseShieldView topAnchor](v10, "topAnchor");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v137, "constraintEqualToAnchor:", v136);
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    v168[5] = v135;
    -[UIVisualEffectView bottomAnchor](v10->_visualEffectView, "bottomAnchor");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    -[APBaseShieldView bottomAnchor](v10, "bottomAnchor");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v134, "constraintEqualToAnchor:", v133);
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    v168[6] = v132;
    -[UIVisualEffectView leadingAnchor](v10->_visualEffectView, "leadingAnchor");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    -[APBaseShieldView leadingAnchor](v10, "leadingAnchor");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v131, "constraintEqualToAnchor:", v130);
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    v168[7] = v129;
    -[UIVisualEffectView trailingAnchor](v10->_visualEffectView, "trailingAnchor");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    -[APBaseShieldView trailingAnchor](v10, "trailingAnchor");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v128, "constraintEqualToAnchor:", v127);
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    v168[8] = v126;
    -[UIButton centerXAnchor](v10->_unlockButton, "centerXAnchor");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    -[APBaseShieldView centerXAnchor](v10, "centerXAnchor");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "constraintEqualToAnchor:", v124);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    v168[9] = v123;
    -[UIButton centerYAnchor](v10->_unlockButton, "centerYAnchor");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    -[APBaseShieldView centerYAnchor](v10, "centerYAnchor");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v122, "constraintEqualToAnchor:", v121);
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    v168[10] = v120;
    -[UIButton widthAnchor](v10->_unlockButton, "widthAnchor");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    -[APBaseShieldView widthAnchor](v10, "widthAnchor");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    v158 = v78;
    objc_msgSend(v78, "size");
    objc_msgSend(v119, "constraintEqualToAnchor:multiplier:constant:", v118, 0.0, v97 + 70.0);
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v98) = 1144750080;
    objc_msgSend(v117, "setPriority:", v98);
    v168[11] = v117;
    -[UIButton widthAnchor](v10->_unlockButton, "widthAnchor");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    -[APBaseShieldView safeAreaLayoutGuide](v10, "safeAreaLayoutGuide");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "widthAnchor");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "constraintLessThanOrEqualToAnchor:", v114);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    v168[12] = v113;
    -[UIButton heightAnchor](v10->_unlockButton, "heightAnchor");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    -[APBaseShieldView safeAreaLayoutGuide](v10, "safeAreaLayoutGuide");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "heightAnchor");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "constraintLessThanOrEqualToAnchor:", v110);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v168[13] = v99;
    -[UIButton bottomAnchor](v10->_emergencyCallButton, "bottomAnchor");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    -[APBaseShieldView safeAreaLayoutGuide](v10, "safeAreaLayoutGuide");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "bottomAnchor");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "constraintEqualToAnchor:constant:", v102, -30.0);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v168[14] = v103;
    -[UIButton centerXAnchor](v10->_emergencyCallButton, "centerXAnchor");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    -[APBaseShieldView centerXAnchor](v10, "centerXAnchor");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "constraintEqualToAnchor:", v105);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v168[15] = v106;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v168, 16);
    v107 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v107);
    if (v167)
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithDynamicProvider:", &__block_literal_global_56);
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      -[APBaseShieldView setBackgroundColor:](v10, "setBackgroundColor:", v108);

    }
    v8 = v166;
  }

  return v10;
}

id __92__APBaseShieldView_initWithLocalizedApplicationName_useHiddenStyle_needEmergencyCallButton___block_invoke(uint64_t a1, void *a2)
{
  if (objc_msgSend(a2, "userInterfaceStyle") == 2)
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemWhiteColor");
  else
    objc_msgSend(MEMORY[0x24BEBD4B8], "darkGrayColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

id __92__APBaseShieldView_initWithLocalizedApplicationName_useHiddenStyle_needEmergencyCallButton___block_invoke_2(uint64_t a1, void *a2)
{
  if (objc_msgSend(a2, "userInterfaceStyle") == 2)
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemWhiteColor");
  else
    objc_msgSend(MEMORY[0x24BEBD4B8], "grayColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

id __92__APBaseShieldView_initWithLocalizedApplicationName_useHiddenStyle_needEmergencyCallButton___block_invoke_43(uint64_t a1, void *a2)
{
  if (objc_msgSend(a2, "userInterfaceStyle") == 2)
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemWhiteColor");
  else
    objc_msgSend(MEMORY[0x24BEBD4B8], "darkGrayColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

id __92__APBaseShieldView_initWithLocalizedApplicationName_useHiddenStyle_needEmergencyCallButton___block_invoke_2_55(uint64_t a1, void *a2)
{
  if (objc_msgSend(a2, "userInterfaceStyle") == 2)
    objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
  else
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)accessibilityElements
{
  UIButton **p_unlockButton;
  void *v4;
  uint64_t v5;
  UIButton *unlockButton;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  if (self->_shieldStyle)
  {
    unlockButton = self->_unlockButton;
    p_unlockButton = &unlockButton;
  }
  else
  {
    v8[0] = self->_labelsElement;
    p_unlockButton = (UIButton **)v8;
  }
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", p_unlockButton, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[UIButton isHidden](self->_emergencyCallButton, "isHidden") & 1) == 0)
  {
    objc_msgSend(v4, "arrayByAddingObject:", self->_emergencyCallButton);
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }
  return v4;
}

- (void)layoutSubviews
{
  UILabel *label;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)APBaseShieldView;
  -[APBaseShieldView layoutSubviews](&v4, sel_layoutSubviews);
  label = self->_label;
  -[UILabel bounds](label, "bounds");
  -[UILabel convertRect:toView:](label, "convertRect:toView:", self);
  -[UIAccessibilityElement setAccessibilityFrameInContainerSpace:](self->_labelsElement, "setAccessibilityFrameInContainerSpace:");
}

- (void)unlockTapped:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "shieldViewUnlockButtonPressed:", self);

}

- (void)emergencyCallHostViewControllerDidDismiss:(id)a3
{
  APEmergencyCallHostViewController *v4;
  APEmergencyCallHostViewController *v5;

  v4 = (APEmergencyCallHostViewController *)a3;
  if (self->_emergencyVC == v4)
  {
    self->_emergencyVC = 0;
    v5 = v4;

    v4 = v5;
  }

}

- (void)emergencyTapped:(id)a3
{
  void *v4;
  _QWORD v5[5];

  objc_msgSend(MEMORY[0x24BE04310], "sharedGuard", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "abortOngoingAuthWithCompletion:", &__block_literal_global_61);

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __36__APBaseShieldView_emergencyTapped___block_invoke_63;
  v5[3] = &unk_2507A0000;
  v5[4] = self;
  +[SBUIEmergencyCallHostViewController requestEmergencyCallControllerWithCompletion:](APEmergencyCallHostViewController, "requestEmergencyCallControllerWithCompletion:", v5);
}

void __36__APBaseShieldView_emergencyTapped___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a3;
  if (v4 || (a2 & 1) == 0)
  {
    APUIDefaultFrameworkLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __36__APBaseShieldView_emergencyTapped___block_invoke_cold_1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

  }
}

void __36__APBaseShieldView_emergencyTapped___block_invoke_63(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v3 = a2;
  v5 = *(_QWORD *)(a1 + 32);
  v4 = (_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v5 + 464))
  {
    APUIDefaultFrameworkLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __36__APBaseShieldView_emergencyTapped___block_invoke_63_cold_2(v6, v7, v8, v9, v10, v11, v12, v13);

  }
  v14 = v3;
  objc_msgSend(v14, "setDelegate:", *v4);
  objc_msgSend(MEMORY[0x24BEBDB08], "_viewControllerForFullScreenPresentationFromView:", *v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "presentViewController:animated:completion:", v14, 1, 0);
    v17 = *v4;
    v18 = v14;
    v19 = *(NSObject **)(v17 + 464);
    *(_QWORD *)(v17 + 464) = v18;
  }
  else
  {
    APUIDefaultFrameworkLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      __36__APBaseShieldView_emergencyTapped___block_invoke_63_cold_1((uint64_t)v4, v19, v20, v21, v22, v23, v24, v25);
  }

}

- (void)setShieldStyle:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  APBaseShieldView *v7;
  void *v8;
  APBaseShieldView *v9;
  _QWORD block[4];
  id v11[2];
  id location;
  _BYTE buf[24];
  void *v14;
  APBaseShieldView *v15;
  unint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  APUIDefaultFrameworkLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[APApplication bundleIdentifier](self->_shieldedApplication, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = a3;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v6;
    _os_log_impl(&dword_2362EA000, v5, OS_LOG_TYPE_DEFAULT, "APBaseShieldView setShieldStyle:%lu for %@", buf, 0x16u);

  }
  objc_initWeak(&location, self);
  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
  {
    v7 = self;
    v8 = (void *)MEMORY[0x24BEBDB00];
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __performTransition_block_invoke;
    v14 = &unk_2507A0050;
    v15 = v7;
    v16 = a3;
    v9 = v7;
    objc_msgSend(v8, "transitionWithView:duration:options:animations:completion:", v9, 5242880, buf, 0, 0.2);

  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __35__APBaseShieldView_setShieldStyle___block_invoke;
    block[3] = &unk_2507A0028;
    objc_copyWeak(v11, &location);
    v11[1] = (id)a3;
    dispatch_sync(MEMORY[0x24BDAC9B8], block);
    objc_destroyWeak(v11);
  }
  self->_shieldStyle = a3;
  objc_destroyWeak(&location);
}

void __35__APBaseShieldView_setShieldStyle___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = *(_QWORD *)(a1 + 40);
  v4 = (void *)MEMORY[0x24BEBDB00];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __performTransition_block_invoke;
  v6[3] = &unk_2507A0050;
  v7 = WeakRetained;
  v8 = v3;
  v5 = WeakRetained;
  objc_msgSend(v4, "transitionWithView:duration:options:animations:completion:", v5, 5242880, v6, 0, 0.2);

}

- (void)resetShield
{
  -[APBaseShieldView setShieldStyle:](self, "setShieldStyle:", 0);
}

- (void)dealloc
{
  objc_super v3;

  -[APSystemAppOutlet removeShield:](self->_outlet, "removeShield:", self);
  v3.receiver = self;
  v3.super_class = (Class)APBaseShieldView;
  -[APBaseShieldView dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqualTo:(id)a3
{
  return self == a3;
}

- (APApplication)shieldedApplication
{
  return self->_shieldedApplication;
}

- (APBaseShieldViewDelegate)delegate
{
  return (APBaseShieldViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_shieldedApplication, 0);
  objc_storeStrong((id *)&self->_outlet, 0);
  objc_storeStrong((id *)&self->_emergencyVC, 0);
  objc_storeStrong((id *)&self->_emergencyCallButton, 0);
  objc_storeStrong((id *)&self->_unlockButton, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_storeStrong((id *)&self->_labelsElement, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
}

- (void)initWithApplication:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_2362EA000, v2, v3, "making shield view, could not find record for %@: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)initWithConfig:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a1, "application");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_2362EA000, v3, v4, "making shield view without localized name, could not find record for %@: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_4_0();
}

- (void)initWithLocalizedApplicationName:(uint64_t)a3 useHiddenStyle:(uint64_t)a4 needEmergencyCallButton:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_2362EA000, a1, a3, "Localized string did not contain line break", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5_0();
}

- (void)initWithLocalizedApplicationName:(uint64_t)a3 useHiddenStyle:(uint64_t)a4 needEmergencyCallButton:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_2362EA000, a1, a3, "No valid auth method found", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5_0();
}

void __36__APBaseShieldView_emergencyTapped___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2362EA000, a2, a3, "Could not cancel ongoing auth. Error: %@", a5, a6, a7, a8, 2u);
}

void __36__APBaseShieldView_emergencyTapped___block_invoke_63_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2362EA000, a2, a3, "No appropriate presentation VC found for %@", a5, a6, a7, a8, 2u);
}

void __36__APBaseShieldView_emergencyTapped___block_invoke_63_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_2362EA000, a1, a3, "Double-invocation of emergency VC, ignoring new VC", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5_0();
}

@end

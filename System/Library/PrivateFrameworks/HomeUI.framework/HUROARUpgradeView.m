@implementation HUROARUpgradeView

- (HUROARUpgradeView)initWithUpgradeViewReason:(unint64_t)a3 home:(id)a4
{
  id v8;
  HUROARUpgradeView *v9;
  HUROARUpgradeView *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
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
  uint64_t v52;
  void *v53;
  id v55;
  uint64_t v56;
  objc_super v57;
  uint8_t buf[4];
  HUROARUpgradeView *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  id v63;
  __int16 v64;
  unint64_t v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v57.receiver = self;
  v57.super_class = (Class)HUROARUpgradeView;
  v9 = -[HUROARUpgradeView init](&v57, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_home, a4);
    objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addHomeManagerObserver:", v10);

    HFLogForCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v59 = v10;
      v60 = 2112;
      v61 = v13;
      v62 = 2112;
      v63 = v8;
      v64 = 2048;
      v65 = a3;
      _os_log_impl(&dword_1B8E1E000, v12, OS_LOG_TYPE_DEFAULT, "%@:%@, home = %@,  upgradeViewReason = %lu", buf, 0x2Au);

    }
    -[HUROARUpgradeView setUpgradeViewReason:](v10, "setUpgradeViewReason:", a3);
    if (a3 == 2)
    {
      objc_msgSend(MEMORY[0x1E0CEC3F8], "_typeOfCurrentDevice");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = 0;
      objc_msgSend(MEMORY[0x1E0D3A838], "symbolForTypeIdentifier:error:", v15, &v56);
      v55 = v8;
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_alloc_init(MEMORY[0x1E0D3A818]);
      objc_msgSend(v17, "setSymbolSize:", 3);
      objc_msgSend(v16, "imageForDescriptor:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA638], "imageWithCGImage:", objc_msgSend(v18, "CGImage"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "imageWithTintColor:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = v55;
      a3 = 2;

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:weight:", 4, 72.0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:withConfiguration:", CFSTR("homekit"), v14);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v21);
    -[HUROARUpgradeView setDeviceImageView:](v10, "setDeviceImageView:", v22);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUROARUpgradeView deviceImageView](v10, "deviceImageView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setTintColor:", v23);

    v25 = objc_alloc_init(MEMORY[0x1E0CEA700]);
    -[HUROARUpgradeView setTitle:](v10, "setTitle:", v25);

    -[HUROARUpgradeView _titleString](v10, "_titleString");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUROARUpgradeView title](v10, "title");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setText:", v26);

    -[HUROARUpgradeView title](v10, "title");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setTextAlignment:", 1);

    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB5B0]);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUROARUpgradeView title](v10, "title");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setFont:", v29);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUROARUpgradeView title](v10, "title");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setTextColor:", v31);

    -[HUROARUpgradeView title](v10, "title");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "sizeToFit");

    v34 = objc_alloc_init(MEMORY[0x1E0CEA700]);
    -[HUROARUpgradeView setSubtitle:](v10, "setSubtitle:", v34);

    -[HUROARUpgradeView _subtitleString](v10, "_subtitleString");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUROARUpgradeView subtitle](v10, "subtitle");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setText:", v35);

    -[HUROARUpgradeView subtitle](v10, "subtitle");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setTextAlignment:", 1);

    -[HUROARUpgradeView subtitle](v10, "subtitle");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setNumberOfLines:", 0);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUROARUpgradeView subtitle](v10, "subtitle");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setTextColor:", v39);

    -[HUROARUpgradeView subtitle](v10, "subtitle");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "sizeToFit");

    -[HUROARUpgradeView deviceImageView](v10, "deviceImageView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUROARUpgradeView addSubview:](v10, "addSubview:", v42);

    -[HUROARUpgradeView title](v10, "title");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUROARUpgradeView addSubview:](v10, "addSubview:", v43);

    -[HUROARUpgradeView subtitle](v10, "subtitle");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUROARUpgradeView addSubview:](v10, "addSubview:", v44);

    objc_msgSend(MEMORY[0x1E0CEA3A8], "filledButtonConfiguration");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUROARUpgradeView _buttonString](v10, "_buttonString");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setTitle:", v46);

    objc_msgSend(v45, "setButtonSize:", 3);
    objc_msgSend(v45, "setCornerStyle:", 3);
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBlackColor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setBaseForegroundColor:", v47);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setBaseBackgroundColor:", v48);

    -[HUROARUpgradeView _buttonAction](v10, "_buttonAction");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithConfiguration:primaryAction:", v45, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUROARUpgradeView setButton:](v10, "setButton:", v50);

    -[HUROARUpgradeView button](v10, "button");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUROARUpgradeView addSubview:](v10, "addSubview:", v51);

    if (a3 == 2)
    {
      v52 = 0;
    }
    else if (v8)
    {
      v52 = objc_msgSend(v8, "hf_currentUserIsOwner");
    }
    else
    {
      v52 = 1;
    }
    -[HUROARUpgradeView button](v10, "button");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setHidden:", v52);

  }
  return v10;
}

- (void)layoutSubviews
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
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
  objc_super v70;

  v70.receiver = self;
  v70.super_class = (Class)HUROARUpgradeView;
  -[HUROARUpgradeView layoutSubviews](&v70, sel_layoutSubviews);
  -[HUROARUpgradeView constraints](self, "constraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUROARUpgradeView deviceImageView](self, "deviceImageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HUROARUpgradeView subtitle](self, "subtitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HUROARUpgradeView title](self, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HUROARUpgradeView button](self, "button");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HUROARUpgradeView subtitle](self, "subtitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bottomAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUROARUpgradeView centerYAnchor](self, "centerYAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v12);

    -[HUROARUpgradeView subtitle](self, "subtitle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "leadingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUROARUpgradeView leadingAnchor](self, "leadingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v16);

    -[HUROARUpgradeView subtitle](self, "subtitle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "trailingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUROARUpgradeView trailingAnchor](self, "trailingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v20);

    -[HUROARUpgradeView subtitle](self, "subtitle");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "centerXAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUROARUpgradeView centerXAnchor](self, "centerXAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v24);

    -[HUROARUpgradeView title](self, "title");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "bottomAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUROARUpgradeView subtitle](self, "subtitle");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "topAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:constant:", v28, -5.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v29);

    -[HUROARUpgradeView title](self, "title");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "leadingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUROARUpgradeView leadingAnchor](self, "leadingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v33);

    -[HUROARUpgradeView title](self, "title");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "trailingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUROARUpgradeView trailingAnchor](self, "trailingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v37);

    -[HUROARUpgradeView title](self, "title");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "centerXAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUROARUpgradeView centerXAnchor](self, "centerXAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v41);

    -[HUROARUpgradeView deviceImageView](self, "deviceImageView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "centerXAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUROARUpgradeView centerXAnchor](self, "centerXAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v45);

    -[HUROARUpgradeView deviceImageView](self, "deviceImageView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "bottomAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUROARUpgradeView title](self, "title");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "topAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:constant:", v49, -10.0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v50);

    -[HUROARUpgradeView button](self, "button");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "bottomAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUROARUpgradeView layoutMarginsGuide](self, "layoutMarginsGuide");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "bottomAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintEqualToAnchor:", v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v55);

    -[HUROARUpgradeView button](self, "button");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "leadingAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUROARUpgradeView leadingAnchor](self, "leadingAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "constraintEqualToAnchor:", v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v59);

    -[HUROARUpgradeView button](self, "button");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "trailingAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUROARUpgradeView trailingAnchor](self, "trailingAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "constraintEqualToAnchor:", v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v63);

    -[HUROARUpgradeView button](self, "button");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "centerXAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUROARUpgradeView centerXAnchor](self, "centerXAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "constraintEqualToAnchor:", v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v67);

    -[HUROARUpgradeView setConstraints:](self, "setConstraints:", v4);
    v68 = (void *)MEMORY[0x1E0CB3718];
    -[HUROARUpgradeView constraints](self, "constraints");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "activateConstraints:", v69);

  }
}

- (id)_titleString
{
  void *v3;
  uint64_t v4;

  _HULocalizedStringWithDefaultValue(CFSTR("HUSetupCellROARRequired_Title"), CFSTR("HUSetupCellROARRequired_Title"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HUROARUpgradeView upgradeViewReason](self, "upgradeViewReason") == 4)
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUUnsupportedHomeHub_Title"), CFSTR("HUUnsupportedHomeHub_Title"), 1);
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  return v3;
}

- (id)_subtitleString
{
  void *v3;
  uint64_t v4;

  _HULocalizedStringWithDefaultValue(CFSTR("HUSetupCellROARRequired_Details"), CFSTR("HUSetupCellROARRequired_Details"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HUROARUpgradeView upgradeViewReason](self, "upgradeViewReason") == 4)
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUUnsupportedHomeHub_Details"), CFSTR("HUUnsupportedHomeHub_Details"), 1);
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  return v3;
}

- (id)_buttonString
{
  __CFString *v2;

  if (-[HUROARUpgradeView upgradeViewReason](self, "upgradeViewReason") == 2)
    v2 = CFSTR("HUSetupCellSoftwareUpdate");
  else
    v2 = CFSTR("HUUnsupportedHomeHub_LearnMore");
  _HULocalizedStringWithDefaultValue(v2, v2, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_buttonAction
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __34__HUROARUpgradeView__buttonAction__block_invoke;
  v3[3] = &unk_1E6F4E328;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0CEA2A8], "actionWithHandler:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __34__HUROARUpgradeView__buttonAction__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;
  id v4;

  v1 = objc_msgSend(*(id *)(a1 + 32), "upgradeViewReason");
  objc_msgSend(MEMORY[0x1E0D31600], "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v1 == 4)
    objc_msgSend(MEMORY[0x1E0C99E98], "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");
  else
    objc_msgSend(MEMORY[0x1E0C99E98], "hf_systemSoftwareUpdate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v4, "openSensitiveURL:", v2);

}

- (void)_didSwitchToHome:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  unint64_t v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  HUROARUpgradeView *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  unint64_t v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUROARUpgradeView home](self, "home");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138413058;
    v19 = self;
    v20 = 2112;
    v21 = v7;
    v22 = 2112;
    v23 = (unint64_t)v5;
    v24 = 2112;
    v25 = v8;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@, Switched to Home %@ - current Home %@", (uint8_t *)&v18, 0x2Au);

  }
  -[HUROARUpgradeView home](self, "home");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 != v5)
  {
    -[HUROARUpgradeView setHome:](self, "setHome:", v5);
    HFLogForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[HUROARUpgradeView upgradeViewReason](self, "upgradeViewReason");
      v13 = objc_msgSend(v5, "hf_currentUserIsOwner");
      v18 = 138413058;
      v19 = self;
      v20 = 2112;
      v21 = v11;
      v22 = 2048;
      v23 = v12;
      v24 = 1024;
      LODWORD(v25) = v13;
      _os_log_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEFAULT, "%@:%@, upgradeViewReason %lu - currentUserIsOwner %{BOOL}d", (uint8_t *)&v18, 0x26u);

    }
    if (-[HUROARUpgradeView upgradeViewReason](self, "upgradeViewReason") == 2
      || v5 && (objc_msgSend(v5, "hf_currentUserIsOwner") & 1) == 0)
    {
      -[HUROARUpgradeView button](self, "button");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setHidden:", 0);

      -[HUROARUpgradeView _buttonString](self, "_buttonString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUROARUpgradeView button](self, "button");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "configuration");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setTitle:", v14);

    }
    else
    {
      -[HUROARUpgradeView button](self, "button");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setHidden:", 1);
    }

  }
}

- (void)homeKitDispatcher:(id)a3 manager:(id)a4 didChangeHome:(id)a5
{
  -[HUROARUpgradeView _didSwitchToHome:](self, "_didSwitchToHome:", a5, a4);
}

- (UIImageView)deviceImageView
{
  return self->_deviceImageView;
}

- (void)setDeviceImageView:(id)a3
{
  objc_storeStrong((id *)&self->_deviceImageView, a3);
}

- (UILabel)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (UILabel)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_subtitle, a3);
}

- (UIButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
  objc_storeStrong((id *)&self->_button, a3);
}

- (NSMutableArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_constraints, a3);
}

- (unint64_t)upgradeViewReason
{
  return self->_upgradeViewReason;
}

- (void)setUpgradeViewReason:(unint64_t)a3
{
  self->_upgradeViewReason = a3;
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_deviceImageView, 0);
}

@end

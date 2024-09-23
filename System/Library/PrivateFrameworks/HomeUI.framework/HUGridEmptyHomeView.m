@implementation HUGridEmptyHomeView

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (HUGridEmptyHomeView)initWithCoder:(id)a3
{
  HUGridEmptyHomeView *v3;
  HUGridEmptyHomeView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUGridEmptyHomeView;
  v3 = -[HUGridEmptyHomeView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[HUGridEmptyHomeView _setupCommonAppearance](v3, "_setupCommonAppearance");
  return v4;
}

- (HUGridEmptyHomeView)initWithFrame:(CGRect)a3
{
  HUGridEmptyHomeView *v3;
  HUGridEmptyHomeView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUGridEmptyHomeView;
  v3 = -[HUGridEmptyHomeView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[HUGridEmptyHomeView _setupCommonAppearance](v3, "_setupCommonAppearance");
  return v4;
}

- (void)_setupCommonAppearance
{
  id v3;
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
  HUColoredButton *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  HUColoredButton *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  HUChevronButton *v26;
  HUChevronButton *v27;
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
  HUChevronButton *v38;
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
  id v49;

  v3 = objc_alloc_init(MEMORY[0x1E0CEA700]);
  -[HUGridEmptyHomeView setInstructionsLabel:](self, "setInstructionsLabel:", v3);

  -[HUGridEmptyHomeView instructionsLabel](self, "instructionsLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUGridEmptyHomeView instructionsLabel](self, "instructionsLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAdjustsFontSizeToFitWidth:", 1);

  objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridEmptyHomeView instructionsLabel](self, "instructionsLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextColor:", v6);

  _HULocalizedStringWithDefaultValue(CFSTR("HUGridEmptyHomeViewInstructionsLabelText"), CFSTR("HUGridEmptyHomeViewInstructionsLabelText"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridEmptyHomeView instructionsLabel](self, "instructionsLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v8);

  -[HUGridEmptyHomeView instructionsLabel](self, "instructionsLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setNumberOfLines:", 0);

  objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:weight:", 18.0, *MEMORY[0x1E0CEB5F8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridEmptyHomeView instructionsLabel](self, "instructionsLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFont:", v11);

  -[HUGridEmptyHomeView instructionsLabel](self, "instructionsLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridEmptyHomeView addSubview:](self, "addSubview:", v13);

  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB588]);
  v49 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0D319D0], "supportsAccessorySetup"))
  {
    v14 = [HUColoredButton alloc];
    v15 = *MEMORY[0x1E0C9D648];
    v16 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v17 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v18 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v19 = -[HUColoredButton initWithFrame:highlightedAlpha:highlightedTextAlpha:](v14, "initWithFrame:highlightedAlpha:highlightedTextAlpha:", *MEMORY[0x1E0C9D648], v16, v17, v18, 0.75, 0.5);
    -[HUGridEmptyHomeView setAddAccessoryButton:](self, "setAddAccessoryButton:", v19);

    -[HUGridEmptyHomeView addAccessoryButton](self, "addAccessoryButton");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HUGridEmptyHomeView addAccessoryButton](self, "addAccessoryButton");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[HUAddAccessoryUtilities addAccessoryString](HUAddAccessoryUtilities, "addAccessoryString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setTitle:forState:", v22, 0);

    -[HUGridEmptyHomeView addAccessoryButton](self, "addAccessoryButton");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setBackgroundColor:", v24);

    -[HUGridEmptyHomeView addAccessoryButton](self, "addAccessoryButton");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addTarget:action:forControlEvents:", self, sel__addNewAccessory_, 64);

    -[HUGridEmptyHomeView addAccessoryButton](self, "addAccessoryButton");
  }
  else
  {
    v26 = [HUChevronButton alloc];
    v15 = *MEMORY[0x1E0C9D648];
    v16 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v17 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v18 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v27 = -[HUChevronButton initWithFrame:](v26, "initWithFrame:", *MEMORY[0x1E0C9D648], v16, v17, v18);
    -[HUGridEmptyHomeView setLearnToAddAccessoryButton:](self, "setLearnToAddAccessoryButton:", v27);

    -[HUGridEmptyHomeView learnToAddAccessoryButton](self, "learnToAddAccessoryButton");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    _HULocalizedStringWithDefaultValue(CFSTR("HUGridEmptyHomeViewLearnToAddAccessoriesButtonTitle"), CFSTR("HUGridEmptyHomeViewLearnToAddAccessoriesButtonTitle"), 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridEmptyHomeView learnToAddAccessoryButton](self, "learnToAddAccessoryButton");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "titleLabel");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setText:", v29);

    v32 = (void *)MEMORY[0x1E0CEA5E8];
    objc_msgSend(v49, "pointSize");
    objc_msgSend(v32, "systemFontOfSize:weight:");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridEmptyHomeView learnToAddAccessoryButton](self, "learnToAddAccessoryButton");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "titleLabel");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setFont:", v33);

    -[HUGridEmptyHomeView learnToAddAccessoryButton](self, "learnToAddAccessoryButton");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addTarget:action:forControlEvents:", self, sel__openLearnToAddAccessories_, 64);

    -[HUGridEmptyHomeView learnToAddAccessoryButton](self, "learnToAddAccessoryButton");
  }
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridEmptyHomeView addSubview:](self, "addSubview:", v37);

  v38 = -[HUChevronButton initWithFrame:]([HUChevronButton alloc], "initWithFrame:", v15, v16, v17, v18);
  -[HUGridEmptyHomeView setStoreButton:](self, "setStoreButton:", v38);

  -[HUGridEmptyHomeView storeButton](self, "storeButton");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  +[HUStoreUtilities accessoryStoreButtonTitle](HUStoreUtilities, "accessoryStoreButtonTitle");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridEmptyHomeView storeButton](self, "storeButton");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "titleLabel");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setText:", v40);

  v43 = (void *)MEMORY[0x1E0CEA5E8];
  objc_msgSend(v49, "pointSize");
  objc_msgSend(v43, "systemFontOfSize:weight:");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridEmptyHomeView storeButton](self, "storeButton");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "titleLabel");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setFont:", v44);

  -[HUGridEmptyHomeView storeButton](self, "storeButton");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "addTarget:action:forControlEvents:", self, sel__openStore_, 64);

  -[HUGridEmptyHomeView storeButton](self, "storeButton");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridEmptyHomeView addSubview:](self, "addSubview:", v48);

}

- (void)tintColorDidChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HUGridEmptyHomeView;
  -[HUGridEmptyHomeView tintColorDidChange](&v8, sel_tintColorDidChange);
  -[HUGridEmptyHomeView addAccessoryButton](self, "addAccessoryButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridEmptyHomeView tintColor](self, "tintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitleColor:forState:", v4, 0);

  -[HUGridEmptyHomeView addAccessoryButton](self, "addAccessoryButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridEmptyHomeView tintColor](self, "tintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "colorWithAlphaComponent:", 0.5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitleColor:forState:", v7, 1);

}

- (void)didMoveToSuperview
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HUGridEmptyHomeView;
  -[HUGridEmptyHomeView didMoveToSuperview](&v8, sel_didMoveToSuperview);
  -[HUGridEmptyHomeView addAccessoryButton](self, "addAccessoryButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridEmptyHomeView tintColor](self, "tintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitleColor:forState:", v4, 0);

  -[HUGridEmptyHomeView addAccessoryButton](self, "addAccessoryButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridEmptyHomeView tintColor](self, "tintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "colorWithAlphaComponent:", 0.5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitleColor:forState:", v7, 1);

}

- (void)_addNewAccessory:(id)a3
{
  id v4;

  -[HUGridEmptyHomeView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "emptyHomeCellAddAccessoryButtonPressed:", self);

}

- (void)_openStore:(id)a3
{
  void *v3;
  id v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D31600], "sharedInstance", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[HUStoreUtilities accessoryStoreURL](HUStoreUtilities, "accessoryStoreURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v5, "openURL:", v3);

}

- (void)_openLearnToAddAccessories:(id)a3
{
  void *v3;
  id v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D31600], "sharedInstance", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "hf_learnToAddAccessoriesURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v5, "openURL:", v3);

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
  uint64_t v36;
  int v37;
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
  char v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  objc_super v67;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridEmptyHomeView instructionsLabel](self, "instructionsLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leadingAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridEmptyHomeView leadingAnchor](self, "leadingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  -[HUGridEmptyHomeView instructionsLabel](self, "instructionsLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridEmptyHomeView trailingAnchor](self, "trailingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v11);

  -[HUGridEmptyHomeView instructionsLabel](self, "instructionsLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "topAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridEmptyHomeView topAnchor](self, "topAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v15);

  -[HUGridEmptyHomeView storeButton](self, "storeButton");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "leadingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridEmptyHomeView leadingAnchor](self, "leadingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v19);

  if (objc_msgSend(MEMORY[0x1E0D319D0], "supportsAccessorySetup"))
  {
    -[HUGridEmptyHomeView addAccessoryButton](self, "addAccessoryButton");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "leadingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridEmptyHomeView leadingAnchor](self, "leadingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v23);

    -[HUGridEmptyHomeView addAccessoryButton](self, "addAccessoryButton");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridEmptyHomeView trailingAnchor](self, "trailingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v27);

    -[HUGridEmptyHomeView addAccessoryButton](self, "addAccessoryButton");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "heightAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToConstant:", 50.0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v30);

    -[HUGridEmptyHomeView storeButton](self, "storeButton");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "trailingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridEmptyHomeView trailingAnchor](self, "trailingAnchor");
  }
  else
  {
    -[HUGridEmptyHomeView learnToAddAccessoryButton](self, "learnToAddAccessoryButton");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "leadingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridEmptyHomeView leadingAnchor](self, "leadingAnchor");
  }
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v34);

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "userInterfaceIdiom");

  v37 = objc_msgSend(MEMORY[0x1E0D319D0], "supportsAccessorySetup");
  if (v36 == 1)
  {
    if (v37)
    {
      -[HUGridEmptyHomeView addAccessoryButton](self, "addAccessoryButton");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "topAnchor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUGridEmptyHomeView instructionsLabel](self, "instructionsLabel");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "lastBaselineAnchor");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUGridEmptyHomeView instructionsLabel](self, "instructionsLabel");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "font");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "_scaledValueForValue:", 34.0);
      objc_msgSend(v39, "constraintEqualToAnchor:constant:", v41);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v44);

      -[HUGridEmptyHomeView storeButton](self, "storeButton");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "firstBaselineAnchor");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUGridEmptyHomeView addAccessoryButton](self, "addAccessoryButton");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "bottomAnchor");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = 32.0;
    }
    else
    {
      -[HUGridEmptyHomeView learnToAddAccessoryButton](self, "learnToAddAccessoryButton");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "firstBaselineAnchor");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUGridEmptyHomeView instructionsLabel](self, "instructionsLabel");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "bottomAnchor");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "constraintEqualToAnchor:constant:", v58, 26.0);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v59);

      -[HUGridEmptyHomeView storeButton](self, "storeButton");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "firstBaselineAnchor");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUGridEmptyHomeView learnToAddAccessoryButton](self, "learnToAddAccessoryButton");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "bottomAnchor");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = 18.0;
    }
    objc_msgSend(v46, "constraintEqualToAnchor:constant:", v48, v49);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v60);

  }
  else
  {
    if (v37)
    {
      -[HUGridEmptyHomeView addAccessoryButton](self, "addAccessoryButton");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "bottomAnchor");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUGridEmptyHomeView storeButton](self, "storeButton");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "topAnchor");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "constraintEqualToAnchor:constant:", v53, -18.0);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v54);

    }
    -[HUGridEmptyHomeView storeButton](self, "storeButton");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "lastBaselineAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridEmptyHomeView bottomAnchor](self, "bottomAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintEqualToAnchor:constant:", v47, -32.0);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v48);
  }

  -[HUGridEmptyHomeView constraints](self, "constraints");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend(v3, "isEqualToArray:", v61);

  if ((v62 & 1) == 0)
  {
    v63 = (void *)MEMORY[0x1E0CB3718];
    -[HUGridEmptyHomeView constraints](self, "constraints");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "deactivateConstraints:", v64);

    -[HUGridEmptyHomeView setConstraints:](self, "setConstraints:", v3);
    v65 = (void *)MEMORY[0x1E0CB3718];
    -[HUGridEmptyHomeView constraints](self, "constraints");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "activateConstraints:", v66);

  }
  v67.receiver = self;
  v67.super_class = (Class)HUGridEmptyHomeView;
  -[HUGridEmptyHomeView updateConstraints](&v67, sel_updateConstraints);

}

- (HUGridEmptyHomeViewDelegate)delegate
{
  return (HUGridEmptyHomeViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UILabel)instructionsLabel
{
  return self->_instructionsLabel;
}

- (void)setInstructionsLabel:(id)a3
{
  objc_storeStrong((id *)&self->_instructionsLabel, a3);
}

- (HUColoredButton)addAccessoryButton
{
  return self->_addAccessoryButton;
}

- (void)setAddAccessoryButton:(id)a3
{
  objc_storeStrong((id *)&self->_addAccessoryButton, a3);
}

- (HUChevronButton)learnToAddAccessoryButton
{
  return self->_learnToAddAccessoryButton;
}

- (void)setLearnToAddAccessoryButton:(id)a3
{
  objc_storeStrong((id *)&self->_learnToAddAccessoryButton, a3);
}

- (HUChevronButton)storeButton
{
  return self->_storeButton;
}

- (void)setStoreButton:(id)a3
{
  objc_storeStrong((id *)&self->_storeButton, a3);
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_constraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_storeButton, 0);
  objc_storeStrong((id *)&self->_learnToAddAccessoryButton, 0);
  objc_storeStrong((id *)&self->_addAccessoryButton, 0);
  objc_storeStrong((id *)&self->_instructionsLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

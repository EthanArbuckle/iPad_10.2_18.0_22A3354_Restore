@implementation SUUIComposeReviewNicknameView

- (SUUIComposeReviewNicknameView)initWithFrame:(CGRect)a3
{
  SUUIComposeReviewNicknameView *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUUIComposeReviewNicknameView;
  v3 = -[SUUIComposeReviewNicknameView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIComposeReviewNicknameView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[SUUIComposeReviewNicknameView _setupView](v3, "_setupView");
  }
  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
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
  int v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  _QWORD v27[5];

  v27[4] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SUUIComposeReviewNicknameView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != v7)
  {
    -[SUUIComposeReviewNicknameView titleView](self, "titleView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    SUUIFontLimitedPreferredFontForTextStyle(15, 7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFont:", v9);

    -[SUUIComposeReviewNicknameView nicknamePlaceholderLabel](self, "nicknamePlaceholderLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    SUUIFontLimitedPreferredFontForTextStyle(3, 7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFont:", v11);

    -[SUUIComposeReviewNicknameView nicknameTextfield](self, "nicknameTextfield");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    SUUIFontLimitedPreferredFontForTextStyle(1, 7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFont:", v13);

    -[SUUIComposeReviewNicknameView nicknameInfoLabel](self, "nicknameInfoLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    SUUIFontLimitedPreferredFontForTextStyle(11, 7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFont:", v15);

  }
  -[SUUIComposeReviewNicknameView traitCollection](self, "traitCollection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "hasDifferentColorAppearanceComparedToTraitCollection:", v4);

  if (v17)
  {
    -[SUUIComposeReviewNicknameView sampleCardGradientView](self, "sampleCardGradientView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "colorWithAlphaComponent:", 0.0);
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v27[0] = objc_msgSend(v21, "CGColor");
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "colorWithAlphaComponent:", 0.0);
    v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v27[1] = objc_msgSend(v23, "CGColor");
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
    v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v27[2] = objc_msgSend(v24, "CGColor");
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
    v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v27[3] = objc_msgSend(v25, "CGColor");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 4);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setColors:", v26);

  }
}

- (void)_setupView
{
  -[SUUIComposeReviewNicknameView _setupTitle](self, "_setupTitle");
  -[SUUIComposeReviewNicknameView _setupSampleCardView](self, "_setupSampleCardView");
  -[SUUIComposeReviewNicknameView _setupTextField](self, "_setupTextField");
  -[SUUIComposeReviewNicknameView _setupInfo](self, "_setupInfo");
}

- (void)_setupTitle
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
  id v25;

  v3 = (void *)objc_opt_new();
  -[SUUIComposeReviewNicknameView setTitleView:](self, "setTitleView:", v3);

  -[SUUIComposeReviewNicknameView titleView](self, "titleView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SUUIFontLimitedPreferredFontForTextStyle(15, 7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v5);

  -[SUUIComposeReviewNicknameView titleView](self, "titleView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNumberOfLines:", 2);

  -[SUUIComposeReviewNicknameView titleView](self, "titleView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[SUUIComposeReviewNicknameView titleView](self, "titleView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIComposeReviewNicknameView addSubview:](self, "addSubview:", v8);

  -[SUUIComposeReviewNicknameView titleView](self, "titleView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstBaselineAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIComposeReviewNicknameView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "topAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:constant:", v12, 61.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setActive:", 1);

  -[SUUIComposeReviewNicknameView titleView](self, "titleView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "leadingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIComposeReviewNicknameView leadingAnchor](self, "leadingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16, 20.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setActive:", 1);

  -[SUUIComposeReviewNicknameView titleView](self, "titleView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "trailingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIComposeReviewNicknameView trailingAnchor](self, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:constant:", v20, -20.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setActive:", 1);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("NICKNAME_VIEW_TITLE"), &stru_2511FF0C8, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIComposeReviewNicknameView titleView](self, "titleView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setText:", v23);

  -[SUUIComposeReviewNicknameView titleView](self, "titleView");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setTextAlignment:", 1);

}

- (void)_setupSampleCardView
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
  SUUIGradientView *v15;
  SUUIGradientView *v16;
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
  id v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  _QWORD v51[5];

  v51[4] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  -[SUUIComposeReviewNicknameView setSampleCardView:](self, "setSampleCardView:", v3);

  -[SUUIComposeReviewNicknameView sampleCardView](self, "sampleCardView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[SUUIComposeReviewNicknameView sampleCardView](self, "sampleCardView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIComposeReviewNicknameView addSubview:](self, "addSubview:", v5);

  -[SUUIComposeReviewNicknameView sampleCardView](self, "sampleCardView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "topAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIComposeReviewNicknameView titleView](self, "titleView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bottomAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:constant:", v9, 24.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setActive:", 1);

  -[SUUIComposeReviewNicknameView sampleCardView](self, "sampleCardView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "centerXAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIComposeReviewNicknameView centerXAnchor](self, "centerXAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setActive:", 1);

  v15 = [SUUIGradientView alloc];
  v16 = -[SUUIGradientView initWithFrame:](v15, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[SUUIComposeReviewNicknameView setSampleCardGradientView:](self, "setSampleCardGradientView:", v16);

  -[SUUIComposeReviewNicknameView sampleCardGradientView](self, "sampleCardGradientView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[SUUIComposeReviewNicknameView sampleCardView](self, "sampleCardView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIComposeReviewNicknameView sampleCardGradientView](self, "sampleCardGradientView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addSubview:", v19);

  -[SUUIComposeReviewNicknameView sampleCardGradientView](self, "sampleCardGradientView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "topAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIComposeReviewNicknameView sampleCardView](self, "sampleCardView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "topAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setActive:", 1);

  -[SUUIComposeReviewNicknameView sampleCardGradientView](self, "sampleCardGradientView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "leadingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIComposeReviewNicknameView sampleCardView](self, "sampleCardView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "leadingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setActive:", 1);

  -[SUUIComposeReviewNicknameView sampleCardGradientView](self, "sampleCardGradientView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "trailingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIComposeReviewNicknameView sampleCardView](self, "sampleCardView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "trailingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setActive:", 1);

  -[SUUIComposeReviewNicknameView sampleCardGradientView](self, "sampleCardGradientView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "bottomAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIComposeReviewNicknameView sampleCardView](self, "sampleCardView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "bottomAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setActive:", 1);

  -[SUUIComposeReviewNicknameView sampleCardGradientView](self, "sampleCardGradientView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "layer");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "colorWithAlphaComponent:", 0.0);
  v43 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v51[0] = objc_msgSend(v43, "CGColor");
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "colorWithAlphaComponent:", 0.0);
  v45 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v51[1] = objc_msgSend(v45, "CGColor");
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v46 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v51[2] = objc_msgSend(v46, "CGColor");
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v47 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v51[3] = objc_msgSend(v47, "CGColor");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v51, 4);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setColors:", v48);

  -[SUUIComposeReviewNicknameView sampleCardGradientView](self, "sampleCardGradientView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "layer");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setLocations:", &unk_2512EEAA8);

}

- (void)_setupTextField
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
  double v45;
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
  double v79;
  void *v80;
  void *v81;
  id v82;

  v3 = (void *)objc_opt_new();
  -[SUUIComposeReviewNicknameView setNicknameBackgroundView:](self, "setNicknameBackgroundView:", v3);

  -[SUUIComposeReviewNicknameView nicknameBackgroundView](self, "nicknameBackgroundView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  objc_msgSend(MEMORY[0x24BEBD4B8], "secondarySystemBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIComposeReviewNicknameView nicknameBackgroundView](self, "nicknameBackgroundView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v5);

  -[SUUIComposeReviewNicknameView nicknameBackgroundView](self, "nicknameBackgroundView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCornerRadius:", 8.0);

  -[SUUIComposeReviewNicknameView nicknameBackgroundView](self, "nicknameBackgroundView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIComposeReviewNicknameView addSubview:](self, "addSubview:", v9);

  -[SUUIComposeReviewNicknameView nicknameBackgroundView](self, "nicknameBackgroundView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "topAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIComposeReviewNicknameView sampleCardView](self, "sampleCardView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:constant:", v13, 20.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setActive:", 1);

  -[SUUIComposeReviewNicknameView nicknameBackgroundView](self, "nicknameBackgroundView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "leadingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIComposeReviewNicknameView leadingAnchor](self, "leadingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:constant:", v17, 20.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setActive:", 1);

  -[SUUIComposeReviewNicknameView nicknameBackgroundView](self, "nicknameBackgroundView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIComposeReviewNicknameView trailingAnchor](self, "trailingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:constant:", v21, -20.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setActive:", 1);

  v23 = (void *)objc_opt_new();
  -[SUUIComposeReviewNicknameView setNicknamePlaceholderLabel:](self, "setNicknamePlaceholderLabel:", v23);

  -[SUUIComposeReviewNicknameView nicknamePlaceholderLabel](self, "nicknamePlaceholderLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[SUUIComposeReviewNicknameView nicknameBackgroundView](self, "nicknameBackgroundView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIComposeReviewNicknameView nicknamePlaceholderLabel](self, "nicknamePlaceholderLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addSubview:", v26);

  -[SUUIComposeReviewNicknameView nicknamePlaceholderLabel](self, "nicknamePlaceholderLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  SUUIFontLimitedPreferredFontForTextStyle(3, 7);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setFont:", v28);

  -[SUUIComposeReviewNicknameView nicknamePlaceholderLabel](self, "nicknamePlaceholderLabel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "leadingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIComposeReviewNicknameView nicknameBackgroundView](self, "nicknameBackgroundView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "leadingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:constant:", v32, 20.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setActive:", 1);

  -[SUUIComposeReviewNicknameView nicknamePlaceholderLabel](self, "nicknamePlaceholderLabel");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "topAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIComposeReviewNicknameView nicknameBackgroundView](self, "nicknameBackgroundView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "topAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:constant:", v37, 18.0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setActive:", 1);

  -[SUUIComposeReviewNicknameView nicknamePlaceholderLabel](self, "nicknamePlaceholderLabel");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "bottomAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIComposeReviewNicknameView nicknameBackgroundView](self, "nicknameBackgroundView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "bottomAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:constant:", v42, -18.0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setActive:", 1);

  -[SUUIComposeReviewNicknameView nicknamePlaceholderLabel](self, "nicknamePlaceholderLabel");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v45) = 1148846080;
  objc_msgSend(v44, "setContentHuggingPriority:forAxis:", 0, v45);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "localizedStringForKey:value:table:", CFSTR("NICKNAME_VIEW_PLACEHOLDER"), &stru_2511FF0C8, 0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIComposeReviewNicknameView nicknamePlaceholderLabel](self, "nicknamePlaceholderLabel");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setText:", v47);

  v49 = (void *)objc_opt_new();
  -[SUUIComposeReviewNicknameView setNicknameTextfield:](self, "setNicknameTextfield:", v49);

  -[SUUIComposeReviewNicknameView nicknameTextfield](self, "nicknameTextfield");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[SUUIComposeReviewNicknameView nicknameBackgroundView](self, "nicknameBackgroundView");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIComposeReviewNicknameView nicknameTextfield](self, "nicknameTextfield");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "addSubview:", v52);

  -[SUUIComposeReviewNicknameView nicknameTextfield](self, "nicknameTextfield");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "firstBaselineAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIComposeReviewNicknameView nicknamePlaceholderLabel](self, "nicknamePlaceholderLabel");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "firstBaselineAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "constraintEqualToAnchor:", v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setActive:", 1);

  -[SUUIComposeReviewNicknameView nicknameTextfield](self, "nicknameTextfield");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "topAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIComposeReviewNicknameView nicknameBackgroundView](self, "nicknameBackgroundView");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "topAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "constraintEqualToAnchor:", v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setActive:", 1);

  -[SUUIComposeReviewNicknameView nicknameTextfield](self, "nicknameTextfield");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "leadingAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIComposeReviewNicknameView nicknamePlaceholderLabel](self, "nicknamePlaceholderLabel");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "trailingAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "constraintEqualToAnchor:constant:", v66, 20.0);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "setActive:", 1);

  -[SUUIComposeReviewNicknameView nicknameTextfield](self, "nicknameTextfield");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "trailingAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIComposeReviewNicknameView nicknameBackgroundView](self, "nicknameBackgroundView");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "trailingAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "constraintEqualToAnchor:constant:", v71, -16.0);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setActive:", 1);

  -[SUUIComposeReviewNicknameView nicknameTextfield](self, "nicknameTextfield");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "bottomAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIComposeReviewNicknameView nicknameBackgroundView](self, "nicknameBackgroundView");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "bottomAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "constraintEqualToAnchor:", v76);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "setActive:", 1);

  -[SUUIComposeReviewNicknameView nicknameTextfield](self, "nicknameTextfield");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v79) = 1132068864;
  objc_msgSend(v78, "setContentCompressionResistancePriority:forAxis:", 0, v79);

  -[SUUIComposeReviewNicknameView nicknameTextfield](self, "nicknameTextfield");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "setClearButtonMode:", 1);

  -[SUUIComposeReviewNicknameView nicknameTextfield](self, "nicknameTextfield");
  v82 = (id)objc_claimAutoreleasedReturnValue();
  SUUIFontLimitedPreferredFontForTextStyle(1, 7);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setFont:", v81);

}

- (void)_setupInfo
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
  id v31;

  v3 = (void *)objc_opt_new();
  -[SUUIComposeReviewNicknameView setNicknameInfoLabel:](self, "setNicknameInfoLabel:", v3);

  -[SUUIComposeReviewNicknameView nicknameInfoLabel](self, "nicknameInfoLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[SUUIComposeReviewNicknameView nicknameInfoLabel](self, "nicknameInfoLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIComposeReviewNicknameView addSubview:](self, "addSubview:", v5);

  -[SUUIComposeReviewNicknameView nicknameInfoLabel](self, "nicknameInfoLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  SUUIFontLimitedPreferredFontForTextStyle(11, 7);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v7);

  -[SUUIComposeReviewNicknameView nicknameInfoLabel](self, "nicknameInfoLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextColor:", v9);

  -[SUUIComposeReviewNicknameView nicknameInfoLabel](self, "nicknameInfoLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "leadingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIComposeReviewNicknameView leadingAnchor](self, "leadingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12, 40.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setActive:", 1);

  -[SUUIComposeReviewNicknameView nicknameInfoLabel](self, "nicknameInfoLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "trailingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIComposeReviewNicknameView trailingAnchor](self, "trailingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16, -40.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setActive:", 1);

  -[SUUIComposeReviewNicknameView nicknameInfoLabel](self, "nicknameInfoLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "firstBaselineAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIComposeReviewNicknameView nicknameBackgroundView](self, "nicknameBackgroundView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bottomAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:constant:", v21, 24.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setActive:", 1);

  -[SUUIComposeReviewNicknameView nicknameInfoLabel](self, "nicknameInfoLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "bottomAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIComposeReviewNicknameView bottomAnchor](self, "bottomAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:constant:", v25, -20.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setActive:", 1);

  -[SUUIComposeReviewNicknameView nicknameInfoLabel](self, "nicknameInfoLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setNumberOfLines:", 3);

  -[SUUIComposeReviewNicknameView nicknameInfoLabel](self, "nicknameInfoLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setTextAlignment:", 1);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v31 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("NICKNAME_VIEW_MESSAGE"), &stru_2511FF0C8, 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIComposeReviewNicknameView nicknameInfoLabel](self, "nicknameInfoLabel");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setText:", v29);

}

- (UITextField)nicknameTextfield
{
  return self->_nicknameTextfield;
}

- (void)setNicknameTextfield:(id)a3
{
  objc_storeStrong((id *)&self->_nicknameTextfield, a3);
}

- (UILabel)nicknameInfoLabel
{
  return self->_nicknameInfoLabel;
}

- (void)setNicknameInfoLabel:(id)a3
{
  objc_storeStrong((id *)&self->_nicknameInfoLabel, a3);
}

- (UILabel)titleView
{
  return self->_titleView;
}

- (void)setTitleView:(id)a3
{
  objc_storeStrong((id *)&self->_titleView, a3);
}

- (UILabel)nicknamePlaceholderLabel
{
  return self->_nicknamePlaceholderLabel;
}

- (void)setNicknamePlaceholderLabel:(id)a3
{
  objc_storeStrong((id *)&self->_nicknamePlaceholderLabel, a3);
}

- (SUUIComposeReviewSampleCardView)sampleCardView
{
  return self->_sampleCardView;
}

- (void)setSampleCardView:(id)a3
{
  objc_storeStrong((id *)&self->_sampleCardView, a3);
}

- (SUUIGradientView)sampleCardGradientView
{
  return self->_sampleCardGradientView;
}

- (void)setSampleCardGradientView:(id)a3
{
  objc_storeStrong((id *)&self->_sampleCardGradientView, a3);
}

- (UIView)nicknameBackgroundView
{
  return self->_nicknameBackgroundView;
}

- (void)setNicknameBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_nicknameBackgroundView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nicknameBackgroundView, 0);
  objc_storeStrong((id *)&self->_sampleCardGradientView, 0);
  objc_storeStrong((id *)&self->_sampleCardView, 0);
  objc_storeStrong((id *)&self->_nicknamePlaceholderLabel, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_nicknameInfoLabel, 0);
  objc_storeStrong((id *)&self->_nicknameTextfield, 0);
}

@end

@implementation HROnboardingBulletPointViewController

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HROnboardingBulletPointViewController;
  -[HROnboardingBulletPointViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[HROnboardingBulletPointViewController _setUpButtonFooterView](self, "_setUpButtonFooterView");
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HROnboardingBulletPointViewController;
  -[HROnboardingBulletPointViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[HROnboardingBulletPointViewController _adjustButtonFooterViewLocationForViewContentHeight](self, "_adjustButtonFooterViewLocationForViewContentHeight");
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HROnboardingBulletPointViewController;
  -[HROnboardingBulletPointViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[HROnboardingBulletPointViewController _adjustButtonFooterViewLocationForViewContentHeight](self, "_adjustButtonFooterViewLocationForViewContentHeight");
}

- (void)updateUserInterfaceForStyle:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v15.receiver = self;
  v15.super_class = (Class)HROnboardingBulletPointViewController;
  -[HROnboardingBulletPointViewController updateUserInterfaceForStyle:](&v15, sel_updateUserInterfaceForStyle_, a3);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[HROnboardingBulletPointViewController bulletPointBodyLabels](self, "bulletPointBodyLabels", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
        objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setTextColor:", v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v6);
  }

}

- (void)setUpUI
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
  id v14;
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
  objc_super v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x24BDAC8D0];
  v36.receiver = self;
  v36.super_class = (Class)HROnboardingBulletPointViewController;
  -[HROnboardingBulletPointViewController setUpUI](&v36, sel_setUpUI);
  v3 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  -[HROnboardingBulletPointViewController setTitleLabel:](self, "setTitleLabel:", v3);

  -[HROnboardingBulletPointViewController titleString](self, "titleString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingBulletPointViewController titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

  -[HROnboardingBulletPointViewController titleLabel](self, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextAlignment:", 1);

  -[HROnboardingBulletPointViewController titleFont](self, "titleFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingBulletPointViewController titleLabel](self, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v7);

  -[HROnboardingBulletPointViewController titleLabel](self, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HROnboardingBulletPointViewController titleLabel](self, "titleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setNumberOfLines:", 0);

  -[HROnboardingBulletPointViewController contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingBulletPointViewController titleLabel](self, "titleLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v12);

  -[HROnboardingBulletPointViewController bodyString](self, "bodyString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = objc_alloc_init(MEMORY[0x24BDF6B68]);
    -[HROnboardingBulletPointViewController setBodyLabel:](self, "setBodyLabel:", v14);

    -[HROnboardingBulletPointViewController bodyString](self, "bodyString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingBulletPointViewController bodyLabel](self, "bodyLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setText:", v15);

    -[HROnboardingBulletPointViewController bodyLabel](self, "bodyLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTextAlignment:", 1);

    -[HROnboardingBulletPointViewController _bodyFont](self, "_bodyFont");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingBulletPointViewController bodyLabel](self, "bodyLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setFont:", v18);

    -[HROnboardingBulletPointViewController bodyLabel](self, "bodyLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setAdjustsFontForContentSizeCategory:", 1);

    -[HROnboardingBulletPointViewController bodyLabel](self, "bodyLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HROnboardingBulletPointViewController bodyLabel](self, "bodyLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setNumberOfLines:", 0);

    -[HROnboardingBulletPointViewController contentView](self, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingBulletPointViewController bodyLabel](self, "bodyLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addSubview:", v24);

  }
  v25 = objc_alloc_init(MEMORY[0x24BDF6DD0]);
  -[HROnboardingBulletPointViewController setBulletPointsView:](self, "setBulletPointsView:", v25);

  -[HROnboardingBulletPointViewController bulletPointsView](self, "bulletPointsView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setAxis:", 1);

  -[HROnboardingBulletPointViewController bulletPointsView](self, "bulletPointsView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HROnboardingBulletPointViewController contentView](self, "contentView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingBulletPointViewController bulletPointsView](self, "bulletPointsView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addSubview:", v29);

  -[HROnboardingBulletPointViewController _setupBulletPointViews](self, "_setupBulletPointViews");
  -[HROnboardingBulletPointViewController buttonTitleString](self, "buttonTitleString");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v30;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  +[HRStackedButtonView buddyStackedButtonViewWithTitles:footerText:boldFooterText:delegate:](HRStackedButtonView, "buddyStackedButtonViewWithTitles:footerText:boldFooterText:delegate:", v31, 0, 0, self);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingBulletPointViewController setStackedButtonView:](self, "setStackedButtonView:", v32);

  -[HROnboardingBulletPointViewController stackedButtonView](self, "stackedButtonView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setBlurHidden:", 1);

  -[HROnboardingBulletPointViewController stackedButtonView](self, "stackedButtonView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setFixedBottomButtonSpacing:", 1);

  -[HROnboardingBulletPointViewController stackedButtonView](self, "stackedButtonView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

}

- (void)_setupBulletPointViews
{
  void *v3;
  HRImageLabel *v4;
  uint64_t i;
  void *v6;
  HRImageLabel *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  HRImageLabel *v14;
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
  HRImageLabel *v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id obj;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingBulletPointViewController setBulletPointBodyLabels:](self, "setBulletPointBodyLabels:", v3);

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  -[HROnboardingBulletPointViewController bulletPoints](self, "bulletPoints");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  v4 = 0;
  if (v40)
  {
    v39 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v40; ++i)
      {
        if (*(_QWORD *)v42 != v39)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        v7 = [HRImageLabel alloc];
        objc_msgSend(v6, "bulletImage");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[HROnboardingBulletPointViewController _bulletImageSize](self, "_bulletImageSize");
        v10 = v9;
        v12 = v11;
        objc_msgSend(v6, "bulletTitleString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[HRImageLabel initWithImage:size:text:](v7, "initWithImage:size:text:", v8, v13, v10, v12);

        -[HROnboardingBulletPointViewController _boldSubheadlineFont](self, "_boldSubheadlineFont");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[HRImageLabel textLabel](v14, "textLabel");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setFont:", v15);

        -[HRImageLabel setImageAlignment:](v14, "setImageAlignment:", 2);
        -[HRImageLabel setTranslatesAutoresizingMaskIntoConstraints:](v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        -[HROnboardingBulletPointViewController contentView](self, "contentView");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addSubview:", v14);

        -[HROnboardingBulletPointViewController titleLabel](self, "titleLabel");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HRImageLabel hk_alignHorizontalConstraintsWithView:margin:](v14, "hk_alignHorizontalConstraintsWithView:margin:", v18, 0.0);

        if (v4)
        {
          -[HRImageLabel textLabel](v14, "textLabel");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "topAnchor");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[HRImageLabel bottomAnchor](v4, "bottomAnchor");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "constraintEqualToAnchor:constant:", v21, 26.0);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setActive:", 1);
        }
        else
        {
          -[HROnboardingBulletPointViewController bodyString](self, "bodyString");
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          -[HRImageLabel textLabel](v14, "textLabel");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "topAnchor");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23)
            -[HROnboardingBulletPointViewController bodyLabel](self, "bodyLabel");
          else
            -[HROnboardingBulletPointViewController titleLabel](self, "titleLabel");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "bottomAnchor");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "constraintEqualToAnchor:constant:", v22, 37.0);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setActive:", 1);

        }
        v25 = v14;

        objc_msgSend(v6, "bulletBodyString");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "length");

        v4 = v25;
        if (v27)
        {
          v28 = objc_alloc_init(MEMORY[0x24BDF6B68]);
          objc_msgSend(v6, "bulletBodyString");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setText:", v29);

          -[HROnboardingBulletPointViewController _subheadlineFont](self, "_subheadlineFont");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setFont:", v30);

          objc_msgSend(v28, "setAdjustsFontForContentSizeCategory:", 1);
          objc_msgSend(v28, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
          objc_msgSend(v28, "setNumberOfLines:", 0);
          -[HROnboardingBulletPointViewController contentView](self, "contentView");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "addSubview:", v28);

          -[HRImageLabel textLabel](v25, "textLabel");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "hk_alignHorizontalConstraintsWithView:margin:", v32, 0.0);

          objc_msgSend(v28, "firstBaselineAnchor");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[HRImageLabel textLabel](v25, "textLabel");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "lastBaselineAnchor");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          -[HROnboardingBulletPointViewController _cannotDoHeaderLastBaselineToCannotDoBodyFirstBaseline](self, "_cannotDoHeaderLastBaselineToCannotDoBodyFirstBaseline");
          objc_msgSend(v33, "constraintEqualToAnchor:constant:", v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "setActive:", 1);

          v4 = (HRImageLabel *)v28;
          -[HROnboardingBulletPointViewController bulletPointBodyLabels](self, "bulletPointBodyLabels");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "addObject:", v4);

        }
      }
      v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    }
    while (v40);
  }

  -[HROnboardingBulletPointViewController setLastBulletPointView:](self, "setLastBulletPointView:", v4);
}

- (void)setUpConstraints
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
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)HROnboardingBulletPointViewController;
  -[HROnboardingBulletPointViewController setUpConstraints](&v31, sel_setUpConstraints);
  -[HROnboardingBulletPointViewController titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingBulletPointViewController contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HKHealthUIBuddyDirectionalEdgeInsets();
  objc_msgSend(v3, "hrui_alignHorizontalConstraintsWithView:insets:", v4);

  -[HROnboardingBulletPointViewController titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingBulletPointViewController contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "topAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingBulletPointViewController contentTop](self, "contentTop");
  objc_msgSend(v6, "constraintEqualToAnchor:constant:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setActive:", 1);

  -[HROnboardingBulletPointViewController bodyString](self, "bodyString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[HROnboardingBulletPointViewController bodyLabel](self, "bodyLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingBulletPointViewController titleLabel](self, "titleLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "hk_alignHorizontalConstraintsWithView:margin:", v12, 0.0);

    -[HROnboardingBulletPointViewController bodyLabel](self, "bodyLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "topAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingBulletPointViewController titleLabel](self, "titleLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bottomAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:constant:", v16, 15.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setActive:", 1);

    -[HROnboardingBulletPointViewController bulletPointsView](self, "bulletPointsView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "topAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingBulletPointViewController bodyLabel](self, "bodyLabel");
  }
  else
  {
    -[HROnboardingBulletPointViewController bulletPointsView](self, "bulletPointsView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "topAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingBulletPointViewController titleLabel](self, "titleLabel");
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bottomAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:constant:", v21, 37.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setActive:", 1);

  -[HROnboardingBulletPointViewController bulletPointsView](self, "bulletPointsView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingBulletPointViewController titleLabel](self, "titleLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "hk_alignHorizontalConstraintsWithView:margin:", v24, 0.0);

  -[HROnboardingBulletPointViewController contentView](self, "contentView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "bottomAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingBulletPointViewController lastBulletPointView](self, "lastBulletPointView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "bottomAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:constant:", v28, *MEMORY[0x24BE4A138]);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingBulletPointViewController setContentViewBottomConstraint:](self, "setContentViewBottomConstraint:", v29);

  -[HROnboardingBulletPointViewController contentViewBottomConstraint](self, "contentViewBottomConstraint");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setActive:", 1);

}

- (void)stackedButtonView:(id)a3 didTapButtonAtIndex:(int64_t)a4
{
  id v4;

  if (!a4)
  {
    -[HROnboardingBulletPointViewController delegate](self, "delegate", a3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stepForward");

  }
}

- (CGSize)_bulletImageSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 40.0;
  v3 = 40.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_setUpButtonFooterView
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (-[HROnboardingBulletPointViewController isOnboarding](self, "isOnboarding"))
  {
    -[HROnboardingBulletPointViewController stackedButtonView](self, "stackedButtonView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    HKHealthUIBuddyDirectionalEdgeInsets();
    -[HROnboardingBulletPointViewController setFooterView:insets:](self, "setFooterView:insets:", v3);

    -[HROnboardingBulletPointViewController stackedButtonView](self, "stackedButtonView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingBulletPointViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "alignBlurViewHorizontalConstraintsWithView:", v5);

    -[HROnboardingBulletPointViewController stackedButtonView](self, "stackedButtonView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBlurHidden:", 0);

  }
}

- (void)_adjustButtonFooterViewLocationForViewContentHeight
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
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
  _QWORD v44[2];

  v44[1] = *MEMORY[0x24BDAC8D0];
  if (-[HROnboardingBulletPointViewController isOnboarding](self, "isOnboarding"))
  {
    -[HROnboardingBulletPointViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "layoutIfNeeded");

    -[HROnboardingBulletPointViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingBulletPointViewController stackedButtonView](self, "stackedButtonView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "buttons");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "frame");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    -[HROnboardingBulletPointViewController stackedButtonView](self, "stackedButtonView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "convertRect:fromView:", v16, v9, v11, v13, v15);
    v18 = v17;

    -[HROnboardingBulletPointViewController contentView](self, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "frame");
    v21 = v20;
    -[HROnboardingBulletPointViewController view](self, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "safeAreaInsets");
    v24 = v18 - v23;

    if (v21 > v24)
    {
      -[HROnboardingBulletPointViewController removeFooterView](self, "removeFooterView");
      -[HROnboardingBulletPointViewController contentView](self, "contentView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[HROnboardingBulletPointViewController stackedButtonView](self, "stackedButtonView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addSubview:", v26);

      -[HROnboardingBulletPointViewController stackedButtonView](self, "stackedButtonView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setBlurHidden:", 1);

      -[HROnboardingBulletPointViewController stackedButtonView](self, "stackedButtonView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[HROnboardingBulletPointViewController titleLabel](self, "titleLabel");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "hk_alignHorizontalConstraintsWithView:margin:", v29, 0.0);

      -[HROnboardingBulletPointViewController stackedButtonView](self, "stackedButtonView");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "topAnchor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[HROnboardingBulletPointViewController lastBulletPointView](self, "lastBulletPointView");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "bottomAnchor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "constraintEqualToAnchor:constant:", v33, *MEMORY[0x24BE4A258]);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setActive:", 1);

      v35 = (void *)MEMORY[0x24BDD1628];
      -[HROnboardingBulletPointViewController contentViewBottomConstraint](self, "contentViewBottomConstraint");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v44[0] = v36;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v44, 1);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "deactivateConstraints:", v37);

      -[HROnboardingBulletPointViewController setContentViewBottomConstraint:](self, "setContentViewBottomConstraint:", 0);
      -[HROnboardingBulletPointViewController contentView](self, "contentView");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "bottomAnchor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[HROnboardingBulletPointViewController stackedButtonView](self, "stackedButtonView");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "bottomAnchor");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "constraintEqualToAnchor:", v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[HROnboardingBulletPointViewController setContentViewBottomConstraint:](self, "setContentViewBottomConstraint:", v42);

      -[HROnboardingBulletPointViewController contentViewBottomConstraint](self, "contentViewBottomConstraint");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setActive:", 1);

    }
  }
}

- (id)_bodyFont
{
  return (id)objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
}

- (id)_subheadlineFont
{
  return (id)objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF7810]);
}

- (id)_boldSubheadlineFont
{
  return (id)objc_msgSend(MEMORY[0x24BDF6A70], "hk_preferredFontForTextStyle:symbolicTraits:", *MEMORY[0x24BDF7810], 2);
}

- (double)_cannotDoHeaderLastBaselineToCannotDoBodyFirstBaseline
{
  void *v2;
  double v3;
  double v4;

  -[HROnboardingBulletPointViewController _bodyFont](self, "_bodyFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 27.0);
  v4 = v3;

  return v4;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)bodyLabel
{
  return self->_bodyLabel;
}

- (void)setBodyLabel:(id)a3
{
  objc_storeStrong((id *)&self->_bodyLabel, a3);
}

- (UIStackView)bulletPointsView
{
  return self->_bulletPointsView;
}

- (void)setBulletPointsView:(id)a3
{
  objc_storeStrong((id *)&self->_bulletPointsView, a3);
}

- (HRStackedButtonView)stackedButtonView
{
  return self->_stackedButtonView;
}

- (void)setStackedButtonView:(id)a3
{
  objc_storeStrong((id *)&self->_stackedButtonView, a3);
}

- (UIView)lastBulletPointView
{
  return self->_lastBulletPointView;
}

- (void)setLastBulletPointView:(id)a3
{
  objc_storeStrong((id *)&self->_lastBulletPointView, a3);
}

- (NSLayoutConstraint)contentViewBottomConstraint
{
  return self->_contentViewBottomConstraint;
}

- (void)setContentViewBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_contentViewBottomConstraint, a3);
}

- (NSHashTable)bulletPointBodyLabels
{
  return self->_bulletPointBodyLabels;
}

- (void)setBulletPointBodyLabels:(id)a3
{
  objc_storeStrong((id *)&self->_bulletPointBodyLabels, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bulletPointBodyLabels, 0);
  objc_storeStrong((id *)&self->_contentViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_lastBulletPointView, 0);
  objc_storeStrong((id *)&self->_stackedButtonView, 0);
  objc_storeStrong((id *)&self->_bulletPointsView, 0);
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

- (NSString)titleString
{
  NSString *result;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2();
  return result;
}

- (NSString)bodyString
{
  NSString *result;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2();
  return result;
}

- (NSArray)bulletPoints
{
  NSArray *result;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2();
  return result;
}

- (NSString)buttonTitleString
{
  NSString *result;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2();
  return result;
}

@end

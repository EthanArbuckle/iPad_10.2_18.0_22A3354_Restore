@implementation HKOnboardingSetupView

- (HKOnboardingSetupView)initWithFrame:(CGRect)a3
{
  HKOnboardingSetupView *v3;
  void *v4;
  uint64_t v5;
  UIView *heroView;
  UILabel *v7;
  UILabel *titleLabel;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  UILabel *v13;
  UILabel *bodyLabel;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  UIButton *onboardingButton;
  void *v23;
  void *v24;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)HKOnboardingSetupView;
  v3 = -[HKOnboardingSetupView initWithFrame:](&v26, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemGroupedBackgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKOnboardingSetupView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[HKOnboardingSetupView createHeroView](v3, "createHeroView");
    v5 = objc_claimAutoreleasedReturnValue();
    heroView = v3->_heroView;
    v3->_heroView = (UIView *)v5;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_heroView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HKOnboardingSetupView addSubview:](v3, "addSubview:", v3->_heroView);
    v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v7;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v3->_titleLabel, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](v3->_titleLabel, "setTextAlignment:", 4);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_titleLabel, "setTextColor:", v9);

    -[HKOnboardingSetupView titleString](v3, "titleString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v3->_titleLabel, "setText:", v10);

    objc_msgSend(MEMORY[0x1E0CB3940], "healthAccessibilityIdentifier:suffix:", -[HKOnboardingSetupView accessibilityGroupID](v3, "accessibilityGroupID"), CFSTR("Welcome.SetupTitle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setAccessibilityIdentifier:](v3->_titleLabel, "setAccessibilityIdentifier:", v11);

    objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontForTextStyle:symbolicTraits:", *MEMORY[0x1E0DC4B58], 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_titleLabel, "setFont:", v12);

    -[UILabel setAdjustsFontForContentSizeCategory:](v3->_titleLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[HKOnboardingSetupView addSubview:](v3, "addSubview:", v3->_titleLabel);
    v13 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    bodyLabel = v3->_bodyLabel;
    v3->_bodyLabel = v13;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_bodyLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v3->_bodyLabel, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](v3->_bodyLabel, "setTextAlignment:", 4);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_bodyLabel, "setTextColor:", v15);

    -[HKOnboardingSetupView bodyString](v3, "bodyString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v3->_bodyLabel, "setText:", v16);

    objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_bodyLabel, "setFont:", v17);

    -[UILabel setAdjustsFontForContentSizeCategory:](v3->_bodyLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[HKOnboardingSetupView addSubview:](v3, "addSubview:", v3->_bodyLabel);
    v18 = (void *)MEMORY[0x1E0DC3518];
    HKHealthKeyColor();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKOnboardingSetupView buttonTitleString](v3, "buttonTitleString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "hk_multiLineRoundRectButtonTintedWithColor:title:target:action:", v19, v20, v3, sel__didTapOnboardingButton);
    v21 = objc_claimAutoreleasedReturnValue();
    onboardingButton = v3->_onboardingButton;
    v3->_onboardingButton = (UIButton *)v21;

    objc_msgSend(MEMORY[0x1E0CB3940], "healthAccessibilityIdentifier:suffix:", -[HKOnboardingSetupView accessibilityGroupID](v3, "accessibilityGroupID"), CFSTR("Welcome.SetupButton"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setAccessibilityIdentifier:](v3->_onboardingButton, "setAccessibilityIdentifier:", v23);

    -[UIButton layer](v3->_onboardingButton, "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setCornerRadius:", 8.0);

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v3->_onboardingButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HKOnboardingSetupView addSubview:](v3, "addSubview:", v3->_onboardingButton);
    -[HKOnboardingSetupView _setUpConstraints](v3, "_setUpConstraints");
  }
  return v3;
}

- (void)_setUpConstraints
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
  id v53;

  -[HKOnboardingSetupView heroView](self, "heroView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "centerXAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOnboardingSetupView centerXAnchor](self, "centerXAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActive:", 1);

  -[HKOnboardingSetupView heroView](self, "heroView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "topAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOnboardingSetupView topAnchor](self, "topAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:constant:", v9, 16.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setActive:", 1);

  -[HKOnboardingSetupView titleLabel](self, "titleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "topAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOnboardingSetupView heroView](self, "heroView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:constant:", v14, 17.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setActive:", 1);

  -[HKOnboardingSetupView titleLabel](self, "titleLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "leadingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOnboardingSetupView leadingAnchor](self, "leadingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:constant:", v18, 16.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setActive:", 1);

  -[HKOnboardingSetupView titleLabel](self, "titleLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "trailingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOnboardingSetupView trailingAnchor](self, "trailingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:constant:", v22, -16.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setActive:", 1);

  -[HKOnboardingSetupView bodyLabel](self, "bodyLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "topAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOnboardingSetupView titleLabel](self, "titleLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "bottomAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:constant:", v27, 2.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setActive:", 1);

  -[HKOnboardingSetupView bodyLabel](self, "bodyLabel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "leadingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOnboardingSetupView leadingAnchor](self, "leadingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:constant:", v31, 16.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setActive:", 1);

  -[HKOnboardingSetupView bodyLabel](self, "bodyLabel");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "trailingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOnboardingSetupView trailingAnchor](self, "trailingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:constant:", v35, -16.0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setActive:", 1);

  -[HKOnboardingSetupView onboardingButton](self, "onboardingButton");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "topAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOnboardingSetupView bodyLabel](self, "bodyLabel");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "bottomAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:constant:", v40, 17.0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setActive:", 1);

  -[HKOnboardingSetupView onboardingButton](self, "onboardingButton");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "leadingAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOnboardingSetupView leadingAnchor](self, "leadingAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:constant:", v44, 16.0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setActive:", 1);

  -[HKOnboardingSetupView onboardingButton](self, "onboardingButton");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "trailingAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOnboardingSetupView trailingAnchor](self, "trailingAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:constant:", v48, -16.0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setActive:", 1);

  -[HKOnboardingSetupView onboardingButton](self, "onboardingButton");
  v53 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "bottomAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOnboardingSetupView bottomAnchor](self, "bottomAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToAnchor:constant:", v51, -16.0);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setActive:", 1);

}

- (void)_didTapOnboardingButton
{
  id v3;

  -[HKOnboardingSetupView delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "beginOnboardingForOnboardingSetupView:", self);

}

- (HKOnboardingSetupViewDelegate)delegate
{
  return (HKOnboardingSetupViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIView)heroView
{
  return self->_heroView;
}

- (void)setHeroView:(id)a3
{
  objc_storeStrong((id *)&self->_heroView, a3);
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

- (UIButton)onboardingButton
{
  return self->_onboardingButton;
}

- (void)setOnboardingButton:(id)a3
{
  objc_storeStrong((id *)&self->_onboardingButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onboardingButton, 0);
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_heroView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (id)createHeroView
{
  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_1_6();
  return objc_alloc_init(MEMORY[0x1E0DC3F10]);
}

- (NSString)titleString
{
  NSString *result;

  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_2_3();
  return result;
}

- (NSString)bodyString
{
  NSString *result;

  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_2_3();
  return result;
}

- (NSString)buttonTitleString
{
  NSString *result;

  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_2_3();
  return result;
}

- (int64_t)accessibilityGroupID
{
  int64_t result;

  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_2_3();
  return result;
}

@end

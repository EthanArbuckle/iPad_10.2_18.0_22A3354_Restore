@implementation HRStackedButtonView

- (HRStackedButtonView)initWithButtonTitles:(id)a3 styles:(id)a4 footerText:(id)a5 boldFooterText:(id)a6 footerTextAlignment:(int64_t)a7 delegate:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  HRStackedButtonView *v19;
  HRStackedButtonView *v20;
  id v22;
  objc_super v23;

  v22 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  v23.receiver = self;
  v23.super_class = (Class)HRStackedButtonView;
  v19 = -[HRStackedButtonView initWithFrame:](&v23, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_titles, a3);
    objc_storeStrong((id *)&v20->_styles, a4);
    objc_storeStrong((id *)&v20->_footerText, a5);
    objc_storeStrong((id *)&v20->_boldFooterText, a6);
    v20->_footerTextAlignment = a7;
    objc_storeWeak((id *)&v20->_delegate, v18);
    -[HRStackedButtonView _setUpBlurEffect](v20, "_setUpBlurEffect");
    -[HRStackedButtonView _setUpButtons](v20, "_setUpButtons");
  }

  return v20;
}

+ (id)buddyStackedButtonViewWithTitles:(id)a3 footerText:(id)a4 boldFooterText:(id)a5 delegate:(id)a6
{
  return (id)objc_msgSend(a1, "buddyStackedButtonViewWithTitles:footerText:boldFooterText:footerTextAlignment:delegate:", a3, a4, a5, 4, a6);
}

+ (id)buddyStackedButtonViewWithTitles:(id)a3 footerText:(id)a4 boldFooterText:(id)a5 footerTextAlignment:(int64_t)a6 delegate:(id)a7
{
  objc_class *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  _QWORD v20[4];
  id v21;

  v11 = (objc_class *)MEMORY[0x24BDBCEB8];
  v12 = a7;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = objc_alloc_init(v11);
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __111__HRStackedButtonView_buddyStackedButtonViewWithTitles_footerText_boldFooterText_footerTextAlignment_delegate___block_invoke;
  v20[3] = &unk_24D34ADD8;
  v21 = v16;
  v17 = v16;
  objc_msgSend(v15, "enumerateObjectsUsingBlock:", v20);
  v18 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithButtonTitles:styles:footerText:boldFooterText:footerTextAlignment:delegate:", v15, v17, v14, v13, a6, v12);

  return v18;
}

uint64_t __111__HRStackedButtonView_buddyStackedButtonViewWithTitles_footerText_boldFooterText_footerTextAlignment_delegate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v4;

  v3 = *(void **)(a1 + 32);
  if (a3)
    v4 = &unk_24D357F40;
  else
    v4 = &unk_24D357F28;
  return objc_msgSend(v3, "addObject:", v4);
}

- (void)setLastButtonMode:(int64_t)a3
{
  if (self->_lastButtonMode != a3)
  {
    self->_lastButtonMode = a3;
    -[HRStackedButtonView _updateBottomConstraint](self, "_updateBottomConstraint");
  }
}

- (void)setFixedBottomButtonSpacing:(BOOL)a3
{
  if (self->_fixedBottomButtonSpacing != a3)
  {
    self->_fixedBottomButtonSpacing = a3;
    -[HRStackedButtonView _updateBottomConstraint](self, "_updateBottomConstraint");
  }
}

- (void)setBlurHidden:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  self->_blurHidden = a3;
  -[HRStackedButtonView backgroundBlurView](self, "backgroundBlurView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", v3);

  if (v3)
    objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
  else
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[HRStackedButtonView setBackgroundColor:](self, "setBackgroundColor:", v6);

}

- (void)alignBlurViewHorizontalConstraintsWithView:(id)a3
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HRStackedButtonView backgroundBlurViewLeadingConstraint](self, "backgroundBlurViewLeadingConstraint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDD1628];
    -[HRStackedButtonView backgroundBlurViewLeadingConstraint](self, "backgroundBlurViewLeadingConstraint");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deactivateConstraints:", v8);

    -[HRStackedButtonView setBackgroundBlurViewLeadingConstraint:](self, "setBackgroundBlurViewLeadingConstraint:", 0);
  }
  -[HRStackedButtonView backgroundBlurViewTrailingConstraint](self, "backgroundBlurViewTrailingConstraint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)MEMORY[0x24BDD1628];
    -[HRStackedButtonView backgroundBlurViewTrailingConstraint](self, "backgroundBlurViewTrailingConstraint");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v23, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "deactivateConstraints:", v12);

    -[HRStackedButtonView setBackgroundBlurViewTrailingConstraint:](self, "setBackgroundBlurViewTrailingConstraint:", 0);
  }
  -[HRStackedButtonView backgroundBlurView](self, "backgroundBlurView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "leadingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leadingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRStackedButtonView setBackgroundBlurViewLeadingConstraint:](self, "setBackgroundBlurViewLeadingConstraint:", v16);

  -[HRStackedButtonView backgroundBlurView](self, "backgroundBlurView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trailingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "constraintEqualToAnchor:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRStackedButtonView setBackgroundBlurViewTrailingConstraint:](self, "setBackgroundBlurViewTrailingConstraint:", v20);

  -[HRStackedButtonView backgroundBlurViewLeadingConstraint](self, "backgroundBlurViewLeadingConstraint");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setActive:", 1);

  -[HRStackedButtonView backgroundBlurViewTrailingConstraint](self, "backgroundBlurViewTrailingConstraint");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setActive:", 1);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HRStackedButtonView;
  -[HRStackedButtonView traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  if (v4)
  {
    -[HRStackedButtonView traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredContentSizeCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if ((v8 & 1) == 0)
      -[HRStackedButtonView _updateForCurrentSizeCategory](self, "_updateForCurrentSizeCategory");
  }

}

- (void)actionButtonTapped:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  -[HRStackedButtonView delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "tag");

  objc_msgSend(v6, "stackedButtonView:didTapButtonAtIndex:", self, v5);
}

+ (double)topPadding
{
  return 24.0;
}

- (void)_setUpButtons
{
  void *v3;

  -[HRStackedButtonView _createButtons](self, "_createButtons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRStackedButtonView setButtons:](self, "setButtons:", v3);

  -[HRStackedButtonView _setUpFooterText](self, "_setUpFooterText");
  -[HRStackedButtonView _assignConstraintsForButtons](self, "_assignConstraintsForButtons");
  -[HRStackedButtonView _createViewBottomConstraint](self, "_createViewBottomConstraint");
  -[HRStackedButtonView _updateBottomConstraint](self, "_updateBottomConstraint");
}

- (void)_setUpBlurEffect
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BDF6878], "effectWithStyle:", 10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRStackedButtonView setBackgroundBlurEffect:](self, "setBackgroundBlurEffect:", v3);

  v4 = objc_alloc(MEMORY[0x24BDF6FC8]);
  -[HRStackedButtonView backgroundBlurEffect](self, "backgroundBlurEffect");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithEffect:", v5);
  -[HRStackedButtonView setBackgroundBlurView:](self, "setBackgroundBlurView:", v6);

  -[HRStackedButtonView backgroundBlurView](self, "backgroundBlurView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HRStackedButtonView backgroundBlurView](self, "backgroundBlurView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRStackedButtonView addSubview:](self, "addSubview:", v8);

  -[HRStackedButtonView backgroundBlurView](self, "backgroundBlurView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hk_alignVerticalConstraintsWithView:margin:", self, 0.0);

  -[HRStackedButtonView alignBlurViewHorizontalConstraintsWithView:](self, "alignBlurViewHorizontalConstraintsWithView:", self);
  -[HRStackedButtonView setBlurHidden:](self, "setBlurHidden:", 0);
}

- (id)_createButtons
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRStackedButtonView titles](self, "titles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __37__HRStackedButtonView__createButtons__block_invoke;
  v9[3] = &unk_24D34AE00;
  v9[4] = self;
  v5 = v3;
  v10 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);

  v6 = v10;
  v7 = v5;

  return v7;
}

void __37__HRStackedButtonView__createButtons__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a2;
  objc_msgSend(*(id *)(a1 + 32), "styles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  if (v7 == 1)
  {
    v11 = (void *)MEMORY[0x24BDF6880];
    objc_msgSend(MEMORY[0x24BDF6950], "hk_appKeyColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "hk_multiLineRoundRectButtonTintedWithColor:title:target:action:", v9, v16, *(_QWORD *)(a1 + 32), sel_actionButtonTapped_);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v7)
    {
      v12 = 0;
      goto LABEL_7;
    }
    v8 = (void *)MEMORY[0x24BDF6880];
    objc_msgSend(MEMORY[0x24BDF6950], "hk_appKeyColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hk_buttonTintedWithColor:title:target:action:", v9, v16, *(_QWORD *)(a1 + 32), sel_actionButtonTapped_);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v10;

LABEL_7:
  objc_msgSend(v12, "titleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAdjustsFontForContentSizeCategory:", 1);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Button.%@"), v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "healthAccessibilityIdentifier:suffix:", 0, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAccessibilityIdentifier:", v15);

  objc_msgSend(v12, "setTag:", a3);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v12);
  objc_msgSend(*(id *)(a1 + 32), "addSubview:", v12);

}

- (void)_setUpFooterText
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  -[HRStackedButtonView footerText](self, "footerText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDF6B68]);
    -[HRStackedButtonView setFooterTextLabel:](self, "setFooterTextLabel:", v4);

    -[HRStackedButtonView _attributedFooterText](self, "_attributedFooterText");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HRStackedButtonView footerTextLabel](self, "footerTextLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAttributedText:", v5);

    -[HRStackedButtonView footerTextLabel](self, "footerTextLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAdjustsFontForContentSizeCategory:", 1);

    -[HRStackedButtonView footerTextLabel](self, "footerTextLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNumberOfLines:", 0);

    -[HRStackedButtonView footerTextLabel](self, "footerTextLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v10 = -[HRStackedButtonView footerTextAlignment](self, "footerTextAlignment");
    -[HRStackedButtonView footerTextLabel](self, "footerTextLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTextAlignment:", v10);

    -[HRStackedButtonView footerTextLabel](self, "footerTextLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HRStackedButtonView addSubview:](self, "addSubview:", v12);

    -[HRStackedButtonView footerTextLabel](self, "footerTextLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "hk_alignHorizontalConstraintsWithView:margin:", self, 0.0);

    objc_msgSend((id)objc_opt_class(), "_footerTextSpacingForValue:", 30.0);
    -[HRStackedButtonView setFirstTopConstant:](self, "setFirstTopConstant:");
    -[HRStackedButtonView footerTextLabel](self, "footerTextLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstBaselineAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HRStackedButtonView topAnchor](self, "topAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HRStackedButtonView firstTopConstant](self, "firstTopConstant");
    objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setActive:", 1);

    -[HRStackedButtonView footerTextLabel](self, "footerTextLabel");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "lastBaselineAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HRStackedButtonView setFirstTopAnchor:](self, "setFirstTopAnchor:", v18);

  }
  else
  {
    -[HRStackedButtonView topAnchor](self, "topAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HRStackedButtonView setFirstTopAnchor:](self, "setFirstTopAnchor:", v19);

    -[HRStackedButtonView setFirstTopConstant:](self, "setFirstTopConstant:", 0.0);
  }
}

- (void)_assignConstraintsForButtons
{
  void *v3;
  _QWORD v4[5];

  -[HRStackedButtonView buttons](self, "buttons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __51__HRStackedButtonView__assignConstraintsForButtons__block_invoke;
  v4[3] = &unk_24D34AE28;
  v4[4] = self;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v4);

}

void __51__HRStackedButtonView__assignConstraintsForButtons__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  double v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  double v24;
  id v25;

  v5 = 0.0;
  v25 = a2;
  objc_msgSend(v25, "hk_alignHorizontalConstraintsWithView:margin:", *(_QWORD *)(a1 + 32), 0.0);
  v6 = *(void **)(a1 + 32);
  if (!a3)
  {
    objc_msgSend(v6, "styles");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "integerValue");

    if (v16 == 1)
    {
      objc_msgSend(v25, "topAnchor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "firstTopConstant");
      if (v24 == 0.0)
      {
        v5 = 24.0;
        goto LABEL_23;
      }
      objc_msgSend(*(id *)(a1 + 32), "firstTopConstant");
    }
    else
    {
      if (v16)
      {
        v8 = 0;
        goto LABEL_23;
      }
      objc_msgSend(v25, "firstBaselineAnchor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "_buttonSpacingForValue:", 32.0);
    }
    v5 = v17;
LABEL_23:
    objc_msgSend(*(id *)(a1 + 32), "firstTopAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:constant:", v12, v5);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setActive:", 1);
    goto LABEL_24;
  }
  objc_msgSend(v6, "buttons");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a3 - 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "styles");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", a3 - 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "integerValue");

  if (v11 == 1)
  {
    objc_msgSend(v8, "bottomAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(double *)&v13 = 36.0;
    goto LABEL_9;
  }
  if (!v11)
  {
    objc_msgSend(v8, "lastBaselineAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(double *)&v13 = 44.0;
LABEL_9:
    v5 = *(double *)&v13;
    goto LABEL_11;
  }
  v12 = 0;
LABEL_11:
  objc_msgSend(*(id *)(a1 + 32), "styles");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectAtIndexedSubscript:", a3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "integerValue");

  if (v20 == 1)
  {
    objc_msgSend(v25, "bottomAnchor");
    v21 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v20)
    {
      v22 = 0;
      goto LABEL_17;
    }
    objc_msgSend(v25, "lastBaselineAnchor");
    v21 = objc_claimAutoreleasedReturnValue();
  }
  v22 = (void *)v21;
LABEL_17:
  objc_msgSend((id)objc_opt_class(), "_buttonSpacingForValue:", v5);
  objc_msgSend(v22, "constraintEqualToAnchor:constant:", v12);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setActive:", 1);

LABEL_24:
}

- (void)_createViewBottomConstraint
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  -[HRStackedButtonView styles](self, "styles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  if (v5 == 1)
  {
    -[HRStackedButtonView bottomAnchor](self, "bottomAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HRStackedButtonView buttons](self, "buttons");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bottomAnchor");
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (!v5)
  {
    -[HRStackedButtonView bottomAnchor](self, "bottomAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HRStackedButtonView buttons](self, "buttons");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastBaselineAnchor");
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v10 = (void *)v9;
    objc_msgSend(v6, "constraintEqualToAnchor:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HRStackedButtonView setBottomConstraint:](self, "setBottomConstraint:", v11);

  }
  -[HRStackedButtonView bottomConstraint](self, "bottomConstraint");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setActive:", 1);

}

- (void)_updateBottomConstraint
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  double v7;
  int64_t v8;
  double v9;
  double v10;
  id v11;

  -[HRStackedButtonView styles](self, "styles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  if (-[HRStackedButtonView lastButtonMode](self, "lastButtonMode") == 1)
  {
    -[HRStackedButtonView titles](self, "titles");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "count");

  }
  v7 = 0.0;
  if (v5 == 1)
  {
    v8 = -[HRStackedButtonView lastButtonMode](self, "lastButtonMode");
    v9 = 60.0;
    if (v8 != 1)
      v9 = 0.0;
    if (v8)
      v7 = v9;
    else
      v7 = 44.0;
  }
  else if (!v5)
  {
    v7 = 24.0;
  }
  if (!-[HRStackedButtonView fixedBottomButtonSpacing](self, "fixedBottomButtonSpacing"))
  {
    objc_msgSend((id)objc_opt_class(), "_buttonSpacingForValue:", v7);
    v7 = v10;
  }
  -[HRStackedButtonView bottomConstraint](self, "bottomConstraint");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setConstant:", v7);

}

- (void)_updateForCurrentSizeCategory
{
  void *v3;
  void *v4;
  void *v5;

  -[HRStackedButtonView footerText](self, "footerText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HRStackedButtonView _attributedFooterText](self, "_attributedFooterText");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HRStackedButtonView footerTextLabel](self, "footerTextLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAttributedText:", v4);

    -[HRStackedButtonView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (id)_attributedFooterText
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD1688];
  -[HRStackedButtonView footerText](self, "footerText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x24BDF7810];
  objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRStackedButtonView boldFooterText](self, "boldFooterText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hrui_attributedStringForText:style:color:boldText:", v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)firstBaselineAnchor
{
  void *v2;
  void *v3;
  void *v4;

  -[HRStackedButtonView buttons](self, "buttons");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstBaselineAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)lastBaselineAnchor
{
  void *v2;
  void *v3;
  void *v4;

  -[HRStackedButtonView buttons](self, "buttons");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastBaselineAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_footerFontTextStyle
{
  return (id)*MEMORY[0x24BDF7810];
}

+ (id)_footerTextFont
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDF6A70];
  objc_msgSend((id)objc_opt_class(), "_footerFontTextStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredFontForTextStyle:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_footerTextBoldFont
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDF6A70];
  objc_msgSend((id)objc_opt_class(), "_footerFontTextStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_preferredFontForTextStyle:symbolicTraits:", v3, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (double)_footerTextSpacingForValue:(double)a3
{
  void *v4;
  double v5;
  double v6;

  objc_msgSend((id)objc_opt_class(), "_footerTextFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_scaledValueForValue:", a3);
  v6 = v5;

  return v6;
}

+ (double)_buttonSpacingForValue:(double)a3
{
  void *v4;
  double v5;
  double v6;

  objc_msgSend(MEMORY[0x24BDF6A70], "hk_preferredFontForTextStyle:symbolicTraits:", *MEMORY[0x24BDF77B0], 0x8000);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_scaledValueForValue:", a3);
  v6 = v5;

  return v6;
}

- (NSArray)buttons
{
  return self->_buttons;
}

- (void)setButtons:(id)a3
{
  objc_storeStrong((id *)&self->_buttons, a3);
}

- (int64_t)lastButtonMode
{
  return self->_lastButtonMode;
}

- (BOOL)fixedBottomButtonSpacing
{
  return self->_fixedBottomButtonSpacing;
}

- (BOOL)isBlurHidden
{
  return self->_blurHidden;
}

- (NSArray)titles
{
  return self->_titles;
}

- (void)setTitles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 440);
}

- (NSArray)styles
{
  return self->_styles;
}

- (void)setStyles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 448);
}

- (int64_t)buttonMode
{
  return self->_buttonMode;
}

- (void)setButtonMode:(int64_t)a3
{
  self->_buttonMode = a3;
}

- (NSString)footerText
{
  return self->_footerText;
}

- (void)setFooterText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 464);
}

- (NSString)boldFooterText
{
  return self->_boldFooterText;
}

- (void)setBoldFooterText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 472);
}

- (int64_t)footerTextAlignment
{
  return self->_footerTextAlignment;
}

- (void)setFooterTextAlignment:(int64_t)a3
{
  self->_footerTextAlignment = a3;
}

- (UILabel)footerTextLabel
{
  return self->_footerTextLabel;
}

- (void)setFooterTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_footerTextLabel, a3);
}

- (UIBlurEffect)backgroundBlurEffect
{
  return self->_backgroundBlurEffect;
}

- (void)setBackgroundBlurEffect:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundBlurEffect, a3);
}

- (UIView)backgroundBlurView
{
  return self->_backgroundBlurView;
}

- (void)setBackgroundBlurView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundBlurView, a3);
}

- (NSLayoutConstraint)backgroundBlurViewLeadingConstraint
{
  return self->_backgroundBlurViewLeadingConstraint;
}

- (void)setBackgroundBlurViewLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundBlurViewLeadingConstraint, a3);
}

- (NSLayoutConstraint)backgroundBlurViewTrailingConstraint
{
  return self->_backgroundBlurViewTrailingConstraint;
}

- (void)setBackgroundBlurViewTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundBlurViewTrailingConstraint, a3);
}

- (NSLayoutYAxisAnchor)firstTopAnchor
{
  return self->_firstTopAnchor;
}

- (void)setFirstTopAnchor:(id)a3
{
  objc_storeStrong((id *)&self->_firstTopAnchor, a3);
}

- (double)firstTopConstant
{
  return self->_firstTopConstant;
}

- (void)setFirstTopConstant:(double)a3
{
  self->_firstTopConstant = a3;
}

- (NSLayoutConstraint)bottomConstraint
{
  return self->_bottomConstraint;
}

- (void)setBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_bottomConstraint, a3);
}

- (HRStackedButtonViewDelegate)delegate
{
  return (HRStackedButtonViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_bottomConstraint, 0);
  objc_storeStrong((id *)&self->_firstTopAnchor, 0);
  objc_storeStrong((id *)&self->_backgroundBlurViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_backgroundBlurViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_backgroundBlurView, 0);
  objc_storeStrong((id *)&self->_backgroundBlurEffect, 0);
  objc_storeStrong((id *)&self->_footerTextLabel, 0);
  objc_storeStrong((id *)&self->_boldFooterText, 0);
  objc_storeStrong((id *)&self->_footerText, 0);
  objc_storeStrong((id *)&self->_styles, 0);
  objc_storeStrong((id *)&self->_titles, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
}

@end

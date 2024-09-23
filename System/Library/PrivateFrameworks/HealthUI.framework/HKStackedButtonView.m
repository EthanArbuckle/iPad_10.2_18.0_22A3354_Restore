@implementation HKStackedButtonView

- (HKStackedButtonView)initWithButtonTitles:(id)a3 styles:(id)a4 footerText:(id)a5 boldFooterText:(id)a6 footerTextAlignment:(int64_t)a7 delegate:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  HKStackedButtonView *v19;
  HKStackedButtonView *v20;
  uint64_t v21;
  void *v23;
  id v25;
  objc_super v26;

  v15 = a3;
  v16 = a4;
  v25 = a5;
  v17 = a6;
  v18 = a8;
  v26.receiver = self;
  v26.super_class = (Class)HKStackedButtonView;
  v19 = -[HKStackedButtonView initWithFrame:](&v26, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_titles, a3);
    objc_storeStrong((id *)&v20->_styles, a4);
    objc_storeStrong((id *)&v20->_footerText, a5);
    objc_storeStrong((id *)&v20->_boldFooterText, a6);
    v20->_footerTextAlignment = a7;
    v21 = objc_msgSend(v15, "count");
    if (v21 != objc_msgSend(v16, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, v20, CFSTR("HKStackedButtonView.m"), 79, CFSTR("Titles and styles must have equal counts"));

    }
    objc_storeWeak((id *)&v20->_delegate, v18);
    -[HKStackedButtonView _setUpBlurEffect](v20, "_setUpBlurEffect");
    -[HKStackedButtonView _setUpButtons](v20, "_setUpButtons");
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

  v11 = (objc_class *)MEMORY[0x1E0C99DE8];
  v12 = a7;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = objc_alloc_init(v11);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __111__HKStackedButtonView_buddyStackedButtonViewWithTitles_footerText_boldFooterText_footerTextAlignment_delegate___block_invoke;
  v20[3] = &unk_1E9C46600;
  v21 = v16;
  v17 = v16;
  objc_msgSend(v15, "enumerateObjectsUsingBlock:", v20);
  v18 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithButtonTitles:styles:footerText:boldFooterText:footerTextAlignment:delegate:", v15, v17, v14, v13, a6, v12);

  return v18;
}

uint64_t __111__HKStackedButtonView_buddyStackedButtonViewWithTitles_footerText_boldFooterText_footerTextAlignment_delegate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v4;

  v3 = *(void **)(a1 + 32);
  if (a3)
    v4 = &unk_1E9CED3A0;
  else
    v4 = &unk_1E9CED388;
  return objc_msgSend(v3, "addObject:", v4);
}

- (void)setLastButtonMode:(int64_t)a3
{
  if (self->_lastButtonMode != a3)
  {
    self->_lastButtonMode = a3;
    -[HKStackedButtonView _updateBottomConstraint](self, "_updateBottomConstraint");
  }
}

- (void)setBottomAdjustsForHomeButtonlessScreen:(BOOL)a3
{
  if (self->_bottomAdjustsForHomeButtonlessScreen != a3)
  {
    self->_bottomAdjustsForHomeButtonlessScreen = a3;
    -[HKStackedButtonView _updateBottomConstraint](self, "_updateBottomConstraint");
  }
}

- (void)setBlurHidden:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  self->_blurHidden = a3;
  -[HKStackedButtonView backgroundBlurView](self, "backgroundBlurView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", v3);

  if (v3)
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[HKStackedButtonView setBackgroundColor:](self, "setBackgroundColor:", v6);

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

  v24[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HKStackedButtonView backgroundBlurViewLeadingConstraint](self, "backgroundBlurViewLeadingConstraint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB3718];
    -[HKStackedButtonView backgroundBlurViewLeadingConstraint](self, "backgroundBlurViewLeadingConstraint");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deactivateConstraints:", v8);

    -[HKStackedButtonView setBackgroundBlurViewLeadingConstraint:](self, "setBackgroundBlurViewLeadingConstraint:", 0);
  }
  -[HKStackedButtonView backgroundBlurViewTrailingConstraint](self, "backgroundBlurViewTrailingConstraint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)MEMORY[0x1E0CB3718];
    -[HKStackedButtonView backgroundBlurViewTrailingConstraint](self, "backgroundBlurViewTrailingConstraint");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "deactivateConstraints:", v12);

    -[HKStackedButtonView setBackgroundBlurViewTrailingConstraint:](self, "setBackgroundBlurViewTrailingConstraint:", 0);
  }
  -[HKStackedButtonView backgroundBlurView](self, "backgroundBlurView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "leadingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leadingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKStackedButtonView setBackgroundBlurViewLeadingConstraint:](self, "setBackgroundBlurViewLeadingConstraint:", v16);

  -[HKStackedButtonView backgroundBlurView](self, "backgroundBlurView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trailingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "constraintEqualToAnchor:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKStackedButtonView setBackgroundBlurViewTrailingConstraint:](self, "setBackgroundBlurViewTrailingConstraint:", v20);

  -[HKStackedButtonView backgroundBlurViewLeadingConstraint](self, "backgroundBlurViewLeadingConstraint");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setActive:", 1);

  -[HKStackedButtonView backgroundBlurViewTrailingConstraint](self, "backgroundBlurViewTrailingConstraint");
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
  v9.super_class = (Class)HKStackedButtonView;
  -[HKStackedButtonView traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  if (v4)
  {
    -[HKStackedButtonView traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredContentSizeCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if ((v8 & 1) == 0)
      -[HKStackedButtonView _updateForCurrentSizeCategory](self, "_updateForCurrentSizeCategory");
  }

}

- (void)actionButtonTapped:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  -[HKStackedButtonView delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "tag");

  objc_msgSend(v6, "stackedButtonView:didTapButtonAtIndex:", self, v5);
}

- (void)_setUpButtons
{
  void *v3;

  -[HKStackedButtonView _createButtons](self, "_createButtons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKStackedButtonView setButtons:](self, "setButtons:", v3);

  -[HKStackedButtonView _setUpFooterText](self, "_setUpFooterText");
  -[HKStackedButtonView _assignConstraintsForButtons](self, "_assignConstraintsForButtons");
  -[HKStackedButtonView _updateConstraintsForButtons](self, "_updateConstraintsForButtons");
  -[HKStackedButtonView _createViewBottomConstraint](self, "_createViewBottomConstraint");
  -[HKStackedButtonView _updateBottomConstraint](self, "_updateBottomConstraint");
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

  objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKStackedButtonView setBackgroundBlurEffect:](self, "setBackgroundBlurEffect:", v3);

  v4 = objc_alloc(MEMORY[0x1E0DC3F58]);
  -[HKStackedButtonView backgroundBlurEffect](self, "backgroundBlurEffect");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithEffect:", v5);
  -[HKStackedButtonView setBackgroundBlurView:](self, "setBackgroundBlurView:", v6);

  -[HKStackedButtonView backgroundBlurView](self, "backgroundBlurView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HKStackedButtonView backgroundBlurView](self, "backgroundBlurView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKStackedButtonView addSubview:](self, "addSubview:", v8);

  -[HKStackedButtonView backgroundBlurView](self, "backgroundBlurView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hk_alignVerticalConstraintsWithView:margin:", self, 0.0);

  -[HKStackedButtonView alignBlurViewHorizontalConstraintsWithView:](self, "alignBlurViewHorizontalConstraintsWithView:", self);
  -[HKStackedButtonView setBlurHidden:](self, "setBlurHidden:", 0);
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

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKStackedButtonView titles](self, "titles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __37__HKStackedButtonView__createButtons__block_invoke;
  v9[3] = &unk_1E9C44B80;
  v9[4] = self;
  v5 = v3;
  v10 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);

  v6 = v10;
  v7 = v5;

  return v7;
}

void __37__HKStackedButtonView__createButtons__block_invoke(uint64_t a1, void *a2, uint64_t a3)
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
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(a1 + 32), "styles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  if (v7 == 1)
  {
    v11 = (void *)MEMORY[0x1E0DC3518];
    objc_msgSend(MEMORY[0x1E0DC3658], "hk_appKeyColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "hk_multiLineRoundRectButtonTintedWithColor:title:target:action:", v9, v14, *(_QWORD *)(a1 + 32), sel_actionButtonTapped_);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v7)
    {
      v12 = 0;
      goto LABEL_7;
    }
    v8 = (void *)MEMORY[0x1E0DC3518];
    objc_msgSend(MEMORY[0x1E0DC3658], "hk_appKeyColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hk_buttonTintedWithColor:title:target:action:", v9, v14, *(_QWORD *)(a1 + 32), sel_actionButtonTapped_);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v10;

LABEL_7:
  objc_msgSend(v12, "titleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAdjustsFontForContentSizeCategory:", 1);

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

  -[HKStackedButtonView footerText](self, "footerText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    -[HKStackedButtonView setFooterTextLabel:](self, "setFooterTextLabel:", v4);

    -[HKStackedButtonView _attributedFooterText](self, "_attributedFooterText");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKStackedButtonView footerTextLabel](self, "footerTextLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAttributedText:", v5);

    -[HKStackedButtonView footerTextLabel](self, "footerTextLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAdjustsFontForContentSizeCategory:", 1);

    -[HKStackedButtonView footerTextLabel](self, "footerTextLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNumberOfLines:", 0);

    -[HKStackedButtonView footerTextLabel](self, "footerTextLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v10 = -[HKStackedButtonView footerTextAlignment](self, "footerTextAlignment");
    -[HKStackedButtonView footerTextLabel](self, "footerTextLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTextAlignment:", v10);

    -[HKStackedButtonView footerTextLabel](self, "footerTextLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKStackedButtonView addSubview:](self, "addSubview:", v12);

    -[HKStackedButtonView footerTextLabel](self, "footerTextLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "hk_alignHorizontalConstraintsWithView:margin:", self, 0.0);

    objc_msgSend((id)objc_opt_class(), "_footerTextSpacingForValue:", 40.0);
    -[HKStackedButtonView setFirstTopConstant:](self, "setFirstTopConstant:");
    -[HKStackedButtonView footerTextLabel](self, "footerTextLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstBaselineAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKStackedButtonView topAnchor](self, "topAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKStackedButtonView firstTopConstant](self, "firstTopConstant");
    objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setActive:", 1);

    -[HKStackedButtonView footerTextLabel](self, "footerTextLabel");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "lastBaselineAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKStackedButtonView setFirstTopAnchor:](self, "setFirstTopAnchor:", v18);

  }
  else
  {
    -[HKStackedButtonView topAnchor](self, "topAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKStackedButtonView setFirstTopAnchor:](self, "setFirstTopAnchor:", v19);

    -[HKStackedButtonView setFirstTopConstant:](self, "setFirstTopConstant:", 0.0);
  }
}

- (void)_assignConstraintsForButtons
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[HKStackedButtonView buttons](self, "buttons");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKStackedButtonView buttons](self, "buttons");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__HKStackedButtonView__assignConstraintsForButtons__block_invoke;
  v8[3] = &unk_1E9C46628;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v7);
  -[HKStackedButtonView setButtonSpacingConstraints:](self, "setButtonSpacingConstraints:", v7);

}

void __51__HKStackedButtonView__assignConstraintsForButtons__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a2;
  objc_msgSend(v25, "hk_alignHorizontalConstraintsWithView:margin:", *(_QWORD *)(a1 + 32), 0.0);
  v5 = *(void **)(a1 + 32);
  if (!a3)
  {
    objc_msgSend(v5, "styles");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "integerValue");

    if (v14 == 1)
    {
      objc_msgSend(v25, "topAnchor");
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
      if (v14)
      {
LABEL_20:
        v24 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 32), "firstTopAnchor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "constraintEqualToAnchor:", v16);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addObject:", v21);
        goto LABEL_21;
      }
      objc_msgSend(v25, "firstBaselineAnchor");
      v15 = objc_claimAutoreleasedReturnValue();
    }
    v7 = (void *)v15;
    goto LABEL_20;
  }
  objc_msgSend(v5, "buttons");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", a3 - 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "styles");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", a3 - 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");

  if (v10 == 1)
  {
    objc_msgSend(v7, "bottomAnchor");
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (!v10)
  {
    objc_msgSend(v7, "lastBaselineAnchor");
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v16 = (void *)v11;
    goto LABEL_11;
  }
  v16 = 0;
LABEL_11:
  objc_msgSend(*(id *)(a1 + 32), "styles");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectAtIndexedSubscript:", a3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "integerValue");

  if (v19 == 1)
  {
    objc_msgSend(v25, "bottomAnchor");
    v20 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v19)
    {
      v21 = 0;
      goto LABEL_17;
    }
    objc_msgSend(v25, "lastBaselineAnchor");
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)v20;
LABEL_17:
  v22 = *(void **)(a1 + 40);
  objc_msgSend(v21, "constraintEqualToAnchor:", v16);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObject:", v23);

LABEL_21:
}

- (void)_updateConstraintsForButtons
{
  void *v3;
  _QWORD v4[5];

  -[HKStackedButtonView buttonSpacingConstraints](self, "buttonSpacingConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__HKStackedButtonView__updateConstraintsForButtons__block_invoke;
  v4[3] = &unk_1E9C46650;
  v4[4] = self;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v4);

}

void __51__HKStackedButtonView__updateConstraintsForButtons__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  id v17;

  v17 = a2;
  objc_msgSend(*(id *)(a1 + 32), "styles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a3)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3 - 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "integerValue");

    v9 = 36.0;
    if (v8 != 1)
      v9 = 0.0;
    if (v8)
      v10 = v9;
    else
      v10 = 44.0;
    v11 = (void *)objc_opt_class();
    v12 = v10;
  }
  else
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "integerValue");

    if (v14 == 1)
    {
      objc_msgSend(*(id *)(a1 + 32), "firstTopConstant");
      if (v15 == 0.0)
      {
        objc_msgSend(MEMORY[0x1E0DC3BF8], "hk_currentDeviceHas4InchScreen");
        goto LABEL_9;
      }
      v16 = objc_opt_class();
      objc_msgSend(*(id *)(a1 + 32), "firstTopConstant");
      v11 = (void *)v16;
    }
    else
    {
      if (v14)
        goto LABEL_9;
      v11 = (void *)objc_opt_class();
      v12 = 32.0;
    }
  }
  objc_msgSend(v11, "_buttonSpacingForValue:", v12);
LABEL_9:
  objc_msgSend(v17, "setConstant:");

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

  -[HKStackedButtonView styles](self, "styles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  if (v5 == 1)
  {
    -[HKStackedButtonView bottomAnchor](self, "bottomAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKStackedButtonView buttons](self, "buttons");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bottomAnchor");
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (!v5)
  {
    -[HKStackedButtonView bottomAnchor](self, "bottomAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKStackedButtonView buttons](self, "buttons");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastBaselineAnchor");
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v10 = (void *)v9;
    objc_msgSend(v6, "constraintEqualToAnchor:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKStackedButtonView setBottomConstraint:](self, "setBottomConstraint:", v11);

  }
  -[HKStackedButtonView bottomConstraint](self, "bottomConstraint");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setActive:", 1);

}

- (void)_updateBottomConstraint
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  int64_t v11;
  double v12;
  double v13;
  double v14;
  id v15;

  -[HKStackedButtonView styles](self, "styles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  if (-[HKStackedButtonView lastButtonMode](self, "lastButtonMode") == 1)
  {
    -[HKStackedButtonView titles](self, "titles");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8 != 1 && v6 != 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKStackedButtonView.m"), 379, CFSTR("Tried to use 'Primary in Flow' with a button count other than 1 and style other than Rounded Rect"));

    }
  }
  v10 = 0.0;
  if (v6 == 1)
  {
    v11 = -[HKStackedButtonView lastButtonMode](self, "lastButtonMode");
    v12 = 60.0;
    if (v11 != 1)
      v12 = 0.0;
    if (v11)
      v10 = v12;
    else
      v10 = 44.0;
  }
  else if (!v6)
  {
    v10 = 30.0;
  }
  if (-[HKStackedButtonView bottomAdjustsForHomeButtonlessScreen](self, "bottomAdjustsForHomeButtonlessScreen"))
    v10 = v10 + 14.0;
  objc_msgSend((id)objc_opt_class(), "_buttonSpacingForValue:", v10);
  v14 = v13;
  -[HKStackedButtonView bottomConstraint](self, "bottomConstraint");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setConstant:", v14);

}

- (void)_updateForCurrentSizeCategory
{
  void *v3;
  void *v4;
  void *v5;

  -[HKStackedButtonView footerText](self, "footerText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HKStackedButtonView _attributedFooterText](self, "_attributedFooterText");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKStackedButtonView footerTextLabel](self, "footerTextLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAttributedText:", v4);

    -[HKStackedButtonView setNeedsLayout](self, "setNeedsLayout");
  }
  -[HKStackedButtonView _updateBottomConstraint](self, "_updateBottomConstraint");
  -[HKStackedButtonView _updateConstraintsForButtons](self, "_updateConstraintsForButtons");
}

- (id)_attributedFooterText
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3778];
  -[HKStackedButtonView footerText](self, "footerText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0DC4B10];
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKStackedButtonView boldFooterText](self, "boldFooterText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hk_attributedStringForText:style:color:boldText:", v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)createButtonBackgroundView
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v3);

  objc_msgSend(v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v2, "hk_maskAllCornersWithRadius:", 10.0);
  return v2;
}

- (id)firstBaselineAnchor
{
  void *v2;
  void *v3;
  void *v4;

  -[HKStackedButtonView buttons](self, "buttons");
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

  -[HKStackedButtonView buttons](self, "buttons");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastBaselineAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_footerFontTextStyle
{
  return (id)*MEMORY[0x1E0DC4B10];
}

+ (id)_footerTextFont
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0DC1350];
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

  v2 = (void *)MEMORY[0x1E0DC1350];
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

  objc_msgSend(MEMORY[0x1E0DC1350], "hk_scalableFontForTextStyle:symbolicTraits:", *MEMORY[0x1E0DC4A88], 0x8000);
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

- (BOOL)bottomAdjustsForHomeButtonlessScreen
{
  return self->_bottomAdjustsForHomeButtonlessScreen;
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

- (NSArray)buttonSpacingConstraints
{
  return self->_buttonSpacingConstraints;
}

- (void)setButtonSpacingConstraints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 456);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 472);
}

- (NSString)boldFooterText
{
  return self->_boldFooterText;
}

- (void)setBoldFooterText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 480);
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

- (HKStackedButtonViewDelegate)delegate
{
  return (HKStackedButtonViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
  objc_storeStrong((id *)&self->_buttonSpacingConstraints, 0);
  objc_storeStrong((id *)&self->_styles, 0);
  objc_storeStrong((id *)&self->_titles, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
}

@end

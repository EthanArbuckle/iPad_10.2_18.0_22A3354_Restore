@implementation PKPaletteButtonGroupView

- (PKPaletteButtonGroupView)initWithFrame:(CGRect)a3
{
  PKPaletteButtonGroupView *v3;
  PKPaletteButtonGroupView *v4;
  __int128 v5;
  UIStackView *v6;
  UIStackView *buttonStackView;
  void *v8;
  void *v9;
  uint64_t v10;
  NSLayoutConstraint *buttonStackViewTopConstraint;
  void *v12;
  void *v13;
  uint64_t v14;
  NSLayoutConstraint *buttonStackViewLeadingConstraint;
  void *v16;
  void *v17;
  uint64_t v18;
  NSLayoutConstraint *buttonStackViewBottomConstraint;
  void *v20;
  void *v21;
  uint64_t v22;
  NSLayoutConstraint *buttonStackViewTrailingConstraint;
  void *v24;
  void *v25;
  objc_super v27;
  _QWORD v28[5];

  v28[4] = *MEMORY[0x1E0C80C00];
  v27.receiver = self;
  v27.super_class = (Class)PKPaletteButtonGroupView;
  v3 = -[PKPaletteButtonGroupView initWithFrame:](&v27, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_scalingFactor = 1.0;
    v5 = *(_OWORD *)(MEMORY[0x1E0DC3298] + 16);
    *(_OWORD *)&v3->_additionalContentMargins.top = *MEMORY[0x1E0DC3298];
    *(_OWORD *)&v3->_additionalContentMargins.bottom = v5;
    v6 = (UIStackView *)objc_alloc_init(MEMORY[0x1E0DC3CA8]);
    buttonStackView = v4->_buttonStackView;
    v4->_buttonStackView = v6;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v4->_buttonStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAlignment:](v4->_buttonStackView, "setAlignment:", 3);
    -[PKPaletteButtonGroupView addSubview:](v4, "addSubview:", v4->_buttonStackView);
    -[UIStackView topAnchor](v4->_buttonStackView, "topAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteButtonGroupView topAnchor](v4, "topAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    buttonStackViewTopConstraint = v4->_buttonStackViewTopConstraint;
    v4->_buttonStackViewTopConstraint = (NSLayoutConstraint *)v10;

    -[UIStackView leadingAnchor](v4->_buttonStackView, "leadingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteButtonGroupView leadingAnchor](v4, "leadingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
    buttonStackViewLeadingConstraint = v4->_buttonStackViewLeadingConstraint;
    v4->_buttonStackViewLeadingConstraint = (NSLayoutConstraint *)v14;

    -[UIStackView bottomAnchor](v4->_buttonStackView, "bottomAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteButtonGroupView bottomAnchor](v4, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v17);
    v18 = objc_claimAutoreleasedReturnValue();
    buttonStackViewBottomConstraint = v4->_buttonStackViewBottomConstraint;
    v4->_buttonStackViewBottomConstraint = (NSLayoutConstraint *)v18;

    -[UIStackView trailingAnchor](v4->_buttonStackView, "trailingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteButtonGroupView trailingAnchor](v4, "trailingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v21);
    v22 = objc_claimAutoreleasedReturnValue();
    buttonStackViewTrailingConstraint = v4->_buttonStackViewTrailingConstraint;
    v4->_buttonStackViewTrailingConstraint = (NSLayoutConstraint *)v22;

    v24 = (void *)MEMORY[0x1E0CB3718];
    v28[0] = v4->_buttonStackViewTopConstraint;
    v28[1] = v4->_buttonStackViewLeadingConstraint;
    v28[2] = v4->_buttonStackViewBottomConstraint;
    v28[3] = v4->_buttonStackViewTrailingConstraint;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "activateConstraints:", v25);

    -[PKPaletteButtonGroupView _updateUI](v4, "_updateUI");
    -[PKPaletteButtonGroupView setShouldGroupAccessibilityChildren:](v4, "setShouldGroupAccessibilityChildren:", 1);
  }
  return v4;
}

- (void)addButton:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PKPaletteButtonGroupView buttons](self, "buttons");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayByAddingObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaletteButtonGroupView setButtons:](self, "setButtons:", v5);
}

- (void)addButtonsFromArray:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PKPaletteButtonGroupView buttons](self, "buttons");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaletteButtonGroupView setButtons:](self, "setButtons:", v5);
}

- (void)removeAllButtons
{
  -[PKPaletteButtonGroupView setButtons:](self, "setButtons:", MEMORY[0x1E0C9AA60]);
}

- (void)setButtons:(id)a3
{
  NSArray *v4;
  NSArray *v5;
  NSArray *v6;
  NSArray *buttons;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  NSArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = (NSArray *)a3;
  v5 = v4;
  if (self->_buttons != v4)
  {
    v6 = (NSArray *)-[NSArray copy](v4, "copy");
    buttons = self->_buttons;
    self->_buttons = v6;

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    -[PKPaletteButtonGroupView buttonStackView](self, "buttonStackView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "arrangedSubviews");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");

    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v30 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          v16 = (void *)MEMORY[0x1C3B7FBFC]();
          -[PKPaletteButtonGroupView buttonStackView](self, "buttonStackView");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "removeArrangedSubview:", v15);

          objc_msgSend(v15, "removeFromSuperview");
          objc_autoreleasePoolPop(v16);
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v12);
    }

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v18 = v5;
    v19 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v26;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v26 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * j);
          objc_msgSend(v23, "removeFromSuperview", (_QWORD)v25);
          -[PKPaletteButtonGroupView buttonStackView](self, "buttonStackView");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "addArrangedSubview:", v23);

        }
        v20 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      }
      while (v20);
    }

    -[PKPaletteButtonGroupView _updateUI](self, "_updateUI");
  }

}

- (int64_t)axis
{
  void *v2;
  int64_t v3;

  -[PKPaletteButtonGroupView buttonStackView](self, "buttonStackView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "axis");

  return v3;
}

- (void)setAxis:(int64_t)a3
{
  id v4;

  -[PKPaletteButtonGroupView buttonStackView](self, "buttonStackView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAxis:", a3);

}

- (void)setUseEqualInterItemSpacing:(BOOL)a3
{
  if (self->_useEqualInterItemSpacing != a3)
  {
    self->_useEqualInterItemSpacing = a3;
    -[PKPaletteButtonGroupView _updateUI](self, "_updateUI");
  }
}

- (void)setAdditionalContentMargins:(NSDirectionalEdgeInsets)a3
{
  if (self->_additionalContentMargins.leading != a3.leading
    || self->_additionalContentMargins.top != a3.top
    || self->_additionalContentMargins.trailing != a3.trailing
    || self->_additionalContentMargins.bottom != a3.bottom)
  {
    self->_additionalContentMargins = a3;
    -[PKPaletteButtonGroupView _updateUI](self, "_updateUI");
  }
}

- (void)_updateUI
{
  uint64_t v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (-[PKPaletteButtonGroupView useEqualInterItemSpacing](self, "useEqualInterItemSpacing"))
    v3 = 3;
  else
    v3 = 0;
  -[PKPaletteButtonGroupView buttonStackView](self, "buttonStackView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDistribution:", v3);

  if (-[PKPaletteButtonGroupView useEqualInterItemSpacing](self, "useEqualInterItemSpacing"))
  {
    v5 = 1.17549435e-38;
  }
  else
  {
    -[PKPaletteButtonGroupView scalingFactor](self, "scalingFactor");
    v5 = v6 * 12.0;
  }
  -[PKPaletteButtonGroupView buttonStackView](self, "buttonStackView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSpacing:", v5);

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  -[PKPaletteButtonGroupView buttons](self, "buttons", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v35 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        -[PKPaletteButtonGroupView scalingFactor](self, "scalingFactor");
        objc_msgSend(v13, "setScalingFactor:");
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v10);
  }

  -[PKPaletteButtonGroupView additionalContentMargins](self, "additionalContentMargins");
  v15 = v14;
  -[PKPaletteButtonGroupView scalingFactor](self, "scalingFactor");
  v17 = v15 * v16;
  -[PKPaletteButtonGroupView buttonStackViewTopConstraint](self, "buttonStackViewTopConstraint");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setConstant:", v17);

  -[PKPaletteButtonGroupView additionalContentMargins](self, "additionalContentMargins");
  v20 = v19;
  -[PKPaletteButtonGroupView scalingFactor](self, "scalingFactor");
  v22 = v20 * v21;
  -[PKPaletteButtonGroupView buttonStackViewLeadingConstraint](self, "buttonStackViewLeadingConstraint");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setConstant:", v22);

  -[PKPaletteButtonGroupView additionalContentMargins](self, "additionalContentMargins");
  v25 = v24;
  -[PKPaletteButtonGroupView scalingFactor](self, "scalingFactor");
  v27 = -(v25 * v26);
  -[PKPaletteButtonGroupView buttonStackViewBottomConstraint](self, "buttonStackViewBottomConstraint");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setConstant:", v27);

  -[PKPaletteButtonGroupView additionalContentMargins](self, "additionalContentMargins");
  v30 = v29;
  -[PKPaletteButtonGroupView scalingFactor](self, "scalingFactor");
  v32 = -(v30 * v31);
  -[PKPaletteButtonGroupView buttonStackViewTrailingConstraint](self, "buttonStackViewTrailingConstraint");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setConstant:", v32);

}

- (void)setScalingFactor:(double)a3
{
  if (self->_scalingFactor != a3)
  {
    self->_scalingFactor = a3;
    -[PKPaletteButtonGroupView _updateUI](self, "_updateUI");
  }
}

- (double)scalingFactor
{
  return self->_scalingFactor;
}

- (NSArray)buttons
{
  return self->_buttons;
}

- (BOOL)useEqualInterItemSpacing
{
  return self->_useEqualInterItemSpacing;
}

- (NSDirectionalEdgeInsets)additionalContentMargins
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_additionalContentMargins.top;
  leading = self->_additionalContentMargins.leading;
  bottom = self->_additionalContentMargins.bottom;
  trailing = self->_additionalContentMargins.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (UIStackView)buttonStackView
{
  return self->_buttonStackView;
}

- (void)setButtonStackView:(id)a3
{
  objc_storeStrong((id *)&self->_buttonStackView, a3);
}

- (NSLayoutConstraint)buttonStackViewTopConstraint
{
  return self->_buttonStackViewTopConstraint;
}

- (void)setButtonStackViewTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_buttonStackViewTopConstraint, a3);
}

- (NSLayoutConstraint)buttonStackViewLeadingConstraint
{
  return self->_buttonStackViewLeadingConstraint;
}

- (void)setButtonStackViewLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_buttonStackViewLeadingConstraint, a3);
}

- (NSLayoutConstraint)buttonStackViewBottomConstraint
{
  return self->_buttonStackViewBottomConstraint;
}

- (void)setButtonStackViewBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_buttonStackViewBottomConstraint, a3);
}

- (NSLayoutConstraint)buttonStackViewTrailingConstraint
{
  return self->_buttonStackViewTrailingConstraint;
}

- (void)setButtonStackViewTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_buttonStackViewTrailingConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonStackViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_buttonStackViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_buttonStackViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_buttonStackViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_buttonStackView, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
}

@end

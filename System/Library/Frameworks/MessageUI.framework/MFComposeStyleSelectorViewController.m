@implementation MFComposeStyleSelectorViewController

- (UIStackView)containerStackView
{
  UIStackView *containerStackView;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  UIStackView *v8;
  UIStackView *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  containerStackView = self->_containerStackView;
  if (!containerStackView)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3CA8]);
    -[MFComposeStyleSelectorViewController fontTextAttributeStackView](self, "fontTextAttributeStackView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v5;
    -[MFComposeStyleSelectorViewController quoteIndentListJustifyStackView](self, "quoteIndentListJustifyStackView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (UIStackView *)objc_msgSend(v4, "initWithArrangedSubviews:", v7);
    v9 = self->_containerStackView;
    self->_containerStackView = v8;

    -[UIStackView setAxis:](self->_containerStackView, "setAxis:", 1);
    -[UIStackView setAlignment:](self->_containerStackView, "setAlignment:", 0);
    -[UIStackView setDistribution:](self->_containerStackView, "setDistribution:", 0);
    -[UIStackView setSpacing:](self->_containerStackView, "setSpacing:", 8.0);
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_containerStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MFComposeStyleSelectorViewController fontTextAttributeStackView](self, "fontTextAttributeStackView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "heightAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFComposeStyleSelectorViewController quoteIndentListJustifyStackView](self, "quoteIndentListJustifyStackView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "heightAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:multiplier:", v13, 1.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setActive:", 1);

    containerStackView = self->_containerStackView;
  }
  return containerStackView;
}

- (UIStackView)quoteIndentStackView
{
  UIStackView *quoteIndentStackView;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id *p_quoteIndentStackView;
  id v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  quoteIndentStackView = self->_quoteIndentStackView;
  if (!quoteIndentStackView)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3CA8]);
    -[MFComposeStyleSelectorViewController quoteLevelStackView](self, "quoteLevelStackView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v5;
    -[MFComposeStyleSelectorViewController indentStackView](self, "indentStackView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "initWithArrangedSubviews:", v7);
    p_quoteIndentStackView = (id *)&self->_quoteIndentStackView;
    v10 = *p_quoteIndentStackView;
    *p_quoteIndentStackView = (id)v8;

    objc_msgSend(*p_quoteIndentStackView, "setAxis:", 0);
    objc_msgSend(*p_quoteIndentStackView, "setAlignment:", 0);
    objc_msgSend(*p_quoteIndentStackView, "setDistribution:", 1);
    objc_msgSend(*p_quoteIndentStackView, "setSpacing:", 8.0);
    quoteIndentStackView = (UIStackView *)*p_quoteIndentStackView;
  }
  return quoteIndentStackView;
}

- (UIStackView)quoteIndentListJustifyStackView
{
  UIStackView *quoteIndentListJustifyStackView;
  UIStackView *v4;
  UIStackView *v5;
  UIStackView *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  quoteIndentListJustifyStackView = self->_quoteIndentListJustifyStackView;
  if (!quoteIndentListJustifyStackView)
  {
    objc_msgSend(MEMORY[0x1E0DC3CA8], "mf_equallyFilledVerticalStackView");
    v4 = (UIStackView *)objc_claimAutoreleasedReturnValue();
    v5 = self->_quoteIndentListJustifyStackView;
    self->_quoteIndentListJustifyStackView = v4;

    -[UIStackView setSpacing:](self->_quoteIndentListJustifyStackView, "setSpacing:", 8.0);
    v6 = self->_quoteIndentListJustifyStackView;
    -[MFComposeStyleSelectorViewController listJustifyStackView](self, "listJustifyStackView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v7;
    -[MFComposeStyleSelectorViewController quoteIndentStackView](self, "quoteIndentStackView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView mf_addArrangedSubviews:](v6, "mf_addArrangedSubviews:", v9);

    quoteIndentListJustifyStackView = self->_quoteIndentListJustifyStackView;
  }
  return quoteIndentListJustifyStackView;
}

- (UIStackView)fontTextAttributeStackView
{
  UIStackView *fontTextAttributeStackView;
  UIStackView *v4;
  UIStackView *v5;
  UIStackView *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  fontTextAttributeStackView = self->_fontTextAttributeStackView;
  if (!fontTextAttributeStackView)
  {
    objc_msgSend(MEMORY[0x1E0DC3CA8], "mf_equallyFilledVerticalStackView");
    v4 = (UIStackView *)objc_claimAutoreleasedReturnValue();
    v5 = self->_fontTextAttributeStackView;
    self->_fontTextAttributeStackView = v4;

    -[UIStackView setSpacing:](self->_fontTextAttributeStackView, "setSpacing:", 8.0);
    v6 = self->_fontTextAttributeStackView;
    -[MFComposeStyleSelectorViewController textAttributeStackView](self, "textAttributeStackView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v7;
    -[MFComposeStyleSelectorViewController fontAttributeStackView](self, "fontAttributeStackView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView mf_addArrangedSubviews:](v6, "mf_addArrangedSubviews:", v9);

    fontTextAttributeStackView = self->_fontTextAttributeStackView;
  }
  return fontTextAttributeStackView;
}

- (UIStackView)fontAttributeStackView
{
  UIStackView *fontAttributeStackView;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  UIStackView *v13;
  UIStackView *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
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
  _QWORD v37[4];
  _QWORD v38[2];
  _QWORD v39[2];
  _QWORD v40[4];

  v40[2] = *MEMORY[0x1E0C80C00];
  fontAttributeStackView = self->_fontAttributeStackView;
  if (!fontAttributeStackView)
  {
    -[MFComposeStyleSelectorViewController _roundedEquallyFilledHorizontalStackView](self, "_roundedEquallyFilledHorizontalStackView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFComposeStyleSelectorViewController decreaseFontSizeButton](self, "decreaseFontSizeButton");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v4;
    -[MFComposeStyleSelectorViewController increaseFontSizeButton](self, "increaseFontSizeButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v40[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "mf_addArrangedSubviews:", v6);

    v7 = objc_alloc(MEMORY[0x1E0DC3CA8]);
    v39[0] = v35;
    -[MFComposeStyleSelectorViewController textColorButton](self, "textColorButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v39[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)objc_msgSend(v7, "initWithArrangedSubviews:", v9);

    objc_msgSend(v36, "setAxis:", 0);
    objc_msgSend(v36, "setAlignment:", 0);
    objc_msgSend(v36, "setDistribution:", 0);
    objc_msgSend(v36, "setSpacing:", 16.0);
    v10 = objc_alloc(MEMORY[0x1E0DC3CA8]);
    -[MFComposeStyleSelectorViewController fontSelectorButton](self, "fontSelectorButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v11;
    v38[1] = v36;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (UIStackView *)objc_msgSend(v10, "initWithArrangedSubviews:", v12);
    v14 = self->_fontAttributeStackView;
    self->_fontAttributeStackView = v13;

    -[UIStackView setAxis:](self->_fontAttributeStackView, "setAxis:", 0);
    -[UIStackView setAlignment:](self->_fontAttributeStackView, "setAlignment:", 3);
    -[UIStackView setDistribution:](self->_fontAttributeStackView, "setDistribution:", 1);
    -[UIStackView setSpacing:](self->_fontAttributeStackView, "setSpacing:", 8.0);
    v15 = (void *)MEMORY[0x1E0CB3718];
    -[MFComposeStyleSelectorViewController fontSelectorButton](self, "fontSelectorButton");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "heightAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView heightAnchor](self->_fontAttributeStackView, "heightAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v29;
    -[MFComposeStyleSelectorViewController textColorButton](self, "textColorButton");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "widthAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView heightAnchor](self->_fontAttributeStackView, "heightAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v37[1] = v26;
    -[MFComposeStyleSelectorViewController textColorButton](self, "textColorButton");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "heightAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFComposeStyleSelectorViewController textColorButton](self, "textColorButton");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "widthAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v37[2] = v18;
    objc_msgSend(v35, "heightAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView heightAnchor](self->_fontAttributeStackView, "heightAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v37[3] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "activateConstraints:", v22);

    objc_msgSend(MEMORY[0x1E0DC1350], "mf_defaultComposeFontPixelSize");
    -[MFComposeStyleSelectorViewController setCurrentFontSize:](self, "setCurrentFontSize:", (uint64_t)v23);

    fontAttributeStackView = self->_fontAttributeStackView;
  }
  return fontAttributeStackView;
}

- (UIStackView)listJustifyStackView
{
  UIStackView *listJustifyStackView;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id *p_listJustifyStackView;
  id v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  listJustifyStackView = self->_listJustifyStackView;
  if (!listJustifyStackView)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3CA8]);
    -[MFComposeStyleSelectorViewController listStackView](self, "listStackView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v5;
    -[MFComposeStyleSelectorViewController justifyStackView](self, "justifyStackView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "initWithArrangedSubviews:", v7);
    p_listJustifyStackView = (id *)&self->_listJustifyStackView;
    v10 = *p_listJustifyStackView;
    *p_listJustifyStackView = (id)v8;

    objc_msgSend(*p_listJustifyStackView, "setAxis:", 0);
    objc_msgSend(*p_listJustifyStackView, "setAlignment:", 0);
    objc_msgSend(*p_listJustifyStackView, "setDistribution:", 1);
    objc_msgSend(*p_listJustifyStackView, "setSpacing:", 8.0);
    listJustifyStackView = (UIStackView *)*p_listJustifyStackView;
  }
  return listJustifyStackView;
}

- (MFRoundedCornersStackView)textAttributeStackView
{
  MFRoundedCornersStackView *textAttributeStackView;
  MFRoundedCornersStackView *v4;
  MFRoundedCornersStackView *v5;
  MFRoundedCornersStackView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];

  v13[4] = *MEMORY[0x1E0C80C00];
  textAttributeStackView = self->_textAttributeStackView;
  if (!textAttributeStackView)
  {
    -[MFComposeStyleSelectorViewController _roundedEquallyFilledHorizontalStackView](self, "_roundedEquallyFilledHorizontalStackView");
    v4 = (MFRoundedCornersStackView *)objc_claimAutoreleasedReturnValue();
    v5 = self->_textAttributeStackView;
    self->_textAttributeStackView = v4;

    v6 = self->_textAttributeStackView;
    -[MFComposeStyleSelectorViewController boldButton](self, "boldButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v7;
    -[MFComposeStyleSelectorViewController italicsButton](self, "italicsButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = v8;
    -[MFComposeStyleSelectorViewController underlineButton](self, "underlineButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2] = v9;
    -[MFComposeStyleSelectorViewController strikethroughButton](self, "strikethroughButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[3] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFRoundedCornersStackView mf_addArrangedSubviews:](v6, "mf_addArrangedSubviews:", v11);

    textAttributeStackView = self->_textAttributeStackView;
  }
  return textAttributeStackView;
}

- (MFRoundedCornersStackView)listStackView
{
  MFRoundedCornersStackView *listStackView;
  MFRoundedCornersStackView *v4;
  MFRoundedCornersStackView *v5;
  MFRoundedCornersStackView *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  listStackView = self->_listStackView;
  if (!listStackView)
  {
    -[MFComposeStyleSelectorViewController _roundedEquallyFilledHorizontalStackView](self, "_roundedEquallyFilledHorizontalStackView");
    v4 = (MFRoundedCornersStackView *)objc_claimAutoreleasedReturnValue();
    v5 = self->_listStackView;
    self->_listStackView = v4;

    v6 = self->_listStackView;
    -[MFComposeStyleSelectorViewController numberedListButton](self, "numberedListButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v7;
    -[MFComposeStyleSelectorViewController bulletListButton](self, "bulletListButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFRoundedCornersStackView mf_addArrangedSubviews:](v6, "mf_addArrangedSubviews:", v9);

    listStackView = self->_listStackView;
  }
  return listStackView;
}

- (MFRoundedCornersStackView)indentStackView
{
  MFRoundedCornersStackView *indentStackView;
  MFRoundedCornersStackView *v4;
  MFRoundedCornersStackView *v5;
  MFRoundedCornersStackView *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  indentStackView = self->_indentStackView;
  if (!indentStackView)
  {
    -[MFComposeStyleSelectorViewController _roundedEquallyFilledHorizontalStackView](self, "_roundedEquallyFilledHorizontalStackView");
    v4 = (MFRoundedCornersStackView *)objc_claimAutoreleasedReturnValue();
    v5 = self->_indentStackView;
    self->_indentStackView = v4;

    v6 = self->_indentStackView;
    -[MFComposeStyleSelectorViewController indentLeftButton](self, "indentLeftButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v7;
    -[MFComposeStyleSelectorViewController indentRightButton](self, "indentRightButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFRoundedCornersStackView mf_addArrangedSubviews:](v6, "mf_addArrangedSubviews:", v9);

    indentStackView = self->_indentStackView;
  }
  return indentStackView;
}

- (MFRoundedCornersStackView)justifyStackView
{
  MFRoundedCornersStackView *justifyStackView;
  MFRoundedCornersStackView *v4;
  MFRoundedCornersStackView *v5;
  MFRoundedCornersStackView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  justifyStackView = self->_justifyStackView;
  if (!justifyStackView)
  {
    -[MFComposeStyleSelectorViewController _roundedEquallyFilledHorizontalStackView](self, "_roundedEquallyFilledHorizontalStackView");
    v4 = (MFRoundedCornersStackView *)objc_claimAutoreleasedReturnValue();
    v5 = self->_justifyStackView;
    self->_justifyStackView = v4;

    v6 = self->_justifyStackView;
    -[MFComposeStyleSelectorViewController justifyLeftButton](self, "justifyLeftButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFComposeStyleSelectorViewController justifyCenterButton](self, "justifyCenterButton", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v8;
    -[MFComposeStyleSelectorViewController justifyRightButton](self, "justifyRightButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFRoundedCornersStackView mf_addArrangedSubviews:](v6, "mf_addArrangedSubviews:", v10);

    justifyStackView = self->_justifyStackView;
  }
  return justifyStackView;
}

- (MFRoundedCornersStackView)quoteLevelStackView
{
  MFRoundedCornersStackView *quoteLevelStackView;
  MFRoundedCornersStackView *v4;
  MFRoundedCornersStackView *v5;
  MFRoundedCornersStackView *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  quoteLevelStackView = self->_quoteLevelStackView;
  if (!quoteLevelStackView)
  {
    -[MFComposeStyleSelectorViewController _roundedEquallyFilledHorizontalStackView](self, "_roundedEquallyFilledHorizontalStackView");
    v4 = (MFRoundedCornersStackView *)objc_claimAutoreleasedReturnValue();
    v5 = self->_quoteLevelStackView;
    self->_quoteLevelStackView = v4;

    v6 = self->_quoteLevelStackView;
    -[MFComposeStyleSelectorViewController decreaseQuoteButton](self, "decreaseQuoteButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v7;
    -[MFComposeStyleSelectorViewController increaseQuoteButton](self, "increaseQuoteButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFRoundedCornersStackView mf_addArrangedSubviews:](v6, "mf_addArrangedSubviews:", v9);

    quoteLevelStackView = self->_quoteLevelStackView;
  }
  return quoteLevelStackView;
}

- (MFComposeFontSelectorButton)fontSelectorButton
{
  MFComposeFontSelectorButton *fontSelectorButton;
  uint64_t v4;
  void *v5;
  MFComposeFontSelectorButton *v6;
  MFComposeFontSelectorButton *v7;
  void *v8;
  void *v9;
  void *v10;

  fontSelectorButton = self->_fontSelectorButton;
  if (!fontSelectorButton)
  {
    v4 = *MEMORY[0x1E0DC4A88];
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFComposeFontSelectorButton buttonWithFont:](MFComposeFontSelectorButton, "buttonWithFont:", v5);
    v6 = (MFComposeFontSelectorButton *)objc_claimAutoreleasedReturnValue();
    v7 = self->_fontSelectorButton;
    self->_fontSelectorButton = v6;

    -[MFComposeFontSelectorButton layer](self->_fontSelectorButton, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCornerRadius:", 10.0);

    -[MFComposeFontSelectorButton layer](self->_fontSelectorButton, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setMasksToBounds:", 1);

    -[MFComposeFontSelectorButton addTarget:action:forControlEvents:](self->_fontSelectorButton, "addTarget:action:forControlEvents:", self, sel_pickFontAction_, 64);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFComposeStyleSelectorViewController _updateFontsButton:](self, "_updateFontsButton:", v10);

    fontSelectorButton = self->_fontSelectorButton;
  }
  return fontSelectorButton;
}

- (MFComposeTextColorButton)textColorButton
{
  MFComposeTextColorButton *textColorButton;
  void *v4;
  MFComposeTextColorButton *v5;
  MFComposeTextColorButton *v6;

  textColorButton = self->_textColorButton;
  if (!textColorButton)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFComposeTextColorButton buttonWithColor:](MFComposeTextColorButton, "buttonWithColor:", v4);
    v5 = (MFComposeTextColorButton *)objc_claimAutoreleasedReturnValue();
    v6 = self->_textColorButton;
    self->_textColorButton = v5;

    -[MFComposeTextColorButton addTarget:action:forControlEvents:](self->_textColorButton, "addTarget:action:forControlEvents:", self, sel_pickTextColor_, 64);
    textColorButton = self->_textColorButton;
  }
  return textColorButton;
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MFComposeStyleSelectorViewController;
  -[MFComposeStyleSelectorViewController loadView](&v9, sel_loadView);
  objc_msgSend(MEMORY[0x1E0DC3658], "mailStyleSheetBackground");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFComposeStyleSelectorViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[MFComposeStyleSelectorViewController _setupButtons](self, "_setupButtons");
  -[MFComposeStyleSelectorViewController _setupContainer](self, "_setupContainer");
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("FORMAT_TITLE"), &stru_1E5A6A588, CFSTR("Main"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFComposeStyleSelectorViewController setTitle:](self, "setTitle:", v6);

  objc_msgSend(MEMORY[0x1E0DC3658], "mailStyleSheetBackground");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFComposeStyleSelectorViewController popoverPresentationController](self, "popoverPresentationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setArrowBackgroundColor:", v7);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  MFComposeActionCardTitleView *v6;
  MFComposeActionCardTitleView *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)MFComposeStyleSelectorViewController;
  -[MFComposeStyleSelectorViewController viewDidLoad](&v15, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("FORMAT_TITLE"), &stru_1E5A6A588, CFSTR("Main"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[MFComposeStyleSelectorViewController popoverPresentationController](self, "popoverPresentationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[MFComposeStyleSelectorViewController setTitle:](self, "setTitle:", v4);
  }
  else
  {
    v6 = [MFComposeActionCardTitleView alloc];
    v7 = -[MFComposeActionCardTitleView initWithFrame:](v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("FORMAT_TITLE"), &stru_1E5A6A588, CFSTR("Main"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFComposeActionCardTitleView titleLabel](v7, "titleLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setText:", v9);

    -[MFComposeActionCardTitleView closeButton](v7, "closeButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addTarget:action:forEvents:", self, sel_closeStyleSelector_, 64);

    -[MFComposeStyleSelectorViewController navigationItem](self, "navigationItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTitleView:", v7);

    -[MFComposeStyleSelectorViewController navigationItem](self, "navigationItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_setManualScrollEdgeAppearanceProgress:", 0.0);

    -[MFComposeStyleSelectorViewController navigationItem](self, "navigationItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_setManualScrollEdgeAppearanceEnabled:", 1);

  }
}

- (CGSize)preferredContentSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  -[MFComposeStyleSelectorViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFComposeStyleSelectorViewController preferredHeightForTraitCollection:](self, "preferredHeightForTraitCollection:", v3);
  v5 = v4;

  v6 = 375.0;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFComposeStyleSelectorViewController;
  -[MFComposeStyleSelectorViewController traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  -[MFComposeStyleSelectorViewController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "verticalSizeClass");

  -[MFComposeStyleSelectorViewController fontTextAttributeStackView](self, "fontTextAttributeStackView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 == 1)
  {
    objc_msgSend(v7, "setAxis:", 0);

    -[MFComposeStyleSelectorViewController quoteIndentListJustifyStackView](self, "quoteIndentListJustifyStackView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAxis:", 0);
  }
  else
  {
    objc_msgSend(v7, "setAxis:", 1);

    -[MFComposeStyleSelectorViewController quoteIndentListJustifyStackView](self, "quoteIndentListJustifyStackView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAxis:", 1);
  }

}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  v6 = a4;
  -[MFComposeStyleSelectorViewController presentedViewController](self, "presentedViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[MFComposeStyleSelectorViewController presentedViewController](self, "presentedViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dismissViewControllerAnimated:completion:", v4, 0);

  }
  v9.receiver = self;
  v9.super_class = (Class)MFComposeStyleSelectorViewController;
  -[MFComposeStyleSelectorViewController dismissViewControllerAnimated:completion:](&v9, sel_dismissViewControllerAnimated_completion_, v4, v6);

}

- (void)styleSelectorAction:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[MFComposeStyleSelectorViewController styleDelegate](self, "styleDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MFComposeTextStyle composeTextStyleForTextStyleType:](MFComposeTextStyle, "composeTextStyleForTextStyleType:", objc_msgSend(v6, "styleType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "composeStyleSelector:didSelectStyle:", self, v5);

}

- (void)closeStyleSelector:(id)a3
{
  id v4;

  -[MFComposeStyleSelectorViewController styleDelegate](self, "styleDelegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "composeStyleSelectorDidCancel:", self);

}

- (void)pickTextColor:(id)a3
{
  void *v4;
  MFComposeColorPickerController *v5;
  MFComposeColorPickerController *v6;
  void *v7;
  MFComposeColorPickerController *v8;
  void *v9;
  void *v10;
  MFComposeColorPickerController *v11;
  MFComposeColorPickerController *colorPicker;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  _QWORD v23[4];
  id v24;
  id location;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  -[MFComposeStyleSelectorViewController presentedViewController](self, "presentedViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_msgSend(v4, "topViewController"),
        v5 = (MFComposeColorPickerController *)objc_claimAutoreleasedReturnValue(),
        v6 = self->_colorPicker,
        v5,
        v5 != v6))
  {
    -[MFComposeStyleSelectorViewController popoverPresentationController](self, "popoverPresentationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = [MFComposeColorPickerController alloc];
    -[MFComposeStyleSelectorViewController textColorButton](self, "textColorButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "color");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[MFComposeColorPickerController initWithSelectedColor:shouldShowTitleBar:](v8, "initWithSelectedColor:shouldShowTitleBar:", v10, v7 == 0);
    colorPicker = self->_colorPicker;
    self->_colorPicker = v11;

    -[MFComposeColorPickerController setDelegate:](self->_colorPicker, "setDelegate:", self);
    if (v7)
    {
      -[MFComposeStyleSelectorViewController navigationController](self, "navigationController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "pushViewController:animated:", self->_colorPicker, 1);

    }
    else
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", self->_colorPicker);
      objc_msgSend(v16, "presentationController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, self);
      v18 = (void *)MEMORY[0x1E0DC3C78];
      v19 = MEMORY[0x1E0C809B0];
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __54__MFComposeStyleSelectorViewController_pickTextColor___block_invoke;
      v23[3] = &unk_1E5A663F8;
      objc_copyWeak(&v24, &location);
      objc_msgSend(v18, "_detentWithIdentifier:resolutionContextBlock:", v15, v23);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v20;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setDetents:", v21);

      objc_msgSend(v17, "setLargestUndimmedDetentIdentifier:", v15);
      v22[0] = v19;
      v22[1] = 3221225472;
      v22[2] = __54__MFComposeStyleSelectorViewController_pickTextColor___block_invoke_2;
      v22[3] = &unk_1E5A65480;
      v22[4] = self;
      -[MFComposeStyleSelectorViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v16, 1, v22);

      objc_destroyWeak(&v24);
      objc_destroyWeak(&location);

    }
  }

}

double __54__MFComposeStyleSelectorViewController_pickTextColor___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  double v6;
  double v7;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v3, "_containerTraitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "preferredHeightForTraitCollection:", v5);
  v7 = v6;

  return v7;
}

void __54__MFComposeStyleSelectorViewController_pickTextColor___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "styleDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "composeStyleSelectorDidPresentColorPicker:", *(_QWORD *)(a1 + 32));

}

- (void)pickFontAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  MFComposeStyleSelectorViewController *v10;
  id v11;

  v11 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0DC3808]);
  objc_msgSend(v4, "setIncludeFaces:", 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3800]), "initWithConfiguration:", v4);
  objc_msgSend(v11, "representedFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fontDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSelectedFontDescriptor:", v7);

  objc_msgSend(v5, "setDelegate:", self);
  -[MFComposeStyleSelectorViewController styleDelegate](self, "styleDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(v8, "presentingViewControllerForComposeStyleSelector:", self),
        (v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v10 = (MFComposeStyleSelectorViewController *)v9;
    -[MFComposeStyleSelectorViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }
  else
  {
    v10 = self;
  }
  -[MFComposeStyleSelectorViewController presentViewController:animated:completion:](v10, "presentViewController:animated:completion:", v5, 1, 0);

}

- (void)changeFontSizeAction:(id)a3
{
  int64_t v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "styleType") == 6
    && -[MFComposeStyleSelectorViewController currentFontSize](self, "currentFontSize") <= 999)
  {
    v4 = -[MFComposeStyleSelectorViewController currentFontSize](self, "currentFontSize") + 1;
LABEL_7:
    -[MFComposeStyleSelectorViewController setCurrentFontSize:](self, "setCurrentFontSize:", v4);
    goto LABEL_8;
  }
  if (objc_msgSend(v6, "styleType") == 5
    && -[MFComposeStyleSelectorViewController currentFontSize](self, "currentFontSize") >= 3)
  {
    v4 = -[MFComposeStyleSelectorViewController currentFontSize](self, "currentFontSize") - 1;
    goto LABEL_7;
  }
LABEL_8:
  -[MFComposeStyleSelectorViewController styleDelegate](self, "styleDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "composeStyleSelector:didChangeFontSize:", self, (double)-[MFComposeStyleSelectorViewController currentFontSize](self, "currentFontSize"));

}

- (double)preferredHeightForTraitCollection:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  void *v9;
  double v10;
  uint64_t v11;
  double v12;
  double v13;

  v4 = a3;
  -[MFComposeStyleSelectorViewController popoverPresentationController](self, "popoverPresentationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = 0.0;
  if (!v5)
  {
    +[MFComposeActionCardTitleView heightForTraitCollection:](MFComposeActionCardTitleView, "heightForTraitCollection:", v4);
    v6 = v7;
  }
  v8 = objc_msgSend(v4, "verticalSizeClass");
  objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:maximumContentSizeCategory:", *MEMORY[0x1E0DC4A88], *MEMORY[0x1E0DC48D8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lineHeight");
  if (v8 == 1)
    v11 = 2;
  else
    v11 = 4;
  v12 = ceil(v10);
  v13 = v12 + v12;

  return v6 + (double)(v11 - 1) * 8.0 + (double)v11 * fmax(v13, 46.0) + 10.0 + 25.0;
}

- (void)updateStateUsingFontAttributes:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  unsigned int v7;
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
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  void *v29;
  id v30;

  v30 = a3;
  objc_msgSend(v30, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1138]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "pointSize");
    -[MFComposeStyleSelectorViewController setCurrentFontSize:](self, "setCurrentFontSize:", (uint64_t)v6);
    v7 = objc_msgSend(v5, "traits");
    -[MFComposeStyleSelectorViewController boldButton](self, "boldButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSelected:", (v7 >> 1) & 1);

    LOBYTE(v7) = objc_msgSend(v5, "traits");
    -[MFComposeStyleSelectorViewController italicsButton](self, "italicsButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSelected:", v7 & 1);

    -[MFComposeStyleSelectorViewController _updateFontsButton:](self, "_updateFontsButton:", v5);
  }
  objc_msgSend(v30, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1248]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFComposeStyleSelectorViewController underlineButton](self, "underlineButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSelected:", v10 != 0);

  objc_msgSend(v30, "objectForKeyedSubscript:", *MEMORY[0x1E0DC11A8]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFComposeStyleSelectorViewController strikethroughButton](self, "strikethroughButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setSelected:", v12 != 0);

  objc_msgSend(v30, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1140]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[MFComposeStyleSelectorViewController textColorButton](self, "textColorButton");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setColor:", v15);

  if (!v14)
  objc_msgSend(v30, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1178]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    -[MFComposeStyleSelectorViewController justifyLeftButton](self, "justifyLeftButton");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setSelected:", 0);

    -[MFComposeStyleSelectorViewController justifyCenterButton](self, "justifyCenterButton");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setSelected:", 0);

    -[MFComposeStyleSelectorViewController justifyRightButton](self, "justifyRightButton");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setSelected:", 0);

    v21 = objc_msgSend(v17, "alignment");
    if (v21)
    {
      if (v21 == 1)
      {
        -[MFComposeStyleSelectorViewController justifyCenterButton](self, "justifyCenterButton");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setSelected:", 1);
      }
      else
      {
        if (v21 != 2)
        {
LABEL_15:
          -[MFComposeStyleSelectorViewController bulletListButton](self, "bulletListButton");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setSelected:", 0);

          -[MFComposeStyleSelectorViewController numberedListButton](self, "numberedListButton");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setSelected:", 0);

          objc_msgSend(v17, "textLists");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v25, "count"))
          {
            objc_msgSend(v25, "lastObject");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "markerFormat");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = +[MFComposeTextStyle isTextListStyleOrdered:](MFComposeTextStyle, "isTextListStyleOrdered:", v27);

            if (v28)
              -[MFComposeStyleSelectorViewController numberedListButton](self, "numberedListButton");
            else
              -[MFComposeStyleSelectorViewController bulletListButton](self, "bulletListButton");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "setSelected:", 1);

          }
          goto LABEL_21;
        }
        -[MFComposeStyleSelectorViewController justifyRightButton](self, "justifyRightButton");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setSelected:", 1);
      }
    }
    else
    {
      -[MFComposeStyleSelectorViewController justifyLeftButton](self, "justifyLeftButton");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setSelected:", 1);
    }

    goto LABEL_15;
  }
LABEL_21:

}

- (void)colorPickerDidCancel:(id)a3
{
  void *v4;

  -[MFComposeStyleSelectorViewController colorPicker](self, "colorPicker", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

  -[MFComposeStyleSelectorViewController setColorPicker:](self, "setColorPicker:", 0);
}

- (void)colorPicker:(id)a3 didChangeSelectedColor:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v7 = a4;
  -[MFComposeStyleSelectorViewController textColorButton](self, "textColorButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setColor:", v7);

  -[MFComposeStyleSelectorViewController styleDelegate](self, "styleDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "composeStyleSelector:didChangeTextColor:", self, v7);

}

- (void)fontPickerViewControllerDidCancel:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[MFComposeStyleSelectorViewController styleDelegate](self, "styleDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "composeStyleSelectorDidDismissFontPicker:", self);
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)fontPickerViewControllerDidPickFont:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0DC1350];
  v9 = v4;
  objc_msgSend(v4, "selectedFontDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fontWithDescriptor:size:", v6, (double)-[MFComposeStyleSelectorViewController currentFontSize](self, "currentFontSize"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[MFComposeStyleSelectorViewController _updateFontsButton:](self, "_updateFontsButton:", v7);
  -[MFComposeStyleSelectorViewController styleDelegate](self, "styleDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "composeStyleSelector:didChangeFont:", self, v7);

  objc_msgSend(v9, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_setupContainer
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
  _QWORD v31[6];

  v31[4] = *MEMORY[0x1E0C80C00];
  -[MFComposeStyleSelectorViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFComposeStyleSelectorViewController containerStackView](self, "containerStackView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", v4);

  v5 = (void *)MEMORY[0x1E0CB3718];
  -[MFComposeStyleSelectorViewController containerStackView](self, "containerStackView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "topAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFComposeStyleSelectorViewController view](self, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "layoutMarginsGuide");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "topAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:constant:", 10.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v23;
  -[MFComposeStyleSelectorViewController containerStackView](self, "containerStackView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "leadingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFComposeStyleSelectorViewController view](self, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "layoutMarginsGuide");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "leadingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v18;
  -[MFComposeStyleSelectorViewController containerStackView](self, "containerStackView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "trailingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFComposeStyleSelectorViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "layoutMarginsGuide");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "trailingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v7;
  -[MFComposeStyleSelectorViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layoutMarginsGuide");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFComposeStyleSelectorViewController containerStackView](self, "containerStackView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bottomAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:constant:", v12, 25.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v31[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activateConstraints:", v14);

}

- (id)_roundedEquallyFilledHorizontalStackView
{
  void *v2;

  +[UIStackView mf_equallyFilledHorizontalStackView](MFRoundedCornersStackView, "mf_equallyFilledHorizontalStackView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSpacing:", 1.0);
  objc_msgSend(v2, "setCornerRadius:", 10.0);
  return v2;
}

- (id)_composeStyleSelectorButtonForAttributeType:(int64_t)a3
{
  +[MFComposeStyleSelectorButton buttonWithStyleType:target:action:maximumContentSizeCategory:](MFComposeStyleSelectorButton, "buttonWithStyleType:target:action:maximumContentSizeCategory:", a3, self, sel_styleSelectorAction_, *MEMORY[0x1E0DC48D8]);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_setupButtons
{
  MFComposeStyleSelectorButton *v3;
  MFComposeStyleSelectorButton *boldButton;
  MFComposeStyleSelectorButton *v5;
  MFComposeStyleSelectorButton *italicsButton;
  MFComposeStyleSelectorButton *v7;
  MFComposeStyleSelectorButton *underlineButton;
  MFComposeStyleSelectorButton *v9;
  MFComposeStyleSelectorButton *strikethroughButton;
  id v11;
  MFComposeStyleSelectorButton *v12;
  MFComposeStyleSelectorButton *decreaseFontSizeButton;
  id v14;
  MFComposeStyleSelectorButton *v15;
  MFComposeStyleSelectorButton *increaseFontSizeButton;
  MFComposeStyleSelectorButton *v17;
  MFComposeStyleSelectorButton *numberedListButton;
  MFComposeStyleSelectorButton *v19;
  MFComposeStyleSelectorButton *bulletListButton;
  MFComposeStyleSelectorButton *v21;
  MFComposeStyleSelectorButton *justifyLeftButton;
  MFComposeStyleSelectorButton *v23;
  MFComposeStyleSelectorButton *justifyCenterButton;
  MFComposeStyleSelectorButton *v25;
  MFComposeStyleSelectorButton *justifyRightButton;
  MFComposeStyleSelectorButton *v27;
  MFComposeStyleSelectorButton *increaseQuoteButton;
  MFComposeStyleSelectorButton *v29;
  MFComposeStyleSelectorButton *decreaseQuoteButton;
  MFComposeStyleSelectorButton *v31;
  MFComposeStyleSelectorButton *indentLeftButton;
  MFComposeStyleSelectorButton *v33;
  MFComposeStyleSelectorButton *indentRightButton;

  -[MFComposeStyleSelectorViewController _composeStyleSelectorButtonForAttributeType:](self, "_composeStyleSelectorButtonForAttributeType:", 1);
  v3 = (MFComposeStyleSelectorButton *)objc_claimAutoreleasedReturnValue();
  boldButton = self->_boldButton;
  self->_boldButton = v3;

  -[MFComposeStyleSelectorViewController _composeStyleSelectorButtonForAttributeType:](self, "_composeStyleSelectorButtonForAttributeType:", 2);
  v5 = (MFComposeStyleSelectorButton *)objc_claimAutoreleasedReturnValue();
  italicsButton = self->_italicsButton;
  self->_italicsButton = v5;

  -[MFComposeStyleSelectorViewController _composeStyleSelectorButtonForAttributeType:](self, "_composeStyleSelectorButtonForAttributeType:", 3);
  v7 = (MFComposeStyleSelectorButton *)objc_claimAutoreleasedReturnValue();
  underlineButton = self->_underlineButton;
  self->_underlineButton = v7;

  -[MFComposeStyleSelectorViewController _composeStyleSelectorButtonForAttributeType:](self, "_composeStyleSelectorButtonForAttributeType:", 4);
  v9 = (MFComposeStyleSelectorButton *)objc_claimAutoreleasedReturnValue();
  strikethroughButton = self->_strikethroughButton;
  self->_strikethroughButton = v9;

  v11 = (id)*MEMORY[0x1E0DC48D8];
  +[MFComposeStyleSelectorButton buttonWithStyleType:target:action:maximumContentSizeCategory:](MFComposeStyleSelectorButton, "buttonWithStyleType:target:action:maximumContentSizeCategory:", 5, self, sel_changeFontSizeAction_, v11);
  v12 = (MFComposeStyleSelectorButton *)objc_claimAutoreleasedReturnValue();
  decreaseFontSizeButton = self->_decreaseFontSizeButton;
  self->_decreaseFontSizeButton = v12;

  v14 = v11;
  +[MFComposeStyleSelectorButton buttonWithStyleType:target:action:maximumContentSizeCategory:](MFComposeStyleSelectorButton, "buttonWithStyleType:target:action:maximumContentSizeCategory:", 6, self, sel_changeFontSizeAction_, v14);
  v15 = (MFComposeStyleSelectorButton *)objc_claimAutoreleasedReturnValue();
  increaseFontSizeButton = self->_increaseFontSizeButton;
  self->_increaseFontSizeButton = v15;

  -[MFComposeStyleSelectorViewController _composeStyleSelectorButtonForAttributeType:](self, "_composeStyleSelectorButtonForAttributeType:", 7);
  v17 = (MFComposeStyleSelectorButton *)objc_claimAutoreleasedReturnValue();
  numberedListButton = self->_numberedListButton;
  self->_numberedListButton = v17;

  -[MFComposeStyleSelectorViewController _composeStyleSelectorButtonForAttributeType:](self, "_composeStyleSelectorButtonForAttributeType:", 8);
  v19 = (MFComposeStyleSelectorButton *)objc_claimAutoreleasedReturnValue();
  bulletListButton = self->_bulletListButton;
  self->_bulletListButton = v19;

  -[MFComposeStyleSelectorViewController _composeStyleSelectorButtonForAttributeType:](self, "_composeStyleSelectorButtonForAttributeType:", 13);
  v21 = (MFComposeStyleSelectorButton *)objc_claimAutoreleasedReturnValue();
  justifyLeftButton = self->_justifyLeftButton;
  self->_justifyLeftButton = v21;

  -[MFComposeStyleSelectorViewController _composeStyleSelectorButtonForAttributeType:](self, "_composeStyleSelectorButtonForAttributeType:", 14);
  v23 = (MFComposeStyleSelectorButton *)objc_claimAutoreleasedReturnValue();
  justifyCenterButton = self->_justifyCenterButton;
  self->_justifyCenterButton = v23;

  -[MFComposeStyleSelectorViewController _composeStyleSelectorButtonForAttributeType:](self, "_composeStyleSelectorButtonForAttributeType:", 15);
  v25 = (MFComposeStyleSelectorButton *)objc_claimAutoreleasedReturnValue();
  justifyRightButton = self->_justifyRightButton;
  self->_justifyRightButton = v25;

  -[MFComposeStyleSelectorViewController _composeStyleSelectorButtonForAttributeType:](self, "_composeStyleSelectorButtonForAttributeType:", 11);
  v27 = (MFComposeStyleSelectorButton *)objc_claimAutoreleasedReturnValue();
  increaseQuoteButton = self->_increaseQuoteButton;
  self->_increaseQuoteButton = v27;

  -[MFComposeStyleSelectorViewController _composeStyleSelectorButtonForAttributeType:](self, "_composeStyleSelectorButtonForAttributeType:", 12);
  v29 = (MFComposeStyleSelectorButton *)objc_claimAutoreleasedReturnValue();
  decreaseQuoteButton = self->_decreaseQuoteButton;
  self->_decreaseQuoteButton = v29;

  -[MFComposeStyleSelectorViewController _composeStyleSelectorButtonForAttributeType:](self, "_composeStyleSelectorButtonForAttributeType:", 9);
  v31 = (MFComposeStyleSelectorButton *)objc_claimAutoreleasedReturnValue();
  indentLeftButton = self->_indentLeftButton;
  self->_indentLeftButton = v31;

  -[MFComposeStyleSelectorViewController _composeStyleSelectorButtonForAttributeType:](self, "_composeStyleSelectorButtonForAttributeType:", 10);
  v33 = (MFComposeStyleSelectorButton *)objc_claimAutoreleasedReturnValue();
  indentRightButton = self->_indentRightButton;
  self->_indentRightButton = v33;

}

- (void)_updateFontsButton:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0DC1350], "mf_defaultComposeFontPixelSize");
  objc_msgSend(v6, "fontWithSize:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFComposeStyleSelectorViewController fontSelectorButton](self, "fontSelectorButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRepresentedFont:", v4);

}

- (MFComposeStyleSelectorViewControllerDelegate)styleDelegate
{
  return (MFComposeStyleSelectorViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_styleDelegate);
}

- (void)setStyleDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_styleDelegate, a3);
}

- (void)setContainerStackView:(id)a3
{
  objc_storeStrong((id *)&self->_containerStackView, a3);
}

- (MFComposeColorPickerController)colorPicker
{
  return self->_colorPicker;
}

- (void)setColorPicker:(id)a3
{
  objc_storeStrong((id *)&self->_colorPicker, a3);
}

- (void)setFontTextAttributeStackView:(id)a3
{
  objc_storeStrong((id *)&self->_fontTextAttributeStackView, a3);
}

- (void)setFontAttributeStackView:(id)a3
{
  objc_storeStrong((id *)&self->_fontAttributeStackView, a3);
}

- (void)setTextAttributeStackView:(id)a3
{
  objc_storeStrong((id *)&self->_textAttributeStackView, a3);
}

- (void)setQuoteIndentListJustifyStackView:(id)a3
{
  objc_storeStrong((id *)&self->_quoteIndentListJustifyStackView, a3);
}

- (void)setListJustifyStackView:(id)a3
{
  objc_storeStrong((id *)&self->_listJustifyStackView, a3);
}

- (void)setListStackView:(id)a3
{
  objc_storeStrong((id *)&self->_listStackView, a3);
}

- (void)setIndentStackView:(id)a3
{
  objc_storeStrong((id *)&self->_indentStackView, a3);
}

- (void)setQuoteIndentStackView:(id)a3
{
  objc_storeStrong((id *)&self->_quoteIndentStackView, a3);
}

- (void)setJustifyStackView:(id)a3
{
  objc_storeStrong((id *)&self->_justifyStackView, a3);
}

- (void)setQuoteLevelStackView:(id)a3
{
  objc_storeStrong((id *)&self->_quoteLevelStackView, a3);
}

- (void)setFontSelectorButton:(id)a3
{
  objc_storeStrong((id *)&self->_fontSelectorButton, a3);
}

- (MFComposeStyleSelectorButton)decreaseFontSizeButton
{
  return self->_decreaseFontSizeButton;
}

- (void)setDecreaseFontSizeButton:(id)a3
{
  objc_storeStrong((id *)&self->_decreaseFontSizeButton, a3);
}

- (MFComposeStyleSelectorButton)increaseFontSizeButton
{
  return self->_increaseFontSizeButton;
}

- (void)setIncreaseFontSizeButton:(id)a3
{
  objc_storeStrong((id *)&self->_increaseFontSizeButton, a3);
}

- (void)setTextColorButton:(id)a3
{
  objc_storeStrong((id *)&self->_textColorButton, a3);
}

- (MFComposeStyleSelectorButton)boldButton
{
  return self->_boldButton;
}

- (void)setBoldButton:(id)a3
{
  objc_storeStrong((id *)&self->_boldButton, a3);
}

- (MFComposeStyleSelectorButton)italicsButton
{
  return self->_italicsButton;
}

- (void)setItalicsButton:(id)a3
{
  objc_storeStrong((id *)&self->_italicsButton, a3);
}

- (MFComposeStyleSelectorButton)underlineButton
{
  return self->_underlineButton;
}

- (void)setUnderlineButton:(id)a3
{
  objc_storeStrong((id *)&self->_underlineButton, a3);
}

- (MFComposeStyleSelectorButton)strikethroughButton
{
  return self->_strikethroughButton;
}

- (void)setStrikethroughButton:(id)a3
{
  objc_storeStrong((id *)&self->_strikethroughButton, a3);
}

- (MFComposeStyleSelectorButton)bulletListButton
{
  return self->_bulletListButton;
}

- (void)setBulletListButton:(id)a3
{
  objc_storeStrong((id *)&self->_bulletListButton, a3);
}

- (MFComposeStyleSelectorButton)numberedListButton
{
  return self->_numberedListButton;
}

- (void)setNumberedListButton:(id)a3
{
  objc_storeStrong((id *)&self->_numberedListButton, a3);
}

- (MFComposeStyleSelectorButton)justifyLeftButton
{
  return self->_justifyLeftButton;
}

- (void)setJustifyLeftButton:(id)a3
{
  objc_storeStrong((id *)&self->_justifyLeftButton, a3);
}

- (MFComposeStyleSelectorButton)justifyCenterButton
{
  return self->_justifyCenterButton;
}

- (void)setJustifyCenterButton:(id)a3
{
  objc_storeStrong((id *)&self->_justifyCenterButton, a3);
}

- (MFComposeStyleSelectorButton)justifyRightButton
{
  return self->_justifyRightButton;
}

- (void)setJustifyRightButton:(id)a3
{
  objc_storeStrong((id *)&self->_justifyRightButton, a3);
}

- (MFComposeStyleSelectorButton)increaseQuoteButton
{
  return self->_increaseQuoteButton;
}

- (void)setIncreaseQuoteButton:(id)a3
{
  objc_storeStrong((id *)&self->_increaseQuoteButton, a3);
}

- (MFComposeStyleSelectorButton)decreaseQuoteButton
{
  return self->_decreaseQuoteButton;
}

- (void)setDecreaseQuoteButton:(id)a3
{
  objc_storeStrong((id *)&self->_decreaseQuoteButton, a3);
}

- (MFComposeStyleSelectorButton)indentLeftButton
{
  return self->_indentLeftButton;
}

- (void)setIndentLeftButton:(id)a3
{
  objc_storeStrong((id *)&self->_indentLeftButton, a3);
}

- (MFComposeStyleSelectorButton)indentRightButton
{
  return self->_indentRightButton;
}

- (void)setIndentRightButton:(id)a3
{
  objc_storeStrong((id *)&self->_indentRightButton, a3);
}

- (int64_t)currentFontSize
{
  return self->_currentFontSize;
}

- (void)setCurrentFontSize:(int64_t)a3
{
  self->_currentFontSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indentRightButton, 0);
  objc_storeStrong((id *)&self->_indentLeftButton, 0);
  objc_storeStrong((id *)&self->_decreaseQuoteButton, 0);
  objc_storeStrong((id *)&self->_increaseQuoteButton, 0);
  objc_storeStrong((id *)&self->_justifyRightButton, 0);
  objc_storeStrong((id *)&self->_justifyCenterButton, 0);
  objc_storeStrong((id *)&self->_justifyLeftButton, 0);
  objc_storeStrong((id *)&self->_numberedListButton, 0);
  objc_storeStrong((id *)&self->_bulletListButton, 0);
  objc_storeStrong((id *)&self->_strikethroughButton, 0);
  objc_storeStrong((id *)&self->_underlineButton, 0);
  objc_storeStrong((id *)&self->_italicsButton, 0);
  objc_storeStrong((id *)&self->_boldButton, 0);
  objc_storeStrong((id *)&self->_textColorButton, 0);
  objc_storeStrong((id *)&self->_increaseFontSizeButton, 0);
  objc_storeStrong((id *)&self->_decreaseFontSizeButton, 0);
  objc_storeStrong((id *)&self->_fontSelectorButton, 0);
  objc_storeStrong((id *)&self->_quoteLevelStackView, 0);
  objc_storeStrong((id *)&self->_justifyStackView, 0);
  objc_storeStrong((id *)&self->_quoteIndentStackView, 0);
  objc_storeStrong((id *)&self->_indentStackView, 0);
  objc_storeStrong((id *)&self->_listStackView, 0);
  objc_storeStrong((id *)&self->_listJustifyStackView, 0);
  objc_storeStrong((id *)&self->_quoteIndentListJustifyStackView, 0);
  objc_storeStrong((id *)&self->_textAttributeStackView, 0);
  objc_storeStrong((id *)&self->_fontAttributeStackView, 0);
  objc_storeStrong((id *)&self->_fontTextAttributeStackView, 0);
  objc_storeStrong((id *)&self->_colorPicker, 0);
  objc_storeStrong((id *)&self->_containerStackView, 0);
  objc_destroyWeak((id *)&self->_styleDelegate);
}

@end

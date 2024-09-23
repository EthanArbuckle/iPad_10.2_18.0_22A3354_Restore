@implementation ASVButton

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ASVButton;
  -[ASVButton layoutSubviews](&v3, sel_layoutSubviews);
  -[ASVButton updateCurrentAppearanceIfNeeded](self, "updateCurrentAppearanceIfNeeded");
}

- (void)setCurrentStyle:(int64_t)a3
{
  self->_currentStyle = a3;
}

- (ASVButton)initWithTitle:(id)a3 buttonStyle:(int64_t)a4 textStyle:(int64_t)a5 controlStyle:(int64_t)a6 adjustsFontForContentSizeCategory:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  ASVWrappedButton *v13;
  ASVWrappedButton *v14;
  void *v15;
  ASVButton *v16;

  v7 = a7;
  v12 = a3;
  v13 = [ASVWrappedButton alloc];
  v14 = -[ASVWrappedButton initWithFrame:](v13, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[ASVWrappedButton setTitle:forState:](v14, "setTitle:forState:", v12, 0);

  -[ASVWrappedButton titleLabel](v14, "titleLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAdjustsFontForContentSizeCategory:", v7);

  v16 = -[ASVButton initWithButton:buttonStyle:textStyle:controlStyle:largeImageInsets:](self, "initWithButton:buttonStyle:textStyle:controlStyle:largeImageInsets:", v14, a4, a5, a6, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  -[ASVButton _updateTitleStyleForButton:withControlStyle:](v16, "_updateTitleStyleForButton:withControlStyle:", v14, a6);

  return v16;
}

- (void)_updateTitleStyleForButton:(id)a3 withControlStyle:(int64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
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
  _QWORD v44[2];
  _QWORD v45[2];
  _QWORD v46[2];
  _QWORD v47[2];
  _QWORD v48[2];
  _QWORD v49[2];
  _QWORD v50[2];
  _QWORD v51[2];
  _QWORD v52[2];
  _QWORD v53[2];
  _QWORD v54[2];
  _QWORD v55[4];

  v55[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "titleForState:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (-[ASVButton buttonStyle](self, "buttonStyle") == 1 || -[ASVButton textStyle](self, "textStyle") == 1)
    {
      -[ASVButton boldFont](self, "boldFont");
      v8 = objc_claimAutoreleasedReturnValue();
      -[ASVButton boldFont](self, "boldFont");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASVButton boldFont](self, "boldFont");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[ASVButton regularFont](self, "regularFont");
      v8 = objc_claimAutoreleasedReturnValue();
      -[ASVButton regularFont](self, "regularFont");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASVButton regularFont](self, "regularFont");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    v43 = (void *)v9;
    -[ASVButton boldFont](self, "boldFont");
    v10 = objc_claimAutoreleasedReturnValue();
    if (a4 == 3)
    {
      -[ASVButton white75PercentColor](self, "white75PercentColor");
      v11 = objc_claimAutoreleasedReturnValue();
      -[ASVButton white52PercentColor](self, "white52PercentColor");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASVButton white26PercentColor](self, "white26PercentColor");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASVButton blue100PercentColor](self, "blue100PercentColor");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASVButton white26PercentColor](self, "white26PercentColor");
      v13 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a4 == 2)
      {
        -[ASVButton white100PercentColor](self, "white100PercentColor");
        v11 = objc_claimAutoreleasedReturnValue();
        -[ASVButton white70PercentColor](self, "white70PercentColor");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASVButton white35PercentColor](self, "white35PercentColor");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASVButton white70PercentColor](self, "white70PercentColor");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASVButton white35PercentColor](self, "white35PercentColor");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASVButton white35PercentColor](self, "white35PercentColor");
        v12 = objc_claimAutoreleasedReturnValue();
LABEL_15:
        v27 = (void *)v12;
        v37 = (void *)v11;
        v14 = *MEMORY[0x1E0DC1138];
        v34 = (void *)v8;
        v55[0] = v8;
        v15 = *MEMORY[0x1E0DC1140];
        v54[0] = v14;
        v54[1] = v15;
        -[ASVButton _colorDarkenedIfNeededForColor:](self, "_colorDarkenedIfNeededForColor:", v11);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v55[1] = v16;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 2);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v7, v36);
        objc_msgSend(v6, "setAttributedTitle:forState:", v35, 0);
        v52[1] = v15;
        v53[0] = v42;
        v52[0] = v14;
        -[ASVButton _colorDarkenedIfNeededForColor:](self, "_colorDarkenedIfNeededForColor:", v38);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v53[1] = v17;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 2);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v7, v33);
        objc_msgSend(v6, "setAttributedTitle:forState:", v32, 1);
        v50[1] = v15;
        v51[0] = v43;
        v50[0] = v14;
        -[ASVButton _colorDarkenedIfNeededForColor:](self, "_colorDarkenedIfNeededForColor:", v41);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v51[1] = v18;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 2);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v7, v31);
        objc_msgSend(v6, "setAttributedTitle:forState:", v30, 2);
        v49[0] = v10;
        v48[0] = v14;
        v48[1] = v15;
        -[ASVButton _colorDarkenedIfNeededForColor:](self, "_colorDarkenedIfNeededForColor:", v40);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v49[1] = v19;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 2);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v7, v29);
        objc_msgSend(v6, "setAttributedTitle:forState:", v28, 4);
        v46[1] = v15;
        v47[0] = v10;
        v46[0] = v14;
        -[ASVButton _colorDarkenedIfNeededForColor:](self, "_colorDarkenedIfNeededForColor:", v39);
        v20 = (void *)v10;
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v47[1] = v21;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 2);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v7, v22);
        objc_msgSend(v6, "setAttributedTitle:forState:", v23, 5);
        v44[1] = v15;
        v45[0] = v20;
        v44[0] = v14;
        -[ASVButton _colorDarkenedIfNeededForColor:](self, "_colorDarkenedIfNeededForColor:", v27);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v45[1] = v24;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 2);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v7, v25);
        objc_msgSend(v6, "setAttributedTitle:forState:", v26, 6);

        goto LABEL_16;
      }
      if (-[ASVButton buttonStyle](self, "buttonStyle") == 1)
      {
        -[ASVButton blue100PercentColor](self, "blue100PercentColor");
        v11 = objc_claimAutoreleasedReturnValue();
        -[ASVButton black70PercentColor](self, "black70PercentColor");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASVButton blue50PercentColor](self, "blue50PercentColor");
      }
      else
      {
        -[ASVButton black70PercentColor](self, "black70PercentColor");
        v11 = objc_claimAutoreleasedReturnValue();
        -[ASVButton black70PercentColor](self, "black70PercentColor");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASVButton black35PercentColor](self, "black35PercentColor");
      }
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASVButton blue100PercentColor](self, "blue100PercentColor");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASVButton black70PercentColor](self, "black70PercentColor");
      v13 = objc_claimAutoreleasedReturnValue();
    }
    v39 = (void *)v13;
    -[ASVButton blue50PercentColor](self, "blue50PercentColor");
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
LABEL_16:

}

- (UIFont)boldFont
{
  UIFont *boldFont;
  void *v4;
  void *v5;
  void *v6;
  UIFont *v7;
  UIFont *v8;

  boldFont = self->_boldFont;
  if (!boldFont)
  {
    objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4B10], 2, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0DC1350];
    -[ASVButton regularFont](self, "regularFont");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pointSize");
    objc_msgSend(v5, "fontWithDescriptor:size:", v4);
    v7 = (UIFont *)objc_claimAutoreleasedReturnValue();
    v8 = self->_boldFont;
    self->_boldFont = v7;

    boldFont = self->_boldFont;
  }
  return boldFont;
}

- (UIFont)regularFont
{
  void *v3;
  void *v4;
  int v5;
  UIFont *v6;
  UIFont *regularFont;

  if (!self->_regularFont)
  {
    -[ASVButton button](self, "button");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "titleLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "adjustsFontForContentSizeCategory");

    if (v5)
      objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B08]);
    else
      objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:maximumContentSizeCategory:", *MEMORY[0x1E0DC4B10], *MEMORY[0x1E0DC48F0]);
    v6 = (UIFont *)objc_claimAutoreleasedReturnValue();
    regularFont = self->_regularFont;
    self->_regularFont = v6;

  }
  return self->_regularFont;
}

- (ASVButton)initWithButton:(id)a3 buttonStyle:(int64_t)a4 textStyle:(int64_t)a5 controlStyle:(int64_t)a6 largeImageInsets:(UIEdgeInsets)a7
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  ASVButton *v21;
  ASVButton *v22;
  ASVBlurredBackgroundView *v23;
  ASVBlurredBackgroundView *blurredBackgroundView;
  id *p_button;
  uint64_t v26;
  UIColor *white35PercentColor;
  uint64_t v28;
  UIColor *white100PercentColor;
  uint64_t v30;
  UIColor *white70PercentColor;
  uint64_t v32;
  UIColor *black35PercentColor;
  uint64_t v34;
  UIColor *black70PercentColor;
  uint64_t v36;
  UIColor *blue100PercentColor;
  uint64_t v38;
  UIColor *blue50PercentColor;
  uint64_t v40;
  UIColor *white75PercentColor;
  uint64_t v42;
  UIColor *white52PercentColor;
  uint64_t v44;
  UIColor *white26PercentColor;
  double v46;
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
  id v77;
  objc_super v78;
  _QWORD v79[10];

  right = a7.right;
  bottom = a7.bottom;
  left = a7.left;
  top = a7.top;
  v79[8] = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v78.receiver = self;
  v78.super_class = (Class)ASVButton;
  v17 = *MEMORY[0x1E0C9D648];
  v18 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v19 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v20 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v21 = -[ASVButton initWithFrame:](&v78, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v18, v19, v20);
  v22 = v21;
  if (v21)
  {
    v77 = v16;
    -[ASVButton setTranslatesAutoresizingMaskIntoConstraints:](v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v23 = -[ASVBlurredBackgroundView initWithFrame:backgroundStyle:controlStyle:]([ASVBlurredBackgroundView alloc], "initWithFrame:backgroundStyle:controlStyle:", a4 == 1, a6, v17, v18, v19, v20);
    blurredBackgroundView = v22->_blurredBackgroundView;
    v22->_blurredBackgroundView = v23;

    -[ASVBlurredBackgroundView setTranslatesAutoresizingMaskIntoConstraints:](v22->_blurredBackgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[ASVButton addSubview:](v22, "addSubview:", v22->_blurredBackgroundView);
    p_button = (id *)&v22->_button;
    objc_storeStrong((id *)&v22->_button, a3);
    -[ASVWrappedButton setTranslatesAutoresizingMaskIntoConstraints:](v22->_button, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[ASVButton addSubview:](v22, "addSubview:", v22->_button);
    v22->_buttonStyle = a4;
    v22->_textStyle = a5;
    v22->_controlStyle = a6;
    v22->_largeImageInsets.top = top;
    v22->_largeImageInsets.left = left;
    v22->_largeImageInsets.bottom = bottom;
    v22->_largeImageInsets.right = right;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.35);
    v26 = objc_claimAutoreleasedReturnValue();
    white35PercentColor = v22->_white35PercentColor;
    v22->_white35PercentColor = (UIColor *)v26;

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 1.0);
    v28 = objc_claimAutoreleasedReturnValue();
    white100PercentColor = v22->_white100PercentColor;
    v22->_white100PercentColor = (UIColor *)v28;

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.7);
    v30 = objc_claimAutoreleasedReturnValue();
    white70PercentColor = v22->_white70PercentColor;
    v22->_white70PercentColor = (UIColor *)v30;

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.35);
    v32 = objc_claimAutoreleasedReturnValue();
    black35PercentColor = v22->_black35PercentColor;
    v22->_black35PercentColor = (UIColor *)v32;

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.7);
    v34 = objc_claimAutoreleasedReturnValue();
    black70PercentColor = v22->_black70PercentColor;
    v22->_black70PercentColor = (UIColor *)v34;

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.0, 0.478431373, 1.0, 1.0);
    v36 = objc_claimAutoreleasedReturnValue();
    blue100PercentColor = v22->_blue100PercentColor;
    v22->_blue100PercentColor = (UIColor *)v36;

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.0, 0.478431373, 1.0, 0.5);
    v38 = objc_claimAutoreleasedReturnValue();
    blue50PercentColor = v22->_blue50PercentColor;
    v22->_blue50PercentColor = (UIColor *)v38;

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.75);
    v40 = objc_claimAutoreleasedReturnValue();
    white75PercentColor = v22->_white75PercentColor;
    v22->_white75PercentColor = (UIColor *)v40;

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.52);
    v42 = objc_claimAutoreleasedReturnValue();
    white52PercentColor = v22->_white52PercentColor;
    v22->_white52PercentColor = (UIColor *)v42;

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.26);
    v44 = objc_claimAutoreleasedReturnValue();
    white26PercentColor = v22->_white26PercentColor;
    v22->_white26PercentColor = (UIColor *)v44;

    if (a6 == 2)
    {
      v46 = 0.4;
    }
    else
    {
      if (a6 != 3)
      {
LABEL_7:
        v67 = (void *)MEMORY[0x1E0CB3718];
        -[ASVBlurredBackgroundView leadingAnchor](v22->_blurredBackgroundView, "leadingAnchor");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASVButton leadingAnchor](v22, "leadingAnchor");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "constraintEqualToAnchor:", v75);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v79[0] = v74;
        -[ASVBlurredBackgroundView trailingAnchor](v22->_blurredBackgroundView, "trailingAnchor");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASVButton trailingAnchor](v22, "trailingAnchor");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "constraintEqualToAnchor:", v72);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v79[1] = v71;
        -[ASVBlurredBackgroundView topAnchor](v22->_blurredBackgroundView, "topAnchor");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASVButton topAnchor](v22, "topAnchor");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "constraintEqualToAnchor:", v69);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v79[2] = v68;
        -[ASVBlurredBackgroundView bottomAnchor](v22->_blurredBackgroundView, "bottomAnchor");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASVButton bottomAnchor](v22, "bottomAnchor");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "constraintEqualToAnchor:", v65);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v79[3] = v64;
        objc_msgSend(*p_button, "leadingAnchor");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASVButton leadingAnchor](v22, "leadingAnchor");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "constraintEqualToAnchor:", v62);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v79[4] = v61;
        objc_msgSend(*p_button, "trailingAnchor");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASVButton trailingAnchor](v22, "trailingAnchor");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "constraintEqualToAnchor:", v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v79[5] = v49;
        objc_msgSend(*p_button, "topAnchor");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASVButton topAnchor](v22, "topAnchor");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "constraintEqualToAnchor:", v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v79[6] = v52;
        objc_msgSend(*p_button, "bottomAnchor");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASVButton bottomAnchor](v22, "bottomAnchor");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "constraintEqualToAnchor:", v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v79[7] = v55;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 8);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "activateConstraints:", v56);

        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "addObserver:selector:name:object:", v22, sel__didUpdateDarkenColorsSetting_, *MEMORY[0x1E0DC4508], 0);

        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "addObserver:selector:name:object:", v22, sel__didUpdateContentSizeCategory_, *MEMORY[0x1E0DC48E8], 0);

        v16 = v77;
        goto LABEL_8;
      }
      v46 = 0.55;
    }
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*p_button, "setBackgroundColor:", v47);

    goto LABEL_7;
  }
LABEL_8:

  return v22;
}

- (int64_t)buttonStyle
{
  return self->_buttonStyle;
}

- (void)addTarget:(id)a3 action:(SEL)a4 forControlEvents:(unint64_t)a5
{
  id v8;
  id v9;

  v8 = a3;
  -[ASVButton button](self, "button");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addTarget:action:forControlEvents:", v8, a4, a5);

}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASVButton;
  -[ASVButton setEnabled:](&v9, sel_setEnabled_);
  -[ASVButton blurredBackgroundView](self, "blurredBackgroundView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", v3);

  -[ASVButton button](self, "button");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEnabled");

  if (v7 != v3)
  {
    -[ASVButton button](self, "button");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setEnabled:", v3);

  }
}

- (ASVWrappedButton)button
{
  return self->_button;
}

- (int64_t)textStyle
{
  return self->_textStyle;
}

- (id)_colorDarkenedIfNeededForColor:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v3 = a3;
  if (UIAccessibilityDarkerSystemColorsEnabled()
    && (v10 = 0.0,
        v11 = 0.0,
        v8 = 0.0,
        v9 = 0.0,
        objc_msgSend(v3, "getHue:saturation:brightness:alpha:", &v11, &v10, &v9, &v8)))
  {
    if (v9 == 0.0)
    {
      objc_msgSend(v3, "colorWithAlphaComponent:", v8 / 0.75);
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = objc_alloc(MEMORY[0x1E0DC3658]);
      v4 = (id)objc_msgSend(v7, "initWithHue:saturation:brightness:alpha:", v11, v10, v9 * 0.75, v8);
    }
  }
  else
  {
    v4 = v3;
  }
  v5 = v4;

  return v5;
}

- (ASVButton)initWithTitle:(id)a3 buttonStyle:(int64_t)a4 textStyle:(int64_t)a5 controlStyle:(int64_t)a6
{
  return -[ASVButton initWithTitle:buttonStyle:textStyle:controlStyle:adjustsFontForContentSizeCategory:](self, "initWithTitle:buttonStyle:textStyle:controlStyle:adjustsFontForContentSizeCategory:", a3, a4, a5, a6, 0);
}

- (ASVButton)initWithImage:(id)a3 buttonStyle:(int64_t)a4 textStyle:(int64_t)a5 controlStyle:(int64_t)a6
{
  return -[ASVButton initWithImage:buttonStyle:textStyle:controlStyle:largeImageInsets:](self, "initWithImage:buttonStyle:textStyle:controlStyle:largeImageInsets:", a3, a4, a5, a6, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
}

- (ASVButton)initWithImage:(id)a3 buttonStyle:(int64_t)a4 textStyle:(int64_t)a5 controlStyle:(int64_t)a6 largeImageInsets:(UIEdgeInsets)a7
{
  double right;
  double bottom;
  double left;
  double top;
  id v15;
  ASVWrappedButton *v16;
  ASVWrappedButton *v17;
  void *v18;
  ASVButton *v19;

  right = a7.right;
  bottom = a7.bottom;
  left = a7.left;
  top = a7.top;
  v15 = a3;
  v16 = [ASVWrappedButton alloc];
  v17 = -[ASVWrappedButton initWithFrame:](v16, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASVWrappedButton setPreferredSymbolConfiguration:forImageInState:](v17, "setPreferredSymbolConfiguration:forImageInState:", v18, 0);

  -[ASVWrappedButton setImage:forState:](v17, "setImage:forState:", v15, 0);
  v19 = -[ASVButton initWithButton:buttonStyle:textStyle:controlStyle:largeImageInsets:](self, "initWithButton:buttonStyle:textStyle:controlStyle:largeImageInsets:", v17, a4, a5, a6, top, left, bottom, right);
  -[ASVButton _updateTitleStyleForButton:withControlStyle:](v19, "_updateTitleStyleForButton:withControlStyle:", v17, a6);

  return v19;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3
{
  double height;
  double width;
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
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[ASVButton button](self, "button");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[ASVButton button](self, "button");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "systemLayoutSizeFittingSize:", width, height);
    v9 = v8;
    v11 = v10;

  }
  else
  {
    -[ASVButton systemLayoutSizeFittingSize:](self, "systemLayoutSizeFittingSize:", width, height);
    v9 = v12;
    v11 = v13;
  }

  v14 = v9;
  v15 = v11;
  result.height = v15;
  result.width = v14;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height;
  double width;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[ASVButton button](self, "button");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[ASVButton button](self, "button");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v14 = a4;
    *(float *)&v15 = a5;
    objc_msgSend(v13, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", width, height, v14, v15);
    v17 = v16;
    v19 = v18;

  }
  else
  {
    *(float *)&v11 = a4;
    *(float *)&v12 = a5;
    -[ASVButton systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", width, height, v11, v12);
    v17 = v20;
    v19 = v21;
  }

  v22 = v17;
  v23 = v19;
  result.height = v23;
  result.width = v22;
  return result;
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;
  CGSize result;

  -[ASVButton button](self, "button");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[ASVButton button](self, "button");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intrinsicContentSize");
    v6 = v5;
    v8 = v7;

  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)ASVButton;
    -[ASVButton intrinsicContentSize](&v13, sel_intrinsicContentSize);
    v6 = v9;
    v8 = v10;
  }

  v11 = v6;
  v12 = v8;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)setContentEdgeInsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  id v7;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  -[ASVButton button](self, "button");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContentEdgeInsets:", top, left, bottom, right);

}

- (UIEdgeInsets)contentEdgeInsets
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIEdgeInsets result;

  -[ASVButton button](self, "button");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentEdgeInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (void)setControlStyle:(int64_t)a3
{
  void *v5;
  id v6;

  if (self->_controlStyle != a3 && -[ASVButton currentStyle](self, "currentStyle") != 2)
  {
    self->_controlStyle = a3;
    -[ASVButton blurredBackgroundView](self, "blurredBackgroundView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setControlStyle:", a3);

    -[ASVButton button](self, "button");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[ASVButton _updateTitleStyleForButton:withControlStyle:](self, "_updateTitleStyleForButton:withControlStyle:", v6, a3);

  }
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASVButton;
  -[ASVButton setSelected:](&v9, sel_setSelected_);
  -[ASVButton blurredBackgroundView](self, "blurredBackgroundView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSelected:", v3);

  -[ASVButton button](self, "button");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isSelected");

  if (v7 != v3)
  {
    -[ASVButton button](self, "button");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSelected:", v3);

  }
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASVButton;
  -[ASVButton setHighlighted:](&v9, sel_setHighlighted_);
  -[ASVButton blurredBackgroundView](self, "blurredBackgroundView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHighlighted:", v3);

  -[ASVButton button](self, "button");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isHighlighted");

  if (v7 != v3)
  {
    -[ASVButton button](self, "button");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHighlighted:", v3);

  }
}

- (void)_didUpdateDarkenColorsSetting:(id)a3
{
  id v4;

  -[ASVButton button](self, "button", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ASVButton _updateTitleStyleForButton:withControlStyle:](self, "_updateTitleStyleForButton:withControlStyle:", v4, -[ASVButton controlStyle](self, "controlStyle"));

}

- (void)_didUpdateContentSizeCategory:(id)a3
{
  UIFont *regularFont;
  UIFont *boldFont;
  id v6;

  regularFont = self->_regularFont;
  self->_regularFont = 0;

  boldFont = self->_boldFont;
  self->_boldFont = 0;

  -[ASVButton button](self, "button");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ASVButton _updateTitleStyleForButton:withControlStyle:](self, "_updateTitleStyleForButton:withControlStyle:", v6, -[ASVButton controlStyle](self, "controlStyle"));

}

- (NSString)title
{
  return (NSString *)-[ASVWrappedButton titleForState:](self->_button, "titleForState:", 0);
}

- (void)setTitle:(id)a3
{
  -[ASVWrappedButton setTitle:forState:](self->_button, "setTitle:forState:", a3, 0);
  -[ASVButton _updateTitleStyleForButton:withControlStyle:](self, "_updateTitleStyleForButton:withControlStyle:", self->_button, -[ASVButton controlStyle](self, "controlStyle"));
}

- (UIImage)image
{
  return (UIImage *)-[ASVWrappedButton imageForState:](self->_button, "imageForState:", 0);
}

- (void)setImage:(id)a3
{
  ASVWrappedButton *button;
  void *v5;
  void *v6;
  id v7;

  button = self->_button;
  v5 = (void *)MEMORY[0x1E0DC3888];
  v7 = a3;
  objc_msgSend(v5, "configurationWithScale:", 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASVWrappedButton setPreferredSymbolConfiguration:forImageInState:](button, "setPreferredSymbolConfiguration:forImageInState:", v6, 0);

  -[ASVWrappedButton setImage:forState:](self->_button, "setImage:forState:", v7, 0);
}

- (void)updateCurrentAppearanceIfNeeded
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  ASVButton *v7;
  void *v8;
  int64_t v9;
  int64_t v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0DC3E88], "_currentTraitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  if (-[ASVButton currentStyle](self, "currentStyle") != v4)
  {
    if (v4 == 2)
    {
      -[ASVButton blurredBackgroundView](self, "blurredBackgroundView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setControlStyle:", 3);

      -[ASVButton button](self, "button");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = self;
      v8 = v6;
      v9 = 3;
    }
    else
    {
      v10 = -[ASVButton controlStyle](self, "controlStyle");
      -[ASVButton blurredBackgroundView](self, "blurredBackgroundView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setControlStyle:", v10);

      -[ASVButton button](self, "button");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[ASVButton controlStyle](self, "controlStyle");
      v7 = self;
      v8 = v6;
    }
    -[ASVButton _updateTitleStyleForButton:withControlStyle:](v7, "_updateTitleStyleForButton:withControlStyle:", v8, v9);

    -[ASVButton setCurrentStyle:](self, "setCurrentStyle:", v4);
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ASVButton;
  -[ASVButton traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[ASVButton updateCurrentAppearanceIfNeeded](self, "updateCurrentAppearanceIfNeeded");
}

- (int64_t)controlStyle
{
  return self->_controlStyle;
}

- (UIEdgeInsets)largeImageInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_largeImageInsets.top;
  left = self->_largeImageInsets.left;
  bottom = self->_largeImageInsets.bottom;
  right = self->_largeImageInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setLargeImageInsets:(UIEdgeInsets)a3
{
  self->_largeImageInsets = a3;
}

- (void)setButton:(id)a3
{
  objc_storeStrong((id *)&self->_button, a3);
}

- (ASVBlurredBackgroundView)blurredBackgroundView
{
  return self->_blurredBackgroundView;
}

- (void)setBlurredBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_blurredBackgroundView, a3);
}

- (void)setButtonStyle:(int64_t)a3
{
  self->_buttonStyle = a3;
}

- (void)setTextStyle:(int64_t)a3
{
  self->_textStyle = a3;
}

- (void)setRegularFont:(id)a3
{
  objc_storeStrong((id *)&self->_regularFont, a3);
}

- (void)setBoldFont:(id)a3
{
  objc_storeStrong((id *)&self->_boldFont, a3);
}

- (UIColor)white35PercentColor
{
  return self->_white35PercentColor;
}

- (void)setWhite35PercentColor:(id)a3
{
  objc_storeStrong((id *)&self->_white35PercentColor, a3);
}

- (UIColor)white100PercentColor
{
  return self->_white100PercentColor;
}

- (void)setWhite100PercentColor:(id)a3
{
  objc_storeStrong((id *)&self->_white100PercentColor, a3);
}

- (UIColor)white70PercentColor
{
  return self->_white70PercentColor;
}

- (void)setWhite70PercentColor:(id)a3
{
  objc_storeStrong((id *)&self->_white70PercentColor, a3);
}

- (UIColor)black35PercentColor
{
  return self->_black35PercentColor;
}

- (void)setBlack35PercentColor:(id)a3
{
  objc_storeStrong((id *)&self->_black35PercentColor, a3);
}

- (UIColor)black70PercentColor
{
  return self->_black70PercentColor;
}

- (void)setBlack70PercentColor:(id)a3
{
  objc_storeStrong((id *)&self->_black70PercentColor, a3);
}

- (UIColor)blue100PercentColor
{
  return self->_blue100PercentColor;
}

- (void)setBlue100PercentColor:(id)a3
{
  objc_storeStrong((id *)&self->_blue100PercentColor, a3);
}

- (UIColor)blue50PercentColor
{
  return self->_blue50PercentColor;
}

- (void)setBlue50PercentColor:(id)a3
{
  objc_storeStrong((id *)&self->_blue50PercentColor, a3);
}

- (int64_t)currentStyle
{
  return self->_currentStyle;
}

- (UIColor)white75PercentColor
{
  return self->_white75PercentColor;
}

- (void)setWhite75PercentColor:(id)a3
{
  objc_storeStrong((id *)&self->_white75PercentColor, a3);
}

- (UIColor)white52PercentColor
{
  return self->_white52PercentColor;
}

- (void)setWhite52PercentColor:(id)a3
{
  objc_storeStrong((id *)&self->_white52PercentColor, a3);
}

- (UIColor)white26PercentColor
{
  return self->_white26PercentColor;
}

- (void)setWhite26PercentColor:(id)a3
{
  objc_storeStrong((id *)&self->_white26PercentColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_white26PercentColor, 0);
  objc_storeStrong((id *)&self->_white52PercentColor, 0);
  objc_storeStrong((id *)&self->_white75PercentColor, 0);
  objc_storeStrong((id *)&self->_blue50PercentColor, 0);
  objc_storeStrong((id *)&self->_blue100PercentColor, 0);
  objc_storeStrong((id *)&self->_black70PercentColor, 0);
  objc_storeStrong((id *)&self->_black35PercentColor, 0);
  objc_storeStrong((id *)&self->_white70PercentColor, 0);
  objc_storeStrong((id *)&self->_white100PercentColor, 0);
  objc_storeStrong((id *)&self->_white35PercentColor, 0);
  objc_storeStrong((id *)&self->_blurredBackgroundView, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_boldFont, 0);
  objc_storeStrong((id *)&self->_regularFont, 0);
}

@end

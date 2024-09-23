@implementation PKUCBPaletteView

+ (id)makeBackgroundView
{
  PKPaletteBackgroundViewFactory *v2;
  void *v3;

  v2 = objc_alloc_init(PKPaletteBackgroundViewFactory);
  -[PKPaletteBackgroundViewFactory makeBackgroundViewWithName:backgroundColor:]((uint64_t)v2, CFSTR("com.apple.pencilkit.ucb.materialbackground"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (PKUCBPaletteView)initWithFrame:(CGRect)a3
{
  PKUCBPaletteView *v3;
  PKUCBPaletteView *v4;
  void *v5;
  UIView *v6;
  UIView *contentView;
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
  uint64_t v19;
  NSArray *nonCompactContentViewConstraints;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSLayoutConstraint *contentViewTopAnchor;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSLayoutConstraint *contentViewBottomAnchor;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  NSLayoutConstraint *contentViewLeadingAnchor;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  NSLayoutConstraint *contentViewTrailingAnchor;
  uint64_t v45;
  NSArray *compactContentViewConstraints;
  void *v47;
  PKPaletteButtonGroupView *v48;
  PKPaletteButtonGroupView *leadingButtonGroupView;
  PKPaletteButtonGroupView *v50;
  PKPaletteButtonGroupView *centeredButtonGroupView;
  PKPaletteButtonGroupView *v52;
  PKPaletteButtonGroupView *trailingButtonGroupView;
  PKPaletteButtonGroupView *v54;
  PKPaletteButtonGroupView *returnKeyButtonGroupView;
  PKPaletteReturnKeyButton *v56;
  PKPaletteReturnKeyButton *returnKeyButton;
  id v58;
  void *v59;
  uint64_t v60;
  UIStackView *buttonStackView;
  void *v62;
  void *v63;
  uint64_t v64;
  NSLayoutConstraint *buttonStackViewBottomConstraint;
  void *v66;
  uint64_t v67;
  NSLayoutConstraint *buttonStackViewHeightConstraint;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v79;
  void *v80;
  void *v81;
  PKPaletteConcreteHandwritingTool *v82;
  objc_super v83;
  _QWORD v84[4];
  _QWORD v85[4];
  _QWORD v86[4];
  _QWORD v87[4];

  v87[2] = *MEMORY[0x1E0C80C00];
  v83.receiver = self;
  v83.super_class = (Class)PKUCBPaletteView;
  v3 = -[PKPaletteView initWithFrame:](&v83, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PKUCBPaletteView setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("Scribble-UCB-Palette"));
    +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4->_alwaysIncludeReturnKeyAndInputAssistantItems = objc_msgSend(v5, "alwaysIncludeReturnKeyAndInputAssistantItems");

    v6 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    contentView = v4->__contentView;
    v4->__contentView = v6;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4->__contentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PKPaletteView containerView](v4, "containerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v4->__contentView);

    -[UIView centerXAnchor](v4->__contentView, "centerXAnchor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteView containerView](v4, "containerView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "centerXAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v87[0] = v13;
    -[UIView centerYAnchor](v4->__contentView, "centerYAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteView containerView](v4, "containerView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "centerYAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v87[1] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v87, 2);
    v19 = objc_claimAutoreleasedReturnValue();
    nonCompactContentViewConstraints = v4->_nonCompactContentViewConstraints;
    v4->_nonCompactContentViewConstraints = (NSArray *)v19;

    -[UIView topAnchor](v4->__contentView, "topAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteView containerView](v4, "containerView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "topAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v24);
    v25 = objc_claimAutoreleasedReturnValue();
    contentViewTopAnchor = v4->__contentViewTopAnchor;
    v4->__contentViewTopAnchor = (NSLayoutConstraint *)v25;

    -[UIView bottomAnchor](v4->__contentView, "bottomAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteView containerView](v4, "containerView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "contentView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "bottomAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v30);
    v31 = objc_claimAutoreleasedReturnValue();
    contentViewBottomAnchor = v4->__contentViewBottomAnchor;
    v4->__contentViewBottomAnchor = (NSLayoutConstraint *)v31;

    -[UIView leadingAnchor](v4->__contentView, "leadingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteView containerView](v4, "containerView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "contentView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "leadingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:", v36);
    v37 = objc_claimAutoreleasedReturnValue();
    contentViewLeadingAnchor = v4->__contentViewLeadingAnchor;
    v4->__contentViewLeadingAnchor = (NSLayoutConstraint *)v37;

    -[UIView trailingAnchor](v4->__contentView, "trailingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteView containerView](v4, "containerView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "contentView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "trailingAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:", v42);
    v43 = objc_claimAutoreleasedReturnValue();
    contentViewTrailingAnchor = v4->__contentViewTrailingAnchor;
    v4->__contentViewTrailingAnchor = (NSLayoutConstraint *)v43;

    v86[0] = v4->__contentViewTopAnchor;
    v86[1] = v4->__contentViewBottomAnchor;
    v86[2] = v4->__contentViewLeadingAnchor;
    v86[3] = v4->__contentViewTrailingAnchor;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v86, 4);
    v45 = objc_claimAutoreleasedReturnValue();
    compactContentViewConstraints = v4->_compactContentViewConstraints;
    v4->_compactContentViewConstraints = (NSArray *)v45;

    v82 = objc_alloc_init(PKPaletteConcreteHandwritingTool);
    -[PKPaletteView toolPreview](v4, "toolPreview");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "showPreviewForTool:animated:", v82, 0);

    v48 = objc_alloc_init(PKPaletteButtonGroupView);
    leadingButtonGroupView = v4->__leadingButtonGroupView;
    v4->__leadingButtonGroupView = v48;

    v50 = objc_alloc_init(PKPaletteButtonGroupView);
    centeredButtonGroupView = v4->__centeredButtonGroupView;
    v4->__centeredButtonGroupView = v50;

    v52 = objc_alloc_init(PKPaletteButtonGroupView);
    trailingButtonGroupView = v4->__trailingButtonGroupView;
    v4->__trailingButtonGroupView = v52;

    v54 = objc_alloc_init(PKPaletteButtonGroupView);
    returnKeyButtonGroupView = v4->__returnKeyButtonGroupView;
    v4->__returnKeyButtonGroupView = v54;

    v56 = objc_alloc_init(PKPaletteReturnKeyButton);
    returnKeyButton = v4->__returnKeyButton;
    v4->__returnKeyButton = v56;

    -[PKPaletteReturnKeyButton addTarget:action:forControlEvents:](v4->__returnKeyButton, "addTarget:action:forControlEvents:", v4, sel__handleReturnKey, 64);
    v58 = objc_alloc(MEMORY[0x1E0DC3CA8]);
    v85[0] = v4->__leadingButtonGroupView;
    v85[1] = v4->__returnKeyButtonGroupView;
    v85[2] = v4->__centeredButtonGroupView;
    v85[3] = v4->__trailingButtonGroupView;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v85, 4);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v58, "initWithArrangedSubviews:", v59);
    buttonStackView = v4->__buttonStackView;
    v4->__buttonStackView = (UIStackView *)v60;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v4->__buttonStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setDistribution:](v4->__buttonStackView, "setDistribution:", 3);
    -[UIStackView setAlignment:](v4->__buttonStackView, "setAlignment:", 3);
    -[UIView addSubview:](v4->__contentView, "addSubview:", v4->__buttonStackView);
    -[UIStackView bottomAnchor](v4->__buttonStackView, "bottomAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v4->__contentView, "bottomAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "constraintEqualToAnchor:", v63);
    v64 = objc_claimAutoreleasedReturnValue();
    buttonStackViewBottomConstraint = v4->__buttonStackViewBottomConstraint;
    v4->__buttonStackViewBottomConstraint = (NSLayoutConstraint *)v64;

    -[UIStackView heightAnchor](v4->__buttonStackView, "heightAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKUCBPaletteView compactPaletteHeight](v4, "compactPaletteHeight");
    objc_msgSend(v66, "constraintEqualToConstant:");
    v67 = objc_claimAutoreleasedReturnValue();
    buttonStackViewHeightConstraint = v4->__buttonStackViewHeightConstraint;
    v4->__buttonStackViewHeightConstraint = (NSLayoutConstraint *)v67;

    v79 = (void *)MEMORY[0x1E0CB3718];
    -[UIStackView topAnchor](v4->__buttonStackView, "topAnchor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](v4->__contentView, "topAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "constraintEqualToAnchor:", v69);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v84[0] = v70;
    v84[1] = v4->__buttonStackViewBottomConstraint;
    -[UIStackView leadingAnchor](v4->__buttonStackView, "leadingAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](v4->__contentView, "leadingAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "constraintEqualToAnchor:", v72);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v84[2] = v73;
    -[UIStackView trailingAnchor](v4->__buttonStackView, "trailingAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v4->__contentView, "trailingAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "constraintEqualToAnchor:", v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v84[3] = v76;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v84, 4);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "activateConstraints:", v77);

    -[PKUCBPaletteView _updateUI](v4, "_updateUI");
  }
  return v4;
}

- (void)updateConstraints
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  if (-[PKPaletteView useCompactSize](self, "useCompactSize"))
  {
    -[PKUCBPaletteView _contentMargin](self, "_contentMargin");
    v4 = v3;
    -[PKUCBPaletteView _contentViewLeadingAnchor](self, "_contentViewLeadingAnchor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setConstant:", v4);

    -[PKUCBPaletteView _contentMargin](self, "_contentMargin");
    v7 = -v6;
    -[PKUCBPaletteView _contentViewTrailingAnchor](self, "_contentViewTrailingAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setConstant:", v7);

    v9 = (void *)MEMORY[0x1E0CB3718];
    -[PKUCBPaletteView nonCompactContentViewConstraints](self, "nonCompactContentViewConstraints");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deactivateConstraints:", v10);

    v11 = (void *)MEMORY[0x1E0CB3718];
    -[PKUCBPaletteView compactContentViewConstraints](self, "compactContentViewConstraints");
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0CB3718];
    -[PKUCBPaletteView compactContentViewConstraints](self, "compactContentViewConstraints");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "deactivateConstraints:", v13);

    v11 = (void *)MEMORY[0x1E0CB3718];
    -[PKUCBPaletteView nonCompactContentViewConstraints](self, "nonCompactContentViewConstraints");
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "activateConstraints:", v14);

  v15.receiver = self;
  v15.super_class = (Class)PKUCBPaletteView;
  -[PKUCBPaletteView updateConstraints](&v15, sel_updateConstraints);
}

- (double)_contentMargin
{
  double v2;

  -[PKPaletteView paletteScaleFactor](self, "paletteScaleFactor");
  return v2 * 26.0;
}

- (double)_buttonGroupSpacing
{
  double v2;

  -[PKPaletteView paletteScaleFactor](self, "paletteScaleFactor");
  return v2 * 26.0;
}

- (double)_narrowLength
{
  double v2;

  -[PKPaletteView paletteScaleFactor](self, "paletteScaleFactor");
  return v2 * 88.0;
}

- (double)responseForThrowingFromPosition:(int64_t)a3 toPosition:(int64_t)a4 withVelocity:(CGPoint)a5
{
  double v5;
  unint64_t v6;
  _BOOL4 v7;
  BOOL v8;
  double result;
  void *v10;
  void *v11;
  double v12;
  unint64_t v13;
  BOOL v14;
  BOOL v15;

  v5 = sqrt(a5.y * a5.y + a5.x * a5.x);
  switch(a3)
  {
    case 1:
      v6 = a4 - 5;
      goto LABEL_5;
    case 2:
      v7 = (a4 & 0xFFFFFFFFFFFFFFFELL) == 6;
      goto LABEL_9;
    case 3:
      v6 = a4 - 7;
LABEL_5:
      if (v6 >= 2)
        goto LABEL_12;
      v7 = 1;
LABEL_9:
      v8 = v5 > 2700.0;
      if (!v7 || v5 <= 2700.0)
        goto LABEL_13;
      return 0.456;
    case 4:
      v7 = 1;
      if (a4 == 5 || a4 == 8)
        goto LABEL_9;
      goto LABEL_12;
    default:
LABEL_12:
      v8 = v5 > 2700.0;
LABEL_13:
      if ((a3 & 0xFFFFFFFFFFFFFFFDLL) != 1 || a4 != 2 && a4 != 4)
      {
        switch(a3)
        {
          case 1:
LABEL_25:
            v13 = a4 - 7;
            goto LABEL_31;
          case 2:
          case 4:
            if ((a4 & 0xFFFFFFFFFFFFFFFDLL) != 1)
              v8 = 0;
            break;
          case 3:
LABEL_30:
            v13 = a4 - 5;
LABEL_31:
            v15 = v13 < 2;
            goto LABEL_33;
          default:
            goto LABEL_32;
        }
      }
      if (v8)
        return 0.456;
      break;
  }
  switch(a3)
  {
    case 1:
      goto LABEL_25;
    case 2:
    case 4:
      if (a4 == 4 || a4 == 2)
      {
        -[PKUCBPaletteView window](self, "window");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "windowScene");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = dbl_1BE4FE1D0[(unint64_t)(objc_msgSend(v11, "interfaceOrientation") - 1) < 2];

        return dbl_1BE4FE1E0[v5 > v12];
      }
      switch(a3)
      {
        case 2:
          v14 = a4 == 5 || a4 == 8;
          goto LABEL_39;
        case 3:
          goto LABEL_30;
        case 4:
          v14 = (a4 & 0xFFFFFFFFFFFFFFFELL) == 6;
LABEL_39:
          v15 = v14;
          goto LABEL_33;
      }
LABEL_32:
      v15 = 0;
LABEL_33:
      result = 0.7;
      if (v15 && v5 > 7000.0)
        return 0.456;
      return result;
    case 3:
      goto LABEL_30;
    default:
      goto LABEL_32;
  }
}

- (double)dampingRatioForThrowingFromPosition:(int64_t)a3 toPosition:(int64_t)a4 withVelocity:(CGPoint)a5
{
  double v5;
  unint64_t v6;
  _BOOL4 v7;
  _BOOL4 v8;
  double result;
  _BOOL4 v11;
  _BOOL4 v12;

  v5 = sqrt(a5.y * a5.y + a5.x * a5.x);
  switch(a3)
  {
    case 1:
      v6 = a4 - 5;
      goto LABEL_5;
    case 2:
      v7 = (a4 & 0xFFFFFFFFFFFFFFFELL) == 6;
      goto LABEL_9;
    case 3:
      v6 = a4 - 7;
LABEL_5:
      if (v6 >= 2)
        goto LABEL_12;
      v7 = 1;
LABEL_9:
      if (v7 && v5 > 1900.0)
        return 0.95;
LABEL_11:
      if ((a3 & 0xFFFFFFFFFFFFFFFDLL) != 1)
        goto LABEL_14;
LABEL_12:
      v8 = 1;
      if (a4 == 2 || a4 == 4)
        goto LABEL_17;
LABEL_14:
      if (a3 != 4 && a3 != 2)
        goto LABEL_28;
LABEL_16:
      v8 = (a4 & 0xFFFFFFFFFFFFFFFDLL) == 1;
LABEL_17:
      if (v8 && v5 > 3000.0)
        return 0.95;
      if (a3 == 4 || a3 == 2)
        v11 = a4 == 2 || a4 == 4;
      else
LABEL_28:
        v11 = 0;
      v12 = v5 > 4000.0;
      result = 0.8;
      if (v11 && v12)
        return 0.95;
      return result;
    case 4:
      v7 = 1;
      if (a4 == 5 || a4 == 8)
        goto LABEL_9;
      goto LABEL_16;
    default:
      goto LABEL_11;
  }
}

- (double)compactPaletteHeight
{
  return 50.0;
}

- (id)borderColorForTraitCollection:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;

  v3 = a3;
  if (UIAccessibilityDarkerSystemColorsEnabled())
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGray4Color");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = objc_msgSend(v3, "userInterfaceStyle");
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGray4Color");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5 == 2)
      v8 = 0.4;
    else
      v8 = 0.5;
    objc_msgSend(v6, "colorWithAlphaComponent:", v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (double)borderWidthForTraitCollection:(id)a3
{
  _BOOL4 v3;
  double result;

  v3 = UIAccessibilityDarkerSystemColorsEnabled();
  result = 0.5;
  if (v3)
    return 1.0;
  return result;
}

- (double)shadowOpacity
{
  _BOOL4 v2;
  double result;

  v2 = UIAccessibilityDarkerSystemColorsEnabled();
  result = 0.25;
  if (v2)
    return 0.5;
  return result;
}

- (double)shadowRadius
{
  return 15.0;
}

- (BOOL)shouldAdjustShadowRadiusForMinimized
{
  return 0;
}

- (void)didChangePaletteScaleFactor
{
  objc_super v3;

  -[PKUCBPaletteView _updateUI](self, "_updateUI");
  v3.receiver = self;
  v3.super_class = (Class)PKUCBPaletteView;
  -[PKPaletteView didChangePaletteScaleFactor](&v3, sel_didChangePaletteScaleFactor);
  -[PKUCBPaletteView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (CGSize)paletteSizeForEdge:(unint64_t)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  int64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  int v16;
  double v17;
  _BOOL4 v19;
  int v20;
  double v21;
  CGSize result;

  -[PKUCBPaletteView _buttonStackView](self, "_buttonStackView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0DC4FF8], *(double *)(MEMORY[0x1E0DC4FF8] + 8));
  v7 = v6;
  v9 = v8;

  v10 = -[PKPaletteView palettePosition](self, "palettePosition");
  if (v10 == 4 || v10 == 2)
  {
    -[PKUCBPaletteView _contentMargin](self, "_contentMargin");
    v12 = v11 + v11;
    -[PKUCBPaletteView _narrowLength](self, "_narrowLength");
    v14 = v13;
    v15 = v9 + v12;
    v16 = 1;
  }
  else
  {
    -[PKUCBPaletteView _contentMargin](self, "_contentMargin");
    v14 = v7 + v17 + v17;
    -[PKUCBPaletteView _narrowLength](self, "_narrowLength");
    v16 = 0;
  }
  v19 = a3 == 2 || a3 == 8;
  v20 = v19 ^ v16;
  if (v20)
    v21 = v14;
  else
    v21 = v15;
  if (!v20)
    v15 = v14;
  result.height = v21;
  result.width = v15;
  return result;
}

- (BOOL)shouldStartUpMinimized
{
  return -[PKUCBPaletteView returnKeyType](self, "returnKeyType") == 0;
}

- (BOOL)shouldExpandFromCorner
{
  return -[PKUCBPaletteView returnKeyType](self, "returnKeyType") != 0;
}

- (void)willStartAppearanceAnimation:(BOOL)a3
{
  _BOOL4 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PKUCBPaletteView;
  -[PKPaletteView willStartAppearanceAnimation:](&v5, sel_willStartAppearanceAnimation_);
  if (v3)
    -[PKUCBPaletteView _flashLanguageIndicatorIfNeeded](self, "_flashLanguageIndicatorIfNeeded");
}

- (BOOL)isPalettePresentingPopover
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[PKPaletteView palettePopoverPresentingController](self, "palettePopoverPresentingController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v4 == v5;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)toolPreviewMatchesExpandedTool
{
  return 0;
}

- (void)setReturnKeyType:(int64_t)a3
{
  void *v4;
  id v5;

  if (self->_returnKeyType != a3)
  {
    self->_returnKeyType = a3;
    -[PKUCBPaletteView _updateUI](self, "_updateUI");
    -[PKPaletteView internalDelegate](self, "internalDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "paletteViewContentSizeDidChange:", self);

    -[PKPaletteView internalDelegate](self, "internalDelegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "paletteViewReturnKeyTypeDidChange:", self);

  }
}

- (void)setReturnKeyEnabled:(BOOL)a3
{
  if (self->_returnKeyEnabled != a3)
  {
    self->_returnKeyEnabled = a3;
    -[PKUCBPaletteView _updateUI](self, "_updateUI");
  }
}

- (void)setLocaleIdentifier:(id)a3
{
  NSString *v4;
  NSString *localeIdentifier;
  id v6;

  v6 = a3;
  if (!-[NSString isEqualToString:](self->_localeIdentifier, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    localeIdentifier = self->_localeIdentifier;
    self->_localeIdentifier = v4;

    -[PKUCBPaletteView _updateUI](self, "_updateUI");
  }

}

- (void)setLeadingBarButtons:(id)a3
{
  NSArray *v4;
  NSArray *leadingBarButtons;
  id v6;

  if (self->_leadingBarButtons != a3)
  {
    v4 = (NSArray *)objc_msgSend(a3, "copy");
    leadingBarButtons = self->_leadingBarButtons;
    self->_leadingBarButtons = v4;

    -[PKUCBPaletteView _updateUI](self, "_updateUI");
    -[PKPaletteView internalDelegate](self, "internalDelegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "paletteViewContentSizeDidChange:", self);

  }
}

- (void)setCenteredBarButtons:(id)a3
{
  NSArray *v4;
  NSArray *centeredBarButtons;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSArray *v11;
  NSArray *v12;
  void *v13;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = (NSArray *)a3;
  centeredBarButtons = self->_centeredBarButtons;
  if (centeredBarButtons != v4)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v6 = centeredBarButtons;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v24;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v24 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v10++), "removeIntrinsicContentSizeObserver:", self);
        }
        while (v8 != v10);
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v8);
    }

    v11 = (NSArray *)-[NSArray copy](v4, "copy");
    v12 = self->_centeredBarButtons;
    self->_centeredBarButtons = v11;

    -[PKUCBPaletteView _updateUI](self, "_updateUI");
    -[PKPaletteView internalDelegate](self, "internalDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "paletteViewContentSizeDidChange:", self);

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v14 = self->_centeredBarButtons;
    v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v20;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v20 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v18++), "addIntrinsicContentSizeObserver:", self, (_QWORD)v19);
        }
        while (v16 != v18);
        v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      }
      while (v16);
    }

  }
}

- (void)setTrailingBarButtons:(id)a3
{
  NSArray *v4;
  NSArray *trailingBarButtons;
  id v6;

  if (self->_trailingBarButtons != a3)
  {
    v4 = (NSArray *)objc_msgSend(a3, "copy");
    trailingBarButtons = self->_trailingBarButtons;
    self->_trailingBarButtons = v4;

    -[PKUCBPaletteView _updateUI](self, "_updateUI");
    -[PKPaletteView internalDelegate](self, "internalDelegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "paletteViewContentSizeDidChange:", self);

  }
}

- (void)_flashLanguageIndicatorIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  if (-[PKPaletteView isToolPreviewMinimized](self, "isToolPreviewMinimized"))
  {
    +[PKTextInputLanguageSelectionController sharedInstance](PKTextInputLanguageSelectionController, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "shouldIdentifyLanguages"))
    {
      objc_msgSend(v3, "languageIdentificationIcon");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v4);
      objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setTintColor:", v6);

      objc_msgSend(v4, "size");
      v7 = 1.0;
      if (v8 > 0.0)
      {
        objc_msgSend(v4, "size");
        v10 = v9;
        objc_msgSend(v4, "size");
        v7 = v10 / v11;
      }
      v12 = (void *)MEMORY[0x1E0CB3718];
      objc_msgSend(v5, "heightAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "constraintEqualToConstant:", 28.0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v14;
      objc_msgSend(v5, "widthAnchor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "heightAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "constraintEqualToAnchor:multiplier:", v16, v7);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v21[1] = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
      v20 = v4;
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "activateConstraints:", v18);

      -[PKPaletteView toolPreview](self, "toolPreview");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "flashAlternatePreviewView:", v5);

    }
  }
}

- (void)buttonDidChangeIntrinsicContentSize:(id)a3
{
  id v4;

  if (!-[PKUCBPaletteView isUpdatingUI](self, "isUpdatingUI", a3))
  {
    -[PKPaletteView internalDelegate](self, "internalDelegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "paletteViewContentSizeDidChange:", self);

  }
}

- (unint64_t)paletteViewType
{
  return 2;
}

- (void)_handleReturnKey
{
  void *v3;
  void (**v4)(id, PKUCBPaletteView *);

  -[PKUCBPaletteView returnKeyHandler](self, "returnKeyHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PKUCBPaletteView returnKeyHandler](self, "returnKeyHandler");
    v4 = (void (**)(id, PKUCBPaletteView *))objc_claimAutoreleasedReturnValue();
    v4[2](v4, self);

  }
}

- (void)_performUpdateUIBlock:(id)a3
{
  void (**v4)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  -[PKUCBPaletteView setUpdatingUI:](self, "setUpdatingUI:", 1);
  v4[2](v4);

  -[PKUCBPaletteView setUpdatingUI:](self, "setUpdatingUI:", 0);
}

- (void)_updateUI
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __29__PKUCBPaletteView__updateUI__block_invoke;
  v2[3] = &unk_1E7778020;
  v2[4] = self;
  -[PKUCBPaletteView _performUpdateUIBlock:](self, "_performUpdateUIBlock:", v2);
}

uint64_t __29__PKUCBPaletteView__updateUI__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;

  objc_msgSend(MEMORY[0x1E0DC3658], "pk_paletteBackgroundColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setBackgroundColor:", v2);

  objc_msgSend(*(id *)(a1 + 32), "localeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "toolPreview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLocaleIdentifier:", v3);

  objc_msgSend(*(id *)(a1 + 32), "_buttonGroupSpacing");
  v6 = v5;
  objc_msgSend(*(id *)(a1 + 32), "_buttonStackView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSpacing:", v6);

  v8 = objc_msgSend(*(id *)(a1 + 32), "useCompactSize") ^ 1;
  objc_msgSend(*(id *)(a1 + 32), "_buttonStackViewBottomConstraint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setActive:", v8);

  v10 = objc_msgSend(*(id *)(a1 + 32), "useCompactSize");
  objc_msgSend(*(id *)(a1 + 32), "_buttonStackViewHeightConstraint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setActive:", v10);

  objc_msgSend(*(id *)(a1 + 32), "paletteScaleFactor");
  v13 = v12;
  objc_msgSend(*(id *)(a1 + 32), "_leadingButtonGroupView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setScalingFactor:", v13);

  objc_msgSend(*(id *)(a1 + 32), "paletteScaleFactor");
  v16 = v15;
  objc_msgSend(*(id *)(a1 + 32), "_trailingButtonGroupView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setScalingFactor:", v16);

  objc_msgSend(*(id *)(a1 + 32), "paletteScaleFactor");
  v19 = v18;
  objc_msgSend(*(id *)(a1 + 32), "_centeredButtonGroupView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setScalingFactor:", v19);

  objc_msgSend(*(id *)(a1 + 32), "paletteScaleFactor");
  v22 = v21;
  objc_msgSend(*(id *)(a1 + 32), "_returnKeyButtonGroupView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setScalingFactor:", v22);

  objc_msgSend(*(id *)(a1 + 32), "_updateReturnKeyButton");
  objc_msgSend(*(id *)(a1 + 32), "_updateLeadingButtonGroup");
  objc_msgSend(*(id *)(a1 + 32), "_updateCenteredButtonGroup");
  objc_msgSend(*(id *)(a1 + 32), "_updateTrailingButtonGroup");
  return objc_msgSend(*(id *)(a1 + 32), "_updateSubviewLayoutAxis");
}

- (void)_updateReturnKeyButton
{
  int64_t v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = -[PKUCBPaletteView returnKeyType](self, "returnKeyType");
  -[PKUCBPaletteView _returnKeyButton](self, "_returnKeyButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReturnKeyType:", v3);

  v5 = -[PKUCBPaletteView isReturnKeyEnabled](self, "isReturnKeyEnabled");
  -[PKUCBPaletteView _returnKeyButton](self, "_returnKeyButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", v5);

  v7 = -[PKUCBPaletteView _shouldHideReturnKeyButtonGroupView](self, "_shouldHideReturnKeyButtonGroupView");
  -[PKUCBPaletteView _returnKeyButtonGroupView](self, "_returnKeyButtonGroupView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHidden:", v7);

  if (!-[PKUCBPaletteView _shouldHideReturnKeyButtonGroupView](self, "_shouldHideReturnKeyButtonGroupView"))
  {
    -[PKUCBPaletteView _returnKeyButtonGroupView](self, "_returnKeyButtonGroupView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeAllButtons");

    -[PKUCBPaletteView _returnKeyButtonGroupView](self, "_returnKeyButtonGroupView");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[PKUCBPaletteView _returnKeyButton](self, "_returnKeyButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addButton:", v10);

  }
}

- (BOOL)_shouldHideReturnKeyButtonGroupView
{
  if (-[PKPaletteView useCompactSize](self, "useCompactSize"))
    return 1;
  else
    return !-[PKUCBPaletteView _shouldShowReturnKey](self, "_shouldShowReturnKey");
}

- (void)_updateLeadingButtonGroup
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = -[PKUCBPaletteView _shouldHideLeadingButtonGroupView](self, "_shouldHideLeadingButtonGroupView");
  -[PKUCBPaletteView _leadingButtonGroupView](self, "_leadingButtonGroupView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

  if (!-[PKUCBPaletteView _shouldHideLeadingButtonGroupView](self, "_shouldHideLeadingButtonGroupView"))
  {
    -[PKUCBPaletteView _leadingButtonGroupView](self, "_leadingButtonGroupView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeAllButtons");

    -[PKUCBPaletteView _leadingButtonGroupView](self, "_leadingButtonGroupView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKUCBPaletteView leadingBarButtons](self, "leadingBarButtons");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addButtonsFromArray:", v7);

    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[PKUCBPaletteView _leadingButtonGroupView](self, "_leadingButtonGroupView", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "buttons");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "setUseCompactLayout:", -[PKPaletteView useCompactSize](self, "useCompactSize"));
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v11);
    }

  }
}

- (BOOL)_shouldHideLeadingButtonGroupView
{
  void *v3;
  BOOL v4;

  -[PKUCBPaletteView leadingBarButtons](self, "leadingBarButtons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
    v4 = -[PKPaletteView useCompactSize](self, "useCompactSize");
  else
    v4 = 1;

  return v4;
}

- (void)_updateCenteredButtonGroup
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = -[PKUCBPaletteView _shouldShowCenterButtonGroupView](self, "_shouldShowCenterButtonGroupView") ^ 1;
  -[PKUCBPaletteView _centeredButtonGroupView](self, "_centeredButtonGroupView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

  if (-[PKUCBPaletteView _shouldShowCenterButtonGroupView](self, "_shouldShowCenterButtonGroupView"))
  {
    -[PKUCBPaletteView _centeredButtonGroupView](self, "_centeredButtonGroupView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeAllButtons");

    -[PKUCBPaletteView _centeredButtonGroupView](self, "_centeredButtonGroupView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKUCBPaletteView _centeredBarButtons](self, "_centeredBarButtons");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addButtonsFromArray:", v7);

    v8 = -[PKUCBPaletteView _shouldHideLeadingButtonGroupView](self, "_shouldHideLeadingButtonGroupView")
      || -[PKUCBPaletteView _shouldHideTrailingButtonGroupView](self, "_shouldHideTrailingButtonGroupView");
    -[PKUCBPaletteView _centeredButtonGroupView](self, "_centeredButtonGroupView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setUseEqualInterItemSpacing:", v8);

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[PKUCBPaletteView _centeredButtonGroupView](self, "_centeredButtonGroupView", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "buttons");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v17;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v17 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v15++), "setUseCompactLayout:", -[PKPaletteView useCompactSize](self, "useCompactSize"));
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v13);
    }

  }
}

- (BOOL)_shouldShowCenterButtonGroupView
{
  BOOL v3;
  void *v4;

  if (-[PKPaletteView useCompactSize](self, "useCompactSize"))
    return 1;
  if (!-[PKUCBPaletteView _shouldShowInputAssistantItems](self, "_shouldShowInputAssistantItems"))
    return 0;
  -[PKUCBPaletteView _centeredBarButtons](self, "_centeredBarButtons");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v4, "count") != 0;

  return v3;
}

- (id)_centeredBarButtons
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;

  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PKPaletteView useCompactSize](self, "useCompactSize");
  -[PKUCBPaletteView centeredBarButtons](self, "centeredBarButtons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v4)
  {
    v7 = v3;
    goto LABEL_19;
  }
  objc_msgSend(v5, "indexesOfObjectsPassingTest:", &__block_literal_global_57);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKUCBPaletteView leadingBarButtons](self, "leadingBarButtons");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    v9 = objc_msgSend(v7, "count");

    if (v9 > 3)
      goto LABEL_6;
    -[PKUCBPaletteView leadingBarButtons](self, "leadingBarButtons");
    v8 = v3;
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_6:
  if (-[PKUCBPaletteView _shouldShowReturnKey](self, "_shouldShowReturnKey"))
  {
    -[PKUCBPaletteView _returnKeyButton](self, "_returnKeyButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "arrayByAddingObject:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v11;
  }
  if (objc_msgSend(v7, "count"))
  {
    -[PKUCBPaletteView centeredBarButtons](self, "centeredBarButtons");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectsAtIndexes:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v13, "count");
    if (v14 >= 8)
      v15 = 8;
    else
      v15 = v14;
    objc_msgSend(v13, "subarrayWithRange:", 0, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v16);
    v17 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v17;
  }
  -[PKUCBPaletteView trailingBarButtons](self, "trailingBarButtons");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v18, "count"))
    goto LABEL_16;
  v19 = objc_msgSend(v7, "count");

  if (v19 <= 5)
  {
    -[PKUCBPaletteView trailingBarButtons](self, "trailingBarButtons");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v18);
    v20 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v20;
LABEL_16:

  }
  v6 = v3;
LABEL_19:

  return v6;
}

uint64_t __39__PKUCBPaletteView__centeredBarButtons__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isHidden") ^ 1;
}

- (void)_updateTrailingButtonGroup
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = -[PKUCBPaletteView _shouldHideTrailingButtonGroupView](self, "_shouldHideTrailingButtonGroupView");
  -[PKUCBPaletteView _trailingButtonGroupView](self, "_trailingButtonGroupView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

  if (!-[PKUCBPaletteView _shouldHideTrailingButtonGroupView](self, "_shouldHideTrailingButtonGroupView"))
  {
    -[PKUCBPaletteView _trailingButtonGroupView](self, "_trailingButtonGroupView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeAllButtons");

    -[PKUCBPaletteView _trailingButtonGroupView](self, "_trailingButtonGroupView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKUCBPaletteView trailingBarButtons](self, "trailingBarButtons");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addButtonsFromArray:", v7);

    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[PKUCBPaletteView _trailingButtonGroupView](self, "_trailingButtonGroupView", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "buttons");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "setUseCompactLayout:", -[PKPaletteView useCompactSize](self, "useCompactSize"));
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v11);
    }

  }
}

- (BOOL)_shouldHideTrailingButtonGroupView
{
  void *v3;
  BOOL v4;

  -[PKUCBPaletteView trailingBarButtons](self, "trailingBarButtons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
    v4 = -[PKPaletteView useCompactSize](self, "useCompactSize");
  else
    v4 = 1;

  return v4;
}

- (void)_updateSubviewLayoutAxis
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = ((-[PKPaletteView palettePosition](self, "palettePosition") - 2) & 0xFFFFFFFFFFFFFFFDLL) == 0;
  -[PKUCBPaletteView _buttonStackView](self, "_buttonStackView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAxis:", v3);

  -[PKUCBPaletteView _leadingButtonGroupView](self, "_leadingButtonGroupView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAxis:", v3);

  -[PKUCBPaletteView _centeredButtonGroupView](self, "_centeredButtonGroupView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAxis:", v3);

  -[PKUCBPaletteView _trailingButtonGroupView](self, "_trailingButtonGroupView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAxis:", v3);

  -[PKUCBPaletteView _returnKeyButton](self, "_returnKeyButton");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAxis:", v3);

}

- (BOOL)_shouldShowReturnKey
{
  return -[PKUCBPaletteView alwaysIncludeReturnKeyAndInputAssistantItems](self, "alwaysIncludeReturnKeyAndInputAssistantItems")|| -[PKUCBPaletteView returnKeyType](self, "returnKeyType") != 0;
}

- (BOOL)_shouldShowInputAssistantItems
{
  return -[PKUCBPaletteView alwaysIncludeReturnKeyAndInputAssistantItems](self, "alwaysIncludeReturnKeyAndInputAssistantItems")|| -[PKUCBPaletteView returnKeyType](self, "returnKeyType") == 0;
}

- (void)dismissPalettePopoverWithCompletion:(id)a3
{
  id v3;
  objc_super v4;
  _QWORD v5[4];
  PKUCBPaletteView *v6;
  id v7;

  v5[1] = 3221225472;
  v5[2] = __56__PKUCBPaletteView_dismissPalettePopoverWithCompletion___block_invoke;
  v5[3] = &unk_1E7778AA0;
  v6 = self;
  v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)PKUCBPaletteView;
  v5[0] = MEMORY[0x1E0C809B0];
  v3 = v7;
  -[PKPaletteView dismissPalettePopoverWithCompletion:](&v4, sel_dismissPalettePopoverWithCompletion_, v5);

}

void __56__PKUCBPaletteView_dismissPalettePopoverWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  if (objc_msgSend(*(id *)(a1 + 32), "isPalettePresentingPopover"))
  {
    objc_msgSend(*(id *)(a1 + 32), "palettePopoverPresentingController");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, *(_QWORD *)(a1 + 40));

  }
  else
  {
    v2 = *(_QWORD *)(a1 + 40);
    if (v2)
      (*(void (**)(void))(v2 + 16))();
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKUCBPaletteView;
  -[PKPaletteView traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);
  -[PKUCBPaletteView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "verticalSizeClass");
  if (v6 == objc_msgSend(v4, "verticalSizeClass"))
  {
    -[PKUCBPaletteView traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "horizontalSizeClass");
    v9 = objc_msgSend(v4, "horizontalSizeClass");

    if (v8 == v9)
      goto LABEL_6;
  }
  else
  {

  }
  -[PKUCBPaletteView _updateUI](self, "_updateUI");
  -[PKUCBPaletteView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
LABEL_6:

}

- (int64_t)returnKeyType
{
  return self->_returnKeyType;
}

- (BOOL)isReturnKeyEnabled
{
  return self->_returnKeyEnabled;
}

- (id)returnKeyHandler
{
  return self->_returnKeyHandler;
}

- (void)setReturnKeyHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 800);
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (NSArray)leadingBarButtons
{
  return self->_leadingBarButtons;
}

- (NSArray)centeredBarButtons
{
  return self->_centeredBarButtons;
}

- (NSArray)trailingBarButtons
{
  return self->_trailingBarButtons;
}

- (UIView)_contentView
{
  return self->__contentView;
}

- (void)set_contentView:(id)a3
{
  objc_storeStrong((id *)&self->__contentView, a3);
}

- (NSLayoutConstraint)_contentViewTopAnchor
{
  return self->__contentViewTopAnchor;
}

- (void)set_contentViewTopAnchor:(id)a3
{
  objc_storeStrong((id *)&self->__contentViewTopAnchor, a3);
}

- (NSLayoutConstraint)_contentViewBottomAnchor
{
  return self->__contentViewBottomAnchor;
}

- (void)set_contentViewBottomAnchor:(id)a3
{
  objc_storeStrong((id *)&self->__contentViewBottomAnchor, a3);
}

- (NSLayoutConstraint)_contentViewLeadingAnchor
{
  return self->__contentViewLeadingAnchor;
}

- (void)set_contentViewLeadingAnchor:(id)a3
{
  objc_storeStrong((id *)&self->__contentViewLeadingAnchor, a3);
}

- (NSLayoutConstraint)_contentViewTrailingAnchor
{
  return self->__contentViewTrailingAnchor;
}

- (void)set_contentViewTrailingAnchor:(id)a3
{
  objc_storeStrong((id *)&self->__contentViewTrailingAnchor, a3);
}

- (UIStackView)_buttonStackView
{
  return self->__buttonStackView;
}

- (void)set_buttonStackView:(id)a3
{
  objc_storeStrong((id *)&self->__buttonStackView, a3);
}

- (NSLayoutConstraint)_buttonStackViewHeightConstraint
{
  return self->__buttonStackViewHeightConstraint;
}

- (void)set_buttonStackViewHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->__buttonStackViewHeightConstraint, a3);
}

- (NSLayoutConstraint)_buttonStackViewBottomConstraint
{
  return self->__buttonStackViewBottomConstraint;
}

- (void)set_buttonStackViewBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->__buttonStackViewBottomConstraint, a3);
}

- (PKPaletteButtonGroupView)_leadingButtonGroupView
{
  return self->__leadingButtonGroupView;
}

- (void)set_leadingButtonGroupView:(id)a3
{
  objc_storeStrong((id *)&self->__leadingButtonGroupView, a3);
}

- (PKPaletteButtonGroupView)_centeredButtonGroupView
{
  return self->__centeredButtonGroupView;
}

- (void)set_centeredButtonGroupView:(id)a3
{
  objc_storeStrong((id *)&self->__centeredButtonGroupView, a3);
}

- (PKPaletteButtonGroupView)_trailingButtonGroupView
{
  return self->__trailingButtonGroupView;
}

- (void)set_trailingButtonGroupView:(id)a3
{
  objc_storeStrong((id *)&self->__trailingButtonGroupView, a3);
}

- (PKPaletteButtonGroupView)_returnKeyButtonGroupView
{
  return self->__returnKeyButtonGroupView;
}

- (void)set_returnKeyButtonGroupView:(id)a3
{
  objc_storeStrong((id *)&self->__returnKeyButtonGroupView, a3);
}

- (PKPaletteReturnKeyButton)_returnKeyButton
{
  return self->__returnKeyButton;
}

- (void)set_returnKeyButton:(id)a3
{
  objc_storeStrong((id *)&self->__returnKeyButton, a3);
}

- (BOOL)alwaysIncludeReturnKeyAndInputAssistantItems
{
  return self->_alwaysIncludeReturnKeyAndInputAssistantItems;
}

- (void)setAlwaysIncludeReturnKeyAndInputAssistantItems:(BOOL)a3
{
  self->_alwaysIncludeReturnKeyAndInputAssistantItems = a3;
}

- (BOOL)isUpdatingUI
{
  return self->_updatingUI;
}

- (void)setUpdatingUI:(BOOL)a3
{
  self->_updatingUI = a3;
}

- (NSArray)nonCompactContentViewConstraints
{
  return self->_nonCompactContentViewConstraints;
}

- (void)setNonCompactContentViewConstraints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 944);
}

- (NSArray)compactContentViewConstraints
{
  return self->_compactContentViewConstraints;
}

- (void)setCompactContentViewConstraints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 952);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compactContentViewConstraints, 0);
  objc_storeStrong((id *)&self->_nonCompactContentViewConstraints, 0);
  objc_storeStrong((id *)&self->__returnKeyButton, 0);
  objc_storeStrong((id *)&self->__returnKeyButtonGroupView, 0);
  objc_storeStrong((id *)&self->__trailingButtonGroupView, 0);
  objc_storeStrong((id *)&self->__centeredButtonGroupView, 0);
  objc_storeStrong((id *)&self->__leadingButtonGroupView, 0);
  objc_storeStrong((id *)&self->__buttonStackViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->__buttonStackViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->__buttonStackView, 0);
  objc_storeStrong((id *)&self->__contentViewTrailingAnchor, 0);
  objc_storeStrong((id *)&self->__contentViewLeadingAnchor, 0);
  objc_storeStrong((id *)&self->__contentViewBottomAnchor, 0);
  objc_storeStrong((id *)&self->__contentViewTopAnchor, 0);
  objc_storeStrong((id *)&self->__contentView, 0);
  objc_storeStrong((id *)&self->_trailingBarButtons, 0);
  objc_storeStrong((id *)&self->_centeredBarButtons, 0);
  objc_storeStrong((id *)&self->_leadingBarButtons, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong(&self->_returnKeyHandler, 0);
}

@end

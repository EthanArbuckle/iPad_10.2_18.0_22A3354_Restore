@implementation MUCardButton

- (MUCardButton)initWithFrame:(CGRect)a3
{
  MUCardButton *v3;
  MUCardButton *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MUCardButton;
  v3 = -[MUCardButton initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MUCardButton _setupDefaults](v3, "_setupDefaults");
    -[MUCardButton _setupButton](v4, "_setupButton");
    -[MUCardButton _setupConstraints](v4, "_setupConstraints");
    -[MUCardButton _updateButtonAppearance](v4, "_updateButtonAppearance");
  }
  return v4;
}

- (void)_setupDefaults
{
  NSString *symbolName;
  UIColor *v4;
  UIColor *foregroundColor;

  self->_drawBackground = MUIdiomInTraitEnvironment(self) != 5;
  self->_blurBackground = 0;
  symbolName = self->_symbolName;
  self->_symbolName = (NSString *)&stru_1E2E05448;

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
  foregroundColor = self->_foregroundColor;
  self->_foregroundColor = v4;

}

- (void)_setupButton
{
  UIButton *v3;
  UIButton *actionButton;
  double v5;
  double v6;
  double v7;
  double v8;

  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 0);
  v3 = (UIButton *)objc_claimAutoreleasedReturnValue();
  actionButton = self->_actionButton;
  self->_actionButton = v3;

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_actionButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIButton setShowsMenuAsPrimaryAction:](self->_actionButton, "setShowsMenuAsPrimaryAction:", 1);
  -[UIButton setPreferredBehavioralStyle:](self->_actionButton, "setPreferredBehavioralStyle:", 1);
  LODWORD(v5) = 1148846080;
  -[UIButton setContentCompressionResistancePriority:forAxis:](self->_actionButton, "setContentCompressionResistancePriority:forAxis:", 0, v5);
  LODWORD(v6) = 1148846080;
  -[UIButton setContentHuggingPriority:forAxis:](self->_actionButton, "setContentHuggingPriority:forAxis:", 0, v6);
  LODWORD(v7) = 1148846080;
  -[UIButton setContentCompressionResistancePriority:forAxis:](self->_actionButton, "setContentCompressionResistancePriority:forAxis:", 1, v7);
  LODWORD(v8) = 1148846080;
  -[UIButton setContentHuggingPriority:forAxis:](self->_actionButton, "setContentHuggingPriority:forAxis:", 1, v8);
  -[UIButton setPointerInteractionEnabled:](self->_actionButton, "setPointerInteractionEnabled:", 1);
  -[MUCardButton addSubview:](self, "addSubview:", self->_actionButton);
  -[MUCardButton setPreservesSuperviewLayoutMargins:](self, "setPreservesSuperviewLayoutMargins:", 0);
  -[MUCardButton setInsetsLayoutMarginsFromSafeArea:](self, "setInsetsLayoutMarginsFromSafeArea:", 0);
  -[MUCardButton setDirectionalLayoutMargins:](self, "setDirectionalLayoutMargins:", 16.0, 16.0, 16.0, 16.0);
}

- (void)_setupConstraints
{
  double v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
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
  _QWORD v32[8];

  v32[6] = *MEMORY[0x1E0C80C00];
  if (MUIdiomInTraitEnvironment(self) == 5)
    v3 = 24.0;
  else
    v3 = 30.0;
  -[UIButton heightAnchor](self->_actionButton, "heightAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToConstant:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v5;
  v31 = v5;
  LODWORD(v7) = 1148846080;
  objc_msgSend(v5, "setPriority:", v7);
  -[UIButton widthAnchor](self->_actionButton, "widthAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton heightAnchor](self->_actionButton, "heightAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = v10;
  LODWORD(v11) = 1148846080;
  objc_msgSend(v10, "setPriority:", v11);
  v22 = (void *)MEMORY[0x1E0CB3718];
  v32[0] = v6;
  v32[1] = v10;
  -[UIButton topAnchor](self->_actionButton, "topAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUCardButton layoutMarginsGuide](self, "layoutMarginsGuide");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "topAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v27);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v26;
  -[UIButton bottomAnchor](self->_actionButton, "bottomAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUCardButton layoutMarginsGuide](self, "layoutMarginsGuide");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "bottomAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v23);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v32[3] = v12;
  -[UIButton leadingAnchor](self->_actionButton, "leadingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUCardButton layoutMarginsGuide](self, "layoutMarginsGuide");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "leadingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v32[4] = v16;
  -[UIButton trailingAnchor](self->_actionButton, "trailingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUCardButton layoutMarginsGuide](self, "layoutMarginsGuide");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "trailingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v32[5] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "activateConstraints:", v21);

}

- (void)_updateButtonAppearance
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  UIView *backgroundView;
  void *v14;
  id v15;

  objc_msgSend(MEMORY[0x1E0DC3520], "filledButtonConfiguration");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (self->_drawBackground)
  {
    if (self->_blurBackground)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "background");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setBackgroundColor:", v3);

      objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setBaseForegroundColor:", v5);

      objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 16);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "background");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setVisualEffect:", v6);

      goto LABEL_10;
    }
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemFillColor");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (self->_isHovering)
      objc_msgSend(MEMORY[0x1E0DC3658], "quaternarySystemFillColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;
  objc_msgSend(v15, "background");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundColor:", v9);

  objc_msgSend(v15, "setBaseForegroundColor:", self->_foregroundColor);
LABEL_10:
  objc_msgSend(v15, "setCornerStyle:", 4);
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:scale:", 7, 2, 15.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", self->_symbolName, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setImage:", v12);

  backgroundView = self->_backgroundView;
  if (backgroundView)
  {
    objc_msgSend(v15, "background");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCustomView:", backgroundView);

  }
  -[UIButton setConfiguration:](self->_actionButton, "setConfiguration:", v15);

}

- (void)setSymbolName:(id)a3
{
  NSString *v4;
  NSString *symbolName;
  id v6;

  v6 = a3;
  if ((-[NSString isEqual:](self->_symbolName, "isEqual:") & 1) == 0)
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    symbolName = self->_symbolName;
    self->_symbolName = v4;

    -[MUCardButton _updateButtonAppearance](self, "_updateButtonAppearance");
  }

}

- (void)setBlurBackground:(BOOL)a3
{
  if (self->_blurBackground != a3)
  {
    self->_blurBackground = a3;
    -[MUCardButton _updateButtonAppearance](self, "_updateButtonAppearance");
  }
}

- (void)setDrawBackground:(BOOL)a3
{
  if (self->_drawBackground != a3)
  {
    self->_drawBackground = a3;
    -[MUCardButton _updateButtonAppearance](self, "_updateButtonAppearance");
  }
}

- (void)setBackgroundView:(id)a3
{
  UIView *v5;
  UIView *v6;

  v5 = (UIView *)a3;
  if (self->_backgroundView != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_backgroundView, a3);
    -[MUCardButton _updateButtonAppearance](self, "_updateButtonAppearance");
    v5 = v6;
  }

}

- (void)setForegroundColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_foregroundColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_foregroundColor, a3);
    -[MUCardButton _updateButtonAppearance](self, "_updateButtonAppearance");
    v5 = v6;
  }

}

- (void)setMenu:(id)a3
{
  -[UIButton setMenu:](self->_actionButton, "setMenu:", a3);
}

- (UIMenu)menu
{
  return -[UIButton menu](self->_actionButton, "menu");
}

- (UIButton)underlyingButton
{
  return self->_actionButton;
}

- (void)addTarget:(id)a3 action:(SEL)a4 forControlEvents:(unint64_t)a5
{
  -[UIButton addTarget:action:forControlEvents:](self->_actionButton, "addTarget:action:forControlEvents:", a3, a4, a5);
}

- (void)setDirectionalLayoutMargins:(NSDirectionalEdgeInsets)a3
{
  double trailing;
  double bottom;
  double leading;
  double top;
  objc_super v8;

  trailing = a3.trailing;
  bottom = a3.bottom;
  leading = a3.leading;
  top = a3.top;
  v8.receiver = self;
  v8.super_class = (Class)MUCardButton;
  -[MUCardButton setDirectionalLayoutMargins:](&v8, sel_setDirectionalLayoutMargins_);
  if (MUIdiomInTraitEnvironment(self) != 5)
    -[UIButton _setTouchInsets:](self->_actionButton, "_setTouchInsets:", -top, -leading, -bottom, -trailing);
}

- (BOOL)blurBackground
{
  return self->_blurBackground;
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (BOOL)drawBackground
{
  return self->_drawBackground;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (UIColor)foregroundColor
{
  return self->_foregroundColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foregroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
}

@end

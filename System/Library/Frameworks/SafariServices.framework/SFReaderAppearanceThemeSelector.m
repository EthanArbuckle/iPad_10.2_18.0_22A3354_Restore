@implementation SFReaderAppearanceThemeSelector

+ (id)themeSelectorWithBlock:(id)a3
{
  id v4;
  id v5;
  double v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  objc_msgSend(a1, "requiredHeight");
  v7 = (void *)objc_msgSend(v5, "initWithFrame:", 0.0, 0.0, 320.0, v6);
  objc_msgSend(v7, "setSelectedThemeChangedBlock:", v4);

  return v7;
}

- (SFReaderAppearanceThemeSelector)initWithFrame:(CGRect)a3
{
  SFReaderAppearanceThemeSelector *v3;
  SFReaderAppearanceThemeSelector *v4;
  SFReaderAppearanceThemeSelector *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFReaderAppearanceThemeSelector;
  v3 = -[SFReaderAppearanceThemeSelector initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SFReaderAppearanceThemeSelector _createThemeButtons](v3, "_createThemeButtons");
    -[SFReaderAppearanceThemeSelector _updateSelectedTheme](v4, "_updateSelectedTheme");
    v5 = v4;
  }

  return v4;
}

+ (double)requiredHeight
{
  return 58.0;
}

- (void)setSelectedTheme:(int64_t)a3
{
  void (**selectedThemeChangedBlock)(id, SFReaderAppearanceThemeSelector *);

  if (self->_selectedTheme != a3)
  {
    self->_selectedTheme = a3;
    -[SFReaderAppearanceThemeSelector _updateSelectedTheme](self, "_updateSelectedTheme");
    selectedThemeChangedBlock = (void (**)(id, SFReaderAppearanceThemeSelector *))self->_selectedThemeChangedBlock;
    if (selectedThemeChangedBlock)
      selectedThemeChangedBlock[2](selectedThemeChangedBlock, self);
  }
}

- (void)_updateSelectedTheme
{
  _BOOL8 v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  _BOOL8 v9;
  id v10;

  v3 = self->_selectedTheme == 0;
  -[SFReaderAppearanceThemeSelector _buttonForTheme:](self, "_buttonForTheme:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSelected:", v3);

  v5 = self->_selectedTheme == 1;
  -[SFReaderAppearanceThemeSelector _buttonForTheme:](self, "_buttonForTheme:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSelected:", v5);

  v7 = self->_selectedTheme == 2;
  -[SFReaderAppearanceThemeSelector _buttonForTheme:](self, "_buttonForTheme:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSelected:", v7);

  v9 = self->_selectedTheme == 3;
  -[SFReaderAppearanceThemeSelector _buttonForTheme:](self, "_buttonForTheme:", 3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSelected:", v9);

}

- (void)_changeSelectionForTheme:(int64_t)a3 selected:(BOOL)a4
{
  _BOOL8 v4;
  id v5;

  v4 = a4;
  -[SFReaderAppearanceThemeSelector _buttonForTheme:](self, "_buttonForTheme:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSelected:", v4);

}

- (id)_buttonForTheme:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return 0;
  else
    return *(id *)((char *)&self->super.super.super.isa + *off_1E4AC3720[a3]);
}

- (int64_t)_themeForButton:(id)a3
{
  UIButton *v4;
  int64_t v5;

  v4 = (UIButton *)a3;
  if (self->_whiteButton == v4)
  {
    v5 = 0;
  }
  else if (self->_sepiaButton == v4)
  {
    v5 = 1;
  }
  else if (self->_grayButton == v4)
  {
    v5 = 2;
  }
  else if (self->_nightButton == v4)
  {
    v5 = 3;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_createThemeButtons
{
  uint64_t v3;
  UIButton *v4;
  UIButton *whiteButton;
  UIButton *v6;
  UIButton *sepiaButton;
  UIButton *v8;
  UIButton *grayButton;
  UIButton *v10;
  UIButton *nightButton;
  UIButton *v12;
  UIButton *v13;
  void *v14;
  UIStackView *v15;
  UIStackView *stackView;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
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
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[5];
  _QWORD v46[5];
  _BYTE v47[128];
  _QWORD v48[6];

  v48[4] = *MEMORY[0x1E0C80C00];
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __54__SFReaderAppearanceThemeSelector__createThemeButtons__block_invoke;
  v45[3] = &unk_1E4AC3700;
  v45[4] = self;
  v3 = MEMORY[0x1A8598C40](v45, a2);
  (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, 0);
  v4 = (UIButton *)objc_claimAutoreleasedReturnValue();
  whiteButton = self->_whiteButton;
  self->_whiteButton = v4;

  (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, 1);
  v6 = (UIButton *)objc_claimAutoreleasedReturnValue();
  sepiaButton = self->_sepiaButton;
  self->_sepiaButton = v6;

  (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, 2);
  v8 = (UIButton *)objc_claimAutoreleasedReturnValue();
  grayButton = self->_grayButton;
  self->_grayButton = v8;

  -[UIButton setAccessibilityIgnoresInvertColors:](self->_grayButton, "setAccessibilityIgnoresInvertColors:", 1);
  v40 = (void *)v3;
  (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, 3);
  v10 = (UIButton *)objc_claimAutoreleasedReturnValue();
  nightButton = self->_nightButton;
  self->_nightButton = v10;

  -[UIButton setAccessibilityIgnoresInvertColors:](self->_nightButton, "setAccessibilityIgnoresInvertColors:", 1);
  v12 = self->_sepiaButton;
  v48[0] = self->_whiteButton;
  v48[1] = v12;
  v13 = self->_nightButton;
  v48[2] = self->_grayButton;
  v48[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (UIStackView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3CA8]), "initWithArrangedSubviews:", v14);
  stackView = self->_stackView;
  self->_stackView = v15;

  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView setAxis:](self->_stackView, "setAxis:", 0);
  -[UIStackView setSpacing:](self->_stackView, "setSpacing:", 17.0);
  -[SFReaderAppearanceThemeSelector addSubview:](self, "addSubview:", self->_stackView);
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v17 = v14;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v42;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v42 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v21), 7, 0, 0, 0, 1.0, 40.0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFReaderAppearanceThemeSelector addConstraint:](self, "addConstraint:", v22);

        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    }
    while (v19);
  }

  v33 = (void *)MEMORY[0x1E0CB3718];
  -[UIStackView centerXAnchor](self->_stackView, "centerXAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFReaderAppearanceThemeSelector centerXAnchor](self, "centerXAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:", v38);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v37;
  -[UIStackView topAnchor](self->_stackView, "topAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFReaderAppearanceThemeSelector topAnchor](self, "topAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:constant:", v35, 9.0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v46[1] = v34;
  -[UIStackView leadingAnchor](self->_stackView, "leadingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFReaderAppearanceThemeSelector leadingAnchor](self, "leadingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintGreaterThanOrEqualToAnchor:constant:", v23, 17.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v46[2] = v24;
  -[SFReaderAppearanceThemeSelector trailingAnchor](self, "trailingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView trailingAnchor](self->_stackView, "trailingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintGreaterThanOrEqualToAnchor:constant:", v26, 17.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v46[3] = v27;
  -[SFReaderAppearanceThemeSelector bottomAnchor](self, "bottomAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView bottomAnchor](self->_stackView, "bottomAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:constant:", v29, 9.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v46[4] = v30;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 5);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "activateConstraints:", v31);

}

id __54__SFReaderAppearanceThemeSelector__createThemeButtons__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  +[SFReaderThemeButton buttonWithType:](SFReaderThemeButton, "buttonWithType:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_imageForTheme:selected:", a2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImage:forState:", v5, 0);

  objc_msgSend(*(id *)(a1 + 32), "_imageForTheme:selected:", a2, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImage:forState:", v6, 4);

  WBSReaderThemeLocalizedName();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v7);

  objc_msgSend(v4, "setFocusGroupIdentifier:", 0);
  objc_msgSend(v4, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel__themeButtonAction_, 0x2000);
  return v4;
}

- (id)_imageForTheme:(int64_t)a3 selected:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;

  v4 = a4;
  if (a4)
    -[SFReaderAppearanceThemeSelector tintColor](self, "tintColor", a3);
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", a3, 0.0, 0.2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WBSReaderThemeColor();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFReaderAppearanceThemeSelector _themeButtonImageWithFillColor:strokeColor:selected:](self, "_themeButtonImageWithFillColor:strokeColor:selected:", v7, v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_themeButtonImageWithFillColor:(id)a3 strokeColor:(id)a4 selected:(BOOL)a5
{
  _BOOL4 v5;
  void *v7;
  id v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  CGSize v21;

  v5 = a5;
  v7 = (void *)MEMORY[0x1E0DC3BF8];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "mainScreen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "scale");
  v12 = v11;

  v21.width = 40.0;
  v21.height = 40.0;
  UIGraphicsBeginImageContextWithOptions(v21, 0, 0.0);
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithOvalInRect:", 0.0, 0.0, 40.0, 40.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFill");

  objc_msgSend(v13, "fill");
  if (v5)
  {
    v14 = (void *)MEMORY[0x1E0DC3508];
    v15 = 36.0;
    v16 = 2.0;
    v17 = 2.0;
  }
  else
  {
    v16 = 1.0 / v12;
    v14 = (void *)MEMORY[0x1E0DC3508];
    v15 = 1.0 / v12 * -2.0 + 40.0;
    v17 = 1.0 / v12;
  }
  objc_msgSend(v14, "bezierPathWithOvalInRect:", v16, v17, v15, v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFill");

  objc_msgSend(v18, "fill");
  UIGraphicsGetImageFromCurrentImageContext();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v19;
}

- (void)_themeButtonAction:(id)a3
{
  -[SFReaderAppearanceThemeSelector setSelectedTheme:](self, "setSelectedTheme:", -[SFReaderAppearanceThemeSelector _themeForButton:](self, "_themeForButton:", a3));
}

- (NSArray)values
{
  return (NSArray *)&unk_1E4B272B0;
}

- (id)selectedValue
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[SFReaderAppearanceThemeSelector selectedTheme](self, "selectedTheme"));
}

- (id)imageForValue:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;

  v4 = a3;
  v5 = -[SFReaderAppearanceThemeSelector isSelectedValue:](self, "isSelectedValue:", v4);
  v6 = objc_msgSend(v4, "integerValue");

  return -[SFReaderAppearanceThemeSelector _imageForTheme:selected:](self, "_imageForTheme:selected:", v6, v5);
}

- (BOOL)isSelectedValue:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[SFReaderAppearanceThemeSelector selectedValue](self, "selectedValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v4);

  return v6;
}

- (void)selectValue:(id)a3
{
  -[SFReaderAppearanceThemeSelector setSelectedTheme:](self, "setSelectedTheme:", objc_msgSend(a3, "integerValue"));
}

- (int64_t)selectedTheme
{
  return self->_selectedTheme;
}

- (id)selectedThemeChangedBlock
{
  return self->_selectedThemeChangedBlock;
}

- (void)setSelectedThemeChangedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 464);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_selectedThemeChangedBlock, 0);
  objc_storeStrong((id *)&self->_nightButton, 0);
  objc_storeStrong((id *)&self->_grayButton, 0);
  objc_storeStrong((id *)&self->_sepiaButton, 0);
  objc_storeStrong((id *)&self->_whiteButton, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
}

@end

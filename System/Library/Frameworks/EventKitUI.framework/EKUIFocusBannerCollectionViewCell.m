@implementation EKUIFocusBannerCollectionViewCell

- (EKUIFocusBannerCollectionViewCell)initWithFrame:(CGRect)a3
{
  EKUIFocusBannerCollectionViewCell *v3;
  EKUIFocusBannerCollectionViewCell *v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  id location;
  objc_super v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)EKUIFocusBannerCollectionViewCell;
  v3 = -[EKUIFocusBannerCollectionViewCell initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[EKUIFocusBannerCollectionViewCell _configureCellSwitchingLayout:](v3, "_configureCellSwitchingLayout:", 1);
    objc_initWeak(&location, v4);
    v12[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __51__EKUIFocusBannerCollectionViewCell_initWithFrame___block_invoke;
    v8[3] = &unk_1E6018610;
    objc_copyWeak(&v9, &location);
    v6 = (id)-[EKUIFocusBannerCollectionViewCell registerForTraitChanges:withHandler:](v4, "registerForTraitChanges:withHandler:", v5, v8);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  return v4;
}

void __51__EKUIFocusBannerCollectionViewCell_initWithFrame___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSString *v6;
  _BOOL4 IsAccessibilityCategory;
  void *v8;
  NSString *v9;
  uint64_t v10;
  id WeakRetained;

  v5 = a2;
  objc_msgSend(a3, "preferredContentSizeCategory");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v6);
  objc_msgSend(v5, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "preferredContentSizeCategory");
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  v10 = IsAccessibilityCategory ^ UIContentSizeCategoryIsAccessibilityCategory(v9);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_configureCellSwitchingLayout:", v10);

}

- (id)_createFocusFilterToggleButton
{
  void *v3;
  void *v4;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *);
  void *v9;
  id v10;
  id location;

  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIFocusBannerCollectionViewCell _focusFilterButtonConfiguration](self, "_focusFilterButtonConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setConfiguration:", v4);

  objc_initWeak(&location, self);
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __67__EKUIFocusBannerCollectionViewCell__createFocusFilterToggleButton__block_invoke;
  v9 = &unk_1E601AB48;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v3, "setConfigurationUpdateHandler:", &v6);
  objc_msgSend(v3, "addTarget:action:forControlEvents:", self, sel__tapped, 0x2000, v6, v7, v8, v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  return v3;
}

void __67__EKUIFocusBannerCollectionViewCell__createFocusFilterToggleButton__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_focusFilterButtonConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setConfiguration:", v5);

  }
}

- (void)_tapped
{
  void *v3;
  char v4;
  id v5;

  -[EKUIFocusBannerCollectionViewCell setOn:](self, "setOn:", -[EKUIFocusBannerCollectionViewCell on](self, "on") ^ 1);
  -[EKUIFocusBannerCollectionViewCell delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[EKUIFocusBannerCollectionViewCell delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "focusBannerCollectionViewCellToggled:", self);

  }
}

- (void)setOn:(BOOL)a3
{
  if (self->_on != a3)
  {
    self->_on = a3;
    -[EKUIFocusBannerCollectionViewCell _configureCellSwitchingLayout:](self, "_configureCellSwitchingLayout:", 0);
  }
}

- (void)_configureCellSwitchingLayout:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  NSString *v6;
  _BOOL4 IsAccessibilityCategory;
  id v8;
  void *v9;
  UIListContentView *v10;
  UIListContentView *axListContentView;
  void *v12;
  UIButton *v13;
  UIButton *axFocusFilterToggleButton;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSArray *v26;
  NSArray *axConstraints;
  void *v28;
  void *v29;
  UIButton *v30;
  UIButton *focusFilterToggleButton;
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
  _QWORD v53[8];

  v3 = a3;
  v53[6] = *MEMORY[0x1E0C80C00];
  -[EKUIFocusBannerCollectionViewCell traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v6);

  if (IsAccessibilityCategory)
  {
    if (v3)
    {
      -[EKUIFocusBannerCollectionViewCell setContentConfiguration:](self, "setContentConfiguration:", 0);
      -[EKUIFocusBannerCollectionViewCell setAccessories:](self, "setAccessories:", MEMORY[0x1E0C9AA60]);
      v8 = objc_alloc(MEMORY[0x1E0DC39B0]);
      -[EKUIFocusBannerCollectionViewCell _configuration](self, "_configuration");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (UIListContentView *)objc_msgSend(v8, "initWithConfiguration:", v9);
      axListContentView = self->_axListContentView;
      self->_axListContentView = v10;

      -[UIListContentView setTranslatesAutoresizingMaskIntoConstraints:](self->_axListContentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[EKUIFocusBannerCollectionViewCell contentView](self, "contentView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addSubview:", self->_axListContentView);

      -[EKUIFocusBannerCollectionViewCell _createFocusFilterToggleButton](self, "_createFocusFilterToggleButton");
      v13 = (UIButton *)objc_claimAutoreleasedReturnValue();
      axFocusFilterToggleButton = self->_axFocusFilterToggleButton;
      self->_axFocusFilterToggleButton = v13;

      -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_axFocusFilterToggleButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      LODWORD(v15) = 1148846080;
      -[UIButton setContentCompressionResistancePriority:forAxis:](self->_axFocusFilterToggleButton, "setContentCompressionResistancePriority:forAxis:", 0, v15);
      LODWORD(v16) = 1148846080;
      -[UIButton setContentCompressionResistancePriority:forAxis:](self->_axFocusFilterToggleButton, "setContentCompressionResistancePriority:forAxis:", 1, v16);
      -[EKUIFocusBannerCollectionViewCell contentView](self, "contentView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addSubview:", self->_axFocusFilterToggleButton);

      -[UIListContentView leadingAnchor](self->_axListContentView, "leadingAnchor");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKUIFocusBannerCollectionViewCell contentView](self, "contentView");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "leadingAnchor");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "constraintEqualToAnchor:", v49);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v53[0] = v48;
      -[UIListContentView trailingAnchor](self->_axListContentView, "trailingAnchor");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKUIFocusBannerCollectionViewCell contentView](self, "contentView");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "trailingAnchor");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "constraintEqualToAnchor:", v45);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v53[1] = v44;
      -[UIListContentView topAnchor](self->_axListContentView, "topAnchor");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKUIFocusBannerCollectionViewCell contentView](self, "contentView");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "topAnchor");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "constraintEqualToAnchor:", v41);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v53[2] = v40;
      -[UIButton topAnchor](self->_axFocusFilterToggleButton, "topAnchor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIListContentView bottomAnchor](self->_axListContentView, "bottomAnchor");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "constraintEqualToAnchor:constant:", v38, 8.0);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v53[3] = v37;
      -[UIButton bottomAnchor](self->_axFocusFilterToggleButton, "bottomAnchor");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKUIFocusBannerCollectionViewCell contentView](self, "contentView");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "layoutMarginsGuide");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "bottomAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "constraintEqualToAnchor:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v53[4] = v20;
      -[UIButton leadingAnchor](self->_axFocusFilterToggleButton, "leadingAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKUIFocusBannerCollectionViewCell contentView](self, "contentView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "layoutMarginsGuide");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "leadingAnchor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "constraintEqualToAnchor:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v53[5] = v25;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 6);
      v26 = (NSArray *)objc_claimAutoreleasedReturnValue();
      axConstraints = self->_axConstraints;
      self->_axConstraints = v26;

      objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_axConstraints);
    }
    -[EKUIFocusBannerCollectionViewCell _configuration](self, "_configuration");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIListContentView setConfiguration:](self->_axListContentView, "setConfiguration:", v28);

    -[EKUIFocusBannerCollectionViewCell _focusFilterButtonConfiguration](self, "_focusFilterButtonConfiguration");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setConfiguration:](self->_axFocusFilterToggleButton, "setConfiguration:", v29);
  }
  else
  {
    if (v3)
    {
      if (self->_axConstraints)
        objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:");
      -[UIListContentView removeFromSuperview](self->_axListContentView, "removeFromSuperview");
      -[UIButton removeFromSuperview](self->_axFocusFilterToggleButton, "removeFromSuperview");
      -[EKUIFocusBannerCollectionViewCell _createFocusFilterToggleButton](self, "_createFocusFilterToggleButton");
      v30 = (UIButton *)objc_claimAutoreleasedReturnValue();
      focusFilterToggleButton = self->_focusFilterToggleButton;
      self->_focusFilterToggleButton = v30;

      v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3550]), "initWithCustomView:placement:", self->_focusFilterToggleButton, 1);
      v52 = v32;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v52, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKUIFocusBannerCollectionViewCell setAccessories:](self, "setAccessories:", v33);

    }
    -[EKUIFocusBannerCollectionViewCell _focusFilterButtonConfiguration](self, "_focusFilterButtonConfiguration");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setConfiguration:](self->_focusFilterToggleButton, "setConfiguration:", v34);

    -[EKUIFocusBannerCollectionViewCell _configuration](self, "_configuration");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIFocusBannerCollectionViewCell setContentConfiguration:](self, "setContentConfiguration:", v29);
  }

}

- (id)_configuration
{
  EKUIFocusBannerCollectionViewCell *v2;
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

  v2 = self;
  -[EKUIFocusBannerCollectionViewCell defaultContentConfiguration](self, "defaultContentConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = -[EKUIFocusBannerCollectionViewCell on](v2, "on");
  EventKitUIBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((_DWORD)v2)
  {
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Filtered by Focus"), &stru_1E601DFA8, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemIndigoColor");
  }
  else
  {
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Focus Filter Off"), &stru_1E601DFA8, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("moon.circle.fill"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", v9);

  objc_msgSend(v3, "imageProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTintColor:", v8);

  objc_msgSend(v3, "setText:", v6);
  objc_msgSend(v3, "textProperties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setColor:", v7);

  objc_msgSend(v3, "textProperties");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setNumberOfLines:", 0);

  return v3;
}

- (id)_focusFilterButtonConfiguration
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSString *v15;
  _BOOL4 IsAccessibilityCategory;
  void *v17;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v3 = -[EKUIFocusBannerCollectionViewCell on](self, "on");
  EventKitUIBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    v6 = CFSTR("Turn Off");
  else
    v6 = CFSTR("Turn On");
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1E601DFA8, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4B10], 32770, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v8, 0.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemIndigoColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x1E0DC1140];
  v19[0] = *MEMORY[0x1E0DC1138];
  v19[1] = v11;
  v20[0] = v9;
  v20[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v7, v12);
  -[EKUIFocusBannerCollectionViewCell traitCollection](self, "traitCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "preferredContentSizeCategory");
  v15 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v15);

  if (IsAccessibilityCategory)
  {
    objc_msgSend(MEMORY[0x1E0DC3520], "grayButtonConfiguration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setCornerStyle:", 4);
    objc_msgSend(v17, "setButtonSize:", 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setContentInsets:", *MEMORY[0x1E0DC3298], *(double *)(MEMORY[0x1E0DC3298] + 8), *(double *)(MEMORY[0x1E0DC3298] + 16), *(double *)(MEMORY[0x1E0DC3298] + 24));
  }
  objc_msgSend(v17, "setAttributedTitle:", v13);
  objc_msgSend(v17, "setTitleLineBreakMode:", 2);

  return v17;
}

- (BOOL)on
{
  return self->_on;
}

- (EKUIFocusBannerCollectionViewCellDelegate)delegate
{
  return (EKUIFocusBannerCollectionViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_axConstraints, 0);
  objc_storeStrong((id *)&self->_axListContentView, 0);
  objc_storeStrong((id *)&self->_axFocusFilterToggleButton, 0);
  objc_storeStrong((id *)&self->_focusFilterToggleButton, 0);
}

@end

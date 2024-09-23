@implementation EKUIFocusBannerTableViewCell

- (EKUIFocusBannerTableViewCell)initWithReuseIdentifier:(id)a3
{
  id v4;
  EKUIFocusBannerTableViewCell *v5;
  id v6;
  void *v7;
  uint64_t v8;
  UIListContentView *listContentView;
  void *v10;
  uint64_t v11;
  UIButton *focusFilterToggleButton;
  void *v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  id location;
  objc_super v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)EKUIFocusBannerTableViewCell;
  v5 = -[EKUIFocusBannerTableViewCell initWithStyle:reuseIdentifier:](&v26, sel_initWithStyle_reuseIdentifier_, 0, v4);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0DC39B0]);
    -[EKUIFocusBannerTableViewCell _configuration](v5, "_configuration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "initWithConfiguration:", v7);
    listContentView = v5->_listContentView;
    v5->_listContentView = (UIListContentView *)v8;

    -[UIListContentView setTranslatesAutoresizingMaskIntoConstraints:](v5->_listContentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[EKUIFocusBannerTableViewCell contentView](v5, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v5->_listContentView);

    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
    v11 = objc_claimAutoreleasedReturnValue();
    focusFilterToggleButton = v5->_focusFilterToggleButton;
    v5->_focusFilterToggleButton = (UIButton *)v11;

    -[EKUIFocusBannerTableViewCell _focusFilterButtonConfiguration](v5, "_focusFilterButtonConfiguration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setConfiguration:](v5->_focusFilterToggleButton, "setConfiguration:", v13);

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v5->_focusFilterToggleButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v14) = 1148846080;
    -[UIButton setContentCompressionResistancePriority:forAxis:](v5->_focusFilterToggleButton, "setContentCompressionResistancePriority:forAxis:", 0, v14);
    LODWORD(v15) = 1148846080;
    -[UIButton setContentCompressionResistancePriority:forAxis:](v5->_focusFilterToggleButton, "setContentCompressionResistancePriority:forAxis:", 1, v15);
    -[EKUIFocusBannerTableViewCell contentView](v5, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSubview:", v5->_focusFilterToggleButton);

    objc_initWeak(&location, v5);
    v17 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __56__EKUIFocusBannerTableViewCell_initWithReuseIdentifier___block_invoke;
    v23[3] = &unk_1E601AB48;
    objc_copyWeak(&v24, &location);
    -[UIButton setConfigurationUpdateHandler:](v5->_focusFilterToggleButton, "setConfigurationUpdateHandler:", v23);
    -[UIButton addTarget:action:forControlEvents:](v5->_focusFilterToggleButton, "addTarget:action:forControlEvents:", v5, sel__tapped, 0x2000);
    -[EKUIFocusBannerTableViewCell _updateView](v5, "_updateView");
    v27[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v17;
    v21[1] = 3221225472;
    v21[2] = __56__EKUIFocusBannerTableViewCell_initWithReuseIdentifier___block_invoke_2;
    v21[3] = &unk_1E6018610;
    objc_copyWeak(&v22, &location);
    v19 = (id)-[EKUIFocusBannerTableViewCell registerForTraitChanges:withHandler:](v5, "registerForTraitChanges:withHandler:", v18, v21);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

  return v5;
}

void __56__EKUIFocusBannerTableViewCell_initWithReuseIdentifier___block_invoke(uint64_t a1, void *a2)
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

void __56__EKUIFocusBannerTableViewCell_initWithReuseIdentifier___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateView");

}

- (void)_tapped
{
  void *v3;
  char v4;
  id v5;

  -[EKUIFocusBannerTableViewCell setOn:](self, "setOn:", -[EKUIFocusBannerTableViewCell on](self, "on") ^ 1);
  -[EKUIFocusBannerTableViewCell delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[EKUIFocusBannerTableViewCell delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "focusBannerTableViewCellToggled:", self);

  }
}

- (void)setOn:(BOOL)a3
{
  if (self->_on != a3)
  {
    self->_on = a3;
    -[EKUIFocusBannerTableViewCell _updateView](self, "_updateView");
  }
}

- (void)_updateView
{
  void *v3;
  void *v4;
  void *v5;
  NSString *v6;
  _BOOL4 IsAccessibilityCategory;
  void *v8;
  uint64_t v9;
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
  NSArray *v22;
  NSArray *constraints;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSArray *v28;
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
  _QWORD v46[6];
  _QWORD v47[8];

  v47[6] = *MEMORY[0x1E0C80C00];
  -[EKUIFocusBannerTableViewCell _configuration](self, "_configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIListContentView setConfiguration:](self->_listContentView, "setConfiguration:", v3);

  -[EKUIFocusBannerTableViewCell _focusFilterButtonConfiguration](self, "_focusFilterButtonConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setConfiguration:](self->_focusFilterToggleButton, "setConfiguration:", v4);

  if (self->_constraints)
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:");
  -[EKUIFocusBannerTableViewCell traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v6);

  -[UIListContentView leadingAnchor](self->_listContentView, "leadingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIFocusBannerTableViewCell contentView](self, "contentView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "leadingAnchor");
  v45 = v8;
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:");
  v9 = objc_claimAutoreleasedReturnValue();
  v42 = (void *)v9;
  if (IsAccessibilityCategory)
  {
    v47[0] = v9;
    -[UIListContentView trailingAnchor](self->_listContentView, "trailingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIFocusBannerTableViewCell contentView](self, "contentView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "trailingAnchor");
    v41 = v10;
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v47[1] = v38;
    -[UIListContentView topAnchor](self->_listContentView, "topAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIFocusBannerTableViewCell contentView](self, "contentView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "topAnchor");
    v37 = v11;
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v47[2] = v34;
    -[UIButton topAnchor](self->_focusFilterToggleButton, "topAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIListContentView bottomAnchor](self->_listContentView, "bottomAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v12;
    objc_msgSend(v12, "constraintEqualToAnchor:constant:", 8.0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v47[3] = v31;
    -[UIButton bottomAnchor](self->_focusFilterToggleButton, "bottomAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIFocusBannerTableViewCell contentView](self, "contentView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "layoutMarginsGuide");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bottomAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v13;
    objc_msgSend(v13, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v47[4] = v16;
    -[UIButton leadingAnchor](self->_focusFilterToggleButton, "leadingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIFocusBannerTableViewCell contentView](self, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "layoutMarginsGuide");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "leadingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v47[5] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 6);
    v22 = (NSArray *)objc_claimAutoreleasedReturnValue();
    constraints = self->_constraints;
    self->_constraints = v22;

  }
  else
  {
    v46[0] = v9;
    -[UIListContentView topAnchor](self->_listContentView, "topAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIFocusBannerTableViewCell contentView](self, "contentView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "topAnchor");
    v41 = v24;
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v46[1] = v38;
    -[UIListContentView bottomAnchor](self->_listContentView, "bottomAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIFocusBannerTableViewCell contentView](self, "contentView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "bottomAnchor");
    v37 = v25;
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v46[2] = v34;
    -[UIButton leadingAnchor](self->_focusFilterToggleButton, "leadingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIListContentView trailingAnchor](self->_listContentView, "trailingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v26;
    objc_msgSend(v26, "constraintGreaterThanOrEqualToAnchor:");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v46[3] = v31;
    -[UIButton trailingAnchor](self->_focusFilterToggleButton, "trailingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIFocusBannerTableViewCell contentView](self, "contentView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "layoutMarginsGuide");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "trailingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v27;
    objc_msgSend(v27, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v46[4] = v16;
    -[UIButton centerYAnchor](self->_focusFilterToggleButton, "centerYAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIFocusBannerTableViewCell contentView](self, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "centerYAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v46[5] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 6);
    v28 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v21 = self->_constraints;
    self->_constraints = v28;
  }

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_constraints);
}

- (id)_configuration
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

  objc_msgSend(MEMORY[0x1E0DC39A8], "cellConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(self) = -[EKUIFocusBannerTableViewCell on](self, "on");
  EventKitUIBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((_DWORD)self)
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
  v3 = -[EKUIFocusBannerTableViewCell on](self, "on");
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
  -[EKUIFocusBannerTableViewCell traitCollection](self, "traitCollection");
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

- (EKUIFocusBannerTableViewCellDelegate)delegate
{
  return (EKUIFocusBannerTableViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_listContentView, 0);
  objc_storeStrong((id *)&self->_focusFilterToggleButton, 0);
}

@end

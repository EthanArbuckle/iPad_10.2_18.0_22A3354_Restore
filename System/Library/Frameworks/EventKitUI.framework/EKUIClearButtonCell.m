@implementation EKUIClearButtonCell

- (EKUIClearButtonCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v6;
  EKUIClearButtonCell *v7;
  EKUIClearButton *v8;
  void *v9;
  uint64_t v10;
  UIButton *clearButton;
  void *v12;
  void *v13;
  uint64_t v14;
  UIListContentView *listContentView;
  void *v16;
  void *v17;
  id v18;
  _QWORD v20[4];
  id v21;
  id location;
  objc_super v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v23.receiver = self;
  v23.super_class = (Class)EKUIClearButtonCell;
  v7 = -[EKUITableViewCell initWithStyle:reuseIdentifier:](&v23, sel_initWithStyle_reuseIdentifier_, a3, v6);
  if (v7)
  {
    v8 = [EKUIClearButton alloc];
    ClearButtonImageColor();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[EKUIClearButton initWithColor:](v8, "initWithColor:", v9);
    clearButton = v7->_clearButton;
    v7->_clearButton = (UIButton *)v10;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v7->_clearButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[EKUIClearButtonCell contentView](v7, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v7->_clearButton);

    -[EKUIClearButtonCell defaultContentConfiguration](v7, "defaultContentConfiguration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC39B0]), "initWithConfiguration:", v13);
    listContentView = v7->_listContentView;
    v7->_listContentView = (UIListContentView *)v14;

    -[UIListContentView setTranslatesAutoresizingMaskIntoConstraints:](v7->_listContentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[EKUIClearButtonCell contentView](v7, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSubview:", v7->_listContentView);

    -[EKUIClearButtonCell _updateConstraints](v7, "_updateConstraints");
    objc_initWeak(&location, v7);
    v24[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __53__EKUIClearButtonCell_initWithStyle_reuseIdentifier___block_invoke;
    v20[3] = &unk_1E6018610;
    objc_copyWeak(&v21, &location);
    v18 = (id)-[EKUIClearButtonCell registerForTraitChanges:withHandler:](v7, "registerForTraitChanges:withHandler:", v17, v20);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);

  }
  return v7;
}

void __53__EKUIClearButtonCell_initWithStyle_reuseIdentifier___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[136], "configuration");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_updateConfigurationNumLines:", v2);
    objc_msgSend(v3[136], "setConfiguration:", v2);

    WeakRetained = v3;
  }

}

- (void)_updateConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSArray *v11;
  NSArray *constraints;
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
  _QWORD v29[8];

  v29[6] = *MEMORY[0x1E0C80C00];
  if (self->_constraints)
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:");
  -[UIListContentView leadingAnchor](self->_listContentView, "leadingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIClearButtonCell contentView](self, "contentView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "leadingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v26);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v25;
  -[UIListContentView topAnchor](self->_listContentView, "topAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIClearButtonCell contentView](self, "contentView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "topAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v21;
  -[UIListContentView bottomAnchor](self->_listContentView, "bottomAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIClearButtonCell contentView](self, "contentView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bottomAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v17;
  -[UIButton leadingAnchor](self->_clearButton, "leadingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIListContentView trailingAnchor](self->_listContentView, "trailingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintGreaterThanOrEqualToAnchor:", v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v14;
  -[EKUIClearButtonCell contentView](self, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layoutMarginsGuide");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trailingAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton trailingAnchor](self->_clearButton, "trailingAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKUIClearButton trailingOffsetToMarginForTextFieldClearButtonAlignment](EKUIClearButton, "trailingOffsetToMarginForTextFieldClearButtonAlignment");
  objc_msgSend(v4, "constraintEqualToAnchor:constant:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v29[4] = v6;
  -[UIButton centerYAnchor](self->_clearButton, "centerYAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIClearButtonCell contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "centerYAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v29[5] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 6);
  v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
  constraints = self->_constraints;
  self->_constraints = v11;

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_constraints);
}

- (void)setTitleSubtitleContentConfiguration:(id)a3
{
  id v4;

  v4 = a3;
  -[EKUIClearButtonCell _updateConfigurationNumLines:](self, "_updateConfigurationNumLines:", v4);
  -[UIListContentView setConfiguration:](self->_listContentView, "setConfiguration:", v4);

}

- (void)_updateConfigurationNumLines:(id)a3
{
  id v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  NSString *category;

  v4 = a3;
  -[EKUIClearButtonCell traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  category = (NSString *)objc_claimAutoreleasedReturnValue();

  v6 = !UIContentSizeCategoryIsAccessibilityCategory(category);
  objc_msgSend(v4, "textProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNumberOfLines:", v6);

  objc_msgSend(v4, "secondaryTextProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setNumberOfLines:", v6);
}

- (id)configuration
{
  void *v2;
  objc_super v4;

  if (self->_listContentView)
  {
    -[UIListContentView configuration](self->_listContentView, "configuration");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)EKUIClearButtonCell;
    -[EKUIClearButtonCell defaultContentConfiguration](&v4, sel_defaultContentConfiguration);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (UIButton)clearButton
{
  return self->_clearButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clearButton, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_listContentView, 0);
}

@end

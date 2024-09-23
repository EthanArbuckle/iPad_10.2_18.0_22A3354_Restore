@implementation EKUIPopupTableViewCell

- (EKUIPopupTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v6;
  EKUIPopupTableViewCell *v7;
  UILabel *v8;
  UILabel *textLabel;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  uint64_t v17;
  UIButton *popupButton;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  double v24;
  void *v25;
  void *v26;
  id v27;
  _QWORD v29[4];
  id v30;
  id from;
  _QWORD v32[4];
  id v33;
  id location;
  objc_super v35;
  uint64_t v36;
  _QWORD v37[3];

  v37[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v35.receiver = self;
  v35.super_class = (Class)EKUIPopupTableViewCell;
  v7 = -[EKUITableViewCell initWithStyle:reuseIdentifier:](&v35, sel_initWithStyle_reuseIdentifier_, a3, v6);
  if (v7)
  {
    v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    textLabel = v7->_textLabel;
    v7->_textLabel = v8;

    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v7->_textLabel, "setFont:", v10);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v7->_textLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setAdjustsFontForContentSizeCategory:](v7->_textLabel, "setAdjustsFontForContentSizeCategory:", 1);
    LODWORD(v11) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v7->_textLabel, "setContentCompressionResistancePriority:forAxis:", 0, v11);
    -[EKUIPopupTableViewCell contentView](v7, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v7->_textLabel);

    objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTitleLineBreakMode:", 4);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBaseForegroundColor:", v14);

    objc_msgSend(v13, "contentInsets");
    v16 = v15;
    objc_msgSend(v13, "contentInsets");
    objc_msgSend(v13, "setContentInsets:", v16, 0.0);
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v13, 0);
    v17 = objc_claimAutoreleasedReturnValue();
    popupButton = v7->_popupButton;
    v7->_popupButton = (UIButton *)v17;

    -[UIButton setChangesSelectionAsPrimaryAction:](v7->_popupButton, "setChangesSelectionAsPrimaryAction:", 1);
    -[UIButton setShowsMenuAsPrimaryAction:](v7->_popupButton, "setShowsMenuAsPrimaryAction:", 1);
    objc_msgSend(MEMORY[0x1E0DC3428], "actionWithTitle:image:identifier:handler:", &stru_1E601DFA8, 0, 0, &__block_literal_global_31);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x1E0DC39D0];
    v37[0] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "menuWithChildren:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setMenu:](v7->_popupButton, "setMenu:", v22);

    objc_initWeak(&location, v7);
    v23 = MEMORY[0x1E0C809B0];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __56__EKUIPopupTableViewCell_initWithStyle_reuseIdentifier___block_invoke_2;
    v32[3] = &unk_1E601AB48;
    objc_copyWeak(&v33, &location);
    -[UIButton setConfigurationUpdateHandler:](v7->_popupButton, "setConfigurationUpdateHandler:", v32);
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v7->_popupButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v24) = 1144750080;
    -[UIButton setContentCompressionResistancePriority:forAxis:](v7->_popupButton, "setContentCompressionResistancePriority:forAxis:", 0, v24);
    -[EKUIPopupTableViewCell _setPopupMenuButton:](v7, "_setPopupMenuButton:", v7->_popupButton);
    -[EKUIPopupTableViewCell contentView](v7, "contentView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addSubview:", v7->_popupButton);

    -[EKUIPopupTableViewCell _updateConstraints](v7, "_updateConstraints");
    objc_initWeak(&from, v7);
    v36 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v23;
    v29[1] = 3221225472;
    v29[2] = __56__EKUIPopupTableViewCell_initWithStyle_reuseIdentifier___block_invoke_115;
    v29[3] = &unk_1E6018610;
    objc_copyWeak(&v30, &from);
    v27 = (id)-[EKUIPopupTableViewCell registerForTraitChanges:withHandler:](v7, "registerForTraitChanges:withHandler:", v26, v29);

    objc_destroyWeak(&v30);
    objc_destroyWeak(&from);
    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);

  }
  return v7;
}

void __56__EKUIPopupTableViewCell_initWithStyle_reuseIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  _QWORD v30[5];

  v30[4] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v3, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "menu");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectedElements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(WeakRetained, "showSelectedImage"))
  {
    objc_msgSend(v8, "image");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setImage:", v9);

    objc_msgSend(v5, "setImagePadding:", 8.0);
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:", *MEMORY[0x1E0DC4AB8]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPreferredSymbolConfigurationForImage:", v10);

  }
  if (objc_msgSend(WeakRetained, "titleStrikethrough"))
  {
    objc_msgSend(WeakRetained, "detailTextLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "font");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = v12;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    v15 = v14;

    objc_msgSend(WeakRetained, "detailTextLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "textColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      v19 = v17;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v19 = (id)objc_claimAutoreleasedReturnValue();
    }
    v20 = v19;

    v21 = *MEMORY[0x1E0DC1138];
    v29[0] = *MEMORY[0x1E0DC11A8];
    v29[1] = v21;
    v30[0] = &unk_1E606F360;
    v30[1] = v15;
    v22 = *MEMORY[0x1E0DC1140];
    v30[2] = v20;
    v23 = *MEMORY[0x1E0DC11A0];
    v29[2] = v22;
    v29[3] = v23;
    objc_msgSend(v20, "colorWithAlphaComponent:", 0.75);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v30[3] = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(v5, "title");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v26, "initWithString:attributes:", v27, v25);
    objc_msgSend(v5, "setAttributedTitle:", v28);

  }
  objc_msgSend(v3, "setConfiguration:", v5);

}

void __56__EKUIPopupTableViewCell_initWithStyle_reuseIdentifier___block_invoke_115(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateConstraints");

}

- (void)_updateConstraints
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  uint64_t v6;
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
  NSArray *v18;
  NSArray *constraints;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSArray *v25;
  uint64_t v26;
  uint64_t v27;
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
  void *v44;
  void *v45;
  _QWORD v46[5];
  _QWORD v47[8];

  v47[6] = *MEMORY[0x1E0C80C00];
  if (self->_constraints)
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:");
  -[EKUIPopupTableViewCell traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = EKUIUsesLargeTextLayout(v3);

  -[UILabel leadingAnchor](self->_textLabel, "leadingAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIPopupTableViewCell contentView](self, "contentView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "layoutMarginsGuide");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "leadingAnchor");
  v41 = v5;
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v4)
  {
    v47[0] = v6;
    -[UILabel topAnchor](self->_textLabel, "topAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIPopupTableViewCell contentView](self, "contentView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "layoutMarginsGuide");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "topAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v47[1] = v42;
    -[UIButton leadingAnchor](self->_popupButton, "leadingAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIPopupTableViewCell contentView](self, "contentView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "layoutMarginsGuide");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "leadingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v8;
    objc_msgSend(v8, "constraintEqualToAnchor:", v29);
    v27 = objc_claimAutoreleasedReturnValue();
    v47[2] = v27;
    -[UIButton trailingAnchor](self->_popupButton, "trailingAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIPopupTableViewCell contentView](self, "contentView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "layoutMarginsGuide");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "trailingAnchor");
    v26 = objc_claimAutoreleasedReturnValue();
    v36 = v9;
    objc_msgSend(v9, "constraintLessThanOrEqualToAnchor:", v26);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v47[3] = v10;
    -[UIButton topAnchor](self->_popupButton, "topAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](self->_textLabel, "bottomAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v12);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v47[4] = v30;
    -[UIButton bottomAnchor](self->_popupButton, "bottomAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIPopupTableViewCell contentView](self, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "layoutMarginsGuide");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bottomAnchor");
    v28 = v7;
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v47[5] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 6);
    v18 = (NSArray *)objc_claimAutoreleasedReturnValue();
    constraints = self->_constraints;
    self->_constraints = v18;

    v20 = (void *)v27;
    v7 = v28;

    v21 = (void *)v26;
  }
  else
  {
    v46[0] = v6;
    -[UILabel centerYAnchor](self->_textLabel, "centerYAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIPopupTableViewCell contentView](self, "contentView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "layoutMarginsGuide");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "centerYAnchor");
    v33 = v22;
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v46[1] = v42;
    -[UIButton leadingAnchor](self->_popupButton, "leadingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel trailingAnchor](self->_textLabel, "trailingAnchor");
    v40 = v23;
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintGreaterThanOrEqualToAnchor:constant:", v32, 8.0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v46[2] = v31;
    -[UIButton trailingAnchor](self->_popupButton, "trailingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIPopupTableViewCell contentView](self, "contentView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "layoutMarginsGuide");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "trailingAnchor");
    v29 = v24;
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v46[3] = v34;
    -[UIButton centerYAnchor](self->_popupButton, "centerYAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIPopupTableViewCell contentView](self, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "layoutMarginsGuide");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "centerYAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v12);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v46[4] = v30;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 5);
    v25 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v13 = self->_constraints;
    self->_constraints = v25;
  }

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_constraints);
  -[UILabel setNeedsUpdateConstraints](self->_textLabel, "setNeedsUpdateConstraints");
  -[UIButton setNeedsUpdateConstraints](self->_popupButton, "setNeedsUpdateConstraints");
}

- (void)setPopupMenu:(id)a3
{
  -[UIButton setMenu:](self->_popupButton, "setMenu:", a3);
}

- (UIMenu)popupMenu
{
  return -[UIButton menu](self->_popupButton, "menu");
}

- (void)setPopupMenuProvider:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[UIButton _setMenuProvider:](self->_popupButton, "_setMenuProvider:", v4);

}

- (id)popupMenuProvider
{
  return (id)-[UIButton _menuProvider](self->_popupButton, "_menuProvider");
}

- (void)setShowSelectedImage:(BOOL)a3
{
  if (self->_showSelectedImage != a3)
  {
    self->_showSelectedImage = a3;
    -[UIButton setNeedsUpdateConfiguration](self->_popupButton, "setNeedsUpdateConfiguration");
  }
}

- (void)setTitleStrikethrough:(BOOL)a3
{
  if (self->_titleStrikethrough != a3)
  {
    self->_titleStrikethrough = a3;
    -[UIButton setNeedsUpdateConfiguration](self->_popupButton, "setNeedsUpdateConfiguration");
  }
}

- (id)textLabel
{
  return self->_textLabel;
}

- (BOOL)showSelectedImage
{
  return self->_showSelectedImage;
}

- (BOOL)titleStrikethrough
{
  return self->_titleStrikethrough;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_popupButton, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
}

@end

@implementation HUTitleButtonDescriptionCell

- (HUTitleButtonDescriptionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v6;
  HUTitleButtonDescriptionCell *v7;
  uint64_t v8;
  UIFont *buttonFont;
  void *v10;
  uint64_t v11;
  UIButton *valueButton;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  id location;
  objc_super v21;

  v6 = a4;
  v21.receiver = self;
  v21.super_class = (Class)HUTitleButtonDescriptionCell;
  v7 = -[HUTitleDescriptionCell initWithStyle:reuseIdentifier:](&v21, sel_initWithStyle_reuseIdentifier_, a3, v6);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB558]);
    v8 = objc_claimAutoreleasedReturnValue();
    buttonFont = v7->_buttonFont;
    v7->_buttonFont = (UIFont *)v8;

    -[HUTitleDescriptionCell setMaxNumberOfTitleLines:](v7, "setMaxNumberOfTitleLines:", 0);
    -[HUTitleDescriptionCell setMaxNumberOfDescriptionLines:](v7, "setMaxNumberOfDescriptionLines:", 1);
    -[HUTitleButtonDescriptionCell setButtonText:](v7, "setButtonText:", &stru_1E6F60E80);
    objc_msgSend(MEMORY[0x1E0CEA3A8], "plainButtonConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithConfiguration:primaryAction:", v10, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    valueButton = v7->_valueButton;
    v7->_valueButton = (UIButton *)v11;

    objc_initWeak(&location, v7);
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __62__HUTitleButtonDescriptionCell_initWithStyle_reuseIdentifier___block_invoke;
    v18 = &unk_1E6F5A058;
    objc_copyWeak(&v19, &location);
    -[UIButton setConfigurationUpdateHandler:](v7->_valueButton, "setConfigurationUpdateHandler:", &v15);
    -[UIButton setConfiguration:](v7->_valueButton, "setConfiguration:", v10, v15, v16, v17, v18);
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v7->_valueButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton addTarget:action:forControlEvents:](v7->_valueButton, "addTarget:action:forControlEvents:", v7, sel_handleRemoveAction_, 64);
    -[HUTitleButtonDescriptionCell contentView](v7, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSubview:", v7->_valueButton);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);

  }
  return v7;
}

void __62__HUTitleButtonDescriptionCell_initWithStyle_reuseIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v4;
  id v5;
  id *v6;
  id WeakRetained;
  char v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;

  v4 = (void *)MEMORY[0x1E0CEA3A8];
  v5 = a2;
  objc_msgSend(v4, "plainButtonConfiguration");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = objc_msgSend(WeakRetained, "isDisabled");
  if ((v8 & 1) == 0)
  {
    v2 = objc_loadWeakRetained((id *)(a1 + 32));
    if (objc_msgSend(v2, "buttonColorFollowsTintColor"))
    {
      v9 = objc_loadWeakRetained((id *)(a1 + 32));
      objc_msgSend(v9, "tintColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_5:
      goto LABEL_6;
    }
  }
  objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v8 & 1) == 0)
    goto LABEL_5;
LABEL_6:

  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v12 = objc_loadWeakRetained(v6);
  objc_msgSend(v12, "titleFont");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", v13, *MEMORY[0x1E0CEA098]);

  objc_msgSend(v11, "setObject:forKey:", v10, *MEMORY[0x1E0CEA0A0]);
  v14 = objc_alloc(MEMORY[0x1E0CB3778]);
  v15 = objc_loadWeakRetained(v6);
  objc_msgSend(v15, "buttonText");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v14, "initWithString:attributes:", v16, v11);
  objc_msgSend(v18, "setAttributedTitle:", v17);

  objc_msgSend(v18, "setContentInsets:", *MEMORY[0x1E0CEA080], *(double *)(MEMORY[0x1E0CEA080] + 8), *(double *)(MEMORY[0x1E0CEA080] + 16), *(double *)(MEMORY[0x1E0CEA080] + 24));
  objc_msgSend(v5, "setConfiguration:", v18);

}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUTitleButtonDescriptionCell;
  -[HUTitleDescriptionCell prepareForReuse](&v4, sel_prepareForReuse);
  -[HUTitleButtonDescriptionCell setHideButton:](self, "setHideButton:", 0);
  -[HUTitleButtonDescriptionCell setButtonText:](self, "setButtonText:", 0);
  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB558]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTitleButtonDescriptionCell setButtonFont:](self, "setButtonFont:", v3);

  -[HUTitleButtonDescriptionCell setButtonColorFollowsTintColor:](self, "setButtonColorFollowsTintColor:", 0);
}

- (void)setHideButton:(BOOL)a3
{
  if (self->_hideButton != a3)
  {
    self->_hideButton = a3;
    -[HUTitleButtonDescriptionCell _updateButtonHidden](self, "_updateButtonHidden");
  }
}

- (void)setButtonText:(id)a3
{
  id v5;
  id v6;
  id v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a3;
  -[HUTitleButtonDescriptionCell buttonText](self, "buttonText");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  v13 = v7;
  if (v6 == v7)
  {

    v10 = v13;
  }
  else
  {
    if (v6)
    {
      v8 = objc_msgSend(v6, "isEqual:", v7);

      v9 = v13;
      if ((v8 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_buttonText, a3);
    -[HUTitleButtonDescriptionCell valueButton](self, "valueButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "configuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setTitle:", v13);
    -[HUTitleButtonDescriptionCell valueButton](self, "valueButton");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setConfiguration:", v10);

    -[HUTitleButtonDescriptionCell _updateButtonHidden](self, "_updateButtonHidden");
  }

  v9 = v13;
LABEL_9:

}

- (void)setButtonFont:(id)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if ((-[UIFont isEqual:](self->_buttonFont, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_buttonFont, a3);
    -[HUTitleButtonDescriptionCell valueButton](self, "valueButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "configuration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v7, "setObject:forKey:", v10, *MEMORY[0x1E0CEA098]);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", self->_buttonText, v7);
    objc_msgSend(v6, "setAttributedTitle:", v8);

    -[HUTitleButtonDescriptionCell valueButton](self, "valueButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setConfiguration:", v6);

  }
}

- (void)setButtonColorFollowsTintColor:(BOOL)a3
{
  if (-[HUTitleButtonDescriptionCell buttonColorFollowsTintColor](self, "buttonColorFollowsTintColor") != a3)
    self->_buttonColorFollowsTintColor = a3;
}

- (void)updateConstraints
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
  double v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
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
  _QWORD v40[5];
  _QWORD v41[5];
  objc_super v42;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v42.receiver = self;
  v42.super_class = (Class)HUTitleButtonDescriptionCell;
  -[HUTitleDescriptionCell updateConstraints](&v42, sel_updateConstraints);
  -[HUTitleButtonDescriptionCell valueButton](self, "valueButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HUTitleButtonDescriptionCell valueButton](self, "valueButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "centerYAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTitleButtonDescriptionCell contentView](self, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "centerYAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v10);

    -[HUTitleButtonDescriptionCell contentView](self, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layoutMarginsGuide");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "trailingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTitleButtonDescriptionCell valueButton](self, "valueButton");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "trailingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v15, 1.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v16);

    -[HUTitleButtonDescriptionCell valueButton](self, "valueButton");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v18) = 1144750080;
    objc_msgSend(v17, "setContentCompressionResistancePriority:forAxis:", 0, v18);

    -[HUTitleDescriptionCell titleLabel](self, "titleLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "trailingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintsAffectingLayout");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = MEMORY[0x1E0C809B0];
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __49__HUTitleButtonDescriptionCell_updateConstraints__block_invoke;
    v41[3] = &unk_1E6F57D48;
    v41[4] = self;
    objc_msgSend(v21, "na_each:", v41);

    -[HUTitleDescriptionCell descriptionLabel](self, "descriptionLabel");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "trailingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintsAffectingLayout");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v22;
    v40[1] = 3221225472;
    v40[2] = __49__HUTitleButtonDescriptionCell_updateConstraints__block_invoke_2;
    v40[3] = &unk_1E6F57D48;
    v40[4] = self;
    objc_msgSend(v25, "na_each:", v40);

    -[HUTitleDescriptionCell titleTrailingConstraint](self, "titleTrailingConstraint");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setActive:", 0);

    -[HUTitleDescriptionCell descriptionTrailingConstraint](self, "descriptionTrailingConstraint");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setActive:", 0);

    -[HUTitleDescriptionCell descriptionLabel](self, "descriptionLabel");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v29) = 1132068864;
    objc_msgSend(v28, "setContentCompressionResistancePriority:forAxis:", 0, v29);

    -[HUTitleButtonDescriptionCell valueButton](self, "valueButton");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "leadingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTitleDescriptionCell titleLabel](self, "titleLabel");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "trailingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:multiplier:", v33, 1.0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v34);

    -[HUTitleButtonDescriptionCell valueButton](self, "valueButton");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "leadingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTitleDescriptionCell descriptionLabel](self, "descriptionLabel");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "trailingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:multiplier:", v38, 1.0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v39);

  }
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v3);

}

void __49__HUTitleButtonDescriptionCell_updateConstraints__block_invoke(uint64_t a1, void *a2)
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
  int v12;
  id v13;

  v13 = a2;
  objc_msgSend(v13, "firstAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trailingAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqual:", v5) & 1) != 0)
    objc_msgSend(v13, "secondAnchor");
  else
    objc_msgSend(v13, "firstAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "superview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqual:", v9))
  {

LABEL_7:
    objc_msgSend(v13, "setActive:", 0);
    goto LABEL_8;
  }
  objc_msgSend(*(id *)(a1 + 32), "containerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "trailingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v6, "isEqual:", v11);

  if (v12)
    goto LABEL_7;
LABEL_8:

}

void __49__HUTitleButtonDescriptionCell_updateConstraints__block_invoke_2(uint64_t a1, void *a2)
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
  int v12;
  id v13;

  v13 = a2;
  objc_msgSend(v13, "firstAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "descriptionLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trailingAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqual:", v5) & 1) != 0)
    objc_msgSend(v13, "secondAnchor");
  else
    objc_msgSend(v13, "firstAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "descriptionLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "superview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqual:", v9))
  {

LABEL_7:
    objc_msgSend(v13, "setActive:", 0);
    goto LABEL_8;
  }
  objc_msgSend(*(id *)(a1 + 32), "containerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "trailingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v6, "isEqual:", v11);

  if (v12)
    goto LABEL_7;
LABEL_8:

}

- (void)updateUIWithAnimation:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HUTitleButtonDescriptionCell;
  -[HUTitleDescriptionCell updateUIWithAnimation:](&v9, sel_updateUIWithAnimation_, a3);
  -[HUTitleButtonDescriptionCell setSelectionStyle:](self, "setSelectionStyle:", 0);
  objc_opt_class();
  -[HUIconCell item](self, "item");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "latestResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C08]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;
  -[HUTitleButtonDescriptionCell setButtonText:](self, "setButtonText:", v8);

}

- (void)_updateButtonHidden
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;

  if (-[HUTitleButtonDescriptionCell hideButton](self, "hideButton"))
  {
    v3 = 1;
  }
  else
  {
    -[HUTitleButtonDescriptionCell buttonText](self, "buttonText");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "length") == 0;

  }
  -[HUTitleButtonDescriptionCell valueButton](self, "valueButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 != 0;

  if (((v3 ^ v7) & 1) == 0)
  {
    if (v3)
    {
      -[HUTitleButtonDescriptionCell valueButton](self, "valueButton");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeFromSuperview");
    }
    else
    {
      -[HUTitleButtonDescriptionCell contentView](self, "contentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUTitleButtonDescriptionCell valueButton](self, "valueButton");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSubview:", v9);

    }
    -[HUTitleButtonDescriptionCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    -[HUTitleDescriptionCell updateTitle](self, "updateTitle");
  }
}

- (void)handleRemoveAction:(id)a3
{
  void *v4;
  id v5;

  -[HUTitleButtonDescriptionCell delegate](self, "delegate", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HUIconCell item](self, "item");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "buttonTappedForCell:withItem:", self, v4);

}

- (NSString)buttonText
{
  return self->_buttonText;
}

- (UIFont)buttonFont
{
  return self->_buttonFont;
}

- (BOOL)hideButton
{
  return self->_hideButton;
}

- (BOOL)buttonColorFollowsTintColor
{
  return self->_buttonColorFollowsTintColor;
}

- (HUTitleButtonDescriptionCellDelegate)delegate
{
  return (HUTitleButtonDescriptionCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIButton)valueButton
{
  return self->_valueButton;
}

- (void)setValueButton:(id)a3
{
  objc_storeStrong((id *)&self->_valueButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_buttonFont, 0);
  objc_storeStrong((id *)&self->_buttonText, 0);
}

@end

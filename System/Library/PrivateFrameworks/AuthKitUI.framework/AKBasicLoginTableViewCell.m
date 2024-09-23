@implementation AKBasicLoginTableViewCell

- (AKBasicLoginTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  AKBasicLoginTableViewCell *v4;
  AKBasicLoginTableViewCell *v5;
  void *v6;
  void *v7;
  id v8;
  UITextField *v9;
  void *v10;
  void *v11;
  UITextField *cellTextField;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  UITextField *v31;
  objc_super v32;
  _QWORD v33[5];

  v33[4] = *MEMORY[0x1E0C80C00];
  v32.receiver = self;
  v32.super_class = (Class)AKBasicLoginTableViewCell;
  v4 = -[AKBasicLoginTableViewCell initWithStyle:reuseIdentifier:](&v32, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[AKBasicLoginTableViewCell setSeparatorInset:](v4, "setSeparatorInset:", *MEMORY[0x1E0CEB4B0], *(double *)(MEMORY[0x1E0CEB4B0] + 8), *(double *)(MEMORY[0x1E0CEB4B0] + 16), *(double *)(MEMORY[0x1E0CEB4B0] + 24));
    +[AKBasicLoginAppearance tableCellBackgroundColor](AKBasicLoginAppearance, "tableCellBackgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKBasicLoginTableViewCell setBackgroundColor:](v5, "setBackgroundColor:", v6);

    -[AKBasicLoginTableViewCell textLabel](v5, "textLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidden:", 1);

    v8 = objc_alloc(MEMORY[0x1E0CEAAD0]);
    v9 = (UITextField *)objc_msgSend(v8, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[UITextField setBorderStyle:](v9, "setBorderStyle:", 0);
    -[UITextField setTranslatesAutoresizingMaskIntoConstraints:](v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UITextField setAdjustsFontForContentSizeCategory:](v9, "setAdjustsFontForContentSizeCategory:", 1);
    -[UITextField setAutocapitalizationType:](v9, "setAutocapitalizationType:", 0);
    -[UITextField setAutocorrectionType:](v9, "setAutocorrectionType:", 1);
    -[UITextField setEnablesReturnKeyAutomatically:](v9, "setEnablesReturnKeyAutomatically:", 1);
    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setFont:](v9, "setFont:", v10);

    -[AKBasicLoginTableViewCell contentView](v5, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v9);

    cellTextField = v5->_cellTextField;
    v5->_cellTextField = v9;
    v31 = v9;

    -[UITextField leadingAnchor](v5->_cellTextField, "leadingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKBasicLoginTableViewCell leadingAnchor](v5, "leadingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:constant:", v29, 16.0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v28;
    -[UITextField trailingAnchor](v5->_cellTextField, "trailingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKBasicLoginTableViewCell contentView](v5, "contentView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKBasicLoginTableViewCell separatorInset](v5, "separatorInset");
    objc_msgSend(v26, "constraintEqualToAnchor:constant:", v25, -v13);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = v24;
    -[UITextField heightAnchor](v5->_cellTextField, "heightAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKBasicLoginTableViewCell contentView](v5, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "heightAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:constant:", v16, -20.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v33[2] = v17;
    -[UITextField centerYAnchor](v5->_cellTextField, "centerYAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKBasicLoginTableViewCell contentView](v5, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "centerYAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v33[3] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v22);
  }
  return v5;
}

- (UITextField)cellTextField
{
  return self->_cellTextField;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellTextField, 0);
}

@end

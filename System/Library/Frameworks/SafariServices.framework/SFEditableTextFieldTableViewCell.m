@implementation SFEditableTextFieldTableViewCell

- (SFEditableTextFieldTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  SFEditableTextFieldTableViewCell *v4;
  SFEditableTextFieldTableViewCell *v5;
  void *v6;
  UITextField *v7;
  UITextField *editableTextField;
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
  SFEditableTextFieldTableViewCell *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v30;
  _QWORD v31[5];

  v31[4] = *MEMORY[0x1E0C80C00];
  v30.receiver = self;
  v30.super_class = (Class)SFEditableTextFieldTableViewCell;
  v4 = -[SFEditableTextFieldTableViewCell initWithStyle:reuseIdentifier:](&v30, sel_initWithStyle_reuseIdentifier_, 0, a4);
  v5 = v4;
  if (v4)
  {
    -[SFEditableTextFieldTableViewCell contentView](v4, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v6;
    v7 = (UITextField *)objc_alloc_init(MEMORY[0x1E0DC3DB8]);
    editableTextField = v5->_editableTextField;
    v5->_editableTextField = v7;

    -[UITextField setTranslatesAutoresizingMaskIntoConstraints:](v5->_editableTextField, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    if (-[SFEditableTextFieldTableViewCell _sf_usesLeftToRightLayout](v5, "_sf_usesLeftToRightLayout"))
      v9 = 0;
    else
      v9 = 2;
    -[UITextField setTextAlignment:](v5->_editableTextField, "setTextAlignment:", v9);
    +[_SFAccountManagerAppearanceValues titleFontForLargerCell](_SFAccountManagerAppearanceValues, "titleFontForLargerCell");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setFont:](v5->_editableTextField, "setFont:", v10);

    objc_msgSend(v6, "addSubview:", v5->_editableTextField);
    -[SFEditableTextFieldTableViewCell contentView](v5, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layoutMarginsGuide");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = (void *)MEMORY[0x1E0CB3718];
    -[UITextField leadingAnchor](v5->_editableTextField, "leadingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "leadingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v27);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v26;
    -[UITextField trailingAnchor](v5->_editableTextField, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "trailingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v24);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v31[1] = v13;
    -[UITextField heightAnchor](v5->_editableTextField, "heightAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "heightAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintLessThanOrEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v31[2] = v16;
    -[UITextField centerYAnchor](v5->_editableTextField, "centerYAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "centerYAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v31[3] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "activateConstraints:", v20);

    v21 = v5;
  }

  return v5;
}

- (UITextField)editableTextField
{
  return self->_editableTextField;
}

- (void)setEditableTextField:(id)a3
{
  objc_storeStrong((id *)&self->_editableTextField, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editableTextField, 0);
}

@end

@implementation AKAuthorizationScopeEditTableViewCell

- (AKAuthorizationScopeEditTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  AKAuthorizationScopeEditTableViewCell *v4;
  AKAuthorizationScopeEditTableViewCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AKAuthorizationScopeEditTableViewCell;
  v4 = -[AKAuthorizationScopeEditTableViewCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, 2, a4);
  v5 = v4;
  if (v4)
    -[AKAuthorizationScopeEditTableViewCell _setup](v4, "_setup");
  return v5;
}

- (void)_setup
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  +[AKAuthorizationAppearance editScopeRowBackgroundColor](AKAuthorizationAppearance, "editScopeRowBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationScopeEditTableViewCell setBackgroundColor:](self, "setBackgroundColor:", v3);

  -[AKAuthorizationScopeEditTableViewCell setSelectionStyle:](self, "setSelectionStyle:", 1);
  -[AKAuthorizationScopeEditTableViewCell setAccessoryType:](self, "setAccessoryType:", 0);
  +[AKAuthorizationAppearance editScopeInfoLabelTextColor](AKAuthorizationAppearance, "editScopeInfoLabelTextColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationScopeEditTableViewCell textLabel](self, "textLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextColor:", v4);

  +[AKAuthorizationAppearance editScopeInfoLabelFont](AKAuthorizationAppearance, "editScopeInfoLabelFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationScopeEditTableViewCell textLabel](self, "textLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v6);

  -[AKAuthorizationScopeEditTableViewCell textLabel](self, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAdjustsFontSizeToFitWidth:", 1);

  -[AKAuthorizationScopeEditTableViewCell _setupDetailTextField](self, "_setupDetailTextField");
}

- (void)_setupDetailTextField
{
  UITextField *v3;
  UITextField *detailTextField;
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
  _QWORD v30[5];

  v30[4] = *MEMORY[0x1E0C80C00];
  v3 = (UITextField *)objc_alloc_init(MEMORY[0x1E0CEAAD0]);
  detailTextField = self->_detailTextField;
  self->_detailTextField = v3;

  -[UITextField setTranslatesAutoresizingMaskIntoConstraints:](self->_detailTextField, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UITextField setAutocorrectionType:](self->_detailTextField, "setAutocorrectionType:", 1);
  -[UITextField setReturnKeyType:](self->_detailTextField, "setReturnKeyType:", 4);
  +[AKAuthorizationAppearance editScopeInputFieldFont](AKAuthorizationAppearance, "editScopeInputFieldFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setFont:](self->_detailTextField, "setFont:", v5);

  +[AKAuthorizationAppearance editScopeInputFieldTextColor](AKAuthorizationAppearance, "editScopeInputFieldTextColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setTextColor:](self->_detailTextField, "setTextColor:", v6);

  -[AKAuthorizationScopeEditTableViewCell detailTextLabel](self, "detailTextLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", 1);

  -[AKAuthorizationScopeEditTableViewCell contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationScopeEditTableViewCell detailTextField](self, "detailTextField");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", v9);

  v23 = (void *)MEMORY[0x1E0CB3718];
  -[AKAuthorizationScopeEditTableViewCell contentView](self, "contentView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "heightAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[AKAuthorizationPaneMetrics nameCellHeight](AKAuthorizationPaneMetrics, "nameCellHeight");
  objc_msgSend(v28, "constraintEqualToConstant:");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v27;
  -[AKAuthorizationScopeEditTableViewCell detailTextField](self, "detailTextField");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "leadingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationScopeEditTableViewCell textLabel](self, "textLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "trailingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[AKAuthorizationSubPaneMetrics editInfoLabelToInputFieldSpacing](AKAuthorizationSubPaneMetrics, "editInfoLabelToInputFieldSpacing");
  objc_msgSend(v24, "constraintEqualToAnchor:constant:", v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v21;
  -[AKAuthorizationScopeEditTableViewCell detailTextField](self, "detailTextField");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "trailingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationScopeEditTableViewCell contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "trailingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v13;
  -[AKAuthorizationScopeEditTableViewCell detailTextField](self, "detailTextField");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "centerYAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationScopeEditTableViewCell contentView](self, "contentView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "centerYAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v30[3] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "activateConstraints:", v19);

}

- (UITextField)detailTextField
{
  return self->_detailTextField;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailTextField, 0);
}

@end

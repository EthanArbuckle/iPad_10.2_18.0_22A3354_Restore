@implementation MCInstallationWarningCell

+ (id)reuseIdentifier
{
  return CFSTR("MCInstallationWarningCell");
}

- (MCInstallationWarningCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  MCInstallationWarningCell *v4;
  MCInstallationWarningCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MCInstallationWarningCell;
  v4 = -[MCInstallationWarningCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
    -[MCInstallationWarningCell _setup](v4, "_setup");
  return v5;
}

- (void)_setup
{
  id v3;
  UITextView *v4;
  UITextView *warningLabel;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[MCInstallationWarningCell setSelectionStyle:](self, "setSelectionStyle:", 0);
  v3 = objc_alloc(MEMORY[0x1E0CEAB18]);
  v4 = (UITextView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  warningLabel = self->_warningLabel;
  self->_warningLabel = v4;

  -[UITextView setTranslatesAutoresizingMaskIntoConstraints:](self->_warningLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setFont:](self->_warningLabel, "setFont:", v6);

  -[UITextView setEditable:](self->_warningLabel, "setEditable:", 0);
  -[UITextView setSelectable:](self->_warningLabel, "setSelectable:", 1);
  -[UITextView setScrollEnabled:](self->_warningLabel, "setScrollEnabled:", 0);
  -[UITextView setBackgroundColor:](self->_warningLabel, "setBackgroundColor:", 0);
  -[UITextView setDataDetectorTypes:](self->_warningLabel, "setDataDetectorTypes:", -1);
  -[UITextView setTextContainerInset:](self->_warningLabel, "setTextContainerInset:", *MEMORY[0x1E0CEB4B0], *(double *)(MEMORY[0x1E0CEB4B0] + 8), *(double *)(MEMORY[0x1E0CEB4B0] + 16), *(double *)(MEMORY[0x1E0CEB4B0] + 24));
  -[UITextView textContainer](self->_warningLabel, "textContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLineFragmentPadding:", 0.0);

  -[UITextView textContainer](self->_warningLabel, "textContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLineBreakMode:", 0);

  -[MCInstallationWarningCell contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", self->_warningLabel);

  if (MCUIForPairedDevice())
  {
    BPSDetailTextColor();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setTextColor:](self->_warningLabel, "setTextColor:", v10);

  }
  -[MCInstallationWarningCell _setupConstraints](self, "_setupConstraints");
}

- (void)setWarningLabelText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MCInstallationWarningCell warningLabel](self, "warningLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (void)_setupConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  UITextView *warningLabel;
  void *v8;
  void *v9;
  void *v10;
  UITextView *v11;
  void *v12;
  void *v13;
  void *v14;
  UITextView *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  -[MCInstallationWarningCell constraints](self, "constraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MCInstallationWarningCell contentView](self, "contentView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCInstallationWarningCell constraints](self, "constraints");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeConstraints:", v5);

    -[MCInstallationWarningCell setConstraints:](self, "setConstraints:", 0);
  }
  v22 = (id)objc_opt_new();
  v6 = (void *)MEMORY[0x1E0CB3718];
  warningLabel = self->_warningLabel;
  -[MCInstallationWarningCell contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", warningLabel, 3, 0, v8, 3, 1.0, 10.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObject:", v9);

  v10 = (void *)MEMORY[0x1E0CB3718];
  v11 = self->_warningLabel;
  -[MCInstallationWarningCell contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v11, 5, 0, v12, 5, 1.0, 10.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObject:", v13);

  v14 = (void *)MEMORY[0x1E0CB3718];
  v15 = self->_warningLabel;
  -[MCInstallationWarningCell contentView](self, "contentView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v15, 6, 0, v16, 6, 1.0, -10.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObject:", v17);

  v18 = (void *)MEMORY[0x1E0CB3718];
  -[MCInstallationWarningCell contentView](self, "contentView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v19, 4, 0, self->_warningLabel, 4, 1.0, 10.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObject:", v20);

  -[MCInstallationWarningCell setConstraints:](self, "setConstraints:", v22);
  -[MCInstallationWarningCell contentView](self, "contentView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addConstraints:", v22);

}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_constraints, a3);
}

- (UITextView)warningLabel
{
  return self->_warningLabel;
}

- (void)setWarningLabel:(id)a3
{
  objc_storeStrong((id *)&self->_warningLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_warningLabel, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
}

@end

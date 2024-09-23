@implementation MCProfileTitlePageWarningCell

- (MCProfileTitlePageWarningCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  MCProfileTitlePageWarningCell *v4;
  void *v5;
  id v6;
  uint64_t v7;
  UILabel *label;
  void *v9;
  uint64_t v10;
  UIView *separatorLine;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)MCProfileTitlePageWarningCell;
  v4 = -[MCProfileTitlePageWarningCell initWithStyle:reuseIdentifier:](&v16, sel_initWithStyle_reuseIdentifier_, a3, a4);
  -[MCProfileTitlePageWarningCell setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 0);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCProfileTitlePageWarningCell setBackgroundColor:](v4, "setBackgroundColor:", v5);

  v6 = objc_alloc(MEMORY[0x1E0CEA700]);
  v7 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  label = v4->_label;
  v4->_label = (UILabel *)v7;

  objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", 17.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v4->_label, "setFont:", v9);

  -[UILabel setNumberOfLines:](v4->_label, "setNumberOfLines:", 0);
  -[UILabel setLineBreakMode:](v4->_label, "setLineBreakMode:", 0);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v10 = objc_opt_new();
  separatorLine = v4->_separatorLine;
  v4->_separatorLine = (UIView *)v10;

  objc_msgSend(MEMORY[0x1E0CEA478], "tertiaryLabelColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v4->_separatorLine, "setBackgroundColor:", v12);

  -[MCProfileTitlePageWarningCell contentView](v4, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSubview:", v4->_label);

  -[MCProfileTitlePageWarningCell contentView](v4, "contentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addSubview:", v4->_separatorLine);

  -[MCProfileTitlePageWarningCell _updateConstraintsWithLabel:](v4, "_updateConstraintsWithLabel:", v4->_label);
  return v4;
}

- (void)layoutSubviews
{
  double Width;
  void *v4;
  objc_super v5;
  CGRect v6;

  v5.receiver = self;
  v5.super_class = (Class)MCProfileTitlePageWarningCell;
  -[MCProfileTitlePageWarningCell layoutSubviews](&v5, sel_layoutSubviews);
  -[MCProfileTitlePageWarningCell bounds](self, "bounds");
  Width = CGRectGetWidth(v6);
  -[MCProfileTitlePageWarningCell separatorLine](self, "separatorLine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFrame:", 17.0, 0.0, Width, 0.5);

}

- (void)_updateConstraintsWithLabel:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v13 = CFSTR("label");
  v14[0] = a3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("|-%f-[label]-%f-|"), 0x4031000000000000, 0x4031000000000000);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintsWithVisualFormat:options:metrics:views:", v8, 0, 0, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-[label]-0-|"), 0, 0, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[MCProfileTitlePageWarningCell contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addConstraints:", v9);

  -[MCProfileTitlePageWarningCell contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addConstraints:", v10);

}

- (UILabel)label
{
  return self->_label;
}

- (UIView)separatorLine
{
  return self->_separatorLine;
}

- (void)setSeparatorLine:(id)a3
{
  objc_storeStrong((id *)&self->_separatorLine, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorLine, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end

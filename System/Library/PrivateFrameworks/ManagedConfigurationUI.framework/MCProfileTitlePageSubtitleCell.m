@implementation MCProfileTitlePageSubtitleCell

- (MCProfileTitlePageSubtitleCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  MCProfileTitlePageSubtitleCell *v4;
  MCProfileTitlePageSubtitleCell *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  UILabel *titleLabel;
  UILabel *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MCProfileTitlePageSubtitleCell;
  v4 = -[MCProfileTitlePageSubtitleCell initWithStyle:reuseIdentifier:](&v14, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[MCProfileTitlePageSubtitleCell setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 0);
    -[MCProfileTitlePageSubtitleCell contentView](v5, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setClipsToBounds:", 0);

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCProfileTitlePageSubtitleCell setBackgroundColor:](v5, "setBackgroundColor:", v7);

    v8 = objc_opt_new();
    titleLabel = v5->_titleLabel;
    v5->_titleLabel = (UILabel *)v8;

    -[UILabel setNumberOfLines:](v5->_titleLabel, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](v5->_titleLabel, "setTextAlignment:", 1);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v10 = v5->_titleLabel;
    objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", 17.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v10, "setFont:", v11);

    -[MCProfileTitlePageSubtitleCell contentView](v5, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v5->_titleLabel);

    -[MCProfileTitlePageSubtitleCell _updateConstraintsWithLabel:](v5, "_updateConstraintsWithLabel:", v5->_titleLabel);
  }
  return v5;
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
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("|-%f-[label]-%f-|"), 0x402E000000000000, 0x402E000000000000);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintsWithVisualFormat:options:metrics:views:", v8, 0, 0, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-[label]-0-|"), 0, 0, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[MCProfileTitlePageSubtitleCell contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addConstraints:", v9);

  -[MCProfileTitlePageSubtitleCell contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addConstraints:", v10);

}

- (void)updateProgressWithTranslationDistance:(double)a3 referenceDistance:(double)a4 isScrolling:(BOOL)a5
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;

  -[MCProfileTitlePageSubtitleCell bounds](self, "bounds", a5, a3, a4);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = a3 / 5.0 + v13;
  -[MCProfileTitlePageSubtitleCell contentView](self, "contentView");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFrame:", v8, v14, v10, v12);

}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end

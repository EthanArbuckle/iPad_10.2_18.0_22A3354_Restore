@implementation _SFPageFormatMenuBadgeView

- (_SFPageFormatMenuBadgeView)initWithText:(id)a3
{
  id v4;
  _SFPageFormatMenuBadgeView *v5;
  void *v6;
  UILabel *v7;
  UILabel *titleLabel;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _SFPageFormatMenuBadgeView *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  objc_super v34;
  _QWORD v35[6];

  v35[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)_SFPageFormatMenuBadgeView;
  v5 = -[_SFPageFormatMenuBadgeView initWithFrame:](&v34, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "sf_colorNamed:", CFSTR("settingsAlertDividerBackground"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFPageFormatMenuBadgeView setBackgroundColor:](v5, "setBackgroundColor:", v6);

    -[_SFPageFormatMenuBadgeView setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v5->_titleLabel;
    v5->_titleLabel = v7;

    -[UILabel setText:](v5->_titleLabel, "setText:", v4);
    objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v5->_titleLabel, "setFont:", v9);

    -[UILabel setAdjustsFontForContentSizeCategory:](v5->_titleLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[UILabel setTextAlignment:](v5->_titleLabel, "setTextAlignment:", 1);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v10) = 1144766464;
    -[UILabel setContentHuggingPriority:forAxis:](v5->_titleLabel, "setContentHuggingPriority:forAxis:", 0, v10);
    LODWORD(v11) = 1144766464;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v5->_titleLabel, "setContentCompressionResistancePriority:forAxis:", 1, v11);
    -[_SFPageFormatMenuBadgeView addSubview:](v5, "addSubview:", v5->_titleLabel);
    -[UILabel topAnchor](v5->_titleLabel, "topAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFPageFormatMenuBadgeView topAnchor](v5, "topAnchor");
    v33 = v4;
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:constant:", v13, 6.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = v14;
    LODWORD(v15) = 1144766464;
    objc_msgSend(v14, "setPriority:", v15);
    v27 = (void *)MEMORY[0x1E0CB3718];
    -[UILabel leadingAnchor](v5->_titleLabel, "leadingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFPageFormatMenuBadgeView leadingAnchor](v5, "leadingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:constant:", v31, 6.0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v30;
    -[_SFPageFormatMenuBadgeView trailingAnchor](v5, "trailingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel trailingAnchor](v5->_titleLabel, "trailingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:constant:", v16, 6.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v35[1] = v17;
    v35[2] = v14;
    -[UILabel centerYAnchor](v5->_titleLabel, "centerYAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFPageFormatMenuBadgeView centerYAnchor](v5, "centerYAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v35[3] = v20;
    -[_SFPageFormatMenuBadgeView widthAnchor](v5, "widthAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFPageFormatMenuBadgeView heightAnchor](v5, "heightAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintGreaterThanOrEqualToAnchor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v35[4] = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 5);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "activateConstraints:", v24);

    v4 = v33;
    v25 = v5;

  }
  return v5;
}

- (void)layoutSubviews
{
  double Width;
  double v4;
  void *v5;
  objc_super v6;
  CGRect v7;
  CGRect v8;

  v6.receiver = self;
  v6.super_class = (Class)_SFPageFormatMenuBadgeView;
  -[_SFPageFormatMenuBadgeView layoutSubviews](&v6, sel_layoutSubviews);
  -[_SFPageFormatMenuBadgeView bounds](self, "bounds");
  Width = CGRectGetWidth(v7);
  -[_SFPageFormatMenuBadgeView bounds](self, "bounds");
  v4 = fmin(Width, CGRectGetHeight(v8)) * 0.5;
  -[_SFPageFormatMenuBadgeView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCornerRadius:", v4);

}

+ (id)defaultComponentsArrangement
{
  return &unk_1E4B27358;
}

- (void)setBadgeText:(id)a3
{
  -[UILabel setText:](self->_titleLabel, "setText:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end

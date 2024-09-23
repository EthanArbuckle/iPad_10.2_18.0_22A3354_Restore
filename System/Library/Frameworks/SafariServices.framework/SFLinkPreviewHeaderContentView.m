@implementation SFLinkPreviewHeaderContentView

- (SFLinkPreviewHeaderContentView)initWithStyle:(int64_t)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  SFLinkPreviewHeaderContentView *v8;
  SFLinkPreviewHeaderContentView *v9;
  uint64_t v10;
  UILabel *domainLabel;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  UIButton *togglePreviewButton;
  UIButton *v19;
  void *v20;
  UIButton *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  UIImageView *safariIcon;
  SFLinkPreviewHeaderContentView *v31;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)SFLinkPreviewHeaderContentView;
  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v8 = -[SFLinkPreviewHeaderContentView initWithFrame:](&v33, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v5, v6, v7);
  v9 = v8;
  if (v8)
  {
    v8->_style = a3;
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v4, v5, v6, v7);
    domainLabel = v9->_domainLabel;
    v9->_domainLabel = (UILabel *)v10;

    -[UILabel setLineBreakMode:](v9->_domainLabel, "setLineBreakMode:", 3);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v9->_domainLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v12 = *MEMORY[0x1E0DC4AB8];
    v13 = *MEMORY[0x1E0DC48D0];
    objc_msgSend(MEMORY[0x1E0DC37E8], "_preferredFontForTextStyle:maximumContentSizeCategory:", *MEMORY[0x1E0DC4AB8], *MEMORY[0x1E0DC48D0]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v9->_domainLabel, "setFont:", v14);

    -[SFLinkPreviewHeaderContentView secondaryLabelColor](v9, "secondaryLabelColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v9->_domainLabel, "setTextColor:", v15);

    -[SFLinkPreviewHeaderContentView addSubview:](v9, "addSubview:", v9->_domainLabel);
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("safari"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 0);
    v17 = objc_claimAutoreleasedReturnValue();
    togglePreviewButton = v9->_togglePreviewButton;
    v9->_togglePreviewButton = (UIButton *)v17;

    v19 = v9->_togglePreviewButton;
    _WBSLocalizedString();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](v19, "setTitle:forState:", v20, 0);

    v21 = v9->_togglePreviewButton;
    -[SFLinkPreviewHeaderContentView secondaryLabelColor](v9, "secondaryLabelColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitleColor:forState:](v21, "setTitleColor:forState:", v22, 0);

    objc_msgSend(MEMORY[0x1E0DC37E8], "_preferredFontForTextStyle:maximumContentSizeCategory:", v12, v13);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton titleLabel](v9->_togglePreviewButton, "titleLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setFont:", v23);

    LODWORD(v25) = 1144766464;
    -[UIButton setContentCompressionResistancePriority:forAxis:](v9->_togglePreviewButton, "setContentCompressionResistancePriority:forAxis:", 0, v25);
    v26 = objc_alloc(MEMORY[0x1E0DC3890]);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "imageWithTintColor:renderingMode:", v27, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v26, "initWithImage:", v28);
    safariIcon = v9->_safariIcon;
    v9->_safariIcon = (UIImageView *)v29;

    -[SFLinkPreviewHeaderContentView addSubview:](v9, "addSubview:", v9->_safariIcon);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v9->_safariIcon, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton addTarget:action:forControlEvents:](v9->_togglePreviewButton, "addTarget:action:forControlEvents:", v9, sel__togglePreviewButtonPressed, 0x2000);
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v9->_togglePreviewButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SFLinkPreviewHeaderContentView addSubview:](v9, "addSubview:", v9->_togglePreviewButton);
    v31 = v9;

  }
  return v9;
}

- (id)secondaryLabelColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
}

- (void)setDomain:(id)a3
{
  NSString *v4;
  NSString *domain;
  id v6;

  v6 = a3;
  if (!-[NSString isEqualToString:](self->_domain, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    domain = self->_domain;
    self->_domain = v4;

    -[UILabel setText:](self->_domainLabel, "setText:", self->_domain);
    -[SFLinkPreviewHeaderContentView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }

}

- (void)setPreviewEnabled:(BOOL)a3
{
  int *v4;
  UIButton *togglePreviewButton;
  void *v6;

  if (self->_previewEnabled != a3)
  {
    self->_previewEnabled = a3;
    if (a3)
    {
      if (!self->_style)
        -[UIImageView removeFromSuperview](self->_safariIcon, "removeFromSuperview");
      v4 = &OBJC_IVAR___SFLinkPreviewHeaderContentView__domainLabel;
    }
    else
    {
      -[UILabel removeFromSuperview](self->_domainLabel, "removeFromSuperview");
      if (self->_style)
      {
LABEL_9:
        togglePreviewButton = self->_togglePreviewButton;
        _WBSLocalizedString();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIButton setTitle:forState:](togglePreviewButton, "setTitle:forState:", v6, 0);

        -[SFLinkPreviewHeaderContentView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
        return;
      }
      v4 = &OBJC_IVAR___SFLinkPreviewHeaderContentView__safariIcon;
    }
    -[SFLinkPreviewHeaderContentView addSubview:](self, "addSubview:", *(Class *)((char *)&self->super.super.super.super.super.isa + *v4));
    goto LABEL_9;
  }
}

- (void)_togglePreviewButtonPressed
{
  id v3;

  -[SFLinkPreviewHeaderContentView setPreviewEnabled:](self, "setPreviewEnabled:", !self->_previewEnabled);
  -[SFLinkPreviewHeaderContentView delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "linkPreviewHeaderContentView:didEnableLinkPreview:", self, -[SFLinkPreviewHeaderContentView isPreviewEnabled](self, "isPreviewEnabled"));

}

- (void)_updateDomainWithHidePreviewActionConstraints
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
  NSArray *domainWithHidePreviewActionConstraints;
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
  _QWORD v26[9];

  v26[7] = *MEMORY[0x1E0C80C00];
  if (!self->_domainWithHidePreviewActionConstraints)
  {
    -[UILabel centerYAnchor](self->_domainLabel, "centerYAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFLinkPreviewHeaderContentView centerYAnchor](self, "centerYAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:constant:", v24, 0.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v23;
    -[UILabel heightAnchor](self->_domainLabel, "heightAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFLinkPreviewHeaderContentView heightAnchor](self, "heightAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v21);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = v20;
    -[UILabel leadingAnchor](self->_domainLabel, "leadingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFLinkPreviewHeaderContentView leadingAnchor](self, "leadingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:constant:", v18, 16.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v26[2] = v17;
    -[UILabel trailingAnchor](self->_domainLabel, "trailingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton leadingAnchor](self->_togglePreviewButton, "leadingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintLessThanOrEqualToAnchor:constant:", v15, -16.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v26[3] = v14;
    -[UIButton trailingAnchor](self->_togglePreviewButton, "trailingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFLinkPreviewHeaderContentView trailingAnchor](self, "trailingAnchor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:constant:", v3, -16.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v26[4] = v4;
    -[UIButton topAnchor](self->_togglePreviewButton, "topAnchor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFLinkPreviewHeaderContentView topAnchor](self, "topAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "constraintEqualToAnchor:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v26[5] = v7;
    -[UIButton bottomAnchor](self->_togglePreviewButton, "bottomAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFLinkPreviewHeaderContentView bottomAnchor](self, "bottomAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v26[6] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 7);
    v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
    domainWithHidePreviewActionConstraints = self->_domainWithHidePreviewActionConstraints;
    self->_domainWithHidePreviewActionConstraints = v11;

  }
}

- (void)_updateSafariIconWithShowPreviewActionConstraints
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
  NSArray *safariIconWithShowPreviewActionConstraints;
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
  _QWORD v27[10];

  v27[8] = *MEMORY[0x1E0C80C00];
  if (!self->_safariIconWithShowPreviewActionConstraints)
  {
    -[UIImageView leadingAnchor](self->_safariIcon, "leadingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFLinkPreviewHeaderContentView leadingAnchor](self, "leadingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:constant:", v25, 16.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v24;
    -[UIImageView centerYAnchor](self->_safariIcon, "centerYAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFLinkPreviewHeaderContentView centerYAnchor](self, "centerYAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v22);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = v21;
    -[UIImageView widthAnchor](self->_safariIcon, "widthAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToConstant:", 16.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v27[2] = v19;
    -[UIImageView heightAnchor](self->_safariIcon, "heightAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToConstant:", 16.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v27[3] = v17;
    -[UIImageView trailingAnchor](self->_safariIcon, "trailingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton leadingAnchor](self->_togglePreviewButton, "leadingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:constant:", v15, -6.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v27[4] = v14;
    -[UIButton topAnchor](self->_togglePreviewButton, "topAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFLinkPreviewHeaderContentView topAnchor](self, "topAnchor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v27[5] = v4;
    -[UIButton bottomAnchor](self->_togglePreviewButton, "bottomAnchor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFLinkPreviewHeaderContentView bottomAnchor](self, "bottomAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "constraintEqualToAnchor:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v27[6] = v7;
    -[UIButton trailingAnchor](self->_togglePreviewButton, "trailingAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFLinkPreviewHeaderContentView trailingAnchor](self, "trailingAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintLessThanOrEqualToAnchor:constant:", v9, -16.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v27[7] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 8);
    v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
    safariIconWithShowPreviewActionConstraints = self->_safariIconWithShowPreviewActionConstraints;
    self->_safariIconWithShowPreviewActionConstraints = v11;

  }
}

- (void)updateConstraints
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFLinkPreviewHeaderContentView;
  -[SFLinkPreviewHeaderContentView updateConstraints](&v3, sel_updateConstraints);
  if (self->_previewEnabled)
    -[SFLinkPreviewHeaderContentView _updateDomainWithHidePreviewActionConstraints](self, "_updateDomainWithHidePreviewActionConstraints");
  else
    -[SFLinkPreviewHeaderContentView _updateSafariIconWithShowPreviewActionConstraints](self, "_updateSafariIconWithShowPreviewActionConstraints");
  objc_msgSend(MEMORY[0x1E0CB3718], "sf_setConstraints:active:", self->_domainWithHidePreviewActionConstraints, self->_previewEnabled);
  objc_msgSend(MEMORY[0x1E0CB3718], "sf_setConstraints:active:", self->_safariIconWithShowPreviewActionConstraints, !self->_previewEnabled);
}

- (SFLinkPreviewHeaderContentViewDelegate)delegate
{
  return (SFLinkPreviewHeaderContentViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)domain
{
  return self->_domain;
}

- (BOOL)isPreviewEnabled
{
  return self->_previewEnabled;
}

- (int64_t)style
{
  return self->_style;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domain, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_safariIconWithShowPreviewActionConstraints, 0);
  objc_storeStrong((id *)&self->_domainWithHidePreviewActionConstraints, 0);
  objc_storeStrong((id *)&self->_safariIcon, 0);
  objc_storeStrong((id *)&self->_togglePreviewButton, 0);
  objc_storeStrong((id *)&self->_domainLabel, 0);
}

@end

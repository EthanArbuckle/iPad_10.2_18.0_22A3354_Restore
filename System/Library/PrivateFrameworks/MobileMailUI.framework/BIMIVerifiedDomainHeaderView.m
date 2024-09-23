@implementation BIMIVerifiedDomainHeaderView

- (BIMIVerifiedDomainHeaderView)initWithFrame:(CGRect)a3 domain:(id)a4 mailProviderDisplayName:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v12;
  id v13;
  BIMIVerifiedDomainHeaderView *v14;
  BIMIVerifiedDomainHeaderView *v15;
  objc_super v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12 = a4;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)BIMIVerifiedDomainHeaderView;
  v14 = -[BIMIVerifiedDomainHeaderView initWithFrame:](&v17, sel_initWithFrame_, x, y, width, height);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_domain, a4);
    objc_storeStrong((id *)&v15->_mailProviderDisplayName, a5);
    -[BIMIVerifiedDomainHeaderView setAxis:](v15, "setAxis:", 1);
    -[BIMIVerifiedDomainHeaderView setAlignment:](v15, "setAlignment:", 1);
    -[BIMIVerifiedDomainHeaderView setDistribution:](v15, "setDistribution:", 0);
    -[BIMIVerifiedDomainHeaderView setSpacing:](v15, "setSpacing:", 1.17549435e-38);
    -[BIMIVerifiedDomainHeaderView setLayoutMarginsRelativeArrangement:](v15, "setLayoutMarginsRelativeArrangement:", 1);
    -[BIMIVerifiedDomainHeaderView setDirectionalLayoutMargins:](v15, "setDirectionalLayoutMargins:", 16.0, 0.0, 16.0, 0.0);
    -[BIMIVerifiedDomainHeaderView _setupSubViews](v15, "_setupSubViews");
  }

  return v15;
}

- (void)_setupSubViews
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
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
  id v21;

  v3 = objc_alloc(MEMORY[0x1E0DC3990]);
  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v21 = (id)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], v5, v6, v7);
  _EFLocalizedString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setText:", v8);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AD0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setFont:", v9);

  -[BIMIVerifiedDomainHeaderView addArrangedSubview:](self, "addArrangedSubview:", v21);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v4, v5, v6, v7);
  -[BIMIVerifiedDomainHeaderView mailProviderDisplayName](self, "mailProviderDisplayName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0CB3940];
  _EFLocalizedString();
  if (v11)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[BIMIVerifiedDomainHeaderView mailProviderDisplayName](self, "mailProviderDisplayName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[BIMIVerifiedDomainHeaderView domain](self, "domain");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setText:", v16);

  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[BIMIVerifiedDomainHeaderView domain](self, "domain");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setText:", v15);
  }

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFont:", v17);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTextColor:", v18);

  objc_msgSend(v10, "setNumberOfLines:", 0);
  objc_msgSend(v10, "setLineBreakMode:", 0);
  -[BIMIVerifiedDomainHeaderView addArrangedSubview:](self, "addArrangedSubview:", v10);
  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  _EFLocalizedString();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setTitle:forState:", v20, 0);

  objc_msgSend(v19, "addTarget:action:forControlEvents:", self, sel_learnMoreButtonPressed_, 0x2000);
  -[BIMIVerifiedDomainHeaderView addArrangedSubview:](self, "addArrangedSubview:", v19);

}

- (void)learnMoreButtonPressed:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("BIMI_KB_LINK"), &stru_1E9A04480, CFSTR("Main"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLWithString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "openURL:options:completionHandler:", v6, MEMORY[0x1E0C9AA70], 0);

}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 448);
}

- (NSString)mailProviderDisplayName
{
  return self->_mailProviderDisplayName;
}

- (void)setMailProviderDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 456);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailProviderDisplayName, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

@end

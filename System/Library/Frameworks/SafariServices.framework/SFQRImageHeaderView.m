@implementation SFQRImageHeaderView

- (SFQRImageHeaderView)initWithFrame:(CGRect)a3
{
  SFQRImageHeaderView *v3;
  void *v4;
  id v5;
  SFQRImageHeaderView *v6;
  objc_super v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)SFQRImageHeaderView;
  v3 = -[SFQRImageHeaderView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v9[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)-[SFQRImageHeaderView registerForTraitChanges:withTarget:action:](v3, "registerForTraitChanges:withTarget:action:", v4, v3, sel_userInterfaceStyleDidChange);

    v6 = v3;
  }

  return v3;
}

- (id)_actionTypeString
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_action);
  objc_msgSend(WeakRetained, "defaultActionTargetApplicationBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.mobilesafari"))
      || objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.Preferences"))
      && (objc_msgSend(WeakRetained, "urlThatCanBeOpened"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v6, "safari_isOTPAuthURL"),
          v6,
          v7))
    {
      _WBSLocalizedString();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedName");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_title
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SFQRImageHeaderView _actionTypeString](self, "_actionTypeString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    _WBSLocalizedString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _WBSLocalizedString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringWithFormat:", v4, v2, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _WBSLocalizedString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (void)setAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  UIImageView *v7;
  UIImageView *iconView;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
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
  void *v40;
  void *v41;
  void *v42;
  _QWORD v43[4];
  _QWORD v44[5];

  v44[4] = *MEMORY[0x1E0C80C00];
  objc_storeWeak((id *)&self->_action, a3);
  v4 = objc_alloc(MEMORY[0x1E0DC3890]);
  -[SFQRImageHeaderView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  headerIconForUserInterfaceStyle(objc_msgSend(v5, "userInterfaceStyle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (UIImageView *)objc_msgSend(v4, "initWithImage:", v6);
  iconView = self->_iconView;
  self->_iconView = v7;

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_iconView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[SFQRImageHeaderView addSubview:](self, "addSubview:", self->_iconView);
  v9 = objc_alloc(MEMORY[0x1E0DC3990]);
  v42 = (void *)objc_msgSend(v9, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[SFQRImageHeaderView _title](self, "_title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setText:", v10);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setTextColor:", v11);

  objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A98]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setFont:", v12);

  objc_msgSend(v42, "sizeToFit");
  objc_msgSend(v42, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[SFQRImageHeaderView addSubview:](self, "addSubview:", v42);
  v13 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  objc_msgSend(MEMORY[0x1E0DC3658], "sf_barHairlineShadowColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBackgroundColor:", v14);

  objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[SFQRImageHeaderView addSubview:](self, "addSubview:", v13);
  v32 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v13, "heightAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  _SFOnePixel();
  objc_msgSend(v40, "constraintEqualToConstant:");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v38;
  objc_msgSend(v13, "leadingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFQRImageHeaderView leadingAnchor](self, "leadingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:", v34);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v44[1] = v15;
  objc_msgSend(v13, "trailingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFQRImageHeaderView trailingAnchor](self, "trailingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v44[2] = v18;
  objc_msgSend(v13, "bottomAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFQRImageHeaderView bottomAnchor](self, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v44[3] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "activateConstraints:", v22);

  v33 = (void *)MEMORY[0x1E0CB3718];
  -[UIImageView leadingAnchor](self->_iconView, "leadingAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFQRImageHeaderView leadingAnchor](self, "leadingAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:constant:", v39, 16.0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v37;
  -[UIImageView centerYAnchor](self->_iconView, "centerYAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFQRImageHeaderView centerYAnchor](self, "centerYAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = v24;
  objc_msgSend(v42, "leadingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView trailingAnchor](self->_iconView, "trailingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:constant:", v26, 12.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v43[2] = v27;
  objc_msgSend(v42, "centerYAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFQRImageHeaderView centerYAnchor](self, "centerYAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v43[3] = v30;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "activateConstraints:", v31);

}

- (void)userInterfaceStyleDidChange
{
  void *v3;
  id v4;

  -[SFQRImageHeaderView traitCollection](self, "traitCollection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  headerIconForUserInterfaceStyle(objc_msgSend(v4, "userInterfaceStyle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](self->_iconView, "setImage:", v3);

}

- (BCSAction)action
{
  return (BCSAction *)objc_loadWeakRetained((id *)&self->_action);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_action);
  objc_storeStrong((id *)&self->_iconView, 0);
}

@end

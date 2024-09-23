@implementation AKAuthorizationLoginChoiceTableViewCell

- (AKAuthorizationLoginChoiceTableViewCell)initWithLoginChoice:(id)a3 reuseIdentifier:(id)a4
{
  id v6;
  AKAuthorizationLoginChoiceTableViewCell *v7;
  AKAuthorizationLoginChoiceTableViewCell *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AKAuthorizationLoginChoiceTableViewCell;
  v7 = -[AKAuthorizationScopeDetailTableViewCell initWithStyle:reuseIdentifier:](&v10, sel_initWithStyle_reuseIdentifier_, 2, a4);
  v8 = v7;
  if (v7)
  {
    -[AKAuthorizationLoginChoiceTableViewCell setLoginChoice:](v7, "setLoginChoice:", v6);
    -[AKAuthorizationLoginChoiceTableViewCell _setupSubViews](v8, "_setupSubViews");
  }

  return v8;
}

- (void)_setupSubViews
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationScopeDetailTableViewCell scopeImageView](self, "scopeImageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[AKAuthorizationLoginChoiceTableViewCell _setupSharedIconImageView](self, "_setupSharedIconImageView");
  -[AKAuthorizationLoginChoiceTableViewCell _setupSubViewLayout](self, "_setupSubViewLayout");
}

- (void)_setupSharedIconImageView
{
  UIImageView *v3;
  UIImageView *sharedIconImageView;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0CEA658]);
  sharedIconImageView = self->_sharedIconImageView;
  self->_sharedIconImageView = v3;

  +[AKAuthorizationAppearance sharedAccountIconBackgroundColor](AKAuthorizationAppearance, "sharedAccountIconBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setBackgroundColor:](self->_sharedIconImageView, "setBackgroundColor:", v5);

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setTintColor:](self->_sharedIconImageView, "setTintColor:", v6);

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_sharedIconImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIImageView setContentMode:](self->_sharedIconImageView, "setContentMode:", 4);
  objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = objc_msgSend(v7, "CGColor");
  -[UIImageView layer](self->_sharedIconImageView, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBorderColor:", v8);

  -[UIImageView layer](self->_sharedIconImageView, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBorderWidth:", 1.0);

  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:", 9.0);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:withConfiguration:", CFSTR("person.2.fill"), v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](self->_sharedIconImageView, "setImage:", v11);

  -[UIImageView setHidden:](self->_sharedIconImageView, "setHidden:", 1);
  -[AKAuthorizationLoginChoiceTableViewCell contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", self->_sharedIconImageView);

}

- (void)_setupSubViewLayout
{
  void *v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
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
  _QWORD v19[5];

  v19[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView centerXAnchor](self->_sharedIconImageView, "centerXAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationScopeDetailTableViewCell scopeImageView](self, "scopeImageView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "trailingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[AKAuthorizationSubPaneMetrics sharedAccountIconPadding](AKAuthorizationSubPaneMetrics, "sharedAccountIconPadding");
  objc_msgSend(v17, "constraintEqualToAnchor:constant:", v16, -v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v15;
  -[UIImageView centerYAnchor](self->_sharedIconImageView, "centerYAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationScopeDetailTableViewCell scopeImageView](self, "scopeImageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bottomAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[AKAuthorizationSubPaneMetrics sharedAccountIconPadding](AKAuthorizationSubPaneMetrics, "sharedAccountIconPadding");
  objc_msgSend(v5, "constraintEqualToAnchor:constant:", v7, -v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v9;
  -[UIImageView heightAnchor](self->_sharedIconImageView, "heightAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[AKAuthorizationSubPaneMetrics sharedAccountIconSize](AKAuthorizationSubPaneMetrics, "sharedAccountIconSize");
  objc_msgSend(v10, "constraintEqualToConstant:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v11;
  -[UIImageView widthAnchor](self->_sharedIconImageView, "widthAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[AKAuthorizationSubPaneMetrics sharedAccountIconSize](AKAuthorizationSubPaneMetrics, "sharedAccountIconSize");
  objc_msgSend(v12, "constraintEqualToConstant:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v14);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v3);
}

- (void)layoutSubviews
{
  void *v3;
  CGFloat v4;
  void *v5;
  void *v6;
  void *v7;
  CGFloat v8;
  void *v9;
  void *v10;
  objc_super v11;
  CGRect v12;
  CGRect v13;

  v11.receiver = self;
  v11.super_class = (Class)AKAuthorizationLoginChoiceTableViewCell;
  -[AKAuthorizationScopeDetailTableViewCell layoutSubviews](&v11, sel_layoutSubviews);
  -[AKAuthorizationScopeDetailTableViewCell scopeImageView](self, "scopeImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v4 = CGRectGetHeight(v12) * 0.5;
  -[AKAuthorizationScopeDetailTableViewCell scopeImageView](self, "scopeImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCornerRadius:", v4);

  -[AKAuthorizationLoginChoiceTableViewCell sharedIconImageView](self, "sharedIconImageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v8 = CGRectGetHeight(v13) * 0.5;
  -[AKAuthorizationLoginChoiceTableViewCell sharedIconImageView](self, "sharedIconImageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCornerRadius:", v8);

}

- (void)setLoginChoice:(id)a3
{
  AKAuthorizationLoginChoice *v4;
  AKAuthorizationLoginChoice *loginChoice;

  v4 = (AKAuthorizationLoginChoice *)objc_msgSend(a3, "copy");
  loginChoice = self->_loginChoice;
  self->_loginChoice = v4;

  -[AKAuthorizationLoginChoiceTableViewCell _setupContent](self, "_setupContent");
}

- (UIImage)iconImage
{
  void *v2;
  void *v3;

  -[AKAuthorizationLoginChoiceTableViewCell imageView](self, "imageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (void)setIconImage:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[AKAuthorizationLoginChoiceTableViewCell loginChoice](self, "loginChoice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isAppleIDAuthorization");

  if ((v5 & 1) == 0)
  {
    -[AKAuthorizationLoginChoiceTableViewCell imageView](self, "imageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setImage:", v7);

  }
}

- (void)_setupContent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  void *v14;
  void *v15;

  -[AKAuthorizationScopeDetailTableViewCell mainLabel](self, "mainLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationLoginChoiceTableViewCell loginChoice](self, "loginChoice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "user");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", v5);

  -[AKAuthorizationLoginChoiceTableViewCell setAccessoryType:](self, "setAccessoryType:", 0);
  -[AKAuthorizationLoginChoiceTableViewCell loginChoice](self, "loginChoice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v6, "shouldCreateAppleID");

  if ((_DWORD)v4)
  {
    -[AKAuthorizationScopeDetailTableViewCell mainDetailLabel](self, "mainDetailLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = CFSTR("AUTHORIZE_CREATE_ACCOUNT_LOGIN_CHOICE_SUBTITLE");
  }
  else
  {
    -[AKAuthorizationLoginChoiceTableViewCell loginChoice](self, "loginChoice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    -[AKAuthorizationScopeDetailTableViewCell mainDetailLabel](self, "mainDetailLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if ((isKindOfClass & 1) != 0)
      v10 = CFSTR("AUTHORIZE_SHARED_ACCOUNT_LOGIN_CHOICE_SUBTITLE");
    else
      v10 = CFSTR("AUTHORIZE_EXISTING_ACCOUNT_LOGIN_CHOICE_SUBTITLE");
  }
  objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_1E7679C68, CFSTR("Localizable"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v13);

  +[AKAuthorizationPaneMetrics cellIconSize](AKAuthorizationPaneMetrics, "cellIconSize");
  +[AKIcon iconWithName:size:](AKIcon, "iconWithName:size:", CFSTR("blackLogo"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "automaskedImage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationScopeDetailTableViewCell setScopeImage:](self, "setScopeImage:", v15);

  -[AKAuthorizationScopeDetailTableViewCell _setSeparatorIndentToMainLabel](self, "_setSeparatorIndentToMainLabel");
}

- (AKAuthorizationLoginChoice)loginChoice
{
  return self->_loginChoice;
}

- (UIImageView)sharedIconImageView
{
  return self->_sharedIconImageView;
}

- (void)setSharedIconImageView:(id)a3
{
  objc_storeStrong((id *)&self->_sharedIconImageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedIconImageView, 0);
  objc_storeStrong((id *)&self->_loginChoice, 0);
}

@end

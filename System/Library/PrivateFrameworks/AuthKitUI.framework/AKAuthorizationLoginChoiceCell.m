@implementation AKAuthorizationLoginChoiceCell

- (AKAuthorizationLoginChoiceCell)initWithLoginChoice:(id)a3 reuseIdentifier:(id)a4
{
  id v6;
  AKAuthorizationLoginChoiceCell *v7;
  AKAuthorizationLoginChoiceCell *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AKAuthorizationLoginChoiceCell;
  v7 = -[AKAuthorizationLoginChoiceCell initWithStyle:reuseIdentifier:](&v10, sel_initWithStyle_reuseIdentifier_, 3, a4);
  v8 = v7;
  if (v7)
  {
    -[AKAuthorizationLoginChoiceCell _setupFormat](v7, "_setupFormat");
    -[AKAuthorizationLoginChoiceCell setLoginChoice:](v8, "setLoginChoice:", v6);
  }

  return v8;
}

- (void)setLoginChoice:(id)a3
{
  AKAuthorizationLoginChoice *v4;
  AKAuthorizationLoginChoice *loginChoice;

  v4 = (AKAuthorizationLoginChoice *)objc_msgSend(a3, "copy");
  loginChoice = self->_loginChoice;
  self->_loginChoice = v4;

  -[AKAuthorizationLoginChoiceCell _setupContent](self, "_setupContent");
}

- (UIImage)iconImage
{
  void *v2;
  void *v3;

  -[AKAuthorizationLoginChoiceCell imageView](self, "imageView");
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
  -[AKAuthorizationLoginChoiceCell loginChoice](self, "loginChoice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isAppleIDAuthorization");

  if ((v5 & 1) == 0)
  {
    -[AKAuthorizationLoginChoiceCell imageView](self, "imageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setImage:", v7);

  }
}

- (void)_setupFormat
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  +[AKAuthorizationAppearance scopeRowBackgroundColor](AKAuthorizationAppearance, "scopeRowBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationLoginChoiceCell setBackgroundColor:](self, "setBackgroundColor:", v3);

  -[AKAuthorizationLoginChoiceCell setSelectionStyle:](self, "setSelectionStyle:", 0);
  +[AKAuthorizationAppearance scopeTitleTextColor](AKAuthorizationAppearance, "scopeTitleTextColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationLoginChoiceCell textLabel](self, "textLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextColor:", v4);

  +[AKAuthorizationAppearance scopeTitleFont](AKAuthorizationAppearance, "scopeTitleFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationLoginChoiceCell textLabel](self, "textLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v6);

  +[AKAuthorizationAppearance scopeSubtitleTextColor](AKAuthorizationAppearance, "scopeSubtitleTextColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationLoginChoiceCell detailTextLabel](self, "detailTextLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTextColor:", v8);

  +[AKAuthorizationAppearance scopeSubtitleFont](AKAuthorizationAppearance, "scopeSubtitleFont");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationLoginChoiceCell detailTextLabel](self, "detailTextLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFont:", v10);

  -[AKAuthorizationLoginChoiceCell detailTextLabel](self, "detailTextLabel");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setNumberOfLines:", 0);

}

- (void)_setupContent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  -[AKAuthorizationLoginChoiceCell textLabel](self, "textLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationLoginChoiceCell loginChoice](self, "loginChoice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "user");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", v5);

  -[AKAuthorizationLoginChoiceCell loginChoice](self, "loginChoice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v6, "isAppleIDAuthorization");

  if ((_DWORD)v4)
  {
    -[AKAuthorizationLoginChoiceCell loginChoice](self, "loginChoice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "shouldCreateAppleID");

    if (v8)
    {
      -[AKAuthorizationLoginChoiceCell detailTextLabel](self, "detailTextLabel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("AUTHORIZE_CREATE_ACCOUNT_LOGIN_CHOICE_SUBTITLE"), &stru_1E7679C68, CFSTR("Localizable"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setText:", v11);

      -[AKAuthorizationLoginChoiceCell setSelectionStyle:](self, "setSelectionStyle:", 1);
      -[AKAuthorizationLoginChoiceCell setAccessoryType:](self, "setAccessoryType:", 1);
    }
    -[AKAuthorizationLoginChoiceCell imageView](self, "imageView");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    +[AKAuthorizationPaneMetrics iconSize](AKAuthorizationPaneMetrics, "iconSize");
    +[AKIcon iconWithName:size:](AKIcon, "iconWithName:size:", CFSTR("blackLogo"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "automaskedImage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setImage:", v13);
  }
  else
  {
    -[AKAuthorizationLoginChoiceCell detailTextLabel](self, "detailTextLabel");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("PASSWORD_REQUEST_VIEW_SAVED_FROM"), &stru_1E7679C68, CFSTR("Localizable"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKAuthorizationLoginChoiceCell loginChoice](self, "loginChoice");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "site");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", v13, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setText:", v17);

  }
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double MaxX;
  void *v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double MinY;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  objc_super v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  v24.receiver = self;
  v24.super_class = (Class)AKAuthorizationLoginChoiceCell;
  -[AKAuthorizationLoginChoiceCell layoutSubviews](&v24, sel_layoutSubviews);
  +[AKAuthorizationSubPaneMetrics scopeImageViewSize](AKAuthorizationSubPaneMetrics, "scopeImageViewSize");
  v4 = v3;
  +[AKAuthorizationSubPaneMetrics scopeImageViewTopSpacing](AKAuthorizationSubPaneMetrics, "scopeImageViewTopSpacing");
  v6 = v5;
  v7 = 16.0;
  v25.origin.x = 16.0;
  v25.origin.y = v6;
  v25.size.width = v4;
  v25.size.height = v4;
  MaxX = CGRectGetMaxX(v25);
  -[AKAuthorizationLoginChoiceCell contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v10 = CGRectGetMaxX(v26);

  if (-[AKAuthorizationLoginChoiceCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 1)
  {
    -[AKAuthorizationLoginChoiceCell contentView](self, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    v7 = CGRectGetMaxX(v27) + -16.0 - v4;

    v28.origin.x = v7;
    v28.origin.y = v6;
    v28.size.width = v4;
    v28.size.height = v4;
    v12 = CGRectGetMinX(v28) + -32.0;
    v13 = 16.0;
  }
  else
  {
    v13 = MaxX + 16.0;
    v12 = v10 - (MaxX + 16.0) + -16.0;
  }
  -[AKAuthorizationLoginChoiceCell imageView](self, "imageView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFrame:", v7, v6, v4, v4);

  -[AKAuthorizationLoginChoiceCell textLabel](self, "textLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationLoginChoiceCell textLabel](self, "textLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "frame");
  MinY = CGRectGetMinY(v29);
  -[AKAuthorizationLoginChoiceCell textLabel](self, "textLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "frame");
  objc_msgSend(v15, "setFrame:", v13, MinY, v12, CGRectGetHeight(v30));

  -[AKAuthorizationLoginChoiceCell detailTextLabel](self, "detailTextLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationLoginChoiceCell detailTextLabel](self, "detailTextLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "frame");
  v21 = CGRectGetMinY(v31);
  -[AKAuthorizationLoginChoiceCell detailTextLabel](self, "detailTextLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "frame");
  objc_msgSend(v19, "setFrame:", v13, v21, v12, CGRectGetHeight(v32));

  -[AKAuthorizationLoginChoiceCell textLabel](self, "textLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "frame");
  -[AKAuthorizationLoginChoiceCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, CGRectGetMinX(v33), 0.0, 0.0);

}

- (BOOL)_isSharedAccountLoginChoice
{
  void *v2;
  char isKindOfClass;

  -[AKAuthorizationLoginChoiceCell loginChoice](self, "loginChoice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (AKAuthorizationLoginChoice)loginChoice
{
  return self->_loginChoice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loginChoice, 0);
}

@end

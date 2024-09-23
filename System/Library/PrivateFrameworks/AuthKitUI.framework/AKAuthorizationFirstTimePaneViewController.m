@implementation AKAuthorizationFirstTimePaneViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  AKAuthorizationBulletPointSubPane *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  char v15;
  int v16;
  __CFString *v17;
  char v18;
  int v19;
  void *v20;
  AKAuthorizationBulletPointSubPane *v21;
  AKAuthorizationBulletPointSubPane *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  AKAuthorizationBulletPointSubPane *v31;
  void *v32;
  void *v33;
  AKAuthorizationBulletPointSubPane *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  AKAuthorizationBulletPointSubPane *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  char v48;
  void *v49;
  void *v50;
  objc_super v51;

  v51.receiver = self;
  v51.super_class = (Class)AKAuthorizationFirstTimePaneViewController;
  -[AKAuthorizationPaneViewController viewDidLoad](&v51, sel_viewDidLoad);
  +[AKAuthorizationAppearance paneBackgroundColor](AKAuthorizationAppearance, "paneBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationFirstTimePaneViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[AKAuthorizationPaneViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", self);

  -[AKAuthorizationPaneViewController mutableConstraints](self, "mutableConstraints");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationPaneViewController headerPaneContext](self, "headerPaneContext");
  v6 = objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationFirstTimePaneViewController _addIconToContext:](self, "_addIconToContext:", v6);
  v49 = (void *)v6;
  -[AKAuthorizationFirstTimePaneViewController _addTitleToContext:](self, "_addTitleToContext:", v6);
  -[AKAuthorizationFirstTimePaneViewController authorizationViewController](self, "authorizationViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "_isManagedAppleID");

  v9 = [AKAuthorizationBulletPointSubPane alloc];
  +[AKAuthorizationBiometricImage biometricImage](AKAuthorizationBiometricImage, "biometricImage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("AUTHORIZE_FIRST_TIME_TITLE_1"), &stru_1E7679C68, CFSTR("Localizable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v8;
  if (v8)
  {
    v14 = CFSTR("AUTHORIZE_FIRST_TIME_MANAGED_ACCOUNT_MESSAGE_1");
    v15 = objc_msgSend(CFSTR("AUTHORIZE_FIRST_TIME_MANAGED_ACCOUNT_MESSAGE_1"), "containsString:", CFSTR("REBRAND"));
    if ((v15 & 1) != 0)
    {
      v16 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D001E8], "sharedManager");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v47, "isAABrandingEnabled"))
      {
        objc_msgSend(CFSTR("AUTHORIZE_FIRST_TIME_MANAGED_ACCOUNT_MESSAGE_1"), "stringByAppendingString:", CFSTR("_REBRAND"));
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v16 = 1;
      }
      else
      {
        v16 = 0;
      }
    }
    objc_msgSend(v13, "localizedStringForKey:value:table:", v14, &stru_1E7679C68, CFSTR("Localizable"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[AKAuthorizationBulletPointSubPane initWithImage:title:message:](v9, "initWithImage:title:message:", v10, v12, v20);

    if (v16)
    if ((v15 & 1) == 0)

    v22 = [AKAuthorizationBulletPointSubPane alloc];
    objc_msgSend(MEMORY[0x1E0CEA638], "ak_imageNamed:", CFSTR("lock.fill"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("AUTHORIZE_FIRST_TIME_MANAGED_ACCOUNT_TITLE_2"), &stru_1E7679C68, CFSTR("Localizable"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    v28 = CFSTR("AUTHORIZE_FIRST_TIME_MANAGED_ACCOUNT_MESSAGE_2");
  }
  else
  {
    v17 = CFSTR("AUTHORIZE_FIRST_TIME_MESSAGE_1");
    v18 = objc_msgSend(CFSTR("AUTHORIZE_FIRST_TIME_MESSAGE_1"), "containsString:", CFSTR("REBRAND"));
    if ((v18 & 1) != 0)
    {
      v19 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D001E8], "sharedManager");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v47, "isAABrandingEnabled"))
      {
        objc_msgSend(CFSTR("AUTHORIZE_FIRST_TIME_MESSAGE_1"), "stringByAppendingString:", CFSTR("_REBRAND"));
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v19 = 1;
      }
      else
      {
        v19 = 0;
      }
    }
    objc_msgSend(v13, "localizedStringForKey:value:table:", v17, &stru_1E7679C68, CFSTR("Localizable"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[AKAuthorizationBulletPointSubPane initWithImage:title:message:](v9, "initWithImage:title:message:", v10, v12, v29);

    if (v19)
    if ((v18 & 1) == 0)

    v22 = [AKAuthorizationBulletPointSubPane alloc];
    objc_msgSend(MEMORY[0x1E0CEA638], "ak_imageNamed:", CFSTR("hand.raised.fill"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("AUTHORIZE_FIRST_TIME_TITLE_2"), &stru_1E7679C68, CFSTR("Localizable"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    v28 = CFSTR("AUTHORIZE_FIRST_TIME_MESSAGE_2");
  }
  objc_msgSend(v26, "localizedStringForKey:value:table:", v28, &stru_1E7679C68, CFSTR("Localizable"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = -[AKAuthorizationBulletPointSubPane initWithImage:title:message:](v22, "initWithImage:title:message:", v23, v25, v30);

  -[AKAuthorizationPaneViewController headerPaneContext](self, "headerPaneContext");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addSubPane:", v21);

  -[AKAuthorizationPaneViewController headerPaneContext](self, "headerPaneContext");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addSubPane:", v31);

  +[AKAuthorizationPaneMetrics interBulletSpacing](AKAuthorizationPaneMetrics, "interBulletSpacing");
  -[AKAuthorizationSubPane setCustomSpacingAfter:](v21, "setCustomSpacingAfter:");
  +[AKAuthorizationPaneMetrics interBulletSpacing](AKAuthorizationPaneMetrics, "interBulletSpacing");
  -[AKAuthorizationSubPane setCustomSpacingAfter:](v31, "setCustomSpacingAfter:");
  if ((v48 & 1) == 0)
  {
    v34 = [AKAuthorizationBulletPointSubPane alloc];
    objc_msgSend(MEMORY[0x1E0CEA638], "ak_imageNamed:", *MEMORY[0x1E0D000C0]);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("AUTHORIZE_FIRST_TIME_TITLE_3"), &stru_1E7679C68, CFSTR("Localizable"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "localizedStringForKey:value:table:", CFSTR("AUTHORIZE_FIRST_TIME_MESSAGE_3"), &stru_1E7679C68, CFSTR("Localizable"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = -[AKAuthorizationBulletPointSubPane initWithImage:title:message:](v34, "initWithImage:title:message:", v35, v37, v39);

    -[AKAuthorizationPaneViewController headerPaneContext](self, "headerPaneContext");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "addSubPane:", v40);

  }
  -[AKAuthorizationPaneViewController footerPaneContext](self, "footerPaneContext");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationFirstTimePaneViewController _addPrivacyLinkToContext:](self, "_addPrivacyLinkToContext:", v42);

  -[AKAuthorizationPaneViewController footerPaneContext](self, "footerPaneContext");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "localizedStringForKey:value:table:", CFSTR("AUTHORIZE_FIRST_TIME_BUTTON_TITLE"), &stru_1E7679C68, CFSTR("Localizable"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationFirstTimePaneViewController _addContinueButtonToContext:title:](self, "_addContinueButtonToContext:title:", v43, v45);

  -[AKAuthorizationPaneViewController footerPaneContext](self, "footerPaneContext");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "addEmptyViewWithSpacing:", 0.0);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v50);
}

- (BOOL)shouldEmbedContentTrayIfNeeded
{
  return 1;
}

- (void)_addIconToContext:(id)a3
{
  void *v3;
  AKAuthorizationSubPaneImage *v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
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
  id v24;
  void *v25;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB34D0];
  v24 = a3;
  objc_msgSend(v3, "bundleForClass:", objc_opt_class());
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "imageNamed:inBundle:", CFSTR("SignInWithAppleLogo"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[AKAuthorizationSubPaneImage initWithImage:]([AKAuthorizationSubPaneImage alloc], "initWithImage:", v23);
  -[AKAuthorizationSubPaneImage image](v4, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "size");
  if (v6 == 0.0)
  {
    v12 = 1.0;
  }
  else
  {
    -[AKAuthorizationSubPaneImage image](v4, "image");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "size");
    v9 = v8;
    -[AKAuthorizationSubPaneImage image](v4, "image");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "size");
    v12 = v9 / v11;

  }
  -[AKAuthorizationSubPaneImage imageView](v4, "imageView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "heightAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[AKAuthorizationPaneMetrics iconSize](AKAuthorizationPaneMetrics, "iconSize");
  objc_msgSend(v14, "constraintEqualToConstant:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v16;
  -[AKAuthorizationSubPaneImage imageView](v4, "imageView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "widthAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationSubPaneImage imageView](v4, "imageView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "heightAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:multiplier:", v20, v12);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationSubPaneImage setImageViewConstraints:](v4, "setImageViewConstraints:", v22);

  objc_msgSend(v24, "addSubPane:", v4);
  +[AKAuthorizationPaneMetrics iconBottomSpacing](AKAuthorizationPaneMetrics, "iconBottomSpacing");
  -[AKAuthorizationSubPane setCustomSpacingAfter:](v4, "setCustomSpacingAfter:");

}

- (void)_addTitleToContext:(id)a3
{
  void *v4;
  int v5;
  AKAuthorizationSubPaneInfoLabel *v6;
  void *v7;
  void *v8;
  AKAuthorizationSubPaneInfoLabel *v9;
  AKAuthorizationSubPaneInfoLabel *v10;
  void *v11;
  void *v12;
  AKAuthorizationSubPaneInfoLabel *v13;
  id v14;

  v14 = a3;
  -[AKAuthorizationFirstTimePaneViewController authorizationViewController](self, "authorizationViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_isManagedAppleID");

  v6 = [AKAuthorizationSubPaneInfoLabel alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("AUTHORIZE_FIRST_TIME_TITLE"), &stru_1E7679C68, CFSTR("Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[AKAuthorizationSubPaneInfoLabel initWithString:](v6, "initWithString:", v8);

  -[AKAuthorizationSubPaneInfoLabel setInfoLabelType:](v9, "setInfoLabelType:", 1);
  objc_msgSend(v14, "addSubPane:", v9);
  if (v5)
  {
    +[AKAuthorizationPaneMetrics titleToSmallTitleVerticalSpacing](AKAuthorizationPaneMetrics, "titleToSmallTitleVerticalSpacing");
    -[AKAuthorizationSubPane setCustomSpacingAfter:](v9, "setCustomSpacingAfter:");
    v10 = [AKAuthorizationSubPaneInfoLabel alloc];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("AUTHORIZE_FIRST_TIME_MANAGED_ACCOUNT_SMALLTITLE"), &stru_1E7679C68, CFSTR("Localizable"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[AKAuthorizationSubPaneInfoLabel initWithString:](v10, "initWithString:", v12);

    -[AKAuthorizationSubPaneInfoLabel setInfoLabelType:](v13, "setInfoLabelType:", 3);
    objc_msgSend(v14, "addSubPane:", v13);
    +[AKAuthorizationPaneMetrics titleBottomSpacing](AKAuthorizationPaneMetrics, "titleBottomSpacing");
    -[AKAuthorizationSubPane setCustomSpacingAfter:](v13, "setCustomSpacingAfter:");

  }
  else
  {
    +[AKAuthorizationPaneMetrics titleBottomSpacing](AKAuthorizationPaneMetrics, "titleBottomSpacing");
    -[AKAuthorizationSubPane setCustomSpacingAfter:](v9, "setCustomSpacingAfter:");
  }

}

- (void)_addPrivacyLinkToContext:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  AKAuthorizationSubPanePrivacyLink *v7;

  v4 = a3;
  +[AKAuthorizationPaneMetrics privacyLinkTopSpacing](AKAuthorizationPaneMetrics, "privacyLinkTopSpacing");
  objc_msgSend(v4, "addEmptyViewWithSpacing:");
  -[AKAuthorizationFirstTimePaneViewController authorizationViewController](self, "authorizationViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_isManagedAppleID");

  v7 = -[AKAuthorizationSubPanePrivacyLink initWithPrivacyLinkType:]([AKAuthorizationSubPanePrivacyLink alloc], "initWithPrivacyLinkType:", v6);
  objc_msgSend(v4, "addSubPane:", v7);

  +[AKAuthorizationPaneMetrics privacyLinkBottomSpacing](AKAuthorizationPaneMetrics, "privacyLinkBottomSpacing");
  -[AKAuthorizationSubPane setCustomSpacingAfter:](v7, "setCustomSpacingAfter:");

}

- (void)_addContinueButtonToContext:(id)a3 title:(id)a4
{
  id v6;
  id v7;
  AKAuthorizationContinueButton *v8;
  AKAuthorizationContinueButton *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  v8 = [AKAuthorizationContinueButton alloc];
  v9 = -[AKAuthorizationContinueButton initWithFrame:](v8, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[AKAuthorizationContinueButton setTranslatesAutoresizingMaskIntoConstraints:](v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[AKAuthorizationButton setButtonText:](v9, "setButtonText:", v6);

  -[AKAuthorizationButton addTarget:action:](v9, "addTarget:action:", self, sel__continueButtonSelected_);
  objc_msgSend(v7, "stackView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[AKAuthorizationPaneMetrics continueButtonTopSpacing](AKAuthorizationPaneMetrics, "continueButtonTopSpacing");
  v12 = v11;
  objc_msgSend(v7, "stackView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "arrangedSubviews");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "lastObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCustomSpacing:afterView:", v15, v12);

  objc_msgSend(v7, "stackView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addArrangedSubview:", v9);

  objc_msgSend(v7, "stackView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[AKAuthorizationPaneMetrics continueButtonBottomSpacing](AKAuthorizationPaneMetrics, "continueButtonBottomSpacing");
  objc_msgSend(v17, "setCustomSpacing:afterView:", v9);

  objc_msgSend(v7, "mutableConstraints");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[AKAuthorizationContinueButton heightAnchor](v9, "heightAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[AKAuthorizationPaneMetrics continueButtonHeight](AKAuthorizationPaneMetrics, "continueButtonHeight");
  objc_msgSend(v19, "constraintEqualToConstant:");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObjectsFromArray:", v21);

}

- (void)_continueButtonSelected:(id)a3
{
  void *v4;
  AKAuthorizationFirstTimePaneViewController *v5;
  id v6;

  -[AKAuthorizationFirstTimePaneViewController navigationController](self, "navigationController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topViewController");
  v5 = (AKAuthorizationFirstTimePaneViewController *)objc_claimAutoreleasedReturnValue();

  if (v5 == self)
  {
    -[AKAuthorizationPaneViewController paneDelegate](self, "paneDelegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "performAppleIDAuthorizationForPaneViewController:", self);

  }
}

- (AKAuthorizationViewController)authorizationViewController
{
  return (AKAuthorizationViewController *)objc_loadWeakRetained((id *)&self->_authorizationViewController);
}

- (void)setAuthorizationViewController:(id)a3
{
  objc_storeWeak((id *)&self->_authorizationViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_authorizationViewController);
}

@end

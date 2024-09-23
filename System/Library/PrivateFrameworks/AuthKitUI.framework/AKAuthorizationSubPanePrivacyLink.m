@implementation AKAuthorizationSubPanePrivacyLink

- (AKAuthorizationSubPanePrivacyLink)initWithPrivacyLinkType:(unint64_t)a3
{
  void *v4;
  AKAuthorizationSubPanePrivacyLink *v5;
  objc_super v7;

  -[AKAuthorizationSubPanePrivacyLink _createPrivacyLinkWithType:](self, "_createPrivacyLinkWithType:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7.receiver = self;
  v7.super_class = (Class)AKAuthorizationSubPanePrivacyLink;
  v5 = -[AKAuthorizationSubPane initWithViewController:](&v7, sel_initWithViewController_, v4);

  return v5;
}

- (void)addToStackView:(id)a3 context:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AKAuthorizationSubPanePrivacyLink;
  -[AKAuthorizationSubPane addToStackView:context:](&v4, sel_addToStackView_context_, a3, a4);
}

- (void)addToConstraints:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
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
  objc_super v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)AKAuthorizationSubPanePrivacyLink;
  v6 = a4;
  v7 = a3;
  -[AKAuthorizationSubPane addToConstraints:context:](&v21, sel_addToConstraints_context_, v7, v6);
  +[AKAuthorizationSubPaneMetrics privacyLinkMarginInset](AKAuthorizationSubPaneMetrics, "privacyLinkMarginInset");
  v9 = v8;
  -[AKAuthorizationSubPane view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "leadingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stackView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "leadingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:constant:", v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v12;
  -[AKAuthorizationSubPane view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stackView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "trailingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:constant:", v16, -v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v18);

}

- (id)_createPrivacyLinkWithType:(unint64_t)a3
{
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;

  if (a3 == 1)
    v4 = CFSTR("com.apple.onboarding.signinwithmaid");
  else
    v4 = CFSTR("com.apple.onboarding.signinwithapple");
  objc_msgSend(MEMORY[0x1E0D65190], "linkWithBundleIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  if (a3 == 1)
  {
    objc_msgSend(v5, "setDisplayIcon:", 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D001E8], "sharedManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDisplayLargeIcon:", objc_msgSend(v7, "isLisbonAvailable") ^ 1);

  }
  return v5;
}

@end

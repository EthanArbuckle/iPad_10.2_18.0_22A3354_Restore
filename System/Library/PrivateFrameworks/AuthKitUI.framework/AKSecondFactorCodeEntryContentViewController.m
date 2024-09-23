@implementation AKSecondFactorCodeEntryContentViewController

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0CEB3F0], 0);

  v4.receiver = self;
  v4.super_class = (Class)AKSecondFactorCodeEntryContentViewController;
  -[AKSecondFactorCodeEntryContentViewController dealloc](&v4, sel_dealloc);
}

- (void)_configureTitleHeaderView
{
  void *v2;
  AKBasicLoginContentViewController *v4;
  AKBasicLoginContentViewController *titleHeaderViewController;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  __CFString *v15;
  char v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v4 = -[AKBasicLoginContentViewController initWithNibName:bundle:]([AKBasicLoginContentViewController alloc], "initWithNibName:bundle:", 0, 0);
  titleHeaderViewController = self->_titleHeaderViewController;
  self->_titleHeaderViewController = v4;

  v6 = -[AKSecondFactorCodeEntryContentViewController piggybackingForTrustedDevice](self, "piggybackingForTrustedDevice");
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("VERIFICATION_HEADER_REPAIR"), &stru_1E7679C68, CFSTR("Localizable"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKBasicLoginContentViewController contentContainerView](self->_titleHeaderViewController, "contentContainerView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setTitleText:", v9);

    -[AKSecondFactorCodeEntryContentViewController authenticationContext](self, "authenticationContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_message");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
      goto LABEL_16;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = v13;
    v14 = CFSTR("ENTER_VERIFICATION_CODE_REPAIR");
    goto LABEL_15;
  }
  v15 = CFSTR("VERIFICATION_HEADER");
  v16 = objc_msgSend(CFSTR("VERIFICATION_HEADER"), "containsString:", CFSTR("REBRAND"));
  if ((v16 & 1) != 0)
  {
    v17 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D001E8], "sharedManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "isAABrandingEnabled"))
    {
      objc_msgSend(CFSTR("VERIFICATION_HEADER"), "stringByAppendingString:", CFSTR("_REBRAND"));
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v17 = 1;
    }
    else
    {
      v17 = 0;
    }
  }
  objc_msgSend(v8, "localizedStringForKey:value:table:", v15, &stru_1E7679C68, CFSTR("Localizable"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKBasicLoginContentViewController contentContainerView](self->_titleHeaderViewController, "contentContainerView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setTitleText:", v18);

  if (v17)
  if ((v16 & 1) == 0)

  -[AKSecondFactorCodeEntryContentViewController authenticationContext](self, "authenticationContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_message");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = v13;
    v14 = CFSTR("ENTER_VERIFICATION_CODE");
LABEL_15:
    objc_msgSend(v13, "localizedStringForKey:value:table:", v14, &stru_1E7679C68, CFSTR("Localizable"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_16:
  -[AKBasicLoginContentViewController contentContainerView](self->_titleHeaderViewController, "contentContainerView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setMessageText:", v12);

  if (!v11)
  {

  }
  -[AKSecondFactorCodeEntryContentViewController addChildViewController:](self, "addChildViewController:", self->_titleHeaderViewController);
  -[AKBasicLoginContentViewController view](self->_titleHeaderViewController, "view");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[AKSecondFactorCodeEntryContentViewController view](self, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addSubview:", v22);

}

- (void)_configureCodeGenView
{
  AKCodeEntryView *v3;
  AKCodeEntryView *v4;
  AKCodeEntryView *codeGeneratorView;
  id v6;

  v3 = [AKCodeEntryView alloc];
  v4 = -[AKCodeEntryView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  codeGeneratorView = self->_codeGeneratorView;
  self->_codeGeneratorView = v4;

  -[AKSecondFactorCodeEntryContentViewController view](self, "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", self->_codeGeneratorView);

}

- (void)updateViewConstraints
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  AKCodeEntryView *codeGeneratorView;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  AKCodeEntryView *v25;
  void *v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  AKCodeEntryView *v32;
  void *v33;
  double v34;
  void *v35;
  NSArray *v36;
  NSArray *activeConstraints;
  objc_super v38;
  uint64_t v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v38.receiver = self;
  v38.super_class = (Class)AKSecondFactorCodeEntryContentViewController;
  -[AKSecondFactorCodeEntryContentViewController updateViewConstraints](&v38, sel_updateViewConstraints);
  if (self->_activeConstraints)
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:");
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = (void *)MEMORY[0x1E0CB3718];
  -[AKBasicLoginContentViewController view](self->_titleHeaderViewController, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKSecondFactorCodeEntryContentViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v5, 9, 0, v6, 9, 1.0, 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  v8 = (void *)MEMORY[0x1E0CB3718];
  -[AKBasicLoginContentViewController view](self->_titleHeaderViewController, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKSecondFactorCodeEntryContentViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v9, 3, 0, v10, 3, 1.0, 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v11);

  v12 = (void *)MEMORY[0x1E0CB3718];
  codeGeneratorView = self->_codeGeneratorView;
  -[AKSecondFactorCodeEntryContentViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", codeGeneratorView, 9, 0, v14, 9, 1.0, 0.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v15);

  v16 = objc_alloc_init(MEMORY[0x1E0CEA248]);
  objc_msgSend(v16, "setWantsBaselineOffset:", 1);
  +[AKCodeEntryView generatorFieldFont](AKCodeEntryView, "generatorFieldFont");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKBasicLoginContentViewController contentContainerView](self->_titleHeaderViewController, "contentContainerView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "messageText");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = *MEMORY[0x1E0CEA098];
  v40[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "boundingRectWithSize:options:attributes:context:", 0, v20, v16, 1.79769313e308, 1.79769313e308);

  objc_msgSend(v16, "baselineOffset");
  v22 = v21;
  objc_msgSend(MEMORY[0x1E0CEA5F8], "metricsForTextStyle:", *MEMORY[0x1E0CEB538]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)MEMORY[0x1E0CB3718];
  v25 = self->_codeGeneratorView;
  -[AKBasicLoginContentViewController view](self->_titleHeaderViewController, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "scaledValueForValue:", 50.0);
  objc_msgSend(v24, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v25, 3, 0, v26, 11, 1.0, ceil(v27 - v22));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addObject:", v28);
  objc_msgSend(v17, "descender");
  v30 = v29;
  v31 = (void *)MEMORY[0x1E0CB3718];
  v32 = self->_codeGeneratorView;
  -[AKSecondFactorCodeEntryContentViewController view](self, "view");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "scaledValueForValue:", -32.0);
  objc_msgSend(v31, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v32, 4, 0, v33, 4, 1.0, ceil(v34 - v30));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v35);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v3);
  v36 = (NSArray *)objc_msgSend(v3, "copy");
  activeConstraints = self->_activeConstraints;
  self->_activeConstraints = v36;

}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AKSecondFactorCodeEntryContentViewController;
  -[AKSecondFactorCodeEntryContentViewController loadView](&v9, sel_loadView);
  -[AKSecondFactorCodeEntryContentViewController extensionContext](self, "extensionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inputItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "ak_context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKSecondFactorCodeEntryContentViewController setAuthenticationContext:](self, "setAuthenticationContext:", v6);

  -[AKSecondFactorCodeEntryContentViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[AKSecondFactorCodeEntryContentViewController _configureTitleHeaderView](self, "_configureTitleHeaderView");
  -[AKSecondFactorCodeEntryContentViewController _configureCodeGenView](self, "_configureCodeGenView");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__updateFontContstraints_, *MEMORY[0x1E0CEB3F0], 0);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AKSecondFactorCodeEntryContentViewController;
  -[AKSecondFactorCodeEntryContentViewController viewWillLayoutSubviews](&v6, sel_viewWillLayoutSubviews);
  -[AKSecondFactorCodeEntryContentViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0CEB988], *(double *)(MEMORY[0x1E0CEB988] + 8));
  v5 = v4;

  -[AKSecondFactorCodeEntryContentViewController setPreferredContentSize:](self, "setPreferredContentSize:", 270.0, v5);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AKSecondFactorCodeEntryContentViewController;
  -[AKSecondFactorCodeEntryContentViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[AKCodeEntryView becomeFirstResponder](self->_codeGeneratorView, "becomeFirstResponder");
}

- (void)_updateFontContstraints:(id)a3
{
  id v3;

  -[AKSecondFactorCodeEntryContentViewController view](self, "view", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsUpdateConstraints");

}

- (void)setReason:(id)a3
{
  AKBasicLoginContentViewController *titleHeaderViewController;
  id v5;
  void *v6;
  id v7;

  titleHeaderViewController = self->_titleHeaderViewController;
  v5 = a3;
  -[AKBasicLoginContentViewController contentContainerView](titleHeaderViewController, "contentContainerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMessageText:", v5);

  -[AKSecondFactorCodeEntryContentViewController view](self, "view");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNeedsUpdateConstraints");

}

- (NSString)reason
{
  void *v2;
  void *v3;

  -[AKBasicLoginContentViewController contentContainerView](self->_titleHeaderViewController, "contentContainerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "messageText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)generatedCode
{
  return -[AKCodeEntryView stringValue](self->_codeGeneratorView, "stringValue");
}

- (void)jiggleAView
{
  void *v3;
  double v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  id v14;

  -[AKCodeEntryView layer](self->_codeGeneratorView, "layer");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD2848], "animation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMass:", 1.20000005);
  objc_msgSend(v3, "setStiffness:", 1200.0);
  objc_msgSend(v3, "setDamping:", 12.0);
  objc_msgSend(v3, "setDuration:", 1.39999998);
  objc_msgSend(v3, "setVelocity:", 0.0);
  objc_msgSend(v3, "setFillMode:", *MEMORY[0x1E0CD2B50]);
  objc_msgSend(v3, "setDelegate:", self);
  LODWORD(v4) = 30.0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFromValue:", v5);

  LODWORD(v6) = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setToValue:", v7);

  objc_msgSend(MEMORY[0x1E0CD28D8], "functionWithName:", *MEMORY[0x1E0CD31F0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValueFunction:", v8);

  LODWORD(v9) = 1028389654;
  LODWORD(v10) = 990057071;
  LODWORD(v11) = 1059712716;
  LODWORD(v12) = 1.0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTimingFunction:", v13);

  objc_msgSend(v3, "setKeyPath:", CFSTR("transform"));
  objc_msgSend(v14, "addAnimation:forKey:", v3, CFSTR("shake"));

}

- (void)clearSecondFactorEntry
{
  NSObject *v3;
  uint8_t v4[16];

  _AKLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1BD795000, v3, OS_LOG_TYPE_DEFAULT, "Clearing Second Factor Entry Field", v4, 2u);
  }

  -[AKCodeEntryView setStringValue:](self->_codeGeneratorView, "setStringValue:", &stru_1E7679C68);
}

- (void)setPasscodeFieldDisabled:(BOOL)a3
{
  _BOOL4 v3;
  AKCodeEntryView *codeGeneratorView;

  v3 = a3;
  -[AKCodeEntryView setPasscodeFieldDisabled:](self->_codeGeneratorView, "setPasscodeFieldDisabled:");
  codeGeneratorView = self->_codeGeneratorView;
  if (v3)
    -[AKCodeEntryView resignFirstResponder](codeGeneratorView, "resignFirstResponder");
  else
    -[AKCodeEntryView becomeFirstResponder](codeGeneratorView, "becomeFirstResponder");
}

- (BOOL)piggybackingForTrustedDevice
{
  return self->_piggybackingForTrustedDevice;
}

- (void)setPiggybackingForTrustedDevice:(BOOL)a3
{
  self->_piggybackingForTrustedDevice = a3;
}

- (AKCodeEntryView)codeGeneratorView
{
  return self->_codeGeneratorView;
}

- (void)setCodeGeneratorView:(id)a3
{
  objc_storeStrong((id *)&self->_codeGeneratorView, a3);
}

- (AKAppleIDAuthenticationContext)authenticationContext
{
  return self->_authenticationContext;
}

- (void)setAuthenticationContext:(id)a3
{
  objc_storeStrong((id *)&self->_authenticationContext, a3);
}

- (AKBasicLoginContentViewController)titleHeaderViewController
{
  return self->_titleHeaderViewController;
}

- (void)setTitleHeaderViewController:(id)a3
{
  objc_storeStrong((id *)&self->_titleHeaderViewController, a3);
}

- (NSArray)activeConstraints
{
  return self->_activeConstraints;
}

- (void)setActiveConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_activeConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeConstraints, 0);
  objc_storeStrong((id *)&self->_titleHeaderViewController, 0);
  objc_storeStrong((id *)&self->_authenticationContext, 0);
  objc_storeStrong((id *)&self->_codeGeneratorView, 0);
}

@end

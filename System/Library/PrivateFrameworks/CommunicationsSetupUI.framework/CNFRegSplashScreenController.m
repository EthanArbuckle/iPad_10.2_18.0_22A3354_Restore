@implementation CNFRegSplashScreenController

- (CNFRegSplashScreenController)init
{
  CNFRegSplashScreenController *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNFRegSplashScreenController;
  v2 = -[CNFRegSplashScreenController init](&v7, sel_init);
  if (v2)
  {
    CommunicationsSetupUIBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    CNFRegStringTableName();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("FACETIME"), &stru_24D077260, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFRegSplashScreenController setTitle:](v2, "setTitle:", v5);

  }
  return v2;
}

- (CNFRegSplashScreenController)initWithRegController:(id)a3 account:(id)a4
{
  id v5;
  CNFRegSplashScreenController *v6;
  CNFRegSplashScreenController *v7;

  v5 = a3;
  v6 = -[CNFRegSplashScreenController init](self, "init");
  v7 = v6;
  if (v6)
    -[CNFRegSplashScreenController setRegController:](v6, "setRegController:", v5);

  return v7;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  return CNFRegShouldRotateToOrientation(a3);
}

- (void)dealloc
{
  objc_super v2;

  self->_delegate = 0;
  v2.receiver = self;
  v2.super_class = (Class)CNFRegSplashScreenController;
  -[CNFRegSplashScreenController dealloc](&v2, sel_dealloc);
}

- (void)loadView
{
  id v3;
  void *v4;
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  void *v14;
  double v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  int v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  const __CFString *v25;
  __CFString *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGFloat v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  UIButton *v41;
  UIButton *learnMoreButton;
  double v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  double v48;
  double v49;
  double v50;
  CGFloat MidX;
  double v52;
  double v53;
  CGFloat v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  CGFloat rect;
  id v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;

  v3 = objc_alloc(MEMORY[0x24BEBDB00]);
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v69 = (id)objc_msgSend(v3, "initWithFrame:");

  objc_msgSend(v69, "setAutoresizesSubviews:", 0);
  objc_msgSend(v69, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = v5;
  if (v5 >= 580.0)
    v13 = 131.0;
  else
    v13 = v5 / 580.0 * 131.0;
  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "setBackgroundColor:", v14);

  v70.origin.x = v7;
  v70.origin.y = v9;
  v70.size.width = v11;
  v70.size.height = v12;
  v15 = CGRectGetWidth(v70) + -70.0;
  v16 = objc_alloc(MEMORY[0x24BEBD708]);
  v17 = (void *)objc_msgSend(v16, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(MEMORY[0x24BEBB520], "fontWithName:size:", CFSTR("Helvetica Neue Light"), 18.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFont:", v18);

  objc_msgSend(MEMORY[0x24BE30338], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "supportsWLAN");
  v21 = _os_feature_enabled_impl();
  CNFRegStringTableName();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  CommunicationsSetupUIBundle();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = CFSTR("FACETIME_SPLASH_SYNOPSIS_WLAN");
  if (v21)
    v24 = CFSTR("FACETIME_SPLASH_SYNOPSIS_WLAN_APPLEACCOUNT");
  v25 = CFSTR("FACETIME_SPLASH_SYNOPSIS_WIFI_APPLEACCOUNT");
  if (!v21)
    v25 = CFSTR("FACETIME_SPLASH_SYNOPSIS_WIFI");
  if (v20)
    v26 = (__CFString *)v24;
  else
    v26 = (__CFString *)v25;
  CNFLocalizedStringFromTableInBundleWithFallback(v26, v22, v23);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setText:", v27);

  objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTextColor:", v28);

  objc_msgSend(v17, "setTextAlignment:", 1);
  objc_msgSend(v17, "setLineBreakMode:", 0);
  objc_msgSend(v17, "setNumberOfLines:", 0);
  objc_msgSend(v17, "sizeToFit");
  objc_msgSend(v17, "sizeThatFits:", v15, 1.79769313e308);
  v30 = v29;
  v32 = v31;
  v71.origin.x = v7;
  v71.origin.y = v9;
  v71.size.width = v11;
  v71.size.height = v12;
  v33 = floor(CGRectGetMidX(v71) + v30 * -0.5);
  objc_msgSend(v17, "setFrame:", v33, v13, v30, v32);
  objc_msgSend(v69, "addSubview:", v17);
  v72.origin.x = v33;
  v72.origin.y = v13;
  v72.size.width = v30;
  v72.size.height = v32;
  v34 = v12;
  v35 = CGRectGetMaxY(v72) + 20.5;
  rect = v11;
  if (self->_learnMoreButton)
  {
    v36 = v9;
  }
  else
  {
    CommunicationsSetupUIBundle();
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    CNFRegStringTableName();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("FACETIME_SPLASH_LEARN_MORE"), &stru_24D077260, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFRegSplashScreenController userInteractionColor](self, "userInteractionColor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNFRegLearnMoreButton roundedButtonWithText:color:](CNFRegLearnMoreButton, "roundedButtonWithText:color:", v39, v40);
    v41 = (UIButton *)objc_claimAutoreleasedReturnValue();
    learnMoreButton = self->_learnMoreButton;
    self->_learnMoreButton = v41;

    -[UIButton setAutoresizingMask:](self->_learnMoreButton, "setAutoresizingMask:", 5);
    -[UIButton addTarget:action:forControlEvents:](self->_learnMoreButton, "addTarget:action:forControlEvents:", self, sel__learnMorePressed_, 64);
    -[UIButton sizeToFit](self->_learnMoreButton, "sizeToFit");
    -[UIButton bounds](self->_learnMoreButton, "bounds");
    v45 = v44;
    v67 = v35;
    v47 = v46;
    v49 = v48;
    if (v43 <= v11)
      v50 = v43;
    else
      v50 = v11;
    v73.origin.x = v7;
    v73.origin.y = v9;
    v73.size.width = v11;
    v73.size.height = v34;
    MidX = CGRectGetMidX(v73);
    v52 = v9;
    v53 = MidX;
    v74.origin.x = v45;
    v74.origin.y = v47;
    v36 = v52;
    v74.size.width = v50;
    v74.size.height = v49;
    v54 = floor(v53 + CGRectGetWidth(v74) * -0.5);
    -[UIButton setFrame:](self->_learnMoreButton, "setFrame:", v54, v67, v50, v49);
    objc_msgSend(v69, "addSubview:", self->_learnMoreButton);
    v75.origin.x = v54;
    v75.origin.y = v67;
    v75.size.width = v50;
    v75.size.height = v49;
    v35 = CGRectGetMaxY(v75) + 58.0;
  }
  objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 1);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  CommunicationsSetupUIBundle();
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegStringTableName();
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "localizedStringForKey:value:table:", CFSTR("FACETIME_SPLASH_GET_STARTED"), &stru_24D077260, v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setTitle:forState:", v58, 0);

  -[CNFRegSplashScreenController userInteractionColor](self, "userInteractionColor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setTitleColor:forState:", v59, 0);

  objc_msgSend(v55, "titleLabel");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBB520], "fontWithName:size:", CFSTR("Helvetica Neue Medium"), 18.0);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setFont:", v61);

  objc_msgSend(v55, "setContentEdgeInsets:", 0.0, 6.0, 0.0, 6.0);
  objc_msgSend(v55, "setTitleEdgeInsets:", 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v55, "sizeToFit");
  objc_msgSend(v55, "frame");
  v63 = v62;
  v65 = v64;
  v76.origin.x = v7;
  v76.origin.y = v36;
  v76.size.width = rect;
  v76.size.height = v34;
  v66 = CGRectGetMidX(v76);
  objc_msgSend(v55, "frame");
  objc_msgSend(v55, "setFrame:", v66 + CGRectGetWidth(v77) * -0.5, v35 - v65, v63, v65);
  objc_msgSend(v55, "addTarget:action:forControlEvents:", self, sel__getStartedPressed_, 64);
  objc_msgSend(v69, "addSubview:", v55);
  -[CNFRegSplashScreenController setView:](self, "setView:", v69);

}

- (void)willBecomeActive
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNFRegSplashScreenController;
  -[CNFRegSplashScreenController willBecomeActive](&v3, sel_willBecomeActive);
  -[UIButton setSelected:](self->_learnMoreButton, "setSelected:", 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[UIButton setSelected:](self->_learnMoreButton, "setSelected:", 0);
  v5.receiver = self;
  v5.super_class = (Class)CNFRegSplashScreenController;
  -[CNFRegSplashScreenController viewWillAppear:](&v5, sel_viewWillAppear_, v3);
}

- (id)userInteractionColor
{
  return (id)objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.145098039, 0.439215686, 0.843137255, 1.0);
}

- (void)_learnMorePressed:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)*MEMORY[0x24BEBDF78];
  CNFRegLocalizedSplashScreenURL();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openURL:withCompletionHandler:", v4, 0);

}

- (void)_getStartedPressed:(id)a3
{
  CNFRegSignInController *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CNFRegSignInController *v10;

  v4 = [CNFRegSignInController alloc];
  -[CNFRegSplashScreenController regController](self, "regController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CNFRegFirstRunController initWithRegController:](v4, "initWithRegController:", v5);

  -[CNFRegSignInController setHideLearnMoreButton:](v10, "setHideLearnMoreButton:", 1);
  -[CNFRegSplashScreenController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFRegFirstRunController setDelegate:](v10, "setDelegate:", v6);

  -[CNFRegSplashScreenController rootController](self, "rootController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFRegSignInController setRootController:](v10, "setRootController:", v7);

  -[CNFRegSplashScreenController parentController](self, "parentController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFRegSignInController setParentController:](v10, "setParentController:", v8);

  -[CNFRegSplashScreenController rootController](self, "rootController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "showController:", v10);

}

- (int64_t)currentAppearanceStyle
{
  return 2;
}

- (void)setCustomLeftButton:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNFRegSplashScreenController navigationItem](self, "navigationItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLeftBarButtonItem:", v4);

}

- (UIBarButtonItem)customLeftButton
{
  void *v2;
  void *v3;

  -[CNFRegSplashScreenController navigationItem](self, "navigationItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "leftBarButtonItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIBarButtonItem *)v3;
}

- (void)setCustomRightButton:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNFRegSplashScreenController navigationItem](self, "navigationItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRightBarButtonItem:", v4);

}

- (UIBarButtonItem)customRightButton
{
  void *v2;
  void *v3;

  -[CNFRegSplashScreenController navigationItem](self, "navigationItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rightBarButtonItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIBarButtonItem *)v3;
}

- (CNFRegFirstRunDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CNFRegFirstRunDelegate *)a3;
}

- (CNFRegController)regController
{
  return self->_regController;
}

- (void)setRegController:(id)a3
{
  objc_storeStrong((id *)&self->_regController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regController, 0);
  objc_storeStrong((id *)&self->_learnMoreButton, 0);
}

@end

@implementation DMCEnrollmentAboutRemoteManagementViewController

+ (void)presentAboutRemoteManagementViewControllerWithBaseViewController:(id)a3
{
  DMCEnrollmentAboutRemoteManagementViewController *v3;
  void *v4;
  void *v5;
  DMCEnrollmentAboutRemoteManagementViewController *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v3 = [DMCEnrollmentAboutRemoteManagementViewController alloc];
  DMCLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("gear"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[DMCEnrollmentAboutRemoteManagementViewController initWithTitle:detailText:icon:](v3, "initWithTitle:detailText:icon:", v4, 0, v5);

  DMCLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCEnrollmentAboutRemoteManagementViewController setDetailText:](v6, "setDetailText:", v7);

  -[OBPrivacySplashController setSuppressPerPageAnalyticsLogging:](v6, "setSuppressPerPageAnalyticsLogging:", 1);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BF8]), "initWithRootViewController:", v6);
  if (objc_msgSend(MEMORY[0x24BE2A818], "isPad"))
    objc_msgSend(v8, "setModalPresentationStyle:", 2);
  objc_msgSend(v9, "presentViewController:animated:completion:", v8, 1, 0);

}

- (void)loadView
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
  void *v12;
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
  id v23;
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
  _QWORD v37[4];
  id v38;
  id location;
  objc_super v40;
  uint64_t v41;
  _QWORD v42[6];

  v42[4] = *MEMORY[0x24BDAC8D0];
  v40.receiver = self;
  v40.super_class = (Class)DMCEnrollmentAboutRemoteManagementViewController;
  -[OBPrivacySplashController loadView](&v40, sel_loadView);
  v3 = (void *)objc_opt_new();
  -[DMCEnrollmentAboutRemoteManagementViewController setTextLabel:](self, "setTextLabel:", v3);

  -[DMCEnrollmentAboutRemoteManagementViewController textLabel](self, "textLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNumberOfLines:", 0);

  -[DMCEnrollmentAboutRemoteManagementViewController attributedDetailText](self, "attributedDetailText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[DMCEnrollmentAboutRemoteManagementViewController attributedDetailText](self, "attributedDetailText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCEnrollmentAboutRemoteManagementViewController textLabel](self, "textLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAttributedText:", v6);
  }
  else
  {
    -[DMCEnrollmentAboutRemoteManagementViewController detailText](self, "detailText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCEnrollmentAboutRemoteManagementViewController textLabel](self, "textLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", v6);
  }

  -[DMCEnrollmentAboutRemoteManagementViewController textLabel](self, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  +[DMCEnrollmentAboutRemoteManagementViewController _textFontIsBold:](DMCEnrollmentAboutRemoteManagementViewController, "_textFontIsBold:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCEnrollmentAboutRemoteManagementViewController textLabel](self, "textLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFont:", v9);

  -[DMCEnrollmentAboutRemoteManagementViewController contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCEnrollmentAboutRemoteManagementViewController textLabel](self, "textLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v12);

  v24 = (void *)MEMORY[0x24BDD1628];
  -[DMCEnrollmentAboutRemoteManagementViewController contentView](self, "contentView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "topAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCEnrollmentAboutRemoteManagementViewController textLabel](self, "textLabel");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "topAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:", v33);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v32;
  -[DMCEnrollmentAboutRemoteManagementViewController contentView](self, "contentView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "leadingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCEnrollmentAboutRemoteManagementViewController textLabel](self, "textLabel");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "leadingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:", v28);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = v27;
  -[DMCEnrollmentAboutRemoteManagementViewController contentView](self, "contentView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "trailingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCEnrollmentAboutRemoteManagementViewController textLabel](self, "textLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v42[2] = v15;
  -[DMCEnrollmentAboutRemoteManagementViewController contentView](self, "contentView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bottomAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCEnrollmentAboutRemoteManagementViewController textLabel](self, "textLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bottomAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v42[3] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v42, 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "activateConstraints:", v21);

  objc_initWeak(&location, self);
  v41 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v41, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = MEMORY[0x24BDAC760];
  v37[1] = 3221225472;
  v37[2] = __60__DMCEnrollmentAboutRemoteManagementViewController_loadView__block_invoke;
  v37[3] = &unk_24D52E2D0;
  objc_copyWeak(&v38, &location);
  v23 = (id)-[DMCEnrollmentAboutRemoteManagementViewController registerForTraitChanges:withHandler:](self, "registerForTraitChanges:withHandler:", v22, v37);

  objc_destroyWeak(&v38);
  objc_destroyWeak(&location);
}

void __60__DMCEnrollmentAboutRemoteManagementViewController_loadView__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  +[DMCEnrollmentAboutRemoteManagementViewController _textFontIsBold:](DMCEnrollmentAboutRemoteManagementViewController, "_textFontIsBold:", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "textLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFont:", v1);

}

- (void)viewWillAppear:(BOOL)a3
{
  DMCEnrollmentUIBarButtonItem *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DMCEnrollmentAboutRemoteManagementViewController;
  -[OBPrivacySplashController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  v4 = -[DMCEnrollmentUIBarButtonItem initWithType:target:action:]([DMCEnrollmentUIBarButtonItem alloc], "initWithType:target:action:", 4, self, sel_rightBarButtonTapped_);
  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRightBarButtonItem:", v4);

}

- (void)rightBarButtonTapped:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__DMCEnrollmentAboutRemoteManagementViewController_rightBarButtonTapped___block_invoke;
  block[3] = &unk_24D52E500;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __73__DMCEnrollmentAboutRemoteManagementViewController_rightBarButtonTapped___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)setDetailText:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if (!-[NSString isEqualToString:](self->_detailText, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_detailText, a3);
    -[DMCEnrollmentAboutRemoteManagementViewController textLabel](self, "textLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setText:", v6);

  }
}

- (void)setAttributedDetailText:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if (!-[NSAttributedString isEqualToAttributedString:](self->_attributedDetailText, "isEqualToAttributedString:"))
  {
    objc_storeStrong((id *)&self->_attributedDetailText, a3);
    -[DMCEnrollmentAboutRemoteManagementViewController textLabel](self, "textLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAttributedText:", v6);

  }
}

+ (id)_textFontIsBold:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x24BDF77B0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = (void *)MEMORY[0x24BEBB520];
  if (v3)
    v7 = 2;
  else
    v7 = 0;
  objc_msgSend(v4, "fontDescriptorWithSymbolicTraits:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fontWithDescriptor:size:", v8, 0.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)detailText
{
  return self->_detailText;
}

- (NSAttributedString)attributedDetailText
{
  return self->_attributedDetailText;
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (void)setTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_textLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_attributedDetailText, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
}

@end

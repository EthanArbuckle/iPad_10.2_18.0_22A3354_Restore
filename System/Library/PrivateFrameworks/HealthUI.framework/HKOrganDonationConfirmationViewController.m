@implementation HKOrganDonationConfirmationViewController

- (HKOrganDonationConfirmationViewController)initWithRegistrant:(id)a3 medicalIDData:(id)a4 connectionManager:(id)a5
{
  id v7;
  id v8;
  HKOrganDonationConfirmationViewController *v9;
  HKOrganDonationConfirmationViewController *v10;
  uint64_t v11;
  HKOrganDonationRegistrant *registrant;
  objc_super v14;

  v7 = a3;
  v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HKOrganDonationConfirmationViewController;
  v9 = -[HKOrganDonationConfirmationViewController initWithNibName:bundle:](&v14, sel_initWithNibName_bundle_, 0, 0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connectionManager, a5);
    v11 = objc_msgSend(v7, "copy");
    registrant = v10->_registrant;
    v10->_registrant = (HKOrganDonationRegistrant *)v11;

  }
  return v10;
}

- (void)viewDidLoad
{
  UIFont *v3;
  UIFont *bodyFont;
  UIActivityIndicatorView *v5;
  UIActivityIndicatorView *loadingIndicator;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  UIVisualEffectView *v17;
  UIVisualEffectView *footerView;
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
  NSArray *v32;
  NSArray *dataEntryItems;
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)HKOrganDonationConfirmationViewController;
  -[HKOrganDonationConfirmationViewController viewDidLoad](&v34, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v3 = (UIFont *)objc_claimAutoreleasedReturnValue();
  bodyFont = self->_bodyFont;
  self->_bodyFont = v3;

  v5 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
  loadingIndicator = self->_loadingIndicator;
  self->_loadingIndicator = v5;

  -[UIActivityIndicatorView setHidesWhenStopped:](self->_loadingIndicator, "setHidesWhenStopped:", 1);
  -[HKOrganDonationConfirmationViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", self->_loadingIndicator);
  objc_msgSend(v7, "setRightBarButtonItem:", v8);

  v9 = objc_alloc(MEMORY[0x1E0DC3D48]);
  -[HKOrganDonationConfirmationViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v11 = (void *)objc_msgSend(v9, "initWithFrame:style:", 0);

  objc_msgSend(v11, "setAutoresizingMask:", 18);
  objc_msgSend(v11, "setDataSource:", self);
  objc_msgSend(v11, "setDelegate:", self);
  -[HKOrganDonationConfirmationViewController setTableView:](self, "setTableView:", v11);
  -[HKOrganDonationConfirmationViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", v11);

  -[HKOrganDonationConfirmationViewController tableView](self, "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBackgroundColor:", v14);

  -[HKOrganDonationConfirmationViewController tableView](self, "tableView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationConfirmationViewController _createTableHeaderView](self, "_createTableHeaderView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTableHeaderView:", v16);

  -[HKOrganDonationConfirmationViewController _createTableFooterView](self, "_createTableFooterView");
  v17 = (UIVisualEffectView *)objc_claimAutoreleasedReturnValue();
  footerView = self->_footerView;
  self->_footerView = v17;

  -[HKOrganDonationConfirmationViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addSubview:", self->_footerView);

  -[UIVisualEffectView leadingAnchor](self->_footerView, "leadingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationConfirmationViewController view](self, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "leadingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setActive:", 1);

  -[UIVisualEffectView trailingAnchor](self->_footerView, "trailingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationConfirmationViewController view](self, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "trailingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setActive:", 1);

  -[UIVisualEffectView bottomAnchor](self->_footerView, "bottomAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationConfirmationViewController view](self, "view");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "bottomAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setActive:", 1);

  -[HKOrganDonationRegistrant dataEntryItemsValidOnly:](self->_registrant, "dataEntryItemsValidOnly:", 1);
  v32 = (NSArray *)objc_claimAutoreleasedReturnValue();
  dataEntryItems = self->_dataEntryItems;
  self->_dataEntryItems = v32;

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double Height;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  objc_super v16;
  CGRect v17;

  v16.receiver = self;
  v16.super_class = (Class)HKOrganDonationConfirmationViewController;
  -[HKOrganDonationConfirmationViewController viewDidLayoutSubviews](&v16, sel_viewDidLayoutSubviews);
  -[HKOrganDonationConfirmationViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentInset");
  v5 = v4;
  v7 = v6;
  v9 = v8;

  -[UIVisualEffectView frame](self->_footerView, "frame");
  Height = CGRectGetHeight(v17);
  -[HKOrganDonationConfirmationViewController tableView](self, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "safeAreaInsets");
  v13 = Height - v12;

  -[HKOrganDonationConfirmationViewController tableView](self, "tableView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setContentInset:", v5, v7, v13, v9);

  -[HKOrganDonationConfirmationViewController tableView](self, "tableView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setScrollIndicatorInsets:", v5, v7, v13, v9);

}

- (id)_createTableHeaderView
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double Width;
  HKTitledBuddyHeaderView *v9;
  void *v10;
  void *v11;
  HKTitledBuddyHeaderView *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  CGRect v21;
  CGRect v22;

  -[HKOrganDonationConfirmationViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  CGRectGetHeight(v21);
  -[HKOrganDonationConfirmationViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  UIRoundToViewScale();
  v6 = v5;

  -[HKOrganDonationConfirmationViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  Width = CGRectGetWidth(v22);

  v9 = [HKTitledBuddyHeaderView alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("OD_MORE_ABOUT_PRIVACY_BUTTON"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HKTitledBuddyHeaderView initWithTopInset:linkButtonTitle:](v9, "initWithTopInset:linkButtonTitle:", v11, v6);

  -[HKTitledBuddyHeaderView setDelegate:](v12, "setDelegate:", self);
  -[HKTitledBuddyHeaderView widthAnchor](v12, "widthAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToConstant:", Width);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setActive:", 1);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("OD_YOUR_GIFT_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKTitledBuddyHeaderView setTitleText:](v12, "setTitleText:", v16);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("OD_YOUR_GIFT_BODY"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKTitledBuddyHeaderView setBodyText:](v12, "setBodyText:", v18);

  -[HKTitledBuddyHeaderView layoutIfNeeded](v12, "layoutIfNeeded");
  objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKTitledBuddyHeaderView setBackgroundColor:](v12, "setBackgroundColor:", v19);

  return v12;
}

- (id)_createTableFooterView
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

  v3 = (void *)MEMORY[0x1E0DC3518];
  HKHealthKeyColor();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("OD_COMPLETE_REGISTRATION"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hk_multiLineRoundRectButtonTintedWithColor:title:target:action:", v4, v6, self, sel_submitButtonTapped_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", v8);
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v9, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", v7);

  objc_msgSend(v7, "topAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "topAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12, 32.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setActive:", 1);

  objc_msgSend(v7, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15, -24.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setActive:", 1);

  objc_msgSend(v7, "centerXAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "centerXAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setActive:", 1);

  return v9;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSArray count](self->_dataEntryItems, "count", a3, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v5 = a4;
  -[HKOrganDonationConfirmationViewController dataEntryItems](self, "dataEntryItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "row");

  objc_msgSend(v6, "objectAtIndex:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "cell");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEditDisabled:", 1);

  return v9;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  UIFont *bodyFont;
  _BOOL4 IsUsingAccessibilityContentSizeCategory;
  double v6;
  double result;

  bodyFont = self->_bodyFont;
  IsUsingAccessibilityContentSizeCategory = HKUIApplicationIsUsingAccessibilityContentSizeCategory();
  v6 = 44.0;
  if (IsUsingAccessibilityContentSizeCategory)
    v6 = 60.0;
  -[UIFont _scaledValueForValue:](bodyFont, "_scaledValueForValue:", v6);
  return result;
}

- (void)submitButtonTapped:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id location;

  v4 = a3;
  objc_msgSend(v4, "setEnabled:", 0);
  -[HKOrganDonationConfirmationViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidesBackButton:animated:", 1, 1);

  objc_initWeak(&location, self);
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __64__HKOrganDonationConfirmationViewController_submitButtonTapped___block_invoke;
  v12[3] = &unk_1E9C42438;
  v12[4] = self;
  objc_copyWeak(&v14, &location);
  v7 = v4;
  v13 = v7;
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __64__HKOrganDonationConfirmationViewController_submitButtonTapped___block_invoke_4;
  v9[3] = &unk_1E9C412F0;
  objc_copyWeak(&v11, &location);
  v8 = v7;
  v10 = v8;
  -[HKOrganDonationConfirmationViewController confirmSubmissionIfNecessaryWithConfirmHandler:andCancelHandler:](self, "confirmSubmissionIfNecessaryWithConfirmHandler:andCancelHandler:", v12, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __64__HKOrganDonationConfirmationViewController_submitButtonTapped___block_invoke(id *a1)
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  _QWORD aBlock[4];
  id v7;
  id v8;
  id v9;

  objc_msgSend(a1[4], "loadingIndicator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startAnimating");

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__HKOrganDonationConfirmationViewController_submitButtonTapped___block_invoke_2;
  aBlock[3] = &unk_1E9C450F0;
  objc_copyWeak(&v9, a1 + 6);
  v3 = a1[5];
  v4 = a1[4];
  v7 = v3;
  v8 = v4;
  v5 = _Block_copy(aBlock);
  objc_msgSend(*((id *)a1[4] + 121), "submitRegistrant:completion:", *((_QWORD *)a1[4] + 122), v5);

  objc_destroyWeak(&v9);
}

void __64__HKOrganDonationConfirmationViewController_submitButtonTapped___block_invoke_2(id *a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained;
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
  HKOrganDonationThankYouViewController *v18;
  void *v19;
  HKOrganDonationThankYouViewController *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    objc_msgSend(a1[4], "setEnabled:", 1);
    objc_msgSend(WeakRetained, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidesBackButton:animated:", 0, 1);

    objc_msgSend(WeakRetained, "loadingIndicator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stopAnimating");

    if (a3)
    {
      v8 = (void *)MEMORY[0x1E0DC3450];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("OD_SIGNUP_FAILURE_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("OD_SIGNUP_FAILURE_BODY"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "alertControllerWithTitle:message:preferredStyle:", v10, v12, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = (void *)MEMORY[0x1E0DC3448];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("OD_ALERT_OK"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __64__HKOrganDonationConfirmationViewController_submitButtonTapped___block_invoke_3;
      v24[3] = &unk_1E9C40288;
      v24[4] = WeakRetained;
      objc_msgSend(v14, "actionWithTitle:style:handler:", v16, 0, v24);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addAction:", v17);

      objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v13, 1, 0);
    }
    else
    {
      v18 = [HKOrganDonationThankYouViewController alloc];
      objc_msgSend(a1[5], "medicalIDData");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[HKOrganDonationBaseViewController initWithMedicalIDData:](v18, "initWithMedicalIDData:", v19);

      objc_msgSend(a1[5], "registrationCompletionHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKOrganDonationBaseViewController setRegistrationCompletionHandler:](v20, "setRegistrationCompletionHandler:", v21);

      objc_msgSend(a1[5], "completionButtonTitle");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKOrganDonationBaseViewController setCompletionButtonTitle:](v20, "setCompletionButtonTitle:", v22);

      objc_msgSend(WeakRetained, "navigationController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "pushViewController:animated:", v20, 1);

    }
  }

}

void __64__HKOrganDonationConfirmationViewController_submitButtonTapped___block_invoke_3(uint64_t a1)
{
  id v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v2, "popViewControllerAnimated:", 1);

}

void __64__HKOrganDonationConfirmationViewController_submitButtonTapped___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "navigationItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setHidesBackButton:animated:", 0, 1);

    objc_msgSend(*(id *)(a1 + 32), "setEnabled:", 1);
    WeakRetained = v4;
  }

}

- (void)confirmSubmissionIfNecessaryWithConfirmHandler:(id)a3 andCancelHandler:(id)a4
{
  void (**v6)(_QWORD);
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  void (**v18)(_QWORD);
  _QWORD v19[4];
  id v20;

  v6 = (void (**)(_QWORD))a3;
  v7 = a4;
  if (+[HKOrganDonationConnectionManager registrationSubmissionHostConfiguration](HKOrganDonationConnectionManager, "registrationSubmissionHostConfiguration") == 2)
  {
    if (v6)
      v6[2](v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", CFSTR("Attention"), CFSTR("This is a test. Proceeding with this registration will send your information to a staging environment, which will NOT sign you up as an organ donor. To use the production environment instead, please choose the production server from the Health internal setting and relaunch Health."), 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0DC3448];
    v10 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __109__HKOrganDonationConfirmationViewController_confirmSubmissionIfNecessaryWithConfirmHandler_andCancelHandler___block_invoke;
    v19[3] = &unk_1E9C42860;
    v20 = v7;
    objc_msgSend(v9, "actionWithTitle:style:handler:", CFSTR("Cancel"), 1, v19);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addAction:", v11);

    v12 = (void *)MEMORY[0x1E0DC3448];
    v14 = v10;
    v15 = 3221225472;
    v16 = __109__HKOrganDonationConfirmationViewController_confirmSubmissionIfNecessaryWithConfirmHandler_andCancelHandler___block_invoke_2;
    v17 = &unk_1E9C42860;
    v18 = v6;
    objc_msgSend(v12, "actionWithTitle:style:handler:", CFSTR("Submit"), 0, &v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addAction:", v13, v14, v15, v16, v17);

    -[HKOrganDonationConfirmationViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);
  }

}

uint64_t __109__HKOrganDonationConfirmationViewController_confirmSubmissionIfNecessaryWithConfirmHandler_andCancelHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __109__HKOrganDonationConfirmationViewController_confirmSubmissionIfNecessaryWithConfirmHandler_andCancelHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)titledBuddyHeaderViewDidTapLinkButton:(id)a3
{
  HKNavigationController *v4;
  void *v5;
  HKOrganDonationMoreAboutPrivacyViewController *v6;

  v6 = objc_alloc_init(HKOrganDonationMoreAboutPrivacyViewController);
  v4 = -[HKNavigationController initWithRootViewController:]([HKNavigationController alloc], "initWithRootViewController:", v6);
  -[HKOrganDonationConfirmationViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentViewController:animated:completion:", v4, 1, 0);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  UIFont *v9;
  UIFont *bodyFont;
  _QWORD block[5];
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKOrganDonationConfirmationViewController;
  -[HKOrganDonationConfirmationViewController traitCollectionDidChange:](&v12, sel_traitCollectionDidChange_, v4);
  if (v4)
  {
    -[HKOrganDonationConfirmationViewController traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredContentSizeCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if ((v8 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
      v9 = (UIFont *)objc_claimAutoreleasedReturnValue();
      bodyFont = self->_bodyFont;
      self->_bodyFont = v9;

      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __70__HKOrganDonationConfirmationViewController_traitCollectionDidChange___block_invoke;
      block[3] = &unk_1E9C3F0D0;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
  }

}

void __70__HKOrganDonationConfirmationViewController_traitCollectionDidChange___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reloadData");

}

- (NSString)completionButtonTitle
{
  return self->_completionButtonTitle;
}

- (void)setCompletionButtonTitle:(id)a3
{
  objc_storeStrong((id *)&self->_completionButtonTitle, a3);
}

- (id)registrationCompletionHandler
{
  return self->_registrationCompletionHandler;
}

- (void)setRegistrationCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1016);
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (UIActivityIndicatorView)loadingIndicator
{
  return self->_loadingIndicator;
}

- (void)setLoadingIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_loadingIndicator, a3);
}

- (_HKMedicalIDData)medicalIDData
{
  return self->_medicalIDData;
}

- (void)setMedicalIDData:(id)a3
{
  objc_storeStrong((id *)&self->_medicalIDData, a3);
}

- (NSArray)dataEntryItems
{
  return self->_dataEntryItems;
}

- (void)setDataEntryItems:(id)a3
{
  objc_storeStrong((id *)&self->_dataEntryItems, a3);
}

- (UIButton)submitButton
{
  return self->_submitButton;
}

- (void)setSubmitButton:(id)a3
{
  objc_storeStrong((id *)&self->_submitButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_submitButton, 0);
  objc_storeStrong((id *)&self->_dataEntryItems, 0);
  objc_storeStrong((id *)&self->_medicalIDData, 0);
  objc_storeStrong((id *)&self->_loadingIndicator, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong(&self->_registrationCompletionHandler, 0);
  objc_storeStrong((id *)&self->_completionButtonTitle, 0);
  objc_storeStrong((id *)&self->_bodyFont, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_registrant, 0);
  objc_storeStrong((id *)&self->_connectionManager, 0);
}

@end

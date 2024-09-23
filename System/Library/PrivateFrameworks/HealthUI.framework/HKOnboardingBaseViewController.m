@implementation HKOnboardingBaseViewController

- (id)initForOnboarding:(BOOL)a3
{
  return -[HKOnboardingBaseViewController initForOnboarding:upgradingFromAlgorithmVersion:](self, "initForOnboarding:upgradingFromAlgorithmVersion:", a3, *MEMORY[0x1E0CB70B0]);
}

- (id)initForOnboarding:(BOOL)a3 upgradingFromAlgorithmVersion:(int64_t)a4
{
  id result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HKOnboardingBaseViewController;
  result = -[HKOnboardingBaseViewController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, 0, 0);
  if (result)
  {
    *((_BYTE *)result + 968) = a3;
    *((_QWORD *)result + 122) = a4;
  }
  return result;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKOnboardingBaseViewController;
  -[HKOnboardingBaseViewController viewDidLoad](&v5, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOnboardingBaseViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[HKOnboardingBaseViewController setUpUI](self, "setUpUI");
  -[HKOnboardingBaseViewController setUpConstraints](self, "setUpConstraints");
  if (-[HKOnboardingBaseViewController isOnboarding](self, "isOnboarding"))
    -[HKOnboardingBaseViewController _setUpNavigationBar](self, "_setUpNavigationBar");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKOnboardingBaseViewController;
  -[HKOnboardingBaseViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[HKOnboardingBaseViewController scrollView](self, "scrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "flashScrollIndicators");

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HKOnboardingBaseViewController;
  -[HKOnboardingBaseViewController viewDidLayoutSubviews](&v4, sel_viewDidLayoutSubviews);
  -[HKOnboardingBaseViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOnboardingBaseViewController updateUserInterfaceForStyle:](self, "updateUserInterfaceForStyle:", objc_msgSend(v3, "userInterfaceStyle"));

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HKOnboardingBaseViewController;
  v4 = a3;
  -[HKOnboardingBaseViewController traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  -[HKOnboardingBaseViewController traitCollection](self, "traitCollection", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceStyle");

  v7 = objc_msgSend(v4, "userInterfaceStyle");
  if (v6 != v7)
    -[HKOnboardingBaseViewController updateUserInterfaceForStyle:](self, "updateUserInterfaceForStyle:", v6);
}

- (void)setUpUI
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v3 = objc_alloc_init(MEMORY[0x1E0DC3C28]);
  -[HKOnboardingBaseViewController setScrollView:](self, "setScrollView:", v3);

  -[HKOnboardingBaseViewController scrollView](self, "scrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlwaysBounceVertical:", 1);

  -[HKOnboardingBaseViewController scrollView](self, "scrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HKOnboardingBaseViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOnboardingBaseViewController scrollView](self, "scrollView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v7);

  v8 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  -[HKOnboardingBaseViewController setContentView:](self, "setContentView:", v8);

  -[HKOnboardingBaseViewController contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HKOnboardingBaseViewController scrollView](self, "scrollView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[HKOnboardingBaseViewController contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v10);

}

- (void)setUpConstraints
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
  id v21;

  -[HKOnboardingBaseViewController scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOnboardingBaseViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hk_alignHorizontalConstraintsWithView:margin:", v4, 0.0);

  -[HKOnboardingBaseViewController scrollView](self, "scrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOnboardingBaseViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "topAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setActive:", 1);

  -[HKOnboardingBaseViewController scrollView](self, "scrollView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOnboardingBaseViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOnboardingBaseViewController setScrollViewBottomConstraint:](self, "setScrollViewBottomConstraint:", v14);

  -[HKOnboardingBaseViewController scrollViewBottomConstraint](self, "scrollViewBottomConstraint");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setActive:", 1);

  -[HKOnboardingBaseViewController contentView](self, "contentView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOnboardingBaseViewController scrollView](self, "scrollView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "hk_alignHorizontalConstraintsWithView:margin:", v17, 0.0);

  -[HKOnboardingBaseViewController contentView](self, "contentView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOnboardingBaseViewController scrollView](self, "scrollView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "hk_alignVerticalConstraintsWithView:margin:", v19, 0.0);

  -[HKOnboardingBaseViewController contentView](self, "contentView");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  -[HKOnboardingBaseViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "hk_alignHorizontalConstraintsWithView:margin:", v20, 0.0);

}

- (void)setFooterView:(id)a3 insets:(NSDirectionalEdgeInsets)a4
{
  double trailing;
  double leading;
  id v8;
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

  trailing = a4.trailing;
  leading = a4.leading;
  objc_storeStrong((id *)&self->_footerView, a3);
  v8 = a3;
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[HKOnboardingBaseViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v8);

  objc_msgSend(v8, "leadingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOnboardingBaseViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "leadingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:constant:", v12, leading);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setActive:", 1);

  objc_msgSend(v8, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOnboardingBaseViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "trailingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:constant:", v16, -trailing);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setActive:", 1);

  objc_msgSend(v8, "bottomAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKOnboardingBaseViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setActive:", 1);

  -[HKOnboardingBaseViewController _adjustScrollViewForFooterView](self, "_adjustScrollViewForFooterView");
}

- (void)removeFooterView
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  id v9;

  -[HKOnboardingBaseViewController footerView](self, "footerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  v4 = *MEMORY[0x1E0DC49E8];
  v5 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v6 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v7 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  -[HKOnboardingBaseViewController scrollView](self, "scrollView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setContentInset:", v4, v5, v6, v7);

  -[HKOnboardingBaseViewController scrollView](self, "scrollView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setScrollIndicatorInsets:", v4, v5, v6, v7);

}

- (void)setLeftButtonType:(int64_t)a3
{
  void *v4;
  id v5;

  self->_leftButtonType = a3;
  -[HKOnboardingBaseViewController _buttonForButtonType:](self, "_buttonForButtonType:");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HKOnboardingBaseViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLeftBarButtonItem:", v5);

}

- (void)setRightButtonType:(int64_t)a3
{
  void *v4;
  id v5;

  self->_rightButtonType = a3;
  -[HKOnboardingBaseViewController _buttonForButtonType:](self, "_buttonForButtonType:");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HKOnboardingBaseViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRightBarButtonItem:", v5);

}

- (void)cancelWithConfirmButtonTapped:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  HKOnboardingBaseViewController *v22;
  id v23;

  v4 = a3;
  -[HKOnboardingBaseViewController cancelWithConfirmAlertTitle](self, "cancelWithConfirmAlertTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "length"))
    goto LABEL_6;
  -[HKOnboardingBaseViewController cancelWithConfirmAlertContinueActionTitle](self, "cancelWithConfirmAlertContinueActionTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "length"))
  {

LABEL_6:
    goto LABEL_7;
  }
  -[HKOnboardingBaseViewController cancelWithConfirmAlertAbortActionTitle](self, "cancelWithConfirmAlertAbortActionTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (!v8)
  {
LABEL_7:
    -[HKOnboardingBaseViewController closeButtonTapped:](self, "closeButtonTapped:", v4);
    goto LABEL_8;
  }
  v9 = (void *)MEMORY[0x1E0DC3450];
  -[HKOnboardingBaseViewController cancelWithConfirmAlertTitle](self, "cancelWithConfirmAlertTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "alertControllerWithTitle:message:preferredStyle:", 0, v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0DC3448];
  -[HKOnboardingBaseViewController cancelWithConfirmAlertAbortActionTitle](self, "cancelWithConfirmAlertAbortActionTitle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __64__HKOnboardingBaseViewController_cancelWithConfirmButtonTapped___block_invoke;
  v21 = &unk_1E9C412C8;
  v22 = self;
  v23 = v4;
  objc_msgSend(v12, "actionWithTitle:style:handler:", v13, 0, &v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0DC3448];
  -[HKOnboardingBaseViewController cancelWithConfirmAlertContinueActionTitle](self, "cancelWithConfirmAlertContinueActionTitle", v18, v19, v20, v21, v22);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "actionWithTitle:style:handler:", v16, 1, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "addAction:", v14);
  objc_msgSend(v11, "addAction:", v17);
  -[HKOnboardingBaseViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 1, 0);

LABEL_8:
}

uint64_t __64__HKOnboardingBaseViewController_cancelWithConfirmButtonTapped___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "closeButtonTapped:", *(_QWORD *)(a1 + 40));
}

- (void)closeButtonTapped:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __52__HKOnboardingBaseViewController_closeButtonTapped___block_invoke;
  v3[3] = &unk_1E9C3F0D0;
  v3[4] = self;
  -[HKOnboardingBaseViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v3);
}

void __52__HKOnboardingBaseViewController_closeButtonTapped___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "onboardingCancelled");

  }
}

- (void)presentAlertWithMessage:(id)a3 title:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", a4, a3, 1);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("ONBOARDING_OK"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionWithTitle:style:handler:", v7, 1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:", v8);

  -[HKOnboardingBaseViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);
}

- (void)presentAlertWithMessage:(id)a3
{
  -[HKOnboardingBaseViewController presentAlertWithMessage:title:](self, "presentAlertWithMessage:title:", a3, 0);
}

- (void)presentLearnMoreAlertWithMessage:(id)a3 learnMoreTapped:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;

  v5 = a4;
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, a3, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ONBOARDING_LEARN_MORE_WITH_ELLIPSES"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __83__HKOnboardingBaseViewController_presentLearnMoreAlertWithMessage_learnMoreTapped___block_invoke;
  v17[3] = &unk_1E9C42860;
  v18 = v5;
  v10 = v5;
  objc_msgSend(v7, "actionWithTitle:style:handler:", v9, 0, v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("ONBOARDING_OK"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "actionWithTitle:style:handler:", v14, 0, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addAction:", v11);
  objc_msgSend(v6, "addAction:", v15);
  objc_msgSend(v6, "setPreferredAction:", v15);
  -[HKOnboardingBaseViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);

}

uint64_t __83__HKOnboardingBaseViewController_presentLearnMoreAlertWithMessage_learnMoreTapped___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_buttonForButtonType:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  switch(a3)
  {
    case 1:
      -[HKOnboardingBaseViewController _cancelWithConfirmButton](self, "_cancelWithConfirmButton", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      -[HKOnboardingBaseViewController _cancelButton](self, "_cancelButton", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      -[HKOnboardingBaseViewController _closeButton](self, "_closeButton", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      -[HKOnboardingBaseViewController _skipButton](self, "_skipButton", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

- (id)_cancelWithConfirmButton
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancelWithConfirmButtonTapped_);
  objc_msgSend(MEMORY[0x1E0CB3940], "healthAccessibilityIdentifier:suffix:", 0, CFSTR("Onboarding.cancelWithConfirmButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAccessibilityIdentifier:", v3);

  return v2;
}

- (id)_cancelButton
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0DC34F0]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ONBOARDING_CANCEL"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithTitle:style:target:action:", v5, 0, self, sel_closeButtonTapped_);

  objc_msgSend(MEMORY[0x1E0CB3940], "healthAccessibilityIdentifier:suffix:", 0, CFSTR("Onboarding.cancelButton"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityIdentifier:", v7);

  return v6;
}

- (id)_closeButton
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0DC34F0]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ONBOARDING_CLOSE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithTitle:style:target:action:", v5, 0, self, sel_closeButtonTapped_);

  objc_msgSend(MEMORY[0x1E0CB3940], "healthAccessibilityIdentifier:suffix:", 0, CFSTR("Onboarding.closeButton"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityIdentifier:", v7);

  return v6;
}

- (id)_skipButton
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0DC34F0]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ONBOARDING_SKIP"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithTitle:style:target:action:", v5, 0, self, sel_skipButtonTapped_);

  objc_msgSend(MEMORY[0x1E0CB3940], "healthAccessibilityIdentifier:suffix:", 0, CFSTR("Onboarding.skipButton"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityIdentifier:", v7);

  return v6;
}

- (void)_setUpNavigationBar
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[HKOnboardingBaseViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setHidesShadow:", 1);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[HKOnboardingBaseViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBarTintColor:", v7);

}

- (void)_adjustScrollViewForFooterView
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double Height;
  void *v13;
  double v14;
  double v15;
  void *v16;
  id v17;
  CGRect v18;

  -[HKOnboardingBaseViewController scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentInset");
  v5 = v4;
  v7 = v6;
  v9 = v8;

  -[HKOnboardingBaseViewController footerView](self, "footerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layoutIfNeeded");

  -[HKOnboardingBaseViewController footerView](self, "footerView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "frame");
  Height = CGRectGetHeight(v18);
  -[UIViewController hk_window](self, "hk_window");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "safeAreaInsets");
  v15 = Height - v14;

  -[HKOnboardingBaseViewController scrollView](self, "scrollView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setContentInset:", v5, v7, v15, v9);

  -[HKOnboardingBaseViewController scrollView](self, "scrollView");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setScrollIndicatorInsets:", v5, v7, v15, v9);

}

- (id)_titleFontTextStyle
{
  return (id)*MEMORY[0x1E0DC4AE8];
}

- (id)titleFont
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0DC1350];
  -[HKOnboardingBaseViewController _titleFontTextStyle](self, "_titleFontTextStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_scalableFontForTextStyle:symbolicTraits:", v3, 32770);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (double)_titleTopToFirstBaselineLeading
{
  _BOOL4 v2;
  int v3;
  double result;
  double v5;

  v2 = -[HKOnboardingBaseViewController isOnboarding](self, "isOnboarding");
  v3 = objc_msgSend(MEMORY[0x1E0DC3BF8], "hk_currentDeviceHas5Point8InchScreen");
  result = 36.0;
  if (v3)
    result = 44.0;
  v5 = 40.0;
  if (v3)
    v5 = 48.0;
  if (!v2)
    return v5;
  return result;
}

- (double)titleTopToFirstBaseline
{
  void *v3;
  double v4;
  double v5;

  -[HKOnboardingBaseViewController titleFont](self, "titleFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOnboardingBaseViewController _titleTopToFirstBaselineLeading](self, "_titleTopToFirstBaselineLeading");
  objc_msgSend(v3, "_scaledValueForValue:");
  v5 = v4;

  return v5;
}

- (double)contentTop
{
  int v3;
  double result;
  void *v5;
  double Height;
  void *v7;
  void *v8;
  double v9;
  CGRect v10;
  CGRect v11;

  v3 = -[HKOnboardingBaseViewController isViewLoaded](self, "isViewLoaded");
  result = 0.0;
  if (v3)
  {
    -[HKOnboardingBaseViewController view](self, "view", 0.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "frame");
    Height = CGRectGetHeight(v10);
    -[HKOnboardingBaseViewController navigationController](self, "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "navigationBar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "frame");
    v9 = -(CGRectGetHeight(v11) - Height * 0.09);

    result = 0.0;
    if (v9 >= 0.0)
      return v9;
  }
  return result;
}

- (BOOL)isOnboarding
{
  return self->_onboarding;
}

- (int64_t)upgradingFromAlgorithmVersion
{
  return self->_upgradingFromAlgorithmVersion;
}

- (void)setUpgradingFromAlgorithmVersion:(int64_t)a3
{
  self->_upgradingFromAlgorithmVersion = a3;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollView, a3);
}

- (int64_t)leftButtonType
{
  return self->_leftButtonType;
}

- (int64_t)rightButtonType
{
  return self->_rightButtonType;
}

- (HKOnboardingPageViewControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (NSString)cancelWithConfirmAlertTitle
{
  return self->_cancelWithConfirmAlertTitle;
}

- (void)setCancelWithConfirmAlertTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1024);
}

- (NSString)cancelWithConfirmAlertContinueActionTitle
{
  return self->_cancelWithConfirmAlertContinueActionTitle;
}

- (void)setCancelWithConfirmAlertContinueActionTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1032);
}

- (NSString)cancelWithConfirmAlertAbortActionTitle
{
  return self->_cancelWithConfirmAlertAbortActionTitle;
}

- (void)setCancelWithConfirmAlertAbortActionTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1040);
}

- (UIView)footerView
{
  return self->_footerView;
}

- (void)setFooterView:(id)a3
{
  objc_storeStrong((id *)&self->_footerView, a3);
}

- (NSLayoutConstraint)scrollViewBottomConstraint
{
  return self->_scrollViewBottomConstraint;
}

- (void)setScrollViewBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_scrollViewBottomConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_cancelWithConfirmAlertAbortActionTitle, 0);
  objc_storeStrong((id *)&self->_cancelWithConfirmAlertContinueActionTitle, 0);
  objc_storeStrong((id *)&self->_cancelWithConfirmAlertTitle, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end

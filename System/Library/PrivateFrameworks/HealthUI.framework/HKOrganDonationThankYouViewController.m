@implementation HKOrganDonationThankYouViewController

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HKOrganDonationThankYouViewController;
  -[HKTitledBuddyViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[HKOrganDonationThankYouViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidesBackButton:animated:", 1, 0);

}

- (id)titleImage
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0DC3870];
  HKHealthUIFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageNamed:inBundle:", CFSTR("donate_life_logo"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)titleString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("OD_THANK_YOU_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)bodyString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("OD_THANK_YOU_BODY"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)bottomAnchoredButtons
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  -[HKOrganDonationBaseViewController completionButtonTitle](self, "completionButtonTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("OD_DONE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("OD_SHARE_YOUR_DECISION"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {

  }
  return v7;
}

- (void)buttonAtIndexTapped:(int64_t)a3
{
  if (a3 == 1)
  {
    -[HKOrganDonationThankYouViewController shareButtonTapped:](self, "shareButtonTapped:", 0);
  }
  else if (!a3)
  {
    -[HKOrganDonationThankYouViewController doneButtonTapped:](self, "doneButtonTapped:");
  }
}

- (void)shareButtonTapped:(id)a3
{
  _HKActivityItemProvider *v4;
  void *v5;
  void *v6;
  _HKActivityItemProvider *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[4];
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v4 = [_HKActivityItemProvider alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("OD_SHARE_TEMPLATE_MAIL"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[UIActivityItemProvider initWithPlaceholderItem:](v4, "initWithPlaceholderItem:", v6);

  v8 = objc_alloc(MEMORY[0x1E0D96D28]);
  v20[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithActivityItems:applicationActivities:", v9, MEMORY[0x1E0C9AA60]);

  objc_msgSend(v10, "popoverPresentationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKTitledBuddyViewController buttons](self, "buttons");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSourceView:", v13);

  v14 = *MEMORY[0x1E0D96DE8];
  v19[0] = *MEMORY[0x1E0D96DD0];
  v19[1] = v14;
  v15 = *MEMORY[0x1E0D96DB0];
  v19[2] = *MEMORY[0x1E0D96DC0];
  v19[3] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setIncludedActivityTypes:", v16);

  v18 = *MEMORY[0x1E0D96D88];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setExcludedActivityTypes:", v17);

  objc_msgSend(v10, "setExcludedActivityCategories:", 1);
  -[HKOrganDonationThankYouViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);

}

- (void)doneButtonTapped:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  -[HKOrganDonationBaseViewController registrationCompletionHandler](self, "registrationCompletionHandler", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HKOrganDonationBaseViewController registrationCompletionHandler](self, "registrationCompletionHandler");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v5[2](v5, 1);

  }
  -[HKOrganDonationThankYouViewController navigationController](self, "navigationController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);

}

@end

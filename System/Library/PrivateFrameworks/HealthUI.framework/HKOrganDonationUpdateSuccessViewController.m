@implementation HKOrganDonationUpdateSuccessViewController

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HKOrganDonationUpdateSuccessViewController;
  -[HKTitledBuddyViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[HKOrganDonationUpdateSuccessViewController navigationItem](self, "navigationItem");
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
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("OD_UPDATE_SUCCESS_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)bodyString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("OD_UPDATE_SUCCESS_BODY"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)bottomAnchoredButtons
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
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
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {

  }
  return v5;
}

- (void)buttonAtIndexTapped:(int64_t)a3
{
  void *v4;
  void (**v5)(id, uint64_t);

  -[HKOrganDonationBaseViewController registrationCompletionHandler](self, "registrationCompletionHandler", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HKOrganDonationBaseViewController registrationCompletionHandler](self, "registrationCompletionHandler");
    v5 = (void (**)(id, uint64_t))objc_claimAutoreleasedReturnValue();
    v5[2](v5, 1);
  }
  else
  {
    -[HKOrganDonationUpdateSuccessViewController navigationController](self, "navigationController");
    v5 = (void (**)(id, uint64_t))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);
  }

}

@end

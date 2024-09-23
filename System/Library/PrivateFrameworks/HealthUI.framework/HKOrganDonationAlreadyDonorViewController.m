@implementation HKOrganDonationAlreadyDonorViewController

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
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("OD_REGISTERED_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)bodyString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("OD_REGISTERED_BODY"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)linkButtonTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("OD_LEARN_MORE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
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
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("OD_SIGN_UP"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("OD_NOT_NOW"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)buttonAtIndexTapped:(int64_t)a3
{
  if (a3 == 1)
  {
    -[HKOrganDonationAlreadyDonorViewController notNowButtonTapped:](self, "notNowButtonTapped:", 0);
  }
  else if (!a3)
  {
    -[HKOrganDonationAlreadyDonorViewController signupButtonTapped:](self, "signupButtonTapped:");
  }
}

- (void)signupButtonTapped:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  HKOrganDonationRegisterViewController *v8;

  v8 = objc_alloc_init(HKOrganDonationRegisterViewController);
  -[HKOrganDonationBaseViewController medicalIDData](self, "medicalIDData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationRegisterViewController setMedicalIDData:](v8, "setMedicalIDData:", v4);

  -[HKOrganDonationBaseViewController completionButtonTitle](self, "completionButtonTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationRegisterViewController setCompletionButtonTitle:](v8, "setCompletionButtonTitle:", v5);

  -[HKOrganDonationBaseViewController registrationCompletionHandler](self, "registrationCompletionHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationRegisterViewController setRegistrationCompletionHandler:](v8, "setRegistrationCompletionHandler:", v6);

  -[HKOrganDonationAlreadyDonorViewController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pushViewController:animated:", v8, 1);

}

- (void)notNowButtonTapped:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);

  -[HKOrganDonationBaseViewController registrationCompletionHandler](self, "registrationCompletionHandler", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HKOrganDonationBaseViewController registrationCompletionHandler](self, "registrationCompletionHandler");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v5[2](v5, 0);

  }
  -[HKOrganDonationAlreadyDonorViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)linkButtonTapped:(id)a3
{
  +[HKOrganDonationConnectionManager openDonateLifeMicroSiteInSafari](HKOrganDonationConnectionManager, "openDonateLifeMicroSiteInSafari", a3);
}

@end

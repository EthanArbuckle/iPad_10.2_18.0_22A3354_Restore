@implementation HKOrganDonationIntroductionViewController

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKOrganDonationIntroductionViewController;
  -[HKTitledBuddyViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[HKOrganDonationIntroductionViewController setUpRegistrationViewController](self, "setUpRegistrationViewController");
  -[HKOrganDonationRegisterViewController submitOrganDonationFlowImpressionEvent:](self->_registrationViewController, "submitOrganDonationFlowImpressionEvent:", 1);
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
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("OD_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)bodyString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("OD_BODY"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
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

- (void)linkButtonTapped:(id)a3
{
  -[HKOrganDonationIntroductionViewController learnMoreButtonTapped:](self, "learnMoreButtonTapped:", 0);
}

- (id)bottomAnchoredButtons
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("OD_SIGN_UP"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("OD_ALREADY_DONOR"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("OD_NOT_NOW"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)buttonAtIndexTapped:(int64_t)a3
{
  switch(a3)
  {
    case 2:
      -[HKOrganDonationIntroductionViewController notNowButtonTapped:](self, "notNowButtonTapped:", 0);
      break;
    case 1:
      -[HKOrganDonationIntroductionViewController alreadyButtonTapped:](self, "alreadyButtonTapped:", 0);
      break;
    case 0:
      -[HKOrganDonationIntroductionViewController signupButtonTapped:](self, "signupButtonTapped:");
      break;
  }
}

- (void)setUpRegistrationViewController
{
  HKOrganDonationRegisterViewController *v3;
  void *v4;
  void *v5;
  void *v6;
  HKOrganDonationRegisterViewController *registrationViewController;

  if (!self->_registrationViewController)
  {
    v3 = objc_alloc_init(HKOrganDonationRegisterViewController);
    -[HKOrganDonationBaseViewController medicalIDData](self, "medicalIDData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKOrganDonationRegisterViewController setMedicalIDData:](v3, "setMedicalIDData:", v4);

    -[HKOrganDonationBaseViewController completionButtonTitle](self, "completionButtonTitle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKOrganDonationRegisterViewController setCompletionButtonTitle:](v3, "setCompletionButtonTitle:", v5);

    -[HKOrganDonationBaseViewController registrationCompletionHandler](self, "registrationCompletionHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKOrganDonationRegisterViewController setRegistrationCompletionHandler:](v3, "setRegistrationCompletionHandler:", v6);

    registrationViewController = self->_registrationViewController;
    self->_registrationViewController = v3;

  }
}

- (void)signupButtonTapped:(id)a3
{
  id v4;

  -[HKOrganDonationIntroductionViewController navigationController](self, "navigationController", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pushViewController:animated:", self->_registrationViewController, 1);

}

- (void)alreadyButtonTapped:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  HKOrganDonationAlreadyDonorViewController *v8;

  v8 = -[HKOrganDonationBaseViewController initWithMedicalIDData:]([HKOrganDonationAlreadyDonorViewController alloc], "initWithMedicalIDData:", 0);
  -[HKOrganDonationBaseViewController medicalIDData](self, "medicalIDData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationBaseViewController setMedicalIDData:](v8, "setMedicalIDData:", v4);

  -[HKOrganDonationBaseViewController completionButtonTitle](self, "completionButtonTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationBaseViewController setCompletionButtonTitle:](v8, "setCompletionButtonTitle:", v5);

  -[HKOrganDonationBaseViewController registrationCompletionHandler](self, "registrationCompletionHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationBaseViewController setRegistrationCompletionHandler:](v8, "setRegistrationCompletionHandler:", v6);

  -[HKOrganDonationIntroductionViewController navigationController](self, "navigationController");
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
  -[HKOrganDonationIntroductionViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)learnMoreButtonTapped:(id)a3
{
  +[HKOrganDonationConnectionManager openDonateLifeMicroSiteInSafari](HKOrganDonationConnectionManager, "openDonateLifeMicroSiteInSafari", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registrationViewController, 0);
}

@end

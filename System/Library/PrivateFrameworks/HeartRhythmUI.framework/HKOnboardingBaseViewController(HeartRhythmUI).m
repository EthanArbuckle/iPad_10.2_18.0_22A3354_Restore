@implementation HKOnboardingBaseViewController(HeartRhythmUI)

- (void)configureNavigationButtonWithTypeCancelWithConfirmForElectrocardiogram
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a1, "setRightButtonType:", 1);
  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_CANCEL_DESCRIPTION"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setCancelWithConfirmAlertTitle:", v2);

  HRHeartRhythmUIFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("ONBOARDING_CANCEL"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setCancelWithConfirmAlertContinueActionTitle:", v4);

  HRHeartRhythmUIFrameworkBundle();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("ONBOARDING_SET_UP_LATER"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setCancelWithConfirmAlertAbortActionTitle:", v5);

}

- (void)configureNavigationButtonWithTypeCancelWithConfirmForAtrialFibrillation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a1, "setRightButtonType:", 1);
  HRHeartRhythmUIFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_CANCEL_DESC"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable-Antimony"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setCancelWithConfirmAlertTitle:", v3);

  HRHeartRhythmUIFrameworkBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_CANCEL_CANCEL_TITLE"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable-Antimony"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setCancelWithConfirmAlertContinueActionTitle:", v5);

  HRHeartRhythmUIFrameworkBundle();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_CANCEL_LATER_TITLE"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable-Antimony"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setCancelWithConfirmAlertAbortActionTitle:", v6);

}

@end

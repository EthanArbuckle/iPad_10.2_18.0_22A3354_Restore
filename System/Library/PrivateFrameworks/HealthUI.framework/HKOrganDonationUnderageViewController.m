@implementation HKOrganDonationUnderageViewController

- (id)titleString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("OD_UNDER_EIGHTEEN_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)bodyString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("OD_UNDER_EIGHTEEN_BODY"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
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
  void (**v5)(id, _QWORD);

  -[HKOrganDonationBaseViewController registrationCompletionHandler](self, "registrationCompletionHandler", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HKOrganDonationBaseViewController registrationCompletionHandler](self, "registrationCompletionHandler");
    v5 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
    v5[2](v5, 0);
  }
  else
  {
    -[HKOrganDonationUnderageViewController navigationController](self, "navigationController");
    v5 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);
  }

}

@end

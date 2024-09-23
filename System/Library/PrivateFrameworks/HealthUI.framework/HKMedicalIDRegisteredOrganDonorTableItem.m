@implementation HKMedicalIDRegisteredOrganDonorTableItem

- (id)initInEditMode:(BOOL)a3 organDonationOrganization:(int64_t)a4
{
  _BOOL8 v5;
  id result;
  void *v9;
  objc_super v10;

  v5 = a3;
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKMedicalIDRegisteredOrganDonorTableItem.m"), 33, CFSTR("HKMedicalIDRegisteredOrganDonorTableItem doesn't support edit mode"));

  }
  v10.receiver = self;
  v10.super_class = (Class)HKMedicalIDRegisteredOrganDonorTableItem;
  result = -[HKEmergencyCardTableItem initInEditMode:](&v10, sel_initInEditMode_, v5);
  if (result)
    *((_QWORD *)result + 5) = a4;
  return result;
}

- (id)title
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("OD_REGISTRY"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)organizationLogo
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

- (BOOL)hasPresentableData
{
  return 1;
}

- (BOOL)canEditRowAtIndex:(int64_t)a3
{
  return 0;
}

- (BOOL)shouldHighlightRowAtIndex:(int64_t)a3
{
  return 0;
}

- (UIEdgeInsets)separatorInset
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;
  UIEdgeInsets result;

  if (+[HKOrganDonationConnectionManager hasStoredRegistrant](HKOrganDonationConnectionManager, "hasStoredRegistrant")|| +[HKOrganDonationConnectionManager shouldShowStoreDemoOrganDonation](HKOrganDonationConnectionManager, "shouldShowStoreDemoOrganDonation"))
  {
    v7.receiver = self;
    v7.super_class = (Class)HKMedicalIDRegisteredOrganDonorTableItem;
    -[HKEmergencyCardTableItem separatorInset](&v7, sel_separatorInset);
  }
  else
  {
    v3 = 0.0;
    v4 = 999.0;
    v5 = 0.0;
    v6 = 0.0;
  }
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndex:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  if (+[HKOrganDonationConnectionManager hasStoredRegistrant](HKOrganDonationConnectionManager, "hasStoredRegistrant")|| +[HKOrganDonationConnectionManager shouldShowStoreDemoOrganDonation](HKOrganDonationConnectionManager, "shouldShowStoreDemoOrganDonation"))
  {
    +[HKIDRegisteredReviewCell defaultReuseIdentifier](HKIDRegisteredReviewCell, "defaultReuseIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dequeueReusableCellWithIdentifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[HKOrganDonationCallToActionTableViewCell defaultReuseIdentifier](HKOrganDonationCallToActionTableViewCell, "defaultReuseIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dequeueReusableCellWithIdentifier:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "actionButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel_presentDonateLifeRegistrationSequence, 64);
  }

  return v7;
}

- (void)presentDonateLifeRegistrationSequence
{
  void *v3;
  HKNavigationController *v4;
  void *v5;
  HKOrganDonationRegisterViewController *v6;

  v6 = objc_alloc_init(HKOrganDonationRegisterViewController);
  -[HKEmergencyCardTableItem data](self, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationRegisterViewController setMedicalIDData:](v6, "setMedicalIDData:", v3);

  v4 = -[HKNavigationController initWithRootViewController:]([HKNavigationController alloc], "initWithRootViewController:", v6);
  -[HKEmergencyCardTableItem owningViewController](self, "owningViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentViewController:animated:completion:", v4, 1, 0);

  -[HKOrganDonationRegisterViewController submitOrganDonationFlowImpressionEvent:](v6, "submitOrganDonationFlowImpressionEvent:", 1);
}

- (id)titleForFooter
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("OD_PERSONAL_INFO_DISCLAIMER"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HKMedicalIDRegisteredOrganDonorTableItemDelegate)delegate
{
  return (HKMedicalIDRegisteredOrganDonorTableItemDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HKOrganDonationCallToActionTableViewCell)notRegisteredCell
{
  return self->_notRegisteredCell;
}

- (void)setNotRegisteredCell:(id)a3
{
  objc_storeStrong((id *)&self->_notRegisteredCell, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notRegisteredCell, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

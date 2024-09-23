@implementation HKOrganDonationConfirmDeleteViewController

- (HKOrganDonationConfirmDeleteViewController)initWithConnectionManager:(id)a3 medicalIDData:(id)a4
{
  id v7;
  HKOrganDonationConfirmDeleteViewController *v8;
  HKOrganDonationConfirmDeleteViewController *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKOrganDonationConfirmDeleteViewController;
  v8 = -[HKOrganDonationBaseViewController initWithMedicalIDData:](&v11, sel_initWithMedicalIDData_, a4);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_connectionManager, a3);

  return v9;
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
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("OD_DELETE_CONFIRMATION_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)bodyString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("OD_DELETE_CONFIRMATION_BODY"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)bottomAnchoredButtons
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("OD_REMOVE_FROM_REGISTRY"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)buttonAtIndexTapped:(int64_t)a3
{
  if (!a3)
    -[HKOrganDonationConfirmDeleteViewController deleteButtonTapped:](self, "deleteButtonTapped:");
}

- (void)deleteButtonTapped:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD aBlock[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  objc_msgSend(v4, "setEnabled:", 0);
  -[HKOrganDonationConfirmDeleteViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidesBackButton:animated:", 1, 1);

  -[HKTitledBuddyViewController loadingIndicator](self, "loadingIndicator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startAnimating");

  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__HKOrganDonationConfirmDeleteViewController_deleteButtonTapped___block_invoke;
  aBlock[3] = &unk_1E9C402B0;
  objc_copyWeak(&v11, &location);
  v7 = v4;
  v10 = v7;
  v8 = _Block_copy(aBlock);
  -[HKOrganDonationConnectionManager deleteRegistrantWithCompletion:](self->_connectionManager, "deleteRegistrantWithCompletion:", v8);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __65__HKOrganDonationConfirmDeleteViewController_deleteButtonTapped___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HKOrganDonationDeleteSuccessViewController *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HKOrganDonationDeleteSuccessViewController *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "setEnabled:", 1);
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
      objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("OD_GENERIC_FAILURE_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("OD_GENERIC_FAILURE_BODY"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "alertControllerWithTitle:message:preferredStyle:", v10, v12, 1);
      v13 = (HKOrganDonationDeleteSuccessViewController *)objc_claimAutoreleasedReturnValue();

      v14 = (void *)MEMORY[0x1E0DC3448];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("OD_ALERT_OK"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __65__HKOrganDonationConfirmDeleteViewController_deleteButtonTapped___block_invoke_2;
      v23[3] = &unk_1E9C40288;
      v23[4] = WeakRetained;
      objc_msgSend(v14, "actionWithTitle:style:handler:", v16, 0, v23);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKOrganDonationDeleteSuccessViewController addAction:](v13, "addAction:", v17);

      objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v13, 1, 0);
    }
    else
    {
      v18 = [HKOrganDonationDeleteSuccessViewController alloc];
      objc_msgSend(WeakRetained, "medicalIDData");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[HKOrganDonationBaseViewController initWithMedicalIDData:](v18, "initWithMedicalIDData:", v19);

      objc_msgSend(WeakRetained, "registrationCompletionHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKOrganDonationBaseViewController setRegistrationCompletionHandler:](v13, "setRegistrationCompletionHandler:", v20);

      objc_msgSend(WeakRetained, "completionButtonTitle");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKOrganDonationBaseViewController setCompletionButtonTitle:](v13, "setCompletionButtonTitle:", v21);

      objc_msgSend(WeakRetained, "navigationController");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "pushViewController:animated:", v13, 1);

    }
  }

}

void __65__HKOrganDonationConfirmDeleteViewController_deleteButtonTapped___block_invoke_2(uint64_t a1)
{
  id v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v2, "popViewControllerAnimated:", 1);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionManager, 0);
}

@end

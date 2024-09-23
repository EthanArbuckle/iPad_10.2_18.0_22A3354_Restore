@implementation FAFamilySetupOrganizerViewController

- (FAFamilySetupOrganizerViewController)initWithAccount:(id)a3 store:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  FAFamilySetupOrganizerViewController *v11;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "aa_grandSlamAccountForiCloudAccount:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x24BE049B0]);
  v10 = (void *)objc_msgSend(v9, "initWithAccountStore:grandSlamAccount:appTokenID:", v6, v8, *MEMORY[0x24BE04878]);

  v11 = -[FAConfirmIdentityViewController initWithAppleAccount:grandSlamSigner:](self, "initWithAppleAccount:grandSlamSigner:", v7, v10);
  return v11;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FAFamilySetupOrganizerViewController;
  -[FAFamilySetupOrganizerViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[FAFamilySetupOrganizerViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAFamilySetupOrganizerViewController _createCancelButton](self, "_createCancelButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRightBarButtonItem:", v4);

}

- (id)pageTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("FAMILY_SETUP_SECOND_PAGE_TITLE"), &stru_24C8A3000, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)instructions
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("FAMILY_SETUP_SECOND_PAGE_DESCRIPTION"), &stru_24C8A3000, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)titleForContinuebutton
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("FAMILY_SETUP_CONTINUE_BUTTON"), &stru_24C8A3000, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)shouldShowInviteeInstructions
{
  return 0;
}

- (id)_createCancelButton
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancelButtonWasTapped_);
}

- (void)_cancelButtonWasTapped:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "familySetupPage:didCompleteWithSuccess:", self, 0);

}

- (void)continueButtonWasTapped:(id)a3
{
  id WeakRetained;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FAFamilySetupOrganizerViewController;
  -[FAConfirmIdentityViewController continueButtonWasTapped:](&v5, sel_continueButtonWasTapped_, a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "familySetupPage:didCompleteWithSuccess:", self, 1);

}

- (FAFamilySetupPageDelegate)delegate
{
  return (FAFamilySetupPageDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end

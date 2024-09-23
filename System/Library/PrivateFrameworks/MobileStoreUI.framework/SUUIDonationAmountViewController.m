@implementation SUUIDonationAmountViewController

- (SUUIDonationAmountViewController)initWithCharity:(id)a3 configuration:(id)a4
{
  id v6;
  SUUIDonationAmountViewController *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SUUIDonationAmountViewController;
  v7 = -[SUUIDonationStepViewController initWithCharity:configuration:](&v12, sel_initWithCharity_configuration_, a3, v6);
  if (v7)
  {
    objc_msgSend(v6, "addObserver:", v7);
    objc_msgSend(v6, "clientContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      objc_msgSend(v8, "localizedStringForKey:", CFSTR("DONATION_FLOW_TITLE"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("DONATION_FLOW_TITLE"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIDonationAmountViewController setTitle:](v7, "setTitle:", v10);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, 0x251213688, 0);

  v4.receiver = self;
  v4.super_class = (Class)SUUIDonationAmountViewController;
  -[SUUIDonationAmountViewController dealloc](&v4, sel_dealloc);
}

- (void)loadView
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  SUUIDonationAmountView *amountView;
  void *v10;
  SUUIDonationAmountView *v11;
  void *v12;
  SUUIDonationAmountView *v13;
  SUUIDonationAmountView *v14;
  SUUIDonationAmountView *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  -[SUUIDonationStepViewController donationConfiguration](self, "donationConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientContext");
  v19 = (id)objc_claimAutoreleasedReturnValue();

  -[SUUIDonationAmountViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidesBackButton:", 1);
  v5 = objc_alloc_init(MEMORY[0x24BEBD410]);
  objc_msgSend(v5, "setAction:", sel__cancelButtonAction_);
  objc_msgSend(v5, "setTarget:", self);
  if (v19)
    objc_msgSend(v19, "localizedStringForKey:", CFSTR("DONATION_FLOW_CANCEL_BUTTON"));
  else
    +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("DONATION_FLOW_CANCEL_BUTTON"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v6);

  objc_msgSend(v4, "setLeftBarButtonItem:", v5);
  v7 = objc_alloc_init(MEMORY[0x24BEBD410]);
  objc_msgSend(v7, "setAction:", sel__donateButtonAction_);
  objc_msgSend(v7, "setEnabled:", 0);
  objc_msgSend(v7, "setTarget:", self);
  if (v19)
    objc_msgSend(v19, "localizedStringForKey:", CFSTR("DONATION_FLOW_DONATE_BUTTON"));
  else
    +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("DONATION_FLOW_DONATE_BUTTON"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:", v8);

  objc_msgSend(v4, "setRightBarButtonItem:", v7);
  amountView = self->_amountView;
  if (!amountView)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = [SUUIDonationAmountView alloc];
    -[SUUIDonationStepViewController charity](self, "charity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[SUUIDonationAmountView initWithCharity:](v11, "initWithCharity:", v12);
    v14 = self->_amountView;
    self->_amountView = v13;

    v15 = self->_amountView;
    -[SUUIDonationStepViewController donationConfiguration](self, "donationConfiguration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIDonationStepViewController charity](self, "charity");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "logoImageForCharity:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIDonationAmountView setLogoImage:](v15, "setLogoImage:", v18);

    objc_msgSend(v10, "addObserver:selector:name:object:", self, sel__amountChangedNotification_, 0x251213688, self->_amountView);
    amountView = self->_amountView;
  }
  -[SUUIDonationAmountViewController setView:](self, "setView:", amountView);

}

- (void)donationConfigurationController:(id)a3 didLoadLogoForCharity:(id)a4
{
  id v6;
  id v7;
  SUUIDonationAmountView *amountView;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[SUUIDonationStepViewController charity](self, "charity");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6)
  {
    amountView = self->_amountView;
    objc_msgSend(v10, "logoImageForCharity:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIDonationAmountView setLogoImage:](amountView, "setLogoImage:", v9);

  }
}

- (void)_cancelButtonAction:(id)a3
{
  void *v4;
  id v5;

  -[SUUIDonationStepViewController donationViewController](self, "donationViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = self;
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)_donateButtonAction:(id)a3
{
  SUUIDonationAmountView *amountView;
  id v5;
  id v6;

  amountView = self->_amountView;
  v5 = a3;
  -[SUUIDonationAmountView setUserInteractionEnabled:](amountView, "setUserInteractionEnabled:", 0);
  objc_msgSend(v5, "setEnabled:", 0);

  if (-[SUUIGiftValidator isValidating](self->_validator, "isValidating"))
  {
    self->_tappedNextWhileValidating = 1;
  }
  else if (self->_lastValidationResponse)
  {
    -[SUUIDonationAmountViewController _performActionAfterValidation](self, "_performActionAfterValidation");
  }
  else
  {
    self->_tappedNextWhileValidating = 1;
    -[SUUIDonationAmountView selectedAmount](self->_amountView, "selectedAmount");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[SUUIDonationAmountViewController _validateDonation:](self, "_validateDonation:", v6);

  }
}

- (void)_amountChangedNotification:(id)a3
{
  id v4;

  -[SUUIDonationAmountView selectedAmount](self->_amountView, "selectedAmount", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[SUUIDonationAmountViewController _setDonationButtonEnabled:](self, "_setDonationButtonEnabled:", 1);
    -[SUUIDonationAmountViewController _validateDonation:](self, "_validateDonation:", v4);
  }
  else
  {
    -[SUUIDonationAmountViewController _setDonationButtonEnabled:](self, "_setDonationButtonEnabled:", 0);
    -[SUUIGiftValidator cancelValidation](self->_validator, "cancelValidation");
  }

}

- (void)_finishPurchaseWithResult:(BOOL)a3 errorMessage:(id)a4
{
  _BOOL4 v4;
  id v6;
  SUUIDonationResultViewController *v7;
  void *v8;
  void *v9;
  SUUIDonationResultViewController *v10;
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
  SUUIGiftPurchaseRequest *purchaseRequest;
  id v23;

  v4 = a3;
  v6 = a4;
  v23 = v6;
  if (v4)
  {
    v7 = [SUUIDonationResultViewController alloc];
    -[SUUIDonationStepViewController charity](self, "charity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIDonationStepViewController donationConfiguration](self, "donationConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[SUUIDonationResultViewController initWithCharity:configuration:](v7, "initWithCharity:configuration:", v8, v9);

    -[SUUIDonationAmountView selectedAmount](self->_amountView, "selectedAmount");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIDonationResultViewController setDonationAmount:](v10, "setDonationAmount:", v11);

    -[SUUIDonationStepViewController operationQueue](self, "operationQueue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIDonationStepViewController setOperationQueue:](v10, "setOperationQueue:", v12);

    -[SUUIDonationAmountViewController navigationController](self, "navigationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "pushViewController:animated:", v10, 1);

  }
  else
  {
    if (v6)
    {
      -[SUUIDonationStepViewController donationConfiguration](self, "donationConfiguration");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "clientContext");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = (void *)MEMORY[0x24BEBD3B0];
      if (v15)
        objc_msgSend(v15, "localizedStringForKey:", CFSTR("DONATION_FLOW_UNABLE_TO_DONATE"));
      else
        +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("DONATION_FLOW_UNABLE_TO_DONATE"), 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "alertControllerWithTitle:message:preferredStyle:", v17, v23, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = (void *)MEMORY[0x24BEBD3A8];
      if (v15)
        objc_msgSend(v15, "localizedStringForKey:", CFSTR("DONATION_FLOW_OK_BUTTON"));
      else
        +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("DONATION_FLOW_OK_BUTTON"), 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "actionWithTitle:style:handler:", v20, 0, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addAction:", v21);

      -[SUUIDonationAmountViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v18, 1, 0);
    }
    -[SUUIDonationAmountViewController _reenableAfterFailure](self, "_reenableAfterFailure");
  }
  purchaseRequest = self->_purchaseRequest;
  self->_purchaseRequest = 0;

}

- (void)_finishValidationWithResponse:(id)a3 error:(id)a4
{
  void *v6;
  id v7;

  v7 = a3;
  objc_storeStrong((id *)&self->_lastValidationResponse, a3);
  -[SUUIDonationAmountView selectedAmount](self->_amountView, "selectedAmount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIDonationAmountViewController _setDonationButtonEnabled:](self, "_setDonationButtonEnabled:", v6 != 0);

  if (self->_tappedNextWhileValidating)
  {
    self->_tappedNextWhileValidating = 0;
    -[SUUIDonationAmountViewController _performActionAfterValidation](self, "_performActionAfterValidation");
  }

}

- (void)_performActionAfterValidation
{
  SUUIGiftPurchaseRequest *v3;
  void *v4;
  void *v5;
  SUUIGiftPurchaseRequest *v6;
  SUUIGiftPurchaseRequest *purchaseRequest;
  SUUIGiftPurchaseRequest *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id location;

  if (-[SUUIGiftValidationResponse isValid](self->_lastValidationResponse, "isValid"))
  {
    if (!self->_purchaseRequest)
    {
      objc_initWeak(&location, self);
      v3 = [SUUIGiftPurchaseRequest alloc];
      -[SUUIDonationAmountView selectedAmount](self->_amountView, "selectedAmount");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIDonationStepViewController donationConfiguration](self, "donationConfiguration");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[SUUIGiftPurchaseRequest initWithDonation:configuration:](v3, "initWithDonation:configuration:", v4, v5);
      purchaseRequest = self->_purchaseRequest;
      self->_purchaseRequest = v6;

      v8 = self->_purchaseRequest;
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __65__SUUIDonationAmountViewController__performActionAfterValidation__block_invoke;
      v18[3] = &unk_2511F7B68;
      objc_copyWeak(&v19, &location);
      -[SUUIGiftPurchaseRequest purchaseWithCompletionBlock:](v8, "purchaseWithCompletionBlock:", v18);
      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    -[SUUIDonationStepViewController donationConfiguration](self, "donationConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "clientContext");
    v17 = (id)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x24BEBD3B0];
    if (v17)
      objc_msgSend(v17, "localizedStringForKey:", CFSTR("DONATION_FLOW_INVALID_DONATION"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("DONATION_FLOW_INVALID_DONATION"), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIGiftValidationResponse errorString](self->_lastValidationResponse, "errorString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "alertControllerWithTitle:message:preferredStyle:", v11, v12, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x24BEBD3A8];
    if (v17)
      objc_msgSend(v17, "localizedStringForKey:", CFSTR("DONATION_FLOW_OK_BUTTON"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("DONATION_FLOW_OK_BUTTON"), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "actionWithTitle:style:handler:", v15, 0, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addAction:", v16);

    -[SUUIDonationAmountViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v13, 1, 0);
    -[SUUIDonationAmountViewController _reenableAfterFailure](self, "_reenableAfterFailure");

  }
}

void __65__SUUIDonationAmountViewController__performActionAfterValidation__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  char v10;

  v5 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__SUUIDonationAmountViewController__performActionAfterValidation__block_invoke_2;
  block[3] = &unk_2511F7B40;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  v10 = a2;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v9);
}

void __65__SUUIDonationAmountViewController__performActionAfterValidation__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_finishPurchaseWithResult:errorMessage:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));

}

- (void)_reenableAfterFailure
{
  id v3;

  -[SUUIDonationAmountView setUserInteractionEnabled:](self->_amountView, "setUserInteractionEnabled:", 1);
  -[SUUIDonationAmountView selectedAmount](self->_amountView, "selectedAmount");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SUUIDonationAmountViewController _setDonationButtonEnabled:](self, "_setDonationButtonEnabled:", v3 != 0);

}

- (void)_setDonationButtonEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  uint64_t v5;
  id v6;

  v3 = a3;
  -[SUUIDonationAmountViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rightBarButtonItem");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v3)
    v5 = 2;
  else
    v5 = 0;
  objc_msgSend(v6, "setEnabled:", v3);
  objc_msgSend(v6, "setStyle:", v5);

}

- (void)_validateDonation:(id)a3
{
  id v4;
  SUUIGiftValidator *validator;
  void *v6;
  SUUIGiftValidator *v7;
  void *v8;
  void *v9;
  SUUIGiftValidator *v10;
  SUUIGiftValidator *v11;
  SUUIGiftValidator *v12;
  void *v13;
  SUUIGiftValidator *v14;
  _QWORD v15[4];
  id v16;
  id location;

  v4 = a3;
  validator = self->_validator;
  if (validator)
  {
    -[SUUIGiftValidator cancelValidation](validator, "cancelValidation");
  }
  else
  {
    -[SUUIDonationStepViewController donationConfiguration](self, "donationConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = [SUUIGiftValidator alloc];
    objc_msgSend(v6, "donationValidationURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clientContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[SUUIGiftValidator initWithValidationURL:clientContext:](v7, "initWithValidationURL:clientContext:", v8, v9);
    v11 = self->_validator;
    self->_validator = v10;

    v12 = self->_validator;
    -[SUUIDonationStepViewController operationQueue](self, "operationQueue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIGiftValidator setOperationQueue:](v12, "setOperationQueue:", v13);

  }
  objc_initWeak(&location, self);
  v14 = self->_validator;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __54__SUUIDonationAmountViewController__validateDonation___block_invoke;
  v15[3] = &unk_2511F7B90;
  objc_copyWeak(&v16, &location);
  -[SUUIGiftValidator validateDonation:withCompletionBlock:](v14, "validateDonation:withCompletionBlock:", v4, v15);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __54__SUUIDonationAmountViewController__validateDonation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__SUUIDonationAmountViewController__validateDonation___block_invoke_2;
  block[3] = &unk_2511F5128;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v12);
}

void __54__SUUIDonationAmountViewController__validateDonation___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_finishValidationWithResponse:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validator, 0);
  objc_storeStrong((id *)&self->_purchaseRequest, 0);
  objc_storeStrong((id *)&self->_lastValidationResponse, 0);
  objc_storeStrong((id *)&self->_amountView, 0);
}

@end

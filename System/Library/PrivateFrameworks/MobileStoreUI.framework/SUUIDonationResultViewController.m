@implementation SUUIDonationResultViewController

- (SUUIDonationResultViewController)initWithCharity:(id)a3 configuration:(id)a4
{
  id v6;
  SUUIDonationResultViewController *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SUUIDonationResultViewController;
  v7 = -[SUUIDonationStepViewController initWithCharity:configuration:](&v12, sel_initWithCharity_configuration_, a3, v6);
  if (v7)
  {
    objc_msgSend(v6, "addObserver:", v7);
    objc_msgSend(v6, "clientContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      objc_msgSend(v8, "localizedStringForKey:", CFSTR("DONATION_CONFIRM_TITLE"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("DONATION_CONFIRM_TITLE"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIDonationResultViewController setTitle:](v7, "setTitle:", v10);

  }
  return v7;
}

- (void)loadView
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  SUUIDonationResultView *resultView;
  SUUIDonationResultView *v8;
  SUUIDonationResultView *v9;
  SUUIDonationResultView *v10;
  void *v11;
  SUUIDonationResultView *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  SUUIDonationResultView *v17;
  void *v18;
  void *v19;
  void *v20;
  SUUIDonationResultView *v21;
  void *v22;
  id v23;

  -[SUUIDonationStepViewController donationConfiguration](self, "donationConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientContext");
  v23 = (id)objc_claimAutoreleasedReturnValue();

  -[SUUIDonationResultViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidesBackButton:", 1);
  v5 = objc_alloc_init(MEMORY[0x24BEBD410]);
  objc_msgSend(v5, "setAction:", sel__doneButtonAction_);
  objc_msgSend(v5, "setStyle:", 2);
  objc_msgSend(v5, "setTarget:", self);
  if (v23)
    objc_msgSend(v23, "localizedStringForKey:", CFSTR("DONATION_CONFIRM_DONE"));
  else
    +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("DONATION_CONFIRM_DONE"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v6);

  objc_msgSend(v4, "setRightBarButtonItem:", v5);
  resultView = self->_resultView;
  if (!resultView)
  {
    v8 = objc_alloc_init(SUUIDonationResultView);
    v9 = self->_resultView;
    self->_resultView = v8;

    v10 = self->_resultView;
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIDonationResultView setBackgroundColor:](v10, "setBackgroundColor:", v11);

    v12 = self->_resultView;
    -[SUUIDonationStepViewController donationConfiguration](self, "donationConfiguration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIDonationStepViewController charity](self, "charity");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "logoImageForCharity:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIDonationResultView setImage:](v12, "setImage:", v15);

    if (v23)
      objc_msgSend(v23, "localizedStringForKey:", CFSTR("DONATION_CONFIRM_MESSAGE"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("DONATION_CONFIRM_MESSAGE"), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = self->_resultView;
    v18 = (void *)MEMORY[0x24BDD17C8];
    -[SUUIGiftAmount displayLabel](self->_donationAmount, "displayLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithValidatedFormat:validFormatSpecifiers:error:", v16, CFSTR("%@"), 0, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIDonationResultView setMessage:](v17, "setMessage:", v20);

    v21 = self->_resultView;
    if (v23)
      objc_msgSend(v23, "localizedStringForKey:", CFSTR("DONATION_CONFIRM_THANKS"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("DONATION_CONFIRM_THANKS"), 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIDonationResultView setTitle:](v21, "setTitle:", v22);

    resultView = self->_resultView;
  }
  -[SUUIDonationResultViewController setView:](self, "setView:", resultView);

}

- (void)donationConfigurationController:(id)a3 didLoadLogoForCharity:(id)a4
{
  id v6;
  id v7;
  SUUIDonationResultView *resultView;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[SUUIDonationStepViewController charity](self, "charity");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6)
  {
    resultView = self->_resultView;
    objc_msgSend(v10, "logoImageForCharity:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIDonationResultView setImage:](resultView, "setImage:", v9);

  }
}

- (void)_doneButtonAction:(id)a3
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

- (SUUIGiftAmount)donationAmount
{
  return self->_donationAmount;
}

- (void)setDonationAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 992);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultView, 0);
  objc_storeStrong((id *)&self->_donationAmount, 0);
}

@end

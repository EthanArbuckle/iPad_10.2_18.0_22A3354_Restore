@implementation SUUIDonationViewController

- (id)_initSUUIDonationViewController
{
  id v3;
  void *v4;
  void *v5;
  SUUIDonationViewController *v6;
  SUUIDonationViewController *v7;
  objc_super v9;

  v3 = objc_alloc_init(MEMORY[0x24BEBDB08]);
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v5);

  v9.receiver = self;
  v9.super_class = (Class)SUUIDonationViewController;
  v6 = -[SUUIDonationViewController initWithRootViewController:](&v9, sel_initWithRootViewController_, v3);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_placeholderViewController, v3);
    -[SUUIDonationViewController setModalPresentationStyle:](v7, "setModalPresentationStyle:", 2);
  }

  return v7;
}

- (SUUIDonationViewController)initWithCharityIdentifier:(id)a3
{
  id v4;
  SUUIDonationViewController *v5;
  uint64_t v6;
  NSString *charityID;

  v4 = a3;
  v5 = -[SUUIDonationViewController _initSUUIDonationViewController](self, "_initSUUIDonationViewController");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    charityID = v5->_charityID;
    v5->_charityID = (NSString *)v6;

  }
  return v5;
}

- (SUUIDonationViewController)initWithURL:(id)a3
{
  void *v4;
  SUUIDonationViewController *v5;

  objc_msgSend(a3, "valueForQueryParameter:", CFSTR("charity"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SUUIDonationViewController initWithCharityIdentifier:](self, "initWithCharityIdentifier:", v4);

  return v5;
}

- (NSOperationQueue)operationQueue
{
  NSOperationQueue *operationQueue;
  NSOperationQueue *v4;
  NSOperationQueue *v5;

  operationQueue = self->_operationQueue;
  if (!operationQueue)
  {
    v4 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    v5 = self->_operationQueue;
    self->_operationQueue = v4;

    -[NSOperationQueue setMaxConcurrentOperationCount:](self->_operationQueue, "setMaxConcurrentOperationCount:", 6);
    operationQueue = self->_operationQueue;
  }
  return operationQueue;
}

- (void)setClientContext:(id)a3
{
  SUUIClientContext *v5;
  SUUIClientContext **p_clientContext;
  UIViewController *placeholderViewController;
  void *v8;
  SUUIClientContext *v9;

  v5 = (SUUIClientContext *)a3;
  p_clientContext = &self->_clientContext;
  if (self->_clientContext != v5)
  {
    v9 = v5;
    objc_storeStrong((id *)&self->_clientContext, a3);
    placeholderViewController = self->_placeholderViewController;
    if (*p_clientContext)
      -[SUUIClientContext localizedStringForKey:](*p_clientContext, "localizedStringForKey:", CFSTR("DONATION_FLOW_TITLE"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("DONATION_FLOW_TITLE"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController setTitle:](placeholderViewController, "setTitle:", v8);

    v5 = v9;
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  SUUIClientContext *clientContext;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  objc_super v15;
  _QWORD v16[4];
  id v17;
  id location;

  v3 = a3;
  if (!self->_donationConfiguration)
  {
    v5 = objc_alloc_init(MEMORY[0x24BEBD410]);
    objc_msgSend(v5, "setAction:", sel__cancelButtonAction_);
    objc_msgSend(v5, "setTarget:", self);
    clientContext = self->_clientContext;
    if (clientContext)
      -[SUUIClientContext localizedStringForKey:](clientContext, "localizedStringForKey:", CFSTR("DONATION_FLOW_CANCEL_BUTTON"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("DONATION_FLOW_CANCEL_BUTTON"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTitle:", v7);

    -[SUUIDonationViewController topViewController](self, "topViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "navigationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLeftBarButtonItem:", v5);

    objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "activeAccount");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[SUUIDonationViewController _loadDonationConfiguration](self, "_loadDonationConfiguration");
    }
    else
    {
      objc_initWeak(&location, self);
      v12 = objc_alloc(MEMORY[0x24BEB1DB8]);
      objc_msgSend(MEMORY[0x24BEB1DC0], "contextForSignIn");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v12, "initWithAuthenticationContext:", v13);

      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __45__SUUIDonationViewController_viewWillAppear___block_invoke;
      v16[3] = &unk_2511FA7D0;
      objc_copyWeak(&v17, &location);
      objc_msgSend(v14, "startWithAuthenticateResponseBlock:", v16);
      objc_destroyWeak(&v17);

      objc_destroyWeak(&location);
    }

  }
  v15.receiver = self;
  v15.super_class = (Class)SUUIDonationViewController;
  -[SUUIDonationViewController viewWillAppear:](&v15, sel_viewWillAppear_, v3);
}

void __45__SUUIDonationViewController_viewWillAppear___block_invoke(uint64_t a1, void *a2, void *a3)
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
  block[2] = __45__SUUIDonationViewController_viewWillAppear___block_invoke_2;
  block[3] = &unk_2511F5128;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v12);
}

void __45__SUUIDonationViewController_viewWillAppear___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_finishAuthenticateWithResponse:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_cancelButtonAction:(id)a3
{
  -[SUUIDonationViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_configurationDidLoadWithResult:(BOOL)a3 error:(id)a4
{
  id v5;
  SUUIDonationConfiguration *donationConfiguration;
  void *v7;
  SUUIDonationAmountViewController *v8;
  void *v9;
  void *v10;
  SUUIDonationAmountViewController **v11;
  void *v12;
  void *v13;
  UIViewController *placeholderViewController;
  SUUIDonationAmountViewController *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  donationConfiguration = self->_donationConfiguration;
  if (self->_charityID)
  {
    -[SUUIDonationConfiguration charityForIdentifier:](donationConfiguration, "charityForIdentifier:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
LABEL_3:
      v8 = -[SUUIDonationAmountViewController initWithCharity:configuration:]([SUUIDonationAmountViewController alloc], "initWithCharity:configuration:", v7, self->_donationConfiguration);
      -[SUUIDonationViewController operationQueue](self, "operationQueue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIDonationStepViewController setOperationQueue:](v8, "setOperationQueue:", v9);

      -[SUUIDonationConfiguration loadLogoForCharity:](self->_donationConfiguration, "loadLogoForCharity:", v7);
      v16[0] = v8;
      v10 = (void *)MEMORY[0x24BDBCE30];
      v11 = (SUUIDonationAmountViewController **)v16;
      goto LABEL_10;
    }
  }
  else
  {
    -[SUUIDonationConfiguration allCharities](donationConfiguration, "allCharities");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "count"))
    {
      objc_msgSend(v12, "objectAtIndex:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

    if (v7)
      goto LABEL_3;
  }
  if (!+[SUUINetworkErrorViewController canDisplayError:](SUUINetworkErrorViewController, "canDisplayError:", v5))
  {
    NSLog(CFSTR("[Donation]: Error: %@"), v5);
    -[SUUIDonationViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
    goto LABEL_11;
  }
  v8 = -[SUUINetworkErrorViewController initWithError:]([SUUINetworkErrorViewController alloc], "initWithError:", v5);
  -[SUUIDonationAmountViewController setClientContext:](v8, "setClientContext:", self->_clientContext);
  v15 = v8;
  v10 = (void *)MEMORY[0x24BDBCE30];
  v11 = &v15;
LABEL_10:
  objc_msgSend(v10, "arrayWithObjects:count:", v11, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIDonationViewController setViewControllers:](self, "setViewControllers:", v13);

LABEL_11:
  placeholderViewController = self->_placeholderViewController;
  self->_placeholderViewController = 0;

}

- (void)_finishAuthenticateWithResponse:(id)a3 error:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (v7 && objc_msgSend(v7, "authenticateResponseType") == 4)
    -[SUUIDonationViewController _loadDonationConfiguration](self, "_loadDonationConfiguration");
  else
    -[SUUIDonationViewController _configurationDidLoadWithResult:error:](self, "_configurationDidLoadWithResult:error:", 0, v6);

}

- (void)_loadDonationConfiguration
{
  SUUIDonationConfiguration *v3;
  void *v4;
  void *v5;
  SUUIDonationConfiguration *v6;
  SUUIDonationConfiguration *donationConfiguration;
  SUUIDonationConfiguration *v8;
  _QWORD v9[4];
  id v10;
  id location;

  objc_initWeak(&location, self);
  v3 = [SUUIDonationConfiguration alloc];
  -[SUUIDonationViewController operationQueue](self, "operationQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIDonationViewController clientContext](self, "clientContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SUUIDonationConfiguration initWithOperationQueue:clientContext:](v3, "initWithOperationQueue:clientContext:", v4, v5);
  donationConfiguration = self->_donationConfiguration;
  self->_donationConfiguration = v6;

  v8 = self->_donationConfiguration;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __56__SUUIDonationViewController__loadDonationConfiguration__block_invoke;
  v9[3] = &unk_2511F5770;
  objc_copyWeak(&v10, &location);
  -[SUUIDonationConfiguration loadConfigurationWithCompletionBlock:](v8, "loadConfigurationWithCompletionBlock:", v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __56__SUUIDonationViewController__loadDonationConfiguration__block_invoke(uint64_t a1, char a2, void *a3)
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
  block[2] = __56__SUUIDonationViewController__loadDonationConfiguration__block_invoke_2;
  block[3] = &unk_2511F7B40;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  v10 = a2;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v9);
}

void __56__SUUIDonationViewController__loadDonationConfiguration__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_configurationDidLoadWithResult:error:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));

}

- (NSString)charityIdentifier
{
  return self->_charityID;
}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_operationQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderViewController, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_donationConfiguration, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_charityID, 0);
}

@end

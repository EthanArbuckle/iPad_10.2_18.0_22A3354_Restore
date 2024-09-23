@implementation CDPUIPiggybackingViewController

- (CDPUIPiggybackingViewController)initWithViewModel:(id)a3 cdpContext:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CDPUIPiggybackingViewController *v15;
  uint64_t v16;
  UIActivityIndicatorView *activityIndicator;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BEBD640];
  objc_msgSend(v7, "iconName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "imageNamed:inBundle:", v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "title");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "message");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19.receiver = self;
  v19.super_class = (Class)CDPUIPiggybackingViewController;
  v15 = -[CDPUIPiggybackingViewController initWithTitle:detailText:icon:contentLayout:](&v19, sel_initWithTitle_detailText_icon_contentLayout_, v13, v14, v12, 2);

  if (v15)
  {
    objc_storeStrong((id *)&v15->_viewModel, a3);
    objc_storeStrong((id *)&v15->_cdpContext, a4);
    v16 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 101);
    activityIndicator = v15->_activityIndicator;
    v15->_activityIndicator = (UIActivityIndicatorView *)v16;

    -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](v15->_activityIndicator, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  }

  return v15;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_super v32;
  _QWORD v33[5];

  v33[4] = *MEMORY[0x24BDAC8D0];
  v32.receiver = self;
  v32.super_class = (Class)CDPUIPiggybackingViewController;
  -[OBBaseWelcomeController viewDidLoad](&v32, sel_viewDidLoad);
  -[CDPUIPiggybackingViewController contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", self->_activityIndicator);

  objc_msgSend(MEMORY[0x24BE6E3E8], "boldButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addTarget:action:forControlEvents:", self, sel__handleSendCodeAction_, 64);
  -[CDPUIPiggybackingViewModel sendCodeOption](self->_viewModel, "sendCodeOption");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v4;
  objc_msgSend(v4, "setTitle:forState:", v6, 0);

  -[CDPUIPiggybackingViewController buttonTray](self, "buttonTray");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addButton:", v4);

  objc_msgSend(MEMORY[0x24BE6E418], "linkButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addTarget:action:forControlEvents:", self, sel__handleCantGetToDevicesButtonAction_, 64);
  -[CDPUIPiggybackingViewModel cantGetToDeviceOption](self->_viewModel, "cantGetToDeviceOption");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "escapeOfferName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v8;
  objc_msgSend(v8, "setTitle:forState:", v10, 0);

  -[CDPUIPiggybackingViewController buttonTray](self, "buttonTray");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addButton:", v8);

  v22 = (void *)MEMORY[0x24BDD1628];
  -[UIActivityIndicatorView leadingAnchor](self->_activityIndicator, "leadingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPUIPiggybackingViewController contentView](self, "contentView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "leadingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v27);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v26;
  -[UIActivityIndicatorView trailingAnchor](self->_activityIndicator, "trailingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPUIPiggybackingViewController contentView](self, "contentView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "trailingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v23);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v12;
  -[UIActivityIndicatorView topAnchor](self->_activityIndicator, "topAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPUIPiggybackingViewController contentView](self, "contentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "topAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:constant:", v15, 100.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v33[2] = v16;
  -[UIActivityIndicatorView bottomAnchor](self->_activityIndicator, "bottomAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPUIPiggybackingViewController contentView](self, "contentView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bottomAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v33[3] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "activateConstraints:", v21);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CDPUIPiggybackingViewController;
  -[OBBaseWelcomeController viewDidAppear:](&v3, sel_viewDidAppear_, a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CDPUIPiggybackingViewController;
  -[CDPUIPiggybackingViewController viewWillDisappear:](&v3, sel_viewWillDisappear_, a3);
}

- (void)_handleSendCodeAction:(id)a3
{
  void *v4;
  void (**v5)(void);
  id v6;

  -[CDPUIPiggybackingViewModel sendCodeOption](self->_viewModel, "sendCodeOption", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CDPUIPiggybackingViewModel sendCodeOption](self->_viewModel, "sendCodeOption");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "escapeAction");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();

  }
}

- (void)_handleCantGetToDevicesButtonAction:(id)a3
{
  void *v4;
  id v5;

  -[CDPUIPiggybackingViewModel cantGetToDeviceOption](self->_viewModel, "cantGetToDeviceOption", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CDPUIPiggybackingViewModel cantGetToDeviceOption](self->_viewModel, "cantGetToDeviceOption");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleEscapeAction:", self);

  }
}

- (void)startSpinning
{
  void *v3;

  -[CDPUIPiggybackingViewController buttonTray](self, "buttonTray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  -[UIActivityIndicatorView startAnimating](self->_activityIndicator, "startAnimating");
}

- (void)stopSpinning
{
  id v3;

  -[UIActivityIndicatorView stopAnimating](self->_activityIndicator, "stopAnimating");
  -[CDPUIPiggybackingViewController buttonTray](self, "buttonTray");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_cdpContext, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

@end

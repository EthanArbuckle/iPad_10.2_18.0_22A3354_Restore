@implementation CDPWaitingApprovalViewController

- (CDPWaitingApprovalViewController)initWithEscapeOffer:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CDPWaitingApprovalViewController *v14;
  CDPWaitingApprovalViewController *v15;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BE1A448], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deviceClass");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("WAITING_APPROVAL_TITLE"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addDeviceClass:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("WAITING_APPROVAL_SUBTITLE"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addDeviceClass:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[CDPTableViewController initWithTitle:subTitle:](self, "initWithTitle:subTitle:", v10, v13);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_escapeOffer, a3);
    -[CDPRemoteValidationEscapeOffer setPresentingViewController:](v15->_escapeOffer, "setPresentingViewController:", v15);
  }

  return v15;
}

- (void)cancelRemoteApproval
{
  void *v3;
  void *v4;
  void (**v5)(id, _QWORD, void *);

  -[CDPWaitingApprovalViewController remoteApprovalCompletion](self, "remoteApprovalCompletion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CDPWaitingApprovalViewController remoteApprovalCompletion](self, "remoteApprovalCompletion");
    v5 = (void (**)(id, _QWORD, void *))objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE1A368], -5307, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, 0, v4);

  }
}

- (void)loadView
{
  UIActivityIndicatorView *v3;
  UIActivityIndicatorView *spinner;
  void *v5;
  id v6;
  UILabel *v7;
  UILabel *waitingLabel;
  UILabel *v9;
  void *v10;
  UILabel *v11;
  void *v12;
  void *v13;
  UIButton *v14;
  UIButton *escapeButton;
  UIButton *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)CDPWaitingApprovalViewController;
  -[CDPTableViewController loadView](&v21, sel_loadView);
  v3 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 100);
  spinner = self->_spinner;
  self->_spinner = v3;

  -[UIActivityIndicatorView startAnimating](self->_spinner, "startAnimating");
  -[CDPTableViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", self->_spinner);

  v6 = objc_alloc(MEMORY[0x24BEBD708]);
  v7 = (UILabel *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  waitingLabel = self->_waitingLabel;
  self->_waitingLabel = v7;

  v9 = self->_waitingLabel;
  CDPLocalizedString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](v9, "setText:", v10);

  v11 = self->_waitingLabel;
  objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 16.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v11, "setFont:", v12);

  -[UILabel sizeToFit](self->_waitingLabel, "sizeToFit");
  -[CDPTableViewController tableView](self, "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSubview:", self->_waitingLabel);

  if (self->_escapeOffer)
  {
    objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 1);
    v14 = (UIButton *)objc_claimAutoreleasedReturnValue();
    escapeButton = self->_escapeButton;
    self->_escapeButton = v14;

    v16 = self->_escapeButton;
    -[CDPRemoteValidationEscapeOffer title](self->_escapeOffer, "title");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](v16, "setTitle:forState:", v17, 0);

    -[UIButton titleLabel](self->_escapeButton, "titleLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 17.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setFont:", v19);

    -[UIButton addTarget:action:forControlEvents:](self->_escapeButton, "addTarget:action:forControlEvents:", self->_escapeOffer, sel_handleEscapeAction_, 64);
    -[UIButton sizeToFit](self->_escapeButton, "sizeToFit");
    -[UIButton setAutoresizingMask:](self->_escapeButton, "setAutoresizingMask:", 12);
    -[CDPTableViewController tableView](self, "tableView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addSubview:", self->_escapeButton);

  }
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double MidX;
  double v5;
  void *v6;
  double MaxY;
  double v8;
  double Width;
  double Height;
  void *v11;
  double v12;
  void *v13;
  double MidY;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  objc_super v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  v24.receiver = self;
  v24.super_class = (Class)CDPWaitingApprovalViewController;
  -[CDPTableViewController viewDidLayoutSubviews](&v24, sel_viewDidLayoutSubviews);
  -[CDPTableViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  MidX = CGRectGetMidX(v25);
  -[UIButton frame](self->_escapeButton, "frame");
  v5 = MidX - CGRectGetWidth(v26) * 0.5;
  -[CDPTableViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  MaxY = CGRectGetMaxY(v27);
  -[UIButton frame](self->_escapeButton, "frame");
  v8 = MaxY - CGRectGetHeight(v28) + -10.0;
  -[UIButton frame](self->_escapeButton, "frame");
  Width = CGRectGetWidth(v29);
  -[UIButton frame](self->_escapeButton, "frame");
  Height = CGRectGetHeight(v30);

  -[UIButton setFrame:](self->_escapeButton, "setFrame:", v5, v8, Width, Height);
  -[CDPTableViewController tableView](self, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v12 = CGRectGetMidX(v31);
  -[CDPTableViewController tableView](self, "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  MidY = CGRectGetMidY(v32);
  -[UIActivityIndicatorView frame](self->_spinner, "frame");
  v15 = CGRectGetWidth(v33);
  -[UIActivityIndicatorView frame](self->_spinner, "frame");
  v16 = CGRectGetHeight(v34);

  -[UIActivityIndicatorView setFrame:](self->_spinner, "setFrame:", v12, MidY, v15, v16);
  v35.origin.x = v12;
  v35.origin.y = MidY;
  v35.size.width = v15;
  v35.size.height = v16;
  v17 = CGRectGetMidX(v35);
  -[UILabel frame](self->_waitingLabel, "frame");
  v19 = v17 - v18 * 0.5;
  v36.origin.x = v12;
  v36.origin.y = MidY;
  v36.size.width = v15;
  v36.size.height = v16;
  v20 = CGRectGetMaxY(v36);
  -[UILabel frame](self->_waitingLabel, "frame");
  v22 = v20 + v21;
  -[UILabel frame](self->_waitingLabel, "frame");
  v23 = CGRectGetWidth(v37);
  -[UILabel frame](self->_waitingLabel, "frame");
  -[UILabel setFrame:](self->_waitingLabel, "setFrame:", v19, v22, v23, CGRectGetHeight(v38));
}

- (void)remoteApprovalSucceeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void (**v7)(id, uint64_t, _QWORD);

  -[UIActivityIndicatorView stopAnimating](self->_spinner, "stopAnimating");
  -[UILabel setHidden:](self->_waitingLabel, "setHidden:", 1);
  -[UILabel sizeToFit](self->_waitingLabel, "sizeToFit");
  -[UIButton removeFromSuperview](self->_escapeButton, "removeFromSuperview");
  -[CDPWaitingApprovalViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

  objc_msgSend(MEMORY[0x24BE75558], "sharedSpinnerManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPWaitingApprovalViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startAnimatingInNavItem:forIdentifier:", v5, CFSTR("waitingApproval"));

  -[CDPWaitingApprovalViewController remoteApprovalCompletion](self, "remoteApprovalCompletion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CDPWaitingApprovalViewController remoteApprovalCompletion](self, "remoteApprovalCompletion");
    v7 = (void (**)(id, uint64_t, _QWORD))objc_claimAutoreleasedReturnValue();
    v7[2](v7, 1, 0);

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CDPWaitingApprovalViewController;
  -[CDPWaitingApprovalViewController viewDidAppear:](&v3, sel_viewDidAppear_, a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CDPWaitingApprovalViewController;
  -[CDPWaitingApprovalViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  objc_msgSend(MEMORY[0x24BE75558], "sharedSpinnerManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopAnimatingForIdentifier:", CFSTR("waitingApproval"));

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 0;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  return objc_alloc_init(MEMORY[0x24BEBD9F8]);
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return 44.0;
}

- (void)escapeOfferSelectedWithOption:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "progressTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v8, "progressTitle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPTableViewController setHeaderTitle:](self, "setHeaderTitle:", v5);

    -[CDPTableViewController setHeaderSubTitle:](self, "setHeaderSubTitle:", 0);
    objc_msgSend(v8, "progressLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_waitingLabel, "setText:", v6);

    -[UILabel sizeToFit](self->_waitingLabel, "sizeToFit");
    -[UIButton removeFromSuperview](self->_escapeButton, "removeFromSuperview");
    -[CDPWaitingApprovalViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNeedsLayout");

  }
}

- (id)remoteApprovalCompletion
{
  return self->_remoteApprovalCompletion;
}

- (void)setRemoteApprovalCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1064);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_remoteApprovalCompletion, 0);
  objc_storeStrong((id *)&self->_escapeOffer, 0);
  objc_storeStrong((id *)&self->_escapeButton, 0);
  objc_storeStrong((id *)&self->_waitingLabel, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
}

@end

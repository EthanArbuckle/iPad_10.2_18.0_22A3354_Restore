@implementation ASCredentialRequestCABLEConnectingViewController

- (id)initRequiringTableView:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ASCredentialRequestCABLEConnectingViewController;
  return -[ASCredentialRequestPaneViewController initRequiringTableView:](&v4, sel_initRequiringTableView_, 0);
}

- (void)viewDidLoad
{
  UIActivityIndicatorView *v3;
  UIActivityIndicatorView *activityIndicator;
  id v5;
  void *v6;
  void *v7;
  id v8;
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
  objc_super v28;
  _QWORD v29[3];
  _QWORD v30[3];

  v30[2] = *MEMORY[0x24BDAC8D0];
  v28.receiver = self;
  v28.super_class = (Class)ASCredentialRequestCABLEConnectingViewController;
  -[ASCredentialRequestPaneViewController viewDidLoad](&v28, sel_viewDidLoad);
  v3 = (UIActivityIndicatorView *)objc_alloc_init(MEMORY[0x24BEBD398]);
  activityIndicator = self->_activityIndicator;
  self->_activityIndicator = v3;

  v5 = objc_alloc_init(MEMORY[0x24BEBD708]);
  -[ASCredentialRequestCABLEConnectingViewController _connectingText](self, "_connectingText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v6);

  objc_msgSend(v5, "setMaximumContentSizeCategory:", *MEMORY[0x24BEBE068]);
  +[ASViewServiceInterfaceUtilities headerTitleFont](ASViewServiceInterfaceUtilities, "headerTitleFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v7);

  v8 = objc_alloc(MEMORY[0x24BEBD978]);
  v30[0] = self->_activityIndicator;
  v30[1] = v5;
  v9 = v5;
  v26 = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithArrangedSubviews:", v10);

  objc_msgSend(v11, "setAlignment:", 3);
  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v11, "setSpacing:", 8.0);
  -[ASCredentialRequestCABLEConnectingViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", v11);

  v21 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v11, "centerXAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCredentialRequestCABLEConnectingViewController view](self, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "safeAreaLayoutGuide");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "centerXAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v22;
  objc_msgSend(v9, "lastBaselineAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCredentialRequestCABLEConnectingViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "centerYAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v16;
  -[ASCredentialRequestPaneViewController paneHeaderStackView](self, "paneHeaderStackView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "heightAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintGreaterThanOrEqualToConstant:", 300.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v19;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "activateConstraints:", v20);

  -[ASCredentialRequestPaneViewController sizeToFitPaneContent](self, "sizeToFitPaneContent");
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ASCredentialRequestCABLEConnectingViewController;
  -[ASCredentialRequestPaneViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[UIActivityIndicatorView startAnimating](self->_activityIndicator, "startAnimating");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ASCredentialRequestCABLEConnectingViewController;
  -[ASCredentialRequestPaneViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[ASCredentialRequestCABLEConnectingViewController _startInformativeTextTimerIfNeeded](self, "_startInformativeTextTimerIfNeeded");
}

- (void)viewWillDisappear:(BOOL)a3
{
  NSTimer *informativeTextTimer;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ASCredentialRequestCABLEConnectingViewController;
  -[ASCredentialRequestCABLEConnectingViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  -[NSTimer invalidate](self->_informativeTextTimer, "invalidate");
  informativeTextTimer = self->_informativeTextTimer;
  self->_informativeTextTimer = 0;

}

- (id)_connectingText
{
  return (id)_WBSLocalizedString();
}

- (void)_startInformativeTextTimerIfNeeded
{
  void *v3;
  NSTimer *v4;
  NSTimer *informativeTextTimer;
  _QWORD v6[4];
  id v7;
  id location;

  if (!self->_informativeTextTimer && !self->_informativeTextLabel)
  {
    objc_initWeak(&location, self);
    v3 = (void *)MEMORY[0x24BDBCF40];
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __86__ASCredentialRequestCABLEConnectingViewController__startInformativeTextTimerIfNeeded__block_invoke;
    v6[3] = &unk_24C951520;
    objc_copyWeak(&v7, &location);
    objc_msgSend(v3, "scheduledTimerWithTimeInterval:repeats:block:", 0, v6, 5.0);
    v4 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    informativeTextTimer = self->_informativeTextTimer;
    self->_informativeTextTimer = v4;

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __86__ASCredentialRequestCABLEConnectingViewController__startInformativeTextTimerIfNeeded__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[131];
    WeakRetained[131] = 0;
    v3 = WeakRetained;

    objc_msgSend(v3, "_showInformativeText");
    WeakRetained = v3;
  }

}

- (void)_showInformativeText
{
  void *v3;
  _QWORD v4[5];

  -[ASCredentialRequestCABLEConnectingViewController _setUpInformativeTextLabel](self, "_setUpInformativeTextLabel");
  -[UILabel setAlpha:](self->_informativeTextLabel, "setAlpha:", 0.0);
  -[ASCredentialRequestCABLEConnectingViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __72__ASCredentialRequestCABLEConnectingViewController__showInformativeText__block_invoke;
  v4[3] = &unk_24C94F558;
  v4[4] = self;
  objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:", v4, 0.3);
}

uint64_t __72__ASCredentialRequestCABLEConnectingViewController__showInformativeText__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "setAlpha:", 1.0);
}

- (void)_setUpInformativeTextLabel
{
  UILabel *v3;
  UILabel *informativeTextLabel;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
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
  _QWORD v30[5];

  v30[4] = *MEMORY[0x24BDAC8D0];
  v3 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
  informativeTextLabel = self->_informativeTextLabel;
  self->_informativeTextLabel = v3;

  -[ASCredentialRequestCABLEConnectingViewController _informativeText](self, "_informativeText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_informativeTextLabel, "setText:", v5);

  -[UILabel setMaximumContentSizeCategory:](self->_informativeTextLabel, "setMaximumContentSizeCategory:", *MEMORY[0x24BEBE070]);
  -[UILabel setNumberOfLines:](self->_informativeTextLabel, "setNumberOfLines:", 0);
  -[UILabel setTextAlignment:](self->_informativeTextLabel, "setTextAlignment:", 1);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_informativeTextLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_informativeTextLabel, "setTextColor:", v6);

  -[ASCredentialRequestCABLEConnectingViewController _informativeTextFont](self, "_informativeTextFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_informativeTextLabel, "setFont:", v7);

  -[ASCredentialRequestCABLEConnectingViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", self->_informativeTextLabel);

  -[ASCredentialRequestCABLEConnectingViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layoutMarginsGuide");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(MEMORY[0x24BE0B290], "isPad"))
    v11 = 8.0;
  else
    v11 = 0.0;
  v22 = (void *)MEMORY[0x24BDD1628];
  -[UILabel leadingAnchor](self->_informativeTextLabel, "leadingAnchor");
  v28 = v10;
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "leadingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v27, v11);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v26;
  objc_msgSend(v10, "trailingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel trailingAnchor](self->_informativeTextLabel, "trailingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v24, v11);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v23;
  -[ASCredentialRequestCABLEConnectingViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel lastBaselineAnchor](self->_informativeTextLabel, "lastBaselineAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:multiplier:", v14, 2.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v15;
  -[ASCredentialRequestCABLEConnectingViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "safeAreaLayoutGuide");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bottomAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel lastBaselineAnchor](self->_informativeTextLabel, "lastBaselineAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:multiplier:", v19, 1.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v30[3] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "activateConstraints:", v21);

}

- (id)_informativeText
{
  return (id)_WBSLocalizedString();
}

- (id)_informativeTextFont
{
  return (id)objc_msgSend(MEMORY[0x24BEBD5E0], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1F0]);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_informativeTextLabel, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_informativeTextTimer, 0);
}

@end

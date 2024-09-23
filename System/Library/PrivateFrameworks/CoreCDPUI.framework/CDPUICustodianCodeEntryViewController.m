@implementation CDPUICustodianCodeEntryViewController

- (CDPUICustodianCodeEntryViewController)initWithViewModel:(id)a3 cdpContext:(id)a4
{
  id v7;
  id v8;
  CDPUICustodianCodeEntryViewController *v9;
  CDPUICustodianCodeEntryViewController *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CDPUICustodianCodeEntryViewController;
  v9 = -[DevicePINController init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_viewModel, a3);
    objc_storeStrong((id *)&v10->_cdpContext, a4);
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", CFSTR("CDPUICustodianCodeEntry"), 0, 0, 0, 0, 13, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setEditPaneClass:", objc_opt_class());
    -[DevicePINController setSpecifier:](v10, "setSpecifier:", v11);
    -[DevicePINController setMode:](v10, "setMode:", 3);
    -[DevicePINController setShouldDismissWhenDone:](v10, "setShouldDismissWhenDone:", 1);
    -[DevicePINController setHidesCancelButton:](v10, "setHidesCancelButton:", 0);
    -[DevicePINController setHidesNavigationButtons:](v10, "setHidesNavigationButtons:", 1);
    -[DevicePINController setPinDelegate:](v10, "setPinDelegate:", v10);
    -[DevicePINController setPinLength:](v10, "setPinLength:", 6);
    -[DevicePINController setNumericPIN:](v10, "setNumericPIN:", 1);
    objc_msgSend(MEMORY[0x24BE75530], "appearance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTextColor:", v13);

    objc_msgSend(MEMORY[0x24BE75530], "appearance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBackgroundColor:", v15);

  }
  return v10;
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CDPUICustodianCodeEntryViewController;
  -[DevicePINController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  objc_msgSend(MEMORY[0x24BE1A3E0], "rtcAnalyticsReporter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPUICustodianCodeEntryViewController _makeViewDidAppearEvent](self, "_makeViewDidAppearEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendEvent:", v5);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  CDPUICustodianCodeEntryViewController *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CDPUICustodianCodeEntryViewController;
  -[DevicePINController viewWillAppear:](&v10, sel_viewWillAppear_, a3);
  -[CDPUICustodianCodeEntryViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", &stru_24C857A78);

  -[CDPUICustodianCodeEntryViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (CDPUICustodianCodeEntryViewController *)objc_claimAutoreleasedReturnValue();

  if (v7 == self)
  {
    -[CDPUICustodianCodeEntryViewController navigationController](self, "navigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "navigationBar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_setBackgroundOpacity:", 0.0);

  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CDPUICustodianCodeEntryViewController;
  -[DevicePINController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[CDPUICustodianCodeEntryViewController _enableUserInteractionAndStopSpinner](self, "_enableUserInteractionAndStopSpinner");
}

- (id)_makeViewDidAppearEvent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x24BDFC2A0], "analyticsEventWithContext:eventName:category:", self->_cdpContext, *MEMORY[0x24BE1A730], *MEMORY[0x24BE1A860]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPUICustodianCodeEntryViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "backBarButtonItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (_QWORD *)MEMORY[0x24BE1A880];
  }
  else
  {
    -[CDPUICustodianCodeEntryViewController navigationItem](self, "navigationItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "leftBarButtonItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      goto LABEL_6;
    v7 = (_QWORD *)MEMORY[0x24BE1A888];
  }
  objc_msgSend(v4, "addObject:", *v7);
LABEL_6:
  -[CDPUICodeEntryViewModel escapeOffer](self->_viewModel, "escapeOffer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "titleTelemetryKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[CDPUICodeEntryViewModel escapeOffer](self->_viewModel, "escapeOffer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "titleTelemetryKey");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v13);

  }
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "aaf_arrayAsCommaSeperatedString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, *MEMORY[0x24BE1A648]);

  }
  return v3;
}

- (id)stringsBundle
{
  return (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
}

- (BOOL)showSimplePINCancelButtonOnLeft
{
  return 1;
}

- (CGSize)preferredContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x24BDBF148];
  v3 = *(double *)(MEMORY[0x24BDBF148] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)simplePIN
{
  return 1;
}

- (void)setPane:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CDPUICustodianCodeEntryViewController;
  -[DevicePINController setPane:](&v5, sel_setPane_, v4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v4, "setViewModel:", self->_viewModel);

}

- (id)pinInstructionsPrompt
{
  if (self->_pinInstructions)
    return self->_pinInstructions;
  else
    return &stru_24C857A78;
}

- (void)didAcceptEnteredPIN:(id)a3
{
  -[CDPUICustodianCodeEntryViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (BOOL)validatePIN:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t (**v7)(_QWORD, _QWORD);
  char v8;
  void *v9;
  NSString *v10;
  NSString *pinInstructions;

  v4 = a3;
  -[PSDetailController pane](self, "pane");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resignFirstResponder");

  -[CDPUICodeEntryViewModel codeEnteredAction](self->_viewModel, "codeEnteredAction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CDPUICustodianCodeEntryViewController _disableUserInteractionAndStartSpinner](self, "_disableUserInteractionAndStartSpinner");
    -[CDPUICodeEntryViewModel codeEnteredAction](self->_viewModel, "codeEnteredAction");
    v7 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v8 = ((uint64_t (**)(_QWORD, id))v7)[2](v7, v4);

    if ((v8 & 1) == 0)
    {
      -[PSDetailController pane](self, "pane");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "becomeFirstResponder");

      CDPLocalizedString();
      v10 = (NSString *)objc_claimAutoreleasedReturnValue();
      pinInstructions = self->_pinInstructions;
      self->_pinInstructions = v10;

    }
    -[CDPUICustodianCodeEntryViewController _enableUserInteractionAndStopSpinner](self, "_enableUserInteractionAndStopSpinner");
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (void)_disableUserInteractionAndStartSpinner
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BE75558], "sharedSpinnerManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPUICustodianCodeEntryViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startAnimatingInNavItem:forIdentifier:hideBackButton:", v4, CFSTR("CDPUICustodianCodeEntry"), 1);

  -[CDPUICustodianCodeEntryViewController view](self, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserInteractionEnabled:", 0);

}

- (void)_enableUserInteractionAndStopSpinner
{
  void *v2;
  id v3;

  -[CDPUICustodianCodeEntryViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUserInteractionEnabled:", 1);

  objc_msgSend(MEMORY[0x24BE75558], "sharedSpinnerManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopAnimatingForIdentifier:", CFSTR("CDPUICustodianCodeEntry"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cdpContext, 0);
  objc_storeStrong((id *)&self->_pinInstructions, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

@end

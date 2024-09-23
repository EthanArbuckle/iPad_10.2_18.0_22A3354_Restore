@implementation DSPasscodeController

- (DSPasscodeController)init
{
  void *v3;
  void *v4;
  void *v5;
  DSPasscodeController *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  os_log_t v17;
  void *v18;
  objc_super v20;
  objc_super v21;

  -[DSPasscodeController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[DSPasscodeController isPasscodeSet](DSPasscodeController, "isPasscodeSet"))
  {
    DSUILocStringForKey(CFSTR("DEVICE_PASSCODE"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSPasscodeController detailText](self, "detailText");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v21.receiver = self;
    v21.super_class = (Class)DSPasscodeController;
    v6 = -[DSPasscodeController initWithTitle:detailText:symbolName:](&v21, sel_initWithTitle_detailText_symbolName_, v4, v5, CFSTR("lock"));

    DSUILocStringForKey(CFSTR("DEVICE_PASSCODE_BOLD_BUTTON_TITLE"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[DSUIUtilities setUpBoldButtonForController:title:target:selector:](DSUIUtilities, "setUpBoldButtonForController:title:target:selector:", v6, v7, v6, sel_passcodeChangePressed);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSPasscodeController setBoldButton:](v6, "setBoldButton:", v8);

    v9 = CFSTR("DEVICE_PASSCODE_LINK_BUTTON_TITLE");
  }
  else
  {
    DSUILocStringForKey(CFSTR("DEVICE_PASSCODE_CREATE"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    DSUILocStringForKey(CFSTR("DEVICE_PASSCODE_CREATE_DETAIL"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20.receiver = self;
    v20.super_class = (Class)DSPasscodeController;
    v6 = -[DSPasscodeController initWithTitle:detailText:symbolName:](&v20, sel_initWithTitle_detailText_symbolName_, v10, v11, CFSTR("lock"));

    DSUILocStringForKey(CFSTR("DEVICE_PASSCODE_CREATE_BOLD_BUTTON_TITLE"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[DSUIUtilities setUpBoldButtonForController:title:target:selector:](DSUIUtilities, "setUpBoldButtonForController:title:target:selector:", v6, v12, v6, sel_passcodeChangePressed);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSPasscodeController setBoldButton:](v6, "setBoldButton:", v13);

    v9 = CFSTR("DEVICE_PASSCODE_CREATE_LINK_BUTTON_TITLE");
  }
  DSUILocStringForKey(v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[DSUIUtilities setUpLinkButtonForController:title:target:selector:](DSUIUtilities, "setUpLinkButtonForController:title:target:selector:", v6, v14, v3, sel_pushNextPane);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSPasscodeController setLinkButton:](v6, "setLinkButton:", v15);

  v16 = objc_opt_class();
  if (v16 == objc_opt_class())
  {
    v17 = os_log_create("com.apple.DigitalSeparation", "DSPasscodeController");
    v18 = (void *)DSLog_5;
    DSLog_5 = (uint64_t)v17;

  }
  return v6;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DSPasscodeController;
  -[DSPasscodeController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[DSPasscodeController configureViews](self, "configureViews");
}

- (void)configureViews
{
  _BOOL4 v3;
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
  __CFString *v14;
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
  id v25;

  -[DSPasscodeController delegate](self, "delegate");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  v3 = +[DSPasscodeController isPasscodeSet](DSPasscodeController, "isPasscodeSet");
  -[DSPasscodeController headerView](self, "headerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    DSUILocStringForKey(CFSTR("DEVICE_PASSCODE"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTitle:", v5);

    -[DSPasscodeController headerView](self, "headerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSPasscodeController detailText](self, "detailText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDetailText:", v7);

    -[DSPasscodeController boldButton](self, "boldButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeTarget:action:forControlEvents:", 0, 0, 0xFFFFFFFFLL);

    -[DSPasscodeController boldButton](self, "boldButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    DSUILocStringForKey(CFSTR("DEVICE_PASSCODE_BOLD_BUTTON_TITLE"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTitle:forState:", v10, 0);

    -[DSPasscodeController boldButton](self, "boldButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addTarget:action:forControlEvents:", self, sel_passcodeChangePressed, 64);

    -[DSPasscodeController linkButton](self, "linkButton");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeTarget:action:forControlEvents:", 0, 0, 0xFFFFFFFFLL);

    -[DSPasscodeController linkButton](self, "linkButton");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = CFSTR("DEVICE_PASSCODE_LINK_BUTTON_TITLE");
  }
  else
  {
    DSUILocStringForKey(CFSTR("DEVICE_PASSCODE_CREATE"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTitle:", v15);

    -[DSPasscodeController headerView](self, "headerView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    DSUILocStringForKey(CFSTR("DEVICE_PASSCODE_CREATE_DETAIL"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setDetailText:", v17);

    -[DSPasscodeController boldButton](self, "boldButton");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "removeTarget:action:forControlEvents:", 0, 0, 0xFFFFFFFFLL);

    -[DSPasscodeController boldButton](self, "boldButton");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    DSUILocStringForKey(CFSTR("DEVICE_PASSCODE_CREATE_BOLD_BUTTON_TITLE"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setTitle:forState:", v20, 0);

    -[DSPasscodeController boldButton](self, "boldButton");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addTarget:action:forControlEvents:", self, sel_passcodeChangePressed, 64);

    -[DSPasscodeController linkButton](self, "linkButton");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "removeTarget:action:forControlEvents:", 0, 0, 0xFFFFFFFFLL);

    -[DSPasscodeController linkButton](self, "linkButton");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = CFSTR("DEVICE_PASSCODE_CREATE_LINK_BUTTON_TITLE");
  }
  DSUILocStringForKey(v14);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTitle:forState:", v23, 0);

  -[DSPasscodeController linkButton](self, "linkButton");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addTarget:action:forControlEvents:", v25, sel_pushNextPane, 64);

}

+ (BOOL)isPasscodeSet
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPasscodeSet");

  return v3;
}

- (void)shouldShowWithCompletion:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  sharedWorkQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__DSPasscodeController_shouldShowWithCompletion___block_invoke;
  block[3] = &unk_24EFF3898;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, block);

}

uint64_t __49__DSPasscodeController_shouldShowWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  if (!objc_msgSend(MEMORY[0x24BE2CC70], "isPasscodeModificationRestricted"))
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = DSLog_5;
  if (os_log_type_enabled((os_log_t)DSLog_5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2278DF000, v2, OS_LOG_TYPE_INFO, "Cannot reset passcode due to device restrictions", v4, 2u);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)passcodeChangePressed
{
  if (objc_msgSend(MEMORY[0x24BE2CC98], "shouldShowBioRatchetFlow"))
    -[DSPasscodeController startRatchetEvalInPresentationContext:](self, "startRatchetEvalInPresentationContext:", self);
  else
    -[DSPasscodeController displayPasscodeChangeSheet](self, "displayPasscodeChangeSheet");
}

- (void)displayPasscodeChangeSheet
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  DSPasscodePopupViewController *v8;

  v8 = objc_alloc_init(DSPasscodePopupViewController);
  -[DSPasscodeController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSPasscodePopupViewController setDelegate:](v8, "setDelegate:", v3);

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v8);
  objc_msgSend(v4, "setModalPresentationStyle:", 0);
  -[DSPasscodeController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentViewController:animated:completion:", v4, 1, 0);

  -[DSPasscodePopupViewController navigationItem](v8, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_userDidTapCancelButton_);
  objc_msgSend(v6, "setLeftBarButtonItem:", v7);

}

- (void)userDidTapCancelButton:(id)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v4 = DSLog_5;
  if (os_log_type_enabled((os_log_t)DSLog_5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2278DF000, v4, OS_LOG_TYPE_INFO, "User canceled passcode flow", v6, 2u);
  }
  -[DSPasscodeController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (id)detailText
{
  void *v2;
  char v3;
  void *v4;
  int v5;
  __CFString *v6;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0
    && (objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "isPasscodeRecoveryRestricted"),
        v4,
        !v5))
  {
    v6 = CFSTR("DEVICE_PASSCODE_DETAIL_RECOVERY");
  }
  else
  {
    v6 = CFSTR("DEVICE_PASSCODE_DETAIL");
  }
  DSUILocStringForKey(v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)startRatchetEvalInPresentationContext:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  LARatchetViewController *v15;
  LARatchetViewController *ratchetVC;
  _QWORD v17[5];
  _QWORD v18[6];

  v18[5] = *MEMORY[0x24BDAC8D0];
  v4 = (objc_class *)MEMORY[0x24BDDAA08];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  DSUIDTOLocStringForKey(CFSTR("RATCHET_ACTION_BUTTON_TITLE"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCountdownPrimaryActionTitle:", v7);

  -[DSPasscodeController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deepLinkForCurrentFlowAndPane");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BDDAA00];
  v17[0] = &unk_24F00B298;
  DSUIDTOLocStringForKey(CFSTR("RATCHET_REASON_PASSCODE"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v11;
  v17[1] = &unk_24F00B2B0;
  DSUIDTOLocStringForKey(CFSTR("RATCHET_ENDED_DETAIL_PASSCODE"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v12;
  v17[2] = &unk_24F00B2C8;
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v13;
  v18[3] = v5;
  v17[3] = &unk_24F00B2E0;
  v17[4] = &unk_24F00B2F8;
  v18[4] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "makeViewControllerWithOptions:configuration:", v14, v6);
  v15 = (LARatchetViewController *)objc_claimAutoreleasedReturnValue();
  ratchetVC = self->_ratchetVC;
  self->_ratchetVC = v15;

  -[LARatchetViewController setDelegate:](self->_ratchetVC, "setDelegate:", self);
  -[LARatchetViewController evaluateAndShowViewController](self->_ratchetVC, "evaluateAndShowViewController");

}

- (void)ratchetViewController:(id)a3 didFinishWithResult:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  int v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = a4;
  -[DSPasscodeController delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", &unk_24F00B2B0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[DSPasscodeController displayPasscodeChangeSheet](self, "displayPasscodeChangeSheet");
    objc_msgSend(v11, "sendSummaryAnalyticsWithEventName:", CFSTR("com.apple.DigitalSeparation.RatchedEnded"));
    if (v8)
    {
      -[DSPasscodeController navigationController](self, "navigationController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "viewControllers");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v14, "mutableCopy");

      objc_msgSend(v15, "removeObject:", v8);
      -[DSPasscodeController navigationController](self, "navigationController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setViewControllers:", v15);

    }
  }
  else
  {
    objc_msgSend(v9, "userInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x24BDDA928]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "code") || !v18)
    {
      v20 = DSLog_5;
      if (os_log_type_enabled((os_log_t)DSLog_5, OS_LOG_TYPE_INFO))
      {
        v27 = 138412290;
        v28 = v9;
        _os_log_impl(&dword_2278DF000, v20, OS_LOG_TYPE_INFO, "Passcode Change Ratchet not armed. Reason: %@", (uint8_t *)&v27, 0xCu);
      }
      -[DSPasscodeController navigationController](self, "navigationController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "topViewController");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_opt_class();
      v24 = objc_opt_class();

      if (v23 == v24)
      {
        -[DSPasscodeController navigationController](self, "navigationController");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (id)objc_msgSend(v25, "popToViewController:animated:", self, 0);

        objc_msgSend(v11, "pushNextPane");
      }
    }
    else if (objc_msgSend(v18, "rawValue") == 1)
    {
      v19 = DSLog_5;
      if (os_log_type_enabled((os_log_t)DSLog_5, OS_LOG_TYPE_INFO))
      {
        LOWORD(v27) = 0;
        _os_log_impl(&dword_2278DF000, v19, OS_LOG_TYPE_INFO, "Passcode Change Ratchet initiated, timer counting down. User exiting Safety Check.", (uint8_t *)&v27, 2u);
      }
      objc_msgSend(v11, "exitFlowForRatchetWait");
    }

  }
}

- (DSNavigationDelegate)delegate
{
  return (DSNavigationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OBBoldTrayButton)boldButton
{
  return self->_boldButton;
}

- (void)setBoldButton:(id)a3
{
  objc_storeStrong((id *)&self->_boldButton, a3);
}

- (OBLinkTrayButton)linkButton
{
  return self->_linkButton;
}

- (void)setLinkButton:(id)a3
{
  objc_storeStrong((id *)&self->_linkButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkButton, 0);
  objc_storeStrong((id *)&self->_boldButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_ratchetVC, 0);
}

@end

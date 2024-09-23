@implementation CNFRegAccountWebViewController

- (CNFRegAccountWebViewController)initWithRegController:(id)a3
{
  id v4;
  NSObject *v5;
  CNFRegAccountWebViewController *v6;
  void *v7;
  char v8;
  _BOOL4 v9;
  NSObject *v10;
  NSObject *v11;
  objc_super v13;
  uint8_t buf[16];

  v4 = a3;
  if (-[CNFRegServerWebViewController _shouldLog](self, "_shouldLog"))
  {
    OSLogHandleForIDSCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2138BA000, v5, OS_LOG_TYPE_DEFAULT, "CNFRegAccountWebViewController initWithRegController", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      IMLogString();
  }
  v13.receiver = self;
  v13.super_class = (Class)CNFRegAccountWebViewController;
  v6 = -[CNFRegServerWebViewController initWithRegController:](&v13, sel_initWithRegController_, v4);
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BE30378], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isLoaded");
    v9 = -[CNFRegServerWebViewController _shouldLog](v6, "_shouldLog");
    if ((v8 & 1) != 0)
    {
      if (v9)
      {
        OSLogHandleForIDSCategory();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2138BA000, v10, OS_LOG_TYPE_DEFAULT, "CNFRegAccountWebViewController bag already loaded", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
          IMLogString();
      }
    }
    else
    {
      if (v9)
      {
        OSLogHandleForIDSCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2138BA000, v11, OS_LOG_TYPE_DEFAULT, "CNFRegAccountWebViewController starting bag load", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
          IMLogString();
      }
      objc_msgSend(v7, "startBagLoad");
    }

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  NSTimer *bagLoadTimer;
  objc_super v5;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[NSTimer invalidate](self->_bagLoadTimer, "invalidate");
  bagLoadTimer = self->_bagLoadTimer;
  self->_bagLoadTimer = 0;

  v5.receiver = self;
  v5.super_class = (Class)CNFRegAccountWebViewController;
  -[CNFRegServerWebViewController dealloc](&v5, sel_dealloc);
}

- (void)loadView
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
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
  objc_super v19;
  uint8_t buf[16];

  if (-[CNFRegServerWebViewController _shouldLog](self, "_shouldLog"))
  {
    OSLogHandleForIDSCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2138BA000, v3, OS_LOG_TYPE_DEFAULT, "CNFRegAccountWebViewController loadView", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      IMLogString();
  }
  v19.receiver = self;
  v19.super_class = (Class)CNFRegAccountWebViewController;
  -[CNFRegServerWebViewController loadView](&v19, sel_loadView);
  +[CNFRegAppearanceController globalAppearanceController](CNFRegAppearanceController, "globalAppearanceController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "webViewBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFRegAccountWebViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v5);

  v7 = objc_msgSend(v4, "webViewIsOpaque");
  -[CNFRegAccountWebViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setOpaque:", v7);

  objc_msgSend(v4, "webViewBackgroundView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFRegAccountWebViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  objc_msgSend(v9, "setFrame:");

  -[CNFRegAccountWebViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v9);

  -[CNFRegAccountWebViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sendSubviewToBack:", v9);

  CommunicationsSetupUIBundle();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegStringTableName();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("FACETIME_ACCOUNT_PAGE_TITLE"), &stru_24D077260, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFRegAccountWebViewController navigationItem](self, "navigationItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTitle:", v15);

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancelTapped);
  -[CNFRegAccountWebViewController navigationItem](self, "navigationItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setLeftBarButtonItem:", v17);

}

- (void)viewDidLoad
{
  NSObject *v3;
  void *v4;
  char v5;
  objc_super v6;
  uint8_t buf[16];

  if (-[CNFRegServerWebViewController _shouldLog](self, "_shouldLog"))
  {
    OSLogHandleForIDSCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2138BA000, v3, OS_LOG_TYPE_DEFAULT, "CNFRegAccountWebViewController viewDidLoad", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      IMLogString();
  }
  v6.receiver = self;
  v6.super_class = (Class)CNFRegAccountWebViewController;
  -[CNFRegServerWebViewController viewDidLoad](&v6, sel_viewDidLoad);
  if (!-[CNFRegAccountWebViewController _loadURLFromBag](self, "_loadURLFromBag"))
  {
    -[CNFRegServerWebViewController showSpinner](self, "showSpinner");
    objc_msgSend(MEMORY[0x24BE30378], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isLoaded");

    if ((v5 & 1) != 0)
    {
      -[CNFRegAccountWebViewController setFailedBagLoad:](self, "setFailedBagLoad:", 1);
    }
    else
    {
      -[CNFRegAccountWebViewController _startListeningForBagLoad](self, "_startListeningForBagLoad");
      -[CNFRegAccountWebViewController _startBagLoadTimer](self, "_startBagLoadTimer");
    }
  }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  return CNFRegShouldRotateToOrientation(a3);
}

- (id)logName
{
  return CFSTR("Server-Account");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNFRegAccountWebViewController;
  -[CNFRegServerWebViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  if (-[CNFRegAccountWebViewController failedBagLoad](self, "failedBagLoad"))
    -[CNFRegAccountWebViewController _showURLDidNotLoadAlert](self, "_showURLDidNotLoadAlert");
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNFRegAccountWebViewController;
  -[CNFRegServerWebViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[CNFRegAccountWebViewController _stopCurrentReload](self, "_stopCurrentReload");
}

- (BOOL)shouldSetHeadersForRequest:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a3, "valueForHTTPHeaderField:", CFSTR("x-protocol-version"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;

  return v4;
}

- (void)setHeadersForRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNFRegAccountWebViewController;
  -[CNFRegServerWebViewController setHeadersForRequest:](&v10, sel_setHeadersForRequest_, v4);
  objc_msgSend(v4, "addValue:forHTTPHeaderField:", CFSTR("6"), CFSTR("x-protocol-version"));
  -[CNFRegAccountWebViewController clientInfoHeaderValue](self, "clientInfoHeaderValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "addValue:forHTTPHeaderField:", v5, CFSTR("x-apple-client-info"));
  -[CNFRegAccountWebViewController viewPortHeaderValue](self, "viewPortHeaderValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v4, "addValue:forHTTPHeaderField:", v6, CFSTR("x-vc-view-res"));
  -[CNFRegAccountWebViewController securityHeaderValue](self, "securityHeaderValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v4, "addValue:forHTTPHeaderField:", v7, CFSTR("x-ds-client-id"));
  -[CNFRegAccountWebViewController serviceHeaderValue](self, "serviceHeaderValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v4, "addValue:forHTTPHeaderField:", v8, CFSTR("x-vc-service"));
  -[CNFRegAccountWebViewController interfaceLayoutHeaderValue](self, "interfaceLayoutHeaderValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v4, "addValue:forHTTPHeaderField:", v9, CFSTR("x-vc-ui-layout"));

}

- (BOOL)canSendURLRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  uint8_t v19[16];
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CNFRegAccountWebViewController;
  if (!-[CNFRegServerWebViewController canSendURLRequest:](&v20, sel_canSendURLRequest_, v4))
    goto LABEL_45;
  objc_msgSend(v4, "valueForHTTPHeaderField:", CFSTR("x-apple-client-info"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    if (!-[CNFRegServerWebViewController _shouldLog](self, "_shouldLog"))
      goto LABEL_45;
    OSLogHandleForIDSCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_2138BA000, v12, OS_LOG_TYPE_DEFAULT, "No client info for request, denying send", v19, 2u);
    }

    if (!os_log_shim_legacy_logging_enabled() || (IMShouldLog() & 1) == 0)
      goto LABEL_45;
LABEL_44:
    IMLogString();
LABEL_45:
    v11 = 0;
    goto LABEL_46;
  }
  objc_msgSend(v4, "valueForHTTPHeaderField:", CFSTR("x-ds-client-id"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    if (!-[CNFRegServerWebViewController _shouldLog](self, "_shouldLog"))
      goto LABEL_45;
    OSLogHandleForIDSCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_2138BA000, v13, OS_LOG_TYPE_DEFAULT, "No security header for request, denying send", v19, 2u);
    }

    if (!os_log_shim_legacy_logging_enabled() || (IMShouldLog() & 1) == 0)
      goto LABEL_45;
    goto LABEL_44;
  }
  objc_msgSend(v4, "valueForHTTPHeaderField:", CFSTR("x-protocol-version"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    if (!-[CNFRegServerWebViewController _shouldLog](self, "_shouldLog"))
      goto LABEL_45;
    OSLogHandleForIDSCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_2138BA000, v14, OS_LOG_TYPE_DEFAULT, "No protocol header for request, denying send", v19, 2u);
    }

    if (!os_log_shim_legacy_logging_enabled() || (IMShouldLog() & 1) == 0)
      goto LABEL_45;
    goto LABEL_44;
  }
  objc_msgSend(v4, "valueForHTTPHeaderField:", CFSTR("x-vc-service"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    if (!-[CNFRegServerWebViewController _shouldLog](self, "_shouldLog"))
      goto LABEL_45;
    OSLogHandleForIDSCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_2138BA000, v15, OS_LOG_TYPE_DEFAULT, "No service header for request, denying send", v19, 2u);
    }

    if (!os_log_shim_legacy_logging_enabled() || (IMShouldLog() & 1) == 0)
      goto LABEL_45;
    goto LABEL_44;
  }
  objc_msgSend(v4, "valueForHTTPHeaderField:", CFSTR("x-vc-ui-layout"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    if (!-[CNFRegServerWebViewController _shouldLog](self, "_shouldLog"))
      goto LABEL_45;
    OSLogHandleForIDSCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_2138BA000, v16, OS_LOG_TYPE_DEFAULT, "No layout header for request, denying send", v19, 2u);
    }

    if (!os_log_shim_legacy_logging_enabled() || (IMShouldLog() & 1) == 0)
      goto LABEL_45;
    goto LABEL_44;
  }
  objc_msgSend(v4, "valueForHTTPHeaderField:", CFSTR("x-vc-view-res"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    if (!-[CNFRegServerWebViewController _shouldLog](self, "_shouldLog"))
      goto LABEL_45;
    OSLogHandleForIDSCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_2138BA000, v17, OS_LOG_TYPE_DEFAULT, "No viewport header for request, denying send", v19, 2u);
    }

    if (!os_log_shim_legacy_logging_enabled() || (IMShouldLog() & 1) == 0)
      goto LABEL_45;
    goto LABEL_44;
  }
  v11 = 1;
LABEL_46:

  return v11;
}

- (void)_reload
{
  if (!-[CNFRegServerWebViewController isLoading](self, "isLoading"))
    -[CNFRegAccountWebViewController _loadURLFromBag](self, "_loadURLFromBag");
}

- (void)_stopCurrentReload
{
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__reload, 0);
}

- (void)_reloadDelayed
{
  -[CNFRegAccountWebViewController _stopCurrentReload](self, "_stopCurrentReload");
  -[CNFRegAccountWebViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__reload, 0, 0.0);
}

- (BOOL)_loadURLFromBag
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  NSObject *v7;
  BOOL v8;
  BOOL v9;
  void *v11;
  uint8_t buf[4];
  __CFString *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[CNFRegAccountWebViewController bagKey](self, "bagKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF50], "CNFRegServerURLOverride");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      v6 = CFSTR("defaults override");
    else
      v6 = 0;
  }
  else if (v3)
  {
    objc_msgSend(MEMORY[0x24BE30378], "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "urlWithKey:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("bag key {%@}"), v3);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  if (-[CNFRegServerWebViewController _shouldLog](self, "_shouldLog"))
  {
    OSLogHandleForIDSCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v13 = v6;
      v14 = 2112;
      v15 = v5;
      _os_log_impl(&dword_2138BA000, v7, OS_LOG_TYPE_DEFAULT, "Found url via %@ : %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      IMLogString();
  }
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  v9 = !v8;
  if (!v8)
    -[CNFRegServerWebViewController loadURL:](self, "loadURL:", v5);

  return v9;
}

- (void)_showURLDidNotLoadAlert
{
  NSObject *v3;
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
  _QWORD v17[5];
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (-[CNFRegServerWebViewController _shouldLog](self, "_shouldLog"))
  {
    OSLogHandleForIDSCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      -[CNFRegAccountWebViewController bagKey](self, "bagKey");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v19 = v4;
      _os_log_impl(&dword_2138BA000, v3, OS_LOG_TYPE_DEFAULT, "Server bag finished loading, but could not find url for key : %@", buf, 0xCu);

    }
    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      -[CNFRegAccountWebViewController bagKey](self, "bagKey");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      IMLogString();

    }
  }
  CommunicationsSetupUIBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegStringTableName();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("FACETIME_ACTIVATION_ERROR_TITLE"), &stru_24D077260, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  CommunicationsSetupUIBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegStringTableName();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("FACETIME_ACTIVATION_ERROR_GENERIC"), &stru_24D077260, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  CommunicationsSetupUIBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegStringTableName();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("FACETIME_ALERT_OK"), &stru_24D077260, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v7, v10, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __57__CNFRegAccountWebViewController__showURLDidNotLoadAlert__block_invoke;
  v17[3] = &unk_24D075A28;
  v17[4] = self;
  objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", v13, 0, v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAction:", v15);

  -[CNFRegAccountWebViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v14, 1, 0);
}

uint64_t __57__CNFRegAccountWebViewController__showURLDidNotLoadAlert__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancelTapped");
}

- (void)_bagLoadTimeout:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  if (-[CNFRegServerWebViewController _shouldLog](self, "_shouldLog"))
  {
    OSLogHandleForIDSCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_2138BA000, v5, OS_LOG_TYPE_DEFAULT, "Bag load timed out", v6, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      IMLogString();
  }
  -[CNFRegAccountWebViewController _stopBagLoadTimer](self, "_stopBagLoadTimer");
  -[CNFRegAccountWebViewController _stopListeningForBagLoad](self, "_stopListeningForBagLoad");
  -[CNFRegAccountWebViewController _showURLDidNotLoadAlert](self, "_showURLDidNotLoadAlert");

}

- (void)_startBagLoadTimer
{
  NSTimer *v3;
  NSTimer *bagLoadTimer;

  if (!self->_bagLoadTimer)
  {
    objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__bagLoadTimeout_, 0, 0, 15.0);
    v3 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    bagLoadTimer = self->_bagLoadTimer;
    self->_bagLoadTimer = v3;

  }
}

- (void)_stopBagLoadTimer
{
  NSTimer *bagLoadTimer;
  NSTimer *v4;

  bagLoadTimer = self->_bagLoadTimer;
  if (bagLoadTimer)
  {
    -[NSTimer invalidate](bagLoadTimer, "invalidate");
    v4 = self->_bagLoadTimer;
    self->_bagLoadTimer = 0;

  }
}

- (void)_handleFTServerBagFinishedLoading
{
  NSObject *v3;
  uint8_t v4[16];

  if (-[CNFRegServerWebViewController _shouldLog](self, "_shouldLog"))
  {
    OSLogHandleForIDSCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_2138BA000, v3, OS_LOG_TYPE_DEFAULT, "Server bag finished loading", v4, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      IMLogString();
  }
  if (-[CNFRegAccountWebViewController _loadURLFromBag](self, "_loadURLFromBag"))
  {
    -[CNFRegAccountWebViewController _stopListeningForBagLoad](self, "_stopListeningForBagLoad");
    -[CNFRegAccountWebViewController _stopBagLoadTimer](self, "_stopBagLoadTimer");
  }
  else
  {
    -[CNFRegAccountWebViewController _showURLDidNotLoadAlert](self, "_showURLDidNotLoadAlert");
  }
}

- (void)_startListeningForBagLoad
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  if (!self->_listeningForBagLoad)
  {
    if (-[CNFRegServerWebViewController _shouldLog](self, "_shouldLog"))
    {
      OSLogHandleForIDSCategory();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_2138BA000, v3, OS_LOG_TYPE_DEFAULT, "Started listening for bag load", v6, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (IMShouldLog())
          IMLogString();
      }
    }
    objc_msgSend(MEMORY[0x24BE30378], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__handleFTServerBagFinishedLoading, *MEMORY[0x24BE30320], v4);
    self->_listeningForBagLoad = 1;

  }
}

- (void)_stopListeningForBagLoad
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  if (self->_listeningForBagLoad)
  {
    if (-[CNFRegServerWebViewController _shouldLog](self, "_shouldLog"))
    {
      OSLogHandleForIDSCategory();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_2138BA000, v3, OS_LOG_TYPE_DEFAULT, "Stopped listening for bag load", v6, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (IMShouldLog())
          IMLogString();
      }
    }
    objc_msgSend(MEMORY[0x24BE30378], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x24BE30320], v4);
    self->_listeningForBagLoad = 0;

  }
}

- (void)_showGenericErrorWithHandler
{
  NSObject *v3;
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
  uint8_t v15[16];

  if (-[CNFRegServerWebViewController _shouldLog](self, "_shouldLog"))
  {
    OSLogHandleForIDSCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_2138BA000, v3, OS_LOG_TYPE_DEFAULT, "_showGenericErrorWithHandler", v15, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      IMLogString();
  }
  CommunicationsSetupUIBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegStringTableName();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("FACETIME_ACTIVATION_ERROR_TITLE"), &stru_24D077260, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  CommunicationsSetupUIBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegStringTableName();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("FACETIME_ACTIVATION_ERROR_GENERIC"), &stru_24D077260, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  CommunicationsSetupUIBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegStringTableName();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("FACETIME_ALERT_OK"), &stru_24D077260, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v6, v9, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", v12, 0, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addAction:", v14);

  -[CNFRegAccountWebViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v13, 1, 0);
}

- (id)_viewPortStringForSize:(CGSize)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ldx%ld"), (uint64_t)fabs(floor(a3.width)), (uint64_t)fabs(floor(a3.height)));
}

- (id)_nonModalParentController
{
  void *v2;
  id v3;

  -[CNFRegAccountWebViewController parentViewController](self, "parentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (id)_viewPortForFormSheetPresentation
{
  return -[CNFRegAccountWebViewController _viewPortStringForSize:](self, "_viewPortStringForSize:", 540.0, 576.0);
}

- (id)_viewPortForNormalPresentation
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  void *v16;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "userInterfaceIdiom");

  -[CNFRegAccountWebViewController _nonModalParentController](self, "_nonModalParentController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CNFRegAccountWebViewController navigationController](self, "navigationController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "navigationBar");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "defaultSizeForOrientation:", 1);
      v14 = v13;

      v7 = v7 - v14;
    }
  }
  if (v9 == 1)
    v15 = 320.0;
  else
    v15 = v5;
  -[CNFRegAccountWebViewController _viewPortStringForSize:](self, "_viewPortStringForSize:", v15, v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)viewPortHeaderValue
{
  CNFRegAccountWebViewController *v2;
  void *v3;
  void *v4;
  CNFRegAccountWebViewController *v5;
  void *v6;

  v2 = self;
  -[CNFRegAccountWebViewController _nonModalParentController](v2, "_nonModalParentController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = v2;
  if (v3)
  {
    v5 = v3;

  }
  if (-[CNFRegAccountWebViewController modalPresentationStyle](v5, "modalPresentationStyle") == 2)
    -[CNFRegAccountWebViewController _viewPortForFormSheetPresentation](v2, "_viewPortForFormSheetPresentation");
  else
    -[CNFRegAccountWebViewController _viewPortForNormalPresentation](v2, "_viewPortForNormalPresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)securityHeaderValue
{
  void *v2;

  v2 = (void *)CUTWeakLinkClass();
  if (v2)
  {
    objc_msgSend(v2, "appleIDClientIdentifier");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)pushTokenHeaderValue
{
  objc_class *v2;
  void **v3;
  void *v4;
  id v5;
  void *v6;

  v2 = (objc_class *)CUTWeakLinkClass();
  if (v2)
  {
    if (!pushTokenHeaderValue__APSEnvironmentProduction)
    {
      v3 = (void **)CUTWeakLinkSymbol();
      if (v3)
        v4 = *v3;
      else
        v4 = 0;
      objc_storeStrong((id *)&pushTokenHeaderValue__APSEnvironmentProduction, v4);
    }
    v5 = [v2 alloc];
    v6 = (void *)objc_msgSend(v5, "initWithEnvironmentName:queue:", pushTokenHeaderValue__APSEnvironmentProduction, MEMORY[0x24BDAC9B8]);
    objc_msgSend(v6, "publicToken");
    v2 = (objc_class *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (id)serviceHeaderValue
{
  void *v2;
  unint64_t v3;

  -[CNFRegServerWebViewController regController](self, "regController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "serviceType");

  if (v3 > 2)
    return 0;
  else
    return off_24D075EB8[v3];
}

- (id)interfaceLayoutHeaderValue
{
  const __CFString *v2;
  const __CFString *v3;

  if (interfaceLayoutHeaderValue_onceToken != -1)
    dispatch_once(&interfaceLayoutHeaderValue_onceToken, &__block_literal_global_8);
  if (interfaceLayoutHeaderValue_isInPreferences)
    v2 = CFSTR("k2-settings3");
  else
    v2 = CFSTR("k2-app3");
  v3 = CFSTR("p2-settings3");
  if (!interfaceLayoutHeaderValue_isInPreferences)
    v3 = CFSTR("p2-app3");
  if (interfaceLayoutHeaderValue_isAniPad)
    return (id)v2;
  else
    return (id)v3;
}

void __60__CNFRegAccountWebViewController_interfaceLayoutHeaderValue__block_invoke()
{
  __CFBundle *MainBundle;
  CFStringRef Identifier;
  BOOL v2;
  id v3;

  MainBundle = CFBundleGetMainBundle();
  Identifier = CFBundleGetIdentifier(MainBundle);
  if (Identifier)
    v2 = CFEqual(Identifier, CFSTR("com.apple.Preferences")) != 0;
  else
    v2 = 0;
  interfaceLayoutHeaderValue_isInPreferences = v2;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  interfaceLayoutHeaderValue_isAniPad = objc_msgSend(v3, "userInterfaceIdiom") == 1;

}

- (id)clientInfoHeaderValue
{
  if (clientInfoHeaderValue_once != -1)
    dispatch_once(&clientInfoHeaderValue_once, &__block_literal_global_162);
  return (id)clientInfoHeaderValue_clientInfo;
}

void __55__CNFRegAccountWebViewController_clientInfoHeaderValue__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;

  objc_msgSend(MEMORY[0x24BE30338], "sharedInstance");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  v0 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v22, "model");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("<%@> "), v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)clientInfoHeaderValue_clientInfo;
  clientInfoHeaderValue_clientInfo = v2;

  v4 = (void *)clientInfoHeaderValue_clientInfo;
  objc_msgSend(v22, "productName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "productVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "productBuildVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingFormat:", CFSTR("<%@;%@;%@> "), v5, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)clientInfoHeaderValue_clientInfo;
  clientInfoHeaderValue_clientInfo = v8;

  CommunicationsSetupUIBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "infoDictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "infoDictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = *MEMORY[0x24BDBD288];
  objc_msgSend(v11, "objectForKey:", *MEMORY[0x24BDBD288]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *MEMORY[0x24BDBD2A0];
  objc_msgSend(v11, "objectForKey:", *MEMORY[0x24BDBD2A0]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)clientInfoHeaderValue_clientInfo, "stringByAppendingFormat:", CFSTR("<%@/%@ (%@/%@)>"), v15, v17, v18, v19);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)clientInfoHeaderValue_clientInfo;
  clientInfoHeaderValue_clientInfo = v20;

}

- (id)bagKey
{
  -[CNFRegAccountWebViewController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void)cancelTapped
{
  -[CNFRegAccountWebViewController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)completeHandoffWithStatus:(int)a3 appleID:(id)a4 authID:(id)a5 authToken:(id)a6
{
  -[CNFRegAccountWebViewController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5, a6);
}

- (id)authIdHeaderValue
{
  return 0;
}

- (id)authTokenHeaderValue
{
  return 0;
}

- (BOOL)failedBagLoad
{
  return self->_failedBagLoad;
}

- (void)setFailedBagLoad:(BOOL)a3
{
  self->_failedBagLoad = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bagLoadTimer, 0);
}

@end

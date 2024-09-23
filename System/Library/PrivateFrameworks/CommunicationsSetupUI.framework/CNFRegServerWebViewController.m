@implementation CNFRegServerWebViewController

- (CNFRegServerWebViewController)initWithRegController:(id)a3
{
  id v4;
  CNFRegServerWebViewController *v5;
  CNFRegServerWebViewController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CNFRegServerWebViewController;
  v5 = -[CNFRegServerWebViewController init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[CNFRegServerWebViewController setRegController:](v5, "setRegController:", v4);

  return v6;
}

- (CNFRegServerWebViewController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CNFRegServerWebViewController.m"), 51, CFSTR("Do not directly instantiate a %@, use -initWithRegController: instead"), objc_opt_class());

  return 0;
}

- (void)loadView
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNFRegServerWebViewController;
  -[CNFRegServerWebViewController loadView](&v5, sel_loadView);
  -[CNFRegServerWebViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

}

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CNFRegServerWebViewController;
  -[CNFRegServerWebViewController viewDidLoad](&v2, sel_viewDidLoad);
}

- (void)viewDidUnload
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CNFRegServerWebViewController;
  -[CNFRegServerWebViewController viewDidUnload](&v2, sel_viewDidUnload);
}

- (void)dealloc
{
  objc_super v3;

  -[CNFRegServerWebViewController _stopTimeout](self, "_stopTimeout");
  -[RUILoader cancel](self->_loader, "cancel");
  -[RUILoader setDelegate:](self->_loader, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)CNFRegServerWebViewController;
  -[CNFRegServerWebViewController dealloc](&v3, sel_dealloc);
}

- (id)logName
{
  return CFSTR("Server");
}

- (BOOL)_shouldLog
{
  unsigned int webControllerFlags;
  int v4;

  webControllerFlags = self->_webControllerFlags;
  if ((webControllerFlags & 0x20) == 0)
  {
    if (objc_msgSend(MEMORY[0x24BDBCF50], "shouldShowCNFRegistrationServerLogs"))
      v4 = 96;
    else
      v4 = 32;
    webControllerFlags = v4 | *(_BYTE *)&self->_webControllerFlags & 0x9F;
    *(_BYTE *)&self->_webControllerFlags = webControllerFlags;
  }
  return (webControllerFlags >> 6) & 1;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNFRegServerWebViewController;
  -[CNFRegServerWebViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[CNFRegServerWebViewController startRequiringWifi](self, "startRequiringWifi");
}

- (void)viewDidAppear:(BOOL)a3
{
  int IsAutomaticAppearanceEnabled;
  char v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CNFRegServerWebViewController;
  -[CNFRegServerWebViewController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  IsAutomaticAppearanceEnabled = UIKeyboardIsAutomaticAppearanceEnabled();
  if (IsAutomaticAppearanceEnabled)
    v5 = 0;
  else
    v5 = 16;
  *(_BYTE *)&self->_webControllerFlags = *(_BYTE *)&self->_webControllerFlags & 0xEF | v5;
  if ((IsAutomaticAppearanceEnabled & 1) == 0)
    UIKeyboardEnableAutomaticAppearance();
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNFRegServerWebViewController;
  -[CNFRegServerWebViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  if ((*(_BYTE *)&self->_webControllerFlags & 0x10) != 0)
    UIKeyboardDisableAutomaticAppearance();
  -[CNFRegServerWebViewController _stopTimeout](self, "_stopTimeout");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNFRegServerWebViewController;
  -[CNFRegServerWebViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[CNFRegServerWebViewController stopRequiringWifi](self, "stopRequiringWifi");
}

- (void)startRequiringWifi
{
  void *v3;

  if ((*(_BYTE *)&self->_webControllerFlags & 0xC) == 4)
  {
    -[CNFRegServerWebViewController regController](self, "regController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "startRequiringWifi");

    *(_BYTE *)&self->_webControllerFlags |= 8u;
  }
}

- (void)stopRequiringWifi
{
  void *v3;

  if ((*(_BYTE *)&self->_webControllerFlags & 8) != 0)
  {
    -[CNFRegServerWebViewController regController](self, "regController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stopRequiringWifi");

    *(_BYTE *)&self->_webControllerFlags &= ~8u;
  }
}

- (void)showSpinner
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CNFRegLoadingView *loadingView;
  CNFRegLoadingView *v12;
  CNFRegLoadingView *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  -[CNFRegServerWebViewController view](self, "view");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bounds");
  v7 = v3;
  v8 = v4;
  v9 = v5;
  v10 = v6;
  loadingView = self->_loadingView;
  if (!loadingView)
  {
    v12 = -[CNFRegLoadingView initWithFrame:]([CNFRegLoadingView alloc], "initWithFrame:", v3, v4, v5, v6);
    v13 = self->_loadingView;
    self->_loadingView = v12;

    loadingView = self->_loadingView;
  }
  -[CNFRegLoadingView superview](loadingView, "superview");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFRegServerWebViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = v17;
  if (v14 != v15)
  {
    -[CNFRegLoadingView setFrame:](self->_loadingView, "setFrame:", v7, v8, v9, v10);
    objc_msgSend(v17, "addSubview:", self->_loadingView);
    v16 = v17;
  }

}

- (void)hideSpinner
{
  CNFRegLoadingView *loadingView;

  -[CNFRegLoadingView removeFromSuperview](self->_loadingView, "removeFromSuperview");
  loadingView = self->_loadingView;
  self->_loadingView = 0;

}

- (void)loadURL:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  RUILoader *v11;
  RUILoader *loader;
  NSObject *v13;
  NSObject *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[CNFRegServerWebViewController _shouldLog](self, "_shouldLog"))
  {
    OSLogHandleForIDSCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v4;
      _os_log_impl(&dword_2138BA000, v5, OS_LOG_TYPE_DEFAULT, "LoadURL: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      v15 = v4;
      IMLogString();
    }
  }
  if ((-[CNFRegServerWebViewController isViewLoaded](self, "isViewLoaded", v15) & 1) == 0)
    -[CNFRegServerWebViewController loadView](self, "loadView");
  -[CNFRegServerWebViewController showSpinner](self, "showSpinner");
  -[CNFRegServerWebViewController overrideURLForURL:](self, "overrideURLForURL:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 != v4 && -[CNFRegServerWebViewController _shouldLog](self, "_shouldLog"))
  {
    OSLogHandleForIDSCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v20 = v4;
      v21 = 2112;
      v22 = v6;
      _os_log_impl(&dword_2138BA000, v7, OS_LOG_TYPE_DEFAULT, "Overriding URL: {%@} => {%@}", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      v16 = v4;
      v18 = v6;
      IMLogString();
    }
  }
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16B0]), "initWithURL:cachePolicy:timeoutInterval:", v6, 1, 30.0);
  if (-[CNFRegServerWebViewController shouldSetHeadersForRequest:](self, "shouldSetHeadersForRequest:", v8))
    -[CNFRegServerWebViewController setHeadersForRequest:](self, "setHeadersForRequest:", v8);
  if (-[CNFRegServerWebViewController _shouldLog](self, "_shouldLog", v16, v18))
  {
    OSLogHandleForIDSCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "allHTTPHeaderFields");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v20 = v10;
      _os_log_impl(&dword_2138BA000, v9, OS_LOG_TYPE_DEFAULT, "Request headers : %@", buf, 0xCu);

    }
    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      objc_msgSend(v8, "allHTTPHeaderFields");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      IMLogString();

    }
  }
  if (-[CNFRegServerWebViewController canSendURLRequest:](self, "canSendURLRequest:", v8, v17))
  {
    objc_msgSend(v8, "setValue:forHTTPHeaderField:", CFSTR("Preferences"), CFSTR("User-Agent"));
    objc_msgSend(v8, "setValue:forHTTPHeaderField:", CFSTR("application/x-plist"), CFSTR("Content-Type"));
    v11 = (RUILoader *)objc_alloc_init(MEMORY[0x24BE7EDC8]);
    loader = self->_loader;
    self->_loader = v11;

    -[RUILoader setDelegate:](self->_loader, "setDelegate:", self);
    -[RUILoader loadXMLUIWithRequest:](self->_loader, "loadXMLUIWithRequest:", v8);
    if (-[CNFRegServerWebViewController _shouldLog](self, "_shouldLog"))
    {
      OSLogHandleForIDSCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2138BA000, v13, OS_LOG_TYPE_DEFAULT, "Finished loadingXMLUIWithRequest.", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
        IMLogString();
    }
  }
  else
  {
    if (-[CNFRegServerWebViewController _shouldLog](self, "_shouldLog"))
    {
      OSLogHandleForIDSCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2138BA000, v14, OS_LOG_TYPE_DEFAULT, "ERROR: Not allowed to send URL request, bailing", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
        IMLogString();
    }
    -[CNFRegServerWebViewController hideSpinner](self, "hideSpinner");
    *(_BYTE *)&self->_webControllerFlags &= 0xFCu;
    self->_webControllerFlags.timedOut = 1;
    -[CNFRegServerWebViewController _handleTimeout](self, "_handleTimeout");
  }

}

- (void)_cleanupLoader
{
  RUILoader *loader;

  -[RUILoader cancel](self->_loader, "cancel");
  -[RUILoader setDelegate:](self->_loader, "setDelegate:", 0);
  loader = self->_loader;
  self->_loader = 0;

}

- (void)_popObjectModelAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  id v14;
  unint64_t v15;
  id v16;

  v3 = a3;
  if (!-[NSMutableArray count](self->_objectModels, "count"))
    -[CNFRegServerWebViewController _popObjectModelAnimated:].cold.1();
  -[NSMutableArray lastObject](self->_objectModels, "lastObject");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "displayedPages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  v7 = v6 - 1;
  if (v6 >= 1)
  {
    do
    {
      objc_msgSend(v5, "objectAtIndex:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNFRegServerWebViewController navigationController](self, "navigationController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "topViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10 == v8)
      {
        -[CNFRegServerWebViewController navigationController](self, "navigationController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v7)
          v13 = 0;
        else
          v13 = v3;
        v14 = (id)objc_msgSend(v11, "popViewControllerAnimated:", v13);

      }
      v15 = v7-- + 1;
    }
    while (v15 > 1);
  }
  objc_msgSend(v16, "setDelegate:", 0);
  -[NSMutableArray removeLastObject](self->_objectModels, "removeLastObject");

}

- (id)parentViewControllerForObjectModel:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v9;
  void *v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[CNFRegServerWebViewController _shouldLog](self, "_shouldLog"))
  {
    OSLogHandleForIDSCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[CNFRegServerWebViewController navigationController](self, "navigationController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v12 = v4;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_2138BA000, v5, OS_LOG_TYPE_DEFAULT, "Asked for parentViewControllerForObjectModel %@  returned %@", buf, 0x16u);

    }
    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      -[CNFRegServerWebViewController navigationController](self, "navigationController");
      v9 = v4;
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      IMLogString();

    }
  }
  -[CNFRegServerWebViewController navigationController](self, "navigationController", v9, v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)objectModelPressedBack:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[CNFRegServerWebViewController _shouldLog](self, "_shouldLog"))
  {
    OSLogHandleForIDSCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v4;
      _os_log_impl(&dword_2138BA000, v5, OS_LOG_TYPE_DEFAULT, "objectModelPressedback: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      v9 = v4;
      IMLogString();
    }
  }
  -[CNFRegServerWebViewController _cleanupLoader](self, "_cleanupLoader", v9);
  -[NSMutableArray lastObject](self->_objectModels, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "goBack") & 1) == 0)
  {
    -[CNFRegServerWebViewController navigationController](self, "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v7, "popViewControllerAnimated:", 1);

    -[NSMutableArray removeLastObject](self->_objectModels, "removeLastObject");
  }

}

- (void)objectModelDidChange:(id)a3
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
      _os_log_impl(&dword_2138BA000, v5, OS_LOG_TYPE_DEFAULT, "objectModelDidChange", v6, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      IMLogString();
  }

}

- (void)cancelButtonPressed:(id)a3
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
      _os_log_impl(&dword_2138BA000, v5, OS_LOG_TYPE_DEFAULT, "Cancel pressed!", v6, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      IMLogString();
  }
  -[CNFRegServerWebViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)loader:(id)a3 receivedObjectModel:(id)a4 actionSignal:(unint64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSMutableArray *v11;
  NSMutableArray *objectModels;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  uint8_t buf[4];
  unint64_t v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if (-[CNFRegServerWebViewController _shouldLog](self, "_shouldLog"))
  {
    OSLogHandleForIDSCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v55 = a5;
      _os_log_impl(&dword_2138BA000, v10, OS_LOG_TYPE_DEFAULT, "loader received object model, actionsignal = %lu", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      v53 = (void *)a5;
      IMLogString();
    }
  }
  if (!self->_objectModels)
  {
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objectModels = self->_objectModels;
    self->_objectModels = v11;

    objc_msgSend(MEMORY[0x24BEBD788], "_setUseCustomBackButtonAction:", 1);
  }
  switch(a5)
  {
    case 1uLL:
      -[CNFRegServerWebViewController _cleanupLoader](self, "_cleanupLoader");
      -[CNFRegServerWebViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
      goto LABEL_41;
    case 2uLL:
    case 5uLL:
      objc_msgSend(v9, "setDelegate:", self);
      -[NSMutableArray addObject:](self->_objectModels, "addObject:", v9);
      -[CNFRegServerWebViewController navigationController](self, "navigationController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "presentInParentViewController:animated:", v13, 0);

      goto LABEL_40;
    case 3uLL:
      objc_msgSend(v9, "clientInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend(v9, "clientInfo");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKey:", CFSTR("status"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          objc_msgSend(v9, "clientInfo");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKey:", CFSTR("status"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "intValue");

        }
        else
        {
          v19 = 0xFFFFFFFFLL;
        }
        objc_msgSend(v9, "clientInfo", v53);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "objectForKey:", CFSTR("apple-id"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (v37)
        {
          objc_msgSend(v9, "clientInfo");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "objectForKey:", CFSTR("apple-id"));
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "stringByRemovingPercentEncoding");
          v40 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v40 = 0;
        }
        objc_msgSend(v9, "clientInfo");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "objectForKey:", CFSTR("profile-id"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        if (v42)
        {
          objc_msgSend(v9, "clientInfo");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "objectForKey:", CFSTR("profile-id"));
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "stringByRemovingPercentEncoding");
          v45 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v45 = 0;
        }
        objc_msgSend(v9, "clientInfo");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "objectForKey:", CFSTR("auth-token"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        if (v47)
        {
          objc_msgSend(v9, "clientInfo");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "objectForKey:", CFSTR("auth-token"));
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "stringByRemovingPercentEncoding");
          v50 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v50 = 0;
        }
        -[CNFRegServerWebViewController receivedStatus:appleID:authID:authToken:](self, "receivedStatus:appleID:authID:authToken:", v19, v40, v45, v50);
        if (-[CNFRegServerWebViewController _shouldLog](self, "_shouldLog"))
        {
          OSLogHandleForIDSCategory();
          v51 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v9, "clientInfo");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v55 = (unint64_t)v52;
            _os_log_impl(&dword_2138BA000, v51, OS_LOG_TYPE_DEFAULT, "Received clientInfo %@", buf, 0xCu);

          }
          if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
          {
            objc_msgSend(v9, "clientInfo");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            IMLogString();

          }
        }

      }
      else
      {
        if (-[NSMutableArray count](self->_objectModels, "count"))
          -[NSMutableArray removeLastObject](self->_objectModels, "removeLastObject");
        objc_msgSend(v9, "setDelegate:", self, v53);
        -[NSMutableArray addObject:](self->_objectModels, "addObject:", v9);
        if (-[NSMutableArray count](self->_objectModels, "count") == 1)
        {
          objc_msgSend(v9, "defaultPages");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectAtIndex:", 0);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          v22 = (void *)MEMORY[0x24BDBCE70];
          CommunicationsSetupUIBundle();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          CNFRegStringTableName();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("FACETIME_ALERT_CANCEL"), &stru_24D077260, v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "dictionaryWithObjectsAndKeys:", v25, CFSTR("label"), CFSTR("cancel"), CFSTR("name"), CFSTR("buttonBarItem"), CFSTR("type"), 0);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          v27 = objc_alloc_init(MEMORY[0x24BE7EDB0]);
          objc_msgSend(v27, "setAttributes:", v26);
          objc_msgSend(v21, "setLeftNavigationBarButtonItem:", v27);
          v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancelButtonPressed_);
          -[CNFRegServerWebViewController navigationController](self, "navigationController");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "navigationItem");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "setLeftBarButtonItem:", v28);

        }
        -[CNFRegServerWebViewController navigationController](self, "navigationController");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "presentInParentViewController:animated:", v31, 0);

        -[CNFRegServerWebViewController navigationController](self, "navigationController");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "viewControllers");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = (void *)objc_msgSend(v33, "mutableCopy");

        if ((unint64_t)objc_msgSend(v34, "count") >= 3)
          objc_msgSend(v34, "removeObjectAtIndex:", objc_msgSend(v34, "count") - 2);
        -[CNFRegServerWebViewController navigationController](self, "navigationController");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "setViewControllers:", v34);

      }
      goto LABEL_40;
    case 4uLL:
      -[CNFRegServerWebViewController _popObjectModelAnimated:](self, "_popObjectModelAnimated:", 1);
      goto LABEL_40;
    default:
LABEL_40:
      -[CNFRegServerWebViewController _cleanupLoader](self, "_cleanupLoader", v53);
LABEL_41:

      return;
  }
}

- (void)objectModel:(id)a3 pressedLink:(id)a4 httpMethod:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  RUILoader *v23;
  RUILoader *loader;
  NSObject *v25;
  id v26;
  void *v27;
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[CNFRegServerWebViewController _shouldLog](self, "_shouldLog"))
  {
    OSLogHandleForIDSCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v9;
      _os_log_impl(&dword_2138BA000, v11, OS_LOG_TYPE_DEFAULT, "objectModel:pressedLink: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      v26 = v9;
      IMLogString();
    }
  }
  if (!v9)
    goto LABEL_9;
  -[RUILoader URL](self->_loader, "URL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "absoluteURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "absoluteURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "isEqual:", v14);

  if ((v15 & 1) == 0)
  {
LABEL_9:
    -[CNFRegServerWebViewController _cleanupLoader](self, "_cleanupLoader", v26);
    objc_msgSend(v10, "lowercaseString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("post"));

    if (v17)
    {
      objc_msgSend(v8, "postbackData");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = 0;
    }
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16B0]), "initWithURL:cachePolicy:timeoutInterval:", v9, 1, 30.0);
    v20 = v19;
    if (v18)
    {
      objc_msgSend(v19, "setHTTPBody:", v18);
      objc_msgSend(v20, "setHTTPMethod:", CFSTR("POST"));
      objc_msgSend(v20, "setValue:forHTTPHeaderField:", CFSTR("application/x-plist"), CFSTR("Content-Type"));
    }
    if (-[CNFRegServerWebViewController shouldSetHeadersForRequest:](self, "shouldSetHeadersForRequest:", v20))
      -[CNFRegServerWebViewController setHeadersForRequest:](self, "setHeadersForRequest:", v20);
    if (-[CNFRegServerWebViewController _shouldLog](self, "_shouldLog"))
    {
      OSLogHandleForIDSCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v20, "allHTTPHeaderFields");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v29 = v22;
        _os_log_impl(&dword_2138BA000, v21, OS_LOG_TYPE_DEFAULT, "Request headers : %@", buf, 0xCu);

      }
      if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      {
        objc_msgSend(v20, "allHTTPHeaderFields");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        IMLogString();

      }
    }
    if (-[CNFRegServerWebViewController canSendURLRequest:](self, "canSendURLRequest:", v20, v27))
    {
      objc_msgSend(v20, "setValue:forHTTPHeaderField:", CFSTR("Preferences"), CFSTR("User-Agent"));
      v23 = (RUILoader *)objc_alloc_init(MEMORY[0x24BE7EDC8]);
      loader = self->_loader;
      self->_loader = v23;

      -[RUILoader setDelegate:](self->_loader, "setDelegate:", self);
      -[RUILoader loadXMLUIWithRequest:](self->_loader, "loadXMLUIWithRequest:", v20);
      if (-[CNFRegServerWebViewController _shouldLog](self, "_shouldLog"))
      {
        OSLogHandleForIDSCategory();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2138BA000, v25, OS_LOG_TYPE_DEFAULT, "Finished loadingXMLUIWithRequest.", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
          IMLogString();
      }
    }

  }
}

- (void)objectModel:(id)a3 pressedButton:(id)a4 attributes:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[CNFRegServerWebViewController _shouldLog](self, "_shouldLog"))
  {
    OSLogHandleForIDSCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v18 = v9;
      v19 = 2112;
      v20 = v10;
      _os_log_impl(&dword_2138BA000, v11, OS_LOG_TYPE_DEFAULT, "objectModel:pressedButton: %@ attributes: %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      v15 = v9;
      v16 = v10;
      IMLogString();
    }
  }
  if (objc_msgSend(v9, "isEqual:", CFSTR("cancel"), v15, v16))
  {
    -[CNFRegServerWebViewController cancelButtonPressed:](self, "cancelButtonPressed:", 0);
  }
  else
  {
    objc_msgSend(v10, "objectForKey:", CFSTR("url"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "length"))
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "openURL:withCompletionHandler:", v13, 0);

    }
  }

}

- (void)loader:(id)a3 didFailWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (-[CNFRegServerWebViewController _shouldLog](self, "_shouldLog"))
  {
    OSLogHandleForIDSCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v7;
      _os_log_impl(&dword_2138BA000, v8, OS_LOG_TYPE_DEFAULT, "Loader reported Error %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      v9 = v7;
      IMLogString();
    }
  }
  -[CNFRegServerWebViewController _cleanupLoader](self, "_cleanupLoader", v9);

}

- (void)receivedStatus:(int)a3 appleID:(id)a4 authID:(id)a5 authToken:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  uint8_t buf[4];
  CNFRegServerWebViewController *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = a5;
  v11 = a6;
  if (-[CNFRegServerWebViewController _shouldLog](self, "_shouldLog"))
  {
    OSLogHandleForIDSCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = self;
      _os_log_impl(&dword_2138BA000, v12, OS_LOG_TYPE_DEFAULT, "Received status - this should be overridden by a subclass! I'm a %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      IMLogString();
  }

}

- (id)overrideURLForURL:(id)a3
{
  return a3;
}

- (BOOL)shouldSetHeadersForRequest:(id)a3
{
  return 0;
}

- (BOOL)canSendURLRequest:(id)a3
{
  return 1;
}

- (void)_startTimeoutWithDuration:(double)a3
{
  NSObject *v5;
  NSTimer *v6;
  NSTimer *timeoutTimer;
  double v8;
  uint8_t buf[4];
  double v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (!self->_timeoutTimer)
  {
    if (-[CNFRegServerWebViewController _shouldLog](self, "_shouldLog"))
    {
      OSLogHandleForIDSCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v10 = a3;
        _os_log_impl(&dword_2138BA000, v5, OS_LOG_TYPE_DEFAULT, "Starting timeout timer with duration %0.2f", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (IMShouldLog())
        {
          v8 = a3;
          IMLogString();
        }
      }
    }
    self->_webControllerFlags.timedOut = 0;
    objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__timeoutFired_, 0, 0, a3, *(_QWORD *)&v8);
    v6 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    timeoutTimer = self->_timeoutTimer;
    self->_timeoutTimer = v6;

  }
}

- (void)_stopTimeout
{
  NSObject *v3;
  NSTimer *timeoutTimer;
  uint8_t v5[16];

  if (self->_timeoutTimer)
  {
    if (-[CNFRegServerWebViewController _shouldLog](self, "_shouldLog"))
    {
      OSLogHandleForIDSCategory();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_2138BA000, v3, OS_LOG_TYPE_DEFAULT, "Stopping timeout timer", v5, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (IMShouldLog())
          IMLogString();
      }
    }
    -[NSTimer invalidate](self->_timeoutTimer, "invalidate");
    timeoutTimer = self->_timeoutTimer;
    self->_timeoutTimer = 0;

  }
}

- (void)_timeoutFired:(id)a3
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
      _os_log_impl(&dword_2138BA000, v5, OS_LOG_TYPE_DEFAULT, "Timeout timer fired", v6, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      IMLogString();
  }
  -[CNFRegServerWebViewController _stopTimeout](self, "_stopTimeout");
  self->_webControllerFlags.timedOut = 1;
  -[CNFRegServerWebViewController _handleTimeout](self, "_handleTimeout");

}

- (void)applicationWillSuspend
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNFRegServerWebViewController;
  -[CNFRegServerWebViewController applicationWillSuspend](&v3, sel_applicationWillSuspend);
  -[CNFRegServerWebViewController _stopTimeout](self, "_stopTimeout");
  -[CNFRegServerWebViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, 0);
}

- (BOOL)isLoaded
{
  return (*(_BYTE *)&self->_webControllerFlags >> 1) & 1;
}

- (BOOL)isLoading
{
  return *(_BYTE *)&self->_webControllerFlags & 1;
}

- (BOOL)timedOut
{
  return self->_webControllerFlags.timedOut != 0;
}

- (CNFRegController)regController
{
  return self->_regController;
}

- (void)setRegController:(id)a3
{
  objc_storeStrong((id *)&self->_regController, a3);
}

- (UIWebView)webView
{
  return self->_webView;
}

- (void)setWebView:(id)a3
{
  objc_storeStrong((id *)&self->_webView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_objectModels, 0);
  objc_storeStrong((id *)&self->_loader, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_loadingView, 0);
  objc_storeStrong((id *)&self->_regController, 0);
}

- (void)_popObjectModelAnimated:.cold.1()
{
  __assert_rtn("-[CNFRegServerWebViewController _popObjectModelAnimated:]", "CNFRegServerWebViewController.m", 234, "0");
}

@end

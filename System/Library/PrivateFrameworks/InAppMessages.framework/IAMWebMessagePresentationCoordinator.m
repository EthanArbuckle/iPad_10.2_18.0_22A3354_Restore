@implementation IAMWebMessagePresentationCoordinator

- (IAMWebMessagePresentationCoordinator)initWithWebMessageEntry:(id)a3 webArchiveURL:(id)a4
{
  id v7;
  id v8;
  IAMWebMessagePresentationCoordinator *v9;
  IAMWebMessagePresentationCoordinator *v10;
  uint64_t v11;
  NSURL *webArchiveURL;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IAMWebMessagePresentationCoordinator;
  v9 = -[IAMWebMessagePresentationCoordinator init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_webMessageEntry, a3);
    v11 = objc_msgSend(v8, "copy");
    webArchiveURL = v10->_webArchiveURL;
    v10->_webArchiveURL = (NSURL *)v11;

    v10->_isPresenting = 0;
  }

  return v10;
}

- (id)presentingViewController
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[IAMWebMessagePresentationCoordinator delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[IAMWebMessagePresentationCoordinator delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "viewControllerForModalPresentationUsingCoordinator:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)load
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSURL *webArchiveURL;
  _QWORD v8[5];

  v3 = (void *)objc_opt_new();
  -[IAMWebMessagePresentationCoordinator setWebMessageController:](self, "setWebMessageController:", v3);

  -[IAMWebMessagePresentationCoordinator webMessageController](self, "webMessageController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", self);

  -[IAMWebMessagePresentationCoordinator webMessageController](self, "webMessageController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IAMWebMessagePresentationCoordinator webMessageEntry](self, "webMessageEntry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  webArchiveURL = self->_webArchiveURL;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __44__IAMWebMessagePresentationCoordinator_load__block_invoke;
  v8[3] = &unk_24C871020;
  v8[4] = self;
  objc_msgSend(v5, "loadMessageFromMessageEntry:withWebArchiveURL:completionHandler:", v6, webArchiveURL, v8);

}

void __44__IAMWebMessagePresentationCoordinator_load__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
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
  char v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  IAMLogCategoryDefault();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "webMessageEntry");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "applicationMessage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "absoluteString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543874;
      v18 = v8;
      v19 = 2114;
      v20 = v9;
      v21 = 2114;
      v22 = v3;
      _os_log_impl(&dword_20DD38000, v5, OS_LOG_TYPE_ERROR, "WebView for message identifier = %{public}@ - webArchiveURL = %{public}@, did fail navigation with error = %{public}@", (uint8_t *)&v17, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "webMessagePresentationCoordinatorWebMessageDidFail:", *(_QWORD *)(a1 + 32));
    goto LABEL_9;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "webMessageEntry");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "applicationMessage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "absoluteString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543618;
    v18 = v13;
    v19 = 2114;
    v20 = v14;
    _os_log_impl(&dword_20DD38000, v5, OS_LOG_TYPE_DEFAULT, "WebView for message identifier = %{public}@, did load with webArchiveURL = %{public}@", (uint8_t *)&v17, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_opt_respondsToSelector();

  if ((v16 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "webMessagePresentationCoordinatorWebMessageDidLoad:", *(_QWORD *)(a1 + 32));
LABEL_9:

  }
}

- (BOOL)present
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  const char *v10;
  BOOL v11;
  IAMModalWebMessageViewController *v12;
  void *v13;
  void *v14;
  IAMModalWebMessageViewController *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  -[IAMWebMessagePresentationCoordinator presentingViewController](self, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    IAMLogCategoryDefault();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      -[IAMWebMessagePresentationCoordinator webMessageEntry](self, "webMessageEntry");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "applicationMessage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v26 = v9;
      v10 = "Presenting View Controller or presentation method not provided for message with identifier = %@";
      goto LABEL_7;
    }
LABEL_8:

    -[IAMWebMessagePresentationCoordinator setIsPresenting:](self, "setIsPresenting:", 0);
    v11 = 0;
    goto LABEL_12;
  }
  objc_msgSend(v3, "presentedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    IAMLogCategoryDefault();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      -[IAMWebMessagePresentationCoordinator webMessageEntry](self, "webMessageEntry");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "applicationMessage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v26 = v9;
      v10 = "Presenting View Controller is already presenting another View Controller = %@";
LABEL_7:
      _os_log_impl(&dword_20DD38000, v6, OS_LOG_TYPE_ERROR, v10, buf, 0xCu);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  v12 = [IAMModalWebMessageViewController alloc];
  -[IAMWebMessagePresentationCoordinator webMessageController](self, "webMessageController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "webView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[IAMModalWebMessageViewController initWithWebView:](v12, "initWithWebView:", v14);

  -[ICInAppMessageEntry applicationMessage](self->_webMessageEntry, "applicationMessage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[IAMModalWebMessageViewController setShouldDisplayCloseButton:](v15, "setShouldDisplayCloseButton:", objc_msgSend(v16, "hasCloseButton"));
  -[IAMModalWebMessageViewController setMetricsDelegate:](v15, "setMetricsDelegate:", self);
  v17 = (void *)objc_opt_new();
  objc_msgSend(v17, "setShouldPresentFullscreen:", objc_msgSend(v16, "modalPresentationStyle") == 1);
  objc_msgSend(v17, "setMetricsDelegate:", self);
  objc_msgSend(v17, "setContentViewController:", v15);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setModalPresentationCapturesStatusBarAppearance:", 1);
  objc_msgSend(v4, "presentViewController:animated:completion:", v17, 1, 0);
  objc_msgSend(v18, "addObserver:selector:name:object:", self, sel__modalViewControllerDismissalTransitionDidEnd_, *MEMORY[0x24BDF7C70], v17);
  IAMLogCategoryDefault();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    -[IAMWebMessagePresentationCoordinator webMessageEntry](self, "webMessageEntry");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "applicationMessage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSURL absoluteString](self->_webArchiveURL, "absoluteString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v26 = v21;
    v27 = 2114;
    v28 = v22;
    _os_log_impl(&dword_20DD38000, v19, OS_LOG_TYPE_DEFAULT, "WebView for message identifier = %{public}@, did present with webArchiveURL = %{public}@", buf, 0x16u);

  }
  v11 = 1;
  -[IAMWebMessagePresentationCoordinator setIsPresenting:](self, "setIsPresenting:", 1);

LABEL_12:
  return v11;
}

- (void)_modalViewControllerDismissalTransitionDidEnd:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BDF7C68]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *MEMORY[0x24BDF7C70];
    objc_msgSend(v10, "object");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObserver:name:object:", self, v8, v9);

    -[IAMWebMessagePresentationCoordinator _handleWebMessageDismissed](self, "_handleWebMessageDismissed");
  }

}

- (void)_handleWebMessageDismissed
{
  void (**modalViewControllerDismissedCompletion)(id, SEL);
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  modalViewControllerDismissedCompletion = (void (**)(id, SEL))self->_modalViewControllerDismissedCompletion;
  if (modalViewControllerDismissedCompletion)
  {
    modalViewControllerDismissedCompletion[2](modalViewControllerDismissedCompletion, a2);
    v4 = self->_modalViewControllerDismissedCompletion;
    self->_modalViewControllerDismissedCompletion = 0;

  }
  -[IAMWebMessagePresentationCoordinator webMessageController](self, "webMessageController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unregisterExportedObjectInterface");

  -[IAMWebMessagePresentationCoordinator webMessageController](self, "webMessageController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", 0);

  -[IAMWebMessagePresentationCoordinator setWebMessageController:](self, "setWebMessageController:", 0);
  IAMLogCategoryDefault();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[IAMWebMessagePresentationCoordinator webMessageEntry](self, "webMessageEntry");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "applicationMessage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543362;
    v15 = v10;
    _os_log_impl(&dword_20DD38000, v7, OS_LOG_TYPE_DEFAULT, "WebView for message identifier = %{public}@, did finish presentation.", (uint8_t *)&v14, 0xCu);

  }
  -[IAMWebMessagePresentationCoordinator delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    -[IAMWebMessagePresentationCoordinator delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "webMessagePresentationCoordinatorWebMessageDidFinishPresentation:", self);

  }
}

- (void)_handleOpenURL:(id)a3
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "canOpenURL:", v3))
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __55__IAMWebMessagePresentationCoordinator__handleOpenURL___block_invoke;
    v5[3] = &unk_24C871048;
    v6 = v3;
    objc_msgSend(v4, "openURL:options:completionHandler:", v6, MEMORY[0x24BDBD1B8], v5);

  }
}

void __55__IAMWebMessagePresentationCoordinator__handleOpenURL___block_invoke(uint64_t a1, char a2)
{
  NSObject *v4;
  NSObject *v5;
  void *v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  IAMLogCategoryDefault();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((a2 & 1) != 0)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "absoluteString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v6;
      v7 = "Did open URL = %{public}@";
      v8 = v5;
      v9 = OS_LOG_TYPE_DEFAULT;
LABEL_6:
      _os_log_impl(&dword_20DD38000, v8, v9, v7, (uint8_t *)&v10, 0xCu);

    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "absoluteString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v6;
    v7 = "Unable to open URL = %{public}@";
    v8 = v5;
    v9 = OS_LOG_TYPE_ERROR;
    goto LABEL_6;
  }

}

- (void)_dismissModalViewController:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id modalViewControllerDismissedCompletion;
  void *v9;
  uint8_t v10[16];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (self->_modalViewControllerDismissedCompletion)
    {
      IAMLogCategoryDefault();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_20DD38000, v6, OS_LOG_TYPE_ERROR, "Web modal dismissed with more than one completion handler.", v10, 2u);
      }

    }
    else
    {
      v7 = (void *)MEMORY[0x212BB42FC](v4);
      modalViewControllerDismissedCompletion = self->_modalViewControllerDismissedCompletion;
      self->_modalViewControllerDismissedCompletion = v7;

    }
  }
  -[IAMWebMessagePresentationCoordinator presentingViewController](self, "presentingViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)webMessageControllerWebViewDidRequestClose:(id)a3
{
  -[IAMWebMessagePresentationCoordinator _dismissModalViewController:](self, "_dismissModalViewController:", 0);
}

- (void)webMessageControllerWebViewDidReportEvent:(id)a3 event:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a4;
  -[IAMWebMessagePresentationCoordinator delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[IAMWebMessagePresentationCoordinator delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "webMessagePresentationCoordinatorWebMessageDidReportEvent:event:", self, v8);

  }
}

- (void)webMessageControllerWebViewDidRequestOpenURL:(id)a3 url:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[IAMWebMessagePresentationCoordinator presentingViewController](self, "presentingViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11
    && v10
    && (objc_msgSend(v10, "objectForKey:", *MEMORY[0x24BE51BD8]),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "BOOLValue"),
        v12,
        v13))
  {
    objc_initWeak(&location, self);
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __97__IAMWebMessagePresentationCoordinator_webMessageControllerWebViewDidRequestOpenURL_url_options___block_invoke;
    v14[3] = &unk_24C871070;
    objc_copyWeak(&v16, &location);
    v15 = v9;
    -[IAMWebMessagePresentationCoordinator _dismissModalViewController:](self, "_dismissModalViewController:", v14);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    -[IAMWebMessagePresentationCoordinator _handleOpenURL:](self, "_handleOpenURL:", v9);
  }

}

void __97__IAMWebMessagePresentationCoordinator_webMessageControllerWebViewDidRequestOpenURL_url_options___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleOpenURL:", *(_QWORD *)(a1 + 32));

}

- (void)webMessageControllerWebViewDidRequestAction:(id)a3 actionConfiguration:(id)a4 options:(id)a5
{
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;

  v7 = a4;
  v8 = a5;
  -[IAMWebMessagePresentationCoordinator delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  -[IAMWebMessagePresentationCoordinator presentingViewController](self, "presentingViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v8 && v11)
  {
    objc_msgSend(v8, "objectForKey:", *MEMORY[0x24BE51BE0]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "BOOLValue");

    if (v14)
    {
      if ((v10 & 1) != 0)
      {
        objc_initWeak(&location, self);
        v16[0] = MEMORY[0x24BDAC760];
        v16[1] = 3221225472;
        v16[2] = __112__IAMWebMessagePresentationCoordinator_webMessageControllerWebViewDidRequestAction_actionConfiguration_options___block_invoke;
        v16[3] = &unk_24C871070;
        objc_copyWeak(&v18, &location);
        v17 = v7;
        v15 = (void *)MEMORY[0x212BB42FC](v16);

        objc_destroyWeak(&v18);
        objc_destroyWeak(&location);
      }
      else
      {
        v15 = 0;
      }
      -[IAMWebMessagePresentationCoordinator _dismissModalViewController:](self, "_dismissModalViewController:", v15);
      goto LABEL_11;
    }
  }
  else
  {

  }
  if ((v10 & 1) != 0)
  {
    -[IAMWebMessagePresentationCoordinator delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "webMessagePresentationCoordinatorWebMessageDidRequestAction:actionConfiguration:", self, v7);
LABEL_11:

  }
}

void __112__IAMWebMessagePresentationCoordinator_webMessageControllerWebViewDidRequestAction_actionConfiguration_options___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "webMessagePresentationCoordinatorWebMessageDidRequestAction:actionConfiguration:", WeakRetained, *(_QWORD *)(a1 + 32));

}

- (void)viewController:(id)a3 didReportDismissalAction:(int64_t)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  id v17;

  -[IAMWebMessagePresentationCoordinator webMessageEntry](self, "webMessageEntry", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applicationMessage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "contentPagesCount");

  if (v8)
  {
    -[IAMWebMessagePresentationCoordinator webMessageEntry](self, "webMessageEntry");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "applicationMessage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "contentPagesAtIndex:", 0);
    v17 = (id)objc_claimAutoreleasedReturnValue();

    if (a4 == 1)
    {
      if (objc_msgSend(v17, "hasCardClickEvent"))
      {
        objc_msgSend(v17, "cardClickEvent");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
        v13 = v12;
        objc_msgSend(v12, "reportableDictionary");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          -[IAMWebMessagePresentationCoordinator delegate](self, "delegate");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_opt_respondsToSelector();

          if ((v15 & 1) != 0)
          {
            -[IAMWebMessagePresentationCoordinator delegate](self, "delegate");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "webMessagePresentationCoordinatorWebMessageDidReportEvent:event:", self, v11);

          }
        }
        goto LABEL_13;
      }
    }
    else
    {
      v11 = 0;
      if (a4)
      {
LABEL_13:

        return;
      }
      if (objc_msgSend(v17, "hasCloseClickEvent"))
      {
        objc_msgSend(v17, "closeClickEvent");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      }
    }
    v11 = 0;
    goto LABEL_13;
  }
}

- (IAMWebMessagePresentationCoordinatorDelegate)delegate
{
  return (IAMWebMessagePresentationCoordinatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isPresenting
{
  return self->_isPresenting;
}

- (void)setIsPresenting:(BOOL)a3
{
  self->_isPresenting = a3;
}

- (IAMWebMessageController)webMessageController
{
  return self->_webMessageController;
}

- (void)setWebMessageController:(id)a3
{
  objc_storeStrong((id *)&self->_webMessageController, a3);
}

- (ICInAppMessageEntry)webMessageEntry
{
  return self->_webMessageEntry;
}

- (void)setWebMessageEntry:(id)a3
{
  objc_storeStrong((id *)&self->_webMessageEntry, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webMessageEntry, 0);
  objc_storeStrong((id *)&self->_webMessageController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_modalViewControllerDismissedCompletion, 0);
  objc_storeStrong((id *)&self->_webArchiveURL, 0);
}

@end

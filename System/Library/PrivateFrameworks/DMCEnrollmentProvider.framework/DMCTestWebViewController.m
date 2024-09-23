@implementation DMCTestWebViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)DMCTestWebViewController;
  -[DMCTestWebViewController viewDidLoad](&v23, sel_viewDidLoad);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancelButtonTapped);
  -[DMCTestWebViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLeftBarButtonItem:", v3);

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("REMOTE_MANAGEMENT_TITLE"), &stru_24D52F990, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCTestWebViewController setTitle:](self, "setTitle:", v6);

  v7 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDFA928], "nonPersistentDataStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWebsiteDataStore:", v8);

  objc_msgSend(v7, "preferences");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_setDiagnosticLoggingEnabled:", 1);

  v10 = objc_alloc(MEMORY[0x24BDFA918]);
  v11 = (void *)objc_msgSend(v10, "initWithFrame:configuration:", v7, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[DMCTestWebViewController setView:](self, "setView:", v11);
  -[DMCTestWebViewController setWebView:](self, "setWebView:", v11);
  -[DMCTestWebViewController webView](self, "webView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setUIDelegate:", self);

  -[DMCTestWebViewController webView](self, "webView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setNavigationDelegate:", self);

  -[DMCTestWebViewController webView](self, "webView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "configuration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "processPool");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_setDownloadDelegate:", self);

  v17 = objc_alloc(MEMORY[0x24BDD16B0]);
  -[DMCTestWebViewController webURL](self, "webURL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v17, "initWithURL:", v18);

  -[DMCTestWebViewController _getEncodedMachineInfo](self, "_getEncodedMachineInfo");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setValue:forHTTPHeaderField:", v20, CFSTR("x-apple-aspen-deviceinfo"));

  -[DMCTestWebViewController webView](self, "webView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (id)objc_msgSend(v21, "loadRequest:", v19);

}

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint8_t buf[16];

  v6 = a5;
  objc_msgSend(v6, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BEC27A8]))
  {

LABEL_6:
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("REMOTE_MANAGEMENT_FAILED_TO_LOAD_PAGE"), &stru_24D52F990, CFSTR("Localizable"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "domain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BDD1308]))
    {
      v13 = objc_msgSend(v6, "code");

      if (v13 == -1003)
      {
        objc_msgSend(v6, "userInfo");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x24BDD1310]);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "host");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("REMOTE_MANAGEMENT_UNABLE_TO_RESOLVE_HOST"), &stru_24D52F990, CFSTR("Localizable"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "localizedStringWithFormat:", v19, v16);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        -[DMCTestWebViewController _showFailureAlertWithTitle:andMessage:](self, "_showFailureAlertWithTitle:andMessage:", v11, v20);
LABEL_11:

        goto LABEL_12;
      }
    }
    else
    {

    }
    objc_msgSend(v6, "description");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCTestWebViewController _showFailureAlertWithTitle:andMessage:](self, "_showFailureAlertWithTitle:andMessage:", v11, v15);
    goto LABEL_11;
  }
  v8 = objc_msgSend(v6, "code");

  if (v8 != 102)
    goto LABEL_6;
  v9 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_216358000, v9, OS_LOG_TYPE_DEFAULT, "Suppressing web navigation error caused by policy change", buf, 2u);
  }
LABEL_12:

}

- (void)webView:(id)a3 decidePolicyForNavigationResponse:(id)a4 decisionHandler:(id)a5
{
  void (**v7)(id, _QWORD);
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  uint8_t v18[16];
  uint8_t v19[16];
  uint8_t buf[16];

  v7 = (void (**)(id, _QWORD))a5;
  objc_msgSend(a4, "response");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "MIMEType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("application/x-apple-aspen-config"));

  if (v10)
  {
    -[DMCTestWebViewController webURL](self, "webURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "host");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "URL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "host");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "caseInsensitiveCompare:", v14))
    {
      v15 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_216358000, v15, OS_LOG_TYPE_ERROR, "domain of download does not match domain of initial URL from cloud config!", buf, 2u);
      }
      v7[2](v7, 0);
    }
    else
    {
      v7[2](v7, 2);
    }

  }
  else if (objc_msgSend(v8, "statusCode") == 404)
  {
    v16 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_216358000, v16, OS_LOG_TYPE_ERROR, "recieved 404 response from website!", v19, 2u);
    }
    v7[2](v7, 0);
  }
  else
  {
    v7[2](v7, 1);
    v17 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_216358000, v17, OS_LOG_TYPE_ERROR, "did not recieve download response!", v18, 2u);
    }
  }

}

- (void)webView:(id)a3 didReceiveAuthenticationChallenge:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  uint8_t v10[16];

  v7 = a5;
  v8 = a4;
  v9 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_216358000, v9, OS_LOG_TYPE_DEFAULT, "webview didReceiveAuthenticationChallenge", v10, 2u);
  }
  -[DMCTestWebViewController evaluateAuthenticationChallenge:withCompletionHandler:](self, "evaluateAuthenticationChallenge:withCompletionHandler:", v8, v7);

}

- (void)_downloadDidStart:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_216358000, v3, OS_LOG_TYPE_DEFAULT, "download did Start!", v4, 2u);
  }
}

- (void)_download:(id)a3 decideDestinationWithSuggestedFilename:(id)a4 completionHandler:(id)a5
{
  void *v6;
  void (**v7)(id, uint64_t, id);
  id v8;

  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = (void (**)(id, uint64_t, id))a5;
  objc_msgSend(v6, "stringWithFormat:", CFSTR("/tmp/%@"), a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v7[2](v7, 1, v8);

}

- (void)_download:(id)a3 didFailWithError:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v9 = 138412290;
    v10 = v5;
    _os_log_impl(&dword_216358000, v6, OS_LOG_TYPE_ERROR, "download failed with error from WKDownload!: %@", (uint8_t *)&v9, 0xCu);
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("BYCloudConfigRetreiveProfileFromWebErrorDomain"), -2, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCTestWebViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "webAuthCanceled:", v7);

}

- (void)_downloadDidCancel:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  v4 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_216358000, v4, OS_LOG_TYPE_ERROR, "download canceled! ", v7, 2u);
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("BYCloudConfigRetreiveProfileFromWebErrorDomain"), -3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCTestWebViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "webAuthCanceled:", v5);

}

- (void)_download:(id)a3 didCreateDestination:(id)a4
{
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  v5 = a4;
  v6 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_216358000, v6, OS_LOG_TYPE_DEFAULT, "download did create destination", v7, 2u);
  }
  -[DMCTestWebViewController setDownloadDestination:](self, "setDownloadDestination:", v5);

}

- (void)_downloadDidFinish:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDBCE50];
  -[DMCTestWebViewController downloadDestination](self, "downloadDestination", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataWithContentsOfFile:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCTestWebViewController setDownloadedProfileData:](self, "setDownloadedProfileData:", v6);

  v7 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)MEMORY[0x24BDD17C8];
    v9 = v7;
    -[DMCTestWebViewController downloadedProfileData](self, "downloadedProfileData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v10, "length"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v18 = v11;
    _os_log_impl(&dword_216358000, v9, OS_LOG_TYPE_DEFAULT, "we downloaded a profile with data length of %@!", buf, 0xCu);

  }
  -[DMCTestWebViewController webView](self, "webView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stopLoading");

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCTestWebViewController downloadDestination](self, "downloadDestination");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeItemAtPath:error:", v14, 0);

  -[DMCTestWebViewController delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCTestWebViewController downloadedProfileData](self, "downloadedProfileData");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "recievedProfile:", v16);

}

- (void)_downloadProcessDidCrash:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  v4 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_216358000, v4, OS_LOG_TYPE_ERROR, "the download process crashed!", v7, 2u);
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("BYCloudConfigRetreiveProfileFromWebErrorDomain"), -4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCTestWebViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "webAuthCanceled:", v5);

}

- (void)_download:(id)a3 didReceiveAuthenticationChallenge:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  uint8_t v10[16];

  v7 = a5;
  v8 = a4;
  v9 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_216358000, v9, OS_LOG_TYPE_DEFAULT, "wkdownload didReceiveAuthenticationChallenge", v10, 2u);
  }
  -[DMCTestWebViewController evaluateAuthenticationChallenge:withCompletionHandler:](self, "evaluateAuthenticationChallenge:withCompletionHandler:", v8, v7);

}

- (id)_getEncodedMachineInfo
{
  void *v2;
  void *v3;

  -[DMCTestWebViewController machineInfo](self, "machineInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "base64EncodedStringWithOptions:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)cancelButtonTapped
{
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint8_t buf[16];

  -[DMCTestWebViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("BYCloudConfigRetreiveProfileFromWebErrorDomain"), -1, 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[DMCTestWebViewController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "webAuthCanceled:", v6);

  }
  else
  {
    v5 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_216358000, v5, OS_LOG_TYPE_ERROR, "no delegate defined for buddy web auth!", buf, 2u);
    }
  }
}

- (void)_showFailureAlertWithTitle:(id)a3 andMessage:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v16 = v6;
    v17 = 2112;
    v18 = v7;
    _os_log_impl(&dword_216358000, v8, OS_LOG_TYPE_DEFAULT, "Showing failure alert title: %@, message: %@", buf, 0x16u);
  }
  objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", v6, v7, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDF67E8];
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_24D52F990, CFSTR("Localizable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __66__DMCTestWebViewController__showFailureAlertWithTitle_andMessage___block_invoke;
  v14[3] = &unk_24D52EF50;
  v14[4] = self;
  objc_msgSend(v10, "actionWithTitle:style:handler:", v12, 1, v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:", v13);

  -[DMCTestWebViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);
}

void __66__DMCTestWebViewController__showFailureAlertWithTitle_andMessage___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("BYCloudConfigRetreiveProfileFromWebErrorDomain"), -5, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "webAuthCanceled:", v3);

}

- (void)evaluateAuthenticationChallenge:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, void *);
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSArray *anchorCerts;
  NSObject *v15;
  void *v16;
  OSStatus v17;
  NSObject *v18;
  void *v19;
  int v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  int v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, void *))a4;
  objc_msgSend(v6, "protectionSpace");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "authenticationMethod");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BDD12F8]);

  if (v10)
  {
    objc_msgSend(v6, "protectionSpace");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "host");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      anchorCerts = self->_anchorCerts;
      v15 = v13;
      *(_DWORD *)buf = 138412546;
      v30 = v12;
      v31 = 2048;
      v32 = -[NSArray count](anchorCerts, "count");
      _os_log_impl(&dword_216358000, v15, OS_LOG_TYPE_DEFAULT, "evaluating trust for %@ using %lu anchor certs", buf, 0x16u);

    }
    if (self->_anchorCerts)
    {
      objc_msgSend(v6, "protectionSpace");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = SecTrustSetAnchorCertificates((SecTrustRef)objc_msgSend(v16, "serverTrust"), (CFArrayRef)self->_anchorCerts);

      if (v17)
      {
        v18 = *(NSObject **)DMCLogObjects();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v30) = v17;
          _os_log_impl(&dword_216358000, v18, OS_LOG_TYPE_ERROR, "Failed to set Anchor Certs on trust! With secError code: %d", buf, 8u);
        }
      }
    }
    v28 = 0;
    objc_msgSend(v6, "protectionSpace");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = MEMORY[0x2199F7560](objc_msgSend(v19, "serverTrust"), &v28);

    if (!v20 && (v28 == 4 || v28 == 1))
    {
      v25 = (void *)MEMORY[0x24BDD1818];
      objc_msgSend(v6, "protectionSpace");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "credentialForTrust:", objc_msgSend(v26, "serverTrust"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_216358000, v27, OS_LOG_TYPE_DEFAULT, "Accepting server trust!", buf, 2u);
      }
      v23 = 0;
    }
    else
    {
      v21 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v30) = v20;
        _os_log_impl(&dword_216358000, v21, OS_LOG_TYPE_ERROR, "Could not evaluate trust! Error Code:  %d", buf, 8u);
      }
      v22 = 0;
      v23 = 3;
    }

    if (v7)
LABEL_22:
      v7[2](v7, v23, v22);
  }
  else
  {
    v24 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_216358000, v24, OS_LOG_TYPE_ERROR, "Received an Authentication method other than Server Trust!!", buf, 2u);
    }
    v22 = 0;
    v23 = 3;
    if (v7)
      goto LABEL_22;
  }

}

- (NSURL)webURL
{
  return self->_webURL;
}

- (void)setWebURL:(id)a3
{
  objc_storeStrong((id *)&self->_webURL, a3);
}

- (WKWebView)webView
{
  return self->_webView;
}

- (void)setWebView:(id)a3
{
  objc_storeStrong((id *)&self->_webView, a3);
}

- (NSArray)anchorCerts
{
  return self->_anchorCerts;
}

- (void)setAnchorCerts:(id)a3
{
  objc_storeStrong((id *)&self->_anchorCerts, a3);
}

- (NSData)machineInfo
{
  return self->_machineInfo;
}

- (void)setMachineInfo:(id)a3
{
  objc_storeStrong((id *)&self->_machineInfo, a3);
}

- (DMCCloudConfigWebAuthDelegate)delegate
{
  return (DMCCloudConfigWebAuthDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)downloadDestination
{
  return (NSString *)objc_getProperty(self, a2, 1008, 1);
}

- (void)setDownloadDestination:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1008);
}

- (NSData)downloadedProfileData
{
  return (NSData *)objc_getProperty(self, a2, 1016, 1);
}

- (void)setDownloadedProfileData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1016);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadedProfileData, 0);
  objc_storeStrong((id *)&self->_downloadDestination, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_machineInfo, 0);
  objc_storeStrong((id *)&self->_anchorCerts, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_webURL, 0);
}

@end

@implementation AMSUIWebView

- (AMSUIWebView)initWithContext:(id)a3 additionalScripts:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  AMSUIWebView *v12;
  AMSUIWebView *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  AMSUIWebDelegateProxy *v19;
  void *v20;
  uint64_t v21;
  WKWebView *underlyingWebView;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
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
  objc_super v42;

  v6 = a3;
  v7 = a4;
  v42.receiver = self;
  v42.super_class = (Class)AMSUIWebView;
  v8 = *MEMORY[0x24BDBF090];
  v9 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v10 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v11 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v12 = -[AMSUICommonView initWithFrame:](&v42, sel_initWithFrame_, *MEMORY[0x24BDBF090], v9, v10, v11);
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_context, v6);
    v14 = objc_alloc_init(MEMORY[0x24BDFA920]);
    objc_msgSend(v14, "_setWaitsForPaintAfterViewDidMoveToWindow:", 0);
    objc_msgSend(v14, "preferences");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_setPunchOutWhiteBackgroundsInDarkMode:", 1);

    objc_msgSend(v14, "preferences");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setJavaScriptCanOpenWindowsAutomatically:", 0);

    objc_msgSend(v14, "_setDrawsBackground:", 0);
    objc_msgSend(v14, "_setPrintsBackgrounds:", 0);
    objc_msgSend(v14, "_setApplePayEnabled:", 1);
    objc_msgSend(v14, "setMediaTypesRequiringUserActionForPlayback:", MEMORY[0x24BDBD1A8]);
    objc_msgSend(v14, "setAllowsInlineMediaPlayback:", 1);
    objc_msgSend(MEMORY[0x24BDFA928], "nonPersistentDataStore");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setWebsiteDataStore:", v17);

    v18 = objc_alloc_init(MEMORY[0x24BDFA8F8]);
    v19 = -[AMSUIWebDelegateProxy initWithDelegate:]([AMSUIWebDelegateProxy alloc], "initWithDelegate:", v13);
    objc_msgSend(MEMORY[0x24BDFA8D0], "pageWorld");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addScriptMessageHandlerWithReply:contentWorld:name:", v19, v20, CFSTR("callback"));

    -[AMSUIWebView _addScriptsToContentController:additionalScripts:](v13, "_addScriptsToContentController:additionalScripts:", v18, v7);
    objc_msgSend(v14, "setUserContentController:", v18);
    v21 = objc_msgSend(objc_alloc(MEMORY[0x24BDFA918]), "initWithFrame:configuration:", v14, v8, v9, v10, v11);
    underlyingWebView = v13->_underlyingWebView;
    v13->_underlyingWebView = (WKWebView *)v21;

    -[WKWebView setAllowsBackForwardNavigationGestures:](v13->_underlyingWebView, "setAllowsBackForwardNavigationGestures:", 0);
    -[WKWebView setUIDelegate:](v13->_underlyingWebView, "setUIDelegate:", v13);
    -[WKWebView setAccessibilityIdentifier:](v13->_underlyingWebView, "setAccessibilityIdentifier:", CFSTR("AMS.WebPage"));
    -[WKWebView setNavigationDelegate:](v13->_underlyingWebView, "setNavigationDelegate:", v13);
    v23 = (void *)MEMORY[0x24BE08428];
    objc_msgSend(v6, "clientInfo");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "userAgentForProcessInfo:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[WKWebView setCustomUserAgent:](v13->_underlyingWebView, "setCustomUserAgent:", v25);

    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[WKWebView ams_setBackgroundColor:](v13->_underlyingWebView, "ams_setBackgroundColor:", v26);

    -[WKWebView setOpaque:](v13->_underlyingWebView, "setOpaque:", 0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[WKWebView scrollView](v13->_underlyingWebView, "scrollView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setBackgroundColor:", v27);

    -[WKWebView _setAllowsRemoteInspection:](v13->_underlyingWebView, "_setAllowsRemoteInspection:", os_variant_has_internal_content());
    -[AMSUIWebView addSubview:](v13, "addSubview:", v13->_underlyingWebView);
    -[WKWebView setTranslatesAutoresizingMaskIntoConstraints:](v13->_underlyingWebView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[AMSUIWebView bottomAnchor](v13, "bottomAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[WKWebView bottomAnchor](v13->_underlyingWebView, "bottomAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setActive:", 1);

    -[AMSUIWebView leadingAnchor](v13, "leadingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[WKWebView leadingAnchor](v13->_underlyingWebView, "leadingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setActive:", 1);

    -[WKWebView topAnchor](v13->_underlyingWebView, "topAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIWebView topAnchor](v13, "topAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v37, "setActive:", 1);
    -[AMSUIWebView trailingAnchor](v13, "trailingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[WKWebView trailingAnchor](v13->_underlyingWebView, "trailingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setActive:", 1);

  }
  return v13;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[AMSUIWebView underlyingWebView](self, "underlyingWebView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopLoading");

  v4.receiver = self;
  v4.super_class = (Class)AMSUIWebView;
  -[AMSUIWebView dealloc](&v4, sel_dealloc);
}

- (double)bottomInset
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[AMSUIWebView underlyingWebView](self, "underlyingWebView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentInset");
  v5 = v4;

  return v5;
}

- (double)topInset
{
  return 0.0;
}

- (id)loadRequest:(id)a3 response:(id)a4 responseData:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v11, "OSLogObject");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)objc_opt_class();
    v14 = v13;
    -[AMSUIWebView context](self, "context");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "logKey");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v28 = v13;
    v29 = 2114;
    v30 = v16;
    v31 = 2048;
    v32 = objc_msgSend(v10, "length");
    _os_log_impl(&dword_211102000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Loading HTML into WebView (length: %ld)", buf, 0x20u);

  }
  objc_msgSend(v9, "URL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __50__AMSUIWebView_loadRequest_response_responseData___block_invoke;
  v23[3] = &unk_24CB4F940;
  v23[4] = self;
  v24 = v9;
  v25 = v8;
  v26 = v10;
  v18 = v10;
  v19 = v8;
  v20 = v9;
  -[AMSUIWebView _prepareWithURL:loadBlock:](self, "_prepareWithURL:loadBlock:", v17, v23);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

void __50__AMSUIWebView_loadRequest_response_responseData___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend((id)objc_opt_class(), "_getSetCookiesForResponse:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v15;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v6);
        objc_msgSend(*(id *)(a1 + 32), "underlyingWebView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "configuration");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "websiteDataStore");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "httpCookieStore");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setCookie:completionHandler:", v7, 0);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v4);
  }
  objc_msgSend(*(id *)(a1 + 32), "underlyingWebView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v12, "loadSimulatedRequest:response:responseData:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));

}

- (id)loadRequest:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v17[5];
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_opt_class();
    v8 = v7;
    -[AMSUIWebView context](self, "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "logKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    AMSLogableURL();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v20 = v7;
    v21 = 2114;
    v22 = v10;
    v23 = 2114;
    v24 = v12;
    _os_log_impl(&dword_211102000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Loading request into WebView: %{public}@", buf, 0x20u);

  }
  objc_msgSend(v4, "URL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __28__AMSUIWebView_loadRequest___block_invoke;
  v17[3] = &unk_24CB4F4C0;
  v17[4] = self;
  v18 = v4;
  v14 = v4;
  -[AMSUIWebView _prepareWithURL:loadBlock:](self, "_prepareWithURL:loadBlock:", v13, v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

void __28__AMSUIWebView_loadRequest___block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "underlyingWebView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "loadRequest:", *(_QWORD *)(a1 + 40));

}

- (id)sendJSRequest:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  AMSUIWebView *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  AMSUIWebView *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  id v36;
  void *v37;
  _QWORD block[5];
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  uint8_t buf[4];
  uint64_t v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  id v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BE08340]);
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "options");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7
    && (v8 = (void *)v7,
        v9 = (void *)MEMORY[0x24BDD1608],
        objc_msgSend(v4, "options"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        LODWORD(v9) = objc_msgSend(v9, "isValidJSONObject:", v10),
        v10,
        v8,
        (_DWORD)v9))
  {
    v11 = (void *)MEMORY[0x24BDD1608];
    objc_msgSend(v4, "options");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0;
    objc_msgSend(v11, "dataWithJSONObject:options:error:", v12, 0, &v43);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v43;

    if (!v13 || v14)
    {
      v16 = self;
      objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v17, "OSLogObject");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = objc_opt_class();
        objc_msgSend(v4, "logKey");
        v36 = v5;
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v45 = v19;
        v46 = 2114;
        v47 = v20;
        v48 = 2114;
        v49 = v14;
        _os_log_impl(&dword_211102000, v18, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error encoding service options. %{public}@", buf, 0x20u);

        v5 = v36;
      }

      v15 = 0;
      self = v16;
    }
    else
    {
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v13, 4);
    }

  }
  else
  {
    v15 = 0;
  }
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v21, "OSLogObject");
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v37 = v6;
    v23 = v5;
    v24 = self;
    v25 = objc_opt_class();
    objc_msgSend(v4, "logKey");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "service");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v15;
    if (!v15)
    {
      objc_msgSend(v4, "options");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
    }
    *(_DWORD *)buf = 138544130;
    v45 = v25;
    v46 = 2114;
    v47 = v26;
    v48 = 2114;
    v49 = v27;
    v50 = 2112;
    v51 = v28;
    _os_log_impl(&dword_211102000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Calling service: %{public}@ %@", buf, 0x2Au);
    if (!v15)

    v5 = v23;
    self = v24;
    v6 = v37;
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __30__AMSUIWebView_sendJSRequest___block_invoke;
  block[3] = &unk_24CB4FE70;
  block[4] = self;
  v39 = v4;
  v40 = v15;
  v41 = v6;
  v29 = v5;
  v42 = v29;
  v30 = v6;
  v31 = v15;
  v32 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  v33 = v42;
  v34 = v29;

  return v34;
}

void __30__AMSUIWebView_sendJSRequest___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "underlyingWebView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = CFSTR("name");
  objc_msgSend(*(id *)(a1 + 40), "service");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v16[1] = CFSTR("data");
  v5 = *(const __CFString **)(a1 + 48);
  if (!v5)
    v5 = &stru_24CB5A078;
  v17[0] = v3;
  v17[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDFA8D0], "pageWorld");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __30__AMSUIWebView_sendJSRequest___block_invoke_2;
  v11[3] = &unk_24CB51D60;
  v8 = *(id *)(a1 + 56);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(a1 + 40);
  v12 = v8;
  v13 = v9;
  v14 = v10;
  v15 = *(id *)(a1 + 64);
  objc_msgSend(v2, "callAsyncJavaScript:arguments:inFrame:inContentWorld:completionHandler:", CFSTR("return AMS.callService(name, data);"),
    v6,
    0,
    v7,
    v11);

}

void __30__AMSUIWebView_sendJSRequest___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  double v7;
  double v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  float v16;
  id v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  float v23;
  double v24;
  void *v25;
  id v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  float v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  AMSUIWebJSResponse *v37;
  id v38;
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  double v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(a1[4], "timeIntervalSinceNow");
  if (v7 >= 0.0)
    v8 = v7;
  else
    v8 = -v7;
  if (v6)
  {
    v9 = a1[5];
    objc_msgSend(a1[6], "logKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_parseRequestError:logKey:", v6, v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v12, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = objc_opt_class();
      objc_msgSend(a1[6], "logKey");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v8;
      *(_DWORD *)buf = 138544130;
      v40 = v14;
      v41 = 2114;
      v42 = v15;
      v43 = 2048;
      v44 = v16;
      v45 = 2114;
      v46 = v11;
      _os_log_impl(&dword_211102000, v13, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Service call failed [%f] %{public}@", buf, 0x2Au);

    }
    v17 = a1[7];
LABEL_10:
    objc_msgSend(v17, "finishWithError:", v11);
    goto LABEL_35;
  }
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  if (!v5)
  {
    if (!v18)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v19, "OSLogObject");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = objc_opt_class();
      objc_msgSend(a1[6], "logKey");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v8;
      *(_DWORD *)buf = 138543874;
      v40 = v28;
      v41 = 2114;
      v42 = v29;
      v43 = 2048;
      v44 = v30;
      _os_log_impl(&dword_211102000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Service call finished [%f] (no result)", buf, 0x20u);

    }
    v31 = a1[7];
    AMSError();
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v17 = v31;
    goto LABEL_10;
  }
  if (!v18)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v19, "OSLogObject");
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = objc_opt_class();
    objc_msgSend(a1[6], "logKey");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v8;
    v24 = v23;
    objc_msgSend(a1[5], "_jsonLogStringWithDictionary:", v5);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v40 = v21;
    v41 = 2114;
    v42 = v22;
    v43 = 2048;
    v44 = v24;
    v45 = 2112;
    v46 = v25;
    _os_log_impl(&dword_211102000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Service call succeeded [%f] %@", buf, 0x2Au);

  }
  v26 = v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v26;
  else
    v11 = 0;

  if (!v11)
  {
    v32 = v26;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v33 = v32;
    else
      v33 = 0;

    objc_msgSend(v33, "dataUsingEncoding:", 4);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      v38 = 0;
      objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v34, 0, &v38);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v38;
      objc_opt_class();
      v11 = 0;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v11 = v35;

    }
    else
    {
      v36 = 0;
      v11 = 0;
    }

  }
  v37 = -[AMSUIWebJSResponse initWithRequest:duration:]([AMSUIWebJSResponse alloc], "initWithRequest:duration:", a1[6], v8);
  -[AMSUIWebJSResponse setBody:](v37, "setBody:", v11);
  objc_msgSend(a1[7], "finishWithResult:", v37);

LABEL_35:
}

- (void)takeSnapshotWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[AMSUIWebView underlyingWebView](self, "underlyingWebView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __43__AMSUIWebView_takeSnapshotWithCompletion___block_invoke;
  v7[3] = &unk_24CB51D88;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "takeSnapshotWithConfiguration:completionHandler:", 0, v7);

}

void __43__AMSUIWebView_takeSnapshotWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  UIImage *image;

  image = a2;
  v5 = a3;
  if (v5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v6 = (void *)MEMORY[0x212BD73F4]();
    v7 = (void *)MEMORY[0x24BEBD640];
    UIImageJPEGRepresentation(image, 0.9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "displayScale");
    objc_msgSend(v7, "imageWithData:scale:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v10);
    objc_autoreleasePoolPop(v6);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

- (void)updateUserScriptsWithScripts:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __45__AMSUIWebView_updateUserScriptsWithScripts___block_invoke;
  v6[3] = &unk_24CB4F4C0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __45__AMSUIWebView_updateUserScriptsWithScripts___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "underlyingWebView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userContentController");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_addScriptsToContentController:additionalScripts:", v4, *(_QWORD *)(a1 + 40));
}

- (void)webView:(id)a3 didReceiveAuthenticationChallenge:(id)a4 completionHandler:(id)a5
{
  void (**v6)(id, _QWORD, void *);
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v6 = (void (**)(id, _QWORD, void *))a5;
  if (os_variant_has_internal_content()
    && ((objc_msgSend(MEMORY[0x24BE08100], "QAMode") & 1) != 0
     || objc_msgSend(MEMORY[0x24BE08100], "ignoreServerTrustEvaluation")))
  {
    v7 = (void *)MEMORY[0x24BDD1818];
    objc_msgSend(v10, "protectionSpace");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "credentialForTrust:", objc_msgSend(v8, "serverTrust"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v9);

  }
  else
  {
    v6[2](v6, 1, 0);
  }

}

- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4 replyHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[5];
  id v35;
  id v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  -[AMSUIWebView context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "logKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  AMSUIWebSetSubLogKey(v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "body");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v13 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;

  v14 = (void *)MEMORY[0x24BDBD1B8];
  if (v13)
    v14 = v13;
  v15 = v14;

  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("command"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v17 = v16;
  else
    v17 = 0;

  if (objc_msgSend(v17, "isEqualToString:", CFSTR("pageDataServiceRegistered")))
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v18, "OSLogObject");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v38 = objc_opt_class();
      v39 = 2114;
      v40 = v11;
      _os_log_impl(&dword_211102000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] PageData service registered", buf, 0x16u);
    }

    -[AMSUIWebView _finishedLoading](self, "_finishedLoading");
  }
  else if (objc_msgSend(v17, "isEqualToString:", CFSTR("run")))
  {
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("data"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v21 = v20;
    else
      v21 = 0;

    v33 = v21;
    objc_msgSend(v21, "dataUsingEncoding:", 4);
    v22 = objc_claimAutoreleasedReturnValue();
    v32 = (void *)v22;
    if (v22)
    {
      v36 = 0;
      objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v22, 0, &v36);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v36;
      objc_opt_class();
      v25 = 0;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v25 = v23;

    }
    else
    {
      v25 = 0;
      v24 = 0;
    }
    if (!objc_msgSend(v25, "count") || v24)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig", v24, v32);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v26)
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v26, "OSLogObject");
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v28 = objc_opt_class();
        objc_msgSend(v7, "body");
        v29 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v38 = v28;
        v39 = 2114;
        v40 = v11;
        v41 = 2112;
        v42 = v29;
        v30 = (void *)v29;
        v43 = 2114;
        v44 = v31;
        _os_log_impl(&dword_211102000, v27, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to decode action. %@ %{public}@", buf, 0x2Au);

      }
      v24 = v31;
    }
    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = __75__AMSUIWebView_userContentController_didReceiveScriptMessage_replyHandler___block_invoke;
    v34[3] = &unk_24CB51DB0;
    v34[4] = self;
    v35 = v8;
    -[AMSUIWebView _receiveJSObject:logKey:replyHandler:](self, "_receiveJSObject:logKey:replyHandler:", v25, v11, v34);

  }
  else
  {
    (*((void (**)(id, _QWORD, const __CFString *))v8 + 2))(v8, 0, CFSTR("AMS INTERNAL ERROR: Invalid Command"));
  }

}

void __75__AMSUIWebView_userContentController_didReceiveScriptMessage_replyHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;

  v5 = a2;
  if (v5)
  {
    if (objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", v5))
    {
      v11 = 0;
      objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v5, 0, &v11);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
        v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v6, 4);
      else
        v7 = 0;

    }
    else
    {
      v7 = 0;
    }
    if (v7)
      v10 = v7;
    else
      v10 = v5;
    (*(void (**)(_QWORD, id, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v10, 0);

  }
  else
  {
    AMSUIWebJSError(a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_jsonLogStringWithDictionary:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  objc_msgSend(a4, "request");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v10, "OSLogObject");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = objc_opt_class();
    -[AMSUIWebView context](self, "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "logKey");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v21 = v12;
    v22 = 2114;
    v23 = v14;
    v24 = 2114;
    v25 = v9;
    _os_log_impl(&dword_211102000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Deciding navigation policy for: %{public}@", buf, 0x20u);

  }
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __72__AMSUIWebView_webView_decidePolicyForNavigationAction_decisionHandler___block_invoke;
  v17[3] = &unk_24CB51DD8;
  v17[4] = self;
  v18 = v9;
  v19 = v7;
  v15 = v7;
  v16 = v9;
  -[AMSUIWebView _openURL:completionHandler:](self, "_openURL:completionHandler:", v16, v17);

}

void __72__AMSUIWebView_webView_decidePolicyForNavigationAction_decisionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  if (a2)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_opt_class();
      objc_msgSend(*(id *)(a1 + 32), "context");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "logKey");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 40);
      v24 = 138543874;
      v25 = v9;
      v26 = 2114;
      v27 = v11;
      v28 = 2114;
      v29 = v12;
      _os_log_impl(&dword_211102000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Opened: %{public}@", (uint8_t *)&v24, 0x20u);

    }
  }
  else
  {
    if (v5)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v13, "OSLogObject");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = objc_opt_class();
        objc_msgSend(*(id *)(a1 + 32), "context");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "logKey");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = *(_QWORD *)(a1 + 40);
        AMSLogableError();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 138544130;
        v25 = v15;
        v26 = 2114;
        v27 = v17;
        v28 = 2114;
        v29 = v18;
        v30 = 2114;
        v31 = v19;
        _os_log_impl(&dword_211102000, v14, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to open: %{public}@, error: %{public}@", (uint8_t *)&v24, 0x2Au);

      }
    }
    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v20 = objc_opt_class();
      objc_msgSend(*(id *)(a1 + 32), "context");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "logKey");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = *(_QWORD *)(a1 + 40);
      v24 = 138543874;
      v25 = v20;
      v26 = 2114;
      v27 = v22;
      v28 = 2114;
      v29 = v23;
      _os_log_impl(&dword_211102000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Redirecting to: %{public}@", (uint8_t *)&v24, 0x20u);

    }
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)webView:(id)a3 didCommitNavigation:(id)a4
{
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = objc_opt_class();
    -[AMSUIWebView context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "logKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v7;
    v15 = 2114;
    v16 = v9;
    _os_log_impl(&dword_211102000, v6, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Did commit navigation", (uint8_t *)&v13, 0x16u);

  }
  -[AMSUIWebView context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dataProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v11, "syncProperties");

}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_opt_class();
    -[AMSUIWebView context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "logKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v7;
    v12 = 2114;
    v13 = v9;
    _os_log_impl(&dword_211102000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Did finish navigation", (uint8_t *)&v10, 0x16u);

  }
}

- (void)webView:(id)a3 didStartProvisionalNavigation:(id)a4
{
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = objc_opt_class();
    -[AMSUIWebView context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "logKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v7;
    v12 = 2114;
    v13 = v9;
    _os_log_impl(&dword_211102000, v6, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Did start provisional navigation", (uint8_t *)&v10, 0x16u);

  }
}

- (void)_webView:(id)a3 navigation:(id)a4 didSameDocumentNavigation:(int64_t)a5
{
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_opt_class();
    -[AMSUIWebView context](self, "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "logKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v8;
    v13 = 2114;
    v14 = v10;
    _os_log_impl(&dword_211102000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Did finish same page nav", (uint8_t *)&v11, 0x16u);

  }
}

- (void)_webView:(id)a3 navigationDidFinishDocumentLoad:(id)a4
{
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_opt_class();
    -[AMSUIWebView context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "logKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v7;
    v12 = 2114;
    v13 = v9;
    _os_log_impl(&dword_211102000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Did finish doc load", (uint8_t *)&v10, 0x16u);

  }
}

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "OSLogObject");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = objc_opt_class();
    -[AMSUIWebView context](self, "context");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "logKey");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_request");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "URL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138544130;
    v18 = v11;
    v19 = 2114;
    v20 = v13;
    v21 = 2112;
    v22 = v15;
    v23 = 2114;
    v24 = v8;
    _os_log_impl(&dword_211102000, v10, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Did fail provisional navigation: %@. %{public}@", (uint8_t *)&v17, 0x2Au);

  }
  -[AMSUIWebView currentLoadPromise](self, "currentLoadPromise");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "finishWithError:", v8);

}

- (void)_webView:(id)a3 navigation:(id)a4 didFailProvisionalLoadInSubframe:(id)a5 withError:(id)a6
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = a6;
  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "OSLogObject");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v12 = objc_opt_class();
    -[AMSUIWebView context](self, "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "logKey");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138544130;
    v16 = v12;
    v17 = 2114;
    v18 = v14;
    v19 = 2114;
    v20 = v8;
    v21 = 2114;
    v22 = v9;
    _os_log_impl(&dword_211102000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to load in frame: %{public}@ error: %{public}@", (uint8_t *)&v15, 0x2Au);

  }
}

- (void)_webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5 userInfo:(id)a6
{
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "OSLogObject");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v10 = objc_opt_class();
    -[AMSUIWebView context](self, "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "logKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543874;
    v14 = v10;
    v15 = 2114;
    v16 = v12;
    v17 = 2114;
    v18 = v7;
    _os_log_impl(&dword_211102000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to navigation. %{public}@", (uint8_t *)&v13, 0x20u);

  }
}

- (void)_webView:(id)a3 contentRuleListWithIdentifier:(id)a4 performedAction:(id)a5 forURL:(id)a6
{
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v8 = a6;
  if (objc_msgSend(a5, "blockedLoad"))
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = objc_opt_class();
      -[AMSUIWebView context](self, "context");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "logKey");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543874;
      v15 = v11;
      v16 = 2114;
      v17 = v13;
      v18 = 2112;
      v19 = v8;
      _os_log_impl(&dword_211102000, v10, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to load UNTRUSTED resource: %@", (uint8_t *)&v14, 0x20u);

    }
  }

}

- (void)_addScriptsToContentController:(id)a3 additionalScripts:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  NSObject *v21;
  unint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  uint64_t v43;
  AMSUIWebView *v44;
  uint64_t v45;
  id v46;
  void *v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  uint8_t v63[128];
  uint8_t buf[4];
  uint64_t v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  uint64_t v69;
  __int16 v70;
  id v71;
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[AMSUIWebView baseScripts](self, "baseScripts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v39 = v7;
    v41 = v6;
    v46 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v9 = objc_msgSend(&unk_24CB8C9A0, "countByEnumeratingWithState:objects:count:", &v58, v72, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v59;
      v12 = 0x24BDD1000uLL;
      v43 = *(_QWORD *)v59;
      v44 = self;
      do
      {
        v13 = 0;
        v45 = v10;
        do
        {
          if (*(_QWORD *)v59 != v11)
            objc_enumerationMutation(&unk_24CB8C9A0);
          v14 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * v13);
          v15 = (void *)MEMORY[0x212BD73F4]();
          objc_msgSend(*(id *)(v12 + 1160), "bundleForClass:", objc_opt_class());
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "URLForResource:withExtension:", v14, CFSTR("js"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          v57 = 0;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithContentsOfURL:encoding:error:", v17, 4, &v57);
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = v57;
          if (v19)
          {
            v47 = (void *)v18;
            v48 = v15;
            objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v20)
            {
              objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v20, "OSLogObject", v39, v41);
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              v22 = v12;
              v23 = objc_opt_class();
              -[AMSUIWebView context](self, "context");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "logKey");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544130;
              v65 = v23;
              v12 = v22;
              v10 = v45;
              v66 = 2114;
              v67 = v25;
              v68 = 2114;
              v69 = v14;
              v70 = 2114;
              v71 = v19;
              _os_log_impl(&dword_211102000, v21, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to load resource: %{public}@. %{public}@", buf, 0x2Au);

              v11 = v43;
              self = v44;
            }

            v26 = v47;
            v15 = v48;
          }
          else
          {
            v26 = (void *)v18;
            v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFA900]), "initWithSource:injectionTime:forMainFrameOnly:", v18, 0, 1);
            objc_msgSend(v46, "addObject:", v20);
          }

          objc_autoreleasePoolPop(v15);
          ++v13;
        }
        while (v10 != v13);
        v10 = objc_msgSend(&unk_24CB8C9A0, "countByEnumeratingWithState:objects:count:", &v58, v72, 16);
      }
      while (v10);
    }
    v27 = (void *)objc_msgSend(v46, "copy", v39, v41);
    -[AMSUIWebView setBaseScripts:](self, "setBaseScripts:", v27);

    v7 = v40;
    v6 = v42;
  }
  objc_msgSend(v6, "removeAllUserScripts");
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  -[AMSUIWebView baseScripts](self, "baseScripts");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v54;
    do
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v54 != v31)
          objc_enumerationMutation(v28);
        objc_msgSend(v6, "addUserScript:", *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * i));
      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
    }
    while (v30);
  }

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v33 = v7;
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v49, v62, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v50;
    do
    {
      for (j = 0; j != v35; ++j)
      {
        if (*(_QWORD *)v50 != v36)
          objc_enumerationMutation(v33);
        v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFA900]), "initWithSource:injectionTime:forMainFrameOnly:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * j), 0, 1);
        objc_msgSend(v6, "addUserScript:", v38);

      }
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v49, v62, 16);
    }
    while (v35);
  }

}

- (void)_finishedLoading
{
  void *v3;

  self->_contentLoaded = 1;
  -[AMSUIWebView currentLoadPromise](self, "currentLoadPromise");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "finishWithSuccess");

  -[AMSUIWebView setCurrentLoadPromise:](self, "setCurrentLoadPromise:", 0);
}

+ (id)_getSetCookiesForResponse:(id)a3
{
  id v3;
  id v4;
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

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDD15A8];
    objc_msgSend(v4, "allHeaderFields");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cookiesWithResponseHeaderFields:forURL:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    objc_msgSend(v4, "allHeaderFields");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", *MEMORY[0x24BE07DA8]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "length"))
    {
      objc_msgSend(v4, "allHeaderFields");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v12, "mutableCopy");

      objc_msgSend(v13, "setObject:forKeyedSubscript:", v11, *MEMORY[0x24BE07DA0]);
      v14 = (void *)MEMORY[0x24BDD15A8];
      objc_msgSend(v4, "URL");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "cookiesWithResponseHeaderFields:forURL:", v13, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObjectsFromArray:", v16);

    }
  }
  else
  {
    v9 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v9;
}

- (id)_jsonLogStringWithDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", v3))
  {
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v3, 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v4, 4);
    else
      v5 = 0;

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v3;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v3);
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v5 = v6;
  }

  return v5;
}

- (void)_openURL:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", CFSTR("tel"), CFSTR("telprompt"), 0);
  objc_msgSend(v5, "scheme");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "containsObject:", v8);

  if ((v9 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v11 = objc_msgSend(v10, "isApplicationAvailableToOpenURL:error:", v5, &v16);
    v12 = v16;

    if (v11)
    {
      objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __43__AMSUIWebView__openURL_completionHandler___block_invoke;
      v14[3] = &unk_24CB50840;
      v15 = v6;
      objc_msgSend(v13, "openURL:options:completionHandler:", v5, MEMORY[0x24BDBD1B8], v14);

    }
    else
    {
      (*((void (**)(id, _QWORD, id))v6 + 2))(v6, 0, v12);
    }

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);
  }

}

uint64_t __43__AMSUIWebView__openURL_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_parseRequestError:(id)a3 logKey:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("WKJavaScriptExceptionMessage"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;

  objc_msgSend(v9, "dataUsingEncoding:", 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v15 = 0;
    v11 = 0;
    v12 = 0;
    goto LABEL_15;
  }
  v25 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v10, 0, &v25);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v25;
  if (!v11)
  {
    v15 = 0;
    goto LABEL_15;
  }
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("message"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v13;
  else
    v14 = 0;

  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("userInfo"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v15 = v16;
  else
    v15 = 0;

  if (!v14)
  {
LABEL_15:
    if (v9)
    {
      objc_msgSend(v5, "domain");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v17, "isEqualToString:", *MEMORY[0x24BDFA9D0]) & 1) != 0)
      {
        v18 = objc_msgSend(v5, "code");

        if (v18 == 4)
        {
          v19 = v9;
LABEL_21:
          v14 = v19;
          goto LABEL_22;
        }
      }
      else
      {

      }
    }
    objc_msgSend(v5, "description");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
LABEL_22:
  if (v12)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v20, "OSLogObject");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v27 = v22;
      v28 = 2114;
      v29 = v6;
      v30 = 2114;
      v31 = v14;
      _os_log_impl(&dword_211102000, v21, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] JS error does not contain an object: %{public}@", buf, 0x20u);
    }

  }
  AMSCustomError();
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)_prepareWithURL:(id)a3 loadBlock:(id)a4
{
  id v6;
  id v7;
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
  id v18;
  id v19;
  void *v20;
  id v21;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BE08078]);
  v9 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v6, "host");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("AMS %@"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIWebView underlyingWebView](self, "underlyingWebView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_setRemoteInspectionNameOverride:", v11);

  -[AMSUIWebView contentRulesPromise](self, "contentRulesPromise");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    -[AMSUIWebView underlyingWebView](self, "underlyingWebView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIWebView context](self, "context");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIWebView _setupContentRulesForWebView:context:](self, "_setupContentRulesForWebView:context:", v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIWebView setContentRulesPromise:](self, "setContentRulesPromise:", v16);

  }
  objc_initWeak(&location, self);
  -[AMSUIWebView contentRulesPromise](self, "contentRulesPromise");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __42__AMSUIWebView__prepareWithURL_loadBlock___block_invoke;
  v23[3] = &unk_24CB51E00;
  objc_copyWeak(&v26, &location);
  v18 = v8;
  v24 = v18;
  v19 = v7;
  v25 = v19;
  objc_msgSend(v17, "addFinishBlock:", v23);

  v20 = v25;
  v21 = v18;

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);

  return v21;
}

void __42__AMSUIWebView__prepareWithURL_loadBlock___block_invoke(id *a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  void *v6;
  _QWORD block[5];
  id v8;
  id v9;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v6 = WeakRetained;
  if (v4)
  {
    objc_msgSend(a1[4], "finishWithError:", v4);
  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __42__AMSUIWebView__prepareWithURL_loadBlock___block_invoke_2;
    block[3] = &unk_24CB50C30;
    block[4] = WeakRetained;
    v8 = a1[4];
    v9 = a1[5];
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

uint64_t __42__AMSUIWebView__prepareWithURL_loadBlock___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCurrentLoadPromise:", *(_QWORD *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_receiveJSObject:(id)a3 logKey:(id)a4 replyHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  char v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void (**v23)(void *, _QWORD, void *);
  void *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD aBlock[4];
  id v32;
  id v33;
  id v34;
  id v35;
  char v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  id v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (id)AMSSetLogKey();
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("actionClass"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v13;
  else
    v14 = 0;

  v30 = v14;
  v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("AMSLogAction"));
  if ((v15 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v16, "OSLogObject");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = objc_opt_class();
      -[AMSUIWebView _jsonLogStringWithDictionary:](self, "_jsonLogStringWithDictionary:", v8);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v38 = v18;
      v39 = 2114;
      v40 = v9;
      v41 = 2114;
      v42 = v30;
      v43 = 2112;
      v44 = v19;
      _os_log_impl(&dword_211102000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Receiving action: [%{public}@] %@", buf, 0x2Au);

    }
  }
  objc_initWeak((id *)buf, self);
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__AMSUIWebView__receiveJSObject_logKey_replyHandler___block_invoke;
  aBlock[3] = &unk_24CB51E50;
  v20 = v10;
  v34 = v20;
  objc_copyWeak(&v35, (id *)buf);
  v21 = v9;
  v32 = v21;
  v22 = v12;
  v33 = v22;
  v36 = v15;
  v23 = (void (**)(void *, _QWORD, void *))_Block_copy(aBlock);
  if (v8)
  {
    -[AMSUIWebView context](self, "context");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24 == 0;

    if (v25)
    {
      AMSError();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v23[2](v23, 0, v27);
    }
    else
    {
      -[AMSUIWebView context](self, "context");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSUIWebActionMapper actionFromJSObject:context:](AMSUIWebActionMapper, "actionFromJSObject:context:", v8, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        objc_msgSend(v27, "runAction");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "addFinishBlock:", v23);
      }
      else
      {
        AMSError();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v23[2](v23, 0, v28);
      }

    }
    v29 = 0;
  }
  else
  {
    AMSError();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v23[2](v23, 0, v29);
  }

  objc_destroyWeak(&v35);
  objc_destroyWeak((id *)buf);

}

void __53__AMSUIWebView__receiveJSObject_logKey_replyHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  char v16;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__AMSUIWebView__receiveJSObject_logKey_replyHandler___block_invoke_2;
  block[3] = &unk_24CB51E28;
  v14 = *(id *)(a1 + 48);
  objc_copyWeak(&v15, (id *)(a1 + 56));
  v10 = *(id *)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v12 = v6;
  v16 = *(_BYTE *)(a1 + 64);
  v13 = v5;
  v7 = v5;
  v8 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v15);
}

void __53__AMSUIWebView__receiveJSObject_logKey_replyHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  double v3;
  double v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  float v9;
  void *v10;
  void (*v11)(void);
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  float v20;
  double v21;
  void *v22;
  int v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  double v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 64))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    if (WeakRetained)
    {
      objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceNow");
      if (v3 >= 0.0)
        v4 = v3;
      else
        v4 = -v3;
      if (*(_QWORD *)(a1 + 48))
      {
        if (!*(_BYTE *)(a1 + 80))
        {
          objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v5)
          {
            objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
            v5 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v5, "OSLogObject");
          v6 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          {
            v7 = objc_opt_class();
            v8 = *(_QWORD *)(a1 + 32);
            v9 = v4;
            v10 = *(void **)(a1 + 48);
            v23 = 138544130;
            v24 = v7;
            v25 = 2114;
            v26 = v8;
            v27 = 2048;
            v28 = v9;
            v29 = 2114;
            v30 = v10;
            _os_log_impl(&dword_211102000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Action failed. [%f] %{public}@", (uint8_t *)&v23, 0x2Au);
          }

        }
        v11 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
      }
      else
      {
        if (!*(_BYTE *)(a1 + 80))
        {
          objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v16)
          {
            objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v16, "OSLogObject");
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            v18 = objc_opt_class();
            v19 = *(_QWORD *)(a1 + 32);
            v20 = v4;
            v21 = v20;
            objc_msgSend(WeakRetained, "_jsonLogStringWithDictionary:", *(_QWORD *)(a1 + 56));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = 138544130;
            v24 = v18;
            v25 = 2114;
            v26 = v19;
            v27 = 2048;
            v28 = v21;
            v29 = 2112;
            v30 = v22;
            _os_log_impl(&dword_211102000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Action succeeded. [%f] Result: %@", (uint8_t *)&v23, 0x2Au);

          }
        }
        v11 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
      }
      v11();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v12, "OSLogObject");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = objc_opt_class();
        v15 = *(_QWORD *)(a1 + 32);
        v23 = 138543618;
        v24 = v14;
        v25 = 2114;
        v26 = v15;
        _os_log_impl(&dword_211102000, v13, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Self has vanished", (uint8_t *)&v23, 0x16u);
      }

    }
  }
}

- (id)_setupContentRulesForWebView:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v17[5];
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  -[AMSUIWebView context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "disableTrustedDomains");

  if (v9)
  {
    objc_msgSend(MEMORY[0x24BE08078], "promiseWithSuccess");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = objc_alloc_init(MEMORY[0x24BE08078]);
    objc_msgSend(v7, "bag");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "arrayForKey:", CFSTR("trustedDomains"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __53__AMSUIWebView__setupContentRulesForWebView_context___block_invoke;
    v17[3] = &unk_24CB51EA0;
    v17[4] = self;
    v14 = v11;
    v18 = v14;
    v19 = v6;
    objc_msgSend(v13, "valueWithCompletion:", v17);
    v15 = v19;
    v10 = v14;

  }
  return v10;
}

void __53__AMSUIWebView__setupContentRulesForWebView_context___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  NSObject *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  _QWORD block[4];
  id v45;
  id v46;
  uint64_t v47;
  id v48;
  id v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[2];
  _QWORD v56[2];
  _QWORD v57[2];
  _QWORD v58[2];
  void *v59;
  uint8_t v60[128];
  uint8_t buf[4];
  uint64_t v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  id v66;
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a4;
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = objc_opt_class();
      AMSLogKey();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v62 = v10;
      v63 = 2114;
      v64 = v11;
      v65 = 2114;
      v66 = v7;
      _os_log_impl(&dword_211102000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch trusted domains. %{public}@", buf, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v7);
  }
  else
  {
    v43 = a1;
    v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v42 = v6;
    v13 = v6;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v52 != v16)
            objc_enumerationMutation(v13);
          v18 = *(id *)(*((_QWORD *)&v51 + 1) + 8 * i);
          v19 = v18;
          if (objc_msgSend(v18, "hasPrefix:", CFSTR(".")))
          {
            objc_msgSend(v18, "stringByReplacingCharactersInRange:withString:", 0, 1, CFSTR("*"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();

          }
          if (objc_msgSend(v18, "hasPrefix:", CFSTR("*.")))
          {
            objc_msgSend(v19, "stringByReplacingCharactersInRange:withString:", 0, 2, CFSTR("*"));
            v20 = objc_claimAutoreleasedReturnValue();

            v19 = (void *)v20;
          }
          objc_msgSend(v12, "addObject:", v19);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
      }
      while (v15);
    }

    v56[1] = v12;
    v57[0] = CFSTR("trigger");
    v55[0] = CFSTR("url-filter");
    v55[1] = CFSTR("unless-domain");
    v56[0] = CFSTR(".*");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v56, v55, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v57[1] = CFSTR("action");
    v58[0] = v21;
    v58[1] = &unk_24CB8C848;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v58, v57, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v22;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v59, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v50 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v23, 0, &v50);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v50;
    if (v25)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v26)
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v26, "OSLogObject");
      v27 = objc_claimAutoreleasedReturnValue();
      v7 = 0;
      v6 = v42;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v28 = objc_opt_class();
        AMSLogKey();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v62 = v28;
        v63 = 2114;
        v64 = v29;
        v65 = 2114;
        v66 = v25;
        _os_log_impl(&dword_211102000, v27, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to encode content rules. %{public}@", buf, 0x20u);

      }
      objc_msgSend(*(id *)(v43 + 40), "finishWithError:", v25);
    }
    else
    {
      if (v24 && (v30 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v24, 4)) != 0)
      {
        v31 = (void *)v30;
        objc_msgSend(MEMORY[0x24BDD1880], "UUID");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "UUIDString");
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __53__AMSUIWebView__setupContentRulesForWebView_context___block_invoke_134;
        block[3] = &unk_24CB4FE70;
        v45 = v33;
        v46 = v31;
        v34 = *(void **)(v43 + 40);
        v47 = *(_QWORD *)(v43 + 32);
        v48 = v34;
        v49 = *(id *)(v43 + 48);
        v35 = v31;
        v36 = v33;
        dispatch_async(MEMORY[0x24BDAC9B8], block);

        v6 = v42;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v42;
        if (!v37)
        {
          objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v37, "OSLogObject");
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          v39 = objc_opt_class();
          AMSLogKey();
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v62 = v39;
          v63 = 2114;
          v64 = v40;
          _os_log_impl(&dword_211102000, v38, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to encode content rules into JSON. (nil)", buf, 0x16u);

        }
        v41 = *(void **)(v43 + 40);
        AMSError();
        v35 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "finishWithError:", v35);
      }

      v7 = 0;
    }

  }
}

void __53__AMSUIWebView__setupContentRulesForWebView_context___block_invoke_134(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;
  id v8;

  objc_msgSend(MEMORY[0x24BDFA8C8], "defaultStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[2] = __53__AMSUIWebView__setupContentRulesForWebView_context___block_invoke_2;
  v6[3] = &unk_24CB51E78;
  v3 = *(void **)(a1 + 56);
  v6[4] = *(_QWORD *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6[1] = 3221225472;
  v7 = v3;
  v8 = *(id *)(a1 + 64);
  objc_msgSend(v2, "compileContentRuleListForIdentifier:encodedContentRuleList:completionHandler:", v4, v5, v6);

}

void __53__AMSUIWebView__setupContentRulesForWebView_context___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (!(v5 | v6))
  {
    AMSError();
    v6 = objc_claimAutoreleasedReturnValue();
  }
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = objc_opt_class();
      AMSLogKey();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543874;
      v16 = v9;
      v17 = 2114;
      v18 = v10;
      v19 = 2114;
      v20 = v6;
      _os_log_impl(&dword_211102000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to compile content rules. %{public}@", (uint8_t *)&v15, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v6);
  }
  else
  {
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 48), "configuration");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "userContentController");
      v12 = objc_claimAutoreleasedReturnValue();
      -[NSObject addContentRuleList:](v12, "addContentRuleList:", v5);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v11, "OSLogObject");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = objc_opt_class();
        AMSLogKey();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543618;
        v16 = v13;
        v17 = 2114;
        v18 = v14;
        _os_log_impl(&dword_211102000, v12, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] WARNING: No contentRuleList", (uint8_t *)&v15, 0x16u);

      }
    }

    objc_msgSend(*(id *)(a1 + 40), "finishWithSuccess");
  }

}

- (BOOL)contentLoaded
{
  return self->_contentLoaded;
}

- (WKWebView)underlyingWebView
{
  return self->_underlyingWebView;
}

- (NSArray)baseScripts
{
  return self->_baseScripts;
}

- (void)setBaseScripts:(id)a3
{
  objc_storeStrong((id *)&self->_baseScripts, a3);
}

- (AMSBinaryPromise)contentRulesPromise
{
  return self->_contentRulesPromise;
}

- (void)setContentRulesPromise:(id)a3
{
  objc_storeStrong((id *)&self->_contentRulesPromise, a3);
}

- (AMSUIWebClientContext)context
{
  return (AMSUIWebClientContext *)objc_loadWeakRetained((id *)&self->_context);
}

- (void)setContext:(id)a3
{
  objc_storeWeak((id *)&self->_context, a3);
}

- (AMSBinaryPromise)currentLoadPromise
{
  return self->_currentLoadPromise;
}

- (void)setCurrentLoadPromise:(id)a3
{
  objc_storeStrong((id *)&self->_currentLoadPromise, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLoadPromise, 0);
  objc_destroyWeak((id *)&self->_context);
  objc_storeStrong((id *)&self->_contentRulesPromise, 0);
  objc_storeStrong((id *)&self->_baseScripts, 0);
  objc_storeStrong((id *)&self->_underlyingWebView, 0);
}

@end

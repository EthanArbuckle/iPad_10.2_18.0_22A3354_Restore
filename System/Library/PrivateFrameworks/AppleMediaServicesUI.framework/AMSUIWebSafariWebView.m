@implementation AMSUIWebSafariWebView

- (AMSUIWebSafariWebView)initWithAppearance:(id)a3 scheme:(id)a4 data:(id)a5 delegate:(id)a6
{
  id v9;
  id v10;
  objc_class *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  AMSUIWebSafariWebView *v22;
  AMSUIWebSafariWebView *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v28;

  v9 = a4;
  v10 = a6;
  v11 = (objc_class *)MEMORY[0x24BDFA920];
  v12 = a5;
  v13 = objc_alloc_init(v11);
  objc_msgSend(MEMORY[0x24BDFA928], "nonPersistentDataStore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWebsiteDataStore:", v14);

  objc_msgSend(v13, "preferences");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setJavaScriptCanOpenWindowsAutomatically:", 0);

  objc_msgSend(v13, "preferences");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_setPunchOutWhiteBackgroundsInDarkMode:", 1);

  objc_msgSend(v13, "_setDrawsBackground:", 0);
  objc_msgSend(v13, "_setPrintsBackgrounds:", 0);
  v17 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BE08118], "productVersion");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE08118], "buildVersion");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("Version/%@ Mobile/%@ Safari"), v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setApplicationNameForUserAgent:", v20);

  objc_msgSend((id)objc_opt_class(), "_createContentControllerWithScheme:data:messageHandler:", v9, v12, self);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setUserContentController:", v21);
  if (objc_msgSend(v9, "length"))
    objc_msgSend(v13, "setURLSchemeHandler:forURLScheme:", self, v9);
  v28.receiver = self;
  v28.super_class = (Class)AMSUIWebSafariWebView;
  v22 = -[AMSUIWebSafariWebView initWithFrame:configuration:](&v28, sel_initWithFrame_configuration_, v13, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v23 = v22;
  if (v22)
  {
    objc_storeWeak((id *)&v22->_scheme, v9);
    objc_storeWeak((id *)&v23->_safariDelegate, v10);
    -[AMSUIWebSafariWebView setNavigationDelegate:](v23, "setNavigationDelegate:", v10);
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView ams_setBackgroundColor:](v23, "ams_setBackgroundColor:", v24);

    -[AMSUIWebSafariWebView setOpaque:](v23, "setOpaque:", 0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIWebSafariWebView scrollView](v23, "scrollView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "ams_setBackgroundColor:", v25);

  }
  -[AMSUIWebSafariWebView setUIDelegate:](v23, "setUIDelegate:", v23);

  return v23;
}

- (double)topInset
{
  return 0.0;
}

- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4 replyHandler:(id)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  char v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  objc_msgSend(a4, "body");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("action"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("data"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;

  if (v11)
  {
    -[AMSUIWebSafariWebView safariDelegate](self, "safariDelegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_opt_respondsToSelector();

    if ((v15 & 1) != 0)
    {
      -[AMSUIWebSafariWebView safariDelegate](self, "safariDelegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "safariView:didReceiveAction:body:replyHandler:", self, v11, v13, v7);
    }
    else
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
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = objc_opt_class();
        -[AMSUIWebSafariWebView logKey](self, "logKey");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138543874;
        v21 = v18;
        v22 = 2114;
        v23 = v19;
        v24 = 2114;
        v25 = v11;
        _os_log_impl(&dword_211102000, v17, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Safari VC not responding to action delegate: %{public}@", (uint8_t *)&v20, 0x20u);

      }
    }

  }
}

- (void)webView:(id)a3 startURLSchemeTask:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  char v20;
  void *v21;
  char v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  int v27;
  uint64_t v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  objc_msgSend(v5, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v8, "OSLogObject");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_opt_class();
    -[AMSUIWebSafariWebView logKey](self, "logKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scheme");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIWebSafariWebView scheme](self, "scheme");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138544130;
    v28 = v10;
    v29 = 2114;
    v30 = v11;
    v31 = 2114;
    v32 = v12;
    v33 = 2114;
    v34 = v13;
    _os_log_impl(&dword_211102000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Handling scheme: %{public}@ expected: %{public}@", (uint8_t *)&v27, 0x2Au);

  }
  objc_msgSend(v7, "scheme");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "lowercaseString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIWebSafariWebView scheme](self, "scheme");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "lowercaseString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v15, "isEqualToString:", v17);

  -[AMSUIWebSafariWebView safariDelegate](self, "safariDelegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v20 = objc_opt_respondsToSelector();

    if ((v20 & 1) != 0)
    {
      -[AMSUIWebSafariWebView safariDelegate](self, "safariDelegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "safariView:didRedirectToSchemeWithURL:", self, v7);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v21)
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v21, "OSLogObject");
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = objc_opt_class();
        -[AMSUIWebSafariWebView logKey](self, "logKey");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138543618;
        v28 = v25;
        v29 = 2114;
        v30 = v26;
        _os_log_impl(&dword_211102000, v24, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Safari VC not responding to scheme delegate", (uint8_t *)&v27, 0x16u);

      }
    }

    goto LABEL_16;
  }
  v22 = objc_opt_respondsToSelector();

  if ((v22 & 1) == 0)
  {
LABEL_16:
    AMSError();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "didFailWithError:", v23);
    goto LABEL_17;
  }
  -[AMSUIWebSafariWebView safariDelegate](self, "safariDelegate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "webView:startURLSchemeTask:", self, v5);
LABEL_17:

}

- (void)webView:(id)a3 stopURLSchemeTask:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
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
    -[AMSUIWebSafariWebView logKey](self, "logKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "request");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "scheme");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543874;
    v14 = v8;
    v15 = 2114;
    v16 = v9;
    v17 = 2114;
    v18 = v12;
    _os_log_impl(&dword_211102000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Stopping scheme handling: %{public}@", (uint8_t *)&v13, 0x20u);

  }
}

+ (id)_createContentControllerWithScheme:(id)a3 data:(id)a4 messageHandler:(id)a5
{
  id v7;
  id v8;
  objc_class *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v33;
  id v34;
  id v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  const __CFString *v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = (objc_class *)MEMORY[0x24BDFA8F8];
  v10 = a5;
  v11 = objc_alloc_init(v9);
  objc_msgSend(MEMORY[0x24BDFA8D0], "pageWorld");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addScriptMessageHandlerWithReply:contentWorld:name:", v10, v12, CFSTR("callback"));

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/AppleMediaServicesUI.framework"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "URLForResource:withExtension:", CFSTR("JSSafariSandbox"), CFSTR("js"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = 0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithContentsOfURL:encoding:error:", v14, 4, &v35);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v35;
  if (v16 || !v15)
  {
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
      v19 = v14;
      v20 = objc_opt_class();
      AMSLogKey();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v37 = v20;
      v14 = v19;
      v38 = 2114;
      v39 = (uint64_t)v21;
      v40 = 2114;
      v41 = CFSTR("JSSafariSandbox");
      v42 = 2114;
      v43 = v16;
      _os_log_impl(&dword_211102000, v18, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to load resource: %{public}@. %{public}@", buf, 0x2Au);

    }
  }
  else
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFA900]), "initWithSource:injectionTime:forMainFrameOnly:", v15, 0, 0);
    objc_msgSend(v11, "addUserScript:", v17);
  }

  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("AMSSafari.callbackScheme = \"%@\";"), v7);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFA900]), "initWithSource:injectionTime:forMainFrameOnly:", v22, 0, 0);
    objc_msgSend(v11, "addUserScript:", v23);

  }
  if (objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", v8))
  {
    v33 = v14;
    v34 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v8, 0, &v34);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v34;
    if (v25 || !v24)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v27)
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v27, "OSLogObject");
      v28 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        goto LABEL_21;
      v30 = objc_opt_class();
      AMSLogKey();
      v31 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v37 = v30;
      v38 = 2114;
      v39 = v31;
      v29 = (void *)v31;
      v40 = 2114;
      v41 = CFSTR("JSSafariSandbox");
      v42 = 2114;
      v43 = v25;
      _os_log_impl(&dword_211102000, v28, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to load resource: %{public}@. %{public}@", buf, 0x2Au);
    }
    else
    {
      v26 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v24, 4);
      if (!v26)
      {
LABEL_22:

        v14 = v33;
        goto LABEL_23;
      }
      v27 = (void *)v26;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("AMSSafari.data = %@;"), v26);
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFA900]), "initWithSource:injectionTime:forMainFrameOnly:", v28, 0, 0);
      objc_msgSend(v11, "addUserScript:", v29);
    }

LABEL_21:
    goto LABEL_22;
  }
LABEL_23:

  return v11;
}

- (NSString)logKey
{
  return (NSString *)objc_loadWeakRetained((id *)&self->_logKey);
}

- (void)setLogKey:(id)a3
{
  objc_storeWeak((id *)&self->_logKey, a3);
}

- (WKNavigationDelegate)safariDelegate
{
  return (WKNavigationDelegate *)objc_loadWeakRetained((id *)&self->_safariDelegate);
}

- (void)setSafariDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_safariDelegate, a3);
}

- (NSString)scheme
{
  return (NSString *)objc_loadWeakRetained((id *)&self->_scheme);
}

- (void)setScheme:(id)a3
{
  objc_storeWeak((id *)&self->_scheme, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scheme);
  objc_destroyWeak((id *)&self->_safariDelegate);
  objc_destroyWeak((id *)&self->_logKey);
}

@end

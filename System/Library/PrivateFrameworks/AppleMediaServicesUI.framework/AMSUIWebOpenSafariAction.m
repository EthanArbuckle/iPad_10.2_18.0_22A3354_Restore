@implementation AMSUIWebOpenSafariAction

- (AMSUIWebOpenSafariAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6;
  AMSUIWebOpenSafariAction *v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  NSDictionary *v12;
  NSDictionary *data;
  void *v14;
  id v15;
  void *v16;
  objc_super v18;

  v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)AMSUIWebOpenSafariAction;
  v7 = -[AMSUIWebAction initWithJSObject:context:](&v18, sel_initWithJSObject_context_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("callbackScheme"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;

    if (v9)
      v10 = v9;
    else
      v10 = CFSTR("amscallback");
    objc_storeStrong((id *)&v7->_callbackScheme, v10);

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("data"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;

    data = v7->_data;
    v7->_data = v12;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("url"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;

    if (v15)
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
    }
    objc_storeStrong((id *)&v7->_URL, v16);
    if (v15)

  }
  return v7;
}

+ (id)resultFromURL:(id)a3 error:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  BOOL v12;
  const __CFString *v13;
  void *v14;
  _QWORD v16[3];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "ams_parameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = CFSTR("callbackURL");
  objc_msgSend(v6, "absoluteString");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = &stru_24CB5A078;
  if (v8)
    v10 = (const __CFString *)v8;
  v11 = (void *)MEMORY[0x24BDBD1B8];
  if (v7)
    v11 = v7;
  if (v5)
    v12 = 1;
  else
    v12 = v6 == 0;
  v17[0] = v10;
  v17[1] = v11;
  v16[1] = CFSTR("query");
  v16[2] = CFSTR("success");
  v13 = CFSTR("false");
  if (!v12)
    v13 = CFSTR("true");
  v17[2] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)runAction
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void *v10;
  _BOOL4 v11;
  void *v12;
  id v13;
  void *v14;
  AMSUIWebSafariViewController *v15;
  void *v16;
  AMSUIWebSafariViewController *v17;
  AMSUIWebOpenSafariAction *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, void *, void *);
  void *v32;
  id v33;
  AMSUIWebOpenSafariAction *v34;
  id v35;
  _BYTE *v36;
  objc_super v37;
  _BYTE buf[24];
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  AMSUIWebOpenSafariAction *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v37.receiver = self;
  v37.super_class = (Class)AMSUIWebOpenSafariAction;
  v3 = -[AMSUIWebAction runAction](&v37, sel_runAction);
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_opt_class();
    AMSLogKey();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIWebOpenSafariAction URL](self, "URL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    AMSLogableURL();
    v9 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v7;
    *(_WORD *)&buf[22] = 2114;
    v39 = v9;
    _os_log_impl(&dword_211102000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Running safari action with URL: %{public}@", buf, 0x20u);

  }
  -[AMSUIWebOpenSafariAction URL](self, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10 == 0;

  if (v11)
  {
    v27 = (void *)MEMORY[0x24BE08340];
    AMSError();
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "promiseWithError:", v22);
    v26 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", self, sel__safariDataUpdate_, CFSTR("SSScriptSafariViewControllerDataUpdateNotification"), 0);

    v13 = objc_alloc_init(MEMORY[0x24BE08340]);
    AMSLogKey();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = [AMSUIWebSafariViewController alloc];
    -[AMSUIWebAction context](self, "context");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[AMSUIWebSafariViewController initWithContext:](v15, "initWithContext:", v16);

    -[AMSUIWebSafariViewController setShouldDismissOnCallback:](v17, "setShouldDismissOnCallback:", 1);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v39 = __Block_byref_object_copy__8;
    v40 = __Block_byref_object_dispose__8;
    v18 = self;
    v41 = v18;
    -[AMSUIWebOpenSafariAction URL](v18, "URL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIWebOpenSafariAction data](v18, "data");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIWebOpenSafariAction callbackScheme](v18, "callbackScheme");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = MEMORY[0x24BDAC760];
    v30 = 3221225472;
    v31 = __37__AMSUIWebOpenSafariAction_runAction__block_invoke;
    v32 = &unk_24CB51A60;
    v22 = v14;
    v33 = v22;
    v34 = v18;
    v23 = v13;
    v35 = v23;
    v36 = buf;
    -[AMSUIWebSafariViewController loadActionURL:data:callbackScheme:actionHandler:](v17, "loadActionURL:data:callbackScheme:actionHandler:", v19, v20, v21, &v29);

    if (!-[AMSUIWebOpenSafariAction _presentViewContoller:](v18, "_presentViewContoller:", v17, v29, v30, v31, v32))
    {
      AMSError();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "finishWithError:", v24);

    }
    v25 = v35;
    v26 = v23;

    _Block_object_dispose(buf, 8);
  }

  return v26;
}

void __37__AMSUIWebOpenSafariAction_runAction__block_invoke(uint64_t a1, void *a2, void *a3)
{
  __CFString *v5;
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  _BYTE v21[22];
  __int16 v22;
  const __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a2;
  v7 = (id)AMSSetLogKey();
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
    AMSLogKey();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    v13 = &stru_24CB5A078;
    *(_DWORD *)v21 = 138543874;
    *(_QWORD *)&v21[4] = v10;
    if (v5)
      v13 = v5;
    *(_WORD *)&v21[12] = 2114;
    *(_QWORD *)&v21[14] = v11;
    v22 = 2114;
    v23 = v13;
    _os_log_impl(&dword_211102000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Received safari callback. %{public}@", v21, 0x20u);

  }
  objc_msgSend((id)objc_opt_class(), "resultFromURL:error:", v6, v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "context");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dataProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v16, "postEvent:options:", CFSTR("SafariDataUpdate"), v14);

  v18 = *(void **)(a1 + 48);
  if (v5)
    objc_msgSend(v18, "finishWithError:", v5);
  else
    objc_msgSend(v18, "finishWithResult:", v14);
  objc_msgSend(*(id *)(a1 + 40), "setSafariViewController:", 0, *(_OWORD *)v21);
  v19 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v20 = *(void **)(v19 + 40);
  *(_QWORD *)(v19 + 40) = 0;

}

- (BOOL)_presentViewContoller:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  -[AMSUIWebAction context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "flowController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v4, "setShouldSetPresentationDelegate:", 1);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v4);
    -[AMSUIWebOpenSafariAction setSafariViewController:](self, "setSafariViewController:", v4);
    -[AMSUIWebOpenSafariAction setPresentedViewController:](self, "setPresentedViewController:", v8);
    v9 = objc_alloc_init(MEMORY[0x24BEBD790]);
    objc_msgSend(v9, "configureWithDefaultBackground");
    objc_msgSend(v4, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setStandardAppearance:", v9);

    objc_msgSend(v4, "navigationItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setCompactAppearance:", v9);

    objc_msgSend(v4, "navigationItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setScrollEdgeAppearance:", v9);

    objc_msgSend(v7, "presentViewController:animated:completion:", v8, 1, 0);
  }

  return v7 != 0;
}

- (void)_safariDataUpdate:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  char v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v12, "OSLogObject");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = objc_opt_class();
      AMSLogKey();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543618;
      v24 = v17;
      v25 = 2114;
      v26 = v18;
      _os_log_impl(&dword_211102000, v16, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Safari data update called without a URL", (uint8_t *)&v23, 0x16u);

    }
    goto LABEL_22;
  }
  objc_msgSend(v5, "scheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIWebOpenSafariAction callbackScheme](self, "callbackScheme");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (const __CFString *)v7;
  else
    v9 = &stru_24CB5A078;
  v10 = objc_msgSend(v6, "isEqualToString:", v9);

  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if ((v10 & 1) == 0)
  {
    if (!v11)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v12, "OSLogObject");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v19 = objc_opt_class();
      AMSLogKey();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSUIWebOpenSafariAction callbackScheme](self, "callbackScheme");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableURL();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138544130;
      v24 = v19;
      v25 = 2114;
      v26 = v20;
      v27 = 2114;
      v28 = v21;
      v29 = 2114;
      v30 = v22;
      _os_log_impl(&dword_211102000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] ScriptDataUpdate scheme does not match callbackScheme (%{public}@): %{public}@", (uint8_t *)&v23, 0x2Au);

    }
LABEL_22:

    goto LABEL_23;
  }
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v12, "OSLogObject");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = objc_opt_class();
    AMSLogKey();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138543618;
    v24 = v14;
    v25 = 2114;
    v26 = v15;
    _os_log_impl(&dword_211102000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Received ScriptDataUpdate notification", (uint8_t *)&v23, 0x16u);

  }
  -[AMSUIWebOpenSafariAction safariViewController](self, "safariViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "receiveCallbackURL:", v5);
LABEL_23:

}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_storeStrong((id *)&self->_URL, a3);
}

- (NSString)callbackScheme
{
  return self->_callbackScheme;
}

- (void)setCallbackScheme:(id)a3
{
  objc_storeStrong((id *)&self->_callbackScheme, a3);
}

- (NSDictionary)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (UIViewController)presentedViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentedViewController);
}

- (void)setPresentedViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentedViewController, a3);
}

- (AMSUIWebSafariViewController)safariViewController
{
  return (AMSUIWebSafariViewController *)objc_loadWeakRetained((id *)&self->_safariViewController);
}

- (void)setSafariViewController:(id)a3
{
  objc_storeWeak((id *)&self->_safariViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_safariViewController);
  objc_destroyWeak((id *)&self->_presentedViewController);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_callbackScheme, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end

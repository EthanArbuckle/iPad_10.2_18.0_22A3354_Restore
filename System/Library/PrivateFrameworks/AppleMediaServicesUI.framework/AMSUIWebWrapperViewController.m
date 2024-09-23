@implementation AMSUIWebWrapperViewController

- (AMSUIWebWrapperViewController)initWithContext:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  AMSUIWebWrapperViewController *v9;
  objc_super v11;
  objc_super v12;

  v5 = a3;
  objc_msgSend(v5, "bag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "account");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clientInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)AMSUIWebWrapperViewController;
  v9 = -[AMSUIWebViewController initWithBag:account:clientInfo:](&v12, sel_initWithBag_account_clientInfo_, v6, v7, v8);

  if (v9)
  {
    objc_storeStrong((id *)&v9->_wrapperContext, a3);
    v11.receiver = v9;
    v11.super_class = (Class)AMSUIWebWrapperViewController;
    -[AMSUIWebViewController setDelegate:](&v11, sel_setDelegate_, v9);
  }

  return v9;
}

- (void)webViewController:(id)a3 didFinishPurchaseWithResult:(id)a4 error:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a4;
  v7 = a5;
  if (v13)
  {
    -[AMSUIWebWrapperViewController wrapperContext](self, "wrapperContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dataProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v9, "postEvent:options:", CFSTR("BuyConfirmed"), MEMORY[0x24BDBD1B8]);

  }
  -[AMSUIWebWrapperViewController wrapperContext](self, "wrapperContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "actionDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "actionDidFinishPurchaseWithResult:error:", v13, v7);

}

- (void)webViewController:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v7 = a5;
  v8 = a4;
  -[AMSUIWebWrapperViewController wrapperContext](self, "wrapperContext");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "actionDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "action:pauseTimeouts:handleDialogRequest:", 0, 1, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "addFinishBlock:", v7);
}

- (void)webViewController:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v7 = a5;
  v8 = a4;
  -[AMSUIWebWrapperViewController wrapperContext](self, "wrapperContext");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "actionDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "action:pauseTimeouts:handleAuthenticateRequest:", 0, 1, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "addFinishBlock:", v7);
}

- (BOOL)webViewController:(id)a3 handleDelegateAction:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  AMSUIWebJSRequest *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;

  v7 = a5;
  v8 = a4;
  -[AMSUIWebWrapperViewController wrapperContext](self, "wrapperContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "logKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  AMSUIWebSetSubLogKey(v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[AMSUIWebJSRequest initWithServiceName:logKey:]([AMSUIWebJSRequest alloc], "initWithServiceName:logKey:", CFSTR("RouteDelegateAction"), v11);
  -[AMSUIWebJSRequest setOptions:](v12, "setOptions:", v8);

  -[AMSUIWebWrapperViewController wrapperContext](self, "wrapperContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dataProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "runJSRequest:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __83__AMSUIWebWrapperViewController_webViewController_handleDelegateAction_completion___block_invoke;
  v18[3] = &unk_24CB522A8;
  v19 = v7;
  v16 = v7;
  objc_msgSend(v15, "addFinishBlock:", v18);

  return 1;
}

void __83__AMSUIWebWrapperViewController_webViewController_handleDelegateAction_completion___block_invoke(uint64_t a1, id a2, void *a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (a2)
  {
    objc_msgSend(a2, "body");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    v7 = (void *)MEMORY[0x24BDBD1B8];
    if (v5)
      v7 = (void *)v5;
    a2 = v7;

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)webViewController:(id)a3 didResolveWithResult:(id)a4 error:(id)a5 completion:(id)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  -[AMSUIWebWrapperViewController wrapperContext](self, "wrapperContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dataProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = CFSTR("result");
  v12 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[1] = CFSTR("error");
  v18[0] = v12;
  AMSUIWebJSError(v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18[1] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(v11, "postEvent:options:", CFSTR("RouteResolve"), v15);

  if (!v13)
  if (!v8)

}

- (AMSUIWebClientContext)wrapperContext
{
  return self->_wrapperContext;
}

- (void)setWrapperContext:(id)a3
{
  objc_storeStrong((id *)&self->_wrapperContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrapperContext, 0);
}

@end

@implementation AMSPaymentAuthorizationDialogTask

- (AMSPaymentAuthorizationDialogTask)initWithRequest:(id)a3 bag:(id)a4
{
  id v7;
  id v8;
  AMSPaymentAuthorizationDialogTask *v9;
  AMSPaymentAuthorizationDialogTask *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMSPaymentAuthorizationDialogTask;
  v9 = -[AMSTask init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bag, a4);
    objc_storeStrong((id *)&v10->_request, a3);
  }

  return v10;
}

- (id)perform
{
  AMSMutableLazyPromise *v2;
  AMSMutableLazyPromise *v3;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v2 = [AMSMutableLazyPromise alloc];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__AMSPaymentAuthorizationDialogTask_perform__block_invoke;
  v5[3] = &unk_1E253FE58;
  objc_copyWeak(&v6, &location);
  v3 = -[AMSMutableLazyPromise initWithBlock:](v2, "initWithBlock:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

void __44__AMSPaymentAuthorizationDialogTask_perform__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  AMSAuthenticateOptions *v5;
  void *v6;
  AMSAuthenticateTask *v7;
  void *v8;
  void *v9;
  AMSAuthenticateTask *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  AMSPaymentAuthorizationDialogResult *v20;
  void *v21;
  id v22;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = objc_alloc_init(AMSAuthenticateOptions);
  -[AMSAuthenticateOptions setAllowServerDialogs:](v5, "setAllowServerDialogs:", 1);
  -[AMSAuthenticateOptions setAuthenticationType:](v5, "setAuthenticationType:", 2);
  -[AMSAuthenticateOptions setCanMakeAccountActive:](v5, "setCanMakeAccountActive:", 0);
  AMSLogKey();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSAuthenticateOptions setLogKey:](v5, "setLogKey:", v6);

  -[AMSAuthenticateOptions setDebugReason:](v5, "setDebugReason:", CFSTR("[Payment Authorization]"));
  v7 = [AMSAuthenticateTask alloc];
  objc_msgSend(WeakRetained, "request");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "account");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[AMSAuthenticateTask initWithAccount:options:](v7, "initWithAccount:options:", v9, v5);

  -[AMSAuthenticateTask performAuthentication](v10, "performAuthentication");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  objc_msgSend(v11, "resultWithError:", &v22);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v22;

  if (v12)
  {
    objc_msgSend(v12, "authenticationResults");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "valueForKey:", *MEMORY[0x1E0CFFF70]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;

    objc_msgSend(WeakRetained, "setIdmsToken:", v16);
    objc_msgSend(v12, "authenticationResults");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "valueForKey:", *MEMORY[0x1E0CFFFA0]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = v18;
    else
      v19 = 0;

    objc_msgSend(WeakRetained, "setPasswordEquivalentToken:", v19);
    v20 = objc_alloc_init(AMSPaymentAuthorizationDialogResult);
    objc_msgSend(WeakRetained, "passwordEquivalentToken");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSPaymentSheetResult setPasswordEquivalentToken:](v20, "setPasswordEquivalentToken:", v21);

    objc_msgSend(v3, "finishWithResult:", v20);
  }
  else
  {
    if (!v13)
    {
      AMSError(0, CFSTR("Payment Authorization"), CFSTR("Unknown Error"), 0);
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "finishWithError:", v13);
  }

}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
  objc_storeStrong((id *)&self->_bag, a3);
}

- (AMSPurchaseInfo)purchaseInfo
{
  return self->_purchaseInfo;
}

- (void)setPurchaseInfo:(id)a3
{
  objc_storeStrong((id *)&self->_purchaseInfo, a3);
}

- (NSDictionary)idmsToken
{
  return self->_idmsToken;
}

- (void)setIdmsToken:(id)a3
{
  objc_storeStrong((id *)&self->_idmsToken, a3);
}

- (NSString)passwordEquivalentToken
{
  return self->_passwordEquivalentToken;
}

- (void)setPasswordEquivalentToken:(id)a3
{
  objc_storeStrong((id *)&self->_passwordEquivalentToken, a3);
}

- (AMSPaymentAuthorizationDialogRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_passwordEquivalentToken, 0);
  objc_storeStrong((id *)&self->_idmsToken, 0);
  objc_storeStrong((id *)&self->_purchaseInfo, 0);
  objc_storeStrong((id *)&self->_bag, 0);
}

@end

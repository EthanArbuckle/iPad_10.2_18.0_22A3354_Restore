@implementation AMSUIWebRemoveDeviceOfferAction

- (AMSUIWebRemoveDeviceOfferAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  AMSUIWebRemoveDeviceOfferAction *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  ACAccount *account;
  void *v14;
  NSString *v15;
  NSString *identifier;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)AMSUIWebRemoveDeviceOfferAction;
  v8 = -[AMSUIWebAction initWithJSObject:context:](&v18, sel_initWithJSObject_context_, v6, v7);
  if (v8)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("account"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;

    objc_msgSend(v7, "iTunesAccountFromJSAccount:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    account = v8->_account;
    v8->_account = (ACAccount *)v12;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("identifier"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;

    identifier = v8->_identifier;
    v8->_identifier = v15;

  }
  return v8;
}

- (id)runAction
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)AMSUIWebRemoveDeviceOfferAction;
  v3 = -[AMSUIWebAction runAction](&v18, sel_runAction);
  -[AMSUIWebRemoveDeviceOfferAction identifier](self, "identifier");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4
    && (v5 = (void *)v4,
        -[AMSUIWebRemoveDeviceOfferAction identifier](self, "identifier"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "length"),
        v6,
        v5,
        v7))
  {
    v8 = (void *)MEMORY[0x24BE08118];
    -[AMSUIWebRemoveDeviceOfferAction identifier](self, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIWebRemoveDeviceOfferAction account](self, "account");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIWebAction context](self, "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bag");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeDeviceOfferWithIdentifier:account:bag:logKey:", v9, v10, v12, 0);

    objc_msgSend(MEMORY[0x24BE08078], "promiseWithSuccess");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "promiseAdapter");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = (void *)MEMORY[0x24BE08340];
    AMSError();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "promiseWithError:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v16 = (void *)v14;

  return v16;
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end

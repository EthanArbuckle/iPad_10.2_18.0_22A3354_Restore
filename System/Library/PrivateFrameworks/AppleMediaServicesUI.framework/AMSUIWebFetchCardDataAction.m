@implementation AMSUIWebFetchCardDataAction

- (AMSUIWebFetchCardDataAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6;
  AMSUIWebFetchCardDataAction *v7;
  void *v8;
  NSString *v9;
  NSString *merchantID;
  void *v11;
  NSString *v12;
  NSString *storeFrontCountryCode;
  objc_super v15;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AMSUIWebFetchCardDataAction;
  v7 = -[AMSUIWebAction initWithJSObject:context:](&v15, sel_initWithJSObject_context_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("merchantID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;

    merchantID = v7->_merchantID;
    v7->_merchantID = v9;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("storeFrontCountryCode"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;

    storeFrontCountryCode = v7->_storeFrontCountryCode;
    v7->_storeFrontCountryCode = v12;

  }
  return v7;
}

- (id)runAction
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
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
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  _QWORD v27[5];
  id v28;
  _QWORD v29[5];
  id v30;
  _QWORD v31[5];
  id v32;
  objc_super v33;
  _QWORD v34[2];
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v33.receiver = self;
  v33.super_class = (Class)AMSUIWebFetchCardDataAction;
  v3 = -[AMSUIWebAction runAction](&v33, sel_runAction);
  AMSLogKey();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
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
    v7 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    v36 = v7;
    v37 = 2114;
    v38 = v4;
    _os_log_impl(&dword_211102000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Fetching card data...", buf, 0x16u);
  }

  -[AMSUIWebFetchCardDataAction merchantID](self, "merchantID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BE08340], "promiseWithResult:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[AMSUIWebAction context](self, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bag");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringForKey:", CFSTR("applepay-merchant-id"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "valuePromise");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[AMSUIWebFetchCardDataAction storeFrontCountryCode](self, "storeFrontCountryCode");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(MEMORY[0x24BE08340], "promiseWithResult:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[AMSUIWebAction context](self, "context");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bag");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringForKey:", CFSTR("countryCode"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "valuePromise");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v18 = (void *)MEMORY[0x24BE08340];
  v34[0] = v14;
  v34[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "promiseWithAll:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = MEMORY[0x24BDAC760];
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __40__AMSUIWebFetchCardDataAction_runAction__block_invoke;
  v31[3] = &unk_24CB51178;
  v31[4] = self;
  v22 = v4;
  v32 = v22;
  objc_msgSend(v20, "thenWithBlock:", v31);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v21;
  v29[1] = 3221225472;
  v29[2] = __40__AMSUIWebFetchCardDataAction_runAction__block_invoke_2;
  v29[3] = &unk_24CB4F828;
  v29[4] = self;
  v24 = v22;
  v30 = v24;
  objc_msgSend(v23, "addErrorBlock:", v29);
  v27[0] = v21;
  v27[1] = 3221225472;
  v27[2] = __40__AMSUIWebFetchCardDataAction_runAction__block_invoke_24;
  v27[3] = &unk_24CB4F890;
  v27[4] = self;
  v28 = v24;
  v25 = v24;
  objc_msgSend(v23, "addSuccessBlock:", v27);

  return v23;
}

id __40__AMSUIWebFetchCardDataAction_runAction__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

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
    v9 = *(_QWORD *)(a1 + 40);
    v14 = 138544130;
    v15 = v8;
    v16 = 2114;
    v17 = v9;
    v18 = 2114;
    v19 = v4;
    v20 = 2114;
    v21 = v5;
    _os_log_impl(&dword_211102000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] countryCode: %{public}@, merchantIdentifier: %{public}@", (uint8_t *)&v14, 0x2Au);
  }

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE080C8]), "initWithCountryCode:merchantIdentifier:", v4, v5);
  objc_msgSend(v10, "performCardRegistration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "thenWithBlock:", &__block_literal_global_23);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id __40__AMSUIWebFetchCardDataAction_runAction__block_invoke_13(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = a2;
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v2, "cardData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v4, 4);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("cardData"));

  }
  objc_msgSend(v2, "brokerURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "absoluteString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("brokerURL"));

  objc_msgSend(v2, "paymentServicesURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "absoluteString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("paymentServicesURL"));

  objc_msgSend(MEMORY[0x24BE08340], "promiseWithResult:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __40__AMSUIWebFetchCardDataAction_runAction__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = objc_opt_class();
    v7 = *(_QWORD *)(a1 + 40);
    AMSLogableError();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543874;
    v10 = v6;
    v11 = 2114;
    v12 = v7;
    v13 = 2114;
    v14 = v8;
    _os_log_impl(&dword_211102000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed with error: %{public}@", (uint8_t *)&v9, 0x20u);

  }
}

void __40__AMSUIWebFetchCardDataAction_runAction__block_invoke_24(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
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
    v7 = *(_QWORD *)(a1 + 40);
    v8 = 138543875;
    v9 = v6;
    v10 = 2114;
    v11 = v7;
    v12 = 2113;
    v13 = v3;
    _os_log_impl(&dword_211102000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully fetched card data: %{private}@", (uint8_t *)&v8, 0x20u);
  }

}

- (NSString)merchantID
{
  return self->_merchantID;
}

- (void)setMerchantID:(id)a3
{
  objc_storeStrong((id *)&self->_merchantID, a3);
}

- (NSString)storeFrontCountryCode
{
  return self->_storeFrontCountryCode;
}

- (void)setStoreFrontCountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_storeFrontCountryCode, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeFrontCountryCode, 0);
  objc_storeStrong((id *)&self->_merchantID, 0);
}

@end

@implementation AMSUIWebSendSMSAction

- (AMSUIWebSendSMSAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6;
  AMSUIWebSendSMSAction *v7;
  void *v8;
  NSString *v9;
  NSString *body;
  void *v11;
  NSString *v12;
  NSString *countryCode;
  void *v14;
  NSString *v15;
  NSString *digits;
  objc_super v18;

  v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)AMSUIWebSendSMSAction;
  v7 = -[AMSUIWebAction initWithJSObject:context:](&v18, sel_initWithJSObject_context_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("body"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;

    body = v7->_body;
    v7->_body = v9;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("countryCode"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;

    countryCode = v7->_countryCode;
    v7->_countryCode = v12;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("digits"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;

    digits = v7->_digits;
    v7->_digits = v15;

  }
  return v7;
}

- (id)telephonyAccessPatterns
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[AMSUIWebAction context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bag");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayForKey:", CFSTR("telephony-access-patterns"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valuePromise");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)runAction
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  AMSUIWebSendSMSAction *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)AMSUIWebSendSMSAction;
  v3 = -[AMSUIWebAction runAction](&v17, sel_runAction);
  -[AMSUIWebAction context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "webPage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "webView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "underlyingWebView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "absoluteString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[AMSUIWebSendSMSAction telephonyAccessPatterns](self, "telephonyAccessPatterns");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __34__AMSUIWebSendSMSAction_runAction__block_invoke;
    v14[3] = &unk_24CB51178;
    v15 = v9;
    v16 = self;
    objc_msgSend(v10, "thenWithBlock:", v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = (void *)MEMORY[0x24BE08340];
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEB24A0], 107, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "promiseWithError:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

id __34__AMSUIWebSendSMSAction_runAction__block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v20;
  _QWORD v21[4];
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __34__AMSUIWebSendSMSAction_runAction__block_invoke_2;
  v21[3] = &unk_24CB51C08;
  v22 = *(id *)(a1 + 32);
  if (!objc_msgSend(a2, "ams_anyWithTest:", v21))
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
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_opt_class();
      AMSLogKey();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      v24 = v14;
      v25 = 2114;
      v26 = v15;
      v27 = 2114;
      v28 = v16;
      _os_log_impl(&dword_211102000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Rejecting webPage: %{public}@", buf, 0x20u);

    }
    v17 = (void *)MEMORY[0x24BE08340];
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEB24A0], 107, 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = v17;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BEB2090], "sharedController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "body");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "digits");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "countryCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v8 = objc_msgSend(v4, "sendSMSWithText:toPhoneNumber:countryCode:error:", v5, v6, v7, &v20);
  v9 = v20;

  v10 = (void *)MEMORY[0x24BE08340];
  if (!v8)
  {
LABEL_9:
    objc_msgSend(v10, "promiseWithError:", v9);
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x24BE08340], "promiseWithResult:", MEMORY[0x24BDBD1C8]);
  v11 = objc_claimAutoreleasedReturnValue();
LABEL_10:
  v18 = (void *)v11;

  return v18;
}

BOOL __34__AMSUIWebSendSMSAction_runAction__block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  _BOOL8 v6;

  v3 = (objc_class *)MEMORY[0x24BDD1798];
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithPattern:options:error:", v4, 1, 0);

  v6 = objc_msgSend(v5, "rangeOfFirstMatchInString:options:range:", *(_QWORD *)(a1 + 32), 0, 0, objc_msgSend(*(id *)(a1 + 32), "length")) != 0x7FFFFFFFFFFFFFFFLL;
  return v6;
}

- (NSString)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
  objc_storeStrong((id *)&self->_body, a3);
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_countryCode, a3);
}

- (NSString)digits
{
  return self->_digits;
}

- (void)setDigits:(id)a3
{
  objc_storeStrong((id *)&self->_digits, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_digits, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_body, 0);
}

@end

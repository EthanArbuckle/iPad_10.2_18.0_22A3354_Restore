@implementation AMSUIWebAuthorizeApplePayEnrollmentAction

- (AMSUIWebAuthorizeApplePayEnrollmentAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6;
  AMSUIWebAuthorizeApplePayEnrollmentAction *v7;
  void *v8;
  NSNumber *v9;
  NSNumber *confirmationStyle;
  void *v11;
  NSString *v12;
  NSString *passSerialNumber;
  void *v14;
  NSString *v15;
  NSString *passTypeIdentifier;
  void *v17;
  NSDictionary *v18;
  NSDictionary *paymentSession;
  objc_super v21;

  v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)AMSUIWebAuthorizeApplePayEnrollmentAction;
  v7 = -[AMSUIWebAction initWithJSObject:context:](&v21, sel_initWithJSObject_context_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("confirmationStyle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;

    confirmationStyle = v7->_confirmationStyle;
    v7->_confirmationStyle = v9;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("passSerialNumber"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;

    passSerialNumber = v7->_passSerialNumber;
    v7->_passSerialNumber = v12;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("passTypeIdentifier"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;

    passTypeIdentifier = v7->_passTypeIdentifier;
    v7->_passTypeIdentifier = v15;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("paymentSession"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v18 = v17;
    else
      v18 = 0;

    paymentSession = v7->_paymentSession;
    v7->_paymentSession = v18;

  }
  return v7;
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
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  AMSUIWebAuthorizeApplePayEnrollmentAction *v23;
  id v24;
  objc_super v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v25.receiver = self;
  v25.super_class = (Class)AMSUIWebAuthorizeApplePayEnrollmentAction;
  v3 = -[AMSUIWebAction runAction](&v25, sel_runAction);
  -[AMSUIWebAction context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(MEMORY[0x24BE080B0], "shouldUseExtendedEnrollmentWithBag:", v5) & 1) != 0)
  {
    -[AMSUIWebAuthorizeApplePayEnrollmentAction paymentSession](self, "paymentSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v5, "stringForKey:", CFSTR("currentStorefrontCountryCodeISO2A"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "valuePromise");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __54__AMSUIWebAuthorizeApplePayEnrollmentAction_runAction__block_invoke;
      v21[3] = &unk_24CB50B40;
      v22 = v5;
      v23 = self;
      v24 = v6;
      objc_msgSend(v8, "thenWithBlock:", v21);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v15, "OSLogObject");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = objc_opt_class();
        AMSLogKey();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v27 = v17;
        v28 = 2114;
        v29 = v18;
        _os_log_impl(&dword_211102000, v16, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed for bad arguments.", buf, 0x16u);

      }
      v19 = (void *)MEMORY[0x24BE08340];
      AMSError();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "promiseWithError:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = objc_opt_class();
      AMSLogKey();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v12;
      v28 = 2114;
      v29 = v13;
      _os_log_impl(&dword_211102000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed for feature not enabled.", buf, 0x16u);

    }
    v14 = (void *)MEMORY[0x24BE08340];
    AMSError();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "promiseWithError:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

id __54__AMSUIWebAuthorizeApplePayEnrollmentAction_runAction__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;

  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x24BE08340]);
  objc_msgSend(*(id *)(a1 + 32), "stringForKey:", CFSTR("currencyCode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valuePromise");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __54__AMSUIWebAuthorizeApplePayEnrollmentAction_runAction__block_invoke_2;
  v12[3] = &unk_24CB50B18;
  v12[4] = *(_QWORD *)(a1 + 40);
  v7 = v4;
  v13 = v7;
  v14 = *(id *)(a1 + 48);
  v15 = v3;
  v8 = v3;
  objc_msgSend(v6, "addFinishBlock:", v12);
  v9 = v15;
  v10 = v7;

  return v10;
}

void __54__AMSUIWebAuthorizeApplePayEnrollmentAction_runAction__block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  _QWORD v32[2];
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
    goto LABEL_7;
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
    AMSLogKey();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v34 = v9;
    v35 = 2114;
    v36 = v10;
    _os_log_impl(&dword_211102000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No currency code, falling back to device locale", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "currencyCode");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
LABEL_7:
    objc_msgSend(a1[4], "presentingSceneIdentifierPromise");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "presentingSceneBundleIdentifierPromise");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x24BE08340];
    v32[0] = v12;
    v32[1] = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "promiseWithAll:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __54__AMSUIWebAuthorizeApplePayEnrollmentAction_runAction__block_invoke_28;
    v26[3] = &unk_24CB50AF0;
    v17 = a1[6];
    v18 = a1[4];
    v27 = v17;
    v28 = v18;
    v29 = a1[7];
    v30 = v5;
    v31 = a1[5];
    v19 = v5;
    v20 = (id)objc_msgSend(v16, "thenWithBlock:", v26);

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
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = objc_opt_class();
      AMSLogKey();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v34 = v23;
      v35 = 2114;
      v36 = v24;
      _os_log_impl(&dword_211102000, v22, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed for bad arguments.", buf, 0x16u);

    }
    v25 = a1[5];
    AMSError();
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "finishWithError:", v19);
  }

}

id __54__AMSUIWebAuthorizeApplePayEnrollmentAction_runAction__block_invoke_28(uint64_t a1, void *a2)
{
  objc_class *v3;
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
  uint64_t v14;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;

  v3 = (objc_class *)MEMORY[0x24BE080A8];
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithPaymentSession:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "confirmationStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setConfirmationStyle:", objc_msgSend(v6, "integerValue"));

  objc_msgSend(v5, "setCountryCode:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v5, "setCurrencyCode:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 40), "passSerialNumber");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPassSerialNumber:", v7);

  objc_msgSend(*(id *)(a1 + 40), "passTypeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPassTypeIdentifier:", v8);

  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "value");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPresentationSceneIdentifier:", v10);

  objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "value");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPresentationSceneBundleIdentifier:", v12);

  objc_msgSend(v5, "performCardAuthorization");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __54__AMSUIWebAuthorizeApplePayEnrollmentAction_runAction__block_invoke_2_30;
  v18[3] = &unk_24CB50AC8;
  v19 = *(id *)(a1 + 64);
  objc_msgSend(v13, "addSuccessBlock:", v18);
  v16[0] = v14;
  v16[1] = 3221225472;
  v16[2] = __54__AMSUIWebAuthorizeApplePayEnrollmentAction_runAction__block_invoke_3;
  v16[3] = &unk_24CB4F560;
  v17 = *(id *)(a1 + 64);
  objc_msgSend(v13, "addErrorBlock:", v16);

  return v13;
}

void __54__AMSUIWebAuthorizeApplePayEnrollmentAction_runAction__block_invoke_2_30(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "token");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "paymentData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "base64EncodedStringWithOptions:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);
  v8 = CFSTR("payment");
  v9[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "finishWithResult:", v7);

}

uint64_t __54__AMSUIWebAuthorizeApplePayEnrollmentAction_runAction__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
}

- (NSNumber)confirmationStyle
{
  return self->_confirmationStyle;
}

- (void)setConfirmationStyle:(id)a3
{
  objc_storeStrong((id *)&self->_confirmationStyle, a3);
}

- (NSString)passSerialNumber
{
  return self->_passSerialNumber;
}

- (void)setPassSerialNumber:(id)a3
{
  objc_storeStrong((id *)&self->_passSerialNumber, a3);
}

- (NSString)passTypeIdentifier
{
  return self->_passTypeIdentifier;
}

- (void)setPassTypeIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_passTypeIdentifier, a3);
}

- (NSDictionary)paymentSession
{
  return self->_paymentSession;
}

- (void)setPaymentSession:(id)a3
{
  objc_storeStrong((id *)&self->_paymentSession, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentSession, 0);
  objc_storeStrong((id *)&self->_passTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_passSerialNumber, 0);
  objc_storeStrong((id *)&self->_confirmationStyle, 0);
}

@end

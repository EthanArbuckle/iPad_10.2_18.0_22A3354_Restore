@implementation AMSUIWebJSTelephony

- (AMSUIWebJSTelephony)init
{
  return -[AMSUIWebJSTelephony initWithDelegate:](self, "initWithDelegate:", 0);
}

- (AMSUIWebJSTelephony)initWithDelegate:(id)a3
{
  id v4;
  AMSUIWebJSTelephony *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *telephonyQueue;
  uint64_t v8;
  CoreTelephonyClient *telephonyClient;
  CoreTelephonyClient *v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  CTXPCServiceSubscriptionContext *telephonyContext;
  AMSUIWebJSTelephony *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  id v26;
  objc_super v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  _BOOL4 v31;
  __int16 v32;
  _BOOL4 v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)AMSUIWebJSTelephony;
  v5 = -[AMSUIWebJSTelephony init](&v27, sel_init);
  if (!v5)
    goto LABEL_9;
  if (!+[AMSUIWebJSTelephony _hasCellularTelephonyCapability](AMSUIWebJSTelephony, "_hasCellularTelephonyCapability"))
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v12, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_23;
    v18 = objc_opt_class();
    *(_DWORD *)buf = 138543362;
    v29 = v18;
    v19 = "%{public}@ Not capable for telephony";
LABEL_22:
    _os_log_impl(&dword_211102000, v11, OS_LOG_TYPE_ERROR, v19, buf, 0xCu);
LABEL_23:

    v17 = 0;
    goto LABEL_24;
  }
  if (!+[AMSUIWebJSTelephony _hasRequiredTelephonyEntitlement](AMSUIWebJSTelephony, "_hasRequiredTelephonyEntitlement"))
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v12, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_23;
    v20 = objc_opt_class();
    *(_DWORD *)buf = 138543362;
    v29 = v20;
    v19 = "%{public}@ Not entitled for telephony";
    goto LABEL_22;
  }
  objc_storeWeak((id *)&v5->_delegate, v4);
  v6 = dispatch_queue_create("com.apple.AppleMediaServicesUI.webTelephony", 0);
  telephonyQueue = v5->_telephonyQueue;
  v5->_telephonyQueue = (OS_dispatch_queue *)v6;

  v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDC2810]), "initWithQueue:", v5->_telephonyQueue);
  telephonyClient = v5->_telephonyClient;
  v5->_telephonyClient = (CoreTelephonyClient *)v8;

  -[CoreTelephonyClient setDelegate:](v5->_telephonyClient, "setDelegate:", v5);
  v10 = v5->_telephonyClient;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v12, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_23;
    v21 = objc_opt_class();
    *(_DWORD *)buf = 138543362;
    v29 = v21;
    v19 = "%{public}@ Failed to initialize telephony client.";
    goto LABEL_22;
  }
  v26 = 0;
  -[CoreTelephonyClient getActiveContexts:](v10, "getActiveContexts:", &v26);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v26;
  -[NSObject voicePreferred](v11, "voicePreferred");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[NSObject findForUuid:](v11, "findForUuid:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "context");
    v15 = objc_claimAutoreleasedReturnValue();
    telephonyContext = v5->_telephonyContext;
    v5->_telephonyContext = (CTXPCServiceSubscriptionContext *)v15;

  }
  if (!v5->_telephonyContext)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v23)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v23, "OSLogObject");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = objc_opt_class();
      *(_DWORD *)buf = 138544130;
      v29 = v25;
      v30 = 1024;
      v31 = v13 != 0;
      v32 = 1024;
      v33 = v11 != 0;
      v34 = 2114;
      v35 = v12;
      _os_log_impl(&dword_211102000, v24, OS_LOG_TYPE_ERROR, "%{public}@ Failed to initialize telephony context. (hasUUID: %d hasContexts: %d) %{public}@", buf, 0x22u);
    }

    goto LABEL_23;
  }

LABEL_9:
  v17 = v5;
LABEL_24:

  return v17;
}

- (void)dealloc
{
  objc_super v3;

  -[CoreTelephonyClient setDelegate:](self->_telephonyClient, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AMSUIWebJSTelephony;
  -[AMSUIWebJSTelephony dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  -[AMSUIWebJSTelephony setDelegate:](self, "setDelegate:", 0);
}

+ (BOOL)_hasCellularTelephonyCapability
{
  return MGGetBoolAnswer();
}

+ (BOOL)_hasRequiredTelephonyEntitlement
{
  if (_hasRequiredTelephonyEntitlement_sOnceToken != -1)
    dispatch_once(&_hasRequiredTelephonyEntitlement_sOnceToken, &__block_literal_global_28);
  return _hasRequiredTelephonyEntitlement_hasEntitlement;
}

void __55__AMSUIWebJSTelephony__hasRequiredTelephonyEntitlement__block_invoke()
{
  __SecTask *v0;
  __SecTask *v1;
  CFTypeRef v2;
  void *v3;
  CFTypeID v4;
  CFErrorRef error;

  v0 = SecTaskCreateFromSelf(0);
  if (v0)
  {
    v1 = v0;
    error = 0;
    v2 = SecTaskCopyValueForEntitlement(v0, CFSTR("com.apple.CommCenter.fine-grained"), &error);
    if (v2)
    {
      v3 = (void *)v2;
      v4 = CFGetTypeID(v2);
      if (v4 == CFArrayGetTypeID())
        _hasRequiredTelephonyEntitlement_hasEntitlement = objc_msgSend(v3, "containsObject:", CFSTR("spi"));
      CFRelease(v3);
    }
    if (error)
      CFRelease(error);
    CFRelease(v1);
  }
}

- (NSString)countryCode
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__6;
  v11 = __Block_byref_object_dispose__6;
  v12 = 0;
  -[AMSUIWebJSTelephony telephonyQueue](self, "telephonyQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __34__AMSUIWebJSTelephony_countryCode__block_invoke;
  v6[3] = &unk_24CB51870;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

void __34__AMSUIWebJSTelephony_countryCode__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "telephonyClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "telephonyContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v4 = objc_msgSend(v2, "copyMobileSubscriberCountryCode:error:", v3, &v12);
  v5 = v12;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v4;

  if (v5)
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
      AMSLogableError();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v14 = v10;
      v15 = 2114;
      v16 = v11;
      _os_log_impl(&dword_211102000, v9, OS_LOG_TYPE_ERROR, "%{public}@ Failed to fetch country code. %{public}@", buf, 0x16u);

    }
  }

}

- (NSString)networkCode
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__6;
  v11 = __Block_byref_object_dispose__6;
  v12 = 0;
  -[AMSUIWebJSTelephony telephonyQueue](self, "telephonyQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __34__AMSUIWebJSTelephony_networkCode__block_invoke;
  v6[3] = &unk_24CB51870;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

void __34__AMSUIWebJSTelephony_networkCode__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "telephonyClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "telephonyContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v4 = objc_msgSend(v2, "copyMobileSubscriberNetworkCode:error:", v3, &v12);
  v5 = v12;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v4;

  if (v5)
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
      AMSLogableError();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v14 = v10;
      v15 = 2114;
      v16 = v11;
      _os_log_impl(&dword_211102000, v9, OS_LOG_TYPE_ERROR, "%{public}@ Failed to fetch network code. %{public}@", buf, 0x16u);

    }
  }

}

- (NSString)phoneNumber
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__6;
  v11 = __Block_byref_object_dispose__6;
  v12 = 0;
  -[AMSUIWebJSTelephony telephonyQueue](self, "telephonyQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __34__AMSUIWebJSTelephony_phoneNumber__block_invoke;
  v6[3] = &unk_24CB4F200;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

void __34__AMSUIWebJSTelephony_phoneNumber__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  BOOL v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "telephonyClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "telephonyContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v2, "getPhoneNumber:error:", v3, &v14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v14;

  if (v4)
    v6 = v5 == 0;
  else
    v6 = 0;
  if (!v6)
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
      AMSLogableError();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v16 = v9;
      v17 = 2114;
      v18 = v10;
      _os_log_impl(&dword_211102000, v8, OS_LOG_TYPE_ERROR, "%{public}@ Failed to fetch phone number. %{public}@", buf, 0x16u);

    }
  }
  objc_msgSend(v4, "number");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

}

- (NSString)providerName
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__6;
  v11 = __Block_byref_object_dispose__6;
  v12 = 0;
  -[AMSUIWebJSTelephony telephonyQueue](self, "telephonyQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __35__AMSUIWebJSTelephony_providerName__block_invoke;
  v6[3] = &unk_24CB4F200;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

void __35__AMSUIWebJSTelephony_providerName__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC2700]), "initWithBundleType:", 1);
  objc_msgSend(*(id *)(a1 + 32), "telephonyClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "telephonyContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v5 = (void *)objc_msgSend(v3, "copyCarrierBundleValue:key:bundleType:error:", v4, CFSTR("CarrierName"), v2, &v15);
  v6 = v15;

  v7 = v5;
  objc_opt_class();
  v8 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  if (v6)
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
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = objc_opt_class();
      AMSLogableError();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v17 = v13;
      v18 = 2114;
      v19 = v14;
      _os_log_impl(&dword_211102000, v12, OS_LOG_TYPE_ERROR, "%{public}@ Failed to fetch provider name. %{public}@", buf, 0x16u);

    }
  }

}

- (NSString)radioTechnology
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE082B8], "lastConnectionReport");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BE07EC0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)radioType
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE082B8], "lastConnectionReport");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BE07EB8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)formattedPhoneNumber:(id)a3
{
  return (id)CPPhoneNumberCopyFormattedStringForTextMessage();
}

- (void)operatorNameChanged:(id)a3 name:(id)a4
{
  id v5;

  -[AMSUIWebJSTelephony delegate](self, "delegate", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "telephonyDidChange:", self);

}

- (void)phoneNumberAvailable:(id)a3
{
  id v4;

  -[AMSUIWebJSTelephony delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "telephonyDidChange:", self);

}

- (void)phoneNumberChanged:(id)a3
{
  id v4;

  -[AMSUIWebJSTelephony delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "telephonyDidChange:", self);

}

- (AMSUIWebJSTelephonyDelegate)delegate
{
  return (AMSUIWebJSTelephonyDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CoreTelephonyClient)telephonyClient
{
  return self->_telephonyClient;
}

- (void)setTelephonyClient:(id)a3
{
  objc_storeStrong((id *)&self->_telephonyClient, a3);
}

- (CTXPCServiceSubscriptionContext)telephonyContext
{
  return self->_telephonyContext;
}

- (void)setTelephonyContext:(id)a3
{
  objc_storeStrong((id *)&self->_telephonyContext, a3);
}

- (BOOL)telephonySetupFailed
{
  return self->_telephonySetupFailed;
}

- (void)setTelephonySetupFailed:(BOOL)a3
{
  self->_telephonySetupFailed = a3;
}

- (OS_dispatch_queue)telephonyQueue
{
  return self->_telephonyQueue;
}

- (void)setTelephonyQueue:(id)a3
{
  objc_storeStrong((id *)&self->_telephonyQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telephonyQueue, 0);
  objc_storeStrong((id *)&self->_telephonyContext, 0);
  objc_storeStrong((id *)&self->_telephonyClient, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

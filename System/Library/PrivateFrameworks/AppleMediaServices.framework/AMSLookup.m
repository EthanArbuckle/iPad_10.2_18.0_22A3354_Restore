@implementation AMSLookup

+ (AMSBagKeySet)bagKeySet
{
  return objc_alloc_init(AMSBagKeySet);
}

- (AMSLookup)initWithBag:(id)a3 caller:(id)a4 keyProfile:(id)a5
{
  id v9;
  id v10;
  id v11;
  AMSLookup *v12;
  AMSLookup *v13;
  uint64_t v14;
  AMSProcessInfo *clientInfo;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)AMSLookup;
  v12 = -[AMSTask init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_bag, a3);
    v13->_version = 2;
    +[AMSProcessInfo currentProcess](AMSProcessInfo, "currentProcess");
    v14 = objc_claimAutoreleasedReturnValue();
    clientInfo = v13->_clientInfo;
    v13->_clientInfo = (AMSProcessInfo *)v14;

    objc_storeStrong((id *)&v13->_caller, a4);
    objc_storeStrong((id *)&v13->_keyProfile, a5);
  }

  return v13;
}

- (id)performLookupWithBundleIdentifiers:(id)a3 itemIdentifiers:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL4 v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  AMSGenerateLogCorrelationKey();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSLookup bag](self, "bag");
  v9 = objc_claimAutoreleasedReturnValue();
  -[AMSLookup contract](self, "contract");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v9 | v10)
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __64__AMSLookup_performLookupWithBundleIdentifiers_itemIdentifiers___block_invoke;
    v19[3] = &unk_1E2542930;
    v19[4] = self;
    v20 = v8;
    v21 = (id)v9;
    v22 = (id)v10;
    v23 = v6;
    v24 = v7;
    -[AMSTask performTaskWithPromiseBlock:](self, "performTaskWithPromiseBlock:", v19);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = +[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests");
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v11)
    {
      if (!v12)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v13, "OSLogObject");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v26 = objc_opt_class();
        v27 = 2114;
        v28 = v8;
        _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] AMSLookup requires its bag or contract properties to be set.", buf, 0x16u);
      }

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v15 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "postNotificationName:object:userInfo:", CFSTR("com.apple.AppleMediaServicesTests.FaultLogged"), v15, 0);
    }
    else
    {
      if (!v12)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v13, "OSLogObject");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543618;
        v26 = objc_opt_class();
        v27 = 2114;
        v28 = v8;
        _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_FAULT, "%{public}@: [%{public}@] AMSLookup requires its bag or contract properties to be set.", buf, 0x16u);
      }
    }

    AMSError(2, CFSTR("AMSLookup failed"), CFSTR("Neither bag nor bag contract was provided."), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v17);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v16;
}

id __64__AMSLookup_performLookupWithBundleIdentifiers_itemIdentifiers___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  AMSURLRequestEncoder *v7;
  AMSURLRequestEncoder *v8;
  AMSURLRequestEncoder *v9;
  void *v10;
  AMSLookupDecoder *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v26[5];
  id v27;
  _QWORD v28[5];
  id v29;
  id v30;
  _QWORD v31[4];
  AMSURLRequestEncoder *v32;
  id v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v2, "OSLogObject");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = objc_opt_class();
    v5 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v35 = v4;
    v36 = 2114;
    v37 = v5;
    _os_log_impl(&dword_18C849000, v3, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Starting lookup request", buf, 0x16u);
  }

  v6 = *(_QWORD *)(a1 + 48);
  v7 = [AMSURLRequestEncoder alloc];
  if (v6)
    v8 = -[AMSURLRequestEncoder initWithBag:](v7, "initWithBag:", *(_QWORD *)(a1 + 48));
  else
    v8 = -[AMSURLRequestEncoder initWithBagContract:](v7, "initWithBagContract:", *(_QWORD *)(a1 + 56));
  v9 = v8;
  -[AMSURLRequestEncoder setLogUUID:](v8, "setLogUUID:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "clientInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSURLRequestEncoder setClientInfo:](v9, "setClientInfo:", v10);

  v11 = objc_alloc_init(AMSLookupDecoder);
  -[AMSURLRequestEncoder setResponseDecoder:](v9, "setResponseDecoder:", v11);

  if (objc_msgSend(*(id *)(a1 + 32), "signatureType") == 1)
    -[AMSURLRequestEncoder setMescalType:](v9, "setMescalType:", 1);
  v12 = *(void **)(a1 + 48);
  if (v12)
  {
    objc_msgSend(v12, "URLForKey:", 0x1E254D340);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v15 = v13;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "URLForKey:", 0x1E254D320);
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    v16 = v15;

    goto LABEL_18;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 56), "unpersonalizedLookupURL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      v17 = CFSTR("Bag contract provided a nil unpersonalized URL.");
LABEL_24:
      AMSError(0, CFSTR("Bag lookup URL fetch failed"), v17, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v16);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v17 = CFSTR("Bag contract doesn't support providing either personalized or unpersonalized URLs.");
      goto LABEL_24;
    }
    objc_msgSend(*(id *)(a1 + 56), "personalizedLookupURL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      v17 = CFSTR("Bag contract provided a nil personalized URL.");
      goto LABEL_24;
    }
  }
LABEL_18:
  objc_msgSend(*(id *)(a1 + 32), "_compileQueryParametersWithBundleIds:itemIds:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "valuePromise");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __64__AMSLookup_performLookupWithBundleIdentifiers_itemIdentifiers___block_invoke_56;
  v31[3] = &unk_1E2541EB8;
  v32 = v9;
  v33 = v18;
  v21 = v18;
  objc_msgSend(v19, "thenWithBlock:", v31);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v20;
  v28[1] = 3221225472;
  v28[2] = __64__AMSLookup_performLookupWithBundleIdentifiers_itemIdentifiers___block_invoke_2;
  v28[3] = &unk_1E2540FD0;
  v28[4] = *(_QWORD *)(a1 + 32);
  v29 = *(id *)(a1 + 48);
  v30 = *(id *)(a1 + 56);
  objc_msgSend(v22, "thenWithBlock:", v28);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v26[0] = v20;
  v26[1] = 3221225472;
  v26[2] = __64__AMSLookup_performLookupWithBundleIdentifiers_itemIdentifiers___block_invoke_5;
  v26[3] = &unk_1E253D950;
  v24 = *(void **)(a1 + 40);
  v26[4] = *(_QWORD *)(a1 + 32);
  v27 = v24;
  objc_msgSend(v23, "addErrorBlock:", v26);

LABEL_19:
  return v23;
}

uint64_t __64__AMSLookup_performLookupWithBundleIdentifiers_itemIdentifiers___block_invoke_56(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "requestWithMethod:URL:parameters:", 2, a2, *(_QWORD *)(a1 + 40));
}

id __64__AMSLookup_performLookupWithBundleIdentifiers_itemIdentifiers___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  AMSContractBagShim *v11;
  AMSContractBagShim *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = (id)objc_msgSend(v3, "mutableCopy");
  v5 = v4;
  if (!objc_msgSend(*(id *)(a1 + 32), "signatureType"))
    objc_msgSend(*(id *)(a1 + 32), "_addJSSignatureToRequest:", v5);
  objc_msgSend(*(id *)(a1 + 32), "clientInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    +[AMSProcessInfo currentProcess](AMSProcessInfo, "currentProcess");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  v10 = *(void **)(a1 + 40);
  if (v10)
    v11 = v10;
  else
    v11 = -[AMSContractBagShim initWithBagContract:]([AMSContractBagShim alloc], "initWithBagContract:", *(_QWORD *)(a1 + 48));
  v12 = v11;
  objc_msgSend(MEMORY[0x1E0C92CA0], "ams_configurationWithClientInfo:bag:", v9, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __64__AMSLookup_performLookupWithBundleIdentifiers_itemIdentifiers___block_invoke_3;
  v17[3] = &unk_1E2542908;
  v18 = v5;
  v14 = v5;
  objc_msgSend(v13, "thenWithBlock:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

id __64__AMSLookup_performLookupWithBundleIdentifiers_itemIdentifiers___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  AMSURLSession *v4;
  void *v5;
  AMSURLSession *v6;
  _QWORD v8[4];
  AMSURLSession *v9;

  v3 = a2;
  v4 = -[AMSURLSession initWithConfiguration:]([AMSURLSession alloc], "initWithConfiguration:", v3);

  -[AMSURLSession dataTaskPromiseWithRequest:](v4, "dataTaskPromiseWithRequest:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__AMSLookup_performLookupWithBundleIdentifiers_itemIdentifiers___block_invoke_4;
  v8[3] = &unk_1E25428E0;
  v9 = v4;
  v6 = v4;
  objc_msgSend(v5, "addFinishBlock:", v8);

  return v5;
}

uint64_t __64__AMSLookup_performLookupWithBundleIdentifiers_itemIdentifiers___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishTasksAndInvalidate");
}

void __64__AMSLookup_performLookupWithBundleIdentifiers_itemIdentifiers___block_invoke_5(uint64_t a1, void *a2)
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

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = objc_opt_class();
    v7 = *(_QWORD *)(a1 + 40);
    AMSLogableError(v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543874;
    v10 = v6;
    v11 = 2114;
    v12 = v7;
    v13 = 2114;
    v14 = v8;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] AMSLookup failed. error = %{public}@", (uint8_t *)&v9, 0x20u);

  }
}

+ (NSString)bagSubProfile
{
  if (_MergedGlobals_1_9 != -1)
    dispatch_once(&_MergedGlobals_1_9, &__block_literal_global_69);
  return (NSString *)(id)qword_1ECEACB38;
}

void __26__AMSLookup_bagSubProfile__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECEACB38;
  qword_1ECEACB38 = (uint64_t)CFSTR("AMSLookup");

}

+ (NSString)bagSubProfileVersion
{
  if (qword_1ECEACB40 != -1)
    dispatch_once(&qword_1ECEACB40, &__block_literal_global_70_0);
  return (NSString *)(id)qword_1ECEACB48;
}

void __33__AMSLookup_bagSubProfileVersion__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECEACB48;
  qword_1ECEACB48 = (uint64_t)CFSTR("1");

}

+ (id)createBagForSubProfile
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "bagSubProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "bagSubProfileVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSBag bagForProfile:profileVersion:](AMSBag, "bagForProfile:profileVersion:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_addJSSignatureToRequest:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  id v22;
  const void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  CC_LONG v30;
  id v31;
  id v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  NSObject *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t buf[4];
  uint64_t v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  void *v60;
  _BYTE v61[128];
  _QWORD v62[5];

  v62[3] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSince1970");
  v7 = v6;

  objc_msgSend(v4, "appendFormat:", CFSTR("%.0f"), v7);
  v50 = v7;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.0f"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forHTTPHeaderField:", v8, CFSTR("X-JS-TIMESTAMP"));

  objc_msgSend(v3, "valueForHTTPHeaderField:", CFSTR("X-Apple-Store-Front"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v4, "appendString:", v9);
  }
  else
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
      v56 = v12;
      v57 = 2114;
      v58 = v13;
      _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] JS sign is missing a storefront", buf, 0x16u);

    }
  }
  objc_msgSend(v3, "URL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "ams_parameters");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v62[0] = CFSTR("caller");
  v62[1] = CFSTR("id");
  v62[2] = CFSTR("p");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 3);
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v52 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(v15, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
          objc_msgSend(v4, "appendString:", v21);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
    }
    while (v18);
  }

  v22 = objc_retainAutorelease(v4);
  v23 = (const void *)objc_msgSend(v22, "UTF8String");
  if (!objc_msgSend(v22, "length"))
  {
    AMSErrorWithFormat(0, CFSTR("Lookup JS Failed"), CFSTR("Signature string is empty"), v24, v25, v26, v27, v28, v7);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v39)
      goto LABEL_33;
    goto LABEL_28;
  }
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 20);
  v30 = objc_msgSend(v22, "length");
  v31 = objc_retainAutorelease(v29);
  CC_SHA1(v23, v30, (unsigned __int8 *)objc_msgSend(v31, "mutableBytes"));
  objc_msgSend(v31, "setLength:", 16);
  v32 = objc_retainAutorelease(v31);
  fd3fa4R8(3, objc_msgSend(v32, "mutableBytes"));
  if (v33)
  {
    AMSErrorWithFormat(0, CFSTR("Lookup JS Failed"), CFSTR("JS sign returned invalid status code: %ld"), v34, v35, v36, v37, v38, v33);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v39 = 0;
  }
  objc_msgSend(v32, "base64EncodedStringWithOptions:", 0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v40, "length"))
  {
    objc_msgSend(v3, "setValue:forHTTPHeaderField:", v40, CFSTR("X-JS-SP-TOKEN"));
  }
  else if (!v39)
  {
    AMSErrorWithFormat(0, CFSTR("Lookup JS Failed"), CFSTR("Signature cookie value is empty"), v41, v42, v43, v44, v45, v50);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v39)
  {
LABEL_28:
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v46)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v46, "OSLogObject");
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      v48 = objc_opt_class();
      AMSLogKey();
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v56 = v48;
      v57 = 2114;
      v58 = v49;
      v59 = 2114;
      v60 = v39;
      _os_log_impl(&dword_18C849000, v47, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error occurred during JS sign: %{public}@", buf, 0x20u);

    }
  }
LABEL_33:

}

- (id)_compileQueryParametersWithBundleIds:(id)a3 itemIds:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v6 = a4;
  v7 = (objc_class *)MEMORY[0x1E0C99E08];
  v8 = a3;
  v9 = objc_alloc_init(v7);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), -[AMSLookup version](self, "version"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("version"));

  objc_msgSend(v8, "componentsJoinedByString:", CFSTR(","));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("bundleId"));
  -[AMSLookup caller](self, "caller");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    goto LABEL_7;
  -[AMSLookup clientInfo](self, "clientInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    goto LABEL_7;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12
    || (objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v15, "processName"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v15,
        v12))
  {
LABEL_7:
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, CFSTR("caller"));

  }
  -[AMSLookup imageProfile](self, "imageProfile");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[AMSLookup imageProfile](self, "imageProfile");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v17, CFSTR("artwork"));

  }
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(","));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v18, CFSTR("id"));
  -[AMSLookup keyProfile](self, "keyProfile");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[AMSLookup keyProfile](self, "keyProfile");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v20, CFSTR("p"));

  }
  -[AMSLookup platform](self, "platform");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[AMSLookup platform](self, "platform");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v22, CFSTR("platform"));

  }
  -[AMSLookup language](self, "language");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[AMSLookup language](self, "language");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v24, CFSTR("lang"));

  }
  return v9;
}

- (AMSLookup)initWithBagContract:(id)a3
{
  return -[AMSLookup initWithBagContract:caller:keyProfile:](self, "initWithBagContract:caller:keyProfile:", a3, 0, 0);
}

- (AMSLookup)initWithBagContract:(id)a3 caller:(id)a4 keyProfile:(id)a5
{
  id v8;
  id v9;
  id v10;
  AMSContractBagShim *v11;
  AMSLookup *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[AMSContractBagShim initWithBagContract:]([AMSContractBagShim alloc], "initWithBagContract:", v10);

  v12 = -[AMSLookup initWithBag:caller:keyProfile:](self, "initWithBag:caller:keyProfile:", v11, v9, v8);
  return v12;
}

- (id)contract
{
  AMSDeprecatedBagContract *v3;
  void *v4;
  AMSDeprecatedBagContract *v5;

  v3 = [AMSDeprecatedBagContract alloc];
  -[AMSLookup bag](self, "bag");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[AMSDeprecatedBagContract initWithBag:](v3, "initWithBag:", v4);

  return v5;
}

- (void)setContract:(id)a3
{
  id v4;
  AMSContractBagShim *v5;

  v4 = a3;
  v5 = -[AMSContractBagShim initWithBagContract:]([AMSContractBagShim alloc], "initWithBagContract:", v4);

  -[AMSLookup setBag:](self, "setBag:", v5);
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
  objc_storeStrong((id *)&self->_bag, a3);
}

- (NSString)caller
{
  return self->_caller;
}

- (void)setCaller:(id)a3
{
  objc_storeStrong((id *)&self->_caller, a3);
}

- (AMSProcessInfo)clientInfo
{
  return self->_clientInfo;
}

- (void)setClientInfo:(id)a3
{
  objc_storeStrong((id *)&self->_clientInfo, a3);
}

- (NSString)imageProfile
{
  return self->_imageProfile;
}

- (void)setImageProfile:(id)a3
{
  objc_storeStrong((id *)&self->_imageProfile, a3);
}

- (NSString)keyProfile
{
  return self->_keyProfile;
}

- (void)setKeyProfile:(id)a3
{
  objc_storeStrong((id *)&self->_keyProfile, a3);
}

- (NSString)platform
{
  return self->_platform;
}

- (void)setPlatform:(id)a3
{
  objc_storeStrong((id *)&self->_platform, a3);
}

- (int64_t)signatureType
{
  return self->_signatureType;
}

- (void)setSignatureType:(int64_t)a3
{
  self->_signatureType = a3;
}

- (int64_t)version
{
  return self->_version;
}

- (void)setVersion:(int64_t)a3
{
  self->_version = a3;
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_language, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_keyProfile, 0);
  objc_storeStrong((id *)&self->_imageProfile, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_caller, 0);
  objc_storeStrong((id *)&self->_bag, 0);
}

@end

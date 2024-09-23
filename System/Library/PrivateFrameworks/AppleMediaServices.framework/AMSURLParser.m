@implementation AMSURLParser

+ (AMSBagKeySet)bagKeySet
{
  return objc_alloc_init(AMSBagKeySet);
}

- (AMSURLParser)initWithBag:(id)a3
{
  id v5;
  AMSURLParser *v6;
  AMSURLParser *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSURLParser;
  v6 = -[AMSURLParser init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_bag, a3);

  return v7;
}

- (id)isCommerceUIURL:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];

  -[AMSURLParser _correctURL:](self, "_correctURL:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    -[AMSURLParser _commerceUIArrayForKey:](self, "_commerceUIArrayForKey:", CFSTR("url-patterns"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __32__AMSURLParser_isCommerceUIURL___block_invoke;
    v15[3] = &unk_1E253E120;
    v15[4] = self;
    objc_msgSend(v7, "addErrorBlock:", v15);
    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = __32__AMSURLParser_isCommerceUIURL___block_invoke_19;
    v13[3] = &unk_1E25422F8;
    v13[4] = self;
    v14 = v4;
    objc_msgSend(v7, "thenWithBlock:", v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSBinaryPromise promiseWithPromise:](AMSBinaryPromise, "promiseWithPromise:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    AMSError(2, CFSTR("No URL to match"), CFSTR("There was no URL passed in for matching"), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSBinaryPromise promiseWithError:](AMSBinaryPromise, "promiseWithError:", v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

void __32__AMSURLParser_isCommerceUIURL___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "OSLogObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 138543618;
    v6 = objc_opt_class();
    v7 = 2114;
    v8 = v2;
    _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_ERROR, "%{public}@: There was no bag value found for commerce UI URL patterns. [%{public}@]", (uint8_t *)&v5, 0x16u);
  }

}

id __32__AMSURLParser_isCommerceUIURL___block_invoke_19(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;

  if (objc_msgSend(*(id *)(a1 + 32), "_matchURL:toPatterns:", *(_QWORD *)(a1 + 40), a2))
  {
    +[AMSBinaryPromise promiseWithSuccess](AMSBinaryPromise, "promiseWithSuccess");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "promiseAdapter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    AMSError(7, CFSTR("Commerce UI URL not found"), CFSTR("The parsed URL did not match a commerce UI URL pattern"), 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSBinaryPromise promiseWithError:](AMSBinaryPromise, "promiseWithError:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "promiseAdapter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)typeForCommerceUIURL:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  AMSMutablePromise *v7;
  void *v8;
  AMSMutablePromise *v9;
  void *v10;
  _QWORD v12[4];
  AMSMutablePromise *v13;

  -[AMSURLParser _correctURL:](self, "_correctURL:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    v7 = objc_alloc_init(AMSMutablePromise);
    -[AMSURLParser typeForURL:](self, "typeForURL:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __37__AMSURLParser_typeForCommerceUIURL___block_invoke;
    v12[3] = &unk_1E253DF98;
    v9 = v7;
    v13 = v9;
    objc_msgSend(v8, "addFinishBlock:", v12);

  }
  else
  {
    AMSError(2, CFSTR("No URL to match"), CFSTR("There was no URL passed in for matching"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v10);
    v9 = (AMSMutablePromise *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

void __37__AMSURLParser_typeForCommerceUIURL___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:");
    return;
  }
  v4 = objc_msgSend(a2, "integerValue");
  if (v4 == 1)
  {
    v5 = *(void **)(a1 + 32);
    v6 = &unk_1E25AFB30;
    goto LABEL_7;
  }
  if (!v4)
  {
    v5 = *(void **)(a1 + 32);
    v6 = &unk_1E25AFB18;
LABEL_7:
    objc_msgSend(v5, "finishWithResult:", v6);
    return;
  }
  v7 = *(void **)(a1 + 32);
  AMSError(7, CFSTR("Commerce UI URL Type Not Found"), CFSTR("The parsed URL did not match a commerce UI URL pattern"), 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "finishWithError:", v8);

}

- (id)typeForURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  AMSMutablePromise *v13;
  AMSMutablePromise *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  AMSMutablePromise *v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  AMSMutablePromise *v26;
  id v27;

  v4 = a3;
  -[AMSURLParser bag](self, "bag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[AMSURLParser _correctURL:](self, "_correctURL:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "absoluteString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length");

    if (!v8)
    {
      AMSError(2, CFSTR("No URL to match"), CFSTR("There was no URL passed in for matching"), 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v20);
      v19 = (AMSMutablePromise *)objc_claimAutoreleasedReturnValue();

      v4 = v6;
      goto LABEL_7;
    }
    -[AMSURLParser _defaultWebAllowedForURL:](self, "_defaultWebAllowedForURL:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSURLParser _dynamicUIAllowedForURL:](self, "_dynamicUIAllowedForURL:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSURLParser _legacyWebAllowedForURL:](self, "_legacyWebAllowedForURL:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "ams_addNullableObject:", v9);
    objc_msgSend(v12, "ams_addNullableObject:", v10);
    objc_msgSend(v12, "ams_addNullableObject:", v11);
    v13 = objc_alloc_init(AMSMutablePromise);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __27__AMSURLParser_typeForURL___block_invoke;
    v22[3] = &unk_1E2541440;
    v23 = v9;
    v24 = v10;
    v25 = v11;
    v14 = v13;
    v26 = v14;
    v4 = v6;
    v27 = v4;
    v15 = v11;
    v16 = v10;
    v17 = v9;
    -[AMSURLParser _waitForPromises:block:](self, "_waitForPromises:block:", v12, v22);
    v18 = v27;
    v19 = v14;

  }
  else
  {
    AMSError(2, CFSTR("Missing bag"), CFSTR("No bag was passed in"), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v12);
    v19 = (AMSMutablePromise *)objc_claimAutoreleasedReturnValue();
  }

LABEL_7:
  return v19;
}

void __27__AMSURLParser_typeForURL___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "resultWithError:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  if ((v3 & 1) != 0)
  {
    v4 = &unk_1E25AFB18;
LABEL_7:
    objc_msgSend(*(id *)(a1 + 56), "finishWithResult:", v4);
    return;
  }
  objc_msgSend(*(id *)(a1 + 40), "resultWithError:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if ((v6 & 1) != 0)
  {
    v4 = &unk_1E25AFB48;
    goto LABEL_7;
  }
  objc_msgSend(*(id *)(a1 + 48), "resultWithError:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  if (v8)
  {
    v4 = &unk_1E25AFB30;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The parsed URL did not match a commerce UI URL pattern, %@"), *(_QWORD *)(a1 + 64));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v9 = *(void **)(a1 + 56);
  AMSError(7, CFSTR("URL Type Not Found"), v11, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "finishWithError:", v10);

}

+ (NSString)bagSubProfile
{
  if (_MergedGlobals_150 != -1)
    dispatch_once(&_MergedGlobals_150, &__block_literal_global_131);
  return (NSString *)(id)qword_1ECEAD928;
}

void __29__AMSURLParser_bagSubProfile__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECEAD928;
  qword_1ECEAD928 = (uint64_t)CFSTR("AMSURLParser");

}

+ (NSString)bagSubProfileVersion
{
  if (qword_1ECEAD930 != -1)
    dispatch_once(&qword_1ECEAD930, &__block_literal_global_46_2);
  return (NSString *)(id)qword_1ECEAD938;
}

void __36__AMSURLParser_bagSubProfileVersion__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECEAD938;
  qword_1ECEAD938 = (uint64_t)CFSTR("1");

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

- (AMSURLParser)initWithBagContract:(id)a3
{
  id v4;
  AMSContractBagShim *v5;
  AMSURLParser *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[AMSContractBagShim initWithBagContract:]([AMSContractBagShim alloc], "initWithBagContract:", v4);

  }
  else
  {
    v5 = 0;
  }
  v6 = -[AMSURLParser initWithBag:](self, "initWithBag:", v5);

  return v6;
}

- (id)bagContract
{
  AMSDeprecatedBagContract *v3;
  void *v4;
  AMSDeprecatedBagContract *v5;

  v3 = [AMSDeprecatedBagContract alloc];
  -[AMSURLParser bag](self, "bag");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[AMSDeprecatedBagContract initWithBag:](v3, "initWithBag:", v4);

  return v5;
}

- (id)_commerceUIArrayForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  -[AMSURLParser bag](self, "bag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryForKey:", CFSTR("commerce-ui-urls"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "valuePromise");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __39__AMSURLParser__commerceUIArrayForKey___block_invoke;
  v11[3] = &unk_1E2540030;
  v12 = v4;
  v8 = v4;
  objc_msgSend(v7, "thenWithBlock:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __39__AMSURLParser__commerceUIArrayForKey___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  objc_msgSend(a2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_5;
  }
  v4 = v3;

  if (!v4)
  {
LABEL_5:
    AMSErrorWithFormat(7, CFSTR("CommerceUI Value Not Found"), CFSTR("Bag value not found for key: %@"), v5, v6, v7, v8, v9, *(_QWORD *)(a1 + 32));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = 0;
    goto LABEL_6;
  }
  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v10;
}

- (id)_defaultWebAllowedForURL:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  -[AMSURLParser _commerceUIArrayForKey:](self, "_commerceUIArrayForKey:", CFSTR("v2-url-patterns"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __41__AMSURLParser__defaultWebAllowedForURL___block_invoke;
  v9[3] = &unk_1E25422F8;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "thenWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __41__AMSURLParser__defaultWebAllowedForURL___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  if (objc_msgSend(*(id *)(a1 + 32), "_matchURL:toPatterns:", *(_QWORD *)(a1 + 40), a2))
  {
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", MEMORY[0x1E0C9AAB0]);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    AMSError(7, CFSTR("Commerce UI URL type not found"), CFSTR("The parsed URL did not match a commerce UI default URL pattern"), 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v3);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (id)_dynamicUIAllowedForURL:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  -[AMSURLParser _commerceUIArrayForKey:](self, "_commerceUIArrayForKey:", CFSTR("dynamic-url-patterns"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __40__AMSURLParser__dynamicUIAllowedForURL___block_invoke;
  v9[3] = &unk_1E25422F8;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "thenWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __40__AMSURLParser__dynamicUIAllowedForURL___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  if (objc_msgSend(*(id *)(a1 + 32), "_matchURL:toPatterns:", *(_QWORD *)(a1 + 40), a2))
  {
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", MEMORY[0x1E0C9AAB0]);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    AMSError(7, CFSTR("Commerce UI URL type not found"), CFSTR("The parsed URL did not match a commerce UI dynamic URL pattern"), 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v3);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (id)_legacyWebAllowedForURL:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  -[AMSURLParser _commerceUIArrayForKey:](self, "_commerceUIArrayForKey:", CFSTR("url-patterns"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __40__AMSURLParser__legacyWebAllowedForURL___block_invoke;
  v9[3] = &unk_1E25422F8;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "thenWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __40__AMSURLParser__legacyWebAllowedForURL___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  if (objc_msgSend(*(id *)(a1 + 32), "_matchURL:toPatterns:", *(_QWORD *)(a1 + 40), a2))
  {
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", MEMORY[0x1E0C9AAB0]);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    AMSError(7, CFSTR("Commerce UI URL type not found"), CFSTR("The parsed URL did not match a commerce UI legacy URL pattern"), 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v3);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (BOOL)_matchURL:(id)a3 toPatterns:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  BOOL v21;
  __int128 v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  id v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v6 = a4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v26;
    *(_QWORD *)&v8 = 138543618;
    v23 = v8;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        v24 = 0;
        objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", v12, 1, &v24, v23);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v24;
        if (v14)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v15)
          {
            +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v15, "OSLogObject");
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            v17 = objc_opt_class();
            *(_DWORD *)buf = v23;
            v30 = v17;
            v31 = 2114;
            v32 = v14;
            _os_log_impl(&dword_18C849000, v16, OS_LOG_TYPE_ERROR, "%{public}@: Invalid commerceUI pattern. %{public}@", buf, 0x16u);
          }

        }
        else
        {
          objc_msgSend(v5, "absoluteString");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "absoluteString");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v13, "numberOfMatchesInString:options:range:", v18, 2, 0, objc_msgSend(v19, "length"));

          if (v20)
          {

            v21 = 1;
            goto LABEL_17;
          }
        }

      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      if (v9)
        continue;
      break;
    }
  }
  v21 = 0;
LABEL_17:

  return v21;
}

- (id)_correctURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  uint64_t v12;

  v3 = a3;
  objc_msgSend(v3, "ams_parameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("action"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("url"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "length")
    || !objc_msgSend(v5, "isEqualToString:", CFSTR("account"))
    || (objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v6), (v7 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v7 = v3;
  }
  objc_msgSend(v7, "scheme");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    objc_msgSend(v7, "scheme");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "hasSuffix:", CFSTR("http"));

    if ((v11 & 1) == 0)
    {
      objc_msgSend(v7, "ams_URLByReplacingSchemeWithScheme:", CFSTR("https"));
      v12 = objc_claimAutoreleasedReturnValue();

      v7 = (id)v12;
    }
  }

  return v7;
}

- (void)_waitForPromises:(id)a3 block:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  +[AMSPromise promiseWithFlattenedPromises:](AMSPromise, "promiseWithFlattenedPromises:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __39__AMSURLParser__waitForPromises_block___block_invoke;
  v8[3] = &unk_1E2544D50;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "addFinishBlock:", v8);

}

uint64_t __39__AMSURLParser__waitForPromises_block___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
  objc_storeStrong((id *)&self->_bag, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bag, 0);
}

@end

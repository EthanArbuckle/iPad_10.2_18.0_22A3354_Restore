@implementation AMSMescal

+ (id)signatureUsingRequest:(id)a3 type:(int64_t)a4 bag:(id)a5 error:(id *)a6
{
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a1, "signaturePromiseFromRequest:type:bag:", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resultWithError:", a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)_DAAPActionsForURLBagActions:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  objc_msgSend(MEMORY[0x1E0CB3500], "uppercaseLetterCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "mutableCopy", (_QWORD)v16);
        v12 = objc_msgSend(v11, "rangeOfCharacterFromSet:options:range:", v5, 0, 0, objc_msgSend(v11, "length"));
        if (v12 != 0x7FFFFFFFFFFFFFFFLL)
        {
          for (j = v12;
                j != 0x7FFFFFFFFFFFFFFFLL;
                j = objc_msgSend(v11, "rangeOfCharacterFromSet:options:range:", v5, 0, j + 2, objc_msgSend(v11, "length") - (j + 2)))
          {
            objc_msgSend(v11, "insertString:atIndex:", CFSTR("-"), j);
          }
        }
        objc_msgSend(v11, "lowercaseString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v14);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  return v4;
}

+ (BOOL)verifyTask:(id)a3 data:(id)a4 type:(int64_t)a5 bag:(id)a6 error:(id *)a7
{
  void *v8;

  objc_msgSend(a1, "verificationPromiseForTask:data:type:bag:", a3, a4, a5, a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a7) = objc_msgSend(v8, "resultWithError:", a7);

  return (char)a7;
}

+ (id)_signedActionDataFromRequest:(id)a3 policy:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  void *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("headers"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v38 = v8;
    if (v8
      && (v45 = 0u,
          v46 = 0u,
          v43 = 0u,
          v44 = 0u,
          (v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v43, v48, 16)) != 0))
    {
      v11 = v10;
      v12 = 0;
      v13 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v44 != v13)
            objc_enumerationMutation(v9);
          objc_msgSend(v5, "valueForHTTPHeaderField:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v15, "dataUsingEncoding:", 4);
            v16 = objc_claimAutoreleasedReturnValue();
            if (v16)
            {
              v17 = (void *)v16;
              if (!v12)
                v12 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
              objc_msgSend(v12, "appendData:", v17);

            }
            v9 = v38;
          }

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
      }
      while (v11);
    }
    else
    {
      v12 = 0;
    }
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("fields"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v37 = v7;
      objc_msgSend(v5, "URL");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "ams_parameters");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v21 = v18;
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v40;
        do
        {
          for (j = 0; j != v23; ++j)
          {
            if (*(_QWORD *)v40 != v24)
              objc_enumerationMutation(v21);
            objc_msgSend(v20, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * j));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v26, "dataUsingEncoding:", 4);
              v27 = objc_claimAutoreleasedReturnValue();
              if (v27)
              {
                v28 = (void *)v27;
                if (!v12)
                  v12 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
                objc_msgSend(v12, "appendData:", v28);

              }
            }

          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
        }
        while (v23);
      }

      v7 = v37;
      v9 = v38;
    }
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("path"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("path"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "BOOLValue");

      if (!v31)
      {
        v9 = v38;
        goto LABEL_43;
      }
      objc_msgSend(v5, "URL");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "path");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v29, "dataUsingEncoding:", 4);
        v33 = objc_claimAutoreleasedReturnValue();
        if (v33)
        {
          v34 = (void *)v33;
          if (!v12)
            v12 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
          objc_msgSend(v12, "appendData:", v34);

        }
      }
      v9 = v38;
    }

LABEL_43:
    v35 = v12;

    goto LABEL_44;
  }
  v35 = 0;
LABEL_44:

  return v35;
}

+ (id)signatureFromData:(id)a3 type:(int64_t)a4 bag:(id)a5 error:(id *)a6
{
  void *v7;
  void *v8;

  objc_msgSend(a1, "signaturePromiseFromData:type:bag:", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resultWithError:", a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (AMSBagKeySet)bagKeySet
{
  return objc_alloc_init(AMSBagKeySet);
}

+ (id)signaturePromiseFromData:(id)a3 type:(int64_t)a4 bag:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  _QWORD v22[5];

  v8 = a3;
  v9 = a5;
  +[AMSMescalSession sessionWithType:](AMSMescalSession, "sessionWithType:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v10;
  if (!v8)
  {
    v18 = CFSTR("Data not provided");
LABEL_7:
    AMSError(2, CFSTR("Mescal Signature Failed"), v18, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v19);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }
  if (!v9)
  {
    v18 = CFSTR("Bag not provided");
    goto LABEL_7;
  }
  if (v10)
  {
    objc_msgSend(v10, "signData:bag:", v8, v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __47__AMSMescal_signaturePromiseFromData_type_bag___block_invoke;
    v22[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
    v22[4] = a1;
    objc_msgSend(v17, "addErrorBlock:", v22);
  }
  else
  {
    AMSErrorWithFormat(2, CFSTR("Mescal Signature Failed"), CFSTR("Failed to locate session for type: %d"), v11, v12, v13, v14, v15, a4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v20);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_9:

  return v17;
}

void __47__AMSMescal_signaturePromiseFromData_type_bag___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
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
    AMSLogKey();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = objc_opt_class();
    v9 = v8;
    if (v6)
    {
      AMSLogKey();
      a1 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%@: [%@] "), v9, a1);
    }
    else
    {
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%@: "), v8);
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    AMSLogableError(v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v13 = v10;
    v14 = 2114;
    v15 = v11;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_ERROR, "%{public}@Failed to mescal-sign data. Error = %{public}@", buf, 0x16u);
    if (v6)
    {

      v10 = (void *)a1;
    }

  }
}

+ (id)signaturePromiseFromRequest:(id)a3 type:(int64_t)a4 bag:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  int64_t v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;

  v8 = a3;
  v9 = a5;
  v10 = v9;
  if (!a4)
  {
    +[AMSOptional optionalWithNil](AMSOptional, "optionalWithNil");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v17);
    v18 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v19 = (void *)v18;

    goto LABEL_10;
  }
  if (!v9)
  {
    AMSError(2, CFSTR("Mescal Signature Failed"), CFSTR("Bag not provided"), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v17);
    v18 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  objc_msgSend(v8, "HTTPMethod");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("POST"));

  v13 = MEMORY[0x1E0C809B0];
  if (v12)
  {
    objc_msgSend(v10, "dictionaryForKey:", 0x1E254CD00);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "valuePromise");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v13;
    v31[1] = 3221225472;
    v31[2] = __50__AMSMescal_signaturePromiseFromRequest_type_bag___block_invoke;
    v31[3] = &unk_1E25430A0;
    v33 = a1;
    v32 = v8;
    objc_msgSend(v15, "thenWithBlock:", v31);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[AMSOptional optionalWithNil](AMSOptional, "optionalWithNil");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v27[0] = v13;
  v27[1] = 3221225472;
  v27[2] = __50__AMSMescal_signaturePromiseFromRequest_type_bag___block_invoke_2;
  v27[3] = &unk_1E25430C8;
  v20 = v10;
  v28 = v20;
  v30 = a1;
  v29 = v8;
  objc_msgSend(v16, "thenWithBlock:", v27);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v13;
  v23[1] = 3221225472;
  v23[2] = __50__AMSMescal_signaturePromiseFromRequest_type_bag___block_invoke_4;
  v23[3] = &unk_1E2543110;
  v25 = a4;
  v24 = v20;
  v26 = a1;
  objc_msgSend(v21, "thenWithBlock:", v23);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return v19;
}

id __50__AMSMescal_signaturePromiseFromRequest_type_bag___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  AMSOptional *v8;
  void *v9;
  AMSOptional *v10;

  v4 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v5 = a2;
  objc_msgSend(v4, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v3, "_matchSignSapURL:bagDictionary:", v6, v5);

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "HTTPBody");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = -[AMSOptional initWithValue:]([AMSOptional alloc], "initWithValue:", v7);
    }
    else
    {
      +[AMSOptional optionalWithNil](AMSOptional, "optionalWithNil");
      v8 = (AMSOptional *)objc_claimAutoreleasedReturnValue();
    }
    v10 = v8;
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[AMSOptional optionalWithNil](AMSOptional, "optionalWithNil");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

id __50__AMSMescal_signaturePromiseFromRequest_type_bag___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  __int128 v10;
  _QWORD v11[4];
  __int128 v12;

  v3 = a2;
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "dictionaryForKey:", 0x1E254CCE0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "valuePromise");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __50__AMSMescal_signaturePromiseFromRequest_type_bag___block_invoke_3;
    v11[3] = &unk_1E25430A0;
    v10 = *(_OWORD *)(a1 + 40);
    v8 = (id)v10;
    v12 = v10;
    objc_msgSend(v7, "thenWithBlock:", v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

id __50__AMSMescal_signaturePromiseFromRequest_type_bag___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  AMSOptional *v9;
  void *v10;

  v4 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v5 = a2;
  objc_msgSend(v4, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_matchSignedActions:withURL:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 40), "_signedActionDataFromRequest:policy:", *(_QWORD *)(a1 + 32), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[AMSOptional initWithValue:]([AMSOptional alloc], "initWithValue:", v8);
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[AMSOptional optionalWithNil](AMSOptional, "optionalWithNil");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

id __50__AMSMescal_signaturePromiseFromRequest_type_bag___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[AMSMescalSession sessionWithType:](AMSMescalSession, "sessionWithType:", *(_QWORD *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v4;
    if (v4)
    {
      objc_msgSend(v4, "signData:bag:", v3, *(_QWORD *)(a1 + 32));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "thenWithBlock:", &__block_literal_global_82);
    }
    else
    {
      AMSErrorWithFormat(2, CFSTR("Mescal Signature Failed"), CFSTR("Failed to locate session for type: %d"), v5, v6, v7, v8, v9, *(_QWORD *)(a1 + 40));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v11);
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v12, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      AMSLogKey();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1E0CB3940];
      v16 = objc_opt_class();
      v17 = v16;
      if (v14)
      {
        AMSLogKey();
        a1 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringWithFormat:", CFSTR("%@: [%@] "), v17, a1);
      }
      else
      {
        objc_msgSend(v15, "stringWithFormat:", CFSTR("%@: "), v16);
      }
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v18;
      _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Skipping mescal - unable to locate data to sign", buf, 0xCu);
      if (v14)
      {

        v18 = (void *)a1;
      }

    }
    +[AMSOptional optionalWithNil](AMSOptional, "optionalWithNil");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v20);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v19;
}

id __50__AMSMescal_signaturePromiseFromRequest_type_bag___block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  AMSOptional *v3;
  void *v4;

  v2 = a2;
  v3 = -[AMSOptional initWithValue:]([AMSOptional alloc], "initWithValue:", v2);

  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)verificationPromiseForTask:(id)a3 data:(id)a4 type:(int64_t)a5 bag:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  int64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  int64_t v32;
  uint8_t buf[4];
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = v12;
  if (v12)
  {
    if ((unint64_t)a5 <= 1)
      v14 = 1;
    else
      v14 = a5;
    objc_msgSend(v12, "dictionaryForKey:", 0x1E254CD20);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "valuePromise");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __54__AMSMescal_verificationPromiseForTask_data_type_bag___block_invoke;
    v27[3] = &unk_1E2543138;
    v31 = a1;
    v28 = v10;
    v32 = v14;
    v29 = v11;
    v30 = v13;
    objc_msgSend(v16, "continueWithBlock:", v27);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "binaryPromiseAdapter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v19, "OSLogObject");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      AMSLogKey();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)MEMORY[0x1E0CB3940];
      v23 = objc_opt_class();
      v24 = v23;
      if (v21)
      {
        AMSLogKey();
        a1 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "stringWithFormat:", CFSTR("%@: [%@] "), v24, a1);
      }
      else
      {
        objc_msgSend(v22, "stringWithFormat:", CFSTR("%@: "), v23);
      }
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = v25;
      _os_log_impl(&dword_18C849000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@Mescal verification will be skipped as bag was not provided.", buf, 0xCu);
      if (v21)
      {

        v25 = a1;
      }

    }
    +[AMSBinaryPromise promiseWithSuccess](AMSBinaryPromise, "promiseWithSuccess");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

id __54__AMSMescal_verificationPromiseForTask_data_type_bag___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v29[5];
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    if (objc_msgSend(v6, "ams_isBagValueMissingError"))
    {
      +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", MEMORY[0x1E0C9AAB0]);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v13, "OSLogObject");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        AMSLogKey();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)MEMORY[0x1E0CB3940];
        v17 = objc_opt_class();
        v18 = v17;
        if (v15)
        {
          AMSLogKey();
          a1 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "stringWithFormat:", CFSTR("%@: [%@] "), v18, a1);
        }
        else
        {
          objc_msgSend(v16, "stringWithFormat:", CFSTR("%@: "), v17);
        }
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        AMSLogableError(v7);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v31 = v19;
        v32 = 2114;
        v33 = v27;
        _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to load SAP response dictionary. Defaulting to failing verification as the requirement to verify couldn't be confirmed. Error = %{public}@", buf, 0x16u);
        if (v15)
        {

          v19 = (void *)a1;
        }

      }
      +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    v26 = (void *)v8;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "currentRequest");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "originalRequest");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "URL");
      v12 = (id)objc_claimAutoreleasedReturnValue();

    }
    if ((objc_msgSend(*(id *)(a1 + 56), "_matchSignSapURL:bagDictionary:", v12, v5) & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "response");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "ams_valueForHTTPHeaderField:", CFSTR("X-Apple-ActionSignature"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        +[AMSMescalSession sessionWithType:](AMSMescalSession, "sessionWithType:", *(_QWORD *)(a1 + 64));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v22, 0);
        objc_msgSend(v23, "verifyData:withSignature:bag:", *(_QWORD *)(a1 + 40), v24, *(_QWORD *)(a1 + 48));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "promiseAdapter");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __54__AMSMescal_verificationPromiseForTask_data_type_bag___block_invoke_23;
        v29[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
        v29[4] = *(_QWORD *)(a1 + 56);
        objc_msgSend(v26, "addErrorBlock:", v29);

      }
      else
      {
        +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", MEMORY[0x1E0C9AAB0]);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", MEMORY[0x1E0C9AAB0]);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v26;
}

void __54__AMSMescal_verificationPromiseForTask_data_type_bag___block_invoke_23(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
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
    AMSLogKey();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = objc_opt_class();
    v9 = v8;
    if (v6)
    {
      AMSLogKey();
      a1 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%@: [%@] "), v9, a1);
    }
    else
    {
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%@: "), v8);
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    AMSLogableError(v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v13 = v10;
    v14 = 2114;
    v15 = v11;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_ERROR, "%{public}@Failed to verify the task. Error = %{public}@", buf, 0x16u);
    if (v6)
    {

      v10 = (void *)a1;
    }

  }
}

+ (NSString)bagSubProfile
{
  if (_MergedGlobals_125 != -1)
    dispatch_once(&_MergedGlobals_125, &__block_literal_global_26_0);
  return (NSString *)(id)qword_1ECEAD628;
}

void __26__AMSMescal_bagSubProfile__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECEAD628;
  qword_1ECEAD628 = (uint64_t)CFSTR("AMSCore");

}

+ (NSString)bagSubProfileVersion
{
  if (qword_1ECEAD630 != -1)
    dispatch_once(&qword_1ECEAD630, &__block_literal_global_29_1);
  return (NSString *)(id)qword_1ECEAD638;
}

void __33__AMSMescal_bagSubProfileVersion__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECEAD638;
  qword_1ECEAD638 = (uint64_t)CFSTR("1");

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

+ (id)_matchSignedActions:(id)a3 withURL:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    objc_msgSend(v6, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastPathComponent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__42;
    v22 = __Block_byref_object_dispose__42;
    v23 = 0;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __41__AMSMescal__matchSignedActions_withURL___block_invoke;
    v14[3] = &unk_1E2543180;
    v10 = v8;
    v15 = v10;
    v11 = v9;
    v16 = v11;
    v17 = &v18;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v14);
    v12 = (id)v19[5];

    _Block_object_dispose(&v18, 8);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void __41__AMSMescal__matchSignedActions_withURL___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  id v9;

  v9 = a2;
  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend(*(id *)(a1 + 32), "rangeOfString:options:", v9, 1) != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v7, "objectForKey:", *(_QWORD *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v8);
    *a4 = 1;

  }
}

+ (BOOL)_matchSignSapURL:(id)a3 bagDictionary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  BOOL v12;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t *v17;
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    objc_msgSend(v6, "absoluteString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastPathComponent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    v20 = &v19;
    v21 = 0x2020000000;
    v22 = 0;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __44__AMSMescal__matchSignSapURL_bagDictionary___block_invoke;
    v14[3] = &unk_1E25431A8;
    v10 = v8;
    v15 = v10;
    v17 = &v19;
    v11 = v9;
    v16 = v11;
    v18 = a1;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v14);
    v12 = *((_BYTE *)v20 + 24) != 0;

    _Block_object_dispose(&v19, 8);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void __44__AMSMescal__matchSignSapURL_bagDictionary___block_invoke(uint64_t a1, void *a2, void *a3, char *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;

  v7 = a2;
  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && objc_msgSend(*(id *)(a1 + 32), "rangeOfString:", v7) != 0x7FFFFFFFFFFFFFFFLL)
    {
      v9 = MEMORY[0x1E0C809B0];
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __44__AMSMescal__matchSignSapURL_bagDictionary___block_invoke_2;
      v16[3] = &unk_1E253E830;
      v17 = *(id *)(a1 + 40);
      objc_msgSend(v8, "ams_firstObjectPassingTest:", v16);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v10 != 0;

      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      {
        v11 = 1;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 56), "_DAAPActionsForURLBagActions:", v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v14[0] = v9;
        v14[1] = 3221225472;
        v14[2] = __44__AMSMescal__matchSignSapURL_bagDictionary___block_invoke_3;
        v14[3] = &unk_1E253E830;
        v15 = *(id *)(a1 + 40);
        objc_msgSend(v12, "ams_firstObjectPassingTest:", v14);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v13 != 0;

        v11 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      }
      *a4 = v11;

    }
  }

}

uint64_t __44__AMSMescal__matchSignSapURL_bagDictionary___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v4 = 0;
    goto LABEL_5;
  }
  v4 = v3;

  if (!v4)
  {
LABEL_5:
    v5 = 0;
    goto LABEL_6;
  }
  v5 = objc_msgSend(*(id *)(a1 + 32), "containsString:", v4);
LABEL_6:

  return v5;
}

uint64_t __44__AMSMescal__matchSignSapURL_bagDictionary___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v4 = 0;
    goto LABEL_5;
  }
  v4 = v3;

  if (!v4)
  {
LABEL_5:
    v5 = 0;
    goto LABEL_6;
  }
  v5 = objc_msgSend(*(id *)(a1 + 32), "containsString:", v4);
LABEL_6:

  return v5;
}

+ (BOOL)primeTheConnectionWithBag:(id)a3 error:(id *)a4
{
  if (a4)
  {
    AMSError(12, CFSTR("Deprecated API"), CFSTR("This API has been deprecated."), 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

+ (BOOL)primeTheConnectionWithContract:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  AMSGenerateLogCorrelationKey();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(a1, "primeTheConnectionWithContract:logKey:error:", v6, v7, a4);

  return (char)a4;
}

+ (BOOL)primeTheConnectionWithContract:(id)a3 logKey:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  AMSContractBagShim *v10;

  v8 = a3;
  v9 = AMSSetLogKey(a4);
  v10 = -[AMSContractBagShim initWithBagContract:]([AMSContractBagShim alloc], "initWithBagContract:", v8);

  LOBYTE(a5) = objc_msgSend(a1, "primeTheConnectionWithBag:error:", v10, a5);
  return (char)a5;
}

+ (id)signatureFromData:(id)a3 type:(int64_t)a4 bagContract:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;

  v10 = a5;
  v11 = a3;
  AMSGenerateLogCorrelationKey();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "signatureFromData:type:bagContract:logKey:error:", v11, a4, v10, v12, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)signatureFromData:(id)a3 type:(int64_t)a4 bagContract:(id)a5 logKey:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  AMSContractBagShim *v15;
  void *v16;

  v12 = a5;
  v13 = a3;
  v14 = AMSSetLogKey(a6);
  v15 = -[AMSContractBagShim initWithBagContract:]([AMSContractBagShim alloc], "initWithBagContract:", v12);

  objc_msgSend(a1, "signatureFromData:type:bag:error:", v13, a4, v15, a7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)signatureUsingRequest:(id)a3 type:(int64_t)a4 bagContract:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;

  v10 = a5;
  v11 = a3;
  AMSGenerateLogCorrelationKey();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "signatureUsingRequest:type:bagContract:logKey:error:", v11, a4, v10, v12, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)signatureUsingRequest:(id)a3 type:(int64_t)a4 bagContract:(id)a5 logKey:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  AMSContractBagShim *v15;
  void *v16;

  v12 = a5;
  v13 = a3;
  v14 = AMSSetLogKey(a6);
  v15 = -[AMSContractBagShim initWithBagContract:]([AMSContractBagShim alloc], "initWithBagContract:", v12);

  objc_msgSend(a1, "signatureUsingRequest:type:bag:error:", v13, a4, v15, a7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (BOOL)shouldReprimeConnectionWithResult:(id)a3
{
  return 0;
}

+ (BOOL)verifyTask:(id)a3 data:(id)a4 type:(int64_t)a5 bagContract:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;

  v12 = a6;
  v13 = a4;
  v14 = a3;
  AMSGenerateLogCorrelationKey();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a7) = objc_msgSend(a1, "verifyTask:data:type:bagContract:logKey:error:", v14, v13, a5, v12, v15, a7);

  return (char)a7;
}

+ (BOOL)verifyTask:(id)a3 data:(id)a4 type:(int64_t)a5 bagContract:(id)a6 logKey:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  AMSContractBagShim *v18;

  v14 = a6;
  v15 = a4;
  v16 = a3;
  v17 = AMSSetLogKey(a7);
  v18 = -[AMSContractBagShim initWithBagContract:]([AMSContractBagShim alloc], "initWithBagContract:", v14);

  LOBYTE(a8) = objc_msgSend(a1, "verifyTask:data:type:bag:error:", v16, v15, a5, v18, a8);
  return (char)a8;
}

@end

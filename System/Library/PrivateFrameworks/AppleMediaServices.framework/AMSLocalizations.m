@implementation AMSLocalizations

+ (id)localizedStringForKey:(id)a3 bundle:(id)a4 table:(id)a5 bag:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(a1, "localizedStringPromiseForKey:bundle:table:bag:", v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  objc_msgSend(v14, "resultWithTimeout:error:", &v24, 3.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v24;

  if (!v15)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v17, "OSLogObject");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = objc_opt_class();
      AMSLogKey();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v16);
      v21 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544898;
      v26 = v19;
      v27 = 2114;
      v28 = v20;
      v29 = 2114;
      v30 = v10;
      v31 = 2114;
      v32 = v11;
      v33 = 2114;
      v34 = v12;
      v35 = 2114;
      v36 = v13;
      v37 = 2114;
      v38 = v21;
      v22 = (void *)v21;
      _os_log_impl(&dword_18C849000, v18, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Localized string not found (key: %{public}@, bundle: %{public}@, table: %{public}@, bag: %{public}@, error: %{public}@)", buf, 0x48u);

    }
  }

  return v15;
}

+ (id)localizedStringPromiseForKey:(id)a3 bundle:(id)a4 table:(id)a5 bag:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (a6)
  {
    objc_msgSend(a6, "stringForKey:", 0x1E254CA00);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "valuePromise");
  }
  else
  {
    AMSError(7, CFSTR("Localizations Failure"), CFSTR("Bag is missing"), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v12);
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __66__AMSLocalizations_localizedStringPromiseForKey_bundle_table_bag___block_invoke;
  v28[3] = &unk_1E25427B0;
  v15 = v9;
  v29 = v15;
  v16 = v10;
  v30 = v16;
  v17 = v11;
  v31 = v17;
  objc_msgSend(v13, "thenWithBlock:", v28);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v14;
  v24[1] = 3221225472;
  v24[2] = __66__AMSLocalizations_localizedStringPromiseForKey_bundle_table_bag___block_invoke_2;
  v24[3] = &unk_1E25427D8;
  v25 = v16;
  v26 = v15;
  v27 = v17;
  v19 = v17;
  v20 = v15;
  v21 = v16;
  objc_msgSend(v18, "catchWithBlock:", v24);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

id __66__AMSLocalizations_localizedStringPromiseForKey_bundle_table_bag___block_invoke(_QWORD *a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[AMSLocalizations localizedStringForKey:bundle:table:languageCode:](AMSLocalizations, "localizedStringForKey:bundle:table:languageCode:", a1[4], a1[5], a1[6], a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __66__AMSLocalizations_localizedStringPromiseForKey_bundle_table_bag___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "localizedStringForKey:value:table:", *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Localized string \"%@\" not found in %@"), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    AMSError(7, CFSTR("Localizations Failure"), v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

+ (id)localizedStringForKey:(id)a3 bundle:(id)a4 table:(id)a5 languageCode:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v20;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (!v12)
  {
    v18 = 0;
LABEL_8:
    objc_msgSend(v10, "localizedStringForKey:value:table:", v9, 0, v11);
    v20 = objc_claimAutoreleasedReturnValue();

    v18 = (id)v20;
    goto LABEL_9;
  }
  v13 = (void *)MEMORY[0x1E0CB34D0];
  objc_msgSend(v10, "localizations");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "preferredLocalizationsFromArray:forPreferences:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "firstObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "localizedStringForKey:value:table:localization:", v9, 0, v11, v17);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  if (v18 == v9 || v18 == 0)
    goto LABEL_8;
LABEL_9:

  return v18;
}

+ (id)localizedStringPromiseForKey:(id)a3 bundle:(id)a4 table:(id)a5 languageCode:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  AMSMutableLazyPromise *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  AMSMutableLazyPromise *v19;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = [AMSMutableLazyPromise alloc];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __75__AMSLocalizations_localizedStringPromiseForKey_bundle_table_languageCode___block_invoke;
  v21[3] = &unk_1E2542800;
  v25 = v13;
  v26 = a1;
  v22 = v10;
  v23 = v11;
  v24 = v12;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  v19 = -[AMSMutableLazyPromise initWithBlock:](v14, "initWithBlock:", v21);

  return v19;
}

void __75__AMSLocalizations_localizedStringPromiseForKey_bundle_table_languageCode___block_invoke(_QWORD *a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;

  v3 = a1[7];
  v2 = (void *)a1[8];
  v4 = a1[4];
  v5 = a1[5];
  v6 = a1[6];
  v7 = a2;
  objc_msgSend(v2, "localizedStringForKey:bundle:table:languageCode:", v4, v5, v6, v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "finishWithResult:", v8);

}

@end

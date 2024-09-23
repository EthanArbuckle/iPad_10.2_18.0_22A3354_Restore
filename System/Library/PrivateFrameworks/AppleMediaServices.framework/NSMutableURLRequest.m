@implementation NSMutableURLRequest

id __118__NSMutableURLRequest_AppleMediaServices__ams_addCookiesAsynchronouslyForAccount_clientInfo_bag_cleanupGlobalCookies___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  id v6;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v7)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      AMSLogKey();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0CB3940];
      v13 = objc_opt_class();
      v14 = v13;
      if (v11)
      {
        AMSLogKey();
        v3 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringWithFormat:", CFSTR("%@: [%@] "), v14, v3);
      }
      else
      {
        objc_msgSend(v12, "stringWithFormat:", CFSTR("%@: "), v13);
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v7);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v15;
      v22 = 2114;
      v23 = v17;
      _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Local account couldn't be fetched for request-cookie addition. error = %{public}@", buf, 0x16u);
      if (v11)
      {

        v15 = (void *)v3;
      }

    }
  }
  else
  {
    if (objc_msgSend(*(id *)(a1 + 40), "ams_isLocalAccount"))
      v16 = 0;
    else
      v16 = v6;
    objc_msgSend(v8, "ams_addNullableObject:", v16);
  }
  objc_msgSend(v8, "ams_addNullableObject:", *(_QWORD *)(a1 + 40));
  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

id __118__NSMutableURLRequest_AppleMediaServices__ams_addCookiesAsynchronouslyForAccount_clientInfo_bag_cleanupGlobalCookies___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[5];
  _QWORD v25[5];
  _QWORD v26[5];
  _QWORD v27[2];
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    AMSLogKey();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = objc_opt_class();
    if (v7)
    {
      AMSLogKey();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v2 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v9, v10, v2);
    }
    else
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%@: %@ "), v9, v10);
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v29 = v11;
    v30 = 2114;
    v31 = v12;
    _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Creating cookie-promise for account: %{public}@", buf, 0x16u);
    if (v7)
    {

      v11 = (void *)v2;
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "URL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ams_cookiesForURL:bag:cleanupGlobalCookies:", v13, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __118__NSMutableURLRequest_AppleMediaServices__ams_addCookiesAsynchronouslyForAccount_clientInfo_bag_cleanupGlobalCookies___block_invoke_95;
  v26[3] = &unk_1E2547C28;
  v26[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v14, "continueWithBlock:", v26);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_BYTE *)(a1 + 57))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://xp.apple.com"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ams_cookiesForURL:bag:", v17, *(_QWORD *)(a1 + 40));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v15;
    v25[1] = 3221225472;
    v25[2] = __118__NSMutableURLRequest_AppleMediaServices__ams_addCookiesAsynchronouslyForAccount_clientInfo_bag_cleanupGlobalCookies___block_invoke_2_99;
    v25[3] = &unk_1E2547C28;
    v25[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v18, "continueWithBlock:", v25);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", MEMORY[0x1E0C9AA70]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v27[0] = v16;
  v27[1] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSPromise promiseWithAll:](AMSPromise, "promiseWithAll:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v15;
  v24[1] = 3221225472;
  v24[2] = __118__NSMutableURLRequest_AppleMediaServices__ams_addCookiesAsynchronouslyForAccount_clientInfo_bag_cleanupGlobalCookies___block_invoke_2_102;
  v24[3] = &unk_1E2547C28;
  v24[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v21, "continueWithBlock:", v24);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

uint64_t __58__NSMutableURLRequest_AppleMediaServices__ams_addHeaders___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setValue:forHTTPHeaderField:", a3, a2);
}

uint64_t __64__NSMutableURLRequest_AppleMediaServices__ams_addAuthKitHeaders__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "ams_addHeaders:", a2);
}

void __86__NSMutableURLRequest_AppleMediaServices__ams_addBiometricsHeadersForAccount_options___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    objc_msgSend(*(id *)(a1 + 40), "setValue:forHTTPHeaderField:", v5, v7);

}

id __118__NSMutableURLRequest_AppleMediaServices__ams_addCookiesAsynchronouslyForAccount_clientInfo_bag_cleanupGlobalCookies___block_invoke_90(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[5];
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      AMSLogKey();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0CB3940];
      v11 = objc_opt_class();
      v12 = v11;
      if (v9)
      {
        AMSLogKey();
        v3 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringWithFormat:", CFSTR("%@: [%@] "), v12, v3);
      }
      else
      {
        objc_msgSend(v10, "stringWithFormat:", CFSTR("%@: "), v11);
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v6);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "URL");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v24 = v13;
      v25 = 2114;
      v26 = v18;
      v27 = 2114;
      v28 = v20;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Defaulting to not including analytics cookies since client ID domains couldn't be fetched from bag. This is not an error. This has no functional impact. bag-result = %{public}@ | URL = %{public}@", buf, 0x20u);

      if (v9)
      {

        v13 = (void *)v3;
      }

    }
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", MEMORY[0x1E0C9AAA0]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __118__NSMutableURLRequest_AppleMediaServices__ams_addCookiesAsynchronouslyForAccount_clientInfo_bag_cleanupGlobalCookies___block_invoke_91;
    v22[3] = &unk_1E253E830;
    v22[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(a2, "ams_firstObjectPassingTest:", v22);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14 != 0;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v17;
}

uint64_t __118__NSMutableURLRequest_AppleMediaServices__ams_addCookiesAsynchronouslyForAccount_clientInfo_bag_cleanupGlobalCookies___block_invoke_91(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;

    if (!v4)
    {
      v7 = 0;
      goto LABEL_7;
    }
    objc_msgSend(*(id *)(a1 + 32), "URL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "host");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "hasSuffix:", v4);

  }
  else
  {
    v4 = 0;
    v7 = 0;
    v5 = v3;
  }

LABEL_7:
  return v7;
}

id __118__NSMutableURLRequest_AppleMediaServices__ams_addCookiesAsynchronouslyForAccount_clientInfo_bag_cleanupGlobalCookies___block_invoke_94(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  _QWORD v13[5];
  _QWORD v14[5];
  __int128 v15;
  char v16;
  char v17;

  v3 = a2;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v5, "BOOLValue");
  v6 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __118__NSMutableURLRequest_AppleMediaServices__ams_addCookiesAsynchronouslyForAccount_clientInfo_bag_cleanupGlobalCookies___block_invoke_2;
  v14[3] = &unk_1E2547C70;
  v14[4] = *(_QWORD *)(a1 + 32);
  v12 = *(_OWORD *)(a1 + 40);
  v7 = (id)v12;
  v15 = v12;
  v16 = *(_BYTE *)(a1 + 56);
  v17 = (char)v3;
  objc_msgSend(v4, "ams_mapWithTransform:", v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSPromise promiseWithAll:](AMSPromise, "promiseWithAll:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __118__NSMutableURLRequest_AppleMediaServices__ams_addCookiesAsynchronouslyForAccount_clientInfo_bag_cleanupGlobalCookies___block_invoke_110;
  v13[3] = &unk_1E2547C28;
  v13[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v9, "continueWithBlock:", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __118__NSMutableURLRequest_AppleMediaServices__ams_addCookiesAsynchronouslyForAccount_clientInfo_bag_cleanupGlobalCookies___block_invoke_95(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      AMSLogKey();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0CB3940];
      v11 = objc_opt_class();
      v12 = v11;
      if (v9)
      {
        AMSLogKey();
        v3 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringWithFormat:", CFSTR("%@: [%@] "), v12, v3);
      }
      else
      {
        objc_msgSend(v10, "stringWithFormat:", CFSTR("%@: "), v11);
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "URL");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v21 = v13;
      v22 = 2114;
      v23 = v16;
      v24 = 2114;
      v25 = v18;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch account cookies for request URL. error = %{public}@ | URL = %{public}@", buf, 0x20u);

      if (v9)
      {

        v13 = (void *)v3;
      }

    }
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", MEMORY[0x1E0C9AA70]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a2, "ams_dictionaryUsingTransform:", &__block_literal_global_151);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v15;
}

uint64_t __118__NSMutableURLRequest_AppleMediaServices__ams_addCookiesAsynchronouslyForAccount_clientInfo_bag_cleanupGlobalCookies___block_invoke_96(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "name");
}

id __118__NSMutableURLRequest_AppleMediaServices__ams_addCookiesAsynchronouslyForAccount_clientInfo_bag_cleanupGlobalCookies___block_invoke_2_99(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      AMSLogKey();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0CB3940];
      v11 = objc_opt_class();
      v12 = v11;
      if (v9)
      {
        AMSLogKey();
        v3 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringWithFormat:", CFSTR("%@: [%@] "), v12, v3);
      }
      else
      {
        objc_msgSend(v10, "stringWithFormat:", CFSTR("%@: "), v11);
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "URL");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v21 = v13;
      v22 = 2114;
      v23 = v16;
      v24 = 2114;
      v25 = v18;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch account cookies for metrics base domain. No analytics cookies will be added. error = %{public}@ | URL = %{public}@", buf, 0x20u);

      if (v9)
      {

        v13 = (void *)v3;
      }

    }
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", MEMORY[0x1E0C9AA70]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a2, "ams_dictionaryUsingTransform:", &__block_literal_global_101_1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v15;
}

uint64_t __118__NSMutableURLRequest_AppleMediaServices__ams_addCookiesAsynchronouslyForAccount_clientInfo_bag_cleanupGlobalCookies___block_invoke_100(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "name");
}

id __118__NSMutableURLRequest_AppleMediaServices__ams_addCookiesAsynchronouslyForAccount_clientInfo_bag_cleanupGlobalCookies___block_invoke_2_102(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _BOOL4 v7;
  _UNKNOWN **v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = +[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests");
    v8 = &off_1E2519000;
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v7)
    {
      if (!v9)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v10, "OSLogObject");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        AMSLogKey();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)MEMORY[0x1E0CB3940];
        v14 = objc_opt_class();
        v15 = v14;
        if (v12)
        {
          AMSLogKey();
          v34 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "stringWithFormat:", CFSTR("%@: [%@] "), v15, v34);
        }
        else
        {
          objc_msgSend(v13, "stringWithFormat:", CFSTR("%@: "), v14);
        }
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        AMSLogableError(v6);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "URL");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded(v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v36 = v16;
        v37 = 2114;
        v38 = v27;
        v39 = 2114;
        v40 = v29;
        _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_ERROR, "%{public}@Unexpected error when handling account and analytics cookie-promises. error = %{public}@ | URL = %{public}@", buf, 0x20u);

        if (v12)
        {

          v16 = (void *)v34;
        }

      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v21 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "postNotificationName:object:userInfo:", CFSTR("com.apple.AppleMediaServicesTests.FaultLogged"), v21, 0);
    }
    else
    {
      if (!v9)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v10, "OSLogObject");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
        AMSLogKey();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)MEMORY[0x1E0CB3940];
        v24 = objc_opt_class();
        v25 = v24;
        if (v22)
        {
          AMSLogKey();
          v8 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "stringWithFormat:", CFSTR("%@: [%@] "), v25, v8);
        }
        else
        {
          objc_msgSend(v23, "stringWithFormat:", CFSTR("%@: "), v24);
        }
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        AMSLogableError(v6);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "URL");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded(v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v36 = v26;
        v37 = 2114;
        v38 = v30;
        v39 = 2114;
        v40 = v32;
        _os_log_impl(&dword_18C849000, v21, OS_LOG_TYPE_FAULT, "%{public}@Unexpected error when handling account and analytics cookie-promises. error = %{public}@ | URL = %{public}@", buf, 0x20u);

        if (v22)
        {

          v26 = v8;
        }

      }
    }

    AMSError(0, CFSTR("Unexpected error when handling combined account and analytics cookie-promises."), 0, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v19, "addEntriesFromDictionary:", v18);
    objc_msgSend(v19, "addEntriesFromDictionary:", v17);
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v20;
}

id __118__NSMutableURLRequest_AppleMediaServices__ams_addCookiesAsynchronouslyForAccount_clientInfo_bag_cleanupGlobalCookies___block_invoke_110(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _BOOL4 v7;
  _UNKNOWN **v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t v45[128];
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = +[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests");
    v8 = &off_1E2519000;
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v7)
    {
      if (!v9)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v10, "OSLogObject");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        AMSLogKey();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)MEMORY[0x1E0CB3940];
        v14 = objc_opt_class();
        v15 = v14;
        if (v12)
        {
          AMSLogKey();
          v40 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "stringWithFormat:", CFSTR("%@: [%@] "), v15, v40);
        }
        else
        {
          objc_msgSend(v13, "stringWithFormat:", CFSTR("%@: "), v14);
        }
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        AMSLogableError(v6);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "URL");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded(v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v47 = v16;
        v48 = 2114;
        v49 = v32;
        v50 = 2114;
        v51 = v34;
        _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_ERROR, "%{public}@Unexpected error when handling combined cookie-promises. error = %{public}@ | URL = %{public}@", buf, 0x20u);

        if (v12)
        {

          v16 = (void *)v40;
        }

      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v26 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "postNotificationName:object:userInfo:", CFSTR("com.apple.AppleMediaServicesTests.FaultLogged"), v26, 0);
    }
    else
    {
      if (!v9)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v10, "OSLogObject");
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
      {
        AMSLogKey();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (void *)MEMORY[0x1E0CB3940];
        v29 = objc_opt_class();
        v30 = v29;
        if (v27)
        {
          AMSLogKey();
          v8 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "stringWithFormat:", CFSTR("%@: [%@] "), v30, v8);
        }
        else
        {
          objc_msgSend(v28, "stringWithFormat:", CFSTR("%@: "), v29);
        }
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        AMSLogableError(v6);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "URL");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded(v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v47 = v31;
        v48 = 2114;
        v49 = v35;
        v50 = 2114;
        v51 = v37;
        _os_log_impl(&dword_18C849000, v26, OS_LOG_TYPE_FAULT, "%{public}@Unexpected error when handling combined cookie-promises. error = %{public}@ | URL = %{public}@", buf, 0x20u);

        if (v27)
        {

          v31 = v8;
        }

      }
    }

    AMSError(0, CFSTR("Unexpected error when handling combined cookie-promises."), 0, 0);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v17);
    v25 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v18 = v5;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v42 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(v17, "addEntriesFromDictionary:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i));
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      }
      while (v20);
    }

    v23 = *(void **)(a1 + 32);
    objc_msgSend(v17, "allValues");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "_ams_replaceCookies:", v24);

    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", MEMORY[0x1E0C9AAB0]);
    v25 = objc_claimAutoreleasedReturnValue();
  }
  v38 = (void *)v25;

  return v38;
}

uint64_t __84__NSMutableURLRequest_AppleMediaServices__ams_addSilentEnrollmentHeadersForAccount___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setValue:forHTTPHeaderField:", a3, a2);
}

id __97__NSMutableURLRequest_AppleMediaServices__ams_addXGroupDSIDsWithPrimaryAccount_andGroupAccounts___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "ams_DSID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __69__NSMutableURLRequest_AppleMediaServices__ams_addHeadersFromPromise___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__NSMutableURLRequest_AppleMediaServices__ams_addHeadersFromPromise___block_invoke_2;
  v6[3] = &unk_1E2540030;
  v2 = *(void **)(a1 + 32);
  v6[4] = *(_QWORD *)(a1 + 40);
  v3 = a2;
  objc_msgSend(v2, "thenWithBlock:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "binaryPromiseAdapter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addFinishBlock:", v3);

}

AMSPromise *__69__NSMutableURLRequest_AppleMediaServices__ams_addHeadersFromPromise___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "ams_addHeaders:", a2);
  return +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", MEMORY[0x1E0C9AAB0]);
}

uint64_t __70__NSMutableURLRequest_AppleMediaServices__ams_modifyRequestWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end

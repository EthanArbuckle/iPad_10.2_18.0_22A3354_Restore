@implementation ACAccount(AppleMediaServices)

- (id)ams_cookies
{
  void *v2;
  uint64_t v3;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  id v37;
  _QWORD v38[5];
  id v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    AMSLogKey();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CB3940];
    v10 = objc_opt_class();
    if (v8)
    {
      AMSLogKey();
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v3 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v10, v2, v3);
    }
    else
    {
      NSStringFromSelector(a2);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("%@: %@ "), v10, v2);
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(a1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v41 = v11;
    v42 = 2114;
    v43 = (uint64_t)v12;
    _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Fetching cookies from cookie storage for account: %{public}@", buf, 0x16u);
    if (v8)
    {

      v11 = (void *)v3;
    }

  }
  v39 = 0;
  +[AMSCookieStorage cookiesForAccount:error:](AMSCookieStorage, "cookiesForAccount:error:", a1, &v39);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v39;
  if (v13)
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
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v37 = v14;
      AMSLogKey();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)MEMORY[0x1E0CB3940];
      v19 = objc_opt_class();
      if (v17)
      {
        AMSLogKey();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        a2 = (const char *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v19, v20, a2);
      }
      else
      {
        NSStringFromSelector(a2);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stringWithFormat:", CFSTR("%@: %@ "), v19, v20);
      }
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v13, "count");
      AMSHashIfNeeded(a1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v41 = v21;
      v42 = 2048;
      v43 = v29;
      v44 = 2114;
      v45 = v30;
      _os_log_impl(&dword_18C849000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Fetched %lu cookies from cookie storage for account: %{public}@", buf, 0x20u);
      if (v17)
      {

        v21 = (void *)a2;
      }

      v14 = v37;
    }

    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __44__ACAccount_AppleMediaServices__ams_cookies__block_invoke;
    v38[3] = &unk_1E253D2F8;
    v38[4] = a1;
    objc_msgSend(v13, "ams_filterUsingTest:", v38);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    +[AMSFeatureEnabler cookie](AMSFeatureEnabler, "cookie");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      objc_msgSend(v22, "arrayByAddingObject:", v31);
      v32 = objc_claimAutoreleasedReturnValue();

      v22 = (void *)v32;
    }
    objc_msgSend(v22, "ams_filterUsingTest:", &__block_literal_global);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v22)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v22, "OSLogObject");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      AMSLogKey();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)MEMORY[0x1E0CB3940];
      v26 = objc_opt_class();
      v27 = v26;
      if (v24)
      {
        AMSLogKey();
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "stringWithFormat:", CFSTR("%@: [%@] "), v27, v2);
      }
      else
      {
        objc_msgSend(v25, "stringWithFormat:", CFSTR("%@: "), v26);
      }
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(a1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v14);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v41 = v28;
      v42 = 2114;
      v43 = (uint64_t)v34;
      v44 = 2114;
      v45 = v35;
      _os_log_impl(&dword_18C849000, v23, OS_LOG_TYPE_ERROR, "%{public}@An error occurred fetching cookies. account = %{public}@ | error = %{public}@", buf, 0x20u);
      if (v24)
      {

        v28 = v2;
      }

    }
    v33 = 0;
  }

  return v33;
}

- (id)_hashedStorefront
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  if (objc_msgSend(a1, "ams_isiTunesAccount"))
  {
    v2 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a1, "ams_storefront");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringWithFormat:", CFSTR(" | storefront = %@"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (uint64_t)ams_storefrontForMediaType:()AppleMediaServices
{
  return objc_msgSend(a1, "_accountPropertyForKey:expectedClass:", CFSTR("storefrontID"), objc_opt_class());
}

- (uint64_t)ams_storefront
{
  return objc_msgSend(a1, "ams_storefrontForMediaType:", 0);
}

- (id)hashedDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(a1, "accountType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("com.apple.account."), &stru_1E2548760);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0CB37A0];
  objc_msgSend(a1, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<ACAccount: %p type = %@ | backingID = %@"), a1, v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_hashedIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ams_appendNullableString:", v8);

  objc_msgSend(a1, "_hashedMultiUserIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ams_appendNullableString:", v9);

  objc_msgSend(a1, "_hashedActiveState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ams_appendNullableString:", v10);

  objc_msgSend(a1, "_hashedStorefront");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ams_appendNullableString:", v11);

  objc_msgSend(v7, "appendString:", CFSTR(">"));
  return v7;
}

- (uint64_t)_hashedMultiUserIdentifiers
{
  return 0;
}

- (id)_hashedIdentifiers
{
  void *v2;
  int v3;
  __CFString *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR(" | username = "));
  v3 = objc_msgSend(a1, "ams_isLocalAccount");
  objc_msgSend(a1, "username");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (v4)
      v6 = v4;
    else
      v6 = CFSTR("(null)");
    objc_msgSend(v2, "appendString:", v6);
  }
  else
  {
    AMSHashIfNeededNonnull(v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "appendString:", v7);

    objc_msgSend(a1, "ams_altDSID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeededNonnull(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "appendFormat:", CFSTR(" | altDSID = %@"), v9);

    objc_msgSend(a1, "ams_DSID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeededNonnull(v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "appendFormat:", CFSTR(" | DSID = %@"), v10);

  }
  v11 = (void *)objc_msgSend(v2, "copy");

  return v11;
}

- (id)_hashedActiveState
{
  void *v3;
  int v4;
  const __CFString *v5;

  if (!objc_msgSend(a1, "ams_isiTunesAccount") || (objc_msgSend(a1, "ams_isLocalAccount") & 1) != 0)
    return 0;
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_msgSend(a1, "isActive");
  v5 = CFSTR("false");
  if (v4)
    v5 = CFSTR("true");
  objc_msgSend(v3, "stringWithFormat:", CFSTR(" | active = %@"), v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (uint64_t)ams_isIDMSAccount
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "accountType");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0C8F0C8]);

  return v3;
}

- (uint64_t)ams_isLocalAccount
{
  uint64_t result;
  void *v3;
  uint64_t v4;

  result = objc_msgSend(a1, "ams_isiTunesAccount");
  if ((_DWORD)result)
  {
    if ((objc_msgSend(a1, "_accountPropertyBooleanForKey:", 0x1E2549AA0) & 1) != 0)
    {
      return 1;
    }
    else
    {
      objc_msgSend(a1, "identifier");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("iTunesLocal-421A04EA-479A-4E46-B49D-556F7144518D"));

      return v4;
    }
  }
  return result;
}

- (uint64_t)_accountPropertyBooleanForKey:()AppleMediaServices
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char v11;
  void *v12;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_accountPropertyForKey:dataProtectionClass:expectedClasses:error:", v5, 0, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "lowercaseString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v10, "isEqualToString:", CFSTR("true")) & 1) != 0)
      {

LABEL_7:
        v9 = 1;
        goto LABEL_12;
      }
      v11 = objc_msgSend(v8, "isEqualToString:", CFSTR("1"));

      if ((v11 & 1) != 0)
        goto LABEL_7;
      objc_msgSend(v8, "lowercaseString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v12, "isEqualToString:", CFSTR("false")) & 1) == 0)
        objc_msgSend(v8, "isEqualToString:", CFSTR("0"));

    }
    v9 = 0;
    goto LABEL_12;
  }
  v9 = objc_msgSend(v8, "BOOLValue");
LABEL_12:

  return v9;
}

- (id)_accountPropertyForKey:()AppleMediaServices expectedClass:
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = a3;
  objc_msgSend(v6, "setWithObject:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_accountPropertyForKey:dataProtectionClass:expectedClasses:error:", v7, 0, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_accountPropertyForKey:()AppleMediaServices dataProtectionClass:expectedClasses:error:
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  id v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  id v41;
  __int16 v42;
  id v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  if (!objc_msgSend(a1, "ams_isEphemeralAccount"))
  {
    objc_msgSend(a1, "objectForKeyedSubscript:", v10);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      if (!a4)
      {
        v33[0] = MEMORY[0x1E0C809B0];
        v33[1] = 3221225472;
        v33[2] = __98__ACAccount_AppleMediaServices___accountPropertyForKey_dataProtectionClass_expectedClasses_error___block_invoke;
        v33[3] = &unk_1E253D438;
        v13 = v13;
        v34 = v13;
        if (objc_msgSend(v11, "ams_firstObjectPassingTest:", v33))
        {
          v12 = v13;
        }
        else
        {
          +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v26)
          {
            +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v26, "OSLogObject");
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            v28 = objc_opt_class();
            AMSLogKey();
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138544386;
            v39 = v28;
            v40 = 2114;
            v41 = v29;
            v42 = 2114;
            v43 = v10;
            v44 = 2114;
            v45 = v30;
            v46 = 2114;
            v47 = v11;
            v31 = v30;
            _os_log_impl(&dword_18C849000, v27, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] An account property was stored as the wrong type. key = %{public}@ | actualClass = %{public}@ | expectedClasses = %{public}@", buf, 0x34u);

          }
          if (a6)
          {
            AMSError(0, CFSTR("Account Property"), CFSTR("Failed to retrieve an account property because it wasn't of the expected type."), 0);
            v12 = 0;
            *a6 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v12 = 0;
          }
        }

        goto LABEL_30;
      }
      +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v14, "OSLogObject");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        v16 = objc_opt_class();
        AMSLogKey();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v39 = v16;
        v40 = 2114;
        v41 = v17;
        v42 = 2114;
        v43 = v10;
        v44 = 2048;
        v45 = a4;
        _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Decrypting an account property. key = %{public}@ | dataProtectionClass = %ld", buf, 0x2Au);

      }
      v35 = 0;
      v36 = 0;
      v37 = 0;
      v13 = v13;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = v13;

        objc_msgSend(v18, "ams_encryptionResult");
      }
      else
      {

        v18 = 0;
        v35 = 0;
        v36 = 0;
        v37 = 0;
      }

      +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v19)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v19, "OSLogObject");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = objc_opt_class();
        AMSLogKey();
        v22 = (id)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded(v13);
        v23 = (id)objc_claimAutoreleasedReturnValue();
        v24 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138544386;
        v39 = v21;
        v40 = 2114;
        v41 = v22;
        v42 = 2114;
        v43 = v10;
        v44 = 2114;
        v45 = v23;
        v46 = 2114;
        v47 = v24;
        v25 = v24;
        _os_log_impl(&dword_18C849000, v20, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to decrypt an account property. key = %{public}@ | value = %{public}@ | value.class = %{public}@", buf, 0x34u);

      }
      if (a6)
      {
        AMSError(0, CFSTR("Account Property Encryption"), CFSTR("Failed to retrieve an account property because its encrypted value was nil."), 0);
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }

    }
    v12 = 0;
LABEL_30:

    goto LABEL_31;
  }
  objc_msgSend(a1, "_ephemeralAccountPropertyForKey:dataProtectionClass:expectedClasses:error:", v10, a4, v11, a6);
  v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_31:

  return v12;
}

- (uint64_t)ams_isiTunesAccount
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "accountType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C8F170]) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(a1, "ams_isSandboxAccount");

  return v4;
}

- (uint64_t)ams_isEphemeralAccount
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("iTunes-Ephemeral"));

  return v2;
}

- (BOOL)ams_isHSA2
{
  return objc_msgSend(a1, "ams_securityLevel") == 4;
}

- (id)ams_cookiesForURL:()AppleMediaServices bag:cleanupGlobalCookies:
{
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  char v39;
  const char *v40;
  _QWORD v41[4];
  id v42;
  void *v43;
  id v44;
  const char *v45;
  char v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  objc_msgSend(a1, "ams_cookies");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  v13 = (void *)MEMORY[0x1E0C9AA60];
  if (v11)
    v13 = (void *)v11;
  v14 = v13;

  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v15, "OSLogObject");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v39 = a5;
    AMSLogKey();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x1E0CB3940];
    v19 = objc_opt_class();
    v40 = a2;
    if (v17)
    {
      AMSLogKey();
      v36 = v18;
      v20 = a1;
      v21 = v17;
      v22 = v10;
      v23 = v14;
      v24 = v9;
      v25 = objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v37 = objc_claimAutoreleasedReturnValue();
      v38 = (void *)v25;
      v35 = v25;
      v9 = v24;
      v14 = v23;
      v10 = v22;
      v17 = v21;
      a1 = v20;
      objc_msgSend(v36, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v19, v35, v37);
    }
    else
    {
      NSStringFromSelector(a2);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringWithFormat:", CFSTR("%@: %@ "), v19, v38);
    }
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v14, "count");
    AMSHashIfNeeded(a1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v48 = v26;
    v49 = 2048;
    v50 = v27;
    v51 = 2114;
    v52 = v28;
    _os_log_impl(&dword_18C849000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Fetched %lu cookies for account: %{public}@", buf, 0x20u);
    if (v17)
    {

      v26 = (void *)v37;
    }

    a2 = v40;
    a5 = v39;
  }

  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __76__ACAccount_AppleMediaServices__ams_cookiesForURL_bag_cleanupGlobalCookies___block_invoke;
  v41[3] = &unk_1E253D410;
  v46 = a5;
  v42 = v9;
  v43 = a1;
  v44 = v10;
  v45 = a2;
  v29 = v10;
  v30 = v9;
  objc_msgSend(v14, "ams_mapWithTransform:", v41);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSPromise promiseWithSome:](AMSPromise, "promiseWithSome:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSPromise unwrappedPromiseWithPromise:](AMSPromise, "unwrappedPromiseWithPromise:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

- (id)ams_altDSID
{
  void *v2;
  void *v3;

  if (objc_msgSend(a1, "ams_isIDMSAccount"))
  {
    objc_msgSend(MEMORY[0x1E0D00100], "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "altDSIDForAccount:", a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "_accountPropertyForKey:expectedClass:", CFSTR("altDSID"), objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)ams_DSID
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  if (objc_msgSend(a1, "ams_isiCloudAccount"))
  {
    objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("personID"));
    v2 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {

LABEL_12:
      v6 = 0;
      return v6;
    }
  }
  else if (objc_msgSend(a1, "ams_isIDMSAccount"))
  {
    objc_msgSend(MEMORY[0x1E0D00100], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "DSIDForAccount:", a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v2 = v4;
    else
      v2 = 0;

  }
  else
  {
    objc_msgSend(a1, "_accountPropertyForKey:expectedClass:", CFSTR("dsid"), objc_opt_class());
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = objc_msgSend(v2, "longLongValue");

  if (!v5)
    goto LABEL_12;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  return v6;
}

- (uint64_t)ams_isiCloudAccount
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "accountType");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0C8F030]);

  return v3;
}

- (uint64_t)ams_securityLevel
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ams_IDMSAccountForAccount:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D00100], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "securityLevelForAccount:", v3);

  }
  else
  {
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138543362;
      v10 = objc_opt_class();
      _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Security level check failed to find IDMS account", (uint8_t *)&v9, 0xCu);
    }

    v5 = 0;
  }

  return v5;
}

- (id)ams_fullName
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  objc_msgSend(a1, "ams_firstName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {

  }
  else
  {
    objc_msgSend(a1, "ams_lastName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      v8 = 0;
      return v8;
    }
  }
  v4 = objc_alloc_init(MEMORY[0x1E0CB3850]);
  objc_msgSend(a1, "ams_lastName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFamilyName:", v5);

  objc_msgSend(a1, "ams_firstName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGivenName:", v6);

  v7 = objc_alloc_init(MEMORY[0x1E0CB3858]);
  objc_msgSend(v7, "stringFromPersonNameComponents:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (uint64_t)ams_firstName
{
  return objc_msgSend(a1, "_accountPropertyForKey:expectedClass:", CFSTR("firstName"), objc_opt_class());
}

- (uint64_t)ams_lastName
{
  return objc_msgSend(a1, "_accountPropertyForKey:expectedClass:", CFSTR("lastName"), objc_opt_class());
}

- (uint64_t)ams_privacyAcknowledgement
{
  return objc_msgSend(a1, "_accountPropertyForKey:expectedClass:", CFSTR("privacyAcknowledgement"), objc_opt_class());
}

+ (id)_getSetCookiesForResponse:()AppleMediaServices
{
  id v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
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
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  unint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  id obj;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t buf[4];
  uint64_t v57;
  __int16 v58;
  void *v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = 0x1E0C92000uLL;
  v5 = (void *)MEMORY[0x1E0C92C00];
  objc_msgSend(v3, "allHeaderFields");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cookiesWithResponseHeaderFields:forURL:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v3, "allHeaderFields");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("X-Apple-Set-User-Cookie"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "length"))
  {
    objc_msgSend(v3, "allHeaderFields");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");

    objc_msgSend(v13, "setObject:forKeyedSubscript:", v11, CFSTR("Set-Cookie"));
    v14 = (void *)MEMORY[0x1E0C92C00];
    objc_msgSend(v3, "URL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "cookiesWithResponseHeaderFields:forURL:", v13, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObjectsFromArray:", v16);

  }
  if (os_variant_has_internal_content()
    && !+[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests"))
  {
    v39 = v11;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "valueForHTTPHeaderField:", CFSTR("X-Apple-Jingle-Correlation-Key"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v3;
    objc_msgSend(v3, "URL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "absoluteString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    obj = v9;
    v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
    if (v51)
    {
      v49 = *MEMORY[0x1E0C92A98];
      v50 = *(_QWORD *)v53;
      v48 = *MEMORY[0x1E0C92AA0];
      v42 = v20;
      v43 = v18;
      v41 = v17;
      do
      {
        for (i = 0; i != v51; ++i)
        {
          if (*(_QWORD *)v53 != v50)
            objc_enumerationMutation(obj);
          v22 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
          objc_msgSend(v22, "properties");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = (void *)objc_msgSend(v23, "mutableCopy");

          if (v18)
            objc_msgSend(v24, "setObject:forKeyedSubscript:", v18, v49);
          if (v20)
            objc_msgSend(v24, "setObject:forKeyedSubscript:", v20, v48);
          objc_msgSend(*(id *)(v4 + 3072), "cookieWithProperties:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (v25)
          {
            +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v26)
            {
              +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v26, "OSLogObject");
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
            {
              v28 = v4;
              AMSLogKey();
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = (void *)MEMORY[0x1E0CB3940];
              v31 = objc_opt_class();
              v32 = v31;
              if (v29)
              {
                AMSLogKey();
                v45 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "stringWithFormat:", CFSTR("%@: [%@] "), v32, v45);
                v33 = objc_claimAutoreleasedReturnValue();
                v44 = (void *)v33;
                v34 = v46;
              }
              else
              {
                objc_msgSend(v30, "stringWithFormat:", CFSTR("%@: "), v31);
                v33 = objc_claimAutoreleasedReturnValue();
                v34 = (void *)v33;
              }
              AMSHashIfNeeded(v25);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v57 = v33;
              v58 = 2114;
              v59 = v37;
              _os_log_impl(&dword_18C849000, v27, OS_LOG_TYPE_DEBUG, "%{public}@Adding modified cookie: %{public}@", buf, 0x16u);
              v46 = v34;
              if (v29)
              {

                v34 = (void *)v45;
              }

              v4 = v28;
              v17 = v41;
              v20 = v42;
              v18 = v43;
            }

            v35 = v17;
            v36 = v25;
          }
          else
          {
            v35 = v17;
            v36 = v22;
          }
          objc_msgSend(v35, "addObject:", v36);

        }
        v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
      }
      while (v51);
    }

    v9 = (void *)objc_msgSend(v17, "copy");
    v11 = v39;
    v3 = v40;
  }

  return v9;
}

- (uint64_t)ams_addGlobalCookiesForResponse:()AppleMediaServices
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "ams_asynchronouslyAddGlobalCookiesForResponse:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "resultWithError:", 0);

  return v2;
}

- (uint64_t)ams_addCookiesForResponse:()AppleMediaServices error:
{
  void *v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(MEMORY[0x1E0C8F298], "_getSetCookiesForResponse:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ams_asynchronouslyAddCookies:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "resultWithError:", a4);

  return v8;
}

- (uint64_t)_updateCookiesWithCookiesToAdd:()AppleMediaServices cookiesToRemove:error:
{
  void *v6;
  uint64_t v7;

  objc_msgSend(a1, "_updateCookiesWithCookiesToAdd:cookiesToRemove:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "resultWithError:", a5);

  return v7;
}

- (uint64_t)ams_addCookies:()AppleMediaServices error:
{
  return objc_msgSend(a1, "_updateCookiesWithCookiesToAdd:cookiesToRemove:error:", a3, 0, a4);
}

- (uint64_t)ams_addCookies:()AppleMediaServices
{
  return objc_msgSend(a1, "ams_addCookies:error:", a3, 0);
}

+ (id)_getSetGlobalCookiesForResponse:()AppleMediaServices
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  objc_msgSend(v3, "allHeaderFields");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("X-Apple-Set-Cookie"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(v3, "allHeaderFields");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    objc_msgSend(v7, "setObject:forKeyedSubscript:", v5, CFSTR("Set-Cookie"));
    v8 = (void *)MEMORY[0x1E0C92C00];
    objc_msgSend(v3, "URL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cookiesWithResponseHeaderFields:forURL:", v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v10;
}

- (id)ams_cookiesForURL:()AppleMediaServices
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "ams_cookiesForURL:bag:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resultWithError:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (uint64_t)ams_cookiesForURL:()AppleMediaServices bag:
{
  return objc_msgSend(a1, "ams_cookiesForURL:bag:cleanupGlobalCookies:", a3, a4, 0);
}

- (id)ams_accountFlagValueForAccountFlag:()AppleMediaServices
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  NSObject *v23;
  void *v24;
  id v25;
  void *v26;
  int v27;
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "ams_accountFlagOverrideValueForAccountFlag:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = (void *)objc_opt_class();
      v9 = v8;
      objc_msgSend(a1, "hashedDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543874;
      v28 = v8;
      v29 = 2114;
      v30 = v4;
      v31 = 2114;
      v32 = v10;
      _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_INFO, "%{public}@: The account has overrode value for an account flag. accountFlag = %{public}@ | account = %{public}@", (uint8_t *)&v27, 0x20u);

    }
    v11 = v5;
LABEL_7:
    v12 = v11;
    goto LABEL_8;
  }
  objc_msgSend(a1, "ams_accountFlags");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v22)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v22, "OSLogObject");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = (void *)objc_opt_class();
      v25 = v24;
      objc_msgSend(a1, "hashedDescription");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543874;
      v28 = v24;
      v29 = 2114;
      v30 = v4;
      v31 = 2114;
      v32 = v26;
      _os_log_impl(&dword_18C849000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: The account has no value for an account flag. We'll return the default value. accountFlag = %{public}@ | account = %{public}@", (uint8_t *)&v27, 0x20u);

    }
    objc_msgSend(MEMORY[0x1E0C8F298], "_defaultValueForAccountFlag:", v4);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if ((objc_msgSend(MEMORY[0x1E0C8F298], "_isAccountFlagValue:validForAccountFlag:", v12, v4) & 1) == 0)
  {
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
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
      v17 = (void *)objc_opt_class();
      v18 = v17;
      objc_msgSend(a1, "hashedDescription");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v12);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138544386;
      v28 = v17;
      v29 = 2114;
      v30 = v19;
      v31 = 2114;
      v32 = v4;
      v33 = 2114;
      v34 = v20;
      v35 = 2114;
      v36 = (id)objc_opt_class();
      v21 = v36;
      _os_log_impl(&dword_18C849000, v16, OS_LOG_TYPE_ERROR, "%{public}@: An account flag was stored with an invalid value. account = %{public}@ | flag = %{public}@ | value = %{public}@ | value.class = %{public}@", (uint8_t *)&v27, 0x34u);

    }
    v12 = 0;
  }
LABEL_8:

  return v12;
}

- (uint64_t)ams_accountFlags
{
  return objc_msgSend(a1, "_ams_getAccountFlagsShimmedWithError:", 0);
}

+ (uint64_t)_isAccountFlagValue:()AppleMediaServices validForAccountFlag:
{
  id v5;
  id v6;
  char isKindOfClass;

  v5 = a3;
  v6 = a4;
  if (qword_1ECEACE50 != -1)
    dispatch_once(&qword_1ECEACE50, &__block_literal_global_247);
  if (objc_msgSend((id)qword_1ECEACE58, "containsObject:", v6))
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (id)_ams_getAccountFlagsShimmedWithError:()AppleMediaServices
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];

  if (_os_feature_enabled_impl() && (objc_msgSend(a1, "ams_isLocalOrSandboxAccount") & 1) == 0)
  {
    +[AMSAccountCachedServerData sharedInstance](AMSAccountCachedServerData, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "ams_accountID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringForKey:accountID:updateBlock:", 0, v6, &__block_literal_global_231);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __70__ACAccount_AppleMediaServices___ams_getAccountFlagsShimmedWithError___block_invoke_2;
    v11[3] = &unk_1E253D4A0;
    v11[4] = a1;
    objc_msgSend(v7, "addFinishBlock:", v11);

  }
  objc_msgSend(MEMORY[0x1E0C99E60], "ams_PLISTClasses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_accountPropertyForKey:dataProtectionClass:expectedClasses:error:", CFSTR("accountFlags"), 1, v8, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (uint64_t)ams_isSandboxAccount
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "accountType");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0C8F180]);

  return v3;
}

- (uint64_t)ams_isLocalOrSandboxAccount
{
  if ((objc_msgSend(a1, "ams_isLocalAccount") & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "ams_isSandboxAccount");
}

- (AMSAccountIdentity)ams_accountID
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  void *v5;
  AMSAccountIdentity *v6;
  void *v7;
  void *v8;
  AMSAccountIdentity *v9;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "ams_altDSID");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        objc_msgSend(a1, "ams_DSID"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    v6 = [AMSAccountIdentity alloc];
    objc_msgSend(a1, "ams_DSID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "ams_altDSID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[AMSAccountIdentity initWithDSID:altDSID:](v6, "initWithDSID:altDSID:", v7, v8);

    return v9;
  }
  else
  {
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v11, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      AMSLogKey();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0CB3940];
      v15 = objc_opt_class();
      v16 = v15;
      if (v13)
      {
        AMSLogKey();
        v1 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringWithFormat:", CFSTR("%@: [%@] "), v16, v1);
      }
      else
      {
        objc_msgSend(v14, "stringWithFormat:", CFSTR("%@: "), v15);
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(a1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v17;
      v21 = 2114;
      v22 = v18;
      _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_ERROR, "%{public}@Account is missing an identifier. account = %{public}@", buf, 0x16u);
      if (v13)
      {

        v17 = (void *)v1;
      }

    }
    return (AMSAccountIdentity *)0;
  }
}

- (uint64_t)ams_removeCookiesMatchingProperties:()AppleMediaServices error:
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "_cookiesMatchingProperties:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "ams_removeCookies:", v2);

  return v3;
}

- (uint64_t)ams_removeCookies:()AppleMediaServices error:
{
  return objc_msgSend(a1, "_updateCookiesWithCookiesToAdd:cookiesToRemove:error:", 0, a3, a4);
}

- (uint64_t)ams_removeCookies:()AppleMediaServices
{
  return objc_msgSend(a1, "ams_removeCookies:error:", a3, 0);
}

- (id)_cookiesMatchingProperties:()AppleMediaServices
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  objc_msgSend(a1, "ams_cookies");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__ACAccount_AppleMediaServices___cookiesMatchingProperties___block_invoke;
  v9[3] = &unk_1E253D2F8;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "ams_filterUsingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (uint64_t)ams_automaticDownloadKinds
{
  return objc_msgSend(a1, "_accountPropertyForKey:expectedClass:", CFSTR("automaticDownloadKinds"), objc_opt_class());
}

- (uint64_t)ams_creditsString
{
  return objc_msgSend(a1, "_accountPropertyForKey:expectedClass:", CFSTR("accountCredits"), objc_opt_class());
}

- (BOOL)ams_didAgreeToTerms
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "_accountPropertyForKey:expectedClass:", CFSTR("didAgreeToTerms"), objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (uint64_t)ams_disableAccountFlagsSync
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "_accountPropertyForKey:expectedClass:", CFSTR("disableAccountFlagsSync"), objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (uint64_t)ams_disablePrivacyAcknowledgementSync
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "_accountPropertyForKey:expectedClass:", CFSTR("disablePrivacyAcknowledgementSync"), objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (uint64_t)ams_freePasswordPromptSetting
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "_accountPropertyForKey:expectedClass:", CFSTR("freeDownloadsPasswordSetting"), objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "unsignedIntegerValue");

  return v2;
}

- (void)ams_setFreePasswordPromptSetting:()AppleMediaServices
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_setAccountProperty:forKey:expectedClass:", v2, CFSTR("freeDownloadsPasswordSetting"), objc_opt_class());

}

- (BOOL)ams_isiCloudFamily
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "_accountPropertyForKey:expectedClass:", CFSTR("iCloudFamily"), objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (BOOL)ams_isInGoodStanding
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "_accountPropertyForKey:expectedClass:", CFSTR("inGoodStanding"), objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (uint64_t)ams_isManagedAppleID
{
  return objc_msgSend(a1, "_accountPropertyBooleanForKey:", CFSTR("isManagedAppleID"));
}

- (uint64_t)ams_isValidPayment
{
  return objc_msgSend(a1, "_accountPropertyBooleanForKey:", CFSTR("validPayment"));
}

- (id)ams_lastAuthenticationServerResponse
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E60], "ams_PLISTClasses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_accountPropertyForKey:dataProtectionClass:expectedClasses:error:", CFSTR("lastAuthenticationServerResponse"), 1, v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (uint64_t)ams_mergedPrivacyAcknowledgement
{
  return objc_msgSend(a1, "_accountPropertyBooleanForKey:", CFSTR("mergedPrivacyAcknowledgements"));
}

- (uint64_t)ams_paidPasswordPromptSetting
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "_accountPropertyForKey:expectedClass:", CFSTR("paidPurchasesPasswordSetting"), objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "unsignedIntegerValue");

  return v2;
}

- (void)ams_setPaidPasswordPromptSetting:()AppleMediaServices
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_setAccountProperty:forKey:expectedClass:", v2, CFSTR("paidPurchasesPasswordSetting"), objc_opt_class());

}

- (id)ams_password
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "credential");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "password");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)ams_pushRegistrationThrottleMap
{
  return objc_msgSend(a1, "_accountPropertyForKey:expectedClass:", CFSTR("pushRegistrationThrottleMap"), objc_opt_class());
}

- (id)ams_rawPassword
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "credential");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "credentialItemForKey:", *MEMORY[0x1E0C8F258]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return v3;
  if (!objc_msgSend(a1, "ams_isDemoAccount"))
    return 0;
  objc_msgSend(a1, "_accountPropertyForKey:expectedClass:", CFSTR("demoAccountRawPassword"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v3)
  {
    if (!v4)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "OSLogObject");
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    v7 = objc_opt_class();
    AMSLogKey();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v7;
    v16 = 2114;
    v17 = v8;
    v9 = "%{public}@: [%{public}@] Using the demo password.";
    v10 = v6;
    v11 = OS_LOG_TYPE_DEFAULT;
  }
  else
  {
    if (!v4)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "OSLogObject");
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    v13 = objc_opt_class();
    AMSLogKey();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v13;
    v16 = 2114;
    v17 = v8;
    v9 = "%{public}@: [%{public}@] The demo account is missing a raw password.";
    v10 = v6;
    v11 = OS_LOG_TYPE_ERROR;
  }
  _os_log_impl(&dword_18C849000, v10, v11, v9, (uint8_t *)&v14, 0x16u);

LABEL_14:
  return v3;
}

- (uint64_t)ams_registerSuccessCriteria
{
  return objc_msgSend(a1, "_accountPropertyForKey:expectedClass:", CFSTR("registerSuccessCriteria"), objc_opt_class());
}

- (BOOL)ams_requiresAuthKitUpdate
{
  void *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  objc_msgSend(a1, "ams_DSID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(a1, "credential");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "password");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 == 0;

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (void)ams_setAgreedToTerms:()AppleMediaServices
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_setAccountProperty:forKey:expectedClass:", v2, CFSTR("didAgreeToTerms"), objc_opt_class());

}

- (void)ams_setAltDSID:()AppleMediaServices
{
  id v4;

  v4 = a3;
  objc_msgSend(a1, "_setAccountProperty:forKey:expectedClass:", v4, CFSTR("altDSID"), objc_opt_class());

}

- (void)ams_setCreditsString:()AppleMediaServices
{
  id v4;

  v4 = a3;
  objc_msgSend(a1, "_setAccountProperty:forKey:expectedClass:", v4, CFSTR("accountCredits"), objc_opt_class());

}

- (uint64_t)ams_setDisableAccountFlagsSync:()AppleMediaServices
{
  uint64_t v3;

  if (a3)
    v3 = MEMORY[0x1E0C9AAB0];
  else
    v3 = 0;
  return objc_msgSend(a1, "_setAccountProperty:forKey:expectedClass:", v3, CFSTR("disableAccountFlagsSync"), objc_opt_class());
}

- (uint64_t)ams_setDisablePrivacyAcknowledgementSync:()AppleMediaServices
{
  uint64_t v3;

  if (a3)
    v3 = MEMORY[0x1E0C9AAB0];
  else
    v3 = 0;
  return objc_msgSend(a1, "_setAccountProperty:forKey:expectedClass:", v3, CFSTR("disablePrivacyAcknowledgementSync"), objc_opt_class());
}

- (void)ams_setDSID:()AppleMediaServices
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(a1, "ams_isiCloudAccount"))
  {
    objc_msgSend(v5, "stringValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_setAccountProperty:forKey:expectedClass:", v4, CFSTR("personID"), objc_opt_class());

  }
  else if (objc_msgSend(a1, "ams_isiTunesAccount"))
  {
    objc_msgSend(a1, "_setAccountProperty:forKey:expectedClass:", v5, CFSTR("dsid"), objc_opt_class());
  }

}

- (void)ams_setFirstName:()AppleMediaServices
{
  id v4;

  v4 = a3;
  objc_msgSend(a1, "_setAccountProperty:forKey:expectedClass:", v4, CFSTR("firstName"), objc_opt_class());

}

- (void)ams_setiCloudFamily:()AppleMediaServices
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_setAccountProperty:forKey:expectedClass:", v2, CFSTR("iCloudFamily"), objc_opt_class());

}

- (void)ams_setInGoodStanding:()AppleMediaServices
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_setAccountProperty:forKey:expectedClass:", v2, CFSTR("inGoodStanding"), objc_opt_class());

}

- (void)ams_setLastName:()AppleMediaServices
{
  id v4;

  v4 = a3;
  objc_msgSend(a1, "_setAccountProperty:forKey:expectedClass:", v4, CFSTR("lastName"), objc_opt_class());

}

- (void)ams_setManagedAppleID:()AppleMediaServices
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_setAccountProperty:forKey:expectedClass:", v2, CFSTR("isManagedAppleID"), objc_opt_class());

}

- (void)ams_setMergedPrivacyAcknowledgement:()AppleMediaServices
{
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a1, "ams_isLocalAccount") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_setAccountProperty:forKey:expectedClass:", v9, CFSTR("mergedPrivacyAcknowledgements"), objc_opt_class());

  }
  else
  {
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "OSLogObject");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = objc_opt_class();
      AMSLogKey();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v11 = v7;
      v12 = 2114;
      v13 = v8;
      _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_ERROR, "%{public}@ [%{public}@] Someone is attempting to set mergedPrivacyAcknowledgement on a non-local account.", buf, 0x16u);

    }
  }
}

- (void)ams_setPassword:()AppleMediaServices
{
  uint64_t v3;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  const char *v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "OSLogObject");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    AMSLogKey();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0CB3940];
    v11 = objc_opt_class();
    v26 = a2;
    if (v9)
    {
      AMSLogKey();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v3 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v11, v12, v3);
    }
    else
    {
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("%@: %@ "), v11, v12);
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(a1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashAndLogCacheMisses(v6, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v28 = v13;
    v29 = 2114;
    v30 = v14;
    v31 = 2114;
    v32 = v15;
    _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Updating the password of an account. account = %{public}@ | password = %{public}@", buf, 0x20u);
    if (v9)
    {

      v13 = (void *)v3;
    }

    a2 = v26;
  }

  objc_msgSend(a1, "credential");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v17, "OSLogObject");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      AMSLogKey();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)MEMORY[0x1E0CB3940];
      v21 = objc_opt_class();
      if (v19)
      {
        AMSLogKey();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v16 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v21, v22, v16);
      }
      else
      {
        NSStringFromSelector(a2);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "stringWithFormat:", CFSTR("%@: %@ "), v21, v22);
      }
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(a1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v23;
      v29 = 2114;
      v30 = v24;
      _os_log_impl(&dword_18C849000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@The account did not have a credential, creating one. account = %{public}@", buf, 0x16u);
      if (v19)
      {

        v23 = v16;
      }

    }
    v16 = objc_alloc_init(MEMORY[0x1E0C8F2B0]);
    objc_msgSend(a1, "setCredential:", v16);
  }
  objc_msgSend(a1, "credential");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setPassword:", v6);

}

- (void)ams_setPushRegistrationThrottleMap:()AppleMediaServices
{
  id v4;

  v4 = a3;
  objc_msgSend(a1, "_setAccountProperty:forKey:expectedClass:", v4, CFSTR("pushRegistrationThrottleMap"), objc_opt_class());

}

- (void)ams_setRawPassword:()AppleMediaServices
{
  uint64_t v3;
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a1, "credential");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      AMSLogKey();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0CB3940];
      v12 = objc_opt_class();
      if (v10)
      {
        AMSLogKey();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v3 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v12, v13, v3);
      }
      else
      {
        NSStringFromSelector(a2);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringWithFormat:", CFSTR("%@: %@ "), v12, v13);
      }
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(a1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v14;
      v27 = 2114;
      v28 = v15;
      _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@The account did not have a credential, creating one. account = %{public}@", buf, 0x16u);
      if (v10)
      {

        v14 = (void *)v3;
      }

    }
    v7 = objc_alloc_init(MEMORY[0x1E0C8F2B0]);
    objc_msgSend(a1, "setCredential:", v7);
  }
  objc_msgSend(a1, "credential");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setCredentialItem:forKey:", v6, *MEMORY[0x1E0C8F258]);

  if (objc_msgSend(a1, "ams_isDemoAccount"))
  {
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v17, "OSLogObject");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      AMSLogKey();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)MEMORY[0x1E0CB3940];
      v21 = objc_opt_class();
      if (v19)
      {
        AMSLogKey();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        a2 = (const char *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v21, v22, a2);
      }
      else
      {
        NSStringFromSelector(a2);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "stringWithFormat:", CFSTR("%@: %@ "), v21, v22);
      }
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(a1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v23;
      v27 = 2114;
      v28 = v24;
      _os_log_impl(&dword_18C849000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@Setting the demo account's raw password. account = %{public}@", buf, 0x16u);
      if (v19)
      {

        v23 = (void *)a2;
      }

    }
    objc_msgSend(a1, "_setAccountProperty:forKey:expectedClass:", v6, CFSTR("demoAccountRawPassword"), objc_opt_class());
  }

}

- (void)ams_setRegisterSuccessCriteria:()AppleMediaServices
{
  id v4;

  v4 = a3;
  objc_msgSend(a1, "_setAccountProperty:forKey:expectedClass:", v4, CFSTR("registerSuccessCriteria"), objc_opt_class());

}

- (void)ams_setServerResponse:()AppleMediaServices
{
  id v4;

  v4 = a3;
  objc_msgSend(a1, "_setAccountProperty:forKey:dataProtectionClass:expectedClass:", v4, CFSTR("lastAuthenticationServerResponse"), 1, objc_opt_class());

}

- (uint64_t)ams_setStorefront:()AppleMediaServices
{
  return objc_msgSend(a1, "ams_setStorefront:forMediaType:", a3, 0);
}

- (void)ams_setValidPayment:()AppleMediaServices
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_setAccountProperty:forKey:expectedClass:", v2, CFSTR("validPayment"), objc_opt_class());

}

+ (id)ams_createEphemeralAccount
{
  id v0;
  id v1;
  void *v2;
  void *v3;

  v0 = objc_alloc(MEMORY[0x1E0C8F298]);
  v1 = objc_alloc(MEMORY[0x1E0C8F2C8]);
  v2 = (void *)objc_msgSend(v1, "initWithIdentifier:description:", *MEMORY[0x1E0C8F170], CFSTR("Ephemeral Account"));
  v3 = (void *)objc_msgSend(v0, "initWithAccountType:", v2);

  objc_msgSend(v3, "setIdentifier:", CFSTR("iTunes-Ephemeral"));
  objc_msgSend(v3, "setActive:", 0);
  objc_msgSend(v3, "setUsername:", CFSTR("Ephemeral"));
  return v3;
}

+ (AMSStorageDatabase)_ams_storage
{
  return -[AMSStorageDatabase initWithDomain:]([AMSStorageDatabase alloc], "initWithDomain:", CFSTR("com.apple.AppleMediaServices"));
}

- (id)ams_delta:()AppleMediaServices
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  uint64_t v22;
  AMSPair *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  AMSPair *v28;
  void *v29;
  AMSPair *v30;
  int v31;
  AMSPair *v32;
  void *v33;
  AMSPair *v34;
  void *v35;
  void *v36;
  void *v37;
  char v38;
  AMSPair *v39;
  void *v40;
  void *v41;
  AMSPair *v42;
  void *v43;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    objc_msgSend(a1, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

    if (!v7)
    {
      v43 = 0;
      goto LABEL_29;
    }
  }
  v45 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v9 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a1, "accountProperties");
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v10, "allKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unionSet:", v12);

  if (v4)
  {
    v13 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v4, "accountProperties");
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v10, "allKeys");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setWithArray:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "unionSet:", v15);

  }
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v16 = v8;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v47 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i);
        objc_msgSend(a1, "objectForKeyedSubscript:", v21);
        v10 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", v21);
        v22 = objc_claimAutoreleasedReturnValue();
        if (v10 | v22 && (objc_msgSend((id)v10, "isEqual:", v22) & 1) == 0)
        {
          v23 = -[AMSPair initWithFirst:second:]([AMSPair alloc], "initWithFirst:second:", v10, v22);
          objc_msgSend(v45, "setObject:forKeyedSubscript:", v23, v21);

        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
    }
    while (v18);
  }

  objc_msgSend(a1, "accountType");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24 || (objc_msgSend(v4, "accountType"), (v10 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(a1, "accountType");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accountType");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (v24)
    {

      if ((v27 & 1) != 0)
        goto LABEL_20;
      goto LABEL_19;
    }

    if ((v27 & 1) == 0)
    {
LABEL_19:
      v28 = [AMSPair alloc];
      objc_msgSend(a1, "accountType");
      v10 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "accountType");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = -[AMSPair initWithFirst:second:](v28, "initWithFirst:second:", v10, v29);
      objc_msgSend(v45, "setObject:forKeyedSubscript:", v30, CFSTR("accountType"));

    }
  }
LABEL_20:
  v31 = objc_msgSend(a1, "isActive");
  if (v31 != objc_msgSend(v4, "isActive"))
  {
    v32 = [AMSPair alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1, "isActive"));
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isActive"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = -[AMSPair initWithFirst:second:](v32, "initWithFirst:second:", v10, v33);
    objc_msgSend(v45, "setObject:forKeyedSubscript:", v34, CFSTR("active"));

  }
  objc_msgSend(a1, "username");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v35)
  {
    objc_msgSend(v4, "username");
    v10 = objc_claimAutoreleasedReturnValue();
    if (!v10)
      goto LABEL_27;
  }
  objc_msgSend(a1, "username");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "username");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v36, "isEqual:", v37);

  if (!v35)
  {

    if ((v38 & 1) != 0)
      goto LABEL_27;
    goto LABEL_26;
  }

  if ((v38 & 1) == 0)
  {
LABEL_26:
    v39 = [AMSPair alloc];
    objc_msgSend(a1, "username");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "username");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = -[AMSPair initWithFirst:second:](v39, "initWithFirst:second:", v40, v41);
    objc_msgSend(v45, "setObject:forKeyedSubscript:", v42, CFSTR("username"));

  }
LABEL_27:
  v43 = (void *)objc_msgSend(v45, "copy");

LABEL_29:
  return v43;
}

- (uint64_t)ams_didAcknowledgeBundleHolderPrivacyAcknowledgementOnDevice
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  __CFString *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  _QWORD v21[4];
  __CFString *v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_ams_storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  objc_msgSend(v2, "valueForKey:error:", CFSTR("bundleHolderAcknowledgedAccounts"), &v23);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v23;
  if (v4)
  {
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
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
      v7 = (void *)objc_opt_class();
      v8 = v7;
      objc_msgSend(a1, "hashedDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v25 = v7;
      v26 = 2114;
      v27 = v9;
      v28 = 2114;
      v29 = v10;
      _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Could not pull accounts acknowledged on device for holder %{public}@ %{public}@", buf, 0x20u);

    }
  }
  if ((objc_msgSend(a1, "ams_isLocalAccount") & 1) != 0)
  {
    v11 = CFSTR("local");
  }
  else
  {
    objc_msgSend(a1, "ams_DSID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringValue");
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      v14 = 0;
      goto LABEL_18;
    }
  }
  if (v3)
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __93__ACAccount_AppleMediaServices__ams_didAcknowledgeBundleHolderPrivacyAcknowledgementOnDevice__block_invoke;
    v21[3] = &unk_1E253D348;
    v22 = v11;
    v13 = v11;
    v14 = objc_msgSend(v3, "ams_anyWithTest:", v21);
    v15 = v22;
  }
  else
  {
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v15, "OSLogObject");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (void *)objc_opt_class();
      v18 = v17;
      objc_msgSend(a1, "hashedDescription");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = v17;
      v26 = 2114;
      v27 = v19;
      _os_log_impl(&dword_18C849000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: No accounts acknowledged on device for holder found %{public}@", buf, 0x16u);

    }
    v14 = 0;
  }

LABEL_18:
  return v14;
}

- (uint64_t)ams_encryptAccountFlags
{
  void *v2;
  id v3;
  uint64_t v4;

  objc_msgSend(a1, "accountPropertyForKey:", CFSTR("accountFlags"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v3 = 0;
    goto LABEL_7;
  }
  v3 = v2;

  if (!v3)
  {
LABEL_7:
    v4 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v3, "ams_encryptionResult");
  v4 = 1;
  objc_msgSend(a1, "ams_setAccountFlags:", v3);

LABEL_8:
  return v4;
}

- (uint64_t)ams_isDuplicate:()AppleMediaServices
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v32;

  v4 = a3;
  objc_msgSend(a1, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if ((v7 & 1) != 0)
    goto LABEL_32;
  objc_msgSend(a1, "accountType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "isEqualToString:", v11);

  if (!v12)
    goto LABEL_32;
  objc_msgSend(a1, "ams_altDSID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(a1, "ams_altDSID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isEqualToString:", &stru_1E2548760))
    {

      goto LABEL_14;
    }
  }
  objc_msgSend(v4, "ams_altDSID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14
    && (objc_msgSend(v4, "ams_altDSID"),
        v11 = objc_claimAutoreleasedReturnValue(),
        (objc_msgSend((id)v11, "isEqualToString:", &stru_1E2548760) & 1) != 0))
  {
    v15 = 0;
  }
  else
  {
    objc_msgSend(a1, "ams_altDSID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ams_altDSID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v16, "isEqualToString:", v17);

    if (!v14)
      goto LABEL_11;
  }

LABEL_11:
  if (v13)
  {

  }
  if ((v15 & 1) != 0)
    goto LABEL_29;
LABEL_14:
  objc_msgSend(v4, "ams_DSID");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    objc_msgSend(a1, "ams_DSID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ams_DSID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v20, "isEqualToNumber:", v21);

    if ((v11 & 1) != 0)
      goto LABEL_29;
  }
  objc_msgSend(a1, "username");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    objc_msgSend(a1, "username");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "isEqualToString:", &stru_1E2548760))
    {

      goto LABEL_30;
    }
    v32 = v23;
  }
  objc_msgSend(v4, "username");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24
    && (objc_msgSend(v4, "username"),
        v11 = objc_claimAutoreleasedReturnValue(),
        (objc_msgSend((id)v11, "isEqualToString:", &stru_1E2548760) & 1) != 0))
  {
    v25 = 0;
  }
  else
  {
    objc_msgSend(a1, "username");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "lowercaseString");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "username");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "lowercaseString");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v27, "isEqualToString:", v29);

    if (!v24)
      goto LABEL_26;
  }

LABEL_26:
  if (v22)
  {

  }
  if ((v25 & 1) == 0)
  {
LABEL_30:
    if (objc_msgSend(a1, "ams_isLocalAccount"))
    {
      v30 = objc_msgSend(v4, "ams_isLocalAccount");
      goto LABEL_33;
    }
LABEL_32:
    v30 = 0;
    goto LABEL_33;
  }
LABEL_29:
  v30 = 1;
LABEL_33:

  return v30;
}

- (id)ams_isInRestrictedRegionWithBag:()AppleMediaServices waitForSync:
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  AMSSyncRestrictedRegionTask *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  int v22;
  const __CFString *v23;
  id v24;
  _QWORD v26[5];
  id v27;
  id v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  const __CFString *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  AMSSetLogKeyIfNeeded();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ams_accountFlagValueForAccountFlag:", AMSAccountFlagIsInRestrictedRegion);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;

  if (!v6)
  {
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v16, "OSLogObject");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v30 = (id)objc_opt_class();
      v31 = 2114;
      v32 = v7;
      v18 = v30;
      _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to load bag", buf, 0x16u);

    }
    AMSError(200, CFSTR("Bag Invalid Value Error"), CFSTR("Bag Load Failed"), 0);
    v10 = (AMSSyncRestrictedRegionTask *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v10);
    v19 = objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  v10 = -[AMSSyncRestrictedRegionTask initWithAccount:bag:]([AMSSyncRestrictedRegionTask alloc], "initWithAccount:bag:", a1, v6);
  +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (!a4)
  {
    if (!v11)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v12, "OSLogObject");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = (void *)objc_opt_class();
      v22 = objc_msgSend(v9, "BOOLValue");
      v23 = CFSTR("NO");
      *(_DWORD *)buf = 138543874;
      v30 = v21;
      v31 = 2114;
      if (v22)
        v23 = CFSTR("YES");
      v32 = v7;
      v33 = 2114;
      v34 = v23;
      _os_log_impl(&dword_18C849000, v20, OS_LOG_TYPE_INFO, "%{public}@ [%{public}@]: Start AMSSyncRestrictedRegionTask but do not wait for the sync task to be finished, returning currentIsInRestrictedRegion = %{public}@", buf, 0x20u);
    }

    v24 = -[AMSSyncRestrictedRegionTask performSync](v10, "performSync");
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v9);
    v19 = objc_claimAutoreleasedReturnValue();
LABEL_23:
    v15 = (void *)v19;
    goto LABEL_24;
  }
  if (!v11)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v12, "OSLogObject");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v30 = (id)objc_opt_class();
    v31 = 2114;
    v32 = v7;
    _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_INFO, "%{public}@ [%{public}@]: Start AMSSyncRestrictedRegionTask and return the promise, which will be finished when the task is done.", buf, 0x16u);
  }

  -[AMSSyncRestrictedRegionTask performSync](v10, "performSync");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __77__ACAccount_AppleMediaServices__ams_isInRestrictedRegionWithBag_waitForSync___block_invoke;
  v26[3] = &unk_1E253D370;
  v26[4] = a1;
  v27 = v7;
  v28 = v9;
  objc_msgSend(v14, "continueWithBlock:", v26);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_24:
  return v15;
}

- (uint64_t)ams_isInRestrictedRegionWithBag:()AppleMediaServices shouldWaitForSync:
{
  id v6;
  void *v7;
  uint64_t v8;
  AMSSyncRestrictedRegionTask *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  __CFString *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  const __CFString *v24;
  NSObject *v25;
  uint64_t v26;
  const __CFString *v27;
  id v28;
  id v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  const __CFString *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  AMSSetLogKeyIfNeeded();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(a1, "ams_valueForAccountFlag:", AMSAccountFlagIsInRestrictedRegion);
  v9 = -[AMSSyncRestrictedRegionTask initWithAccount:bag:]([AMSSyncRestrictedRegionTask alloc], "initWithAccount:bag:", a1, v6);

  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (a4)
  {
    if (!v10)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v11, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      v32 = objc_opt_class();
      v33 = 2114;
      v34 = v7;
      _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_INFO, "%{public}@ [%{public}@]: Start AMSSyncRestrictedRegionTask and wait until sync finishes.", buf, 0x16u);
    }

    -[AMSSyncRestrictedRegionTask performSync](v9, "performSync");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    v14 = (id)objc_msgSend(v13, "resultWithError:", &v30);
    v15 = v30;

    if (v15)
    {
      +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v16)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v16, "OSLogObject");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = objc_opt_class();
        AMSHashIfNeeded(a1);
        v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
        AMSLogableError(v15);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v32 = v18;
        v33 = 2114;
        v34 = v7;
        v35 = 2114;
        v36 = v19;
        v37 = 2114;
        v38 = v20;
        _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] AMSSyncRestrictedRegionTask has failed. account = %{public}@ | error = %{public}@", buf, 0x2Au);

      }
    }
    v8 = objc_msgSend(a1, "ams_valueForAccountFlag:", AMSAccountFlagIsInRestrictedRegion);
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v21)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v21, "OSLogObject");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = objc_opt_class();
      v24 = CFSTR("NO");
      *(_DWORD *)buf = 138543874;
      v32 = v23;
      v33 = 2114;
      if ((_DWORD)v8)
        v24 = CFSTR("YES");
      v34 = v7;
      v35 = 2114;
      v36 = v24;
      _os_log_impl(&dword_18C849000, v22, OS_LOG_TYPE_INFO, "%{public}@ [%{public}@]: AMSSyncRestrictedRegionTask has finished, IsInRestrictedRegion = %{public}@", buf, 0x20u);
    }

  }
  else
  {
    if (!v10)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v11, "OSLogObject");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v26 = objc_opt_class();
      v27 = CFSTR("NO");
      *(_DWORD *)buf = 138543874;
      v32 = v26;
      v33 = 2114;
      if ((_DWORD)v8)
        v27 = CFSTR("YES");
      v34 = v7;
      v35 = 2114;
      v36 = v27;
      _os_log_impl(&dword_18C849000, v25, OS_LOG_TYPE_INFO, "%{public}@ [%{public}@]: Start AMSSyncRestrictedRegionTask but not waiting for sync, returning currentIsInRestrictedRegion = %{public}@", buf, 0x20u);
    }

    v28 = -[AMSSyncRestrictedRegionTask performSync](v9, "performSync");
  }

  return v8;
}

- (uint64_t)ams_isSubjectToPerDeviceBundleHolderAcknowledgement
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "ams_isBundleOwner");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    return 0;
  objc_msgSend(a1, "ams_isBundleOwner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "BOOLValue") & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(a1, "ams_didAcknowledgeBundleHolderPrivacyAcknowledgementOnDevice") ^ 1;

  return v4;
}

- (uint64_t)ams_mergePrivacyAcknowledgement:()AppleMediaServices
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  unint64_t v29;
  void *v30;
  unint64_t v31;
  uint64_t v32;
  id obj;
  void *v35;
  id v36;
  uint64_t v37;
  _QWORD v38[2];
  void (*v39)(uint64_t, void *);
  void *v40;
  void *v41;
  _QWORD v42[2];
  void (*v43)(uint64_t, void *);
  void *v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    objc_msgSend(a1, "ams_privacyAcknowledgement");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v15 = 0;
      goto LABEL_45;
    }
  }
  v35 = a1;
  objc_msgSend(a1, "ams_privacyAcknowledgement");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = (void *)MEMORY[0x1E0C9AA70];
  if (v6)
    v8 = (void *)v6;
  v9 = v8;

  v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(v9, "allKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObjectsFromArray:", v11);

  if (v4)
  {
    objc_msgSend(v4, "allKeys");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObjectsFromArray:", v12);

  }
  else
  {
    objc_msgSend(v10, "addObjectsFromArray:", MEMORY[0x1E0C9AA60]);
  }
  v36 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = v10;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
  if (!v13)
  {
    v15 = 0;
    goto LABEL_44;
  }
  v14 = v13;
  v15 = 0;
  v37 = *(_QWORD *)v47;
  do
  {
    v16 = 0;
    do
    {
      if (*(_QWORD *)v47 != v37)
        objc_enumerationMutation(obj);
      v17 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * v16);
      objc_msgSend(v9, "objectForKeyedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v19 = v18;
      }
      else
      {
        objc_msgSend(v9, "objectForKeyedSubscript:", v17);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          v42[0] = MEMORY[0x1E0C809B0];
          v42[1] = 3221225472;
          v43 = __65__ACAccount_AppleMediaServices__ams_mergePrivacyAcknowledgement___block_invoke;
          v44 = &unk_1E253D398;
          v45 = v35;
          objc_msgSend(v9, "objectForKeyedSubscript:", v17);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v43((uint64_t)v42, v21);

        }
        v19 = 0;
      }

      objc_msgSend(v4, "objectForKeyedSubscript:", v17);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v23 = v22;
      }
      else
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", v17);
        v23 = (id)objc_claimAutoreleasedReturnValue();

        if (v23)
        {
          v38[0] = MEMORY[0x1E0C809B0];
          v38[1] = 3221225472;
          v39 = __65__ACAccount_AppleMediaServices__ams_mergePrivacyAcknowledgement___block_invoke_183;
          v40 = &unk_1E253D398;
          v41 = v35;
          objc_msgSend(v4, "objectForKeyedSubscript:", v17);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v39((uint64_t)v38, v24);

          v23 = 0;
        }
      }

      if (v19 && !v23)
      {
        v25 = 4;
        v26 = v19;
LABEL_28:
        v15 |= v25;
        v27 = v26;
LABEL_29:
        objc_msgSend(v36, "setObject:forKeyedSubscript:", v27, v17);

        goto LABEL_30;
      }
      if (!v19 && v23)
      {
        v25 = 2;
        v26 = v23;
        goto LABEL_28;
      }
      v28 = objc_msgSend(v19, "unsignedIntegerValue");
      if (v28 == objc_msgSend(v23, "unsignedIntegerValue"))
        goto LABEL_36;
      if (objc_msgSend(v23, "unsignedIntegerValue"))
      {
        v29 = objc_msgSend(v19, "unsignedIntegerValue");
        if (v29 > objc_msgSend(v23, "unsignedIntegerValue"))
        {
          v15 |= 4uLL;
LABEL_36:
          v30 = v19;
          goto LABEL_39;
        }
        v31 = objc_msgSend(v19, "unsignedIntegerValue");
        if (v31 >= objc_msgSend(v23, "unsignedIntegerValue"))
          goto LABEL_30;
      }
      v15 |= 2uLL;
      v30 = v23;
LABEL_39:
      v27 = v30;
      if (v27)
        goto LABEL_29;
LABEL_30:

      ++v16;
    }
    while (v14 != v16);
    v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
    v14 = v32;
  }
  while (v32);
LABEL_44:

  objc_msgSend(v35, "_setAccountProperty:forKey:expectedClass:", v36, CFSTR("privacyAcknowledgement"), objc_opt_class());
LABEL_45:

  return v15;
}

- (void)ams_setAccountFlagValue:()AppleMediaServices forAccountFlag:
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  NSObject *v30;
  NSObject *v31;
  const char *v32;
  NSObject *v33;
  uint32_t v34;
  void *v35;
  NSObject *v36;
  void *v37;
  id v38;
  NSObject *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  NSObject *v44;
  uint64_t v45;
  id v46;
  uint8_t buf[4];
  uint64_t v48;
  __int16 v49;
  NSObject *v50;
  __int16 v51;
  NSObject *v52;
  __int16 v53;
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(MEMORY[0x1E0C8F298], "_isAccountFlagWritable:", v7) & 1) == 0)
  {
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v14 = (void *)objc_opt_class();
      v15 = v14;
      objc_msgSend(a1, "hashedDescription");
      v16 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v48 = (uint64_t)v14;
      v49 = 2114;
      v50 = v16;
      v51 = 2114;
      v52 = v7;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Someone is trying to modify a read-only account flag. account = %{public}@ | flag = %{public}@", buf, 0x20u);

    }
    goto LABEL_51;
  }
  if ((objc_msgSend(MEMORY[0x1E0C8F298], "_isAccountFlagValue:validForAccountFlag:", v6, v7) & 1) == 0)
  {
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_51;
    v17 = (void *)objc_opt_class();
    v13 = v17;
    objc_msgSend(a1, "hashedDescription");
    v18 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v48 = (uint64_t)v17;
    v49 = 2114;
    v50 = v18;
    v51 = 2114;
    v52 = v7;
    v53 = 2114;
    v54 = (id)objc_opt_class();
    v19 = v54;
    _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Someone is trying to set an account flag with an invalid value. account = %{public}@ | flag = %{public}@ value.class = %{public}@", buf, 0x2Au);

    goto LABEL_49;
  }
  if (!_os_feature_enabled_impl() || (objc_msgSend(a1, "ams_isLocalOrSandboxAccount") & 1) != 0)
  {
    v46 = 0;
    objc_msgSend(a1, "_ams_getAccountFlagsShimmedWithError:", &v46);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v46;
    v10 = v9;
    if (v8 || !v9)
    {
LABEL_28:
      v13 = -[NSObject mutableCopy](v8, "mutableCopy");
      if (!v13)
        v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      -[NSObject setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v6, v7);
      if ((-[NSObject isEqualToDictionary:](v8, "isEqualToDictionary:", v13) & 1) == 0)
        objc_msgSend(a1, "_ams_setAccountFlagsShimmed:", v13);
      goto LABEL_50;
    }
    objc_msgSend(v9, "userInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("AMSCryptoErrorCode"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;

    if (-[NSObject integerValue](v13, "integerValue") == -4308)
    {
      +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v23)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v23, "OSLogObject");
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v45 = objc_opt_class();
        objc_msgSend(a1, "hashedDescription");
        v25 = objc_claimAutoreleasedReturnValue();
        AMSLogableError(v10);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v48 = v45;
        v49 = 2114;
        v50 = v13;
        v51 = 2114;
        v52 = v25;
        v53 = 2114;
        v54 = v26;
        _os_log_impl(&dword_18C849000, v24, OS_LOG_TYPE_ERROR, "%{public}@: We failed to decrypt the original account flags with error code %{public}@. Will overwrite with new ones. account = %{public}@ | error = %{public}@", buf, 0x2Au);

      }
      goto LABEL_28;
    }
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
    v27 = objc_claimAutoreleasedReturnValue();
    v19 = (id)v27;
    if (v13)
    {
      if (!v27)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v19 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v19, "OSLogObject");
      v28 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        goto LABEL_48;
      v29 = objc_opt_class();
      objc_msgSend(a1, "hashedDescription");
      v30 = objc_claimAutoreleasedReturnValue();
      AMSLogableError(v10);
      v31 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v48 = v29;
      v49 = 2114;
      v50 = v13;
      v51 = 2114;
      v52 = v30;
      v53 = 2114;
      v54 = v31;
      v32 = "%{public}@: We failed to decrypt the original account flags with error code %{public}@. Refusing to add new "
            "flags. account = %{public}@ | error = %{public}@";
      v33 = v28;
      v34 = 42;
    }
    else
    {
      if (!v27)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v19 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v19, "OSLogObject");
      v28 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        goto LABEL_48;
      v41 = objc_opt_class();
      objc_msgSend(a1, "hashedDescription");
      v30 = objc_claimAutoreleasedReturnValue();
      AMSLogableError(v10);
      v31 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v48 = v41;
      v49 = 2114;
      v50 = v30;
      v51 = 2114;
      v52 = v31;
      v32 = "%{public}@: We failed to decrypt the original account flags. Refusing to add new flags. account = %{public}@"
            " | error = %{public}@";
      v33 = v28;
      v34 = 32;
    }
    _os_log_impl(&dword_18C849000, v33, OS_LOG_TYPE_ERROR, v32, buf, v34);

LABEL_48:
LABEL_49:

LABEL_50:
LABEL_51:

    goto LABEL_52;
  }
  v20 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v20;

    if (v10)
    {
      if (-[NSObject isEqualToString:](v7, "isEqualToString:", AMSAccountFlagAutoPlay))
      {
        +[AMSAccountCachedServerData sharedInstance](AMSAccountCachedServerData, "sharedInstance");
        v8 = objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v10, "BOOLValue");
        objc_msgSend(a1, "ams_accountID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setAutoPlay:forAccountID:](v8, "setAutoPlay:forAccountID:", v21, v22);
      }
      else
      {
        if (!-[NSObject isEqualToString:](v7, "isEqualToString:", AMSAccountFlagPersonalization))
        {
          +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
          v8 = objc_claimAutoreleasedReturnValue();
          if (!v8)
          {
            +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
            v8 = objc_claimAutoreleasedReturnValue();
          }
          -[NSObject OSLogObject](v8, "OSLogObject");
          v13 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            goto LABEL_50;
          v43 = (void *)objc_opt_class();
          v19 = v43;
          objc_msgSend(a1, "hashedDescription");
          v44 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v48 = (uint64_t)v43;
          v49 = 2114;
          v50 = v44;
          v51 = 2114;
          v52 = v7;
          v53 = 2114;
          v54 = (id)objc_opt_class();
          v28 = v54;
          _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_ERROR, "%{public}@: Someone is trying to set an account flag that should not be set. account = %{public}@ | flag = %{public}@ value.class = %{public}@", buf, 0x2Au);

          goto LABEL_48;
        }
        +[AMSAccountCachedServerData sharedInstance](AMSAccountCachedServerData, "sharedInstance");
        v8 = objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v10, "BOOLValue");
        objc_msgSend(a1, "ams_accountID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setPersonalization:forAccountID:](v8, "setPersonalization:forAccountID:", v42, v22);
      }

      goto LABEL_51;
    }
  }
  else
  {

  }
  +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v35)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v35, "OSLogObject");
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
  {
    v37 = (void *)objc_opt_class();
    v38 = v37;
    objc_msgSend(a1, "hashedDescription");
    v39 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v48 = (uint64_t)v37;
    v49 = 2114;
    v50 = v39;
    v51 = 2114;
    v52 = v7;
    v53 = 2114;
    v54 = (id)objc_opt_class();
    v40 = v54;
    _os_log_impl(&dword_18C849000, v36, OS_LOG_TYPE_ERROR, "%{public}@: Someone is trying to set an account flag with a nil value. account = %{public}@ | flag = %{public}@ value.class = %{public}@", buf, 0x2Au);

  }
  v10 = 0;
LABEL_52:

}

- (void)ams_setActive:()AppleMediaServices forMediaType:
{
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1, "ams_isLocalAccount"))
  {
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = objc_opt_class();
      AMSLogKey();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543874;
      v12 = v8;
      v13 = 2114;
      v14 = v9;
      v15 = 2114;
      v16 = v10;
      _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] %{public}@ cannot set active on local account.", (uint8_t *)&v11, 0x20u);

    }
  }
  else
  {
    objc_msgSend(a1, "setActive:", a3);
  }
}

- (void)ams_setDidAcknowledgeBundleHolderPrivacyAcknowledgementOnDevice:()AppleMediaServices
{
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
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
    v7 = objc_opt_class();
    objc_msgSend(a1, "hashedDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v28 = v7;
    v29 = 2114;
    v30 = v8;
    v31 = 1024;
    LODWORD(v32) = a3;
    _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Will attempt to set new per device holder record. Setting  to %d", buf, 0x1Cu);

  }
  if ((objc_msgSend(a1, "ams_isLocalAccount") & 1) != 0)
  {
    v9 = CFSTR("local");
LABEL_8:
    objc_msgSend((id)objc_opt_class(), "_ams_storage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "valueForKey:error:", CFSTR("bundleHolderAcknowledgedAccounts"), 0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    v14 = (void *)MEMORY[0x1E0C9AA60];
    if (v12)
      v14 = (void *)v12;
    v15 = v14;

    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (a3)
      objc_msgSend(v16, "addObject:", v9);
    else
      objc_msgSend(v16, "removeObject:", v9);
    objc_msgSend(v16, "allObjects");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    objc_msgSend(v11, "setValue:forKey:error:", v17, CFSTR("bundleHolderAcknowledgedAccounts"), &v26);
    v18 = v26;

    if (v18)
    {
      +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v19)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v19, "OSLogObject");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = objc_opt_class();
        objc_msgSend(a1, "hashedDescription");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        AMSLogableError(v18);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v28 = v21;
        v29 = 2114;
        v30 = v22;
        v31 = 2114;
        v32 = v23;
        _os_log_impl(&dword_18C849000, v20, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Cannot update acknowledgement record due to storage error %{public}@", buf, 0x20u);

      }
    }

    goto LABEL_20;
  }
  objc_msgSend(a1, "ams_DSID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringValue");
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v9)
    goto LABEL_8;
  +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  -[__CFString OSLogObject](v9, "OSLogObject");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    v24 = objc_opt_class();
    objc_msgSend(a1, "hashedDescription");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v28 = v24;
    v29 = 2114;
    v30 = v25;
    _os_log_impl(&dword_18C849000, v18, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Cannot update acknowledgement record for unidentifiable account", buf, 0x16u);

  }
LABEL_20:

}

- (void)ams_setInUse:()AppleMediaServices
{
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
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
    v7 = objc_opt_class();
    AMSLogKey();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_DWORD)a3)
      v9 = CFSTR("in");
    else
      v9 = CFSTR("not in");
    AMSHashIfNeeded(a1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138544130;
    v19 = v7;
    v20 = 2114;
    v21 = v8;
    v22 = 2112;
    v23 = v9;
    v24 = 2114;
    v25 = v10;
    _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Marking an account as %@ use for AKAppleIDServiceStore. account = %{public}@", (uint8_t *)&v18, 0x2Au);

  }
  v11 = objc_alloc_init(MEMORY[0x1E0D00130]);
  objc_msgSend(a1, "ams_altDSID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(a1, "ams_altDSID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAppleIDWithAltDSID:inUse:forService:", v13, a3, 2);
  }
  else
  {
    objc_msgSend(a1, "ams_DSID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(a1, "ams_DSID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setAppleIDWithDSID:inUse:forService:", v13, a3, 2);
    }
    else
    {
      +[AMSLogConfig sharedAccountsAuthenticationPluginConfig](AMSLogConfig, "sharedAccountsAuthenticationPluginConfig");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v13, "OSLogObject");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = objc_opt_class();
        AMSLogKey();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543618;
        v19 = v16;
        v20 = 2114;
        v21 = v17;
        _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unable to mark the account as not in use. It has no altDSID or DSID.", (uint8_t *)&v18, 0x16u);

      }
    }
  }

}

- (void)ams_setStorefront:()AppleMediaServices forMediaType:
{
  id v4;

  v4 = a3;
  objc_msgSend(a1, "_setAccountProperty:forKey:expectedClass:", v4, CFSTR("storefrontID"), objc_opt_class());

}

- (uint64_t)ams_asynchronouslyAddCookies:()AppleMediaServices
{
  return objc_msgSend(a1, "_updateCookiesWithCookiesToAdd:cookiesToRemove:", a3, 0);
}

- (id)ams_asynchronouslyAddCookiesForResponse:()AppleMediaServices
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C8F298], "_getSetCookiesForResponse:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ams_asynchronouslyAddCookies:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)ams_asynchronouslyAddGlobalCookiesForResponse:()AppleMediaServices
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if ((objc_msgSend(a1, "ams_isLocalAccount") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C8F298], "_getSetGlobalCookiesForResponse:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "ams_asynchronouslyAddCookies:", v5);
  }
  else
  {
    AMSError(2, CFSTR("Attempted adding cookies to non-local account"), 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSBinaryPromise promiseWithError:](AMSBinaryPromise, "promiseWithError:", v5);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (uint64_t)ams_addGlobalCookiesForResult:()AppleMediaServices
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(a1, "ams_isLocalAccount"))
  {
    objc_msgSend(v4, "response");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;

      if (v6)
      {
        v7 = objc_msgSend(a1, "ams_addGlobalCookiesForResponse:", v6);
LABEL_12:

        goto LABEL_13;
      }
    }
    else
    {

    }
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = objc_opt_class();
      AMSLogKey();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543874;
      v15 = v10;
      v16 = 2114;
      v17 = v11;
      v18 = 2114;
      v19 = v12;
      _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to set global cookies. The given AMSURLResult does not contain a NSHTTPURLResponse. result = %{public}@", (uint8_t *)&v14, 0x20u);

    }
    v6 = 0;
    v7 = 0;
    goto LABEL_12;
  }
  v7 = 0;
LABEL_13:

  return v7;
}

- (uint64_t)ams_removeAllCookies
{
  return objc_msgSend(a1, "ams_removeAllCookiesWithError:", 0);
}

- (uint64_t)ams_removeAllCookiesWithError:()AppleMediaServices
{
  void *v5;
  uint64_t v6;

  objc_msgSend(a1, "ams_cookies");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(a1, "_updateCookiesWithCookiesToAdd:cookiesToRemove:error:", 0, v5, a3);

  return v6;
}

- (uint64_t)ams_removeCookiesMatchingProperties:()AppleMediaServices
{
  return objc_msgSend(a1, "ams_removeCookiesMatchingProperties:error:", a3, 0);
}

- (id)_accountPropertyForKey:()AppleMediaServices expectedClassContainedInArray:
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  uint64_t v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a1, "_accountPropertyForKey:expectedClass:", v6, objc_opt_class());
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v34, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig", v20);
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
            v15 = objc_opt_class();
            AMSLogKey();
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138544386;
            v25 = v15;
            v26 = 2114;
            v27 = v16;
            v28 = 2114;
            v29 = v6;
            v30 = 2114;
            v31 = v17;
            v32 = 2114;
            v33 = a4;
            v18 = v17;
            _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] An account property inside an NSArray was stored as the wrong type. key = %{public}@ | actualClass = %{public}@ | expectedClass = %{public}@", buf, 0x34u);

          }
          v12 = 0;
          goto LABEL_15;
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v34, 16);
      if (v9)
        continue;
      break;
    }
  }

  v12 = v7;
LABEL_15:

  return v12;
}

- (uint64_t)_ams_cookieProperties
{
  return objc_msgSend(a1, "_accountPropertyForKey:expectedClassContainedInArray:", CFSTR("cookies"), objc_opt_class());
}

- (uint64_t)_ams_setCookieProperties:()AppleMediaServices
{
  id v4;

  v4 = a3;
  objc_msgSend(a1, "_setAccountProperty:forKey:expectedClass:", v4, CFSTR("cookies"), objc_opt_class());

  return 1;
}

- (BOOL)_ams_migrateCookieProperties:()AppleMediaServices intoCookies:error:
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL8 v16;

  v8 = (void *)MEMORY[0x1E0C92C00];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "ams_propertiesForCookies:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C92C00], "ams_cookiesByMergingProperties:intoProperties:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "differenceFromArray:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "hasChanges"))
  {
    objc_msgSend(v13, "ams_insertedObjects");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "ams_removedObjects");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = +[AMSCookieStorage updateCookiesWithCookiesToAdd:cookiesToRemove:forAccount:error:](AMSCookieStorage, "updateCookiesWithCookiesToAdd:cookiesToRemove:forAccount:error:", v14, v15, a1, a5);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)_ams_setAccountFlagsShimmed:()AppleMediaServices
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (_os_feature_enabled_impl() && (objc_msgSend(a1, "ams_isLocalOrSandboxAccount") & 1) == 0)
  {
    +[AMSAccountCachedServerData sharedInstance](AMSAccountCachedServerData, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "ams_accountID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAccountFlags:forAccountID:", v6, v5);

  }
  objc_msgSend(a1, "_setAccountProperty:forKey:dataProtectionClass:expectedClass:", v6, CFSTR("accountFlags"), 1, objc_opt_class());

}

- (id)_updateCookiesWithCookiesToAdd:()AppleMediaServices cookiesToRemove:
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count") || objc_msgSend(v7, "count"))
  {
    +[AMSCookieStorage updateCookiesWithCookiesToAdd:cookiesToRemove:forAccount:](AMSCookieStorage, "updateCookiesWithCookiesToAdd:cookiesToRemove:forAccount:", v6, v7, a1);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[AMSBinaryPromise promiseWithSuccess](AMSBinaryPromise, "promiseWithSuccess");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;

  return v9;
}

+ (id)_defaultValueForAccountFlag:()AppleMediaServices
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = _MergedGlobals_73;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_MergedGlobals_73, &__block_literal_global_233);
  objc_msgSend((id)qword_1ECEACE48, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_globalCookieAllowlistWithBag:()AppleMediaServices forURL:
{
  return AMSGlobalCookieAllowlistWithBag(a1, a3, a4);
}

- (uint64_t)_hashedMultiUserIdentifiers:()AppleMediaServices
{
  return 0;
}

+ (uint64_t)_isAccountFlagWritable:()AppleMediaServices
{
  id v3;
  uint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", AMSAccountFlagAgeVerificationExpiration) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", AMSAccountFlagAutoPlay) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", AMSAccountFlagPersonalization);
  }

  return v4;
}

- (uint64_t)_setAccountProperty:()AppleMediaServices forKey:expectedClass:
{
  return objc_msgSend(a1, "_setAccountProperty:forKey:dataProtectionClass:expectedClass:", a3, a4, 0, a5);
}

- (void)_setAccountProperty:()AppleMediaServices forKey:dataProtectionClass:expectedClass:
{
  id v10;
  id v11;

  v10 = a4;
  v11 = a3;
  if (objc_msgSend(a1, "ams_isEphemeralAccount"))
    objc_msgSend(a1, "_setEphemeralAccountProperty:forKey:dataProtectionClass:expectedClass:", v11, v10, a5, a6);
  else
    AMSSetAccountProperty(a1, v11, v10, a5, a6);

}

+ (id)ams_globalEphemeralAccountProperties
{
  if (qword_1ECEACE60 != -1)
    dispatch_once(&qword_1ECEACE60, &__block_literal_global_248);
  return (id)qword_1ECEACE68;
}

+ (id)ams_globalEphemeralAccountPropertiesForAccount:()AppleMediaServices
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__2;
  v16 = __Block_byref_object_dispose__2;
  v17 = 0;
  objc_msgSend(a1, "ams_globalEphemeralAccountProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __80__ACAccount_AppleMediaServices__ams_globalEphemeralAccountPropertiesForAccount___block_invoke;
  v9[3] = &unk_1E253D528;
  v11 = &v12;
  v6 = v4;
  v10 = v6;
  objc_msgSend(v5, "readWrite:", v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)_setEphemeralAccountProperty:()AppleMediaServices forKey:dataProtectionClass:expectedClass:
{
  uint64_t v4;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v9, "OSLogObject");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    AMSLogKey();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0CB3940];
    v13 = objc_opt_class();
    v14 = v13;
    if (v11)
    {
      AMSLogKey();
      v4 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("%@: [%@] "), v14, v4);
    }
    else
    {
      objc_msgSend(v12, "stringWithFormat:", CFSTR("%@: "), v13);
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v20 = v15;
    v21 = 2114;
    v22 = v16;
    v23 = 2114;
    v24 = v17;
    _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_DEBUG, "%{public}@ Adding ephemeral account property. Key: %{public}@, Value: %{public}@", buf, 0x20u);
    if (v11)
    {

      v15 = (void *)v4;
    }

  }
  objc_msgSend(MEMORY[0x1E0C8F298], "ams_globalEphemeralAccountPropertiesForAccount:", a1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v7, v8);

}

- (id)_ephemeralAccountPropertyForKey:()AppleMediaServices dataProtectionClass:expectedClasses:error:
{
  uint64_t v3;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    AMSLogKey();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CB3940];
    v10 = objc_opt_class();
    v11 = v10;
    if (v8)
    {
      AMSLogKey();
      v3 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("%@: [%@] "), v11, v3);
    }
    else
    {
      objc_msgSend(v9, "stringWithFormat:", CFSTR("%@: "), v10);
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v18 = v12;
    v19 = 2114;
    v20 = v13;
    _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_DEBUG, "%{public}@ Reading ephemeral account property. Key: %{public}@", buf, 0x16u);
    if (v8)
    {

      v12 = (void *)v3;
    }

  }
  objc_msgSend(MEMORY[0x1E0C8F298], "ams_globalEphemeralAccountPropertiesForAccount:", a1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (uint64_t)ams_bundleOwner
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "ams_isBundleOwner");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (id)ams_homeID
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "ams_homeIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "UUIDString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)ams_homeIdentifier
{
  void *v2;
  void *v3;

  if (+[AMSDevice deviceIsAudioAccessory](AMSDevice, "deviceIsAudioAccessory"))
  {
    objc_msgSend(a1, "_accountPropertyForKey:expectedClass:", CFSTR("homeIdentifier"), objc_opt_class());
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v2);

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)ams_homeUserID
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "ams_homeUserIdentifiers");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (uint64_t)ams_homeUserIdentifiers
{
  return MEMORY[0x1E0C9AA60];
}

- (id)ams_secureToken
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ams_secureTokenForAccount:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (uint64_t)ams_postAccountFlagsWithBagContract:()AppleMediaServices
{
  return 0;
}

- (void)ams_setHomeID:()AppleMediaServices
{
  objc_class *v4;
  id v5;
  id v6;

  v4 = (objc_class *)MEMORY[0x1E0CB3A28];
  v5 = a3;
  v6 = (id)objc_msgSend([v4 alloc], "initWithUUIDString:", v5);

  objc_msgSend(a1, "ams_setHomeIdentifier:", v6);
}

- (void)ams_setHomeIdentifier:()AppleMediaServices
{
  void *v4;
  id v5;

  v5 = a3;
  if (+[AMSDevice deviceIsAudioAccessory](AMSDevice, "deviceIsAudioAccessory"))
  {
    objc_msgSend(v5, "UUIDString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_setAccountProperty:forKey:expectedClass:", v4, CFSTR("homeIdentifier"), objc_opt_class());

  }
}

- (void)ams_setHomeUserID:()AppleMediaServices
{
  id v4;
  char v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v8 = v4;
  if (!v4)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", 0);
    objc_msgSend(a1, "ams_removeHomeUserIdentifier:", v7);
    goto LABEL_5;
  }
  v5 = objc_msgSend(v4, "isEqualToString:", &stru_1E2548760);
  v6 = v8;
  if ((v5 & 1) == 0)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v8);
    objc_msgSend(a1, "ams_addHomeUserIdentifier:", v7);
LABEL_5:

    v6 = v8;
  }

}

- (uint64_t)ams_isPrivateListeningEnabled
{
  return 0;
}

- (uint64_t)ams_isPrivateListeningEnabledForHomeUserIdentifier:()AppleMediaServices
{
  return 0;
}

- (void)ams_setValue:()AppleMediaServices forAccountFlag:
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithBool:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ams_setAccountFlagValue:forAccountFlag:", v8, v7);

}

- (uint64_t)ams_valueForAccountFlag:()AppleMediaServices
{
  void *v1;
  id v2;
  uint64_t v3;

  objc_msgSend(a1, "ams_accountFlagValueForAccountFlag:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;

  v3 = objc_msgSend(v2, "BOOLValue");
  return v3;
}

- (uint64_t)ams_addCookiesForResponse:()AppleMediaServices
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "ams_asynchronouslyAddCookiesForResponse:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "resultWithError:", 0);

  return v2;
}

- (uint64_t)ams_addCookiesForResult:()AppleMediaServices
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "response");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;

    if (v6)
    {
      v7 = objc_msgSend(a1, "ams_addCookiesForResponse:", v6);
      goto LABEL_10;
    }
  }
  else
  {

  }
  +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v8, "OSLogObject");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v10 = objc_opt_class();
    AMSLogKey();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(a1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138544130;
    v16 = v10;
    v17 = 2114;
    v18 = v11;
    v19 = 2114;
    v20 = v12;
    v21 = 2114;
    v22 = v13;
    _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to set cookies on an account. The given AMSURLResult does not contain a NSHTTPURLResponse. account = %{public}@ | result = %{public}@", (uint8_t *)&v15, 0x2Au);

  }
  v6 = 0;
  v7 = 0;
LABEL_10:

  return v7;
}

@end

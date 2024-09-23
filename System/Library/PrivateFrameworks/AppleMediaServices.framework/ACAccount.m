@implementation ACAccount

id __76__ACAccount_AppleMediaServices__ams_cookiesForURL_bag_cleanupGlobalCookies___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  uint64_t v24;
  id v25;
  _QWORD v26[5];
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = v15;

      if (v16)
      {
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __76__ACAccount_AppleMediaServices__ams_cookiesForURL_bag_cleanupGlobalCookies___block_invoke_199;
        v26[3] = &unk_1E253D3C0;
        v26[4] = *(_QWORD *)(a1 + 32);
        v27 = *(id *)(a1 + 48);
        if (objc_msgSend(v16, "ams_anyWithTest:", v26))
          +[AMSOptional optionalWithValue:](AMSOptional, "optionalWithValue:", *(_QWORD *)(a1 + 40));
        else
          +[AMSOptional optionalWithNil](AMSOptional, "optionalWithNil");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v23);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_18;
      }
    }
    else
    {

    }
    +[AMSOptional optionalWithValue:](AMSOptional, "optionalWithValue:", *(_QWORD *)(a1 + 40));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = 0;
    goto LABEL_18;
  }
  +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
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
    v25 = v5;
    AMSLogKey();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0CB3940];
    v11 = objc_opt_class();
    if (v9)
    {
      AMSLogKey();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v24 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v11, v12, v24);
    }
    else
    {
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("%@: %@ "), v11, v12);
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "description");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "name");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "value");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v29 = v13;
    v30 = 2114;
    v31 = v19;
    v32 = 2114;
    v33 = v20;
    v34 = 2114;
    v35 = v21;
    _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Failed to get globalCookieAllowlist key with error=%{public}@, skip allowlist feature and add cookie(name=%{public}@, value=%{public}@)", buf, 0x2Au);

    if (v9)
    {

      v13 = (void *)v24;
    }

    v5 = v25;
  }

  +[AMSOptional optionalWithValue:](AMSOptional, "optionalWithValue:", *(_QWORD *)(a1 + 40));
  v16 = (id)objc_claimAutoreleasedReturnValue();
  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:

  return v18;
}

uint64_t __98__ACAccount_AppleMediaServices___accountPropertyForKey_dataProtectionClass_expectedClasses_error___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

id __76__ACAccount_AppleMediaServices__ams_cookiesForURL_bag_cleanupGlobalCookies___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t v15;

  v3 = a2;
  if ((objc_msgSend(v3, "ams_isExpired") & 1) != 0
    || (objc_msgSend(v3, "ams_matchesURL:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {
    +[AMSOptional optionalWithNil](AMSOptional, "optionalWithNil");
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v7 = (void *)v10;
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (!*(_BYTE *)(a1 + 64)
    || (objc_msgSend(v3, "domain"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "isEqualToString:", CFSTR(".apple.com")),
        v4,
        !v5))
  {
    +[AMSOptional optionalWithValue:](AMSOptional, "optionalWithValue:", v3);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v6 = objc_opt_class();
  AMSGlobalCookieAllowlistWithBag(v6, *(void **)(a1 + 48), *(void **)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __76__ACAccount_AppleMediaServices__ams_cookiesForURL_bag_cleanupGlobalCookies___block_invoke_2;
  v12[3] = &unk_1E253D3E8;
  v8 = *(_QWORD *)(a1 + 56);
  v12[4] = *(_QWORD *)(a1 + 40);
  v15 = v8;
  v13 = v3;
  v14 = *(id *)(a1 + 32);
  objc_msgSend(v7, "continueWithBlock:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v9;
}

uint64_t __44__ACAccount_AppleMediaServices__ams_cookies__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v4;
  int v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", 0x1E254C300);

  if (v5)
  {
    +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
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
      v11 = v10;
      if (v8)
      {
        AMSLogKey();
        v2 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringWithFormat:", CFSTR("%@: [%@] "), v11, v2);
      }
      else
      {
        objc_msgSend(v9, "stringWithFormat:", CFSTR("%@: "), v10);
      }
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(*(void **)(a1 + 32));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v16 = v12;
      v17 = 2114;
      v18 = v13;
      _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Found ITFE user cookie which will be ignored. ITFE enablement should not be configured using account cookies. account = %{public}@", buf, 0x16u);
      if (v8)
      {

        v12 = (void *)v2;
      }

    }
  }
  return v5 ^ 1u;
}

uint64_t __60__ACAccount_AppleMediaServices___cookiesMatchingProperties___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "properties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v9, (_QWORD)v15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqual:", v11);

        if (!v12)
        {
          v13 = 0;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v6)
        continue;
      break;
    }
  }
  v13 = 1;
LABEL_11:

  return v13;
}

void __70__ACAccount_AppleMediaServices___ams_getAccountFlagsShimmedWithError___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  +[AMSLogConfig sharedAccountsAuthenticationPluginConfig](AMSLogConfig, "sharedAccountsAuthenticationPluginConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "OSLogObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_opt_class();
    AMSLogKey();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v5;
    v12 = 2114;
    v13 = v6;
    _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Checking account data cache due to old API access.", (uint8_t *)&v10, 0x16u);

  }
  +[AMSAccountCachedServerData sharedInstance](AMSAccountCachedServerData, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "token");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (id)objc_msgSend(v7, "cancelUpdatesForToken:", v8);
}

void __73__ACAccount_AppleMediaServices___isAccountFlagValue_validForAccountFlag___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[16];

  v4[15] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = AMSAccountFlagAgeVerificationExpiration;
  v4[1] = AMSAccountFlagAutoPlay;
  v4[2] = AMSAccountFlagCanUseAppClips;
  v4[3] = AMSAccountFlagHasAgreedToAppClipTerms;
  v4[4] = AMSAccountFlagHasAgreedToTerms;
  v4[5] = AMSAccountFlagHasFamilySharingEnabled;
  v4[6] = AMSAccountFlagHasiCloudFamily;
  v4[7] = AMSAccountFlagIsRestrictedAccount;
  v4[8] = AMSAccountFlagIsDisabledAccount;
  v4[9] = AMSAccountFlagIsManagedAccount;
  v4[10] = AMSAccountFlagIsInRestrictedRegion;
  v4[11] = AMSAccountFlagIsInBadCredit;
  v4[12] = AMSAccountFlagPersonalization;
  v4[13] = AMSAccountFlagRetailDemo;
  v4[14] = AMSAccountFlagUnderThirteen;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 15);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ECEACE58;
  qword_1ECEACE58 = v2;

}

uint64_t __44__ACAccount_AppleMediaServices__ams_cookies__block_invoke_136(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if ((objc_msgSend(v2, "ams_isDeleted") & 1) != 0)
    v3 = 0;
  else
    v3 = objc_msgSend(v2, "ams_isExpired") ^ 1;

  return v3;
}

uint64_t __93__ACAccount_AppleMediaServices__ams_didAcknowledgeBundleHolderPrivacyAcknowledgementOnDevice__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqualToString:", *(_QWORD *)(a1 + 32));
}

id __77__ACAccount_AppleMediaServices__ams_isInRestrictedRegionWithBag_waitForSync___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  const __CFString *v21;
  int v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  const __CFString *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
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
      v9 = objc_opt_class();
      v10 = *(_QWORD *)(a1 + 40);
      AMSHashIfNeeded(*(void **)(a1 + 32));
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138544130;
      v24 = v9;
      v25 = 2114;
      v26 = v10;
      v27 = 2114;
      v28 = v11;
      v29 = 2114;
      v30 = v12;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] AMSSyncRestrictedRegionTask has failed. account = %{public}@ | error = %{public}@", (uint8_t *)&v23, 0x2Au);

    }
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", *(_QWORD *)(a1 + 48));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;

    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v16, "OSLogObject");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = objc_opt_class();
      v19 = *(_QWORD *)(a1 + 40);
      v20 = objc_msgSend(v15, "BOOLValue");
      v21 = CFSTR("NO");
      v23 = 138543874;
      v24 = v18;
      v25 = 2114;
      if (v20)
        v21 = CFSTR("YES");
      v26 = v19;
      v27 = 2114;
      v28 = v21;
      _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_INFO, "%{public}@ [%{public}@]: AMSSyncRestrictedRegionTask has finished, IsInRestrictedRegion = %{public}@", (uint8_t *)&v23, 0x20u);
    }

    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

void __65__ACAccount_AppleMediaServices__ams_mergePrivacyAcknowledgement___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL4 v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  void *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = +[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests");
  +[AMSLogConfig sharedPrivacyConfig](AMSLogConfig, "sharedPrivacyConfig");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4)
  {
    if (!v5)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      AMSLogKey();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0CB3940];
      v10 = objc_opt_class();
      v11 = v10;
      if (v8)
      {
        AMSLogKey();
        a1 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringWithFormat:", CFSTR("%@: [%@] "), v11, a1);
      }
      else
      {
        objc_msgSend(v9, "stringWithFormat:", CFSTR("%@: "), v10);
      }
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v3);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v26 = v12;
      v27 = 2114;
      v28 = v20;
      v29 = 2114;
      v30 = v21;
      _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_ERROR, "%{public}@Unexpected value in local privacy acknowledgement. Expected NSNumber, got %{public}@: %{public}@", buf, 0x20u);
      if (v8)
      {

        v12 = (void *)a1;
      }

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSLogConfig sharedPrivacyConfig](AMSLogConfig, "sharedPrivacyConfig");
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("com.apple.AppleMediaServicesTests.FaultLogged"), v13, 0);
  }
  else
  {
    if (!v5)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
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
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v3);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v26 = v18;
      v27 = 2114;
      v28 = v23;
      v29 = 2114;
      v30 = v24;
      _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_FAULT, "%{public}@Unexpected value in local privacy acknowledgement. Expected NSNumber, got %{public}@: %{public}@", buf, 0x20u);
      if (v14)
      {

        v18 = (void *)a1;
      }

    }
  }

}

void __65__ACAccount_AppleMediaServices__ams_mergePrivacyAcknowledgement___block_invoke_183(uint64_t a1, void *a2)
{
  id v3;
  _BOOL4 v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  void *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = +[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests");
  +[AMSLogConfig sharedPrivacyConfig](AMSLogConfig, "sharedPrivacyConfig");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4)
  {
    if (!v5)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      AMSLogKey();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0CB3940];
      v10 = objc_opt_class();
      v11 = v10;
      if (v8)
      {
        AMSLogKey();
        a1 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringWithFormat:", CFSTR("%@: [%@] "), v11, a1);
      }
      else
      {
        objc_msgSend(v9, "stringWithFormat:", CFSTR("%@: "), v10);
      }
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v3);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v26 = v12;
      v27 = 2114;
      v28 = v20;
      v29 = 2114;
      v30 = v21;
      _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_ERROR, "%{public}@Unexpected value in remote privacy acknowledgement. Expected NSNumber, got %{public}@: %{public}@", buf, 0x20u);
      if (v8)
      {

        v12 = (void *)a1;
      }

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSLogConfig sharedPrivacyConfig](AMSLogConfig, "sharedPrivacyConfig");
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("com.apple.AppleMediaServicesTests.FaultLogged"), v13, 0);
  }
  else
  {
    if (!v5)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
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
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v3);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v26 = v18;
      v27 = 2114;
      v28 = v23;
      v29 = 2114;
      v30 = v24;
      _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_FAULT, "%{public}@Unexpected value in remote privacy acknowledgement. Expected NSNumber, got %{public}@: %{public}@", buf, 0x20u);
      if (v14)
      {

        v18 = (void *)a1;
      }

    }
  }

}

uint64_t __76__ACAccount_AppleMediaServices__ams_cookiesForURL_bag_cleanupGlobalCookies___block_invoke_199(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL4 v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;

    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 40), "host");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v5 && (objc_msgSend(v5, "hasPrefix:", CFSTR(".")) & 1) == 0)
      {
        objc_msgSend(CFSTR("."), "stringByAppendingString:", v6);
        v7 = objc_claimAutoreleasedReturnValue();

        v6 = (void *)v7;
      }
      v8 = objc_msgSend(v6, "hasSuffix:", v4);

      goto LABEL_30;
    }
  }
  else
  {

  }
  v9 = +[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests");
  +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v9)
  {
    if (!v10)
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
        a1 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringWithFormat:", CFSTR("%@: [%@] "), v16, a1);
      }
      else
      {
        objc_msgSend(v14, "stringWithFormat:", CFSTR("%@: "), v15);
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v3);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v17;
      v30 = 2114;
      v31 = v24;
      _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_ERROR, "%{public}@Unexpected value in global cookie allowlist: %{public}@", buf, 0x16u);
      if (v13)
      {

        v17 = (void *)a1;
      }

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "postNotificationName:object:userInfo:", CFSTR("com.apple.AppleMediaServicesTests.FaultLogged"), v25, 0);

  }
  else
  {
    if (!v10)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v11, "OSLogObject");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      AMSLogKey();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)MEMORY[0x1E0CB3940];
      v21 = objc_opt_class();
      v22 = v21;
      if (v19)
      {
        AMSLogKey();
        a1 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "stringWithFormat:", CFSTR("%@: [%@] "), v22, a1);
      }
      else
      {
        objc_msgSend(v20, "stringWithFormat:", CFSTR("%@: "), v21);
      }
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v3);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v23;
      v30 = 2114;
      v31 = v26;
      _os_log_impl(&dword_18C849000, v18, OS_LOG_TYPE_FAULT, "%{public}@Unexpected value in global cookie allowlist: %{public}@", buf, 0x16u);
      if (v19)
      {

        v23 = (void *)a1;
      }

    }
  }

  v4 = 0;
  v8 = 0;
LABEL_30:

  return v8;
}

void __61__ACAccount_AppleMediaServices___defaultValueForAccountFlag___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[14];
  _QWORD v3[15];

  v3[14] = *MEMORY[0x1E0C80C00];
  v2[0] = AMSAccountFlagAutoPlay;
  v2[1] = AMSAccountFlagCanUseAppClips;
  v3[0] = MEMORY[0x1E0C9AAB0];
  v3[1] = MEMORY[0x1E0C9AAB0];
  v2[2] = AMSAccountFlagHasAgreedToAppClipTerms;
  v2[3] = AMSAccountFlagHasAgreedToTerms;
  v3[2] = MEMORY[0x1E0C9AAB0];
  v3[3] = MEMORY[0x1E0C9AAB0];
  v2[4] = AMSAccountFlagHasFamilySharingEnabled;
  v2[5] = AMSAccountFlagHasiCloudFamily;
  v3[4] = MEMORY[0x1E0C9AAA0];
  v3[5] = MEMORY[0x1E0C9AAA0];
  v2[6] = AMSAccountFlagIsRestrictedAccount;
  v2[7] = AMSAccountFlagIsDisabledAccount;
  v3[6] = MEMORY[0x1E0C9AAA0];
  v3[7] = MEMORY[0x1E0C9AAA0];
  v2[8] = AMSAccountFlagIsManagedAccount;
  v2[9] = AMSAccountFlagIsInRestrictedRegion;
  v3[8] = MEMORY[0x1E0C9AAA0];
  v3[9] = MEMORY[0x1E0C9AAA0];
  v2[10] = AMSAccountFlagIsInBadCredit;
  v2[11] = AMSAccountFlagPersonalization;
  v3[10] = MEMORY[0x1E0C9AAA0];
  v3[11] = MEMORY[0x1E0C9AAB0];
  v2[12] = AMSAccountFlagRetailDemo;
  v2[13] = AMSAccountFlagUnderThirteen;
  v3[12] = MEMORY[0x1E0C9AAA0];
  v3[13] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 14);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECEACE48;
  qword_1ECEACE48 = v0;

}

void __69__ACAccount_AppleMediaServices__ams_globalEphemeralAccountProperties__block_invoke()
{
  AMSThreadSafeDictionary *v0;
  void *v1;

  v0 = objc_alloc_init(AMSThreadSafeDictionary);
  v1 = (void *)qword_1ECEACE68;
  qword_1ECEACE68 = (uint64_t)v0;

}

void __80__ACAccount_AppleMediaServices__ams_globalEphemeralAccountPropertiesForAccount___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a2;
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    v10 = *(void **)(a1 + 32);
    v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_msgSend(v10, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v11, v12);

  }
}

id __82__ACAccount_AppleMediaServicesProject__ams_isBackingAccountForActiveiCloudAccount__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  char v32;

  v6 = a2;
  objc_msgSend(v6, "ams_DSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "ams_DSID");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      objc_msgSend(v6, "ams_DSID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "ams_DSID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqual:", v9))
      {

        v10 = 1;
LABEL_28:

        goto LABEL_29;
      }
      v30 = v9;
      v31 = v8;
      v11 = 1;
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(v6, "ams_altDSID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(*(id *)(a1 + 32), "ams_altDSID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(v6, "ams_altDSID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "ams_altDSID");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "isEqual:", v4))
      {

        v10 = 1;
        if ((v11 & 1) == 0)
          goto LABEL_27;
        goto LABEL_26;
      }
      v26 = v13;
      v14 = 1;
    }
    else
    {
      v14 = 0;
    }
  }
  else
  {
    v14 = 0;
  }
  objc_msgSend(v6, "username", v26);
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    v32 = v14;
    objc_msgSend(*(id *)(a1 + 32), "username");
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = (void *)v17;
      objc_msgSend(v6, "username");
      v29 = v11;
      v28 = v2;
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "username");
      v20 = v4;
      v21 = v3;
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v19, "isEqual:", v22);

      v3 = v21;
      v4 = v20;

      v2 = v28;
      v11 = v29;

    }
    else
    {

      v10 = 0;
    }
    if ((v32 & 1) != 0)
      goto LABEL_23;
  }
  else
  {
    v10 = 0;
    if (v14)
    {
LABEL_23:

    }
  }
  if (v12)
  {

    if ((v11 & 1) == 0)
      goto LABEL_27;
    goto LABEL_26;
  }

  if (v11)
  {
LABEL_26:

  }
LABEL_27:
  if (v7)
    goto LABEL_28;
LABEL_29:

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

@end

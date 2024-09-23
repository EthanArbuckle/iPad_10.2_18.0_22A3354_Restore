@implementation ACAccount(AppleMediaServicesProject)

- (id)ams_accountFlagOverrideValueForAccountFlag:()AppleMediaServicesProject
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  +[AMSDefaults accountFlagOverrides](AMSDefaults, "accountFlagOverrides");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && objc_msgSend(v5, "count"))
  {
    objc_msgSend(a1, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v10 = 0;
      goto LABEL_12;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8 && objc_msgSend(v8, "count"))
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(MEMORY[0x1E0C8F298], "_isAccountFlagValue:validForAccountFlag:", v10, v4) & 1) != 0)
      {
LABEL_9:

LABEL_12:
        goto LABEL_13;
      }

    }
    v10 = 0;
    goto LABEL_9;
  }
  v10 = 0;
LABEL_13:

  return v10;
}

- (uint64_t)ams_copyStorefrontFromAccount:()AppleMediaServicesProject
{
  void *v4;
  void *v5;
  NSObject *v6;
  __int128 v7;
  char v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  __int128 v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "ams_allStorefronts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "count"))
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
      v20 = objc_opt_class();
      AMSLogKey();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v34 = v20;
      v35 = 2114;
      v36 = v21;
      _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] We can't update this account's storefront because the source account has no storefront.", buf, 0x16u);

    }
    goto LABEL_21;
  }
  objc_msgSend(a1, "ams_allStorefronts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(v4, "allKeys");
  v6 = objc_claimAutoreleasedReturnValue();
  v28 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
  if (!v28)
  {
LABEL_21:
    v8 = 0;
    goto LABEL_22;
  }
  v8 = 0;
  v27 = *(_QWORD *)v30;
  *(_QWORD *)&v7 = 138544130;
  v23 = v7;
  v25 = v4;
  v26 = v5;
  v24 = a1;
  do
  {
    for (i = 0; i != v28; ++i)
    {
      if (*(_QWORD *)v30 != v27)
        objc_enumerationMutation(v6);
      v10 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
      objc_msgSend(v4, "objectForKeyedSubscript:", v10, v23);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12 || (objc_msgSend(v11, "isEqualToString:", v12) & 1) == 0)
      {
        objc_msgSend(a1, "ams_setStorefront:forMediaType:", v11, v10);
        +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v13)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v13, "OSLogObject");
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          v15 = v6;
          v16 = objc_opt_class();
          AMSLogKey();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          AMSHashIfNeeded(v12);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          AMSHashIfNeeded(v11);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v23;
          v34 = v16;
          v6 = v15;
          a1 = v24;
          v35 = 2114;
          v36 = v17;
          v37 = 2114;
          v38 = v18;
          v39 = 2114;
          v40 = v19;
          _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Account storefront changed. old = %{public}@ | new = %{public}@", buf, 0x2Au);

          v4 = v25;
          v5 = v26;
        }

        v8 = 1;
      }

    }
    v28 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
  }
  while (v28);
LABEL_22:

  return v8 & 1;
}

- (id)ams_allStorefronts
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(a1, "ams_storefront");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ams_setNullableObject:forKey:", v3, AMSAccountMediaTypeProduction);

  return v2;
}

- (uint64_t)ams_biometricsState
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "_accountPropertyForKey:expectedClass:", CFSTR("biometricsState"), objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "integerValue");

  return v2;
}

- (id)ams_dataMigrationStoragePath
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "ams_DSID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;

  }
  else
  {
    objc_msgSend(a1, "ams_altDSID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      v5 = 0;
      return v5;
    }
  }
  objc_msgSend(CFSTR("/var/mobile/Library/com.apple.AppleMediaServices.notbackedup"), "stringByAppendingPathComponent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (uint64_t)ams_isBundleOwner
{
  return objc_msgSend(a1, "_accountPropertyForKey:expectedClass:", CFSTR("isBundleOwner"), objc_opt_class());
}

- (uint64_t)ams_isDemoAccount
{
  uint64_t result;
  void *v3;
  uint64_t v4;

  result = objc_msgSend(a1, "ams_isiTunesAccount");
  if ((_DWORD)result)
  {
    objc_msgSend(a1, "_accountPropertyForKey:expectedClass:", CFSTR("isDemoAccount"), objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "BOOLValue");

    return v4;
  }
  return result;
}

- (uint64_t)ams_isRegulatoryAccount
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "_accountPropertyForKey:expectedClass:", CFSTR("isRegulatoryAccount"), objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (uint64_t)ams_lastAuthenticationCredentialSource
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "_accountPropertyForKey:expectedClass:", CFSTR("lastAuthenticateCredentialSource"), objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "unsignedIntegerValue");

  return v2;
}

- (void)ams_setLastAuthenticationCredentialSource:()AppleMediaServicesProject
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_setAccountProperty:forKey:expectedClass:", v2, CFSTR("lastAuthenticateCredentialSource"), objc_opt_class());

}

- (uint64_t)ams_lastRestrictedRegionSyncTimestamp
{
  return objc_msgSend(a1, "_accountPropertyForKey:expectedClass:", CFSTR("lastRestrictedRegionSyncTimestamp"), objc_opt_class());
}

- (void)ams_setBiometricsState:()AppleMediaServicesProject
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_setAccountProperty:forKey:expectedClass:", v2, CFSTR("biometricsState"), objc_opt_class());

}

- (void)ams_setDemoAccount:()AppleMediaServicesProject
{
  id v5;

  if (objc_msgSend(a1, "ams_isiTunesAccount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_setAccountProperty:forKey:expectedClass:", v5, CFSTR("isDemoAccount"), objc_opt_class());

  }
}

- (void)ams_setIsBundleOwner:()AppleMediaServicesProject
{
  id v4;

  v4 = a3;
  objc_msgSend(a1, "_setAccountProperty:forKey:expectedClass:", v4, CFSTR("isBundleOwner"), objc_opt_class());

}

- (void)ams_setLastRestrictedRegionSyncTimestamp:()AppleMediaServicesProject
{
  id v4;

  v4 = a3;
  objc_msgSend(a1, "_setAccountProperty:forKey:expectedClass:", v4, CFSTR("lastRestrictedRegionSyncTimestamp"), objc_opt_class());

}

- (void)ams_setRegulatoryAccount:()AppleMediaServicesProject
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_setAccountProperty:forKey:expectedClass:", v2, CFSTR("isRegulatoryAccount"), objc_opt_class());

}

- (id)ams_isBackingAccountForActiveiCloudAccount
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "ams_fetchActiveiCloudAccount");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __82__ACAccount_AppleMediaServicesProject__ams_isBackingAccountForActiveiCloudAccount__block_invoke;
    v7[3] = &unk_1E253D550;
    v7[4] = a1;
    objc_msgSend(v4, "continueWithBlock:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
  else
  {
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", MEMORY[0x1E0C9AAA0]);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (uint64_t)ams_migrateCookiePropertiesWithError:()AppleMediaServicesProject
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  char v10;
  id v11;
  uint64_t v12;
  id v14;
  id v15;

  objc_msgSend(a1, "_ams_cookieProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if (objc_msgSend(v5, "count"))
    {
      v15 = 0;
      +[AMSCookieStorage cookiesForAccount:cookieDatabaseOnly:error:](AMSCookieStorage, "cookiesForAccount:cookieDatabaseOnly:error:", a1, 1, &v15);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v15;
      v9 = v8;
      if (v7)
      {
        v14 = v8;
        v10 = objc_msgSend(a1, "_ams_migrateCookieProperties:intoCookies:error:", v6, v7, &v14);
        v11 = v14;

        if ((v10 & 1) != 0)
        {
          v12 = 1;
LABEL_16:
          v9 = v11;
          goto LABEL_17;
        }
        if (!a3)
        {
          v12 = 0;
          goto LABEL_16;
        }
      }
      else
      {
        if (!a3)
        {
          v12 = 0;
          goto LABEL_17;
        }
        v11 = v8;
      }
      v9 = objc_retainAutorelease(v11);
      v12 = 0;
      *a3 = v9;
LABEL_17:

      goto LABEL_18;
    }
    v12 = 1;
  }
  else if (a3)
  {
    AMSError(7, CFSTR("Cannot Migrate Cookie Properties"), CFSTR("There are no cookie properties to migrate."), 0);
    v12 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
LABEL_18:

  return v12;
}

- (uint64_t)ams_setAccountFlagOverrideValue:()AppleMediaServicesProject forAccountFlag:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && objc_msgSend(MEMORY[0x1E0C8F298], "_isAccountFlagValue:validForAccountFlag:", v6, v7))
  {
    +[AMSDefaults accountFlagOverrides](AMSDefaults, "accountFlagOverrides");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");
    v11 = v10;
    if (v10)
      v12 = v10;
    else
      v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v14 = v12;

    objc_msgSend(v14, "objectForKeyedSubscript:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "mutableCopy");
    v17 = v16;
    if (v16)
      v18 = v16;
    else
      v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v19 = v18;

    objc_msgSend(v19, "setObject:forKeyedSubscript:", v6, v7);
    if ((objc_msgSend(v19, "isEqualToDictionary:", v15) & 1) == 0)
    {
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v19, v8);
      +[AMSDefaults setAccountFlagOverrides:](AMSDefaults, "setAccountFlagOverrides:", v14);
    }

    v13 = 1;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

@end

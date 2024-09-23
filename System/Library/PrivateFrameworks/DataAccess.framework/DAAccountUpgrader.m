@implementation DAAccountUpgrader

+ (void)_moveExchangeCredentialsToAppleAccessGroup
{
  const __CFAllocator *v2;
  __CFDictionary *Mutable;
  OSStatus v4;
  OSStatus v6;
  const __CFAllocator *v7;
  NSObject *v8;
  os_log_type_t v9;
  CFIndex Count;
  __int128 v11;
  CFIndex v12;
  CFIndex v13;
  const void *v14;
  const void *v15;
  const __CFDictionary *ValueAtIndex;
  const void *Value;
  void *v18;
  void *v19;
  __CFDictionary *v20;
  const void *v21;
  const void *v22;
  const void *v23;
  const void *v24;
  OSStatus v25;
  OSStatus v26;
  NSObject *v27;
  __int128 v28;
  os_log_type_t type;
  void *v30;
  const void *v31;
  const void *v32;
  const __CFAllocator *v33;
  CFTypeRef v34;
  __CFDictionary *attributesToUpdate;
  void *key;
  CFTypeRef cf2;
  void *v38;
  CFTypeRef result;
  uint8_t buf[4];
  OSStatus v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, 0);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CD7010], (const void *)*MEMORY[0x1E0C9AE50]);
  v31 = (const void *)*MEMORY[0x1E0CD6CB8];
  v32 = (const void *)*MEMORY[0x1E0CD6C98];
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CD6C98], (const void *)*MEMORY[0x1E0CD6CB8]);
  key = (void *)*MEMORY[0x1E0CD6898];
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CD6898], CFSTR("com.apple.cfnetwork"));
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CD6F30], (const void *)*MEMORY[0x1E0CD6F38]);
  result = 0;
  v4 = SecItemCopyMatching(Mutable, &result);
  if (v4 != -25300 && v4 != 0)
  {
    v6 = v4;
    v7 = v2;
    DALoggingwithCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 3);
    if (os_log_type_enabled(v8, v9))
    {
      *(_DWORD *)buf = 67109120;
      v41 = v6;
      _os_log_impl(&dword_1B51E4000, v8, v9, "Could not search for Exchange credentials.  %d", buf, 8u);
    }

    v2 = v7;
  }
  CFRelease(Mutable);
  if (result)
  {
    attributesToUpdate = CFDictionaryCreateMutable(v2, 0, 0, 0);
    CFDictionaryAddValue(attributesToUpdate, key, CFSTR("apple"));
    Count = CFArrayGetCount((CFArrayRef)result);
    if (Count >= 1)
    {
      v12 = Count;
      v13 = 0;
      v14 = (const void *)*MEMORY[0x1E0CD6AD0];
      v15 = (const void *)*MEMORY[0x1E0CD6B50];
      v38 = (void *)*MEMORY[0x1E0CD6AC0];
      cf2 = (CFTypeRef)*MEMORY[0x1E0CD6AF0];
      v34 = (CFTypeRef)*MEMORY[0x1E0CD6B00];
      v30 = (void *)*MEMORY[0x1E0CD6B40];
      type = *(_BYTE *)(MEMORY[0x1E0D1C448] + 3);
      *(_QWORD *)&v11 = 67109120;
      v28 = v11;
      v33 = v2;
      do
      {
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)result, v13);
        Value = CFDictionaryGetValue(ValueAtIndex, v14);
        CFDictionaryGetValue(ValueAtIndex, v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          v18 = 0;
        }
        CFDictionaryGetValue(ValueAtIndex, v38);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          v19 = 0;
        }
        if (Value
          && (CFEqual(Value, cf2) || CFEqual(Value, v34))
          && objc_msgSend(v18, "length", v28)
          && objc_msgSend(v19, "isEqualToString:", CFSTR("/Microsoft-Server-ActiveSync")))
        {
          v20 = CFDictionaryCreateMutable(v2, 0, 0, 0);
          CFDictionarySetValue(v20, v32, v31);
          v21 = CFDictionaryGetValue(ValueAtIndex, key);
          CFDictionarySetValue(v20, key, v21);
          v22 = CFDictionaryGetValue(ValueAtIndex, v15);
          CFDictionarySetValue(v20, v15, v22);
          v23 = CFDictionaryGetValue(ValueAtIndex, v14);
          CFDictionarySetValue(v20, v14, v23);
          v24 = CFDictionaryGetValue(ValueAtIndex, v30);
          if (v24)
            CFDictionarySetValue(v20, v30, v24);
          v25 = SecItemUpdate(v20, attributesToUpdate);
          v2 = v33;
          if (v25 != -25300)
          {
            v26 = v25;
            if (v25)
            {
              DALoggingwithCategory();
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, type))
              {
                *(_DWORD *)buf = v28;
                v41 = v26;
                _os_log_impl(&dword_1B51E4000, v27, type, "Could not move Exchange credential to apple keychain access group.  %d", buf, 8u);
              }

              v2 = v33;
            }
          }
          CFRelease(v20);
        }

        ++v13;
      }
      while (v12 != v13);
    }
    CFRelease(attributesToUpdate);
    CFRelease(result);
  }
}

+ (void)_updateFacebookAccountAuthenticationTypes
{
  void *v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  char v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  os_log_type_t v22;
  void *v23;
  NSObject *obj;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  _QWORD v29[5];
  NSObject *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  void *v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "accountTypeWithAccountTypeIdentifier:", *MEMORY[0x1E0C8F088]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v2, "accountsWithAccountType:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject count](v4, "count"))
    {
      v23 = v3;
      v28 = v2;
      v5 = dispatch_group_create();
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      obj = v4;
      v6 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
      v7 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 6);
      v26 = v6;
      if (v6)
      {
        v25 = *(_QWORD *)v36;
        v8 = *MEMORY[0x1E0C8F350];
        do
        {
          v9 = 0;
          do
          {
            if (*(_QWORD *)v36 != v25)
              objc_enumerationMutation(obj);
            v27 = v9;
            v10 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v9);
            v31 = 0u;
            v32 = 0u;
            v33 = 0u;
            v34 = 0u;
            objc_msgSend(v10, "childAccounts");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
            if (v12)
            {
              v13 = v12;
              v14 = *(_QWORD *)v32;
              do
              {
                for (i = 0; i != v13; ++i)
                {
                  if (*(_QWORD *)v32 != v14)
                    objc_enumerationMutation(v11);
                  v16 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
                  objc_msgSend(v16, "authenticationType");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  v18 = objc_msgSend(v17, "isEqualToString:", v8);

                  if ((v18 & 1) == 0)
                  {
                    objc_msgSend(v16, "setAuthenticationType:", v8);
                    dispatch_group_enter(v5);
                    DALoggingwithCategory();
                    v19 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v19, v7))
                    {
                      objc_msgSend(v16, "identifier");
                      v20 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412290;
                      v40 = v20;
                      _os_log_impl(&dword_1B51E4000, v19, v7, "Saving child account %@", buf, 0xCu);

                    }
                    v29[0] = MEMORY[0x1E0C809B0];
                    v29[1] = 3221225472;
                    v29[2] = __62__DAAccountUpgrader__updateFacebookAccountAuthenticationTypes__block_invoke;
                    v29[3] = &unk_1E68CBC48;
                    v29[4] = v16;
                    v30 = v5;
                    objc_msgSend(v28, "saveVerifiedAccount:withCompletionHandler:", v16, v29);

                  }
                }
                v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
              }
              while (v13);
            }

            v9 = v27 + 1;
          }
          while (v27 + 1 != v26);
          v26 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
        }
        while (v26);
      }
      v4 = obj;

      DALoggingwithCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, v7))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B51E4000, v21, v7, "DAAccountMigrator: Waiting for child accounts to save...", buf, 2u);
      }

      dispatch_group_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
      v2 = v28;
      v3 = v23;
    }
  }
  else
  {
    DALoggingwithCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    v22 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 3);
    if (os_log_type_enabled(v4, v22))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B51E4000, v4, v22, "Couldn't get a Facebook account type", buf, 2u);
    }
  }

}

void __62__DAAccountUpgrader__updateFacebookAccountAuthenticationTypes__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  os_log_type_t v8;
  void *v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  int v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  DALoggingwithCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    v8 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 6);
    if (os_log_type_enabled(v6, v8))
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412290;
      v16 = v9;
      v10 = "Child account %@ saved";
      v11 = v7;
      v12 = v8;
      v13 = 12;
LABEL_6:
      _os_log_impl(&dword_1B51E4000, v11, v12, v10, (uint8_t *)&v15, v13);

    }
  }
  else
  {
    v14 = *(unsigned __int8 *)(MEMORY[0x1E0D1C448] + 3);
    if (os_log_type_enabled(v6, *(os_log_type_t *)(MEMORY[0x1E0D1C448] + 3)))
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412546;
      v16 = v9;
      v17 = 2112;
      v18 = v5;
      v10 = "Child account %@ failed to save: %@";
      v11 = v7;
      v12 = v14;
      v13 = 22;
      goto LABEL_6;
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

+ (void)_upgradeDAAccounts
{
  NSObject *v2;
  uint64_t v3;
  os_log_type_t v4;
  dispatch_semaphore_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  void *v17;
  char v18;
  id v19;
  NSObject *v20;
  void *v21;
  dispatch_semaphore_t dsema;
  os_log_type_t type;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[4];
  dispatch_semaphore_t v30;
  uint8_t *v31;
  uint8_t buf[8];
  uint8_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint8_t v38[4];
  id v39;
  __int16 v40;
  id v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  DALoggingwithCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0D1C448];
  v4 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 6);
  if (os_log_type_enabled(v2, v4))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B51E4000, v2, v4, "Upgrading all DataAccess accounts...", buf, 2u);
  }

  v5 = dispatch_semaphore_create(0);
  *(_QWORD *)buf = 0;
  v33 = buf;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__4;
  v36 = __Block_byref_object_dispose__4;
  v37 = 0;
  sharedDAAccountStore();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __39__DAAccountUpgrader__upgradeDAAccounts__block_invoke;
  v29[3] = &unk_1E68CBAB8;
  v31 = buf;
  dsema = v5;
  v30 = dsema;
  objc_msgSend(v6, "da_loadDAAccountsWithCompletion:", v29);

  dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend(*((id *)v33 + 5), "sortedArrayUsingComparator:", &__block_literal_global_6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)*((_QWORD *)v33 + 5);
  *((_QWORD *)v33 + 5) = v7;

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = *((id *)v33 + 5);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v42, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v26;
    type = *(_BYTE *)(v3 + 3);
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        DALoggingwithCategory();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, v4))
        {
          *(_WORD *)v38 = 0;
          _os_log_impl(&dword_1B51E4000, v14, v4, "Calling DAAccount Upgrader to upgrade Accounts", v38, 2u);
        }

        if (objc_msgSend(v13, "upgradeAccount"))
        {
          DALoggingwithCategory();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, v4))
          {
            objc_msgSend(v13, "accountDescription");
            v16 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "publicDescription");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v38 = 138412546;
            v39 = v16;
            v40 = 2114;
            v41 = v17;
            _os_log_impl(&dword_1B51E4000, v15, v4, "Account \"%@\" (%{public}@) was upgraded. Saving account.", v38, 0x16u);

          }
          v24 = 0;
          v18 = objc_msgSend(v13, "saveAccountPropertiesWithError:", &v24);
          v19 = v24;
          if ((v18 & 1) == 0)
          {
            DALoggingwithCategory();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, type))
            {
              objc_msgSend(v13, "accountID");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v38 = 138543618;
              v39 = v21;
              v40 = 2112;
              v41 = v19;
              _os_log_impl(&dword_1B51E4000, v20, type, "Error saving account %{public}@: %@", v38, 0x16u);

            }
          }

        }
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v42, 16);
    }
    while (v10);
  }

  _Block_object_dispose(buf, 8);
}

void __39__DAAccountUpgrader__upgradeDAAccounts__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

uint64_t __39__DAAccountUpgrader__upgradeDAAccounts__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  int v5;
  unsigned int v6;

  v4 = a3;
  v5 = objc_msgSend(a2, "conformsToProtocol:", &unk_1EF109828);
  v6 = objc_msgSend(v4, "conformsToProtocol:", &unk_1EF109828);

  if (v5 ^ 1 | v6)
    return v5 ^ v6;
  else
    return -1;
}

+ (void)_notifyDaHolidaySubCalAccount
{
  NSObject *v2;
  os_log_type_t v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint8_t v5[16];

  DALoggingwithCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 5);
  if (os_log_type_enabled(v2, v3))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1B51E4000, v2, v3, "DAD: DataAccess Migrator sending notification: com.apple.dataaccess.checkHolidayCalendarAccount", v5, 2u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.dataaccess.checkHolidayCalendarAccount"), 0, 0, 1u);
}

+ (void)upgradeAccounts:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  uint64_t v6;
  os_log_type_t v7;
  NSObject *v8;
  os_log_type_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  uint8_t v17[16];

  v3 = a3;
  DALoggingwithCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0D1C448];
  v7 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 5);
  if (os_log_type_enabled(v5, v7))
  {
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_1B51E4000, v5, v7, "DAD: DataAccess Migrator Request For Performing Asynchronous Data Migration", v17, 2u);
  }

  if (v3)
  {
    DALoggingwithCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_BYTE *)(v6 + 6);
    if (os_log_type_enabled(v8, v9))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_1B51E4000, v8, v9, "DAAccountMigrator: Starting Exchange Credential Move to Apple Access Group", v17, 2u);
    }

    objc_msgSend(a1, "_moveExchangeCredentialsToAppleAccessGroup");
    DALoggingwithCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, v9))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_1B51E4000, v10, v9, "DAAccountMigrator: Starting Update Facebook Authentication types.", v17, 2u);
    }

    objc_msgSend(a1, "_updateFacebookAccountAuthenticationTypes");
    DALoggingwithCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, v9))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_1B51E4000, v11, v9, "DAAccountMigrator: Starting Upgrade DAAccount types.", v17, 2u);
    }

    objc_msgSend(a1, "_upgradeDAAccounts");
    DALoggingwithCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, v9))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_1B51E4000, v12, v9, "DAAccountMigrator: Writing Device specificID.", v17, 2u);
    }

    objc_msgSend(a1, "_writeDeviceSpecificID");
  }
  else
  {
    DALoggingwithCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, v7))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_1B51E4000, v13, v7, "DAD: DataAccess Migrator skipped several tasks because user logs in for the first time.", v17, 2u);
    }

    v9 = *(_BYTE *)(v6 + 6);
  }
  DALoggingwithCategory();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, v9))
  {
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_1B51E4000, v14, v9, "DAAccountMigrator: Posting HolidaySubCal Account Check Notification.", v17, 2u);
  }

  objc_msgSend(a1, "_notifyDaHolidaySubCalAccount");
  DALoggingwithCategory();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, v9))
  {
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_1B51E4000, v15, v9, "DAAccountMigrator: Updating migration Version.", v17, 2u);
  }

  DAUpdateMigrationVersion();
  DALoggingwithCategory();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, v9))
  {
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_1B51E4000, v16, v9, "DAAccountMigrator: Finished Migrator For dataaccess..returning YES/Success.", v17, 2u);
  }

}

@end

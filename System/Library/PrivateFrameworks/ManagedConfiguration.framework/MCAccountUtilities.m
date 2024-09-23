@implementation MCAccountUtilities

- (MCAccountUtilities)init
{
  MCAccountUtilities *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *signInQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MCAccountUtilities;
  v2 = -[MCAccountUtilities init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("MCAccountUtilities queue", 0);
    signInQueue = v2->_signInQueue;
    v2->_signInQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

+ (void)checkAccountConsistencyAndReleaseOrphanedAccounts
{
  void *v2;
  void *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  const char *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  dispatch_semaphore_t v40;
  dispatch_time_t v41;
  NSObject *v42;
  __int128 v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  id obj;
  _QWORD v51[5];
  NSObject *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  uint64_t v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  void *v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  +[MCManifest sharedManifest](MCManifest, "sharedManifest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allInstalledProfileIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "accounts");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v54;
    v46 = *MEMORY[0x1E0C8EFC8];
    *(_QWORD *)&v5 = 138543874;
    v43 = v5;
    v44 = v2;
    v45 = v3;
    v48 = *(_QWORD *)v54;
    do
    {
      v8 = 0;
      v49 = v6;
      do
      {
        if (*(_QWORD *)v54 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v8);
        objc_msgSend(v9, "mcConfigurationProfileIdentifier", v43);
        v10 = objc_claimAutoreleasedReturnValue();
        MCMailAccountManagedTag();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "accountPropertyForKey:", v11);
        v12 = objc_claimAutoreleasedReturnValue();

        if (v10 | v12)
        {
          objc_msgSend(v9, "mcProfileUUID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "mcPayloadUUID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            if (objc_msgSend(v3, "containsObject:", v10))
            {
              objc_msgSend(v2, "installedProfileWithIdentifier:", v10);
              v15 = objc_claimAutoreleasedReturnValue();
              -[NSObject UUID](v15, "UUID");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v16, "isEqualToString:", v13);

              if (v17)
              {
                -[NSObject payloadWithUUID:](v15, "payloadWithUUID:", v14);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                if (v18)
                {

                  v3 = v45;
LABEL_33:

                  v7 = v48;
                  v6 = v49;
                  goto LABEL_34;
                }
                v32 = (void *)_MCLogObjects;
                if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
                {
                  v29 = v32;
                  objc_msgSend(v9, "identifier");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = v43;
                  v58 = v30;
                  v59 = 2114;
                  v60 = v10;
                  v61 = 2114;
                  v62 = v14;
                  _os_log_impl(&dword_19ECC4000, v29, OS_LOG_TYPE_ERROR, "Found account (%{public}@) with installed profile identifier (%{public}@) whose payload UUID (%{public}@) does not match any payload in that profile", buf, 0x20u);
LABEL_23:

                }
              }
              else
              {
                v28 = (void *)_MCLogObjects;
                if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
                {
                  v29 = v28;
                  objc_msgSend(v9, "identifier");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSObject UUID](v15, "UUID");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138544130;
                  v58 = v30;
                  v59 = 2114;
                  v60 = v10;
                  v61 = 2114;
                  v62 = v13;
                  v63 = 2114;
                  v64 = v31;
                  _os_log_impl(&dword_19ECC4000, v29, OS_LOG_TYPE_ERROR, "Found account (%{public}@) with installed profile identifier (%{public}@) whose UUID (%{public}@) does not match that of the profile (%{public}@)", buf, 0x2Au);

                  v2 = v44;
                  goto LABEL_23;
                }
              }

              v3 = v45;
LABEL_25:
              v33 = (void *)_MCLogObjects;
              if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
              {
                v34 = v33;
                objc_msgSend(v9, "identifier");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v58 = v35;
                _os_log_impl(&dword_19ECC4000, v34, OS_LOG_TYPE_DEFAULT, "Removing profile information from account %{public}@", buf, 0xCu);

              }
              objc_msgSend(v9, "setMcProfileUUID:", 0);
              objc_msgSend(v9, "setMcPayloadUUID:", 0);
              objc_msgSend(v9, "setMcConfigurationProfileIdentifier:", 0);
              objc_msgSend(v9, "setManagingSourceName:", 0);
              objc_msgSend(v9, "setManagingOwnerIdentifier:", 0);
              objc_msgSend(v9, "setAccountProperty:forKey:", 0, v46);
              MCMailAccountManagedTag();
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "setAccountProperty:forKey:", 0, v36);

              v37 = (void *)_MCLogObjects;
              if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
              {
                v38 = v37;
                objc_msgSend(v9, "identifier");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v58 = v39;
                _os_log_impl(&dword_19ECC4000, v38, OS_LOG_TYPE_DEFAULT, "Saving account %{public}@...", buf, 0xCu);

              }
              v40 = dispatch_semaphore_create(0);
              v51[0] = MEMORY[0x1E0C809B0];
              v51[1] = 3221225472;
              v51[2] = __71__MCAccountUtilities_checkAccountConsistencyAndReleaseOrphanedAccounts__block_invoke;
              v51[3] = &unk_1E41E3FD8;
              v51[4] = v9;
              v15 = v40;
              v52 = v15;
              objc_msgSend(v47, "saveVerifiedAccount:withCompletionHandler:", v9, v51);
              v41 = dispatch_time(0, 120000000000);
              if (dispatch_semaphore_wait(v15, v41))
              {
                v42 = _MCLogObjects;
                if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_19ECC4000, v42, OS_LOG_TYPE_DEFAULT, "Timed out waiting for account to save; moving on...",
                    buf,
                    2u);
                }
              }

              goto LABEL_33;
            }
            v27 = (void *)_MCLogObjects;
            if (!os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
              goto LABEL_25;
            v23 = v27;
            objc_msgSend(v9, "identifier");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v58 = v24;
            v59 = 2114;
            v60 = v10;
            v25 = v23;
            v26 = "Found account (%{public}@) with uninstalled profile identifier (%{public}@)";
          }
          else
          {
            v22 = (void *)_MCLogObjects;
            if (!os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
              goto LABEL_25;
            v23 = v22;
            objc_msgSend(v9, "identifier");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v58 = v24;
            v59 = 2114;
            v60 = v12;
            v25 = v23;
            v26 = "Found account (%{public}@) with just a managed tag  (%{public}@)";
          }
          _os_log_impl(&dword_19ECC4000, v25, OS_LOG_TYPE_ERROR, v26, buf, 0x16u);

          goto LABEL_25;
        }
        v19 = (void *)_MCLogObjects;
        if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEBUG))
        {
          v20 = v19;
          objc_msgSend(v9, "identifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v58 = v21;
          _os_log_impl(&dword_19ECC4000, v20, OS_LOG_TYPE_DEBUG, "Skipping unmanaged account with identifier: %{public}@", buf, 0xCu);

        }
LABEL_34:

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
    }
    while (v6);
  }

}

void __71__MCAccountUtilities_checkAccountConsistencyAndReleaseOrphanedAccounts__block_invoke(uint64_t a1, int a2, void *a3)
{
  __CFString *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)_MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(void **)(a1 + 32);
    v8 = v6;
    objc_msgSend(v7, "identifier");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    v11 = CFSTR("OK");
    if (!a2)
      v11 = v5;
    v12 = 138543618;
    v13 = v9;
    v14 = 2114;
    v15 = v11;
    _os_log_impl(&dword_19ECC4000, v8, OS_LOG_TYPE_DEFAULT, "Save account %{public}@ completed: %{public}@", (uint8_t *)&v12, 0x16u);

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

+ (id)accountDataclassesForBundleID:(id)a3
{
  id v3;
  void *v4;
  uint64_t *v5;
  uint64_t v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.mobilemail")) & 1) != 0
    || objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.MailCompositionService")))
  {
    v14[0] = *MEMORY[0x1E0C8F3D0];
    v4 = (void *)MEMORY[0x1E0C99D20];
    v5 = v14;
LABEL_4:
    v6 = 1;
    goto LABEL_5;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.mobilecal")))
  {
    v13 = *MEMORY[0x1E0C8F378];
    v4 = (void *)MEMORY[0x1E0C99D20];
    v5 = &v13;
    goto LABEL_4;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.mobilenotes")))
  {
    v12 = *MEMORY[0x1E0C8F3F8];
    v4 = (void *)MEMORY[0x1E0C99D20];
    v5 = &v12;
    goto LABEL_4;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.reminders")))
  {
    v11 = *MEMORY[0x1E0C8F400];
    v4 = (void *)MEMORY[0x1E0C99D20];
    v5 = &v11;
    goto LABEL_4;
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.MobileAddressBook")) & 1) == 0
    && !objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.mobilephone")))
  {
    v7 = 0;
    goto LABEL_6;
  }
  v9 = *MEMORY[0x1E0C8F390];
  v10[0] = *MEMORY[0x1E0C8F388];
  v10[1] = v9;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = v10;
  v6 = 2;
LABEL_5:
  objc_msgSend(v4, "arrayWithObjects:count:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v7;
}

+ (id)appStoreAccountIdentifierForPersona:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  void *v28;
  _BYTE v29[128];
  _QWORD v30[3];

  v30[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = *MEMORY[0x1E0C8F170];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    objc_msgSend(v4, "accountsWithAccountTypeIdentifiers:preloadedProperties:error:", v5, 0, &v24);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v24;

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v21;
      v11 = *MEMORY[0x1E0C8EFC8];
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v21 != v10)
            objc_enumerationMutation(v7);
          v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v13, "objectForKeyedSubscript:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v14, "isEqualToString:", v3))
          {
            objc_msgSend(v13, "ams_DSID");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = _MCLogObjects;
            if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v26 = v3;
              v27 = 2114;
              v28 = v16;
              _os_log_impl(&dword_19ECC4000, v17, OS_LOG_TYPE_DEFAULT, "appStoreAccountIdentifierForPersona FOUND persona:%{public}@ -> accountIdentifier:%{public}@", buf, 0x16u);
            }

            goto LABEL_18;
          }

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
        if (v9)
          continue;
        break;
      }
    }

    v15 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v26 = v3;
      _os_log_impl(&dword_19ECC4000, v15, OS_LOG_TYPE_DEFAULT, "appStoreAccountIdentifierForPersona NOT FOUND persona:%{public}@", buf, 0xCu);
    }
    v16 = 0;
LABEL_18:

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (BOOL)hasManagedAccountOfDataclasses:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  BOOL v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v4 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      v29 = v3;
      _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_DEBUG, "Checking for managed accounts that have one of these dataclasses: %{public}@", buf, 0xCu);
    }
    v22 = v3;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "accounts");
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v24;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v24 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v11, "enabledDataclasses");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "intersectsSet:", v5))
          {
            objc_msgSend(v11, "accountPropertyForKey:", CFSTR("MCAccountIsManaged"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "BOOLValue");

            if (v14)
            {
              v17 = (void *)_MCLogObjects;
              if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEBUG))
              {
                v18 = v17;
                objc_msgSend(v11, "identifier");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v29 = v19;
                _os_log_impl(&dword_19ECC4000, v18, OS_LOG_TYPE_DEBUG, "Account %{public}@ found.", buf, 0xCu);

              }
              v16 = 1;
              goto LABEL_20;
            }
          }

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v8)
          continue;
        break;
      }
    }

    v15 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19ECC4000, v15, OS_LOG_TYPE_DEBUG, "No account found.", buf, 2u);
    }
    v16 = 0;
LABEL_20:
    v3 = v22;

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (OS_dispatch_queue)signInQueue
{
  return self->_signInQueue;
}

- (void)setSignInQueue:(id)a3
{
  objc_storeStrong((id *)&self->_signInQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signInQueue, 0);
}

@end

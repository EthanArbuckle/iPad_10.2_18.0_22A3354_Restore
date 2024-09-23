@implementation MFPreferencesURL

+ (id)accountURLForAccount:(id)a3
{
  objc_msgSend(a1, "_accountInfoSettingsURLForAccount:preferenceURLType:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)accountInfoURLForAccount:(id)a3
{
  objc_msgSend(a1, "_accountInfoSettingsURLForAccount:preferenceURLType:", a3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)advancedAccountInfoURLForAccount:(id)a3
{
  objc_msgSend(a1, "_accountInfoSettingsURLForAccount:preferenceURLType:", a3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)addAccountURL
{
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("ADD_ACCOUNT");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_urlForRoot:pathComponents:", CFSTR("ACCOUNTS_AND_PASSWORDS"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)storageManagementURL
{
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("STORAGE_MGMT");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_urlForRoot:pathComponents:", CFSTR("General"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)vipSenderListURL
{
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("com.apple.mobilemail/custom/com.apple.mobilemail.bulletin-subsection.VIP");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_urlForRoot:pathComponents:", CFSTR("NOTIFICATIONS_ID"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)blockedSenderURL
{
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("Blocked");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_urlForRoot:pathComponents:", CFSTR("MAIL"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)hideMyEmailURL
{
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("ICLOUD_SERVICE/PRIVATE_EMAIL_MANAGE");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_urlForRoot:pathComponents:", CFSTR("APPLE_ACCOUNT"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_urlForRoot:(id)a3 pathComponents:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0CB39D8];
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR("/"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "queryItemWithName:value:", CFSTR("path"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  objc_msgSend(v10, "setScheme:", CFSTR("prefs"));
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("root"), v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v11;
  v16[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setQueryItems:", v12);

  objc_msgSend(v10, "query");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPath:", v13);

  objc_msgSend(v10, "setQuery:", 0);
  objc_msgSend(v10, "URL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)_pathComponentsForAccount:(id)a3 preferenceURLType:(int64_t)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  const __CFString *v31;
  id v32;
  int64_t v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  void *v40;
  _BYTE v41[128];
  uint64_t v42;

  v34 = a4;
  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "mailAccountIfAvailable");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0D1EF38], "pairWithFirst:second:", v5, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        v7 = 0;
        goto LABEL_27;
      }
    }
  }
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  objc_msgSend(MEMORY[0x1E0D4D620], "mailAccounts", v34);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v9)
  {
    v7 = 0;
    v10 = *(_QWORD *)v37;
    while (1)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v37 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v11);
        if ((objc_msgSend(v12, "isEqual:", v4) & 1) != 0)
        {
          v13 = 0;
          v12 = v4;
        }
        else
        {
          objc_msgSend(v12, "deliveryAccount");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqual:", v4);

          if (!v15)
          {
            if (!v7)
            {
              objc_msgSend(v12, "deliveryAccountAlternates");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v16, "containsObject:", v4);

              if (v17)
              {
                objc_msgSend(MEMORY[0x1E0D1EF38], "pairWithFirst:second:", v12, v4);
                v7 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v7 = 0;
              }
            }
            goto LABEL_17;
          }
          if (objc_msgSend(v12, "derivesDeliveryAccountInfoFromMailAccount"))
            v13 = 0;
          else
            v13 = v4;
        }
        objc_msgSend(MEMORY[0x1E0D1EF38], "pairWithFirst:second:", v12, v13);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6)
          goto LABEL_26;
LABEL_17:
        ++v11;
      }
      while (v9 != v11);
      v18 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      v9 = v18;
      if (!v18)
      {
        v6 = 0;
        goto LABEL_26;
      }
    }
  }
  v6 = 0;
  v7 = 0;
LABEL_26:

LABEL_27:
  if (v6)
    v19 = v6;
  else
    v19 = v7;
  v20 = v19;
  objc_msgSend(v20, "first");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "second");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "parentAccount");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "identifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    v25 = v23;
  }
  else
  {
    objc_msgSend(v21, "identifier");
    v25 = (id)objc_claimAutoreleasedReturnValue();
  }
  v26 = v25;

  objc_msgSend(v35, "identifier");
  v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    v28 = (void *)MEMORY[0x1E0C99DE8];
    v40 = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "arrayWithArray:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)(v34 - 1) <= 1)
      objc_msgSend(v30, "addObject:", CFSTR("ACCOUNT_INFO"));
    if (v34 != 2 && v27)
    {
      objc_msgSend(v30, "addObject:", CFSTR("SMTP_INFORMATION_KEY"));
      v31 = v27;
LABEL_42:
      objc_msgSend(v30, "addObject:", v31, v34);
      goto LABEL_43;
    }
    if (v34 == 2)
    {
      v31 = CFSTR("ADVANCED_SPECIFIER_KEY");
      goto LABEL_42;
    }
  }
  else
  {
    v30 = 0;
  }
LABEL_43:
  v32 = v30;

  return v32;
}

+ (id)_accountInfoSettingsURLForAccount:(id)a3 preferenceURLType:(int64_t)a4
{
  void *v5;
  void *v6;

  objc_msgSend(a1, "_pathComponentsForAccount:preferenceURLType:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(a1, "_urlForRoot:pathComponents:", CFSTR("ACCOUNTS_AND_PASSWORDS"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end

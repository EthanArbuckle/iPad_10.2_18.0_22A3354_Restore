@implementation DNDContact(Contacts)

+ (id)contactWithCNContact:()Contacts
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0D1D6E8]);
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContactIdentifier:", v5);

  objc_msgSend(v3, "givenName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFirstName:", v6);

  objc_msgSend(v3, "middleName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMiddleName:", v7);

  objc_msgSend(v3, "familyName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLastName:", v8);

  objc_msgSend(v3, "nickname");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNickName:", v9);

  objc_msgSend(v3, "organizationName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOrganizationName:", v10);

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  objc_msgSend(v3, "emailAddresses");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v35;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v35 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v16), "value");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v14);
  }

  objc_msgSend(v4, "setEmailAddresses:", v11);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v29 = v3;
  objc_msgSend(v3, "phoneNumbers");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v31;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v31 != v22)
          objc_enumerationMutation(v19);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v23), "value");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "stringValue");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0D1D5C0], "normalizePhoneNumber:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObject:", v26);

        ++v23;
      }
      while (v21 != v23);
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v21);
  }

  objc_msgSend(v4, "setPhoneNumbers:", v18);
  v27 = (void *)objc_msgSend(v4, "copy");

  return v27;
}

+ (id)keysToFetch
{
  if (keysToFetch_onceToken != -1)
    dispatch_once(&keysToFetch_onceToken, &__block_literal_global_11);
  return (id)keysToFetch_keys;
}

- (id)sanitizedContactWithContactStore:()Contacts withError:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v18;

  v6 = a3;
  v7 = a1;
  objc_msgSend(MEMORY[0x1E0D1D5C0], "keysToFetch");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contactIdentifier");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (!v9)
    goto LABEL_5;
  objc_msgSend(v7, "phoneNumbers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "count"))
  {

LABEL_7:
    objc_msgSend(v7, "contactIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(v6, "unifiedContactWithIdentifier:keysToFetch:error:", v14, v8, &v18);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v18;

    v13 = v7;
    if (v15)
    {
      objc_msgSend(MEMORY[0x1E0D1D5C0], "contactWithCNContact:", v15);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (!v9)
      goto LABEL_13;
    v16 = DNDSLogSettings;
    if (os_log_type_enabled((os_log_t)DNDSLogSettings, OS_LOG_TYPE_ERROR))
    {
      -[DNDContact(Contacts) sanitizedContactWithContactStore:withError:].cold.1((uint64_t)v7, (uint64_t)v9, v16);
      if (!a4)
        goto LABEL_13;
    }
    else if (!a4)
    {
LABEL_13:

      goto LABEL_14;
    }
    *a4 = objc_retainAutorelease(v9);
    goto LABEL_13;
  }
  objc_msgSend(v7, "emailAddresses");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (!v12)
    goto LABEL_7;
  v9 = 0;
LABEL_5:
  v13 = v7;
LABEL_14:

  return v13;
}

- (void)sanitizedContactWithContactStore:()Contacts withError:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_1CB895000, log, OS_LOG_TYPE_ERROR, "Sanitizing contact %{public}@ failed: error=%{public}@", (uint8_t *)&v3, 0x16u);
}

@end

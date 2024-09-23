@implementation CNContactStore(Sanitization)

- (id)sanitizeContacts:()Sanitization
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v28 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          if (objc_msgSend(v13, "needsSanitization"))
          {
            objc_msgSend(v13, "contactIdentifier");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v14);

          }
          else
          {
            objc_msgSend(v6, "addObject:", v13);
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v10);
    }

    if (objc_msgSend(v7, "count"))
    {
      v26 = 0;
      objc_msgSend(a1, "fetchContactsWithIdentifiers:error:", v7, &v26);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v26;
      if (v16)
      {
        v17 = DNDSLogSettings;
        if (os_log_type_enabled((os_log_t)DNDSLogSettings, OS_LOG_TYPE_ERROR))
          -[CNContactStore(Sanitization) sanitizeContacts:].cold.1((uint64_t)v16, v17, v18, v19, v20, v21, v22, v23);
      }
      else
      {
        objc_msgSend(v5, "unionSet:", v15);
        objc_msgSend(v5, "unionSet:", v6);
        v8 = v5;
      }
      v24 = v8;

    }
    else
    {
      v24 = v8;
    }

  }
  else
  {
    v24 = v4;
  }

  return v24;
}

- (id)fetchContactsWithIdentifiers:()Sanitization error:
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[7];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__10;
  v22 = __Block_byref_object_dispose__10;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__10;
  v16 = __Block_byref_object_dispose__10;
  v17 = 0;
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __67__CNContactStore_Sanitization__fetchContactsWithIdentifiers_error___block_invoke;
  v11[3] = &unk_1E86A7318;
  v11[4] = a1;
  v11[5] = &v18;
  v11[6] = &v12;
  objc_msgSend(v7, "enumerateBatchesOfSize:handler:", 10, v11);

  if (a4)
  {
    v8 = (void *)v13[5];
    if (v8)
      *a4 = objc_retainAutorelease(v8);
  }
  v9 = (id)v19[5];
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v9;
}

- (void)sanitizeContacts:()Sanitization .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1CB895000, a2, a3, "Could not sanitize contacts; will use existing data this time: %{public}@",
    a5,
    a6,
    a7,
    a8,
    2u);
}

@end

@implementation CNContactStore

void __67__CNContactStore_Sanitization__fetchContactsWithIdentifiers_error___block_invoke(_QWORD *a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  uint8_t buf[4];
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = (void *)MEMORY[0x1D17A0B90]();
  v7 = objc_alloc(MEMORY[0x1E0C97210]);
  objc_msgSend(MEMORY[0x1E0D1D5C0], "keysToFetch");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithKeysToFetch:", v8);

  objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsWithIdentifiers:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicate:", v10);

  objc_msgSend(v9, "setUnifyResults:", 1);
  v28 = 0;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __67__CNContactStore_Sanitization__fetchContactsWithIdentifiers_error___block_invoke_2;
  v27[3] = &unk_1E86A5D60;
  v11 = (void *)a1[4];
  v27[4] = a1[5];
  v12 = objc_msgSend(v11, "enumerateContactsWithFetchRequest:error:usingBlock:", v9, &v28, v27);
  v13 = v28;
  v14 = v28;
  v15 = DNDSLogSettings;
  if (v12)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogSettings, OS_LOG_TYPE_DEFAULT))
    {
      v16 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
      v17 = v15;
      v18 = objc_msgSend(v16, "count");
      *(_DWORD *)buf = 134349056;
      v30 = v18;
      _os_log_impl(&dword_1CB895000, v17, OS_LOG_TYPE_DEFAULT, "Fetched %{public}lld sanitizated contacts", buf, 0xCu);

    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogSettings, OS_LOG_TYPE_ERROR))
      __67__CNContactStore_Sanitization__fetchContactsWithIdentifiers_error___block_invoke_cold_1((uint64_t)v14, v15, v19, v20, v21, v22, v23, v24);
    v25 = *(_QWORD *)(a1[5] + 8);
    v26 = *(void **)(v25 + 40);
    *(_QWORD *)(v25 + 40) = 0;

    *a3 = 1;
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), v13);
  }

  objc_autoreleasePoolPop(v6);
}

void __67__CNContactStore_Sanitization__fetchContactsWithIdentifiers_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(MEMORY[0x1E0D1D5C0], "contactWithCNContact:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v3);

}

void __67__CNContactStore_Sanitization__fetchContactsWithIdentifiers_error___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1CB895000, a2, a3, "Unable to fetch sanitized contacts: %{public}@", a5, a6, a7, a8, 2u);
}

@end

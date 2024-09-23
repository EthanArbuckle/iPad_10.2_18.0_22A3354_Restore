@implementation CNContactStore

void __44__CNContactStore_EmailContactUtilities__log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_8;
  log_log_8 = (uint64_t)v1;

}

uint64_t __97__CNContactStore_EmailContactUtilities__em_onScheduler_contactFutureForEmailAddress_keysToFetch___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchContactForEmailAddress:keysToFetch:allowMatchOnDisplayName:createIfNeeded:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0, 1, a2);
}

id __100__CNContactStore_EmailContactUtilities__em_contactsFutureOnScheduler_forEmailAddresses_keysToFetch___block_invoke(_QWORD *a1, _QWORD *a2)
{
  void *v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;

  v13[1] = 0x3032000000;
  v13[2] = __Block_byref_object_copy__0;
  v13[3] = __Block_byref_object_dispose__0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[2] = __100__CNContactStore_EmailContactUtilities__em_contactsFutureOnScheduler_forEmailAddresses_keysToFetch___block_invoke_10;
  v9[3] = &unk_1E70F25B0;
  v3 = (void *)a1[4];
  v4 = a1 + 4;
  v5 = (void *)a1[6];
  v9[4] = a1[5];
  v12 = 0;
  v13[0] = &v12;
  v14 = 0;
  v9[1] = 3221225472;
  v10 = v5;
  v11 = &v12;
  objc_msgSend(v3, "ef_map:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97298], "log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    __100__CNContactStore_EmailContactUtilities__em_contactsFutureOnScheduler_forEmailAddresses_keysToFetch___block_invoke_cold_1(v4, (uint64_t)v13, v7);

  *a2 = objc_retainAutorelease(*(id *)(v13[0] + 40));
  _Block_object_dispose(&v12, 8);

  return v6;
}

id __100__CNContactStore_EmailContactUtilities__em_contactsFutureOnScheduler_forEmailAddresses_keysToFetch___block_invoke_10(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id obj;

  v3 = (void *)a1[4];
  v2 = a1[5];
  v4 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v3, "_fetchContactForEmailAddress:keysToFetch:allowMatchOnDisplayName:createIfNeeded:error:", a2, v2, 0, 1, &obj);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  return v5;
}

void __100__CNContactStore_EmailContactUtilities__em_contactsFutureOnScheduler_forEmailAddresses_keysToFetch___block_invoke_cold_1(_QWORD *a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = *(_QWORD *)(*(_QWORD *)a2 + 40);
  OUTLINED_FUNCTION_0_2(&dword_1B99BB000, a2, a3, "Error fetching contacts for email addresses %@: %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], *MEMORY[0x1E0C80C00]);
}

@end

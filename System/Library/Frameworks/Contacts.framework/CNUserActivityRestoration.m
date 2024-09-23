@implementation CNUserActivityRestoration

+ (id)os_log
{
  if (os_log_cn_once_token_0_12 != -1)
    dispatch_once(&os_log_cn_once_token_0_12, &__block_literal_global_3_7);
  return (id)os_log_cn_once_object_0_12;
}

void __35__CNUserActivityRestoration_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "userActivityRestoration");
  v1 = (void *)os_log_cn_once_object_0_12;
  os_log_cn_once_object_0_12 = (uint64_t)v0;

}

+ (id)searchQueryGivenPayload:(id)a3
{
  void *v3;
  void *v4;
  __CFString *v5;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("search-query"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = v3;
  else
    v5 = &stru_1E29FF900;

  return v5;
}

+ (id)contactsToCreateGivenPayload:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcard"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContactVCardSerialization contactsWithData:error:](CNContactVCardSerialization, "contactsWithData:error:", v5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)contactsGivenPayload:(id)a3 keysToFetch:(id)a4 contactStore:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  void *v19;
  NSObject *v20;
  id v22;
  id v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("carddav-uuids"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  objc_msgSend(a1, "contactsForServerUUIDs:additionalKeysToFetch:contactStore:error:", v13, v11, v12, &v23);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v23;
  if (v15)
  {
    v16 = v15;
    objc_msgSend((id)objc_opt_class(), "os_log");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      +[CNUserActivityRestoration contactsGivenPayload:keysToFetch:contactStore:error:].cold.2((uint64_t)v13, (uint64_t)v16, v17);

    v18 = 0;
    if (a6)
      *a6 = objc_retainAutorelease(v16);
  }
  else if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D137F8] + 16))() & 1) != 0)
  {
    v22 = 0;
    objc_msgSend(a1, "contactBestMatchingPayload:additionalKeysToFetch:contactStore:error:", v10, v11, v12, &v22);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v22;
    if (v16)
    {
      objc_msgSend((id)objc_opt_class(), "os_log");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        +[CNUserActivityRestoration contactsGivenPayload:keysToFetch:contactStore:error:].cold.1((uint64_t)v16, v20);

      v18 = 0;
      if (a6)
        *a6 = objc_retainAutorelease(v16);
    }
    else if (v19)
    {
      v24[0] = v19;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
      v18 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = (id)MEMORY[0x1E0C9AA60];
    }

  }
  else
  {
    v18 = v14;
    v16 = 0;
  }

  return v18;
}

+ (id)contactsForServerUUIDs:(id)a3 additionalKeysToFetch:(id)a4 contactStore:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  CNContactFetchRequest *v14;
  void *v15;
  void *v16;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(a3, "count"))
  {
    v18[0] = CFSTR("identifier");
    v18[1] = CFSTR("externalUUID");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v11;
    v19[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_cn_flatten");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = -[CNContactFetchRequest initWithKeysToFetch:]([CNContactFetchRequest alloc], "initWithKeysToFetch:", v13);
    -[CNContactFetchRequest setUnifyResults:](v14, "setUnifyResults:", 0);
    objc_msgSend(v10, "executeFetchRequest:error:", v14, a6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "value");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (id)contactBestMatchingPayload:(id)a3 additionalKeysToFetch:(id)a4 contactStore:(id)a5 error:(id *)a6
{
  return 0;
}

+ (void)contactsGivenPayload:(uint64_t)a1 keysToFetch:(NSObject *)a2 contactStore:error:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_18F8BD000, a2, OS_LOG_TYPE_ERROR, "Error fetching best matching contact: %@", (uint8_t *)&v2, 0xCu);
}

+ (void)contactsGivenPayload:(os_log_t)log keysToFetch:contactStore:error:.cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_18F8BD000, log, OS_LOG_TYPE_ERROR, "Error fetching contacts for serverUUIDs:%{public}@ : %@", (uint8_t *)&v3, 0x16u);
}

@end

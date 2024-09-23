@implementation ATXSenderImportanceUtils

+ (id)contactFromHandle:(id)a3 contactStore:(id)a4
{
  id v6;
  id v7;
  void *v8;
  ATXStableContactRepresentationDatastore *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v19;
  _QWORD v20[5];

  v20[4] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "contactIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = -[ATXStableContactRepresentationDatastore initWithContactStore:]([ATXStableContactRepresentationDatastore alloc], "initWithContactStore:", v7);
    objc_msgSend(v6, "contactIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXStableContactRepresentationDatastore cnContactForCnContactId:rawIdentifier:](v9, "cnContactForCnContactId:rawIdentifier:", v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v17 = (void *)v12;

    goto LABEL_6;
  }
  objc_msgSend(v6, "handle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *MEMORY[0x1E0C96898];
    v20[0] = v14;
    v20[1] = v15;
    v16 = *MEMORY[0x1E0C966A8];
    v20[2] = *MEMORY[0x1E0C967C0];
    v20[3] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 4);
    v9 = (ATXStableContactRepresentationDatastore *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70968]), "initWithContactStore:keysToFetch:", v7, v9);
    objc_msgSend(v6, "handle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "resolveContactIfPossibleFromContactIdentifierString:pickFirstOfMultiple:", v11, 1);
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  objc_msgSend(v6, "name");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    v17 = 0;
    goto LABEL_7;
  }
  objc_msgSend(v6, "name");
  v9 = (ATXStableContactRepresentationDatastore *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_contactFromName:contactStore:", v9, v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

LABEL_7:
  return v17;
}

+ (id)_contactFromName:(id)a3 contactStore:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  id v21;
  uint8_t buf[4];
  id v23;
  _QWORD v24[8];

  v24[7] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1E0C97218];
  v7 = a4;
  objc_msgSend(v6, "descriptorForRequiredKeysForStyle:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v8;
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 1000);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0C966E8];
  v24[1] = v9;
  v24[2] = v10;
  v11 = *MEMORY[0x1E0C967C0];
  v24[3] = *MEMORY[0x1E0C96898];
  v24[4] = v11;
  v12 = *MEMORY[0x1E0C966A8];
  v24[5] = *MEMORY[0x1E0C96740];
  v24[6] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingName:", v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(v7, "unifiedContactsMatchingPredicate:keysToFetch:error:", v14, v13, &v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = v21;
  if (v16)
  {
    __atxlog_handle_notification_categorization();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      +[ATXSenderImportanceUtils _contactFromName:contactStore:].cold.1((uint64_t)v14, (uint64_t)v16, v17);

    v18 = 0;
  }
  else
  {
    if (!objc_msgSend(v15, "count"))
    {
      __atxlog_handle_notification_categorization();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v5;
        _os_log_impl(&dword_1C9A3B000, v19, OS_LOG_TYPE_INFO, "No contact matches found for the given name: %@", buf, 0xCu);
      }

    }
    objc_msgSend(v15, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

+ (void)_contactFromName:(os_log_t)log contactStore:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_ERROR, "Error when fetching contact for predicate %@: %@", (uint8_t *)&v3, 0x16u);
}

@end

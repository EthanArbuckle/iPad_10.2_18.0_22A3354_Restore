@implementation CNDeduplication

+ (id)os_log
{
  if (os_log_cn_once_token_0_9 != -1)
    dispatch_once(&os_log_cn_once_token_0_9, &__block_literal_global_59);
  return (id)os_log_cn_once_object_0_9;
}

void __25__CNDeduplication_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "dedupe-groups");
  v1 = (void *)os_log_cn_once_object_0_9;
  os_log_cn_once_object_0_9 = (uint64_t)v0;

}

- (void)deduplicateAllContainers:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "os_log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v4;
    _os_log_impl(&dword_18F8BD000, v5, OS_LOG_TYPE_DEFAULT, "Deduplicating groups for store %@", buf, 0xCu);
  }

  objc_msgSend(v4, "containersMatchingPredicate:error:", 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_cn_filter:", &__block_literal_global_4_2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__CNDeduplication_deduplicateAllContainers___block_invoke_2;
  v9[3] = &unk_1E29FA828;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v7, "_cn_each:", v9);

}

uint64_t __44__CNDeduplication_deduplicateAllContainers___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "permissions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canCreateGroups");

  return v3;
}

void __44__CNDeduplication_deduplicateAllContainers___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deduplicateContainer:store:", v4, *(_QWORD *)(a1 + 40));

}

- (void)deduplicateContainer:(id)a3 store:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  id v22;
  void *v23;
  void *v24;
  CNDeduplication *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v25 = self;
  objc_msgSend((id)objc_opt_class(), "os_log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v32 = v6;
    v33 = 2112;
    v34 = v7;
    _os_log_impl(&dword_18F8BD000, v8, OS_LOG_TYPE_DEFAULT, "Deduplicating container %@ in store %@", buf, 0x16u);
  }

  v24 = v6;
  +[CNGroup predicateForGroupsInContainerWithIdentifier:](CNGroup, "predicateForGroupsInContainerWithIdentifier:", v6);
  v9 = v7;
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "groupsMatchingPredicate:error:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  objc_msgSend(v11, "sortUsingComparator:", &__block_literal_global_7_1);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v13)
  {
    v14 = v13;
    v15 = 0;
    v16 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v27 != v16)
          objc_enumerationMutation(v12);
        v18 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v15, "name");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "name");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v19, "isEqualToString:", v20);

        if (v21)
        {
          -[CNDeduplication deduplicateKeeping:deleting:store:](v25, "deduplicateKeeping:deleting:store:", v15, v18, v9);
        }
        else
        {
          v22 = v18;

          v15 = v22;
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v14);
  }
  else
  {
    v15 = 0;
  }

}

uint64_t __46__CNDeduplication_deduplicateContainer_store___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (void)deduplicateKeeping:(id)a3 deleting:(id)a4 store:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CNSaveRequest *v15;
  uint64_t v16;
  NSObject *v17;
  _BOOL4 v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[CNDeduplication contactsForGroup:store:](self, "contactsForGroup:store:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNDeduplication contactsForGroup:store:](self, "contactsForGroup:store:", v9, v10);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNDeduplication identifierSetFromContacts:](self, "identifierSetFromContacts:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  -[CNDeduplication identifierSetFromContacts:](self, "identifierSetFromContacts:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "minusSet:", v14);
  v15 = objc_alloc_init(CNSaveRequest);
  v16 = objc_msgSend(v13, "count");
  objc_msgSend((id)objc_opt_class(), "os_log");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if (v16)
  {
    if (v18)
    {
      v19 = objc_msgSend(v13, "count");
      objc_msgSend(v9, "name");
      v28 = v14;
      v20 = v8;
      v21 = v11;
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v32 = v19;
      v33 = 2112;
      v34 = v22;
      _os_log_impl(&dword_18F8BD000, v17, OS_LOG_TYPE_DEFAULT, "Need to adjust membership of %lu contacts before deleting duplicate group %@", buf, 0x16u);

      v11 = v21;
      v8 = v20;
      v14 = v28;
    }

    objc_msgSend(v13, "allObjects");
    v17 = objc_claimAutoreleasedReturnValue();
    -[CNDeduplication addContactsForIds:toGroup:usingRequest:store:](self, "addContactsForIds:toGroup:usingRequest:store:", v17, v8, v15, v10);
  }
  else if (v18)
  {
    objc_msgSend(v9, "name");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v32 = (uint64_t)v23;
    _os_log_impl(&dword_18F8BD000, v17, OS_LOG_TYPE_DEFAULT, "No membership adjustment needed before deleting duplicate group %@", buf, 0xCu);

  }
  v24 = (void *)objc_msgSend(v9, "mutableCopy");
  -[CNSaveRequest deleteGroup:](v15, "deleteGroup:", v24);

  v30 = 0;
  LODWORD(v24) = objc_msgSend(v10, "executeSaveRequest:error:", v15, &v30);
  v25 = v30;
  v26 = v25;
  if (!(_DWORD)v24 || v25)
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v32 = (uint64_t)v26;
      v33 = 2112;
      v34 = v9;
      _os_log_impl(&dword_18F8BD000, v27, OS_LOG_TYPE_DEFAULT, "Unexpected error:%{public}@ cleaning up group for deduplication:%@", buf, 0x16u);
    }

  }
}

- (id)contactsForGroup:(id)a3 store:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  id v8;
  CNContactFetchRequest *v9;
  CNContactFetchRequest *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void *v20;
  id v21;
  id v22;

  v5 = a3;
  v6 = (objc_class *)MEMORY[0x1E0C99DE8];
  v7 = a4;
  v8 = objc_alloc_init(v6);
  v9 = [CNContactFetchRequest alloc];
  v10 = -[CNContactFetchRequest initWithKeysToFetch:](v9, "initWithKeysToFetch:", MEMORY[0x1E0C9AA60]);
  objc_msgSend(v5, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContact predicateForContactsInGroupWithIdentifier:](CNContact, "predicateForContactsInGroupWithIdentifier:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactFetchRequest setPredicate:](v10, "setPredicate:", v12);

  -[CNContactFetchRequest setUnifyResults:](v10, "setUnifyResults:", 0);
  v22 = 0;
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __42__CNDeduplication_contactsForGroup_store___block_invoke;
  v20 = &unk_1E29FA870;
  v13 = v8;
  v21 = v13;
  objc_msgSend(v7, "enumerateContactsWithFetchRequest:error:usingBlock:", v10, &v22, &v17);

  v14 = v22;
  if (v14)
  {
    objc_msgSend((id)objc_opt_class(), "os_log", v17, v18, v19, v20);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[CNDeduplication contactsForGroup:store:].cold.1();

  }
  return v13;
}

uint64_t __42__CNDeduplication_contactsForGroup_store___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (void)addContactsForIds:(id)a3 toGroup:(id)a4 usingRequest:(id)a5 store:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  CNContactFetchRequest *v13;
  CNContactFetchRequest *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = a3;
  v13 = [CNContactFetchRequest alloc];
  v14 = -[CNContactFetchRequest initWithKeysToFetch:](v13, "initWithKeysToFetch:", MEMORY[0x1E0C9AA60]);
  +[CNContact predicateForContactsWithIdentifiers:](CNContact, "predicateForContactsWithIdentifiers:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNContactFetchRequest setPredicate:](v14, "setPredicate:", v15);
  -[CNContactFetchRequest setUnifyResults:](v14, "setUnifyResults:", 0);
  v23 = 0;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __64__CNDeduplication_addContactsForIds_toGroup_usingRequest_store___block_invoke;
  v20[3] = &unk_1E29F84B8;
  v16 = v10;
  v21 = v16;
  v17 = v9;
  v22 = v17;
  objc_msgSend(v11, "enumerateContactsWithFetchRequest:error:usingBlock:", v14, &v23, v20);

  v18 = v23;
  if (v18)
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[CNDeduplication addContactsForIds:toGroup:usingRequest:store:].cold.1();

  }
}

uint64_t __64__CNDeduplication_addContactsForIds_toGroup_usingRequest_store___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addMember:toGroup:", a2, *(_QWORD *)(a1 + 40));
}

- (id)identifierSetFromContacts:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a3, "_cn_map:", CNContactToIdentifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)contactsForGroup:store:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_2(&dword_18F8BD000, v0, v1, "Unexpected error:%{public}@  getting contacts for group: %@");
}

- (void)addContactsForIds:toGroup:usingRequest:store:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_2(&dword_18F8BD000, v0, v1, "Unexpected error:%{public}@ getting contacts to add to group:%@");
}

@end

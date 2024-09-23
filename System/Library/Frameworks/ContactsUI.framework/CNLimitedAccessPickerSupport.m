@implementation CNLimitedAccessPickerSupport

+ (BOOL)isPickerLimitedAccess:(int)a3
{
  return a3 != 0;
}

+ (BOOL)isPickerLimitedAccessWithMultiSelect:(int)a3
{
  return (a3 < 7) & (0x5Eu >> a3);
}

+ (BOOL)isPickerLimitedAccessWithLists:(int)a3
{
  return (a3 < 7) & (0x5Au >> a3);
}

+ (BOOL)isPickerLimitedAccessSummary:(int)a3
{
  return a3 == 2 || a3 == 5;
}

+ (BOOL)shouldLimitedAccessPickerSupportSelectAll:(int)a3
{
  return (a3 > 6) | (0x1Au >> a3) & 1;
}

+ (BOOL)shouldLimitedAccessPickerNeedContactsFilter:(int)a3
{
  return (a3 < 7) & (0x64u >> a3);
}

+ (id)identifiersFromContacts:(id)a3
{
  return (id)objc_msgSend(a3, "_cn_compactMap:", &__block_literal_global_3035);
}

+ (id)contactsFromIdentifiers:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void *v21;
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  objc_msgSend(v3, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contactStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc(MEMORY[0x1E0C97210]);
  v9 = (void *)objc_msgSend(v8, "initWithKeysToFetch:", MEMORY[0x1E0C9AA60]);
  objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsWithIdentifiers:", v4);
  v10 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setPredicate:", v10);
  objc_msgSend(v9, "setUnifyResults:", 1);
  v23 = 0;
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __56__CNLimitedAccessPickerSupport_contactsFromIdentifiers___block_invoke;
  v21 = &unk_1E204B638;
  v11 = v5;
  v22 = v11;
  LOBYTE(v10) = objc_msgSend(v7, "enumerateContactsWithFetchRequest:error:usingBlock:", v9, &v23, &v18);
  v12 = v23;
  if ((v10 & 1) == 0)
  {
    CNUILogContactList();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v12, "localizedDescription", v18, v19, v20, v21);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v25 = v17;
      _os_log_error_impl(&dword_18AC56000, v13, OS_LOG_TYPE_ERROR, "Limited Picker fetch error: %@", buf, 0xCu);

    }
  }
  v14 = v22;
  v15 = v11;

  return v15;
}

+ (id)allowedIdentifiersForBundleID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v5, "fetchLimitedAccessContactIdentifiersForBundle:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (void)addContactsToLimitedAccess:(id)a3 forBundleID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a4;
  v6 = a3;
  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contactStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __71__CNLimitedAccessPickerSupport_addContactsToLimitedAccess_forBundleID___block_invoke;
  v11[3] = &unk_1E20482C0;
  v12 = v8;
  v13 = v5;
  v9 = v5;
  v10 = v8;
  objc_msgSend(v6, "_cn_each:", v11);

}

+ (void)removeAllLimitedAccessIdentifiersForBundleID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a3;
  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "fetchLimitedAccessContactIdentifiersForBundle:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __77__CNLimitedAccessPickerSupport_removeAllLimitedAccessIdentifiersForBundleID___block_invoke;
  v9[3] = &unk_1E204FD70;
  v10 = v5;
  v11 = v3;
  v6 = v3;
  v7 = v5;
  objc_msgSend(v8, "_cn_each:", v9);

}

+ (id)appNameForBundleId:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v13;

  v3 = a3;
  v13 = 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v3, 0, &v13);
  v9 = v13;
  if (v4)
  {
    objc_msgSend(v4, "localizedName");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/LimitedAccess/CNLimitedAccessPickerSupport.m", 168, 3, CFSTR("Failed to locate app record for: %@, Error: %@"), v5, v6, v7, v8, (uint64_t)v3);
    v10 = v3;
  }
  v11 = v10;

  return v11;
}

void __77__CNLimitedAccessPickerSupport_removeAllLimitedAccessIdentifiersForBundleID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  CNUILogContactList();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18AC56000, v4, OS_LOG_TYPE_INFO, "Removing limited access identifier to store: %@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "removeLimitedAccessForBundle:contactIdentifier:", *(_QWORD *)(a1 + 40), v3);
}

void __71__CNLimitedAccessPickerSupport_addContactsToLimitedAccess_forBundleID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  CNUILogContactList();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v3, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v5;
    _os_log_impl(&dword_18AC56000, v4, OS_LOG_TYPE_INFO, "Adding limited access identifier to store: %@", (uint8_t *)&v9, 0xCu);

  }
  v7 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addLimitedAccessForBundle:contactIdentifier:", v6, v8);

}

uint64_t __56__CNLimitedAccessPickerSupport_contactsFromIdentifiers___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __56__CNLimitedAccessPickerSupport_identifiersFromContacts___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

@end

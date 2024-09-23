@implementation CNUIDefaultUserActionFetcher

void __89__CNUIDefaultUserActionFetcher_recentContactsForUserActionItem_recentsLibrary_scheduler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 56), "queryForUserActionItem:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[CNUICoreLogProvider actions_os_log](CNUICoreLogProvider, "actions_os_log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __89__CNUIDefaultUserActionFetcher_recentContactsForUserActionItem_recentsLibrary_scheduler___block_invoke_2_cold_1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __89__CNUIDefaultUserActionFetcher_recentContactsForUserActionItem_recentsLibrary_scheduler___block_invoke_11;
  v18[3] = &unk_1EA605968;
  v19 = v6;
  v20 = v4;
  v14 = *(void **)(a1 + 40);
  v21 = *(id *)(a1 + 48);
  v22 = v3;
  v15 = v3;
  v16 = v4;
  v17 = v6;
  objc_msgSend(v14, "performRecentsSearch:queue:completion:", v16, 0, v18);

}

+ (id)queryForUserActionItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "sanitizedTargetHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contactProperty");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = CFSTR("CNUICRRecentsDomainContactDefaultAction");
  CNUIUserActionRecentsAddressKindForContactProperty();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[CNUICoreLogProvider actions_os_log](CNUICoreLogProvider, "actions_os_log");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v5, "key");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412802;
    v14 = v3;
    v15 = 2114;
    v16 = v12;
    v17 = 2114;
    v18 = v8;
    _os_log_debug_impl(&dword_1DD140000, v9, OS_LOG_TYPE_DEBUG, "[DefaultAction] composed query for %@, key %{public}@, kind %{public}@", (uint8_t *)&v13, 0x20u);

  }
  objc_msgSend(MEMORY[0x1E0D182A0], "searchQueryForSearchTerm:preferredKinds:sendingAddress:recentsDomain:", v4, v8, 0, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setComparator:", 0);

  return v10;
}

id __82__CNUIDefaultUserActionFetcher_defaultActionItemForActionItems_schedulerProvider___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a2;
  v4 = (void *)objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "library");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "backgroundScheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recentContactsForUserActionItem:recentsLibrary:scheduler:", v3, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "defaultActionItemForActionItem:recentContacts:", v3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (CRRecentContactsLibrary)library
{
  return self->_library;
}

+ (id)recentContactsForUserActionItem:(id)a3 recentsLibrary:(id)a4 scheduler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1E0D13AE8];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __89__CNUIDefaultUserActionFetcher_recentContactsForUserActionItem_recentsLibrary_scheduler___block_invoke;
  v17[3] = &unk_1EA6059B8;
  v18 = v10;
  v19 = v8;
  v20 = v9;
  v21 = a1;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  objc_msgSend(v11, "observableWithBlock:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)defaultActionItemForActionItem:(id)a3 recentContacts:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v6 = a3;
  v7 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __78__CNUIDefaultUserActionFetcher_defaultActionItemForActionItem_recentContacts___block_invoke;
  v16[3] = &unk_1EA6059E0;
  v18 = a1;
  v8 = v6;
  v17 = v8;
  objc_msgSend(a4, "filter:", v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "take:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __78__CNUIDefaultUserActionFetcher_defaultActionItemForActionItem_recentContacts___block_invoke_2;
  v14[3] = &unk_1EA605A08;
  v15 = v8;
  v11 = v8;
  objc_msgSend(v10, "map:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id __82__CNUIDefaultUserActionFetcher_defaultActionItemForActionItems_schedulerProvider___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  id (*v13)(uint64_t, void *);
  void *v14;
  uint64_t v15;
  id v16;

  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __82__CNUIDefaultUserActionFetcher_defaultActionItemForActionItems_schedulerProvider___block_invoke_2;
  v14 = &unk_1EA6058E0;
  v4 = *(void **)(a1 + 40);
  v15 = *(_QWORD *)(a1 + 32);
  v16 = v4;
  objc_msgSend(a2, "_cn_map:", &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D13AE8], "merge:schedulerProvider:", v5, *(_QWORD *)(a1 + 40), v11, v12, v13, v14, v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scan:", &__block_literal_global_9_3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "takeLast:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "map:", &__block_literal_global_80);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)defaultActionItemForActionItems:(id)a3 schedulerProvider:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  id (*v13)(uint64_t, void *);
  void *v14;
  CNUIDefaultUserActionFetcher *v15;
  id v16;

  v6 = a4;
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __82__CNUIDefaultUserActionFetcher_defaultActionItemForActionItems_schedulerProvider___block_invoke;
  v14 = &unk_1EA6048B8;
  v15 = self;
  v16 = v6;
  v7 = v6;
  objc_msgSend(a3, "switchMap:schedulerProvider:", &v11, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doOnNext:", &__block_literal_global_6_1, v11, v12, v13, v14, v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __89__CNUIDefaultUserActionFetcher_recentContactsForUserActionItem_recentsLibrary_scheduler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  uint64_t v12;

  v3 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __89__CNUIDefaultUserActionFetcher_recentContactsForUserActionItem_recentsLibrary_scheduler___block_invoke_2;
  v8[3] = &unk_1EA605990;
  v12 = *(_QWORD *)(a1 + 56);
  v4 = *(void **)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v10 = *(id *)(a1 + 48);
  v11 = v3;
  v5 = v3;
  objc_msgSend(v4, "performCancelableBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CNUIDefaultUserActionFetcher)init
{
  void *v3;
  CNUIDefaultUserActionFetcher *v4;

  objc_msgSend(MEMORY[0x1E0D18290], "defaultInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CNUIDefaultUserActionFetcher initWithRecentsLibrary:](self, "initWithRecentsLibrary:", v3);

  return v4;
}

- (CNUIDefaultUserActionFetcher)initWithRecentsLibrary:(id)a3
{
  id v5;
  CNUIDefaultUserActionFetcher *v6;
  CNUIDefaultUserActionFetcher *v7;
  CNUIDefaultUserActionFetcher *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNUIDefaultUserActionFetcher;
  v6 = -[CNUIDefaultUserActionFetcher init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_library, a3);
    v8 = v7;
  }

  return v7;
}

- (id)observableForDefaultActionsChanged
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D13AE8];
  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "observableOnNotificationCenter:withName:object:", v3, CFSTR("com.apple.contacts.ContactsUICore.CNUIUserActionRecentsChangedNotification"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __82__CNUIDefaultUserActionFetcher_defaultActionItemForActionItems_schedulerProvider___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "first");
}

void __82__CNUIDefaultUserActionFetcher_defaultActionItemForActionItems_schedulerProvider___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  +[CNUICoreLogProvider actions_os_log](CNUICoreLogProvider, "actions_os_log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __82__CNUIDefaultUserActionFetcher_defaultActionItemForActionItems_schedulerProvider___block_invoke_4_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

void __89__CNUIDefaultUserActionFetcher_recentContactsForUserActionItem_recentsLibrary_scheduler___block_invoke_11(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  +[CNUICoreLogProvider actions_os_log](CNUICoreLogProvider, "actions_os_log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __89__CNUIDefaultUserActionFetcher_recentContactsForUserActionItem_recentsLibrary_scheduler___block_invoke_11_cold_2(a1, v7, v8, v9, v10, v11, v12, v13);

  +[CNUICoreLogProvider actions_os_log](CNUICoreLogProvider, "actions_os_log");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v5)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      __89__CNUIDefaultUserActionFetcher_recentContactsForUserActionItem_recentsLibrary_scheduler___block_invoke_11_cold_1(a1, (uint64_t)v5, v15);
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 40), "predicate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138412546;
    v18 = v16;
    v19 = 2114;
    v20 = v6;
    _os_log_impl(&dword_1DD140000, v15, OS_LOG_TYPE_INFO, "[DefaultAction] Query for %@ failed: %{public}@", (uint8_t *)&v17, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0D13AF0], "sendArray:error:toObserver:untilCanceled:", v5, v6, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

uint64_t __78__CNUIDefaultUserActionFetcher_defaultActionItemForActionItem_recentContacts___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 40), "doesRecentContact:matchUserActionItem:", a2, *(_QWORD *)(a1 + 32));
}

uint64_t __78__CNUIDefaultUserActionFetcher_defaultActionItemForActionItem_recentContacts___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0D13AF8], "pairWithFirst:second:", *(_QWORD *)(a1 + 32), a2);
}

+ (BOOL)doesRecentContact:(id)a3 matchUserActionItem:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  BOOL v24;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "contactProperty");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "metadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "type");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "valueForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "valueForKey:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
    goto LABEL_12;
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("bundleIdentifier"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend(v6, "bundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
      goto LABEL_6;
  }
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("bundleIdentifier"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "isEqual:", v15);

  if (!v13)
  {

    if ((v16 & 1) != 0)
      goto LABEL_6;
LABEL_12:
    v24 = 0;
    goto LABEL_13;
  }

  if (!v16)
    goto LABEL_12;
LABEL_6:
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("date"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    v19 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v17, "doubleValue");
    objc_msgSend(v19, "dateWithTimeIntervalSinceReferenceDate:");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRecentDates:", v21);

  }
  objc_msgSend(v5, "metadata");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "associateWithRecentContactMetadata:", v22);

  +[CNUICoreLogProvider actions_os_log](CNUICoreLogProvider, "actions_os_log");
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    +[CNUIDefaultUserActionFetcher doesRecentContact:matchUserActionItem:].cold.1();

  v24 = 1;
LABEL_13:

  return v24;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_library, 0);
}

void __82__CNUIDefaultUserActionFetcher_defaultActionItemForActionItems_schedulerProvider___block_invoke_4_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DD140000, a2, a3, "[DefaultAction] Default action from CoreRecents: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __89__CNUIDefaultUserActionFetcher_recentContactsForUserActionItem_recentsLibrary_scheduler___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DD140000, a2, a3, "[DefaultAction] Beginning query %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __89__CNUIDefaultUserActionFetcher_recentContactsForUserActionItem_recentsLibrary_scheduler___block_invoke_11_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  uint8_t v7[14];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 40), "predicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_6();
  v8 = a2;
  OUTLINED_FUNCTION_2_4(&dword_1DD140000, a3, v6, "[DefaultAction] Query for %@ found %@", v7);

}

void __89__CNUIDefaultUserActionFetcher_recentContactsForUserActionItem_recentsLibrary_scheduler___block_invoke_11_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DD140000, a2, a3, "[DefaultAction] Completion handler called for %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

+ (void)doesRecentContact:matchUserActionItem:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_6();
  v3 = v0;
  OUTLINED_FUNCTION_2_4(&dword_1DD140000, v1, (uint64_t)v1, "[DefaultAction] Recent contact %@ matches action %@", v2);
  OUTLINED_FUNCTION_2();
}

@end

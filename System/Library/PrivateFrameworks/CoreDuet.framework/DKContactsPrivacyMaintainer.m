@implementation DKContactsPrivacyMaintainer

uint64_t __68___DKContactsPrivacyMaintainer_registerContactDeletionNotifications__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleContactDeletionNotification");
}

void __68___DKContactsPrivacyMaintainer_registerContactDeletionNotifications__block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  NSObject *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  +[_CDLogging spotlightReceiverChannel](_CDLogging, "spotlightReceiverChannel");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __68___DKContactsPrivacyMaintainer_registerContactDeletionNotifications__block_invoke_2_cold_1();

  objc_msgSend(WeakRetained[6], "runAfterDelaySeconds:coalescingBehavior:", 1, 8.0);
}

void __68___DKContactsPrivacyMaintainer_registerContactDeletionNotifications__block_invoke_334(uint64_t a1)
{
  id *WeakRetained;
  NSObject *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  +[_CDLogging spotlightReceiverChannel](_CDLogging, "spotlightReceiverChannel");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __68___DKContactsPrivacyMaintainer_registerContactDeletionNotifications__block_invoke_334_cold_1();

  objc_msgSend(WeakRetained[6], "runAfterDelaySeconds:coalescingBehavior:", 1, 8.0);
}

void __71___DKContactsPrivacyMaintainer_handleRecentlyDeletedContactsWithLimit___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  const __CFString *v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "deletedContactIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_deleteIntentsRelatedToContactIdentifiers:", v5);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += objc_msgSend(v5, "count");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) > *(_QWORD *)(a1 + 56))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    *a3 = 1;
  }
  +[_CDLogging spotlightReceiverChannel](_CDLogging, "spotlightReceiverChannel");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v5, "count");
    v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      v11 = CFSTR("YES");
    else
      v11 = CFSTR("NO");
    v12 = 138413058;
    v13 = v8;
    v14 = 2048;
    v15 = v9;
    v16 = 2048;
    v17 = v10;
    v18 = 2112;
    v19 = v11;
    _os_log_debug_impl(&dword_18DDBE000, v6, OS_LOG_TYPE_DEBUG, "%@ - visitEventsWithBatchSize processed batch with size: %lu, numContactsProcessed: %lu, shouldSaveToken: %@", (uint8_t *)&v12, 0x2Au);

  }
}

uint64_t __65___DKContactsPrivacyMaintainer_scheduleIntentsPruningXPCActivity__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cleanupPendingDeletedContacts");
}

void __68___DKContactsPrivacyMaintainer_registerContactDeletionNotifications__block_invoke_2_cold_1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_13();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_18DDBE000, v2, v3, "%@ got __ABDataBaseChangedByOtherProcessNotification notification, triggering deleteInteractionsRelatedToDeletedContacts", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

void __68___DKContactsPrivacyMaintainer_registerContactDeletionNotifications__block_invoke_334_cold_1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_13();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_18DDBE000, v2, v3, "%@ got CNContactStoreDidChangeNotification notification, triggering deleteInteractionsRelatedToDeletedContacts", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

@end

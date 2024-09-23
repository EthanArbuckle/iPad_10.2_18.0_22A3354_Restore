@implementation ATXNotificationCategorizationUtils

+ (id)megadomeEntityIDFromNotification:(id)a3
{
  id v3;
  ATXMegadomeContextualPersonRelationships *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v24;
  id v25;
  id v26;

  v3 = a3;
  v4 = objc_alloc_init(ATXMegadomeContextualPersonRelationships);
  objc_msgSend(v3, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  -[ATXMegadomeContextualPersonRelationships megadomePersonIDFromName:error:](v4, "megadomePersonIDFromName:error:", v5, &v26);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v26;

  if (!objc_msgSend(v6, "length"))
  {
    objc_msgSend(v3, "contactIDs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v7;
    -[ATXMegadomeContextualPersonRelationships megadomePersonIDFromContactID:error:](v4, "megadomePersonIDFromContactID:error:", v9, &v25);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v25;

    v6 = (void *)v10;
    v7 = v11;
  }
  if (!objc_msgSend(v6, "length"))
  {
    objc_msgSend(v3, "threadID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v7;
    -[ATXMegadomeContextualPersonRelationships megadomePersonIDFromPhoneNumber:error:](v4, "megadomePersonIDFromPhoneNumber:error:", v20, &v24);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v24;

    v6 = (void *)v21;
    v7 = v22;
    if (v22)
      goto LABEL_5;
LABEL_9:
    v19 = v6;
    goto LABEL_10;
  }
  if (!v7)
    goto LABEL_9;
LABEL_5:
  __atxlog_handle_notification_categorization();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    +[ATXNotificationCategorizationUtils megadomeEntityIDFromNotification:].cold.1((uint64_t)v7, v12, v13, v14, v15, v16, v17, v18);

  v19 = 0;
LABEL_10:

  return v19;
}

+ (id)megadomePersonRelationshipFromEntityID:(id)a3
{
  id v3;
  ATXMegadomeContextualPersonRelationships *v4;
  dispatch_semaphore_t v5;
  NSObject *v6;
  NSObject *v7;
  dispatch_time_t v8;
  id v9;
  _QWORD v11[4];
  NSObject *v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v3 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__61;
  v25 = __Block_byref_object_dispose__61;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__61;
  v19 = __Block_byref_object_dispose__61;
  v20 = 0;
  v4 = objc_alloc_init(ATXMegadomeContextualPersonRelationships);
  v5 = dispatch_semaphore_create(0);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __77__ATXNotificationCategorizationUtils_megadomePersonRelationshipFromEntityID___block_invoke;
  v11[3] = &unk_1E82E5670;
  v13 = &v15;
  v14 = &v21;
  v6 = v5;
  v12 = v6;
  -[ATXMegadomeContextualPersonRelationships entityRelationshipsFrom:completionHandler:](v4, "entityRelationshipsFrom:completionHandler:", v3, v11);
  v7 = v6;
  v8 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v7, v8);

  v9 = 0;
  if (!v16[5])
    v9 = (id)v22[5];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

void __77__ATXNotificationCategorizationUtils_megadomePersonRelationshipFromEntityID___block_invoke(uint64_t a1, void *a2, void *a3)
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
  uint64_t v14;
  void *v15;
  id v16;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    __atxlog_handle_notification_categorization();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __77__ATXNotificationCategorizationUtils_megadomePersonRelationshipFromEntityID___block_invoke_cold_1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v5;
  v16 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (void)megadomeEntityIDFromNotification:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "ATXNotificationCategorizationUtils: Error getting megadomeEntityID from Name, contactID or phone number: %@", a5, a6, a7, a8, 2u);
}

void __77__ATXNotificationCategorizationUtils_megadomePersonRelationshipFromEntityID___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "ATXNotificationCategorizationUtils: Error getting Megadome relationships: %@", a5, a6, a7, a8, 2u);
}

@end

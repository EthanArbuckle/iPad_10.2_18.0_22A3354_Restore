@implementation CALNNotificationMapper

+ (id)notificationRequestFromNotificationRecord:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CALNNotificationIdentifier *v11;
  void *v12;
  void *v13;
  CALNNotificationIdentifier *v14;
  void *v15;
  void *v16;
  CALNMutableNotificationContent *v17;
  void *v18;
  NSObject *v19;

  v3 = a3;
  +[CALNLogSubsystem defaultCategory](CALNLogSubsystem, "defaultCategory");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    +[CALNNotificationMapper notificationRequestFromNotificationRecord:].cold.2((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  v11 = [CALNNotificationIdentifier alloc];
  objc_msgSend(v3, "sourceIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sourceClientIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[CALNNotificationIdentifier initWithSourceIdentifier:sourceClientIdentifier:](v11, "initWithSourceIdentifier:sourceClientIdentifier:", v12, v13);

  -[CALNNotificationIdentifier stringRepresentation](v14, "stringRepresentation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "content");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    v17 = objc_alloc_init(CALNMutableNotificationContent);
    v16 = (void *)-[CALNMutableNotificationContent copy](v17, "copy");

  }
  +[CALNNotificationRequest requestWithIdentifier:content:](CALNNotificationRequest, "requestWithIdentifier:content:", v15, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNLogSubsystem defaultCategory](CALNLogSubsystem, "defaultCategory");
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    +[CALNNotificationMapper notificationRequestFromNotificationRecord:].cold.1();

  return v18;
}

+ (id)notificationRecordFromNotificationRequest:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CALNNotificationIdentifier *v11;
  void *v12;
  CALNNotificationIdentifier *v13;
  NSObject *v14;
  void *v15;
  CALNNotificationRecord *v16;
  void *v17;
  CALNNotificationRecord *v18;
  NSObject *v19;

  v3 = a3;
  +[CALNLogSubsystem defaultCategory](CALNLogSubsystem, "defaultCategory");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    +[CALNNotificationMapper notificationRecordFromNotificationRequest:].cold.3((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  v11 = [CALNNotificationIdentifier alloc];
  objc_msgSend(v3, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[CALNNotificationIdentifier initWithStringRepresentation:](v11, "initWithStringRepresentation:", v12);

  if (v13)
  {
    -[CALNNotificationIdentifier sourceIdentifier](v13, "sourceIdentifier");
    v14 = objc_claimAutoreleasedReturnValue();
    -[CALNNotificationIdentifier sourceClientIdentifier](v13, "sourceClientIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = [CALNNotificationRecord alloc];
    objc_msgSend(v3, "content");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[CALNNotificationRecord initWithSourceIdentifier:sourceClientIdentifier:content:](v16, "initWithSourceIdentifier:sourceClientIdentifier:content:", v14, v15, v17);

    +[CALNLogSubsystem defaultCategory](CALNLogSubsystem, "defaultCategory");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      +[CALNNotificationMapper notificationRecordFromNotificationRequest:].cold.2();

  }
  else
  {
    +[CALNLogSubsystem defaultCategory](CALNLogSubsystem, "defaultCategory");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      +[CALNNotificationMapper notificationRecordFromNotificationRequest:].cold.1(v14);
    v18 = 0;
  }

  return v18;
}

+ (id)notificationFromNotificationRecord:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;

  v4 = a3;
  +[CALNLogSubsystem defaultCategory](CALNLogSubsystem, "defaultCategory");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    +[CALNNotificationMapper notificationFromNotificationRecord:].cold.2((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

  objc_msgSend(a1, "notificationRequestFromNotificationRecord:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "content");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  +[CALNNotification notificationWithRequest:date:](CALNNotification, "notificationWithRequest:date:", v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNLogSubsystem defaultCategory](CALNLogSubsystem, "defaultCategory");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    +[CALNNotificationMapper notificationFromNotificationRecord:].cold.1();

  return v15;
}

+ (id)notificationRecordsFromNotifications:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  id v15;

  v4 = (void *)MEMORY[0x24BDBCEB8];
  v5 = a3;
  objc_msgSend(v4, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __63__CALNNotificationMapper_notificationRecordsFromNotifications___block_invoke;
  v13 = &unk_24D4849C0;
  v14 = v6;
  v15 = a1;
  v7 = v6;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", &v10);

  v8 = (void *)objc_msgSend(v7, "copy", v10, v11, v12, v13);
  return v8;
}

void __63__CALNNotificationMapper_notificationRecordsFromNotifications___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)(a1 + 40);
  objc_msgSend(a2, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "notificationRecordFromNotificationRequest:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
}

+ (void)notificationRequestFromNotificationRecord:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_215D9B000, v0, v1, "Transformed notification record to notification request. Record: %@. Request: %@.");
  OUTLINED_FUNCTION_1_0();
}

+ (void)notificationRequestFromNotificationRecord:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_1(&dword_215D9B000, a2, a3, "Transforming notification record to notification request. Record: %@.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

+ (void)notificationRecordFromNotificationRequest:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_215D9B000, log, OS_LOG_TYPE_ERROR, "Cannot transform notification request to notification record since notification identifier is nil.", v1, 2u);
}

+ (void)notificationRecordFromNotificationRequest:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_215D9B000, v0, v1, "Transformed notification request to notification record. Request: %@. Record: %@.");
  OUTLINED_FUNCTION_1_0();
}

+ (void)notificationRecordFromNotificationRequest:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_1(&dword_215D9B000, a2, a3, "Transforming notification request to notification record. Request: %@.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

+ (void)notificationFromNotificationRecord:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_215D9B000, v0, v1, "Transformed notification record to notification. Record: %@. Notification: %@.");
  OUTLINED_FUNCTION_1_0();
}

+ (void)notificationFromNotificationRecord:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_1(&dword_215D9B000, a2, a3, "Transforming notification record to notification. Record: %@.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end

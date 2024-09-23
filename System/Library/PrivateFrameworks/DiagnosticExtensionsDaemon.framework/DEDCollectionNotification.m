@implementation DEDCollectionNotification

+ (id)log
{
  if (log_onceToken_5 != -1)
    dispatch_once(&log_onceToken_5, &__block_literal_global_30);
  return (id)log_log_4;
}

void __32__DEDCollectionNotification_log__block_invoke()
{
  os_log_t v0;
  void *v1;
  id v2;

  +[DEDConfiguration sharedInstance](DEDConfiguration, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = os_log_create((const char *)objc_msgSend(v2, "loggingSubsystem"), "collect-notify");
  v1 = (void *)log_log_4;
  log_log_4 = (uint64_t)v0;

}

+ (BOOL)shouldFireNotificationForTransport:(int64_t)a3
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  +[DEDUtils platform](DEDUtils, "platform");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("macos"));

  if (!v6)
    return 0;
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "environment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("DED_FORCE_COLLECT_NOTIFY"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    return (unint64_t)a3 > 2;
  objc_msgSend(a1, "log");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315138;
    v13 = "+[DEDCollectionNotification shouldFireNotificationForTransport:]";
    _os_log_impl(&dword_21469E000, v10, OS_LOG_TYPE_DEFAULT, "%s is forced on, notifications will be forcibly delivered.", (uint8_t *)&v12, 0xCu);
  }

  return 1;
}

+ (void)fireNotificationWithFinishingMove:(int64_t)a3
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  objc_msgSend(a1, "log", a3);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    +[DEDCollectionNotification fireNotificationWithFinishingMove:].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);

}

+ (void)handleDistributedNotification:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.diagnosticextensionsd.collection-started"));

  if (v6)
  {
    objc_msgSend(a1, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      +[DEDCollectionNotification handleDistributedNotification:].cold.1(v7);

    objc_msgSend(v4, "object");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = objc_msgSend(v8, "UTF8String");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isEqualToString:", CFSTR("FBA")) & 1) != 0)
    {
      v11 = 1;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("TTR")) & 1) != 0)
    {
      v11 = 2;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("CloudKit")) & 1) != 0)
    {
      v11 = 3;
    }
    else if (objc_msgSend(v10, "isEqualToString:", CFSTR("Testing")))
    {
      v11 = 4;
    }
    else
    {
      v11 = 0;
    }

    objc_msgSend(a1, "postNotificationToNotificationCenterForFinishingMove:", v11);
  }

}

+ (void)postNotificationToNotificationCenterForFinishingMove:(int64_t)a3
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  objc_msgSend(a1, "log", a3);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    +[DEDCollectionNotification fireNotificationWithFinishingMove:].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);

}

+ (void)configureEventStream
{
  _QWORD handler[5];

  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __49__DEDCollectionNotification_configureEventStream__block_invoke;
  handler[3] = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
  handler[4] = a1;
  xpc_set_event_stream_handler("com.apple.distnoted.matching", MEMORY[0x24BDAC9B8], handler);
}

void __49__DEDCollectionNotification_configureEventStream__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  const char *string;
  void *v7;
  void *v8;
  uint64_t v9;
  uint8_t v10[16];

  v3 = a2;
  v4 = v3;
  if (v3 && MEMORY[0x2199D43B8](v3) == MEMORY[0x24BDACFA0])
  {
    objc_msgSend(*(id *)(a1 + 32), "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_21469E000, v5, OS_LOG_TYPE_DEFAULT, "XPC Event for distnoted received.", v10, 2u);
    }

    string = xpc_dictionary_get_string(v4, "Object");
    v7 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", string);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("FBA")) & 1) != 0)
    {
      v9 = 1;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("TTR")) & 1) != 0)
    {
      v9 = 2;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("CloudKit")) & 1) != 0)
    {
      v9 = 3;
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("Testing")))
    {
      v9 = 4;
    }
    else
    {
      v9 = 0;
    }

    objc_msgSend(v7, "postNotificationToNotificationCenterForFinishingMove:", v9);
  }

}

+ (void)fireNotificationWithFinishingMove:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21469E000, a1, a3, "Notifications are unsupported.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_3();
}

+ (void)handleDistributedNotification:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_21469E000, log, OS_LOG_TYPE_DEBUG, "Received dist notif for collection.", v1, 2u);
  OUTLINED_FUNCTION_2_3();
}

@end

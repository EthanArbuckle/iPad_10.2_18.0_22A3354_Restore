@implementation UNNotificationServiceExtensionRemoteContext

void __100___UNNotificationServiceExtensionRemoteContext_didReceiveNotificationRequest_withCompletionHandler___block_invoke(id *a1, void *a2)
{
  id v3;
  unsigned __int8 *v4;
  unsigned __int8 v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  _BOOL4 v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (unsigned __int8 *)a1[4] + 24;
  do
    v5 = __ldaxr(v4);
  while (__stlxr(1u, v4));
  if ((v5 & 1) != 0)
  {
    v22 = (void *)UNLogRemoteNotifications;
    if (os_log_type_enabled((os_log_t)UNLogRemoteNotifications, OS_LOG_TYPE_ERROR))
      __100___UNNotificationServiceExtensionRemoteContext_didReceiveNotificationRequest_withCompletionHandler___block_invoke_cold_2((uint64_t)(a1 + 4), v22, (uint64_t)a1);
  }
  else
  {
    v6 = objc_opt_class();
    v7 = (void *)objc_msgSend(v3, "copy");
    UNSafeCast(v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      if (!v8)
      {
        v9 = (void *)UNLogRemoteNotifications;
        if (os_log_type_enabled((os_log_t)UNLogRemoteNotifications, OS_LOG_TYPE_ERROR))
          __100___UNNotificationServiceExtensionRemoteContext_didReceiveNotificationRequest_withCompletionHandler___block_invoke_cold_1((uint64_t)(a1 + 4), v9, (uint64_t)a1);
      }
    }
    v10 = (void *)UNLogServiceExtension;
    if (os_log_type_enabled((os_log_t)UNLogServiceExtension, OS_LOG_TYPE_DEFAULT))
    {
      v11 = a1[4];
      v12 = v10;
      objc_msgSend(v11, "_UUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "un_logDigest");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "attachments");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v27 = v13;
      v28 = 2114;
      v29 = v15;
      v30 = 1024;
      v31 = v8 != 0;
      v32 = 2048;
      v33 = objc_msgSend(v16, "count");
      _os_log_impl(&dword_1AA8E4000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received replacement content for notification request %{public}@ [ hasContent: %d attachments: %lu ]", buf, 0x26u);

    }
    objc_msgSend(v8, "attachments");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count");

    if (v18)
    {
      objc_msgSend(a1[4], "_stageAttachmentsForNotificationContent:", v8);
      v19 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v19;
    }
    +[UNUserNotificationServiceConnection sharedInstance](UNUserNotificationServiceConnection, "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __100___UNNotificationServiceExtensionRemoteContext_didReceiveNotificationRequest_withCompletionHandler___block_invoke_2;
    v23[3] = &unk_1E57EF960;
    v24 = v8;
    v25 = a1[6];
    v21 = v8;
    objc_msgSend(v20, "performBlockOnConnectionQueue:", v23);

  }
}

uint64_t __100___UNNotificationServiceExtensionRemoteContext_didReceiveNotificationRequest_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "addSecurityScope:", CFSTR("com.apple.app-sandbox.read-write"));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "removeSecurityScope");
}

void __100___UNNotificationServiceExtensionRemoteContext_didReceiveNotificationRequest_withCompletionHandler___block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t v15;

  v5 = OUTLINED_FUNCTION_3(a1, a2);
  objc_msgSend(v3, "_UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a3 + 40), "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "un_logDigest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1AA8E4000, v9, v10, "[%{public}@] Ignoring unsafe replacement content for notification request %{public}@", v11, v12, v13, v14, v15);

  OUTLINED_FUNCTION_1();
}

void __100___UNNotificationServiceExtensionRemoteContext_didReceiveNotificationRequest_withCompletionHandler___block_invoke_cold_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t v15;

  v5 = OUTLINED_FUNCTION_3(a1, a2);
  objc_msgSend(v3, "_UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a3 + 40), "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "un_logDigest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1AA8E4000, v9, v10, "[%{public}@] Ignoring additional replacement content replies for notification request %{public}@", v11, v12, v13, v14, v15);

  OUTLINED_FUNCTION_1();
}

@end

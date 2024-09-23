@implementation App

id __40___App_getGroupsFromNotificationStacks___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (objc_msgSend(v2, "count"))
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF91F8]), "initWithNotifications:useDigestOrder:", v2, 1);
  }
  else
  {
    __atxlog_handle_notification_management();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v6;
      _os_log_impl(&dword_1C9A3B000, v4, OS_LOG_TYPE_INFO, "[%@] Empty notification stack. Skipping.", (uint8_t *)&v8, 0xCu);

    }
    v3 = 0;
  }

  return v3;
}

id __19___App_setBundleId__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(v2, "bundleId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v2, "bundleId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __atxlog_handle_notification_management();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "groupId");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412546;
      v11 = v7;
      v12 = 2112;
      v13 = v8;
      _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_INFO, "[%@] Missing bundle ID for group with ID %@", (uint8_t *)&v10, 0x16u);

    }
    v4 = 0;
  }

  return v4;
}

uint64_t __46___App_setRankedGroupsFromNotificationGroups___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a2;
  objc_msgSend(a3, "appSpecifiedScore");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "appSpecifiedScore");
  v9 = v8;

  objc_msgSend(v7, "numberWithDouble:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "compare:", v10);

  return v11;
}

uint64_t __46___App_setRankedGroupsFromNotificationGroups___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isCommunicationGroup");
}

uint64_t __46___App_setRankedGroupsFromNotificationGroups___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isCommunicationGroup") ^ 1;
}

uint64_t __46___App_setRankedGroupsFromNotificationGroups___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasPreviewableAttachment");
}

uint64_t __46___App_setRankedGroupsFromNotificationGroups___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasPreviewableAttachment") ^ 1;
}

uint64_t __46___App_setRankedGroupsFromNotificationGroups___block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasPreviewableAttachment");
}

uint64_t __46___App_setRankedGroupsFromNotificationGroups___block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasPreviewableAttachment") ^ 1;
}

uint64_t __46___App_setRankedGroupsFromNotificationGroups___block_invoke_8(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "containsObject:", a2) ^ 1;
}

@end

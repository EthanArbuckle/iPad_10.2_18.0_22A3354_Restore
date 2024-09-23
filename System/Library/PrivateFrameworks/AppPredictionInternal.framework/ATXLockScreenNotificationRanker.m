@implementation ATXLockScreenNotificationRanker

+ (id)rankNotificationArrays:(id)a3 error:(id *)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  __atxlog_handle_notification_management();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    +[ATXLockScreenNotificationRanker rankNotificationArrays:error:].cold.1();

  if (v5 || !a4)
  {
    objc_msgSend(v5, "_pas_mappedArrayWithTransform:", &__block_literal_global_42_0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sortedArrayUsingComparator:", &__block_literal_global_45_0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "_pas_mappedArrayWithTransform:", &__block_literal_global_47_1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v8 = *MEMORY[0x1E0CB2FE0];
    v13 = *MEMORY[0x1E0CB2938];
    v14[0] = CFSTR("Missing notificationArrays argument");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, 22, v9);
    v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

ATXUserNotificationGroup *__64__ATXLockScreenNotificationRanker_rankNotificationArrays_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  ATXUserNotificationGroup *v3;

  v2 = a2;
  v3 = -[ATXUserNotificationGroup initWithNotifications:]([ATXUserNotificationGroup alloc], "initWithNotifications:", v2);

  return v3;
}

uint64_t __64__ATXLockScreenNotificationRanker_rankNotificationArrays_error___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

uint64_t __64__ATXLockScreenNotificationRanker_rankNotificationArrays_error___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "notifications");
}

+ (id)rankNewNotificationIntoNotificationArrays:(id)a3 newNotification:(id)a4 notificationArrayIndex:(unint64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  if (!v10)
  {
    if (!a6)
      goto LABEL_10;
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = *MEMORY[0x1E0CB2FE0];
    v25 = *MEMORY[0x1E0CB2938];
    v26[0] = CFSTR("Missing notificationArrays argument");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, 22, v16);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

LABEL_9:
    a6 = 0;
    goto LABEL_10;
  }
  if (objc_msgSend(v10, "count") <= a5)
  {
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("notificationArrayIndex=%ld is out of bounds for notificationArrays length=%ld"), a5, objc_msgSend(v10, "count"));
    v18 = (void *)v17;
    if (a6)
    {
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v20 = *MEMORY[0x1E0CB2FE0];
      v23 = *MEMORY[0x1E0CB2938];
      v24 = v17;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, 22, v21);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_9;
  }
  objc_msgSend(v10, "objectAtIndexedSubscript:", a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v10, "mutableCopy");
  objc_msgSend(v13, "removeObjectAtIndex:", a5);
  objc_msgSend(a1, "rankNewNotificationIntoNotificationArrays:newNotificationArray:newNotification:error:", v13, v12, v11, a6);
  a6 = (id *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return a6;
}

+ (id)rankNewNotificationIntoNotificationArrays:(id)a3 newNotificationArray:(id)a4 newNotification:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const __CFString **v16;
  uint64_t *v17;
  void *v18;
  void *v19;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  ATXUserNotificationGroup *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  const __CFString *v34;
  uint64_t v35;
  const __CFString *v36;
  uint64_t v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  __atxlog_handle_notification_management();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    +[ATXLockScreenNotificationRanker rankNewNotificationIntoNotificationArrays:newNotificationArray:newNotification:error:].cold.1();

  if (!v9 && a6)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0CB2FE0];
    v37 = *MEMORY[0x1E0CB2938];
    v38[0] = CFSTR("Missing notificationArrays argument");
    v15 = (void *)MEMORY[0x1E0C99D80];
    v16 = (const __CFString **)v38;
    v17 = &v37;
LABEL_9:
    objc_msgSend(v15, "dictionaryWithObjects:forKeys:count:", v16, v17, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 22, v18);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

    v19 = 0;
    goto LABEL_10;
  }
  if (!v11 && a6)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0CB2FE0];
    v35 = *MEMORY[0x1E0CB2938];
    v36 = CFSTR("Missing newNotification argument");
    v15 = (void *)MEMORY[0x1E0C99D80];
    v16 = &v36;
    v17 = &v35;
    goto LABEL_9;
  }
  if (v10 || !a6)
  {
    objc_msgSend(v10, "arrayByAddingObject:", v11);
    v23 = objc_claimAutoreleasedReturnValue();

    v24 = -[ATXUserNotificationGroup initWithNotifications:]([ATXUserNotificationGroup alloc], "initWithNotifications:", v23);
    objc_msgSend(v9, "_pas_mappedArrayWithTransform:", &__block_literal_global_55_0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "arrayByAddingObject:", v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "sortedArrayUsingComparator:", &__block_literal_global_56_1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = (void *)MEMORY[0x1E0D81638];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v27, "indexOfObject:", v24));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)MEMORY[0x1E0CB37E8];
    -[ATXUserNotificationGroup notifications](v24, "notifications");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "numberWithUnsignedInteger:", objc_msgSend(v31, "indexOfObject:", v11));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "tupleWithFirst:second:", v29, v32);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (id)v23;
  }
  else
  {
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v22 = *MEMORY[0x1E0CB2FE0];
    v33 = *MEMORY[0x1E0CB2938];
    v34 = CFSTR("Missing newNotificationArray argument");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", v22, 22, v10);
    v19 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_10:

  return v19;
}

ATXUserNotificationGroup *__120__ATXLockScreenNotificationRanker_rankNewNotificationIntoNotificationArrays_newNotificationArray_newNotification_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  ATXUserNotificationGroup *v3;

  v2 = a2;
  v3 = -[ATXUserNotificationGroup initWithNotifications:]([ATXUserNotificationGroup alloc], "initWithNotifications:", v2);

  return v3;
}

uint64_t __120__ATXLockScreenNotificationRanker_rankNewNotificationIntoNotificationArrays_newNotificationArray_newNotification_error___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

+ (void)rankNotificationArrays:error:.cold.1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)objc_opt_class();
  v1 = OUTLINED_FUNCTION_2_10(v0);
  OUTLINED_FUNCTION_6_0(&dword_1C9A3B000, v2, v3, "[%@] Generating lock screen notification ranking", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

+ (void)rankNewNotificationIntoNotificationArrays:newNotificationArray:newNotification:error:.cold.1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)objc_opt_class();
  v1 = OUTLINED_FUNCTION_2_10(v0);
  OUTLINED_FUNCTION_6_0(&dword_1C9A3B000, v2, v3, "[%@] Sorting newNotification into notificationArray", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

@end

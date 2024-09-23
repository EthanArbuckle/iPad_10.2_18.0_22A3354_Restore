@implementation CalDatabaseSanitizeLocalSubscribedCalendarInfosDictionary

void __CalDatabaseSanitizeLocalSubscribedCalendarInfosDictionary_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  const char *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *);
  void *v19;
  id v20;
  id v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = (void *)CDBLogHandle;
    if (!os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    v12 = v11;
    *(_DWORD *)buf = 138543362;
    v23 = (id)objc_opt_class();
    v13 = v23;
    v14 = "Entry in subscribed calendar info from backup Info.plist has wrong key type (%{public}@). Ignoring.";
LABEL_8:
    _os_log_impl(&dword_1A5CCB000, v12, OS_LOG_TYPE_ERROR, v14, buf, 0xCu);

    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v15 = (void *)CDBLogHandle;
    if (!os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    v12 = v15;
    *(_DWORD *)buf = 138543362;
    v23 = (id)objc_opt_class();
    v13 = v23;
    v14 = "Entry in subscribed calendar info from backup Info.plist has wrong value type (%{public}@). Ignoring.";
    goto LABEL_8;
  }
  v7 = (void *)MEMORY[0x1E0C99E08];
  v8 = v6;
  objc_msgSend(v7, "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __CalDatabaseSanitizeLocalSubscribedCalendarInfosDictionary_block_invoke_51;
  v19 = &unk_1E4F84DB0;
  v20 = *(id *)(a1 + 32);
  v21 = v9;
  v10 = v9;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", &v16);

  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v10, v5, v16, v17, v18, v19);
LABEL_9:

}

void __CalDatabaseSanitizeLocalSubscribedCalendarInfosDictionary_block_invoke_51(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  NSObject *v13;
  void *v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = (void *)CDBLogHandle;
    if (!os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    v8 = v7;
    v15 = 138543362;
    v16 = (id)objc_opt_class();
    v9 = v16;
    v10 = "Entry in subscribed calendar info inner dictionary from backup Info.plist has wrong key type (%{public}@). Ignoring.";
    v11 = v8;
    v12 = 12;
    goto LABEL_11;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5))
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v6, v5);
      goto LABEL_12;
    }
    v14 = (void *)CDBLogHandle;
    if (!os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    v8 = v14;
    v15 = 138543618;
    v16 = v5;
    v17 = 2114;
    v18 = (id)objc_opt_class();
    v9 = v18;
    v10 = "Entry in subscribed calendar info inner dictionary from backup Info.plist has wrong value type (key = %{public"
          "}@, type = %{public}@). Ignoring.";
    v11 = v8;
    v12 = 22;
LABEL_11:
    _os_log_impl(&dword_1A5CCB000, v11, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v15, v12);

    goto LABEL_12;
  }
  v13 = CDBLogHandle;
  if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
  {
    v15 = 138543362;
    v16 = v5;
    _os_log_impl(&dword_1A5CCB000, v13, OS_LOG_TYPE_ERROR, "Unexpected property (%{public}@) in subscribed calendar info inner dictionary from backup Info.plist. Ignoring.", (uint8_t *)&v15, 0xCu);
  }
LABEL_12:

}

@end

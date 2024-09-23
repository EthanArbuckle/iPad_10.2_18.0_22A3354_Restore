@implementation FCModifyShortcutCategoryListCommand

- (FCModifyShortcutCategoryListCommand)initWithShortcutCategories:(id)a3 merge:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  FCModifyShortcutCategoryListCommand *v10;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a4;
  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "fc_arrayByTransformingWithBlock:", &__block_literal_global_115);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)FCShortcutCategoryListLog;
  if (os_log_type_enabled((os_log_t)FCShortcutCategoryListLog, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    v12 = 134217984;
    v13 = objc_msgSend(v6, "count");
    _os_log_impl(&dword_1A1B90000, v9, OS_LOG_TYPE_DEFAULT, "Initialize shortcut categories count=%lu", (uint8_t *)&v12, 0xCu);

  }
  v10 = -[FCModifyRecordsCommand initWithLocalRecords:merge:](self, "initWithLocalRecords:merge:", v7, v4);

  return v10;
}

uint64_t __72__FCModifyShortcutCategoryListCommand_initWithShortcutCategories_merge___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "asCKRecord");
}

- (BOOL)mergeLocalRecord:(id)a3 withRemoteRecord:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _DWORD v16[2];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("dateAdded"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("dateAdded"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "compare:", v8);
  if (v9 == 1)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("dateAdded"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("dateAdded"));

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("type"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("type"));

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("categoryID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("categoryID"));

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("status"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, CFSTR("status"));

  }
  v14 = FCShortcutCategoryListLog;
  if (os_log_type_enabled((os_log_t)FCShortcutCategoryListLog, OS_LOG_TYPE_DEFAULT))
  {
    v16[0] = 67109120;
    v16[1] = v9 == 1;
    _os_log_impl(&dword_1A1B90000, v14, OS_LOG_TYPE_DEFAULT, "Merge shortcut categories local record %d", (uint8_t *)v16, 8u);
  }

  return v9 == 1;
}

@end

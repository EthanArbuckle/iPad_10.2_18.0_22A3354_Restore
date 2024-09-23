@implementation FCModifyShortcutsCommand

- (FCModifyShortcutsCommand)initWithShortcuts:(id)a3 merge:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  FCModifyShortcutsCommand *v10;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a4;
  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "fc_arrayByTransformingWithBlock:", &__block_literal_global_136);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)FCShortcutListLog;
  if (os_log_type_enabled((os_log_t)FCShortcutListLog, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    v12 = 134217984;
    v13 = objc_msgSend(v6, "count");
    _os_log_impl(&dword_1A1B90000, v9, OS_LOG_TYPE_DEFAULT, "Initialize favorites %lu", (uint8_t *)&v12, 0xCu);

  }
  v10 = -[FCModifyRecordsCommand initWithLocalRecords:merge:](self, "initWithLocalRecords:merge:", v7, v4);

  return v10;
}

uint64_t __52__FCModifyShortcutsCommand_initWithShortcuts_merge___block_invoke(uint64_t a1, void *a2)
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
  NSObject *v13;
  _DWORD v15[2];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
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

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("order"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("order"));

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("type"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("type"));

  }
  v13 = FCShortcutListLog;
  if (os_log_type_enabled((os_log_t)FCShortcutListLog, OS_LOG_TYPE_DEFAULT))
  {
    v15[0] = 67109120;
    v15[1] = v9 == 1;
    _os_log_impl(&dword_1A1B90000, v13, OS_LOG_TYPE_DEFAULT, "Merge favorites local record %d", (uint8_t *)v15, 8u);
  }

  return v9 == 1;
}

@end

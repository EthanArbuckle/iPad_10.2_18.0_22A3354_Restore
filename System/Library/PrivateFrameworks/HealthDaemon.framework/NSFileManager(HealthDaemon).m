@implementation NSFileManager(HealthDaemon)

- (uint64_t)hd_removeSQLiteDatabaseAtURL:()HealthDaemon preserveCopy:
{
  return -[NSFileManager _hd_removeDatabaseFilesAtDatabaseURL:extensionSuffixes:preserveCopy:](a1, a3, &unk_1E6DFA5B0, a4);
}

- (uint64_t)hd_removeHFDDatabaseAtURL:()HealthDaemon preserveCopy:
{
  return -[NSFileManager _hd_removeDatabaseFilesAtDatabaseURL:extensionSuffixes:preserveCopy:](a1, a3, &unk_1E6DFA5C8, a4);
}

- (uint64_t)hd_removeAllFilesAtDirectoryPath:()HealthDaemon error:
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  char v14;
  id v15;
  void *v16;
  NSObject *v17;
  id v18;
  char v19;
  _QWORD *v21;
  char v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(a1, "enumeratorAtPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (!v8)
  {
    v19 = 1;
LABEL_21:

    goto LABEL_22;
  }
  v9 = v8;
  v21 = a4;
  v10 = 0;
  v11 = *(_QWORD *)v25;
  v22 = 1;
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v25 != v11)
        objc_enumerationMutation(v7);
      objc_msgSend(v6, "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 0;
      v14 = objc_msgSend(a1, "removeItemAtPath:error:", v13, &v23);
      v15 = v23;
      v16 = v15;
      if ((v14 & 1) == 0)
      {
        if (!v10)
          v10 = v15;
        _HKInitializeLogging();
        v17 = *MEMORY[0x1E0CB52B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v29 = v13;
          v30 = 2114;
          v31 = v16;
          _os_log_error_impl(&dword_1B7802000, v17, OS_LOG_TYPE_ERROR, "Error removing file at '%{public}@': %{public}@", buf, 0x16u);
        }
        v22 = 0;
      }

    }
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  }
  while (v9);

  v18 = v10;
  if (v18)
  {
    v7 = v18;
    if (v21)
      *v21 = objc_retainAutorelease(v18);
    else
      _HKLogDroppedError();
    v19 = v22;

    goto LABEL_21;
  }
  v19 = v22;
LABEL_22:

  return v19 & 1;
}

@end

@implementation CalMigrationBackup

+ (BOOL)backupCalendarDirectory:(id)a3 intoArchiveNamed:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  char v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  char v20;
  id v21;
  BOOL v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByAppendingPathComponent:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "fileExistsAtPath:", v11);

  if (v12)
  {
    v31 = 0;
    v13 = objc_msgSend(v9, "removeItemAtURL:error:", v10, &v31);
    v14 = v31;
    if ((v13 & 1) == 0)
    {
      +[CalMigrationLog defaultCategory](CalMigrationLog, "defaultCategory");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        +[CalMigrationBackup backupCalendarDirectory:intoArchiveNamed:error:].cold.1(v10);

    }
  }
  objc_msgSend(v9, "temporaryDirectory");
  v16 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v16, "URLByAppendingPathComponent:", v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = 0;
  LOBYTE(v16) = objc_msgSend(v9, "archiveURLToFile:toFile:createPKZipArchive:error:", v7, v17, 1, &v30);
  v18 = v30;
  v19 = v18;
  if ((v16 & 1) != 0)
  {
    v29 = v18;
    v20 = objc_msgSend(v9, "moveItemAtURL:toURL:error:", v17, v10, &v29);
    v21 = v29;

    if ((v20 & 1) != 0)
    {
      v22 = 1;
      if (!a5)
        goto LABEL_18;
      goto LABEL_17;
    }
    +[CalMigrationLog defaultCategory](CalMigrationLog, "defaultCategory");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v17, "path");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "path");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v33 = v27;
      v34 = 2112;
      v35 = v28;
      v36 = 2112;
      v37 = v21;
      _os_log_error_impl(&dword_215A53000, v23, OS_LOG_TYPE_ERROR, "Failed to move backup archive %@ to %@. error = %@", buf, 0x20u);

    }
    v19 = v21;
  }
  else
  {
    +[CalMigrationLog defaultCategory](CalMigrationLog, "defaultCategory");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v17, "path");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "path");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v33 = v24;
      v34 = 2112;
      v35 = v25;
      v36 = 2112;
      v37 = v19;
      _os_log_error_impl(&dword_215A53000, v23, OS_LOG_TYPE_ERROR, "Failed to create backup archive %@ for calendar directory %@. error = %@", buf, 0x20u);

    }
  }

  v22 = 0;
  v21 = v19;
  if (a5)
LABEL_17:
    *a5 = objc_retainAutorelease(v21);
LABEL_18:

  return v22;
}

+ (BOOL)shouldBackupCalendarDirectory:(id)a3 withPrivacySafePathProvider:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  BOOL v20;
  NSObject *v21;
  id v23;
  id v24;
  void *v25;
  NSObject *obj;
  uint64_t v27;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[4];
  id v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;
  uint8_t buf[4];
  unint64_t v42;
  uint8_t v43[24];
  _BYTE v44[128];
  _QWORD v45[3];

  v45[1] = *MEMORY[0x24BDAC8D0];
  v24 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0;
  v27 = *MEMORY[0x24BDBCC48];
  v45[0] = *MEMORY[0x24BDBCC48];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v45, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __80__CalMigrationBackup_shouldBackupCalendarDirectory_withPrivacySafePathProvider___block_invoke;
  v34[3] = &unk_24D3F4C80;
  v23 = v5;
  v35 = v23;
  v36 = &v37;
  objc_msgSend(v25, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v24, v6, 0, v34);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v7;
  v8 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v30, v44, 16);
  if (v8)
  {
    v9 = 0;
    v10 = 0;
    v11 = *(_QWORD *)v31;
    while (2)
    {
      v12 = 0;
      v13 = v10;
      do
      {
        if (*(_QWORD *)v31 != v11)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v12);
        v28 = 0;
        v29 = 0;
        v15 = objc_msgSend(v14, "getResourceValue:forKey:error:", &v29, v27, &v28);
        v16 = v29;
        v10 = v28;

        if ((v15 & 1) == 0)
        {
          +[CalMigrationLog defaultCategory](CalMigrationLog, "defaultCategory");
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v23, "privacySafePathForURLInCalendarDirectory:", v14);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            +[CalMigrationBackup shouldBackupCalendarDirectory:withPrivacySafePathProvider:].cold.1(v18, (uint64_t)v10, v43, v17);
          }

          *((_BYTE *)v38 + 24) = 1;
          goto LABEL_15;
        }
        v9 += objc_msgSend(v16, "unsignedLongLongValue");
        if (v9 > 0x6400000)
        {
          +[CalMigrationLog defaultCategory](CalMigrationLog, "defaultCategory");
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v43 = 0;
            _os_log_impl(&dword_215A53000, v21, OS_LOG_TYPE_DEFAULT, "Calendar directory is too big. Will not create a backup!", v43, 2u);
          }

          v20 = 0;
          v19 = obj;
          goto LABEL_25;
        }

        ++v12;
        v13 = v10;
      }
      while (v8 != v12);
      v8 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v30, v44, 16);
      if (v8)
        continue;
      break;
    }
  }
  else
  {
    v10 = 0;
    v9 = 0;
  }
LABEL_15:

  if (*((_BYTE *)v38 + 24))
  {
    +[CalMigrationLog defaultCategory](CalMigrationLog, "defaultCategory");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215A53000, v19, OS_LOG_TYPE_DEFAULT, "Failed to get total size of calendar directory. Will not create a backup!", buf, 2u);
    }
    v20 = 0;
  }
  else
  {
    +[CalMigrationLog defaultCategory](CalMigrationLog, "defaultCategory");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v42 = v9;
      _os_log_impl(&dword_215A53000, v19, OS_LOG_TYPE_DEFAULT, "Calendar directory is %llu bytes. Will create a backup", buf, 0xCu);
    }
    v20 = 1;
  }
LABEL_25:

  _Block_object_dispose(&v37, 8);
  return v20;
}

uint64_t __80__CalMigrationBackup_shouldBackupCalendarDirectory_withPrivacySafePathProvider___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  +[CalMigrationLog defaultCategory](CalMigrationLog, "defaultCategory");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "privacySafePathForURLInCalendarDirectory:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v9;
    v12 = 2112;
    v13 = v6;
    _os_log_error_impl(&dword_215A53000, v7, OS_LOG_TYPE_ERROR, "Error enumerating calendar directory at URL %{public}@: %@", (uint8_t *)&v10, 0x16u);

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;

  return 0;
}

+ (BOOL)removeExistingBackupWithArchiveName:(id)a3 inCalendarDirectory:(id)a4 error:(id *)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  NSObject *v15;
  id v17;

  v7 = (void *)MEMORY[0x24BDD1580];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLByAppendingPathComponent:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "path");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v10, "fileExistsAtPath:", v12);

  if ((_DWORD)v9)
  {
    v17 = 0;
    v13 = objc_msgSend(v10, "removeItemAtURL:error:", v11, &v17);
    v14 = v17;
    if ((v13 & 1) == 0)
    {
      +[CalMigrationLog reminders](CalMigrationLog, "reminders");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        +[CalMigrationBackup backupCalendarDirectory:intoArchiveNamed:error:].cold.1(v11);

      if (a5)
        *a5 = objc_retainAutorelease(v14);
    }

  }
  else
  {
    v13 = 1;
  }

  return v13;
}

+ (void)backupCalendarDirectory:(void *)a1 intoArchiveNamed:error:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_215A53000, v2, v3, "Failed to delete existing backup file %@. error = %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

+ (void)shouldBackupCalendarDirectory:(uint8_t *)buf withPrivacySafePathProvider:(os_log_t)log .cold.1(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_215A53000, log, OS_LOG_TYPE_ERROR, "Failed to get file size of URL %{public}@: %@", buf, 0x16u);

}

@end

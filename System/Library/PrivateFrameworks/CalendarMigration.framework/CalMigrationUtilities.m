@implementation CalMigrationUtilities

+ (id)validatedCalendarDirectoryForHomeDirectory:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  __int16 v12;
  __int16 v13;
  char v14;

  objc_msgSend(a1, "calendarDirectoryForHomeDirectory:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "fileExistsAtPath:isDirectory:", v5, &v14);

  if ((v6 & 1) == 0)
  {
    +[CalMigrationLog defaultCategory](CalMigrationLog, "defaultCategory");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 0;
      v9 = "User home directory has no calendar directory.";
      v10 = (uint8_t *)&v13;
LABEL_8:
      _os_log_impl(&dword_215A53000, v8, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
    }
LABEL_9:

    v7 = 0;
    goto LABEL_10;
  }
  if (!v14)
  {
    +[CalMigrationLog defaultCategory](CalMigrationLog, "defaultCategory");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 0;
      v9 = "Calendar directory is a file instead of a folder.";
      v10 = (uint8_t *)&v12;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v7 = v3;
LABEL_10:

  return v7;
}

+ (id)homeRelativePathForURL:(id)a3 inCalendarDirectory:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  uint64_t v19;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v23;

  v5 = a3;
  if (v5)
  {
    objc_msgSend(a4, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByStandardizingPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByStandardizingPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "pathComponents");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pathComponents");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");
    if (v12 >= objc_msgSend(v10, "count"))
    {
      if (!objc_msgSend(v10, "count"))
      {
LABEL_10:
        v19 = objc_msgSend(v11, "count");
        if (v19 != objc_msgSend(v10, "count"))
        {
          objc_msgSend(v11, "subarrayWithRange:", objc_msgSend(v10, "count"), objc_msgSend(v11, "count") - objc_msgSend(v10, "count"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(CFSTR("Library/Calendar"), "pathComponents");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "arrayByAddingObjectsFromArray:", v21);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "pathWithComponents:", v23);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_17:
          goto LABEL_18;
        }
        v20 = CFSTR("Library/Calendar");
LABEL_16:
        v14 = v20;
        goto LABEL_17;
      }
      v15 = 0;
      while (1)
      {
        objc_msgSend(v11, "objectAtIndexedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectAtIndexedSubscript:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v16, "isEqualToString:", v17);

        if ((v18 & 1) == 0)
          break;
        if (++v15 == objc_msgSend(v10, "count"))
          goto LABEL_10;
      }
      +[CalMigrationLog defaultCategory](CalMigrationLog, "defaultCategory");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        goto LABEL_14;
    }
    else
    {
      +[CalMigrationLog defaultCategory](CalMigrationLog, "defaultCategory");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
LABEL_14:
        +[CalMigrationUtilities homeRelativePathForURL:inCalendarDirectory:].cold.1();
    }

    v20 = v9;
    goto LABEL_16;
  }
  v14 = 0;
LABEL_18:

  return v14;
}

+ (id)subdirectoriesInDirectory:(id)a3 withPrivacySafePathProvider:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v25;
  id v26;
  id v27;
  char v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v27 = a4;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v7, 0, 0, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v23 = 0;
    goto LABEL_17;
  }
  v26 = v7;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v25 = v9;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (!v12)
    goto LABEL_15;
  v13 = v12;
  v14 = *(_QWORD *)v30;
  do
  {
    for (i = 0; i != v13; ++i)
    {
      if (*(_QWORD *)v30 != v14)
        objc_enumerationMutation(v11);
      v16 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
      objc_msgSend(v16, "path", v25);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringByStandardizingPath");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v28 = 0;
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "fileExistsAtPath:isDirectory:", v18, &v28);

      if ((v20 & 1) != 0)
      {
        if (!v28)
          goto LABEL_13;
        objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v18);
        v21 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v21);
      }
      else
      {
        +[CalMigrationLog defaultCategory](CalMigrationLog, "defaultCategory");
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
        {
          objc_msgSend(v27, "privacySafePathForURLInCalendarDirectory:", v16);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v34 = v22;
          _os_log_fault_impl(&dword_215A53000, v21, OS_LOG_TYPE_FAULT, "File %{public}@ doesn't exist right after we found it by listing its parent directory.", buf, 0xCu);

        }
      }

LABEL_13:
    }
    v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  }
  while (v13);
LABEL_15:

  v23 = (void *)objc_msgSend(v10, "copy");
  v9 = v25;
  v7 = v26;
LABEL_17:

  return v23;
}

+ (id)calendarDirectoryForHomeDirectory:(id)a3
{
  return (id)objc_msgSend(a3, "URLByAppendingPathComponent:", CFSTR("Library/Calendar"));
}

+ (void)enumerateSelfAndDetachedEventsWithEvent:(void *)a3 usingBlock:(id)a4
{
  void (**v5)(id, void *, void *, _BYTE *);
  void *v6;
  void (**v7)(id, void *, void *, _BYTE *);
  _QWORD v8[4];
  id v9;
  char v10;

  v5 = (void (**)(id, void *, void *, _BYTE *))a4;
  v10 = 0;
  v5[2](v5, a3, a3, &v10);
  v6 = (void *)CalEventCopyDetachedEvents();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __76__CalMigrationUtilities_enumerateSelfAndDetachedEventsWithEvent_usingBlock___block_invoke;
  v8[3] = &unk_24D3F4A48;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "enumerateCalEventRefsUsingBlock:", v8);

}

uint64_t __76__CalMigrationUtilities_enumerateSelfAndDetachedEventsWithEvent_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)clearPreviousMigrationResultsWithDatabaseFileURL:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "path");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingString:", CFSTR("-shm"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingString:", CFSTR("-wal"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeItemAtPath:error:", v6, 0);
  objc_msgSend(v5, "removeItemAtPath:error:", v3, 0);
  objc_msgSend(v5, "removeItemAtPath:error:", v4, 0);

}

+ (void)homeRelativePathForURL:inCalendarDirectory:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_215A53000, v0, v1, "Invalid URL (not in the calendar directory) given to _homeRelativePathForURL:inCalendarDirectory: url = %@, calendarDirectory = %@");
}

@end

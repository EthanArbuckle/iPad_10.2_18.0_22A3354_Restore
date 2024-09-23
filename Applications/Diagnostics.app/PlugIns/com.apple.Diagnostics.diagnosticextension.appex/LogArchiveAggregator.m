@implementation LogArchiveAggregator

+ (void)addLogTypes:(unint64_t)a3 archive:(id *)a4 prefix:(id)a5
{
  char v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;

  v6 = a3;
  v7 = (__CFString *)a5;
  v9 = v7;
  if (v7)
    v8 = v7;
  else
    v8 = &stru_1000042B8;
  objc_storeStrong((id *)&qword_100008300, v8);
  if ((v6 & 2) != 0)
  {
    +[LogArchiveAggregator _addRootGeneralLogFilesToArchive:](LogArchiveAggregator, "_addRootGeneralLogFilesToArchive:", a4);
    if ((v6 & 4) == 0)
    {
LABEL_6:
      if ((v6 & 8) == 0)
        goto LABEL_7;
      goto LABEL_15;
    }
  }
  else if ((v6 & 4) == 0)
  {
    goto LABEL_6;
  }
  +[LogArchiveAggregator _addMobileGeneralLogFilesToArchive:](LogArchiveAggregator, "_addMobileGeneralLogFilesToArchive:", a4);
  if ((v6 & 8) == 0)
  {
LABEL_7:
    if ((v6 & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_16;
  }
LABEL_15:
  +[LogArchiveAggregator _addAWDLogFilesToArchive:](LogArchiveAggregator, "_addAWDLogFilesToArchive:", a4);
  if ((v6 & 0x10) == 0)
  {
LABEL_8:
    if ((v6 & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_17;
  }
LABEL_16:
  +[LogArchiveAggregator _addCrashLogFilesToArchive:](LogArchiveAggregator, "_addCrashLogFilesToArchive:", a4);
  if ((v6 & 0x20) == 0)
  {
LABEL_9:
    if ((v6 & 0x40) == 0)
      goto LABEL_10;
LABEL_18:
    +[LogArchiveAggregator _addPowerLogFilesToArchive:](LogArchiveAggregator, "_addPowerLogFilesToArchive:", a4);
    if ((v6 & 0x80) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_17:
  +[LogArchiveAggregator _addLaunchdLogFilesToArchive:](LogArchiveAggregator, "_addLaunchdLogFilesToArchive:", a4);
  if ((v6 & 0x40) != 0)
    goto LABEL_18;
LABEL_10:
  if (v6 < 0)
LABEL_11:
    +[LogArchiveAggregator _addEnhancedLoggingStateFilesToArchive:](LogArchiveAggregator, "_addEnhancedLoggingStateFilesToArchive:", a4);
LABEL_12:

}

+ (void)_addRootGeneralLogFilesToArchive:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("/private/var/logs/AppleSupport")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("lastPathComponent BEGINSWITH 'general' AND lastPathComponent ENDSWITH '.log'")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v5, &__NSArray0__struct, 1, 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "filteredArrayUsingPredicate:", v6));
  objc_msgSend(v9, "addObjectsFromArray:", v8);

  +[LogArchiveAggregator _addFiles:archive:lastPathComponent:](LogArchiveAggregator, "_addFiles:archive:lastPathComponent:", v9, a3, CFSTR("root"));
}

+ (void)_addMobileGeneralLogFilesToArchive:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("/private/var/mobile/Library/Logs/AppleSupport")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("lastPathComponent BEGINSWITH 'general' AND lastPathComponent ENDSWITH '.log'")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v5, &__NSArray0__struct, 1, 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "filteredArrayUsingPredicate:", v6));
  objc_msgSend(v9, "addObjectsFromArray:", v8);

  +[LogArchiveAggregator _addFiles:archive:lastPathComponent:](LogArchiveAggregator, "_addFiles:archive:lastPathComponent:", v9, a3, CFSTR("mobile"));
}

+ (void)_addAWDLogFilesToArchive:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("/private/var/wireless/awdd")));
  v6 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));
  +[LogArchiveAggregator _addFiles:archive:lastPathComponent:](LogArchiveAggregator, "_addFiles:archive:lastPathComponent:", v5, a3, CFSTR("AWD"));

}

+ (void)_addCrashLogFilesToArchive:(id *)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v21 = objc_msgSend(&off_1000046B8, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v21)
  {
    v20 = *(_QWORD *)v28;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v28 != v20)
          objc_enumerationMutation(&off_1000046B8);
        v22 = v4;
        v5 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v4);
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v6 = objc_msgSend(&off_1000046D0, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v6)
        {
          v7 = v6;
          v8 = *(_QWORD *)v24;
          do
          {
            v9 = 0;
            do
            {
              if (*(_QWORD *)v24 != v8)
                objc_enumerationMutation(&off_1000046D0);
              v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v9), "stringByAppendingString:", v5));
              v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("lastPathComponent BEGINSWITH '%@'"), v10));
              objc_msgSend(v3, "addObject:", v11);

              v9 = (char *)v9 + 1;
            }
            while (v7 != v9);
            v7 = objc_msgSend(&off_1000046D0, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          }
          while (v7);
        }
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("lastPathComponent BEGINSWITH '%@'"), v5));
        objc_msgSend(v3, "addObject:", v12);

        v4 = v22 + 1;
      }
      while ((id)(v22 + 1) != v21);
      v21 = objc_msgSend(&off_1000046B8, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v21);
  }
  objc_msgSend(v3, "addObject:", CFSTR("lastPathComponent BEGINSWITH 'JetsamEvent-'"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsJoinedByString:", CFSTR(" OR ")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("/private/var/mobile/Library/Logs/CrashReporter")));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v14, &__NSArray0__struct, 1, 0));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", v13));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "filteredArrayUsingPredicate:", v16));

  +[LogArchiveAggregator _addFiles:archive:lastPathComponent:](LogArchiveAggregator, "_addFiles:archive:lastPathComponent:", v17, a3, 0);
}

+ (void)_addLaunchdLogFilesToArchive:(id *)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("/private/var/log/com.apple.xpc.launchd")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v4, &__NSArray0__struct, 1, 0));
  +[LogArchiveAggregator _addFiles:archive:lastPathComponent:](LogArchiveAggregator, "_addFiles:archive:lastPathComponent:", v5, a3, CFSTR("launchd"));

}

+ (void)_addPowerLogFilesToArchive:(id *)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  v17 = 0;
  v4 = container_system_group_path_for_identifier(0, "systemgroup.com.apple.powerlog", &v17);
  if (v4)
  {
    v5 = (void *)v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v4, 4));
    free(v5);
    if (!v6)
      return;
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("Library")));

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v7));
    v18 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
    +[LogArchiveAggregator _addFiles:archive:lastPathComponent:](LogArchiveAggregator, "_addFiles:archive:lastPathComponent:", v9, a3, CFSTR("powerlog"));

  }
  else
  {
    v10 = DiagnosticLogHandleForCategory(10);
    v7 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_100002EB4((uint64_t)&v17, v7, v11, v12, v13, v14, v15, v16);
  }

}

+ (void)_addEnhancedLoggingStateFilesToArchive:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  id v36;
  NSObject *v37;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ELSManager sharedManager](ELSManager, "sharedManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "snapshot"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "JSONObject"));

  if (v6)
  {
    v7 = NSTemporaryDirectory();
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v8));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "URLByAppendingPathComponent:", CFSTR("enhanced-logging-state.json")));

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject path](v10, "path"));
    v13 = objc_msgSend(v11, "fileExistsAtPath:", v12);

    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject path](v10, "path"));
      v36 = 0;
      objc_msgSend(v14, "removeItemAtPath:error:", v15, &v36);
      v16 = v36;

      if (v16)
      {
        v17 = DiagnosticLogHandleForCategory(10);
        v18 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          sub_100002FC0((uint64_t)v16, v18, v19, v20, v21, v22, v23, v24);

      }
    }
    else
    {
      v16 = 0;
    }
    v35 = v16;
    objc_msgSend(v6, "writeToURL:options:error:", v10, 1, &v35);
    v26 = v35;

    if (v26)
    {
      v27 = DiagnosticLogHandleForCategory(10);
      v28 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        sub_100002F5C((uint64_t)v26, v28, v29, v30, v31, v32, v33, v34);
    }
    else
    {
      v37 = v10;
      v28 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v37, 1));
      +[LogArchiveAggregator _addFiles:archive:lastPathComponent:](LogArchiveAggregator, "_addFiles:archive:lastPathComponent:", v28, a3, 0);
    }

  }
  else
  {
    v25 = DiagnosticLogHandleForCategory(10);
    v10 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_100002F1C(v10);
  }

}

+ (void)_addFiles:(id)a3 archive:(id *)a4 lastPathComponent:(id)a5
{
  id v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v7 = a3;
  v8 = (__CFString *)a5;
  v9 = v8;
  v10 = &stru_1000042B8;
  if (v8)
    v10 = v8;
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100008300, "stringByAppendingPathComponent:", v11));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v13 = v7;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v19;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*a4, "addURL:prefix:error:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v17), v12, 0, (_QWORD)v18);
        v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v15);
  }

}

@end

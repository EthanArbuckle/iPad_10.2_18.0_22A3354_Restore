@implementation DSGeneralLogCollector

+ (id)latestUserLog
{
  void *v2;
  DSGeneralLogFile *v3;
  void *v4;
  DSGeneralLogFile *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/var/mobile/Library/Logs/AppleSupport"), "stringByAppendingPathComponent:", CFSTR("general.log")));
  v3 = [DSGeneralLogFile alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v2));
  v5 = -[DSGeneralLogFile initWithURL:](v3, "initWithURL:", v4);

  return v5;
}

+ (id)latestRootLog
{
  void *v2;
  DSGeneralLogFile *v3;
  void *v4;
  DSGeneralLogFile *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/var/logs/AppleSupport"), "stringByAppendingPathComponent:", CFSTR("general.log")));
  v3 = [DSGeneralLogFile alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v2));
  v5 = -[DSGeneralLogFile initWithURL:](v3, "initWithURL:", v4);

  return v5;
}

- (DSGeneralLogCollector)initWithLogIDs:(id)a3
{
  id v5;
  DSGeneralLogCollector *v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DSGeneralLogCollector;
  v6 = -[DSGeneralLogCollector init](&v12, "init");
  if (!v5)
    goto LABEL_7;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  if (objc_msgSend(v5, "isEqual:", v7))
  {

LABEL_7:
    v9 = DiagnosticLogHandleForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[DSGeneralLogCollector initWithLogIDs:].cold.1(v10);

    v6 = 0;
    goto LABEL_10;
  }
  v8 = objc_msgSend(v5, "count");

  if (!v8)
    goto LABEL_7;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_logIDs, a3);
    -[DSGeneralLogCollector getLogFiles](v6, "getLogFiles");
  }
LABEL_10:

  return v6;
}

- (void)getLogFiles
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSArray *v14;
  NSArray *logFiles;
  void *v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("/private/var/logs/AppleSupport")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v5, 0, 4, 0));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DSGeneralLogCollector logFilesFromEnumerator:](self, "logFilesFromEnumerator:", v6));
  objc_msgSend(v3, "addObjectsFromArray:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("/private/var/mobile/Library/Logs/AppleSupport")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v9, 0, 4, 0));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DSGeneralLogCollector logFilesFromEnumerator:](self, "logFilesFromEnumerator:", v10));
  objc_msgSend(v3, "addObjectsFromArray:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("logStartDate"), 1));
  v16 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1));
  v14 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sortedArrayUsingDescriptors:", v13));
  logFiles = self->_logFiles;
  self->_logFiles = v14;

}

- (id)logFilesFromEnumerator:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  DSGeneralLogFile *v11;
  DSGeneralLogFile *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v9);
        v11 = [DSGeneralLogFile alloc];
        v12 = -[DSGeneralLogFile initWithURL:](v11, "initWithURL:", v10, (_QWORD)v14);
        if (v12)
          objc_msgSend(v4, "addObject:", v12);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)enumerateLogLinesWithBlock:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  void *v21;

  v4 = a3;
  v5 = DiagnosticLogHandleForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DSGeneralLogCollector logIDs](self, "logIDs"));
    *(_DWORD *)buf = 138412290;
    v21 = v7;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Requesting log lines for: %@", buf, 0xCu);

  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DSGeneralLogCollector logFiles](self, "logFiles", 0));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
LABEL_5:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[DSGeneralLogCollector logIDs](self, "logIDs"));
      LOBYTE(v13) = objc_msgSend(v13, "enumerateLogLinesWithIDs:usingBlock:", v14, v4);

      if ((v13 & 1) != 0)
        break;
      if (v10 == (id)++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v10)
          goto LABEL_5;
        break;
      }
    }
  }

}

- (NSArray)logFiles
{
  return self->_logFiles;
}

- (void)setLogFiles:(id)a3
{
  objc_storeStrong((id *)&self->_logFiles, a3);
}

- (NSDictionary)friendlyAppNamesDictionary
{
  return self->_friendlyAppNamesDictionary;
}

- (void)setFriendlyAppNamesDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_friendlyAppNamesDictionary, a3);
}

- (NSArray)logIDs
{
  return self->_logIDs;
}

- (void)setLogIDs:(id)a3
{
  objc_storeStrong((id *)&self->_logIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logIDs, 0);
  objc_storeStrong((id *)&self->_friendlyAppNamesDictionary, 0);
  objc_storeStrong((id *)&self->_logFiles, 0);
}

- (void)initWithLogIDs:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "logIDs must contain values", v1, 2u);
}

@end

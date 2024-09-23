@implementation DSGeneralLogCollector

+ (id)latestUserLog
{
  void *v2;
  DSGeneralLogFile *v3;
  void *v4;
  DSGeneralLogFile *v5;

  objc_msgSend(CFSTR("/private/var/mobile/Library/Logs/AppleSupport"), "stringByAppendingPathComponent:", CFSTR("general.log"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = [DSGeneralLogFile alloc];
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[DSGeneralLogFile initWithURL:](v3, "initWithURL:", v4);

  return v5;
}

+ (id)latestRootLog
{
  void *v2;
  DSGeneralLogFile *v3;
  void *v4;
  DSGeneralLogFile *v5;

  objc_msgSend(CFSTR("/private/var/logs/AppleSupport"), "stringByAppendingPathComponent:", CFSTR("general.log"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = [DSGeneralLogFile alloc];
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[DSGeneralLogFile initWithURL:](v3, "initWithURL:", v4);

  return v5;
}

- (DSGeneralLogCollector)initWithLogIDs:(id)a3
{
  id v5;
  DSGeneralLogCollector *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DSGeneralLogCollector;
  v6 = -[DSGeneralLogCollector init](&v11, sel_init);
  if (!v5)
    goto LABEL_7;
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", v7))
  {

LABEL_7:
    DiagnosticLogHandleForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[DSGeneralLogCollector initWithLogIDs:].cold.1(v9);

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
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("/private/var/logs/AppleSupport"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v5, 0, 4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[DSGeneralLogCollector logFilesFromEnumerator:](self, "logFilesFromEnumerator:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v7);

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("/private/var/mobile/Library/Logs/AppleSupport"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v9, 0, 4, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[DSGeneralLogCollector logFilesFromEnumerator:](self, "logFilesFromEnumerator:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v11);

  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("logStartDate"), 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingDescriptors:", v13);
  v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
  logFiles = self->_logFiles;
  self->_logFiles = v14;

}

- (id)logFilesFromEnumerator:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  DSGeneralLogFile *v11;
  DSGeneralLogFile *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
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
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        v11 = [DSGeneralLogFile alloc];
        v12 = -[DSGeneralLogFile initWithURL:](v11, "initWithURL:", v10, (_QWORD)v14);
        if (v12)
          objc_msgSend(v4, "addObject:", v12);

        ++v9;
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
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  DiagnosticLogHandleForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[DSGeneralLogCollector logIDs](self, "logIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v20 = v6;
    _os_log_impl(&dword_21F54F000, v5, OS_LOG_TYPE_DEFAULT, "Requesting log lines for: %@", buf, 0xCu);

  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[DSGeneralLogCollector logFiles](self, "logFiles", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
LABEL_5:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v10)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v11);
      -[DSGeneralLogCollector logIDs](self, "logIDs");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v12) = objc_msgSend(v12, "enumerateLogLinesWithIDs:usingBlock:", v13, v4);

      if ((v12 & 1) != 0)
        break;
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v9)
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
  _os_log_error_impl(&dword_21F54F000, log, OS_LOG_TYPE_ERROR, "logIDs must contain values", v1, 2u);
}

@end

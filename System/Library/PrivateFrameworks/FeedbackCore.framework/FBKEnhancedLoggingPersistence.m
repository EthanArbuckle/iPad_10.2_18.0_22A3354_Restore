@implementation FBKEnhancedLoggingPersistence

+ (FBKEnhancedLoggingPersistence)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_19);
  return (FBKEnhancedLoggingPersistence *)(id)sharedInstance_instance;
}

void __47__FBKEnhancedLoggingPersistence_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_instance;
  sharedInstance_instance = v0;

}

- (FBKEnhancedLoggingPersistence)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FBKEnhancedLoggingPersistence;
  return -[FBKEnhancedLoggingPersistence init](&v3, sel_init);
}

- (void)saveSessionForContentItem:(id)a3 followup:(id)a4 filePredicate:(id)a5 devices:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  FBKEnhancedLoggingSessionInformation *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = -[FBKEnhancedLoggingSessionInformation initWithContentItem:followup:filePredicate:devices:]([FBKEnhancedLoggingSessionInformation alloc], "initWithContentItem:followup:filePredicate:devices:", v13, v12, v11, v10);

  -[FBKEnhancedLoggingPersistence saveSession:](self, "saveSession:", v14);
}

- (void)saveSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;

  v4 = a3;
  -[FBKEnhancedLoggingPersistence mutableSessionDictionary](self, "mutableSessionDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v18);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    +[FBKLog model](FBKLog, "model");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[FBKEnhancedLoggingPersistence saveSession:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
  }
  else
  {
    objc_msgSend(v4, "feedbackID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringValue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, v16);

    +[FBKSharedConstants sharedUserDefaults](FBKSharedConstants, "sharedUserDefaults");
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKey:](v7, "setObject:forKey:", v17, CFSTR("EnhancedLoggingSessions"));

  }
}

- (void)deleteSession:(id)a3
{
  id v4;

  objc_msgSend(a3, "feedbackID");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[FBKEnhancedLoggingPersistence deleteSessionWithFeedbackID:](self, "deleteSessionWithFeedbackID:", v4);

}

- (void)deleteSessionWithFeedbackID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[FBKEnhancedLoggingPersistence mutableSessionDictionary](self, "mutableSessionDictionary");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "removeObjectForKey:", v5);
  +[FBKSharedConstants sharedUserDefaults](FBKSharedConstants, "sharedUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("EnhancedLoggingSessions"));

}

- (id)deserializeSessionData:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v16;

  v3 = (void *)MEMORY[0x24BDD1620];
  v4 = a3;
  v16 = 0;
  objc_msgSend(v3, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v4, &v16);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    +[FBKLog model](FBKLog, "model");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[FBKEnhancedLoggingPersistence deserializeSessionData:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

    v14 = 0;
  }
  else
  {
    v14 = v5;
  }

  return v14;
}

- (id)mutableSessionDictionary
{
  void *v2;
  void *v3;
  void *v4;

  +[FBKSharedConstants sharedUserDefaults](FBKSharedConstants, "sharedUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryForKey:", CFSTR("EnhancedLoggingSessions"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v3);
  else
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSArray)sessions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  +[FBKSharedConstants sharedUserDefaults](FBKSharedConstants, "sharedUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryForKey:", CFSTR("EnhancedLoggingSessions"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v4, "allKeys", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v4, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          -[FBKEnhancedLoggingPersistence deserializeSessionData:](self, "deserializeSessionData:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
            objc_msgSend(v5, "addObject:", v12);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v13;
}

- (NSArray)items
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[FBKEnhancedLoggingPersistence sessions](self, "sessions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "contentItem", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v10;
}

- (int64_t)loggingSessionCount
{
  void *v2;
  void *v3;
  int64_t v4;

  +[FBKSharedConstants sharedUserDefaults](FBKSharedConstants, "sharedUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryForKey:", CFSTR("EnhancedLoggingSessions"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "count");
  return v4;
}

- (BOOL)hasLoggingSessions
{
  return -[FBKEnhancedLoggingPersistence loggingSessionCount](self, "loggingSessionCount") > 0;
}

- (NSString)searchText
{
  return self->_searchText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchText, 0);
}

- (void)saveSession:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21D9A9000, a1, a3, "Failed to archive enhanced logging session", a5, a6, a7, a8, 0);
}

- (void)deserializeSessionData:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21D9A9000, a1, a3, "Failed to unarchive enhanced logging session", a5, a6, a7, a8, 0);
}

@end

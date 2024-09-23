@implementation SFAnalyticsSQLiteStore

- (int64_t)hardFailureCountForEventType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[SFAnalyticsSQLiteStore tryToOpenDatabase](self, "tryToOpenDatabase"))
  {
    v13[0] = CFSTR("hard_failure_count");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSQLite select:from:where:bindings:](self, "select:from:where:bindings:", v5, CFSTR("success_count"), CFSTR("event_type = ?"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "valueForKey:", CFSTR("hard_failure_count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "integerValue");

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)incrementHardFailureCountForEventType:(id)a3
{
  id v4;
  int64_t v5;
  int64_t v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  _QWORD v13[5];

  v13[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[SFAnalyticsSQLiteStore tryToOpenDatabase](self, "tryToOpenDatabase"))
  {
    v5 = -[SFAnalyticsSQLiteStore successCountForEventType:](self, "successCountForEventType:", v4);
    v6 = -[SFAnalyticsSQLiteStore hardFailureCountForEventType:](self, "hardFailureCountForEventType:", v4);
    v7 = -[SFAnalyticsSQLiteStore softFailureCountForEventType:](self, "softFailureCountForEventType:", v4);
    v13[0] = v4;
    v12[0] = CFSTR("event_type");
    v12[1] = CFSTR("success_count");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = v8;
    v12[2] = CFSTR("hard_failure_count");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6 + 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2] = v9;
    v12[3] = CFSTR("soft_failure_count");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[3] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSQLite insertOrReplaceInto:values:](self, "insertOrReplaceInto:values:", CFSTR("success_count"), v11);

  }
}

- (int64_t)successCountForEventType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[SFAnalyticsSQLiteStore tryToOpenDatabase](self, "tryToOpenDatabase"))
  {
    v13[0] = CFSTR("success_count");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSQLite select:from:where:bindings:](self, "select:from:where:bindings:", v5, CFSTR("success_count"), CFSTR("event_type = ?"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "valueForKey:", CFSTR("success_count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "integerValue");

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (int64_t)softFailureCountForEventType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[SFAnalyticsSQLiteStore tryToOpenDatabase](self, "tryToOpenDatabase"))
  {
    v13[0] = CFSTR("soft_failure_count");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSQLite select:from:where:bindings:](self, "select:from:where:bindings:", v5, CFSTR("success_count"), CFSTR("event_type = ?"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "valueForKey:", CFSTR("soft_failure_count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "integerValue");

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)addEventDict:(id)a3 toTable:(id)a4 timestampBucket:(unsigned int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  _QWORD v21[2];
  _QWORD v22[3];

  v5 = *(_QWORD *)&a5;
  v22[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (-[SFAnalyticsSQLiteStore tryToOpenDatabase](self, "tryToOpenDatabase"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSince1970WithBucket:", v5);
    v12 = v11;

    v18 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v8, 200, 0, &v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v18;
    v15 = v14;
    if (v14 || !v13)
    {
      if (!v14 || v13)
        goto LABEL_10;
      secLogObjForScope("SecError");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v15;
        _os_log_impl(&dword_18A900000, v16, OS_LOG_TYPE_DEFAULT, "Couldn't serialize failure record: %@", buf, 0xCu);
      }
    }
    else
    {
      v21[0] = CFSTR("timestamp");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
      v16 = objc_claimAutoreleasedReturnValue();
      v21[1] = CFSTR("data");
      v22[0] = v16;
      v22[1] = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFSQLite insertOrReplaceInto:values:](self, "insertOrReplaceInto:values:", v9, v17);

    }
LABEL_10:

  }
}

- (BOOL)tryToOpenDatabase
{
  BOOL v3;
  id v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!-[SFSQLite isOpen](self, "isOpen"))
  {
    v10 = 0;
    v3 = -[SFSQLite openWithError:](self, "openWithError:", &v10);
    v4 = v10;
    if (v3)
    {
      secLogObjForScope("SFAnalytics");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v6 = "successfully opened analytics db";
        v7 = v5;
        v8 = 2;
LABEL_8:
        _os_log_impl(&dword_18A900000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
      }
    }
    else
    {
      secLogObjForScope("SecError");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v12 = v4;
        v6 = "SFAnalytics: failed to open analytics db: %@";
        v7 = v5;
        v8 = 12;
        goto LABEL_8;
      }
    }

    return v3;
  }
  return 1;
}

- (void)dealloc
{
  objc_super v3;

  -[SFSQLite close](self, "close");
  v3.receiver = self;
  v3.super_class = (Class)SFAnalyticsSQLiteStore;
  -[SFSQLite dealloc](&v3, sel_dealloc);
}

- (void)incrementSuccessCountForEventType:(id)a3
{
  id v4;
  int64_t v5;
  int64_t v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  _QWORD v13[5];

  v13[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[SFAnalyticsSQLiteStore tryToOpenDatabase](self, "tryToOpenDatabase"))
  {
    v5 = -[SFAnalyticsSQLiteStore successCountForEventType:](self, "successCountForEventType:", v4);
    v6 = -[SFAnalyticsSQLiteStore hardFailureCountForEventType:](self, "hardFailureCountForEventType:", v4);
    v7 = -[SFAnalyticsSQLiteStore softFailureCountForEventType:](self, "softFailureCountForEventType:", v4);
    v13[0] = v4;
    v12[0] = CFSTR("event_type");
    v12[1] = CFSTR("success_count");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5 + 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = v8;
    v12[2] = CFSTR("hard_failure_count");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2] = v9;
    v12[3] = CFSTR("soft_failure_count");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[3] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSQLite insertOrReplaceInto:values:](self, "insertOrReplaceInto:values:", CFSTR("success_count"), v11);

  }
}

- (void)incrementSoftFailureCountForEventType:(id)a3
{
  id v4;
  int64_t v5;
  int64_t v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  _QWORD v13[5];

  v13[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[SFAnalyticsSQLiteStore tryToOpenDatabase](self, "tryToOpenDatabase"))
  {
    v5 = -[SFAnalyticsSQLiteStore successCountForEventType:](self, "successCountForEventType:", v4);
    v6 = -[SFAnalyticsSQLiteStore hardFailureCountForEventType:](self, "hardFailureCountForEventType:", v4);
    v7 = -[SFAnalyticsSQLiteStore softFailureCountForEventType:](self, "softFailureCountForEventType:", v4);
    v13[0] = v4;
    v12[0] = CFSTR("event_type");
    v12[1] = CFSTR("success_count");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = v8;
    v12[2] = CFSTR("hard_failure_count");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2] = v9;
    v12[3] = CFSTR("soft_failure_count");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7 + 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[3] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSQLite insertOrReplaceInto:values:](self, "insertOrReplaceInto:values:", CFSTR("success_count"), v11);

  }
}

- (id)summaryCounts
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id obj;
  id v15;
  uint8_t buf[16];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[3];
  _QWORD v22[3];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (-[SFAnalyticsSQLiteStore tryToOpenDatabase](self, "tryToOpenDatabase"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    -[SFSQLite selectAllFrom:where:bindings:](self, "selectAllFrom:where:bindings:", CFSTR("success_count"), 0, 0);
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v18 != v5)
            objc_enumerationMutation(obj);
          v7 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("event_type"));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (v8)
          {
            v21[0] = CFSTR("success_count");
            objc_msgSend(v7, "objectForKeyedSubscript:");
            v9 = objc_claimAutoreleasedReturnValue();
            v22[0] = v9;
            v21[1] = CFSTR("hard_failure_count");
            objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("hard_failure_count"));
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v22[1] = v10;
            v21[2] = CFSTR("soft_failure_count");
            objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("soft_failure_count"));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v22[2] = v11;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setObject:forKeyedSubscript:", v12, v8);

          }
          else
          {
            secLogObjForScope("SFAnalytics");
            v9 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_debug_impl(&dword_18A900000, v9, OS_LOG_TYPE_DEBUG, "ignoring entry in success counts table without an event name", buf, 2u);
            }
          }

        }
        v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
      }
      while (v4);
    }

  }
  else
  {
    v15 = (id)objc_opt_new();
  }
  return v15;
}

- (NSArray)rockwells
{
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if (!-[SFAnalyticsSQLiteStore tryToOpenDatabase](self, "tryToOpenDatabase"))
    return (NSArray *)(id)objc_opt_new();
  v6[0] = CFSTR("data");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFSQLite select:from:mapEachRow:](self, "select:from:mapEachRow:", v3, CFSTR("rockwell"), &__block_literal_global_4330);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSArray)hardFailures
{
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if (!-[SFAnalyticsSQLiteStore tryToOpenDatabase](self, "tryToOpenDatabase"))
    return (NSArray *)(id)objc_opt_new();
  v6[0] = CFSTR("data");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFSQLite select:from:mapEachRow:](self, "select:from:mapEachRow:", v3, CFSTR("hard_failures"), &__block_literal_global_35_4329);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSArray)softFailures
{
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if (!-[SFAnalyticsSQLiteStore tryToOpenDatabase](self, "tryToOpenDatabase"))
    return (NSArray *)(id)objc_opt_new();
  v6[0] = CFSTR("data");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFSQLite select:from:mapEachRow:](self, "select:from:mapEachRow:", v3, CFSTR("soft_failures"), &__block_literal_global_36);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSArray)allEvents
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
  void *v14;
  void *v16;
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  if (!-[SFAnalyticsSQLiteStore tryToOpenDatabase](self, "tryToOpenDatabase"))
    return (NSArray *)(id)objc_opt_new();
  -[SFSQLite begin](self, "begin");
  v3 = (void *)objc_opt_new();
  v20[0] = CFSTR("timestamp");
  v20[1] = CFSTR("data");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFSQLite select:from:mapEachRow:](self, "select:from:mapEachRow:", v4, CFSTR("rockwell"), &__block_literal_global_38);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addObjectsFromArray:", v5);
  v19[0] = CFSTR("timestamp");
  v19[1] = CFSTR("data");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFSQLite select:from:mapEachRow:](self, "select:from:mapEachRow:", v6, CFSTR("hard_failures"), &__block_literal_global_38);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addObjectsFromArray:", v7);
  v18[0] = CFSTR("timestamp");
  v18[1] = CFSTR("data");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFSQLite select:from:mapEachRow:](self, "select:from:mapEachRow:", v8, CFSTR("soft_failures"), &__block_literal_global_38);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addObjectsFromArray:", v9);
  v17[0] = CFSTR("timestamp");
  v17[1] = CFSTR("data");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFSQLite select:from:mapEachRow:](self, "select:from:mapEachRow:", v10, CFSTR("notes"), &__block_literal_global_38);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addObjectsFromArray:", v11);
  -[SFSQLite end](self, "end");
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("timestamp"), 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortUsingDescriptors:", v13);

  objc_msgSend(v3, "valueForKey:", CFSTR("record"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v14;
}

- (NSArray)samples
{
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  if (!-[SFAnalyticsSQLiteStore tryToOpenDatabase](self, "tryToOpenDatabase"))
    return (NSArray *)(id)objc_opt_new();
  v6[0] = CFSTR("name");
  v6[1] = CFSTR("value");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFSQLite select:from:](self, "select:from:", v3, CFSTR("samples"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (void)addRockwellDict:(id)a3 userinfo:(id)a4 toTable:(id)a5 timestampBucket:(unsigned int)a6
{
  uint64_t v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  _QWORD v24[3];
  _QWORD v25[4];

  v6 = *(_QWORD *)&a6;
  v25[3] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (-[SFAnalyticsSQLiteStore tryToOpenDatabase](self, "tryToOpenDatabase"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timeIntervalSince1970WithBucket:", v6);
    v15 = v14;

    v21 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v11, 200, 0, &v21);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v21;
    v18 = v17;
    if (v17 || !v16)
    {
      if (!v17 || v16)
        goto LABEL_10;
      secLogObjForScope("SecError");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v18;
        _os_log_impl(&dword_18A900000, v19, OS_LOG_TYPE_DEFAULT, "Couldn't serialize failure record: %@", buf, 0xCu);
      }
    }
    else
    {
      v25[0] = v10;
      v24[0] = CFSTR("event_type");
      v24[1] = CFSTR("timestamp");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15);
      v19 = objc_claimAutoreleasedReturnValue();
      v24[2] = CFSTR("data");
      v25[1] = v19;
      v25[2] = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 3);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFSQLite insertOrReplaceInto:values:](self, "insertOrReplaceInto:values:", v12, v20);

    }
LABEL_10:

  }
}

- (void)addEventDict:(id)a3 toTable:(id)a4
{
  -[SFAnalyticsSQLiteStore addEventDict:toTable:timestampBucket:](self, "addEventDict:toTable:timestampBucket:", a3, a4, 0);
}

- (void)addSample:(id)a3 forName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[SFAnalyticsSQLiteStore tryToOpenDatabase](self, "tryToOpenDatabase"))
  {
    v12[0] = CFSTR("timestamp");
    v8 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSince1970");
    objc_msgSend(v8, "numberWithDouble:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v10;
    v13[1] = v7;
    v12[1] = CFSTR("name");
    v12[2] = CFSTR("value");
    v13[2] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSQLite insertOrReplaceInto:values:](self, "insertOrReplaceInto:values:", CFSTR("samples"), v11);

  }
}

- (void)removeAllSamplesForName:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[SFAnalyticsSQLiteStore tryToOpenDatabase](self, "tryToOpenDatabase"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("name == '%@'"), v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSQLite deleteFrom:where:bindings:](self, "deleteFrom:where:bindings:", CFSTR("samples"), v4, 0);

  }
}

- (NSDate)uploadDate
{
  void *v3;

  if (-[SFAnalyticsSQLiteStore tryToOpenDatabase](self, "tryToOpenDatabase"))
  {
    -[SFSQLite datePropertyForKey:](self, "datePropertyForKey:", CFSTR("upload_date"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSDate *)v3;
}

- (void)setUploadDate:(id)a3
{
  id v4;

  v4 = a3;
  if (-[SFAnalyticsSQLiteStore tryToOpenDatabase](self, "tryToOpenDatabase"))
    -[SFSQLite setDateProperty:forKey:](self, "setDateProperty:forKey:", v4, CFSTR("upload_date"));

}

- (NSString)metricsAccountID
{
  void *v3;

  if (-[SFAnalyticsSQLiteStore tryToOpenDatabase](self, "tryToOpenDatabase"))
  {
    -[SFSQLite propertyForKey:](self, "propertyForKey:", CFSTR("account_id"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (void)setMetricsAccountID:(id)a3
{
  id v4;

  v4 = a3;
  if (-[SFAnalyticsSQLiteStore tryToOpenDatabase](self, "tryToOpenDatabase"))
  {
    if (v4)
      -[SFSQLite setProperty:forKey:](self, "setProperty:forKey:", v4, CFSTR("account_id"));
    else
      -[SFSQLite removePropertyForKey:](self, "removePropertyForKey:", CFSTR("account_id"));
  }

}

- (void)clearAllData
{
  if (-[SFAnalyticsSQLiteStore tryToOpenDatabase](self, "tryToOpenDatabase"))
  {
    -[SFSQLite deleteFrom:where:bindings:](self, "deleteFrom:where:bindings:", CFSTR("success_count"), CFSTR("event_type like ?"), &unk_1E1FFEE48);
    -[SFSQLite deleteFrom:where:bindings:](self, "deleteFrom:where:bindings:", CFSTR("hard_failures"), CFSTR("id >= 0"), 0);
    -[SFSQLite deleteFrom:where:bindings:](self, "deleteFrom:where:bindings:", CFSTR("soft_failures"), CFSTR("id >= 0"), 0);
    -[SFSQLite deleteFrom:where:bindings:](self, "deleteFrom:where:bindings:", CFSTR("samples"), CFSTR("id >= 0"), 0);
    -[SFSQLite deleteFrom:where:bindings:](self, "deleteFrom:where:bindings:", CFSTR("rockwell"), CFSTR("event_type like ?"), &unk_1E1FFEE60);
  }
}

id __35__SFAnalyticsSQLiteStore_allEvents__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  v3 = -[SFAnalyticsEvent initFromRow:]([SFAnalyticsEvent alloc], "initFromRow:", v2);

  return v3;
}

id __38__SFAnalyticsSQLiteStore_softFailures__block_invoke(uint64_t a1, void *a2)
{
  return deserializedRecordFromRow(a2);
}

id __38__SFAnalyticsSQLiteStore_hardFailures__block_invoke(uint64_t a1, void *a2)
{
  return deserializedRecordFromRow(a2);
}

id __35__SFAnalyticsSQLiteStore_rockwells__block_invoke(uint64_t a1, void *a2)
{
  return deserializedRecordFromRow(a2);
}

+ (SFAnalyticsSQLiteStore)storeWithPath:(id)a3 schema:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  NSObject *v13;
  const char *v14;
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v6, "length"))
  {
    secLogObjForScope("SecCritical");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v14 = "Cannot init db with empty path";
LABEL_14:
      _os_log_impl(&dword_18A900000, v8, OS_LOG_TYPE_DEFAULT, v14, buf, 2u);
    }
LABEL_15:
    v9 = 0;
    goto LABEL_16;
  }
  if (!objc_msgSend(v7, "length"))
  {
    secLogObjForScope("SecCritical");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v14 = "Cannot init db without schema";
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  objc_msgSend(v6, "stringByStandardizingPath");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPath:schema:", v8, v7);
  v16 = 0;
  v10 = objc_msgSend(v9, "openWithError:", &v16);
  v11 = v16;
  v12 = v11;
  if ((v10 & 1) == 0 && (!v11 || objc_msgSend(v11, "code") != 23))
  {
    secLogObjForScope("SecError");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v12;
      _os_log_impl(&dword_18A900000, v13, OS_LOG_TYPE_DEFAULT, "SFAnalytics: could not open db at init, will try again later. Error: %@", buf, 0xCu);
    }

  }
LABEL_16:

  return (SFAnalyticsSQLiteStore *)v9;
}

@end

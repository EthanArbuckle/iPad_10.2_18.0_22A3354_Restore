@implementation DESDebugRecord

+ (id)recordIDFromPluginID:(id)a3 taskSource:(int64_t)a4
{
  const __CFString *v4;

  v4 = CFSTR("trial");
  if (a4 != 1)
    v4 = 0;
  return (id)objc_msgSend(a3, "stringByAppendingFormat:", CFSTR(".%@"), v4);
}

- (id)initFromStoreWithPluginID:(id)a3 taskSource:(int64_t)a4
{
  id v6;
  void *v7;
  DESUserDefaultsStoreRecord *v8;
  void *v9;
  DESDebugRecord *v10;

  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "recordIDFromPluginID:taskSource:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[DESUserDefaultsStoreRecord initWithRecordID:]([DESUserDefaultsStoreRecord alloc], "initWithRecordID:", v7);
  -[DESUserDefaultsStoreRecord debugInfo](v8, "debugInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[DESDebugRecord initWithRecordID:debugInfo:](self, "initWithRecordID:debugInfo:", v7, v9);

  return v10;
}

- (DESDebugRecord)initWithPluginID:(id)a3 taskSource:(int64_t)a4
{
  id v6;
  void *v7;
  DESDebugRecord *v8;

  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "recordIDFromPluginID:taskSource:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[DESDebugRecord initWithRecordID:debugInfo:](self, "initWithRecordID:debugInfo:", v7, 0);
  return v8;
}

- (DESDebugRecord)initWithRecordID:(id)a3 debugInfo:(id)a4
{
  id v7;
  id v8;
  DESDebugRecord *v9;
  DESUserDefaultsStoreRecord *v10;
  DESUserDefaultsStoreRecord *storeRecord;
  void *v12;
  uint64_t v13;
  NSMutableDictionary *debugInfo;
  DESDebugRecord *v15;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  if (v7)
  {
    v17.receiver = self;
    v17.super_class = (Class)DESDebugRecord;
    v9 = -[DESDebugRecord init](&v17, sel_init);
    if (v9)
    {
      v10 = -[DESUserDefaultsStoreRecord initWithRecordID:]([DESUserDefaultsStoreRecord alloc], "initWithRecordID:", v7);
      storeRecord = v9->_storeRecord;
      v9->_storeRecord = v10;

      objc_storeStrong((id *)&v9->_recordID, a3);
      if (v8)
        v12 = v8;
      else
        v12 = (void *)MEMORY[0x1E0C9AA70];
      v13 = objc_msgSend(v12, "mutableCopy");
      debugInfo = v9->_debugInfo;
      v9->_debugInfo = (NSMutableDictionary *)v13;

    }
    self = v9;
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)description
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableDictionary *obj;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "appendFormat:", CFSTR("%@: %lu task(s) in last run"), self->_recordID, -[NSMutableDictionary count](self->_debugInfo, "count"));
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = self->_debugInfo;
  v3 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v19 != v5)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_debugInfo, "objectForKeyedSubscript:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("result"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[DESDebugRecord stringForResult:](self, "stringForResult:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("timestamp"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "appendFormat:", CFSTR("\n\t%@ (%@) at %@"), v7, v10, v11);

          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("description"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("description"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "appendFormat:", CFSTR("\n\t\t%@"), v13);

          }
        }

      }
      v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v4);
  }

  v14 = (void *)objc_msgSend(v17, "copy");
  return v14;
}

- (id)stringForResult:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  _QWORD v10[5];
  _QWORD v11[6];

  v11[5] = *MEMORY[0x1E0C80C00];
  v10[0] = &unk_1E7078458;
  v10[1] = &unk_1E7078470;
  v11[0] = CFSTR("success");
  v11[1] = CFSTR("skipped");
  v10[2] = &unk_1E7078488;
  v10[3] = &unk_1E70784A0;
  v11[2] = CFSTR("deferred by OS");
  v11[3] = CFSTR("deferred by plugin");
  v10[4] = &unk_1E70784B8;
  v11[4] = CFSTR("fail to run");
  v3 = (void *)MEMORY[0x1E0C99D80];
  v4 = a3;
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v11, v10, 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = v6;
  else
    v7 = CFSTR("unknown result");
  v8 = v7;

  return v8;
}

- (NSDictionary)debugInfo
{
  return (NSDictionary *)(id)-[NSMutableDictionary copy](self->_debugInfo, "copy");
}

- (void)addForTaskID:(id)a3 result:(int64_t)a4 description:(id)a5
{
  id v8;
  id v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = DESIsInternalInstall();
  if (v8 && v10)
  {
    v11 = (void *)MEMORY[0x1E0C99E08];
    v17[0] = CFSTR("result");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = CFSTR("timestamp");
    v18[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dictionaryWithDictionary:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v9, CFSTR("description"));
    v16 = (void *)objc_msgSend(v15, "copy");
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_debugInfo, "setObject:forKeyedSubscript:", v16, v8);

  }
}

- (BOOL)commitWithError:(id *)a3
{
  if (DESIsInternalInstall())
    -[DESUserDefaultsStoreRecord setDebugInfo:](self->_storeRecord, "setDebugInfo:", self->_debugInfo);
  return 1;
}

- (NSString)recordID
{
  return self->_recordID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_storeStrong((id *)&self->_storeRecord, 0);
  objc_storeStrong((id *)&self->_debugInfo, 0);
}

@end

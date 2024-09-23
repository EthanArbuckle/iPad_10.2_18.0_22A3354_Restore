@implementation DESUserDefaultsStoreRecord

+ (void)purgeObsoleted
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *context;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1BCCC38F0](a1, a2);
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -604800.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v10, "hasPrefix:", CFSTR("LastCompletionDate-")))
        {
          objc_msgSend(v2, "objectForKey:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v11, "compare:", v4) != 1)
          {
            objc_msgSend(v2, "removeObjectForKey:", v10);
            objc_msgSend(v10, "substringFromIndex:", objc_msgSend(CFSTR("LastCompletionDate-"), "length"));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(CFSTR("PerformCount-"), "stringByAppendingString:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            if (v13)
            {
              objc_msgSend(v5, "objectForKeyedSubscript:", v13);
              v14 = (void *)objc_claimAutoreleasedReturnValue();

              if (v14)
                objc_msgSend(v2, "removeObjectForKey:", v13);
            }

          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  objc_autoreleasePoolPop(context);
}

+ (id)schedulerWakeupPeriodInSeconds
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("SchedulerInterval"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (void)setSchedulerWakeupPeriodInSeconds:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0C99EA0];
  v4 = a3;
  objc_msgSend(v3, "standardUserDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("SchedulerInterval"));

}

+ (id)bmltActivatedEventDate
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("BMLTActivatedEventDate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

+ (void)setBmltActivatedEventDate:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0C99EA0];
  v4 = a3;
  objc_msgSend(v3, "standardUserDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("BMLTActivatedEventDate"));

}

- (DESUserDefaultsStoreRecord)initWithRecordID:(id)a3
{
  id v5;
  DESUserDefaultsStoreRecord *v6;
  DESUserDefaultsStoreRecord *v7;
  DESUserDefaultsStoreRecord *v8;
  objc_super v10;

  v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)DESUserDefaultsStoreRecord;
    v6 = -[DESUserDefaultsStoreRecord init](&v10, sel_init);
    v7 = v6;
    if (v6)
      objc_storeStrong((id *)&v6->_recordID, a3);
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DESUserDefaultsStoreRecord recordID](self, "recordID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[DESUserDefaultsStoreRecord performCount](self, "performCount");
  -[DESUserDefaultsStoreRecord lastCompletionDate](self, "lastCompletionDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DESUserDefaultsStoreRecord periodInSeconds](self, "periodInSeconds");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DESUserDefaultsStoreRecord maxTimeLimitInSeconds](self, "maxTimeLimitInSeconds");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@(%@, %lu, %@, %@, %@)"), v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSString)completionDateKey
{
  return (NSString *)objc_msgSend(CFSTR("LastCompletionDate-"), "stringByAppendingString:", self->_recordID);
}

- (NSDate)lastCompletionDate
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[DESUserDefaultsStoreRecord completionDateKey](self, "completionDateKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSDate *)v6;
}

- (void)setLastCompletionDate:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[DESUserDefaultsStoreRecord completionDateKey](self, "completionDateKey");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, v6);

}

- (id)performCountKey
{
  return (id)objc_msgSend(CFSTR("PerformCount-"), "stringByAppendingString:", self->_recordID);
}

- (int64_t)performCount
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DESUserDefaultsStoreRecord performCountKey](self, "performCountKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = objc_msgSend(v5, "integerValue");
  else
    v6 = 0;

  return v6;
}

- (void)setPerformCount:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DESUserDefaultsStoreRecord performCountKey](self, "performCountKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v5, v6);

}

- (id)debugInfoKey
{
  return (id)objc_msgSend(CFSTR("DebugInfo-"), "stringByAppendingString:", self->_recordID);
}

- (NSDictionary)debugInfo
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DESUserDefaultsStoreRecord debugInfoKey](self, "debugInfoKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v5;
}

- (void)setDebugInfo:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0C99EA0];
  v5 = a3;
  objc_msgSend(v4, "standardUserDefaults");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[DESUserDefaultsStoreRecord debugInfoKey](self, "debugInfoKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v5, v6);

}

- (id)periodKey
{
  return (id)objc_msgSend(CFSTR("Period-"), "stringByAppendingString:", self->_recordID);
}

- (NSNumber)periodInSeconds
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DESUserDefaultsStoreRecord periodKey](self, "periodKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v5;
}

- (void)setPeriodInSeconds:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0C99EA0];
  v5 = a3;
  objc_msgSend(v4, "standardUserDefaults");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[DESUserDefaultsStoreRecord periodKey](self, "periodKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v5, v6);

}

- (id)maxTimeLimitKey
{
  return (id)objc_msgSend(CFSTR("MaxTimeLimit-"), "stringByAppendingString:", self->_recordID);
}

- (NSNumber)maxTimeLimitInSeconds
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DESUserDefaultsStoreRecord maxTimeLimitKey](self, "maxTimeLimitKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v5;
}

- (void)setMaxTimeLimitInSeconds:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0C99EA0];
  v5 = a3;
  objc_msgSend(v4, "standardUserDefaults");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[DESUserDefaultsStoreRecord maxTimeLimitKey](self, "maxTimeLimitKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v5, v6);

}

- (id)shouldRegisterXPCActivityKey
{
  return (id)objc_msgSend(CFSTR("ShouldRegisterXPCActivityKey-"), "stringByAppendingString:", self->_recordID);
}

- (BOOL)shouldRegisterXPCActivity
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DESUserDefaultsStoreRecord shouldRegisterXPCActivityKey](self, "shouldRegisterXPCActivityKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "BOOLForKey:", v4);

  return v5;
}

- (void)setShouldRegisterXPCActivity:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[DESUserDefaultsStoreRecord shouldRegisterXPCActivityKey](self, "shouldRegisterXPCActivityKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBool:forKey:", v3, v5);

}

- (NSString)recordID
{
  return self->_recordID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordID, 0);
}

@end

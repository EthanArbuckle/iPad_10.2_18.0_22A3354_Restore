@implementation ATXFakeCoreAnalyticsLogger

- (ATXFakeCoreAnalyticsLogger)init
{
  ATXFakeCoreAnalyticsLogger *v2;
  uint64_t v3;
  NSMutableArray *loggedEvents;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ATXFakeCoreAnalyticsLogger;
  v2 = -[ATXFakeCoreAnalyticsLogger init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    loggedEvents = v2->_loggedEvents;
    v2->_loggedEvents = (NSMutableArray *)v3;

  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken2 != -1)
    dispatch_once(&sharedInstance__pasOnceToken2, &__block_literal_global_21);
  return (id)sharedInstance__pasExprOnceResult_3;
}

void __44__ATXFakeCoreAnalyticsLogger_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1CAA48B6C]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_3;
  sharedInstance__pasExprOnceResult_3 = v1;

  objc_autoreleasePoolPop(v0);
}

- (void)resetEvents
{
  -[NSMutableArray removeAllObjects](self->_loggedEvents, "removeAllObjects");
}

+ (void)resetEvents
{
  id v2;

  objc_msgSend(a1, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resetEvents");

}

- (void)sendEventWithMetricName:(id)a3 eventDictionary:(id)a4
{
  id v5;

  objc_msgSend(MEMORY[0x1E0D81638], "tupleWithFirst:second:", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](self->_loggedEvents, "addObject:", v5);

}

- (BOOL)partialDictionaryMatches:(id)a3 eventDictionary:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  BOOL v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKeyedSubscript:", v12, (_QWORD)v19);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", v12);
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = (void *)v14;
        if (v13)
          v16 = v14 == 0;
        else
          v16 = 1;
        if (v16 || !objc_msgSend(v13, "isEqual:", v14))
        {

          v17 = 0;
          goto LABEL_16;
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      v17 = 1;
      if (v9)
        continue;
      break;
    }
  }
  else
  {
    v17 = 1;
  }
LABEL_16:

  return v17;
}

- (BOOL)hasReceivedEventWithMetricName:(id)a3 partialDictionary:(id)a4
{
  id v6;
  id v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  BOOL v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = self->_loggedEvents;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v13, "first", (_QWORD)v19);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v6, "isEqualToString:", v14) & 1) != 0)
        {
          objc_msgSend(v13, "second");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = -[ATXFakeCoreAnalyticsLogger partialDictionaryMatches:eventDictionary:](self, "partialDictionaryMatches:eventDictionary:", v7, v15);

          if (v16)
          {
            v17 = 1;
            goto LABEL_13;
          }
        }
        else
        {

        }
      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }
  v17 = 0;
LABEL_13:

  return v17;
}

+ (BOOL)hasReceivedEventWithMetricName:(id)a3 partialDictionary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasReceivedEventWithMetricName:partialDictionary:", v7, v6);

  return v9;
}

- (double)numberOfReceivedEvents
{
  return (double)(unint64_t)-[NSMutableArray count](self->_loggedEvents, "count");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggedEvents, 0);
}

@end

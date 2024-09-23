@implementation _DKEventStreamCache

+ (id)sharedCached
{
  if (sharedCached_onceToken != -1)
    dispatch_once(&sharedCached_onceToken, &__block_literal_global_20);
  return (id)sharedCached_sharedCache;
}

- (id)eventStreamWithName:(id)a3 valueType:(id)a4
{
  id v6;
  id v7;
  _DKEventStreamCache *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  _DKEventStream *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  void *v23;
  int v24;
  id v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = self;
    objc_sync_enter(v8);
    -[_DKEventStreamCache objectForKey:](v8, "objectForKey:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9
      && (!v7
       || (objc_msgSend(v9, "eventValueType"),
           v11 = (void *)objc_claimAutoreleasedReturnValue(),
           v12 = objc_msgSend(v11, "isEqual:", v7),
           v11,
           v12)))
    {
      v13 = v10;
    }
    else
    {
      v13 = -[_DKEventStream initWithName:valueType:cache:]([_DKEventStream alloc], "initWithName:valueType:cache:", v6, v7, 0);
      if (v10)
      {
        +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v10, "eventValueType");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = 138412802;
          v25 = v6;
          v26 = 2112;
          v27 = v23;
          v28 = 2112;
          v29 = v7;
          _os_log_error_impl(&dword_18DDBE000, v21, OS_LOG_TYPE_ERROR, "Conflicting types for event stream %@. Cached: %@ vs. New: %@.", (uint8_t *)&v24, 0x20u);

        }
      }
      if (v13)
        -[_DKEventStreamCache setObject:forKey:](v8, "setObject:forKey:", v13, v6);
    }

    objc_sync_exit(v8);
  }
  else
  {
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v8 = (_DKEventStreamCache *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v8->super.super, OS_LOG_TYPE_ERROR))
      -[_DKEventStream initWithName:valueType:cache:].cold.1(&v8->super.super, v14, v15, v16, v17, v18, v19, v20);
    v13 = 0;
  }

  return v13;
}

@end

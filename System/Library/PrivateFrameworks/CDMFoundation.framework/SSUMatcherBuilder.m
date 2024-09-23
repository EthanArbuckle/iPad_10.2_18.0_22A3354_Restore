@implementation SSUMatcherBuilder

- (BOOL)hasMatcher:(id)a3
{
  id v4;
  SSUMatcherBuilder *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[NSMutableDictionary objectForKeyedSubscript:](v5->__matchers, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "matcher");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8 != 0;

  }
  else
  {
    v9 = 0;
  }

  objc_sync_exit(v5);
  return v9;
}

- (unint64_t)numMatchers
{
  SSUMatcherBuilder *v2;
  NSObject *v3;
  NSMutableDictionary *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  NSObject *v12;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  unint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  CDMOSLoggerForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v14 = -[NSMutableDictionary count](v2->__matchers, "count");
    *(_DWORD *)buf = 136315394;
    v21 = "-[SSUMatcherBuilder numMatchers]";
    v22 = 2048;
    v23 = v14;
    _os_log_debug_impl(&dword_21A2A0000, v3, OS_LOG_TYPE_DEBUG, "%s Total number of weak ref wrapper objects in __matchers: %lu", buf, 0x16u);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = v2->__matchers;
  v5 = 0;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        -[NSMutableDictionary objectForKeyedSubscript:](v2->__matchers, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v8), (_QWORD)v15);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "matcher");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10 != 0;

        v5 += v11;
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  CDMOSLoggerForCategory(0);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "-[SSUMatcherBuilder numMatchers]";
    v22 = 2048;
    v23 = v5;
    _os_log_debug_impl(&dword_21A2A0000, v12, OS_LOG_TYPE_DEBUG, "%s Total number of weak ref wrapper objects that contain a live matcher in __matchers: %lu", buf, 0x16u);
  }

  objc_sync_exit(v2);
  return v5;
}

- (id)getMatcherForBuildParams:(id)a3 error:(id *)a4
{
  id v6;
  SSUMatcherBuilder *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  SSUMatcherWeakRef *v12;
  NSObject *v13;
  __CFString *v15;
  uint64_t v16;
  int v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  -[NSMutableDictionary objectForKey:](v7->__matchers, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "matcher");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    CDMOSLoggerForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      goto LABEL_6;
    v17 = 136315394;
    v18 = "-[SSUMatcherBuilder getMatcherForBuildParams:error:]";
    v19 = 2048;
    v20 = (uint64_t)v9;
    v11 = "%s Returning existing SSUMatcher instance with address: %p";
    goto LABEL_17;
  }
  objc_msgSend((id)objc_opt_class(), "buildMatcher:error:", v6, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v12 = -[SSUMatcherWeakRef initWithMatcher:]([SSUMatcherWeakRef alloc], "initWithMatcher:", v9);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v7->__matchers, "setObject:forKeyedSubscript:", v12, v6);

    CDMOSLoggerForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      goto LABEL_6;
    v17 = 136315394;
    v18 = "-[SSUMatcherBuilder getMatcherForBuildParams:error:]";
    v19 = 2048;
    v20 = (uint64_t)v9;
    v11 = "%s Returning newly-built SSUMatcher instance with address: %p";
LABEL_17:
    _os_log_debug_impl(&dword_21A2A0000, v10, OS_LOG_TYPE_DEBUG, v11, (uint8_t *)&v17, 0x16u);
LABEL_6:

    CDMOSLoggerForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v16 = -[SSUMatcherBuilder numMatchers](v7, "numMatchers");
      v17 = 136315394;
      v18 = "-[SSUMatcherBuilder getMatcherForBuildParams:error:]";
      v19 = 2048;
      v20 = v16;
      _os_log_debug_impl(&dword_21A2A0000, v13, OS_LOG_TYPE_DEBUG, "%s Total number of matchers alive: %lu", (uint8_t *)&v17, 0x16u);
    }
    goto LABEL_8;
  }
  CDMOSLoggerForCategory(0);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    if (a4)
    {
      objc_msgSend(*a4, "localizedDescription");
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = CFSTR("nil");
    }
    v17 = 136315394;
    v18 = "-[SSUMatcherBuilder getMatcherForBuildParams:error:]";
    v19 = 2112;
    v20 = (uint64_t)v15;
    _os_log_impl(&dword_21A2A0000, v13, OS_LOG_TYPE_INFO, "%s [WARN]: SSUMatcher building failed with error: %@", (uint8_t *)&v17, 0x16u);
    if (a4)

  }
  v9 = 0;
LABEL_8:

  objc_sync_exit(v7);
  return v9;
}

- (id)_init
{
  SSUMatcherBuilder *v2;
  uint64_t v3;
  NSMutableDictionary *matchers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SSUMatcherBuilder;
  v2 = -[SSUMatcherBuilder init](&v6, sel_init);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = objc_claimAutoreleasedReturnValue();
  matchers = v2->__matchers;
  v2->__matchers = (NSMutableDictionary *)v3;

  return v2;
}

- (NSMutableDictionary)_matchers
{
  return self->__matchers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__matchers, 0);
}

+ (id)sharedBuilder
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__SSUMatcherBuilder_sharedBuilder__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedBuilder_once != -1)
    dispatch_once(&sharedBuilder_once, block);
  return (id)sharedBuilder_sharedBuilder_;
}

+ (id)buildMatcher:(id)a3 error:(id *)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  id v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  CDMOSLoggerForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "+[SSUMatcherBuilder buildMatcher:error:]";
    _os_log_debug_impl(&dword_21A2A0000, v6, OS_LOG_TYPE_DEBUG, "%s Building new SSUMatcher instance...", buf, 0xCu);
  }

  v7 = (void *)MEMORY[0x24BE9E3D0];
  objc_msgSend(v5, "cacheDirectoryURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "modelAssetsDirectoryURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "datasetAssetsDirectoryURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0;
  objc_msgSend(v7, "directoriesWithCacheDirectoryURL:modelAssetsDirectoryURL:datasetAssetsDirectoryURL:error:", v8, v9, v10, &v20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v20;

  if (v11)
  {
    v19 = 0;
    objc_msgSend(MEMORY[0x24BE9E3C8], "matcherWithDirectories:initializeModelsPreemptively:error:", v11, 1, &v19);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v19;
    if (v13)
    {
      v15 = v13;
    }
    else
    {
      CDMOSLoggerForCategory(0);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        v22 = "+[SSUMatcherBuilder buildMatcher:error:]";
        v23 = 2112;
        v24 = v14;
        _os_log_debug_impl(&dword_21A2A0000, v17, OS_LOG_TYPE_DEBUG, "%s Error building SSUMatcher instance: %@", buf, 0x16u);
      }

      if (a4)
        *a4 = objc_retainAutorelease(v14);
    }

  }
  else
  {
    CDMOSLoggerForCategory(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "+[SSUMatcherBuilder buildMatcher:error:]";
      v23 = 2112;
      v24 = v12;
      _os_log_debug_impl(&dword_21A2A0000, v16, OS_LOG_TYPE_DEBUG, "%s Error building SNLPSSUMatcherDirectories instance: %@", buf, 0x16u);
    }

    v13 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v12);
  }

  return v13;
}

void __34__SSUMatcherBuilder_sharedBuilder__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
  v2 = (void *)sharedBuilder_sharedBuilder_;
  sharedBuilder_sharedBuilder_ = v1;

}

@end

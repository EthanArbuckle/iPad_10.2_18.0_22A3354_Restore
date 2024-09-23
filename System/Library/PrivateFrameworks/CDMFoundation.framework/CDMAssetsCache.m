@implementation CDMAssetsCache

- (CDMAssetsCache)initWithValidateAssetSetHandler:(id)a3
{
  id v4;
  CDMAssetsCache *v5;
  void *v6;
  id validateAssetSetHandler;
  NSMutableDictionary *v8;
  NSMutableDictionary *validatedAssetSets;
  NSMutableDictionary *v10;
  NSMutableDictionary *assetSetObservers;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CDMAssetsCache;
  v5 = -[CDMAssetsCache init](&v13, sel_init);
  if (v5)
  {
    v6 = _Block_copy(v4);
    validateAssetSetHandler = v5->_validateAssetSetHandler;
    v5->_validateAssetSetHandler = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    validatedAssetSets = v5->_validatedAssetSets;
    v5->_validatedAssetSets = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    assetSetObservers = v5->_assetSetObservers;
    v5->_assetSetObservers = v10;

  }
  return v5;
}

- (id)getCurrentAssetSetForAssetSetName:(int64_t)a3 withUsages:(id)a4
{
  id v6;
  NSMutableDictionary *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  NSObject *v12;
  NSMutableDictionary *v13;
  void *v14;
  void (**v15)(_QWORD);
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  NSObject *v22;
  id v24;
  id v25;
  _QWORD aBlock[5];
  id v27;
  id v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = self->_validatedAssetSets;
  objc_sync_enter(v7);
  +[CDMAssetsUtils cdmAssetSetToStr:](CDMAssetsUtils, "cdmAssetSetToStr:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getUsages");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v8)
    v11 = v9 == 0;
  else
    v11 = 1;
  if (v11)
  {
    CDMOSLoggerForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v30 = "-[CDMAssetsCache getCurrentAssetSetForAssetSetName:withUsages:]";
      v31 = 2112;
      v32 = v8;
      v33 = 2112;
      v34 = v10;
      _os_log_error_impl(&dword_21A2A0000, v12, OS_LOG_TYPE_ERROR, "%s [ERR]: AssetSetName and usagesDict cannot be nil - assetSetName: %@ and usages: %@.", buf, 0x20u);
    }
    goto LABEL_19;
  }
  +[CDMAssetsCache getHashKeyForAssetSetName:withUsages:](CDMAssetsCache, "getHashKeyForAssetSetName:withUsages:", v8, v9);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = self->_assetSetObservers;
  objc_sync_enter(v13);
  -[NSMutableDictionary objectForKey:](self->_assetSetObservers, "objectForKey:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __63__CDMAssetsCache_getCurrentAssetSetForAssetSetName_withUsages___block_invoke;
    aBlock[3] = &unk_24DCAB6A8;
    aBlock[4] = self;
    v25 = v8;
    v27 = v25;
    v24 = v10;
    v28 = v24;
    v15 = (void (**)(_QWORD))_Block_copy(aBlock);
    objc_msgSend(MEMORY[0x24BEBEE70], "sharedManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "observeAssetSet:queue:handler:", v25, 0, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      CDMOSLoggerForCategory(0);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        v30 = "-[CDMAssetsCache getCurrentAssetSetForAssetSetName:withUsages:]";
        v31 = 2112;
        v32 = v25;
        v33 = 2112;
        v34 = v24;
        _os_log_debug_impl(&dword_21A2A0000, v18, OS_LOG_TYPE_DEBUG, "%s Registered asset set observer for assetSetName: %@ and usages: %@", buf, 0x20u);
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_assetSetObservers, "setObject:forKeyedSubscript:", v17, v12);
    }
    v15[2](v15);

  }
  objc_sync_exit(v13);

  -[NSMutableDictionary objectForKey:](self->_validatedAssetSets, "objectForKey:", v12);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19 == 0;

  if (v20)
  {
    CDMOSLoggerForCategory(0);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v30 = "-[CDMAssetsCache getCurrentAssetSetForAssetSetName:withUsages:]";
      v31 = 2112;
      v32 = v8;
      v33 = 2112;
      v34 = v10;
      _os_log_debug_impl(&dword_21A2A0000, v22, OS_LOG_TYPE_DEBUG, "%s Validated asset set does not exist for assetSetName: %@ and usages: %@.", buf, 0x20u);
    }

LABEL_19:
    v21 = 0;
    goto LABEL_20;
  }
  -[NSMutableDictionary objectForKey:](self->_validatedAssetSets, "objectForKey:", v12);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:

  objc_sync_exit(v7);
  return v21;
}

- (void)markAssetSetValidated:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v13;
  int v14;
  const char *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self->_validatedAssetSets;
  objc_sync_enter(v5);
  +[CDMAssetsCache getNameFromUAFAssetSet:](CDMAssetsCache, "getNameFromUAFAssetSet:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMAssetsCache getUsagesFromUAFAssetSet:](CDMAssetsCache, "getUsagesFromUAFAssetSet:", v4);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (v9)
  {
    CDMOSLoggerForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v14 = 136315650;
      v15 = "-[CDMAssetsCache markAssetSetValidated:]";
      v16 = 2112;
      v17 = v6;
      v18 = 2112;
      v19 = v8;
      _os_log_debug_impl(&dword_21A2A0000, v10, OS_LOG_TYPE_DEBUG, "%s AssetSetName: %@ and usages: %@ can not be nil.", (uint8_t *)&v14, 0x20u);
    }
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v14 = 136315906;
      v15 = "-[CDMAssetsCache markAssetSetValidated:]";
      v16 = 2112;
      v17 = v4;
      v18 = 2112;
      v19 = v6;
      v20 = 2112;
      v21 = v8;
      _os_log_debug_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_DEBUG, "%s Start to mark asset set %@ validated for assetSetName: %@ and usages: %@.", (uint8_t *)&v14, 0x2Au);
    }

    +[CDMAssetsCache getHashKeyForAssetSetName:withUsages:](CDMAssetsCache, "getHashKeyForAssetSetName:withUsages:", v6, v8);
    v10 = objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](self->_validatedAssetSets, "setObject:forKey:", v4, v10);
    CDMOSLoggerForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v14 = 136315906;
      v15 = "-[CDMAssetsCache markAssetSetValidated:]";
      v16 = 2112;
      v17 = v4;
      v18 = 2112;
      v19 = v6;
      v20 = 2112;
      v21 = v8;
      _os_log_debug_impl(&dword_21A2A0000, v13, OS_LOG_TYPE_DEBUG, "%s Marked asset set %@ validated for assetSetName: %@ and usages: %@", (uint8_t *)&v14, 0x2Au);
    }

  }
  objc_sync_exit(v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetSetObservers, 0);
  objc_storeStrong((id *)&self->_validatedAssetSets, 0);
  objc_storeStrong(&self->_validateAssetSetHandler, 0);
}

void __63__CDMAssetsCache_getCurrentAssetSetForAssetSetName_withUsages___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  objc_sync_enter(v2);
  +[CDMAssetsCache initUAFAssetSetWithAssetSetName:andUsages:](CDMAssetsCache, "initUAFAssetSetWithAssetSetName:andUsages:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(unsigned int (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 16))())
    objc_msgSend(*(id *)(a1 + 32), "markAssetSetValidated:", v3);
  CDMOSLoggerForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    v7 = 136315650;
    v8 = "-[CDMAssetsCache getCurrentAssetSetForAssetSetName:withUsages:]_block_invoke";
    v9 = 2112;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    _os_log_debug_impl(&dword_21A2A0000, v4, OS_LOG_TYPE_DEBUG, "%s Validation failed for assetSetName: %@ and usages: %@.", (uint8_t *)&v7, 0x20u);
  }

  objc_sync_exit(v2);
}

+ (id)getHashKeyForAssetSetName:(id)a3 withUsages:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v21 = v5;
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sortedArrayUsingSelector:", sel_compare_);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v23;
    do
    {
      v14 = 0;
      v15 = v7;
      do
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v10);
        v16 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v14);
        objc_msgSend(v6, "objectForKey:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("%@.%@.%@"), v15, v16, v17);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        ++v14;
        v15 = v7;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
    }
    while (v12);
  }

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  CDMOSLoggerForCategory(0);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    v27 = "+[CDMAssetsCache getHashKeyForAssetSetName:withUsages:]";
    v28 = 2112;
    v29 = v21;
    v30 = 2112;
    v31 = v6;
    v32 = 2112;
    v33 = v7;
    _os_log_debug_impl(&dword_21A2A0000, v19, OS_LOG_TYPE_DEBUG, "%s Hash key for assetSetName: %@ and usages: %@ is %@", buf, 0x2Au);
  }

  return v18;
}

+ (void)subscribeToAssetSet:(int64_t)a3 withUsages:(id)a4 forSubscriber:(id)a5 withSubscriptionName:(id)a6 withExpiration:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  _QWORD v22[4];
  NSObject *v23;
  void *v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  void *v28;
  void *v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  v11 = a5;
  v12 = a7;
  v13 = a6;
  v14 = a4;
  +[CDMAssetsUtils cdmAssetSetToStr:](CDMAssetsUtils, "cdmAssetSetToStr:", a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v15;
  objc_msgSend(v14, "getUsages");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v30[0] = v16;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBEE80]), "initWithName:assetSets:usageAliases:expires:", v13, v17, 0, v12);
  if (v18)
  {
    objc_msgSend(MEMORY[0x24BEBEE70], "sharedManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v18;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v24, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __99__CDMAssetsCache_subscribeToAssetSet_withUsages_forSubscriber_withSubscriptionName_withExpiration___block_invoke;
    v22[3] = &unk_24DCACBE8;
    v23 = v17;
    objc_msgSend(v19, "subscribe:subscriptions:queue:completion:", v11, v20, 0, v22);

    v21 = v23;
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "+[CDMAssetsCache subscribeToAssetSet:withUsages:forSubscriber:withSubscriptionName:withExpiration:]";
      v27 = 2112;
      v28 = v17;
      _os_log_error_impl(&dword_21A2A0000, v21, OS_LOG_TYPE_ERROR, "%s [ERR]: Unable to initialize UAFAssetSetSubscription subscription; aborting subscription for assetSetName: usage - %@ ",
        buf,
        0x16u);
    }
  }

}

+ (id)getAssetsFromUAFAssetSet:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  +[CDMAssetsCache getNameFromUAFAssetSet:](CDMAssetsCache, "getNameFromUAFAssetSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMAssetsCache getUsagesFromUAFAssetSet:](CDMAssetsCache, "getUsagesFromUAFAssetSet:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate((os_log_t)CDMLogContext);
  v7 = (id)CDMLogContext;
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v13 = 138412546;
    v14 = v4;
    v15 = 2112;
    v16 = v5;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "CDMAssetsCache", "assets from UAFAssetSet with assetSetName: %@ and usage: %@", (uint8_t *)&v13, 0x16u);
  }

  objc_msgSend(v3, "assets");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)CDMLogContext;
  v11 = v10;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(v13) = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v11, OS_SIGNPOST_INTERVAL_END, v6, "CDMAssetsCache", " enableTelemetry=YES ", (uint8_t *)&v13, 2u);
  }

  return v9;
}

+ (id)initUAFAssetSetWithAssetSetName:(id)a3 andUsages:(id)a4
{
  id v5;
  id v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = os_signpost_id_generate((os_log_t)CDMLogContext);
  v8 = (id)CDMLogContext;
  v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    v15 = 138412546;
    v16 = v5;
    v17 = 2112;
    v18 = v6;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "CDMAssetsCache", "init UAFAssetSet with assetSetName: %@ and usage: %@", (uint8_t *)&v15, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BEBEE70], "sharedManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "retrieveAssetSet:usages:", v5, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (id)CDMLogContext;
  v13 = v12;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    LOWORD(v15) = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v13, OS_SIGNPOST_INTERVAL_END, v7, "CDMAssetsCache", " enableTelemetry=YES ", (uint8_t *)&v15, 2u);
  }

  return v11;
}

+ (id)getNameFromUAFAssetSet:(id)a3
{
  return (id)objc_msgSend(a3, "name");
}

+ (id)getUsagesFromUAFAssetSet:(id)a3
{
  return (id)objc_msgSend(a3, "usages");
}

void __99__CDMAssetsCache_subscribeToAssetSet_withUsages_forSubscriber_withSubscriptionName_withExpiration___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    CDMOSLoggerForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = 136315394;
      v6 = "+[CDMAssetsCache subscribeToAssetSet:withUsages:forSubscriber:withSubscriptionName:withExpiration:]_block_invoke";
      v7 = 2112;
      v8 = v4;
      _os_log_error_impl(&dword_21A2A0000, v3, OS_LOG_TYPE_ERROR, "%s [ERR]: Creating subscription failed assetSetName: usage - %@ ", (uint8_t *)&v5, 0x16u);
    }

  }
}

@end

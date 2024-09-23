@implementation CDMServiceCenterUtils

+ (id)tryInitDAGServices:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSString *v10;
  Class v11;
  NSObject *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  NSString *v19;
  objc_class *v20;
  NSObject *v21;
  NSObject *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  NSString *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  objc_msgSend(v3, "availableServiceGraphs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(v5);
        v10 = *(NSString **)(*((_QWORD *)&v28 + 1) + 8 * i);
        v11 = NSClassFromString(v10);
        if (v11)
        {
          -[objc_class requiredDAGServices](v11, "requiredDAGServices");
          v12 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "unionSet:", v12);
        }
        else
        {
          CDMOSLoggerForCategory(3);
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            v34 = "+[CDMServiceCenterUtils tryInitDAGServices:]";
            v35 = 2112;
            v36 = v10;
            _os_log_impl(&dword_21A2A0000, v12, OS_LOG_TYPE_INFO, "%s Class not found: %@", buf, 0x16u);
          }
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
    }
    while (v7);
  }

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v14 = v4;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v25;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v25 != v17)
          objc_enumerationMutation(v14);
        v19 = *(NSString **)(*((_QWORD *)&v24 + 1) + 8 * j);
        v20 = NSClassFromString(v19);
        if (v20)
        {
          v21 = objc_msgSend([v20 alloc], "initWithConfig:", v3);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v13, "addObject:", v21);
          }
          else
          {
            CDMOSLoggerForCategory(3);
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315394;
              v34 = "+[CDMServiceCenterUtils tryInitDAGServices:]";
              v35 = 2112;
              v36 = v19;
              _os_log_impl(&dword_21A2A0000, v22, OS_LOG_TYPE_INFO, "%s [WARN]: Unexpected class type in config: %@", buf, 0x16u);
            }

          }
        }
        else
        {
          CDMOSLoggerForCategory(3);
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            v34 = "+[CDMServiceCenterUtils tryInitDAGServices:]";
            v35 = 2112;
            v36 = v19;
            _os_log_impl(&dword_21A2A0000, v21, OS_LOG_TYPE_INFO, "%s Class not found: %@", buf, 0x16u);
          }
        }

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v16);
  }

  return v13;
}

+ (BOOL)isServiceCenterEnabled:(id)a3
{
  _BOOL4 v3;
  NSObject *v4;
  NSObject *v5;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = +[CDMFeatureFlags isSiriMiniEnabled](CDMFeatureFlags, "isSiriMiniEnabled", a3);
  CDMOSLoggerForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v7 = 136315138;
      v8 = "+[CDMServiceCenterUtils isServiceCenterEnabled:]";
      _os_log_debug_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_DEBUG, "%s FeatureFlag: SiriNL-> sirimini_nl_on_device is ON.", (uint8_t *)&v7, 0xCu);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v7 = 136315138;
    v8 = "+[CDMServiceCenterUtils isServiceCenterEnabled:]";
    _os_log_error_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_ERROR, "%s [ERR]: FeatureFlag: SiriNL-> sirimini_nl_on_device is OFF. CDM will not be able to process any request.", (uint8_t *)&v7, 0xCu);
  }

  return v3;
}

+ (unsigned)getServiceCenterQueueQOS
{
  return 21;
}

+ (BOOL)needEmbeddingConfigsFor:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

+ (BOOL)isHostedInDaemon
{
  if (isHostedInDaemon_once != -1)
    dispatch_once(&isHostedInDaemon_once, &__block_literal_global_1205);
  return isHostedInDaemon_isHostedInDaemon;
}

+ (id)tryInitGraphServices:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSString *v10;
  Class v11;
  NSObject *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  id v19;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  NSString *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v21 = v3;
  objc_msgSend(v3, "availableServiceGraphs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(v5);
        v10 = *(NSString **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v11 = NSClassFromString(v10);
        if (v11)
        {
          -[objc_class requiredCDMGraphServices](v11, "requiredCDMGraphServices");
          v12 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "unionSet:", v12);
        }
        else
        {
          CDMOSLoggerForCategory(3);
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            v32 = "+[CDMServiceCenterUtils tryInitGraphServices:]";
            v33 = 2112;
            v34 = v10;
            _os_log_impl(&dword_21A2A0000, v12, OS_LOG_TYPE_INFO, "%s Class not found: %@", buf, 0x16u);
          }
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
    }
    while (v7);
  }

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v14 = v4;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v23;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(v14);
        v19 = objc_alloc_init(*(Class *)(*((_QWORD *)&v22 + 1) + 8 * j));
        objc_msgSend(v13, "addObject:", v19);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v16);
  }

  return v13;
}

+ (id)getAvailableServiceGraphs:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  NSString *v12;
  NSObject *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  NSString *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v3, "availableServiceGraphs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v3, "availableServiceGraphs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(NSString **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (NSClassFromString(v12))
        {
          objc_msgSend(v6, "addObject:", v12);
        }
        else
        {
          CDMOSLoggerForCategory(3);
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            v20 = "+[CDMServiceCenterUtils getAvailableServiceGraphs:]";
            v21 = 2112;
            v22 = v12;
            _os_log_impl(&dword_21A2A0000, v13, OS_LOG_TYPE_INFO, "%s Class not found: %@", buf, 0x16u);
          }

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v9);
  }

  return v6;
}

void __41__CDMServiceCenterUtils_isHostedInDaemon__block_invoke()
{
  void *v0;
  void *v1;
  NSObject *v2;
  int v3;
  const char *v4;
  __int16 v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  isHostedInDaemon_isHostedInDaemon = 0;
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "processName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  CDMOSLoggerForCategory(3);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = 136315394;
    v4 = "+[CDMServiceCenterUtils isHostedInDaemon]_block_invoke";
    v5 = 2112;
    v6 = v1;
    _os_log_debug_impl(&dword_21A2A0000, v2, OS_LOG_TYPE_DEBUG, "%s CDM's ServiceCenter is hosted in process: %@", (uint8_t *)&v3, 0x16u);
  }

  isHostedInDaemon_isHostedInDaemon = objc_msgSend(v1, "isEqualToString:", CFSTR("assistant_cdmd"));
}

@end

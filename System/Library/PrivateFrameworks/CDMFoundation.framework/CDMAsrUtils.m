@implementation CDMAsrUtils

+ (id)createCharIndexTimingMap:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v3, "asrTokens", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v10, "startMilliSeconds"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v10, "beginIndex"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKey:", v11, v12);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v10, "endMilliSeconds"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v10, "endIndex"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKey:", v13, v14);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v7);
  }

  CDMOSLoggerForCategory(0);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v22 = "+[CDMAsrUtils createCharIndexTimingMap:]";
    v23 = 2112;
    v24 = v4;
    _os_log_debug_impl(&dword_21A2A0000, v15, OS_LOG_TYPE_DEBUG, "%s Created {char_index: asr_timing} dict: %@", buf, 0x16u);
  }

  return v4;
}

+ (id)createAsrUuidCharIndexTimingMaps:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  CDMOSLoggerForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v27 = "+[CDMAsrUtils createAsrUuidCharIndexTimingMaps:]";
    _os_log_debug_impl(&dword_21A2A0000, v4, OS_LOG_TYPE_DEBUG, "%s Building maps of {char_index: asr_timing} for each ASR alternative", buf, 0xCu);
  }

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v23;
    *(_QWORD *)&v8 = 136315650;
    v21 = v8;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        +[CDMAsrUtils createCharIndexTimingMap:](CDMAsrUtils, "createCharIndexTimingMap:", v12, v21, (_QWORD)v22);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "idA");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKey:", v13, v14);

        CDMOSLoggerForCategory(0);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          v16 = (void *)MEMORY[0x24BE9E348];
          objc_msgSend(v12, "idA");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "convertUUID:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v21;
          v27 = "+[CDMAsrUtils createAsrUuidCharIndexTimingMaps:]";
          v28 = 2112;
          v29 = v18;
          v30 = 2112;
          v31 = v13;
          _os_log_debug_impl(&dword_21A2A0000, v15, OS_LOG_TYPE_DEBUG, "%s Added asrUuid: %@ {char_index->asr_timing} asrMap: %@", buf, 0x20u);

        }
      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
    }
    while (v9);
  }

  CDMOSLoggerForCategory(0);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v27 = "+[CDMAsrUtils createAsrUuidCharIndexTimingMaps:]";
    v28 = 2112;
    v29 = v5;
    _os_log_debug_impl(&dword_21A2A0000, v19, OS_LOG_TYPE_DEBUG, "%s Created asrMaps: %@", buf, 0x16u);
  }

  return v5;
}

@end

@implementation _DASPlistParser

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33___DASPlistParser_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, block);
  return (id)sharedInstance_sharedInstance_0;
}

- (_DASPlistParser)init
{
  _DASPlistParser *v2;
  uint64_t v3;
  NSMutableDictionary *plistToDictionaryMap;
  os_log_t v5;
  void *v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_DASPlistParser;
  v2 = -[_DASPlistParser init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    plistToDictionaryMap = v2->_plistToDictionaryMap;
    v2->_plistToDictionaryMap = (NSMutableDictionary *)v3;

    v5 = os_log_create((const char *)objc_msgSend(CFSTR("com.apple.duetactivityscheduler"), "UTF8String"), (const char *)objc_msgSend(CFSTR("plist"), "UTF8String"));
    v6 = (void *)_log;
    _log = (uint64_t)v5;

    if (!v2->_overrideActivities)
      v7 = -[_DASPlistParser loadOverrides](v2, "loadOverrides");
  }
  return v2;
}

- (id)dictionaryForPlist:(int64_t)a3
{
  _DASPlistParser *v4;
  NSMutableDictionary *plistToDictionaryMap;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;
  void *v10;

  v4 = self;
  objc_sync_enter(v4);
  plistToDictionaryMap = v4->_plistToDictionaryMap;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](plistToDictionaryMap, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    -[_DASPlistParser loadPlist:](v4, "loadPlist:", a3);
  v8 = v4->_plistToDictionaryMap;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v4);
  return v10;
}

- (void)loadPlist:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  NSMutableDictionary *plistToDictionaryMap;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  _QWORD v30[3];
  _QWORD v31[4];

  v31[3] = *MEMORY[0x1E0C80C00];
  v30[0] = &unk_1E62596D0;
  objc_msgSend(CFSTR("/System/Library/DuetActivityScheduler/Scheduler/Resources/"), "stringByAppendingString:", CFSTR("com.apple.dasd.fastpass.activities.plist"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v5;
  v30[1] = &unk_1E62596E8;
  objc_msgSend(CFSTR("/System/Library/DuetActivityScheduler/Scheduler/Resources/"), "stringByAppendingString:", CFSTR("com.apple.dasd.features.plist"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v6;
  v30[2] = &unk_1E6259700;
  objc_msgSend(CFSTR("/System/Library/DuetActivityScheduler/Scheduler/Resources/"), "stringByAppendingString:", CFSTR("com.apple.dasd.allowlist.activities.plist"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForReadingAtPath:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "readDataToEndOfFile");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "length"))
  {
    v24 = 0;
    v25 = 100;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v12, 0, &v25, &v24);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v24;
    v15 = v14;
    v16 = (void *)_log;
    if (!v13 || v14)
    {
      if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR))
        -[_DASPlistParser loadPlist:].cold.2(v16, a3, v8);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_DEBUG))
      {
        v22 = (void *)MEMORY[0x1E0CB37E8];
        v20 = v16;
        objc_msgSend(v22, "numberWithInteger:", a3);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", v23);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v27 = v21;
        v28 = 2112;
        v29 = v13;
        _os_log_debug_impl(&dword_1B0DF4000, v20, OS_LOG_TYPE_DEBUG, "Successfully read plist %@:%@", buf, 0x16u);

      }
      plistToDictionaryMap = self->_plistToDictionaryMap;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3, v21);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](plistToDictionaryMap, "setObject:forKey:", v13, v18);

    }
  }
  else
  {
    v19 = (void *)_log;
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR))
      -[_DASPlistParser loadPlist:].cold.1(v19, a3, v8);
  }

}

- (id)loadOverrides
{
  _DASPlistParser *v2;
  NSDictionary *overrideActivities;
  NSDictionary *v4;
  void *v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  uint64_t v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSDictionary *v21;
  NSObject *v22;
  _DASPlistParser *obj;
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  obj = v2;
  overrideActivities = v2->_overrideActivities;
  if (overrideActivities)
  {
LABEL_2:
    v4 = overrideActivities;
    goto LABEL_3;
  }
  -[_DASPlistParser dictionaryForPlist:](v2, "dictionaryForPlist:", 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v26, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "allKeys");
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v24 = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v7)
    {
      v25 = *(_QWORD *)v35;
      do
      {
        v27 = v7;
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v35 != v25)
            objc_enumerationMutation(v24);
          v9 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
          objc_msgSend(v26, "objectForKeyedSubscript:", v9);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("LimitationOverrides"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            v32 = 0u;
            v33 = 0u;
            v30 = 0u;
            v31 = 0u;
            v28 = v10;
            v11 = v10;
            v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
            if (v12)
            {
              v13 = *(_QWORD *)v31;
              do
              {
                for (j = 0; j != v12; ++j)
                {
                  if (*(_QWORD *)v31 != v13)
                    objc_enumerationMutation(v11);
                  v15 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j);
                  objc_msgSend(v6, "objectForKeyedSubscript:", v15);
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  v17 = v16 == 0;

                  if (v17)
                  {
                    objc_msgSend(MEMORY[0x1E0C99E20], "set");
                    v18 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v6, "setObject:forKeyedSubscript:", v18, v15);

                  }
                  objc_msgSend(v6, "objectForKeyedSubscript:", v15);
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v19, "addObject:", v9);

                }
                v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
              }
              while (v12);
            }

            v10 = v28;
          }

        }
        v7 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v7);
    }

    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v6);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = obj->_overrideActivities;
    obj->_overrideActivities = (NSDictionary *)v20;

    overrideActivities = obj->_overrideActivities;
    goto LABEL_2;
  }
  v22 = _log;
  if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR))
    -[_DASPlistParser loadOverrides].cold.1(v22);

  v4 = 0;
LABEL_3:
  objc_sync_exit(obj);

  return v4;
}

- (BOOL)containsOverrideForActivity:(id)a3 withLimitation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSDictionary *v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  NSObject *v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = self->_overrideActivities;
    objc_sync_enter(v9);
    -[NSDictionary objectForKeyedSubscript:](self->_overrideActivities, "objectForKeyedSubscript:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "containsObject:", v8);
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v12 = v10;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(v12);
          v11 |= objc_msgSend(v8, "containsString:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i), (_QWORD)v19);
        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v13);
    }

    objc_sync_exit(v9);
  }
  else
  {
    v16 = _log;
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR))
      -[_DASPlistParser containsOverrideForActivity:withLimitation:].cold.1((uint64_t)v6, v16, v17);
    LOBYTE(v11) = 0;
  }

  return v11 & 1;
}

- (NSMutableDictionary)plistToDictionaryMap
{
  return self->_plistToDictionaryMap;
}

- (void)setPlistToDictionaryMap:(id)a3
{
  objc_storeStrong((id *)&self->_plistToDictionaryMap, a3);
}

- (NSDictionary)overrideActivities
{
  return self->_overrideActivities;
}

- (void)setOverrideActivities:(id)a3
{
  objc_storeStrong((id *)&self->_overrideActivities, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideActivities, 0);
  objc_storeStrong((id *)&self->_plistToDictionaryMap, 0);
}

- (void)loadPlist:(void *)a3 .cold.1(void *a1, uint64_t a2, void *a3)
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a1;
  objc_msgSend(v5, "numberWithInteger:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 138412290;
  v11 = v8;
  OUTLINED_FUNCTION_0_0(&dword_1B0DF4000, v6, v9, "Failed to read file %@", (uint8_t *)&v10);

  OUTLINED_FUNCTION_1_0();
}

- (void)loadPlist:(void *)a3 .cold.2(void *a1, uint64_t a2, void *a3)
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a1;
  objc_msgSend(v5, "numberWithInteger:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 138412290;
  v11 = v8;
  OUTLINED_FUNCTION_0_0(&dword_1B0DF4000, v6, v9, "Failed to convert plist %@ to dictionary", (uint8_t *)&v10);

  OUTLINED_FUNCTION_1_0();
}

- (void)loadOverrides
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B0DF4000, log, OS_LOG_TYPE_ERROR, "Can't load override plist", v1, 2u);
}

- (void)containsOverrideForActivity:(uint64_t)a3 withLimitation:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_0(&dword_1B0DF4000, a2, a3, "No identifier for %@", (uint8_t *)&v3);
}

@end

@implementation DESFedStatsDataType

+ (id)extractFedStatsDataTypeFrom:(id)a3 forKey:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  id *v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "recipeUserInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("MetadataEncoding"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sortedArrayUsingSelector:", sel_compare_);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v9;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v10)
  {
    v11 = v10;
    v25 = a4;
    v12 = *(_QWORD *)v28;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v28 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("type"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("fedstats"));

        if (v17)
        {
          v19 = (void *)sLog;
          if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
          {
            v20 = v19;
            objc_msgSend(v5, "recipeID");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v32 = v21;
            v33 = 2112;
            v34 = v14;
            _os_log_impl(&dword_1B96E5000, v20, OS_LOG_TYPE_INFO, "Recipe %@ has schema for key %@ to use FedStats encoding.", buf, 0x16u);

          }
          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("dataContentTypes"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
          {
            *v25 = objc_retainAutorelease(v14);
            objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("dataContentTypes"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v23 = (void *)sLog;
            if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
              +[DESFedStatsDataType extractFedStatsDataTypeFrom:forKey:].cold.1(v23, v5, (uint64_t)v14);
            v18 = 0;
          }

          goto LABEL_19;
        }

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      if (v11)
        continue;
      break;
    }
    v18 = 0;
  }
  else
  {
    v18 = 0;
  }
LABEL_19:

  return v18;
}

+ (void)initialize
{
  os_log_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = os_log_create("com.apple.DistributedEvaluation", "DESFedStatsDataType");
    v3 = (void *)sLog;
    sLog = (uint64_t)v2;

  }
}

+ (void)extractFedStatsDataTypeFrom:(uint64_t)a3 forKey:.cold.1(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  objc_msgSend(a2, "recipeID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412802;
  v8 = v6;
  v9 = 2112;
  v10 = a3;
  v11 = 2112;
  v12 = CFSTR("dataContentTypes");
  _os_log_error_impl(&dword_1B96E5000, v5, OS_LOG_TYPE_ERROR, "Recipe %@ has schema for key %@ to use FedStats encoding, but the schema key is not %@.", (uint8_t *)&v7, 0x20u);

}

@end

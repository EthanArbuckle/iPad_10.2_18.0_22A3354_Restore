@implementation CDMEmbeddingUtils

+ (BOOL)isValidEmbeddingVersionOnlyNumber:(id)a3
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  NSObject *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("."));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 3)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v4 = v3;
    v5 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "intValue", (_QWORD)v12) & 0x80000000) != 0)
          {
            CDMOSLoggerForCategory(0);
            v10 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315138;
              v18 = "+[CDMEmbeddingUtils isValidEmbeddingVersionOnlyNumber:]";
              _os_log_debug_impl(&dword_21A2A0000, v10, OS_LOG_TYPE_DEBUG, "%s The embedding Version is invalid as it less than 0.", buf, 0xCu);
            }

            goto LABEL_16;
          }
        }
        v6 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        v9 = 1;
        if (v6)
          continue;
        break;
      }
    }
    else
    {
      v9 = 1;
    }
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "+[CDMEmbeddingUtils isValidEmbeddingVersionOnlyNumber:]";
      _os_log_debug_impl(&dword_21A2A0000, v4, OS_LOG_TYPE_DEBUG, "%s The embeddingVersion is invalid as it contains more than or less than 3 portions. The valid format is {OS}.{NCV}.{Patch}.", buf, 0xCu);
    }
LABEL_16:
    v9 = 0;
  }

  return v9;
}

+ (id)setStringToJSONDictionaryWithError:(id *)a3 stringToConvert:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BDD1608];
  objc_msgSend(a4, "dataUsingEncoding:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v5, "JSONObjectWithData:options:error:", v6, 0, &v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v14;

  if (v8)
  {
    *a3 = objc_retainAutorelease(v8);
    CDMOSLoggerForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v13 = *a3;
      *(_DWORD *)buf = 136315394;
      v16 = "+[CDMEmbeddingUtils setStringToJSONDictionaryWithError:stringToConvert:]";
      v17 = 2112;
      v18 = v13;
      _os_log_error_impl(&dword_21A2A0000, v9, OS_LOG_TYPE_ERROR, "%s [ERR]: Failed to convert string to JSONDictionary with error: %@.", buf, 0x16u);
    }

    v10 = objc_alloc_init(MEMORY[0x24BDBCE70]);
  }
  else
  {
    v10 = v7;
  }
  v11 = v10;

  return v11;
}

@end

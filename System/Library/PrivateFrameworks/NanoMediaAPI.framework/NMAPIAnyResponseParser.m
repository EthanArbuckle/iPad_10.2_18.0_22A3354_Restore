@implementation NMAPIAnyResponseParser

- (id)resultsWithDictionary:(id)a3 error:(id *)a4
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;
  _BYTE v27[128];
  _QWORD v28[9];

  v28[7] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v28[0] = objc_opt_class();
  v28[1] = objc_opt_class();
  v28[2] = objc_opt_class();
  v28[3] = objc_opt_class();
  v28[4] = objc_opt_class();
  v28[5] = objc_opt_class();
  v28[6] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 7);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        v10 = objc_alloc_init(*(Class *)(*((_QWORD *)&v19 + 1) + 8 * i));
        v18 = 0;
        objc_msgSend(v10, "resultsWithDictionary:error:", v4, &v18);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v18;
        NMLogForCategory(9);
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
        if (!v12)
        {
          if (v14)
          {
            *(_DWORD *)buf = 138412290;
            v24 = v10;
            _os_log_impl(&dword_21A803000, v13, OS_LOG_TYPE_INFO, "[NMAPIResponseParser] Successfully parsed response with response parser: %@", buf, 0xCu);
          }

          goto LABEL_18;
        }
        if (v14)
        {
          *(_DWORD *)buf = 138412546;
          v24 = v10;
          v25 = 2112;
          v26 = v12;
          _os_log_impl(&dword_21A803000, v13, OS_LOG_TYPE_INFO, "[NMAPIResponseParser] Unable to parse response with response parser: %@, error: %@", buf, 0x16u);
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      if (v7)
        continue;
      break;
    }
  }

  NMLogForCategory(9);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    -[NMAPIAnyResponseParser resultsWithDictionary:error:].cold.1(v15);

  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEC8580], -7102, 0);
    v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
LABEL_18:

  return v11;
}

- (void)resultsWithDictionary:(os_log_t)log error:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21A803000, log, OS_LOG_TYPE_ERROR, "[NMAPIResponseParser] Unable to parse response with any response parser.", v1, 2u);
}

@end

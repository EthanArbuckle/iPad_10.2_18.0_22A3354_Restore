@implementation DEDFBKFeedbackUpload

+ (void)cleanUpIfNeeded
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__DEDFBKFeedbackUpload_cleanUpIfNeeded__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (cleanUpIfNeeded_onceToken != -1)
    dispatch_once(&cleanUpIfNeeded_onceToken, block);
}

void __39__DEDFBKFeedbackUpload_cleanUpIfNeeded__block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  _QWORD block[5];

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = dispatch_queue_create("com.apple.diagnosticextensionsd.uploadCleanUp", v2);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__DEDFBKFeedbackUpload_cleanUpIfNeeded__block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v3, block);

}

void __39__DEDFBKFeedbackUpload_cleanUpIfNeeded__block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("group.com.apple.feedback"));
  objc_msgSend(v1, "cleanUpIfNeededWithDefaults:", v2);

}

+ (void)cleanUpIfNeededWithDefaults:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[16];

  v4 = (objc_class *)MEMORY[0x24BDBCE68];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "setDay:", -1);
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x24BDBCE60]);
  objc_msgSend(v7, "dateByAddingComponents:toDate:options:", v6, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  Log_1();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21469E000, v10, OS_LOG_TYPE_INFO, "Will cleanup FBK Feedback uploads ", buf, 2u);
  }

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __52__DEDFBKFeedbackUpload_cleanUpIfNeededWithDefaults___block_invoke;
  v12[3] = &unk_24D1E5638;
  v13 = v9;
  v11 = v9;
  objc_msgSend(a1, "compactMapOnFeedbackUploadsWithUserDefaults:block:", v5, v12);

}

id __52__DEDFBKFeedbackUpload_cleanUpIfNeededWithDefaults___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;

  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("dateCreated"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "compareDate:toDate:toUnitGranularity:", *(_QWORD *)(a1 + 32), v4, 128);

    if (v6 != 1)
    {
      v8 = v3;
      goto LABEL_9;
    }
    Log_1();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __52__DEDFBKFeedbackUpload_cleanUpIfNeededWithDefaults___block_invoke_cold_1((uint64_t)v4, v7);
  }
  else
  {
    Log_1();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __52__DEDFBKFeedbackUpload_cleanUpIfNeededWithDefaults___block_invoke_cold_2(v7);
  }

  v8 = 0;
LABEL_9:

  return v8;
}

+ (void)didFinishUploadOnBugSessionIdentifier:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;

  v4 = (objc_class *)MEMORY[0x24BDBCF50];
  v5 = a3;
  v6 = (id)objc_msgSend([v4 alloc], "initWithSuiteName:", CFSTR("group.com.apple.feedback"));
  objc_msgSend(a1, "didFinishUploadOnBugSessionIdentifier:withDefaults:", v5, v6);

}

+ (void)didFinishUploadOnBugSessionIdentifier:(id)a3 withDefaults:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  Log_1();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v13 = v6;
    _os_log_impl(&dword_21469E000, v8, OS_LOG_TYPE_DEFAULT, "didFinishUploadOnBugSessionIdentifier: [%{public}@] ", buf, 0xCu);
  }

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __75__DEDFBKFeedbackUpload_didFinishUploadOnBugSessionIdentifier_withDefaults___block_invoke;
  v10[3] = &unk_24D1E5638;
  v11 = v6;
  v9 = v6;
  objc_msgSend(a1, "compactMapOnFeedbackUploadsWithUserDefaults:block:", v7, v10);

}

id __75__DEDFBKFeedbackUpload_didFinishUploadOnBugSessionIdentifier_withDefaults___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  uint64_t v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("bugSessions"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v5)
  {
    v6 = v5;
    v17 = v3;
    v7 = *(_QWORD *)v19;
    v8 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("sessionIdentifier"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", *(_QWORD *)(a1 + 32));

        if (v12)
          v8 = objc_msgSend(v4, "indexOfObject:", v10);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v6);
    v3 = v17;
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      Log_1();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        v23 = v14;
        _os_log_impl(&dword_21469E000, v13, OS_LOG_TYPE_DEFAULT, "Removing finished upload with Bug Session identifier [%{public}@] from Feedback upload", buf, 0xCu);
      }

      objc_msgSend(v4, "removeObjectAtIndex:", v8);
    }
  }
  if (objc_msgSend(v4, "count"))
    v15 = v3;
  else
    v15 = 0;

  return v15;
}

+ (void)compactMapOnFeedbackUploadsWithUserDefaults:(id)a3 block:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  void (**v35)(id, void *);
  NSObject *v36;
  void *v37;
  void *v38;
  id v39;
  char v40;
  char v41[7];
  id v42;
  char v43;
  char v44[15];
  char v45;
  char v46[15];
  char v47;
  char v48[7];
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t v54[4];
  uint64_t v55;
  uint8_t buf[4];
  NSObject *v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v35 = (void (**)(id, void *))a4;
  v29 = v5;
  objc_msgSend(v5, "objectForKey:", CFSTR("FeedbackUploads"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v38 = (void *)objc_opt_new();
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v51;
    v11 = 0x24BDD1000uLL;
    v39 = v7;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v51 != v10)
          objc_enumerationMutation(v7);
        v13 = *(NSObject **)(*((_QWORD *)&v50 + 1) + 8 * v12);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[NSObject dataUsingEncoding:](v13, "dataUsingEncoding:", 4);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = 0;
          objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v14, 1, &v49);
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = v49;
          if (v16)
          {
            Log_1();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v57 = v13;
              _os_log_error_impl(&dword_21469E000, v17, OS_LOG_TYPE_ERROR, "Failed to parse JSON data. Cannot map Feedback upload [%{public}@]", buf, 0xCu);
            }
            goto LABEL_43;
          }
          -[NSObject objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", CFSTR("dateCreated"));
          v17 = objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v38, "dateFromString:", v17);
            v18 = objc_claimAutoreleasedReturnValue();
            if (v18)
            {
              -[NSObject setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v18, CFSTR("dateCreated"));
              Log_1();
              v19 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138543362;
                v57 = v15;
                _os_log_debug_impl(&dword_21469E000, v19, OS_LOG_TYPE_DEBUG, "Loaded Feedback upload [%{public}@]", buf, 0xCu);
              }

              v35[2](v35, v15);
              v20 = objc_claimAutoreleasedReturnValue();
              if (v20)
              {
                -[NSObject objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", CFSTR("dateCreated"));
                v21 = objc_claimAutoreleasedReturnValue();
                v37 = (void *)v21;
                if (v21)
                {
                  objc_msgSend(v38, "stringFromDate:", v21);
                  v22 = objc_claimAutoreleasedReturnValue();
                  v36 = v22;
                  if (v22)
                  {
                    -[NSObject setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v22, CFSTR("dateCreated"));
                    v42 = 0;
                    v32 = v20;
                    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v20, 0, &v42);
                    v23 = objc_claimAutoreleasedReturnValue();
                    v24 = v42;
                    v33 = (void *)v23;
                    v34 = v24;
                    if (!v23 || v24)
                    {
                      Log_1();
                      v25 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
                        +[DEDFBKFeedbackUpload compactMapOnFeedbackUploadsWithUserDefaults:block:].cold.3(v54, v34, &v55, v25);
LABEL_36:
                      v27 = v25;
                      v20 = v32;
                    }
                    else
                    {
                      v25 = objc_msgSend(objc_alloc(*(Class *)(v11 + 1992)), "initWithData:encoding:", v23, 4);
                      if (v25)
                      {
                        objc_msgSend(v31, "addObject:", v25);
                        goto LABEL_36;
                      }
                      Log_1();
                      v30 = objc_claimAutoreleasedReturnValue();
                      v20 = v32;
                      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                        +[DEDFBKFeedbackUpload compactMapOnFeedbackUploadsWithUserDefaults:block:].cold.4(&v40, v41);

                      v27 = 0;
                    }

                  }
                  else
                  {
                    Log_1();
                    v34 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
                      +[DEDFBKFeedbackUpload compactMapOnFeedbackUploadsWithUserDefaults:block:].cold.2(&v43, v44);
                  }

                }
                else
                {
                  Log_1();
                  v36 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
                    +[DEDFBKFeedbackUpload compactMapOnFeedbackUploadsWithUserDefaults:block:].cold.1(&v45, v46);
                }

              }
              else
              {
                Log_1();
                v26 = objc_claimAutoreleasedReturnValue();
                v37 = v26;
                if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_21469E000, v26, OS_LOG_TYPE_DEFAULT, "Will not keep this Feedback upload", buf, 2u);
                }
                v11 = 0x24BDD1000;
              }

            }
            else
            {
              Log_1();
              v20 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                v57 = v17;
                _os_log_error_impl(&dword_21469E000, v20, OS_LOG_TYPE_ERROR, "Cannot create NSDate from string [%{public}@], will remove stored Feedback upload", buf, 0xCu);
              }
            }

          }
          else
          {
            Log_1();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              +[DEDFBKFeedbackUpload compactMapOnFeedbackUploadsWithUserDefaults:block:].cold.5(&v47, v48);
          }

          v7 = v39;
LABEL_43:

          goto LABEL_44;
        }
        Log_1();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v57 = v13;
          _os_log_error_impl(&dword_21469E000, v16, OS_LOG_TYPE_ERROR, "Feedback upload in defaults is not a String: [%{public}@]", buf, 0xCu);
        }
LABEL_44:

        ++v12;
      }
      while (v9 != v12);
      v28 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
      v9 = v28;
    }
    while (v28);
  }

  objc_msgSend(v29, "setObject:forKey:", v31, CFSTR("FeedbackUploads"));
}

void __52__DEDFBKFeedbackUpload_cleanUpIfNeededWithDefaults___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_21469E000, a2, OS_LOG_TYPE_ERROR, "Feedback upload created on [%{public}@] is stale. Will delete", (uint8_t *)&v2, 0xCu);
}

void __52__DEDFBKFeedbackUpload_cleanUpIfNeededWithDefaults___block_invoke_cold_2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21469E000, log, OS_LOG_TYPE_ERROR, "Cannot decode date created on given Feedback upload. Will delete", v1, 2u);
}

+ (void)compactMapOnFeedbackUploadsWithUserDefaults:(_BYTE *)a1 block:(_BYTE *)a2 .cold.1(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_1_5(a1, a2);
  OUTLINED_FUNCTION_0_3(&dword_21469E000, v2, v3, "mappedDate is nil, will remove Feedback upload", v4);
}

+ (void)compactMapOnFeedbackUploadsWithUserDefaults:(_BYTE *)a1 block:(_BYTE *)a2 .cold.2(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_1_5(a1, a2);
  OUTLINED_FUNCTION_0_3(&dword_21469E000, v2, v3, "mappedDateString is nil, will remove Feedback upload", v4);
}

+ (void)compactMapOnFeedbackUploadsWithUserDefaults:(_QWORD *)a3 block:(NSObject *)a4 .cold.3(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  objc_msgSend(a2, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138543362;
  *a3 = v7;
  _os_log_error_impl(&dword_21469E000, a4, OS_LOG_TYPE_ERROR, "Failed to encode mapped Feedback upload back to JSON. [%{public}@]", a1, 0xCu);

}

+ (void)compactMapOnFeedbackUploadsWithUserDefaults:(_BYTE *)a1 block:(_BYTE *)a2 .cold.4(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_1_5(a1, a2);
  OUTLINED_FUNCTION_0_3(&dword_21469E000, v2, v3, "Failed to encode mapped Feedback upload JSON into String.", v4);
}

+ (void)compactMapOnFeedbackUploadsWithUserDefaults:(_BYTE *)a1 block:(_BYTE *)a2 .cold.5(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_1_5(a1, a2);
  OUTLINED_FUNCTION_0_3(&dword_21469E000, v2, v3, "dateCreated  is not String,  will remove stored Feedback upload", v4);
}

@end

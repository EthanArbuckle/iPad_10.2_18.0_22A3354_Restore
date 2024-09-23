@implementation SAIntentGroupGetIntentDefinitions(INSExtensionService)

- (void)ins_getIntentDefinitionsWithCompletionHandler:()INSExtensionService
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v25 = a3;
  v4 = (void *)*MEMORY[0x24BDD9A30];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD9A30], OS_LOG_TYPE_DEBUG))
  {
    v22 = v4;
    objc_msgSend(a1, "queries");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v33 = "-[SAIntentGroupGetIntentDefinitions(INSExtensionService) ins_getIntentDefinitionsWithCompletionHandler:]";
    v34 = 2112;
    v35 = v23;
    _os_log_debug_impl(&dword_20BAA8000, v22, OS_LOG_TYPE_DEBUG, "%s Finding intent definitions for GetIntentDefinition query: %@", buf, 0x16u);

  }
  INIntentDefinitionURLsForInstalledApps();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x24BE81330]);
  objc_msgSend(a1, "aceId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v6;
  objc_msgSend(v6, "setRefId:", v7);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v28;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v28 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        if (objc_msgSend(a1, "_matchesIntentDefinition:", v14))
        {
          v15 = objc_alloc(MEMORY[0x24BDBCE50]);
          v26 = 0;
          v16 = (void *)objc_msgSend(v15, "initWithContentsOfURL:options:error:", v14, 1, &v26);
          v17 = v26;
          if (v17)
          {
            v21 = v17;
            v20 = v25;
            (*((void (**)(id, _QWORD, id))v25 + 2))(v25, 0, v17);

            v19 = v24;
            goto LABEL_15;
          }
          v18 = objc_alloc_init(MEMORY[0x24BE81348]);
          objc_msgSend(v18, "setIntentDefinition:", v16);
          objc_msgSend(v8, "addObject:", v18);

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v11)
        continue;
      break;
    }
  }

  v19 = v6;
  objc_msgSend(v6, "setIntentDefinitionInfos:", v8);
  v20 = v25;
  (*((void (**)(id, id, _QWORD))v25 + 2))(v25, v24, 0);
LABEL_15:

}

- (uint64_t)_matchesIntentDefinition:()INSExtensionService
{
  id v4;
  os_log_t *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  NSObject *v36;
  NSObject *v37;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  id obj;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint8_t v64[128];
  uint8_t buf[4];
  const char *v66;
  __int16 v67;
  id v68;
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (os_log_t *)MEMORY[0x24BDD9A30];
  v6 = *MEMORY[0x24BDD9A30];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD9A30], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v66 = "-[SAIntentGroupGetIntentDefinitions(INSExtensionService) _matchesIntentDefinition:]";
    v67 = 2112;
    v68 = v4;
    _os_log_debug_impl(&dword_20BAA8000, v6, OS_LOG_TYPE_DEBUG, "%s Checking if Intent Definition at %@ matches query", buf, 0x16u);
  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithContentsOfURL:", v4);
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("INIntents"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      v11 = v9;
      v46 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
      if (v46)
      {
        v47 = *(_QWORD *)v59;
        v43 = v11;
        v44 = v4;
        v41 = v10;
        v42 = v8;
        v39 = a1;
        do
        {
          for (i = 0; i != v46; ++i)
          {
            if (*(_QWORD *)v59 != v47)
              objc_enumerationMutation(v11);
            v13 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("INIntentEntity"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("INIntentVerbAssociations"));
            v15 = objc_claimAutoreleasedReturnValue();
            v16 = (void *)v15;
            if (v14)
              v17 = v15 == 0;
            else
              v17 = 1;
            if (v17)
            {
              v18 = *v5;
              if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136315394;
                v66 = "-[SAIntentGroupGetIntentDefinitions(INSExtensionService) _matchesIntentDefinition:]";
                v67 = 2112;
                v68 = v4;
                _os_log_debug_impl(&dword_20BAA8000, v18, OS_LOG_TYPE_DEBUG, "%s Intent Definition at %@ has no entity or verb section", buf, 0x16u);
              }
            }
            else
            {
              v56 = 0u;
              v57 = 0u;
              v54 = 0u;
              v55 = 0u;
              objc_msgSend(a1, "queries");
              obj = (id)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
              v48 = v19;
              if (v19)
              {
                v45 = *(_QWORD *)v55;
                v40 = v16;
                do
                {
                  v20 = 0;
                  v21 = v45;
                  do
                  {
                    if (*(_QWORD *)v55 != v21)
                      objc_enumerationMutation(obj);
                    v22 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v20);
                    objc_msgSend(v22, "entity");
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    v24 = objc_msgSend(v14, "caseInsensitiveCompare:", v23);

                    if (!v24)
                    {
                      v52 = 0u;
                      v53 = 0u;
                      v50 = 0u;
                      v51 = 0u;
                      v25 = v16;
                      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
                      if (v26)
                      {
                        v27 = v26;
                        v28 = *(_QWORD *)v51;
                        while (2)
                        {
                          for (j = 0; j != v27; ++j)
                          {
                            if (*(_QWORD *)v51 != v28)
                              objc_enumerationMutation(v25);
                            v30 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * j);
                            objc_msgSend(v22, "verb");
                            v31 = (void *)objc_claimAutoreleasedReturnValue();
                            v32 = objc_msgSend(v30, "caseInsensitiveCompare:", v31);

                            if (!v32)
                            {
                              v36 = *MEMORY[0x24BDD9A30];
                              v4 = v44;
                              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD9A30], OS_LOG_TYPE_DEBUG))
                              {
                                *(_DWORD *)buf = 136315394;
                                v66 = "-[SAIntentGroupGetIntentDefinitions(INSExtensionService) _matchesIntentDefinition:]";
                                v67 = 2112;
                                v68 = v44;
                                _os_log_debug_impl(&dword_20BAA8000, v36, OS_LOG_TYPE_DEBUG, "%s Intent Definition at %@ matches current request", buf, 0x16u);
                              }

                              v35 = 1;
                              v10 = v41;
                              v8 = v42;
                              goto LABEL_47;
                            }
                          }
                          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
                          if (v27)
                            continue;
                          break;
                        }
                      }

                      v16 = v40;
                      v21 = v45;
                    }
                    ++v20;
                  }
                  while (v20 != v48);
                  v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
                  v11 = v43;
                  v4 = v44;
                  a1 = v39;
                  v5 = (os_log_t *)MEMORY[0x24BDD9A30];
                  v48 = v33;
                }
                while (v33);
              }

            }
          }
          v10 = v41;
          v8 = v42;
          v46 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
        }
        while (v46);
      }

      v34 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        v66 = "-[SAIntentGroupGetIntentDefinitions(INSExtensionService) _matchesIntentDefinition:]";
        v67 = 2112;
        v68 = v4;
        _os_log_debug_impl(&dword_20BAA8000, v34, OS_LOG_TYPE_DEBUG, "%s Intent Definition at %@ does not match", buf, 0x16u);
      }
    }
    else
    {
      v37 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v66 = "-[SAIntentGroupGetIntentDefinitions(INSExtensionService) _matchesIntentDefinition:]";
        v67 = 2112;
        v68 = v4;
        _os_log_impl(&dword_20BAA8000, v37, OS_LOG_TYPE_INFO, "%s Intent Definition at %@ has no INIntents section", buf, 0x16u);
      }
    }
    v35 = 0;
LABEL_47:

  }
  else
  {
    v35 = 0;
  }

  return v35;
}

@end

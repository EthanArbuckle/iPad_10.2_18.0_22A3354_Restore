@implementation BMKnowledgeContextMapping

+ (id)contextKeypathForQuery:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v14;
  int v15;

  v3 = a3;
  objc_msgSend(v3, "eventStreams");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 == 1)
  {
    objc_msgSend(v3, "eventStreams");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(get_DKSystemEventStreamsClass(), "appInFocusStream");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqual:", v7))
    {

    }
    else
    {
      objc_msgSend(get_DKSystemEventStreamsClass(), "appUsageStream");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqual:", v7);

      if (!v11)
      {
        objc_msgSend(get_DKSystemEventStreamsClass(), "appWebUsageStream");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqual:", v7);

        if (!v15)
        {
          v9 = 0;
          goto LABEL_8;
        }
        objc_msgSend(get_CDContextQueriesClass(), "keyPathForAppWebUsageDataDictionaries");
        v12 = objc_claimAutoreleasedReturnValue();
LABEL_7:
        v9 = (void *)v12;
LABEL_8:

        goto LABEL_9;
      }
    }
    objc_msgSend(get_CDContextQueriesClass(), "keyPathForAppUsageDataDictionaries");
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v9 = 0;
LABEL_9:

  return v9;
}

+ (id)liveEventsForQuery:(id)a3 context:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __CFString *v21;
  NSObject *v22;
  __CFString *v23;
  NSObject *v24;
  void *v25;
  int v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  __CFString *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  id DKEventClass;
  void *v43;
  void *v44;
  __CFString *v45;
  NSObject *v46;
  id v48;
  void *v49;
  void *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  id obj;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint8_t v64;
  _BYTE v65[15];
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t v77;
  _QWORD v78[3];
  _QWORD v79[3];
  _BYTE v80[128];
  uint8_t v81[128];
  __int128 buf;
  Class (*v83)(uint64_t);
  void *v84;
  uint64_t *v85;
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v48 = a4;
  v49 = v6;
  objc_msgSend(a1, "contextKeypathForQuery:", v6);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (v50)
  {
    objc_msgSend(v6, "eventStreams");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8 == 1)
    {
      objc_msgSend(v6, "eventStreams");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(get_CDContextQueriesClass(), "keyPathForAppUsageDataDictionaries");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v50, "isEqual:", v10);

      if (v11)
      {
        objc_msgSend(v48, "objectForKeyedSubscript:", v50);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = (id)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
        v70 = 0u;
        v71 = 0u;
        v72 = 0u;
        v73 = 0u;
        obj = v12;
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v81, 16);
        if (v13)
        {
          v14 = *(_QWORD *)v71;
          do
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v71 != v14)
                objc_enumerationMutation(obj);
              v16 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * i);
              objc_msgSend(get_CDContextQueriesClass(), "appUsageBundleID");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "objectForKeyedSubscript:", v17);
              v18 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(get_CDContextQueriesClass(), "appUsageStartDate");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "objectForKeyedSubscript:", v19);
              v20 = (void *)objc_claimAutoreleasedReturnValue();

              if (v18 && v20)
              {
                objc_msgSend(MEMORY[0x1E0C99D68], "date");
                v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(get_DKEventClass(), "eventWithStream:startDate:endDate:identifierStringValue:metadata:", v55, v20, v21, v18, 0);
                v22 = objc_claimAutoreleasedReturnValue();
                if (v22)
                {
                  objc_msgSend(v51, "addObject:", v22);
                }
                else
                {
                  __biome_log_for_category();
                  v24 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
                    +[BMKnowledgeContextMapping liveEventsForQuery:context:].cold.1((uint8_t *)&v74, (_BYTE *)&v74 + 1, v24);

                }
              }
              else
              {
                v23 = CFSTR("startDate");
                if (!v20)
                  v23 = CFSTR("all");
                if (v18)
                  v23 = CFSTR("bundleId");
                v21 = v23;
                __biome_log_for_category();
                v22 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
                {
                  LODWORD(buf) = 138412290;
                  *(_QWORD *)((char *)&buf + 4) = v21;
                  _os_log_error_impl(&dword_18D810000, v22, OS_LOG_TYPE_ERROR, "Missing %@ information to construct an event from context data", (uint8_t *)&buf, 0xCu);
                }
              }

            }
            v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v81, 16);
          }
          while (v13);
        }
      }
      else
      {
        objc_msgSend(get_CDContextQueriesClass(), "keyPathForAppWebUsageDataDictionaries");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v50, "isEqual:", v25);

        if (!v26)
        {
          v51 = (id)MEMORY[0x1E0C9AA60];
          goto LABEL_58;
        }
        objc_msgSend(v48, "objectForKeyedSubscript:", v50);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = (id)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
        v66 = 0u;
        v67 = 0u;
        v68 = 0u;
        v69 = 0u;
        obj = v27;
        v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v80, 16);
        if (v53)
        {
          v52 = *(_QWORD *)v67;
          do
          {
            v28 = 0;
            do
            {
              if (*(_QWORD *)v67 != v52)
              {
                v29 = v28;
                objc_enumerationMutation(obj);
                v28 = v29;
              }
              v57 = v28;
              v30 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * v28);
              objc_msgSend(get_CDContextQueriesClass(), "appWebUsageWebDomain");
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(get_CDContextQueriesClass(), "appWebUsageStartDate");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(get_CDContextQueriesClass(), "appWebUsageBundleID");
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(get_CDContextQueriesClass(), "appWebUsageType");
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(get_CDContextQueriesClass(), "appWebUsageWepageURL");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "objectForKeyedSubscript:", v63);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "objectForKeyedSubscript:", v62);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "objectForKeyedSubscript:", v61);
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "objectForKeyedSubscript:", v60);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "objectForKeyedSubscript:", v59);
              v34 = objc_claimAutoreleasedReturnValue();
              v35 = (void *)v34;
              if (v34 && v31 && v33 && v32)
              {
                v74 = 0;
                v75 = &v74;
                v76 = 0x2050000000;
                v36 = (void *)get_DKBundleIdentifierClass_softClass;
                v77 = get_DKBundleIdentifierClass_softClass;
                if (!get_DKBundleIdentifierClass_softClass)
                {
                  *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
                  *((_QWORD *)&buf + 1) = 3221225472;
                  v83 = __get_DKBundleIdentifierClass_block_invoke;
                  v84 = &unk_1E2647EA8;
                  v85 = &v74;
                  __get_DKBundleIdentifierClass_block_invoke((uint64_t)&buf);
                  v36 = (void *)v75[3];
                }
                v37 = objc_retainAutorelease(v36);
                _Block_object_dispose(&v74, 8);
                objc_msgSend(v37, "withBundle:", v58);
                v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(get_DKDigitalHealthMetadataKeyClass(), "webpageURL");
                v39 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(get_DKDigitalHealthMetadataKeyClass(), "webDomain");
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(get_DKDigitalHealthMetadataKeyClass(), "usageType");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                v78[0] = v39;
                v78[1] = v54;
                v79[0] = v35;
                v79[1] = v31;
                v78[2] = v40;
                v79[2] = v33;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v79, v78, 3);
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                DKEventClass = get_DKEventClass();
                objc_msgSend(MEMORY[0x1E0C99D68], "date");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(DKEventClass, "eventWithStream:startDate:endDate:value:metadata:", v55, v32, v43, v38, v41);
                v44 = (void *)objc_claimAutoreleasedReturnValue();

                if (v44)
                {
                  objc_msgSend(v51, "addObject:", v44);
                }
                else
                {
                  __biome_log_for_category();
                  v46 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
                    +[BMKnowledgeContextMapping liveEventsForQuery:context:].cold.1(&v64, v65, v46);

                }
              }
              else
              {
                v45 = CFSTR("startDate");
                if (!v32)
                  v45 = CFSTR("all");
                if (v33)
                  v45 = CFSTR("usageType");
                if (v31)
                  v45 = CFSTR("webDomain");
                if (v34)
                  v45 = CFSTR("url");
                v38 = v45;
                __biome_log_for_category();
                v39 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                {
                  LODWORD(buf) = 138412290;
                  *(_QWORD *)((char *)&buf + 4) = v38;
                  _os_log_error_impl(&dword_18D810000, v39, OS_LOG_TYPE_ERROR, "Missing %@ information to construct an event from context data", (uint8_t *)&buf, 0xCu);
                }
              }

              v28 = v57 + 1;
            }
            while (v53 != v57 + 1);
            v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v80, 16);
          }
          while (v53);
        }
      }

LABEL_58:
      goto LABEL_59;
    }
  }
  v51 = (id)MEMORY[0x1E0C9AA60];
LABEL_59:

  return v51;
}

+ (void)liveEventsForQuery:(NSObject *)a3 context:.cold.1(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_10(&dword_18D810000, (int)a2, a3, "Failed to create event from context data", a1);
}

@end

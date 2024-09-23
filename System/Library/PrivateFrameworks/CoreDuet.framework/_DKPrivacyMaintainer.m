@implementation _DKPrivacyMaintainer

+ (id)deletionPredicateForBundleID:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[2];
  _QWORD v43[2];
  _QWORD v44[10];

  v44[8] = *MEMORY[0x1E0C80C00];
  v36 = a3;
  +[_DKSystemEventStreams appInFocusStream](_DKSystemEventStreams, "appInFocusStream");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "name");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v37;
  +[_DKSystemEventStreams appUsageStream](_DKSystemEventStreams, "appUsageStream");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "name");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v44[1] = v34;
  +[_DKSystemEventStreams appClipUsageStream](_DKSystemEventStreams, "appClipUsageStream");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "name");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v44[2] = v32;
  +[_DKSystemEventStreams appRelevantShortcutsStream](_DKSystemEventStreams, "appRelevantShortcutsStream");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v44[3] = v3;
  +[_DKSystemEventStreams appActivityStream](_DKSystemEventStreams, "appActivityStream");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v44[4] = v5;
  +[_DKSystemEventStreams appMediaUsageStream](_DKSystemEventStreams, "appMediaUsageStream");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v44[5] = v7;
  +[_DKSystemEventStreams appWebUsageStream](_DKSystemEventStreams, "appWebUsageStream");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v44[6] = v9;
  +[_DKSystemEventStreams appLocationActivityStream](_DKSystemEventStreams, "appLocationActivityStream");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v44[7] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 8);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  +[_DKQuery predicateForEventsWithStringValue:](_DKQuery, "predicateForEventsWithStringValue:", v36);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKQuery predicateForEventsWithStreamNames:](_DKQuery, "predicateForEventsWithStreamNames:", v41);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0CB3528];
  v43[0] = v38;
  v43[1] = v40;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "andPredicateWithSubpredicates:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  +[_DKSystemEventStreams notificationUsageStream](_DKSystemEventStreams, "notificationUsageStream");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "name");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKQuery predicateForEventsWithStreamName:](_DKQuery, "predicateForEventsWithStreamName:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  +[_DKNotificationUsageMetadataKey bundleID](_DKNotificationUsageMetadataKey, "bundleID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKQuery predicateForObjectsWithMetadataKey:andStringValue:](_DKQuery, "predicateForObjectsWithMetadataKey:andStringValue:", v18, v36);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x1E0CB3528];
  v42[0] = v17;
  v42[1] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "andPredicateWithSubpredicates:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  +[_DKAppClipUsageMetadataKey appBundleID](_DKAppClipUsageMetadataKey, "appBundleID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKQuery predicateForObjectsWithMetadataKey:andStringValue:](_DKQuery, "predicateForObjectsWithMetadataKey:andStringValue:", v23, v36);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  +[_DKAppClipUsageMetadataKey clipBundleID](_DKAppClipUsageMetadataKey, "clipBundleID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKQuery predicateForObjectsWithMetadataKey:andStringValue:](_DKQuery, "predicateForObjectsWithMetadataKey:andStringValue:", v25, v36);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:", v14, v22, v24, v26, 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKQuery predicateForSpotlightEventsWithBundleID:]((uint64_t)_DKQuery, v36);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v27, "addObject:", v28);
  objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

+ (unint64_t)deleteMalformedNotificationUsageEvents:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  id v18;
  NSObject *v19;
  id v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[_DKSystemEventStreams notificationUsageStream](_DKSystemEventStreams, "notificationUsageStream");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKQuery predicateForEventsWithStreamName:](_DKEventQuery, "predicateForEventsWithStreamName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[_DKNotificationUsageMetadataKey identifier](_DKNotificationUsageMetadataKey, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKNotificationUsageMetadataKey bundleID](_DKNotificationUsageMetadataKey, "bundleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB3880];
  +[_DKQuery structuredMetadataKeyPathForMetadataKey:](_DKQuery, "structuredMetadataKeyPathForMetadataKey:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKQuery structuredMetadataKeyPathForMetadataKey:](_DKQuery, "structuredMetadataKeyPathForMetadataKey:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "predicateWithFormat:", CFSTR("%K != NULL OR %K != NULL"), v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3528], "notPredicateWithSubpredicate:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v14;
  v22[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "andPredicateWithSubpredicates:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0;
  v17 = objc_msgSend(v3, "deleteAllEventsMatchingPredicate:error:", v16, &v21);

  v18 = v21;
  if (v18)
  {
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      +[_DKPrivacyMaintainer deleteMalformedNotificationUsageEvents:].cold.1();

  }
  return v17;
}

+ (void)maintainPrivacyWithKnowledgeStorage:(id)a3 installedApps:(id)a4 installedAppExtensions:(id)a5 deleteMaxCount:(unint64_t)a6 objectMaxCount:(unint64_t)a7 objectMaxLifespan:(double)a8 activity:(id)a9
{
  id v14;
  _xpc_activity_s *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  NSObject *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t j;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  NSObject *v62;
  NSObject *v63;
  NSObject *v64;
  char v65;
  NSObject *v66;
  NSObject *v67;
  NSObject *v68;
  void *v69;
  NSObject *v70;
  NSObject *v71;
  objc_class *BMLibraryStreamsPrunerClass;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  void *v77;
  NSObject *v78;
  BOOL v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;
  NSObject *v83;
  uint64_t v84;
  id v85;
  void *v86;
  NSObject *v87;
  void *v88;
  void *v89;
  id obj;
  id v92;
  _xpc_activity_s *v93;
  void *v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  id v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  _BYTE v104[128];
  _QWORD v105[2];
  void *v106;
  uint8_t buf[4];
  uint64_t v108;
  __int16 v109;
  void *v110;
  __int16 v111;
  uint64_t v112;
  _BYTE v113[128];
  uint64_t v114;

  v114 = *MEMORY[0x1E0C80C00];
  v92 = a3;
  v14 = a4;
  v85 = a5;
  v15 = (_xpc_activity_s *)a9;
  +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    +[_DKPrivacyMaintainer maintainPrivacyWithKnowledgeStorage:installedApps:installedAppExtensions:deleteMaxCount:objectMaxCount:objectMaxLifespan:activity:].cold.11();

  kdebug_trace();
  +[_CDLogging knowledgeSignpost](_CDLogging, "knowledgeSignpost");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18DDBE000, v17, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MaintainPrivacy", " enableTelemetry=YES ", buf, 2u);
  }
  v82 = a7;
  v86 = v14;

  +[_CDEventStreams ephemeralitySchedule](_CDEventStreams, "ephemeralitySchedule");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = 0u;
  v101 = 0u;
  v102 = 0u;
  v103 = 0u;
  obj = v18;
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, v113, 16);
  v93 = v15;
  if (v19)
  {
    v20 = v19;
    v21 = 0;
    v22 = 0;
    v23 = *(_QWORD *)v101;
    while (2)
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v101 != v23)
          objc_enumerationMutation(obj);
        v25 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * i);
        if (v15 && xpc_activity_should_defer(v15))
        {
          +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            +[_DKPrivacyMaintainer maintainPrivacyWithKnowledgeStorage:installedApps:installedAppExtensions:deleteMaxCount:objectMaxCount:objectMaxLifespan:activity:].cold.10();

          goto LABEL_21;
        }
        objc_msgSend(obj, "objectForKeyedSubscript:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "allObjects");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "addObjectsFromArray:", v27);
        v28 = (void *)MEMORY[0x1E0C99D68];
        objc_msgSend(v25, "doubleValue");
        objc_msgSend(v28, "dateWithTimeIntervalSinceNow:", -v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v92, "deleteObjectsInEventStreams:olderThanDate:limit:", v27, v30, a6);
        +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v25, "doubleValue");
          *(_DWORD *)buf = 134218498;
          v108 = v22;
          v109 = 2112;
          v110 = v30;
          v111 = 2048;
          v112 = v32;
          _os_log_debug_impl(&dword_18DDBE000, v31, OS_LOG_TYPE_DEBUG, "Deleted %lu objects older than %@, for TTL=%f", buf, 0x20u);
        }
        v21 += v22;

        v15 = v93;
      }
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, v113, 16);
      if (v20)
        continue;
      break;
    }
  }
  else
  {
    v21 = 0;
    v22 = 0;
  }
LABEL_21:

  v34 = v86;
  if (!v86 || !objc_msgSend(v86, "count"))
  {
    v38 = 0;
    goto LABEL_36;
  }
  if (!v15 || !xpc_activity_should_defer(v15))
  {
    +[_DKSystemEventStreams appUsageStream](_DKSystemEventStreams, "appUsageStream");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "name");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = v40;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v106, 1);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    +[_DKQuery predicateForEventsWithStreamNames:](_DKQuery, "predicateForEventsWithStreamNames:", v41);
    v42 = objc_claimAutoreleasedReturnValue();
    +[_DKQuery predicateForEventsWithStringValueInValues:](_DKQuery, "predicateForEventsWithStringValueInValues:", v86);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3528], "notPredicateWithSubpredicate:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = (void *)v42;
    v105[0] = v42;
    v105[1] = v44;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v105, 2);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = 0;
    v38 = objc_msgSend(v92, "deleteAllEventsMatchingPredicate:error:", v46, &v99);
    v47 = v99;
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
      +[_DKPrivacyMaintainer maintainPrivacyWithKnowledgeStorage:installedApps:installedAppExtensions:deleteMaxCount:objectMaxCount:objectMaxLifespan:activity:].cold.8(v38, (uint64_t)v41, v48);

    if (v47)
    {
      +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        +[_DKPrivacyMaintainer maintainPrivacyWithKnowledgeStorage:installedApps:installedAppExtensions:deleteMaxCount:objectMaxCount:objectMaxLifespan:activity:].cold.7();

    }
    v22 = v38;
LABEL_36:
    v84 = v38;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v87 = objc_claimAutoreleasedReturnValue();
    v95 = 0u;
    v96 = 0u;
    v97 = 0u;
    v98 = 0u;
    +[_CDEventStreams sharedInstance](_CDEventStreams, "sharedInstance");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "allEventStreams");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "allValues");
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v95, v104, 16);
    if (v53)
    {
      v54 = v53;
      v37 = 0;
      v55 = *(_QWORD *)v96;
      while (2)
      {
        for (j = 0; j != v54; ++j)
        {
          if (*(_QWORD *)v96 != v55)
            objc_enumerationMutation(v52);
          v57 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * j);
          if (v15 && xpc_activity_should_defer(v15))
          {
            +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
            v63 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
              +[_DKPrivacyMaintainer maintainPrivacyWithKnowledgeStorage:installedApps:installedAppExtensions:deleteMaxCount:objectMaxCount:objectMaxLifespan:activity:].cold.6(v57, v63);

            goto LABEL_55;
          }
          objc_msgSend(v57, "eventStreamProperties");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "knowledgeBaseName");
          v59 = (void *)objc_claimAutoreleasedReturnValue();

          if (v59)
          {
            -[NSObject addObject:](v87, "addObject:", v59);
            objc_msgSend(v57, "eventStreamProperties");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            v61 = objc_msgSend(v60, "eventCountLimit");

            v22 = objc_msgSend(v92, "deleteObjectsInEventStream:ifNeededToLimitEventCount:batchLimit:", v59, v61, a6);
            +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
            v62 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 134218498;
              v108 = v22;
              v109 = 2112;
              v110 = v59;
              v111 = 2048;
              v112 = v61;
              _os_log_debug_impl(&dword_18DDBE000, v62, OS_LOG_TYPE_DEBUG, "Deleted %lu objects from %@ to keep max count at %ld", buf, 0x20u);
            }
            v37 += v22;

          }
          v15 = v93;
        }
        v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v95, v104, 16);
        if (v54)
          continue;
        break;
      }
    }
    else
    {
      v37 = 0;
    }

    if (v15)
    {
LABEL_55:
      v34 = v86;
      if (xpc_activity_should_defer(v15))
      {
        +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
        v64 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
          +[_DKPrivacyMaintainer maintainPrivacyWithKnowledgeStorage:installedApps:installedAppExtensions:deleteMaxCount:objectMaxCount:objectMaxLifespan:activity:].cold.5();
        v35 = 0;
        v36 = 0;
LABEL_79:

        goto LABEL_80;
      }
      v65 = 0;
    }
    else
    {
      v65 = 1;
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -a8);
    v64 = objc_claimAutoreleasedReturnValue();
    +[_DKQuery predicateForEventsWithStreamNames:](_DKEventQuery, "predicateForEventsWithStreamNames:", v89);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v92, "deleteObjectsOlderThanDate:excludingPredicate:limit:", v64);
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v66 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
      +[_DKPrivacyMaintainer maintainPrivacyWithKnowledgeStorage:installedApps:installedAppExtensions:deleteMaxCount:objectMaxCount:objectMaxLifespan:activity:].cold.4((uint64_t)v64, v36, v66);

    if ((v65 & 1) != 0 || !xpc_activity_should_defer(v15))
    {
      +[_DKQuery predicateForEventsWithStreamNames:](_DKEventQuery, "predicateForEventsWithStreamNames:", v87);
      v83 = objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v92, "deleteOldObjectsIfNeededToLimitTotalNumber:excludingPredicate:limit:", v82);
      +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
      v67 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
        +[_DKPrivacyMaintainer maintainPrivacyWithKnowledgeStorage:installedApps:installedAppExtensions:deleteMaxCount:objectMaxCount:objectMaxLifespan:activity:].cold.2();

      if ((v65 & 1) != 0 || !xpc_activity_should_defer(v15))
      {
        v22 = objc_msgSend(v92, "deleteOrphanedEntities");
        +[_DKPrivacyMaintainer deleteMalformedNotificationUsageEvents:](_DKPrivacyMaintainer, "deleteMalformedNotificationUsageEvents:", v92);
        +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
        v68 = objc_claimAutoreleasedReturnValue();
        v69 = v86;
        if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v108 = v22;
          _os_log_impl(&dword_18DDBE000, v68, OS_LOG_TYPE_DEFAULT, "Deleted %lu orphaned entities", buf, 0xCu);
        }
      }
      else
      {
        +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
        v68 = objc_claimAutoreleasedReturnValue();
        v69 = v86;
        if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
          +[_DKPrivacyMaintainer maintainPrivacyWithKnowledgeStorage:installedApps:installedAppExtensions:deleteMaxCount:objectMaxCount:objectMaxLifespan:activity:].cold.1();
        v22 = v35;
      }

      v34 = v69;
    }
    else
    {
      +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
      v83 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
        +[_DKPrivacyMaintainer maintainPrivacyWithKnowledgeStorage:installedApps:installedAppExtensions:deleteMaxCount:objectMaxCount:objectMaxLifespan:activity:].cold.3();
      v35 = 0;
      v22 = v36;
      v34 = v86;
    }

    goto LABEL_79;
  }
  +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
  v87 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
    +[_DKPrivacyMaintainer maintainPrivacyWithKnowledgeStorage:installedApps:installedAppExtensions:deleteMaxCount:objectMaxCount:objectMaxLifespan:activity:].cold.9();
  v35 = 0;
  v36 = 0;
  v37 = 0;
  v84 = 0;
LABEL_80:

  +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
  v70 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v108 = (uint64_t)v34;
    _os_log_impl(&dword_18DDBE000, v70, OS_LOG_TYPE_DEFAULT, "Performing privacy maintenance for installedApps: %@", buf, 0xCu);
  }

  +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
  v71 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v108 = (uint64_t)v85;
    _os_log_impl(&dword_18DDBE000, v71, OS_LOG_TYPE_DEFAULT, "Performing privacy maintenance for installedAppExtensions: %@", buf, 0xCu);
  }

  if (objc_msgSend(v34, "count"))
  {
    BMLibraryStreamsPrunerClass = getBMLibraryStreamsPrunerClass();
    v73 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v34);
    v74 = v35;
    v75 = v36;
    v76 = v34;
    v77 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v85);
    -[objc_class pruneWithInstalledApplications:installedAppExtensions:](BMLibraryStreamsPrunerClass, "pruneWithInstalledApplications:installedAppExtensions:", v73, v77);

    v34 = v76;
    v36 = v75;
    v35 = v74;

  }
  kdebug_trace();
  +[_CDLogging knowledgeSignpost](_CDLogging, "knowledgeSignpost");
  v78 = objc_claimAutoreleasedReturnValue();
  v79 = os_signpost_enabled(v78);
  v80 = v35 + v21 + v36 + v37;
  v81 = v80 + v84;
  if (v79)
  {
    *(_DWORD *)buf = 134349056;
    v108 = v80 + v84 + v22;
    _os_signpost_emit_with_name_impl(&dword_18DDBE000, v78, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MaintainPrivacy", "TotalDeleted=%{signpost.telemetry:number1,public}lu", buf, 0xCu);
  }

  +[_CDDiagnosticDataReporter addValue:forScalarKey:](_CDDiagnosticDataReporter, "addValue:forScalarKey:", v81, CFSTR("com.apple.coreduet.knowledgeStore.privacyEventsDeleted"));
}

+ (void)deleteMalformedNotificationUsageEvents:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_18DDBE000, v0, v1, "Error encountered while attempting to delete unexpected notificationUsage events: %@", v2);
  OUTLINED_FUNCTION_5();
}

+ (void)maintainPrivacyWithKnowledgeStorage:installedApps:installedAppExtensions:deleteMaxCount:objectMaxCount:objectMaxLifespan:activity:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_18DDBE000, v0, v1, "Privacy maintenance deferred before orphaned metadata deletion.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)maintainPrivacyWithKnowledgeStorage:installedApps:installedAppExtensions:deleteMaxCount:objectMaxCount:objectMaxLifespan:activity:.cold.2()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  v3 = 2048;
  v4 = v0;
  OUTLINED_FUNCTION_2(&dword_18DDBE000, v1, (uint64_t)v1, "Deleted %lu objects to keep max count at %lu", v2);
  OUTLINED_FUNCTION_5();
}

+ (void)maintainPrivacyWithKnowledgeStorage:installedApps:installedAppExtensions:deleteMaxCount:objectMaxCount:objectMaxLifespan:activity:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_18DDBE000, v0, v1, "Privacy maintenance deferred before total count enforcement.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)maintainPrivacyWithKnowledgeStorage:(NSObject *)a3 installedApps:installedAppExtensions:deleteMaxCount:objectMaxCount:objectMaxLifespan:activity:.cold.4(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218242;
  v4 = a2;
  v5 = 2112;
  v6 = a1;
  OUTLINED_FUNCTION_2(&dword_18DDBE000, a3, (uint64_t)a3, "Deleted %lu objects older than %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_5();
}

+ (void)maintainPrivacyWithKnowledgeStorage:installedApps:installedAppExtensions:deleteMaxCount:objectMaxCount:objectMaxLifespan:activity:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_18DDBE000, v0, v1, "Privacy maintenance deferred before lifespan enforcement.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)maintainPrivacyWithKnowledgeStorage:(void *)a1 installedApps:(NSObject *)a2 installedAppExtensions:deleteMaxCount:objectMaxCount:objectMaxLifespan:activity:.cold.6(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "eventStreamProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "knowledgeBaseName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_18DDBE000, a2, v5, "Privacy maintenance deferred before %@ enforcement.", v6);

  OUTLINED_FUNCTION_7();
}

+ (void)maintainPrivacyWithKnowledgeStorage:installedApps:installedAppExtensions:deleteMaxCount:objectMaxCount:objectMaxLifespan:activity:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_18DDBE000, v0, v1, "Error deleting app usage events for uninstalled apps: %@", v2);
  OUTLINED_FUNCTION_5();
}

+ (void)maintainPrivacyWithKnowledgeStorage:(NSObject *)a3 installedApps:installedAppExtensions:deleteMaxCount:objectMaxCount:objectMaxLifespan:activity:.cold.8(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  uint8_t v7[12];
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  v8 = 2112;
  v9 = a2;
  OUTLINED_FUNCTION_2(&dword_18DDBE000, a3, v6, "Deleted %@ objects from uninstalled apps from %@", v7);

  OUTLINED_FUNCTION_7();
}

+ (void)maintainPrivacyWithKnowledgeStorage:installedApps:installedAppExtensions:deleteMaxCount:objectMaxCount:objectMaxLifespan:activity:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_18DDBE000, v0, v1, "Privacy maintenance deferred before uninstalled app enforcement.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)maintainPrivacyWithKnowledgeStorage:installedApps:installedAppExtensions:deleteMaxCount:objectMaxCount:objectMaxLifespan:activity:.cold.10()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_18DDBE000, v0, v1, "Privacy maintenance deferred before TTL=%@ deletion.", v2);
  OUTLINED_FUNCTION_5();
}

+ (void)maintainPrivacyWithKnowledgeStorage:installedApps:installedAppExtensions:deleteMaxCount:objectMaxCount:objectMaxLifespan:activity:.cold.11()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_6();
  _os_log_debug_impl(&dword_18DDBE000, v0, OS_LOG_TYPE_DEBUG, "Performing privacy maintenance for historical knowledge", v1, 2u);
  OUTLINED_FUNCTION_4();
}

@end

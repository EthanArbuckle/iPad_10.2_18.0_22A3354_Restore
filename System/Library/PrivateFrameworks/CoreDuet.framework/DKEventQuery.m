@implementation DKEventQuery

void __51___DKEventQuery_executeUsingCoreDataStorage_error___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  BOOL v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  _BOOL4 v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  id v63;
  void *v64;
  void *v65;
  NSObject *v66;
  _DKObjectMOConverter *v67;
  void *v68;
  uint64_t v69;
  id v70;
  void *v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  const char *v89;
  double v90;
  double v91;
  int v92;
  void *v93;
  uint64_t v94;
  const char *v95;
  __CFString *v96;
  void *v97;
  void *v98;
  void *v99;
  uint64_t v100;
  id v101;
  id v102;
  _QWORD v103[2];
  id v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  uint64_t v109;
  void *v110;
  void *v111;
  uint8_t buf[4];
  const char *v113;
  __int16 v114;
  uint64_t v115;
  __int16 v116;
  double v117;
  __int16 v118;
  void *v119;
  __int16 v120;
  __CFString *v121;
  __int16 v122;
  void *v123;
  id v124;
  void *v125;
  void *v126;
  _QWORD v127[2];
  _QWORD v128[2];
  id v129;
  void *v130;
  _BYTE v131[128];
  uint64_t v132;

  v132 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C97B48]);
  v3 = (void *)MEMORY[0x1E0C97B20];
  +[_DKEvent entityName](_DKEvent, "entityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "entityForName:inManagedObjectContext:", v4, *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEntity:", v5);

  objc_msgSend(v2, "setPredicate:", *(_QWORD *)(a1 + 40));
  if (objc_msgSend(*(id *)(a1 + 48), "limit") < 0)
    objc_msgSend(*(id *)(a1 + 48), "setLimit:", 0);
  objc_msgSend(v2, "setFetchLimit:", objc_msgSend(*(id *)(a1 + 48), "limit"));
  objc_msgSend(v2, "setFetchOffset:", objc_msgSend(*(id *)(a1 + 48), "offset"));
  objc_msgSend(*(id *)(a1 + 48), "sortDescriptors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSortDescriptors:", v6);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 48), "readMetadata"))
  {
    objc_msgSend(*(id *)(a1 + 48), "excludedMetadataKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8
      || (objc_msgSend(*(id *)(a1 + 48), "excludedMetadataKeys"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v9, "count"),
          v9,
          v8,
          !v10))
    {
      objc_msgSend(v7, "addObject:", CFSTR("customMetadata"));
    }
    objc_msgSend(v7, "addObject:", CFSTR("structuredMetadata"));
  }
  objc_msgSend(v2, "sortDescriptors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v2, "sortDescriptors");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = +[_DKPredicateValidator validateSortDescriptors:](_DKPredicateValidator, "validateSortDescriptors:", v12);

    if (v13)
    {
      v107 = 0u;
      v108 = 0u;
      v105 = 0u;
      v106 = 0u;
      objc_msgSend(v2, "sortDescriptors");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v105, v131, 16);
      if (v15)
      {
        v16 = *(_QWORD *)v106;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v106 != v16)
              objc_enumerationMutation(v14);
            objc_msgSend(*(id *)(*((_QWORD *)&v105 + 1) + 8 * i), "allowEvaluation");
          }
          v15 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v105, v131, 16);
        }
        while (v15);
      }
    }
    else
    {
      +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        __51___DKEventQuery_executeUsingCoreDataStorage_error___block_invoke_cold_3(v2, v14);
    }

  }
  objc_msgSend(v2, "predicate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
    goto LABEL_24;
  objc_msgSend(v2, "predicate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = 0;
  v20 = +[_DKPredicateValidator validatePredicate:allowedKeys:error:](_DKPredicateValidator, "validatePredicate:allowedKeys:error:", v19, 0, &v104);
  v21 = v104;

  if (v20)
  {
    objc_msgSend(v2, "predicate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "allowEvaluation");

LABEL_24:
    if ((objc_msgSend(*(id *)(a1 + 48), "deduplicateValues") & 1) == 0)
      objc_msgSend(v7, "addObject:", CFSTR("value"));
    if ((objc_msgSend(*(id *)(a1 + 48), "deduplicateValues") & 1) == 0)
    {
      v23 = (void *)objc_msgSend(v7, "copy");
      objc_msgSend(v2, "setRelationshipKeyPathsForPrefetching:", v23);

    }
    if (objc_msgSend(*(id *)(a1 + 48), "resultType") == 3
      || objc_msgSend(*(id *)(a1 + 48), "resultType") == 4
      || objc_msgSend(*(id *)(a1 + 48), "resultType") == 6)
    {
      objc_msgSend(v2, "setResultType:", 2);
    }
    objc_msgSend(*(id *)(a1 + 48), "groupByProperties");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "count");

    if (v25)
    {
      objc_msgSend(v2, "setResultType:", 2);
      objc_msgSend(v2, "setReturnsDistinctResults:", objc_msgSend(*(id *)(a1 + 48), "returnsDistinctResults"));
      v26 = objc_msgSend(*(id *)(a1 + 48), "resultType");
      v27 = *(void **)(a1 + 48);
      if (v26 == 4)
      {
        objc_msgSend(v27, "groupByProperties");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setPropertiesToGroupBy:", v28);

        objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("streamName"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (void *)MEMORY[0x1E0CB35D0];
        v130 = v29;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v130, 1);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "expressionForFunction:arguments:", CFSTR("count:"), v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        v33 = objc_alloc_init(MEMORY[0x1E0C97B30]);
        objc_msgSend(v33, "setExpression:", v32);
        objc_msgSend(v33, "setName:", CFSTR("count"));
        objc_msgSend(v33, "setExpressionResultType:", 300);
        v129 = v33;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v129, 1);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "groupByProperties");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "arrayByAddingObjectsFromArray:", v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setPropertiesToFetch:", v36);

      }
      else if (objc_msgSend(v27, "resultType") == 5)
      {
        objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("startDate.timeIntervalSinceReferenceDate"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("endDate.timeIntervalSinceReferenceDate"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = (void *)MEMORY[0x1E0CB35D0];
        v128[0] = v40;
        v128[1] = v29;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v128, 2);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "expressionForFunction:arguments:", CFSTR("from:subtract:"), v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        v44 = objc_alloc_init(MEMORY[0x1E0C97B30]);
        objc_msgSend(v44, "setExpression:", v43);
        objc_msgSend(v44, "setName:", CFSTR("duration"));
        objc_msgSend(v44, "setExpressionResultType:", 500);
        objc_msgSend(*(id *)(a1 + 48), "groupByProperties");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v127[0] = v44;
        v127[1] = CFSTR("startDate");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v127, 2);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "arrayByAddingObjectsFromArray:", v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setPropertiesToFetch:", v47);

      }
      else if (objc_msgSend(*(id *)(a1 + 48), "resultType") == 6)
      {
        objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("endDate.timeIntervalSinceReferenceDate"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = (void *)MEMORY[0x1E0CB35D0];
        v126 = v29;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v126, 1);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "expressionForFunction:arguments:", CFSTR("max:"), v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        v51 = objc_alloc_init(MEMORY[0x1E0C97B30]);
        objc_msgSend(v51, "setExpression:", v50);
        objc_msgSend(v51, "setName:", CFSTR("endDate"));
        objc_msgSend(v51, "setExpressionResultType:", 900);
        objc_msgSend(*(id *)(a1 + 48), "groupByProperties");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setPropertiesToGroupBy:", v52);

        v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("endDate"), 0);
        v125 = v53;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v125, 1);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setSortDescriptors:", v54);

        objc_msgSend(*(id *)(a1 + 48), "groupByProperties");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v124 = v51;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v124, 1);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "arrayByAddingObjectsFromArray:", v56);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setPropertiesToFetch:", v57);

      }
      else
      {
        objc_msgSend(*(id *)(a1 + 48), "groupByProperties");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setPropertiesToGroupBy:", v58);

        objc_msgSend(*(id *)(a1 + 48), "groupByProperties");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setPropertiesToFetch:", v29);
      }

    }
    +[_CDMutablePerfMetric perfMetricForFetchRequest:type:]((uint64_t)_CDMutablePerfMetric, v2, CFSTR("Event Queries"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v103[0] = 0;
    v103[1] = 0;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    CDPerfMetricStartTiming(v103);
    if (objc_msgSend(*(id *)(a1 + 48), "resultType") == 1)
    {
      v60 = (void *)MEMORY[0x1E0CB37E8];
      v61 = *(void **)(a1 + 32);
      v102 = 0;
      v62 = objc_msgSend(v61, "countForFetchRequest:error:", v2, &v102);
      v63 = v102;
      objc_msgSend(v60, "numberWithUnsignedInteger:", v62);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v65 = *(void **)(a1 + 32);
      v101 = 0;
      objc_msgSend(v65, "executeFetchRequest:error:", v2, &v101);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = v101;
    }
    if (!_DKEventQueryPerformanceTesting)
    {
      +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
      v66 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
      {
        v88 = objc_msgSend(*(id *)(a1 + 48), "resultType");
        v89 = "executeFetchRequest";
        if (v88 == 1)
          v89 = "countForFetchRequest";
        v95 = v89;
        v94 = objc_msgSend(v2, "fetchLimit");
        objc_msgSend(v59, "timeIntervalSinceNow");
        v91 = v90;
        v100 = objc_msgSend(*(id *)(a1 + 48), "resultType");
        v97 = v64;
        if (v100 != 1)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v64, "count"));
          v97 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v92 = _DKQueryLoggingEnabled();
        if (v92)
        {
          objc_msgSend(v2, "predicate");
          v96 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v96 = CFSTR("<not shown>");
        }
        objc_msgSend(v2, "sortDescriptors");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136316418;
        v113 = v95;
        v114 = 2048;
        v115 = v94;
        v116 = 2048;
        v117 = -v91;
        v118 = 2112;
        v119 = v97;
        v120 = 2112;
        v121 = v96;
        v122 = 2112;
        v123 = v93;
        _os_log_debug_impl(&dword_18DDBE000, v66, OS_LOG_TYPE_DEBUG, "_DKEventQuery executeUsingCoreDataStorage finished %s, fetchLimit %lu object(s), elapsed %f(sec), returned %@ object(s), Predicate: %@, Sort descriptors: %@ ", buf, 0x3Eu);

        if (v92)
        if (v100 != 1)

      }
    }
    if (v63)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v63);
      CDPerfMetricEndTimingAndIncrementErrorCount(v39, (uint64_t)v103);
    }
    else
    {
      v67 = objc_alloc_init(_DKObjectMOConverter);
      -[_DKObjectMOConverter setReadMetadata:](v67, "setReadMetadata:", objc_msgSend(*(id *)(a1 + 48), "readMetadata"));
      -[_DKObjectMOConverter setDeduplicateValues:](v67, "setDeduplicateValues:", objc_msgSend(*(id *)(a1 + 48), "deduplicateValues"));
      objc_msgSend(*(id *)(a1 + 48), "excludedMetadataKeys");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      -[_DKObjectMOConverter setExcludedMetadataKeys:](v67, "setExcludedMetadataKeys:", v68);

      switch(objc_msgSend(*(id *)(a1 + 48), "resultType"))
      {
        case 0:
          -[_DKObjectMOConverter objectsFromManagedObjects:](v67, "objectsFromManagedObjects:", v64);
          v79 = objc_claimAutoreleasedReturnValue();
          v80 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
          v81 = *(void **)(v80 + 40);
          *(_QWORD *)(v80 + 40) = v79;

          if (_os_feature_enabled_impl())
          {
            v82 = *(void **)(a1 + 56);
            if (v82)
            {
              if (objc_msgSend(v82, "count"))
              {
                objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "arrayByAddingObjectsFromArray:", *(_QWORD *)(a1 + 56));
                v76 = objc_claimAutoreleasedReturnValue();
                v77 = *(_QWORD *)(a1 + 72);
                goto LABEL_56;
              }
            }
          }
          goto LABEL_63;
        case 1:
          v99 = (void *)MEMORY[0x1E0CB37E8];
          v83 = objc_msgSend(v64, "unsignedIntegerValue");
          objc_msgSend(*(id *)(a1 + 56), "firstObject");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v99, "numberWithUnsignedInteger:", objc_msgSend(v71, "unsignedIntegerValue") + v83);
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          v111 = v84;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v111, 1);
          v85 = objc_claimAutoreleasedReturnValue();
          v86 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
          v87 = *(void **)(v86 + 40);
          *(_QWORD *)(v86 + 40) = v85;

          goto LABEL_62;
        case 2:
          -[_DKObjectMOConverter dataIntervalsFromManagedObjects:](v67, "dataIntervalsFromManagedObjects:", v64);
          v76 = objc_claimAutoreleasedReturnValue();
          v77 = *(_QWORD *)(a1 + 72);
LABEL_56:
          v78 = *(_QWORD *)(v77 + 8);
          v71 = *(void **)(v78 + 40);
          *(_QWORD *)(v78 + 40) = v76;
          goto LABEL_62;
        case 3:
        case 4:
        case 5:
        case 6:
          v69 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
          v70 = v64;
          v71 = *(void **)(v69 + 40);
          *(_QWORD *)(v69 + 40) = v70;
          goto LABEL_62;
        default:
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsupported result type: %ld"), objc_msgSend(*(id *)(a1 + 48), "resultType"));
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          v98 = (void *)MEMORY[0x1E0CB35C8];
          v109 = *MEMORY[0x1E0CB2D50];
          v110 = v71;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v110, &v109, 1);
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v98, "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreduet.knowledge"), 3, v72);
          v73 = objc_claimAutoreleasedReturnValue();
          v74 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
          v75 = *(void **)(v74 + 40);
          *(_QWORD *)(v74 + 40) = v73;

LABEL_62:
LABEL_63:
          CDPerfMetricEndTimingAndSetResultCount(v39, (uint64_t)v103, objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "count"));

          break;
      }
    }

    goto LABEL_65;
  }
  +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
    __51___DKEventQuery_executeUsingCoreDataStorage_error___block_invoke_cold_2(v2, v37);

  v38 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v39 = *(void **)(v38 + 40);
  *(_QWORD *)(v38 + 40) = v21;
LABEL_65:

}

void __32___DKEventQuery_onlyLocalDevice__block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  char v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  strcpy(v4, "OnlyLocalDevice");
  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v4);
  v2 = objc_msgSend(v0, "initWithObjects:", v1, 0);
  v3 = (void *)onlyLocalDevice_set;
  onlyLocalDevice_set = v2;

}

void __27___DKEventQuery_allDevices__block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  __int128 v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4 = *(_OWORD *)"AllDevices";
  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", &v4);
  v2 = objc_msgSend(v0, "initWithObjects:", v1, 0);
  v3 = (void *)allDevices_set;
  allDevices_set = v2;

}

void __33___DKEventQuery_onlyRemoteDevice__block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  __int128 v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4 = *(_OWORD *)"OnlyRemoteDevice";
  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", &v4);
  v2 = objc_msgSend(v0, "initWithObjects:", v1, 0);
  v3 = (void *)onlyRemoteDevice_set;
  onlyRemoteDevice_set = v2;

}

void __51___DKEventQuery_executeUsingCoreDataStorage_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_9(&dword_18DDBE000, v0, v1, "[_DKEventQuery executeUsingCoreDataStorage] caught %@", v2);
}

void __51___DKEventQuery_executeUsingCoreDataStorage_error___block_invoke_cold_2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "predicate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_9(&dword_18DDBE000, a2, v4, "Client provided invalid predicate %@", v5);

  OUTLINED_FUNCTION_1();
}

void __51___DKEventQuery_executeUsingCoreDataStorage_error___block_invoke_cold_3(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "sortDescriptors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_9(&dword_18DDBE000, a2, v4, "Client provided invalid sortDescriptors %@", v5);

  OUTLINED_FUNCTION_1();
}

@end

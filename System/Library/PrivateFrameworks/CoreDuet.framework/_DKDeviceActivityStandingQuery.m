@implementation _DKDeviceActivityStandingQuery

- (_DKDeviceActivityStandingQuery)init
{
  _DKDeviceActivityStandingQuery *v2;
  objc_class *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_DKDeviceActivityStandingQuery;
  v2 = -[_DKDeviceActivityStandingQuery init](&v6, sel_init);
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DKDeviceActivityStandingQuery setQueryIdentifier:](v2, "setQueryIdentifier:", v4);

  }
  return v2;
}

- (uint64_t)_shouldDefer
{
  void *v1;
  void *v2;
  _xpc_activity_s *v3;
  _BOOL4 should_defer;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = (void *)result;
    objc_msgSend((id)result, "activity");
    result = objc_claimAutoreleasedReturnValue();
    if (result)
    {
      v2 = (void *)result;
      objc_msgSend(v1, "activity");
      v3 = (_xpc_activity_s *)objc_claimAutoreleasedReturnValue();
      should_defer = xpc_activity_should_defer(v3);

      if (should_defer)
      {
        +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v1, "queryIdentifier");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = 138412290;
          v8 = v6;
          _os_log_impl(&dword_18DDBE000, v5, OS_LOG_TYPE_DEFAULT, "Activity deferral requested for %@", (uint8_t *)&v7, 0xCu);

        }
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

- (double)_deviceActivityEphemerality
{
  void *v1;
  void *v2;
  double v3;
  double v4;

  if (!a1)
    return 0.0;
  +[_DKSystemEventStreams deviceActivityLevelStream](_DKSystemEventStreams, "deviceActivityLevelStream");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDEventStreams eventStreamPropertiesForEventStream:](_CDEventStreams, "eventStreamPropertiesForEventStream:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeToLive");
  v4 = v3;

  return v4;
}

- (id)_customIdentifierForDayOfWeek:(void *)a1
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (a1)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a1, "queryIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%@-%@"), v4, v5, &unk_1E272B0C8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)_predicateForDeletedEventsWithReferenceDate:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v3 = a2;
  objc_msgSend(v3, "dateByAddingTimeInterval:", --[_DKDeviceActivityStandingQuery _deviceActivityEphemerality](a1));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[_DKQuery predicateForEventsWithStartDateOrCreationDateBefore:](_DKQuery, "predicateForEventsWithStartDateOrCreationDateBefore:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKPredictor deviceActivityLikelihoodQueryPredicate](_DKPredictor, "deviceActivityLikelihoodQueryPredicate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3528];
  v11[0] = v6;
  v11[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "andPredicateWithSubpredicates:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)executeWithStorage:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "date");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[_DKDeviceActivityStandingQuery executeWithStorage:referenceDate:](self, "executeWithStorage:referenceDate:", v5, v6);

}

- (_DKHistogram)histogramForDate:(void *)a3 withReference:(void *)a4 andUpdate:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _DKHistogram *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "component:fromDate:", 512, v7);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v12);
    v13 = (_DKHistogram *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      v13 = objc_alloc_init(_DKHistogram);
      +[_DKSystemEventStreams deviceActivityLevelStream](_DKSystemEventStreams, "deviceActivityLevelStream");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[_DKHistogram setStream:](v13, "setStream:", v14);

      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v7, v8);
      -[_DKHistogram setInterval:](v13, "setInterval:", v15);

      -[_DKDeviceActivityStandingQuery _customIdentifierForDayOfWeek:](a1, v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[_DKHistogram setCustomIdentifier:](v13, "setCustomIdentifier:", v16);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, v17);

    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)executeWithStorage:(id)a3 referenceDate:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t (*__ptr32 *v21)();
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  float v35;
  double v36;
  void *v37;
  void *v38;
  double v39;
  int v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  double v47;
  float v48;
  double v49;
  void *v50;
  void *v51;
  double v52;
  long double v53;
  double v54;
  void *v55;
  double v56;
  double v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  double v63;
  double v64;
  float v65;
  double v66;
  NSObject *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  NSObject *v71;
  uint64_t v72;
  uint64_t v73;
  double v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  NSObject *v82;
  void *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  double v87;
  double v88;
  float v89;
  double v90;
  void *v91;
  id v92;
  uint64_t v93;
  NSObject *v94;
  id v95;
  void *v96;
  void *v97;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  id v103;
  void *context;
  void *contexta;
  NSObject *obj;
  NSObject *v107;
  _QWORD v108[5];
  id v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  uint8_t v114;
  _BYTE v115[15];
  uint8_t v116;
  _BYTE v117[15];
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  id v122;
  uint8_t v123[128];
  uint8_t buf[4];
  id v125;
  __int16 v126;
  void *v127;
  __int16 v128;
  int v129;
  _BYTE v130[128];
  void *v131;
  _QWORD v132[4];

  v132[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((-[_DKDeviceActivityStandingQuery _shouldDefer]((uint64_t)self) & 1) == 0)
  {
    -[_DKDeviceActivityStandingQuery _predicateForDeletedEventsWithReferenceDate:]((uint64_t)self, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    +[_DKSystemEventStreams deviceActivityLevelStream](_DKSystemEventStreams, "deviceActivityLevelStream");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v132[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v132, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v131 = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v131, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = (void *)v8;
    +[_DKEventQuery eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:](_DKEventQuery, "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:", v8, v10, 0, 0, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[_DKDeviceActivityStandingQuery queryIdentifier](self, "queryIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v13, "setClientName:", v14);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_DKStandingQuery.m");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringByAppendingFormat:", CFSTR(":%d"), 118);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setClientName:", v16);

    }
    v122 = 0;
    objc_msgSend(v6, "executeQuery:error:", v13, &v122);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v122;
    if ((-[_DKDeviceActivityStandingQuery _shouldDefer]((uint64_t)self) & 1) != 0)
      goto LABEL_77;
    if (v18)
    {
      +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[_DKDeviceActivityStandingQuery executeWithStorage:referenceDate:].cold.6((uint64_t)v18, v19, v20);

    }
    if (!objc_msgSend(v17, "count"))
    {
      +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
      v107 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v107, OS_LOG_TYPE_DEBUG))
        -[_DKDeviceActivityStandingQuery executeWithStorage:referenceDate:].cold.1(v107, v69, v70);
      goto LABEL_76;
    }
    v95 = v18;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 7);
    v107 = objc_claimAutoreleasedReturnValue();
    v118 = 0u;
    v119 = 0u;
    v120 = 0u;
    v121 = 0u;
    obj = v17;
    v21 = &off_18DF4C000;
    v101 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v118, v130, 16);
    v103 = v6;
    v96 = v17;
    v97 = v13;
    if (v101)
    {
      v99 = *(_QWORD *)v119;
LABEL_13:
      v22 = 0;
      while (1)
      {
        if (*(_QWORD *)v119 != v99)
          objc_enumerationMutation(obj);
        v23 = *(void **)(*((_QWORD *)&v118 + 1) + 8 * v22);
        if ((-[_DKDeviceActivityStandingQuery _shouldDefer]((uint64_t)self) & 1) != 0)
          break;
        v24 = (void *)MEMORY[0x193FEE914]();
        objc_msgSend(v23, "startDate");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v25;
        if (self)
          v27 = (int)objc_msgSend(v25, "slotFromMidnightWithTotalSlotsInDay:", 96);
        else
          v27 = 0;

        objc_msgSend(v23, "startDate");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[_DKDeviceActivityStandingQuery histogramForDate:withReference:andUpdate:](self, v28, v7, v107);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v23, "startDate");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "timeIntervalSinceDate:", v30);
        v32 = v31;
        v33 = -[_DKDeviceActivityStandingQuery _deviceActivityEphemerality]((uint64_t)self);
        if (v32 <= v33)
        {
          +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
          v71 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
            -[_DKDeviceActivityStandingQuery executeWithStorage:referenceDate:].cold.5(v71, v72, v73);

          objc_autoreleasePoolPop(v24);
          v17 = v96;
          v13 = v97;
          v21 = &off_18DF4C000;
          goto LABEL_55;
        }
        v34 = v33;
        context = v24;
        v35 = (v32 - v33) / -604800.0;
        v36 = exp2f(v35);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v27);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "addValue:withCount:", v37, v36);

        objc_msgSend(v23, "endDate");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "timeIntervalSinceDate:", v30);
        v40 = (int)v39;

        +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v23, "endDate");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v125 = v30;
          v126 = 2112;
          v127 = v42;
          v128 = 1024;
          v129 = v40;
          _os_log_impl(&dword_18DDBE000, v41, OS_LOG_TYPE_INFO, "Binning event with startDate: %@, endDate: %@ (excessTime = %d)", buf, 0x1Cu);

        }
        if (v40 < 1)
        {
          v44 = v30;
          v46 = v29;
        }
        else
        {
          while (1)
          {
            v43 = (void *)MEMORY[0x193FEE914]();
            if (v40 <= 0x384)
              break;
            objc_msgSend(v30, "dateByAddingTimeInterval:", 900.0);
            v44 = (void *)objc_claimAutoreleasedReturnValue();

            if (self)
              v45 = (int)objc_msgSend(v44, "slotFromMidnightWithTotalSlotsInDay:", 96);
            else
              v45 = 0;
            -[_DKDeviceActivityStandingQuery histogramForDate:withReference:andUpdate:](self, v44, v7, v107);
            v46 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v7, "timeIntervalSinceDate:", v44);
            if (v47 <= v34)
            {
              +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
              v67 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
                -[_DKDeviceActivityStandingQuery executeWithStorage:referenceDate:].cold.3(&v114, v115, v67);
              v30 = v44;
LABEL_39:

              goto LABEL_41;
            }
            v48 = (v47 - v34) / -604800.0;
            v49 = exp2f(v48);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v45);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "addValue:withCount:", v50, v49);

            objc_msgSend(v23, "endDate");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "timeIntervalSinceDate:", v44);
            v40 = (int)v52;

            objc_autoreleasePoolPop(v43);
            v29 = v46;
            v30 = v44;
            if (v40 <= 0)
              goto LABEL_42;
          }
          objc_msgSend(v30, "timeIntervalSince1970");
          v54 = fmod(v53, 900.0);
          objc_msgSend(v23, "endDate");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "timeIntervalSinceDate:", v30);
          v57 = v56;

          if (v54 + v57 > 900.0)
          {
            objc_msgSend(v23, "endDate", v54 + v57);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v59 = v58;
            if (self)
              v60 = (int)objc_msgSend(v58, "slotFromMidnightWithTotalSlotsInDay:", 96);
            else
              v60 = 0;

            objc_msgSend(v23, "endDate");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            -[_DKDeviceActivityStandingQuery histogramForDate:withReference:andUpdate:](self, v61, v7, v107);
            v46 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v23, "endDate");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "timeIntervalSinceDate:", v62);
            v64 = v63;

            if (v64 <= v34)
            {
              +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
              v67 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
                -[_DKDeviceActivityStandingQuery executeWithStorage:referenceDate:].cold.3(&v116, v117, v67);
            }
            else
            {
              v65 = (v64 - v34) / -604800.0;
              v66 = exp2f(v65);
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v60);
              v67 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "addValue:withCount:", v67, v66);
            }
            goto LABEL_39;
          }
          v46 = v29;
LABEL_41:
          objc_autoreleasePoolPop(v43);
          v44 = v30;
        }
LABEL_42:

        objc_autoreleasePoolPop(context);
        ++v22;
        v6 = v103;
        if (v22 == v101)
        {
          v68 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v118, v130, 16);
          v17 = v96;
          v13 = v97;
          v21 = &off_18DF4C000;
          v101 = v68;
          if (v68)
            goto LABEL_13;
          goto LABEL_55;
        }
      }
    }
    else
    {
LABEL_55:

      v112 = 0u;
      v113 = 0u;
      v110 = 0u;
      v111 = 0u;
      obj = v107;
      v102 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v110, v123, 16);
      if (!v102)
      {
LABEL_75:
        v18 = v95;

LABEL_76:
LABEL_77:

        goto LABEL_78;
      }
      v100 = *(_QWORD *)v111;
      v74 = *((double *)v21 + 265);
LABEL_57:
      v75 = 0;
      while (1)
      {
        if (*(_QWORD *)v111 != v100)
          objc_enumerationMutation(obj);
        v76 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * v75);
        if ((-[_DKDeviceActivityStandingQuery _shouldDefer]((uint64_t)self) & 1) != 0)
          break;
        -[_DKDeviceActivityStandingQuery _customIdentifierForDayOfWeek:](self, objc_msgSend(v76, "integerValue"));
        v77 = objc_claimAutoreleasedReturnValue();
        +[_DKSystemEventStreams deviceActivityLevelStream](_DKSystemEventStreams, "deviceActivityLevelStream");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        contexta = (void *)v77;
        +[_DKHistogramQuery histogramQueryForPersistedHistogramsForStream:withCustomIdentifier:](_DKHistogramQuery, "histogramQueryForPersistedHistogramsForStream:withCustomIdentifier:", v78, v77);
        v79 = (void *)objc_claimAutoreleasedReturnValue();

        v109 = 0;
        objc_msgSend(v6, "executeQuery:error:", v79, &v109);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v81 = v109;
        if (v81)
        {
          +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
          v82 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v125 = v81;
            _os_log_debug_impl(&dword_18DDBE000, v82, OS_LOG_TYPE_DEBUG, "Encountered error while fetching existing device activity histogram: %@", buf, 0xCu);
          }

        }
        -[NSObject objectForKeyedSubscript:](obj, "objectForKeyedSubscript:", v76);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        if (v80)
        {
          v84 = objc_msgSend(v6, "deleteHistogram:", v80);
          if (v84 != 1)
          {
            v93 = v84;
            +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
            v94 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
              -[_DKDeviceActivityStandingQuery executeWithStorage:referenceDate:].cold.2(v93, v94);

            break;
          }
          objc_msgSend(v80, "interval");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v85, "endDate");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "timeIntervalSinceDate:", v86);
          v88 = v87;

          v6 = v103;
          v89 = v88 / v74;
          v90 = exp2f(v89);
          -[NSObject objectForKeyedSubscript:](obj, "objectForKeyedSubscript:", v76);
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "addHistogram:decayingExistingCounts:", v91, v90);

          v92 = v80;
          v83 = v92;
        }
        v108[0] = MEMORY[0x1E0C809B0];
        v108[1] = 3221225472;
        v108[2] = __67___DKDeviceActivityStandingQuery_executeWithStorage_referenceDate___block_invoke;
        v108[3] = &unk_1E26E66F8;
        v108[4] = v76;
        objc_msgSend(v6, "saveHistogram:responseQueue:withCompletion:", v83, 0, v108);

        if (v102 == ++v75)
        {
          v102 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v110, v123, 16);
          if (v102)
            goto LABEL_57;
          break;
        }
      }
    }
    v17 = v96;
    v13 = v97;
    goto LABEL_75;
  }
LABEL_78:

}

- (id)fetchResult
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "component:fromDate:", 512, v4);

  return -[_DKDeviceActivityStandingQuery fetchResultForDayOfWeek:](self, "fetchResultForDayOfWeek:", v5);
}

- (id)fetchResultForDayOfWeek:(int64_t)a3
{
  void *v5;
  void *v6;

  +[_DKKnowledgeStore knowledgeStore](_DKKnowledgeStore, "knowledgeStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKDeviceActivityStandingQuery fetchResultForDayOfWeek:withStorage:](self, "fetchResultForDayOfWeek:withStorage:", a3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)fetchResultFromStorage:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = (void *)MEMORY[0x1E0C99D48];
  v5 = a3;
  objc_msgSend(v4, "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "component:fromDate:", 512, v7);

  -[_DKDeviceActivityStandingQuery fetchResultForDayOfWeek:withStorage:](self, "fetchResultForDayOfWeek:withStorage:", v8, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)fetchResultForDayOfWeek:(int64_t)a3 withStorage:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  -[_DKDeviceActivityStandingQuery _customIdentifierForDayOfWeek:](self, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKSystemEventStreams deviceActivityLevelStream](_DKSystemEventStreams, "deviceActivityLevelStream");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKHistogramQuery histogramQueryForPersistedHistogramsForStream:withCustomIdentifier:](_DKHistogramQuery, "histogramQueryForPersistedHistogramsForStream:withCustomIdentifier:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "executeQuery:error:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)queryIdentifier
{
  return self->queryIdentifier;
}

- (void)setQueryIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->queryIdentifier, a3);
}

- (OS_xpc_object)activity
{
  return self->activity;
}

- (void)setActivity:(id)a3
{
  objc_storeStrong((id *)&self->activity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->activity, 0);
  objc_storeStrong((id *)&self->queryIdentifier, 0);
}

- (void)executeWithStorage:(uint64_t)a3 referenceDate:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_6_6(&dword_18DDBE000, a1, a3, "No device activity events to process.", v3);
}

- (void)executeWithStorage:(uint64_t)a1 referenceDate:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_1_1(&dword_18DDBE000, a2, v4, "Did not delete expected number of histograms (%@).", (uint8_t *)&v5);

}

- (void)executeWithStorage:(NSObject *)a3 referenceDate:.cold.3(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_6_6(&dword_18DDBE000, a3, (uint64_t)a3, "Encountered event still has time to live, skip soon-to-to-deleted histogram construction as this point.", a1);
}

- (void)executeWithStorage:(uint64_t)a3 referenceDate:.cold.5(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_6_6(&dword_18DDBE000, a1, a3, "Encountered event still has time to live, skip soon-to-to-deleted historgram construction as this point.", v3);
}

- (void)executeWithStorage:(uint64_t)a3 referenceDate:.cold.6(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_1_1(&dword_18DDBE000, a2, a3, "Encountered error while fetching device activity events to be deleted: %@.", (uint8_t *)&v3);
  OUTLINED_FUNCTION_5();
}

@end

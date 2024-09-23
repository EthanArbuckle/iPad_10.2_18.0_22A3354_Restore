@implementation _DKSyncLocalKnowledgeStorage

- (id)initWithKnowledgeStorage:(id *)a1
{
  id v4;
  id *v5;
  objc_super v7;

  v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)_DKSyncLocalKnowledgeStorage;
    v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5)
      objc_storeStrong(v5 + 1, a2);
  }

  return a1;
}

- (id)sortedEventsFromSyncWindows:(id)a3 streamNames:(id)a4 limit:(unint64_t)a5 fetchOrder:(int64_t)a6 error:(id *)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;

  v12 = a4;
  v13 = a3;
  +[_DKCompatibility currentCompatibility](_DKCompatibility, "currentCompatibility");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKSyncLocalKnowledgeStorage sortedEventsFromSyncWindows:streamNames:compatibility:limit:fetchOrder:error:](self, "sortedEventsFromSyncWindows:streamNames:compatibility:limit:fetchOrder:error:", v13, v12, v14, a5, a6, a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)sortedEventsFromSyncWindows:(id)a3 streamNames:(id)a4 compatibility:(id)a5 limit:(unint64_t)a6 fetchOrder:(int64_t)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  char v81;
  unint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  _DKKnowledgeStorage *storage;
  id v93;
  void *v94;
  uint64_t v95;
  NSObject *v96;
  void *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t j;
  void *v102;
  void *v103;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  id v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  id *v125;
  id v126;
  _DKSyncLocalKnowledgeStorage *v127;
  unint64_t v128;
  void *v129;
  void *v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  id v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  uint8_t v140[128];
  uint8_t buf[4];
  void *v142;
  __int16 v143;
  void *v144;
  __int16 v145;
  void *v146;
  __int16 v147;
  void *v148;
  __int16 v149;
  void *v150;
  void *v151;
  _QWORD v152[2];
  _QWORD v153[2];
  _QWORD v154[2];
  _QWORD v155[2];
  _QWORD v156[2];
  _QWORD v157[3];
  _QWORD v158[2];
  _QWORD v159[2];
  _QWORD v160[2];
  _QWORD v161[2];
  _QWORD v162[2];
  _QWORD v163[2];
  _BYTE v164[128];
  uint64_t v165;

  v165 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  if (a8)
    *a8 = 0;
  if (!objc_msgSend(v14, "count") || !objc_msgSend(v15, "count"))
  {
    v30 = 0;
    goto LABEL_49;
  }
  v127 = self;
  v128 = a6;
  v125 = a8;
  v126 = v14;
  v129 = v16;
  v130 = v15;
  v138 = 0u;
  v139 = 0u;
  v136 = 0u;
  v137 = 0u;
  v17 = v14;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v136, v164, 16);
  if (v18)
  {
    v19 = v18;
    v20 = 0;
    v21 = *(_QWORD *)v137;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v137 != v21)
          objc_enumerationMutation(v17);
        v23 = *(_QWORD *)(*((_QWORD *)&v136 + 1) + 8 * i);
        -[_DKSyncWindow startDate](v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[_DKSyncType urgency](v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (a7 == 2)
          +[_DKQuery predicateForEventsWithCreationInDateRangeFrom:toBefore:](_DKQuery, "predicateForEventsWithCreationInDateRangeFrom:toBefore:", v24, v25);
        else
          +[_DKQuery predicateForEventsWithCreationInDateRangeFromAfter:to:](_DKQuery, "predicateForEventsWithCreationInDateRangeFromAfter:to:", v24, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          v27 = (void *)MEMORY[0x1E0CB3528];
          v163[0] = v20;
          v163[1] = v26;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v163, 2);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "orPredicateWithSubpredicates:", v28);
          v29 = objc_claimAutoreleasedReturnValue();

          v20 = (id)v29;
        }
        else
        {
          v20 = v26;
        }

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v136, v164, 16);
    }
    while (v19);
  }
  else
  {
    v20 = 0;
  }

  v31 = v130;
  +[_DKQuery predicateForEventsWithStreamNames:](_DKQuery, "predicateForEventsWithStreamNames:", v130);
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = (void *)MEMORY[0x1E0CB3528];
  v162[0] = v20;
  v124 = (void *)v32;
  v162[1] = v32;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v162, 2);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "andPredicateWithSubpredicates:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  +[_DKQuery predicateForEventsWithNullSourceDeviceID](_DKQuery, "predicateForEventsWithNullSourceDeviceID");
  v36 = objc_claimAutoreleasedReturnValue();
  v37 = (void *)MEMORY[0x1E0CB3528];
  v161[0] = v35;
  v123 = (void *)v36;
  v161[1] = v36;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v161, 2);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "andPredicateWithSubpredicates:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  +[_DKSystemEventStreams displayIsBacklit](_DKSystemEventStreams, "displayIsBacklit");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "name");
  v41 = objc_claimAutoreleasedReturnValue();

  v122 = (void *)v41;
  if (objc_msgSend(v130, "containsObject:", v41))
  {
    +[_DKQuery predicateForEventsWithStreamName:](_DKQuery, "predicateForEventsWithStreamName:", v41);
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3528], "notPredicateWithSubpredicate:", v120);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKAnyIntegerCategory type](_DKAnyIntegerCategory, "type");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKCategory categoryWithInteger:type:](_DKCategory, "categoryWithInteger:type:", 1, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKQuery predicateForEventsWithCategoryValue:](_DKQuery, "predicateForEventsWithCategoryValue:", v43);
    v117 = (void *)objc_claimAutoreleasedReturnValue();

    +[_DKQuery predicateForEventsWithMinimumDuration:](_DKQuery, "predicateForEventsWithMinimumDuration:", 6.0);
    v44 = v39;
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = (void *)MEMORY[0x1E0CB3528];
    v160[0] = v117;
    v160[1] = v114;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v160, 2);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "andPredicateWithSubpredicates:", v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    v48 = (void *)MEMORY[0x1E0CB3528];
    v159[0] = v111;
    v159[1] = v47;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v159, 2);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "orPredicateWithSubpredicates:", v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    v51 = (void *)MEMORY[0x1E0CB3528];
    v31 = v130;
    v158[0] = v39;
    v158[1] = v50;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v158, 2);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "andPredicateWithSubpredicates:", v52);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

  }
  +[_DKSystemEventStreams nowPlayingStream](_DKSystemEventStreams, "nowPlayingStream");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "name");
  v54 = objc_claimAutoreleasedReturnValue();

  v121 = (void *)v54;
  if (objc_msgSend(v31, "containsObject:", v54))
  {
    +[_DKQuery predicateForEventsWithStreamName:](_DKQuery, "predicateForEventsWithStreamName:", v54);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3528], "notPredicateWithSubpredicate:", v115);
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKQuery predicateForEventsWithStringValue:](_DKQuery, "predicateForEventsWithStringValue:", CFSTR("com.apple.quicklook.UIExtension"));
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKNowPlayingMetadataKey mediaType](_DKNowPlayingMetadataKey, "mediaType");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKQuery predicateForObjectsWithMetadataKey:andStringValue:](_DKQuery, "predicateForObjectsWithMetadataKey:andStringValue:", v55, CFSTR("kMRMediaRemoteNowPlayingInfoTypeVideo"));
    v110 = (void *)objc_claimAutoreleasedReturnValue();

    +[_DKNowPlayingMetadataKey playing](_DKNowPlayingMetadataKey, "playing");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKQuery predicateForObjectsWithMetadataKey:andIntegerValue:](_DKQuery, "predicateForObjectsWithMetadataKey:andIntegerValue:", v56, 1);
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    v58 = (void *)MEMORY[0x1E0CB3528];
    v157[0] = v112;
    v157[1] = v110;
    v157[2] = v57;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v157, 3);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "andPredicateWithSubpredicates:", v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    v61 = (void *)MEMORY[0x1E0CB3528];
    v156[0] = v118;
    v156[1] = v60;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v156, 2);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "orPredicateWithSubpredicates:", v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    v64 = (void *)MEMORY[0x1E0CB3528];
    v155[0] = v39;
    v155[1] = v63;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v155, 2);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "andPredicateWithSubpredicates:", v65);
    v66 = objc_claimAutoreleasedReturnValue();

    v31 = v130;
    v39 = (void *)v66;
  }
  +[_DKSystemEventStreams appActivityStream](_DKSystemEventStreams, "appActivityStream");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "name");
  v68 = objc_claimAutoreleasedReturnValue();

  v119 = (void *)v68;
  if (objc_msgSend(v31, "containsObject:", v68))
  {
    +[_DKQuery predicateForEventsWithStreamName:](_DKQuery, "predicateForEventsWithStreamName:", v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3528], "notPredicateWithSubpredicate:", v69);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKApplicationActivityMetadataKey isEligibleForPrediction](_DKApplicationActivityMetadataKey, "isEligibleForPrediction");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKQuery predicateForObjectsWithMetadataKey:andIntegerValue:](_DKQuery, "predicateForObjectsWithMetadataKey:andIntegerValue:", v71, 1);
    v72 = (void *)objc_claimAutoreleasedReturnValue();

    v73 = (void *)MEMORY[0x1E0CB3528];
    v154[0] = v70;
    v154[1] = v72;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v154, 2);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "orPredicateWithSubpredicates:", v74);
    v75 = (void *)objc_claimAutoreleasedReturnValue();

    v76 = (void *)MEMORY[0x1E0CB3528];
    v153[0] = v39;
    v153[1] = v75;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v153, 2);
    v77 = v39;
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "andPredicateWithSubpredicates:", v78);
    v79 = objc_claimAutoreleasedReturnValue();

    v39 = (void *)v79;
  }
  +[_DKCompatibility currentCompatibility](_DKCompatibility, "currentCompatibility");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = objc_msgSend(v129, "isEqual:", v80);

  if ((v81 & 1) != 0)
  {
    v82 = 0x1E0C99000;
  }
  else
  {
    objc_msgSend(v129, "eventPredicate");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = (void *)MEMORY[0x1E0CB3528];
    v152[0] = v39;
    v152[1] = v83;
    v82 = 0x1E0C99000uLL;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v152, 2);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "andPredicateWithSubpredicates:", v85);
    v86 = objc_claimAutoreleasedReturnValue();

    v39 = (void *)v86;
  }
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), a7 != 2);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v151 = v87;
  objc_msgSend(*(id *)(v82 + 3360), "arrayWithObjects:count:", &v151, 1);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKEventQuery eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:](_DKEventQuery, "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:", v39, 0, 0, v128, v88);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_DKSyncLocalKnowledgeStorage.m");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "stringByAppendingFormat:", CFSTR(":%d"), 198);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "setClientName:", v91);

  objc_msgSend(v89, "setTracker:", &__block_literal_global_42);
  storage = v127->_storage;
  v135 = 0;
  -[_DKKnowledgeStorage executeQuery:error:](storage, "executeQuery:error:", v89, &v135);
  v30 = (id)objc_claimAutoreleasedReturnValue();
  v93 = v135;
  if (a7 == 2 && v30)
  {
    if (!objc_msgSend(v30, "count"))
      goto LABEL_35;
    objc_msgSend(v30, "reverseObjectEnumerator");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "allObjects");
    v95 = objc_claimAutoreleasedReturnValue();

    v30 = (id)v95;
  }
  if (v30)
  {
LABEL_35:
    if (objc_msgSend(v30, "count"))
    {
      v113 = v93;
      v116 = v39;
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v96 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v96, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v30, "count"));
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        _DKSyncLoggingWindowsDescription(v17);
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        _CDPrettyPrintCollection(v130, 0, 0, 0);
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v128);
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v142 = v105;
        v143 = 2112;
        v144 = v106;
        v145 = 2114;
        v146 = v107;
        v147 = 2114;
        v148 = v108;
        v149 = 2112;
        v150 = v109;
        _os_log_debug_impl(&dword_18DDBE000, v96, OS_LOG_TYPE_DEBUG, "%{public}@: Found %@ events in windows %{public}@ on streams %{public}@ with limit %@", buf, 0x34u);

      }
      v97 = (void *)objc_opt_new();
      v131 = 0u;
      v132 = 0u;
      v133 = 0u;
      v134 = 0u;
      v30 = v30;
      v98 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v131, v140, 16);
      if (v98)
      {
        v99 = v98;
        v100 = *(_QWORD *)v132;
        do
        {
          for (j = 0; j != v99; ++j)
          {
            if (*(_QWORD *)v132 != v100)
              objc_enumerationMutation(v30);
            objc_msgSend(*(id *)(*((_QWORD *)&v131 + 1) + 8 * j), "stream");
            v102 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v102, "name");
            v103 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v97, "addObject:", v103);

          }
          v99 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v131, v140, 16);
        }
        while (v99);
      }

      +[_DKSyncLocalKnowledgeStorage _updateEventStatsWithFetchEventsTotal:streamNameCounts:]((uint64_t)_DKSyncLocalKnowledgeStorage, objc_msgSend(v30, "count"), v97);
      v93 = v113;
      v39 = v116;
    }
  }
  if (v125)
    *v125 = objc_retainAutorelease(v93);

  v14 = v126;
  v16 = v129;
  v15 = v130;
LABEL_49:

  return v30;
}

+ (void)_updateEventStatsWithFetchEventsTotal:(void *)a3 streamNameCounts:
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_self();
  if (_updateEventStatsWithFetchEventsTotal_streamNameCounts__fetchEventsCounterInitialized != -1)
    dispatch_once(&_updateEventStatsWithFetchEventsTotal_streamNameCounts__fetchEventsCounterInitialized, &__block_literal_global_31_0);
  -[_DKEventStatsCounter incrementCountByNumber:](_updateEventStatsWithFetchEventsTotal_streamNameCounts__fetchEventsTotalCounter, a2);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend((id)_updateEventStatsWithFetchEventsTotal_streamNameCounts__fetchEventsCountersByStreamName, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          v12 = (void *)MEMORY[0x1E0CB3940];
          +[_DKEventStatsUtilities safeStringWithString:](_DKEventStatsUtilities, "safeStringWithString:", v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "stringWithFormat:", CFSTR("sync_fetch_local_events_stream%@"), v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          +[_DKEventStatsCounter counterInCollection:withEventName:]((uint64_t)_DKEventStatsCounter, CFSTR("coreduet_sync2"), v14);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)_updateEventStatsWithFetchEventsTotal_streamNameCounts__fetchEventsCountersByStreamName, "setObject:forKeyedSubscript:", v11, v10);

        }
        -[_DKEventStatsCounter incrementCountByNumber:]((uint64_t)v11, objc_msgSend(v5, "countForObject:", v10));

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

}

- (id)tombstonesSinceDate:(id)a3 streamNames:(id)a4 limit:(unint64_t)a5 endDate:(id *)a6 error:(id *)a7
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  unint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _DKKnowledgeStorage *storage;
  NSObject *v41;
  id *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t j;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id *v63;
  id v64;
  _DKSyncLocalKnowledgeStorage *v65;
  void *v66;
  void *v67;
  void *v68;
  id *v69;
  void *v70;
  void *v71;
  void *v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  id v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  uint8_t v83[128];
  uint8_t buf[4];
  void *v85;
  __int16 v86;
  void *v87;
  __int16 v88;
  void *v89;
  __int16 v90;
  void *v91;
  void *v92;
  _QWORD v93[2];
  _QWORD v94[2];
  _BYTE v95[128];
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = v12;
  if (a7)
    *a7 = 0;
  if (objc_msgSend(v12, "count"))
  {
    v65 = self;
    v63 = a6;
    v69 = a7;
    v71 = v11;
    v14 = (void *)objc_opt_new();
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    v70 = v13;
    v15 = v13;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v79, v95, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v80;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v80 != v18)
            objc_enumerationMutation(v15);
          v20 = *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * i);
          +[_DKTombstoneMetadataKey eventStreamName](_DKTombstoneMetadataKey, "eventStreamName");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          +[_DKQuery predicateForObjectsWithMetadataKey:andStringValue:](_DKQuery, "predicateForObjectsWithMetadataKey:andStringValue:", v21, v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v22);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v79, v95, 16);
      }
      while (v17);
    }

    objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v14);
    v23 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v71;
    +[_DKQuery predicateForEventsWithCreationInDateRangeFromAfter:to:](_DKQuery, "predicateForEventsWithCreationInDateRangeFromAfter:to:", v71, v24);
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)MEMORY[0x1E0CB3528];
    v67 = (void *)v25;
    v68 = (void *)v23;
    v94[0] = v23;
    v94[1] = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v94, 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "andPredicateWithSubpredicates:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if ((uint64_t)a5 < 1)
    {
      v31 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v93[0] = v29;
      v93[1] = v30;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v93, 2);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

    }
    +[_DKSystemEventStreams tombstoneStream](_DKSystemEventStreams, "tombstoneStream");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = v33;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v92, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = a5;
    v73 = v31;
    +[_DKEventQuery eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:](_DKEventQuery, "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:", v28, v34, 0, v35, v31);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_DKSyncLocalKnowledgeStorage.m");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "stringByAppendingFormat:", CFSTR(":%d"), 272);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setClientName:", v38);

    v39 = v36;
    objc_msgSend(v36, "setTracker:", &__block_literal_global_29);
    objc_msgSend(v36, "setReadMetadata:", 1);
    storage = v65->_storage;
    v78 = 0;
    -[_DKKnowledgeStorage executeQuery:error:](storage, "executeQuery:error:", v36, &v78);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v78;
    if (v64)
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v41 = objc_claimAutoreleasedReturnValue();
      v42 = v69;
      v43 = v64;
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
        -[_DKSyncLocalKnowledgeStorage tombstonesSinceDate:streamNames:limit:endDate:error:].cold.1((uint64_t)v65, v64, v41);

    }
    else if (objc_msgSend(v32, "count"))
    {
      v61 = v36;
      v62 = v24;
      v44 = (void *)objc_opt_new();
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v32, "count"));
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDate dk_localtimeString](v71);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        _CDPrettyPrintCollection(v15, 0, 0, 0);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v85 = v56;
        v86 = 2112;
        v87 = v57;
        v88 = 2114;
        v89 = v58;
        v90 = 2114;
        v91 = v59;
        _os_log_debug_impl(&dword_18DDBE000, v45, OS_LOG_TYPE_DEBUG, "%{public}@: Found %@ tombstones since %{public}@ on streams %{public}@", buf, 0x2Au);

      }
      v66 = v28;

      v76 = 0u;
      v77 = 0u;
      v74 = 0u;
      v75 = 0u;
      v60 = v32;
      v46 = v32;
      v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v74, v83, 16);
      if (v47)
      {
        v48 = v47;
        v49 = *(_QWORD *)v75;
        do
        {
          for (j = 0; j != v48; ++j)
          {
            if (*(_QWORD *)v75 != v49)
              objc_enumerationMutation(v46);
            objc_msgSend(*(id *)(*((_QWORD *)&v74 + 1) + 8 * j), "metadata");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            +[_DKTombstoneMetadataKey eventStreamName](_DKTombstoneMetadataKey, "eventStreamName");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "objectForKeyedSubscript:", v52);
            v53 = (void *)objc_claimAutoreleasedReturnValue();

            if (v53)
              objc_msgSend(v44, "addObject:", v53);

          }
          v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v74, v83, 16);
        }
        while (v48);
      }

      if (v63)
      {
        objc_msgSend(v46, "lastObject");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "creationDate");
        *v63 = (id)objc_claimAutoreleasedReturnValue();

      }
      +[_DKSyncLocalKnowledgeStorage _updateEventStatsWithFetchTombstonesTotal:streamNameCounts:]((uint64_t)_DKSyncLocalKnowledgeStorage, objc_msgSend(v46, "count"), v44);

      v11 = v71;
      v31 = v73;
      v42 = v69;
      v39 = v61;
      v24 = v62;
      v43 = 0;
      v28 = v66;
      v32 = v60;
    }
    else
    {
      v42 = v69;
      v43 = 0;
      if (v63)
        *v63 = objc_retainAutorelease(v24);
    }
    v13 = v70;
    if (v42)
      *v42 = objc_retainAutorelease(v43);

  }
  else
  {
    v32 = 0;
  }

  return v32;
}

+ (void)_updateEventStatsWithFetchTombstonesTotal:(void *)a3 streamNameCounts:
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_self();
  if (_updateEventStatsWithFetchTombstonesTotal_streamNameCounts__fetchTombstonesCounterInitialized != -1)
    dispatch_once(&_updateEventStatsWithFetchTombstonesTotal_streamNameCounts__fetchTombstonesCounterInitialized, &__block_literal_global_39);
  -[_DKEventStatsCounter incrementCountByNumber:](_updateEventStatsWithFetchTombstonesTotal_streamNameCounts__fetchTombstonesTotalCounter, a2);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend((id)_updateEventStatsWithFetchTombstonesTotal_streamNameCounts__fetchTombstonesCountersByStreamName, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          v12 = (void *)MEMORY[0x1E0CB3940];
          +[_DKEventStatsUtilities safeStringWithString:](_DKEventStatsUtilities, "safeStringWithString:", v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "stringWithFormat:", CFSTR("sync_fetch_local_tombstones_stream%@"), v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          +[_DKEventStatsCounter counterInCollection:withEventName:]((uint64_t)_DKEventStatsCounter, CFSTR("coreduet_sync2"), v14);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)_updateEventStatsWithFetchTombstonesTotal_streamNameCounts__fetchTombstonesCountersByStreamName, "setObject:forKeyedSubscript:", v11, v10);

        }
        -[_DKEventStatsCounter incrementCountByNumber:]((uint64_t)v11, objc_msgSend(v5, "countForObject:", v10));

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

}

- (id)sortedSyncDownWindowsOverlappingBetweenDate:(id)a3 andDate:(id)a4 peer:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _DKKnowledgeStorage *storage;
  void *v40;
  id v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t i;
  _QWORD *v51;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  id *v57;
  id v58;
  void *v59;
  void *v60;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  uint64_t v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  id v77;
  uint8_t buf[4];
  void *v79;
  __int16 v80;
  void *v81;
  __int16 v82;
  void *v83;
  __int16 v84;
  uint64_t v85;
  __int16 v86;
  id v87;
  _BYTE v88[128];
  _QWORD v89[2];
  _QWORD v90[2];
  _QWORD v91[3];
  _QWORD v92[2];
  _QWORD v93[3];

  v93[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (a6)
    *a6 = 0;
  v57 = a6;
  objc_msgSend(a5, "sourceDeviceID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKSyncMetadataStorage windowStreamNameWithSourceDeviceID:]((uint64_t)_DKSyncMetadataStorage, v11);
  v12 = objc_claimAutoreleasedReturnValue();

  +[_DKAnyStringIdentifier type](_DKAnyStringIdentifier, "type");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = (void *)v12;
  +[_DKEventStream eventStreamWithName:valueType:](_DKEventStream, "eventStreamWithName:valueType:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v93[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v93, 1);
  v72 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("TRUEPREDICATE"));
  v15 = objc_claimAutoreleasedReturnValue();
  +[_DKQuery predicateForEventsWithStartInDateRangeFrom:to:](_DKQuery, "predicateForEventsWithStartInDateRangeFrom:to:", v9, v10);
  v16 = objc_claimAutoreleasedReturnValue();
  +[_DKQuery predicateForEventsWithEndInDateRangeFrom:to:](_DKQuery, "predicateForEventsWithEndInDateRangeFrom:to:", v9, v10);
  v17 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = v9;
  +[_DKQuery predicateForEventsWithStartInDateRangeFrom:to:](_DKQuery, "predicateForEventsWithStartInDateRangeFrom:to:", v18, v9);
  v19 = objc_claimAutoreleasedReturnValue();

  v20 = (void *)v15;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKQuery predicateForEventsWithEndInDateRangeFrom:to:](_DKQuery, "predicateForEventsWithEndInDateRangeFrom:to:", v10, v21);
  v22 = objc_claimAutoreleasedReturnValue();

  v23 = (void *)MEMORY[0x1E0CB3528];
  v67 = (void *)v22;
  v68 = (void *)v19;
  v92[0] = v19;
  v92[1] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v92, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "andPredicateWithSubpredicates:", v24);
  v25 = objc_claimAutoreleasedReturnValue();

  v26 = (void *)MEMORY[0x1E0CB3528];
  v69 = (void *)v16;
  v91[0] = v16;
  v91[1] = v17;
  v27 = (void *)v17;
  v66 = (void *)v25;
  v91[2] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v91, 3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "orPredicateWithSubpredicates:", v28);
  v29 = objc_claimAutoreleasedReturnValue();

  v30 = (void *)MEMORY[0x1E0CB3528];
  v65 = (void *)v29;
  v90[0] = v29;
  v90[1] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v90, 2);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "andPredicateWithSubpredicates:", v31);
  v32 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 1);
  v33 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("endDate"), 1);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = (void *)v33;
  v89[0] = v33;
  v89[1] = v59;
  v34 = (void *)v72;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v89, 2);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = (void *)v32;
  +[_DKEventQuery eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:](_DKEventQuery, "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:", v32, v72, 0, 0x7FFFFFFFFFFFFFFFLL, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_DKSyncLocalKnowledgeStorage.m");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "stringByAppendingFormat:", CFSTR(":%d"), 411);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setClientName:", v38);

  objc_msgSend(v36, "setTracker:", &__block_literal_global_54);
  storage = self->_storage;
  v77 = 0;
  -[_DKKnowledgeStorage executeQuery:error:](storage, "executeQuery:error:", v36, &v77);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v77;
  if (v41)
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v42 = objc_claimAutoreleasedReturnValue();
    v43 = v70;
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "domain");
      v63 = v20;
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(v41, "code");
      *(_DWORD *)buf = 138544386;
      v79 = v53;
      v80 = 2114;
      v81 = v70;
      v82 = 2114;
      v83 = v54;
      v84 = 2048;
      v85 = v55;
      v86 = 2112;
      v87 = v41;
      _os_log_error_impl(&dword_18DDBE000, v42, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch missing additions window for stream %{public}@: %{public}@:%lld (%@)", buf, 0x34u);

      v20 = v63;
      v34 = (void *)v72;
    }

    v44 = v71;
    v45 = v57;
    if (v57)
    {
      v45 = 0;
      *v57 = objc_retainAutorelease(v41);
    }
  }
  else
  {
    v45 = (void *)objc_opt_new();
    if (objc_msgSend(v40, "count"))
    {
      v56 = v27;
      v58 = v10;
      v62 = v20;
      v75 = 0u;
      v76 = 0u;
      v73 = 0u;
      v74 = 0u;
      v46 = v40;
      v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v73, v88, 16);
      if (v47)
      {
        v48 = v47;
        v49 = *(_QWORD *)v74;
        do
        {
          for (i = 0; i != v48; ++i)
          {
            if (*(_QWORD *)v74 != v49)
              objc_enumerationMutation(v46);
            v51 = -[_DKSyncWindow initWithEvent:]([_DKSyncWindow alloc], *(void **)(*((_QWORD *)&v73 + 1) + 8 * i));
            objc_msgSend(v45, "addObject:", v51);

          }
          v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v73, v88, 16);
        }
        while (v48);
      }

      v43 = v70;
      v44 = v71;
      v27 = v56;
      v10 = v58;
      v34 = (void *)v72;
      v20 = v62;
    }
    else
    {
      v43 = v70;
      v44 = v71;
    }
  }

  return v45;
}

- (BOOL)saveSyncedDownWindows:(id)a3 peer:(id)a4 transportName:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  _DKKnowledgeStorage *storage;
  _BOOL4 v22;
  id v23;
  NSObject *v24;
  _BOOL4 v25;
  void *v26;
  int v28;
  __CFString *v29;
  const __CFString *v30;
  __CFString *v31;
  void *v32;
  int v33;
  __CFString *v34;
  const __CFString *v35;
  __CFString *v36;
  void *v37;
  void *v38;
  void *v39;
  __CFString *v40;
  uint64_t v41;
  void *v42;
  const __CFString *v43;
  const __CFString *v44;
  __CFString *v45;
  void *v46;
  void *v48;
  void *v49;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  const __CFString *v59;
  __int16 v60;
  const __CFString *v61;
  __int16 v62;
  __CFString *v63;
  __int16 v64;
  __CFString *v65;
  __int16 v66;
  uint64_t v67;
  __int16 v68;
  id v69;
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v9;
  objc_msgSend(v9, "sourceDeviceID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKSyncMetadataStorage windowStreamNameWithSourceDeviceID:]((uint64_t)_DKSyncMetadataStorage, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v15 = v8;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v52, v70, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v53 != v18)
          objc_enumerationMutation(v15);
        +[_DKSyncMetadataStorage eventFromFetchedWindow:windowStreamName:transportName:]((uint64_t)_DKSyncMetadataStorage, *(void **)(*((_QWORD *)&v52 + 1) + 8 * i), v13, v10);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
          objc_msgSend(v14, "addObject:", v20);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v52, v70, 16);
    }
    while (v17);
  }

  if (objc_msgSend(v14, "count"))
  {
    storage = self->_storage;
    v51 = 0;
    v22 = -[_DKKnowledgeStorage saveObjects:error:](storage, "saveObjects:error:", v14, &v51);
    v23 = v51;
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG);
    if (v23 || !v22)
    {
      v26 = v11;
      if (v25)
      {
        objc_msgSend((id)objc_opt_class(), "description");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v11, "me");
        v34 = &stru_1E26E9728;
        v35 = CFSTR("pseudo ");
        if (!v33)
          v35 = &stru_1E26E9728;
        v44 = v35;
        objc_msgSend(v11, "identifier");
        v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "model");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        if (v46)
        {
          v39 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v11, "model");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "stringWithFormat:", CFSTR(" (%@)"), v42);
          v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v23, "domain");
        v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v23, "code");
        *(_DWORD *)buf = 138544898;
        v57 = v49;
        v58 = 2114;
        v59 = v44;
        v60 = 2114;
        v61 = v36;
        v62 = 2114;
        v63 = v34;
        v64 = 2114;
        v65 = v40;
        v66 = 2048;
        v67 = v41;
        v68 = 2112;
        v69 = v23;
        _os_log_debug_impl(&dword_18DDBE000, v24, OS_LOG_TYPE_DEBUG, "%{public}@: Failed to save additions windows for %{public}@peer %{public}@%{public}@: %{public}@:%lld (%@)", buf, 0x48u);

        if (v46)
        {

        }
      }

    }
    else
    {
      v26 = v11;
      if (v25)
      {
        objc_msgSend((id)objc_opt_class(), "description");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v14, "count"));
        v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v11, "me");
        v29 = &stru_1E26E9728;
        v30 = CFSTR("pseudo ");
        if (!v28)
          v30 = &stru_1E26E9728;
        v43 = v30;
        objc_msgSend(v11, "identifier");
        v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "model");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (v32)
        {
          v37 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v26, "model");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "stringWithFormat:", CFSTR(" (%@)"), v42);
          v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        _DKSyncLoggingWindowsDescription(v15);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v57 = v48;
        v58 = 2112;
        v59 = v45;
        v60 = 2114;
        v61 = v43;
        v62 = 2114;
        v63 = v31;
        v64 = 2114;
        v65 = v29;
        v66 = 2114;
        v67 = (uint64_t)v38;
        _os_log_debug_impl(&dword_18DDBE000, v24, OS_LOG_TYPE_DEBUG, "%{public}@: Saved %@ additions windows for %{public}@peer %{public}@%{public}@: windows %{public}@", buf, 0x3Eu);
        if (v32)
        {

        }
      }

      v23 = 0;
    }
  }
  else
  {
    +[_DKSyncErrors internalFailure](_DKSyncErrors, "internalFailure");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    v26 = v11;
  }
  if (a6)
    *a6 = objc_retainAutorelease(v23);

  return v23 == 0;
}

- (id)lastSyncDownDeletionDateForPeer:(id)a3 transportName:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  _DKSyncLocalKnowledgeStorage *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _DKKnowledgeStorage *storage;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  id v27;
  int v29;
  const __CFString *v30;
  void *v31;
  uint64_t v32;
  int v33;
  const __CFString *v34;
  __CFString *v35;
  void *v36;
  int v37;
  const __CFString *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  const __CFString *v44;
  __CFString *v45;
  void *v46;
  __CFString *v47;
  void *v48;
  const __CFString *v49;
  const __CFString *v50;
  void *v51;
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
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  id v67;
  uint8_t buf[4];
  void *v69;
  __int16 v70;
  const __CFString *v71;
  __int16 v72;
  void *v73;
  __int16 v74;
  __CFString *v75;
  __int16 v76;
  id v77;
  __int16 v78;
  uint64_t v79;
  __int16 v80;
  id v81;
  _QWORD v82[2];
  _QWORD v83[3];

  v83[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v66 = a4;
  if (a5)
    *a5 = 0;
  v62 = v8;
  objc_msgSend(v8, "sourceDeviceID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKSyncMetadataStorage bookmarkStreamNameWithSourceDeviceID:]((uint64_t)_DKSyncMetadataStorage, v9);
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = self;
  objc_sync_enter(v10);
  if (v66)
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("valueString == %@"), v66);
  else
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("TRUEPREDICATE"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKAnyStringIdentifier type](_DKAnyStringIdentifier, "type");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKEventStream eventStreamWithName:valueType:](_DKEventStream, "eventStreamWithName:valueType:", v65, v11);
  v12 = objc_claimAutoreleasedReturnValue();

  v61 = (void *)v12;
  v83[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v83, 1);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("endDate"), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v82[0] = v13;
  v82[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v82, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKEventQuery eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:](_DKEventQuery, "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:", v64, v63, 0, 1, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_DKSyncLocalKnowledgeStorage.m");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringByAppendingFormat:", CFSTR(":%d"), 511);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setClientName:", v18);

  objc_msgSend(v16, "setTracker:", &__block_literal_global_65);
  storage = v10->_storage;
  v67 = 0;
  -[_DKKnowledgeStorage executeQuery:error:](storage, "executeQuery:error:", v16, &v67);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v67;
  if (v21)
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v62, "me");
      v30 = &stru_1E26E9728;
      if (v29)
        v30 = CFSTR("pseudo ");
      v44 = v30;
      objc_msgSend(v62, "identifier");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "model");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      if (v58)
      {
        v48 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v62, "model");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "stringWithFormat:", CFSTR(" (%@)"), v42);
        v47 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v47 = &stru_1E26E9728;
      }
      objc_msgSend(v21, "domain");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v21, "code");
      *(_DWORD *)buf = 138544898;
      v69 = v55;
      v70 = 2114;
      v71 = v44;
      v72 = 2114;
      v73 = v52;
      v74 = 2114;
      v75 = v47;
      v76 = 2114;
      v77 = v31;
      v78 = 2048;
      v79 = v32;
      v80 = 2112;
      v81 = v21;
      _os_log_debug_impl(&dword_18DDBE000, v22, OS_LOG_TYPE_DEBUG, "%{public}@: Failed to find deletions bookmark for %{public}@peer %{public}@%{public}@: %{public}@:%lld (%@)", buf, 0x48u);

      if (v58)
      {

      }
    }

    if (a5)
    {
      v23 = 0;
      *a5 = objc_retainAutorelease(v21);
      goto LABEL_17;
    }
LABEL_16:
    v23 = 0;
    goto LABEL_17;
  }
  if (!v20 || !objc_msgSend(v20, "count"))
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v62, "me");
      v34 = &stru_1E26E9728;
      if (v33)
        v34 = CFSTR("pseudo ");
      v49 = v34;
      objc_msgSend(v62, "identifier");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "model");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      if (v59)
      {
        v39 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v62, "model");
        v40 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "stringWithFormat:", CFSTR(" (%@)"), v40);
        v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v43 = (void *)v40;
      }
      else
      {
        v35 = &stru_1E26E9728;
      }
      *(_DWORD *)buf = 138544130;
      v69 = v53;
      v70 = 2114;
      v71 = v49;
      v72 = 2114;
      v73 = v56;
      v74 = 2114;
      v75 = v35;
      _os_log_debug_impl(&dword_18DDBE000, v26, OS_LOG_TYPE_DEBUG, "%{public}@: No deletions bookmark found for %{public}@peer %{public}@%{public}@", buf, 0x2Au);
      if (v59)
      {

      }
    }

    goto LABEL_16;
  }
  objc_msgSend(v20, "firstObject");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "endDate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    v36 = v62;
    objc_msgSend((id)objc_opt_class(), "description");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v62, "me");
    v38 = &stru_1E26E9728;
    if (v37)
      v38 = CFSTR("pseudo ");
    v50 = v38;
    objc_msgSend(v62, "identifier");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "model");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    if (v60)
    {
      v46 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v62, "model");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "stringWithFormat:", CFSTR(" (%@)"), v36);
      v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v45 = &stru_1E26E9728;
    }
    -[NSDate dk_localtimeString](v23);
    v41 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v69 = v57;
    v70 = 2114;
    v71 = v50;
    v72 = 2114;
    v73 = v54;
    v74 = 2114;
    v75 = v45;
    v76 = 2114;
    v77 = v66;
    v78 = 2112;
    v51 = (void *)v41;
    v79 = v41;
    _os_log_debug_impl(&dword_18DDBE000, v25, OS_LOG_TYPE_DEBUG, "%{public}@: Found saved deletions bookmark for %{public}@peer %{public}@%{public}@ on  %{public}@: %@", buf, 0x3Eu);
    if (v60)
    {

    }
  }

LABEL_17:
  objc_sync_exit(v10);

  v27 = v23;
  return v27;
}

- (void)setLastSyncDownDeletionDate:(id)a3 previousDate:(id)a4 forPeer:(id)a5 transportName:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  _DKSyncLocalKnowledgeStorage *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  _DKKnowledgeStorage *storage;
  void *v23;
  int v24;
  id v25;
  int v26;
  NSObject *v27;
  int v28;
  const __CFString *v29;
  __CFString *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  __CFString *v34;
  void *v35;
  int v36;
  const __CFString *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  const __CFString *v45;
  void *v46;
  const __CFString *v47;
  __CFString *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  __CFString *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  id v60;
  id v61;
  uint64_t v62;
  uint8_t buf[4];
  void *v64;
  __int16 v65;
  const __CFString *v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  const __CFString *v70;
  __int16 v71;
  uint64_t v72;
  __int16 v73;
  uint64_t v74;
  __int16 v75;
  id v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v60 = a3;
  v59 = a4;
  v12 = a5;
  v13 = a6;
  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend((id)objc_opt_class(), "description");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDate dk_localtimeString](v59);
    v54 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[NSDate dk_localtimeString](v60);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "me"))
      v31 = CFSTR("pseudo ");
    else
      v31 = &stru_1E26E9728;
    objc_msgSend(v12, "identifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "model");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
    {
      v35 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v12, "model");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "stringWithFormat:", CFSTR(" (%@)"), v46);
      v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v34 = &stru_1E26E9728;
    }
    *(_DWORD *)buf = 138544898;
    v64 = v57;
    v65 = 2114;
    v66 = v54;
    v67 = 2114;
    v68 = v51;
    v69 = 2114;
    v70 = v31;
    v71 = 2114;
    v72 = (uint64_t)v32;
    v73 = 2114;
    v74 = (uint64_t)v34;
    v75 = 2114;
    v76 = v13;
    _os_log_debug_impl(&dword_18DDBE000, v14, OS_LOG_TYPE_DEBUG, "%{public}@: Setting last sync down deletion bookmark [%{public}@ ending %{public}@] for %{public}@peer %{public}@%{public}@ on %{public}@", buf, 0x48u);
    if (v33)
    {

    }
  }

  if (a7)
    *a7 = 0;
  objc_msgSend(v12, "sourceDeviceID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKSyncMetadataStorage bookmarkStreamNameWithSourceDeviceID:]((uint64_t)_DKSyncMetadataStorage, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = self;
  objc_sync_enter(v17);
  +[_DKAnyStringIdentifier type](_DKAnyStringIdentifier, "type");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKEventStream eventStreamWithName:valueType:](_DKEventStream, "eventStreamWithName:valueType:", v16, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  +[_DKEvent eventWithStream:startDate:endDate:identifierStringValue:metadata:](_DKEvent, "eventWithStream:startDate:endDate:identifierStringValue:metadata:", v19, v59, v60, v13, 0);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v20;
  if (v20)
  {
    storage = v17->_storage;
    v62 = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v62, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = 0;
    v24 = -[_DKKnowledgeStorage saveObjects:error:](storage, "saveObjects:error:", v23, &v61);
    v25 = v61;

    if (v25)
      v26 = v24;
    else
      v26 = 1;
    if (v26 == 1)
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v12, "me");
        v29 = &stru_1E26E9728;
        if (v28)
          v29 = CFSTR("pseudo ");
        v47 = v29;
        objc_msgSend(v12, "identifier");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "model");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        if (v56)
        {
          v38 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v12, "model");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "stringWithFormat:", CFSTR(" (%@)"), v44);
          v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v30 = &stru_1E26E9728;
        }
        -[NSDate dk_localtimeString](v60);
        v39 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v64 = v53;
        v65 = 2114;
        v66 = v47;
        v67 = 2114;
        v68 = v50;
        v69 = 2114;
        v70 = v30;
        v71 = 2112;
        v49 = (void *)v39;
        v72 = v39;
        _os_log_debug_impl(&dword_18DDBE000, v27, OS_LOG_TYPE_DEBUG, "%{public}@: Saved deletions bookmark for %{public}@peer %{public}@%{public}@: %@", buf, 0x34u);
        if (v56)
        {

        }
      }
    }
    else
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v12, "me");
        v37 = &stru_1E26E9728;
        if (v36)
          v37 = CFSTR("pseudo ");
        v45 = v37;
        objc_msgSend(v12, "identifier");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "model");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        if (v58)
        {
          v40 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v12, "model");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "stringWithFormat:", CFSTR(" (%@)"), v43);
          v48 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v48 = &stru_1E26E9728;
        }
        objc_msgSend(v25, "domain");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v25, "code");
        *(_DWORD *)buf = 138544898;
        v64 = v55;
        v65 = 2114;
        v66 = v45;
        v67 = 2114;
        v68 = v52;
        v69 = 2114;
        v70 = v48;
        v71 = 2114;
        v72 = (uint64_t)v41;
        v73 = 2048;
        v74 = v42;
        v75 = 2112;
        v76 = v25;
        _os_log_debug_impl(&dword_18DDBE000, v27, OS_LOG_TYPE_DEBUG, "%{public}@: Failed to save deletions bookmark for %{public}@peer %{public}@%{public}@: %{public}@:%lld (%@)", buf, 0x48u);

        if (v58)
        {

        }
      }
    }

  }
  else
  {
    +[_DKSyncErrors internalFailure](_DKSyncErrors, "internalFailure");
    v25 = (id)objc_claimAutoreleasedReturnValue();
  }

  objc_sync_exit(v17);
  if (a7)
    *a7 = objc_retainAutorelease(v25);

}

- (_DKSyncHistory)syncHistoryForPeer:(void *)a3 streamName:(void *)a4 transportName:(void *)a5 type:(_QWORD *)a6 error:
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  unint64_t v30;
  NSObject *v31;
  _DKSyncHistory *v32;
  NSObject *v33;
  uint64_t v34;
  int v35;
  __CFString *v36;
  const __CFString *v37;
  void *v38;
  uint64_t v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  uint64_t v50;
  NSObject *v51;
  NSObject *v52;
  _DKSyncHistory *v53;
  _DKSyncHistory *v54;
  void *v56;
  __CFString *v57;
  const __CFString *v58;
  void *v59;
  void *v60;
  int v61;
  __CFString *v62;
  const __CFString *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  int v70;
  const __CFString *v71;
  __CFString *v72;
  const __CFString *v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  const char *v80;
  void *v81;
  int v82;
  __CFString *v83;
  const __CFString *v84;
  int v85;
  const __CFString *v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  void *v91;
  void *v92;
  const __CFString *v93;
  void *v94;
  void *v95;
  uint64_t v96;
  void *v97;
  os_log_t log;
  os_log_t loga;
  NSObject *logb;
  const __CFString *v101;
  void *v102;
  void *v103;
  const __CFString *v104;
  void *v105;
  uint64_t v106;
  __CFString *v107;
  void *v108;
  void *v109;
  uint64_t v110;
  void *v111;
  const __CFString *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  id v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v125;
  void *v126;
  id v127;
  id v128;
  id v129;
  uint8_t buf[4];
  uint64_t v131;
  __int16 v132;
  id v133;
  __int16 v134;
  void *v135;
  __int16 v136;
  void *v137;
  __int16 v138;
  __CFString *v139;
  __int16 v140;
  id v141;
  __int16 v142;
  uint64_t v143;
  __int16 v144;
  uint64_t v145;
  __int16 v146;
  _DKSyncHistory *v147;
  void *v148;
  _QWORD v149[2];
  _QWORD v150[3];

  v150[1] = *MEMORY[0x1E0C80C00];
  v10 = a2;
  v11 = a4;
  v126 = v10;
  v127 = a5;
  v125 = v11;
  if (!a1)
  {
    v54 = 0;
    goto LABEL_36;
  }
  v12 = a3;
  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = 0x1E0CB3000uLL;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend((id)objc_opt_class(), "description");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = &stru_1E26E9728;
    if (objc_msgSend(v10, "me"))
      v58 = CFSTR("pseudo ");
    else
      v58 = &stru_1E26E9728;
    objc_msgSend(v10, "identifier");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "model");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    if (v60)
    {
      v66 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v10, "model");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "stringWithFormat:", CFSTR(" (%@)"), v10);
      v57 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    *(_DWORD *)buf = 138544642;
    v131 = (uint64_t)v56;
    v132 = 2114;
    v133 = v127;
    v134 = 2114;
    v135 = (void *)v58;
    v136 = 2114;
    v137 = v59;
    v138 = 2114;
    v139 = v57;
    v140 = 2114;
    v141 = v11;
    _os_log_debug_impl(&dword_18DDBE000, v13, OS_LOG_TYPE_DEBUG, "%{public}@: Fetching %{public}@ sync history for %{public}@peer %{public}@%{public}@ on %{public}@", buf, 0x3Eu);
    if (v60)
    {

    }
    v14 = 0x1E0CB3000;
  }

  +[_DKAnyStringIdentifier type](_DKAnyStringIdentifier, "type");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKEventStream eventStreamWithName:valueType:](_DKEventStream, "eventStreamWithName:valueType:", v12, v15);
  v16 = objc_claimAutoreleasedReturnValue();

  v150[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v150, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -86400.0);
  v18 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKQuery predicateForEventsWithCreationInDateRangeFromAfter:to:](_DKQuery, "predicateForEventsWithCreationInDateRangeFromAfter:to:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  v119 = (void *)v18;
  v120 = (void *)v16;
  v122 = v19;
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("valueString == %@"), v11);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x1E0CB3528];
    v149[0] = v20;
    v149[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v149, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "andPredicateWithSubpredicates:", v22);
    v23 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v23 = v19;
  }
  +[_DKEventQuery eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:](_DKEventQuery, "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:", v23, v17, 0, 0x7FFFFFFFFFFFFFFFLL, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v14 + 2368), "stringWithUTF8String:", "_DKSyncLocalKnowledgeStorage.m");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "stringByAppendingFormat:", CFSTR(":%d"), 615);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setClientName:", v26);

  objc_msgSend(v24, "setTracker:", &__block_literal_global_67);
  objc_msgSend(v24, "setResultType:", 1);
  v27 = *(void **)(a1 + 8);
  v129 = 0;
  objc_msgSend(v27, "executeQuery:error:", v24, &v129);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v129;
  v121 = v28;
  if (v29)
  {
    v30 = (unint64_t)v29;
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = objc_msgSend(v126, "me");
      v62 = &stru_1E26E9728;
      v63 = CFSTR("pseudo ");
      if (!v61)
        v63 = &stru_1E26E9728;
      v112 = v63;
      objc_msgSend(v126, "identifier");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v126, "model");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      if (v65)
      {
        v67 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v126, "model");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "stringWithFormat:", CFSTR(" (%@)"), v105);
        v62 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend((id)v30, "domain");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = objc_msgSend((id)v30, "code");
      *(_DWORD *)buf = 138545154;
      v131 = (uint64_t)v115;
      v132 = 2114;
      v133 = v127;
      v134 = 2114;
      v135 = (void *)v112;
      v136 = 2114;
      v137 = v64;
      v138 = 2114;
      v139 = v62;
      v140 = 2114;
      v141 = v68;
      v142 = 2048;
      v143 = v69;
      v144 = 2112;
      v145 = v30;
      _os_log_error_impl(&dword_18DDBE000, v31, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch %{public}@ sync count for %{public}@peer %{public}@%{public}@: %{public}@:%lld (%@)", buf, 0x52u);

      if (v65)
      {

      }
    }
    v32 = 0;
LABEL_32:

    v41 = v23;
    v44 = v24;
    goto LABEL_33;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v33 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    objc_msgSend((id)objc_opt_class(), "description");
    v106 = objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v126, "me");
    v36 = &stru_1E26E9728;
    v37 = CFSTR("pseudo ");
    if (!v35)
      v37 = &stru_1E26E9728;
    v101 = v37;
    objc_msgSend(v126, "identifier");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "model");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    if (v111)
    {
      v78 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v126, "model");
      log = (os_log_t)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "stringWithFormat:", CFSTR(" (%@)"), log);
      v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    *(_DWORD *)buf = 138544386;
    v79 = (void *)v106;
    v131 = v106;
    v132 = 2114;
    v133 = v127;
    v134 = 2114;
    v135 = (void *)v101;
    v136 = 2114;
    v137 = v113;
    v138 = 2114;
    v139 = v36;
    v80 = "%{public}@: Failed to fetch %{public}@ sync count for %{public}@peer %{public}@%{public}@ due to invalid type";
LABEL_88:
    _os_log_error_impl(&dword_18DDBE000, v33, OS_LOG_TYPE_ERROR, v80, buf, 0x34u);
    if (v111)
    {

    }
    goto LABEL_18;
  }
  if (objc_msgSend(v28, "count"))
  {
    objc_msgSend(v28, "objectAtIndexedSubscript:", 0);
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = -[NSObject integerValue](v33, "integerValue");
    goto LABEL_19;
  }
  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend((id)objc_opt_class(), "description");
    v110 = objc_claimAutoreleasedReturnValue();
    v85 = objc_msgSend(v126, "me");
    v36 = &stru_1E26E9728;
    v86 = CFSTR("pseudo ");
    if (!v85)
      v86 = &stru_1E26E9728;
    v104 = v86;
    objc_msgSend(v126, "identifier");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "model");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    if (v111)
    {
      v91 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v126, "model");
      log = (os_log_t)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "stringWithFormat:", CFSTR(" (%@)"), log);
      v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    *(_DWORD *)buf = 138544386;
    v79 = (void *)v110;
    v131 = v110;
    v132 = 2114;
    v133 = v127;
    v134 = 2114;
    v135 = (void *)v104;
    v136 = 2114;
    v137 = v113;
    v138 = 2114;
    v139 = v36;
    v80 = "%{public}@: Failed to fetch %{public}@ sync count for %{public}@peer %{public}@%{public}@ due to missing value";
    goto LABEL_88;
  }
LABEL_18:
  v34 = 0;
LABEL_19:

  v118 = v11;
  if (v11)
  {
    v38 = v11;
    v39 = v34;
    v40 = v38;
  }
  else
  {
    v39 = v34;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("TRUEPREDICATE"));
    v40 = (id)objc_claimAutoreleasedReturnValue();
  }
  v41 = v40;

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v148 = v42;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v148, 1);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKEventQuery eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:](_DKEventQuery, "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:", v41, v17, 0, 1, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_DKSyncLocalKnowledgeStorage.m");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "stringByAppendingFormat:", CFSTR(":%d"), 645);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setClientName:", v46);

  objc_msgSend(v44, "setTracker:", &__block_literal_global_69);
  v47 = *(void **)(a1 + 8);
  v128 = 0;
  objc_msgSend(v47, "executeQuery:error:", v44, &v128);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (unint64_t)v128;
  if (v30)
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = objc_msgSend(v126, "me");
      v71 = CFSTR("pseudo ");
      if (!v70)
        v71 = &stru_1E26E9728;
      loga = (os_log_t)v71;
      objc_msgSend(v126, "identifier");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v126, "model");
      v11 = v118;
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      if (v102)
      {
        v108 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v126, "model");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v108, "stringWithFormat:", CFSTR(" (%@)"), v95);
        v107 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v107 = &stru_1E26E9728;
      }
      objc_msgSend((id)v30, "domain");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = objc_msgSend((id)v30, "code");
      *(_DWORD *)buf = 138545154;
      v131 = (uint64_t)v116;
      v132 = 2114;
      v133 = v127;
      v134 = 2114;
      v135 = loga;
      v136 = 2114;
      v137 = v111;
      v138 = 2114;
      v139 = v107;
      v140 = 2114;
      v141 = v76;
      v142 = 2048;
      v143 = v77;
      v144 = 2112;
      v145 = v30;
      _os_log_error_impl(&dword_18DDBE000, v49, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch last %{public}@ sync date for %{public}@peer %{public}@%{public}@: %{public}@:%lld (%@)", buf, 0x52u);

      if (v102)
      {

      }
      v32 = 0;
    }
    else
    {
      v32 = 0;
      v11 = v118;
    }
LABEL_28:

    goto LABEL_29;
  }
  if (objc_msgSend(v48, "count"))
  {
    v111 = v42;
    objc_msgSend(v48, "lastObject");
    v49 = objc_claimAutoreleasedReturnValue();
    -[NSObject creationDate](v49, "creationDate");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v39;
    v32 = -[_DKSyncHistory initWithLastSyncDate:lastDaySyncCount:]([_DKSyncHistory alloc], "initWithLastSyncDate:lastDaySyncCount:", v114, v39);
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
    {
      v96 = v50;
      logb = v51;
      objc_msgSend((id)objc_opt_class(), "description");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = objc_msgSend(v126, "me");
      v83 = &stru_1E26E9728;
      v84 = CFSTR("pseudo ");
      if (!v82)
        v84 = &stru_1E26E9728;
      v93 = v84;
      objc_msgSend(v126, "identifier");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v126, "model");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      if (v94)
      {
        v87 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v126, "model");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "stringWithFormat:", CFSTR(" (%@)"), v92);
        v83 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      -[NSDate dk_localtimeString](v114);
      v88 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v96);
      v89 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138545410;
      v131 = (uint64_t)v109;
      v132 = 2114;
      v133 = v127;
      v134 = 2114;
      v135 = (void *)v93;
      v136 = 2114;
      v137 = v103;
      v138 = 2114;
      v139 = v83;
      v140 = 2114;
      v141 = v125;
      v142 = 2114;
      v97 = (void *)v88;
      v143 = v88;
      v144 = 2112;
      v145 = v89;
      v90 = (void *)v89;
      v146 = 2112;
      v147 = v32;
      _os_log_debug_impl(&dword_18DDBE000, logb, OS_LOG_TYPE_DEBUG, "%{public}@: Found %{public}@ sync history for %{public}@peer %{public}@%{public}@ on %{public}@ with last sync date of %{public}@ and with %@ syncs in the previous day: %@", buf, 0x5Cu);

      if (v94)
      {

      }
      v51 = logb;
    }

    v11 = v118;
    v42 = v111;
    goto LABEL_28;
  }
  v32 = 0;
  v11 = v118;
LABEL_29:

  if (!(v30 | (unint64_t)v32))
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = &stru_1E26E9728;
      if (objc_msgSend(v126, "me"))
        v73 = CFSTR("pseudo ");
      else
        v73 = &stru_1E26E9728;
      objc_msgSend(v126, "identifier");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v126, "model");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      if (v75)
      {
        v81 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v126, "model");
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "stringWithFormat:", CFSTR(" (%@)"), v111);
        v72 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 138544386;
      v131 = (uint64_t)v117;
      v132 = 2114;
      v133 = v127;
      v134 = 2114;
      v135 = (void *)v73;
      v136 = 2114;
      v137 = v74;
      v138 = 2114;
      v139 = v72;
      _os_log_debug_impl(&dword_18DDBE000, v52, OS_LOG_TYPE_DEBUG, "%{public}@: No %{public}@ sync history for %{public}@peer %{public}@%{public}@", buf, 0x34u);
      if (v75)
      {

      }
    }

    v53 = [_DKSyncHistory alloc];
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = -[_DKSyncHistory initWithLastSyncDate:lastDaySyncCount:](v53, "initWithLastSyncDate:lastDaySyncCount:", v31, 0);
    v30 = 0;
    v23 = v41;
    v24 = v44;
    goto LABEL_32;
  }
LABEL_33:
  if (a6)
    *a6 = objc_retainAutorelease((id)v30);
  v54 = v32;

LABEL_36:
  return v54;
}

- (id)additionsSyncHistoryForPeer:(id)a3 transportName:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "sourceDeviceID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKSyncMetadataStorage windowStreamNameWithSourceDeviceID:]((uint64_t)_DKSyncMetadataStorage, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[_DKSyncLocalKnowledgeStorage syncHistoryForPeer:streamName:transportName:type:error:]((uint64_t)self, v9, v11, v8, CFSTR("additions"), a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)deletionsSyncHistoryForPeer:(id)a3 transportName:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "sourceDeviceID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKSyncMetadataStorage bookmarkStreamNameWithSourceDeviceID:]((uint64_t)_DKSyncMetadataStorage, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[_DKSyncLocalKnowledgeStorage syncHistoryForPeer:streamName:transportName:type:error:]((uint64_t)self, v9, v11, v8, CFSTR("deletions"), a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)saveEvents:(id)a3 error:(id *)a4
{
  id v6;
  _DKKnowledgeStorage *storage;
  _BOOL4 v8;
  id v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  storage = self->_storage;
  v18 = 0;
  v8 = -[_DKKnowledgeStorage saveObjects:error:](storage, "saveObjects:error:", v6, &v18);
  v9 = v18;
  v10 = v9;
  if (a4 && v9)
    *a4 = objc_retainAutorelease(v9);
  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[_DKSyncLocalKnowledgeStorage saveEvents:error:].cold.1((uint64_t)self, v6);
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend((id)objc_opt_class(), "description");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "domain");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v10, "code");
    *(_DWORD *)buf = 138544386;
    v20 = v14;
    v21 = 2112;
    v22 = v15;
    v23 = 2114;
    v24 = v16;
    v25 = 2048;
    v26 = v17;
    v27 = 2112;
    v28 = v10;
    _os_log_error_impl(&dword_18DDBE000, v12, OS_LOG_TYPE_ERROR, "%{public}@: Failed to save %@ events: %{public}@:%lld (%@)", buf, 0x34u);

  }
  return v8;
}

- (BOOL)deleteEventsWithEventIDs:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  unint64_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  unint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a4)
    *a4 = 0;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(uuid IN %@)"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[_DKKnowledgeStorage deleteEventsMatchingPredicate:limit:](self->_storage, "deleteEventsMatchingPredicate:limit:", v6, 0x7FFFFFFFFFFFFFFFLL);
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[_DKSyncLocalKnowledgeStorage deleteEventsWithEventIDs:error:].cold.1();

    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v13 = v11;
      v14 = 2048;
      v15 = v7;
      v16 = 2048;
      v17 = objc_msgSend(v5, "count");
      _os_log_debug_impl(&dword_18DDBE000, v9, OS_LOG_TYPE_DEBUG, "%{public}@: Deleted %lu events from %lu specified", buf, 0x20u);

    }
  }

  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
}

- (void)tombstonesSinceDate:(NSObject *)a3 streamNames:limit:endDate:error:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138544130;
  v8 = v5;
  v9 = 2114;
  v10 = v6;
  v11 = 2048;
  v12 = objc_msgSend(a2, "code");
  v13 = 2112;
  v14 = a2;
  _os_log_debug_impl(&dword_18DDBE000, a3, OS_LOG_TYPE_DEBUG, "%{public}@: Failed to find tombstones: %{public}@:%lld (%@)", (uint8_t *)&v7, 0x2Au);

}

- (void)saveEvents:(uint64_t)a1 error:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend((id)objc_opt_class(), "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a2, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9(&dword_18DDBE000, v4, v5, "%{public}@: Saved %@ events", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_7();
}

- (void)deleteEventsWithEventIDs:error:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend((id)objc_opt_class(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9(&dword_18DDBE000, v1, v2, "%{public}@: Deletion predicate = %@", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_7();
}

@end

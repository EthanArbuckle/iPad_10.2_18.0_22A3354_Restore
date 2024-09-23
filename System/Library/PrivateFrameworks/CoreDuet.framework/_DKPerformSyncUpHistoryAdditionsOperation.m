@implementation _DKPerformSyncUpHistoryAdditionsOperation

- (id)initWithParent:(void *)a3 localStorage:(void *)a4 transport:(void *)a5 peer:(void *)a6 policy:(void *)a7 type:
{
  id v14;
  id v15;
  id v16;
  id *v17;
  id *v18;
  uint64_t v19;
  id v20;
  id v22;
  id v23;
  objc_super v24;

  v14 = a3;
  v23 = a4;
  v15 = a5;
  v22 = a6;
  v16 = a7;
  if (a1)
  {
    v24.receiver = a1;
    v24.super_class = (Class)_DKPerformSyncUpHistoryAdditionsOperation;
    v17 = (id *)objc_msgSendSuper2(&v24, sel_initWithParent_, a2);
    v18 = v17;
    if (v17)
    {
      objc_storeStrong(v17 + 37, a3);
      objc_storeStrong(v18 + 38, a4);
      objc_storeStrong(v18 + 39, a5);
      objc_storeStrong(v18 + 40, a6);
      objc_storeStrong(v18 + 41, a7);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = v18[43];
      v18[43] = (id)v19;

    }
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)main
{
  uint64_t v3;

  v3 = objc_opt_class();
  if (+[_DKSync2Coordinator shouldDeferSyncOperationWithClass:syncType:transport:peer:policy:]((uint64_t)_DKSync2Coordinator, v3, self->_type, self->_transport, 0, self->_policy))-[_DKPerformSyncUpHistoryAdditionsOperation endOperation](self, "endOperation");
  else
    -[_DKPerformSyncUpHistoryAdditionsOperation performSyncUpHistoryAdditions]((uint64_t)self);
}

- (uint64_t)performSyncUpHistoryAdditions
{
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  _QWORD v18[5];

  if (result)
  {
    v1 = result;
    +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
    v2 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v2);

    objc_msgSend(*(id *)(v1 + 320), "streamNamesToSyncWithSyncType:transportType:", *(_QWORD *)(v1 + 328), objc_msgSend(*(id *)(v1 + 304), "transportType"));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(v1 + 336);
    *(_QWORD *)(v1 + 336) = v3;

    if (objc_msgSend(*(id *)(v1 + 336), "count"))
    {
      v5 = *(void **)(v1 + 296);
      v6 = *(_QWORD *)(v1 + 312);
      objc_msgSend(*(id *)(v1 + 304), "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "additionsSyncHistoryForPeer:transportName:error:", v6, v7, 0);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(void **)(v1 + 360);
      *(_QWORD *)(v1 + 360) = v8;

      v10 = objc_opt_class();
      if ((+[_DKSync2Coordinator canPerformSyncOperationWithClass:syncType:history:transport:peer:policy:]((uint64_t)_DKSync2Coordinator, v10, *(void **)(v1 + 328), *(void **)(v1 + 360), *(void **)(v1 + 304), *(void **)(v1 + 312), *(void **)(v1 + 320)) & 1) != 0)
      {
        v11 = *(void **)(v1 + 320);
        v12 = *(_QWORD *)(v1 + 328);
        objc_msgSend(*(id *)(v1 + 360), "lastSyncDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v11, "highPriorityForSyncUpWithSyncType:lastSyncDate:", v12, v13);

        v15 = *(void **)(v1 + 304);
        v16 = *(_QWORD *)(v1 + 312);
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __74___DKPerformSyncUpHistoryAdditionsOperation_performSyncUpHistoryAdditions__block_invoke;
        v18[3] = &unk_1E26E5BE0;
        v18[4] = v1;
        return objc_msgSend(v15, "fetchAdditionsHighWaterMarkWithPeer:highPriority:completion:", v16, v14, v18);
      }
    }
    else
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        -[_DKPerformSyncUpHistoryAdditionsOperation performSyncUpHistoryAdditions].cold.1(v1, v17);

    }
    return objc_msgSend((id)v1, "endOperation");
  }
  return result;
}

- (void)performSyncUpHistoryAdditionsWithAdditionsHighWaterMark:(void *)a3 orError:
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    if (v5)
    {
      -[_DKPerformSyncUpHistoryAdditionsOperation performSyncUpHistoryAdditionsWithPreviousHighWaterMark:]((uint64_t)a1, v5);
    }
    else
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
      if (v6)
      {
        if (v8)
          -[_DKPerformSyncUpHistoryAdditionsOperation performSyncUpHistoryAdditionsWithAdditionsHighWaterMark:orError:].cold.2((uint64_t)a1, v6, v7);

        objc_msgSend(a1, "errors");
        v7 = objc_claimAutoreleasedReturnValue();
        -[NSObject addObject:](v7, "addObject:", v6);
      }
      else if (v8)
      {
        -[_DKPerformSyncUpHistoryAdditionsOperation performSyncUpHistoryAdditionsWithAdditionsHighWaterMark:orError:].cold.1(a1, v7);
      }

      objc_msgSend(a1, "endOperation");
    }
  }

}

- (void)performSyncUpHistoryAdditionsWithPreviousHighWaterMark:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  void *v11;
  id v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  NSObject *v33;
  int v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  char v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  int *v50;
  void *v51;
  void *v52;
  unint64_t v53;
  void *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t i;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  id v68;
  id v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  NSObject *v74;
  NSObject *v75;
  void *v76;
  int v77;
  int v78;
  int v79;
  int v80;
  int v81;
  void *v82;
  uint64_t v83;
  const char *v84;
  __CFString *v85;
  const __CFString *v86;
  void *v87;
  void *v88;
  __CFString *v89;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  int v94;
  const __CFString *v95;
  void *v96;
  uint64_t v97;
  const char *v98;
  int v99;
  __CFString *v100;
  const __CFString *v101;
  __CFString *v102;
  uint64_t v103;
  const char *v104;
  __CFString *v105;
  const __CFString *v106;
  __CFString *v107;
  void *v108;
  void *v109;
  __CFString *v110;
  void *v111;
  uint64_t v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  uint64_t v118;
  NSObject *v119;
  void *v120;
  const __CFString *v121;
  uint64_t v122;
  const char *v123;
  __CFString *v124;
  void *v125;
  __CFString *v126;
  __CFString *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  uint64_t v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  uint64_t v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  void *v148;
  void *v149;
  uint64_t v150;
  void *v151;
  uint64_t v152;
  __int16 v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  void *v159;
  uint64_t v160;
  id v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  id v169;
  uint8_t buf[4];
  void *v171;
  __int16 v172;
  void *v173;
  __int16 v174;
  uint64_t v175;
  __int16 v176;
  const __CFString *v177;
  __int16 v178;
  uint64_t v179;
  __int16 v180;
  __CFString *v181;
  __int16 v182;
  __CFString *v183;
  __int16 v184;
  void *v185;
  __int16 v186;
  uint64_t v187;
  __int16 v188;
  id v189;
  void *v190;
  _BYTE v191[128];
  _QWORD v192[4];

  v192[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v4);

    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[_DKPerformSyncUpHistoryAdditionsOperation performSyncUpHistoryAdditionsWithPreviousHighWaterMark:].cold.4(a1, (int)v3, (int)v5, v6, v7, v8, v9, v10, v118, v119, (uint64_t)v120, v122, SWORD2(v122), (uint64_t)v124, (__int16)v126, v128, v132, v137, (__int16)v142,
        v144,
        v147,
        v150,
        v153,
        v155,
        v156,
        v157,
        v158,
        (uint64_t)v159,
        v160,
        (uint64_t)v161,
        v162,
        v163,
        v164,
        v165,
        *((uint64_t *)&v165 + 1),
        v166,
        *((uint64_t *)&v166 + 1));

    objc_msgSend(*(id *)(a1 + 320), "queryStartDateWithSyncType:previousHighWaterMark:", *(_QWORD *)(a1 + 328), v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(id *)(a1 + 344);
    objc_msgSend(v12, "timeIntervalSinceReferenceDate");
    v14 = v13;
    objc_msgSend(v11, "timeIntervalSinceReferenceDate");
    if (v14 - v15 <= (double)(unint64_t)objc_msgSend(*(id *)(a1 + 320), "minSyncWindowInSeconds"))
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        -[_DKPerformSyncUpHistoryAdditionsOperation performSyncUpHistoryAdditionsWithPreviousHighWaterMark:].cold.3(a1, v35);

      v32 = 0;
      v31 = 0;
    }
    else
    {
      v16 = *(_QWORD *)(a1 + 352);
      if (!v16)
      {
        objc_msgSend(*(id *)(a1 + 360), "lastSyncDate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        +[_DKPerformSyncUpHistoryAdditionsOperation _updateEventStatsWithPreviousSyncDate:transportType:]((uint64_t)_DKPerformSyncUpHistoryAdditionsOperation, v17, objc_msgSend(*(id *)(a1 + 304), "transportType"));

        v16 = *(_QWORD *)(a1 + 352);
      }
      *(_QWORD *)(a1 + 352) = v16 + 1;
      v18 = (void *)objc_opt_new();
      -[_DKSyncWindow setStartDate:]((uint64_t)v18, v11);
      v154 = (uint64_t)v12;
      -[_DKSyncWindow setEndDate:]((uint64_t)v18, v12);
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        -[_DKPerformSyncUpHistoryAdditionsOperation performSyncUpHistoryAdditionsWithPreviousHighWaterMark:].cold.2(a1, (int)v18, (int)v19, v20, v21, v22, v23, v24, v118, v119, (uint64_t)v120, v122, (uint64_t)v124, (uint64_t)v126, v128, v132, v137, (uint64_t)v142, v144,
          v147,
          v150,
          (uint64_t)v12,
          v155,
          v156,
          v157,
          v158,
          (uint64_t)v159,
          v160,
          (uint64_t)v161,
          v162,
          v163,
          v164);

      v25 = objc_msgSend(*(id *)(a1 + 320), "syncBatchSizeInEvents");
      v26 = v25;
      if (v25 <= 1)
        v27 = v25;
      else
        v27 = v25 + 1;
      v28 = *(void **)(a1 + 296);
      v192[0] = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v192, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = *(_QWORD *)(a1 + 336);
      v169 = 0;
      objc_msgSend(v28, "sortedEventsFromSyncWindows:streamNames:limit:fetchOrder:error:", v29, v30, v27, 1, &v169);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v169;

      if (v32)
      {
        +[_CDLogging syncChannel](_CDLogging, "syncChannel");
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          v146 = (uint64_t)v3;
          objc_msgSend((id)objc_opt_class(), "description");
          v149 = (void *)objc_claimAutoreleasedReturnValue();
          v152 = (uint64_t)v18;
          objc_msgSend(v18, "debugDescription");
          v139 = (void *)objc_claimAutoreleasedReturnValue();
          v83 = objc_msgSend(*(id *)(a1 + 304), "transportType");
          v84 = "down from";
          if (v83 == 8)
            v84 = "up to";
          v130 = (uint64_t)v84;
          v85 = &stru_1E26E9728;
          if (objc_msgSend(*(id *)(a1 + 312), "me"))
            v86 = CFSTR("pseudo ");
          else
            v86 = &stru_1E26E9728;
          objc_msgSend(*(id *)(a1 + 312), "identifier");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 312), "model");
          v134 = (void *)objc_claimAutoreleasedReturnValue();
          if (v134)
          {
            v88 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(*(id *)(a1 + 312), "model");
            v126 = (__CFString *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v88, "stringWithFormat:", CFSTR(" (%@)"), v126);
            v85 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(*(id *)(a1 + 304), "name");
          v89 = (__CFString *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "domain");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          v91 = objc_msgSend(v32, "code");
          *(_DWORD *)buf = 138545666;
          v171 = v149;
          v172 = 2114;
          v173 = v139;
          v174 = 2082;
          v175 = v130;
          v176 = 2114;
          v177 = v86;
          v178 = 2114;
          v179 = (uint64_t)v87;
          v180 = 2114;
          v181 = v85;
          v182 = 2114;
          v183 = v89;
          v184 = 2114;
          v185 = v90;
          v186 = 2048;
          v187 = v91;
          v188 = 2112;
          v189 = v32;
          _os_log_error_impl(&dword_18DDBE000, v33, OS_LOG_TYPE_ERROR, "%{public}@: Failed while querying for events in window %{public}@ doing additions history sync %{public}s %{public}@peer %{public}@%{public}@ on transport %{public}@: %{public}@:%lld (%@)", buf, 0x66u);

          if (v134)
          {

          }
          v3 = (id)v146;
          v18 = (void *)v152;
        }

        LOBYTE(v34) = 1;
      }
      else
      {
        v151 = v18;
        if (v26 >= 2 && objc_msgSend(v31, "count") == v26 + 1)
        {
          v36 = v11;
          if ((unint64_t)objc_msgSend(v31, "count") < 2)
          {
            v38 = 1;
          }
          else
          {
            objc_msgSend(v31, "subarrayWithRange:", 0, objc_msgSend(v31, "count") - 1);
            v37 = objc_claimAutoreleasedReturnValue();

            v38 = 1;
            v31 = (void *)v37;
          }
        }
        else
        {
          v36 = v11;
          v38 = 0;
        }
        v129 = objc_msgSend(v31, "count");
        v39 = (void *)objc_opt_new();
        v145 = (uint64_t)v3;
        v148 = v39;
        if ((v38 & 1) != 0)
        {
          objc_msgSend(v31, "lastObject");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          -[_DKSyncWindow startDate]((uint64_t)v151);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          -[_DKSyncWindow setStartDate:]((uint64_t)v39, v41);

          objc_msgSend(v40, "creationDate");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          -[_DKSyncWindow setEndDate:]((uint64_t)v39, v42);

          +[_CDLogging syncChannel](_CDLogging, "syncChannel");
          v43 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend((id)objc_opt_class(), "description");
            v135 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v129);
            v142 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v151, "debugDescription");
            v140 = (void *)objc_claimAutoreleasedReturnValue();
            v97 = objc_msgSend(*(id *)(a1 + 304), "transportType");
            v98 = "down from";
            if (v97 == 8)
              v98 = "up to";
            v124 = (__CFString *)v98;
            v99 = objc_msgSend(*(id *)(a1 + 312), "me");
            v100 = &stru_1E26E9728;
            v101 = CFSTR("pseudo ");
            if (!v99)
              v101 = &stru_1E26E9728;
            v122 = (uint64_t)v101;
            objc_msgSend(*(id *)(a1 + 312), "identifier");
            v102 = (__CFString *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 312), "model");
            v126 = (__CFString *)objc_claimAutoreleasedReturnValue();
            if (v126)
            {
              v113 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(*(id *)(a1 + 312), "model");
              v120 = (void *)objc_claimAutoreleasedReturnValue();
              v118 = (uint64_t)v120;
              objc_msgSend(v113, "stringWithFormat:", CFSTR(" (%@)"));
              v100 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(*(id *)(a1 + 304), "name");
            v114 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "debugDescription");
            v115 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138545410;
            v171 = v135;
            v172 = 2112;
            v173 = v142;
            v174 = 2114;
            v175 = (uint64_t)v140;
            v176 = 2082;
            v177 = v124;
            v178 = 2114;
            v179 = v122;
            v180 = 2114;
            v181 = v102;
            v182 = 2114;
            v183 = v100;
            v184 = 2114;
            v185 = v114;
            v186 = 2114;
            v187 = (uint64_t)v115;
            _os_log_debug_impl(&dword_18DDBE000, v43, OS_LOG_TYPE_DEBUG, "%{public}@: Found %@ events in window %{public}@ for additions history sync %{public}s %{public}@peer %{public}@%{public}@ on transport %{public}@ but hit limit, fetch limited to window %{public}@", buf, 0x5Cu);

            if (v126)
            {

            }
            v39 = v148;
          }

        }
        else
        {
          +[_CDLogging syncChannel](_CDLogging, "syncChannel");
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend((id)objc_opt_class(), "description");
            v136 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v129);
            v142 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v151, "debugDescription");
            v141 = (void *)objc_claimAutoreleasedReturnValue();
            v103 = objc_msgSend(*(id *)(a1 + 304), "transportType");
            v104 = "down from";
            if (v103 == 8)
              v104 = "up to";
            v126 = (__CFString *)v104;
            v105 = &stru_1E26E9728;
            if (objc_msgSend(*(id *)(a1 + 312), "me"))
              v106 = CFSTR("pseudo ");
            else
              v106 = &stru_1E26E9728;
            objc_msgSend(*(id *)(a1 + 312), "identifier");
            v107 = (__CFString *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 312), "model");
            v108 = (void *)objc_claimAutoreleasedReturnValue();
            if (v108)
            {
              v116 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(*(id *)(a1 + 312), "model");
              v124 = (__CFString *)objc_claimAutoreleasedReturnValue();
              v118 = (uint64_t)v124;
              objc_msgSend(v116, "stringWithFormat:", CFSTR(" (%@)"));
              v105 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(*(id *)(a1 + 304), "name");
            v117 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138545154;
            v171 = v136;
            v172 = 2112;
            v173 = v142;
            v174 = 2114;
            v175 = (uint64_t)v141;
            v176 = 2082;
            v177 = v126;
            v178 = 2114;
            v179 = (uint64_t)v106;
            v180 = 2114;
            v181 = v107;
            v182 = 2114;
            v183 = v105;
            v184 = 2114;
            v185 = v117;
            _os_log_debug_impl(&dword_18DDBE000, v44, OS_LOG_TYPE_DEBUG, "%{public}@: Found %@ events in window %{public}@ for additions history sync %{public}s %{public}@peer %{public}@%{public}@ on transport %{public}@", buf, 0x52u);

            if (v108)
            {

            }
            v39 = v148;
          }

          -[_DKSyncWindow startDate]((uint64_t)v151);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          -[_DKSyncWindow setStartDate:]((uint64_t)v39, v45);

          -[_DKSyncType urgency]((uint64_t)v151);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          -[_DKSyncWindow setEndDate:]((uint64_t)v39, v40);
        }
        v11 = v36;

        objc_msgSend(*(id *)(a1 + 312), "sourceDeviceID");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        +[_DKSyncMetadataStorage windowStreamNameWithSourceDeviceID:]((uint64_t)_DKSyncMetadataStorage, v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 304), "name");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v138 = v47;
        +[_DKSyncMetadataStorage eventFromFetchedWindow:windowStreamName:transportName:]((uint64_t)_DKSyncMetadataStorage, v39, v47, v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();

        v50 = &OBJC_IVAR____CDMemoryUsageInterval__startingLifetimeMaxMemoryUsage;
        if (v31)
          v51 = (void *)objc_msgSend(v31, "mutableCopy");
        else
          v51 = (void *)objc_opt_new();
        v52 = v51;
        v53 = 0x1E0C99000;
        objc_msgSend(v51, "addObject:", v49);
        v133 = v52;
        if (objc_msgSend(v31, "count")
          || objc_msgSend(*(id *)(a1 + 304), "transportType") != 8
          || -[_DKSyncType forceSync](*(_QWORD *)(a1 + 328)))
        {
          v142 = v11;
          v54 = (void *)objc_opt_new();
          v165 = 0u;
          v166 = 0u;
          v167 = 0u;
          v168 = 0u;
          v55 = v52;
          v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v165, v191, 16);
          if (v56)
          {
            v57 = v56;
            v58 = *(_QWORD *)v166;
            do
            {
              for (i = 0; i != v57; ++i)
              {
                if (*(_QWORD *)v166 != v58)
                  objc_enumerationMutation(v55);
                v60 = *(void **)(*((_QWORD *)&v165 + 1) + 8 * i);
                if (v60 != v49)
                {
                  objc_msgSend(v60, "stream");
                  v61 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v61, "name");
                  v62 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v62)
                    objc_msgSend(v54, "addObject:", v62);

                }
              }
              v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v165, v191, 16);
            }
            while (v57);
          }

          v63 = *(void **)(a1 + 320);
          v64 = *(_QWORD *)(a1 + 328);
          objc_msgSend(*(id *)(a1 + 360), "lastSyncDate");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = objc_msgSend(v63, "highPriorityForSyncUpWithSyncType:lastSyncDate:", v64, v65);

          v67 = *(void **)(a1 + 304);
          v156 = MEMORY[0x1E0C809B0];
          v157 = 3221225472;
          v158 = (uint64_t)__100___DKPerformSyncUpHistoryAdditionsOperation_performSyncUpHistoryAdditionsWithPreviousHighWaterMark___block_invoke;
          v159 = &unk_1E26E5C08;
          v160 = v31;
          v161 = v54;
          v162 = a1;
          v163 = v148;
          v164 = v129;
          v68 = v54;
          v69 = v55;
          v39 = v148;
          objc_msgSend(v67, "updateStorageWithAddedEvents:deletedEventIDs:highPriority:completion:", v69, 0, v66, &v156);

          v34 = 0;
          v11 = v142;
          v50 = &OBJC_IVAR____CDMemoryUsageInterval__startingLifetimeMaxMemoryUsage;
          v53 = 0x1E0C99000uLL;
        }
        else
        {
          v34 = 1;
        }
        v70 = *(void **)(a1 + v50[949]);
        v190 = v39;
        objc_msgSend(*(id *)(v53 + 3360), "arrayWithObjects:count:", &v190, 1);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = *(_QWORD *)(a1 + 312);
        objc_msgSend(*(id *)(a1 + 304), "name");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v155 = 0;
        objc_msgSend(v70, "saveSyncedDownWindows:peer:transportName:error:", v71, v72, v73, &v155);
        v32 = (id)v155;

        +[_CDLogging syncChannel](_CDLogging, "syncChannel");
        v74 = objc_claimAutoreleasedReturnValue();
        v75 = v74;
        if (v32)
        {
          v76 = v151;
          if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend((id)objc_opt_class(), "description");
            v143 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v148, "debugDescription");
            v131 = (void *)objc_claimAutoreleasedReturnValue();
            v92 = objc_msgSend(*(id *)(a1 + 304), "transportType");
            v93 = "down from";
            if (v92 == 8)
              v93 = "up to";
            v123 = v93;
            v94 = objc_msgSend(*(id *)(a1 + 312), "me");
            v95 = CFSTR("pseudo ");
            if (!v94)
              v95 = &stru_1E26E9728;
            v121 = v95;
            objc_msgSend(*(id *)(a1 + 312), "identifier");
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 312), "model");
            v125 = (void *)objc_claimAutoreleasedReturnValue();
            if (v125)
            {
              v109 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(*(id *)(a1 + 312), "model");
              v119 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v109, "stringWithFormat:", CFSTR(" (%@)"), v119);
              v127 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v127 = &stru_1E26E9728;
            }
            objc_msgSend(*(id *)(a1 + 304), "name");
            v110 = (__CFString *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "domain");
            v111 = (void *)objc_claimAutoreleasedReturnValue();
            v112 = objc_msgSend(v32, "code");
            *(_DWORD *)buf = 138545666;
            v171 = v143;
            v172 = 2114;
            v173 = v131;
            v174 = 2082;
            v175 = (uint64_t)v123;
            v176 = 2114;
            v177 = v121;
            v178 = 2114;
            v179 = (uint64_t)v96;
            v180 = 2114;
            v181 = v127;
            v182 = 2114;
            v183 = v110;
            v184 = 2114;
            v185 = v111;
            v186 = 2048;
            v187 = v112;
            v188 = 2112;
            v189 = v32;
            _os_log_error_impl(&dword_18DDBE000, v75, OS_LOG_TYPE_ERROR, "%{public}@: Failed while saving additions window %{public}@ doing additions history sync %{public}s %{public}@peer %{public}@%{public}@ on transport %{public}@: %{public}@:%lld (%@)", buf, 0x66u);

            if (v125)
            {

            }
            v76 = v151;
          }

          objc_msgSend((id)a1, "errors");
          v75 = objc_claimAutoreleasedReturnValue();
          -[NSObject addObject:](v75, "addObject:", v32);
        }
        else
        {
          v76 = v151;
          if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
            -[_DKPerformSyncUpHistoryAdditionsOperation performSyncUpHistoryAdditionsWithPreviousHighWaterMark:].cold.1(a1, (int)v148, (int)v75, v77, v78, v79, v80, v81, v118, v119, (uint64_t)v120, v122, (uint64_t)v124, (uint64_t)v126, v129, (uint64_t)v133, (uint64_t)v138, (uint64_t)v142, v145,
              (uint64_t)v148,
              (uint64_t)v151,
              v154,
              v155,
              v156,
              v157,
              v158,
              (uint64_t)v159,
              v160,
              (uint64_t)v161,
              v162,
              v163,
              v164);
        }

        if (!v32)
        {
          v3 = (id)v145;
          v12 = (id)v154;
          if (!v34)
            goto LABEL_55;
          goto LABEL_54;
        }
        v3 = (id)v145;
      }
      v12 = (id)v154;
      objc_msgSend((id)a1, "errors");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "addObject:", v32);

      if ((v34 & 1) == 0)
      {
LABEL_55:

        goto LABEL_56;
      }
    }
LABEL_54:
    objc_msgSend((id)a1, "endOperation");
    goto LABEL_55;
  }
LABEL_56:

}

+ (void)_updateEventStatsWithPreviousSyncDate:(uint64_t)a3 transportType:
{
  void *v4;
  char v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_opt_self();
  if (_updateEventStatsWithPreviousSyncDate_transportType__syncCadenceInitialized_0 != -1)
    dispatch_once(&_updateEventStatsWithPreviousSyncDate_transportType__syncCadenceInitialized_0, &__block_literal_global_51);
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v11, "isEqualToDate:", v4);

    if ((v5 & 1) == 0)
    {
      v6 = _updateEventStatsWithPreviousSyncDate_transportType__syncCadenceByTransportCounter_0;
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (a3 == 1)
        v8 = CFSTR("Rapport");
      else
        v8 = CFSTR("Cloud");
      -[_DKEventTypeStatsTimerCounter addTimingWithStartDate:endDate:typeValue:](v6, (uint64_t)v11, v7, v8);

    }
  }
  v9 = _updateEventStatsWithPreviousSyncDate_transportType__syncCadenceCounter_0;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKEventStatsTimerCounter addTimingWithStartDate:endDate:](v9, (uint64_t)v11, v10);

}

+ (void)_updateEventStatsWithTotal:(void *)a3 streamNameCounts:(uint64_t)a4 transportType:
{
  id v6;
  __CFString *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_opt_self();
  if (_updateEventStatsWithTotal_streamNameCounts_transportType__syncUpHistoryAdditionsCounterInitialized != -1)
    dispatch_once(&_updateEventStatsWithTotal_streamNameCounts_transportType__syncUpHistoryAdditionsCounterInitialized, &__block_literal_global_31_1);
  -[_DKEventStatsCounter incrementCountByNumber:](_updateEventStatsWithTotal_streamNameCounts_transportType__syncUpHistoryAdditionsTotalCounter, a2);
  if (a4 == 1)
    v7 = CFSTR("Rapport");
  else
    v7 = CFSTR("Cloud");
  -[_DKEventTypeStatsCounter incrementCountByNumber:typeValue:](_updateEventStatsWithTotal_streamNameCounts_transportType__syncUpHistoryAdditionsTotalByTransportCounter, a2, v7);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend((id)_updateEventStatsWithTotal_streamNameCounts_transportType__syncUpHistoryAdditionsCountersByStreamName, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v14)
        {
          v15 = (void *)MEMORY[0x1E0CB3940];
          +[_DKEventStatsUtilities safeStringWithString:](_DKEventStatsUtilities, "safeStringWithString:", v13);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "stringWithFormat:", CFSTR("sync_up_history_additions_stream%@"), v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          +[_DKEventStatsCounter counterInCollection:withEventName:]((uint64_t)_DKEventStatsCounter, CFSTR("coreduet_sync2"), v17);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)_updateEventStatsWithTotal_streamNameCounts_transportType__syncUpHistoryAdditionsCountersByStreamName, "setObject:forKeyedSubscript:", v14, v13);

        }
        -[_DKEventStatsCounter incrementCountByNumber:]((uint64_t)v14, objc_msgSend(v8, "countForObject:", v13));

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

}

- (void)handleUpdateStorageWithFetchedWindow:(uint64_t)a3 eventsCount:(void *)a4 error:
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  const char *v15;
  __CFString *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  const char *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[5];
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  const __CFString *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  __CFString *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  if (a1)
  {
    +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v9);

    if (v8)
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[_DKPerformSyncUpHistoryAdditionsOperation handleUpdateStorageWithFetchedWindow:eventsCount:error:].cold.2(a1, v8, v10);

      objc_msgSend((id)a1, "errors");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v8);

LABEL_22:
      objc_msgSend((id)a1, "endOperation");
      goto LABEL_23;
    }
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (a3)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "debugDescription");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(*(id *)(a1 + 304), "transportType");
        v15 = "down from";
        if (v14 == 8)
          v15 = "up to";
        v24 = v15;
        v16 = &stru_1E26E9728;
        if (objc_msgSend(*(id *)(a1 + 312), "me"))
          v17 = CFSTR("pseudo ");
        else
          v17 = &stru_1E26E9728;
        objc_msgSend(*(id *)(a1 + 312), "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 312), "model");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          v20 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(*(id *)(a1 + 312), "model");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "stringWithFormat:", CFSTR(" (%@)"), v23);
          v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(*(id *)(a1 + 304), "name");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138545154;
        v31 = v27;
        v32 = 2112;
        v33 = v26;
        v34 = 2114;
        v35 = v25;
        v36 = 2082;
        v37 = v24;
        v38 = 2114;
        v39 = v17;
        v40 = 2114;
        v41 = v18;
        v42 = 2114;
        v43 = v16;
        v44 = 2114;
        v45 = v21;
        _os_log_impl(&dword_18DDBE000, v13, OS_LOG_TYPE_INFO, "%{public}@: Synced up %@ events and high water mark window in window %{public}@ doing sync %{public}s %{public}@peer %{public}@%{public}@ on transport %{public}@", buf, 0x52u);

        if (v19)
        {

        }
      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      -[_DKPerformSyncUpHistoryAdditionsOperation handleUpdateStorageWithFetchedWindow:eventsCount:error:].cold.1(a1, v7, v13);
    }

    v22 = *(_QWORD *)(a1 + 352);
    if (v22 >= objc_msgSend(*(id *)(a1 + 320), "maxBatchesPerSync"))
      goto LABEL_22;
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __100___DKPerformSyncUpHistoryAdditionsOperation_handleUpdateStorageWithFetchedWindow_eventsCount_error___block_invoke;
    v28[3] = &unk_1E26E3250;
    v28[4] = a1;
    v29 = v7;
    +[_DKSyncSerializer performAsyncBlock:](_DKSyncSerializer, "performAsyncBlock:", v28);

  }
LABEL_23:

}

- (void)endOperation
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)_DKPerformSyncUpHistoryAdditionsOperation;
  -[_DKSyncCompositeOperation endOperation](&v2, sel_endOperation);
}

- (id)history
{
  if (result)
    return objc_getProperty(result, a2, 360, 1);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_history, 0);
  objc_storeStrong((id *)&self->_now, 0);
  objc_storeStrong((id *)&self->_streamNames, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_policy, 0);
  objc_storeStrong((id *)&self->_me, 0);
  objc_storeStrong((id *)&self->_transport, 0);
  objc_storeStrong((id *)&self->_localStorage, 0);
}

- (void)performSyncUpHistoryAdditionsWithAdditionsHighWaterMark:(NSObject *)a3 orError:.cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  const char *v6;
  __CFString *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint8_t buf[14];
  const char *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  __CFString *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 304), "transportType") == 8)
    v6 = "up to";
  else
    v6 = "down from";
  v7 = &stru_1E26E9728;
  if (objc_msgSend((id)OUTLINED_FUNCTION_16_3(), "me"))
    v8 = CFSTR("pseudo ");
  else
    v8 = &stru_1E26E9728;
  objc_msgSend((id)OUTLINED_FUNCTION_16_3(), "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_16_3(), "model");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend((id)OUTLINED_FUNCTION_16_3(), "model");
    objc_claimAutoreleasedReturnValue();
    OUTLINED_FUNCTION_56();
    objc_msgSend(v11, "stringWithFormat:", CFSTR(" (%@)"));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(a1 + 304), "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "domain");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "code");
  OUTLINED_FUNCTION_17_3();
  v17 = v6;
  v18 = 2114;
  v19 = v8;
  v20 = 2114;
  v21 = v9;
  v22 = 2114;
  v23 = v7;
  v24 = 2114;
  v25 = v12;
  v26 = 2114;
  v27 = v13;
  v28 = 2048;
  v29 = v14;
  v30 = 2112;
  v31 = a2;
  _os_log_debug_impl(&dword_18DDBE000, a3, OS_LOG_TYPE_DEBUG, "%{public}@: Skipping additions history sync %{public}s %{public}@peer %{public}@%{public}@ on transport %{public}@: %{public}@:%lld (%@)", buf, 0x5Cu);

  if (v10)
  {

  }
}

- (void)handleUpdateStorageWithFetchedWindow:(uint64_t)a1 eventsCount:(void *)a2 error:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  void *v7;
  const char *v8;
  void *v9;
  __CFString *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *log;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  __CFString *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  log = a3;
  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "debugDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 304), "transportType") == 8)
    v8 = "up to";
  else
    v8 = "down from";
  v9 = &OBJC_IVAR____CDMemoryUsageInterval__startingLifetimeMaxMemoryUsage;
  v10 = &stru_1E26E9728;
  if (objc_msgSend((id)OUTLINED_FUNCTION_14_3(), "me"))
    v11 = CFSTR("pseudo ");
  else
    v11 = &stru_1E26E9728;
  objc_msgSend((id)OUTLINED_FUNCTION_14_3(), "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_14_3(), "model");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend((id)OUTLINED_FUNCTION_14_3(), "model");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR(" (%@)"), v9, log);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(a1 + 304), "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 138545154;
  v18 = v5;
  v19 = 2112;
  v20 = v6;
  v21 = 2114;
  v22 = v7;
  v23 = 2082;
  v24 = v8;
  v25 = 2114;
  v26 = v11;
  v27 = 2114;
  v28 = v12;
  v29 = 2114;
  v30 = v10;
  v31 = 2114;
  v32 = v15;
  _os_log_debug_impl(&dword_18DDBE000, log, OS_LOG_TYPE_DEBUG, "%{public}@: Synced up %@ events and high water mark window in window %{public}@ doing sync %{public}s %{public}@peer %{public}@%{public}@ on transport %{public}@", buf, 0x52u);

  if (v13)
  {

  }
}

- (void)handleUpdateStorageWithFetchedWindow:(uint64_t)a1 eventsCount:(void *)a2 error:(NSObject *)a3 .cold.2(uint64_t a1, void *a2, NSObject *a3)
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
  _os_log_error_impl(&dword_18DDBE000, a3, OS_LOG_TYPE_ERROR, "%{public}@: Failed while updating storage: %{public}@:%lld (%@)", (uint8_t *)&v7, 0x2Au);

}

@end

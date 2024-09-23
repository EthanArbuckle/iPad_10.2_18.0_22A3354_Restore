@implementation _DKSyncRapportKnowledgeStorage

+ (id)sharedInstance
{
  if (sharedInstance_initialized_182 != -1)
    dispatch_once(&sharedInstance_initialized_182, &__block_literal_global_184);
  return (id)sharedInstance_sharedInstance_183;
}

- (void)registerRequestIDsWithClient:(id)a3
{
  uint64_t v4;
  id v5;
  _QWORD v6[5];
  _QWORD v7[5];

  v4 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63___DKSyncRapportKnowledgeStorage_registerRequestIDsWithClient___block_invoke;
  v7[3] = &unk_1E26E6FB0;
  v7[4] = self;
  v5 = a3;
  objc_msgSend(v5, "registerRequestID:options:handler:", CFSTR("com.apple.coreduet.fetch-events"), 0, v7);
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __63___DKSyncRapportKnowledgeStorage_registerRequestIDsWithClient___block_invoke_2;
  v6[3] = &unk_1E26E6FB0;
  v6[4] = self;
  objc_msgSend(v5, "registerRequestID:options:handler:", CFSTR("com.apple.coreduet.fetch-deleted-event-ids"), 0, v6);

}

- (void)handleFetchEventsWithRequest:(void *)a3 options:(void *)a4 responseHandler:
{
  void *v4;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  BOOL v39;
  BOOL v40;
  BOOL v41;
  _BOOL4 v42;
  void *v43;
  NSObject *v44;
  int v45;
  NSObject *v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  id v50;
  void *v51;
  id v52;
  void *v53;
  uint64_t v54;
  void *v55;
  NSObject *v56;
  int v57;
  NSObject *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  BOOL v63;
  uint64_t v64;
  void *v65;
  id v66;
  void *v67;
  __CFString *v68;
  void *v69;
  void *v70;
  NSObject *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  NSObject *v75;
  void *v76;
  id v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  NSObject *v83;
  int v84;
  const __CFString *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  __CFString *v90;
  uint64_t v91;
  void *v92;
  __CFString *v93;
  __CFString *v94;
  const __CFString *v95;
  void *v96;
  NSObject *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  uint64_t v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  id v108;
  void *v109;
  void *v110;
  void *v111;
  const __CFString *v112;
  void *v113;
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
  void (**v125)(id, void *, _QWORD);
  id v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  id v131;
  id obj;
  uint64_t v133;
  void *v134;
  uint64_t v135;
  void *v136;
  uint64_t v137;
  void *v138;
  void *v139;
  id v140;
  __CFString *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  id *v147;
  BOOL v148;
  id v149;
  id v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  _QWORD v155[3];
  _QWORD v156[3];
  int buf;
  void *v158;
  __int16 v159;
  id v160;
  __int16 v161;
  uint64_t v162;
  __int16 v163;
  id v164;
  __int16 v165;
  __CFString *v166;
  _QWORD v167[4];
  _QWORD v168[4];
  _BYTE v169[128];
  uint64_t v170;

  v170 = *MEMORY[0x1E0C80C00];
  v131 = a2;
  v126 = a3;
  v125 = a4;
  v147 = a1;
  if (a1)
  {
    +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v8);

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      objc_claimAutoreleasedReturnValue();
      -[_DKSyncRapportKnowledgeStorage handleFetchEventsWithRequest:options:responseHandler:].cold.6();
    }

    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      objc_claimAutoreleasedReturnValue();
      -[_DKSyncRapportKnowledgeStorage handleFetchEventsWithRequest:options:responseHandler:].cold.5();
    }

    v127 = (void *)objc_opt_new();
    objc_msgSend(v131, "objectForKeyedSubscript:", CFSTR("version"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v137 = objc_msgSend(v11, "integerValue");
    v124 = v11;
    objc_msgSend(v131, "objectForKeyedSubscript:", CFSTR("compatibility"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKCompatibility compatibilityFromSerializedCompatibility:](_DKCompatibility, "compatibilityFromSerializedCompatibility:", v12);
    v123 = (void *)objc_claimAutoreleasedReturnValue();

    +[_DKSyncPeerStatusTracker sharedInstance](_DKSyncPeerStatusTracker, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "objectForKeyedSubscript:", CFSTR("senderIDS"));
    v121 = v13;
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "existingPeerWithIDSDeviceIdentifier:");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    if (v130)
    {
      objc_msgSend(v130, "version");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v124, "isEqualToString:", v14);

      if ((v15 & 1) == 0)
        -[_DKSyncRapportKnowledgeStorage handleUnexpectedRequest:fromPeer:](a1, v131, v130);
    }
    if (a1[3])
    {
      objc_msgSend(v131, "objectForKeyedSubscript:", CFSTR("queries"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v131, "objectForKeyedSubscript:", CFSTR("limit"));
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      if (v137 >= 3)
      {
        +[_CDLogging syncChannel](_CDLogging, "syncChannel");
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend((id)objc_opt_class(), "description");
          objc_claimAutoreleasedReturnValue();
          -[_DKSyncRapportKnowledgeStorage handleFetchEventsWithRequest:options:responseHandler:].cold.4();
        }

      }
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v16, "count"));
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      v153 = 0u;
      v154 = 0u;
      v151 = 0u;
      v152 = 0u;
      obj = v16;
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v151, v169, 16);
      v19 = 0;
      if (v18)
      {
        v138 = 0;
        v135 = *(_QWORD *)v152;
LABEL_16:
        v133 = v18;
        v20 = 0;
        v21 = v19;
        while (1)
        {
          v143 = v21;
          if (*(_QWORD *)v152 != v135)
            objc_enumerationMutation(obj);
          v22 = *(void **)(*((_QWORD *)&v151 + 1) + 8 * v20);
          objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("startDate"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("endDate"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("streamNames"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (v137 <= 2)
          {
            objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("limit"));
            v26 = objc_claimAutoreleasedReturnValue();

            v146 = (void *)v26;
          }
          objc_msgSend(v147, "policy");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v147[3], "syncType");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "streamNamesToSyncWithSyncType:transportType:", v28, objc_msgSend(v147, "transportType"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v29, "arrayByAddingObjectsFromArray:", &unk_1E272C058);
          v30 = objc_claimAutoreleasedReturnValue();

          objc_msgSend((id)v30, "arrayByAddingObject:", CFSTR("/device/isLocked"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v25);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v31);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "intersectSet:", v33);

          objc_msgSend(v32, "allObjects");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v30) = objc_msgSend(v34, "isEqual:", v25);

          if ((v30 & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v25);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v31);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "minusSet:", v36);

            +[_CDLogging syncChannel](_CDLogging, "syncChannel");
            v37 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
            {
              objc_msgSend((id)objc_opt_class(), "description");
              v4 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "allObjects");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              buf = 138543618;
              v158 = v4;
              v159 = 2112;
              v160 = v38;
              _os_log_impl(&dword_18DDBE000, v37, OS_LOG_TYPE_INFO, "%{public}@: Ignoring request for disabled streams: %@", (uint8_t *)&buf, 0x16u);

            }
          }
          objc_msgSend(v32, "allObjects");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          v39 = !v23 || v24 == 0;
          v40 = v39 || v25 == 0;
          v41 = v40 || v146 == 0;
          v42 = !v41;
          if (v41)
          {

            +[_DKSyncErrors invalidRequest](_DKSyncErrors, "invalidRequest");
            v43 = v138;
            v138 = (void *)objc_claimAutoreleasedReturnValue();
            v142 = 0;
          }
          else
          {
            +[_DKSyncWindow syncWindowWithStartDate:endDate:]((uint64_t)_DKSyncWindow, v23, v24);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v142, "addObject:", v43);
          }

          if (!v42)
            break;
          ++v20;
          v21 = v19;
          if (v133 == v20)
          {
            v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v151, v169, 16);
            if (v18)
              goto LABEL_16;
            break;
          }
        }
      }
      else
      {
        v138 = 0;
      }

      if (objc_msgSend(v142, "count") && objc_msgSend(v19, "count") && v146)
      {
        +[_CDLogging syncChannel](_CDLogging, "syncChannel");
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend((id)objc_opt_class(), "description");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          _DKSyncLoggingWindowsDescription(v142);
          v66 = (id)objc_claimAutoreleasedReturnValue();
          _CDPrettyPrintCollection(v19, 0, 0, 0);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          buf = 138544130;
          v158 = v65;
          v159 = 2112;
          v160 = v146;
          v161 = 2114;
          v162 = (uint64_t)v66;
          v163 = 2114;
          v164 = v67;
          _os_log_debug_impl(&dword_18DDBE000, v46, OS_LOG_TYPE_DEBUG, "%{public}@: Received fetch events request for up to %@ events in windows %{public}@ for streams %{public}@", (uint8_t *)&buf, 0x2Au);

        }
        v47 = objc_msgSend(v146, "unsignedIntegerValue");
        v48 = v47;
        if (v47 <= 1)
          v49 = v47;
        else
          v49 = v47 + 1;
        v50 = v147[3];
        v150 = v138;
        objc_msgSend(v50, "sortedEventsFromSyncWindows:streamNames:compatibility:limit:fetchOrder:error:", v142, v19, v123, v49, 2, &v150);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = v150;

        if (v52)
        {
          v53 = (void *)MEMORY[0x1E0CB35C8];
          objc_msgSend(v52, "domain");
          v144 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "errorWithDomain:code:userInfo:", v144, objc_msgSend(v52, "code"), 0);
          v54 = objc_claimAutoreleasedReturnValue();

          v45 = 1;
          v139 = (void *)v54;

        }
        else
        {
          if (v48 < 2)
          {
            v57 = 0;
            v55 = v51;
          }
          else
          {
            v55 = v51;
            if (objc_msgSend(v51, "count") == v48 + 1)
            {
              if (objc_msgSend(v51, "count"))
              {
                +[_CDLogging syncChannel](_CDLogging, "syncChannel");
                v56 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
                {
                  objc_msgSend((id)objc_opt_class(), "description");
                  v103 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v51, "count"));
                  v104 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v51, "count") - 1);
                  v105 = (void *)objc_claimAutoreleasedReturnValue();
                  buf = 138543874;
                  v158 = v103;
                  v159 = 2112;
                  v160 = v104;
                  v161 = 2112;
                  v162 = (uint64_t)v105;
                  _os_log_debug_impl(&dword_18DDBE000, v56, OS_LOG_TYPE_DEBUG, "%{public}@: Fetched %@ events but hit limit so using only %@ of those events", (uint8_t *)&buf, 0x20u);

                }
                objc_msgSend(v51, "subarrayWithRange:", 0, objc_msgSend(v51, "count") - 1);
                v55 = (void *)objc_claimAutoreleasedReturnValue();

              }
              v57 = 1;
            }
            else
            {
              v57 = 0;
            }
          }
          v149 = 0;
          -[_DKSyncRapportKnowledgeStorage changeSetForSyncWithEventsToInsert:eventIDsToDeletes:error:]((uint64_t)v147, v55, 0, &v149);
          v145 = (void *)objc_claimAutoreleasedReturnValue();
          v140 = v149;
          if (v140)
          {
            +[_CDLogging syncChannel](_CDLogging, "syncChannel");
            v58 = objc_claimAutoreleasedReturnValue();
            v51 = v55;
            if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend((id)objc_opt_class(), "description");
              v100 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v140, "domain");
              v101 = (void *)objc_claimAutoreleasedReturnValue();
              v102 = objc_msgSend(v140, "code");
              buf = 138544130;
              v158 = v100;
              v159 = 2114;
              v160 = v101;
              v161 = 2048;
              v162 = v102;
              v163 = 2112;
              v164 = v140;
              _os_log_error_impl(&dword_18DDBE000, v58, OS_LOG_TYPE_ERROR, "%{public}@: Failed to create change set: %{public}@:%lld (%@)", (uint8_t *)&buf, 0x2Au);

            }
            v59 = (void *)MEMORY[0x1E0CB35C8];
            objc_msgSend(v140, "domain");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "errorWithDomain:code:userInfo:", v60, objc_msgSend(v140, "code"), 0);
            v61 = objc_claimAutoreleasedReturnValue();

            v45 = 1;
            v139 = (void *)v61;
          }
          else
          {
            v51 = v55;
            v148 = 0;
            v45 = 1;
            objc_msgSend(v145, "eventsToAdd");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            v63 = objc_msgSend(v62, "count") == 0;

            if (v63)
            {
              v64 = objc_opt_new();
            }
            else
            {
              -[_DKSyncRapportKnowledgeStorage dataFromChangeSet:didCompress:]((uint64_t)v147, v145, &v148);
              v64 = objc_claimAutoreleasedReturnValue();
              v45 = 0;
            }
            v136 = (void *)v64;
            if (v64)
            {
              if (v148)
                v68 = CFSTR("compressedEvents");
              else
                v68 = CFSTR("encodedEvents");
              v141 = v68;
              if (v137 > 2)
              {
                if (v57)
                {
                  +[_DKSyncWindow completedWindowsWithSortedEvents:windows:fetchOrder:fillOrder:hitLimit:]((uint64_t)_DKSyncWindow, v51, v142, 2, 1, 1);
                  v77 = (id)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v77 = v142;
                }
                v70 = v77;
                objc_msgSend(v127, "setObject:forKeyedSubscript:", v136, v141);
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v145, "sequenceNumber"));
                v78 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v127, "setObject:forKeyedSubscript:", v78, CFSTR("sequenceNumber"));
                +[_DKSyncWindow dictionaryArrayFromWindows:]((uint64_t)_DKSyncWindow, v70);
                v79 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v127, "setObject:forKeyedSubscript:", v79, CFSTR("completedWindows"));

                if (v57)
                  v80 = MEMORY[0x1E0C9AAB0];
                else
                  v80 = MEMORY[0x1E0C9AAA0];
                objc_msgSend(v127, "setObject:forKeyedSubscript:", v80, CFSTR("didHitLimit"));
              }
              else
              {
                objc_msgSend(obj, "firstObject");
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                v70 = v69;
                if (v57)
                {
                  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
                  v71 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
                  {
                    objc_msgSend((id)objc_opt_class(), "description");
                    v106 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v70, "objectForKeyedSubscript:", CFSTR("startDate"));
                    v107 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSDate dk_localtimeString](v107);
                    v108 = (id)objc_claimAutoreleasedReturnValue();
                    -[NSDate dk_localtimeString](0);
                    v109 = (void *)objc_claimAutoreleasedReturnValue();
                    buf = 138543874;
                    v158 = v106;
                    v159 = 2114;
                    v160 = v108;
                    v161 = 2114;
                    v162 = (uint64_t)v109;
                    _os_log_debug_impl(&dword_18DDBE000, v71, OS_LOG_TYPE_DEBUG, "%{public}@: Shrinking window start date from %{public}@ to %{public}@ due to hit limit", (uint8_t *)&buf, 0x20u);

                  }
                  objc_msgSend(v51, "lastObject");
                  v72 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v72, "creationDate");
                  v73 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v70, "objectForKeyedSubscript:", CFSTR("endDate"));
                  v74 = objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  objc_msgSend(v69, "objectForKeyedSubscript:", CFSTR("startDate"));
                  v73 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v70, "objectForKeyedSubscript:", CFSTR("endDate"));
                  v74 = objc_claimAutoreleasedReturnValue();
                }
                v79 = (void *)v74;
                v168[0] = v136;
                v167[0] = v141;
                v167[1] = CFSTR("sequenceNumber");
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v145, "sequenceNumber"));
                v81 = (void *)objc_claimAutoreleasedReturnValue();
                v168[1] = v81;
                v168[2] = v73;
                v167[2] = CFSTR("windowStartDate");
                v167[3] = CFSTR("windowEndDate");
                v168[3] = v79;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v168, v167, 4);
                v82 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v127, "setObject:forKeyedSubscript:", v82, v70);

              }
              +[_CDLogging syncChannel](_CDLogging, "syncChannel");
              v83 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v83, OS_LOG_TYPE_INFO))
              {
                objc_msgSend((id)objc_opt_class(), "description");
                v115 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v51, "count"));
                v114 = (void *)objc_claimAutoreleasedReturnValue();
                +[_DKSyncPeerStatusTracker sharedInstance](_DKSyncPeerStatusTracker, "sharedInstance");
                v134 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v131, "objectForKeyedSubscript:", CFSTR("client"));
                v128 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v134, "existingPeerWithSourceDeviceID:", v128);
                v120 = (void *)objc_claimAutoreleasedReturnValue();
                v84 = objc_msgSend(v120, "me");
                v85 = CFSTR("pseudo ");
                if (!v84)
                  v85 = &stru_1E26E9728;
                v112 = v85;
                +[_DKSyncPeerStatusTracker sharedInstance](_DKSyncPeerStatusTracker, "sharedInstance");
                v119 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v131, "objectForKeyedSubscript:", CFSTR("client"));
                v118 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v119, "existingPeerWithSourceDeviceID:", v118);
                v117 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v117, "identifier");
                v113 = (void *)objc_claimAutoreleasedReturnValue();
                +[_DKSyncPeerStatusTracker sharedInstance](_DKSyncPeerStatusTracker, "sharedInstance");
                v116 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v131, "objectForKeyedSubscript:", CFSTR("client"));
                v86 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v116, "existingPeerWithSourceDeviceID:", v86);
                v87 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v87, "model");
                v88 = (void *)objc_claimAutoreleasedReturnValue();
                if (v88)
                {
                  v89 = (void *)MEMORY[0x1E0CB3940];
                  +[_DKSyncPeerStatusTracker sharedInstance](_DKSyncPeerStatusTracker, "sharedInstance");
                  v111 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v131, "objectForKeyedSubscript:", CFSTR("client"));
                  v110 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v111, "existingPeerWithSourceDeviceID:", v110);
                  v79 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v79, "model");
                  v4 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v89, "stringWithFormat:", CFSTR(" (%@)"), v4);
                  v90 = (__CFString *)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v90 = &stru_1E26E9728;
                }
                buf = 138544386;
                v158 = v115;
                v159 = 2112;
                v160 = v114;
                v161 = 2114;
                v162 = (uint64_t)v112;
                v163 = 2114;
                v164 = v113;
                v165 = 2114;
                v166 = v90;
                _os_log_impl(&dword_18DDBE000, v83, OS_LOG_TYPE_INFO, "%{public}@: Sending %@ events to %{public}@peer %{public}@%{public}@", (uint8_t *)&buf, 0x34u);
                if (v88)
                {

                }
              }

              v139 = 0;
              v76 = v136;
            }
            else
            {
              +[_CDLogging syncChannel](_CDLogging, "syncChannel");
              v75 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend((id)objc_opt_class(), "description");
                objc_claimAutoreleasedReturnValue();
                -[_DKSyncRapportKnowledgeStorage handleFetchEventsWithRequest:options:responseHandler:].cold.3();
              }

              +[_DKSyncErrors internalFailure](_DKSyncErrors, "internalFailure");
              v139 = (void *)objc_claimAutoreleasedReturnValue();
              v76 = 0;
            }

          }
        }
      }
      else
      {
        +[_DKSyncErrors invalidRequest](_DKSyncErrors, "invalidRequest");
        v45 = 1;
        v51 = v138;
        v139 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        objc_claimAutoreleasedReturnValue();
        -[_DKSyncRapportKnowledgeStorage handleFetchEventsWithRequest:options:responseHandler:].cold.2();
      }

      +[_DKSyncErrors internalFailure](_DKSyncErrors, "internalFailure");
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = 1;
    }
    objc_msgSend(v147, "myDeviceID");
    v91 = objc_claimAutoreleasedReturnValue();
    v92 = (void *)v91;
    v93 = &stru_1E26E9728;
    if (v91)
      v93 = (__CFString *)v91;
    v94 = v93;

    v155[0] = CFSTR("server");
    v155[1] = CFSTR("results");
    v156[0] = v94;
    v156[1] = v127;
    v155[2] = CFSTR("version");
    v95 = CFSTR("3.0");
    if (v137 < 3)
      v95 = CFSTR("1.0");
    v156[2] = v95;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v156, v155, 3);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v97 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v97, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      objc_claimAutoreleasedReturnValue();
      -[_DKSyncRapportKnowledgeStorage handleFetchEventsWithRequest:options:responseHandler:].cold.1();
    }

    v125[2](v125, v96, 0);
    if (v129)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v147[3], "syncType");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      +[_DKSyncPowerlog recordWithSyncType:transportType:startDate:endDate:isEmpty:](_DKSyncPowerlog, "recordWithSyncType:transportType:startDate:endDate:isEmpty:", v99, objc_msgSend(v147, "transportType"), v129, v98, v45 != 0);

    }
  }

}

- (void)handleFetchDeletedEventIDsWithRequest:(void *)a3 options:(void *)a4 responseHandler:
{
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  BOOL v30;
  int v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  void *v35;
  const __CFString *v36;
  NSObject *v37;
  __CFString *v38;
  __CFString *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  NSObject *v46;
  uint64_t v47;
  void *v48;
  __CFString *v49;
  __CFString *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  id v55;
  void (**v56)(id, void *, _QWORD, void *);
  void *v57;
  __CFString *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  const __CFString *v63;
  void *v64;
  char v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  NSObject *log;
  void *v79;
  id obj;
  id *v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  id v85;
  id v86;
  id v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _QWORD v92[3];
  _QWORD v93[3];
  BOOL v94;
  _QWORD v95[4];
  _QWORD v96[4];
  uint8_t buf[4];
  void *v98;
  __int16 v99;
  id v100;
  __int16 v101;
  uint64_t v102;
  __int16 v103;
  void *v104;
  __int16 v105;
  const __CFString *v106;
  _BYTE v107[128];
  uint64_t v108;

  v108 = *MEMORY[0x1E0C80C00];
  v77 = a2;
  v55 = a3;
  v56 = a4;
  v81 = (id *)a1;
  if (a1)
  {
    +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v7);

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      objc_claimAutoreleasedReturnValue();
      -[_DKSyncRapportKnowledgeStorage handleFetchDeletedEventIDsWithRequest:options:responseHandler:].cold.4();
    }

    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      objc_claimAutoreleasedReturnValue();
      -[_DKSyncRapportKnowledgeStorage handleFetchDeletedEventIDsWithRequest:options:responseHandler:].cold.3();
    }

    v64 = (void *)objc_opt_new();
    if (*(_QWORD *)(a1 + 24))
    {
      objc_msgSend(v77, "objectForKeyedSubscript:", CFSTR("queries"));
      v90 = 0u;
      v91 = 0u;
      v88 = 0u;
      v89 = 0u;
      obj = (id)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v107, 16);
      v11 = 0;
      if (!v10)
      {
        v65 = 1;
        goto LABEL_56;
      }
      v65 = 1;
      v82 = *(_QWORD *)v89;
      while (1)
      {
        v83 = v10;
        for (i = 0; i != v83; ++i)
        {
          if (*(_QWORD *)v89 != v82)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * i);
          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("sinceDate"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("streamNames"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("limit"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          +[_CDLogging syncChannel](_CDLogging, "syncChannel");
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend((id)objc_opt_class(), "description");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSDate dk_localtimeString](v14);
            v27 = (id)objc_claimAutoreleasedReturnValue();
            _CDPrettyPrintCollection(v15, 0, 0, 0);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v98 = v26;
            v99 = 2112;
            v100 = v16;
            v101 = 2114;
            v102 = (uint64_t)v27;
            v103 = 2114;
            v104 = v28;
            _os_log_debug_impl(&dword_18DDBE000, v17, OS_LOG_TYPE_DEBUG, "%{public}@: Received fetch deleted event ids request for up to %@ deletions since %{public}@ for streams %{public}@", buf, 0x2Au);

          }
          if (!v14 || !v15)
          {
            +[_DKSyncErrors invalidRequest](_DKSyncErrors, "invalidRequest");
            v19 = v11;
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_49;
          }
          if (v16)
            v18 = objc_msgSend(v16, "unsignedIntegerValue");
          else
            v18 = 0x7FFFFFFFFFFFFFFFLL;
          v20 = v81[3];
          v86 = v11;
          v87 = 0;
          objc_msgSend(v20, "deletedEventIDsSinceDate:streamNames:limit:endDate:error:", v14, v15, v18, &v87, &v86);
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v87;
          v21 = v86;

          if (v21)
          {
            +[_DKSyncErrors internalFailure](_DKSyncErrors, "internalFailure");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v85 = 0;
            -[_DKSyncRapportKnowledgeStorage changeSetForSyncWithEventsToInsert:eventIDsToDeletes:error:]((uint64_t)v81, 0, v84, &v85);
            v21 = (id)objc_claimAutoreleasedReturnValue();
            v22 = v85;
            if (!v22)
            {
              v94 = 0;
              objc_msgSend(v21, "eventsToAdd");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v25, "count"))
              {

                goto LABEL_29;
              }
              objc_msgSend(v21, "eventIDsToDelete");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = objc_msgSend(v29, "count") == 0;

              if (v30)
              {
                v79 = (void *)objc_opt_new();
              }
              else
              {
LABEL_29:
                -[_DKSyncRapportKnowledgeStorage dataFromChangeSet:didCompress:]((uint64_t)v81, v21, &v94);
                v79 = (void *)objc_claimAutoreleasedReturnValue();
                v65 = 0;
              }
              if (v79)
              {
                +[_CDLogging syncChannel](_CDLogging, "syncChannel");
                log = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
                {
                  objc_msgSend((id)objc_opt_class(), "description");
                  v67 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v84, "count"));
                  v66 = (void *)objc_claimAutoreleasedReturnValue();
                  +[_DKSyncPeerStatusTracker sharedInstance](_DKSyncPeerStatusTracker, "sharedInstance");
                  v75 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v77, "objectForKeyedSubscript:", CFSTR("client"));
                  v76 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v75, "existingPeerWithSourceDeviceID:", v76);
                  v74 = (void *)objc_claimAutoreleasedReturnValue();
                  v31 = objc_msgSend(v74, "me");
                  v32 = &stru_1E26E9728;
                  if (v31)
                    v32 = CFSTR("pseudo ");
                  v63 = v32;
                  +[_DKSyncPeerStatusTracker sharedInstance](_DKSyncPeerStatusTracker, "sharedInstance");
                  v73 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v77, "objectForKeyedSubscript:", CFSTR("client"));
                  v72 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v73, "existingPeerWithSourceDeviceID:", v72);
                  v71 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v71, "identifier");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  +[_DKSyncPeerStatusTracker sharedInstance](_DKSyncPeerStatusTracker, "sharedInstance");
                  v70 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v77, "objectForKeyedSubscript:", CFSTR("client"));
                  v69 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v70, "existingPeerWithSourceDeviceID:", v69);
                  v68 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v68, "model");
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v34)
                  {
                    v35 = (void *)MEMORY[0x1E0CB3940];
                    +[_DKSyncPeerStatusTracker sharedInstance](_DKSyncPeerStatusTracker, "sharedInstance");
                    v61 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v77, "objectForKeyedSubscript:", CFSTR("client"));
                    v62 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v61, "existingPeerWithSourceDeviceID:", v62);
                    v60 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v60, "model");
                    v59 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v35, "stringWithFormat:", CFSTR(" (%@)"), v59);
                    v58 = (__CFString *)objc_claimAutoreleasedReturnValue();
                    v36 = v58;
                  }
                  else
                  {
                    v36 = &stru_1E26E9728;
                  }
                  *(_DWORD *)buf = 138544386;
                  v98 = v67;
                  v99 = 2112;
                  v100 = v66;
                  v101 = 2114;
                  v102 = (uint64_t)v63;
                  v103 = 2114;
                  v104 = v33;
                  v105 = 2114;
                  v106 = v36;
                  _os_log_impl(&dword_18DDBE000, log, OS_LOG_TYPE_INFO, "%{public}@: Sending %@ deletions to %{public}@peer %{public}@%{public}@", buf, 0x34u);
                  if (v34)
                  {

                  }
                }

                v38 = CFSTR("compressedDeletedEventIDs");
                if (!v94)
                  v38 = CFSTR("encodedDeletedEventIDs");
                v39 = v38;
                v96[0] = v79;
                v95[0] = v39;
                v95[1] = CFSTR("sequenceNumber");
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v21, "sequenceNumber"));
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                v96[1] = v40;
                v96[2] = v14;
                v95[2] = CFSTR("sinceDate");
                v95[3] = CFSTR("untilDate");
                v96[3] = v19;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v96, v95, 4);
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v64, "setObject:forKeyedSubscript:", v41, v13);

                v11 = 0;
              }
              else
              {
                +[_CDLogging syncChannel](_CDLogging, "syncChannel");
                v37 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend((id)objc_opt_class(), "description");
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v98 = v45;
                  v99 = 2112;
                  v100 = v21;
                  _os_log_error_impl(&dword_18DDBE000, v37, OS_LOG_TYPE_ERROR, "%{public}@: Failed to encode change set as protobuf: %@", buf, 0x16u);

                }
                +[_DKSyncErrors internalFailure](_DKSyncErrors, "internalFailure");
                v11 = (void *)objc_claimAutoreleasedReturnValue();
              }

              goto LABEL_48;
            }
            v23 = v22;
            +[_CDLogging syncChannel](_CDLogging, "syncChannel");
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend((id)objc_opt_class(), "description");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "domain");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              v44 = objc_msgSend(v23, "code");
              *(_DWORD *)buf = 138544130;
              v98 = v42;
              v99 = 2114;
              v100 = v43;
              v101 = 2048;
              v102 = v44;
              v103 = 2112;
              v104 = v23;
              _os_log_error_impl(&dword_18DDBE000, v24, OS_LOG_TYPE_ERROR, "%{public}@: Failed to create change set: %{public}@:%lld (%@)", buf, 0x2Au);

            }
            +[_DKSyncErrors internalFailure](_DKSyncErrors, "internalFailure");
            v11 = (void *)objc_claimAutoreleasedReturnValue();

          }
LABEL_48:

LABEL_49:
        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v107, 16);
        if (!v10)
        {
LABEL_56:

          goto LABEL_57;
        }
      }
    }
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      objc_claimAutoreleasedReturnValue();
      -[_DKSyncRapportKnowledgeStorage handleFetchDeletedEventIDsWithRequest:options:responseHandler:].cold.2();
    }

    +[_DKSyncErrors internalFailure](_DKSyncErrors, "internalFailure");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = 1;
LABEL_57:
    objc_msgSend(v81, "myDeviceID");
    v47 = objc_claimAutoreleasedReturnValue();
    v48 = (void *)v47;
    v49 = &stru_1E26E9728;
    if (v47)
      v49 = (__CFString *)v47;
    v50 = v49;

    v92[0] = CFSTR("server");
    v92[1] = CFSTR("results");
    v93[0] = v50;
    v93[1] = v64;
    v92[2] = CFSTR("version");
    v93[2] = CFSTR("1.0");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v93, v92, 3);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      objc_claimAutoreleasedReturnValue();
      -[_DKSyncRapportKnowledgeStorage handleFetchDeletedEventIDsWithRequest:options:responseHandler:].cold.1();
    }

    v56[2](v56, v51, 0, v11);
    if (v57)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81[3], "syncType");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      +[_DKSyncPowerlog recordWithSyncType:transportType:startDate:endDate:isEmpty:](_DKSyncPowerlog, "recordWithSyncType:transportType:startDate:endDate:isEmpty:", v54, objc_msgSend(v81, "transportType"), v57, v53, v65 & 1);

    }
  }

}

- (void)prewarmFetchWithCompletion:(id)a3
{
  if (a3)
    (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (BOOL)hasAdditionsFlagForPeer:(id)a3
{
  return 1;
}

- (BOOL)hasDeletionsFlagForPeer:(id)a3
{
  return 1;
}

- (void)handleUnexpectedRequest:(void *)a3 fromPeer:
{
  void *v3;
  id v6;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  void *v11;
  __CFString *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (a1)
  {
    objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("version"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "version");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

    if ((v9 & 1) == 0)
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = &stru_1E26E9728;
        if (objc_msgSend(v6, "me"))
          v13 = CFSTR("pseudo ");
        else
          v13 = &stru_1E26E9728;
        objc_msgSend(v6, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "model");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v16 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v6, "model");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "stringWithFormat:", CFSTR(" (%@)"), v3);
          v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        *(_DWORD *)buf = 138544386;
        v18 = v11;
        v19 = 2114;
        v20 = v7;
        v21 = 2114;
        v22 = v13;
        v23 = 2114;
        v24 = v14;
        v25 = 2114;
        v26 = v12;
        _os_log_error_impl(&dword_18DDBE000, v10, OS_LOG_TYPE_ERROR, "%{public}@: Unexpected version %{public}@ in request from %{public}@peer %{public}@%{public}@", buf, 0x34u);
        if (v15)
        {

        }
      }

      objc_msgSend(v6, "setVersion:", 0);
      objc_msgSend(a1, "handshakeWithDuetSyncPeer:orError:", v6, 0);
    }

  }
}

- (void)handleUnexpectedResponse:(void *)a3 fromPeer:
{
  void *v3;
  id v6;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  void *v11;
  __CFString *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (a1)
  {
    objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("version"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "version");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

    if ((v9 & 1) == 0)
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = &stru_1E26E9728;
        if (objc_msgSend(v6, "me"))
          v13 = CFSTR("pseudo ");
        else
          v13 = &stru_1E26E9728;
        objc_msgSend(v6, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "model");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v16 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v6, "model");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "stringWithFormat:", CFSTR(" (%@)"), v3);
          v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        *(_DWORD *)buf = 138544386;
        v18 = v11;
        v19 = 2114;
        v20 = v7;
        v21 = 2114;
        v22 = v13;
        v23 = 2114;
        v24 = v14;
        v25 = 2114;
        v26 = v12;
        _os_log_error_impl(&dword_18DDBE000, v10, OS_LOG_TYPE_ERROR, "%{public}@: Unexpected version %{public}@ in response from %{public}@peer %{public}@%{public}@", buf, 0x34u);
        if (v15)
        {

        }
      }

      objc_msgSend(v6, "setVersion:", 0);
      objc_msgSend(a1, "handshakeWithDuetSyncPeer:orError:", v6, 0);
    }

  }
}

- (void)fetchEventsFromPeer:(id)a3 windows:(id)a4 streamNames:(id)a5 limit:(unint64_t)a6 fetchOrder:(int64_t)a7 highPriority:(BOOL)a8 completion:(id)a9
{
  _BOOL4 v9;
  id v13;
  id v14;
  NSObject *v15;
  __CFString *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  NSObject *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  const __CFString *v37;
  const __CFString *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  __CFString *v48;
  void *v49;
  const __CFString *v50;
  void *v51;
  void *v52;
  __CFString *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  _BOOL4 v59;
  _DKSyncRapportKnowledgeStorage *v60;
  const __CFString *v61;
  void *v62;
  id v64;
  void *v65;
  void *v66;
  uint64_t v67;
  id v68;
  _QWORD v69[4];
  id v70;
  _QWORD v71[5];
  id v72;
  id v73;
  id v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _QWORD v79[5];
  _QWORD v80[5];
  _QWORD v81[3];
  _QWORD v82[3];
  _QWORD v83[4];
  _QWORD v84[4];
  uint8_t v85[128];
  uint8_t buf[4];
  void *v87;
  __int16 v88;
  const __CFString *v89;
  __int16 v90;
  void *v91;
  __int16 v92;
  __CFString *v93;
  __int16 v94;
  void *v95;
  _QWORD v96[4];

  v9 = a8;
  v96[1] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v64 = a4;
  v68 = a5;
  v14 = a9;
  +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v15);

  -[_DKSyncRapportStorage myDeviceID](self, "myDeviceID");
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "version");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = objc_msgSend(v17, "integerValue");

  if (-[_DKSyncRapportStorage isAvailable](self, "isAvailable")
    && (objc_msgSend(v13, "idsDeviceIdentifier"), (v18 = objc_claimAutoreleasedReturnValue()) != 0)
    && (v19 = (void *)v18,
        v20 = -[_DKSyncRapportStorage isTransportActiveForPeer:](self, "isTransportActiveForPeer:", v13),
        v19,
        v20))
  {
    v58 = v14;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = v16;
    v62 = v13;
    v60 = self;
    v59 = v9;
    if (v67 <= 2)
    {
      if ((unint64_t)objc_msgSend(v64, "count") < 2)
      {
        v21 = v64;
      }
      else
      {
        objc_msgSend(v64, "lastObject");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v96[0] = v24;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v96, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        +[_CDLogging syncChannel](_CDLogging, "syncChannel");
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend((id)objc_opt_class(), "description");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "me"))
            v50 = CFSTR("pseudo ");
          else
            v50 = &stru_1E26E9728;
          objc_msgSend(v13, "identifier");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "model");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          if (v52)
          {
            v54 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v13, "model");
            v64 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "stringWithFormat:", CFSTR(" (%@)"), v64);
            v53 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v53 = &stru_1E26E9728;
          }
          objc_msgSend(v21, "firstObject");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "debugDescription");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544386;
          v87 = v66;
          v88 = 2114;
          v89 = v50;
          v90 = 2114;
          v91 = v51;
          v92 = 2114;
          v93 = v53;
          v94 = 2114;
          v95 = v56;
          _os_log_debug_impl(&dword_18DDBE000, v25, OS_LOG_TYPE_DEBUG, "%{public}@: Only sending a single window to v1 %{public}@peer %{public}@%{public}@: window %{public}@", buf, 0x34u);

          if (v52)
          {

          }
        }

      }
    }
    else
    {
      v21 = v64;
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v21, "count"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    v26 = v21;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v75, v85, 16);
    v64 = v26;
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v76;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v76 != v29)
            objc_enumerationMutation(v26);
          v31 = *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * i);
          -[_DKSyncWindow startDate](v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[_DKSyncType urgency](v31);
          v33 = objc_claimAutoreleasedReturnValue();
          v34 = (void *)v33;
          if (v67 < 3)
          {
            v83[0] = CFSTR("startDate");
            v83[1] = CFSTR("endDate");
            v84[0] = v32;
            v84[1] = v33;
            v84[2] = v68;
            v83[2] = CFSTR("streamNames");
            v83[3] = CFSTR("limit");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a6);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v84[3] = v36;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v84, v83, 4);
            v35 = (void *)objc_claimAutoreleasedReturnValue();

            v26 = v64;
          }
          else
          {
            v81[0] = CFSTR("startDate");
            v81[1] = CFSTR("endDate");
            v82[0] = v32;
            v82[1] = v33;
            v81[2] = CFSTR("streamNames");
            v82[2] = v68;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v82, v81, 3);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v65, "addObject:", v35);

        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v75, v85, 16);
      }
      while (v28);
    }

    v16 = (__CFString *)v61;
    v37 = &stru_1E26E9728;
    if (v61)
      v38 = v61;
    else
      v38 = &stru_1E26E9728;
    v79[0] = CFSTR("client");
    v79[1] = CFSTR("queries");
    v22 = v65;
    v80[0] = v38;
    v80[1] = v65;
    v79[2] = CFSTR("limit");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a6);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v80[2] = v39;
    v80[3] = CFSTR("3.0");
    v79[3] = CFSTR("version");
    v79[4] = CFSTR("compatibility");
    +[_DKCompatibility currentCompatibility](_DKCompatibility, "currentCompatibility");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "serialize");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v80[4] = v41;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v80, v79, 5);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v42 = objc_claimAutoreleasedReturnValue();
    v13 = v62;
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v62, "me"))
        v37 = CFSTR("pseudo ");
      objc_msgSend(v62, "identifier");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "model");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      if (v47)
      {
        v49 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v62, "model");
        v67 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "stringWithFormat:", CFSTR(" (%@)"), v67);
        v48 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v48 = &stru_1E26E9728;
      }
      *(_DWORD *)buf = 138544386;
      v87 = v45;
      v88 = 2114;
      v89 = v37;
      v90 = 2114;
      v91 = v46;
      v92 = 2114;
      v93 = v48;
      v94 = 2112;
      v95 = v23;
      _os_log_debug_impl(&dword_18DDBE000, v42, OS_LOG_TYPE_DEBUG, "%{public}@: Sending fetch events request to %{public}@peer %{public}@%{public}@: %@", buf, 0x34u);
      if (v47)
      {

      }
      v22 = v65;
    }

    v71[0] = MEMORY[0x1E0C809B0];
    v71[1] = 3221225472;
    v71[2] = __115___DKSyncRapportKnowledgeStorage_fetchEventsFromPeer_windows_streamNames_limit_fetchOrder_highPriority_completion___block_invoke;
    v71[3] = &unk_1E26E7028;
    v71[4] = v60;
    v72 = v62;
    v73 = v57;
    v74 = v58;
    v43 = v58;
    v44 = v57;
    -[_DKSyncRapportStorage sendRequestID:request:peer:highPriority:options:responseHandler:](v60, "sendRequestID:request:peer:highPriority:options:responseHandler:", CFSTR("com.apple.coreduet.fetch-events"), v23, v72, v59, 0, v71);

  }
  else
  {
    v69[0] = MEMORY[0x1E0C809B0];
    v69[1] = 3221225472;
    v69[2] = __115___DKSyncRapportKnowledgeStorage_fetchEventsFromPeer_windows_streamNames_limit_fetchOrder_highPriority_completion___block_invoke_2;
    v69[3] = &unk_1E26E2FE8;
    v70 = v14;
    v22 = v14;
    -[_DKSyncRapportStorage handleAvailabilityFailureWithPeer:completion:](self, "handleAvailabilityFailureWithPeer:completion:", v13, v69);
    v23 = v70;
  }

}

- (void)handleFetchEventsWithResponse:(void *)a3 options:(void *)a4 error:(void *)a5 peer:(void *)a6 plStartDate:(void *)a7 completion:
{
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  _BOOL8 v19;
  NSObject *v20;
  NSObject *v21;
  float v22;
  float v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  NSObject *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  int v47;
  const __CFString *v48;
  __CFString *v49;
  void *v50;
  void *v51;
  __CFString *v52;
  NSObject *v53;
  const __CFString *v54;
  void *v55;
  __CFString *v56;
  void *v57;
  const __CFString *v58;
  __CFString *v59;
  void *v60;
  __CFString *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  const __CFString *v66;
  __CFString *v67;
  __CFString *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  id v74;
  __CFString *v75;
  id v76;
  void (**v77)(void);
  id *v78;
  NSObject *v79;
  uint64_t v80;
  NSObject *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  void *v89;
  uint8_t v90[128];
  uint8_t buf[4];
  void *v92;
  __int16 v93;
  const __CFString *v94;
  __int16 v95;
  const __CFString *v96;
  __int16 v97;
  __CFString *v98;
  __int16 v99;
  __CFString *v100;
  uint64_t v101;

  v101 = *MEMORY[0x1E0C80C00];
  v75 = a2;
  v73 = a3;
  v79 = a4;
  v74 = a5;
  v76 = a6;
  v77 = a7;
  v78 = a1;
  if (!a1)
    goto LABEL_70;
  +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v13);

  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend((id)objc_opt_class(), "description");
    objc_claimAutoreleasedReturnValue();
    -[_DKSyncRapportKnowledgeStorage handleFetchEventsWithResponse:options:error:peer:plStartDate:completion:].cold.1();
  }

  v15 = v79;
  if (!v79)
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v74, "me"))
        v58 = CFSTR("pseudo ");
      else
        v58 = &stru_1E26E9728;
      objc_msgSend(v74, "identifier");
      v59 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "model");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      if (v60)
      {
        v64 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v74, "model");
        a3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "stringWithFormat:", CFSTR(" (%@)"), a3);
        v61 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v61 = &stru_1E26E9728;
      }
      *(_DWORD *)buf = 138544386;
      v92 = v57;
      v93 = 2114;
      v94 = v58;
      v95 = 2114;
      v96 = v59;
      v97 = 2114;
      v98 = v61;
      v99 = 2112;
      v100 = v75;
      _os_log_debug_impl(&dword_18DDBE000, v20, OS_LOG_TYPE_DEBUG, "%{public}@: Received fetch events response from %{public}@peer %{public}@%{public}@: %@", buf, 0x34u);
      if (v60)
      {

      }
    }

    +[_DKSyncErrors invalidResponse](_DKSyncErrors, "invalidResponse");
    v21 = objc_claimAutoreleasedReturnValue();
    v79 = v21;
    -[__CFString objectForKeyedSubscript:](v75, "objectForKeyedSubscript:", CFSTR("version"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "floatValue");
    v23 = v22;
    -[__CFString objectForKeyedSubscript:](v75, "objectForKeyedSubscript:", CFSTR("results"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = v24;
    if (objc_msgSend(v24, "count") == 1 && v23 < 3.0)
    {
      v87 = 0u;
      v88 = 0u;
      v85 = 0u;
      v86 = 0u;
      v25 = v24;
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v85, v90, 16);
      v27 = 0;
      v28 = 0;
      v29 = 0;
      if (v26)
      {
        v80 = *(_QWORD *)v86;
        v82 = 0;
        do
        {
          v83 = v26;
          v30 = 0;
          v31 = (void *)v27;
          v32 = (void *)v28;
          v33 = v29;
          do
          {
            if (*(_QWORD *)v86 != v80)
              objc_enumerationMutation(v25);
            objc_msgSend(v25, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * v30));
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("encodedEvents"));
            v27 = objc_claimAutoreleasedReturnValue();

            objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("compressedEvents"));
            v28 = objc_claimAutoreleasedReturnValue();

            objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("sequenceNumber"));
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("windowStartDate"));
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("windowEndDate"));
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = v36;
            if (v27 | v28 && v29 && v35 && v36)
            {
              +[_DKSyncWindow syncWindowWithStartDate:endDate:]((uint64_t)_DKSyncWindow, v35, v36);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v89 = v38;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v89, 1);
              v39 = objc_claimAutoreleasedReturnValue();

              v82 = (void *)v39;
            }

            ++v30;
            v31 = (void *)v27;
            v32 = (void *)v28;
            v33 = v29;
          }
          while (v83 != v30);
          v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v85, v90, 16);
        }
        while (v26);
      }
      else
      {
        v82 = 0;
      }
    }
    else
    {
      if ((unint64_t)objc_msgSend(v24, "count") < 4 || v23 < 3.0)
      {
        v82 = 0;
        -[_DKSyncRapportKnowledgeStorage handleUnexpectedResponse:fromPeer:](v78, v75, v74);
        v27 = 0;
        v28 = 0;
        v29 = 0;
LABEL_34:
        if (v27 | v28)
        {
          objc_msgSend(v74, "sourceDeviceUUID");
          v41 = objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend(v29, "unsignedIntegerValue");
          if (v28)
          {
            -[_DKSyncRapportKnowledgeStorage changeSetFromCompressedData:deviceIdentifier:sequenceNumber:]((uint64_t)v78, (void *)v28, v41, v42);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "eventsToAdd");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else if (objc_msgSend((id)v27, "length"))
          {
            +[_DKChangeSet createFromData:deviceIdentifier:sequenceNumber:](_DKChangeSet, "createFromData:deviceIdentifier:sequenceNumber:", v27, v41, v42);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "eventsToAdd");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v44 = (void *)objc_opt_new();
            v43 = 0;
          }
          v18 = v44;
          v84 = v43;
          v81 = v41;
          v19 = objc_msgSend(v44, "count") == 0;
          if (v18)
          {
            +[_CDLogging syncChannel](_CDLogging, "syncChannel");
            v45 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
            {
              objc_msgSend((id)objc_opt_class(), "description");
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              v46 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v18, "count"));
              v67 = (__CFString *)objc_claimAutoreleasedReturnValue();
              v47 = objc_msgSend(v74, "me");
              v48 = &stru_1E26E9728;
              if (v47)
                v48 = CFSTR("pseudo ");
              v66 = v48;
              objc_msgSend(v74, "identifier");
              v49 = (__CFString *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v74, "model");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              if (v50)
              {
                v51 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend(v74, "model");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v51, "stringWithFormat:", CFSTR(" (%@)"), v46);
                v52 = (__CFString *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v52 = &stru_1E26E9728;
              }
              *(_DWORD *)buf = 138544386;
              v92 = v69;
              v93 = 2112;
              v94 = v67;
              v95 = 2114;
              v96 = v66;
              v97 = 2114;
              v98 = v49;
              v99 = 2114;
              v100 = v52;
              _os_log_impl(&dword_18DDBE000, v45, OS_LOG_TYPE_INFO, "%{public}@: Fetched %@ added events from %{public}@peer %{public}@%{public}@", buf, 0x34u);
              if (v50)
              {

              }
            }

            v53 = v79;
            v79 = 0;
          }
          else
          {
            +[_CDLogging syncChannel](_CDLogging, "syncChannel");
            v53 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend((id)objc_opt_class(), "description");
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v74, "me"))
                v54 = CFSTR("pseudo ");
              else
                v54 = &stru_1E26E9728;
              objc_msgSend(v74, "identifier");
              v68 = (__CFString *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v74, "model");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              if (v55)
              {
                v65 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend(v74, "model");
                v41 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v65, "stringWithFormat:", CFSTR(" (%@)"), v41);
                v56 = (__CFString *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v56 = &stru_1E26E9728;
              }
              *(_DWORD *)buf = 138544130;
              v92 = v70;
              v93 = 2114;
              v94 = v54;
              v95 = 2114;
              v96 = v68;
              v97 = 2114;
              v98 = v56;
              _os_log_debug_impl(&dword_18DDBE000, v53, OS_LOG_TYPE_DEBUG, "%{public}@: Unable to decode events from %{public}@peer %{public}@%{public}@", buf, 0x2Au);
              if (v55)
              {

              }
            }
          }

          v21 = v81;
        }
        else
        {
          +[_DKSyncErrors invalidResponse](_DKSyncErrors, "invalidResponse");
          v18 = 0;
          v19 = 1;
          v79 = objc_claimAutoreleasedReturnValue();
        }

        v15 = v72;
        goto LABEL_65;
      }
      objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("encodedEvents"));
      v27 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("compressedEvents"));
      v28 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("sequenceNumber"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("completedWindows"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v40;
      v82 = 0;
      if (v27 | v28 && v29 && v40)
      {
        +[_DKSyncWindow windowsFromDictionaryArray:]((uint64_t)_DKSyncWindow, v40);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }

    v21 = v79;
    goto LABEL_34;
  }
  if (-[NSObject code](v79, "code") == -6714
    && (-[NSObject domain](v79, "domain"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v17 = objc_msgSend(v16, "isEqualToString:", *MEMORY[0x1E0D83988]),
        v16,
        v15 = v79,
        v17))
  {
    +[_DKSyncPeerStatusTracker sharedInstance](_DKSyncPeerStatusTracker, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeActiveTransports:fromPeer:", objc_msgSend(a1, "transportType"), v74);
    v82 = 0;
    v18 = 0;
    v19 = 1;
  }
  else
  {
    objc_msgSend(a1, "transformResponseError:", v15);
    v82 = 0;
    v18 = 0;
    v19 = 1;
    v79 = objc_claimAutoreleasedReturnValue();
  }
LABEL_65:

  if (v76)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78[3], "syncType");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKSyncPowerlog recordWithSyncType:transportType:startDate:endDate:isEmpty:](_DKSyncPowerlog, "recordWithSyncType:transportType:startDate:endDate:isEmpty:", v63, objc_msgSend(v78, "transportType"), v76, v62, v19);

  }
  if (v77)
    v77[2]();

LABEL_70:
}

- (_DKChangeSet)changeSetForSyncWithEventsToInsert:(void *)a3 eventIDsToDeletes:(_QWORD *)a4 error:
{
  id v7;
  id v8;
  uint64_t v9;
  _DKChangeSet *v10;
  void *v11;
  _DKChangeSet *v12;
  NSObject *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  _DKChangeSet *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  if (a1)
  {
    if (a4)
      *a4 = 0;
    v9 = *(_QWORD *)(a1 + 16) + 1;
    *(_QWORD *)(a1 + 16) = v9;
    v10 = [_DKChangeSet alloc];
    objc_msgSend(*(id *)(a1 + 24), "deviceUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[_DKChangeSet initWithEventsToAdd:eventIDsToDelete:deviceIdentifier:sequenceNumber:](v10, "initWithEventsToAdd:eventIDsToDelete:deviceIdentifier:sequenceNumber:", v7, v8, v11, v9);

    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[_DKChangeSet sequenceNumber](v12, "sequenceNumber"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[_DKChangeSet deviceIdentifier](v12, "deviceIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "UUIDString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138544642;
      v22 = v15;
      v23 = 2114;
      v24 = v16;
      v25 = 2114;
      v26 = v18;
      v27 = 2112;
      v28 = v19;
      v29 = 2112;
      v30 = v20;
      v31 = 2112;
      v32 = v12;
      _os_log_debug_impl(&dword_18DDBE000, v13, OS_LOG_TYPE_DEBUG, "%{public}@: Created change set %{public}@ on device %{public}@ containing %@ added events and %@ event ids to delete: %@", (uint8_t *)&v21, 0x3Eu);

    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)dataFromChangeSet:(BOOL *)a3 didCompress:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  size_t v13;
  uint8_t *v14;
  id v15;
  size_t v16;
  size_t v17;
  _DKPRCompressedChangeSet *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  const __CFString *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (!a1)
  {
    v25 = 0;
    goto LABEL_24;
  }
  objc_msgSend(v5, "asData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v20 = 0;
    if (!a3)
      goto LABEL_20;
    goto LABEL_19;
  }
  +[_CDSizeMetricFamily sizeMetricFamilyWithName:]((uint64_t)_CDSizeMetricFamily, CFSTR("Rapport"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDSizeMetricFamily sizeMetricWithName:string:scale:]((uint64_t)v8, CFSTR("bytes to send"), 0, 1024);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  CDSizeMetricAddSize((uint64_t)v9, objc_msgSend(v7, "length"));
  objc_msgSend(v6, "eventsToAdd");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count") && (unint64_t)objc_msgSend(v7, "length") >= 0x401)
  {

  }
  else
  {
    objc_msgSend(v6, "eventIDsToDelete");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v11, "count"))
    {

      goto LABEL_17;
    }
    v12 = objc_msgSend(v7, "length");

    if (v12 < 0x801)
      goto LABEL_17;
  }
  v13 = objc_msgSend(v7, "length");
  v14 = (uint8_t *)malloc_type_malloc(v13, 0x55F93CD8uLL);
  v15 = objc_retainAutorelease(v7);
  v16 = compression_encode_buffer(v14, v13, (const uint8_t *)objc_msgSend(v15, "bytes"), objc_msgSend(v15, "length"), 0, COMPRESSION_LZFSE);
  if (!v16 || (v17 = v16, v16 >= objc_msgSend(v15, "length")))
  {
    free(v14);
    goto LABEL_17;
  }
  v18 = objc_alloc_init(_DKPRCompressedChangeSet);
  -[_DKPRCompressedChangeSet setUncompressedLength:]((uint64_t)v18, objc_msgSend(v15, "length"));
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v14, v17, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKPRCompressedChangeSet setCompressedData:]((uint64_t)v18, v19);

  -[_DKPRCompressedChangeSet data](v18, "data");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
LABEL_17:
    -[_CDSizeMetricFamily sizeMetricWithName:string:scale:]((uint64_t)v8, CFSTR("uncompressed bytes sent"), 0, 1024);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    CDSizeMetricAddSize((uint64_t)v23, objc_msgSend(v7, "length"));

    v20 = 0;
    goto LABEL_18;
  }
  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend((id)objc_opt_class(), "description");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "eventIDsToDelete");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v33, "count");
    v28 = CFSTR("Deletion");
    if (!v27)
      v28 = CFSTR("Addition");
    v31 = v28;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v20, "length"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v15, "length"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v35 = v32;
    v36 = 2112;
    v37 = v31;
    v38 = 2112;
    v39 = v29;
    v40 = 2112;
    v41 = v30;
    _os_log_debug_impl(&dword_18DDBE000, v21, OS_LOG_TYPE_DEBUG, "%{public}@: %@ change set compressed to %@ (from %@)", buf, 0x2Au);

  }
  -[_CDSizeMetricFamily sizeMetricWithName:string:scale:]((uint64_t)v8, CFSTR("compressed bytes sent"), 0, 1024);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  CDSizeMetricAddSize((uint64_t)v22, objc_msgSend(v20, "length"));

LABEL_18:
  if (a3)
LABEL_19:
    *a3 = v20 != 0;
LABEL_20:
  if (v20)
    v24 = v20;
  else
    v24 = v7;
  v25 = v24;

LABEL_24:
  return v25;
}

- (id)changeSetFromCompressedData:(void *)a3 deviceIdentifier:(uint64_t)a4 sequenceNumber:
{
  id v7;
  id v8;
  _DKPRCompressedChangeSet *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  size_t v14;
  uint8_t *v15;
  id v16;
  const uint8_t *v17;
  void *v18;
  size_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!a1)
  {
    v23 = 0;
    goto LABEL_13;
  }
  v8 = a2;
  v9 = -[_DKPRCompressedChangeSet initWithData:]([_DKPRCompressedChangeSet alloc], "initWithData:", v8);

  if (!-[_DKPRCompressedChangeSet uncompressedLength]((uint64_t)v9))
    goto LABEL_8;
  -[_DKPRCompressedChangeSet compressedData]((uint64_t)v9);
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
    goto LABEL_8;
  v11 = (void *)v10;
  -[_DKPRCompressedChangeSet compressedData]((uint64_t)v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "length");

  if (v13)
  {
    v14 = -[_DKPRCompressedChangeSet uncompressedLength]((uint64_t)v9) + 32;
    v15 = (uint8_t *)malloc_type_malloc(v14, 0xC3A21B16uLL);
    -[_DKPRCompressedChangeSet compressedData]((uint64_t)v9);
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17 = (const uint8_t *)objc_msgSend(v16, "bytes");
    -[_DKPRCompressedChangeSet compressedData]((uint64_t)v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = compression_decode_buffer(v15, v14, v17, objc_msgSend(v18, "length"), 0, COMPRESSION_LZFSE);

    if (v19 == -[_DKPRCompressedChangeSet uncompressedLength]((uint64_t)v9))
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v15, v19, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v20)
      {
        +[_DKChangeSet createFromData:deviceIdentifier:sequenceNumber:](_DKChangeSet, "createFromData:deviceIdentifier:sequenceNumber:", v20, v7, a4);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_12;
    }
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v19);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[_DKPRCompressedChangeSet uncompressedLength]((uint64_t)v9));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138543874;
      v30 = v26;
      v31 = 2112;
      v32 = v27;
      v33 = 2112;
      v34 = v28;
      _os_log_error_impl(&dword_18DDBE000, v25, OS_LOG_TYPE_ERROR, "%{public}@: Dropping change set, uncompressed size %@ does not match uncompressed length %@", (uint8_t *)&v29, 0x20u);

    }
    free(v15);
  }
  else
  {
LABEL_8:
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[_DKSyncRapportKnowledgeStorage changeSetFromCompressedData:deviceIdentifier:sequenceNumber:].cold.1(a1, v22);

  }
  v21 = 0;
  v20 = 0;
LABEL_12:
  v23 = v20;

LABEL_13:
  return v23;
}

- (void)fetchDeletedEventIDsFromPeer:(id)a3 sinceDate:(id)a4 streamNames:(id)a5 limit:(unint64_t)a6 highPriority:(BOOL)a7 completion:(id)a8
{
  _BOOL4 v9;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  __CFString *v19;
  uint64_t v20;
  void *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  const __CFString *v27;
  void *v28;
  NSObject *v29;
  id v30;
  id v31;
  int v32;
  const __CFString *v33;
  __CFString *v34;
  void *v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _BOOL4 v42;
  _QWORD v43[4];
  id v44;
  _QWORD v45[5];
  id v46;
  id v47;
  id v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  const __CFString *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  __CFString *v56;
  __int16 v57;
  void *v58;
  _QWORD v59[3];
  _QWORD v60[3];
  _QWORD v61[3];
  _QWORD v62[3];
  _QWORD v63[4];

  v9 = a7;
  v63[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
  v18 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v18);

  -[_DKSyncRapportStorage myDeviceID](self, "myDeviceID");
  v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[_DKSyncRapportStorage isAvailable](self, "isAvailable")
    && (objc_msgSend(v14, "idsDeviceIdentifier"), (v20 = objc_claimAutoreleasedReturnValue()) != 0)
    && (v21 = (void *)v20,
        v22 = -[_DKSyncRapportStorage isTransportActiveForPeer:](self, "isTransportActiveForPeer:", v14),
        v21,
        v22))
  {
    v42 = v9;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v61[0] = CFSTR("sinceDate");
    v61[1] = CFSTR("streamNames");
    v62[0] = v15;
    v62[1] = v16;
    v61[2] = CFSTR("limit");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a6);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v62[2] = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v62, v61, 3);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v63[0] = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 1);
    v26 = (id)objc_claimAutoreleasedReturnValue();

    v27 = &stru_1E26E9728;
    if (v19)
      v27 = v19;
    v59[0] = CFSTR("client");
    v59[1] = CFSTR("queries");
    v60[0] = v27;
    v60[1] = v26;
    v59[2] = CFSTR("version");
    v60[2] = CFSTR("1.0");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, v59, 3);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      v38 = v23;
      objc_msgSend((id)objc_opt_class(), "description");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v14, "me");
      v33 = CFSTR("pseudo ");
      v34 = &stru_1E26E9728;
      if (!v32)
        v33 = &stru_1E26E9728;
      v37 = v33;
      objc_msgSend(v14, "identifier");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "model");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (v39)
      {
        v35 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v14, "model");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "stringWithFormat:", CFSTR(" (%@)"), v36);
        v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 138544386;
      v50 = v41;
      v51 = 2114;
      v52 = v37;
      v53 = 2114;
      v54 = v40;
      v55 = 2114;
      v56 = v34;
      v57 = 2112;
      v58 = v28;
      _os_log_debug_impl(&dword_18DDBE000, v29, OS_LOG_TYPE_DEBUG, "%{public}@: Sending deleted event ids request to %{public}@peer %{public}@%{public}@: %@", buf, 0x34u);
      if (v39)
      {

      }
      v23 = v38;
    }

    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __115___DKSyncRapportKnowledgeStorage_fetchDeletedEventIDsFromPeer_sinceDate_streamNames_limit_highPriority_completion___block_invoke;
    v45[3] = &unk_1E26E7028;
    v45[4] = self;
    v46 = v14;
    v47 = v23;
    v48 = v17;
    v30 = v17;
    v31 = v23;
    -[_DKSyncRapportStorage sendRequestID:request:peer:highPriority:options:responseHandler:](self, "sendRequestID:request:peer:highPriority:options:responseHandler:", CFSTR("com.apple.coreduet.fetch-deleted-event-ids"), v28, v46, v42, 0, v45);

  }
  else
  {
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __115___DKSyncRapportKnowledgeStorage_fetchDeletedEventIDsFromPeer_sinceDate_streamNames_limit_highPriority_completion___block_invoke_2;
    v43[3] = &unk_1E26E2FE8;
    v44 = v17;
    v26 = v17;
    -[_DKSyncRapportStorage handleAvailabilityFailureWithPeer:completion:](self, "handleAvailabilityFailureWithPeer:completion:", v14, v43);
    v28 = v44;
  }

}

- (void)handleFetchDeletedEventIDsWithResponse:(void *)a3 options:(void *)a4 error:(void *)a5 peer:(void *)a6 plStartDate:(void *)a7 completion:
{
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  BOOL v31;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  __CFString *v37;
  const __CFString *v38;
  __CFString *v39;
  void *v40;
  void *v41;
  const __CFString *v42;
  NSObject *v43;
  void *v44;
  const __CFString *v45;
  __CFString *v46;
  void *v47;
  const __CFString *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  const __CFString *v53;
  __CFString *v54;
  void *v55;
  __CFString *v56;
  void *v57;
  void *v58;
  id v59;
  __CFString *v60;
  void *v61;
  __CFString *v62;
  id v63;
  void (**v64)(void);
  __CFString *v65;
  void *v66;
  void *v67;
  BOOL v68;
  id *v69;
  NSObject *v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  void *v74;
  void *v75;
  id obj;
  void *v77;
  void *v78;
  void *v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  uint8_t v84[128];
  uint8_t buf[4];
  void *v86;
  __int16 v87;
  const __CFString *v88;
  __int16 v89;
  const __CFString *v90;
  __int16 v91;
  __CFString *v92;
  __int16 v93;
  const __CFString *v94;
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v62 = a2;
  v59 = a3;
  v70 = a4;
  v73 = a5;
  v63 = a6;
  v64 = a7;
  v69 = a1;
  if (!a1)
    goto LABEL_62;
  +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v13);

  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend((id)objc_opt_class(), "description");
    objc_claimAutoreleasedReturnValue();
    -[_DKSyncRapportKnowledgeStorage handleFetchDeletedEventIDsWithResponse:options:error:peer:plStartDate:completion:].cold.1();
  }

  v15 = v70;
  if (!v70)
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v73, "me"))
        v53 = CFSTR("pseudo ");
      else
        v53 = &stru_1E26E9728;
      objc_msgSend(v73, "identifier");
      v54 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "model");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      if (v55)
      {
        v57 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v73, "model");
        a3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "stringWithFormat:", CFSTR(" (%@)"), a3);
        v56 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v56 = &stru_1E26E9728;
      }
      *(_DWORD *)buf = 138544386;
      v86 = v52;
      v87 = 2114;
      v88 = v53;
      v89 = 2114;
      v90 = v54;
      v91 = 2114;
      v92 = v56;
      v93 = 2112;
      v94 = v62;
      _os_log_debug_impl(&dword_18DDBE000, v21, OS_LOG_TYPE_DEBUG, "%{public}@: Received fetch deleted event ids response from %{public}@peer %{public}@%{public}@: %@", buf, 0x34u);
      if (v55)
      {

      }
    }

    +[_DKSyncErrors invalidResponse](_DKSyncErrors, "invalidResponse");
    v22 = objc_claimAutoreleasedReturnValue();
    -[__CFString objectForKeyedSubscript:](v62, "objectForKeyedSubscript:", CFSTR("results"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "count") != 1)
    {
      v78 = 0;
      v79 = 0;
      v19 = 0;
      v20 = 1;
      v70 = v22;
      goto LABEL_57;
    }
    v82 = 0u;
    v83 = 0u;
    v80 = 0u;
    v81 = 0u;
    obj = v18;
    v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v84, 16);
    v58 = v18;
    if (!v23)
    {
      v78 = 0;
      v79 = 0;
      v24 = 0;
      v68 = 1;
      v70 = v22;
      goto LABEL_56;
    }
    v78 = 0;
    v79 = 0;
    v24 = 0;
    v71 = *(_QWORD *)v81;
    v68 = 1;
    v70 = v22;
    while (1)
    {
      v72 = v23;
      v25 = 0;
      v26 = v78;
      v27 = v79;
      do
      {
        if (*(_QWORD *)v81 != v71)
          objc_enumerationMutation(obj);
        objc_msgSend(obj, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * v25));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("encodedDeletedEventIDs"));
        v29 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("compressedDeletedEventIDs"));
        v30 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("sinceDate"));
        v79 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("untilDate"));
        v78 = (void *)objc_claimAutoreleasedReturnValue();

        if (v29 | v30)
          v31 = v79 == 0;
        else
          v31 = 1;
        if (!v31 && v78 != 0)
        {
          objc_msgSend(v73, "sourceDeviceUUID");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("sequenceNumber"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "unsignedIntegerValue");

          if (v30)
          {
            -[_DKSyncRapportKnowledgeStorage changeSetFromCompressedData:deviceIdentifier:sequenceNumber:]((uint64_t)v69, (void *)v30, v75, v34);
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v74, "eventIDsToDelete");
            v35 = objc_claimAutoreleasedReturnValue();
            goto LABEL_27;
          }
          if (objc_msgSend((id)v29, "length"))
          {
            +[_DKChangeSet createFromData:deviceIdentifier:sequenceNumber:](_DKChangeSet, "createFromData:deviceIdentifier:sequenceNumber:", v29, v75, v34);
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v74, "eventIDsToDelete");
            v35 = objc_claimAutoreleasedReturnValue();
LABEL_27:
            v77 = (void *)v35;
          }
          else
          {
            v77 = (void *)objc_opt_new();
            v74 = 0;
          }

          v68 = objc_msgSend(v77, "count") == 0;
          if (v77)
          {
            +[_CDLogging syncChannel](_CDLogging, "syncChannel");
            v36 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
            {
              objc_msgSend((id)objc_opt_class(), "description");
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v77, "count"));
              v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v73, "me"))
                v38 = CFSTR("pseudo ");
              else
                v38 = &stru_1E26E9728;
              objc_msgSend(v73, "identifier");
              v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v73, "model");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              if (v40)
              {
                v41 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend(v73, "model");
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v41, "stringWithFormat:", CFSTR(" (%@)"), v66);
                v65 = (__CFString *)objc_claimAutoreleasedReturnValue();
                v42 = v65;
              }
              else
              {
                v42 = &stru_1E26E9728;
              }
              *(_DWORD *)buf = 138544386;
              v86 = v67;
              v87 = 2112;
              v88 = v37;
              v89 = 2114;
              v90 = v38;
              v91 = 2114;
              v92 = v39;
              v93 = 2114;
              v94 = v42;
              _os_log_impl(&dword_18DDBE000, v36, OS_LOG_TYPE_INFO, "%{public}@: Fetched %@ deleted event ids from %{public}@peer %{public}@%{public}@", buf, 0x34u);
              if (v40)
              {

              }
            }

            v43 = v70;
            v70 = 0;
          }
          else
          {
            +[_CDLogging syncChannel](_CDLogging, "syncChannel");
            v43 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend((id)objc_opt_class(), "description");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v73, "me"))
                v45 = CFSTR("pseudo ");
              else
                v45 = &stru_1E26E9728;
              objc_msgSend(v73, "identifier");
              v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v73, "model");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              v48 = &stru_1E26E9728;
              if (v47)
              {
                v49 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend(v73, "model");
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v49, "stringWithFormat:", CFSTR(" (%@)"), v61);
                v60 = (__CFString *)objc_claimAutoreleasedReturnValue();
                v48 = v60;
              }
              *(_DWORD *)buf = 138544130;
              v86 = v44;
              v87 = 2114;
              v88 = v45;
              v89 = 2114;
              v90 = v46;
              v91 = 2114;
              v92 = (__CFString *)v48;
              _os_log_debug_impl(&dword_18DDBE000, v43, OS_LOG_TYPE_DEBUG, "%{public}@: Unable to decode deleted event ids from %{public}@peer %{public}@%{public}@", buf, 0x2Au);
              if (v47)
              {

              }
            }
          }

          v24 = v77;
        }

        ++v25;
        v26 = v78;
        v27 = v79;
      }
      while (v72 != v25);
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v84, 16);
      if (!v23)
      {
LABEL_56:

        v20 = v68;
        v19 = v24;
        v18 = v58;
        goto LABEL_57;
      }
    }
  }
  if (-[NSObject code](v70, "code") == -6714
    && (-[NSObject domain](v70, "domain"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v17 = objc_msgSend(v16, "isEqualToString:", *MEMORY[0x1E0D83988]),
        v16,
        v15 = v70,
        v17))
  {
    +[_DKSyncPeerStatusTracker sharedInstance](_DKSyncPeerStatusTracker, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "removeActiveTransports:fromPeer:", objc_msgSend(a1, "transportType"), v73);
    v78 = 0;
    v79 = 0;
    v19 = 0;
    v20 = 1;
  }
  else
  {
    objc_msgSend(a1, "transformResponseError:", v15);
    v78 = 0;
    v79 = 0;
    v19 = 0;
    v20 = 1;
    v18 = v15;
    v70 = objc_claimAutoreleasedReturnValue();
  }
LABEL_57:

  if (v63)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69[3], "syncType");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKSyncPowerlog recordWithSyncType:transportType:startDate:endDate:isEmpty:](_DKSyncPowerlog, "recordWithSyncType:transportType:startDate:endDate:isEmpty:", v51, objc_msgSend(v69, "transportType"), v63, v50, v20);

  }
  if (v64)
    v64[2]();

LABEL_62:
}

- (void)fetchDeletionsHighWaterMarkWithPeer:(id)a3 highPriority:(BOOL)a4 completion:(id)a5
{
  void *v6;
  id v7;
  id v8;

  if (a5)
  {
    v6 = (void *)MEMORY[0x1E0C99D68];
    v7 = a5;
    objc_msgSend(v6, "date");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id, _QWORD))a5 + 2))(v7, v8, 0);

  }
}

- (void)fetchAdditionsHighWaterMarkWithPeer:(id)a3 highPriority:(BOOL)a4 completion:(id)a5
{
  void *v6;
  id v7;
  id v8;

  if (a5)
  {
    v6 = (void *)MEMORY[0x1E0C99D68];
    v7 = a5;
    objc_msgSend(v6, "date");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id, _QWORD))a5 + 2))(v7, v8, 0);

  }
}

- (void)setFetchDelegate:(id)a3
{
  _DKSyncRemoteKnowledgeStorageFetchDelegate *v4;
  NSObject *v5;
  _DKSyncRemoteKnowledgeStorageFetchDelegate *delegate;
  _DKSyncRemoteKnowledgeStorageFetchDelegate *v7;
  void *v8;
  id v9;

  v4 = (_DKSyncRemoteKnowledgeStorageFetchDelegate *)a3;
  +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  delegate = self->_delegate;
  self->_delegate = v4;
  v7 = v4;

  -[_DKSyncRemoteKnowledgeStorageFetchDelegate deviceUUID](self->_delegate, "deviceUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "UUIDString");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[_DKSyncRapportStorage setDeviceID:](self, "setDeviceID:", v9);
}

- (void)updateStorageWithAddedEvents:(id)a3 deletedEventIDs:(id)a4 highPriority:(BOOL)a5 completion:(id)a6
{
  NSObject *v6;
  void *v7;
  void (**v8)(id, void *);

  v8 = (void (**)(id, void *))a6;
  +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (v8)
  {
    +[_DKSyncErrors internalFailure](_DKSyncErrors, "internalFailure");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v7);

  }
}

- (_DKSyncRemoteKnowledgeStorageFetchDelegate)delegate
{
  return self->_delegate;
}

- (_DKSync2Policy)policy
{
  return self->_policy;
}

- (void)setPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_policy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policy, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

- (void)handleFetchEventsWithRequest:options:responseHandler:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_0_12(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_2_9(&dword_18DDBE000, "%{public}@: Calling response handler with fetch events response: %@", v4, v5);

  OUTLINED_FUNCTION_33();
}

- (void)handleFetchEventsWithRequest:options:responseHandler:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_46(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_1_1(&dword_18DDBE000, v3, (uint64_t)v3, "%{public}@: Failed to fetch events, missing delegate", v4);

  OUTLINED_FUNCTION_33();
}

- (void)handleFetchEventsWithRequest:options:responseHandler:.cold.3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_0_12(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_12_5(&dword_18DDBE000, "%{public}@: Failed to encode change set as protobuf: %@", v4, v5);

  OUTLINED_FUNCTION_33();
}

- (void)handleFetchEventsWithRequest:options:responseHandler:.cold.4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_0_12(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_2_9(&dword_18DDBE000, "%{public}@: Received fetch events request for up to %@ events", v4, v5);

  OUTLINED_FUNCTION_33();
}

- (void)handleFetchEventsWithRequest:options:responseHandler:.cold.5()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_0_12(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_2_9(&dword_18DDBE000, "%{public}@: Received fetch events request: %@", v4, v5);

  OUTLINED_FUNCTION_33();
}

- (void)handleFetchEventsWithRequest:options:responseHandler:.cold.6()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_46(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_4_7(&dword_18DDBE000, v3, v4, "%{public}@: Handling fetch events request", v5);

  OUTLINED_FUNCTION_33();
}

- (void)handleFetchDeletedEventIDsWithRequest:options:responseHandler:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_0_12(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_2_9(&dword_18DDBE000, "%{public}@: Calling response handler with fetch deleted event ids response: %@", v4, v5);

  OUTLINED_FUNCTION_33();
}

- (void)handleFetchDeletedEventIDsWithRequest:options:responseHandler:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_46(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_1_1(&dword_18DDBE000, v3, (uint64_t)v3, "%{public}@: Failed to fetch deleted event ids, missing delegate", v4);

  OUTLINED_FUNCTION_33();
}

- (void)handleFetchDeletedEventIDsWithRequest:options:responseHandler:.cold.3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_0_12(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_2_9(&dword_18DDBE000, "%{public}@: Received fetch deleted event ids request: %@", v4, v5);

  OUTLINED_FUNCTION_33();
}

- (void)handleFetchDeletedEventIDsWithRequest:options:responseHandler:.cold.4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_46(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_4_7(&dword_18DDBE000, v3, v4, "%{public}@: Handling fetch deleted event ids request", v5);

  OUTLINED_FUNCTION_33();
}

- (void)handleFetchEventsWithResponse:options:error:peer:plStartDate:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_46(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_4_7(&dword_18DDBE000, v3, v4, "%{public}@: Handling fetch events response", v5);

  OUTLINED_FUNCTION_33();
}

- (void)changeSetFromCompressedData:(uint64_t)a1 deviceIdentifier:(NSObject *)a2 sequenceNumber:.cold.1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_18DDBE000, a2, v4, "%{public}@: Dropping change set, unable to decode due to invalid data", v5);

  OUTLINED_FUNCTION_1();
}

- (void)handleFetchDeletedEventIDsWithResponse:options:error:peer:plStartDate:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_46(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_4_7(&dword_18DDBE000, v3, v4, "%{public}@: Handling fetch deleted event ids response", v5);

  OUTLINED_FUNCTION_33();
}

@end

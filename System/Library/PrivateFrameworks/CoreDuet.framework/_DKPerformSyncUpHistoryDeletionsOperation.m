@implementation _DKPerformSyncUpHistoryDeletionsOperation

- (id)initWithParent:(void *)a3 sibling:(void *)a4 localStorage:(void *)a5 transport:(void *)a6 peer:(void *)a7 policy:(void *)a8 type:
{
  id v16;
  id v17;
  id *v18;
  id *v19;
  uint64_t v20;
  id v21;
  id v23;
  id v24;
  id v25;
  id v26;
  objc_super v27;

  v26 = a3;
  v25 = a4;
  v24 = a5;
  v16 = a6;
  v23 = a7;
  v17 = a8;
  if (a1)
  {
    v27.receiver = a1;
    v27.super_class = (Class)_DKPerformSyncUpHistoryDeletionsOperation;
    v18 = (id *)objc_msgSendSuper2(&v27, sel_initWithParent_, a2);
    v19 = v18;
    if (v18)
    {
      objc_storeStrong(v18 + 37, a3);
      objc_storeStrong(v19 + 38, a4);
      objc_storeStrong(v19 + 39, a5);
      objc_storeStrong(v19 + 40, a6);
      objc_storeStrong(v19 + 41, a7);
      objc_storeStrong(v19 + 42, a8);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = v19[44];
      v19[44] = (id)v20;

    }
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)main
{
  uint64_t v3;

  v3 = objc_opt_class();
  if (+[_DKSync2Coordinator shouldDeferSyncOperationWithClass:syncType:transport:peer:policy:]((uint64_t)_DKSync2Coordinator, v3, self->_type, self->_transport, 0, self->_policy))-[_DKPerformSyncUpHistoryDeletionsOperation endOperation](self, "endOperation");
  else
    -[_DKPerformSyncUpHistoryDeletionsOperation performSyncUpHistoryDeletions]((uint64_t)self);
}

- (void)performSyncUpHistoryDeletions
{
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  __CFString *v39;
  const __CFString *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;

  OUTLINED_FUNCTION_6_0();
  a30 = v31;
  a31 = v32;
  v34 = v33;
  v36 = v35;
  a19 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "description");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(v36 + 312), "transportType") == 8)
    v38 = "up to";
  else
    v38 = "down from";
  v39 = &stru_1E26E9728;
  if (objc_msgSend((id)OUTLINED_FUNCTION_22_1(), "me"))
    v40 = CFSTR("pseudo ");
  else
    v40 = &stru_1E26E9728;
  objc_msgSend((id)OUTLINED_FUNCTION_22_1(), "identifier");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_22_1(), "model");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    v43 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend((id)OUTLINED_FUNCTION_22_1(), "model");
    objc_claimAutoreleasedReturnValue();
    OUTLINED_FUNCTION_56();
    objc_msgSend(v43, "stringWithFormat:", CFSTR(" (%@)"));
    v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(v36 + 312), "name");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a11) = 138544642;
  *(_QWORD *)((char *)&a11 + 4) = v37;
  WORD6(a11) = 2082;
  *(_QWORD *)((char *)&a11 + 14) = v38;
  a14 = 2114;
  a15 = v40;
  LOWORD(a16) = 2114;
  *(_QWORD *)((char *)&a16 + 2) = v41;
  WORD5(a16) = 2114;
  *(_QWORD *)((char *)&a16 + 12) = v39;
  WORD2(a17) = 2114;
  *(_QWORD *)((char *)&a17 + 6) = v44;
  OUTLINED_FUNCTION_9_4(&dword_18DDBE000, v34, v45, "%{public}@: Skippped deletions history sync %{public}s %{public}@peer %{public}@%{public}@ on transport %{public}@ due to no streams to sync", (uint8_t *)&a11);

  if (v42)
  {

  }
  OUTLINED_FUNCTION_1_0();
}

- (uint64_t)existsAdditionsSyncHistory
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;

  if (!a1)
    return 0;
  -[_DKPerformSyncUpHistoryAdditionsOperation history](*(id *)(a1 + 296), a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = *(void **)(a1 + 304);
    v5 = *(_QWORD *)(a1 + 320);
    objc_msgSend(*(id *)(a1 + 312), "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "additionsSyncHistoryForPeer:transportName:error:", v5, v6, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v3, "lastSyncDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v3, "lastSyncDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqualToDate:", v9);

    v11 = v10 ^ 1u;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)performSyncUpHistoryDeletionsWithDeletionsHighWaterMark:(void *)a3 orError:
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
      -[_DKPerformSyncUpHistoryDeletionsOperation performSyncUpHistoryDeletionsWithPreviousHighWaterMark:]((uint64_t)a1, v5);
    }
    else
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
      if (v6)
      {
        if (v8)
          -[_DKPerformSyncUpHistoryDeletionsOperation performSyncUpHistoryDeletionsWithDeletionsHighWaterMark:orError:].cold.2(a1, v6, v7);

        objc_msgSend(a1, "errors");
        v7 = objc_claimAutoreleasedReturnValue();
        -[NSObject addObject:](v7, "addObject:", v6);
      }
      else if (v8)
      {
        -[_DKPerformSyncUpHistoryDeletionsOperation performSyncUpHistoryDeletionsWithDeletionsHighWaterMark:orError:].cold.1(a1, v7);
      }

      objc_msgSend(a1, "endOperation");
    }
  }

}

- (void)performSyncUpHistoryDeletionsWithPreviousHighWaterMark:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  _UNKNOWN **v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  __CFString *v23;
  NSObject *v24;
  NSObject *v25;
  int v26;
  NSObject *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _UNKNOWN **v33;
  uint64_t i;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  id *v60;
  void *v61;
  NSObject *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  int v80;
  __CFString *v81;
  const __CFString *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  void *v89;
  const __CFString *v90;
  uint64_t v91;
  id v92;
  const __CFString *v93;
  void *v94;
  __int128 v95;
  void *v96;
  void *v97;
  __int128 v98;
  void *v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  uint64_t v103;
  void *v104;
  void *v105;
  uint64_t v106;
  void *v107;
  void *v108;
  uint64_t v109;
  void *v110;
  id obj;
  id obja;
  id objc;
  id objb;
  id v115;
  uint64_t v116;
  uint64_t v117;
  void (*v118)(_QWORD *, void *);
  void *v119;
  uint64_t v120;
  id v121;
  id v122;
  id v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  id v128;
  id v129;
  uint8_t buf[4];
  id v131;
  __int16 v132;
  id v133;
  __int16 v134;
  void *v135;
  __int16 v136;
  void *v137;
  __int16 v138;
  uint64_t v139;
  __int16 v140;
  uint64_t v141;
  __int16 v142;
  __CFString *v143;
  void *v144;
  _BYTE v145[128];
  uint64_t v146;

  v146 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v4);

    v5 = &off_1E26E0000;
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[_DKPerformSyncUpHistoryDeletionsOperation performSyncUpHistoryDeletionsWithPreviousHighWaterMark:].cold.3(a1, (uint64_t)v3, (uint64_t)v6, v7, v8, v9, v10, v11, v85, v86, (uint8_t)v87, v88, v91, v93, v95, v98, v100, v103, v106,
        v109,
        (uint64_t)obj,
        (uint64_t)v115,
        v116,
        v117,
        (uint64_t)v118,
        (uint64_t)v119,
        v120,
        (uint64_t)v121,
        (uint64_t)v122,
        (uint64_t)v123);

    v12 = v3;
    objc_msgSend(*(id *)(a1 + 352), "timeIntervalSinceReferenceDate");
    v14 = v13;
    objc_msgSend(v12, "timeIntervalSinceReferenceDate");
    if (v14 - v15 <= (double)(unint64_t)objc_msgSend(*(id *)(a1 + 328), "minSyncWindowInSeconds"))
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        -[_DKPerformSyncUpHistoryDeletionsOperation performSyncUpHistoryDeletionsWithPreviousHighWaterMark:].cold.2(a1, v12, v27);

      v23 = 0;
      v28 = 0;
    }
    else
    {
      v16 = *(_QWORD *)(a1 + 368);
      if (!v16)
      {
        objc_msgSend(*(id *)(a1 + 360), "lastSyncDate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        +[_DKPerformSyncUpHistoryDeletionsOperation _updateEventStatsWithPreviousSyncDate:transportType:]((uint64_t)_DKPerformSyncUpHistoryDeletionsOperation, v17, objc_msgSend(*(id *)(a1 + 312), "transportType"));

        v16 = *(_QWORD *)(a1 + 368);
      }
      *(_QWORD *)(a1 + 368) = v16 + 1;
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        -[_DKPerformSyncUpHistoryDeletionsOperation performSyncUpHistoryDeletionsWithPreviousHighWaterMark:].cold.1(a1, v12, v18);

      v19 = *(void **)(a1 + 304);
      v20 = *(_QWORD *)(a1 + 344);
      v21 = objc_msgSend(*(id *)(a1 + 328), "syncBatchSizeInEvents");
      v128 = 0;
      v129 = 0;
      objc_msgSend(v19, "tombstonesSinceDate:streamNames:limit:endDate:error:", v12, v20, v21, &v129, &v128);
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v129;
      v23 = (__CFString *)v128;
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if (v23)
      {
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend((id)objc_opt_class(), "description");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDate dk_localtimeString](v12);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDate dk_localtimeString](v22);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFString domain](v23, "domain");
          v68 = v22;
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          v70 = -[__CFString code](v23, "code");
          *(_DWORD *)buf = 138544642;
          v131 = v65;
          v132 = 2114;
          v133 = v66;
          v134 = 2114;
          v135 = v67;
          v136 = 2114;
          v137 = v69;
          v138 = 2048;
          v139 = v70;
          v140 = 2112;
          v141 = (uint64_t)v23;
          _os_log_error_impl(&dword_18DDBE000, v25, OS_LOG_TYPE_ERROR, "%{public}@: Failed while querying for deletions with bookmark [%{public}@ ending %{public}@]: %{public}@:%lld (%@)", buf, 0x3Eu);

          v22 = v68;
        }

        LOBYTE(v26) = 1;
      }
      else
      {
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend((id)objc_opt_class(), "description");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v97, "count"));
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDate dk_localtimeString](v12);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDate dk_localtimeString](v22);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v131 = v71;
          v132 = 2112;
          v133 = v72;
          v134 = 2114;
          v135 = v73;
          v136 = 2114;
          v137 = v74;
          _os_log_debug_impl(&dword_18DDBE000, v25, OS_LOG_TYPE_DEBUG, "%{public}@: Found %@ deletions with bookmark [%{public}@ ending %{public}@]", buf, 0x2Au);

          v5 = &off_1E26E0000;
        }
        v96 = v22;
        v92 = v3;

        v94 = v12;
        if (objc_msgSend(v97, "count"))
        {
          v101 = a1;
          +[_DKSyncPeerStatusTracker sharedInstance](_DKSyncPeerStatusTracker, "sharedInstance");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "pseudoPeerForSyncTransportCloudUp");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v87, "sourceDeviceID");
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          +[_DKSystemEventStreams appWebUsageStream](_DKSystemEventStreams, "appWebUsageStream");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "name");
          v107 = (void *)objc_claimAutoreleasedReturnValue();

          v110 = (void *)objc_opt_new();
          v124 = 0u;
          v125 = 0u;
          v126 = 0u;
          v127 = 0u;
          obja = v97;
          v30 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v124, v145, 16);
          if (v30)
          {
            v31 = v30;
            v32 = *(_QWORD *)v125;
            v33 = &off_1E26E0000;
            do
            {
              for (i = 0; i != v31; ++i)
              {
                if (*(_QWORD *)v125 != v32)
                  objc_enumerationMutation(obja);
                v35 = *(void **)(*((_QWORD *)&v124 + 1) + 8 * i);
                objc_msgSend(v35, "stringValue");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                if (v36)
                {
                  v37 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v36);
                  if (v37)
                  {
                    objc_msgSend(v35, "metadata");
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v33[493], "eventSourceDeviceID");
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v38, "objectForKeyedSubscript:", v39);
                    v40 = objc_claimAutoreleasedReturnValue();

                    if (v40)
                    {
                      objc_msgSend(v35, "metadata");
                      v41 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v33[493], "eventStreamName");
                      v42 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v41, "objectForKeyedSubscript:", v42);
                      v43 = (void *)objc_claimAutoreleasedReturnValue();

                      if (objc_msgSend(v43, "isEqualToString:", v107))
                        -[_DKSyncDeletedEventIDs addDeletedEventID:forSourceDeviceID:]((uint64_t)v110, v37, v40);

                    }
                    else
                    {
                      -[_DKSyncDeletedEventIDs addDeletedEventID:forSourceDeviceID:]((uint64_t)v110, v37, v104);
                    }
                    v5 = &off_1E26E0000;
                  }
                  else
                  {
                    objc_msgSend(v5[247], "syncChannel");
                    v40 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
                    {
                      objc_msgSend((id)objc_opt_class(), "description");
                      v45 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138543618;
                      v131 = v45;
                      v132 = 2112;
                      v133 = v36;
                      _os_log_error_impl(&dword_18DDBE000, v40, OS_LOG_TYPE_ERROR, "%{public}@: Skipping tombstone due to malformed tombstone uuid: %@", buf, 0x16u);

                    }
                  }

                  v33 = &off_1E26E0000;
                }
                else
                {
                  objc_msgSend(v5[247], "syncChannel");
                  v37 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
                  {
                    objc_msgSend((id)objc_opt_class(), "description");
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543618;
                    v131 = v44;
                    v132 = 2112;
                    v133 = v35;
                    _os_log_error_impl(&dword_18DDBE000, v37, OS_LOG_TYPE_ERROR, "%{public}@: Skipping tombstone due to missing tombstone uuid: %@", buf, 0x16u);

                  }
                }

              }
              v31 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v124, v145, 16);
            }
            while (v31);
          }

          a1 = v101;
          v12 = v94;
        }
        else
        {
          v110 = 0;
        }
        objc_msgSend(*(id *)(a1 + 320), "sourceDeviceID");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        +[_DKSyncMetadataStorage bookmarkStreamNameWithSourceDeviceID:]((uint64_t)_DKSyncMetadataStorage, v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 312), "name");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        +[_DKSyncMetadataStorage eventFromStartDate:endDate:bookmarkStreamName:transportName:]((uint64_t)_DKSyncMetadataStorage, v12, v96, v47, v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v97, "count")
          || objc_msgSend(*(id *)(a1 + 312), "transportType") != 8
          || -[_DKSyncType forceSync](*(_QWORD *)(a1 + 336)))
        {
          v50 = *(void **)(a1 + 328);
          v51 = *(_QWORD *)(a1 + 336);
          objc_msgSend(*(id *)(a1 + 360), "lastSyncDate");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = objc_msgSend(v50, "highPriorityForSyncUpWithSyncType:lastSyncDate:", v51, v52);

          v54 = *(void **)(a1 + 312);
          v144 = v49;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v144, 1);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v116 = MEMORY[0x1E0C809B0];
          v117 = 3221225472;
          v118 = __100___DKPerformSyncUpHistoryDeletionsOperation_performSyncUpHistoryDeletionsWithPreviousHighWaterMark___block_invoke;
          v119 = &unk_1E26E5D48;
          v120 = a1;
          v56 = v94;
          v121 = v94;
          v57 = v96;
          v122 = v96;
          v123 = v110;
          objc_msgSend(v54, "updateStorageWithAddedEvents:deletedEventIDs:highPriority:completion:", v55, v123, v53, &v116);

          v26 = 0;
        }
        else
        {
          v26 = 1;
          v56 = v94;
          v57 = v96;
        }
        v58 = *(void **)(a1 + 304);
        v59 = *(_QWORD *)(a1 + 320);
        v60 = (id *)a1;
        objc_msgSend(*(id *)(a1 + 312), "name");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v115 = 0;
        objc_msgSend(v58, "setLastSyncDownDeletionDate:previousDate:forPeer:transportName:error:", v57, v56, v59, v61, &v115);
        v23 = (__CFString *)v115;

        +[_CDLogging syncChannel](_CDLogging, "syncChannel");
        v62 = objc_claimAutoreleasedReturnValue();
        v63 = v62;
        if (v23)
        {
          if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend((id)objc_opt_class(), "description");
            objc = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[_DKSyncDeletedEventIDs count]((uint64_t)v110));
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSDate dk_localtimeString](v94);
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSDate dk_localtimeString](v96);
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            -[__CFString domain](v23, "domain");
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            v79 = -[__CFString code](v23, "code");
            *(_DWORD *)buf = 138544898;
            v131 = objc;
            v132 = 2112;
            v133 = v75;
            v134 = 2114;
            v135 = v76;
            v136 = 2114;
            v137 = v77;
            v138 = 2114;
            v139 = (uint64_t)v78;
            v140 = 2048;
            v141 = v79;
            v142 = 2112;
            v143 = v23;
            _os_log_error_impl(&dword_18DDBE000, v63, OS_LOG_TYPE_ERROR, "%{public}@: Failed while syncing up %@ deletions with bookmark [%{public}@ ending %{public}@]: %{public}@:%lld (%@)", buf, 0x48u);

          }
          objc_msgSend(v60, "errors");
          v63 = objc_claimAutoreleasedReturnValue();
          -[NSObject addObject:](v63, "addObject:", v23);
        }
        else if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend((id)objc_opt_class(), "description");
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[_DKSyncDeletedEventIDs count]((uint64_t)v110));
          objb = (id)objc_claimAutoreleasedReturnValue();
          -[NSDate dk_localtimeString](v94);
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDate dk_localtimeString](v96);
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          v80 = objc_msgSend(v60[40], "me");
          v81 = &stru_1E26E9728;
          v82 = CFSTR("pseudo ");
          if (!v80)
            v82 = &stru_1E26E9728;
          v90 = v82;
          objc_msgSend(v60[40], "identifier");
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60[40], "model");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          if (v83)
          {
            v84 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v60[40], "model");
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v84, "stringWithFormat:", CFSTR(" (%@)"), v87);
            v81 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          *(_DWORD *)buf = 138544898;
          v131 = v102;
          v132 = 2112;
          v133 = objb;
          v134 = 2114;
          v135 = v99;
          v136 = 2114;
          v137 = v108;
          v138 = 2114;
          v139 = (uint64_t)v90;
          v140 = 2114;
          v141 = (uint64_t)v105;
          v142 = 2114;
          v143 = v81;
          _os_log_debug_impl(&dword_18DDBE000, v63, OS_LOG_TYPE_DEBUG, "%{public}@: Successfully synced up %@ deletions with bookmark [%{public}@ ending %{public}@] to %{public}@peer %{public}@%{public}@", buf, 0x48u);
          if (v83)
          {

          }
        }

        if (!v23)
        {
          v3 = v92;
          v12 = v94;
          a1 = (uint64_t)v60;
          v28 = v97;
          if (!v26)
            goto LABEL_54;
          goto LABEL_53;
        }
        v3 = v92;
        v12 = v94;
        a1 = (uint64_t)v60;
      }
      objc_msgSend((id)a1, "errors");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "addObject:", v23);

      v28 = v97;
      if ((v26 & 1) == 0)
      {
LABEL_54:

        goto LABEL_55;
      }
    }
LABEL_53:
    objc_msgSend((id)a1, "endOperation");
    goto LABEL_54;
  }
LABEL_55:

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
  if (_updateEventStatsWithPreviousSyncDate_transportType__syncCadenceInitialized_1 != -1)
    dispatch_once(&_updateEventStatsWithPreviousSyncDate_transportType__syncCadenceInitialized_1, &__block_literal_global_55);
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v11, "isEqualToDate:", v4);

    if ((v5 & 1) == 0)
    {
      v6 = _updateEventStatsWithPreviousSyncDate_transportType__syncCadenceByTransportCounter_1;
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (a3 == 1)
        v8 = CFSTR("Rapport");
      else
        v8 = CFSTR("Cloud");
      -[_DKEventTypeStatsTimerCounter addTimingWithStartDate:endDate:typeValue:](v6, (uint64_t)v11, v7, v8);

    }
  }
  v9 = _updateEventStatsWithPreviousSyncDate_transportType__syncCadenceCounter_1;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKEventStatsTimerCounter addTimingWithStartDate:endDate:](v9, (uint64_t)v11, v10);

}

- (void)handleUpdateStorageWithStartDate:(void *)a3 endDate:(uint64_t)a4 deletedEventIDsCount:(void *)a5 orError:
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  const char *v19;
  int v20;
  __CFString *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  const char *v28;
  int v29;
  const __CFString *v30;
  void *v31;
  unint64_t v32;
  unint64_t v33;
  void *v34;
  void *v35;
  const __CFString *v36;
  const __CFString *v37;
  const char *v38;
  const char *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[5];
  id v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  const char *v55;
  __int16 v56;
  const __CFString *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  __CFString *v61;
  __int16 v62;
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a5;
  if (a1)
  {
    +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v12);

    if (v11)
    {
      v13 = +[_DKCKError isIgnorableError:]((uint64_t)_DKCKError, v11);
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v13)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          -[_DKPerformSyncUpHistoryDeletionsOperation handleUpdateStorageWithStartDate:endDate:deletedEventIDsCount:orError:].cold.1(a1, v11, v15);
      }
      else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        -[_DKPerformSyncUpHistoryDeletionsOperation handleUpdateStorageWithStartDate:endDate:deletedEventIDsCount:orError:].cold.2(a1, v11, v15);
      }

      objc_msgSend((id)a1, "errors");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "addObject:", v11);

LABEL_17:
      objc_msgSend((id)a1, "endOperation");
      goto LABEL_18;
    }
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (a4)
    {
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        goto LABEL_30;
      objc_msgSend((id)objc_opt_class(), "description");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDate dk_localtimeString](v9);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDate dk_localtimeString](v10);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(*(id *)(a1 + 312), "transportType");
      v19 = "down from";
      if (v18 == 8)
        v19 = "up to";
      v38 = v19;
      v20 = objc_msgSend(*(id *)(a1 + 320), "me");
      v21 = &stru_1E26E9728;
      v22 = CFSTR("pseudo ");
      if (!v20)
        v22 = &stru_1E26E9728;
      v36 = v22;
      objc_msgSend(*(id *)(a1 + 320), "identifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 320), "model");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        v25 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(*(id *)(a1 + 320), "model");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "stringWithFormat:", CFSTR(" (%@)"), v35);
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(*(id *)(a1 + 312), "name");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138545410;
      v47 = v43;
      v48 = 2112;
      v49 = v41;
      v50 = 2114;
      v51 = v42;
      v52 = 2114;
      v53 = v40;
      v54 = 2082;
      v55 = v38;
      v56 = 2114;
      v57 = v36;
      v58 = 2114;
      v59 = v23;
      v60 = 2114;
      v61 = v21;
      v62 = 2114;
      v63 = v31;
      _os_log_impl(&dword_18DDBE000, v17, OS_LOG_TYPE_INFO, "%{public}@: Synced up %@ deletions and high water mark with bookmark [%{public}@ ending %{public}@] doing sync %{public}s %{public}@peer %{public}@%{public}@ on transport %{public}@", buf, 0x5Cu);
    }
    else
    {
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        goto LABEL_30;
      objc_msgSend((id)objc_opt_class(), "description");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 0);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDate dk_localtimeString](v9);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDate dk_localtimeString](v10);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(*(id *)(a1 + 312), "transportType");
      v28 = "down from";
      if (v27 == 8)
        v28 = "up to";
      v39 = v28;
      v29 = objc_msgSend(*(id *)(a1 + 320), "me");
      v21 = &stru_1E26E9728;
      v30 = CFSTR("pseudo ");
      if (!v29)
        v30 = &stru_1E26E9728;
      v37 = v30;
      objc_msgSend(*(id *)(a1 + 320), "identifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 320), "model");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        v34 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(*(id *)(a1 + 320), "model");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "stringWithFormat:", CFSTR(" (%@)"), v35);
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(*(id *)(a1 + 312), "name");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138545410;
      v47 = v43;
      v48 = 2112;
      v49 = v41;
      v50 = 2114;
      v51 = v42;
      v52 = 2114;
      v53 = v40;
      v54 = 2082;
      v55 = v39;
      v56 = 2114;
      v57 = v37;
      v58 = 2114;
      v59 = v23;
      v60 = 2114;
      v61 = v21;
      v62 = 2114;
      v63 = v31;
      _os_log_debug_impl(&dword_18DDBE000, v17, OS_LOG_TYPE_DEBUG, "%{public}@: Synced up %@ deletions and high water mark with bookmark [%{public}@ ending %{public}@] doing sync %{public}s %{public}@peer %{public}@%{public}@ on transport %{public}@", buf, 0x5Cu);
    }

    if (v24)
    {

    }
LABEL_30:

    +[_DKPerformSyncUpHistoryDeletionsOperation _updateEventStatsWithTotal:transportType:]((uint64_t)_DKPerformSyncUpHistoryDeletionsOperation, a4, objc_msgSend(*(id *)(a1 + 312), "transportType"));
    v32 = *(_QWORD *)(a1 + 368);
    v33 = objc_msgSend(*(id *)(a1 + 328), "maxBatchesPerSync");
    if (a4 && v32 < v33)
    {
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __115___DKPerformSyncUpHistoryDeletionsOperation_handleUpdateStorageWithStartDate_endDate_deletedEventIDsCount_orError___block_invoke;
      v44[3] = &unk_1E26E3250;
      v44[4] = a1;
      v45 = v10;
      +[_DKSyncSerializer performAsyncBlock:](_DKSyncSerializer, "performAsyncBlock:", v44);

      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_18:

}

+ (void)_updateEventStatsWithTotal:(uint64_t)a3 transportType:
{
  __CFString *v5;

  objc_opt_self();
  if (_updateEventStatsWithTotal_transportType__syncUpHistoryDeletionsCounterInitialized != -1)
    dispatch_once(&_updateEventStatsWithTotal_transportType__syncUpHistoryDeletionsCounterInitialized, &__block_literal_global_35);
  -[_DKEventStatsCounter incrementCountByNumber:](_updateEventStatsWithTotal_transportType__syncUpHistoryDeletionsTotalCounter, a2);
  if (a3 == 1)
    v5 = CFSTR("Rapport");
  else
    v5 = CFSTR("Cloud");
  -[_DKEventTypeStatsCounter incrementCountByNumber:typeValue:](_updateEventStatsWithTotal_transportType__syncUpHistoryDeletionsTotalByTransportCounter, a2, v5);
}

- (void)endOperation
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)_DKPerformSyncUpHistoryDeletionsOperation;
  -[_DKSyncCompositeOperation endOperation](&v2, sel_endOperation);
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
  objc_storeStrong((id *)&self->_sibling, 0);
}

- (void)performSyncUpHistoryDeletionsWithDeletionsHighWaterMark:(NSObject *)a3 orError:.cold.2(id *a1, void *a2, NSObject *a3)
{
  void *v6;
  void *v7;
  __CFString *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint8_t buf[24];
  const __CFString *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  __CFString *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[39], "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = &stru_1E26E9728;
  if (objc_msgSend((id)OUTLINED_FUNCTION_21_1(), "me"))
    v9 = CFSTR("pseudo ");
  else
    v9 = &stru_1E26E9728;
  objc_msgSend((id)OUTLINED_FUNCTION_21_1(), "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_21_1(), "model");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend((id)OUTLINED_FUNCTION_21_1(), "model");
    a1 = (id *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR(" (%@)"), a1);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(a2, "domain");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "code");
  OUTLINED_FUNCTION_10_5();
  v17 = v9;
  v18 = v14;
  v19 = v10;
  v20 = v14;
  v21 = v8;
  v22 = v14;
  v23 = v13;
  v24 = 2048;
  v25 = v15;
  v26 = 2112;
  v27 = a2;
  _os_log_debug_impl(&dword_18DDBE000, a3, OS_LOG_TYPE_DEBUG, "%{public}@: Skipping deletions history sync up on transport %{public}@ for %{public}@peer %{public}@%{public}@: %{public}@:%lld (%@)", buf, 0x52u);

  if (v11)
  {

  }
}

- (void)performSyncUpHistoryDeletionsWithPreviousHighWaterMark:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate dk_localtimeString](a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = v5;
  v9 = 2112;
  v10 = v6;
  _os_log_debug_impl(&dword_18DDBE000, a3, OS_LOG_TYPE_DEBUG, "%{public}@: Querying deletions since %@", (uint8_t *)&v7, 0x16u);

}

- (void)performSyncUpHistoryDeletionsWithPreviousHighWaterMark:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint8_t a11, uint64_t a12, uint64_t a13, const __CFString *a14, __int128 a15, __int128 a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  id *v36;
  id *v37;
  void *v38;
  void *v39;
  __CFString *v40;
  const __CFString *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  __int16 v46;
  uint64_t v47;
  uint64_t v48;

  OUTLINED_FUNCTION_6_0();
  a29 = v30;
  a30 = v31;
  v33 = v32;
  v35 = v34;
  v37 = v36;
  a18 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "description");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37[39], "name");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = &stru_1E26E9728;
  if (objc_msgSend((id)OUTLINED_FUNCTION_20(), "me"))
    v41 = CFSTR("pseudo ");
  else
    v41 = &stru_1E26E9728;
  objc_msgSend((id)OUTLINED_FUNCTION_20(), "identifier");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_20(), "model");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    v44 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend((id)OUTLINED_FUNCTION_20(), "model");
    v37 = (id *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "stringWithFormat:", CFSTR(" (%@)"));
    v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  -[NSDate dk_localtimeString](v35);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10_5();
  a14 = v41;
  LOWORD(a15) = v46;
  *(_QWORD *)((char *)&a15 + 2) = v42;
  WORD5(a15) = v46;
  *(_QWORD *)((char *)&a15 + 12) = v40;
  WORD2(a16) = 2112;
  *(_QWORD *)((char *)&a16 + 6) = v47;
  OUTLINED_FUNCTION_9_4(&dword_18DDBE000, v33, v48, "%{public}@: Performing deletions history sync up on transport %{public}@ for %{public}@peer %{public}@%{public}@ from %@", &a11);
  if (v43)
  {

  }
  OUTLINED_FUNCTION_1_0();
}

- (void)handleUpdateStorageWithStartDate:(NSObject *)a3 endDate:deletedEventIDsCount:orError:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v3;
  void *v6;
  uint8_t v7[56];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "domain");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_7_0();
  _os_log_debug_impl(&dword_18DDBE000, a3, OS_LOG_TYPE_DEBUG, "%{public}@: Did not update storage: %{public}@:%lld (%@)", v7, 0x2Au);

  OUTLINED_FUNCTION_12();
}

- (void)handleUpdateStorageWithStartDate:(NSObject *)a3 endDate:deletedEventIDsCount:orError:.cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  void *v3;
  void *v6;
  uint8_t v7[56];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "domain");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_7_0();
  _os_log_error_impl(&dword_18DDBE000, a3, OS_LOG_TYPE_ERROR, "%{public}@: Failed while updating storage: %{public}@:%lld (%@)", v7, 0x2Au);

  OUTLINED_FUNCTION_12();
}

@end

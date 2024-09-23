@implementation _DKPerformSyncDownPeerAdditionsOperation

- (id)initWithParent:(void *)a3 localStorage:(void *)a4 transport:(void *)a5 peer:(void *)a6 policy:(void *)a7 type:
{
  id v14;
  id v15;
  id v16;
  id *v17;
  id *v18;
  id v20;
  id v21;
  objc_super v22;

  v14 = a3;
  v21 = a4;
  v15 = a5;
  v20 = a6;
  v16 = a7;
  if (a1)
  {
    v22.receiver = a1;
    v22.super_class = (Class)_DKPerformSyncDownPeerAdditionsOperation;
    v17 = (id *)objc_msgSendSuper2(&v22, sel_initWithParent_, a2);
    v18 = v17;
    if (v17)
    {
      objc_storeStrong(v17 + 37, a3);
      objc_storeStrong(v18 + 38, a4);
      objc_storeStrong(v18 + 39, a5);
      objc_storeStrong(v18 + 40, a6);
      objc_storeStrong(v18 + 41, a7);
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
  if (+[_DKSync2Coordinator shouldDeferSyncOperationWithClass:syncType:transport:peer:policy:]((uint64_t)_DKSync2Coordinator, v3, self->_type, self->_transport, 0, self->_policy))-[_DKPerformSyncDownPeerAdditionsOperation endOperation](self, "endOperation");
  else
    -[_DKPerformSyncDownPeerAdditionsOperation performSyncDownPeerAdditions]((uint64_t)self);
}

- (uint64_t)performSyncDownPeerAdditions
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
  NSObject *v12;
  _QWORD v13[5];

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
      v9 = *(void **)(v1 + 352);
      *(_QWORD *)(v1 + 352) = v8;

      v10 = objc_opt_class();
      if (+[_DKSync2Coordinator canPerformSyncOperationWithClass:syncType:history:transport:peer:policy:]((uint64_t)_DKSync2Coordinator, v10, *(void **)(v1 + 328), *(void **)(v1 + 352), *(void **)(v1 + 304), *(void **)(v1 + 312), *(void **)(v1 + 320)))
      {
        v11 = *(void **)(v1 + 304);
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __72___DKPerformSyncDownPeerAdditionsOperation_performSyncDownPeerAdditions__block_invoke;
        v13[3] = &unk_1E26E3118;
        v13[4] = v1;
        return objc_msgSend(v11, "prewarmFetchWithCompletion:", v13);
      }
    }
    else
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[_DKPerformSyncDownPeerAdditionsOperation performSyncDownPeerAdditions].cold.1(v1, v12);

    }
    return objc_msgSend((id)v1, "endOperation");
  }
  return result;
}

- (void)performSyncDownPeerAdditionsWithDidPrewarm:(void *)a3 orError:
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[5];

  v5 = a3;
  if (a1)
  {
    +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v6);

    if (v5)
    {
      objc_msgSend((id)a1, "errors");
      v7 = objc_claimAutoreleasedReturnValue();
      -[NSObject addObject:](v7, "addObject:", v5);
LABEL_11:

      objc_msgSend((id)a1, "endOperation");
      goto LABEL_12;
    }
    if (!a2 || !objc_msgSend(*(id *)(a1 + 304), "hasAdditionsFlagForPeer:", *(_QWORD *)(a1 + 312)))
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        -[_DKPerformSyncDownPeerAdditionsOperation performSyncDownPeerAdditionsWithDidPrewarm:orError:].cold.2(a1, v7);
      goto LABEL_11;
    }
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[_DKPerformSyncDownPeerAdditionsOperation performSyncDownPeerAdditionsWithDidPrewarm:orError:].cold.1(a1, v8);

    v9 = *(void **)(a1 + 304);
    v10 = *(_QWORD *)(a1 + 312);
    v11 = *(unsigned __int8 *)(a1 + 344);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __95___DKPerformSyncDownPeerAdditionsOperation_performSyncDownPeerAdditionsWithDidPrewarm_orError___block_invoke;
    v12[3] = &unk_1E26E5BE0;
    v12[4] = a1;
    objc_msgSend(v9, "fetchAdditionsHighWaterMarkWithPeer:highPriority:completion:", v10, v11, v12);
  }
LABEL_12:

}

- (void)performSyncDownPeerAdditionsWithHighWaterMark:(void *)a3 orError:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  NSObject *v12;

  v6 = a2;
  v7 = a3;
  v8 = v7;
  if (a1)
  {
    if (v7)
    {
      objc_msgSend((id)a1, "errors");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v8);

    }
    else
    {
      if (v6)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v6, "isEqualToDate:", v10);

        if ((v11 & 1) == 0)
        {
          objc_storeStrong((id *)(a1 + 376), a2);
          -[_DKPerformSyncDownPeerAdditionsOperation performSyncDownPeerAdditionsWithCompletedWindows:](a1, 0);
          goto LABEL_10;
        }
      }
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[_DKPerformSyncDownPeerAdditionsOperation performSyncDownPeerAdditionsWithHighWaterMark:orError:].cold.1(a1, v12);

      objc_msgSend(*(id *)(a1 + 304), "setHasAdditionsFlag:forPeer:", 0, *(_QWORD *)(a1 + 312));
    }
    objc_msgSend((id)a1, "endOperation");
  }
LABEL_10:

}

- (void)performSyncDownPeerAdditionsWithCompletedWindows:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  int *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  double v12;
  double v13;
  double v14;
  NSObject *v15;
  id v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  _BOOL4 v29;
  int v30;
  __CFString *v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  unint64_t v52;
  NSObject *v53;
  __CFString *v54;
  const __CFString *v55;
  __CFString *v56;
  void *v57;
  void *v58;
  int v59;
  __CFString *v60;
  const __CFString *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  const __CFString *v68;
  __CFString *v69;
  const __CFString *v70;
  __CFString *v71;
  __CFString *v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  void *v87;
  _QWORD v88[5];
  id v89;
  id v90;
  uint8_t buf[4];
  void *v92;
  __int16 v93;
  void *v94;
  __int16 v95;
  uint64_t v96;
  __int16 v97;
  uint64_t v98;
  __int16 v99;
  const __CFString *v100;
  __int16 v101;
  __CFString *v102;
  __int16 v103;
  __CFString *v104;
  __int16 v105;
  __CFString *v106;
  uint64_t v107;

  v107 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
    if (v3)
    {
      if (v5)
        -[_DKPerformSyncDownPeerAdditionsOperation performSyncDownPeerAdditionsWithCompletedWindows:].cold.5(a1, v4);
    }
    else if (v5)
    {
      -[_DKPerformSyncDownPeerAdditionsOperation performSyncDownPeerAdditionsWithCompletedWindows:].cold.4(a1, v4);
    }

    v6 = &OBJC_IVAR____DKCoreDataStorage__localOnly;
    if (!*(_QWORD *)(a1 + 384))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = *(void **)(a1 + 368);
      *(_QWORD *)(a1 + 368) = v7;

    }
    v9 = objc_msgSend(*(id *)(a1 + 320), "maxSyncPeriodInDays");
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -(double)(unint64_t)(86400 * v9));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(id *)(a1 + 368);
    objc_msgSend(v11, "timeIntervalSinceReferenceDate");
    v13 = v12;
    objc_msgSend(v10, "timeIntervalSinceReferenceDate");
    if (v13 - v14 < (double)(unint64_t)objc_msgSend(*(id *)(a1 + 320), "minSyncWindowInSeconds"))
    {
      v85 = v11;
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = v10;
        -[NSDate dk_localtimeString](v10);
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDate dk_localtimeString](v85);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = &stru_1E26E9728;
        if (objc_msgSend(*(id *)(a1 + 312), "me"))
          v55 = CFSTR("pseudo ");
        else
          v55 = &stru_1E26E9728;
        objc_msgSend(*(id *)(a1 + 312), "identifier");
        v56 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 312), "model");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        if (v57)
        {
          v58 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(*(id *)(a1 + 312), "model");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "stringWithFormat:", CFSTR(" (%@)"), v73);
          v54 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        *(_DWORD *)buf = 138544642;
        v92 = v83;
        v93 = 2114;
        v94 = v87;
        v95 = 2114;
        v96 = (uint64_t)v80;
        v97 = 2114;
        v98 = (uint64_t)v55;
        v99 = 2114;
        v100 = v56;
        v101 = 2114;
        v102 = v54;
        _os_log_debug_impl(&dword_18DDBE000, v15, OS_LOG_TYPE_DEBUG, "%{public}@: No more missing additions windows found between %{public}@ and %{public}@ for %{public}@peer %{public}@%{public}@", buf, 0x3Eu);
        if (v57)
        {

        }
        v10 = v77;
        v6 = &OBJC_IVAR____DKCoreDataStorage__localOnly;
      }

      v86 = 0;
      v16 = 0;
      if (!objc_msgSend(0, "count"))
        goto LABEL_43;
      goto LABEL_31;
    }
    v17 = *(void **)(a1 + 392);
    if (v17)
    {
      +[_DKSyncWindow sortedUnionOfSortedWindows:andSortedWindows:]((uint64_t)_DKSyncWindow, v17, v3);
      v18 = objc_claimAutoreleasedReturnValue();
      v86 = 0;
      v19 = *(NSObject **)(a1 + 392);
      *(_QWORD *)(a1 + 392) = v18;
    }
    else
    {
      v20 = *(void **)(a1 + 296);
      v21 = *(_QWORD *)(a1 + 312);
      v90 = 0;
      objc_msgSend(v20, "sortedSyncDownWindowsOverlappingBetweenDate:andDate:peer:error:", v10, v11, v21, &v90);
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = v90;
      v24 = *(void **)(a1 + 392);
      *(_QWORD *)(a1 + 392) = v22;

      v86 = v23;
      if (!v23)
      {
        v86 = 0;
LABEL_19:
        v25 = *(void **)(a1 + 392);
        if (!v25)
        {
          v26 = v10;
          v16 = 0;
LABEL_29:
          v6 = &OBJC_IVAR____DKCoreDataStorage__localOnly;
          if (!objc_msgSend(v16, "count"))
          {
            v49 = v86;
            if (v86)
            {
              objc_msgSend((id)a1, "errors");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v50, "addObject:", v86);

              v10 = v26;
LABEL_50:
              if (objc_msgSend(*(id *)(a1 + 304), "transportType") != 1)
                objc_msgSend(*(id *)(a1 + 304), "setHasAdditionsFlag:forPeer:", 0, *(_QWORD *)(a1 + 312));
              objc_msgSend((id)a1, "endOperation");
LABEL_53:

              goto LABEL_54;
            }
            v85 = v11;
            v10 = v26;
LABEL_43:
            v51 = *(void **)(a1 + 392);
            if (v51)
            {
              if (*(_QWORD *)(a1 + 352))
              {
                v52 = objc_msgSend(v51, "count");
                if (v52 > objc_msgSend(*(id *)(a1 + 352), "lastDaySyncCount") + *(_QWORD *)(a1 + v6[41]) + 100)
                {
                  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
                  v53 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
                    -[_DKPerformSyncDownPeerAdditionsOperation performSyncDownPeerAdditionsWithCompletedWindows:].cold.1(a1, v53);

                  -[_DKPerformSyncDownPeerAdditionsOperation coalesceRedundantOverlappingWindows](a1);
                }
              }
            }
            notify_post("com.apple.CoreDuet.SyncDownPeerAdditions.NoMoreDataToSync");
            v49 = 0;
            v11 = v85;
            goto LABEL_50;
          }
          v85 = v11;
          v10 = v26;
LABEL_31:
          v34 = v10;
          v35 = v3;
          v36 = v6[41];
          v37 = *(_QWORD *)(a1 + v36);
          if (!v37)
          {
            objc_msgSend(*(id *)(a1 + 352), "lastSyncDate");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            +[_DKPerformSyncDownPeerAdditionsOperation _updateEventStatsWithPreviousSyncDate:transportType:]((uint64_t)_DKPerformSyncDownPeerAdditionsOperation, v38, objc_msgSend(*(id *)(a1 + 304), "transportType"));

            v36 = v6[41];
            v37 = *(_QWORD *)(a1 + v36);
          }
          *(_QWORD *)(a1 + v36) = v37 + 1;
          objc_msgSend(v16, "lastObject");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          -[_DKSyncType urgency]((uint64_t)v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          +[_DKPerformSyncDownPeerAdditionsOperation _updateEventStatsWithIsNewestMissingWindow:]((uint64_t)_DKPerformSyncDownPeerAdditionsOperation, objc_msgSend(v40, "isEqualToDate:", *(_QWORD *)(a1 + 376)));

          +[_CDLogging syncChannel](_CDLogging, "syncChannel");
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
            -[_DKPerformSyncDownPeerAdditionsOperation performSyncDownPeerAdditionsWithCompletedWindows:].cold.2(a1, v16, v41);

          v42 = objc_msgSend(*(id *)(a1 + 320), "syncBatchSizeInEvents");
          v43 = objc_msgSend(*(id *)(a1 + 304), "transportType");
          v44 = *(void **)(a1 + 304);
          v45 = *(_QWORD *)(a1 + 312);
          v46 = *(_QWORD *)(a1 + 336);
          v47 = *(unsigned __int8 *)(a1 + 344);
          if (v43 == 4)
            v48 = 1;
          else
            v48 = 2;
          v88[0] = MEMORY[0x1E0C809B0];
          v88[1] = 3221225472;
          v88[2] = __93___DKPerformSyncDownPeerAdditionsOperation_performSyncDownPeerAdditionsWithCompletedWindows___block_invoke;
          v88[3] = &unk_1E26E5F30;
          v88[4] = a1;
          v16 = v16;
          v89 = v16;
          objc_msgSend(v44, "fetchEventsFromPeer:windows:streamNames:limit:fetchOrder:highPriority:completion:", v45, v16, v46, v42, v48, v47, v88);

          v3 = v35;
          v10 = v34;
          v11 = v85;
          v49 = v86;
          goto LABEL_53;
        }
        v26 = v10;
        +[_DKSyncWindow windowsMissingFromSortedWindows:windowMinimumDate:windowMaximumDate:]((uint64_t)_DKSyncWindow, v25, v10, v11);
        v16 = (id)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v16, "count");
        +[_CDLogging syncChannel](_CDLogging, "syncChannel");
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG);
        if (v27)
        {
          if (v29)
          {
            objc_msgSend((id)objc_opt_class(), "description");
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v16, "count"));
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 392), "count"));
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSDate dk_localtimeString](v26);
            v76 = objc_claimAutoreleasedReturnValue();
            -[NSDate dk_localtimeString](v11);
            v71 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(*(id *)(a1 + 312), "me");
            v31 = &stru_1E26E9728;
            v32 = CFSTR("pseudo ");
            if (!v30)
              v32 = &stru_1E26E9728;
            v68 = v32;
            objc_msgSend(*(id *)(a1 + 312), "identifier");
            v69 = (__CFString *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 312), "model");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            if (v33)
            {
              v63 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(*(id *)(a1 + 312), "model");
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v63, "stringWithFormat:", CFSTR(" (%@)"), v66);
              v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
            *(_DWORD *)buf = 138545154;
            v92 = v82;
            v93 = 2112;
            v94 = v79;
            v95 = 2112;
            v96 = (uint64_t)v74;
            v97 = 2114;
            v98 = v76;
            v99 = 2114;
            v100 = v71;
            v101 = 2114;
            v102 = (__CFString *)v68;
            v103 = 2114;
            v104 = v69;
            v105 = 2114;
            v106 = v31;
            _os_log_debug_impl(&dword_18DDBE000, v28, OS_LOG_TYPE_DEBUG, "%{public}@: Found %@ missing additions windows in %@ windows between %{public}@ and %{public}@ for %{public}@peer %{public}@%{public}@", buf, 0x52u);
            if (v33)
            {

            }
            v64 = (void *)v76;
LABEL_75:

          }
        }
        else if (v29)
        {
          objc_msgSend((id)objc_opt_class(), "description");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 392), "count"));
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDate dk_localtimeString](v26);
          v81 = objc_claimAutoreleasedReturnValue();
          -[NSDate dk_localtimeString](v11);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = objc_msgSend(*(id *)(a1 + 312), "me");
          v60 = &stru_1E26E9728;
          v61 = CFSTR("pseudo ");
          if (!v59)
            v61 = &stru_1E26E9728;
          v70 = v61;
          objc_msgSend(*(id *)(a1 + 312), "identifier");
          v72 = (__CFString *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 312), "model");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          if (v62)
          {
            v65 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(*(id *)(a1 + 312), "model");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "stringWithFormat:", CFSTR(" (%@)"), v67);
            v60 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          *(_DWORD *)buf = 138544898;
          v92 = v84;
          v93 = 2112;
          v94 = v78;
          v95 = 2114;
          v96 = v81;
          v97 = 2114;
          v98 = (uint64_t)v75;
          v99 = 2114;
          v100 = v70;
          v101 = 2114;
          v102 = v72;
          v103 = 2114;
          v104 = v60;
          _os_log_debug_impl(&dword_18DDBE000, v28, OS_LOG_TYPE_DEBUG, "%{public}@: No missing additions window found in %@ windows between %{public}@ and %{public}@ for %{public}@peer %{public}@%{public}@", buf, 0x48u);
          if (v62)
          {

          }
          v64 = (void *)v81;
          goto LABEL_75;
        }

        goto LABEL_29;
      }
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[_DKPerformSyncDownPeerAdditionsOperation performSyncDownPeerAdditionsWithCompletedWindows:].cold.3(a1, v23, v19);
    }

    goto LABEL_19;
  }
LABEL_54:

}

+ (void)_updateEventStatsWithPreviousSyncDate:(uint64_t)a3 transportType:
{
  void *v4;
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_opt_self();
  if (_updateEventStatsWithPreviousSyncDate_transportType__syncCadenceInitialized_2 != -1)
    dispatch_once(&_updateEventStatsWithPreviousSyncDate_transportType__syncCadenceInitialized_2, &__block_literal_global_30_0);
  v4 = v12;
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v12, "isEqualToDate:", v5);

    v4 = v12;
    if ((v6 & 1) == 0)
    {
      v7 = _updateEventStatsWithPreviousSyncDate_transportType__syncCadenceByTransportCounter_2;
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (a3 == 1)
        v9 = CFSTR("Rapport");
      else
        v9 = CFSTR("Cloud");
      -[_DKEventTypeStatsTimerCounter addTimingWithStartDate:endDate:typeValue:](v7, (uint64_t)v12, v8, v9);

      v10 = _updateEventStatsWithPreviousSyncDate_transportType__syncCadenceCounter_2;
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_DKEventStatsTimerCounter addTimingWithStartDate:endDate:](v10, (uint64_t)v12, v11);

      v4 = v12;
    }
  }

}

+ (void)_updateEventStatsWithIsNewestMissingWindow:(uint64_t)a1
{
  __CFString *v3;

  objc_opt_self();
  if (_updateEventStatsWithIsNewestMissingWindow__syncDownAdditionsWindowAgeCounterInitialized != -1)
    dispatch_once(&_updateEventStatsWithIsNewestMissingWindow__syncDownAdditionsWindowAgeCounterInitialized, &__block_literal_global_61);
  if (a2)
    v3 = CFSTR("newest");
  else
    v3 = CFSTR("older");
  -[_DKEventTypeStatsCounter incrementCountByNumber:typeValue:](_updateEventStatsWithIsNewestMissingWindow__syncDownAdditionsWindowAgeCounter, 1, v3);
}

- (void)handleFetchedEvents:(void *)a3 completedWindows:(void *)a4 missingWindows:
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  int *v16;
  int *v17;
  void *v18;
  const char *v19;
  int *v20;
  __CFString *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  const char *v27;
  __CFString *v28;
  const __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  id v40;
  NSObject *v41;
  NSObject *v42;
  __CFString *v43;
  const __CFString *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  __CFString *v50;
  void *v51;
  void *v52;
  void *v53;
  int *v54;
  uint64_t v55;
  void *v56;
  NSObject *v57;
  NSObject *v58;
  void *v59;
  unint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  int v65;
  __CFString *v66;
  const __CFString *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  const __CFString *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  id v85;
  id v86;
  uint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  uint64_t v92;
  void *v93;
  id v94;
  _QWORD v95[5];
  id v96;
  id v97;
  id v98;
  uint8_t buf[4];
  void *v100;
  __int16 v101;
  void *v102;
  __int16 v103;
  uint64_t v104;
  __int16 v105;
  uint64_t v106;
  __int16 v107;
  const __CFString *v108;
  __int16 v109;
  void *v110;
  __int16 v111;
  uint64_t v112;
  __int16 v113;
  id v114;
  uint64_t v115;

  v115 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (!a1)
  {
    v12 = v7;
    goto LABEL_52;
  }
  +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  +[_DKCompatibility currentCompatibility](_DKCompatibility, "currentCompatibility");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "filterIncompatibleEvents:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "count");
  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  v16 = &OBJC_IVAR____DKCoreDataStorage__localOnly;
  v17 = &OBJC_IVAR____DKCoreDataStorage__localOnly;
  v94 = v9;
  if (v13)
  {
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      goto LABEL_25;
    v84 = v8;
    objc_msgSend((id)objc_opt_class(), "description");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v12, "count"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    _DKSyncLoggingWindowsDescription(v9);
    v87 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 304), "transportType") == 8)
      v19 = "up to";
    else
      v19 = "down from";
    v20 = &OBJC_IVAR____DKCoreDataStorage__localOnly;
    v21 = &stru_1E26E9728;
    if (objc_msgSend(*(id *)(a1 + 312), "me"))
      v22 = CFSTR("pseudo ");
    else
      v22 = &stru_1E26E9728;
    objc_msgSend(*(id *)(a1 + 312), "identifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 312), "model");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = v12;
    if (v24)
    {
      v25 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(*(id *)(a1 + 312), "model");
      v20 = (int *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "stringWithFormat:", CFSTR(" (%@)"), v20);
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(*(id *)(a1 + 304), "name");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138545154;
    v100 = v91;
    v101 = 2112;
    v102 = v18;
    v103 = 2114;
    v104 = v87;
    v105 = 2082;
    v106 = (uint64_t)v19;
    v107 = 2114;
    v108 = v22;
    v109 = 2114;
    v110 = v23;
    v111 = 2114;
    v112 = (uint64_t)v21;
    v113 = 2114;
    v114 = v32;
    _os_log_impl(&dword_18DDBE000, v15, OS_LOG_TYPE_INFO, "%{public}@: Fetched %@ events in windows %{public}@ doing sync %{public}s %{public}@peer %{public}@%{public}@ on transport %{public}@", buf, 0x52u);

    if (v24)
    {

    }
    v33 = (void *)v87;
  }
  else
  {
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      goto LABEL_25;
    v84 = v8;
    objc_msgSend((id)objc_opt_class(), "description");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v12, "count"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    _DKSyncLoggingWindowsDescription(v9);
    v92 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 304), "transportType") == 8)
      v27 = "up to";
    else
      v27 = "down from";
    v28 = &stru_1E26E9728;
    if (objc_msgSend(*(id *)(a1 + 312), "me"))
      v29 = CFSTR("pseudo ");
    else
      v29 = &stru_1E26E9728;
    objc_msgSend(*(id *)(a1 + 312), "identifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 312), "model");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = v12;
    if (v31)
    {
      v70 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(*(id *)(a1 + 312), "model");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "stringWithFormat:", CFSTR(" (%@)"), v78);
      v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(*(id *)(a1 + 304), "name");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138545154;
    v100 = v88;
    v101 = 2112;
    v102 = v26;
    v103 = 2114;
    v104 = v92;
    v105 = 2082;
    v106 = (uint64_t)v27;
    v107 = 2114;
    v108 = v29;
    v109 = 2114;
    v110 = v30;
    v111 = 2114;
    v112 = (uint64_t)v28;
    v113 = 2114;
    v114 = v71;
    _os_log_debug_impl(&dword_18DDBE000, v15, OS_LOG_TYPE_DEBUG, "%{public}@: Fetched %@ events in windows %{public}@ doing sync %{public}s %{public}@peer %{public}@%{public}@ on transport %{public}@", buf, 0x52u);

    if (v31)
    {

    }
    v33 = (void *)v92;
  }

  v12 = v81;
  v8 = v84;
  v16 = &OBJC_IVAR____DKCoreDataStorage__localOnly;
  v17 = &OBJC_IVAR____DKCoreDataStorage__localOnly;
LABEL_25:

  objc_msgSend(*(id *)(a1 + 312), "sourceDeviceID");
  v34 = objc_claimAutoreleasedReturnValue();
  v35 = (void *)v34;
  if (!v34)
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      -[_DKPerformSyncDownPeerAdditionsOperation handleFetchedEvents:completedWindows:missingWindows:].cold.1((void *)a1, v12, v48);

    objc_msgSend((id)a1, "errors");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKSyncErrors internalFailure](_DKSyncErrors, "internalFailure");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addObject:", v49);
    v50 = 0;
    goto LABEL_47;
  }
  v93 = (void *)v34;
  +[_DKSyncPeerStatusTracker sharedInstance](_DKSyncPeerStatusTracker, "sharedInstance");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setLastSuccessfulActivityDate:onTransport:forPeer:", v37, objc_msgSend(*(id *)(a1 + 304), "transportType"), *(_QWORD *)(a1 + 312));

  if (objc_msgSend(v12, "count"))
  {
    *(_BYTE *)(a1 + 400) = 1;
    -[_DKPerformSyncDownPeerAdditionsOperation updateEvents:withSourceDeviceID:](a1, v12, v93);
    v38 = *(void **)(a1 + 296);
    v98 = 0;
    v39 = objc_msgSend(v38, "saveEvents:error:", v12, &v98);
    v40 = v98;
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v41 = objc_claimAutoreleasedReturnValue();
    v42 = v41;
    if (v39)
    {
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        v82 = v12;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v12, "count"));
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = &stru_1E26E9728;
        if (objc_msgSend(*(id *)(a1 + 312), "me"))
          v44 = CFSTR("pseudo ");
        else
          v44 = &stru_1E26E9728;
        objc_msgSend(*(id *)(a1 + 312), "identifier");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 312), "model");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        if (v46)
        {
          v47 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(*(id *)(a1 + 312), "model");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "stringWithFormat:", CFSTR(" (%@)"), v76);
          v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        v85 = v8;
        _DKSyncLoggingWindowsDescription(v8);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v100 = v89;
        v101 = 2112;
        v102 = v79;
        v103 = 2114;
        v104 = (uint64_t)v44;
        v105 = 2114;
        v106 = (uint64_t)v45;
        v107 = 2114;
        v108 = v43;
        v109 = 2114;
        v110 = v51;
        _os_log_impl(&dword_18DDBE000, v42, OS_LOG_TYPE_INFO, "%{public}@: Saved %@ events from %{public}@peer %{public}@%{public}@ in windows %{public}@", buf, 0x3Eu);
        if (v46)
        {

        }
        v12 = v82;
        v8 = v85;
        v16 = &OBJC_IVAR____DKCoreDataStorage__localOnly;
      }
    }
    else
    {
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        v86 = v8;
        objc_msgSend((id)objc_opt_class(), "description");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        v83 = v12;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v12, "count"));
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = objc_msgSend(*(id *)(a1 + 312), "me");
        v66 = &stru_1E26E9728;
        v67 = CFSTR("pseudo ");
        if (!v65)
          v67 = &stru_1E26E9728;
        v77 = v67;
        objc_msgSend(*(id *)(a1 + 312), "identifier");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 312), "model");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        if (v69)
        {
          v72 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(*(id *)(a1 + 312), "model");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "stringWithFormat:", CFSTR(" (%@)"), v75);
          v66 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v40, "domain");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = objc_msgSend(v40, "code");
        *(_DWORD *)buf = 138545154;
        v100 = v90;
        v101 = 2112;
        v102 = v80;
        v103 = 2114;
        v104 = (uint64_t)v77;
        v105 = 2114;
        v106 = (uint64_t)v68;
        v107 = 2114;
        v108 = v66;
        v109 = 2114;
        v110 = v73;
        v111 = 2048;
        v112 = v74;
        v113 = 2112;
        v114 = v40;
        _os_log_error_impl(&dword_18DDBE000, v42, OS_LOG_TYPE_ERROR, "%{public}@: Failed while saving %@ events from %{public}@peer %{public}@%{public}@: %{public}@:%lld (%@)", buf, 0x52u);

        if (v69)
        {

        }
        v12 = v83;
        v8 = v86;
        v16 = &OBJC_IVAR____DKCoreDataStorage__localOnly;
      }

      objc_msgSend((id)a1, "errors");
      v42 = objc_claimAutoreleasedReturnValue();
      -[NSObject addObject:](v42, "addObject:", v40);
    }

  }
  v52 = v12;
  v53 = *(void **)(a1 + 296);
  v54 = v16;
  v55 = *(_QWORD *)(a1 + v16[34]);
  objc_msgSend(*(id *)(a1 + 304), "name");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = 0;
  objc_msgSend(v53, "saveSyncedDownWindows:peer:transportName:error:", v8, v55, v56, &v97);
  v50 = (__CFString *)v97;

  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v57 = objc_claimAutoreleasedReturnValue();
  v58 = v57;
  if (v50)
  {
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      _DKSyncLoggingWindowsDescription(v8);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString domain](v50, "domain");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = -[__CFString code](v50, "code");
      *(_DWORD *)buf = 138544386;
      v100 = v61;
      v101 = 2114;
      v102 = v62;
      v103 = 2114;
      v104 = (uint64_t)v63;
      v105 = 2048;
      v106 = v64;
      v107 = 2112;
      v108 = v50;
      _os_log_error_impl(&dword_18DDBE000, v58, OS_LOG_TYPE_ERROR, "%{public}@: Failed while saving synced down windows %{public}@: %{public}@:%lld (%@)", buf, 0x34u);

    }
    objc_msgSend((id)a1, "errors");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "addObject:", v50);
    v12 = v52;
    v16 = v54;
    v17 = &OBJC_IVAR____DKCoreDataStorage__localOnly;
    v35 = v93;
LABEL_47:

    v59 = v36;
    v36 = v50;
LABEL_48:

    v9 = v94;
    if (objc_msgSend(*(id *)(a1 + v17[33]), "transportType") != 1)
      objc_msgSend(*(id *)(a1 + v17[33]), "setHasAdditionsFlag:forPeer:", 0, *(_QWORD *)(a1 + v16[34]));
    objc_msgSend((id)a1, "endOperation");
    goto LABEL_51;
  }
  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
    -[_DKPerformSyncDownPeerAdditionsOperation handleFetchedEvents:completedWindows:missingWindows:].cold.2((void *)a1, v8, v58);

  v60 = *(_QWORD *)(a1 + 384);
  v12 = v52;
  if (v60 >= objc_msgSend(*(id *)(a1 + 320), "maxBatchesPerSync"))
  {
    v16 = v54;
    v59 = v36;
    v36 = 0;
    v17 = &OBJC_IVAR____DKCoreDataStorage__localOnly;
    v35 = v93;
    goto LABEL_48;
  }
  v95[0] = MEMORY[0x1E0C809B0];
  v95[1] = 3221225472;
  v95[2] = __96___DKPerformSyncDownPeerAdditionsOperation_handleFetchedEvents_completedWindows_missingWindows___block_invoke;
  v95[3] = &unk_1E26E3250;
  v95[4] = a1;
  v96 = v8;
  +[_DKSyncSerializer performAsyncBlock:](_DKSyncSerializer, "performAsyncBlock:", v95);

  v35 = v93;
  v9 = v94;
LABEL_51:

LABEL_52:
}

- (void)coalesceRedundantOverlappingWindows
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
  _os_log_error_impl(&dword_18DDBE000, a3, OS_LOG_TYPE_ERROR, "%{public}@: Failed while saving coalesced event: %{public}@:%lld (%@)", (uint8_t *)&v7, 0x2Au);

}

- (void)updateEvents:(void *)a3 withSourceDeviceID:
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v7);

    v23 = (void *)objc_opt_new();
    v21 = v6;
    v22 = (void *)objc_opt_new();
    objc_msgSend(v22, "setDeviceID:", v6);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v20 = v5;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v25 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v14, "source", v20);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15;
          if (v15)
          {
            objc_msgSend(v15, "deviceID");
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v17)
              objc_msgSend(v16, "setDeviceID:", v21);
          }
          else
          {
            objc_msgSend(v14, "setSource:", v22);
          }
          objc_msgSend(v14, "stream");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "name");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
            objc_msgSend(v23, "addObject:", v19);
          +[_DKPerformSyncDownPeerAdditionsOperation _updateEventStatsWithSyncLatencyOfEvent:ingressDate:transportType:]((uint64_t)_DKPerformSyncDownPeerAdditionsOperation, v14, v8, objc_msgSend(*(id *)(a1 + 304), "transportType"));

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v11);
    }

    +[_DKPerformSyncDownPeerAdditionsOperation _updateEventStatsWithTotal:streamNameCounts:transportType:]((uint64_t)_DKPerformSyncDownPeerAdditionsOperation, objc_msgSend(v9, "count"), v23, objc_msgSend(*(id *)(a1 + 304), "transportType"));
    v5 = v20;
    v6 = v21;
  }

}

+ (void)_updateEventStatsWithSyncLatencyOfEvent:(void *)a3 ingressDate:(uint64_t)a4 transportType:
{
  id v6;
  id v7;
  __CFString *v8;
  id v9;

  v6 = a3;
  v7 = a2;
  objc_opt_self();
  if (_updateEventStatsWithSyncLatencyOfEvent_ingressDate_transportType__syncDownAdditionsLatencyInitialized != -1)
    dispatch_once(&_updateEventStatsWithSyncLatencyOfEvent_ingressDate_transportType__syncDownAdditionsLatencyInitialized, &__block_literal_global_53);
  objc_msgSend(v7, "creationDate");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (a4 == 1)
    v8 = CFSTR("Rapport");
  else
    v8 = CFSTR("Cloud");
  -[_DKEventTypeStatsTimerCounter addTimingWithStartDate:endDate:typeValue:](_updateEventStatsWithSyncLatencyOfEvent_ingressDate_transportType__syncDownAdditionsLatencyByTransportCounter, (uint64_t)v9, v6, v8);
  -[_DKEventStatsTimerCounter addTimingWithStartDate:endDate:](_updateEventStatsWithSyncLatencyOfEvent_ingressDate_transportType__syncDownAdditionsLatencyCounter, (uint64_t)v9, v6);

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
  if (_updateEventStatsWithTotal_streamNameCounts_transportType__syncDownAdditionsCounterInitialized != -1)
    dispatch_once(&_updateEventStatsWithTotal_streamNameCounts_transportType__syncDownAdditionsCounterInitialized, &__block_literal_global_58);
  -[_DKEventStatsCounter incrementCountByNumber:](_updateEventStatsWithTotal_streamNameCounts_transportType__syncDownAdditionsTotalCounter, a2);
  if (a4 == 1)
    v7 = CFSTR("Rapport");
  else
    v7 = CFSTR("Cloud");
  -[_DKEventTypeStatsCounter incrementCountByNumber:typeValue:](_updateEventStatsWithTotal_streamNameCounts_transportType__syncDownAdditionsTotalByTransportCounter, a2, v7);
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
        objc_msgSend((id)_updateEventStatsWithTotal_streamNameCounts_transportType__syncDownAdditionsCountersByStreamName, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v14)
        {
          v15 = (void *)MEMORY[0x1E0CB3940];
          +[_DKEventStatsUtilities safeStringWithString:](_DKEventStatsUtilities, "safeStringWithString:", v13);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "stringWithFormat:", CFSTR("sync_down_additions_stream%@"), v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          +[_DKEventStatsCounter counterInCollection:withEventName:]((uint64_t)_DKEventStatsCounter, CFSTR("coreduet_sync2"), v17);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)_updateEventStatsWithTotal_streamNameCounts_transportType__syncDownAdditionsCountersByStreamName, "setObject:forKeyedSubscript:", v14, v13);

        }
        -[_DKEventStatsCounter incrementCountByNumber:]((uint64_t)v14, objc_msgSend(v8, "countForObject:", v13));

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

}

- (void)endOperation
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)_DKPerformSyncDownPeerAdditionsOperation;
  -[_DKSyncCompositeOperation endOperation](&v2, sel_endOperation);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlappingWindows, 0);
  objc_storeStrong((id *)&self->_highWaterMark, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_keyValueStore, 0);
  objc_storeStrong((id *)&self->_history, 0);
  objc_storeStrong((id *)&self->_streamNames, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_policy, 0);
  objc_storeStrong((id *)&self->_peer, 0);
  objc_storeStrong((id *)&self->_transport, 0);
  objc_storeStrong((id *)&self->_localStorage, 0);
}

- (void)performSyncDownPeerAdditionsWithDidPrewarm:(uint64_t)a1 orError:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  void *v4;
  __CFString *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14[14];
  const __CFString *v15;
  __int16 v16;
  uint64_t v17;

  objc_msgSend((id)OUTLINED_FUNCTION_15_1(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = &stru_1E26E9728;
  if (objc_msgSend((id)OUTLINED_FUNCTION_28_1(), "me"))
    v6 = CFSTR("pseudo ");
  else
    v6 = &stru_1E26E9728;
  objc_msgSend((id)OUTLINED_FUNCTION_28_1(), "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_28_1(), "model");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend((id)OUTLINED_FUNCTION_28_1(), "model");
    objc_claimAutoreleasedReturnValue();
    OUTLINED_FUNCTION_56();
    objc_msgSend(v9, "stringWithFormat:", CFSTR(" (%@)"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(a1 + 304), "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_27_1();
  v15 = v6;
  OUTLINED_FUNCTION_25_1();
  v16 = v11;
  v17 = v12;
  OUTLINED_FUNCTION_29_0(&dword_18DDBE000, a2, v13, "%{public}@: Performing sync down of additions from %{public}@peer %{public}@%{public}@ on transport %{public}@", v14);

  if (v8)
  {

  }
}

- (void)performSyncDownPeerAdditionsWithCompletedWindows:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 392), "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  _os_log_debug_impl(&dword_18DDBE000, a2, OS_LOG_TYPE_DEBUG, "%{public}@: Coalescing (%@) redundant overlapping windows", (uint8_t *)&v6, 0x16u);

}

- (void)handleFetchedEvents:(void *)a1 completedWindows:(void *)a2 missingWindows:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  void *v6;
  void *v7;
  __CFString *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  const __CFString *v18;

  objc_msgSend((id)OUTLINED_FUNCTION_15_1(), "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a2, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = &stru_1E26E9728;
  if (OUTLINED_FUNCTION_23_1())
    v9 = CFSTR("pseudo ");
  else
    v9 = &stru_1E26E9728;
  objc_msgSend((id)OUTLINED_FUNCTION_18_5(), "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_18_5(), "model");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend((id)OUTLINED_FUNCTION_18_5(), "model");
    objc_claimAutoreleasedReturnValue();
    OUTLINED_FUNCTION_56();
    objc_msgSend(v12, "stringWithFormat:", CFSTR(" (%@)"));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  *(_DWORD *)buf = 138544386;
  v14 = v6;
  v15 = 2112;
  v16 = v7;
  v17 = 2114;
  v18 = v9;
  OUTLINED_FUNCTION_14_4();
  _os_log_error_impl(&dword_18DDBE000, a3, OS_LOG_TYPE_ERROR, "%{public}@: Unable to save %@ events, missing device id in peer %{public}@peer %{public}@%{public}@", buf, 0x34u);
  if (v11)
  {

  }
  OUTLINED_FUNCTION_9_1();
}

- (void)handleFetchedEvents:(void *)a1 completedWindows:(void *)a2 missingWindows:(NSObject *)a3 .cold.2(void *a1, void *a2, NSObject *a3)
{
  void *v6;
  void *v7;
  __CFString *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint8_t v15[14];
  void *v16;
  __int16 v17;
  const __CFString *v18;

  objc_msgSend((id)OUTLINED_FUNCTION_15_1(), "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _DKSyncLoggingWindowsDescription(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = &stru_1E26E9728;
  if (OUTLINED_FUNCTION_23_1())
    v9 = CFSTR("pseudo ");
  else
    v9 = &stru_1E26E9728;
  objc_msgSend((id)OUTLINED_FUNCTION_18_5(), "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_18_5(), "model");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend((id)OUTLINED_FUNCTION_18_5(), "model");
    objc_claimAutoreleasedReturnValue();
    OUTLINED_FUNCTION_56();
    objc_msgSend(v12, "stringWithFormat:", CFSTR(" (%@)"));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  OUTLINED_FUNCTION_27_1();
  v16 = v7;
  v17 = v13;
  v18 = v9;
  OUTLINED_FUNCTION_14_4();
  OUTLINED_FUNCTION_29_0(&dword_18DDBE000, a3, v14, "%{public}@: Successfully saved completed windows %{public}@ from %{public}@peer %{public}@%{public}@", v15);
  if (v11)
  {

  }
  OUTLINED_FUNCTION_9_1();
}

@end

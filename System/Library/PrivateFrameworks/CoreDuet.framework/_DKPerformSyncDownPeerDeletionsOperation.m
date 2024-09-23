@implementation _DKPerformSyncDownPeerDeletionsOperation

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
    v22.super_class = (Class)_DKPerformSyncDownPeerDeletionsOperation;
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
  if (+[_DKSync2Coordinator shouldDeferSyncOperationWithClass:syncType:transport:peer:policy:]((uint64_t)_DKSync2Coordinator, v3, self->_type, self->_transport, self->_peer, self->_policy))-[_DKPerformSyncDownPeerDeletionsOperation endOperation](self, "endOperation");
  else
    -[_DKPerformSyncDownPeerDeletionsOperation performSyncDownPeerDeletions]((uint64_t)self);
}

- (uint64_t)performSyncDownPeerDeletions
{
  uint64_t v1;
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];

  if (result)
  {
    v1 = result;
    +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
    v2 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v2);

    v3 = *(void **)(v1 + 296);
    v4 = *(_QWORD *)(v1 + 312);
    objc_msgSend(*(id *)(v1 + 304), "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "deletionsSyncHistoryForPeer:transportName:error:", v4, v5, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(v1 + 344);
    *(_QWORD *)(v1 + 344) = v6;

    v8 = objc_opt_class();
    if (+[_DKSync2Coordinator canPerformSyncOperationWithClass:syncType:history:transport:peer:policy:]((uint64_t)_DKSync2Coordinator, v8, *(void **)(v1 + 328), *(void **)(v1 + 344), *(void **)(v1 + 304), *(void **)(v1 + 312), *(void **)(v1 + 320)))
    {
      v9 = *(void **)(v1 + 304);
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __72___DKPerformSyncDownPeerDeletionsOperation_performSyncDownPeerDeletions__block_invoke;
      v10[3] = &unk_1E26E3118;
      v10[4] = v1;
      return objc_msgSend(v9, "prewarmFetchWithCompletion:", v10);
    }
    else
    {
      return objc_msgSend((id)v1, "endOperation");
    }
  }
  return result;
}

- (void)performSyncDownPeerDeletionsWithDidPrewarm:(void *)a3 orError:
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;

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
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[_DKPerformSyncDownPeerDeletionsOperation performSyncDownPeerDeletionsWithDidPrewarm:orError:].cold.2(a1, v8);

    if (!a2 || (objc_msgSend(*(id *)(a1 + 304), "hasDeletionsFlagForPeer:", *(_QWORD *)(a1 + 312)) & 1) == 0)
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        -[_DKPerformSyncDownPeerDeletionsOperation performSyncDownPeerDeletionsWithDidPrewarm:orError:].cold.1(a1, v7);
      goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DKPerformSyncDownPeerDeletionsOperation performSyncDownPeerDeletionsWithHighWaterMark:orError:](a1, v9, 0);

  }
LABEL_12:

}

- (void)performSyncDownPeerDeletionsWithHighWaterMark:(void *)a3 orError:
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
          objc_storeStrong((id *)(a1 + 352), a2);
          -[_DKPerformSyncDownPeerDeletionsOperation performSyncDownPeerDeletionsWithPreviousUntilDate:](a1, 0);
          goto LABEL_10;
        }
      }
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[_DKPerformSyncDownPeerDeletionsOperation performSyncDownPeerDeletionsWithHighWaterMark:orError:].cold.1(a1, v12);

      objc_msgSend(*(id *)(a1 + 304), "setHasDeletionsFlag:forPeer:", 0, *(_QWORD *)(a1 + 312));
    }
    objc_msgSend((id)a1, "endOperation");
  }
LABEL_10:

}

- (void)performSyncDownPeerDeletionsWithPreviousUntilDate:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  NSObject *v13;
  double v14;
  double v15;
  double v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  int v37;
  __CFString *v38;
  const __CFString *v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  __CFString *v44;
  const __CFString *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  __int128 v50;
  const __CFString *v51;
  uint64_t v52;
  const __CFString *v53;
  void *v54;
  __CFString *v55;
  void *v56;
  void *v57;
  __int128 v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  __int128 v63;
  void (*v64)(id *, void *, void *, void *);
  void *v65;
  uint64_t v66;
  id v67;
  id v68;
  id v69;
  _BYTE buf[24];
  uint64_t v71;
  _BYTE v72[32];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
    if (v3)
    {
      if (v5)
        -[_DKPerformSyncDownPeerDeletionsOperation performSyncDownPeerDeletionsWithPreviousUntilDate:].cold.5(a1, (uint64_t)v3, (uint64_t)v4, v6, v7, v8, v9, v10, v48, v49, v50, v52, SWORD2(v52), SHIWORD(v52), v55, v58, v63, v64, (uint64_t)v65,
          v66,
          (uint64_t)v67,
          (uint64_t)v68,
          (uint64_t)v69,
          *(uint64_t *)buf,
          *(uint64_t *)&buf[8],
          *(uint64_t *)&buf[16],
          v71,
          *(uint64_t *)v72,
          *(uint64_t *)&v72[8],
          *(uint64_t *)&v72[16],
          *(uint64_t *)&v72[24]);

      v11 = v3;
      goto LABEL_6;
    }
    if (v5)
      -[_DKPerformSyncDownPeerDeletionsOperation performSyncDownPeerDeletionsWithPreviousUntilDate:].cold.4(a1, v4);

    if ((objc_msgSend(*(id *)(a1 + 312), "me") & 1) != 0)
    {
      v26 = 0;
    }
    else
    {
      v27 = *(void **)(a1 + 296);
      v28 = *(_QWORD *)(a1 + 312);
      objc_msgSend(*(id *)(a1 + 304), "name");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = 0;
      objc_msgSend(v27, "lastSyncDownDeletionDateForPeer:transportName:error:", v28, v29, &v69);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v26 = v69;

      if (v11)
        goto LABEL_21;
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_21:
    if (v26)
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        -[_DKPerformSyncDownPeerDeletionsOperation performSyncDownPeerDeletionsWithPreviousUntilDate:].cold.3(a1, (uint64_t)v26, (uint64_t)v30, v31, v32, v33, v34, v35, v48, v49, v50, v52, SWORD2(v52), SHIWORD(v52), v55, v58, v63, v64, (uint64_t)v65,
          v66,
          (uint64_t)v67,
          (uint64_t)v68,
          (uint64_t)v69,
          *(uint64_t *)buf,
          *(uint64_t *)&buf[8],
          *(uint64_t *)&buf[16],
          v71,
          *(uint64_t *)v72,
          *(uint64_t *)&v72[8],
          *(uint64_t *)&v72[16],
          *(uint64_t *)&v72[24]);

      objc_msgSend((id)a1, "errors");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v26);
      goto LABEL_29;
    }
LABEL_6:
    v12 = *(id *)(a1 + 352);
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDate dk_localtimeString](v11);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDate dk_localtimeString](v12);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(*(id *)(a1 + 312), "me");
      v38 = &stru_1E26E9728;
      v39 = CFSTR("pseudo ");
      if (!v37)
        v39 = &stru_1E26E9728;
      v53 = v39;
      objc_msgSend(*(id *)(a1 + 312), "identifier");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 312), "model");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      if (v41)
      {
        v42 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(*(id *)(a1 + 312), "model");
        *((_QWORD *)&v50 + 1) = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "stringWithFormat:", CFSTR(" (%@)"), *((_QWORD *)&v50 + 1));
        v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 138544642;
      *(_QWORD *)&buf[4] = v61;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v56;
      *(_WORD *)&buf[22] = 2114;
      v71 = (uint64_t)v59;
      *(_WORD *)v72 = 2114;
      *(_QWORD *)&v72[2] = v53;
      *(_WORD *)&v72[10] = 2114;
      *(_QWORD *)&v72[12] = v40;
      *(_WORD *)&v72[20] = 2114;
      *(_QWORD *)&v72[22] = v38;
      _os_log_debug_impl(&dword_18DDBE000, v13, OS_LOG_TYPE_DEBUG, "%{public}@: Syncing down deletions with bookmark [%{public}@ ending %{public}@] from %{public}@peer %{public}@%{public}@", buf, 0x3Eu);
      if (v41)
      {

      }
    }

    objc_msgSend(v12, "timeIntervalSinceReferenceDate");
    v15 = v14;
    objc_msgSend(v11, "timeIntervalSinceReferenceDate");
    if (v15 - v16 <= (double)(unint64_t)objc_msgSend(*(id *)(a1 + 320), "minSyncWindowInSeconds"))
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        -[_DKPerformSyncDownPeerDeletionsOperation performSyncDownPeerDeletionsWithPreviousUntilDate:].cold.2((void *)a1, v11, v17);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 320), "streamNamesToSyncWithDisabledFeatures:", 0);
      v17 = objc_claimAutoreleasedReturnValue();
      if (-[NSObject count](v17, "count"))
      {
        v18 = *(_QWORD *)(a1 + 360);
        if (!v18)
        {
          objc_msgSend(*(id *)(a1 + 344), "lastSyncDate");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          +[_DKPerformSyncDownPeerDeletionsOperation _updateEventStatsWithPreviousSyncDate:transportType:]((uint64_t)_DKPerformSyncDownPeerDeletionsOperation, v19, objc_msgSend(*(id *)(a1 + 304), "transportType"));

          v18 = *(_QWORD *)(a1 + 360);
        }
        *(_QWORD *)(a1 + 360) = v18 + 1;
        +[_CDLogging syncChannel](_CDLogging, "syncChannel");
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend((id)objc_opt_class(), "description");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDate dk_localtimeString](v11);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDate dk_localtimeString](v12);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = objc_msgSend(*(id *)(a1 + 312), "me");
          v44 = &stru_1E26E9728;
          v45 = CFSTR("pseudo ");
          if (!v43)
            v45 = &stru_1E26E9728;
          v51 = v45;
          objc_msgSend(*(id *)(a1 + 312), "identifier");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 312), "model");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          if (v46)
          {
            v47 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(*(id *)(a1 + 312), "model");
            *(_QWORD *)&v50 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "stringWithFormat:", CFSTR(" (%@)"), (_QWORD)v50);
            v44 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          *(_DWORD *)buf = 138544642;
          *(_QWORD *)&buf[4] = v62;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v54;
          *(_WORD *)&buf[22] = 2114;
          v71 = (uint64_t)v60;
          *(_WORD *)v72 = 2114;
          *(_QWORD *)&v72[2] = v51;
          *(_WORD *)&v72[10] = 2114;
          *(_QWORD *)&v72[12] = v57;
          *(_WORD *)&v72[20] = 2114;
          *(_QWORD *)&v72[22] = v44;
          _os_log_debug_impl(&dword_18DDBE000, v20, OS_LOG_TYPE_DEBUG, "%{public}@: Fetching deletions with bookmark [%{public}@ ending %{public}@] from %{public}@peer %{public}@%{public}@", buf, 0x3Eu);
          if (v46)
          {

          }
        }

        v21 = *(void **)(a1 + 304);
        v22 = *(_QWORD *)(a1 + 312);
        v23 = objc_msgSend(*(id *)(a1 + 320), "syncBatchSizeInEvents");
        v24 = *(unsigned __int8 *)(a1 + 336);
        *(_QWORD *)&v63 = MEMORY[0x1E0C809B0];
        *((_QWORD *)&v63 + 1) = 3221225472;
        v64 = __94___DKPerformSyncDownPeerDeletionsOperation_performSyncDownPeerDeletionsWithPreviousUntilDate___block_invoke;
        v65 = &unk_1E26E4E70;
        v66 = a1;
        v11 = v11;
        v67 = v11;
        v68 = v12;
        v25 = v12;
        objc_msgSend(v21, "fetchDeletedEventIDsFromPeer:sinceDate:streamNames:limit:highPriority:completion:", v22, v11, v17, v23, v24, &v63);

        v26 = 0;
LABEL_32:

        goto LABEL_33;
      }
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        -[_DKPerformSyncDownPeerDeletionsOperation performSyncDownPeerDeletionsWithPreviousUntilDate:].cold.1(a1, v36);

    }
    v26 = 0;
LABEL_29:

    if (objc_msgSend(*(id *)(a1 + 304), "transportType") != 1)
      objc_msgSend(*(id *)(a1 + 304), "setHasDeletionsFlag:forPeer:", 0, *(_QWORD *)(a1 + 312));
    objc_msgSend((id)a1, "endOperation");
    goto LABEL_32;
  }
LABEL_33:

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
  if (_updateEventStatsWithPreviousSyncDate_transportType__syncCadenceInitialized != -1)
    dispatch_once(&_updateEventStatsWithPreviousSyncDate_transportType__syncCadenceInitialized, &__block_literal_global_43);
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v11, "isEqualToDate:", v4);

    if ((v5 & 1) == 0)
    {
      v6 = _updateEventStatsWithPreviousSyncDate_transportType__syncCadenceByTransportCounter;
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (a3 == 1)
        v8 = CFSTR("Rapport");
      else
        v8 = CFSTR("Cloud");
      -[_DKEventTypeStatsTimerCounter addTimingWithStartDate:endDate:typeValue:](v6, (uint64_t)v11, v7, v8);

    }
  }
  v9 = _updateEventStatsWithPreviousSyncDate_transportType__syncCadenceCounter;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKEventStatsTimerCounter addTimingWithStartDate:endDate:](v9, (uint64_t)v11, v10);

}

- (void)handleFetchedDeletedEventIDs:(void *)a3 startDate:(void *)a4 endDate:(void *)a5 untilDate:
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  _UNKNOWN **v14;
  NSObject *v15;
  int *v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  int *v20;
  char v21;
  const char *v22;
  __CFString *v23;
  const __CFString *v24;
  __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int *v32;
  void *v33;
  int v34;
  __CFString *v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  id v39;
  void *v40;
  int *v41;
  uint64_t v42;
  void *v43;
  NSObject *v44;
  NSObject *v45;
  void *v46;
  __CFString *v47;
  __CFString *v48;
  char v49;
  int *v50;
  __CFString *v51;
  const __CFString *v52;
  void *v53;
  void *v54;
  void *v55;
  __CFString *v56;
  const __CFString *v57;
  void *v58;
  void *v59;
  void *v60;
  unint64_t v61;
  double v62;
  double v63;
  double v64;
  int v65;
  __CFString *v66;
  const __CFString *v67;
  void *v68;
  const char *v69;
  const __CFString *v70;
  void *v71;
  int v72;
  __CFString *v73;
  const __CFString *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  const __CFString *v82;
  uint64_t v83;
  __CFString *v84;
  void *v85;
  char v86;
  __CFString *v87;
  __CFString *v88;
  __CFString *v89;
  const __CFString *v90;
  void *v91;
  __CFString *v92;
  __CFString *v93;
  __CFString *v94;
  void *v95;
  __CFString *v96;
  void *v97;
  id v98;
  void *v99;
  __CFString *v100;
  void *v101;
  __CFString *v102;
  void *v103;
  void *v104;
  void *v105;
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  void *v112;
  id v113;
  id v114;
  void *v115;
  void *v116;
  _QWORD v117[5];
  id v118;
  id v119;
  id v120;
  uint8_t buf[4];
  void *v122;
  __int16 v123;
  id v124;
  __int16 v125;
  const __CFString *v126;
  __int16 v127;
  __CFString *v128;
  __int16 v129;
  __CFString *v130;
  __int16 v131;
  void *v132;
  __int16 v133;
  uint64_t v134;
  __int16 v135;
  __CFString *v136;
  __int16 v137;
  __CFString *v138;
  __int16 v139;
  void *v140;
  uint64_t v141;

  v141 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (a1)
  {
    +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v13);

    if (!v12)
      v12 = *(id *)(a1 + 352);
    v14 = &off_1E26E0000;
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = &OBJC_IVAR____CDMemoryUsageInterval__startingLifetimeMaxMemoryUsage;
    v115 = v10;
    v116 = v12;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDate dk_localtimeString](v10);
      v47 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
      -[NSDate dk_localtimeString](v11);
      v48 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v11, "isEqualToDate:", v12);
      v109 = v9;
      v113 = v11;
      if ((v49 & 1) != 0)
      {
        v94 = CFSTR("ending");
      }
      else
      {
        -[NSDate dk_localtimeString](v12);
        v94 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      v50 = &OBJC_IVAR____CDMemoryUsageInterval__startingLifetimeMaxMemoryUsage;
      v51 = &stru_1E26E9728;
      if (objc_msgSend(*(id *)(a1 + 312), "me"))
        v52 = CFSTR("pseudo ");
      else
        v52 = &stru_1E26E9728;
      objc_msgSend(*(id *)(a1 + 312), "identifier");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 312), "model");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      if (v54)
      {
        v55 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(*(id *)(a1 + 312), "model");
        v50 = (int *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "stringWithFormat:", CFSTR(" (%@)"), v50);
        v51 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 138545154;
      v122 = v104;
      v123 = 2112;
      v124 = v99;
      v125 = 2114;
      v126 = v47;
      v127 = 2114;
      v128 = v48;
      v129 = 2114;
      v130 = v94;
      v131 = 2114;
      v132 = (void *)v52;
      v133 = 2114;
      v134 = (uint64_t)v53;
      v135 = 2114;
      v136 = v51;
      _os_log_debug_impl(&dword_18DDBE000, v15, OS_LOG_TYPE_DEBUG, "%{public}@: Fetched %@ deleted event ids with bookmark [%{public}@ ending %{public}@] up through %{public}@ from %{public}@peer %{public}@%{public}@", buf, 0x52u);
      if (v54)
      {

      }
      v11 = v113;
      if ((v49 & 1) == 0)

      v9 = v109;
      v10 = v115;
      v12 = v116;
      v16 = &OBJC_IVAR____CDMemoryUsageInterval__startingLifetimeMaxMemoryUsage;
      v14 = &off_1E26E0000;
    }

    v17 = objc_msgSend(v9, "count");
    objc_msgSend(v14[247], "syncChannel");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v18;
    v20 = &OBJC_IVAR____CDMemoryUsageInterval__startingLifetimeMaxMemoryUsage;
    if (v17)
    {
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        goto LABEL_27;
      objc_msgSend((id)objc_opt_class(), "description");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDate dk_localtimeString](v10);
      v96 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[NSDate dk_localtimeString](v11);
      v87 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v11, "isEqualToDate:", v12);
      v106 = v9;
      if ((v21 & 1) != 0)
      {
        v84 = CFSTR("ending");
      }
      else
      {
        -[NSDate dk_localtimeString](v12);
        v84 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      v110 = v11;
      if (objc_msgSend(*(id *)(a1 + 304), "transportType") == 8)
        v22 = "up to";
      else
        v22 = "down from";
      v23 = &stru_1E26E9728;
      if (objc_msgSend(*(id *)(a1 + v16[617]), "me"))
        v24 = CFSTR("pseudo ");
      else
        v24 = &stru_1E26E9728;
      objc_msgSend(*(id *)(a1 + v16[617]), "identifier");
      v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + v16[617]), "model");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26)
      {
        v27 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(*(id *)(a1 + v16[617]), "model");
        v11 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "stringWithFormat:", CFSTR(" (%@)"), v11);
        v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(*(id *)(a1 + 304), "name");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138545666;
      v122 = v101;
      v123 = 2112;
      v124 = v91;
      v125 = 2114;
      v126 = v96;
      v127 = 2114;
      v128 = v87;
      v129 = 2114;
      v130 = v84;
      v131 = 2082;
      v132 = (void *)v22;
      v133 = 2114;
      v134 = (uint64_t)v24;
      v135 = 2114;
      v136 = v25;
      v137 = 2114;
      v138 = v23;
      v139 = 2114;
      v140 = v28;
      _os_log_impl(&dword_18DDBE000, v19, OS_LOG_TYPE_INFO, "%{public}@: Fetched %@ deleted event ids with bookmark [%{public}@ ending %{public}@] up through %{public}@ doing sync %{public}s %{public}@peer %{public}@%{public}@ on transport %{public}@", buf, 0x66u);
    }
    else
    {
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        goto LABEL_27;
      objc_msgSend((id)objc_opt_class(), "description");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDate dk_localtimeString](v10);
      v96 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[NSDate dk_localtimeString](v11);
      v87 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v11, "isEqualToDate:", v12);
      v106 = v9;
      if ((v21 & 1) != 0)
      {
        v84 = CFSTR("ending");
      }
      else
      {
        -[NSDate dk_localtimeString](v12);
        v84 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      v110 = v11;
      if (objc_msgSend(*(id *)(a1 + 304), "transportType") == 8)
        v69 = "up to";
      else
        v69 = "down from";
      v23 = &stru_1E26E9728;
      if (objc_msgSend(*(id *)(a1 + v16[617]), "me"))
        v70 = CFSTR("pseudo ");
      else
        v70 = &stru_1E26E9728;
      objc_msgSend(*(id *)(a1 + v16[617]), "identifier");
      v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + v16[617]), "model");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26)
      {
        v71 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(*(id *)(a1 + v16[617]), "model");
        v11 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "stringWithFormat:", CFSTR(" (%@)"), v11);
        v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(*(id *)(a1 + 304), "name");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138545666;
      v122 = v101;
      v123 = 2112;
      v124 = v91;
      v125 = 2114;
      v126 = v96;
      v127 = 2114;
      v128 = v87;
      v129 = 2114;
      v130 = v84;
      v131 = 2082;
      v132 = (void *)v69;
      v133 = 2114;
      v134 = (uint64_t)v70;
      v135 = 2114;
      v136 = v25;
      v137 = 2114;
      v138 = v23;
      v139 = 2114;
      v140 = v28;
      _os_log_debug_impl(&dword_18DDBE000, v19, OS_LOG_TYPE_DEBUG, "%{public}@: Fetched %@ deleted event ids with bookmark [%{public}@ ending %{public}@] up through %{public}@ doing sync %{public}s %{public}@peer %{public}@%{public}@ on transport %{public}@", buf, 0x66u);
    }

    if (v26)
    {

    }
    v10 = v115;
    v12 = v116;
    if ((v21 & 1) == 0)

    v9 = v106;
    v11 = v110;
    v16 = &OBJC_IVAR____CDMemoryUsageInterval__startingLifetimeMaxMemoryUsage;
    v20 = &OBJC_IVAR____CDMemoryUsageInterval__startingLifetimeMaxMemoryUsage;
    v14 = &off_1E26E0000;
LABEL_27:

    objc_msgSend(*(id *)(a1 + v16[617]), "sourceDeviceID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v29)
    {
      objc_msgSend(v14[247], "syncChannel");
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        -[_DKPerformSyncDownPeerDeletionsOperation handleFetchedDeletedEventIDs:startDate:endDate:untilDate:].cold.1((void *)a1, v9, v38);

      objc_msgSend((id)a1, "errors");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      +[_DKSyncErrors internalFailure](_DKSyncErrors, "internalFailure");
      v39 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "addObject:", v39);
      goto LABEL_77;
    }
    +[_DKSyncPeerStatusTracker sharedInstance](_DKSyncPeerStatusTracker, "sharedInstance");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setLastSuccessfulActivityDate:onTransport:forPeer:", v31, objc_msgSend(*(id *)(a1 + v20[616]), "transportType"), *(_QWORD *)(a1 + v16[617]));

    if (!objc_msgSend(v9, "count"))
    {
LABEL_40:
      if ((objc_msgSend(*(id *)(a1 + v16[617]), "me") & 1) != 0)
      {
        v10 = v115;
LABEL_78:

        if (objc_msgSend(*(id *)(a1 + v20[616]), "transportType") != 1)
          objc_msgSend(*(id *)(a1 + v20[616]), "setHasDeletionsFlag:forPeer:", 0, *(_QWORD *)(a1 + v16[617]));
        objc_msgSend((id)a1, "endOperation");
        goto LABEL_81;
      }
      v112 = v11;
      v40 = *(void **)(a1 + 296);
      v41 = v20;
      v42 = *(_QWORD *)(a1 + v16[617]);
      objc_msgSend(*(id *)(a1 + v41[616]), "name");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v119 = 0;
      v10 = v115;
      objc_msgSend(v40, "setLastSyncDownDeletionDate:previousDate:forPeer:transportName:error:", v12, v115, v42, v43, &v119);
      v39 = v119;

      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v44 = objc_claimAutoreleasedReturnValue();
      v45 = v44;
      if (v39)
      {
        v11 = v112;
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          -[_DKPerformSyncDownPeerDeletionsOperation handleFetchedDeletedEventIDs:startDate:endDate:untilDate:].cold.2(a1, v39, v45);

        objc_msgSend((id)a1, "errors");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "addObject:", v39);

        v12 = v116;
        v20 = &OBJC_IVAR____CDMemoryUsageInterval__startingLifetimeMaxMemoryUsage;
      }
      else
      {
        v11 = v112;
        v20 = &OBJC_IVAR____CDMemoryUsageInterval__startingLifetimeMaxMemoryUsage;
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          objc_msgSend((id)objc_opt_class(), "description");
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDate dk_localtimeString](v115);
          v98 = (id)objc_claimAutoreleasedReturnValue();
          -[NSDate dk_localtimeString](v112);
          v93 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
          v108 = v9;
          v86 = objc_msgSend(v112, "isEqualToDate:", v116);
          if ((v86 & 1) != 0)
          {
            v89 = CFSTR("ending");
          }
          else
          {
            -[NSDate dk_localtimeString](v116);
            v89 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          v56 = &stru_1E26E9728;
          if (objc_msgSend(*(id *)(a1 + 312), "me"))
            v57 = CFSTR("pseudo ");
          else
            v57 = &stru_1E26E9728;
          objc_msgSend(*(id *)(a1 + 312), "identifier");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 312), "model");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          if (v59)
          {
            v60 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(*(id *)(a1 + 312), "model");
            v83 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "stringWithFormat:", CFSTR(" (%@)"), v83);
            v56 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          *(_DWORD *)buf = 138544898;
          v122 = v103;
          v123 = 2114;
          v124 = v98;
          v125 = 2114;
          v126 = v93;
          v127 = 2114;
          v128 = v89;
          v129 = 2114;
          v130 = (__CFString *)v57;
          v131 = 2114;
          v132 = v58;
          v133 = 2114;
          v134 = (uint64_t)v56;
          _os_log_impl(&dword_18DDBE000, v45, OS_LOG_TYPE_INFO, "%{public}@: Saved completed deletions bookmark [%{public}@ ending %{public}@] up through %{public}@ from %{public}@peer %{public}@%{public}@", buf, 0x48u);
          v20 = &OBJC_IVAR____CDMemoryUsageInterval__startingLifetimeMaxMemoryUsage;
          if (v59)
          {

          }
          v10 = v115;
          if ((v86 & 1) == 0)

          v9 = v108;
          v11 = v112;
        }

        v61 = *(_QWORD *)(a1 + 360);
        if (v61 >= objc_msgSend(*(id *)(a1 + 320), "maxBatchesPerSync"))
        {
          v12 = v116;
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 352), "timeIntervalSinceReferenceDate");
          v63 = v62;
          v12 = v116;
          objc_msgSend(v116, "timeIntervalSinceReferenceDate");
          if (v63 > v64)
          {
            v117[0] = MEMORY[0x1E0C809B0];
            v117[1] = 3221225472;
            v117[2] = __101___DKPerformSyncDownPeerDeletionsOperation_handleFetchedDeletedEventIDs_startDate_endDate_untilDate___block_invoke;
            v117[3] = &unk_1E26E3250;
            v117[4] = a1;
            v118 = v116;
            +[_DKSyncSerializer performAsyncBlock:](_DKSyncSerializer, "performAsyncBlock:", v117);

LABEL_81:
            goto LABEL_82;
          }
        }
      }
LABEL_77:

      v16 = &OBJC_IVAR____CDMemoryUsageInterval__startingLifetimeMaxMemoryUsage;
      goto LABEL_78;
    }
    *(_BYTE *)(a1 + 368) = 1;
    v32 = v20;
    +[_DKPerformSyncDownPeerDeletionsOperation _updateEventStatsWithTotal:transportType:]((uint64_t)_DKPerformSyncDownPeerDeletionsOperation, objc_msgSend(v9, "count"), objc_msgSend(*(id *)(a1 + v20[616]), "transportType"));
    v33 = *(void **)(a1 + 296);
    v120 = 0;
    v34 = objc_msgSend(v33, "deleteEventsWithEventIDs:error:", v9, &v120);
    v35 = (__CFString *)v120;
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = v36;
    if (v34)
    {
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDate dk_localtimeString](v115);
        v102 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
        -[NSDate dk_localtimeString](v11);
        v92 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
        v107 = v9;
        v111 = v11;
        LODWORD(v83) = objc_msgSend(v11, "isEqualToDate:", v116);
        if ((v83 & 1) != 0)
        {
          v88 = CFSTR("ending");
        }
        else
        {
          -[NSDate dk_localtimeString](v116);
          v88 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        v72 = objc_msgSend(*(id *)(a1 + 312), "me");
        v73 = &stru_1E26E9728;
        v74 = CFSTR("pseudo ");
        if (!v72)
          v74 = &stru_1E26E9728;
        v82 = v74;
        objc_msgSend(*(id *)(a1 + 312), "identifier");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 312), "model");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        if (v76)
        {
          v80 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(*(id *)(a1 + 312), "model");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "stringWithFormat:", CFSTR(" (%@)"), v81);
          v73 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        *(_DWORD *)buf = 138545154;
        v122 = v85;
        v123 = 2112;
        v124 = v97;
        v125 = 2114;
        v126 = v102;
        v127 = 2114;
        v128 = v92;
        v129 = 2114;
        v130 = v88;
        v131 = 2114;
        v132 = (void *)v82;
        v133 = 2114;
        v134 = (uint64_t)v75;
        v135 = 2114;
        v136 = v73;
        _os_log_debug_impl(&dword_18DDBE000, v37, OS_LOG_TYPE_DEBUG, "%{public}@: Deleted %@ events with bookmark [%{public}@ ending %{public}@] up through %{public}@ from %{public}@peer %{public}@%{public}@", buf, 0x52u);
        if (v76)
        {

        }
        if ((v83 & 1) == 0)

        v9 = v107;
        v11 = v111;
        goto LABEL_39;
      }
    }
    else
    {
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v114 = v11;
        objc_msgSend((id)objc_opt_class(), "description");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = objc_msgSend(*(id *)(a1 + 312), "me");
        v66 = &stru_1E26E9728;
        v67 = CFSTR("pseudo ");
        if (!v65)
          v67 = &stru_1E26E9728;
        v90 = v67;
        objc_msgSend(*(id *)(a1 + 312), "identifier");
        v100 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 312), "model");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        if (v68)
        {
          v77 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(*(id *)(a1 + 312), "model");
          v84 = (__CFString *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "stringWithFormat:", CFSTR(" (%@)"), v84);
          v66 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        -[__CFString domain](v35, "domain");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = -[__CFString code](v35, "code");
        *(_DWORD *)buf = 138545154;
        v122 = v95;
        v123 = 2112;
        v124 = v105;
        v125 = 2114;
        v126 = v90;
        v127 = 2114;
        v128 = v100;
        v129 = 2114;
        v130 = v66;
        v131 = 2114;
        v132 = v78;
        v133 = 2048;
        v134 = v79;
        v135 = 2112;
        v136 = v35;
        _os_log_error_impl(&dword_18DDBE000, v37, OS_LOG_TYPE_ERROR, "%{public}@: Failed while deleting %@ events from %{public}@peer %{public}@%{public}@: %{public}@:%lld (%@)", buf, 0x52u);

        if (v68)
        {

        }
        v11 = v114;
      }

      objc_msgSend((id)a1, "errors");
      v37 = objc_claimAutoreleasedReturnValue();
      -[NSObject addObject:](v37, "addObject:", v35);
    }
    v20 = v32;
LABEL_39:

    v12 = v116;
    v16 = &OBJC_IVAR____CDMemoryUsageInterval__startingLifetimeMaxMemoryUsage;
    goto LABEL_40;
  }
LABEL_82:

}

+ (void)_updateEventStatsWithTotal:(uint64_t)a3 transportType:
{
  __CFString *v5;

  objc_opt_self();
  if (_updateEventStatsWithTotal_transportType__syncDownDeletionsCounterInitialized != -1)
    dispatch_once(&_updateEventStatsWithTotal_transportType__syncDownDeletionsCounterInitialized, &__block_literal_global_32_0);
  -[_DKEventStatsCounter incrementCountByNumber:](_updateEventStatsWithTotal_transportType__syncDownDeletionsTotalCounter, a2);
  if (a3 == 1)
    v5 = CFSTR("Rapport");
  else
    v5 = CFSTR("Cloud");
  -[_DKEventTypeStatsCounter incrementCountByNumber:typeValue:](_updateEventStatsWithTotal_transportType__syncDownDeletionsTotalByTransportCounter, a2, v5);
}

- (void)endOperation
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)_DKPerformSyncDownPeerDeletionsOperation;
  -[_DKSyncCompositeOperation endOperation](&v2, sel_endOperation);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highWaterMark, 0);
  objc_storeStrong((id *)&self->_history, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_policy, 0);
  objc_storeStrong((id *)&self->_peer, 0);
  objc_storeStrong((id *)&self->_transport, 0);
  objc_storeStrong((id *)&self->_localStorage, 0);
}

- (void)performSyncDownPeerDeletionsWithPreviousUntilDate:(NSObject *)a3 .cold.2(void *a1, void *a2, NSObject *a3)
{
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t buf[14];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate dk_localtimeString](a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = &stru_1E26E9728;
  OUTLINED_FUNCTION_16_1();
  objc_msgSend((id)OUTLINED_FUNCTION_12_0(), "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_12_0(), "model");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend((id)OUTLINED_FUNCTION_12_0(), "model");
    objc_claimAutoreleasedReturnValue();
    OUTLINED_FUNCTION_56();
    objc_msgSend(v11, "stringWithFormat:", CFSTR(" (%@)"));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  OUTLINED_FUNCTION_18_2();
  v13 = v7;
  OUTLINED_FUNCTION_10_3();
  _os_log_debug_impl(&dword_18DDBE000, a3, OS_LOG_TYPE_DEBUG, "%{public}@: Deletions bookmark %@ is up-to-date for deletions sync down for %{public}@peer %{public}@%{public}@", buf, 0x34u);
  if (v10)
  {

  }
  OUTLINED_FUNCTION_9_1();
}

- (void)performSyncDownPeerDeletionsWithPreviousUntilDate:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, __int128 a11, int a12, __int16 a13, __int16 a14, void *a15, __int128 a16, __int128 a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31)
{
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  __CFString *v40;
  const __CFString *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;

  OUTLINED_FUNCTION_6_0();
  a30 = v31;
  a31 = v32;
  v34 = v33;
  v36 = v35;
  v38 = v37;
  objc_msgSend((id)OUTLINED_FUNCTION_7_3(), "description");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = &stru_1E26E9728;
  if (OUTLINED_FUNCTION_14_2())
    v41 = CFSTR("pseudo ");
  else
    v41 = &stru_1E26E9728;
  objc_msgSend((id)OUTLINED_FUNCTION_11_1(), "identifier");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_11_1(), "model");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    v44 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend((id)OUTLINED_FUNCTION_11_1(), "model");
    objc_claimAutoreleasedReturnValue();
    OUTLINED_FUNCTION_56();
    objc_msgSend(v44, "stringWithFormat:", CFSTR(" (%@)"));
    v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v36, "domain");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v36, "code");
  LODWORD(a11) = 138544898;
  *(_QWORD *)((char *)&a11 + 4) = v39;
  WORD6(a11) = 2114;
  *(_QWORD *)((char *)&a11 + 14) = v41;
  a14 = 2114;
  a15 = v42;
  LOWORD(a16) = 2114;
  *(_QWORD *)((char *)&a16 + 2) = v40;
  WORD5(a16) = 2114;
  *(_QWORD *)((char *)&a16 + 12) = v45;
  WORD2(a17) = 2048;
  *(_QWORD *)((char *)&a17 + 6) = v46;
  HIWORD(a17) = 2112;
  a18 = v36;
  OUTLINED_FUNCTION_17_1(&dword_18DDBE000, v34, v47, "%{public}@: Failed to find last sync down deletions bookmark from %{public}@peer %{public}@%{public}@: %{public}@:%lld (%@)", (uint8_t *)&a11);

  if (v43)
  {

  }
  OUTLINED_FUNCTION_1_0();
}

- (void)performSyncDownPeerDeletionsWithPreviousUntilDate:(uint64_t)a3 .cold.5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, __int128 a11, int a12, __int16 a13, __int16 a14, const __CFString *a15, __int128 a16, __int128 a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31)
{
  void *v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  __CFString *v41;
  const __CFString *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  NSObject *v49;

  OUTLINED_FUNCTION_6_0();
  a30 = v32;
  a31 = v33;
  v49 = v34;
  v36 = v35;
  v38 = v37;
  objc_msgSend((id)OUTLINED_FUNCTION_7_3(), "description");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(v38 + 304), "transportType") == 8)
    v40 = "up to";
  else
    v40 = "down from";
  v41 = &stru_1E26E9728;
  if (OUTLINED_FUNCTION_14_2())
    v42 = CFSTR("pseudo ");
  else
    v42 = &stru_1E26E9728;
  objc_msgSend((id)OUTLINED_FUNCTION_11_1(), "identifier");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_11_1(), "model");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (v44)
  {
    v45 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend((id)OUTLINED_FUNCTION_11_1(), "model");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "stringWithFormat:", CFSTR(" (%@)"));
    v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(v38 + 304), "name");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate dk_localtimeString](v36);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a11) = 138544898;
  *(_QWORD *)((char *)&a11 + 4) = v39;
  WORD6(a11) = 2082;
  *(_QWORD *)((char *)&a11 + 14) = v40;
  a14 = 2114;
  a15 = v42;
  LOWORD(a16) = 2114;
  *(_QWORD *)((char *)&a16 + 2) = v43;
  WORD5(a16) = 2114;
  *(_QWORD *)((char *)&a16 + 12) = v41;
  WORD2(a17) = 2114;
  *(_QWORD *)((char *)&a17 + 6) = v46;
  HIWORD(a17) = 2112;
  a18 = v47;
  OUTLINED_FUNCTION_17_1(&dword_18DDBE000, v49, v48, "%{public}@: Will attempt another deletions sync %{public}s %{public}@peer %{public}@%{public}@ on transport %{public}@ since %@", (uint8_t *)&a11);

  if (v44)
  {

  }
  OUTLINED_FUNCTION_1_0();
}

- (void)handleFetchedDeletedEventIDs:(NSObject *)a3 startDate:endDate:untilDate:.cold.1(void *a1, void *a2, NSObject *a3)
{
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t buf[14];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a2, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = &stru_1E26E9728;
  OUTLINED_FUNCTION_16_1();
  objc_msgSend((id)OUTLINED_FUNCTION_12_0(), "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_12_0(), "model");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend((id)OUTLINED_FUNCTION_12_0(), "model");
    objc_claimAutoreleasedReturnValue();
    OUTLINED_FUNCTION_56();
    objc_msgSend(v11, "stringWithFormat:", CFSTR(" (%@)"));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  OUTLINED_FUNCTION_18_2();
  v13 = v7;
  OUTLINED_FUNCTION_10_3();
  _os_log_error_impl(&dword_18DDBE000, a3, OS_LOG_TYPE_ERROR, "%{public}@: Unable to delete %@ events, missing source device id in peer %{public}@peer %{public}@%{public}@", buf, 0x34u);
  if (v10)
  {

  }
  OUTLINED_FUNCTION_9_1();
}

- (void)handleFetchedDeletedEventIDs:(NSObject *)a3 startDate:endDate:untilDate:.cold.2(uint64_t a1, void *a2, NSObject *a3)
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
  _os_log_error_impl(&dword_18DDBE000, a3, OS_LOG_TYPE_ERROR, "%{public}@: Failed while saving metadata: %{public}@:%lld (%@)", (uint8_t *)&v7, 0x2Au);

}

@end

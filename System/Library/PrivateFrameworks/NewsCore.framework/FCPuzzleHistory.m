@implementation FCPuzzleHistory

void __43__FCPuzzleHistory__allItemsInPuzzleHistory__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[13];
  v3 = v2;
  objc_msgSend(v3, "allValues");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v7, "copy");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __43__FCPuzzleHistory_loadLocalCachesFromStore__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD *v15;
  _QWORD *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  objc_class *v20;
  void *v21;
  NSObject *v22;
  _QWORD v23[5];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    objc_storeStrong((id *)(v3 + 104), v2);

  objc_msgSend(*(id *)(a1 + 32), "localStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if ((objc_msgSend((id)objc_opt_class(), "isLocalStoreKeyInternal:", v10) & 1) == 0)
        {
          objc_opt_class();
          objc_msgSend(v4, "objectForKey:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v12 = v11;
            else
              v12 = 0;
          }
          else
          {
            v12 = 0;
          }
          v13 = v12;

          if (v13)
          {
            v14 = -[FCPuzzleHistoryItem initWithEntryID:dictionaryRepresentation:]([FCPuzzleHistoryItem alloc], v10, v13);
            if (v14)
            {
              v15 = *(_QWORD **)(a1 + 32);
              if (v15)
                v15 = (_QWORD *)v15[13];
              v16 = v15;
              objc_msgSend(v14, "puzzleID");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "setObject:forKey:", v14, v17);

            }
            else
            {
              v22 = FCPuzzleLog;
              if (os_log_type_enabled((os_log_t)FCPuzzleLog, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                v29 = v13;
                _os_log_error_impl(&dword_1A1B90000, v22, OS_LOG_TYPE_ERROR, "FCPuzzleHistory: Failed to load item from cache for %{public}@", buf, 0xCu);
              }
            }

          }
          else
          {
            v18 = (void *)FCPuzzleLog;
            if (os_log_type_enabled((os_log_t)FCPuzzleLog, OS_LOG_TYPE_ERROR))
            {
              v19 = v18;
              v20 = (objc_class *)objc_opt_class();
              NSStringFromClass(v20);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v29 = v21;
              v30 = 2114;
              v31 = v10;
              _os_log_error_impl(&dword_1A1B90000, v19, OS_LOG_TYPE_ERROR, "ERROR: Object of type %@ is not dictionary for key %{public}@", buf, 0x16u);

            }
          }

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v7);
  }

  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __43__FCPuzzleHistory_loadLocalCachesFromStore__block_invoke_30;
  v23[3] = &unk_1E463AB18;
  v23[4] = *(_QWORD *)(a1 + 32);
  +[FCTaskScheduler scheduleLowPriorityBlockForMainThread:](FCTaskScheduler, "scheduleLowPriorityBlockForMainThread:", v23);

}

+ (unint64_t)localStoreVersion
{
  return 1;
}

+ (id)localStoreFilename
{
  return CFSTR("puzzle-history");
}

+ (id)commandStoreFileName
{
  return CFSTR("puzzle-history-commands");
}

+ (int64_t)commandQueueUrgency
{
  return 2;
}

- (void)loadLocalCachesFromStore
{
  FCMTWriterLock *itemsLock;
  _QWORD v3[5];

  if (self)
    itemsLock = self->_itemsLock;
  else
    itemsLock = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __43__FCPuzzleHistory_loadLocalCachesFromStore__block_invoke;
  v3[3] = &unk_1E463AB18;
  v3[4] = self;
  -[FCMTWriterLock performWriteSync:](itemsLock, "performWriteSync:", v3);
}

- (FCPuzzleHistory)initWithContext:(id)a3 pushNotificationCenter:(id)a4 storeDirectory:(id)a5
{
  id v9;
  FCPuzzleHistory *v10;
  FCPuzzleHistory *v11;
  FCMTWriterLock *v12;
  FCMTWriterLock *itemsLock;
  uint64_t v14;
  NSMutableDictionary *itemsByPuzzleID;
  objc_super v17;

  v9 = a3;
  v17.receiver = self;
  v17.super_class = (Class)FCPuzzleHistory;
  v10 = -[FCPrivateDataController initWithContext:pushNotificationCenter:storeDirectory:](&v17, sel_initWithContext_pushNotificationCenter_storeDirectory_, v9, a4, a5);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_cloudContext, a3);
    v12 = objc_alloc_init(FCMTWriterLock);
    itemsLock = v11->_itemsLock;
    v11->_itemsLock = v12;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v14 = objc_claimAutoreleasedReturnValue();
    itemsByPuzzleID = v11->_itemsByPuzzleID;
    v11->_itemsByPuzzleID = (NSMutableDictionary *)v14;

  }
  return v11;
}

- (void)addObserver:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FCPuzzleHistory;
  -[FCPrivateDataController addObserver:](&v3, sel_addObserver_, a3);
}

- (id)sortedPuzzleIDsForPuzzleTypeID:(id)a3 sinceLastPlayedDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  -[FCPuzzleHistory _allSortedItemsInPuzzleHistory]((id *)&self->super.super.isa);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __70__FCPuzzleHistory_sortedPuzzleIDsForPuzzleTypeID_sinceLastPlayedDate___block_invoke;
  v13[3] = &unk_1E464B090;
  v14 = v6;
  v15 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "fc_arrayByTransformingWithBlock:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_allSortedItemsInPuzzleHistory
{
  void *v1;
  void *v2;

  if (a1)
  {
    -[FCPuzzleHistory _allItemsInPuzzleHistory](a1);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "sortedArrayUsingComparator:", &__block_literal_global_44_7);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)_allItemsInPuzzleHistory
{
  id *v1;
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v1 = a1;
  if (a1)
  {
    v5 = 0;
    v6 = &v5;
    v7 = 0x3032000000;
    v8 = __Block_byref_object_copy__84;
    v9 = __Block_byref_object_dispose__84;
    v10 = 0;
    v2 = a1[15];
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __43__FCPuzzleHistory__allItemsInPuzzleHistory__block_invoke;
    v4[3] = &unk_1E463AD80;
    v4[4] = v1;
    v4[5] = &v5;
    objc_msgSend(v2, "performReadSync:", v4);

    v1 = (id *)(id)v6[5];
    _Block_object_dispose(&v5, 8);

  }
  return v1;
}

- (BOOL)isPuzzleHistoryEmpty
{
  return -[NSMutableDictionary count](self->_itemsByPuzzleID, "count") == 0;
}

- (BOOL)isPuzzleInPuzzleHistory:(id)a3
{
  void *v3;
  BOOL v4;

  -[FCPuzzleHistory _puzzleHistoryItemForPuzzleID:]((id *)&self->super.super.isa, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)_puzzleHistoryItemForPuzzleID:(id *)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__84;
    v15 = __Block_byref_object_dispose__84;
    v16 = 0;
    if (v3)
    {
      v5 = a1[15];
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __49__FCPuzzleHistory__puzzleHistoryItemForPuzzleID___block_invoke;
      v8[3] = &unk_1E463AD58;
      v10 = &v11;
      v8[4] = a1;
      v9 = v4;
      objc_msgSend(v5, "performReadSync:", v8);

      v6 = (void *)v12[5];
    }
    else
    {
      v6 = 0;
    }
    a1 = v6;
    _Block_object_dispose(&v11, 8);

  }
  return a1;
}

- (id)puzzleHistoryItemForPuzzleID:(id)a3
{
  return -[FCPuzzleHistory _puzzleHistoryItemForPuzzleID:]((id *)&self->super.super.isa, a3);
}

- (void)addPuzzleToPuzzleHistory:(id)a3 puzzleTypeID:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;

  v6 = (void *)MEMORY[0x1E0C99D68];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCPuzzleHistory _updatePuzzle:puzzleTypeID:progressData:progressLevel:score:rankID:usedReveal:playDuration:lastPlayedDate:completedDate:difficulty:publishDate:behaviorFlags:]((uint64_t)self, v8, v7, 0, 0, 0, 0, 0, 0, v9, 0, 0, 0, 0);

}

- (void)_updatePuzzle:(void *)a3 puzzleTypeID:(void *)a4 progressData:(void *)a5 progressLevel:(void *)a6 score:(void *)a7 rankID:(unsigned int)a8 usedReveal:(void *)a9 playDuration:(void *)a10 lastPlayedDate:(void *)a11 completedDate:(void *)a12 difficulty:(void *)a13 publishDate:(void *)a14 behaviorFlags:
{
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  id v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  id v53;
  uint64_t v54;
  void *v55;
  void *v56;
  id v57;
  int v58;
  uint64_t v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  id v64;
  id v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  FCPuzzleHistoryItem *v72;
  void *v73;
  FCPuzzleHistoryItem *v74;
  void *v75;
  void *v76;
  FCPuzzleHistoryItem *v77;
  id v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  FCModifyPuzzleHistoryCommand *v86;
  void *v87;
  FCModifyPuzzleHistoryCommand *v88;
  id v89;
  id v90;
  void *v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  void *v97;
  id v98;
  id v99;
  id v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  id v106;
  void *v107;
  void *v108;
  void *v109;
  void *v111;
  _QWORD *v112;
  void *v113;
  id v114;
  id v115;
  id v116;
  id v117;
  _QWORD v118[5];
  FCPuzzleHistoryItem *v119;
  id v120;
  FCPuzzleHistoryItem *v121;
  id v122;
  id v123;
  uint8_t buf[4];
  const char *v125;
  __int16 v126;
  char *v127;
  __int16 v128;
  int v129;
  __int16 v130;
  void *v131;
  uint64_t v132;

  v132 = *MEMORY[0x1E0C80C00];
  v20 = a2;
  v117 = a3;
  v116 = a4;
  v21 = a5;
  v22 = a6;
  v23 = a7;
  v24 = v21;
  v115 = a9;
  v25 = a10;
  v26 = a11;
  v27 = a12;
  v28 = a13;
  v114 = a14;
  v112 = (_QWORD *)a1;
  if (!a1)
    goto LABEL_76;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (v20)
  {
    objc_msgSend(*(id *)(a1 + 104), "objectForKey:", v20);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v117)
    {
      v31 = v117;
    }
    else
    {
      objc_msgSend(v29, "puzzleTypeID");
      v31 = (id)objc_claimAutoreleasedReturnValue();
    }
    v108 = v31;
    if (v116)
    {
      v35 = v116;
    }
    else
    {
      objc_msgSend(v30, "progressData");
      v35 = (id)objc_claimAutoreleasedReturnValue();
    }
    v107 = v35;
    v98 = v28;
    if (v24)
    {
      v106 = v24;
      if (v22)
      {
LABEL_13:
        v36 = v22;
        goto LABEL_18;
      }
    }
    else
    {
      v37 = v25;
      v38 = v23;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v30, "progressLevel"));
      v39 = objc_claimAutoreleasedReturnValue();
      v40 = (void *)v39;
      v41 = &unk_1E470B498;
      if (v39)
        v41 = (void *)v39;
      v106 = v41;

      v23 = v38;
      v25 = v37;
      if (v22)
        goto LABEL_13;
    }
    objc_msgSend(v30, "score");
    v36 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:
    v99 = v36;
    v95 = v23;
    if (v23)
    {
      v42 = v23;
    }
    else
    {
      objc_msgSend(v30, "rankID");
      v42 = (id)objc_claimAutoreleasedReturnValue();
    }
    v105 = v42;
    objc_msgSend(v30, "usedReveal");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v43, "BOOLValue") & 1) != 0)
      objc_msgSend(v30, "usedReveal");
    else
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a8);
    v101 = (void *)objc_claimAutoreleasedReturnValue();

    if (v115)
    {
      v44 = v115;
      if (v25)
        goto LABEL_26;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v30, "playDuration"));
      v46 = objc_claimAutoreleasedReturnValue();
      v47 = (void *)v46;
      v48 = &unk_1E470B498;
      if (v46)
        v48 = (void *)v46;
      v44 = v48;

      if (v25)
      {
LABEL_26:
        v100 = v25;
        if (v27)
        {
LABEL_27:
          v45 = v27;
          goto LABEL_36;
        }
LABEL_35:
        objc_msgSend(v30, "difficulty");
        v45 = (id)objc_claimAutoreleasedReturnValue();
LABEL_36:
        v104 = v45;
        if (v28)
        {
          v52 = v28;
        }
        else
        {
          objc_msgSend(v30, "publishDate");
          v52 = (id)objc_claimAutoreleasedReturnValue();
        }
        v103 = v52;
        if (v114)
        {
          v53 = v114;
        }
        else
        {
          objc_msgSend(v30, "behaviorFlags");
          v53 = (id)objc_claimAutoreleasedReturnValue();
        }
        v102 = v53;
        v111 = v44;
        v92 = v27;
        if (v26)
        {
          objc_msgSend(v30, "completedDate");
          v54 = objc_claimAutoreleasedReturnValue();
          v55 = (void *)v54;
          if (v54)
            v56 = (void *)v54;
          else
            v56 = v26;
          v57 = v56;

        }
        else
        {
          v57 = 0;
        }
        v58 = objc_msgSend(v101, "BOOLValue");
        objc_msgSend(v30, "firstCompletedDate");
        v59 = objc_claimAutoreleasedReturnValue();
        v60 = (void *)v59;
        v96 = v22;
        v97 = v24;
        if (v58)
        {
          objc_msgSend(v30, "firstPlayDuration");
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_63;
        }
        if (v59)
          v61 = (void *)v59;
        else
          v61 = v57;
        v62 = v61;

        objc_msgSend(v30, "firstPlayDuration");
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        if (v62 && v57 && objc_msgSend(v62, "isEqualToDate:", v57))
        {
          objc_msgSend(v30, "firstPlayDuration");
          v63 = (void *)objc_claimAutoreleasedReturnValue();

          if (v63)
          {
            objc_msgSend(v30, "firstPlayDuration");
            v64 = (id)objc_claimAutoreleasedReturnValue();
LABEL_60:
            v65 = v64;

            v60 = v62;
            v113 = v65;
            goto LABEL_63;
          }
          if (objc_msgSend(v111, "integerValue") >= 1)
          {
            v64 = v111;
            goto LABEL_60;
          }

          v113 = 0;
        }
        v60 = v62;
LABEL_63:
        v109 = v57;
        v66 = v20;
        v93 = v26;
        v94 = v25;
        objc_msgSend(v30, "bestScore");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = v67;
        v69 = v99;
        v70 = v99;
        if (v67)
        {
          v70 = v67;
          if (v99)
          {
            if (objc_msgSend(v67, "compare:", v99) == 1)
              v70 = v68;
            else
              v70 = v99;
          }
        }
        v71 = v70;
        v72 = [FCPuzzleHistoryItem alloc];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ph-%@"), v66);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v89 = v71;
        v91 = v71;
        v20 = v66;
        v74 = -[FCPuzzleHistoryItem initWithEntryID:puzzleID:puzzleTypeID:progressData:progressLevel:score:rankID:usedReveal:playDuration:lastPlayedDate:completedDate:firstCompletedDate:firstPlayDuration:bestScore:difficulty:publishDate:behaviorFlags:](v72, "initWithEntryID:puzzleID:puzzleTypeID:progressData:progressLevel:score:rankID:usedReveal:playDuration:lastPlayedDate:completedDate:firstCompletedDate:firstPlayDuration:bestScore:difficulty:publishDate:behaviorFlags:", v73, v66, v108, v107, (int)objc_msgSend(v106, "intValue"), v99, v105, v101, (int)objc_msgSend(v111, "intValue"), v100, v57, v60, v113, v89, v104, v103,
                v102);

        if (v74)
        {
          -[FCPuzzleHistoryItem dictionaryRepresentation](v74);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          v76 = (void *)v112[15];
          v118[0] = MEMORY[0x1E0C809B0];
          v118[1] = 3221225472;
          v118[2] = __176__FCPuzzleHistory__updatePuzzle_puzzleTypeID_progressData_progressLevel_score_rankID_usedReveal_playDuration_lastPlayedDate_completedDate_difficulty_publishDate_behaviorFlags___block_invoke;
          v118[3] = &unk_1E463B228;
          v118[4] = v112;
          v77 = v74;
          v119 = v77;
          v90 = v20;
          v78 = v20;
          v120 = v78;
          objc_msgSend(v76, "performWriteSync:", v118);
          objc_msgSend(v112, "localStore");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          -[FCPuzzleHistoryItem identifier](v77, "identifier");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "setObject:forKey:", v75, v80);

          if (v30)
          {
            v123 = v78;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v123, 1);
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            v82 = (void *)MEMORY[0x1E0C9AA60];
            v83 = v112;
            v84 = v81;
          }
          else
          {
            v122 = v78;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v122, 1);
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            v84 = (void *)MEMORY[0x1E0C9AA60];
            v83 = v112;
            v82 = v81;
          }
          -[FCPuzzleHistory _addedPuzzleIDs:modifiedPuzzleIDs:removedPuzzleIDs:](v83, v82, v84, MEMORY[0x1E0C9AA60]);

          v86 = [FCModifyPuzzleHistoryCommand alloc];
          v121 = v77;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v121, 1);
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          v88 = -[FCModifyPuzzleHistoryCommand initWithPuzzleHistoryItems:merge:](v86, "initWithPuzzleHistoryItems:merge:", v87, 0);

          objc_msgSend(v112, "addCommandToCommandQueue:", v88);
          v20 = v90;
          v69 = v99;
        }
        else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          v85 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "updatedItem");
          *(_DWORD *)buf = 136315906;
          v125 = "-[FCPuzzleHistory _updatePuzzle:puzzleTypeID:progressData:progressLevel:score:rankID:usedReveal:playDur"
                 "ation:lastPlayedDate:completedDate:difficulty:publishDate:behaviorFlags:]";
          v126 = 2080;
          v127 = "FCPuzzleHistory.m";
          v128 = 1024;
          v129 = 398;
          v130 = 2114;
          v131 = v85;
          _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

        }
        v22 = v96;
        v24 = v97;
        v25 = v94;
        v23 = v95;
        v27 = v92;
        v26 = v93;
        v28 = v98;
        goto LABEL_76;
      }
    }
    objc_msgSend(v30, "lastPlayedDate");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v49;
    if (v49)
    {
      v51 = v49;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v51 = (id)objc_claimAutoreleasedReturnValue();
    }
    v100 = v51;

    if (v27)
      goto LABEL_27;
    goto LABEL_35;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v32 = v25;
    v33 = v23;
    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "puzzleID != nil");
    *(_DWORD *)buf = 136315906;
    v125 = "-[FCPuzzleHistory _updatePuzzle:puzzleTypeID:progressData:progressLevel:score:rankID:usedReveal:playDuration:"
           "lastPlayedDate:completedDate:difficulty:publishDate:behaviorFlags:]";
    v126 = 2080;
    v127 = "FCPuzzleHistory.m";
    v128 = 1024;
    v129 = 311;
    v130 = 2114;
    v131 = v34;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    v23 = v33;
    v25 = v32;
  }
LABEL_76:

}

- (void)updatePuzzle:(id)a3 puzzleTypeID:(id)a4 progressData:(id)a5 progressLevel:(int64_t)a6 score:(id)a7 rankID:(id)a8 usedReveal:(BOOL)a9 playDuration:(int64_t)a10 isSolved:(BOOL)a11 difficulty:(id)a12 publishDate:(id)a13 behaviorFlags:(id)a14
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v31;
  id v32;

  v32 = a3;
  v31 = a4;
  v19 = a5;
  v20 = a7;
  v21 = a8;
  v22 = a12;
  v23 = a13;
  v24 = a14;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a6);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a10);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (a11)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPuzzleHistory _updatePuzzle:puzzleTypeID:progressData:progressLevel:score:rankID:usedReveal:playDuration:lastPlayedDate:completedDate:difficulty:publishDate:behaviorFlags:]((uint64_t)self, v32, v31, v19, v25, v20, v21, a9, v26, v28, v29, v22, v23, v24);

  }
  else
  {
    -[FCPuzzleHistory _updatePuzzle:puzzleTypeID:progressData:progressLevel:score:rankID:usedReveal:playDuration:lastPlayedDate:completedDate:difficulty:publishDate:behaviorFlags:]((uint64_t)self, v32, v31, v19, v25, v20, v21, a9, v26, v27, 0, v22, v23, v24);
  }

}

- (void)removePuzzleFromPuzzleHistory:(id)a3
{
  id v4;
  NSMutableDictionary *itemsByPuzzleID;
  NSMutableDictionary *v6;
  void *v7;
  FCMTWriterLock *itemsLock;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  FCRemoveFromPuzzleHistoryCommand *v21;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[5];
  id v29;
  void *v30;
  uint8_t v31[128];
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  char *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (v4)
  {
    if (self)
      itemsByPuzzleID = self->_itemsByPuzzleID;
    else
      itemsByPuzzleID = 0;
    v6 = itemsByPuzzleID;
    -[NSMutableDictionary objectForKey:](v6, "objectForKey:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      if (self)
        itemsLock = self->_itemsLock;
      else
        itemsLock = 0;
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __49__FCPuzzleHistory_removePuzzleFromPuzzleHistory___block_invoke;
      v28[3] = &unk_1E463AD10;
      v28[4] = self;
      v23 = v4;
      v29 = v4;
      -[FCMTWriterLock performWriteSync:](itemsLock, "performWriteSync:", v28);
      objc_msgSend(v7, "identifier");
      v9 = objc_claimAutoreleasedReturnValue();
      -[FCPrivateDataController localStore](self, "localStore");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeObjectForKey:", v9);

      v22 = (void *)v9;
      v21 = -[FCRemoveFromPuzzleHistoryCommand initWithEntryID:]([FCRemoveFromPuzzleHistoryCommand alloc], "initWithEntryID:", v9);
      -[FCPrivateDataController addCommandToCommandQueue:](self, "addCommandToCommandQueue:");
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      -[FCPrivateDataController observers](self, "observers");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v11, "copy");

      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v25;
        v16 = MEMORY[0x1E0C9AA60];
        do
        {
          v17 = 0;
          do
          {
            if (*(_QWORD *)v25 != v15)
              objc_enumerationMutation(v12);
            v18 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v17);
            v30 = v7;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "puzzleHistory:didAddPuzzleItems:modifiedPuzzleItems:removedPuzzleItems:", self, v16, v16, v19);

            ++v17;
          }
          while (v14 != v17);
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
        }
        while (v14);
      }

      v4 = v23;
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "item");
      *(_DWORD *)buf = 136315906;
      v33 = "-[FCPuzzleHistory removePuzzleFromPuzzleHistory:]";
      v34 = 2080;
      v35 = "FCPuzzleHistory.m";
      v36 = 1024;
      v37 = 151;
      v38 = 2114;
      v39 = v20;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    goto LABEL_19;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "puzzleID != nil");
    *(_DWORD *)buf = 136315906;
    v33 = "-[FCPuzzleHistory removePuzzleFromPuzzleHistory:]";
    v34 = 2080;
    v35 = "FCPuzzleHistory.m";
    v36 = 1024;
    v37 = 147;
    v38 = 2114;
    v39 = v7;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
LABEL_19:

  }
}

uint64_t __49__FCPuzzleHistory_removePuzzleFromPuzzleHistory___block_invoke(uint64_t a1)
{
  _QWORD *v1;

  v1 = *(_QWORD **)(a1 + 32);
  if (v1)
    v1 = (_QWORD *)v1[13];
  return objc_msgSend(v1, "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

- (void)setFirstCompletedDate:(id)a3 forPuzzleID:(id)a4 puzzleTypeID:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSMutableDictionary *itemsByPuzzleID;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  FCPuzzleHistoryItem *v19;
  FCPuzzleHistoryItem *v20;
  FCPuzzleHistoryItem *v21;
  void *v22;
  FCMTWriterLock *itemsLock;
  void *v24;
  FCPuzzleHistoryItem *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  FCPuzzleHistory *v31;
  void *v32;
  void *v33;
  FCModifyPuzzleHistoryCommand *v34;
  void *v35;
  FCModifyPuzzleHistoryCommand *v36;
  void *v37;
  void *v38;
  FCPuzzleHistory *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  FCPuzzleHistoryItem *v49;
  void *v50;
  id v51;
  id v52;
  _QWORD v53[5];
  FCPuzzleHistoryItem *v54;
  id v55;
  FCPuzzleHistoryItem *v56;
  id v57;
  id v58;
  uint8_t buf[4];
  const char *v60;
  __int16 v61;
  char *v62;
  __int16 v63;
  int v64;
  __int16 v65;
  void *v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (!v9 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "puzzleID != nil");
    *(_DWORD *)buf = 136315906;
    v60 = "-[FCPuzzleHistory setFirstCompletedDate:forPuzzleID:puzzleTypeID:]";
    v61 = 2080;
    v62 = "FCPuzzleHistory.m";
    v63 = 1024;
    v64 = 181;
    v65 = 2114;
    v66 = v37;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v10)
      goto LABEL_6;
  }
  else if (v10)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "puzzleTypeID != nil");
    *(_DWORD *)buf = 136315906;
    v60 = "-[FCPuzzleHistory setFirstCompletedDate:forPuzzleID:puzzleTypeID:]";
    v61 = 2080;
    v62 = "FCPuzzleHistory.m";
    v63 = 1024;
    v64 = 182;
    v65 = 2114;
    v66 = v38;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  if (v9)
  {
    v51 = v10;
    v52 = v8;
    v39 = self;
    if (self)
      itemsByPuzzleID = self->_itemsByPuzzleID;
    else
      itemsByPuzzleID = 0;
    -[NSMutableDictionary objectForKey:](itemsByPuzzleID, "objectForKey:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = [FCPuzzleHistoryItem alloc];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ph-%@"), v9);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "progressData");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v12, "progressLevel");
    objc_msgSend(v12, "score");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "rankID");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "usedReveal");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v12, "playDuration");
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "completedDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstPlayDuration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bestScore");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "difficulty");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "publishDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v12;
    objc_msgSend(v12, "behaviorFlags");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v49;
    v50 = v9;
    v20 = -[FCPuzzleHistoryItem initWithEntryID:puzzleID:puzzleTypeID:progressData:progressLevel:score:rankID:usedReveal:playDuration:lastPlayedDate:completedDate:firstCompletedDate:firstPlayDuration:bestScore:difficulty:publishDate:behaviorFlags:](v19, "initWithEntryID:puzzleID:puzzleTypeID:progressData:progressLevel:score:rankID:usedReveal:playDuration:lastPlayedDate:completedDate:firstCompletedDate:firstPlayDuration:bestScore:difficulty:publishDate:behaviorFlags:", v48, v9, v51, v47, v46, v45, v43, v42, v44, v41, v13, v8, v14, v15, v16, v17,
            v18);

    v21 = v20;
    if (v20)
    {
      -[FCPuzzleHistoryItem dictionaryRepresentation](v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v39)
        itemsLock = v39->_itemsLock;
      else
        itemsLock = 0;
      v9 = v50;
      v10 = v51;
      v24 = v40;
      v53[0] = MEMORY[0x1E0C809B0];
      v53[1] = 3221225472;
      v53[2] = __66__FCPuzzleHistory_setFirstCompletedDate_forPuzzleID_puzzleTypeID___block_invoke;
      v53[3] = &unk_1E463B228;
      v53[4] = v39;
      v25 = v21;
      v54 = v25;
      v26 = v50;
      v55 = v26;
      -[FCMTWriterLock performWriteSync:](itemsLock, "performWriteSync:", v53);
      -[FCPrivateDataController localStore](v39, "localStore");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCPuzzleHistoryItem identifier](v25, "identifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setObject:forKey:", v22, v28);

      if (v40)
      {
        v58 = v26;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v58, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (void *)MEMORY[0x1E0C9AA60];
        v31 = v39;
        v32 = v29;
      }
      else
      {
        v57 = v26;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v57, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = (void *)MEMORY[0x1E0C9AA60];
        v31 = v39;
        v30 = v29;
      }
      -[FCPuzzleHistory _addedPuzzleIDs:modifiedPuzzleIDs:removedPuzzleIDs:](v31, v30, v32, MEMORY[0x1E0C9AA60]);
      v8 = v52;

      v34 = [FCModifyPuzzleHistoryCommand alloc];
      v56 = v25;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v56, 1);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = -[FCModifyPuzzleHistoryCommand initWithPuzzleHistoryItems:merge:](v34, "initWithPuzzleHistoryItems:merge:", v35, 0);

      -[FCPrivateDataController addCommandToCommandQueue:](v39, "addCommandToCommandQueue:", v36);
    }
    else
    {
      v10 = v51;
      v9 = v50;
      v24 = v40;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "updatedItem");
        *(_DWORD *)buf = 136315906;
        v60 = "-[FCPuzzleHistory setFirstCompletedDate:forPuzzleID:puzzleTypeID:]";
        v61 = 2080;
        v62 = "FCPuzzleHistory.m";
        v63 = 1024;
        v64 = 207;
        v65 = 2114;
        v66 = v33;
        _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      }
    }

  }
}

uint64_t __66__FCPuzzleHistory_setFirstCompletedDate_forPuzzleID_puzzleTypeID___block_invoke(_QWORD *a1)
{
  _QWORD *v1;

  v1 = (_QWORD *)a1[4];
  if (v1)
    v1 = (_QWORD *)v1[13];
  return objc_msgSend(v1, "setObject:forKey:", a1[5], a1[6]);
}

- (void)_addedPuzzleIDs:(void *)a3 modifiedPuzzleIDs:(void *)a4 removedPuzzleIDs:
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[5];
  _QWORD v31[5];
  _QWORD v32[5];
  uint8_t v33[128];
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  char *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (!a1)
    goto LABEL_18;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (!v7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "addedPuzzleIDs");
    *(_DWORD *)buf = 136315906;
    v35 = "-[FCPuzzleHistory _addedPuzzleIDs:modifiedPuzzleIDs:removedPuzzleIDs:]";
    v36 = 2080;
    v37 = "FCPuzzleHistory.m";
    v38 = 1024;
    v39 = 851;
    v40 = 2114;
    v41 = v22;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (!v8)
    {
LABEL_5:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "modifiedPuzzleIDs");
        *(_DWORD *)buf = 136315906;
        v35 = "-[FCPuzzleHistory _addedPuzzleIDs:modifiedPuzzleIDs:removedPuzzleIDs:]";
        v36 = 2080;
        v37 = "FCPuzzleHistory.m";
        v38 = 1024;
        v39 = 852;
        v40 = 2114;
        v41 = v23;
        _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      }
    }
  }
  else if (!v8)
  {
    goto LABEL_5;
  }
  if (!v9 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "removedPuzzleIDs");
    *(_DWORD *)buf = 136315906;
    v35 = "-[FCPuzzleHistory _addedPuzzleIDs:modifiedPuzzleIDs:removedPuzzleIDs:]";
    v36 = 2080;
    v37 = "FCPuzzleHistory.m";
    v38 = 1024;
    v39 = 853;
    v40 = 2114;
    v41 = v24;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v10 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __70__FCPuzzleHistory__addedPuzzleIDs_modifiedPuzzleIDs_removedPuzzleIDs___block_invoke;
  v32[3] = &unk_1E463C7F0;
  v32[4] = a1;
  v25 = v7;
  objc_msgSend(v7, "fc_arrayByTransformingWithBlock:", v32);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v10;
  v31[1] = 3221225472;
  v31[2] = __70__FCPuzzleHistory__addedPuzzleIDs_modifiedPuzzleIDs_removedPuzzleIDs___block_invoke_2;
  v31[3] = &unk_1E463C7F0;
  v31[4] = a1;
  v12 = v8;
  objc_msgSend(v8, "fc_arrayByTransformingWithBlock:", v31);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v10;
  v30[1] = 3221225472;
  v30[2] = __70__FCPuzzleHistory__addedPuzzleIDs_modifiedPuzzleIDs_removedPuzzleIDs___block_invoke_3;
  v30[3] = &unk_1E463C7F0;
  v30[4] = a1;
  v14 = v9;
  objc_msgSend(v9, "fc_arrayByTransformingWithBlock:", v30);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(a1, "observers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "copy");

  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v27;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v27 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v21++), "puzzleHistory:didAddPuzzleItems:modifiedPuzzleItems:removedPuzzleItems:", a1, v11, v13, v15);
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
    }
    while (v19);
  }

  v7 = v25;
  v8 = v12;
  v9 = v14;
LABEL_18:

}

- (void)updatePuzzle:(id)a3 difficulty:(id)a4 publishDate:(id)a5 behaviorFlags:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSMutableDictionary *itemsByPuzzleID;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  FCPuzzleHistoryItem *v22;
  void *v23;
  FCMTWriterLock *itemsLock;
  FCPuzzleHistoryItem *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  FCModifyPuzzleHistoryCommand *v30;
  void *v31;
  FCModifyPuzzleHistoryCommand *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  FCPuzzleHistory *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  FCPuzzleHistoryItem *v47;
  void *v48;
  _QWORD v49[5];
  FCPuzzleHistoryItem *v50;
  id v51;
  FCPuzzleHistoryItem *v52;
  id v53;
  uint8_t buf[4];
  const char *v55;
  __int16 v56;
  char *v57;
  __int16 v58;
  int v59;
  __int16 v60;
  void *v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (v10)
  {
    if (self)
      itemsByPuzzleID = self->_itemsByPuzzleID;
    else
      itemsByPuzzleID = 0;
    -[NSMutableDictionary objectForKey:](itemsByPuzzleID, "objectForKey:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v36 = self;
      v47 = [FCPuzzleHistoryItem alloc];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ph-%@"), v10);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "puzzleTypeID");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "progressData");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v15, "progressLevel");
      objc_msgSend(v15, "score");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "rankID");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "usedReveal");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v15, "playDuration");
      objc_msgSend(v15, "lastPlayedDate");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "completedDate");
      v16 = v12;
      v17 = v15;
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "firstCompletedDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "firstPlayDuration");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v17;
      objc_msgSend(v17, "bestScore");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = v16;
      v22 = -[FCPuzzleHistoryItem initWithEntryID:puzzleID:puzzleTypeID:progressData:progressLevel:score:rankID:usedReveal:playDuration:lastPlayedDate:completedDate:firstCompletedDate:firstPlayDuration:bestScore:difficulty:publishDate:behaviorFlags:](v47, "initWithEntryID:puzzleID:puzzleTypeID:progressData:progressLevel:score:rankID:usedReveal:playDuration:lastPlayedDate:completedDate:firstCompletedDate:firstPlayDuration:bestScore:difficulty:publishDate:behaviorFlags:", v46, v10, v45, v44, v43, v42, v39, v40, v38, v37, v18, v19, v20, v21, v11, v16,
              v13);

      if (v22)
      {
        -[FCPuzzleHistoryItem dictionaryRepresentation](v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v36)
          itemsLock = v36->_itemsLock;
        else
          itemsLock = 0;
        v15 = v41;
        v49[0] = MEMORY[0x1E0C809B0];
        v49[1] = 3221225472;
        v49[2] = __69__FCPuzzleHistory_updatePuzzle_difficulty_publishDate_behaviorFlags___block_invoke;
        v49[3] = &unk_1E463B228;
        v49[4] = v36;
        v25 = v22;
        v50 = v25;
        v26 = v10;
        v51 = v26;
        -[FCMTWriterLock performWriteSync:](itemsLock, "performWriteSync:", v49);
        -[FCPrivateDataController localStore](v36, "localStore");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[FCPuzzleHistoryItem identifier](v25, "identifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setObject:forKey:", v23, v28);

        v53 = v26;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v53, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[FCPuzzleHistory _addedPuzzleIDs:modifiedPuzzleIDs:removedPuzzleIDs:](v36, MEMORY[0x1E0C9AA60], v29, MEMORY[0x1E0C9AA60]);

        v30 = [FCModifyPuzzleHistoryCommand alloc];
        v52 = v25;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v52, 1);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = -[FCModifyPuzzleHistoryCommand initWithPuzzleHistoryItems:merge:](v30, "initWithPuzzleHistoryItems:merge:", v31, 0);

        -[FCPrivateDataController addCommandToCommandQueue:](v36, "addCommandToCommandQueue:", v32);
        v12 = v48;
      }
      else
      {
        v12 = v48;
        v15 = v41;
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "updatedItem");
          *(_DWORD *)buf = 136315906;
          v55 = "-[FCPuzzleHistory updatePuzzle:difficulty:publishDate:behaviorFlags:]";
          v56 = 2080;
          v57 = "FCPuzzleHistory.m";
          v58 = 1024;
          v59 = 270;
          v60 = 2114;
          v61 = v35;
          _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

        }
      }

    }
    else
    {
      v34 = FCPuzzleLog;
      if (os_log_type_enabled((os_log_t)FCPuzzleLog, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v55 = (const char *)v10;
        _os_log_error_impl(&dword_1A1B90000, v34, OS_LOG_TYPE_ERROR, "FCPuzzleHistory: Failed to update stats info: history item for %{public}@ not found", buf, 0xCu);
      }
    }

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "puzzleID != nil");
    *(_DWORD *)buf = 136315906;
    v55 = "-[FCPuzzleHistory updatePuzzle:difficulty:publishDate:behaviorFlags:]";
    v56 = 2080;
    v57 = "FCPuzzleHistory.m";
    v58 = 1024;
    v59 = 239;
    v60 = 2114;
    v61 = v33;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
}

uint64_t __69__FCPuzzleHistory_updatePuzzle_difficulty_publishDate_behaviorFlags___block_invoke(_QWORD *a1)
{
  _QWORD *v1;

  v1 = (_QWORD *)a1[4];
  if (v1)
    v1 = (_QWORD *)v1[13];
  return objc_msgSend(v1, "setObject:forKey:", a1[5], a1[6]);
}

uint64_t __176__FCPuzzleHistory__updatePuzzle_puzzleTypeID_progressData_progressLevel_score_rankID_usedReveal_playDuration_lastPlayedDate_completedDate_difficulty_publishDate_behaviorFlags___block_invoke(_QWORD *a1)
{
  _QWORD *v1;

  v1 = (_QWORD *)a1[4];
  if (v1)
    v1 = (_QWORD *)v1[13];
  return objc_msgSend(v1, "setObject:forKey:", a1[5], a1[6]);
}

- (id)datePuzzleWasLastPlayed:(id)a3
{
  void *v3;
  void *v4;

  -[FCPuzzleHistory _puzzleHistoryItemForPuzzleID:]((id *)&self->super.super.isa, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastPlayedDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)allSortedPuzzleIDsSinceLastPlayedDate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[FCPuzzleHistory _allSortedItemsInPuzzleHistory]((id *)&self->super.super.isa);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__FCPuzzleHistory_allSortedPuzzleIDsSinceLastPlayedDate___block_invoke;
  v9[3] = &unk_1E464B068;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "fc_arrayByTransformingWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __57__FCPuzzleHistory_allSortedPuzzleIDsSinceLastPlayedDate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  objc_msgSend(v3, "lastPlayedDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a1) = objc_msgSend(v4, "fc_isLaterThan:", *(_QWORD *)(a1 + 32));

  if ((_DWORD)a1)
  {
    objc_msgSend(v3, "puzzleID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id __70__FCPuzzleHistory_sortedPuzzleIDsForPuzzleTypeID_sinceLastPlayedDate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;

  v3 = a2;
  objc_msgSend(v3, "puzzleTypeID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {

    goto LABEL_5;
  }
  objc_msgSend(v3, "lastPlayedDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "fc_isLaterThan:", *(_QWORD *)(a1 + 40));

  if (!v6)
  {
LABEL_5:
    v7 = 0;
    goto LABEL_6;
  }
  objc_msgSend(v3, "puzzleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v7;
}

- (BOOL)hasPuzzleBeenCompleted:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  -[FCPuzzleHistory _puzzleHistoryItemForPuzzleID:]((id *)&self->super.super.isa, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "completedDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (BOOL)hasPuzzleEverBeenCompleted:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;

  -[FCPuzzleHistory _puzzleHistoryItemForPuzzleID:]((id *)&self->super.super.isa, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "completedDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "firstCompletedDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v6 != 0;

  }
  return v5;
}

- (void)removeObserver:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FCPuzzleHistory;
  -[FCPrivateDataController removeObserver:](&v3, sel_removeObserver_, a3);
}

uint64_t __43__FCPuzzleHistory_loadLocalCachesFromStore__block_invoke_30(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  v2 = FCPuzzleLog;
  if (os_log_type_enabled((os_log_t)FCPuzzleLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_DEFAULT, "FCPuzzleHistory: Forcing CK sync", v4, 2u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "forceSyncWithCompletion:", 0);
}

- (void)handleSyncWithChangedRecords:(id)a3 deletedRecordNames:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  FCMTWriterLock *itemsLock;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  FCPuzzleHistory *v23;
  id v24;
  id v25;
  id v26;
  id v27;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  -[FCPrivateDataController localStore](self, "localStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_opt_new();
  v10 = (void *)objc_opt_new();
  v11 = (void *)objc_opt_new();
  v12 = v11;
  if (self)
    itemsLock = self->_itemsLock;
  else
    itemsLock = 0;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __67__FCPuzzleHistory_handleSyncWithChangedRecords_deletedRecordNames___block_invoke;
  v20[3] = &unk_1E463BA00;
  v21 = v6;
  v22 = v8;
  v23 = self;
  v24 = v9;
  v25 = v11;
  v26 = v7;
  v27 = v10;
  v14 = v10;
  v15 = v7;
  v16 = v12;
  v17 = v9;
  v18 = v8;
  v19 = v6;
  -[FCMTWriterLock performWriteSync:](itemsLock, "performWriteSync:", v20);
  -[FCPuzzleHistory _addedPuzzleIDs:modifiedPuzzleIDs:removedPuzzleIDs:](self, v17, v16, v14);

}

void __67__FCPuzzleHistory_handleSyncWithChangedRecords_deletedRecordNames___block_invoke(id *a1)
{
  id *v1;
  __int128 v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  char *v36;
  void *v37;
  void *v38;
  int v39;
  BOOL v40;
  NSObject *v41;
  void *v42;
  FCModifyPuzzleHistoryCommand *v43;
  char *v44;
  void *v45;
  FCModifyPuzzleHistoryCommand *v46;
  void *v47;
  void *v48;
  id v49;
  _QWORD *v50;
  void *v51;
  NSObject *v52;
  char *v53;
  void *v54;
  void *v55;
  void *v56;
  int v57;
  uint64_t v58;
  void *v59;
  int v60;
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  _QWORD *v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  id v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  void *v88;
  void *v89;
  _QWORD *v90;
  void *v91;
  uint64_t v92;
  __int128 v93;
  int v94;
  int v95;
  int v96;
  id obj;
  id *v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  uint64_t v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  id v107;
  id v108;
  void *v109;
  id v110;
  id v111;
  void *v112;
  uint64_t v113;
  char *v114;
  void *v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  _BYTE v124[128];
  void *v125;
  uint8_t buf[4];
  const char *v127;
  __int16 v128;
  char *v129;
  __int16 v130;
  int v131;
  __int16 v132;
  void *v133;
  _BYTE v134[128];
  uint64_t v135;

  v1 = a1;
  v135 = *MEMORY[0x1E0C80C00];
  v120 = 0u;
  v121 = 0u;
  v122 = 0u;
  v123 = 0u;
  obj = a1[4];
  v100 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v120, v134, 16);
  if (v100)
  {
    v99 = *(_QWORD *)v121;
    *(_QWORD *)&v2 = 138543618;
    v93 = v2;
    v98 = v1;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v121 != v99)
          objc_enumerationMutation(obj);
        v4 = *(void **)(*((_QWORD *)&v120 + 1) + 8 * v3);
        objc_msgSend(v4, "recordID", v93);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "recordName");
        v6 = objc_claimAutoreleasedReturnValue();

        v115 = (void *)v6;
        objc_msgSend(v1[5], "objectForKey:", v6);
        v7 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("puzzleID"));
        v8 = (char *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("puzzleTypeID"));
        v102 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("progressData"));
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("progressLevel"));
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = (void *)v9;
        if (v9)
          v11 = (void *)v9;
        else
          v11 = &unk_1E470B498;
        v111 = v11;

        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("score"));
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = (void *)v12;
        if (v12)
          v14 = (void *)v12;
        else
          v14 = &unk_1E470B498;
        v110 = v14;

        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rankID"));
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("usedReveal"));
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)v15;
        if (v15)
          v17 = (void *)v15;
        else
          v17 = &unk_1E470B498;
        v108 = v17;

        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("playDuration"));
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = (void *)v18;
        if (v18)
          v20 = (void *)v18;
        else
          v20 = &unk_1E470B498;
        v21 = (void *)v7;
        v107 = v20;

        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lastPlayedDate"));
        v114 = (char *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("completedDate"));
        v113 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstCompletedDate"));
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstPlayDuration"));
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bestScore"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("difficulty"));
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("publishDate"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("behaviorFlags"));
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          v24 = objc_msgSend(v21, "mutableCopy");
          v25 = v21;
          v26 = (void *)v24;
          v27 = v1[6];
          v101 = v25;
          v28 = v25;
          v29 = v4;
          v30 = v29;
          if (!v27)
          {

            v31 = (void *)v113;
            goto LABEL_24;
          }
          v31 = (void *)v113;
          if ((objc_msgSend(v27, "allowLowerProgressOnCompletedPuzzles") & 1) != 0
            || (objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("completedDate")),
                (v32 = objc_claimAutoreleasedReturnValue()) == 0))
          {

          }
          else
          {
            v33 = (void *)v32;
            objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("progressLevel"));
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v95 = objc_msgSend(v34, "intValue");

            objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("score"));
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v96 = objc_msgSend(v35, "intValue");

            objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("progressLevel"));
            v36 = v8;
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v94 = objc_msgSend(v37, "intValue");

            objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("score"));
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = objc_msgSend(v38, "intValue");

            v8 = v36;
            v40 = v39 < v96;
            v31 = (void *)v113;
            if (v40 || v94 < v95)
            {
LABEL_24:
              v41 = FCPuzzleLog;
              if (os_log_type_enabled((os_log_t)FCPuzzleLog, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v127 = v8;
                _os_log_impl(&dword_1A1B90000, v41, OS_LOG_TYPE_DEFAULT, "FCPuzzleHistory: Received update with a lower score/progress for %{public}@. Replacing with local record.", buf, 0xCu);
              }
              v1 = v98;
              objc_msgSend(v98[6], "puzzleHistoryItemForPuzzleID:", v8);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              if (v42)
              {
                v43 = [FCModifyPuzzleHistoryCommand alloc];
                v125 = v42;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v125, 1);
                v44 = v8;
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                v46 = -[FCModifyPuzzleHistoryCommand initWithPuzzleHistoryItems:merge:](v43, "initWithPuzzleHistoryItems:merge:", v45, 0);

                v8 = v44;
                objc_msgSend(v98[6], "addCommandToCommandQueue:", v46);

              }
              v47 = (void *)v102;
LABEL_115:

              goto LABEL_116;
            }
          }
          if (v8)
            objc_msgSend(v26, "setObject:forKeyedSubscript:", v8, CFSTR("puzzleID"));
          if (v102)
            objc_msgSend(v26, "setObject:forKeyedSubscript:", v102, CFSTR("puzzleTypeID"));
          if (v112)
            objc_msgSend(v26, "setObject:forKeyedSubscript:", v112, CFSTR("progressData"));
          if ((objc_msgSend(v111, "intValue") & 0x80000000) == 0)
            objc_msgSend(v26, "setObject:forKeyedSubscript:", v111, CFSTR("progressLevel"));
          v53 = v8;
          if ((objc_msgSend(v110, "intValue") & 0x80000000) == 0)
            objc_msgSend(v26, "setObject:forKeyedSubscript:", v110, CFSTR("score"));
          if ((objc_msgSend(v107, "intValue") & 0x80000000) == 0)
            objc_msgSend(v26, "setObject:forKeyedSubscript:", v107, CFSTR("playDuration"));
          if (v109)
            objc_msgSend(v26, "setObject:forKeyedSubscript:", v109, CFSTR("rankID"));
          objc_msgSend(v26, "setObject:forKeyedSubscript:", v114, CFSTR("lastPlayedDate"));
          objc_msgSend(v26, "setObject:forKeyedSubscript:", v31, CFSTR("completedDate"));
          objc_msgSend(v26, "setObject:forKeyedSubscript:", v108, CFSTR("usedReveal"));
          if (v106)
          {
            objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("firstCompletedDate"));
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            if (v54)
            {
              objc_msgSend(v106, "earlierDate:", v54);
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "setObject:forKeyedSubscript:", v55, CFSTR("firstCompletedDate"));

              objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("firstCompletedDate"));
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              v57 = objc_msgSend(v54, "isEqualToDate:", v56) ^ 1;

            }
            else
            {
              objc_msgSend(v26, "setObject:forKeyedSubscript:", v106, CFSTR("firstCompletedDate"));
              v57 = 1;
            }

          }
          else
          {
            v57 = 0;
          }
          if (v105)
          {
            objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("firstPlayDuration"));
            v58 = objc_claimAutoreleasedReturnValue();
            v59 = (void *)v58;
            if (v58)
              v60 = v57;
            else
              v60 = 1;
            if (v60)
              v61 = v105;
            else
              v61 = (void *)v58;
            objc_msgSend(v26, "setObject:forKeyedSubscript:", v61, CFSTR("firstPlayDuration"));

          }
          v8 = v53;
          if (v22)
          {
            objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("bestScore"));
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            if (v62)
            {
              v63 = objc_msgSend(v22, "integerValue");
              v64 = objc_msgSend(v62, "integerValue");
              if (v63 <= v64)
                v65 = v64;
              else
                v65 = v63;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v65);
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "setObject:forKeyedSubscript:", v66, CFSTR("bestScore"));

            }
            else
            {
              objc_msgSend(v26, "setObject:forKeyedSubscript:", v22, CFSTR("bestScore"));
            }

          }
          if (v104)
          {
            objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("difficulty"));
            v67 = objc_claimAutoreleasedReturnValue();
            v68 = (void *)v67;
            if (v67)
              v69 = (void *)v67;
            else
              v69 = v104;
            objc_msgSend(v26, "setObject:forKeyedSubscript:", v69, CFSTR("difficulty"));

          }
          if (v23)
          {
            objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("publishDate"));
            v70 = objc_claimAutoreleasedReturnValue();
            v71 = (void *)v70;
            if (v70)
              v72 = (void *)v70;
            else
              v72 = v23;
            objc_msgSend(v26, "setObject:forKeyedSubscript:", v72, CFSTR("publishDate"));

          }
          if (v103)
          {
            objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("behaviorFlags"));
            v73 = objc_claimAutoreleasedReturnValue();
            v74 = (void *)v73;
            if (v73)
              v75 = (void *)v73;
            else
              v75 = v103;
            objc_msgSend(v26, "setObject:forKeyedSubscript:", v75, CFSTR("behaviorFlags"));

          }
          objc_msgSend(v98[5], "setObject:forKey:", v26, v115);
          v31 = (void *)v113;
          v47 = (void *)v102;
          v1 = v98;
          if (v8)
          {
            v42 = -[FCPuzzleHistoryItem initWithEntryID:dictionaryRepresentation:]([FCPuzzleHistoryItem alloc], v115, v26);
            v76 = v98[6];
            if (v76)
              v77 = (void *)v76[13];
            else
              v77 = 0;
            objc_msgSend(v77, "setObject:forKey:", v42, v8);
            objc_msgSend(v98[8], "addObject:", v8);
            goto LABEL_115;
          }
LABEL_116:

          v21 = v101;
          goto LABEL_117;
        }
        if (v8)
        {
          v47 = (void *)v102;
          v31 = (void *)v113;
          if (v114)
          {
            objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "fc_safelySetObject:forKey:", v8, CFSTR("puzzleID"));
            objc_msgSend(v48, "fc_safelySetObject:forKey:", v102, CFSTR("puzzleTypeID"));
            if (v112)
              objc_msgSend(v48, "fc_safelySetObject:forKey:", v112, CFSTR("progressData"));
            objc_msgSend(v48, "fc_safelySetObject:forKey:", v111, CFSTR("progressLevel"));
            objc_msgSend(v48, "fc_safelySetObject:forKey:", v110, CFSTR("score"));
            objc_msgSend(v48, "fc_safelySetObject:forKey:", v108, CFSTR("usedReveal"));
            objc_msgSend(v48, "fc_safelySetObject:forKey:", v107, CFSTR("playDuration"));
            objc_msgSend(v48, "fc_safelySetObject:forKey:", v114, CFSTR("lastPlayedDate"));
            if (v109)
              objc_msgSend(v48, "fc_safelySetObject:forKey:", v109, CFSTR("rankID"));
            if (v113)
              objc_msgSend(v48, "fc_safelySetObject:forKey:", v113, CFSTR("completedDate"));
            if (v106)
              objc_msgSend(v48, "fc_safelySetObject:forKey:", v106, CFSTR("firstCompletedDate"));
            if (v105)
              objc_msgSend(v48, "fc_safelySetObject:forKey:", v105, CFSTR("firstPlayDuration"));
            if (v22)
              objc_msgSend(v48, "fc_safelySetObject:forKey:", v22, CFSTR("bestScore"));
            if (v104)
              objc_msgSend(v48, "fc_safelySetObject:forKey:", v104, CFSTR("difficulty"));
            if (v23)
              objc_msgSend(v48, "fc_safelySetObject:forKey:", v23, CFSTR("publishDate"));
            if (v103)
              objc_msgSend(v48, "fc_safelySetObject:forKey:", v103, CFSTR("behaviorFlags"));
            v49 = -[FCPuzzleHistoryItem initWithEntryID:dictionaryRepresentation:]([FCPuzzleHistoryItem alloc], v115, v48);
            v50 = v1[6];
            if (v50)
              v51 = (void *)v50[13];
            else
              v51 = 0;
            objc_msgSend(v51, "setObject:forKey:", v49, v8);
            objc_msgSend(v1[5], "setObject:forKey:", v48, v115);
            objc_msgSend(v1[7], "addObject:", v8);

            goto LABEL_117;
          }
        }
        else
        {
          v47 = (void *)v102;
          v31 = (void *)v113;
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            v78 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("should never have a puzzleHistoryItem without a puzzleID"));
            *(_DWORD *)buf = 136315906;
            v127 = "-[FCPuzzleHistory handleSyncWithChangedRecords:deletedRecordNames:]_block_invoke";
            v128 = 2080;
            v129 = "FCPuzzleHistory.m";
            v130 = 1024;
            v131 = 556;
            v132 = 2114;
            v133 = v78;
            _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

          }
          if (v114)
            goto LABEL_57;
        }
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          v79 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("should never have a puzzleHistoryItem without a lastPlayedDate"));
          *(_DWORD *)buf = 136315906;
          v127 = "-[FCPuzzleHistory handleSyncWithChangedRecords:deletedRecordNames:]_block_invoke";
          v128 = 2080;
          v129 = "FCPuzzleHistory.m";
          v130 = 1024;
          v131 = 557;
          v132 = 2114;
          v133 = v79;
          _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

        }
LABEL_57:
        v52 = FCPuzzleLog;
        if (os_log_type_enabled((os_log_t)FCPuzzleLog, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v93;
          v127 = v8;
          v128 = 2114;
          v129 = v114;
          _os_log_error_impl(&dword_1A1B90000, v52, OS_LOG_TYPE_ERROR, "FCPuzzleHistory: Received invalid new changed record puzzleID=%{public}@ lastPlayedDate=%{public}@", buf, 0x16u);
        }
LABEL_117:

        ++v3;
      }
      while (v100 != v3);
      v80 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v120, v134, 16);
      v100 = v80;
    }
    while (v80);
  }

  v118 = 0u;
  v119 = 0u;
  v116 = 0u;
  v117 = 0u;
  v81 = v1[9];
  v82 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v116, v124, 16);
  if (v82)
  {
    v83 = v82;
    v84 = *(_QWORD *)v117;
    do
    {
      v85 = 0;
      do
      {
        if (*(_QWORD *)v117 != v84)
          objc_enumerationMutation(v81);
        v86 = *(_QWORD *)(*((_QWORD *)&v116 + 1) + 8 * v85);
        objc_msgSend(v1[5], "objectForKey:", v86);
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        v88 = v87;
        if (v87)
        {
          objc_msgSend(v87, "objectForKeyedSubscript:", CFSTR("puzzleID"));
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          v90 = v1[6];
          if (v90)
            v91 = (void *)v90[13];
          else
            v91 = 0;
          objc_msgSend(v91, "removeObjectForKey:", v89);
          objc_msgSend(v1[5], "removeObjectForKey:", v86);
          objc_msgSend(v1[10], "addObject:", v89);

        }
        ++v85;
      }
      while (v83 != v85);
      v92 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v116, v124, 16);
      v83 = v92;
    }
    while (v92);
  }

}

- (id)allKnownRecordNamesWithinRecordZoneWithID:(id)a3
{
  NSMutableDictionary *itemsByPuzzleID;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", a3);
  if (self)
    itemsByPuzzleID = self->_itemsByPuzzleID;
  else
    itemsByPuzzleID = 0;
  -[NSMutableDictionary allValues](itemsByPuzzleID, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fc_arrayByTransformingWithBlock:", &__block_literal_global_184);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __61__FCPuzzleHistory_allKnownRecordNamesWithinRecordZoneWithID___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

+ (BOOL)requiresPushNotificationSupport
{
  return 1;
}

+ (BOOL)requiresBatchedSync
{
  return 0;
}

+ (BOOL)requiresHighPriorityFirstSync
{
  return 0;
}

+ (id)backingRecordZoneIDs
{
  id v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0C95098]);
  v3 = (void *)objc_msgSend(v2, "initWithZoneName:ownerName:", CFSTR("PuzzleHistory"), *MEMORY[0x1E0C94730]);
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)backingRecordIDs
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (id)commandsToMergeLocalDataToCloud:(id)a3 privateDataDirectory:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  FCModifyPuzzleHistoryCommand *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  FCModifyPuzzleHistoryCommand *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v5, "allKeys", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if ((objc_msgSend(a1, "isLocalStoreKeyInternal:", v12) & 1) == 0)
        {
          objc_msgSend(v5, "objectForKey:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = -[FCPuzzleHistoryItem initWithEntryID:dictionaryRepresentation:]([FCPuzzleHistoryItem alloc], v12, v13);
          objc_msgSend(v6, "addObject:", v14);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v9);
  }

  v15 = -[FCModifyPuzzleHistoryCommand initWithPuzzleHistoryItems:merge:]([FCModifyPuzzleHistoryCommand alloc], "initWithPuzzleHistoryItems:merge:", v6, 1);
  v22 = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (BOOL)canHelpRestoreZoneName:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("PuzzleHistory"));
}

- (id)recordsForRestoringZoneName:(id)a3
{
  void *v3;
  void *v4;

  -[FCPuzzleHistory _allItemsInPuzzleHistory]((id *)&self->super.super.isa);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fc_arrayByTransformingWithBlock:", &__block_literal_global_38_3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __47__FCPuzzleHistory_recordsForRestoringZoneName___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "asCKRecord");
}

id *__70__FCPuzzleHistory__addedPuzzleIDs_modifiedPuzzleIDs_removedPuzzleIDs___block_invoke(uint64_t a1, void *a2)
{
  return -[FCPuzzleHistory _puzzleHistoryItemForPuzzleID:](*(id **)(a1 + 32), a2);
}

id *__70__FCPuzzleHistory__addedPuzzleIDs_modifiedPuzzleIDs_removedPuzzleIDs___block_invoke_2(uint64_t a1, void *a2)
{
  return -[FCPuzzleHistory _puzzleHistoryItemForPuzzleID:](*(id **)(a1 + 32), a2);
}

id *__70__FCPuzzleHistory__addedPuzzleIDs_modifiedPuzzleIDs_removedPuzzleIDs___block_invoke_3(uint64_t a1, void *a2)
{
  return -[FCPuzzleHistory _puzzleHistoryItemForPuzzleID:](*(id **)(a1 + 32), a2);
}

void __49__FCPuzzleHistory__puzzleHistoryItemForPuzzleID___block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD *v7;

  v2 = (_QWORD *)a1[4];
  if (v2)
    v2 = (_QWORD *)v2[13];
  v3 = a1[5];
  v7 = v2;
  objc_msgSend(v7, "objectForKey:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1[6] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

uint64_t __49__FCPuzzleHistory__allSortedItemsInPuzzleHistory__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a2;
  objc_msgSend(a3, "lastPlayedDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastPlayedDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (BOOL)allowLowerProgressOnCompletedPuzzles
{
  return self->_allowLowerProgressOnCompletedPuzzles;
}

- (void)setAllowLowerProgressOnCompletedPuzzles:(BOOL)a3
{
  self->_allowLowerProgressOnCompletedPuzzles = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemsLock, 0);
  objc_storeStrong((id *)&self->_cloudContext, 0);
  objc_storeStrong((id *)&self->_itemsByPuzzleID, 0);
}

@end

@implementation FCRecordChainFetchOperation

- (id)_recordTypeForRecordID:(uint64_t)a1
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v4 = *(id *)(a1 + 472);
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v26, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
LABEL_4:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
        if ((objc_msgSend(v10, "recognizesRecordID:", v3) & 1) != 0)
          break;
        if (v7 == ++v9)
        {
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v26, 16);
          if (v7)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      objc_msgSend(v10, "recordType");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
        goto LABEL_15;
    }
    else
    {
LABEL_10:

    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unrecognized record ID %@"), v3);
      *(_DWORD *)buf = 136315906;
      v19 = "-[FCRecordChainFetchOperation _recordTypeForRecordID:]";
      v20 = 2080;
      v21 = "FCRecordChainFetchOperation.m";
      v22 = 1024;
      v23 = 795;
      v24 = 2114;
      v25 = v13;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    v11 = 0;
LABEL_15:

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

uint64_t __57__FCRecordChainFetchOperation__issueCloudRequestIfNeeded__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
}

uint64_t __47__FCRecordChainFetchOperation_prepareOperation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v4 = (void *)MEMORY[0x1E0DE7910];
  v5 = a2;
  objc_msgSend(a3, "recordIDPrefixes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recordIDPrefixes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "nf_compareObject:toObject:", v7, v9);

  return v10;
}

id __57__FCRecordChainFetchOperation__issueCloudRequestIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  return -[FCRecordChainFetchOperation _recordTypeForRecordID:](*(_QWORD *)(a1 + 32), a2);
}

void __57__FCRecordChainFetchOperation__issueCloudRequestIfNeeded__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v5 = *(void **)(v4 + 496);
  else
    v5 = 0;
  objc_msgSend(v5, "allRecords");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v30, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    v10 = MEMORY[0x1E0C81028];
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v11), "base");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "changeTag");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13 && os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "base.changeTag");
          *(_DWORD *)buf = 136315906;
          v23 = "-[FCRecordChainFetchOperation _issueCloudRequestIfNeeded]_block_invoke_3";
          v24 = 2080;
          v25 = "FCRecordChainFetchOperation.m";
          v26 = 1024;
          v27 = 355;
          v28 = 2114;
          v29 = v17;
          _os_log_error_impl(&dword_1A1B90000, v10, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

        }
        objc_msgSend(v12, "changeTag");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(v12, "changeTag");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKey:", v15, v16);

        }
        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v30, 16);
    }
    while (v8);
  }

}

uint64_t __118__FCRecordChainFetchOperation__walkRecordChainStartingWithRecordIDs_visitedRecordIDs_recordsLookupBlock_visitorBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  -[FCRecordChainFetchOperation _recordTypeForRecordID:](*(_QWORD *)(a1 + 32), a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 40));

  return v4;
}

void __57__FCRecordChainFetchOperation__issueCloudRequestIfNeeded__block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  _QWORD *v10;
  _QWORD *v11;
  id WeakRetained;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  _QWORD *v39;
  int *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  int *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  int *v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  void *v79;
  id v80;
  uint64_t v81;
  void *v82;
  void *v83;
  _QWORD *v84;
  _QWORD *v85;
  char v86;
  uint64_t v87;
  void *v88;
  void *v89;
  id v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  uint64_t v97;
  _QWORD v98[5];
  _QWORD v99[5];
  _QWORD v100[4];
  id v101;
  uint64_t v102;
  _QWORD v103[5];
  id v104;
  _QWORD v105[5];
  _QWORD v106[5];
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  _QWORD v111[5];
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  _QWORD v116[4];
  id v117;
  _QWORD v118[5];
  _QWORD aBlock[4];
  id v120;
  _BYTE v121[128];
  _BYTE v122[128];
  uint64_t v123;

  v123 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(_QWORD **)(a1 + 32);
  if (v10)
    v10 = (_QWORD *)v10[67];
  v11 = v10;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v13 = WeakRetained;
  if (WeakRetained)
    v14 = (void *)*((_QWORD *)WeakRetained + 53);
  else
    v14 = 0;
  v15 = v14;
  objc_msgSend(v11, "addObjectsFromArray:", v15);

  if (!v9
    || (!objc_msgSend(*(id *)(a1 + 32), "shouldFailOnLimitExceededError")
     || !objc_msgSend(v9, "fc_isCKErrorWithCode:", 27))
    && !objc_msgSend(*(id *)(a1 + 32), "shouldReturnErrorWhenSomeRecordsMissing"))
  {
    v97 = a1;
    v92 = v9;
    v93 = v8;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v112 = 0u;
    v113 = 0u;
    v114 = 0u;
    v115 = 0u;
    v90 = v7;
    v17 = v7;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v112, v122, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v113;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v113 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * i);
          objc_msgSend(v22, "recordID", v90);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "recordName");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v16, "containsObject:", v24);

          if ((v25 & 1) == 0)
          {
            v26 = *(void **)(a1 + 40);
            objc_msgSend(v22, "recordID");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "recordName");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v26) = objc_msgSend(v26, "containsObject:", v28);

            if ((_DWORD)v26)
            {
              objc_msgSend(v22, "recordID");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "recordName");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = v96;
            }
            else
            {
              objc_msgSend(v22, "recordType");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v94, "objectForKeyedSubscript:", v32);
              v33 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v33)
              {
                objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "recordType");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v94, "setObject:forKeyedSubscript:", v34, v35);

              }
              objc_msgSend(v22, "recordType");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v94, "objectForKeyedSubscript:", v36);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "addObject:", v22);

              objc_msgSend(v22, "recordID");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "recordName");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = v16;
            }
            objc_msgSend(v31, "addObject:", v30);

          }
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v112, v122, 16);
      }
      while (v19);
    }

    v38 = MEMORY[0x1E0C809B0];
    v111[0] = MEMORY[0x1E0C809B0];
    v111[1] = 3221225472;
    v111[2] = __57__FCRecordChainFetchOperation__issueCloudRequestIfNeeded__block_invoke_6;
    v111[3] = &unk_1E4643580;
    v111[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v94, "enumerateKeysAndObjectsUsingBlock:", v111);

    v39 = *(_QWORD **)(a1 + 32);
    v40 = &OBJC_IVAR___FCAudioFeedConfigOperation__resultLegacyConfig;
    if (v39)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      aBlock[0] = v38;
      aBlock[1] = 3221225472;
      aBlock[2] = __62__FCRecordChainFetchOperation__filterOrphansFromCachedRecords__block_invoke;
      aBlock[3] = &unk_1E46434E0;
      v42 = v41;
      v120 = v42;
      v43 = _Block_copy(aBlock);
      v118[0] = v38;
      v118[1] = 3221225472;
      v118[2] = __62__FCRecordChainFetchOperation__filterOrphansFromCachedRecords__block_invoke_2;
      v118[3] = &unk_1E4643508;
      v118[4] = v39;
      v44 = _Block_copy(v118);
      v45 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v39, "topLevelRecordIDs");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "setWithArray:", v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCRecordChainFetchOperation _walkRecordChainStartingWithRecordIDs:visitedRecordIDs:recordsLookupBlock:visitorBlock:](v39, v47, v48, v44, v43);

      v40 = &OBJC_IVAR___FCAudioFeedConfigOperation__resultLegacyConfig;
      v49 = (void *)v39[62];
      v116[0] = v38;
      v116[1] = 3221225472;
      v116[2] = __62__FCRecordChainFetchOperation__filterOrphansFromCachedRecords__block_invoke_4;
      v116[3] = &unk_1E4643668;
      v117 = v42;
      v50 = v42;
      v51 = v49;
      objc_msgSend(v51, "heldRecordsPassingTest:", v116);
      v52 = objc_claimAutoreleasedReturnValue();
      v53 = (void *)v39[62];
      v39[62] = v52;

    }
    v9 = v92;
    v8 = v93;
    if (v92
      && ((v54 = *(_QWORD *)(a1 + 32)) == 0 ? (v55 = 0) : (v55 = *(void **)(v54 + v40[26])),
          !objc_msgSend(v55, "count", v90)))
    {
      objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", v92);
      v7 = v90;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", v90);
      v56 = objc_claimAutoreleasedReturnValue();
      v107 = 0u;
      v108 = 0u;
      v109 = 0u;
      v110 = 0u;
      v57 = *(_QWORD *)(a1 + 32);
      v95 = (void *)v56;
      if (v57)
        v58 = *(void **)(v57 + v40[26]);
      else
        v58 = 0;
      objc_msgSend(v58, "allRecords");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v107, v121, 16);
      if (v60)
      {
        v61 = v60;
        v62 = *(_QWORD *)v108;
        v63 = &OBJC_IVAR___FCAudioFeedConfigOperation__resultLegacyConfig;
        do
        {
          v64 = 0;
          do
          {
            if (*(_QWORD *)v108 != v62)
              objc_enumerationMutation(v59);
            objc_msgSend(*(id *)(*((_QWORD *)&v107 + 1) + 8 * v64), "base");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "identifier");
            v66 = (void *)objc_claimAutoreleasedReturnValue();

            -[FCRecordChainFetchOperation _recordTypeForRecordID:](*(_QWORD *)(v97 + 32), v66);
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v16, "containsObject:", v66) & 1) == 0)
            {
              v68 = *(_QWORD *)(v97 + 32);
              v69 = v68 ? *(void **)(v68 + v63[8]) : 0;
              if ((objc_msgSend(v69, "containsObject:", v66) & 1) == 0)
              {
                v70 = v16;
                v71 = v59;
                v72 = v63;
                objc_msgSend(v95, "objectForKeyedSubscript:", v67);
                v73 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v73)
                {
                  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                  v74 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v95, "setObject:forKeyedSubscript:", v74, v67);

                }
                objc_msgSend(v95, "objectForKeyedSubscript:", v67);
                v75 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v75, "addObject:", v66);

                v63 = v72;
                v59 = v71;
                v16 = v70;
              }
            }

            ++v64;
          }
          while (v61 != v64);
          v76 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v107, v121, 16);
          v61 = v76;
        }
        while (v76);
      }

      v77 = MEMORY[0x1E0C809B0];
      v106[0] = MEMORY[0x1E0C809B0];
      v106[1] = 3221225472;
      v106[2] = __57__FCRecordChainFetchOperation__issueCloudRequestIfNeeded__block_invoke_7;
      v106[3] = &unk_1E4643580;
      v106[4] = *(_QWORD *)(v97 + 32);
      objc_msgSend(v95, "enumerateKeysAndObjectsUsingBlock:", v106);

      v8 = v93;
      if (objc_msgSend(v93, "count"))
      {
        v105[0] = v77;
        v105[1] = 3221225472;
        v105[2] = __57__FCRecordChainFetchOperation__issueCloudRequestIfNeeded__block_invoke_8;
        v105[3] = &unk_1E4643530;
        v105[4] = *(_QWORD *)(v97 + 32);
        objc_msgSend(v93, "fc_dictionaryOfSortedSetsWithKeyBlock:", v105);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v103[0] = v77;
        v103[1] = 3221225472;
        v103[2] = __57__FCRecordChainFetchOperation__issueCloudRequestIfNeeded__block_invoke_9;
        v103[3] = &unk_1E463BF90;
        v103[4] = *(_QWORD *)(v97 + 32);
        v104 = v96;
        objc_msgSend(v78, "enumerateKeysAndObjectsUsingBlock:", v103);

      }
      -[FCRecordChainFetchOperation _finalizeResultFromCachedRecords](*(_QWORD *)(v97 + 32));
      v7 = v91;
      v9 = v92;
      if (objc_msgSend(v93, "count"))
      {
        objc_msgSend(v93, "allObjects");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v100[0] = v77;
        v100[1] = 3221225472;
        v100[2] = __57__FCRecordChainFetchOperation__issueCloudRequestIfNeeded__block_invoke_10;
        v100[3] = &unk_1E46435A8;
        v80 = v92;
        v81 = *(_QWORD *)(v97 + 32);
        v101 = v80;
        v102 = v81;
        objc_msgSend(v79, "fc_dictionaryWithValueBlock:", v100);
        v82 = (void *)objc_claimAutoreleasedReturnValue();

        v99[0] = v77;
        v99[1] = 3221225472;
        v99[2] = __57__FCRecordChainFetchOperation__issueCloudRequestIfNeeded__block_invoke_11;
        v99[3] = &unk_1E46435D0;
        v99[4] = *(_QWORD *)(v97 + 32);
        objc_msgSend(v82, "fc_sortedEntriesWithKeyBlock:", v99);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        v98[0] = v77;
        v98[1] = 3221225472;
        v98[2] = __57__FCRecordChainFetchOperation__issueCloudRequestIfNeeded__block_invoke_12;
        v98[3] = &unk_1E463E1E0;
        v98[4] = *(_QWORD *)(v97 + 32);
        objc_msgSend(v83, "enumerateKeysAndObjectsUsingBlock:", v98);
        v84 = *(_QWORD **)(v97 + 32);
        if (v84)
          v84 = (_QWORD *)v84[62];
        v85 = v84;
        if (objc_msgSend(v85, "count"))
        {
          v86 = objc_msgSend(*(id *)(v97 + 32), "shouldReturnErrorWhenSomeRecordsMissing");

          if ((v86 & 1) == 0)
          {
            objc_msgSend(*(id *)(v97 + 32), "finishedPerformingOperationWithError:", 0);
LABEL_60:

            goto LABEL_61;
          }
        }
        else
        {

        }
        v87 = *(_QWORD *)(v97 + 32);
        objc_msgSend(v93, "allObjects");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        -[FCRecordChainFetchOperation _errorForMissingRecordNames:](v87, v88);
        v89 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(v97 + 32), "finishedPerformingOperationWithError:", v89);
        goto LABEL_60;
      }
      objc_msgSend(*(id *)(v97 + 32), "finishedPerformingOperationWithError:", 0);
    }
LABEL_61:

    goto LABEL_62;
  }
  objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", v9);
LABEL_62:

}

void __57__FCRecordChainFetchOperation__issueCloudRequestIfNeeded__block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  id *v5;
  id v6;
  void *v7;
  _QWORD *v8;
  _QWORD *v9;
  void *v10;
  id v11;

  v5 = *(id **)(a1 + 32);
  v6 = a3;
  -[FCRecordChainFetchOperation _recordSourceForRecordType:](v5, a2);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 32), "shouldBypassRecordSourcePersistence") & 1) != 0)
    objc_msgSend(v11, "convertRecords:", v6);
  else
    objc_msgSend(v11, "saveRecords:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *(_QWORD **)(a1 + 32);
  if (v8)
    v8 = (_QWORD *)v8[62];
  v9 = v8;
  +[FCHeldRecords heldRecordsByMerging:with:](FCHeldRecords, "heldRecordsByMerging:with:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCRecordChainFetchOperation setCachedRecords:](*(_QWORD *)(a1 + 32), v10);

}

void __66__FCRecordChainFetchOperation__collectCachedRecordsFromRecordIDs___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v5;
  _QWORD *v6;
  id v7;

  v5 = *(_QWORD **)(a1 + 32);
  if (v5)
    v5 = (_QWORD *)v5[62];
  v6 = v5;
  +[FCHeldRecords heldRecordsByMerging:with:](FCHeldRecords, "heldRecordsByMerging:with:", v6, a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[FCRecordChainFetchOperation setCachedRecords:](*(_QWORD *)(a1 + 32), v7);

}

- (void)setCachedRecords:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 496), a2);
}

- (void)_collectActualTopLevelRecordIDsFromRecordIDs:(void *)a3 visitedRecordIDs:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int *v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void (**v15)(_QWORD, _QWORD, _QWORD);
  id *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  id v34;
  id *v35;
  id obj;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    if (-[FCRecordChainFetchOperation _shouldIgnoreCache](a1))
    {
      v7 = (void *)objc_msgSend(v5, "mutableCopy");
      objc_storeStrong(a1 + 63, v7);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "unionSet:", v5);
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v34 = v5;
      obj = v5;
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
      if (v41)
      {
        v9 = &OBJC_IVAR___FCAudioFeedConfigOperation__resultLegacyConfig;
        v40 = *(_QWORD *)v51;
        v35 = a1;
        do
        {
          for (i = 0; i != v41; ++i)
          {
            if (*(_QWORD *)v51 != v40)
              objc_enumerationMutation(obj);
            v11 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
            objc_msgSend(*(id *)((char *)a1 + v9[26]), "recordWithID:", v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = v11;
            -[FCRecordChainFetchOperation _recordTypeForRecordID:]((uint64_t)a1, v11);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[FCRecordChainFetchOperation _recordSourceForRecordType:](a1, (uint64_t)v13);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "dynamicCachePolicyBlock");
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v14)
              goto LABEL_45;
            objc_msgSend(a1, "dynamicCachePolicyBlock");
            v15 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "base");
            v16 = a1;
            v17 = v13;
            v18 = i;
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            ((void (**)(_QWORD, uint64_t, void *))v15)[2](v15, objc_msgSend(v19, "recordType"), v12);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            i = v18;
            v13 = v17;
            a1 = v16;
            v9 = &OBJC_IVAR___FCAudioFeedConfigOperation__resultLegacyConfig;

            if (!v20)
            {
LABEL_45:
              objc_msgSend(a1, "cachePoliciesByRecordID");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "objectForKey:", v42);
              v20 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v20)
              {
                objc_msgSend(a1, "cachePoliciesByRecordType");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "objectForKey:", v13);
                v20 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v20)
                {
                  objc_msgSend(a1, "cachePolicy");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                }
              }
            }
            v45 = v20;
            if (v12)
              v23 = objc_msgSend(v44, "isRecordStale:withCachePolicy:", v12, v20);
            else
              v23 = 1;
            v24 = objc_msgSend(v20, "cachePolicy");
            if (!v23 || v24 == 3)
            {
              if (!v12 && v24 == 3)
                objc_msgSend(a1[65], "addObject:", v42);
              objc_msgSend(a1[64], "addObject:", v42);
              objc_msgSend(a1, "linkKeysByRecordType");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "objectForKey:", v13);
              v26 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v26, "count"))
              {
                v38 = v13;
                v39 = v12;
                v43 = i;
                objc_msgSend(v44, "keyValueRepresentationOfRecord:", v12);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v46 = 0u;
                v47 = 0u;
                v48 = 0u;
                v49 = 0u;
                v37 = v26;
                v28 = v26;
                v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
                if (v29)
                {
                  v30 = v29;
                  v31 = *(_QWORD *)v47;
                  do
                  {
                    for (j = 0; j != v30; ++j)
                    {
                      if (*(_QWORD *)v47 != v31)
                        objc_enumerationMutation(v28);
                      objc_msgSend(v27, "valueForKey:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * j));
                      v33 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        objc_msgSend(v8, "addObject:", v33);
                      }
                      else
                      {
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                          objc_msgSend(v8, "addObjectsFromArray:", v33);
                      }

                    }
                    v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
                  }
                  while (v30);
                }

                a1 = v35;
                v9 = &OBJC_IVAR___FCAudioFeedConfigOperation__resultLegacyConfig;
                i = v43;
                v13 = v38;
                v12 = v39;
                v26 = v37;
              }

            }
            else
            {
              objc_msgSend(a1[63], "addObject:", v42);
            }

          }
          v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
        }
        while (v41);
      }

      objc_msgSend(v8, "minusSet:", v6);
      if (objc_msgSend(v8, "count"))
        -[FCRecordChainFetchOperation _collectActualTopLevelRecordIDsFromRecordIDs:visitedRecordIDs:](a1, v8, v6);

      v5 = v34;
    }
  }

}

- (id)_recordSourceForRecordType:(id *)a1
{
  if (a1)
  {
    objc_msgSend(a1[60], "objectForKey:", a2);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)dynamicCachePolicyBlock
{
  return self->_dynamicCachePolicyBlock;
}

- (NSDictionary)cachePoliciesByRecordType
{
  return self->_cachePoliciesByRecordType;
}

- (NSDictionary)cachePoliciesByRecordID
{
  return self->_cachePoliciesByRecordID;
}

- (void)_walkRecordChainStartingWithRecordIDs:(void *)a3 visitedRecordIDs:(void *)a4 recordsLookupBlock:(void *)a5 visitorBlock:
{
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t j;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t k;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void (**v48)(id, void *, void *);
  id v49;
  id v50;
  void *v51;
  id v52;
  uint64_t v53;
  void *v54;
  void *v55;
  uint64_t v56;
  id obj;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _QWORD v66[6];
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  _BYTE v76[128];
  uint8_t v77[128];
  uint8_t buf[4];
  const char *v79;
  __int16 v80;
  char *v81;
  __int16 v82;
  int v83;
  __int16 v84;
  void *v85;
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v47 = a3;
  v49 = a4;
  v48 = a5;
  v10 = (void *)objc_msgSend(v9, "mutableCopy");
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  obj = v9;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v86, 16);
  if (v11)
  {
    v12 = v11;
    v13 = MEMORY[0x1E0C81028];
    v14 = *(_QWORD *)v72;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v72 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * v15);
        -[FCRecordChainFetchOperation _recordTypeForRecordID:]((uint64_t)a1, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          objc_msgSend(a1, "linkKeysByRecordType");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForKeyedSubscript:", v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
            goto LABEL_12;
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("missing link entry for record ID %@"), v16);
            *(_DWORD *)buf = 136315906;
            v79 = "-[FCRecordChainFetchOperation _walkRecordChainStartingWithRecordIDs:visitedRecordIDs:recordsLookupBloc"
                  "k:visitorBlock:]";
            v80 = 2080;
            v81 = "FCRecordChainFetchOperation.m";
            v82 = 1024;
            v83 = 602;
            v84 = 2114;
            v85 = v20;
            v21 = v13;
LABEL_15:
            _os_log_error_impl(&dword_1A1B90000, v21, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

          }
        }
        else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unknown type for record ID %@"), v16);
          *(_DWORD *)buf = 136315906;
          v79 = "-[FCRecordChainFetchOperation _walkRecordChainStartingWithRecordIDs:visitedRecordIDs:recordsLookupBlock:visitorBlock:]";
          v80 = 2080;
          v81 = "FCRecordChainFetchOperation.m";
          v82 = 1024;
          v83 = 597;
          v84 = 2114;
          v85 = v20;
          v21 = v13;
          goto LABEL_15;
        }
        objc_msgSend(v10, "removeObject:", v16);
LABEL_12:

        ++v15;
      }
      while (v12 != v15);
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v86, 16);
      v12 = v22;
    }
    while (v22);
  }

  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v51 = a1;
  objc_msgSend(a1, "linkKeysByRecordType");
  v50 = (id)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v67, v77, 16);
  v24 = v47;
  v25 = v49;
  if (v23)
  {
    v26 = v23;
    v27 = *(_QWORD *)v68;
    v28 = MEMORY[0x1E0C809B0];
    while (2)
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v68 != v27)
          objc_enumerationMutation(v50);
        v30 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * i);
        v66[0] = v28;
        v66[1] = 3221225472;
        v66[2] = __118__FCRecordChainFetchOperation__walkRecordChainStartingWithRecordIDs_visitedRecordIDs_recordsLookupBlock_visitorBlock___block_invoke;
        v66[3] = &unk_1E4643620;
        v66[4] = v51;
        v66[5] = v30;
        objc_msgSend(v10, "fc_arrayOfObjectsPassingTest:", v66);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v31, "count"))
        {
          objc_msgSend(v10, "fc_removeObjectsFromArray:", v31);
          v32 = (void *)MEMORY[0x1A8580B64](objc_msgSend(v47, "addObjectsFromArray:", v31));
          v25 = v49;
          (*((void (**)(id, uint64_t, void *))v49 + 2))(v49, v30, v31);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v48[2](v48, v31, v33);
          objc_msgSend(v51, "linkKeysByRecordType");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "objectForKey:", v30);
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          v55 = v35;
          if (objc_msgSend(v35, "count"))
          {
            v45 = v32;
            v46 = v31;
            -[FCRecordChainFetchOperation _recordSourceForRecordType:]((id *)v51, v30);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            v62 = 0u;
            v63 = 0u;
            v64 = 0u;
            v65 = 0u;
            v44 = v33;
            objc_msgSend(v33, "allRecords");
            v52 = (id)objc_claimAutoreleasedReturnValue();
            v56 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v62, v76, 16);
            if (v56)
            {
              v53 = *(_QWORD *)v63;
              do
              {
                for (j = 0; j != v56; ++j)
                {
                  if (*(_QWORD *)v63 != v53)
                    objc_enumerationMutation(v52);
                  objc_msgSend(v54, "keyValueRepresentationOfRecord:", *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * j));
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  v58 = 0u;
                  v59 = 0u;
                  v60 = 0u;
                  v61 = 0u;
                  v38 = v55;
                  v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v58, v75, 16);
                  if (v39)
                  {
                    v40 = v39;
                    v41 = *(_QWORD *)v59;
                    do
                    {
                      for (k = 0; k != v40; ++k)
                      {
                        if (*(_QWORD *)v59 != v41)
                          objc_enumerationMutation(v38);
                        objc_msgSend(v37, "valueForKey:", *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * k));
                        v43 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          objc_msgSend(v10, "addObject:", v43);
                        }
                        else
                        {
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                            objc_msgSend(v10, "addObjectsFromArray:", v43);
                        }

                      }
                      v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v58, v75, 16);
                    }
                    while (v40);
                  }

                }
                v56 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v62, v76, 16);
              }
              while (v56);
            }

            v31 = v46;
            v24 = v47;
            v25 = v49;
            v33 = v44;
            v32 = v45;
          }

          objc_autoreleasePoolPop(v32);
          goto LABEL_47;
        }

      }
      v26 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v67, v77, 16);
      v25 = v49;
      if (v26)
        continue;
      break;
    }
  }
LABEL_47:

  objc_msgSend(v10, "minusSet:", v24);
  if (objc_msgSend(v10, "count"))
    -[FCRecordChainFetchOperation _walkRecordChainStartingWithRecordIDs:visitedRecordIDs:recordsLookupBlock:visitorBlock:](v51, v10, v24, v25, v48);

}

- (NSDictionary)linkKeysByRecordType
{
  return self->_linkKeysByRecordType;
}

- (BOOL)_shouldIgnoreCache
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _BOOL8 v8;
  void *v10;

  objc_msgSend(a1, "cachePolicy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "cachePolicy");

  if (v3 != 1)
    return 0;
  objc_msgSend(a1, "cachePoliciesByRecordID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
    return 0;
  objc_msgSend(a1, "cachePoliciesByRecordType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
    return 0;
  objc_msgSend(a1, "dynamicCachePolicyBlock");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v10 == 0;

  return v8;
}

- (FCCachePolicy)cachePolicy
{
  return self->_cachePolicy;
}

void __63__FCRecordChainFetchOperation__finalizeResultFromCachedRecords__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a3;
  v6 = a2;
  objc_msgSend(v6, "base");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v11, "recordType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, v8);

  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v5, v8);

}

id __66__FCRecordChainFetchOperation__collectCachedRecordsFromRecordIDs___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = *(id **)(a1 + 32);
  v5 = a3;
  -[FCRecordChainFetchOperation _recordSourceForRecordType:](v4, a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cachedRecordsWithIDs:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __65__FCRecordChainFetchOperation__recordIDsMissingFromCachedRecords__block_invoke_2(uint64_t a1, uint64_t a2)
{
  int v3;
  _QWORD *v4;
  _QWORD v6[4];
  int v7;

  v3 = -[FCRecordChainFetchOperation _pbRecordTypeForRecordType:](*(_QWORD *)(a1 + 32), a2);
  v4 = *(_QWORD **)(a1 + 32);
  if (v4)
    v4 = (_QWORD *)v4[62];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__FCRecordChainFetchOperation__recordIDsMissingFromCachedRecords__block_invoke_3;
  v6[3] = &__block_descriptor_36_e8_B16__0_8l;
  v7 = v3;
  objc_msgSend(v4, "heldRecordsPassingTest:", v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __63__FCRecordChainFetchOperation__finalizeResultFromCachedRecords__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  objc_msgSend(*(id *)(a1 + 32), "linkKeysByRecordType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__FCRecordChainFetchOperation__finalizeResultFromCachedRecords__block_invoke_2;
  v6[3] = &unk_1E4643690;
  v6[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "fc_dictionaryWithKeyBlock:valueBlock:", v6, &__block_literal_global_44_2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __63__FCRecordChainFetchOperation__finalizeResultFromCachedRecords__block_invoke_3()
{
  return (id)objc_opt_new();
}

uint64_t __63__FCRecordChainFetchOperation__finalizeResultFromCachedRecords__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[FCRecordChainFetchOperation _pbRecordTypeForRecordType:](*(_QWORD *)(a1 + 32), a2));
}

- (uint64_t)_pbRecordTypeForRecordType:(uint64_t)result
{
  void *v2;
  uint64_t v3;

  if (result)
  {
    objc_msgSend(*(id *)(result + 488), "objectForKey:", a2);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "intValue");

    return v3;
  }
  return result;
}

void __63__FCRecordChainFetchOperation__finalizeResultFromCachedRecords__block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  FCHeldRecords *v9;
  void *v10;
  void *v11;
  FCHeldRecords *v12;
  id obj;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = *(id *)(a1 + 32);
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v7);
        v9 = [FCHeldRecords alloc];
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[FCHeldRecords initWithRecordsByID:interestTokensByID:](v9, "initWithRecordsByID:interestTokensByID:", v10, v11);

        objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, v8);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

}

- (void)prepareOperation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSArray *recordSources;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[FCRecordChainFetchOperation context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "internalContentContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recordSources");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCRecordChainFetchOperation additionalRecordSources](self, "additionalRecordSources");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = v7;
  objc_msgSend(v7, "sortedArrayUsingComparator:", &__block_literal_global_67);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    objc_storeStrong((id *)&self->_recordSources, v8);

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  if (self)
    recordSources = self->_recordSources;
  else
    recordSources = 0;
  v12 = recordSources;
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v25 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v17, "recordType");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKey:", v17, v18);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v17, "pbRecordType"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "recordType");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKey:", v19, v20);

      }
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v14);
  }

  if (self)
  {
    objc_storeStrong((id *)&self->_recordSourcesByRecordType, v9);
    objc_storeStrong((id *)&self->_pbRecordTypesByRecordType, v10);
  }
  -[FCRecordChainFetchOperation cachePolicy](self, "cachePolicy");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
  {
    +[FCCachePolicy defaultCachePolicy](FCCachePolicy, "defaultCachePolicy");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCRecordChainFetchOperation setCachePolicy:](self, "setCachePolicy:", v22);

  }
}

- (BOOL)validateOperation
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[FCRecordChainFetchOperation context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("record chain fetch operation requires a context"));
    v12 = 136315906;
    v13 = "-[FCRecordChainFetchOperation validateOperation]";
    v14 = 2080;
    v15 = "FCRecordChainFetchOperation.m";
    v16 = 1024;
    v17 = 59;
    v18 = 2114;
    v19 = v10;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v12, 0x26u);

  }
  -[FCRecordChainFetchOperation linkKeysByRecordType](self, "linkKeysByRecordType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (!v5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("record chain fetch operation requires a list of link keys for each record type in the chain"));
    v12 = 136315906;
    v13 = "-[FCRecordChainFetchOperation validateOperation]";
    v14 = 2080;
    v15 = "FCRecordChainFetchOperation.m";
    v16 = 1024;
    v17 = 60;
    v18 = 2114;
    v19 = v11;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v12, 0x26u);

  }
  -[FCRecordChainFetchOperation context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[FCRecordChainFetchOperation linkKeysByRecordType](self, "linkKeysByRecordType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count") != 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (FCContentContext)context
{
  return self->_context;
}

- (NSArray)additionalRecordSources
{
  return self->_additionalRecordSources;
}

- (void)setCachePolicy:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 400);
}

id __62__FCRecordChainFetchOperation__filterOrphansFromCachedRecords__block_invoke_2(uint64_t a1, uint64_t a2)
{
  int v3;
  _QWORD *v4;
  _QWORD v6[4];
  int v7;

  v3 = -[FCRecordChainFetchOperation _pbRecordTypeForRecordType:](*(_QWORD *)(a1 + 32), a2);
  v4 = *(_QWORD **)(a1 + 32);
  if (v4)
    v4 = (_QWORD *)v4[62];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__FCRecordChainFetchOperation__filterOrphansFromCachedRecords__block_invoke_3;
  v6[3] = &__block_descriptor_36_e8_B16__0_8l;
  v7 = v3;
  objc_msgSend(v4, "heldRecordsPassingTest:", v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)operationWillFinishWithError:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  NSDictionary *resultHeldRecordsByType;
  id v8;

  v8 = a3;
  -[FCRecordChainFetchOperation recordChainCompletionHandler](self, "recordChainCompletionHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[FCRecordChainFetchOperation recordChainCompletionHandler](self, "recordChainCompletionHandler");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (self)
      resultHeldRecordsByType = self->_resultHeldRecordsByType;
    else
      resultHeldRecordsByType = 0;
    (*(void (**)(uint64_t, NSDictionary *, id))(v5 + 16))(v5, resultHeldRecordsByType, v8);

  }
}

- (id)recordChainCompletionHandler
{
  return self->_recordChainCompletionHandler;
}

void __62__FCRecordChainFetchOperation__filterOrphansFromCachedRecords__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a3, "allRecordIDs");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

}

void __65__FCRecordChainFetchOperation__recordIDsMissingFromCachedRecords__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = (void *)MEMORY[0x1E0C99E20];
  v6 = a3;
  objc_msgSend(v5, "setWithArray:", a2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allRecordIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "fc_removeObjectsFromArray:", v7);
  objc_msgSend(*(id *)(a1 + 32), "unionSet:", v8);

}

- (void)performOperation
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  BOOL v8;
  id (*v9)(uint64_t, uint64_t, void *);
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
  FCCKBatchedMultiFetchQueryOperation *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  const char *v25;
  void *v26;
  void *v27;
  SEL v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  BOOL v33;
  void *v34;
  void *v35;
  FCRecordChainFetchOperation *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  FCHeldRecords *v43;
  BOOL v44;
  FCHeldRecords *v45;
  BOOL v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t i;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  const char *v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  id v67;
  FCRecordChainFetchOperation *v68;
  _QWORD newValue[5];
  id v70;
  id v71;
  id location;
  _QWORD v73[5];
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _QWORD v78[5];
  _QWORD v79[5];
  id v80;
  _QWORD v81[5];
  uint64_t aBlock;
  uint64_t v83;
  void *v84;
  void *v85;
  FCRecordChainFetchOperation *v86;
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E60];
  -[FCRecordChainFetchOperation topLevelRecordIDs](self, "topLevelRecordIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (self)
  {
    if (-[FCRecordChainFetchOperation _shouldIgnoreCache](self))
    {
      aBlock = MEMORY[0x1E0C809B0];
      v83 = 3221225472;
      v84 = __66__FCRecordChainFetchOperation__collectCachedRecordsFromRecordIDs___block_invoke;
      v85 = &unk_1E463AB18;
      v86 = self;
      __66__FCRecordChainFetchOperation__collectCachedRecordsFromRecordIDs___block_invoke((uint64_t)&aBlock);
    }
    else
    {
      aBlock = MEMORY[0x1E0C809B0];
      v83 = 3221225472;
      v84 = __66__FCRecordChainFetchOperation__collectCachedRecordsFromRecordIDs___block_invoke_2;
      v85 = &unk_1E46434E0;
      v86 = self;
      v6 = _Block_copy(&aBlock);
      if (!-[FCRecordChainFetchOperation shouldBypassRecordSourcePersistence](self, "shouldBypassRecordSourcePersistence")|| (-[FCRecordChainFetchOperation cachedRecordsLookupBlock](self, "cachedRecordsLookupBlock"), v7 = (void *)objc_claimAutoreleasedReturnValue(), v8 = v7 == 0, v7, v8))
      {
        *(_QWORD *)&v74 = MEMORY[0x1E0C809B0];
        v9 = __66__FCRecordChainFetchOperation__collectCachedRecordsFromRecordIDs___block_invoke_4;
      }
      else
      {
        *(_QWORD *)&v74 = MEMORY[0x1E0C809B0];
        v9 = __66__FCRecordChainFetchOperation__collectCachedRecordsFromRecordIDs___block_invoke_3;
      }
      *((_QWORD *)&v74 + 1) = 3221225472;
      *(_QWORD *)&v75 = v9;
      *((_QWORD *)&v75 + 1) = &unk_1E4643508;
      *(_QWORD *)&v76 = self;
      v10 = _Block_copy(&v74);
      v11 = (void *)MEMORY[0x1E0C99E60];
      -[FCRecordChainFetchOperation topLevelRecordIDs](self, "topLevelRecordIDs");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setWithArray:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCRecordChainFetchOperation _walkRecordChainStartingWithRecordIDs:visitedRecordIDs:recordsLookupBlock:visitorBlock:](self, v13, v14, v10, v6);

    }
  }

  v15 = (void *)MEMORY[0x1E0C99E60];
  -[FCRecordChainFetchOperation topLevelRecordIDs](self, "topLevelRecordIDs");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setWithArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCRecordChainFetchOperation _collectActualTopLevelRecordIDsFromRecordIDs:visitedRecordIDs:]((id *)&self->super.super.super.isa, v17, v18);

  if (self)
  {
    if (-[NSMutableSet count](self->_actualTopLevelRecordIDs, "count"))
    {
      -[NSMutableSet allObjects](self->_actualTopLevelRecordIDs, "allObjects");
      v67 = (id)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_opt_new();
      v81[0] = MEMORY[0x1E0C809B0];
      v81[1] = 3221225472;
      v81[2] = __57__FCRecordChainFetchOperation__issueCloudRequestIfNeeded__block_invoke;
      v81[3] = &unk_1E4643530;
      v81[4] = self;
      objc_msgSend(v67, "fc_dictionaryOfSortedObjectsWithKeyBlock:", v81);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v79[0] = MEMORY[0x1E0C809B0];
      v79[1] = 3221225472;
      v79[2] = __57__FCRecordChainFetchOperation__issueCloudRequestIfNeeded__block_invoke_2;
      v79[3] = &unk_1E4643558;
      v79[4] = self;
      v66 = v19;
      v80 = v66;
      objc_msgSend(v65, "enumerateKeysAndObjectsUsingBlock:", v79);
      if (objc_msgSend(v66, "count"))
      {
        v20 = objc_alloc_init(FCCKBatchedMultiFetchQueryOperation);
        -[FCRecordChainFetchOperation context](self, "context");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "internalContentContext");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "contentDatabase");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[FCCKBatchedMultiFetchQueryOperation setDatabase:]((uint64_t)v20, v23);

        -[FCRecordChainFetchOperation edgeCacheHint](self, "edgeCacheHint");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v24;
        if (v20)
        {
          objc_setProperty_nonatomic_copy(v20, v25, v24, 416);

          v20->_networkEventType = -[FCRecordChainFetchOperation networkEventType](self, "networkEventType");
          -[FCRecordChainFetchOperation networkActivityBlock](self, "networkActivityBlock");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_setProperty_nonatomic_copy(v20, v28, v27, 432);
        }
        else
        {

          -[FCRecordChainFetchOperation networkEventType](self, "networkEventType");
          -[FCRecordChainFetchOperation networkActivityBlock](self, "networkActivityBlock");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
        }

        -[FCRecordChainFetchOperation cachePolicy](self, "cachePolicy");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "cachePolicy");
        if (v20)
          v20->_ignoreCache = v30 == 1;

        v31 = (void *)objc_opt_new();
        -[FCRecordChainFetchOperation edgeCacheHint](self, "edgeCacheHint");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v32 == 0;

        if (v33)
        {
          objc_msgSend(v31, "addObjectsFromArray:", v66);
          v78[0] = MEMORY[0x1E0C809B0];
          v78[1] = 3221225472;
          v78[2] = __57__FCRecordChainFetchOperation__issueCloudRequestIfNeeded__block_invoke_3;
          v78[3] = &unk_1E463AA78;
          v78[4] = self;
          objc_msgSend(MEMORY[0x1E0C99D80], "fc_dictionary:", v78);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          -[FCCKBatchedMultiFetchQueryOperation setKnownRecordIDsToEtags:]((uint64_t)v20, v47);

        }
        else
        {
          -[FCRecordChainFetchOperation topLevelRecordIDs](self, "topLevelRecordIDs");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "addObjectsFromArray:", v34);

        }
        v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v31);
        -[FCRecordChainFetchOperation linkKeysByRecordType](self, "linkKeysByRecordType");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "allKeys");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "addObjectsFromArray:", v50);

        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = 0u;
        v77 = 0u;
        v74 = 0u;
        v75 = 0u;
        v52 = v48;
        v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v74, &aBlock, 16);
        if (v53)
        {
          v54 = *(_QWORD *)v75;
          do
          {
            for (i = 0; i != v53; ++i)
            {
              if (*(_QWORD *)v75 != v54)
                objc_enumerationMutation(v52);
              -[FCRecordChainFetchOperation _recordSourceForRecordType:]((id *)&self->super.super.super.isa, *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * i));
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              v57 = (void *)objc_opt_class();

              if (objc_msgSend(v57, "supportsDeletions"))
              {
                objc_msgSend(v57, "canaryRecordName");
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "addObject:", v58);
                objc_msgSend(v51, "addObject:", v58);

              }
            }
            v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v74, &aBlock, 16);
          }
          while (v53);
        }

        -[FCCKBatchedMultiFetchQueryOperation setRecordIDs:]((uint64_t)v20, v31);
        v73[0] = MEMORY[0x1E0C809B0];
        v73[1] = 3221225472;
        v73[2] = __57__FCRecordChainFetchOperation__issueCloudRequestIfNeeded__block_invoke_25;
        v73[3] = &unk_1E463AA30;
        v73[4] = self;
        objc_msgSend(MEMORY[0x1E0C99D20], "fc_array:", v73);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        -[FCCKBatchedMultiFetchQueryOperation setRecordSpecs:]((uint64_t)v20, v59);

        objc_initWeak(&location, v20);
        newValue[0] = MEMORY[0x1E0C809B0];
        newValue[1] = 3221225472;
        newValue[2] = __57__FCRecordChainFetchOperation__issueCloudRequestIfNeeded__block_invoke_5;
        newValue[3] = &unk_1E46435F8;
        newValue[4] = self;
        objc_copyWeak(&v71, &location);
        v61 = v51;
        v70 = v61;
        if (v20)
          objc_setProperty_nonatomic_copy(v20, v60, newValue, 448);
        -[FCOperation associateChildOperation:](self, "associateChildOperation:", v20, v65);
        -[FCOperation start](v20, "start");

        objc_destroyWeak(&v71);
        objc_destroyWeak(&location);

        goto LABEL_40;
      }
      -[FCRecordChainFetchOperation _finalizeResultFromCachedRecords]((uint64_t)self);
      v45 = self->_cachedRecords;
      if (-[FCHeldRecords count](v45, "count"))
      {
        v46 = -[FCRecordChainFetchOperation shouldReturnErrorWhenSomeRecordsMissing](self, "shouldReturnErrorWhenSomeRecordsMissing");

        if (!v46)
        {
          -[FCOperation finishedPerformingOperationWithError:](self, "finishedPerformingOperationWithError:", 0);
LABEL_40:

          return;
        }
      }
      else
      {

      }
      -[FCRecordChainFetchOperation _errorForMissingRecordNames:]((uint64_t)self, v67);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCOperation finishedPerformingOperationWithError:](self, "finishedPerformingOperationWithError:", v62);

      goto LABEL_40;
    }
    -[FCRecordChainFetchOperation _finalizeResultFromCachedRecords]((uint64_t)self);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    aBlock = MEMORY[0x1E0C809B0];
    v83 = 3221225472;
    v84 = __65__FCRecordChainFetchOperation__recordIDsMissingFromCachedRecords__block_invoke;
    v85 = &unk_1E46434E0;
    v36 = v35;
    v86 = v36;
    v37 = _Block_copy(&aBlock);
    *(_QWORD *)&v74 = MEMORY[0x1E0C809B0];
    *((_QWORD *)&v74 + 1) = 3221225472;
    *(_QWORD *)&v75 = __65__FCRecordChainFetchOperation__recordIDsMissingFromCachedRecords__block_invoke_2;
    *((_QWORD *)&v75 + 1) = &unk_1E4643508;
    *(_QWORD *)&v76 = self;
    v38 = _Block_copy(&v74);
    v39 = (void *)MEMORY[0x1E0C99E60];
    -[FCRecordChainFetchOperation topLevelRecordIDs](self, "topLevelRecordIDs");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setWithArray:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCRecordChainFetchOperation _walkRecordChainStartingWithRecordIDs:visitedRecordIDs:recordsLookupBlock:visitorBlock:](self, v41, v42, v38, v37);

    v68 = v36;
    if (!-[FCRecordChainFetchOperation count](v68, "count"))
      goto LABEL_21;
    v43 = self->_cachedRecords;
    if (-[FCHeldRecords count](v43, "count"))
    {
      v44 = -[FCRecordChainFetchOperation shouldReturnErrorWhenSomeRecordsMissing](self, "shouldReturnErrorWhenSomeRecordsMissing");

      if (!v44)
      {
LABEL_21:
        -[FCOperation finishedPerformingOperationWithError:](self, "finishedPerformingOperationWithError:", 0);
LABEL_44:

        return;
      }
    }
    else
    {

    }
    -[FCRecordChainFetchOperation allObjects](v68, "allObjects");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCRecordChainFetchOperation _errorForMissingRecordNames:]((uint64_t)self, v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    -[FCOperation finishedPerformingOperationWithError:](self, "finishedPerformingOperationWithError:", v64);
    goto LABEL_44;
  }
}

- (NSArray)topLevelRecordIDs
{
  return self->_topLevelRecordIDs;
}

- (BOOL)shouldBypassRecordSourcePersistence
{
  return self->_shouldBypassRecordSourcePersistence;
}

- (void)_finalizeResultFromCachedRecords
{
  uint64_t v2;
  void (**v3)(void);
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD aBlock[5];

  if (a1)
  {
    v2 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __63__FCRecordChainFetchOperation__finalizeResultFromCachedRecords__block_invoke;
    aBlock[3] = &unk_1E46436D8;
    aBlock[4] = a1;
    v3 = (void (**)(void))_Block_copy(aBlock);
    v3[2]();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (*)(void (**)(void)))v3[2])(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 496);
    v17[0] = v2;
    v17[1] = 3221225472;
    v17[2] = __63__FCRecordChainFetchOperation__finalizeResultFromCachedRecords__block_invoke_4;
    v17[3] = &unk_1E4643700;
    v7 = v4;
    v18 = v7;
    v8 = v5;
    v19 = v8;
    objc_msgSend(v6, "enumerateRecordsAndInterestTokensWithBlock:", v17);
    v9 = (void *)MEMORY[0x1E0C99D80];
    v14[0] = v2;
    v14[1] = 3221225472;
    v14[2] = __63__FCRecordChainFetchOperation__finalizeResultFromCachedRecords__block_invoke_5;
    v14[3] = &unk_1E463B8D0;
    v15 = v7;
    v16 = v8;
    v10 = v8;
    v11 = v7;
    objc_msgSend(v9, "fc_dictionary:", v14);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(void **)(a1 + 528);
    *(_QWORD *)(a1 + 528) = v12;

  }
}

- (FCEdgeCacheHint)edgeCacheHint
{
  return self->_edgeCacheHint;
}

- (int)networkEventType
{
  return self->_networkEventType;
}

void __66__FCRecordChainFetchOperation__collectCachedRecordsFromRecordIDs___block_invoke(uint64_t a1)
{
  FCHeldRecords *v2;

  v2 = objc_alloc_init(FCHeldRecords);
  -[FCRecordChainFetchOperation setCachedRecords:](*(_QWORD *)(a1 + 32), v2);

}

BOOL __65__FCRecordChainFetchOperation__recordIDsMissingFromCachedRecords__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "base");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "recordType") == *(_DWORD *)(a1 + 32);

  return v4;
}

BOOL __62__FCRecordChainFetchOperation__filterOrphansFromCachedRecords__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "base");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "recordType") == *(_DWORD *)(a1 + 32);

  return v4;
}

uint64_t __62__FCRecordChainFetchOperation__filterOrphansFromCachedRecords__block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "base");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "containsObject:", v4);

  return v5;
}

- (void)setEdgeCacheHint:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 432);
}

- (void)setAdditionalRecordSources:(id)a3
{
  objc_storeStrong((id *)&self->_additionalRecordSources, a3);
}

- (void)setTopLevelRecordIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (void)setRecordChainCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 464);
}

- (void)setLinkKeysByRecordType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (FCRecordChainFetchOperation)init
{
  FCRecordChainFetchOperation *v2;
  NSMutableSet *v3;
  NSMutableSet *actualTopLevelRecordIDs;
  NSMutableSet *v5;
  NSMutableSet *skippedTopLevelRecordIDs;
  NSMutableSet *v7;
  NSMutableSet *missingCachedOnlyTopLevelRecordIDs;
  NSMutableArray *v9;
  NSMutableArray *mutableNetworkEvents;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)FCRecordChainFetchOperation;
  v2 = -[FCOperation init](&v12, sel_init);
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    actualTopLevelRecordIDs = v2->_actualTopLevelRecordIDs;
    v2->_actualTopLevelRecordIDs = v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    skippedTopLevelRecordIDs = v2->_skippedTopLevelRecordIDs;
    v2->_skippedTopLevelRecordIDs = v5;

    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    missingCachedOnlyTopLevelRecordIDs = v2->_missingCachedOnlyTopLevelRecordIDs;
    v2->_missingCachedOnlyTopLevelRecordIDs = v7;

    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    mutableNetworkEvents = v2->_mutableNetworkEvents;
    v2->_mutableNetworkEvents = v9;

  }
  return v2;
}

- (void)setCachePoliciesByRecordType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 408);
}

void __57__FCRecordChainFetchOperation__issueCloudRequestIfNeeded__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[FCRecordChainFetchOperation _recordSourceForRecordType:](*(id **)(a1 + 32), a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchErrorsByKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "readOnlyDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKeyedSubscript:", v14, (_QWORD)v17);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (!v15 || (objc_msgSend(v15, "fc_isCKUnknownItemError") & 1) == 0)
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v14);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableNetworkEvents, 0);
  objc_storeStrong((id *)&self->_resultHeldRecordsByType, 0);
  objc_storeStrong((id *)&self->_missingCachedOnlyTopLevelRecordIDs, 0);
  objc_storeStrong((id *)&self->_skippedTopLevelRecordIDs, 0);
  objc_storeStrong((id *)&self->_actualTopLevelRecordIDs, 0);
  objc_storeStrong((id *)&self->_cachedRecords, 0);
  objc_storeStrong((id *)&self->_pbRecordTypesByRecordType, 0);
  objc_storeStrong((id *)&self->_recordSourcesByRecordType, 0);
  objc_storeStrong((id *)&self->_recordSources, 0);
  objc_storeStrong(&self->_recordChainCompletionHandler, 0);
  objc_storeStrong(&self->_cachedRecordsLookupBlock, 0);
  objc_storeStrong(&self->_networkActivityBlock, 0);
  objc_storeStrong((id *)&self->_additionalRecordSources, 0);
  objc_storeStrong((id *)&self->_edgeCacheHint, 0);
  objc_storeStrong(&self->_dynamicCachePolicyBlock, 0);
  objc_storeStrong((id *)&self->_cachePoliciesByRecordID, 0);
  objc_storeStrong((id *)&self->_cachePoliciesByRecordType, 0);
  objc_storeStrong((id *)&self->_cachePolicy, 0);
  objc_storeStrong((id *)&self->_linkKeysByRecordType, 0);
  objc_storeStrong((id *)&self->_topLevelRecordIDs, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (void)setNetworkEventType:(int)a3
{
  self->_networkEventType = a3;
}

- (NSArray)networkEvents
{
  if (self)
    self = (FCRecordChainFetchOperation *)self->_mutableNetworkEvents;
  return (NSArray *)self;
}

id __66__FCRecordChainFetchOperation__collectCachedRecordsFromRecordIDs___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  void *v10;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = *(_QWORD *)(a1 + 32);
  v7 = a3;
  objc_msgSend(v5, "numberWithInt:", -[FCRecordChainFetchOperation _pbRecordTypeForRecordType:](v6, a2));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "cachedRecordsLookupBlock");
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, id))v9)[2](v9, v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_errorForMissingRecordNames:(uint64_t)a1
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__FCRecordChainFetchOperation__errorForMissingRecordNames___block_invoke_2;
  v8[3] = &unk_1E4643748;
  v8[4] = a1;
  objc_msgSend(a2, "fc_dictionaryWithKeyBlock:valueBlock:", &__block_literal_global_55_1, v8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB35C8];
  v4 = *MEMORY[0x1E0C947D8];
  v9 = *MEMORY[0x1E0C94940];
  v10[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", v4, 2, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __57__FCRecordChainFetchOperation__issueCloudRequestIfNeeded__block_invoke_25(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "linkKeysByRecordType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__FCRecordChainFetchOperation__issueCloudRequestIfNeeded__block_invoke_2_26;
  v6[3] = &unk_1E4643558;
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v6);

}

void __57__FCRecordChainFetchOperation__issueCloudRequestIfNeeded__block_invoke_2_26(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  const char *v19;
  void *v20;
  void *v21;
  const char *v22;
  void *v23;
  SEL v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];

  v32[3] = *MEMORY[0x1E0C80C00];
  v5 = *(id **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  -[FCRecordChainFetchOperation _recordSourceForRecordType:](v5, (uint64_t)v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedLanguageSpecificKeysByOriginalKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedKeysByOriginalKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __57__FCRecordChainFetchOperation__issueCloudRequestIfNeeded__block_invoke_3_27;
  v30[3] = &unk_1E463C9B8;
  v31 = v10;
  v12 = v10;
  objc_msgSend(v6, "fc_arrayByTransformingWithBlock:", v30);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v11;
  v26 = 3221225472;
  v27 = __57__FCRecordChainFetchOperation__issueCloudRequestIfNeeded__block_invoke_4;
  v28 = &unk_1E463C9B8;
  v29 = v9;
  v14 = v9;
  objc_msgSend(v6, "fc_arrayByTransformingWithBlock:", &v25);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v6;
  v32[1] = v13;
  v32[2] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 3, v25, v26, v27, v28);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "fc_arrayByFlattening");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)objc_opt_new();
  v20 = v18;
  if (v18)
    objc_setProperty_nonatomic_copy(v18, v19, v7, 16);

  objc_msgSend(v8, "desiredKeys");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v21;
  if (v20)
  {
    objc_setProperty_nonatomic_copy(v20, v22, v21, 24);

    objc_setProperty_nonatomic_copy(v20, v24, v17, 32);
  }
  else
  {

  }
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v20);

}

uint64_t __57__FCRecordChainFetchOperation__issueCloudRequestIfNeeded__block_invoke_3_27(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
}

void __57__FCRecordChainFetchOperation__issueCloudRequestIfNeeded__block_invoke_7(uint64_t a1, uint64_t a2, void *a3)
{
  id *v4;
  id v5;
  id v6;

  v4 = *(id **)(a1 + 32);
  v5 = a3;
  -[FCRecordChainFetchOperation _recordSourceForRecordType:](v4, a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateFetchDateForRecordIDs:", v5);

}

id __57__FCRecordChainFetchOperation__issueCloudRequestIfNeeded__block_invoke_8(uint64_t a1, void *a2)
{
  return -[FCRecordChainFetchOperation _recordTypeForRecordID:](*(_QWORD *)(a1 + 32), a2);
}

void __57__FCRecordChainFetchOperation__issueCloudRequestIfNeeded__block_invoke_9(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  _QWORD *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[FCRecordChainFetchOperation _recordSourceForRecordType:](*(id **)(a1 + 32), a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_class();
  if (objc_msgSend(v6, "supportsDeletions"))
  {
    objc_msgSend(v6, "canaryRecordName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 40), "containsObject:", v7))
    {
      objc_msgSend(v5, "deleteRecordsWithIDs:", v12);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD **)(a1 + 32);
      if (v9)
        v9 = (_QWORD *)v9[62];
      v10 = v9;
      +[FCHeldRecords heldRecordsByMerging:with:](FCHeldRecords, "heldRecordsByMerging:with:", v8, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCRecordChainFetchOperation setCachedRecords:](*(_QWORD *)(a1 + 32), v11);

    }
  }

}

id __57__FCRecordChainFetchOperation__issueCloudRequestIfNeeded__block_invoke_10(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (v2)
    return v2;
  -[FCRecordChainFetchOperation _partialFetchErrorForMissingRecordName:](*(_QWORD *)(a1 + 40), a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_partialFetchErrorForMissingRecordName:(uint64_t)a1
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Record %@ missing from MultiFetch query"), a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB35C8];
  v4 = *MEMORY[0x1E0C947D8];
  v8 = *MEMORY[0x1E0CB2D50];
  v9[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", v4, 11, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __57__FCRecordChainFetchOperation__issueCloudRequestIfNeeded__block_invoke_11(uint64_t a1, void *a2)
{
  return -[FCRecordChainFetchOperation _recordTypeForRecordID:](*(_QWORD *)(a1 + 32), a2);
}

void __57__FCRecordChainFetchOperation__issueCloudRequestIfNeeded__block_invoke_12(uint64_t a1, uint64_t a2, void *a3)
{
  id *v4;
  id v5;
  void *v6;
  id v7;

  v4 = *(id **)(a1 + 32);
  v5 = a3;
  -[FCRecordChainFetchOperation _recordSourceForRecordType:](v4, a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchErrorsByKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addEntriesFromDictionary:", v5);

}

id __59__FCRecordChainFetchOperation__errorForMissingRecordNames___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0C95070];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithRecordName:", v3);

  return v4;
}

id __59__FCRecordChainFetchOperation__errorForMissingRecordNames___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v5 = *(void **)(v4 + 520);
  else
    v5 = 0;
  v6 = objc_msgSend(v5, "containsObject:", v3);
  v7 = *(_QWORD *)(a1 + 32);
  if (v6)
  {
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Record %@ not cached"), v3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0CB35C8];
      v13 = *MEMORY[0x1E0CB2D50];
      v14[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("FCErrorDomain"), 5, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    -[FCRecordChainFetchOperation _partialFetchErrorForMissingRecordName:](v7, (uint64_t)v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (void)setCachePoliciesByRecordID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (void)setDynamicCachePolicyBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 424);
}

- (BOOL)shouldReturnErrorWhenSomeRecordsMissing
{
  return self->_shouldReturnErrorWhenSomeRecordsMissing;
}

- (void)setShouldReturnErrorWhenSomeRecordsMissing:(BOOL)a3
{
  self->_shouldReturnErrorWhenSomeRecordsMissing = a3;
}

- (BOOL)shouldFailOnLimitExceededError
{
  return self->_shouldFailOnLimitExceededError;
}

- (void)setShouldFailOnLimitExceededError:(BOOL)a3
{
  self->_shouldFailOnLimitExceededError = a3;
}

- (id)networkActivityBlock
{
  return self->_networkActivityBlock;
}

- (void)setNetworkActivityBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 448);
}

- (void)setShouldBypassRecordSourcePersistence:(BOOL)a3
{
  self->_shouldBypassRecordSourcePersistence = a3;
}

- (id)cachedRecordsLookupBlock
{
  return self->_cachedRecordsLookupBlock;
}

- (void)setCachedRecordsLookupBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 456);
}

@end

@implementation FCCKTestMultiFetchQueryEndpoint

- (void)handleQueryOperation:(id)a3 withRecords:(id)a4 droppedFeeds:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  int v29;
  uint64_t v30;
  void *v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t i;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t j;
  uint64_t v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t k;
  uint64_t v65;
  void (**v66)(_QWORD, _QWORD);
  void *v67;
  void *v68;
  void (**v69)(_QWORD, _QWORD);
  void (**v70)(_QWORD, _QWORD, _QWORD);
  void *v71;
  FCCKTestMultiFetchQueryEndpoint *v72;
  id v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  id v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  id obj;
  id obja;
  uint64_t v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  _QWORD v99[4];
  id v100;
  id v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  _BYTE v106[128];
  _BYTE v107[128];
  _BYTE v108[128];
  uint8_t v109[128];
  uint8_t buf[4];
  const char *v111;
  __int16 v112;
  char *v113;
  __int16 v114;
  int v115;
  __int16 v116;
  void *v117;
  uint64_t v118;

  v118 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v78 = a5;
  objc_msgSend(v8, "query");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v77 = v10;
  objc_msgSend(v10, "predicate");
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

  v79 = v9;
  v76 = v13;
  if (v13 && objc_msgSend(v13, "compoundPredicateType") == 1)
    goto LABEL_10;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unexpected feed query predicate type"));
    *(_DWORD *)buf = 136315906;
    v111 = "-[FCCKTestMultiFetchQueryEndpoint handleQueryOperation:withRecords:droppedFeeds:]";
    v112 = 2080;
    v113 = "FCCKTestContentDatabase.m";
    v114 = 1024;
    v115 = 1237;
    v116 = 2114;
    v117 = v38;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v13)
      goto LABEL_10;
  }
  else if (v13)
  {
LABEL_10:
    v72 = self;
    v74 = v8;
    v104 = 0u;
    v105 = 0u;
    v102 = 0u;
    v103 = 0u;
    objc_msgSend(v13, "subpredicates");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v102, v109, 16);
    if (!v15)
    {
      v81 = 0;
      obj = 0;
      v17 = 0;
      goto LABEL_33;
    }
    v16 = v15;
    v81 = 0;
    obj = 0;
    v17 = 0;
    v18 = *(_QWORD *)v103;
    while (1)
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v103 != v18)
          objc_enumerationMutation(v14);
        v20 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * v19);
        objc_opt_class();
        if (!v20 || (objc_opt_isKindOfClass() & 1) == 0)
        {
          v21 = 0;
          goto LABEL_22;
        }
        v21 = v20;
        if (objc_msgSend(v21, "predicateOperatorType") != 99)
          goto LABEL_22;
        objc_msgSend(v21, "rightExpression");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v22, "expressionType") == 3)
        {
          objc_msgSend(v22, "keyPath");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("recordIDs"));

          if (v24)
          {
            objc_msgSend(v21, "leftExpression");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "constantValue");
            v26 = objc_claimAutoreleasedReturnValue();
            v27 = v17;
            v17 = (void *)v26;
LABEL_28:

            goto LABEL_29;
          }
          objc_msgSend(v22, "keyPath");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "isEqualToString:", CFSTR("recordTypes"));

          if (v29)
          {
            objc_msgSend(v21, "leftExpression");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "constantValue");
            v30 = objc_claimAutoreleasedReturnValue();
            v27 = obj;
            obj = (id)v30;
            goto LABEL_28;
          }
          objc_msgSend(v22, "keyPath");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v31, "isEqualToString:", CFSTR("fetchFields"));

          if (v32)
          {
            objc_msgSend(v21, "leftExpression");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "constantValue");
            v33 = objc_claimAutoreleasedReturnValue();
            v27 = v81;
            v81 = (void *)v33;
            goto LABEL_28;
          }
        }
LABEL_29:

LABEL_22:
        ++v19;
      }
      while (v16 != v19);
      v34 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v102, v109, 16);
      v16 = v34;
      if (!v34)
      {
LABEL_33:

        self = v72;
        v8 = v74;
        v9 = v79;
        v35 = v17;
        v36 = v81;
        v37 = obj;
        goto LABEL_36;
      }
    }
  }
  v36 = 0;
  v37 = 0;
  v35 = 0;
LABEL_36:
  v39 = (void *)MEMORY[0x1E0C99D80];
  v99[0] = MEMORY[0x1E0C809B0];
  v99[1] = 3221225472;
  v99[2] = __81__FCCKTestMultiFetchQueryEndpoint_handleQueryOperation_withRecords_droppedFeeds___block_invoke;
  v99[3] = &unk_1E463B8D0;
  v40 = v37;
  v100 = v40;
  v83 = v36;
  v101 = v83;
  objc_msgSend(v39, "fc_dictionary:", v99);
  v41 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v42 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = (void *)v42;
  v82 = (void *)v41;
  -[FCCKTestMultiFetchQueryEndpoint _collectRecordsWithRecords:recordIDs:linkKeysByRecordType:visitedRecordIDs:missingRecordIDs:](self, "_collectRecordsWithRecords:recordIDs:linkKeysByRecordType:visitedRecordIDs:missingRecordIDs:", v9, v35, v41, v43, v42);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "desiredKeys");
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (v45)
  {
    v73 = v40;
    v75 = v35;
    v97 = 0u;
    v98 = 0u;
    v95 = 0u;
    v96 = 0u;
    v71 = v44;
    obja = v44;
    v46 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v95, v108, 16);
    if (v46)
    {
      v47 = v46;
      v86 = *(_QWORD *)v96;
      do
      {
        for (i = 0; i != v47; ++i)
        {
          if (*(_QWORD *)v96 != v86)
            objc_enumerationMutation(obja);
          v49 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * i);
          v50 = (void *)MEMORY[0x1E0C99E60];
          v51 = v8;
          objc_msgSend(v8, "desiredKeys", v71);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "setWithArray:", v52);
          v53 = (void *)objc_claimAutoreleasedReturnValue();

          v93 = 0u;
          v94 = 0u;
          v91 = 0u;
          v92 = 0u;
          objc_msgSend(v49, "changedKeys");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v91, v107, 16);
          if (v55)
          {
            v56 = v55;
            v57 = *(_QWORD *)v92;
            do
            {
              for (j = 0; j != v56; ++j)
              {
                if (*(_QWORD *)v92 != v57)
                  objc_enumerationMutation(v54);
                v59 = *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * j);
                if ((objc_msgSend(v53, "containsObject:", v59) & 1) == 0)
                  objc_msgSend(v49, "setObject:forKeyedSubscript:", 0, v59);
              }
              v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v91, v107, 16);
            }
            while (v56);
          }

          v8 = v51;
        }
        v47 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v95, v108, 16);
      }
      while (v47);
    }

    v9 = v79;
    v40 = v73;
    v35 = v75;
    v44 = v71;
  }
  v89 = 0u;
  v90 = 0u;
  v87 = 0u;
  v88 = 0u;
  v60 = v44;
  v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v87, v106, 16);
  if (v61)
  {
    v62 = v61;
    v63 = *(_QWORD *)v88;
    do
    {
      for (k = 0; k != v62; ++k)
      {
        if (*(_QWORD *)v88 != v63)
          objc_enumerationMutation(v60);
        v65 = *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * k);
        objc_msgSend(v8, "recordFetchedBlock", v71);
        v66 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v66[2](v66, v65);

      }
      v62 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v87, v106, 16);
    }
    while (v62);
  }

  v67 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95048]), "initWithRecordType:", CFSTR("Results"));
  objc_msgSend(v80, "allObjects");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "setObject:forKeyedSubscript:", v68, CFSTR("notFound"));

  objc_msgSend(v8, "recordFetchedBlock");
  v69 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v69)[2](v69, v67);

  objc_msgSend(v8, "queryCompletionBlock");
  v70 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v70[2](v70, 0, 0);

}

void __81__FCCKTestMultiFetchQueryEndpoint_handleQueryOperation_withRecords_droppedFeeds___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __81__FCCKTestMultiFetchQueryEndpoint_handleQueryOperation_withRecords_droppedFeeds___block_invoke_2;
  v7[3] = &unk_1E4646E08;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "fc_enumerateSideBySideWithArray:reverse:block:", v4, 0, v7);

}

void __81__FCCKTestMultiFetchQueryEndpoint_handleQueryOperation_withRecords_droppedFeeds___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(v5, "componentsSeparatedByString:", CFSTR(","));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v7);

  }
}

- (id)_collectRecordsWithRecords:(id)a3 recordIDs:(id)a4 linkKeysByRecordType:(id)a5 visitedRecordIDs:(id)a6 missingRecordIDs:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v26;
  void *v27;
  void *v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (!v12 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "records");
    *(_DWORD *)buf = 136315906;
    v30 = "-[FCCKTestMultiFetchQueryEndpoint _collectRecordsWithRecords:recordIDs:linkKeysByRecordType:visitedRecordIDs:m"
          "issingRecordIDs:]";
    v31 = 2080;
    v32 = "FCCKTestContentDatabase.m";
    v33 = 1024;
    v34 = 1324;
    v35 = 2114;
    v36 = v26;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v13)
      goto LABEL_6;
  }
  else if (v13)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "recordIDs");
    *(_DWORD *)buf = 136315906;
    v30 = "-[FCCKTestMultiFetchQueryEndpoint _collectRecordsWithRecords:recordIDs:linkKeysByRecordType:visitedRecordIDs:m"
          "issingRecordIDs:]";
    v31 = 2080;
    v32 = "FCCKTestContentDatabase.m";
    v33 = 1024;
    v34 = 1325;
    v35 = 2114;
    v36 = v27;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  if (!v14 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "linkKeysByRecordType");
    *(_DWORD *)buf = 136315906;
    v30 = "-[FCCKTestMultiFetchQueryEndpoint _collectRecordsWithRecords:recordIDs:linkKeysByRecordType:visitedRecordIDs:m"
          "issingRecordIDs:]";
    v31 = 2080;
    v32 = "FCCKTestContentDatabase.m";
    v33 = 1024;
    v34 = 1326;
    v35 = 2114;
    v36 = v28;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  objc_msgSend(v16, "addObjectsFromArray:", v13);
  FCLookupRecordByNames(v12, v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "fc_arrayByTransformingWithBlock:", &__block_literal_global_124);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "fc_removeObjectsFromArray:", v18);

  -[FCCKTestMultiFetchQueryEndpoint _collectRecordIDsFromRecords:linkKeysByRecordType:](self, "_collectRecordIDsFromRecords:linkKeysByRecordType:", v17, v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "allObjects");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "fc_arrayByRemovingObjectsInArray:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v21, "count"))
  {
    objc_msgSend(v15, "addObjectsFromArray:", v21);
    -[FCCKTestMultiFetchQueryEndpoint _collectRecordsWithRecords:recordIDs:linkKeysByRecordType:visitedRecordIDs:missingRecordIDs:](self, "_collectRecordsWithRecords:recordIDs:linkKeysByRecordType:visitedRecordIDs:missingRecordIDs:", v12, v21, v14, v15, v16);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "arrayByAddingObjectsFromArray:", v22);
    v23 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v23 = v17;
  }
  v24 = v23;

  return v24;
}

id __127__FCCKTestMultiFetchQueryEndpoint__collectRecordsWithRecords_recordIDs_linkKeysByRecordType_visitedRecordIDs_missingRecordIDs___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "recordID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recordName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_collectRecordIDsFromRecords:(id)a3 linkKeysByRecordType:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!v5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "records");
    *(_DWORD *)buf = 136315906;
    v18 = "-[FCCKTestMultiFetchQueryEndpoint _collectRecordIDsFromRecords:linkKeysByRecordType:]";
    v19 = 2080;
    v20 = "FCCKTestContentDatabase.m";
    v21 = 1024;
    v22 = 1358;
    v23 = 2114;
    v24 = v12;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v6)
      goto LABEL_6;
  }
  else if (v6)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "linkKeysByRecordType");
    *(_DWORD *)buf = 136315906;
    v18 = "-[FCCKTestMultiFetchQueryEndpoint _collectRecordIDsFromRecords:linkKeysByRecordType:]";
    v19 = 2080;
    v20 = "FCCKTestContentDatabase.m";
    v21 = 1024;
    v22 = 1359;
    v23 = 2114;
    v24 = v13;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  v7 = (void *)MEMORY[0x1E0C99D20];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __85__FCCKTestMultiFetchQueryEndpoint__collectRecordIDsFromRecords_linkKeysByRecordType___block_invoke;
  v14[3] = &unk_1E463EFB0;
  v15 = v5;
  v16 = v6;
  v8 = v6;
  v9 = v5;
  objc_msgSend(v7, "fc_array:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __85__FCCKTestMultiFetchQueryEndpoint__collectRecordIDsFromRecords_linkKeysByRecordType___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id obj;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  char *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  void *v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v26 = a2;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v23 = a1;
  obj = *(id *)(a1 + 32);
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
  if (v24)
  {
    v3 = 0x1E0CB3000uLL;
    v4 = 0x1E0C95000uLL;
    v22 = *(_QWORD *)v32;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v32 != v22)
          objc_enumerationMutation(obj);
        v25 = v5;
        v6 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v5);
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v7 = *(void **)(v23 + 40);
        objc_msgSend(v6, "recordType");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v28;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v28 != v12)
                objc_enumerationMutation(v9);
              objc_msgSend(v6, "valueForKey:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i));
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v26, "addObject:", v14);
                goto LABEL_24;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v14, "recordID");
                v15 = v3;
                v16 = v4;
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "recordName");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "addObject:", v18);

                v4 = v16;
                v3 = v15;
                goto LABEL_24;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                if ((objc_msgSend(v14, "fc_containsObjectPassingTest:", &__block_literal_global_218) & 1) != 0)
                {
                  if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                    goto LABEL_24;
                  v19 = (void *)objc_msgSend(objc_alloc(*(Class *)(v3 + 2368)), "initWithFormat:", CFSTR("not yet supported"));
                  *(_DWORD *)buf = 136315906;
                  v36 = "-[FCCKTestMultiFetchQueryEndpoint _collectRecordIDsFromRecords:linkKeysByRecordType:]_block_invoke";
                  v37 = 2080;
                  v38 = "FCCKTestContentDatabase.m";
                  v39 = 1024;
                  v40 = 1388;
                  v41 = 2114;
                  v42 = v19;
                  v20 = MEMORY[0x1E0C81028];
                  goto LABEL_22;
                }
                objc_msgSend(v26, "addObjectsFromArray:", v14);
              }
              else if (v14 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              {
                v19 = (void *)objc_msgSend(objc_alloc(*(Class *)(v3 + 2368)), "initWithFormat:", CFSTR("not yet supported"));
                *(_DWORD *)buf = 136315906;
                v36 = "-[FCCKTestMultiFetchQueryEndpoint _collectRecordIDsFromRecords:linkKeysByRecordType:]_block_invoke";
                v37 = 2080;
                v38 = "FCCKTestContentDatabase.m";
                v39 = 1024;
                v40 = 1393;
                v41 = 2114;
                v42 = v19;
                v20 = MEMORY[0x1E0C81028];
LABEL_22:
                _os_log_error_impl(&dword_1A1B90000, v20, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

              }
LABEL_24:

            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
          }
          while (v11);
        }

        v5 = v25 + 1;
      }
      while (v25 + 1 != v24);
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
    }
    while (v24);
  }

}

BOOL __85__FCCKTestMultiFetchQueryEndpoint__collectRecordIDsFromRecords_linkKeysByRecordType___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

@end

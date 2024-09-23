@implementation FCCKMultiFeedQueryOperation

- (BOOL)validateOperation
{
  FCCKMultiFeedQueryOperation *v2;
  NSArray *feedRequests;
  FCCKContentDatabase *v4;
  FCCKContentDatabase *v5;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v2 = self;
  v18 = *MEMORY[0x1E0C80C00];
  if (self && self->_database)
    goto LABEL_5;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("feed query must have a database"));
    v10 = 136315906;
    v11 = "-[FCCKMultiFeedQueryOperation validateOperation]";
    v12 = 2080;
    v13 = "FCCKMultiFeedQueryOperation.m";
    v14 = 1024;
    v15 = 81;
    v16 = 2114;
    v17 = v7;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v10, 0x26u);

    if (v2)
      goto LABEL_5;
LABEL_21:
    feedRequests = 0;
    goto LABEL_6;
  }
  if (!v2)
    goto LABEL_21;
LABEL_5:
  feedRequests = v2->_feedRequests;
LABEL_6:
  if (!-[NSArray count](feedRequests, "count") && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("feed query must have at least one feed request"));
    v10 = 136315906;
    v11 = "-[FCCKMultiFeedQueryOperation validateOperation]";
    v12 = 2080;
    v13 = "FCCKMultiFeedQueryOperation.m";
    v14 = 1024;
    v15 = 82;
    v16 = 2114;
    v17 = v8;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v10, 0x26u);

  }
  if (!v2 || !v2->_resultsLimit)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("feed query must have a non-zero results limit"));
      v10 = 136315906;
      v11 = "-[FCCKMultiFeedQueryOperation validateOperation]";
      v12 = 2080;
      v13 = "FCCKMultiFeedQueryOperation.m";
      v14 = 1024;
      v15 = 83;
      v16 = 2114;
      v17 = v9;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v10, 0x26u);

      if (!v2)
        return (char)v2;
    }
    else if (!v2)
    {
      return (char)v2;
    }
  }
  v4 = v2->_database;
  if (v4)
  {
    v5 = v4;
    if (-[NSArray count](v2->_feedRequests, "count"))
      LOBYTE(v2) = v2->_resultsLimit != 0;
    else
      LOBYTE(v2) = 0;

  }
  else
  {
    LOBYTE(v2) = 0;
  }
  return (char)v2;
}

- (void)prepareOperation
{
  FCCKMultiFeedQueryOperation *v2;
  NSArray *feedRequests;
  NSArray *v4;
  const char *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  char *v10;
  int v11;
  const char *v12;
  __int16 v13;
  char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v2 = self;
  v19 = *MEMORY[0x1E0C80C00];
  if (self)
    self = (FCCKMultiFeedQueryOperation *)self->_feedRequests;
  if ((unint64_t)-[FCCKMultiFeedQueryOperation count](self, "count") >= 0x191
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("exceeded maximum number of feed requests"));
    v11 = 136315906;
    v12 = "-[FCCKMultiFeedQueryOperation prepareOperation]";
    v13 = 2080;
    v14 = "FCCKMultiFeedQueryOperation.m";
    v15 = 1024;
    v16 = 91;
    v17 = 2114;
    v18 = v8;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v11, 0x26u);

    if (v2)
      goto LABEL_6;
  }
  else if (v2)
  {
LABEL_6:
    feedRequests = v2->_feedRequests;
    goto LABEL_7;
  }
  feedRequests = 0;
LABEL_7:
  if (-[NSArray count](feedRequests, "count") >= 0x191)
  {
    if (v2)
      v4 = v2->_feedRequests;
    else
      v4 = 0;
    -[NSArray fc_subarrayWithMaxCount:](v4, "fc_subarrayWithMaxCount:", 400);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
      objc_setProperty_nonatomic_copy(v2, v5, v6, 376);

    v7 = (void *)FCOperationLog;
    if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_ERROR))
    {
      v9 = v7;
      -[FCOperation shortOperationDescription](v2, "shortOperationDescription");
      v10 = (char *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v10;
      _os_log_error_impl(&dword_1A1B90000, v9, OS_LOG_TYPE_ERROR, "%{public}@ dropping feeds because the limit was exeeded", (uint8_t *)&v11, 0xCu);

    }
  }
}

- (void)performOperation
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  NSObject *v22;
  FCCKContentQueryOperation *v23;
  uint64_t v24;
  NSArray *v25;
  const char *v26;
  NSArray *v27;
  NSArray *v28;
  id v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  NSArray *feedRequests;
  uint64_t v35;
  void *v36;
  unint64_t resultsLimit;
  unint64_t queryPriority;
  const char *v39;
  uint64_t v40;
  const char *v41;
  _QWORD v42[9];
  id v43;
  id location;
  _QWORD newValue[8];
  _QWORD v46[5];
  id v47;
  _QWORD v48[5];
  id v49;
  _QWORD v50[5];
  id v51;
  _BYTE buf[24];
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v3 = (id)FCOperationLog;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    -[FCOperation shortOperationDescription](self, "shortOperationDescription");
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = (void *)v32;
    if (self)
      feedRequests = self->_feedRequests;
    else
      feedRequests = 0;
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v32;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = feedRequests;
    _os_log_debug_impl(&dword_1A1B90000, v3, OS_LOG_TYPE_DEBUG, "%{public}@ started with feed requests: %@", buf, 0x16u);

  }
  if (self)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKMultiFeedQueryOperation _predicateForPerFeedFieldName:key:defaultValue:]((uint64_t)self, CFSTR("tagID"), CFSTR("feedID"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKMultiFeedQueryOperation _predicateForPerFeedFieldName:key:defaultValue:]((uint64_t)self, CFSTR("cursor"), CFSTR("startCursor"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v7);

    -[FCCKMultiFeedQueryOperation _predicateForPerFeedFieldName:key:defaultValue:]((uint64_t)self, CFSTR("maxOrder"), CFSTR("startOrder"), &unk_1E470A5B0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v8);

    -[FCCKMultiFeedQueryOperation _predicateForPerFeedFieldName:key:defaultValue:]((uint64_t)self, CFSTR("minOrder"), CFSTR("orderLimit"), &unk_1E470A5C8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v9);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_resultsLimit);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKMultiFeedQueryOperation _predicateForPerFeedFieldName:key:defaultValue:]((uint64_t)self, CFSTR("softLimit"), CFSTR("softResultsLimit"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v11);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_resultsLimit);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKMultiFeedQueryOperation _predicateForPerFeedFieldName:key:defaultValue:]((uint64_t)self, CFSTR("hardLimit"), CFSTR("hardResultsLimit"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v13);

    if (self->_sortingFunction == 1)
      v14 = CFSTR("relativeNewness");
    else
      v14 = CFSTR("order");
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("sortingFunction"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v15);

    v16 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_queryPriority);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("priority"), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v18);

    if (-[NSArray count](self->_articleLinkKeys, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("tagField"), self->_articleLinkKeys);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v19);

    }
    objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (uint64_t (*)(uint64_t, uint64_t))objc_msgSend(objc_alloc(MEMORY[0x1E0C95010]), "initWithRecordType:predicate:", CFSTR("MultiFeed"), v20);

  }
  else
  {
    v21 = 0;
  }
  v22 = (id)FCOperationLog;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    -[FCOperation shortOperationDescription](self, "shortOperationDescription");
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = (void *)v35;
    if (self)
      resultsLimit = self->_resultsLimit;
    else
      resultsLimit = 0;
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v35;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = resultsLimit;
    *(_WORD *)&buf[22] = 2112;
    v53 = v21;
    _os_log_debug_impl(&dword_1A1B90000, v22, OS_LOG_TYPE_DEBUG, "%{public}@ issuing query with results limit %lu: %@", buf, 0x20u);

  }
  v23 = objc_alloc_init(FCCKContentQueryOperation);
  v24 = (uint64_t)v23;
  if (self)
  {
    -[FCCKContentQueryOperation setDatabase:]((uint64_t)v23, self->_database);
    -[FCCKContentQueryOperation setQuery:](v24, v21);
    if (v24)
      *(_QWORD *)(v24 + 400) = self->_resultsLimit;
    v25 = self->_desiredKeys;
    if (v25)
    {
      v27 = v25;
      v28 = self->_desiredKeys;
      if (qword_1EE657BB0 != -1)
        dispatch_once(&qword_1EE657BB0, &__block_literal_global_54);
      v29 = (id)_MergedGlobals_29;
      -[NSArray arrayByAddingObjectsFromArray:](v28, "arrayByAddingObjectsFromArray:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        objc_setProperty_nonatomic_copy((id)v24, v31, v30, 408);

        *(_DWORD *)(v24 + 372) = 11;
      }
      else
      {

      }
LABEL_30:
      queryPriority = self->_queryPriority;
      if (!v24)
        goto LABEL_32;
      goto LABEL_31;
    }
  }
  else
  {
    -[FCCKContentQueryOperation setDatabase:]((uint64_t)v23, 0);
    -[FCCKContentQueryOperation setQuery:](v24, v21);
    if (!v24)
      goto LABEL_29;
    *(_QWORD *)(v24 + 400) = 0;
  }
  if (v24)
  {
    objc_setProperty_nonatomic_copy((id)v24, v26, 0, 408);
    *(_DWORD *)(v24 + 372) = 11;
  }
LABEL_29:
  if (self)
    goto LABEL_30;
  queryPriority = 0;
  if (v24)
LABEL_31:
    *(_QWORD *)(v24 + 456) = queryPriority;
LABEL_32:
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v53 = __Block_byref_object_copy__21;
  v54 = __Block_byref_object_dispose__21;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v55 = (id)objc_claimAutoreleasedReturnValue();
  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x3032000000;
  v50[3] = __Block_byref_object_copy__21;
  v50[4] = __Block_byref_object_dispose__21;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v51 = (id)objc_claimAutoreleasedReturnValue();
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x3032000000;
  v48[3] = __Block_byref_object_copy__21;
  v48[4] = __Block_byref_object_dispose__21;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v49 = (id)objc_claimAutoreleasedReturnValue();
  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x3032000000;
  v46[3] = __Block_byref_object_copy__21;
  v46[4] = __Block_byref_object_dispose__21;
  v47 = 0;
  v40 = MEMORY[0x1E0C809B0];
  newValue[0] = MEMORY[0x1E0C809B0];
  newValue[1] = 3221225472;
  newValue[2] = __47__FCCKMultiFeedQueryOperation_performOperation__block_invoke;
  newValue[3] = &unk_1E463F200;
  newValue[4] = v46;
  newValue[5] = v50;
  newValue[6] = v48;
  newValue[7] = buf;
  if (v24)
    objc_setProperty_nonatomic_copy((id)v24, v39, newValue, 416);
  objc_initWeak(&location, (id)v24);
  v42[0] = v40;
  v42[2] = __47__FCCKMultiFeedQueryOperation_performOperation__block_invoke_2;
  v42[3] = &unk_1E463F228;
  v42[4] = self;
  v42[5] = buf;
  v42[6] = v50;
  v42[7] = v46;
  v42[8] = v48;
  v42[1] = 3221225472;
  objc_copyWeak(&v43, &location);
  if (v24)
    objc_setProperty_nonatomic_copy((id)v24, v41, v42, 424);
  -[FCOperation associateChildOperation:](self, "associateChildOperation:", v24);
  objc_msgSend((id)v24, "start");
  objc_destroyWeak(&v43);
  objc_destroyWeak(&location);
  _Block_object_dispose(v46, 8);

  _Block_object_dispose(v48, 8);
  _Block_object_dispose(v50, 8);

  _Block_object_dispose(buf, 8);
}

void __47__FCCKMultiFeedQueryOperation_performOperation__block_invoke(_QWORD *a1, void *a2)
{
  void *v4;
  int v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  int v10;
  id v11;

  v11 = a2;
  objc_msgSend(v11, "recordType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("Results"));

  if (v5)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[4] + 8) + 40), a2);
  }
  else
  {
    objc_msgSend(v11, "recordType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("Tag"));

    if (v7)
    {
      v8 = a1[5];
    }
    else
    {
      objc_msgSend(v11, "recordType");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("Issue"));

      if (v10)
        v8 = a1[6];
      else
        v8 = a1[7];
    }
    objc_msgSend(*(id *)(*(_QWORD *)(v8 + 8) + 40), "addObject:", v11);
  }

}

void __47__FCCKMultiFeedQueryOperation_performOperation__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  NSObject *v23;
  char *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t i;
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
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  FCCKFeedResponse *v62;
  void *v63;
  const char *v64;
  id v65;
  void *v66;
  id v67;
  void *v68;
  char v69;
  void *v70;
  id v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  id v80;
  const char *v81;
  void *v82;
  void *v83;
  id v84;
  void *v85;
  char v86;
  void *v87;
  id v88;
  void *v89;
  char v90;
  NSArray *feedItemAndArticleRecords;
  NSArray *v92;
  uint64_t v93;
  void *v94;
  id v95;
  void *v96;
  const char *v97;
  void *v98;
  uint64_t v99;
  uint64_t extent;
  uint64_t v101;
  void *v102;
  uint64_t v103;
  _QWORD *v104;
  NSObject *v105;
  NSObject *v106;
  char *v107;
  uint64_t v108;
  id WeakRetained;
  void *v110;
  char *v111;
  void *v112;
  id v113;
  void *v114;
  void *v115;
  NSObject *v116;
  char *v117;
  id v118;
  void *v119;
  char *v120;
  void *v121;
  id v122;
  char *v123;
  id v124;
  void *v125;
  void *v126;
  const char *v127;
  id v128;
  void *v129;
  _QWORD *v130;
  uint64_t v131;
  id v132;
  uint64_t v133;
  char *v134;
  id v135;
  id v136;
  id v137;
  id v138;
  id v139;
  id v140;
  void *v141;
  id v142;
  uint64_t v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  uint64_t v148;
  uint64_t v149;
  id obj;
  uint64_t v151;
  id v152;
  id v153;
  void *v154;
  void *v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  uint8_t v164[4];
  const char *v165;
  __int16 v166;
  char *v167;
  __int16 v168;
  int v169;
  __int16 v170;
  void *v171;
  uint8_t v172[4];
  const char *v173;
  __int16 v174;
  char *v175;
  __int16 v176;
  int v177;
  __int16 v178;
  void *v179;
  uint8_t buf[4];
  const char *v181;
  __int16 v182;
  char *v183;
  __int16 v184;
  _BYTE v185[18];
  uint64_t v186;

  v186 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEBUG))
  {
    v9 = *(void **)(a1 + 32);
    v10 = v7;
    objc_msgSend(v9, "shortOperationDescription");
    v11 = (char *)objc_claimAutoreleasedReturnValue();
    v12 = a1;
    v13 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "count");
    v14 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v12 + 48) + 8) + 40), "count");
    v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v12 + 56) + 8) + 40);
    *(_DWORD *)buf = 138544130;
    v181 = v11;
    v182 = 2048;
    v183 = (char *)v13;
    a1 = v12;
    v184 = 2048;
    *(_QWORD *)v185 = v14;
    *(_WORD *)&v185[8] = 2112;
    *(_QWORD *)&v185[10] = v15;
    _os_log_debug_impl(&dword_1A1B90000, v10, OS_LOG_TYPE_DEBUG, "%{public}@ received response with %lu FeedItemAndArticleRecords, %lu TagRecords and Results record: %@", buf, 0x2Au);

    if (v6)
      goto LABEL_3;
  }
  else if (v6)
  {
LABEL_3:
    FCErrorForCKError(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKMultiFeedQueryOperation setResultError:](*(_QWORD *)(a1 + 32), v8);

    goto LABEL_109;
  }
  v16 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (!v16)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v115 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("must always have a Results record"));
      *(_DWORD *)buf = 136315906;
      v181 = "-[FCCKMultiFeedQueryOperation performOperation]_block_invoke";
      v182 = 2080;
      v183 = "FCCKMultiFeedQueryOperation.m";
      v184 = 1024;
      *(_DWORD *)v185 = 147;
      *(_WORD *)&v185[4] = 2114;
      *(_QWORD *)&v185[6] = v115;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      v16 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    }
    else
    {
      v16 = 0;
    }
  }
  v17 = *(_QWORD *)(a1 + 32);
  v18 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v19 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v20 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  v21 = v16;
  v136 = v18;
  v142 = v18;
  v137 = v19;
  v140 = v19;
  v138 = v20;
  v139 = v20;
  v149 = v17;
  if (v17)
  {
    v135 = v5;
    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("droppedFeeds"));
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v141, "unsignedIntegerValue"))
    {
      v22 = (void *)FCOperationLog;
      if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
      {
        v23 = v22;
        objc_msgSend((id)v149, "shortOperationDescription");
        v24 = (char *)objc_claimAutoreleasedReturnValue();
        v25 = v21;
        v26 = a1;
        v27 = objc_msgSend(v141, "unsignedIntegerValue");
        v28 = v6;
        v29 = *(id *)(v149 + 376);
        v30 = objc_msgSend(v29, "count");
        *(_DWORD *)buf = 138543874;
        v181 = v24;
        v182 = 2048;
        v183 = (char *)v27;
        a1 = v26;
        v21 = v25;
        v184 = 2048;
        *(_QWORD *)v185 = v30;
        _os_log_impl(&dword_1A1B90000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ %lu of %lu feeds were dropped", buf, 0x20u);

        v6 = v28;
      }
    }
    v133 = a1;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v148 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("reachedMinOrder"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKMultiFeedQueryOperation _feedRelativeDictionaryFromResultsArray:](v149, v31);
    v147 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("reachedEnd"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKMultiFeedQueryOperation _feedRelativeDictionaryFromResultsArray:](v149, v32);
    v146 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("cursor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKMultiFeedQueryOperation _feedRelativeDictionaryFromResultsArray:](v149, v33);
    v145 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("topOrder"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKMultiFeedQueryOperation _feedRelativeDictionaryFromResultsArray:](v149, v34);
    v144 = (void *)objc_claimAutoreleasedReturnValue();

    v132 = v21;
    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("feedDropped"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKMultiFeedQueryOperation _feedRelativeDictionaryFromResultsArray:](v149, v35);
    v143 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    v160 = 0u;
    v161 = 0u;
    v162 = 0u;
    v163 = 0u;
    obj = v142;
    v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v160, buf, 16);
    v155 = v36;
    v134 = v6;
    if (v37)
    {
      v38 = v37;
      v39 = 0;
      v152 = *(id *)v161;
      do
      {
        for (i = 0; i != v38; ++i)
        {
          if (*(id *)v161 != v152)
            objc_enumerationMutation(obj);
          v41 = *(void **)(*((_QWORD *)&v160 + 1) + 8 * i);
          objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("articleID"));
          v42 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v42 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("feedItemAndArticle must always have an ArticleID, this is a CloudKit issue please file a radar, record: %@"), v41);
            *(_DWORD *)v172 = 136315906;
            v173 = "-[FCCKMultiFeedQueryOperation _processResultsRecord:feedItemAndArticleRecords:tagRecords:issueRecords:]";
            v174 = 2080;
            v175 = "FCCKMultiFeedQueryOperation.m";
            v176 = 1024;
            v177 = 289;
            v178 = 2114;
            v179 = v53;
            _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v172, 0x26u);

          }
          objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("tagID"));
          v43 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v43 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("feedItemAndArticle must always have a FeedID (currently named TagID), this is a CloudKit issue please file a radar, record: %@"), v41);
            *(_DWORD *)v172 = 136315906;
            v173 = "-[FCCKMultiFeedQueryOperation _processResultsRecord:feedItemAndArticleRecords:tagRecords:issueRecords:]";
            v174 = 2080;
            v175 = "FCCKMultiFeedQueryOperation.m";
            v176 = 1024;
            v177 = 290;
            v178 = 2114;
            v179 = v54;
            _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v172, 0x26u);

          }
          objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("tagID"));
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "objectForKeyedSubscript:", v44);
          v45 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v45)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "setObject:forKeyedSubscript:", v46, v44);

          }
          objc_msgSend(v36, "objectForKeyedSubscript:", v44);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "addObject:", v41);

          objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("order"));
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v154, "objectForKeyedSubscript:", v44);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          if (v49)
          {
            objc_msgSend(v154, "objectForKeyedSubscript:", v44);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "fc_smallerNumber:", v48);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v154, "setObject:forKeyedSubscript:", v51, v44);

          }
          else
          {
            objc_msgSend(v154, "setObject:forKeyedSubscript:", v48, v44);
          }

          if (v39)
          {
            objc_msgSend(v39, "fc_smallerNumber:", v48);
            v52 = objc_claimAutoreleasedReturnValue();

            v39 = (id)v52;
          }
          else
          {
            v39 = v48;
          }
          v36 = v155;

        }
        v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v160, buf, 16);
      }
      while (v38);
    }
    else
    {
      v39 = 0;
    }

    v158 = 0u;
    v159 = 0u;
    v156 = 0u;
    v157 = 0u;
    v153 = *(id *)(v149 + 376);
    v55 = objc_msgSend(v153, "countByEnumeratingWithState:objects:count:", &v156, v172, 16);
    v56 = (void *)v148;
    v57 = (void *)v143;
    if (v55)
    {
      v58 = v55;
      v59 = *(_QWORD *)v157;
      v151 = *(_QWORD *)v157;
      do
      {
        v60 = 0;
        do
        {
          if (*(_QWORD *)v157 != v59)
            objc_enumerationMutation(v153);
          v61 = *(_QWORD *)(*((_QWORD *)&v156 + 1) + 8 * v60);
          v62 = objc_alloc_init(FCCKFeedResponse);
          if (v61)
            v63 = *(void **)(v61 + 8);
          else
            v63 = 0;
          v65 = v63;
          if (v62)
            objc_setProperty_nonatomic_copy(v62, v64, v65, 16);

          if (v61)
            v66 = *(void **)(v61 + 8);
          else
            v66 = 0;
          v67 = v66;
          objc_msgSend(v57, "objectForKeyedSubscript:", v67);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = objc_msgSend(v68, "BOOLValue");
          if (v62)
          {
            v62->_wasDropped = v69;

            if (v62->_wasDropped)
              goto LABEL_90;
            if (v61)
            {
LABEL_49:
              v70 = *(void **)(v61 + 8);
              goto LABEL_50;
            }
          }
          else
          {

            if (v61)
              goto LABEL_49;
          }
          v70 = 0;
LABEL_50:
          v71 = v70;
          objc_msgSend(v155, "objectForKeyedSubscript:", v71);
          v72 = (void *)objc_claimAutoreleasedReturnValue();

          if (v61)
            v73 = *(void **)(v61 + 8);
          else
            v73 = 0;
          v74 = v73;
          objc_msgSend(v144, "objectForKeyedSubscript:", v74);
          v75 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v75 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            v102 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("topOrder should never be nil in 15E or later"));
            *(_DWORD *)v164 = 136315906;
            v165 = "-[FCCKMultiFeedQueryOperation _processResultsRecord:feedItemAndArticleRecords:tagRecords:issueRecords:]";
            v166 = 2080;
            v167 = "FCCKMultiFeedQueryOperation.m";
            v168 = 1024;
            v169 = 317;
            v170 = 2114;
            v171 = v102;
            _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v164, 0x26u);

          }
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("@min.%@"), CFSTR("order"));
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "valueForKeyPath:", v76);
          v77 = (void *)objc_claimAutoreleasedReturnValue();

          if (!objc_msgSend(v72, "count"))
          {
            v78 = v75;

            v77 = v78;
          }
          if (v61)
            v79 = *(void **)(v61 + 8);
          else
            v79 = 0;
          v80 = v79;
          objc_msgSend(v155, "objectForKeyedSubscript:", v80);
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          if (v62)
            objc_setProperty_nonatomic_copy(v62, v81, v82, 24);

          if (v61)
            v83 = *(void **)(v61 + 8);
          else
            v83 = 0;
          v84 = v83;
          objc_msgSend(v146, "objectForKeyedSubscript:", v84);
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          v86 = objc_msgSend(v85, "BOOLValue");
          if (v62)
            v62->_reachedEnd = v86;

          if (v61)
            v87 = *(void **)(v61 + 8);
          else
            v87 = 0;
          v88 = v87;
          objc_msgSend(v147, "objectForKeyedSubscript:", v88);
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          v90 = objc_msgSend(v89, "BOOLValue");
          if (v62)
          {
            v62->_reachedOrderLimit = v90;

            feedItemAndArticleRecords = v62->_feedItemAndArticleRecords;
          }
          else
          {

            feedItemAndArticleRecords = 0;
          }
          v92 = feedItemAndArticleRecords;
          if (-[NSArray count](v92, "count"))
          {
            v93 = objc_msgSend(v77, "unsignedLongLongValue");
            if (!v62)
              goto LABEL_72;
LABEL_71:
            v62->_extent = v93;
            goto LABEL_72;
          }
          v93 = objc_msgSend(v75, "unsignedLongLongValue") + 1;
          if (v62)
            goto LABEL_71;
LABEL_72:

          if (v61)
            v94 = *(void **)(v61 + 8);
          else
            v94 = 0;
          v95 = v94;
          objc_msgSend(v145, "objectForKeyedSubscript:", v95);
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          v98 = v96;
          if (v62)
          {
            objc_setProperty_nonatomic_copy(v62, v97, v96, 40);

            if (v62->_reachedEnd)
              v62->_extent = 0;
          }
          else
          {

          }
          v56 = (void *)v148;
          if (*(_QWORD *)(v149 + 400) || !v39)
          {
            v101 = objc_msgSend(obj, "count");
            if (v62)
              goto LABEL_85;
          }
          else
          {
            v99 = objc_msgSend(v39, "unsignedLongLongValue");
            if (v62)
            {
              if (v99 + 1 < v62->_extent)
                extent = v99 + 1;
              else
                extent = v62->_extent;
              v62->_extent = extent;
              v101 = objc_msgSend(obj, "count");
LABEL_85:
              if (!v101 && !v62->_reachedEnd && !v62->_reachedOrderLimit)
                *(_WORD *)&v62->_reachedEnd = 257;
              goto LABEL_89;
            }
            objc_msgSend(obj, "count");
          }
LABEL_89:

          v57 = (void *)v143;
          v59 = v151;
LABEL_90:
          objc_msgSend(v56, "addObject:", v62);

          ++v60;
        }
        while (v58 != v60);
        v103 = objc_msgSend(v153, "countByEnumeratingWithState:objects:count:", &v156, v172, 16);
        v58 = v103;
      }
      while (v103);
    }

    objc_storeStrong((id *)(v149 + 440), v136);
    objc_storeStrong((id *)(v149 + 464), v56);
    objc_storeStrong((id *)(v149 + 448), v137);
    objc_storeStrong((id *)(v149 + 456), v138);

    v6 = v134;
    v5 = v135;
    v21 = v132;
    a1 = v133;
  }

LABEL_109:
  v104 = *(_QWORD **)(a1 + 32);
  if (v104)
  {
    v105 = FCOperationLog;
    if (v104[59])
    {
      if (!os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_ERROR))
        goto LABEL_122;
      v106 = v105;
      objc_msgSend(v104, "shortOperationDescription");
      v107 = (char *)objc_claimAutoreleasedReturnValue();
      v108 = a1;
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
      v110 = WeakRetained;
      v111 = v6;
      if (WeakRetained)
        v112 = (void *)*((_QWORD *)WeakRetained + 54);
      else
        v112 = 0;
      v113 = v112;
      objc_msgSend(v113, "firstObject");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v181 = v107;
      v182 = 2114;
      v183 = v111;
      v184 = 2114;
      *(_QWORD *)v185 = v114;
      _os_log_error_impl(&dword_1A1B90000, v106, OS_LOG_TYPE_ERROR, "%{public}@ query failed with error: %{public}@, request UUID: %{public}@", buf, 0x20u);

      v6 = v111;
      goto LABEL_121;
    }
  }
  else
  {
    v105 = FCOperationLog;
  }
  if (!os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
    goto LABEL_122;
  v116 = v105;
  objc_msgSend(v104, "shortOperationDescription");
  v117 = (char *)objc_claimAutoreleasedReturnValue();
  v108 = a1;
  v118 = objc_loadWeakRetained((id *)(a1 + 72));
  v119 = v118;
  v120 = v6;
  if (v118)
    v121 = (void *)*((_QWORD *)v118 + 54);
  else
    v121 = 0;
  v122 = v121;
  objc_msgSend(v122, "firstObject");
  v123 = (char *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 138543618;
  v181 = v117;
  v182 = 2114;
  v183 = v123;
  _os_log_impl(&dword_1A1B90000, v116, OS_LOG_TYPE_DEFAULT, "%{public}@ query succeeded with request UUID: %{public}@", buf, 0x16u);

  v6 = v120;
LABEL_121:
  a1 = v108;
LABEL_122:
  v124 = objc_loadWeakRetained((id *)(a1 + 72));
  v125 = v124;
  if (v124)
    v126 = (void *)*((_QWORD *)v124 + 58);
  else
    v126 = 0;
  v128 = v126;
  v129 = *(void **)(a1 + 32);
  if (v129)
    objc_setProperty_nonatomic_copy(v129, v127, v128, 432);

  v130 = *(_QWORD **)(a1 + 32);
  if (v130)
    v131 = v130[59];
  else
    v131 = 0;
  objc_msgSend(v130, "finishedPerformingOperationWithError:", v131);

}

- (void)setResultError:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 472), a2);
}

- (void)resetForRetry
{
  if (self)
  {
    objc_storeStrong((id *)&self->_resultFeedItemAndArticleRecords, 0);
    objc_storeStrong((id *)&self->_resultTagRecords, 0);
    objc_storeStrong((id *)&self->_resultIssueRecords, 0);
    objc_storeStrong((id *)&self->_resultFeedResponses, 0);
  }
  -[FCCKMultiFeedQueryOperation setResultError:]((uint64_t)self, 0);
}

- (void)operationWillFinishWithError:(id)a3
{
  NSError *v4;
  NSObject *v5;
  id queryCompletionHandler;
  void (**v7)(id, NSArray *, NSArray *, NSArray *, NSArray *, NSError *);
  NSArray *v8;
  NSArray *v9;
  NSArray *v10;
  NSArray *v11;
  NSError *resultError;
  void *v13;
  NSArray *resultFeedResponses;
  NSArray *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = (NSError *)a3;
  v5 = (id)FCOperationLog;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    -[FCOperation shortOperationDescription](self, "shortOperationDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      resultFeedResponses = self->_resultFeedResponses;
    else
      resultFeedResponses = 0;
    v15 = resultFeedResponses;
    -[NSArray description](v15, "description");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543618;
    v18 = v13;
    v19 = 2112;
    v20 = v16;
    _os_log_debug_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_DEBUG, "%{public}@ finished with feed responses: %@", (uint8_t *)&v17, 0x16u);

  }
  if (self)
  {
    queryCompletionHandler = self->_queryCompletionHandler;
    if (queryCompletionHandler)
    {
      v7 = (void (**)(id, NSArray *, NSArray *, NSArray *, NSArray *, NSError *))queryCompletionHandler;
      v8 = self->_resultFeedItemAndArticleRecords;
      v9 = self->_resultFeedResponses;
      v10 = self->_resultTagRecords;
      v11 = self->_resultIssueRecords;
      if (self->_resultError)
        resultError = self->_resultError;
      else
        resultError = v4;
      v7[2](v7, v8, v9, v10, v11, resultError);

    }
  }

}

- (id)_predicateForPerFeedFieldName:(void *)a3 key:(void *)a4 defaultValue:
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v23 = a2;
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v10 = *(id *)(a1 + 376);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
    v14 = MEMORY[0x1E0C81028];
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v15), "valueForKey:", v7);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v17 = v9;
          v18 = v16;
LABEL_10:
          objc_msgSend(v17, "addObject:", v18);
          goto LABEL_11;
        }
        if (v8)
        {
          v17 = v9;
          v18 = v8;
          goto LABEL_10;
        }
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "defaultValue");
          *(_DWORD *)buf = 136315906;
          v29 = "-[FCCKMultiFeedQueryOperation _predicateForPerFeedFieldName:key:defaultValue:]";
          v30 = 2080;
          v31 = "FCCKMultiFeedQueryOperation.m";
          v32 = 1024;
          v33 = 240;
          v34 = 2114;
          v35 = v19;
          _os_log_error_impl(&dword_1A1B90000, v14, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

        }
LABEL_11:

        ++v15;
      }
      while (v12 != v15);
      v20 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
      v12 = v20;
    }
    while (v20);
  }

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%@ CONTAINS %K"), v9, v23);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

void __44__FCCKMultiFeedQueryOperation__requiredKeys__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("reachedMinOrder"), CFSTR("reachedEnd"), CFSTR("cursor"), CFSTR("feedDropped"), CFSTR("droppedFeeds"), CFSTR("droppedItems"), CFSTR("topOrder"), CFSTR("articleID"), CFSTR("tagID"), CFSTR("order"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_29;
  _MergedGlobals_29 = v0;

}

- (id)_feedRelativeDictionaryFromResultsArray:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    v4 = objc_msgSend(v3, "count");
    if (v4 != objc_msgSend(*(id *)(a1 + 376), "count") && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("results don't align with feed IDs"));
      *(_DWORD *)buf = 136315906;
      v13 = "-[FCCKMultiFeedQueryOperation _feedRelativeDictionaryFromResultsArray:]";
      v14 = 2080;
      v15 = "FCCKMultiFeedQueryOperation.m";
      v16 = 1024;
      v17 = 361;
      v18 = 2114;
      v19 = v8;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v6 = *(void **)(a1 + 376);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __71__FCCKMultiFeedQueryOperation__feedRelativeDictionaryFromResultsArray___block_invoke;
    v9[3] = &unk_1E463F270;
    v10 = v3;
    v11 = v5;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);

  }
  return v5;
}

void __71__FCCKMultiFeedQueryOperation__feedRelativeDictionaryFromResultsArray___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;

  v8 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v8)
    v7 = v8[1];
  else
    v7 = 0;
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v5, v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultError, 0);
  objc_storeStrong((id *)&self->_resultFeedResponses, 0);
  objc_storeStrong((id *)&self->_resultIssueRecords, 0);
  objc_storeStrong((id *)&self->_resultTagRecords, 0);
  objc_storeStrong((id *)&self->_resultFeedItemAndArticleRecords, 0);
  objc_storeStrong((id *)&self->_networkEvents, 0);
  objc_storeStrong(&self->_queryCompletionHandler, 0);
  objc_storeStrong((id *)&self->_articleLinkKeys, 0);
  objc_storeStrong((id *)&self->_desiredKeys, 0);
  objc_storeStrong((id *)&self->_feedRequests, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

@end

@implementation FCCKTestContentDatabase

+ (id)testingDatabase
{
  id v2;
  id v3;
  void *v4;

  v2 = -[FCNetworkBehaviorMonitor initForLoggingOnly]([FCNetworkBehaviorMonitor alloc], "initForLoggingOnly");
  v3 = -[FCConfigurationManager initForTesting]([FCConfigurationManager alloc], "initForTesting");
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithContainerIdentifier:productionEnvironment:networkBehaviorMonitor:configurationManager:", CFSTR("bogus"), 0, v2, v3);

  return v4;
}

- (FCCKTestContentDatabase)initWithContainerIdentifier:(id)a3 productionEnvironment:(BOOL)a4 networkBehaviorMonitor:(id)a5 configurationManager:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  FCCKTestContentDatabase *v14;
  NSMutableArray *v15;
  NSMutableArray *records;
  NSMutableSet *v17;
  NSMutableSet *droppedFeeds;
  FCCKTestFeedQueryEndpoint *v19;
  FCCKTestFeedQueryEndpoint *feedQueryEndpoint;
  FCCKTestOrderFeedQueryEndpoint *v21;
  FCCKTestOrderFeedQueryEndpoint *orderFeedQueryEndpoint;
  FCCKTestMultiFetchQueryEndpoint *v23;
  FCCKTestMultiFetchQueryEndpoint *multiFetchQueryEndpoint;
  objc_super v26;

  v7 = a4;
  v10 = a6;
  v11 = a5;
  v12 = a3;
  +[FCNetworkReachability sharedNetworkReachability](FCNetworkReachability, "sharedNetworkReachability");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26.receiver = self;
  v26.super_class = (Class)FCCKTestContentDatabase;
  v14 = -[FCCKContentDatabase initWithContainerIdentifier:productionEnvironment:networkBehaviorMonitor:networkReachability:configurationManager:](&v26, sel_initWithContainerIdentifier_productionEnvironment_networkBehaviorMonitor_networkReachability_configurationManager_, v12, v7, v11, v13, v10);

  if (v14)
  {
    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    records = v14->_records;
    v14->_records = v15;

    v17 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    droppedFeeds = v14->_droppedFeeds;
    v14->_droppedFeeds = v17;

    v19 = objc_alloc_init(FCCKTestFeedQueryEndpoint);
    feedQueryEndpoint = v14->_feedQueryEndpoint;
    v14->_feedQueryEndpoint = v19;

    v21 = objc_alloc_init(FCCKTestOrderFeedQueryEndpoint);
    orderFeedQueryEndpoint = v14->_orderFeedQueryEndpoint;
    v14->_orderFeedQueryEndpoint = v21;

    v23 = objc_alloc_init(FCCKTestMultiFetchQueryEndpoint);
    multiFetchQueryEndpoint = v14->_multiFetchQueryEndpoint;
    v14->_multiFetchQueryEndpoint = v23;

  }
  return v14;
}

- (BOOL)shouldUseCloudd
{
  return 1;
}

- (void)addOperation:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  void *v8;
  char v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void (**v28)(_QWORD, _QWORD, _QWORD);
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  void *v41;
  void *v42;
  void (**v43)(_QWORD, _QWORD, double);
  void *v44;
  void *v45;
  void (**v46)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v47;
  void *v48;
  void *v49;
  void (**v50)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v51;
  void *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t j;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void (**v63)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void (**v69)(_QWORD, _QWORD, _QWORD);
  id v70;
  objc_class *v71;
  void *v72;
  void *v73;
  id v74;
  id v75;
  void *v76;
  id obj;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  uint64_t v86;
  void *v87;
  _BYTE v88[128];
  uint8_t v89[128];
  uint8_t buf[4];
  const char *v91;
  __int16 v92;
  char *v93;
  __int16 v94;
  int v95;
  __int16 v96;
  void *v97;
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if (v4 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (-[FCCKTestContentDatabase simulateNetworkError](self, "simulateNetworkError"))
    {
      objc_msgSend(v5, "queryCompletionBlock");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        objc_msgSend(v5, "queryCompletionBlock");
        v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0C947D8], 4, MEMORY[0x1E0C9AA70]);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, _QWORD, void *))v7)[2](v7, 0, v8);

      }
      goto LABEL_18;
    }
    objc_msgSend(v5, "query");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "recordType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("MultiFeed"));

    if (v12)
    {
      -[FCCKTestContentDatabase feedQueryEndpoint](self, "feedQueryEndpoint");
      v13 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v10, "recordType");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("OrderFeed"));

      if (v15)
      {
        -[FCCKTestContentDatabase orderFeedQueryEndpoint](self, "orderFeedQueryEndpoint");
        v13 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v10, "recordType");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("MultiFetch"));

        if (!v17)
        {
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            goto LABEL_17;
          v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unrecognized query record type"));
          *(_DWORD *)buf = 136315906;
          v91 = "-[FCCKTestContentDatabase addOperation:]";
          v92 = 2080;
          v93 = "FCCKTestContentDatabase.m";
          v94 = 1024;
          v95 = 138;
          v96 = 2114;
          v97 = v18;
          _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
LABEL_16:

LABEL_17:
LABEL_18:
          objc_opt_class();
          v9 = 1;
          goto LABEL_19;
        }
        -[FCCKTestContentDatabase multiFetchQueryEndpoint](self, "multiFetchQueryEndpoint");
        v13 = objc_claimAutoreleasedReturnValue();
      }
    }
    v18 = (void *)v13;
    -[FCCKTestContentDatabase records](self, "records");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKTestContentDatabase droppedFeeds](self, "droppedFeeds");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleQueryOperation:withRecords:droppedFeeds:", v5, v19, v20);

    goto LABEL_16;
  }
  objc_opt_class();
  if (!v4)
  {
    v5 = 0;
    goto LABEL_23;
  }
  v5 = 0;
  v9 = 0;
LABEL_19:
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21 = v4;
    -[FCCKTestContentDatabase fetchedKeys](self, "fetchedKeys");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      -[FCCKTestContentDatabase fetchedKeys](self, "fetchedKeys");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "desiredKeys");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setByAddingObjectsFromArray:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCCKTestContentDatabase setFetchedKeys:](self, "setFetchedKeys:", v25);

    }
    else
    {
      v26 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v21, "desiredKeys");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setWithArray:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCCKTestContentDatabase setFetchedKeys:](self, "setFetchedKeys:", v24);
    }

    if (-[FCCKTestContentDatabase simulateNetworkError](self, "simulateNetworkError"))
    {
      objc_msgSend(v21, "fetchRecordsCompletionBlock");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        objc_msgSend(v21, "fetchRecordsCompletionBlock");
        v28 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0C947D8], 4, MEMORY[0x1E0C9AA70]);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, _QWORD, void *))v28)[2](v28, 0, v29);

      }
    }
    else
    {
      v74 = v5;
      v75 = v4;
      objc_msgSend(v21, "recordIDs");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCCKTestContentDatabase records](self, "records");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%@ CONTAINS %K"), v30, CFSTR("recordID"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "filteredArrayUsingPredicate:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v21, "desiredKeys");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCCKTestContentDatabase records:withDesiredKeys:](self, "records:withDesiredKeys:", v33, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = 0u;
      v83 = 0u;
      v84 = 0u;
      v85 = 0u;
      obj = v35;
      v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v89, 16);
      if (v37)
      {
        v38 = v37;
        v39 = *(_QWORD *)v83;
        do
        {
          for (i = 0; i != v38; ++i)
          {
            if (*(_QWORD *)v83 != v39)
              objc_enumerationMutation(obj);
            v41 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * i);
            objc_msgSend(v21, "perRecordProgressBlock");
            v42 = (void *)objc_claimAutoreleasedReturnValue();

            if (v42)
            {
              objc_msgSend(v21, "perRecordProgressBlock");
              v43 = (void (**)(_QWORD, _QWORD, double))objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "recordID");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              ((void (**)(_QWORD, void *, double))v43)[2](v43, v44, 0.5);

            }
            objc_msgSend(v21, "perRecordCompletionBlock");
            v45 = (void *)objc_claimAutoreleasedReturnValue();

            if (v45)
            {
              objc_msgSend(v21, "perRecordCompletionBlock");
              v46 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "recordID");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              ((void (**)(_QWORD, void *, void *, _QWORD))v46)[2](v46, v41, v47, 0);

            }
            objc_msgSend(v41, "recordID");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "setObject:forKey:", v41, v48);

            objc_msgSend(v21, "perRecordCompletionBlock");
            v49 = (void *)objc_claimAutoreleasedReturnValue();

            if (v49)
            {
              objc_msgSend(v21, "perRecordCompletionBlock");
              v50 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "recordID");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              ((void (**)(_QWORD, void *, void *, _QWORD))v50)[2](v50, v41, v51, 0);

            }
          }
          v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v89, 16);
        }
        while (v38);
      }

      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = 0u;
      v79 = 0u;
      v80 = 0u;
      v81 = 0u;
      v53 = v30;
      v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v78, v88, 16);
      v76 = v52;
      if (v54)
      {
        v55 = v54;
        v56 = *(_QWORD *)v79;
        v57 = *MEMORY[0x1E0C947D8];
        do
        {
          for (j = 0; j != v55; ++j)
          {
            if (*(_QWORD *)v79 != v56)
              objc_enumerationMutation(v53);
            v59 = *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * j);
            objc_msgSend(v36, "objectForKeyedSubscript:", v59);
            v60 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v60)
            {
              objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v57, 11, MEMORY[0x1E0C9AA70]);
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "setObject:forKeyedSubscript:", v61, v59);
              objc_msgSend(v21, "perRecordCompletionBlock");
              v62 = (void *)objc_claimAutoreleasedReturnValue();

              if (v62)
              {
                objc_msgSend(v21, "perRecordCompletionBlock");
                v63 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
                ((void (**)(_QWORD, _QWORD, uint64_t, void *))v63)[2](v63, 0, v59, v61);

              }
              v52 = v76;
            }
          }
          v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v78, v88, 16);
        }
        while (v55);
      }

      v5 = v74;
      if (objc_msgSend(v52, "count"))
      {
        v64 = (void *)MEMORY[0x1E0CB35C8];
        v65 = *MEMORY[0x1E0C947D8];
        v86 = *MEMORY[0x1E0C94940];
        v87 = v52;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v87, &v86, 1);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "errorWithDomain:code:userInfo:", v65, 2, v66);
        v67 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v67 = 0;
      }
      v4 = v75;
      objc_msgSend(v21, "fetchRecordsCompletionBlock");
      v68 = (void *)objc_claimAutoreleasedReturnValue();

      if (v68)
      {
        objc_msgSend(v21, "fetchRecordsCompletionBlock");
        v69 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *, void *))v69)[2](v69, v36, v67);

      }
    }
    goto LABEL_60;
  }
  v21 = 0;
  if ((v9 & 1) != 0)
    goto LABEL_60;
LABEL_23:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v70 = objc_alloc(MEMORY[0x1E0CB3940]);
    v71 = (objc_class *)objc_opt_class();
    NSStringFromClass(v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = (void *)objc_msgSend(v70, "initWithFormat:", CFSTR("%@ isn't supported by FCCKTestContentDatabase"), v72);
    *(_DWORD *)buf = 136315906;
    v91 = "-[FCCKTestContentDatabase addOperation:]";
    v92 = 2080;
    v93 = "FCCKTestContentDatabase.m";
    v94 = 1024;
    v95 = 191;
    v96 = 2114;
    v97 = v73;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v21 = 0;
LABEL_60:

}

- (void)insertRecord:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FCCKTestContentDatabase records](self, "records");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (id)insertTestArticle
{
  void *v3;

  FCRandomArticleCloudKitID();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKTestContentDatabase insertTestArticleWithID:properties:](self, "insertTestArticleWithID:properties:", v3, 0);
  return v3;
}

- (id)insertTestArticleWithProperties:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  FCRandomArticleCloudKitID();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKTestContentDatabase insertTestArticleWithID:properties:](self, "insertTestArticleWithID:properties:", v5, v4);

  return v5;
}

- (void)insertTestArticleWithID:(id)a3 properties:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  -[FCCKTestContentDatabase insertTestTagWithType:properties:](self, "insertTestTagWithType:properties:", CFSTR("channel"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x1E0C95048]);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:", v15);
  v10 = (void *)objc_msgSend(v8, "initWithRecordType:recordID:", CFSTR("Article"), v9);

  objc_msgSend(v10, "setEtag:", CFSTR("1"));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v7, CFSTR("sourceChannelTagID"));
  -[FCCKTestContentDatabase records](self, "records");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v10);

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("publishDate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    if (v6)
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v6);
    else
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("publishDate"));

    v6 = v13;
  }
  -[FCCKTestContentDatabase updateArticleWithID:properties:](self, "updateArticleWithID:properties:", v15, v6);

}

- (id)insertTestForYouConfigWithProperties:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  FCRandomForYouConfigCloudKitID();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0C95048]);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:", v5);
  v8 = (void *)objc_msgSend(v6, "initWithRecordType:recordID:", CFSTR("ForYouConfig"), v7);

  objc_msgSend(v8, "setEtag:", CFSTR("1"));
  -[FCCKTestContentDatabase records](self, "records");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v8);

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = v4;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v10, "objectForKeyedSubscript:", v15, (_QWORD)v18);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, v15);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v12);
  }

  return v5;
}

- (id)insertTestArticleListReferencingArticleIDs:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  FCRandomArticleListCloudKitID();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0C95048]);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:", v5);
  v8 = (void *)objc_msgSend(v6, "initWithRecordType:recordID:", CFSTR("ArticleList"), v7);

  objc_msgSend(v8, "setEtag:", CFSTR("1"));
  -[FCCKTestContentDatabase records](self, "records");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v8);

  objc_msgSend(v8, "setObject:forKeyedSubscript:", v4, CFSTR("articleIDs"));
  return v5;
}

- (id)insertTestIssueListReferencingIssueIDs:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  FCRandomIssueListCloudKitID();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0C95048]);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:", v5);
  v8 = (void *)objc_msgSend(v6, "initWithRecordType:recordID:", CFSTR("IssueList"), v7);

  objc_msgSend(v8, "setEtag:", CFSTR("1"));
  -[FCCKTestContentDatabase records](self, "records");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v8);

  objc_msgSend(v8, "setObject:forKeyedSubscript:", v4, CFSTR("issueIDs"));
  return v5;
}

- (void)updateArticleWithID:(id)a3 properties:(id)a4
{
  void *v6;
  id v7;
  id v8;
  id v9;

  v6 = (void *)MEMORY[0x1E0C99D68];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "date");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[FCCKTestContentDatabase updateArticleWithID:modDate:properties:](self, "updateArticleWithID:modDate:properties:", v8, v9, v7);

}

- (void)updateArticleWithID:(id)a3 modDate:(id)a4 properties:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[FCCKTestContentDatabase records](self, "records");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  FCLookupRecordByName(v11, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v13 = v10;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v36 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v13, "objectForKeyedSubscript:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v19, v18);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v15);
  }

  objc_msgSend(v12, "setModificationDate:", v9);
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("publishDate"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v29 = v9;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    -[FCCKTestContentDatabase records](self, "records");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v8;
    FCFeedItemRecordsForArticle(v21, v8);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v32;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v32 != v25)
            objc_enumerationMutation(v22);
          v27 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * j);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v20, "fc_millisecondTimeIntervalSince1970"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setObject:forKeyedSubscript:", v28, CFSTR("publishDateMillis"));

        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      }
      while (v24);
    }

    v9 = v29;
    v8 = v30;
  }

}

- (void)deleteArticleWithID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[FCCKTestContentDatabase records](self, "records");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[FCCKTestContentDatabase records](self, "records");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  FCLookupRecordByName(v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "removeObject:", v6);
}

- (id)insertTestTagWithType:(id)a3 feedID:(id)a4
{
  return -[FCCKTestContentDatabase insertTestTagWithType:feedID:properties:](self, "insertTestTagWithType:feedID:properties:", a3, a4, 0);
}

- (id)insertTestTagWithType:(id)a3 feedID:(id)a4 properties:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  const __CFString *v40;
  _QWORD v41[3];

  v41[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc(MEMORY[0x1E0C95048]);
  v11 = objc_alloc(MEMORY[0x1E0C95070]);
  FCRandomTagCloudKitID();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithRecordName:", v12);
  v14 = (void *)objc_msgSend(v10, "initWithRecordType:recordID:", CFSTR("Tag"), v13);

  objc_msgSend(v14, "setEtag:", CFSTR("1"));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v7, CFSTR("type"));
  +[FCAppleAccount sharedAccount](FCAppleAccount, "sharedAccount");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "contentStoreFrontID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  FCCKLocalizedRecordKey((uint64_t)CFSTR("feedConfiguration"), (uint64_t)v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_alloc(MEMORY[0x1E0CB3940]);
  v19 = (void *)MEMORY[0x1E0CB36D8];
  v40 = CFSTR("everythingFeedID");
  v41[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, &v40, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "dataWithJSONObject:options:error:", v20, 0, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v18, "initWithData:encoding:", v21, 4);
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v22, v17);

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v23 = v9;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v36 != v26)
          objc_enumerationMutation(v23);
        v28 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v23, "objectForKeyedSubscript:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v29, v28);

      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v25);
  }

  -[FCCKTestContentDatabase records](self, "records");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addObject:", v14);

  objc_msgSend(v14, "recordID");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "recordName");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

- (id)insertTestTagWithType:(id)a3 properties:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc(MEMORY[0x1E0C95048]);
  v9 = objc_alloc(MEMORY[0x1E0C95070]);
  FCRandomTagCloudKitID();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithRecordName:", v10);
  v12 = (void *)objc_msgSend(v8, "initWithRecordType:recordID:", CFSTR("Tag"), v11);

  objc_msgSend(v12, "setObject:forKeyedSubscript:", v6, CFSTR("type"));
  objc_msgSend(v12, "setEtag:", CFSTR("1"));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setModificationDate:", v13);

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v14 = v7;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v26 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v14, "objectForKeyedSubscript:", v19, (_QWORD)v25);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v20, v19);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v16);
  }

  -[FCCKTestContentDatabase records](self, "records");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addObject:", v12);

  objc_msgSend(v12, "recordID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "recordName");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (void)insertTestTagWithID:(id)a3 type:(id)a4 properties:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
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
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc(MEMORY[0x1E0C95048]);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:", v8);
  v13 = (void *)objc_msgSend(v11, "initWithRecordType:recordID:", CFSTR("Tag"), v12);

  objc_msgSend(v13, "setObject:forKeyedSubscript:", v9, CFSTR("type"));
  objc_msgSend(v13, "setEtag:", CFSTR("1"));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setModificationDate:", v14);

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v15 = v10;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v24 != v18)
          objc_enumerationMutation(v15);
        v20 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v15, "objectForKeyedSubscript:", v20, (_QWORD)v23);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v21, v20);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v17);
  }

  -[FCCKTestContentDatabase records](self, "records");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObject:", v13);

}

- (id)insertTestIssueWithProperties:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  FCRandomIssueCloudKitID();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKTestContentDatabase insertTestIssueWithID:properties:](self, "insertTestIssueWithID:properties:", v5, v4);

  return v5;
}

- (void)insertTestIssueWithID:(id)a3 properties:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc(MEMORY[0x1E0C95048]);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:", v6);
  v10 = (void *)objc_msgSend(v8, "initWithRecordType:recordID:", CFSTR("Issue"), v9);

  objc_msgSend(v10, "setEtag:", CFSTR("1"));
  -[FCCKTestContentDatabase records](self, "records");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v10);

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = v7;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v12, "objectForKeyedSubscript:", v17, (_QWORD)v19);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v18, v17);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v14);
  }

}

- (void)updateTagWithID:(id)a3 properties:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
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
  v7 = a4;
  -[FCCKTestContentDatabase records](self, "records");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  FCLookupRecordByName(v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v10, "objectForKeyedSubscript:", v15, (_QWORD)v18);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v16, v15);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v12);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setModificationDate:", v17);

}

- (void)insertArticleID:(id)a3 atTopOfFeedID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a4;
  v7 = a3;
  -[FCCKTestContentDatabase records](self, "records");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  FCSortedFeedItemRecordsForFeedID(v8, v6);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("order"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95048]), "initWithRecordType:", CFSTR("FeedItem"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v6, CFSTR("tagID"));

  objc_msgSend(v11, "setObject:forKeyedSubscript:", v7, CFSTR("articleID"));
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v10, "unsignedLongLongValue") + 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("order"));

  }
  else
  {
    objc_msgSend(v11, "setObject:forKeyedSubscript:", &unk_1E470AD48, CFSTR("order"));
  }
  -[FCCKTestContentDatabase records](self, "records");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v11);

}

- (void)insertArticleID:(id)a3 atBottomOfFeedID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a4;
  v7 = a3;
  -[FCCKTestContentDatabase records](self, "records");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  FCSortedFeedItemRecordsForFeedID(v8, v6);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("order"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95048]), "initWithRecordType:", CFSTR("FeedItem"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v6, CFSTR("tagID"));

  objc_msgSend(v11, "setObject:forKeyedSubscript:", v7, CFSTR("articleID"));
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v10, "unsignedLongLongValue") - 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("order"));

  }
  else
  {
    objc_msgSend(v11, "setObject:forKeyedSubscript:", &unk_1E470AD48, CFSTR("order"));
  }
  -[FCCKTestContentDatabase records](self, "records");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v11);

}

- (void)insertArticleID:(id)a3 inFeedID:(id)a4 withOrder:(unint64_t)a5
{
  objc_class *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v8 = (objc_class *)MEMORY[0x1E0C95048];
  v9 = a4;
  v10 = a3;
  v13 = (id)objc_msgSend([v8 alloc], "initWithRecordType:", CFSTR("FeedItem"));
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v9, CFSTR("tagID"));

  objc_msgSend(v13, "setObject:forKeyedSubscript:", v10, CFSTR("articleID"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v11, CFSTR("order"));

  -[FCCKTestContentDatabase records](self, "records");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v13);

}

- (void)insertArticleID:(id)a3 inFeedID:(id)a4 withOrder:(unint64_t)a5 subOrder:(unint64_t)a6
{
  objc_class *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v10 = (objc_class *)MEMORY[0x1E0C95048];
  v11 = a4;
  v12 = a3;
  v16 = (id)objc_msgSend([v10 alloc], "initWithRecordType:", CFSTR("FeedItem"));
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v11, CFSTR("tagID"));

  objc_msgSend(v16, "setObject:forKeyedSubscript:", v12, CFSTR("articleID"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v13, CFSTR("order"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v14, CFSTR("subOrder"));

  -[FCCKTestContentDatabase records](self, "records");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObject:", v16);

}

- (void)updateArticleID:(id)a3 inFeedID:(id)a4 withProperties:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[FCCKTestContentDatabase records](self, "records");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  FCLookupFeedItemRecordByFeedAndArticle(v11, v9, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v13 = v10;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v13, "objectForKeyedSubscript:", v18, (_QWORD)v20);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v19, v18);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v15);
  }

}

- (void)populateWithBasicTestFeeds
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[3];
  _QWORD v30[3];
  _QWORD v31[3];
  _QWORD v32[3];
  _QWORD v33[3];
  _QWORD v34[3];
  _QWORD v35[3];
  _QWORD v36[3];
  _QWORD v37[3];
  _QWORD v38[3];
  _QWORD v39[3];
  _QWORD v40[3];
  _QWORD v41[2];
  _QWORD v42[2];
  const __CFString *v43;
  _QWORD v44[3];

  v44[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "fc_millisecondTimeIntervalSince1970");

  -[FCCKTestContentDatabase insertTestTagWithID:type:properties:](self, "insertTestTagWithID:type:properties:", CFSTR("Ichannel"), CFSTR("channel"), MEMORY[0x1E0C9AA70]);
  v43 = CFSTR("channelTagID");
  v44[0] = CFSTR("Ichannel");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, &v43, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKTestContentDatabase insertTestIssueWithID:properties:](self, "insertTestIssueWithID:properties:", CFSTR("Iissue"), v5);

  v41[0] = CFSTR("parentIssueID");
  v41[1] = CFSTR("sourceChannelTagID");
  v42[0] = CFSTR("Iissue");
  v42[1] = CFSTR("Ichannel");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKTestContentDatabase insertTestArticleWithID:properties:](self, "insertTestArticleWithID:properties:", CFSTR("Atest_feed1_article1"), v6);

  -[FCCKTestContentDatabase insertTestArticleWithID:properties:](self, "insertTestArticleWithID:properties:", CFSTR("Atest_feed1_article2"), 0);
  -[FCCKTestContentDatabase insertTestArticleWithID:properties:](self, "insertTestArticleWithID:properties:", CFSTR("Atest_feed1_article3"), 0);
  -[FCCKTestContentDatabase insertArticleID:inFeedID:withOrder:](self, "insertArticleID:inFeedID:withOrder:", CFSTR("Atest_feed1_article1"), CFSTR("test_feed1"), v4);
  -[FCCKTestContentDatabase insertArticleID:inFeedID:withOrder:](self, "insertArticleID:inFeedID:withOrder:", CFSTR("Atest_feed1_article2"), CFSTR("test_feed1"), v4 - 1);
  -[FCCKTestContentDatabase insertArticleID:inFeedID:withOrder:](self, "insertArticleID:inFeedID:withOrder:", CFSTR("Atest_feed1_article3"), CFSTR("test_feed1"), v4 - 2);
  -[FCCKTestContentDatabase insertTestArticleWithID:properties:](self, "insertTestArticleWithID:properties:", CFSTR("Atest_feed2_article1"), 0);
  -[FCCKTestContentDatabase insertTestArticleWithID:properties:](self, "insertTestArticleWithID:properties:", CFSTR("Atest_feed2_article2"), 0);
  -[FCCKTestContentDatabase insertTestArticleWithID:properties:](self, "insertTestArticleWithID:properties:", CFSTR("Atest_feed2_article3"), 0);
  -[FCCKTestContentDatabase insertArticleID:inFeedID:withOrder:](self, "insertArticleID:inFeedID:withOrder:", CFSTR("Atest_feed2_article1"), CFSTR("test_feed2"), v4 - 1);
  -[FCCKTestContentDatabase insertArticleID:inFeedID:withOrder:](self, "insertArticleID:inFeedID:withOrder:", CFSTR("Atest_feed2_article2"), CFSTR("test_feed2"), v4 - 2);
  -[FCCKTestContentDatabase insertArticleID:inFeedID:withOrder:](self, "insertArticleID:inFeedID:withOrder:", CFSTR("Atest_feed2_article3"), CFSTR("test_feed2"), v4 - 3);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -21600.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -43200.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v7;
  v39[0] = CFSTR("publishDate");
  v39[1] = CFSTR("publishDateMillis");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v7, "fc_millisecondTimeIntervalSince1970"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v40[1] = v9;
  v39[2] = CFSTR("tagHalfLifeMillis");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 86400000);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v40[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKTestContentDatabase updateArticleID:inFeedID:withProperties:](self, "updateArticleID:inFeedID:withProperties:", CFSTR("Atest_feed1_article1"), CFSTR("test_feed1"), v11);

  v27 = v8;
  v38[0] = v8;
  v37[0] = CFSTR("publishDate");
  v37[1] = CFSTR("publishDateMillis");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v8, "fc_millisecondTimeIntervalSince1970"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v12;
  v37[2] = CFSTR("tagHalfLifeMillis");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 86400000);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v38[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKTestContentDatabase updateArticleID:inFeedID:withProperties:](self, "updateArticleID:inFeedID:withProperties:", CFSTR("Atest_feed1_article2"), CFSTR("test_feed1"), v14);

  v36[0] = v28;
  v35[0] = CFSTR("publishDate");
  v35[1] = CFSTR("publishDateMillis");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v28, "fc_millisecondTimeIntervalSince1970"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v15;
  v35[2] = CFSTR("tagHalfLifeMillis");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 86400000);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v36[2] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKTestContentDatabase updateArticleID:inFeedID:withProperties:](self, "updateArticleID:inFeedID:withProperties:", CFSTR("Atest_feed1_article3"), CFSTR("test_feed1"), v17);

  v34[0] = v7;
  v33[0] = CFSTR("publishDate");
  v33[1] = CFSTR("publishDateMillis");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v7, "fc_millisecondTimeIntervalSince1970"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v18;
  v33[2] = CFSTR("tagHalfLifeMillis");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 86400000);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v34[2] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKTestContentDatabase updateArticleID:inFeedID:withProperties:](self, "updateArticleID:inFeedID:withProperties:", CFSTR("Atest_feed2_article1"), CFSTR("test_feed2"), v20);

  v32[0] = v27;
  v31[0] = CFSTR("publishDate");
  v31[1] = CFSTR("publishDateMillis");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v27, "fc_millisecondTimeIntervalSince1970"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v21;
  v31[2] = CFSTR("tagHalfLifeMillis");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 86400000);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKTestContentDatabase updateArticleID:inFeedID:withProperties:](self, "updateArticleID:inFeedID:withProperties:", CFSTR("Atest_feed2_article2"), CFSTR("test_feed2"), v23);

  v30[0] = v28;
  v29[0] = CFSTR("publishDate");
  v29[1] = CFSTR("publishDateMillis");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v28, "fc_millisecondTimeIntervalSince1970"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v24;
  v29[2] = CFSTR("tagHalfLifeMillis");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 86400000);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v25;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 3);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKTestContentDatabase updateArticleID:inFeedID:withProperties:](self, "updateArticleID:inFeedID:withProperties:", CFSTR("Atest_feed2_article3"), CFSTR("test_feed2"), v26);

  -[FCCKTestContentDatabase insertTestArticleWithID:properties:](self, "insertTestArticleWithID:properties:", CFSTR("A-canary"), 0);
}

- (void)deleteFeedID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[FCCKTestContentDatabase records](self, "records");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  FCSortedFeedItemRecordsForFeedID(v5, v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[FCCKTestContentDatabase records](self, "records");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectsInArray:", v7);

}

- (void)simulateDroppedFeedForFeedID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FCCKTestContentDatabase droppedFeeds](self, "droppedFeeds");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (id)addArticlesToTopOfFeed:(id)a3 count:(unint64_t)a4
{
  id v6;
  void *i;
  void *v8;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  for (i = (void *)objc_claimAutoreleasedReturnValue(); a4; --a4)
  {
    -[FCCKTestContentDatabase insertTestArticle](self, "insertTestArticle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKTestContentDatabase insertArticleID:atTopOfFeedID:](self, "insertArticleID:atTopOfFeedID:", v8, v6);
    objc_msgSend(i, "insertObject:atIndex:", v8, 0);

  }
  return i;
}

- (unint64_t)orderForArticleID:(id)a3 feedID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;

  v6 = a4;
  v7 = a3;
  -[FCCKTestContentDatabase records](self, "records");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  FCLookupFeedItemRecordByFeedAndArticle(v8, v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("order"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedLongLongValue");

  return v11;
}

- (id)records:(id)a3 withDesiredKeys:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = a3;
  objc_msgSend(v5, "setWithArray:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __51__FCCKTestContentDatabase_records_withDesiredKeys___block_invoke;
  v11[3] = &unk_1E463EA88;
  v12 = v7;
  v8 = v7;
  objc_msgSend(v6, "fc_arrayByTransformingWithBlock:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __51__FCCKTestContentDatabase_records_withDesiredKeys___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(a2, "copy");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v3, "valuesByKey", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v10) & 1) == 0)
        {
          objc_msgSend(v3, "valuesByKey");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKeyedSubscript:", 0, v10);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v3;
}

- (BOOL)simulateNetworkError
{
  return self->_simulateNetworkError;
}

- (void)setSimulateNetworkError:(BOOL)a3
{
  self->_simulateNetworkError = a3;
}

- (NSSet)fetchedKeys
{
  return self->_fetchedKeys;
}

- (void)setFetchedKeys:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSMutableArray)records
{
  return self->_records;
}

- (void)setRecords:(id)a3
{
  objc_storeStrong((id *)&self->_records, a3);
}

- (NSMutableSet)droppedFeeds
{
  return self->_droppedFeeds;
}

- (void)setDroppedFeeds:(id)a3
{
  objc_storeStrong((id *)&self->_droppedFeeds, a3);
}

- (FCCKTestFeedQueryEndpoint)feedQueryEndpoint
{
  return self->_feedQueryEndpoint;
}

- (void)setFeedQueryEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_feedQueryEndpoint, a3);
}

- (FCCKTestOrderFeedQueryEndpoint)orderFeedQueryEndpoint
{
  return self->_orderFeedQueryEndpoint;
}

- (void)setOrderFeedQueryEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_orderFeedQueryEndpoint, a3);
}

- (FCCKTestMultiFetchQueryEndpoint)multiFetchQueryEndpoint
{
  return self->_multiFetchQueryEndpoint;
}

- (void)setMultiFetchQueryEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_multiFetchQueryEndpoint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multiFetchQueryEndpoint, 0);
  objc_storeStrong((id *)&self->_orderFeedQueryEndpoint, 0);
  objc_storeStrong((id *)&self->_feedQueryEndpoint, 0);
  objc_storeStrong((id *)&self->_droppedFeeds, 0);
  objc_storeStrong((id *)&self->_records, 0);
  objc_storeStrong((id *)&self->_fetchedKeys, 0);
}

@end

@implementation FHDatabaseEntity

- (id)_getDatabaseManager
{
  void *WeakRetained;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_databaseManagerWeak);
  v4 = WeakRetained;
  if (!WeakRetained)
    WeakRetained = self->_databaseManagerStrong;
  v5 = WeakRetained;

  return v5;
}

- (FHDatabaseEntity)initWithEntity:(id)a3
{
  return -[FHDatabaseEntity initWithJoinKey:entities:](self, "initWithJoinKey:entities:", 0, a3, 0);
}

- (FHDatabaseEntity)initWithJoinKey:(id)a3 entities:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id *v13;
  id v14;
  void *v15;
  FHDatabaseEntity *v16;
  id *v18;
  void *v19;
  uint64_t v20;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v9 = v8;
  if (v7)
  {
    objc_msgSend(v8, "addObject:", v7);
    v18 = (id *)&v20;
    v10 = v19;
    if (v10)
    {
      v11 = v10;
      do
      {
        objc_msgSend(v11, "stringValue");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v12);

        v13 = v18++;
        v14 = *v13;

        v11 = v14;
      }
      while (v14);
    }
  }
  v15 = (void *)objc_msgSend(v9, "copy");
  v16 = -[FHDatabaseEntity _initWithJoinKey:joinType:databaseManager:entities:](self, "_initWithJoinKey:joinType:databaseManager:entities:", v6, CFSTR("inner"), 0, v15);

  return v16;
}

- (FHDatabaseEntity)initWithLeftJoinKey:(id)a3 entities:(id)a4
{
  return (FHDatabaseEntity *)-[FHDatabaseEntity _initWithJoinKey:joinType:databaseManager:entities:](self, "_initWithJoinKey:joinType:databaseManager:entities:", a3, CFSTR("left"), 0, a4);
}

- (FHDatabaseEntity)initWithRightJoinKey:(id)a3 entities:(id)a4
{
  return (FHDatabaseEntity *)-[FHDatabaseEntity _initWithJoinKey:joinType:databaseManager:entities:](self, "_initWithJoinKey:joinType:databaseManager:entities:", a3, CFSTR("right"), 0, a4);
}

- (FHDatabaseEntity)initWithFullJoinKey:(id)a3 entities:(id)a4
{
  return (FHDatabaseEntity *)-[FHDatabaseEntity _initWithJoinKey:joinType:databaseManager:entities:](self, "_initWithJoinKey:joinType:databaseManager:entities:", a3, CFSTR("full"), 0, a4);
}

- (FHDatabaseEntity)initWithEntity:(id)a3 databaseManager:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  FHDatabaseEntity *v10;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v6 = (void *)MEMORY[0x24BDBCE30];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[FHDatabaseEntity _initWithJoinKey:joinType:databaseManager:entities:](self, "_initWithJoinKey:joinType:databaseManager:entities:", 0, CFSTR("inner"), v7, v9, v12, v13);
  return v10;
}

- (id)_initWithJoinKey:(id)a3 joinType:(id)a4 databaseManager:(id)a5 entities:(id)a6
{
  id v10;
  id v11;
  id v12;
  FHDatabaseEntity *v13;
  FHDatabaseEntity *v14;
  FHDatabaseManager *v15;
  FHDatabaseManager *databaseManagerStrong;
  uint64_t v17;
  NSDictionary *scalarFunctions;
  uint64_t v19;
  NSDictionary *windowFunctions;
  id *p_entities;
  id v22;
  void *v23;
  unint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  NSString *multiEntityJoinQuery;
  uint64_t v32;
  NSArray *fieldsIndex;
  id v35;
  id v36;
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  uint64_t *v41;
  uint64_t *v42;
  id v43;
  id location;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  objc_super v57;

  v38 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v57.receiver = self;
  v57.super_class = (Class)FHDatabaseEntity;
  v13 = -[FHDatabaseEntity init](&v57, sel_init);
  v14 = v13;
  if (v13)
  {
    if (v11)
    {
      objc_storeWeak((id *)&v13->_databaseManagerWeak, v11);
    }
    else
    {
      v15 = -[FHDatabaseManager init:]([FHDatabaseManager alloc], "init:", 0);
      databaseManagerStrong = v14->_databaseManagerStrong;
      v14->_databaseManagerStrong = v15;

    }
    objc_storeStrong((id *)&v14->_joinType, a4);
    -[FHDatabaseEntity _availableFunctions:functionTypeFilter:](v14, "_availableFunctions:functionTypeFilter:", 2, CFSTR("s"));
    v17 = objc_claimAutoreleasedReturnValue();
    scalarFunctions = v14->_scalarFunctions;
    v14->_scalarFunctions = (NSDictionary *)v17;

    -[FHDatabaseEntity _availableFunctions:functionTypeFilter:](v14, "_availableFunctions:functionTypeFilter:", 2, CFSTR("w"));
    v19 = objc_claimAutoreleasedReturnValue();
    windowFunctions = v14->_windowFunctions;
    v14->_windowFunctions = (NSDictionary *)v19;

    p_entities = (id *)&v14->_entities;
    objc_storeStrong((id *)&v14->_entities, a6);
    v51 = 0;
    v52 = &v51;
    v53 = 0x3032000000;
    v54 = __Block_byref_object_copy__0;
    v55 = __Block_byref_object_dispose__0;
    v56 = (id)objc_opt_new();
    v45 = 0;
    v46 = &v45;
    v47 = 0x3032000000;
    v48 = __Block_byref_object_copy__0;
    v49 = __Block_byref_object_dispose__0;
    v50 = (id)objc_opt_new();
    v22 = objc_alloc_init(MEMORY[0x24BDD16A8]);
    objc_msgSend(v22, "appendString:", CFSTR("select * from"));
    v35 = v12;
    v36 = v11;
    v37 = v10;
    -[NSArray firstObject](v14->_entities, "firstObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; i < objc_msgSend(*p_entities, "count"); ++i)
    {
      objc_msgSend(*p_entities, "objectAtIndex:", i);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (i)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(" %@ join "), v14->_joinType);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "appendString:", v26);

        objc_msgSend(v22, "appendString:", v25);
        objc_msgSend(v22, "appendFormat:", CFSTR(" on %@.%@ == %@.%@"), v23, v38, v25, v38);
      }
      else
      {
        objc_msgSend(v22, "appendString:", CFSTR(" "));
        objc_msgSend(v22, "appendString:", v23);
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PRAGMA TABLE_XINFO(%@);"), v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak(&location, v14);
      -[FHDatabaseEntity _getDatabaseManager](v14, "_getDatabaseManager");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v39[0] = MEMORY[0x24BDAC760];
      v39[1] = 3221225472;
      v39[2] = __71__FHDatabaseEntity__initWithJoinKey_joinType_databaseManager_entities___block_invoke;
      v39[3] = &unk_250C66E60;
      objc_copyWeak(&v43, &location);
      v29 = v25;
      v40 = v29;
      v41 = &v51;
      v42 = &v45;
      objc_msgSend(v28, "streamQueryResults:usingFetchHandler:", v27, v39);

      objc_destroyWeak(&v43);
      objc_destroyWeak(&location);

    }
    objc_storeStrong((id *)&v14->_virtualEntities, (id)v46[5]);
    v30 = objc_msgSend(v22, "copy");
    multiEntityJoinQuery = v14->_multiEntityJoinQuery;
    v14->_multiEntityJoinQuery = (NSString *)v30;

    v32 = objc_msgSend((id)v52[5], "copy");
    fieldsIndex = v14->_fieldsIndex;
    v14->_fieldsIndex = (NSArray *)v32;

    _Block_object_dispose(&v45, 8);
    _Block_object_dispose(&v51, 8);

    v11 = v36;
    v10 = v37;
    v12 = v35;
  }

  return v14;
}

void __71__FHDatabaseEntity__initWithJoinKey_joinType_databaseManager_entities___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v14, "objectAtIndex:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@.%@"), v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_msgSend(v8, "lowercaseString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v10);

    if (objc_msgSend(v14, "intAtIndex:", 6))
    {
      v11 = *(void **)(a1 + 32);
      objc_msgSend(v14, "objectAtIndex:", 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringValue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v11) = objc_msgSend(v11, "isEqualToString:", v13);

      if ((_DWORD)v11)
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", *(_QWORD *)(a1 + 32));
    }

  }
}

- (void)streamDataWithEntity:(id)a3 recordStreamHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@;"), CFSTR("select * from"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v9 = (void *)objc_opt_new();
  -[FHDatabaseEntity _getDatabaseManager](self, "_getDatabaseManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __61__FHDatabaseEntity_streamDataWithEntity_recordStreamHandler___block_invoke;
  v13[3] = &unk_250C66E88;
  objc_copyWeak(&v16, &location);
  v11 = v9;
  v14 = v11;
  v12 = v7;
  v15 = v12;
  objc_msgSend(v10, "streamQueryResults:usingFetchHandler:", v8, v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __61__FHDatabaseEntity_streamDataWithEntity_recordStreamHandler___block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (objc_msgSend(v10, "count"))
    {
      v4 = 0;
      do
      {
        objc_msgSend(WeakRetained[1], "objectAtIndex:", v4);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = *(void **)(a1 + 32);
        objc_msgSend(v10, "objectAtIndex:", v4);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKey:", v7, v5);

        ++v4;
      }
      while (v4 < objc_msgSend(v10, "count"));
    }
    v8 = *(_QWORD *)(a1 + 40);
    v9 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);

    objc_msgSend(*(id *)(a1 + 32), "removeAllObjects");
  }

}

- (void)queryDataWithBlock:(id)a3 logicalOperator:(id)a4 limit:(unint64_t)a5 selectFields:(id)a6 orderby:(id)a7 usingBlock:(id)a8
{
  NSArray *fieldsIndex;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  unint64_t j;
  void *v35;
  __CFString *v36;
  _BOOL4 v37;
  NSArray *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSArray *v43;
  void *v44;
  NSArray *entities;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  id v51;
  uint64_t v52;
  int v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  const __CFString *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  NSString *v68;
  NSString *v69;
  NSObject *v70;
  void *v71;
  void *v73;
  id v74;
  void (**v75)(id, _QWORD, void *, uint64_t);
  id v76;
  void *v77;
  id v78;
  id v79;
  id v80;
  int v81;
  id obj;
  void *v83;
  _QWORD v85[4];
  id v86;
  void (**v87)(id, _QWORD, void *, uint64_t);
  __int128 *p_buf;
  id v89[2];
  id location;
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
  __int128 buf;
  uint64_t v102;
  uint64_t v103;
  _BYTE v104[128];
  const __CFString *v105;
  id v106;
  const __CFString *v107;
  id v108;
  const __CFString *v109;
  id v110;
  _BYTE v111[128];
  const __CFString *v112;
  _QWORD v113[4];

  v113[1] = *MEMORY[0x24BDAC8D0];
  v78 = a3;
  v74 = a4;
  v76 = a6;
  v79 = a7;
  v75 = (void (**)(id, _QWORD, void *, uint64_t))a8;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  if (v76)
  {
    fieldsIndex = self->_fieldsIndex;
    v99[0] = MEMORY[0x24BDAC760];
    v99[1] = 3221225472;
    v99[2] = __93__FHDatabaseEntity_queryDataWithBlock_logicalOperator_limit_selectFields_orderby_usingBlock___block_invoke;
    v99[3] = &unk_250C66EB0;
    v13 = v76;
    v100 = v13;
    -[NSArray indexesOfObjectsPassingTest:](fieldsIndex, "indexesOfObjectsPassingTest:", v99);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v77, "count");
    if (v14 != objc_msgSend(v13, "count"))
    {
      v15 = (void *)MEMORY[0x24BDD1540];
      v112 = CFSTR("One or more invalid selectFields");
      v113[0] = v13;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v113, &v112, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("com.apple.FinHealth.Framework"), 10016, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "addObject:", v17);

      FinHealthLogObject(CFSTR("FinHealthCore"));
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v77;
        _os_log_impl(&dword_23B4A2000, v18, OS_LOG_TYPE_DEBUG, "Invalid select fields: available fields=%@", (uint8_t *)&buf, 0xCu);
      }

    }
  }
  else
  {
    v77 = 0;
  }
  if (v79)
  {
    v97 = 0u;
    v98 = 0u;
    v95 = 0u;
    v96 = 0u;
    v19 = v79;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v95, v111, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v96;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v96 != v21)
            objc_enumerationMutation(v19);
          v23 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * i);
          objc_msgSend(v23, "featureLabel");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (!-[NSArray containsObject:](self->_fieldsIndex, "containsObject:", v24))
          {
            v25 = (void *)MEMORY[0x24BDD1540];
            v109 = CFSTR("One or more invalid order by fields");
            v110 = v19;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v110, &v109, 1);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("com.apple.FinHealth.Framework"), 10016, v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v83, "addObject:", v27);

          }
          objc_msgSend(v23, "featureRank");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "integerValue");

          if (!v29)
          {
            v30 = (void *)MEMORY[0x24BDD1540];
            v107 = CFSTR("One or more invalid orderings (NSOrderedSame)");
            v108 = v19;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v108, &v107, 1);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "errorWithDomain:code:userInfo:", CFSTR("com.apple.FinHealth.Framework"), 10016, v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v83, "addObject:", v32);

          }
        }
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v95, v111, 16);
      }
      while (v20);
    }

  }
  v80 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  if (v78)
  {
    objc_msgSend(v78, "clausesAndOperatorsInOrder");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v33, "count"))
    {
      for (j = 0; j < objc_msgSend(v33, "count"); ++j)
      {
        objc_msgSend(v33, "objectAtIndex:", j);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v35, "comparisonOperator");
          v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v37 = v36 == CFSTR("MATCH");

          if (v37)
          {
            objc_msgSend(v35, "fieldName");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "componentsSeparatedByString:", CFSTR("."));
            v40 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v40, "stringAtIndex:", 0);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            if (!-[NSArray containsObject:](self->_virtualEntities, "containsObject:", v42))
              goto LABEL_31;
            v43 = self->_fieldsIndex;
            objc_msgSend(v35, "fieldName");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            if (-[NSArray containsObject:](v43, "containsObject:", v44))
            {
LABEL_32:

            }
            else
            {
              entities = self->_entities;
              objc_msgSend(v35, "fieldName");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              LOBYTE(entities) = -[NSArray containsObject:](entities, "containsObject:", v46);

              if ((entities & 1) == 0)
              {
LABEL_31:
                objc_msgSend(v35, "shortDescription");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v80, "appendFormat:", CFSTR("clause: %@,"), v44);
                goto LABEL_32;
              }
            }

            goto LABEL_34;
          }
          v38 = self->_fieldsIndex;
          objc_msgSend(v35, "fieldName");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v38) = -[NSArray containsObject:](v38, "containsObject:", v39);

          if ((v38 & 1) == 0)
          {
            objc_msgSend(v35, "shortDescription");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v80, "appendFormat:", CFSTR("clause: %@,"), v40);
LABEL_34:

          }
        }

      }
    }
    if (objc_msgSend(v80, "length"))
    {
      v47 = (void *)MEMORY[0x24BDD1540];
      v105 = CFSTR("Invalid clauses");
      v106 = v80;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v106, &v105, 1);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "errorWithDomain:code:userInfo:", CFSTR("com.apple.FinHealth.Framework"), 10016, v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "addObject:", v49);

      FinHealthLogObject(CFSTR("FinHealthCore"));
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v80;
        _os_log_impl(&dword_23B4A2000, v50, OS_LOG_TYPE_DEBUG, "Invalid clauses: %@", (uint8_t *)&buf, 0xCu);
      }

    }
  }
  if (objc_msgSend(v83, "count"))
  {
    v75[2](v75, 0, v83, 1);
  }
  else
  {
    objc_msgSend(v78, "expressionFromClausesAndOperators");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    if (v79)
    {
      v51 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      objc_msgSend(v51, "addObject:", CFSTR(" ORDER BY "));
      v93 = 0u;
      v94 = 0u;
      v91 = 0u;
      v92 = 0u;
      obj = v79;
      v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v104, 16);
      if (v52)
      {
        v53 = 0;
        v54 = *(_QWORD *)v92;
        do
        {
          v55 = 0;
          v81 = v53;
          v56 = -v53;
          do
          {
            if (*(_QWORD *)v92 != v54)
              objc_enumerationMutation(obj);
            v57 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * v55);
            objc_msgSend(v57, "featureLabel");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "featureRank");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            v60 = objc_msgSend(v59, "integerValue");

            if (v56 != (_DWORD)v55)
              objc_msgSend(v51, "addObject:", CFSTR(", "));
            objc_msgSend(v51, "addObject:", v58);
            if (v60 == -1)
              v61 = CFSTR(" ASC");
            else
              v61 = CFSTR(" DESC");
            objc_msgSend(v51, "addObject:", v61);

            ++v55;
          }
          while (v52 != v55);
          v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v104, 16);
          v53 = v81 + v52;
          v52 = v62;
        }
        while (v62);
      }

      v63 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v51, "componentsJoinedByString:", &stru_250C67C70);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "stringWithFormat:", CFSTR("%@"), v64);
      v65 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v73, "stringByAppendingString:", v65);
      v66 = objc_claimAutoreleasedReturnValue();

      v73 = (void *)v66;
    }
    if (v78)
    {
      objc_msgSend(v78, "clausesAndOperatorsInOrder");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v67, "count"))
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ WHERE %@;"), self->_multiEntityJoinQuery, v73);
        v68 = (NSString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v68 = self->_multiEntityJoinQuery;
      }
      v69 = v68;

    }
    else
    {
      v69 = self->_multiEntityJoinQuery;
    }
    FinHealthLogObject(CFSTR("FinHealthCore"));
    v70 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v69;
      _os_log_impl(&dword_23B4A2000, v70, OS_LOG_TYPE_DEBUG, "clausesFromBuilder - sql: %@", (uint8_t *)&buf, 0xCu);
    }

    objc_initWeak(&location, self);
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v102 = 0x2020000000;
    v103 = 0;
    -[FHDatabaseEntity _getDatabaseManager](self, "_getDatabaseManager");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v85[0] = MEMORY[0x24BDAC760];
    v85[1] = 3221225472;
    v85[2] = __93__FHDatabaseEntity_queryDataWithBlock_logicalOperator_limit_selectFields_orderby_usingBlock___block_invoke_113;
    v85[3] = &unk_250C66ED8;
    p_buf = &buf;
    v89[1] = (id)a5;
    objc_copyWeak(v89, &location);
    v86 = v77;
    v87 = v75;
    objc_msgSend(v71, "streamQueryResults:usingFetchHandler:", v69, v85);

    objc_destroyWeak(v89);
    _Block_object_dispose(&buf, 8);
    objc_destroyWeak(&location);

  }
}

uint64_t __93__FHDatabaseEntity_queryDataWithBlock_logicalOperator_limit_selectFields_orderby_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

void __93__FHDatabaseEntity_queryDataWithBlock_logicalOperator_limit_selectFields_orderby_usingBlock___block_invoke_113(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v3 = a2;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) != *(_QWORD *)(a1 + 64))
  {
    v9 = v3;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    if (v9 && WeakRetained)
    {
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 40);
      if (v5)
      {
        objc_msgSend(v9, "objectsAtIndexes:");
        v7 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = objc_msgSend(v9, "copy");
      }
      v8 = (void *)v7;
      (*(void (**)(uint64_t, uint64_t, _QWORD, _QWORD))(v6 + 16))(v6, v7, 0, 0);

    }
    v3 = v9;
  }

}

- (BOOL)clearDataWithClauseBuilder:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  NSArray *fieldsIndex;
  void *v10;
  void *v11;
  NSObject *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint8_t buf[4];
  NSObject *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  if (!v4)
    goto LABEL_18;
  objc_msgSend(v4, "clausesAndOperatorsInOrder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    v7 = 0;
    do
    {
      objc_msgSend(v6, "objectAtIndex:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        fieldsIndex = self->_fieldsIndex;
        objc_msgSend(v8, "fieldName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(fieldsIndex) = -[NSArray containsObject:](fieldsIndex, "containsObject:", v10);

        if ((fieldsIndex & 1) == 0)
        {
          objc_msgSend(v8, "shortDescription");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject appendFormat:](v5, "appendFormat:", CFSTR("clause: %@,"), v11);

        }
      }

      ++v7;
    }
    while (v7 < objc_msgSend(v6, "count"));
  }
  if (!-[NSObject length](v5, "length"))
  {
    if (-[NSArray count](self->_entities, "count") == 1)
    {
      v14 = (void *)MEMORY[0x24BDD17C8];
      -[NSArray firstObject](self->_entities, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "expressionFromClausesAndOperators");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", CFSTR("%@ %@ WHERE (%@);"), CFSTR("delete from"), v15, v16);
      v12 = objc_claimAutoreleasedReturnValue();

      FinHealthLogObject(CFSTR("FinHealthCore"));
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v12;
        _os_log_impl(&dword_23B4A2000, v17, OS_LOG_TYPE_DEBUG, "clausesFromBuilder - sql: %@", buf, 0xCu);
      }

      -[FHDatabaseEntity _getDatabaseManager](self, "_getDatabaseManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v18, "deleteWithSQL:", v12);

      goto LABEL_16;
    }

LABEL_18:
    v13 = 0;
    goto LABEL_19;
  }
  FinHealthLogObject(CFSTR("FinHealthCore"));
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v5;
    _os_log_impl(&dword_23B4A2000, v12, OS_LOG_TYPE_ERROR, "Invalid clauses: %@", buf, 0xCu);
  }
  v13 = 0;
LABEL_16:

LABEL_19:
  return v13;
}

- (void)queryDataWithBlock:(id)a3 logicalOperator:(id)a4 selectFields:(id)a5 usingBlock:(id)a6
{
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v10 = a6;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __79__FHDatabaseEntity_queryDataWithBlock_logicalOperator_selectFields_usingBlock___block_invoke;
  v12[3] = &unk_250C66F00;
  v13 = v10;
  v11 = v10;
  -[FHDatabaseEntity queryDataWithBlock:logicalOperator:limit:selectFields:orderby:usingBlock:](self, "queryDataWithBlock:logicalOperator:limit:selectFields:orderby:usingBlock:", a3, a4, -1, a5, 0, v12);

}

uint64_t __79__FHDatabaseEntity_queryDataWithBlock_logicalOperator_selectFields_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)queryDataWithBlock:(id)a3 logicalOperator:(id)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v8 = a5;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __66__FHDatabaseEntity_queryDataWithBlock_logicalOperator_usingBlock___block_invoke;
  v10[3] = &unk_250C66F00;
  v11 = v8;
  v9 = v8;
  -[FHDatabaseEntity queryDataWithBlock:logicalOperator:limit:selectFields:orderby:usingBlock:](self, "queryDataWithBlock:logicalOperator:limit:selectFields:orderby:usingBlock:", a3, a4, -1, 0, 0, v10);

}

uint64_t __66__FHDatabaseEntity_queryDataWithBlock_logicalOperator_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)insertOrUpdate:(id)a3 upsert:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  NSObject *v8;
  NSUInteger v9;
  int v10;
  NSUInteger v11;
  uint64_t v12;

  v4 = a4;
  v12 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (-[NSArray count](self->_entities, "count") == 1)
  {
    -[NSArray firstObject](self->_entities, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHDatabaseEntity insertOrUpdateWithEntity:fieldValuePairsFromBuilder:upsert:](self, "insertOrUpdateWithEntity:fieldValuePairsFromBuilder:upsert:", v7, v6, v4);

  }
  else
  {
    FinHealthLogObject(CFSTR("FinHealthCore"));
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = -[NSArray count](self->_entities, "count");
      v10 = 134217984;
      v11 = v9;
      _os_log_impl(&dword_23B4A2000, v8, OS_LOG_TYPE_ERROR, "Operation insertOrUpdate not supported, [_entities count] = %lu", (uint8_t *)&v10, 0xCu);
    }

  }
}

- (BOOL)clearData
{
  void *v3;
  BOOL v4;
  NSObject *v6;
  NSUInteger v7;
  int v8;
  NSUInteger v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (-[NSArray count](self->_entities, "count") == 1)
  {
    -[NSArray firstObject](self->_entities, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[FHDatabaseEntity clearDataWithEntity:](self, "clearDataWithEntity:", v3);

    return v4;
  }
  else
  {
    FinHealthLogObject(CFSTR("FinHealthCore"));
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = -[NSArray count](self->_entities, "count");
      v8 = 134217984;
      v9 = v7;
      _os_log_impl(&dword_23B4A2000, v6, OS_LOG_TYPE_ERROR, "clearDataWithEntity insertOrUpdate not supported, [_entities count] = %lu", (uint8_t *)&v8, 0xCu);
    }

    return 0;
  }
}

- (void)insertOrUpdateWithEntity:(id)a3 fieldValuePairsFromBuilder:(id)a4 upsert:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSArray *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSArray *fieldsIndex;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  _BOOL4 v36;
  id v37;
  id v38;
  uint8_t buf[4];
  void *v40;
  uint64_t v41;

  v5 = a5;
  v41 = *MEMORY[0x24BDAC8D0];
  v38 = a3;
  v8 = a4;
  v9 = (void *)objc_opt_new();
  v10 = (void *)objc_opt_new();
  v11 = (void *)objc_opt_new();
  if (v8)
  {
    objc_msgSend(v8, "fieldValuePairList");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v36 = v5;
      v37 = v8;
      objc_msgSend(v8, "fieldValuePairList");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "count") == 1)
      {
LABEL_7:
        objc_msgSend(v13, "lastObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        fieldsIndex = self->_fieldsIndex;
        objc_msgSend(v15, "fieldName");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(fieldsIndex) = -[NSArray containsObject:](fieldsIndex, "containsObject:", v23);

        if ((_DWORD)fieldsIndex)
        {
          objc_msgSend(v15, "fieldName");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "substringFromIndex:", objc_msgSend(v38, "length") + 1);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v25, "lowercaseString");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "appendString:", v26);

          objc_msgSend(v10, "appendString:", CFSTR("?"));
          objc_msgSend(v15, "fieldValue");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v27);

          v28 = (void *)MEMORY[0x24BDD17C8];
          if (v36)
            v29 = CFSTR("insert or replace into");
          else
            v29 = CFSTR("insert into");
          v30 = (void *)objc_msgSend(v9, "copy");
          v31 = (void *)objc_msgSend(v10, "copy");
          objc_msgSend(v28, "stringWithFormat:", CFSTR("%@ %@ (%@) values (%@)"), v29, v38, v30, v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          -[FHDatabaseEntity _getDatabaseManager](self, "_getDatabaseManager");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = (void *)objc_msgSend(v11, "copy");
          objc_msgSend(v33, "executeAsPreparedStatement:values:", v32, v34);

          goto LABEL_18;
        }
        FinHealthLogObject(CFSTR("FinHealthCore"));
        v35 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        {
LABEL_17:

LABEL_18:
          v8 = v37;

          goto LABEL_19;
        }
        *(_DWORD *)buf = 138412290;
        v40 = v15;
      }
      else
      {
        v14 = 0;
        while (1)
        {
          objc_msgSend(v13, "objectAtIndex:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = self->_fieldsIndex;
          objc_msgSend(v15, "fieldName");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v16) = -[NSArray containsObject:](v16, "containsObject:", v17);

          if ((v16 & 1) == 0)
            break;
          objc_msgSend(v15, "fieldName");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "substringFromIndex:", objc_msgSend(v38, "length") + 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v19, "lowercaseString");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "appendString:", v20);

          objc_msgSend(v10, "appendString:", CFSTR("?"));
          objc_msgSend(v9, "appendString:", CFSTR(", "));
          objc_msgSend(v10, "appendString:", CFSTR(", "));
          objc_msgSend(v15, "fieldValue");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v21);

          if (++v14 >= (unint64_t)(objc_msgSend(v13, "count") - 1))
            goto LABEL_7;
        }
        FinHealthLogObject(CFSTR("FinHealthCore"));
        v35 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
          goto LABEL_17;
        *(_DWORD *)buf = 138412290;
        v40 = v15;
      }
      _os_log_impl(&dword_23B4A2000, v35, OS_LOG_TYPE_DEBUG, "Invalid fieldValuePair: %@", buf, 0xCu);
      goto LABEL_17;
    }
  }
LABEL_19:

}

- (BOOL)clearDataWithEntity:(id)a3
{
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), CFSTR("delete from"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FHDatabaseEntity _getDatabaseManager](self, "_getDatabaseManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "deleteWithSQL:", v4);

  return v6;
}

- (id)_availableFunctions:(int64_t)a3 functionTypeFilter:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  id v18;
  id v19;
  id location;

  v5 = a4;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PRAGMA function_list;"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  objc_initWeak(&location, self);
  -[FHDatabaseEntity _getDatabaseManager](self, "_getDatabaseManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = __59__FHDatabaseEntity__availableFunctions_functionTypeFilter___block_invoke;
  v16 = &unk_250C66F28;
  objc_copyWeak(&v19, &location);
  v9 = v5;
  v17 = v9;
  v10 = v7;
  v18 = v10;
  objc_msgSend(v8, "streamQueryResults:usingFetchHandler:", v6, &v13);

  v11 = (void *)objc_msgSend(v10, "copy", v13, v14, v15, v16);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  return v11;
}

void __59__FHDatabaseEntity__availableFunctions_functionTypeFilter___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_msgSend(v3, "objectAtIndex:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "objectAtIndex:", 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "objectAtIndex:", 4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "intValue");

    if (v8)
    {
      v11 = *(void **)(a1 + 32);
      if (v11)
      {
        if (objc_msgSend(v11, "isEqualToString:", v8))
        {
          objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v6);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v10);
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = (void *)v13;
          if (v12)
          {
            v18[0] = v13;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "arrayByAddingObjectsFromArray:", v12);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v17 = v13;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v17, 1);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
          }

          objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v16, v6);
        }
      }
    }

  }
}

- (NSArray)fieldsInOrder
{
  return self->_fieldsIndex;
}

- (NSArray)entities
{
  return self->_entities;
}

- (void)setEntities:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (FHDatabaseManager)databaseManagerWeak
{
  return (FHDatabaseManager *)objc_loadWeakRetained((id *)&self->_databaseManagerWeak);
}

- (void)setDatabaseManagerWeak:(id)a3
{
  objc_storeWeak((id *)&self->_databaseManagerWeak, a3);
}

- (FHDatabaseManager)databaseManagerStrong
{
  return self->_databaseManagerStrong;
}

- (void)setDatabaseManagerStrong:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDictionary)scalarFunctions
{
  return self->_scalarFunctions;
}

- (void)setScalarFunctions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDictionary)windowFunctions
{
  return self->_windowFunctions;
}

- (void)setWindowFunctions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)multiEntityJoinQuery
{
  return self->_multiEntityJoinQuery;
}

- (void)setMultiEntityJoinQuery:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)virtualEntities
{
  return self->_virtualEntities;
}

- (void)setVirtualEntities:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)joinType
{
  return self->_joinType;
}

- (void)setJoinType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_joinType, 0);
  objc_storeStrong((id *)&self->_virtualEntities, 0);
  objc_storeStrong((id *)&self->_multiEntityJoinQuery, 0);
  objc_storeStrong((id *)&self->_windowFunctions, 0);
  objc_storeStrong((id *)&self->_scalarFunctions, 0);
  objc_storeStrong((id *)&self->_databaseManagerStrong, 0);
  objc_destroyWeak((id *)&self->_databaseManagerWeak);
  objc_storeStrong((id *)&self->_entities, 0);
  objc_storeStrong((id *)&self->_fieldsIndex, 0);
}

@end

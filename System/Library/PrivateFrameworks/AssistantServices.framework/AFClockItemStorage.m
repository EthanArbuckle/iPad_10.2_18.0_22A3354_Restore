@implementation AFClockItemStorage

- (AFClockItemStorage)initWithIdentifier:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  AFClockItemStorage *v8;
  uint64_t v9;
  NSString *identifier;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AFClockItemStorage;
  v8 = -[AFClockItemStorage init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    objc_storeWeak((id *)&v8->_delegate, v7);
  }

  return v8;
}

- (void)setGeneration:(unint64_t)a3
{
  -[AFClockItemStorage beginGrouping](self, "beginGrouping");
  self->_workingGeneration = a3;
  -[AFClockItemStorage endGroupingWithOptions:](self, "endGroupingWithOptions:", 0);
}

- (void)setDate:(id)a3
{
  id v4;
  NSDate *v5;
  NSDate *workingDate;

  v4 = a3;
  -[AFClockItemStorage beginGrouping](self, "beginGrouping");
  v5 = (NSDate *)objc_msgSend(v4, "copy");

  workingDate = self->_workingDate;
  self->_workingDate = v5;

  -[AFClockItemStorage endGroupingWithOptions:](self, "endGroupingWithOptions:", 0);
}

- (void)setItemsByID:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *workingItemsByID;

  v4 = a3;
  -[AFClockItemStorage beginGrouping](self, "beginGrouping");
  v5 = (NSMutableDictionary *)objc_msgSend(v4, "mutableCopy");

  workingItemsByID = self->_workingItemsByID;
  self->_workingItemsByID = v5;

  -[AFClockItemStorage endGroupingWithOptions:](self, "endGroupingWithOptions:", 0);
}

- (void)beginGrouping
{
  int64_t groupingDepth;
  int64_t v4;
  NSObject *v5;
  NSDate *date;
  NSDate *v7;
  NSDate *workingDate;
  NSDictionary *itemsByID;
  NSMutableDictionary *v10;
  NSMutableDictionary *workingItemsByID;
  int v12;
  const char *v13;
  __int16 v14;
  int64_t v15;
  __int16 v16;
  int64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  groupingDepth = self->_groupingDepth;
  v4 = groupingDepth + 1;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v12 = 136315650;
    v13 = "-[AFClockItemStorage beginGrouping]";
    v14 = 2048;
    v15 = groupingDepth;
    v16 = 2048;
    v17 = groupingDepth + 1;
    _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s grouping depth: %ld -> %ld", (uint8_t *)&v12, 0x20u);
    groupingDepth = self->_groupingDepth;
  }
  if (!groupingDepth)
  {
    date = self->_date;
    self->_workingGeneration = self->_generation;
    v7 = (NSDate *)-[NSDate copy](date, "copy");
    workingDate = self->_workingDate;
    self->_workingDate = v7;

    itemsByID = self->_itemsByID;
    if (itemsByID)
      v10 = (NSMutableDictionary *)-[NSDictionary mutableCopy](itemsByID, "mutableCopy");
    else
      v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    workingItemsByID = self->_workingItemsByID;
    self->_workingItemsByID = v10;

  }
  self->_groupingDepth = v4;
}

- (void)endGroupingWithOptions:(unint64_t)a3
{
  int64_t groupingDepth;
  __objc2_class **p_superclass;
  char v5;
  NSObject *v6;
  NSMutableDictionary *itemsByID;
  AFClockItemStorage *v8;
  id v9;
  id v10;
  int v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  _BOOL4 v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  AFClockItemStorage *v25;
  id v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  NSObject *v37;
  id v38;
  uint64_t v39;
  NSMutableDictionary *workingItemsByID;
  NSObject *v41;
  NSMutableDictionary *v42;
  void *v43;
  id v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t j;
  NSObject *v50;
  uint64_t v51;
  id v52;
  NSDictionary *v53;
  NSObject *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t k;
  uint64_t v63;
  void *v64;
  void *v65;
  NSObject *v66;
  uint64_t v67;
  uint64_t v68;
  NSObject *v69;
  NSDictionary *v70;
  NSDictionary *v71;
  unint64_t generation;
  unint64_t workingGeneration;
  _BOOL4 v74;
  NSObject *v75;
  unint64_t v76;
  NSDate *date;
  int v78;
  NSObject *v79;
  NSDate *v80;
  NSDate *workingDate;
  uint64_t v82;
  NSDate *v83;
  void *v84;
  unint64_t v85;
  NSObject *v86;
  int v87;
  void *v88;
  NSObject *v89;
  void *v90;
  NSObject *v91;
  NSDate *v92;
  uint64_t v93;
  NSDate *v94;
  id WeakRetained;
  void *v96;
  id v97;
  id v98;
  uint64_t v99;
  id v100;
  void *v101;
  void *v102;
  char v103;
  id v104;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  _BYTE v118[128];
  _BYTE v119[128];
  uint8_t v120[128];
  uint8_t buf[4];
  const char *v122;
  __int16 v123;
  unint64_t v124;
  __int16 v125;
  int64_t v126;
  uint64_t v127;

  v127 = *MEMORY[0x1E0C80C00];
  groupingDepth = self->_groupingDepth;
  p_superclass = &OBJC_METACLASS___AFFeatureFlags.superclass;
  if (groupingDepth < 1)
  {
    v12 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v122 = "-[AFClockItemStorage endGroupingWithOptions:]";
      _os_log_error_impl(&dword_19AF50000, v12, OS_LOG_TYPE_ERROR, "%s Attempt to end grouping without a balanced begin grouping.", buf, 0xCu);
    }
  }
  else
  {
    v5 = a3;
    v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v122 = "-[AFClockItemStorage endGroupingWithOptions:]";
      v123 = 2048;
      v124 = groupingDepth;
      v125 = 2048;
      v126 = groupingDepth - 1;
      _os_log_impl(&dword_19AF50000, v6, OS_LOG_TYPE_INFO, "%s grouping depth: %ld -> %ld", buf, 0x20u);
    }
    self->_groupingDepth = groupingDepth - 1;
    if (groupingDepth == 1)
    {
      itemsByID = (NSMutableDictionary *)self->_itemsByID;
      v8 = self;
      v103 = v5;
      if (itemsByID == self->_workingItemsByID
        || (-[NSMutableDictionary isEqualToDictionary:](itemsByID, "isEqualToDictionary:") & 1) != 0)
      {
        v9 = 0;
        v104 = 0;
        v10 = 0;
        v11 = 0;
        goto LABEL_82;
      }
      v13 = -[NSDictionary count](self->_itemsByID, "count");
      v14 = -[NSMutableDictionary count](self->_workingItemsByID, "count");
      v15 = AFSiriLogContextConnection;
      v16 = os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO);
      if (v13 == (id)v14)
      {
        if (!v16)
          goto LABEL_16;
        *(_DWORD *)buf = 136315394;
        v122 = "-[AFClockItemStorage endGroupingWithOptions:]";
        v123 = 2048;
        v124 = (unint64_t)v13;
        v17 = "%s numberOfItems: %lu";
        v18 = v15;
        v19 = 22;
      }
      else
      {
        if (!v16)
          goto LABEL_16;
        *(_DWORD *)buf = 136315650;
        v122 = "-[AFClockItemStorage endGroupingWithOptions:]";
        v123 = 2048;
        v124 = (unint64_t)v13;
        v125 = 2048;
        v126 = v14;
        v17 = "%s numberOfItems: %lu -> %lu";
        v18 = v15;
        v19 = 32;
      }
      _os_log_impl(&dword_19AF50000, v18, OS_LOG_TYPE_INFO, v17, buf, v19);
LABEL_16:
      v20 = objc_alloc(MEMORY[0x1E0C99E60]);
      -[NSDictionary allKeys](self->_itemsByID, "allKeys");
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)v21;
      v23 = MEMORY[0x1E0C9AA60];
      if (v21)
        v24 = v21;
      else
        v24 = MEMORY[0x1E0C9AA60];
      v102 = (void *)objc_msgSend(v20, "initWithArray:", v24);

      v25 = self;
      v26 = objc_alloc(MEMORY[0x1E0C99E60]);
      -[NSMutableDictionary allKeys](self->_workingItemsByID, "allKeys");
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = (void *)v27;
      if (v27)
        v29 = v27;
      else
        v29 = v23;
      v30 = (void *)objc_msgSend(v26, "initWithArray:", v29);

      if (v14)
      {
        if (v13)
        {
          v31 = (void *)objc_msgSend(v30, "mutableCopy");
          objc_msgSend(v31, "minusSet:", v102);
        }
        else
        {
          v31 = (void *)objc_msgSend(v30, "copy");
        }
        v99 = v14;
        if (!objc_msgSend(v31, "count"))
        {

          v10 = 0;
          v44 = v13;
          v13 = 0;
          v45 = 0;
          if (v44)
            goto LABEL_43;
          goto LABEL_78;
        }
        v116 = 0u;
        v117 = 0u;
        v114 = 0u;
        v115 = 0u;
        v10 = v31;
        v33 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v114, v120, 16);
        if (v33)
        {
          v34 = v33;
          v97 = v13;
          v35 = *(_QWORD *)v115;
          do
          {
            for (i = 0; i != v34; ++i)
            {
              if (*(_QWORD *)v115 != v35)
                objc_enumerationMutation(v10);
              v37 = p_superclass[179];
              if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
              {
                v38 = v10;
                v39 = *(_QWORD *)(*((_QWORD *)&v114 + 1) + 8 * i);
                workingItemsByID = self->_workingItemsByID;
                v41 = v37;
                v42 = workingItemsByID;
                p_superclass = (__objc2_class **)(&OBJC_METACLASS___AFFeatureFlags + 8);
                -[NSMutableDictionary objectForKey:](v42, "objectForKey:", v39);
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136315394;
                v122 = "-[AFClockItemStorage endGroupingWithOptions:]";
                v123 = 2112;
                v124 = (unint64_t)v43;
                _os_log_impl(&dword_19AF50000, v41, OS_LOG_TYPE_INFO, "%s itemsByID: [+] %@", buf, 0x16u);

                v10 = v38;
              }
            }
            v34 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v114, v120, 16);
          }
          while (v34);

          if (v97)
          {
            v25 = self;
LABEL_43:
            v32 = (void *)objc_msgSend(v102, "mutableCopy");
            objc_msgSend(v32, "minusSet:", v30);
LABEL_44:
            v101 = v30;
            if (objc_msgSend(v32, "count"))
            {
              v112 = 0u;
              v113 = 0u;
              v110 = 0u;
              v111 = 0u;
              v13 = v32;
              v46 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v110, v119, 16);
              if (v46)
              {
                v47 = v46;
                v96 = v32;
                v48 = *(_QWORD *)v111;
                do
                {
                  for (j = 0; j != v47; ++j)
                  {
                    if (*(_QWORD *)v111 != v48)
                      objc_enumerationMutation(v13);
                    v50 = p_superclass[179];
                    if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
                    {
                      v51 = *(_QWORD *)(*((_QWORD *)&v110 + 1) + 8 * j);
                      v52 = v13;
                      v53 = self->_itemsByID;
                      v54 = v50;
                      v55 = v51;
                      p_superclass = (__objc2_class **)(&OBJC_METACLASS___AFFeatureFlags + 8);
                      -[NSDictionary objectForKey:](v53, "objectForKey:", v55);
                      v56 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 136315394;
                      v122 = "-[AFClockItemStorage endGroupingWithOptions:]";
                      v123 = 2112;
                      v124 = (unint64_t)v56;
                      _os_log_impl(&dword_19AF50000, v54, OS_LOG_TYPE_INFO, "%s itemsByID: [-] %@", buf, 0x16u);

                      v13 = v52;
                    }
                  }
                  v47 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v110, v119, 16);
                }
                while (v47);
                v25 = self;
                v32 = v96;
              }
              v30 = v101;
            }
            else
            {
              v13 = 0;
            }

            if (v99)
            {
              v57 = (void *)objc_msgSend(v102, "mutableCopy");
              objc_msgSend(v57, "intersectSet:", v30);
              if (objc_msgSend(v57, "count"))
              {
                v98 = v10;
                v100 = v13;
                v45 = objc_alloc_init(MEMORY[0x1E0C99E20]);
                v106 = 0u;
                v107 = 0u;
                v108 = 0u;
                v109 = 0u;
                v96 = v57;
                v58 = v57;
                v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v106, v118, 16);
                if (v59)
                {
                  v60 = v59;
                  v61 = *(_QWORD *)v107;
                  do
                  {
                    for (k = 0; k != v60; ++k)
                    {
                      if (*(_QWORD *)v107 != v61)
                        objc_enumerationMutation(v58);
                      v63 = *(_QWORD *)(*((_QWORD *)&v106 + 1) + 8 * k);
                      -[NSDictionary objectForKey:](v25->_itemsByID, "objectForKey:", v63, v96);
                      v64 = (void *)objc_claimAutoreleasedReturnValue();
                      -[NSMutableDictionary objectForKey:](v25->_workingItemsByID, "objectForKey:", v63);
                      v65 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v64 != v65 && (objc_msgSend(v64, "isEqual:", v65) & 1) == 0)
                      {
                        v66 = AFSiriLogContextConnection;
                        if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
                        {
                          *(_DWORD *)buf = 136315650;
                          v122 = "-[AFClockItemStorage endGroupingWithOptions:]";
                          v123 = 2112;
                          v124 = (unint64_t)v64;
                          v125 = 2112;
                          v126 = (int64_t)v65;
                          _os_log_impl(&dword_19AF50000, v66, OS_LOG_TYPE_INFO, "%s itemsByID: [*] %@ -> %@", buf, 0x20u);
                        }
                        objc_msgSend(v45, "addObject:", v63);
                      }

                    }
                    v60 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v106, v118, 16);
                  }
                  while (v60);
                }

                p_superclass = (__objc2_class **)(&OBJC_METACLASS___AFFeatureFlags + 8);
                if (!objc_msgSend(v45, "count"))
                {

                  v45 = 0;
                }
                v10 = v98;
                v13 = v100;
                v30 = v101;
                v57 = v96;
              }
              else
              {
                v45 = 0;
              }

              goto LABEL_78;
            }
            goto LABEL_77;
          }
          v13 = 0;
          v45 = 0;
LABEL_78:
          v67 = objc_msgSend(v10, "count", v96);
          v68 = objc_msgSend(v45, "count") + v67;
          if (!(v68 + objc_msgSend(v13, "count")))
          {
            v69 = p_superclass[179];
            if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315138;
              v122 = "-[AFClockItemStorage endGroupingWithOptions:]";
              _os_log_error_impl(&dword_19AF50000, v69, OS_LOG_TYPE_ERROR, "%s Item changes detected, but there is no inserted, updated or deleted items.", buf, 0xCu);
            }
          }
          v104 = v45;
          v9 = v13;
          v8 = self;
          v70 = (NSDictionary *)-[NSMutableDictionary copy](self->_workingItemsByID, "copy");
          v71 = self->_itemsByID;
          self->_itemsByID = v70;

          v11 = 1;
LABEL_82:
          generation = v8->_generation;
          workingGeneration = v8->_workingGeneration;
          v74 = generation != workingGeneration;
          if (generation != workingGeneration)
          {
            v75 = p_superclass[179];
            if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315650;
              v122 = "-[AFClockItemStorage endGroupingWithOptions:]";
              v123 = 2048;
              v124 = generation;
              v125 = 2048;
              v126 = workingGeneration;
              _os_log_impl(&dword_19AF50000, v75, OS_LOG_TYPE_INFO, "%s generation: %llu -> %llu", buf, 0x20u);
              v76 = v8->_workingGeneration;
            }
            else
            {
              v76 = workingGeneration;
            }
            v8->_generation = v76;
          }
          date = v8->_date;
          if (date == v8->_workingDate || -[NSDate isEqualToDate:](date, "isEqualToDate:"))
          {
            v78 = 0;
          }
          else
          {
            v79 = p_superclass[179];
            if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
            {
              v80 = v8->_date;
              workingDate = v8->_workingDate;
              *(_DWORD *)buf = 136315650;
              v122 = "-[AFClockItemStorage endGroupingWithOptions:]";
              v123 = 2112;
              v124 = (unint64_t)v80;
              v125 = 2112;
              v126 = (int64_t)workingDate;
              _os_log_impl(&dword_19AF50000, v79, OS_LOG_TYPE_INFO, "%s date: %@ -> %@", buf, 0x20u);
            }
            v82 = -[NSDate copy](v8->_workingDate, "copy");
            v83 = v8->_date;
            v8->_date = (NSDate *)v82;

            v78 = 1;
          }
          if (generation == workingGeneration)
          {
            v84 = v9;
            if (v11 | v78)
            {
              v85 = v8->_generation;
              v86 = p_superclass[179];
              if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315650;
                v122 = "-[AFClockItemStorage endGroupingWithOptions:]";
                v123 = 2048;
                v124 = v85;
                v125 = 2048;
                v126 = v85 + 1;
                _os_log_impl(&dword_19AF50000, v86, OS_LOG_TYPE_INFO, "%s generation: %llu -> %llu", buf, 0x20u);
              }
              self->_generation = v85 + 1;
              v8 = self;
              v74 = 1;
            }
          }
          else
          {
            v84 = v9;
          }
          if (((v78 | (v11 | v74) ^ 1) & 1) != 0)
          {
            v87 = v78 | v11 | v74;
            v88 = v104;
            if (v87 != 1)
            {
              v89 = p_superclass[179];
              if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315138;
                v122 = "-[AFClockItemStorage endGroupingWithOptions:]";
                _os_log_impl(&dword_19AF50000, v89, OS_LOG_TYPE_INFO, "%s There's no generation, date or item changes.", buf, 0xCu);
              }
LABEL_108:

              return;
            }
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99D68], "date");
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            v91 = p_superclass[179];
            v88 = v104;
            if (os_log_type_enabled(v91, OS_LOG_TYPE_INFO))
            {
              v92 = v8->_date;
              *(_DWORD *)buf = 136315650;
              v122 = "-[AFClockItemStorage endGroupingWithOptions:]";
              v123 = 2112;
              v124 = (unint64_t)v92;
              v125 = 2112;
              v126 = (int64_t)v90;
              _os_log_impl(&dword_19AF50000, v91, OS_LOG_TYPE_INFO, "%s date: %@ -> %@", buf, 0x20u);
            }
            v93 = objc_msgSend(v90, "copy");
            v94 = v8->_date;
            v8->_date = (NSDate *)v93;

          }
          if ((v103 & 1) == 0)
          {
            WeakRetained = objc_loadWeakRetained((id *)&v8->_delegate);
            objc_msgSend(WeakRetained, "clockItemStorageDidUpdate:insertedItemIDs:updatedItemIDs:deletedItemIDs:", v8, v10, v88, v84);

          }
          goto LABEL_108;
        }

        if (v13)
          goto LABEL_43;
      }
      else
      {
        if (v13)
        {
          v99 = 0;
          v32 = (void *)objc_msgSend(v102, "copy");
          v10 = 0;
          goto LABEL_44;
        }
        v10 = 0;
      }
LABEL_77:
      v45 = 0;
      goto LABEL_78;
    }
  }
}

- (id)itemWithID:(id)a3
{
  uint64_t v3;

  v3 = 72;
  if (self->_groupingDepth > 0)
    v3 = 40;
  objc_msgSend(*(id *)((char *)&self->super.isa + v3), "objectForKey:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)insertOrUpdateItems:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v19 = "-[AFClockItemStorage insertOrUpdateItems:]";
    v20 = 2112;
    v21 = v4;
    _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s items = %@", buf, 0x16u);
  }
  if (objc_msgSend(v4, "count"))
  {
    -[AFClockItemStorage beginGrouping](self, "beginGrouping");
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          objc_msgSend(v11, "itemID", (_QWORD)v13);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
            -[NSMutableDictionary setObject:forKey:](self->_workingItemsByID, "setObject:forKey:", v11, v12);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

    -[AFClockItemStorage endGroupingWithOptions:](self, "endGroupingWithOptions:", 0);
  }

}

- (void)deleteItemsWithIDs:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v6 = 136315394;
    v7 = "-[AFClockItemStorage deleteItemsWithIDs:]";
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s itemIDs = %@", (uint8_t *)&v6, 0x16u);
  }
  if (objc_msgSend(v4, "count"))
  {
    -[AFClockItemStorage beginGrouping](self, "beginGrouping");
    -[NSMutableDictionary removeObjectsForKeys:](self->_workingItemsByID, "removeObjectsForKeys:", v4);
    -[AFClockItemStorage endGroupingWithOptions:](self, "endGroupingWithOptions:", 0);
  }

}

- (void)deleteAllItems
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "-[AFClockItemStorage deleteAllItems]";
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }
  -[AFClockItemStorage beginGrouping](self, "beginGrouping");
  -[NSMutableDictionary removeAllObjects](self->_workingItemsByID, "removeAllObjects");
  -[AFClockItemStorage endGroupingWithOptions:](self, "endGroupingWithOptions:", 0);
}

- (void)invalidate
{
  NSDate *workingDate;
  NSMutableDictionary *workingItemsByID;
  NSDate *date;
  NSDictionary *itemsByID;

  objc_storeWeak((id *)&self->_delegate, 0);
  self->_groupingDepth = 0;
  self->_workingGeneration = 0;
  workingDate = self->_workingDate;
  self->_workingDate = 0;

  workingItemsByID = self->_workingItemsByID;
  self->_workingItemsByID = 0;

  date = self->_date;
  self->_generation = 0;
  self->_date = 0;

  itemsByID = self->_itemsByID;
  self->_itemsByID = 0;

}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)generation
{
  return self->_generation;
}

- (NSDate)date
{
  return self->_date;
}

- (NSDictionary)itemsByID
{
  return self->_itemsByID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemsByID, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_workingItemsByID, 0);
  objc_storeStrong((id *)&self->_workingDate, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

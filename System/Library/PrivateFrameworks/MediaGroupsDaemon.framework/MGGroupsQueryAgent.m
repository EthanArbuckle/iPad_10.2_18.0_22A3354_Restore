@implementation MGGroupsQueryAgent

- (MGGroupsQueryAgent)initWithDelegate:(id)a3
{
  id v4;
  MGGroupsQueryAgent *v5;
  MGGroupsQueryAgent *v6;
  NSOperationQueue *v7;
  NSOperationQueue *queue;
  NSOperationQueue *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  NSDictionary *v14;
  NSDictionary *queries;
  NSDictionary *v16;
  NSDictionary *operations;
  uint64_t v18;
  NSMapTable *mediators;
  NSDictionary *v20;
  NSDictionary *mediatorsByGroup;
  NSDictionary *v22;
  NSDictionary *groupsByMediator;
  NSDictionary *v24;
  NSDictionary *groups;
  NSDictionary *v26;
  NSDictionary *containers;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  objc_super v33;
  uint8_t buf[4];
  MGGroupsQueryAgent *v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)MGGroupsQueryAgent;
  v5 = -[MGGroupsQueryAgent init](&v33, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    queue = v6->_queue;
    v6->_queue = v7;

    v9 = v6->_queue;
    v10 = (void *)MEMORY[0x24BDD17C8];
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@-%p"), v12, v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSOperationQueue setName:](v9, "setName:", v13);

    v14 = (NSDictionary *)objc_alloc_init(MEMORY[0x24BDBCE70]);
    queries = v6->_queries;
    v6->_queries = v14;

    v16 = (NSDictionary *)objc_alloc_init(MEMORY[0x24BDBCE70]);
    operations = v6->_operations;
    v6->_operations = v16;

    objc_msgSend(MEMORY[0x24BDD1650], "strongToWeakObjectsMapTable");
    v18 = objc_claimAutoreleasedReturnValue();
    mediators = v6->_mediators;
    v6->_mediators = (NSMapTable *)v18;

    v20 = (NSDictionary *)objc_alloc_init(MEMORY[0x24BDBCE70]);
    mediatorsByGroup = v6->_mediatorsByGroup;
    v6->_mediatorsByGroup = v20;

    v22 = (NSDictionary *)objc_alloc_init(MEMORY[0x24BDBCE70]);
    groupsByMediator = v6->_groupsByMediator;
    v6->_groupsByMediator = v22;

    v24 = (NSDictionary *)objc_alloc_init(MEMORY[0x24BDBCE70]);
    groups = v6->_groups;
    v6->_groups = v24;

    v26 = (NSDictionary *)objc_alloc_init(MEMORY[0x24BDBCE70]);
    containers = v6->_containers;
    v6->_containers = v26;

    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "integerForKey:", CFSTR("com.apple.media-groups.max-operations"));
    if (v29 <= 5)
      v30 = 5;
    else
      v30 = v29;
    -[NSOperationQueue setMaxConcurrentOperationCount:](v6->_queue, "setMaxConcurrentOperationCount:", v30);
    MGLogForCategory(4);
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v35 = v6;
      v36 = 2048;
      v37 = v30;
      _os_log_impl(&dword_21CBD2000, v31, OS_LOG_TYPE_DEFAULT, "%p operating with a max concurrency of %ld", buf, 0x16u);
    }

  }
  return v6;
}

- (MGGroupsQueryAgent)init
{
  return -[MGGroupsQueryAgent initWithDelegate:](self, "initWithDelegate:", 0);
}

- (void)setGroups:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  MGGroupsQueryAgent *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  -[MGGroupsQueryAgent groups](self, "groups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToDictionary:", v4);

  if ((v6 & 1) != 0)
  {
    v7 = v4;
  }
  else
  {
    v7 = (void *)objc_msgSend(v4, "copy");

    objc_storeStrong((id *)&self->_groups, v7);
    MGLogForCategory(4);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 134218240;
      v11 = self;
      v12 = 2048;
      v13 = v7;
      _os_log_impl(&dword_21CBD2000, v8, OS_LOG_TYPE_DEFAULT, "%p groups updated to %p", (uint8_t *)&v10, 0x16u);
    }

    -[MGGroupsQueryAgent currentIdentifier](self, "currentIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MGGroupsQueryAgent _performQueryExchangeUsingGroups:currentIdentifier:](self, "_performQueryExchangeUsingGroups:currentIdentifier:", v7, v9);

  }
}

- (void)setGroupsByMediator:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  void *v20;
  void *v21;
  MGGroupsQueryAgent *v22;
  id obj;
  uint64_t v24;
  NSDictionary **p_groupsByMediator;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  -[MGGroupsQueryAgent groupsByMediator](self, "groupsByMediator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToDictionary:", v4);

  if ((v6 & 1) == 0)
  {
    v7 = (void *)objc_msgSend(v4, "copy");

    p_groupsByMediator = &self->_groupsByMediator;
    v21 = v7;
    objc_storeStrong((id *)&self->_groupsByMediator, v7);
    v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v22 = self;
    -[NSDictionary allKeys](self->_groupsByMediator, "allKeys");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sortedArrayUsingComparator:", &__block_literal_global);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v11;
    v26 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v26)
    {
      v24 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v32 != v24)
            objc_enumerationMutation(obj);
          v13 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
          -[NSDictionary objectForKey:](*p_groupsByMediator, "objectForKey:", v13, v21);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = 0u;
          v28 = 0u;
          v29 = 0u;
          v30 = 0u;
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v28;
            do
            {
              for (j = 0; j != v16; ++j)
              {
                if (*(_QWORD *)v28 != v17)
                  objc_enumerationMutation(v14);
                v19 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * j);
                objc_msgSend(v14, "objectForKey:", v19);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "setObject:forKey:", v20, v19);
                objc_msgSend(v9, "setObject:forKey:", v13, v19);

              }
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
            }
            while (v16);
          }

        }
        v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v26);
    }

    -[MGGroupsQueryAgent setMediatorsByGroup:](v22, "setMediatorsByGroup:", v9);
    -[MGGroupsQueryAgent setGroups:](v22, "setGroups:", v8);

    v4 = v21;
  }

}

uint64_t __42__MGGroupsQueryAgent_setGroupsByMediator___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)setCurrentIdentifier:(id)a3
{
  MGGroupIdentifier *v4;
  MGGroupIdentifier *v5;
  NSObject *v6;
  void *v7;
  int v8;
  MGGroupsQueryAgent *v9;
  __int16 v10;
  MGGroupIdentifier *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = (MGGroupIdentifier *)a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_currentIdentifier == v4 || (-[MGGroupIdentifier isEqual:](v4, "isEqual:") & 1) != 0)
  {
    v5 = v4;
  }
  else
  {
    v5 = (MGGroupIdentifier *)-[MGGroupIdentifier copy](v4, "copy");

    objc_storeStrong((id *)&self->_currentIdentifier, v5);
    MGLogForCategory(4);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 134218240;
      v9 = self;
      v10 = 2048;
      v11 = v5;
      _os_log_impl(&dword_21CBD2000, v6, OS_LOG_TYPE_DEFAULT, "%p current identifier changed to %p", (uint8_t *)&v8, 0x16u);
    }

    -[MGGroupsQueryAgent groups](self, "groups");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MGGroupsQueryAgent _performQueryExchangeUsingGroups:currentIdentifier:](self, "_performQueryExchangeUsingGroups:currentIdentifier:", v7, v5);

  }
}

- (void)setCurrentDeviceIdentifier:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __49__MGGroupsQueryAgent_setCurrentDeviceIdentifier___block_invoke;
  v6[3] = &unk_24E0AA5E8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[MGGroupsQueryAgent _withLock:](self, "_withLock:", v6);

}

uint64_t __49__MGGroupsQueryAgent_setCurrentDeviceIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCurrentIdentifier:", *(_QWORD *)(a1 + 40));
}

- (void)_withLock:(id)a3
{
  os_unfair_lock_s *p_lock;
  void (**v4)(_QWORD);

  p_lock = &self->_lock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (void)_performQueryExchangeUsingGroups:(id)a3 currentIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  -[MGGroupsQueryAgent queue](self, "queue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cancelAllOperations");
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __73__MGGroupsQueryAgent__performQueryExchangeUsingGroups_currentIdentifier___block_invoke;
  v11[3] = &unk_24E0AA8A8;
  objc_copyWeak(&v14, &location);
  v9 = v6;
  v12 = v9;
  v10 = v7;
  v13 = v10;
  objc_msgSend(v8, "addBarrierBlock:", v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __73__MGGroupsQueryAgent__performQueryExchangeUsingGroups_currentIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_prepareWithGroups:currentIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    WeakRetained = v3;
  }

}

- (void)_prepareWithGroups:(id)a3 currentIdentifier:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  unsigned int (**v11)(void);
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  unsigned int (**v27)(void);
  id v28;
  NSObject *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  uint64_t v46;
  void *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  id v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  MGGroupsQueryAgent *v72;
  id v73;
  void *v74;
  id v75;
  unsigned int (**v76)(void);
  void *v77;
  NSObject *v78;
  uint64_t v79;
  id v80;
  void *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  void *v86;
  _QWORD v87[4];
  NSObject *v88;
  MGGroupsQueryAgent *v89;
  id v90;
  id v91;
  NSObject *v92;
  _QWORD v93[4];
  id v94;
  id v95;
  NSObject *v96;
  _QWORD v97[4];
  id v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  _QWORD v107[4];
  id v108;
  id v109;
  unsigned int (**v110)(void);
  _QWORD v111[4];
  id v112;
  _QWORD v113[4];
  id v114;
  _QWORD v115[5];
  id v116;
  id v117;
  _QWORD v118[4];
  _QWORD v119[4];
  _BYTE v120[128];
  _BYTE v121[128];
  _QWORD v122[5];
  uint8_t buf[4];
  MGGroupsQueryAgent *v124;
  __int16 v125;
  id v126;
  uint64_t v127;

  v127 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x24BDAC760];
  v115[0] = MEMORY[0x24BDAC760];
  v115[1] = 3221225472;
  v115[2] = __59__MGGroupsQueryAgent__prepareWithGroups_currentIdentifier___block_invoke;
  v115[3] = &unk_24E0AA8F8;
  v115[4] = self;
  v9 = v6;
  v116 = v9;
  v10 = v7;
  v117 = v10;
  v11 = (unsigned int (**)(void))MEMORY[0x220788584](v115);
  if (v11[2]())
  {
    MGLogForCategory(4);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v124 = self;
      v125 = 2048;
      v126 = v9;
      _os_log_impl(&dword_21CBD2000, v12, OS_LOG_TYPE_DEFAULT, "%p got an update after %p", buf, 0x16u);
    }
  }
  else
  {
    v72 = self;
    v77 = v10;
    v13 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    -[NSObject setObject:forKey:](v13, "setObject:forKey:", v9, CFSTR("ALL_GROUPS_MAP"));
    objc_msgSend(v9, "allValues");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = v13;
    -[NSObject setObject:forKey:](v13, "setObject:forKey:", v14, CFSTR("ALL_GROUPS_LIST"));
    objc_msgSend(MEMORY[0x24BE64BB8], "type");
    v76 = v11;
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v122[0] = v15;
    objc_msgSend(MEMORY[0x24BE64C08], "type");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v122[1] = v16;
    objc_msgSend(MEMORY[0x24BE64BF0], "type");
    v17 = v9;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v122[2] = v18;
    objc_msgSend(MEMORY[0x24BE64BD0], "type");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v122[3] = v19;
    objc_msgSend(MEMORY[0x24BE64BD8], "type");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v122[4] = v20;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v122, 5);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v76;
    v113[0] = v8;
    v113[1] = 3221225472;
    v113[2] = __59__MGGroupsQueryAgent__prepareWithGroups_currentIdentifier___block_invoke_21;
    v113[3] = &unk_24E0AA920;
    v22 = v21;
    v114 = v22;
    objc_msgSend(v14, "indexesOfObjectsPassingTest:", v113);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectsAtIndexes:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v111[0] = v8;
    v111[1] = 3221225472;
    v111[2] = __59__MGGroupsQueryAgent__prepareWithGroups_currentIdentifier___block_invoke_2_23;
    v111[3] = &unk_24E0AA948;
    v73 = v22;
    v112 = v73;
    objc_msgSend(v24, "sortedArrayUsingComparator:", v111);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v107[0] = v8;
    v107[1] = 3221225472;
    v107[2] = __59__MGGroupsQueryAgent__prepareWithGroups_currentIdentifier___block_invoke_3;
    v107[3] = &unk_24E0AA970;
    v27 = v76;
    v110 = v27;
    v74 = v17;
    v75 = v17;
    v108 = v75;
    v28 = v26;
    v109 = v28;
    objc_msgSend(v25, "enumerateObjectsUsingBlock:", v107);
    if (((unsigned int (*)(unsigned int (**)(void)))v76[2])(v27))
    {
      MGLogForCategory(4);
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        v124 = v72;
        v125 = 2048;
        v126 = v75;
        _os_log_impl(&dword_21CBD2000, v29, OS_LOG_TYPE_DEFAULT, "%p got a newer update after %p", buf, 0x16u);
      }
      v10 = v77;
    }
    else
    {
      v105 = 0u;
      v106 = 0u;
      v103 = 0u;
      v104 = 0u;
      v30 = v25;
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v103, v121, 16);
      v82 = v25;
      if (v31)
      {
        v32 = v31;
        v33 = *(_QWORD *)v104;
        v79 = *(_QWORD *)v104;
        v80 = v30;
        do
        {
          v34 = 0;
          v83 = v32;
          do
          {
            if (*(_QWORD *)v104 != v33)
              objc_enumerationMutation(v30);
            v35 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * v34);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v85 = v34;
                objc_msgSend(v35, "identifier");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                v99 = 0u;
                v100 = 0u;
                v101 = 0u;
                v102 = 0u;
                objc_msgSend(v35, "memberIdentifiers");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v99, v120, 16);
                if (v38)
                {
                  v39 = v38;
                  v40 = *(_QWORD *)v100;
                  do
                  {
                    v41 = 0;
                    do
                    {
                      if (*(_QWORD *)v100 != v40)
                        objc_enumerationMutation(v37);
                      objc_msgSend(v28, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v99 + 1) + 8 * v41));
                      v42 = (void *)objc_claimAutoreleasedReturnValue();
                      v97[0] = MEMORY[0x24BDAC760];
                      v97[1] = 3221225472;
                      v97[2] = __59__MGGroupsQueryAgent__prepareWithGroups_currentIdentifier___block_invoke_26;
                      v97[3] = &unk_24E0AA998;
                      v43 = v36;
                      v98 = v43;
                      objc_msgSend(v42, "objectsPassingTest:", v97);
                      v44 = (void *)objc_claimAutoreleasedReturnValue();

                      if (objc_msgSend(v44, "count"))
                      {
                        objc_msgSend(v28, "objectForKey:", v43);
                        v45 = (id)objc_claimAutoreleasedReturnValue();
                        if (!v45)
                        {
                          v45 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
                          objc_msgSend(v28, "setObject:forKey:", v45, v43);
                        }
                        objc_msgSend(v45, "unionSet:", v44);

                      }
                      ++v41;
                    }
                    while (v39 != v41);
                    v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v99, v120, 16);
                  }
                  while (v39);
                }

                v30 = v80;
                v25 = v82;
                v33 = v79;
                v32 = v83;
                v34 = v85;
              }
            }
            ++v34;
          }
          while (v34 != v32);
          v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v103, v121, 16);
        }
        while (v32);
      }

      -[NSObject setObject:forKey:](v78, "setObject:forKey:", v28, CFSTR("CONTAINMENT_MAP"));
      if (v77 && (objc_msgSend(v75, "objectForKey:"), (v46 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v47 = (void *)v46;
        v48 = v78;
        -[NSObject setObject:forKey:](v78, "setObject:forKey:", v46, CFSTR("CURRENT_SOLO_GROUP"));
        v118[0] = CFSTR("CURRENT_HOME");
        v49 = (void *)MEMORY[0x24BDD1758];
        objc_msgSend(MEMORY[0x24BE64BB8], "type");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "predicateWithFormat:", CFSTR("SELF.type == %@"), v86);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        v119[0] = v81;
        v118[1] = CFSTR("CURRENT_ROOM");
        v50 = (void *)MEMORY[0x24BDD1758];
        objc_msgSend(MEMORY[0x24BE64BF0], "type");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "predicateWithFormat:", CFSTR("SELF.type == %@"), v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v119[1] = v52;
        v118[2] = CFSTR("CURRENT_MEDIA_SYSTEM");
        v53 = (void *)MEMORY[0x24BDD1758];
        objc_msgSend(MEMORY[0x24BE64BD8], "type");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "predicateWithFormat:", CFSTR("SELF.type == %@"), v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v119[2] = v55;
        v118[3] = CFSTR("CURRENT_ZONE");
        v56 = (void *)MEMORY[0x24BDD1758];
        objc_msgSend(MEMORY[0x24BE64C08], "type");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "predicateWithFormat:", CFSTR("SELF.type == %@"), v57);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v119[3] = v58;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v119, v118, 4);
        v84 = (void *)objc_claimAutoreleasedReturnValue();

        v25 = v82;
        v59 = (void *)MEMORY[0x24BDD1758];
        objc_msgSend(v47, "identifier");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "predicateWithFormat:", CFSTR("$CONTAINMENT_MAP[%@] != nil"), v60);
        v61 = (void *)objc_claimAutoreleasedReturnValue();

        v62 = (void *)MEMORY[0x24BDD1758];
        objc_msgSend(v47, "identifier");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "predicateWithFormat:", CFSTR("SUBQUERY($CONTAINMENT_MAP[%@], $container, SELF.identifier IN $container)[SIZE] > 0"), v63);
        v64 = (void *)objc_claimAutoreleasedReturnValue();

        v65 = MEMORY[0x24BDAC760];
        v93[0] = MEMORY[0x24BDAC760];
        v93[1] = 3221225472;
        v93[2] = __59__MGGroupsQueryAgent__prepareWithGroups_currentIdentifier___block_invoke_2_48;
        v93[3] = &unk_24E0AA9C0;
        v94 = v61;
        v95 = v64;
        v96 = v78;
        v66 = v61;
        v67 = v64;
        objc_msgSend(v84, "enumerateKeysAndObjectsUsingBlock:", v93);

      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = v78;
        -[NSObject setObject:forKey:](v78, "setObject:forKey:", v68, CFSTR("CURRENT_SOLO_GROUP"));

        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKey:](v78, "setObject:forKey:", v69, CFSTR("CURRENT_HOME"));

        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKey:](v78, "setObject:forKey:", v70, CFSTR("CURRENT_ROOM"));

        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKey:](v78, "setObject:forKey:", v71, CFSTR("CURRENT_MEDIA_SYSTEM"));

        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKey:](v78, "setObject:forKey:", v47, CFSTR("CURRENT_ZONE"));
        v65 = MEMORY[0x24BDAC760];
      }

      v87[0] = v65;
      v87[1] = 3221225472;
      v87[2] = __59__MGGroupsQueryAgent__prepareWithGroups_currentIdentifier___block_invoke_3_52;
      v87[3] = &unk_24E0AAA10;
      v88 = v75;
      v89 = v72;
      v10 = v77;
      v90 = v77;
      v91 = v28;
      v92 = v48;
      -[MGGroupsQueryAgent _withLock:](v72, "_withLock:", v87);

      v29 = v88;
      v11 = v76;
    }

    v9 = v74;
    v12 = v78;
  }

}

uint64_t __59__MGGroupsQueryAgent__prepareWithGroups_currentIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __59__MGGroupsQueryAgent__prepareWithGroups_currentIdentifier___block_invoke_2;
  v7[3] = &unk_24E0AA8D0;
  v11 = &v12;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v9 = v4;
  v10 = *(id *)(a1 + 48);
  objc_msgSend(v2, "_withLock:", v7);
  v5 = *((unsigned __int8 *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return v5;
}

void __59__MGGroupsQueryAgent__prepareWithGroups_currentIdentifier___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "groups");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToDictionary:"))
  {
    v3 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "currentIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3 == v4)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    }
    else
    {
      v5 = *(void **)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 40), "currentIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v5, "isEqual:", v6) ^ 1;

    }
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }

}

uint64_t __59__MGGroupsQueryAgent__prepareWithGroups_currentIdentifier___block_invoke_21(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

uint64_t __59__MGGroupsQueryAgent__prepareWithGroups_currentIdentifier___block_invoke_2_23(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(a2, "type");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "indexOfObject:", v7);

  v9 = *(void **)(a1 + 32);
  objc_msgSend(v6, "type");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v9, "indexOfObject:", v10);
  v12 = -1;
  if (v8 >= v11)
    v12 = 1;
  if (v8 == v11)
    return 0;
  else
    return v12;
}

void __59__MGGroupsQueryAgent__prepareWithGroups_currentIdentifier___block_invoke_3(void **a1, void *a2, uint64_t a3, _BYTE *a4)
{
  char v6;
  id v7;

  v7 = a2;
  v6 = (*((uint64_t (**)(void))a1[6] + 2))();
  *a4 = v6;
  if ((v6 & 1) == 0)
    _AddContainmentForGroup(v7, a1[4], MEMORY[0x24BDBD1A8], a1[5], a1[6]);

}

uint64_t __59__MGGroupsQueryAgent__prepareWithGroups_currentIdentifier___block_invoke_26(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsObject:", *(_QWORD *)(a1 + 32)) ^ 1;
}

void __59__MGGroupsQueryAgent__prepareWithGroups_currentIdentifier___block_invoke_2_48(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];

  v17[3] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x24BDD14C0];
  v8 = *(_QWORD *)(a1 + 40);
  v17[0] = *(_QWORD *)(a1 + 32);
  v17[1] = v6;
  v17[2] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "andPredicateWithSubpredicates:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "predicateWithSubstitutionVariables:", *(_QWORD *)(a1 + 48));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 48), "objectForKey:", CFSTR("ALL_GROUPS_LIST"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "filteredArrayUsingPredicate:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = *(void **)(a1 + 48);
  objc_msgSend(v13, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(v14, "setObject:forKey:", v15, v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v16, v5);

  }
}

void __59__MGGroupsQueryAgent__prepareWithGroups_currentIdentifier___block_invoke_3_52(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  int8x16_t v20;
  _QWORD v21[4];
  int8x16_t v22;
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "groups");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToDictionary:", v3) & 1) != 0)
  {
    v4 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "currentIdentifier");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v4 == (void *)v5)
    {

LABEL_9:
      objc_msgSend(*(id *)(a1 + 40), "setContainers:", *(_QWORD *)(a1 + 56));
      objc_msgSend(*(id *)(a1 + 40), "setVariables:", *(_QWORD *)(a1 + 64));
      objc_msgSend(*(id *)(a1 + 40), "queue");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "queries");
      v9 = objc_claimAutoreleasedReturnValue();
      MGLogForCategory(4);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 134218240;
        v27 = v14;
        v28 = 2048;
        v29 = -[NSObject count](v9, "count");
        _os_log_impl(&dword_21CBD2000, v13, OS_LOG_TYPE_DEFAULT, "%p spawning %lu queries", buf, 0x16u);
      }

      objc_msgSend(*(id *)(a1 + 40), "operations");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v15, "mutableCopy");

      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __59__MGGroupsQueryAgent__prepareWithGroups_currentIdentifier___block_invoke_53;
      v21[3] = &unk_24E0AA9E8;
      v20 = *(int8x16_t *)(a1 + 32);
      v17 = (id)v20.i64[0];
      v22 = vextq_s8(v20, v20, 8uLL);
      v23 = *(id *)(a1 + 64);
      v24 = v16;
      v25 = v12;
      v18 = v12;
      v19 = v16;
      -[NSObject enumerateKeysAndObjectsUsingBlock:](v9, "enumerateKeysAndObjectsUsingBlock:", v21);
      objc_msgSend(*(id *)(a1 + 40), "setOperations:", v19);

      goto LABEL_12;
    }
    v6 = (void *)v5;
    v7 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "currentIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v7) = objc_msgSend(v7, "isEqual:", v8);

    if ((_DWORD)v7)
      goto LABEL_9;
  }
  else
  {

  }
  MGLogForCategory(4);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_QWORD *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 134218240;
    v27 = v10;
    v28 = 2048;
    v29 = v11;
    _os_log_impl(&dword_21CBD2000, v9, OS_LOG_TYPE_DEFAULT, "%p got a late update after %p", buf, 0x16u);
  }
LABEL_12:

}

void __59__MGGroupsQueryAgent__prepareWithGroups_currentIdentifier___block_invoke_53(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  MGGroupsQueryOperation *v7;

  v5 = a3;
  v6 = a2;
  v7 = -[MGGroupsQueryOperation initWithAgent:query:groups:substitutionVariables:]([MGGroupsQueryOperation alloc], "initWithAgent:query:groups:substitutionVariables:", *(_QWORD *)(a1 + 32), v5, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  objc_msgSend(*(id *)(a1 + 56), "setObject:forKey:", v7, v6);
  objc_msgSend(*(id *)(a1 + 64), "addOperation:", v7);

}

- (void)_queryOperation:(id)a3 didFindGroups:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id v18;
  MGGroupsQueryAgent *v19;
  id v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;

  v6 = a3;
  v7 = a4;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  objc_msgSend(v6, "query");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__4;
  v27 = __Block_byref_object_dispose__4;
  v28 = 0;
  v13 = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = __52__MGGroupsQueryAgent__queryOperation_didFindGroups___block_invoke;
  v16 = &unk_24E0AAA38;
  v9 = v8;
  v17 = v9;
  v21 = &v29;
  v10 = v6;
  v18 = v10;
  v19 = self;
  v11 = v7;
  v20 = v11;
  v22 = &v23;
  -[MGGroupsQueryAgent _withLock:](self, "_withLock:", &v13);
  if (!*((_BYTE *)v30 + 24))
  {
    -[MGGroupsQueryAgent delegate](self, "delegate", v13, v14, v15, v16, v17, v18, v19);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "groupsQueryAgent:didFindResults:forQuery:", self, v24[5], v9);

  }
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);
}

void __52__MGGroupsQueryAgent__queryOperation_didFindGroups___block_invoke(uint64_t a1)
{
  int v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  MGGroupsQueryAgentResult *v28;
  id WeakRetained;
  MGGroupsQueryAgentResult *v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE buf[12];
  __int16 v40;
  void *v41;
  __int16 v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(*(id *)(a1 + 40), "isCancelled");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v2;
  if (v2)
  {
    MGLogForCategory(4);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 48);
      v5 = objc_msgSend(*(id *)(a1 + 56), "count");
      *(_DWORD *)buf = 134218498;
      *(_QWORD *)&buf[4] = v4;
      v40 = 2112;
      v41 = v33;
      v42 = 2048;
      v43 = v5;
      _os_log_impl(&dword_21CBD2000, v3, OS_LOG_TYPE_DEFAULT, "%p canceled query %@ with %lu found items", buf, 0x20u);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "operations");
    v32 = objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 40);
    -[NSObject objectForKey:](v32, "objectForKey:", v33);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v6 != v7;

    if (v6 == v7)
    {
      v11 = -[NSObject mutableCopy](v32, "mutableCopy");
      -[NSObject removeObjectForKey:](v11, "removeObjectForKey:", v33);
      v31 = v11;
      objc_msgSend(*(id *)(a1 + 48), "setOperations:", v11);
      MGLogForCategory(4);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = *(_QWORD *)(a1 + 48);
        v14 = objc_msgSend(*(id *)(a1 + 56), "count");
        *(_DWORD *)buf = 134218498;
        *(_QWORD *)&buf[4] = v13;
        v40 = 2112;
        v41 = v33;
        v42 = 2048;
        v43 = v14;
        _os_log_impl(&dword_21CBD2000, v12, OS_LOG_TYPE_DEFAULT, "%p completed query %@ with %lu found items", buf, 0x20u);
      }

      v15 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v17 = *(void **)(v16 + 40);
      *(_QWORD *)(v16 + 40) = v15;

      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v18 = *(id *)(a1 + 56);
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      if (v19)
      {
        v20 = *(_QWORD *)v35;
        do
        {
          v21 = 0;
          do
          {
            if (*(_QWORD *)v35 != v20)
              objc_enumerationMutation(v18);
            v22 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v21);
            *(_QWORD *)buf = 0;
            objc_msgSend(v22, "identifier");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 48), "mediatorsByGroup");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "objectForKey:", v23);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            if (v25)
            {
              objc_msgSend(*(id *)(a1 + 48), "mediators");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "objectForKey:", v25);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_storeWeak((id *)buf, v27);

            }
            v28 = [MGGroupsQueryAgentResult alloc];
            WeakRetained = objc_loadWeakRetained((id *)buf);
            v30 = -[MGGroupsQueryAgentResult initWithGroup:mediator:](v28, "initWithGroup:mediator:", v22, WeakRetained);

            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "addObject:", v30);
            objc_destroyWeak((id *)buf);

            ++v21;
          }
          while (v19 != v21);
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
        }
        while (v19);
      }

    }
    else
    {
      MGLogForCategory(4);
      v8 = objc_claimAutoreleasedReturnValue();
      v31 = v8;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = *(_QWORD *)(a1 + 48);
        v10 = objc_msgSend(*(id *)(a1 + 56), "count");
        *(_DWORD *)buf = 134218498;
        *(_QWORD *)&buf[4] = v9;
        v40 = 2112;
        v41 = v33;
        v42 = 2048;
        v43 = v10;
        _os_log_impl(&dword_21CBD2000, v8, OS_LOG_TYPE_DEFAULT, "%p subsumed query %@ with %lu found items", buf, 0x20u);
      }
    }

    v3 = v32;
  }

}

- (void)addOutstandingQuery:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __42__MGGroupsQueryAgent_addOutstandingQuery___block_invoke;
  v8[3] = &unk_24E0AA778;
  v8[4] = self;
  v9 = v5;
  v10 = v4;
  v6 = v4;
  v7 = v5;
  -[MGGroupsQueryAgent _withLock:](self, "_withLock:", v8);

}

void __42__MGGroupsQueryAgent_addOutstandingQuery___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  MGGroupsQueryOperation *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  MGGroupsQueryOperation *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "queries");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)objc_msgSend(v2, "mutableCopy");
    objc_msgSend(v4, "setObject:forKey:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "setQueries:", v4);
    objc_msgSend(*(id *)(a1 + 32), "operations");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v7 = [MGGroupsQueryOperation alloc];
      v8 = *(void **)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 48);
      objc_msgSend(v8, "groups");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "variables");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[MGGroupsQueryOperation initWithAgent:query:groups:substitutionVariables:](v7, "initWithAgent:query:groups:substitutionVariables:", v8, v9, v10, v11);

      objc_msgSend(*(id *)(a1 + 32), "operations");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v13, "mutableCopy");

      objc_msgSend(v14, "setObject:forKey:", v12, *(_QWORD *)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 32), "setOperations:", v14);
      objc_msgSend(*(id *)(a1 + 32), "queue");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addOperation:", v12);

    }
    MGLogForCategory(4);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = *(_QWORD *)(a1 + 32);
      v18 = *(_QWORD *)(a1 + 40);
      v19 = 134218242;
      v20 = v17;
      v21 = 2112;
      v22 = v18;
      _os_log_impl(&dword_21CBD2000, v16, OS_LOG_TYPE_DEFAULT, "%p added query %@", (uint8_t *)&v19, 0x16u);
    }

  }
}

- (void)removeOutstandingQuery:(id)a3
{
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __45__MGGroupsQueryAgent_removeOutstandingQuery___block_invoke;
  v6[3] = &unk_24E0AA5E8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[MGGroupsQueryAgent _withLock:](self, "_withLock:", v6);

}

void __45__MGGroupsQueryAgent_removeOutstandingQuery___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "queries");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)objc_msgSend(v2, "mutableCopy");
    objc_msgSend(v4, "removeObjectForKey:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "setQueries:", v4);
    MGLogForCategory(4);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(_QWORD *)(a1 + 40);
      v15 = 134218242;
      v16 = v6;
      v17 = 2112;
      v18 = v7;
      _os_log_impl(&dword_21CBD2000, v5, OS_LOG_TYPE_DEFAULT, "%p removed query %@", (uint8_t *)&v15, 0x16u);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "operations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", *(_QWORD *)(a1 + 40));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "cancel");
    v11 = (void *)objc_msgSend(v8, "mutableCopy");
    objc_msgSend(v11, "removeObjectForKey:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "setOperations:", v11);
    MGLogForCategory(4);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(_QWORD *)(a1 + 32);
      v14 = *(_QWORD *)(a1 + 40);
      v15 = 134218242;
      v16 = v13;
      v17 = 2112;
      v18 = v14;
      _os_log_impl(&dword_21CBD2000, v12, OS_LOG_TYPE_DEFAULT, "%p canceled removed query %@", (uint8_t *)&v15, 0x16u);
    }

  }
}

- (id)outstandingQueryForIdentifier:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__4;
  v15 = __Block_byref_object_dispose__4;
  v16 = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __52__MGGroupsQueryAgent_outstandingQueryForIdentifier___block_invoke;
  v8[3] = &unk_24E0AA660;
  v10 = &v11;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  -[MGGroupsQueryAgent _withLock:](self, "_withLock:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __52__MGGroupsQueryAgent_outstandingQueryForIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "queries");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)groupsMediator:(id)a3 didUpdateGroups:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __53__MGGroupsQueryAgent_groupsMediator_didUpdateGroups___block_invoke;
  v10[3] = &unk_24E0AA778;
  v10[4] = self;
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  -[MGGroupsQueryAgent _withLock:](self, "_withLock:", v10);

}

void __53__MGGroupsQueryAgent_groupsMediator_didUpdateGroups___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  MGLogForCategory(4);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    v10 = 134218496;
    v11 = v3;
    v12 = 2048;
    v13 = v4;
    v14 = 2048;
    v15 = v5;
    _os_log_impl(&dword_21CBD2000, v2, OS_LOG_TYPE_DEFAULT, "%p received update %p from %p", (uint8_t *)&v10, 0x20u);
  }

  objc_msgSend(*(id *)(a1 + 48), "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "mediators");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", *(_QWORD *)(a1 + 48), v6);

  objc_msgSend(*(id *)(a1 + 32), "groupsByMediator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v9, "setObject:forKey:", *(_QWORD *)(a1 + 40), v6);
  objc_msgSend(*(id *)(a1 + 32), "setGroupsByMediator:", v9);

}

- (void)groupsMediatorRemoved:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __44__MGGroupsQueryAgent_groupsMediatorRemoved___block_invoke;
  v6[3] = &unk_24E0AA5E8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[MGGroupsQueryAgent _withLock:](self, "_withLock:", v6);

}

void __44__MGGroupsQueryAgent_groupsMediatorRemoved___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  MGLogForCategory(4);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v9 = 134218240;
    v10 = v3;
    v11 = 2048;
    v12 = v4;
    _os_log_impl(&dword_21CBD2000, v2, OS_LOG_TYPE_DEFAULT, "%p dropping %p", (uint8_t *)&v9, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "mediators");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectForKey:", v5);

  objc_msgSend(*(id *)(a1 + 32), "groupsByMediator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v8, "removeObjectForKey:", v5);
  objc_msgSend(*(id *)(a1 + 32), "setGroupsByMediator:", v8);

}

- (MGGroupsQueryAgentDelegate)delegate
{
  return (MGGroupsQueryAgentDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSOperationQueue)queue
{
  return self->_queue;
}

- (NSDictionary)operations
{
  return self->_operations;
}

- (void)setOperations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSMapTable)mediators
{
  return self->_mediators;
}

- (NSDictionary)mediatorsByGroup
{
  return self->_mediatorsByGroup;
}

- (void)setMediatorsByGroup:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSDictionary)groupsByMediator
{
  return self->_groupsByMediator;
}

- (NSDictionary)groups
{
  return self->_groups;
}

- (MGGroupIdentifier)currentIdentifier
{
  return self->_currentIdentifier;
}

- (NSDictionary)containers
{
  return self->_containers;
}

- (void)setContainers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSDictionary)variables
{
  return self->_variables;
}

- (void)setVariables:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSDictionary)queries
{
  return self->_queries;
}

- (void)setQueries:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queries, 0);
  objc_storeStrong((id *)&self->_variables, 0);
  objc_storeStrong((id *)&self->_containers, 0);
  objc_storeStrong((id *)&self->_currentIdentifier, 0);
  objc_storeStrong((id *)&self->_groups, 0);
  objc_storeStrong((id *)&self->_groupsByMediator, 0);
  objc_storeStrong((id *)&self->_mediatorsByGroup, 0);
  objc_storeStrong((id *)&self->_mediators, 0);
  objc_storeStrong((id *)&self->_operations, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

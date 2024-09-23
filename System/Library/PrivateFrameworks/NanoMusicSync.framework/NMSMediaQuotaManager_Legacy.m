@implementation NMSMediaQuotaManager_Legacy

- (NMSMediaQuotaManager_Legacy)initWithGroupIterators:(id)a3 quota:(unint64_t)a4
{
  id v6;
  NMSMediaQuotaManager_Legacy *v7;
  uint64_t v8;
  NSDictionary *groupIterators;
  NMSMediaDownloadInfo *v10;
  void *v11;
  uint64_t v12;
  NMSMediaDownloadInfo *downloadInfoWithinQuota;
  objc_super v15;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NMSMediaQuotaManager_Legacy;
  v7 = -[NMSMediaQuotaManager_Legacy init](&v15, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    groupIterators = v7->_groupIterators;
    v7->_groupIterators = (NSDictionary *)v8;

    v7->_quota = a4;
    v10 = [NMSMediaDownloadInfo alloc];
    v11 = (void *)objc_opt_new();
    v12 = -[NMSMediaDownloadInfo initWithItems:](v10, "initWithItems:", v11);
    downloadInfoWithinQuota = v7->_downloadInfoWithinQuota;
    v7->_downloadInfoWithinQuota = (NMSMediaDownloadInfo *)v12;

    v7->_quotaUsage = 0;
    v7->_hasEvaluated = 0;
  }

  return v7;
}

- (id)groupIteratorForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[NSDictionary objectForKey:](self->_groupIterators, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)downloadInfoWithinQuota
{
  -[NMSMediaQuotaManager_Legacy _evaluateAddedItemsIfNecessary](self, "_evaluateAddedItemsIfNecessary");
  return self->_downloadInfoWithinQuota;
}

- (id)downloadInfoWithinQuotaForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NMSMediaQuotaManager_Legacy _evaluateAddedItemsIfNecessary](self, "_evaluateAddedItemsIfNecessary");
  -[NMSMediaQuotaManager_Legacy _containerListForBundleIdentifier:](self, "_containerListForBundleIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "downloadInfoWithinQuota");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)sizeOfItemsWithinQuota
{
  -[NMSMediaQuotaManager_Legacy _evaluateAddedItemsIfNecessary](self, "_evaluateAddedItemsIfNecessary");
  return self->_quotaUsage;
}

- (unint64_t)sizeOfItemsWithinQuotaForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;

  v4 = a3;
  -[NMSMediaQuotaManager_Legacy _evaluateAddedItemsIfNecessary](self, "_evaluateAddedItemsIfNecessary");
  -[NMSMediaQuotaManager_Legacy _containerListForBundleIdentifier:](self, "_containerListForBundleIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "sizeForItemListWithinQuota");
  return v6;
}

- (unint64_t)sizeOfNominatedItemsForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;

  v4 = a3;
  -[NMSMediaQuotaManager_Legacy _evaluateAddedItemsIfNecessary](self, "_evaluateAddedItemsIfNecessary");
  -[NMSMediaQuotaManager_Legacy _containerListForBundleIdentifier:](self, "_containerListForBundleIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "nominatedItemSize");
  return v6;
}

- (BOOL)isItemGroupWithinQuota:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  BOOL v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  char v32;
  void *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v34 = a3;
  -[NMSMediaQuotaManager_Legacy _evaluateAddedItemsIfNecessary](self, "_evaluateAddedItemsIfNecessary");
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  -[NSDictionary allValues](self->_groupIterators, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v29)
  {
    v5 = *(_QWORD *)v40;
    v31 = v4;
    v28 = *(_QWORD *)v40;
    while (1)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v40 != v5)
          objc_enumerationMutation(v4);
        v30 = v6;
        v7 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v6);
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        objc_msgSend(v7, "itemGroups");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
        if (!v9)
          goto LABEL_24;
        v10 = v9;
        v11 = *(_QWORD *)v36;
        v33 = v8;
        while (2)
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v36 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
            v14 = objc_msgSend(v7, "iteratingOrder");
            if (v14 == 1)
            {
              objc_msgSend(v13, "quotaData");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v15, "numItemsAdded"))
                goto LABEL_21;
              objc_msgSend(v13, "quotaData");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v21, "hasItemsAboveQuota") & 1) == 0)
              {

LABEL_21:
                continue;
              }
              objc_msgSend(v13, "quotaData");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "quotaRefObj");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "quotaData");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "quotaRefObj");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = objc_msgSend(v23, "isEqual:", v25);

              v8 = v33;
              if ((v32 & 1) != 0)
              {
LABEL_27:

                v26 = 0;
                v4 = v31;
                goto LABEL_29;
              }
            }
            else
            {
              if (v14)
                continue;
              objc_msgSend(v13, "quotaData");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              if (!objc_msgSend(v15, "hasItemsAboveQuota"))
                goto LABEL_21;
              objc_msgSend(v13, "quotaData");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "quotaRefObj");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "quotaData");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "quotaRefObj");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v17, "isEqual:", v19);

              v8 = v33;
              if ((v20 & 1) != 0)
                goto LABEL_27;
            }
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
          if (v10)
            continue;
          break;
        }
LABEL_24:

        v6 = v30 + 1;
        v4 = v31;
        v5 = v28;
      }
      while (v30 + 1 != v29);
      v26 = 1;
      v29 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      if (!v29)
        goto LABEL_29;
    }
  }
  v26 = 1;
LABEL_29:

  return v26;
}

- (id)_containerListForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[NMSMediaQuotaManager_Legacy _evaluateAddedItemsIfNecessary](self, "_evaluateAddedItemsIfNecessary");
  -[NSDictionary objectForKeyedSubscript:](self->_groupIterators, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_evaluateAddedItemsIfNecessary
{
  NSObject *v2;
  uint64_t (*v3)(uint64_t, uint64_t);
  NSObject *v4;
  unint64_t quota;
  NSDictionary *groupIterators;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  unint64_t v11;
  NSUInteger v12;
  void *v13;
  NMLogActionsCoalescer *v14;
  void *v15;
  NMLogActionsCoalescer *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  unint64_t v31;
  void *v32;
  id v33;
  NMSMediaDownloadInfo *v34;
  NMSMediaDownloadInfo *downloadInfoWithinQuota;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t k;
  NSObject *v40;
  unint64_t v41;
  unint64_t v42;
  NSObject *v43;
  unint64_t quotaUsage;
  NSObject *v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void *context;
  void *v48;
  void *v49;
  NSDictionary *obj;
  id obja;
  id v52;
  void *v53;
  id v54;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _QWORD v60[4];
  id v61;
  id v62;
  id v63;
  uint64_t v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _QWORD v69[6];
  _QWORD v70[4];
  _QWORD v71[4];
  id v72;
  id v73;
  id v74;
  NMSMediaQuotaManager_Legacy *v75;
  id v76;
  _BYTE *v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _BYTE v82[128];
  uint8_t v83[128];
  _BYTE buf[24];
  uint64_t (*v85)(uint64_t, uint64_t);
  __int128 v86;
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x24BDAC8D0];
  if (!self->_hasEvaluated)
  {
    context = (void *)MEMORY[0x219A039AC]();
    NMLogForCategory(5);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date", context);
      v3 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = CFSTR("[MediaQuota]");
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[NMSMediaQuotaManager_Legacy _evaluateAddedItemsIfNecessary]";
      *(_WORD *)&buf[22] = 2112;
      v85 = v3;
      _os_log_impl(&dword_216E27000, v2, OS_LOG_TYPE_DEFAULT, "%@ %s ****** Started QuotaEvaluation %@!", buf, 0x20u);

    }
    NMLogForCategory(5);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      groupIterators = self->_groupIterators;
      quota = self->_quota;
      *(_DWORD *)buf = 138413058;
      *(_QWORD *)&buf[4] = CFSTR("[MediaQuota]");
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[NMSMediaQuotaManager_Legacy _evaluateAddedItemsIfNecessary]";
      *(_WORD *)&buf[22] = 2048;
      v85 = (uint64_t (*)(uint64_t, uint64_t))quota;
      LOWORD(v86) = 2114;
      *(_QWORD *)((char *)&v86 + 2) = groupIterators;
      _os_log_impl(&dword_216E27000, v4, OS_LOG_TYPE_DEFAULT, "%@ %s Evaluating items with quota %llu for container lists %{public}@", buf, 0x2Au);
    }

    v52 = objc_alloc_init(MEMORY[0x24BDBCEE0]);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", -[NSDictionary count](self->_groupIterators, "count"));
    v54 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", -[NSDictionary count](self->_groupIterators, "count"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = 0u;
    v81 = 0u;
    v78 = 0u;
    v79 = 0u;
    obj = self->_groupIterators;
    v7 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v78, v87, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v79;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v79 != v8)
            objc_enumerationMutation(obj);
          v10 = *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * i);
          v11 = self->_quota;
          v12 = -[NSDictionary count](self->_groupIterators, "count", context);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v11 / v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "setObject:forKey:", v13, v10);

          v14 = [NMLogActionsCoalescer alloc];
          NMLogForCategory(6);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = -[NMLogActionsCoalescer initWithIdentifier:logCategory:](v14, "initWithIdentifier:logCategory:", v10, v15);

          objc_msgSend(CFSTR("[MediaQuota]"), "stringByAppendingString:", CFSTR(" QuotaEvaluation process"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[NMLogActionsCoalescer setPrefix:](v16, "setPrefix:", v17);

          objc_msgSend(v53, "setObject:forKeyedSubscript:", v16, v10);
        }
        v7 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v78, v87, 16);
      }
      while (v7);
    }

    NMLogForCategory(5);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = CFSTR("[MediaQuota]");
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[NMSMediaQuotaManager_Legacy _evaluateAddedItemsIfNecessary]";
      *(_WORD *)&buf[22] = 2114;
      v85 = (uint64_t (*)(uint64_t, uint64_t))v54;
      _os_log_impl(&dword_216E27000, v18, OS_LOG_TYPE_DEFAULT, "%@ %s Calculated initial per bundleIdentifier quotas %{public}@", buf, 0x20u);
    }

    v19 = (void *)-[NSDictionary mutableCopy](self->_groupIterators, "mutableCopy");
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", -[NSDictionary count](self->_groupIterators, "count"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    obja = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "count"))
    {
      v20 = MEMORY[0x24BDAC760];
      do
      {
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v85 = __Block_byref_object_copy__1;
        *(_QWORD *)&v86 = __Block_byref_object_dispose__1;
        *((_QWORD *)&v86 + 1) = 0;
        do
        {
          v71[0] = v20;
          v71[1] = 3221225472;
          v71[2] = __61__NMSMediaQuotaManager_Legacy__evaluateAddedItemsIfNecessary__block_invoke;
          v71[3] = &unk_24D646FC0;
          v21 = v54;
          v72 = v21;
          v22 = v53;
          v73 = v22;
          v77 = buf;
          v74 = v52;
          v75 = self;
          v76 = obja;
          objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", v71);
          if (!*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
          {
            v70[0] = 0;
            v70[1] = v70;
            v70[2] = 0x2020000000;
            v70[3] = 0;
            v69[0] = v20;
            v69[1] = 3221225472;
            v69[2] = __61__NMSMediaQuotaManager_Legacy__evaluateAddedItemsIfNecessary__block_invoke_2;
            v69[3] = &unk_24D646FE8;
            v69[4] = v70;
            v69[5] = buf;
            objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", v69);
            _Block_object_dispose(v70, 8);
          }

        }
        while (!*(_QWORD *)(*(_QWORD *)&buf[8] + 40));
        objc_msgSend(v19, "objectForKeyedSubscript:");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "setObject:forKeyedSubscript:", v49, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
        objc_msgSend(v19, "removeObjectForKey:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
        objc_msgSend(v22, "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Removing item list"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        +[NMGenericMessageLogAction logActionWithMessage:](NMGenericMessageLogAction, "logActionWithMessage:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "addLogAction:", v25);

        v67 = 0u;
        v68 = 0u;
        v65 = 0u;
        v66 = 0u;
        objc_msgSend(v48, "allValues");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 0;
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v65, v83, 16);
        if (v28)
        {
          v29 = *(_QWORD *)v66;
          do
          {
            for (j = 0; j != v28; ++j)
            {
              if (*(_QWORD *)v66 != v29)
                objc_enumerationMutation(v26);
              v27 += objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * j), "sizeForItemListWithinQuota", context);
            }
            v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v65, v83, 16);
          }
          while (v28);
        }

        v31 = self->_quota;
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v19, "count"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        v60[0] = v20;
        v60[1] = 3221225472;
        v60[2] = __61__NMSMediaQuotaManager_Legacy__evaluateAddedItemsIfNecessary__block_invoke_3;
        v60[3] = &unk_24D647010;
        v64 = v31 - v27;
        v33 = v19;
        v61 = v33;
        v54 = v32;
        v62 = v54;
        v63 = v22;
        objc_msgSend(v33, "enumerateKeysAndObjectsUsingBlock:", v60);

        _Block_object_dispose(buf, 8);
      }
      while (objc_msgSend(v33, "count"));
    }
    v34 = -[NMSMediaDownloadInfo initWithItems:]([NMSMediaDownloadInfo alloc], "initWithItems:", v52);
    downloadInfoWithinQuota = self->_downloadInfoWithinQuota;
    self->_downloadInfoWithinQuota = v34;

    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    objc_msgSend(v53, "allValues");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v56, v82, 16);
    if (v37)
    {
      v38 = *(_QWORD *)v57;
      do
      {
        for (k = 0; k != v37; ++k)
        {
          if (*(_QWORD *)v57 != v38)
            objc_enumerationMutation(v36);
          objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * k), "flush", context);
        }
        v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v56, v82, 16);
      }
      while (v37);
    }

    NMLogForCategory(5);
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      v41 = self->_quota;
      v42 = -[NMSMediaDownloadInfo totalItemCount](self->_downloadInfoWithinQuota, "totalItemCount");
      *(_DWORD *)buf = 138413058;
      *(_QWORD *)&buf[4] = CFSTR("[MediaQuota]");
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[NMSMediaQuotaManager_Legacy _evaluateAddedItemsIfNecessary]";
      *(_WORD *)&buf[22] = 2048;
      v85 = (uint64_t (*)(uint64_t, uint64_t))v41;
      LOWORD(v86) = 2048;
      *(_QWORD *)((char *)&v86 + 2) = v42;
      _os_log_impl(&dword_216E27000, v40, OS_LOG_TYPE_DEFAULT, "%@ %s QuotaEvaluation result: downloadInfoWithinQuota (quota: %llu) (count: %lu)", buf, 0x2Au);
    }

    NMLogForCategory(5);
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      quotaUsage = self->_quotaUsage;
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = CFSTR("[MediaQuota]");
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[NMSMediaQuotaManager_Legacy _evaluateAddedItemsIfNecessary]";
      *(_WORD *)&buf[22] = 2048;
      v85 = (uint64_t (*)(uint64_t, uint64_t))quotaUsage;
      _os_log_impl(&dword_216E27000, v43, OS_LOG_TYPE_DEFAULT, "%@ %s QuotaEvaluation result: downloadInfoWithinQuota using %llu bytes", buf, 0x20u);
    }

    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](self->_groupIterators, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_0);
    NMLogForCategory(5);
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v46 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = CFSTR("[MediaQuota]");
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[NMSMediaQuotaManager_Legacy _evaluateAddedItemsIfNecessary]";
      *(_WORD *)&buf[22] = 2112;
      v85 = v46;
      _os_log_impl(&dword_216E27000, v45, OS_LOG_TYPE_DEFAULT, "%@ %s ****** Finished QuotaEvaluation! %@", buf, 0x20u);

    }
    self->_hasEvaluated = 1;

    objc_autoreleasePoolPop(context);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadInfoWithinQuota, 0);
  objc_storeStrong((id *)&self->_groupIterators, 0);
}

@end

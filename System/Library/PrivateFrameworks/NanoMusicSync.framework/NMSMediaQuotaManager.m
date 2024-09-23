@implementation NMSMediaQuotaManager

- (NMSMediaQuotaManager)initWithItemEnumerators:(id)a3 estimatedItemSizes:(id)a4 quota:(unint64_t)a5
{
  id v8;
  id v9;
  NMSMediaQuotaManager *v10;
  uint64_t v11;
  NSMutableDictionary *itemEnumerators;
  NMSMutableMediaDownloadInfo *v13;
  NMSMutableMediaDownloadInfo *downloadInfoWithinQuota;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NMSMutableMediaDownloadInfo *v22;
  uint64_t v23;
  NSDictionary *downloadInfoWithinQuotaForIdentifiers;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v31.receiver = self;
  v31.super_class = (Class)NMSMediaQuotaManager;
  v10 = -[NMSMediaQuotaManager init](&v31, sel_init);
  if (v10)
  {
    v26 = v9;
    v11 = objc_msgSend(v8, "mutableCopy");
    itemEnumerators = v10->_itemEnumerators;
    v10->_itemEnumerators = (NSMutableDictionary *)v11;

    objc_storeStrong((id *)&v10->_estimatedItemSizes, a4);
    v10->_quota = a5;
    v13 = objc_alloc_init(NMSMutableMediaDownloadInfo);
    downloadInfoWithinQuota = v10->_downloadInfoWithinQuota;
    v10->_downloadInfoWithinQuota = v13;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    objc_msgSend(v8, "keyEnumerator");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v28;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v28 != v19)
            objc_enumerationMutation(v16);
          v21 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v20);
          v22 = objc_alloc_init(NMSMutableMediaDownloadInfo);
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v22, v21);

          ++v20;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v18);
    }

    v23 = objc_msgSend(v15, "copy");
    downloadInfoWithinQuotaForIdentifiers = v10->_downloadInfoWithinQuotaForIdentifiers;
    v10->_downloadInfoWithinQuotaForIdentifiers = (NSDictionary *)v23;

    *(_WORD *)&v10->_hasEvaluated = 0;
    v9 = v26;
  }

  return v10;
}

- (id)downloadInfoWithinQuota
{
  -[NMSMediaQuotaManager _evaluateAddedItemsIfNecessary](self, "_evaluateAddedItemsIfNecessary");
  return self->_downloadInfoWithinQuota;
}

- (id)downloadInfoWithinQuotaForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[NMSMediaQuotaManager _evaluateAddedItemsIfNecessary](self, "_evaluateAddedItemsIfNecessary");
  -[NSDictionary objectForKeyedSubscript:](self->_downloadInfoWithinQuotaForIdentifiers, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)_legacy_musicDidSkipItem
{
  -[NMSMediaQuotaManager _evaluateAddedItemsIfNecessary](self, "_evaluateAddedItemsIfNecessary");
  return self->_legacy_musicDidSkipItem;
}

- (id)_newMutableItemEnumeratorDict
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NMSMutableItemEnumerator *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", -[NSMutableDictionary count](self->_itemEnumerators, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NSMutableDictionary keyEnumerator](self->_itemEnumerators, "keyEnumerator", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8);
        v10 = objc_alloc_init(NMSMutableItemEnumerator);
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return v3;
}

- (void)_evaluateAddedItemsIfNecessary
{
  NSObject *v3;
  uint64_t (*v4)(uint64_t, uint64_t);
  NSObject *v5;
  unint64_t quota;
  NSMutableDictionary *itemEnumerators;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  NMLogActionsCoalescer *v15;
  void *v16;
  NMLogActionsCoalescer *v17;
  void *v18;
  NSObject *v19;
  id v20;
  id v21;
  NSMutableDictionary *v22;
  id v23;
  NSMutableDictionary *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t k;
  void *v39;
  uint64_t v40;
  unint64_t v41;
  void *v42;
  NSMutableDictionary *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t m;
  NSObject *v48;
  unint64_t v49;
  unint64_t v50;
  NSObject *v51;
  unint64_t v52;
  NSObject *v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void *context;
  id v56;
  id v57;
  void *v58;
  id v59;
  id v60;
  id obj;
  id obja;
  _QWORD v63[5];
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _QWORD v68[5];
  id v69;
  id v70;
  uint64_t v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _QWORD v80[7];
  _QWORD v81[4];
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t (*v85)(uint64_t, uint64_t);
  void (*v86)(uint64_t);
  id v87;
  _QWORD v88[4];
  id v89;
  id v90;
  NMSMediaQuotaManager *v91;
  id v92;
  id v93;
  _BYTE *v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  _BYTE v99[128];
  _BYTE v100[128];
  uint8_t v101[128];
  _BYTE buf[24];
  uint64_t (*v103)(uint64_t, uint64_t);
  __int128 v104;
  _BYTE v105[128];
  uint64_t v106;

  v106 = *MEMORY[0x24BDAC8D0];
  if (!self->_hasEvaluated)
  {
    NMLogForCategory(5);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v4 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = CFSTR("[MediaQuota]");
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[NMSMediaQuotaManager _evaluateAddedItemsIfNecessary]";
      *(_WORD *)&buf[22] = 2112;
      v103 = v4;
      _os_log_impl(&dword_216E27000, v3, OS_LOG_TYPE_DEFAULT, "%@ %s ****** Started QuotaEvaluation %@!", buf, 0x20u);

    }
    NMLogForCategory(5);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      quota = self->_quota;
      itemEnumerators = self->_itemEnumerators;
      *(_DWORD *)buf = 138413058;
      *(_QWORD *)&buf[4] = CFSTR("[MediaQuota]");
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[NMSMediaQuotaManager _evaluateAddedItemsIfNecessary]";
      *(_WORD *)&buf[22] = 2048;
      v103 = (uint64_t (*)(uint64_t, uint64_t))quota;
      LOWORD(v104) = 2114;
      *(_QWORD *)((char *)&v104 + 2) = itemEnumerators;
      _os_log_impl(&dword_216E27000, v5, OS_LOG_TYPE_DEFAULT, "%@ %s Evaluating items with quota %llu for container lists %{public}@", buf, 0x2Au);
    }

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", -[NSMutableDictionary count](self->_itemEnumerators, "count"));
    v59 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", -[NSMutableDictionary count](self->_itemEnumerators, "count"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = 0u;
    v98 = 0u;
    v95 = 0u;
    v96 = 0u;
    -[NSMutableDictionary keyEnumerator](self->_itemEnumerators, "keyEnumerator");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v95, v105, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v96;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v96 != v9)
            objc_enumerationMutation(obj);
          v11 = *(_QWORD *)(*((_QWORD *)&v95 + 1) + 8 * i);
          v12 = self->_quota;
          v13 = -[NSMutableDictionary count](self->_itemEnumerators, "count");
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v12 / v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "setObject:forKey:", v14, v11);

          v15 = [NMLogActionsCoalescer alloc];
          NMLogForCategory(6);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = -[NMLogActionsCoalescer initWithIdentifier:logCategory:](v15, "initWithIdentifier:logCategory:", v11, v16);

          objc_msgSend(CFSTR("[MediaQuota]"), "stringByAppendingString:", CFSTR(" QuotaEvaluation process"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[NMLogActionsCoalescer setPrefix:](v17, "setPrefix:", v18);

          objc_msgSend(v58, "setObject:forKeyedSubscript:", v17, v11);
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v95, v105, 16);
      }
      while (v8);
    }

    NMLogForCategory(5);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = CFSTR("[MediaQuota]");
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[NMSMediaQuotaManager _evaluateAddedItemsIfNecessary]";
      *(_WORD *)&buf[22] = 2114;
      v103 = (uint64_t (*)(uint64_t, uint64_t))v59;
      _os_log_impl(&dword_216E27000, v19, OS_LOG_TYPE_DEFAULT, "%@ %s Calculated initial per bundleIdentifier quotas %{public}@", buf, 0x20u);
    }

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", -[NSMutableDictionary count](self->_itemEnumerators, "count"));
    obja = (id)objc_claimAutoreleasedReturnValue();
    v20 = -[NMSMediaQuotaManager _newMutableItemEnumeratorDict](self, "_newMutableItemEnumeratorDict");
    v21 = -[NMSMediaQuotaManager _newMutableItemEnumeratorDict](self, "_newMutableItemEnumeratorDict");
    while (-[NSMutableDictionary count](self->_itemEnumerators, "count"))
    {
      context = (void *)MEMORY[0x219A039AC]();
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v103 = __Block_byref_object_copy_;
      *(_QWORD *)&v104 = __Block_byref_object_dispose_;
      *((_QWORD *)&v104 + 1) = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v22 = self->_itemEnumerators;
      v88[0] = MEMORY[0x24BDAC760];
      v88[1] = 3221225472;
      v88[2] = __54__NMSMediaQuotaManager__evaluateAddedItemsIfNecessary__block_invoke;
      v88[3] = &unk_24D646DB0;
      v23 = v58;
      v89 = v23;
      v60 = v59;
      v90 = v60;
      v91 = self;
      v57 = v20;
      v92 = v57;
      v56 = v21;
      v93 = v56;
      v94 = buf;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v22, "enumerateKeysAndObjectsUsingBlock:", v88);
      if (!objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "count"))
      {
        v82 = 0;
        v83 = &v82;
        v84 = 0x3032000000;
        v85 = __Block_byref_object_copy_;
        v86 = __Block_byref_object_dispose_;
        v87 = 0;
        v81[0] = 0;
        v81[1] = v81;
        v81[2] = 0x2020000000;
        v81[3] = 0;
        v24 = self->_itemEnumerators;
        v80[0] = MEMORY[0x24BDAC760];
        v80[1] = 3221225472;
        v80[2] = __54__NMSMediaQuotaManager__evaluateAddedItemsIfNecessary__block_invoke_2;
        v80[3] = &unk_24D646DD8;
        v80[4] = self;
        v80[5] = v81;
        v80[6] = &v82;
        -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v24, "enumerateKeysAndObjectsUsingBlock:", v80);
        objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "addObject:", v83[5]);
        if (objc_msgSend((id)v83[5], "isEqualToString:", CFSTR("com.apple.NanoMusic")))
          self->_legacy_musicDidSkipItem = 1;
        _Block_object_dispose(v81, 8);
        _Block_object_dispose(&v82, 8);

      }
      v78 = 0u;
      v79 = 0u;
      v76 = 0u;
      v77 = 0u;
      v25 = *(id *)(*(_QWORD *)&buf[8] + 40);
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v76, v101, 16);
      if (v26)
      {
        v27 = *(_QWORD *)v77;
        do
        {
          for (j = 0; j != v26; ++j)
          {
            if (*(_QWORD *)v77 != v27)
              objc_enumerationMutation(v25);
            v29 = *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * j);
            -[NSMutableDictionary objectForKeyedSubscript:](self->_itemEnumerators, "objectForKeyedSubscript:", v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(obja, "setObject:forKeyedSubscript:", v30, v29);
            -[NSMutableDictionary removeObjectForKey:](self->_itemEnumerators, "removeObjectForKey:", v29);
            objc_msgSend(v23, "objectForKeyedSubscript:", v29);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Removing item list"));
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            +[NMGenericMessageLogAction logActionWithMessage:](NMGenericMessageLogAction, "logActionWithMessage:", v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "addLogAction:", v33);

          }
          v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v76, v101, 16);
        }
        while (v26);
      }

      v74 = 0u;
      v75 = 0u;
      v72 = 0u;
      v73 = 0u;
      objc_msgSend(obja, "keyEnumerator");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 0;
      v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v72, v100, 16);
      if (v36)
      {
        v37 = *(_QWORD *)v73;
        do
        {
          for (k = 0; k != v36; ++k)
          {
            if (*(_QWORD *)v73 != v37)
              objc_enumerationMutation(v34);
            -[NSDictionary objectForKeyedSubscript:](self->_downloadInfoWithinQuotaForIdentifiers, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * k));
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = objc_msgSend(v39, "totalItemSize");

            v35 += v40;
          }
          v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v72, v100, 16);
        }
        while (v36);
      }

      v41 = self->_quota;
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", -[NSMutableDictionary count](self->_itemEnumerators, "count"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      v43 = self->_itemEnumerators;
      v68[0] = MEMORY[0x24BDAC760];
      v68[1] = 3221225472;
      v68[2] = __54__NMSMediaQuotaManager__evaluateAddedItemsIfNecessary__block_invoke_3;
      v68[3] = &unk_24D646E00;
      v71 = v41 - v35;
      v68[4] = self;
      v59 = v42;
      v69 = v59;
      v70 = v23;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v43, "enumerateKeysAndObjectsUsingBlock:", v68);
      v20 = v56;

      v21 = -[NMSMediaQuotaManager _newMutableItemEnumeratorDict](self, "_newMutableItemEnumeratorDict");
      _Block_object_dispose(buf, 8);

      objc_autoreleasePoolPop(context);
    }
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    objc_msgSend(v58, "allValues");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v64, v99, 16);
    if (v45)
    {
      v46 = *(_QWORD *)v65;
      do
      {
        for (m = 0; m != v45; ++m)
        {
          if (*(_QWORD *)v65 != v46)
            objc_enumerationMutation(v44);
          objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * m), "flush");
        }
        v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v64, v99, 16);
      }
      while (v45);
    }

    NMLogForCategory(5);
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      v49 = self->_quota;
      v50 = -[NMSMediaDownloadInfo totalItemCount](self->_downloadInfoWithinQuota, "totalItemCount");
      *(_DWORD *)buf = 138413058;
      *(_QWORD *)&buf[4] = CFSTR("[MediaQuota]");
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[NMSMediaQuotaManager _evaluateAddedItemsIfNecessary]";
      *(_WORD *)&buf[22] = 2048;
      v103 = (uint64_t (*)(uint64_t, uint64_t))v49;
      LOWORD(v104) = 2048;
      *(_QWORD *)((char *)&v104 + 2) = v50;
      _os_log_impl(&dword_216E27000, v48, OS_LOG_TYPE_DEFAULT, "%@ %s QuotaEvaluation result: downloadInfoWithinQuota (quota: %llu) (count: %lu)", buf, 0x2Au);
    }

    NMLogForCategory(5);
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      v52 = -[NMSMediaDownloadInfo totalItemSize](self->_downloadInfoWithinQuota, "totalItemSize");
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = CFSTR("[MediaQuota]");
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[NMSMediaQuotaManager _evaluateAddedItemsIfNecessary]";
      *(_WORD *)&buf[22] = 2048;
      v103 = (uint64_t (*)(uint64_t, uint64_t))v52;
      _os_log_impl(&dword_216E27000, v51, OS_LOG_TYPE_DEFAULT, "%@ %s QuotaEvaluation result: downloadInfoWithinQuota using %llu bytes", buf, 0x20u);
    }

    v63[0] = MEMORY[0x24BDAC760];
    v63[1] = 3221225472;
    v63[2] = __54__NMSMediaQuotaManager__evaluateAddedItemsIfNecessary__block_invoke_106;
    v63[3] = &unk_24D646E28;
    v63[4] = self;
    objc_msgSend(obja, "enumerateKeysAndObjectsUsingBlock:", v63);
    NMLogForCategory(5);
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v54 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = CFSTR("[MediaQuota]");
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[NMSMediaQuotaManager _evaluateAddedItemsIfNecessary]";
      *(_WORD *)&buf[22] = 2112;
      v103 = v54;
      _os_log_impl(&dword_216E27000, v53, OS_LOG_TYPE_DEFAULT, "%@ %s ****** Finished QuotaEvaluation! %@", buf, 0x20u);

    }
    self->_hasEvaluated = 1;

  }
}

void __54__NMSMediaQuotaManager__evaluateAddedItemsIfNecessary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  NMSQuotaEvaluationState *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;

  v31 = a2;
  v29 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v31);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v31);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedLongLongValue");

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 16), "objectForKeyedSubscript:", v31);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedLongLongValue");

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 40), "objectForKeyedSubscript:", v31);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v31);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 64), "objectForKeyedSubscript:", v31);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  while (1)
  {
    v11 = (void *)MEMORY[0x219A039AC]();
    objc_msgSend(v10, "nextItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = v12;
    }
    else
    {
      objc_msgSend(v29, "nextItem");
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    v15 = v14;

    v16 = -[NMSQuotaEvaluationState initWithCurrentItem:downloadInfo:]([NMSQuotaEvaluationState alloc], "initWithCurrentItem:downloadInfo:", v15, v9);
    if (!v15)
      break;
    if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 32), "containsItem:", v15) & 1) == 0)
    {
      if (objc_msgSend(v15, "isManuallyAdded"))
      {
        +[NMSQuotaEvaluationLogAction logActionWithActionType:state:](NMSQuotaEvaluationLogAction, "logActionWithActionType:state:", 2, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "addLogAction:", v17);

      }
      else
      {
        v18 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 32), "totalItemSize");
        if ((unint64_t)(objc_msgSend(v15, "size") + v18) <= *(_QWORD *)(*(_QWORD *)(a1 + 48) + 24))
        {
          v20 = objc_msgSend(v9, "totalItemSize");
          if (objc_msgSend(v15, "size") + v20 <= v6)
          {
            +[NMSQuotaEvaluationLogAction logActionWithActionType:state:](NMSQuotaEvaluationLogAction, "logActionWithActionType:state:", 0, v16);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "addLogAction:", v23);

            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 32), "addItem:", v15);
            v22 = v9;
          }
          else
          {
            +[NMSQuotaEvaluationLogAction logActionWithActionType:state:](NMSQuotaEvaluationLogAction, "logActionWithActionType:state:", 1, v16);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "addLogAction:", v21);

            v22 = v28;
          }
          objc_msgSend(v22, "addItem:", v15);
        }
        else
        {
          +[NMSQuotaEvaluationLogAction logActionWithActionType:state:](NMSQuotaEvaluationLogAction, "logActionWithActionType:state:", 2, v16);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "addLogAction:", v19);

          if (objc_msgSend(v31, "isEqualToString:", CFSTR("com.apple.NanoMusic")))
            *(_BYTE *)(*(_QWORD *)(a1 + 48) + 49) = 1;
        }
      }
    }
    if (objc_msgSend(v9, "totalItemSize") + v8 > v6)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Ending iteration within %llu of list quota - estimated item size %llu"), v6 - objc_msgSend(v9, "totalItemSize"), v8);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      +[NMGenericMessageLogAction logActionWithMessage:](NMGenericMessageLogAction, "logActionWithMessage:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v30;
      objc_msgSend(v30, "addLogAction:", v26);

      goto LABEL_21;
    }

    objc_autoreleasePoolPop(v11);
  }
  v24 = v30;
  if (objc_msgSend(v28, "hasItems"))
  {
    +[NMGenericMessageLogAction logActionWithMessage:](NMGenericMessageLogAction, "logActionWithMessage:", CFSTR("Ran out of items. Enumerator has skipped items remaining."));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addLogAction:", v25);
LABEL_21:

    goto LABEL_23;
  }
  +[NMGenericMessageLogAction logActionWithMessage:](NMGenericMessageLogAction, "logActionWithMessage:", CFSTR("Ran out of items."));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addLogAction:", v27);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "addObject:", v31);
LABEL_23:

  objc_autoreleasePoolPop(v11);
}

void __54__NMSMediaQuotaManager__evaluateAddedItemsIfNecessary__block_invoke_2(_QWORD *a1, void *a2)
{
  void *v4;
  unint64_t v5;
  unint64_t v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1[4] + 16), "objectForKeyedSubscript:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedLongLongValue");
  v6 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);

  if (v5 > v6)
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);

}

void __54__NMSMediaQuotaManager__evaluateAddedItemsIfNecessary__block_invoke_3(uint64_t a1, void *a2)
{
  unint64_t v3;
  void *v4;
  id v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = *(_QWORD *)(a1 + 56);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v5 = a2;
  v6 = objc_msgSend(v4, "count");
  v7 = *(void **)(a1 + 40);
  v8 = v3 / v6;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v9, v5);

  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v5);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Reset to iterate over bundle identifiers with new quota %llu"), v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[NMGenericMessageLogAction logActionWithMessage:](NMGenericMessageLogAction, "logActionWithMessage:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addLogAction:", v11);

}

void __54__NMSMediaQuotaManager__evaluateAddedItemsIfNecessary__block_invoke_106(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  const __CFString *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  NMLogForCategory(5);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectForKeyedSubscript:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "totalItemSize");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectForKeyedSubscript:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138413314;
    v9 = CFSTR("[MediaQuota]");
    v10 = 2080;
    v11 = "-[NMSMediaQuotaManager _evaluateAddedItemsIfNecessary]_block_invoke";
    v12 = 2114;
    v13 = v3;
    v14 = 2048;
    v15 = v6;
    v16 = 2048;
    v17 = objc_msgSend(v7, "totalItemCount");
    _os_log_impl(&dword_216E27000, v4, OS_LOG_TYPE_DEFAULT, "%@ %s Evaluation result: container list %{public}@ used %llu bytes for %lu items", (uint8_t *)&v8, 0x34u);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadInfoWithinQuotaForIdentifiers, 0);
  objc_storeStrong((id *)&self->_downloadInfoWithinQuota, 0);
  objc_storeStrong((id *)&self->_estimatedItemSizes, 0);
  objc_storeStrong((id *)&self->_itemEnumerators, 0);
}

void __61__NMSMediaQuotaManager_Legacy__evaluateAddedItemsIfNecessary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  __objc2_class_ro **p_info;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  __objc2_class_ro **v26;
  unint64_t v27;
  __objc2_class_ro **v28;
  void *v29;
  __objc2_class_ro **v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;

  v4 = a2;
  v36 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v36);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedLongLongValue");

  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v36);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
    goto LABEL_21;
  p_info = NMSQuotaEvaluationState_Legacy.info;
  v35 = (void *)v9;
  while (1)
  {
    objc_msgSend(v6, "currentItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v6, "sizeForCurrentIdentifier");
    v14 = objc_msgSend(v6, "sizeForItemListWithinQuota");
    if (!v12)
    {
      +[NMGenericMessageLogAction logActionWithMessage:](NMGenericMessageLogAction, "logActionWithMessage:", CFSTR("Ran out of items"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addLogAction:", v32);

      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), v4);
      goto LABEL_20;
    }
    v15 = v14;
    if (objc_msgSend(v12, "isManuallyAdded"))
    {
      objc_msgSend(v6, "evaluationState");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(p_info + 1, "logActionWithActionType:state:", 0, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addLogAction:", v17);

      objc_msgSend(*(id *)(a1 + 48), "addObject:", v12);
      v18 = v6;
      v19 = 0;
      goto LABEL_15;
    }
    if (objc_msgSend(v6, "estimatedItemSize") + v15 > v8)
      break;
    if ((objc_msgSend(v6, "isCurrentIdentifierEstimate") & 1) == 0
      && objc_msgSend(*(id *)(a1 + 48), "containsObject:", v12))
    {
      goto LABEL_14;
    }
    if ((unint64_t)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 32) + v13) <= *(_QWORD *)(*(_QWORD *)(a1 + 56) + 16))
    {
      if (v15 + v13 <= v8)
      {
        v24 = objc_msgSend(*(id *)(a1 + 64), "containsObject:", v12);
        objc_msgSend(*(id *)(a1 + 64), "removeObject:", v12);
        v25 = v4;
        v26 = p_info + 1;
        objc_msgSend(v6, "evaluationState");
        v27 = v8;
        v28 = p_info;
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v26;
        v4 = v25;
        v10 = v35;
        objc_msgSend(v30, "logActionWithActionType:state:", v24, v29);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "addLogAction:", v31);

        p_info = v28;
        v8 = v27;
        objc_msgSend(*(id *)(a1 + 48), "addObject:", v12);
        *(_QWORD *)(*(_QWORD *)(a1 + 56) + 32) += v13;
LABEL_14:
        v18 = v6;
        v19 = 1;
LABEL_15:
        objc_msgSend(v18, "addCurrentIdentifierToWithinQuotaListAndCountSizeTowardsQuota:", v19);
        goto LABEL_16;
      }
      objc_msgSend(v6, "skipCurrentIdentifier");
      objc_msgSend(v6, "evaluationState");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(p_info + 1, "logActionWithActionType:state:", 2, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addLogAction:", v23);

    }
    else
    {
      objc_msgSend(v6, "evaluationState");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(p_info + 1, "logActionWithActionType:state:", 3, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addLogAction:", v21);

      objc_msgSend(v6, "removeCurrentIdentifier");
    }
LABEL_16:

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
      goto LABEL_21;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Ending iteration within %llu of listQuota - estimated item size %llu"), v8 - v15, objc_msgSend(v6, "estimatedItemSize"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  +[NMGenericMessageLogAction logActionWithMessage:](NMGenericMessageLogAction, "logActionWithMessage:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "addLogAction:", v34);

  v10 = v35;
  objc_msgSend(v6, "markAllRemainingContainersAsSkipped");
LABEL_20:

LABEL_21:
}

void __61__NMSMediaQuotaManager_Legacy__evaluateAddedItemsIfNecessary__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;

  v6 = a2;
  if ((unint64_t)objc_msgSend(a3, "estimatedItemSize") > *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                           + 24))
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);

}

void __61__NMSMediaQuotaManager_Legacy__evaluateAddedItemsIfNecessary__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5;
  void *v6;
  id v7;
  id v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v5 = *(_QWORD *)(a1 + 56);
  v6 = *(void **)(a1 + 32);
  v7 = a3;
  v8 = a2;
  v9 = objc_msgSend(v6, "count");
  v10 = *(void **)(a1 + 40);
  v11 = v5 / v9;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v12, v8);

  objc_msgSend(v7, "resetToIterateOverQuotaIdentifiers");
  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v8);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Reset to iterate over bundle identifiers with new quota %llu"), v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[NMGenericMessageLogAction logActionWithMessage:](NMGenericMessageLogAction, "logActionWithMessage:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addLogAction:", v14);

}

void __61__NMSMediaQuotaManager_Legacy__evaluateAddedItemsIfNecessary__block_invoke_103(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  const __CFString *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = a3;
  NMLogForCategory(5);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_msgSend(v5, "sizeForItemListWithinQuota");
    objc_msgSend(v5, "downloadInfoWithinQuota");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138413314;
    v10 = CFSTR("[MediaQuota]");
    v11 = 2080;
    v12 = "-[NMSMediaQuotaManager_Legacy _evaluateAddedItemsIfNecessary]_block_invoke";
    v13 = 2114;
    v14 = v4;
    v15 = 2048;
    v16 = v7;
    v17 = 2048;
    v18 = objc_msgSend(v8, "totalItemCount");
    _os_log_impl(&dword_216E27000, v6, OS_LOG_TYPE_DEFAULT, "%@ %s Evaluation result: container list %{public}@ used %llu bytes for %lu items", (uint8_t *)&v9, 0x34u);

  }
}

@end

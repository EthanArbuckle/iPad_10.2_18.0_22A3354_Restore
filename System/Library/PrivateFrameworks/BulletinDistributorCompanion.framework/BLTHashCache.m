@implementation BLTHashCache

- (BLTHashCache)init
{
  BLTHashCache *v2;
  uint64_t v3;
  NSMutableDictionary *cacheBySectionID;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BLTHashCache;
  v2 = -[BLTHashCache init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    cacheBySectionID = v2->_cacheBySectionID;
    v2->_cacheBySectionID = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (void)updateCacheWithItems:(id)a3 forSectionID:(id)a4 matchID:(id)a5 result:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __65__BLTHashCache_updateCacheWithItems_forSectionID_matchID_result___block_invoke;
  v18[3] = &unk_24D7620F8;
  v18[4] = self;
  v19 = v10;
  v20 = v11;
  v21 = v12;
  v22 = v13;
  v14 = v13;
  v15 = v12;
  v16 = v11;
  v17 = v10;
  BLTDispatchWorkQueue(v18);

}

uint64_t __65__BLTHashCache_updateCacheWithItems_forSectionID_matchID_result___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateCacheWithItems:forSectionID:matchID:result:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (void)_updateCacheWithItems:(id)a3 forSectionID:(id)a4 matchID:(id)a5 result:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, _QWORD, uint64_t, uint64_t);
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t k;
  uint64_t v37;
  BLTHashCache *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD, uint64_t, uint64_t))a6;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_cacheBySectionID, "objectForKeyedSubscript:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "mutableCopy");
  objc_msgSend(v16, "minusSet:", v15);
  objc_msgSend(v17, "minusSet:", v16);
  v42 = (void *)objc_msgSend(v15, "mutableCopy");
  v44 = v17;
  objc_msgSend(v42, "minusSet:", v17);
  v40 = v12;
  v41 = v11;
  if (objc_msgSend(v16, "count") || objc_msgSend(v42, "count"))
  {
    if (!v14)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cacheBySectionID, "setObject:forKeyedSubscript:", v14, v11);
    }
    objc_msgSend(v14, "objectForKeyedSubscript:", v12);
    v18 = v14;
    v19 = objc_claimAutoreleasedReturnValue();

    v43 = v18;
    if (v19)
    {
      v15 = (void *)v19;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v15, v12);
    }
  }
  else
  {
    v43 = v14;
  }
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v20 = v16;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v54;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v54 != v23)
          objc_enumerationMutation(v20);
        v25 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * i);
        if (v13)
          v13[2](v13, v25, objc_msgSend(v10, "indexOfObject:", *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * i)), 1);
        objc_msgSend(v15, "addObject:", v25);
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
    }
    while (v22);
  }
  v38 = self;

  if (v13)
  {
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v26 = v44;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v50;
      do
      {
        for (j = 0; j != v28; ++j)
        {
          if (*(_QWORD *)v50 != v29)
            objc_enumerationMutation(v26);
          v13[2](v13, *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * j), objc_msgSend(v10, "indexOfObject:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * j)), 0);
        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
      }
      while (v28);
    }

  }
  v39 = v20;
  v31 = objc_msgSend(v10, "count");
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v32 = v42;
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v46;
    do
    {
      for (k = 0; k != v34; ++k)
      {
        if (*(_QWORD *)v46 != v35)
          objc_enumerationMutation(v32);
        v37 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * k);
        if (v13)
          v13[2](v13, *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * k), v31++, 2);
        objc_msgSend(v15, "removeObject:", v37);
      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
    }
    while (v34);
  }

  if (!objc_msgSend(v15, "count"))
  {
    objc_msgSend(v43, "removeObjectForKey:", v40);
    if (!objc_msgSend(v43, "count"))
      -[NSMutableDictionary removeObjectForKey:](v38->_cacheBySectionID, "removeObjectForKey:", v41);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheBySectionID, 0);
}

@end

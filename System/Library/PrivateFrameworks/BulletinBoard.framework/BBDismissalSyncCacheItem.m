@implementation BBDismissalSyncCacheItem

- (BBDismissalSyncCacheItem)init
{
  BBDismissalSyncCacheItem *v2;
  NSMutableArray *v3;
  NSMutableArray *dismissalDictionariesAndFeeds;
  NSMutableDictionary *v5;
  NSMutableDictionary *dismissalIDToFeeds;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BBDismissalSyncCacheItem;
  v2 = -[BBDismissalSyncCacheItem init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    dismissalDictionariesAndFeeds = v2->_dismissalDictionariesAndFeeds;
    v2->_dismissalDictionariesAndFeeds = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    dismissalIDToFeeds = v2->_dismissalIDToFeeds;
    v2->_dismissalIDToFeeds = v5;

  }
  return v2;
}

- (void)cacheDismissalDictionaries:(id)a3 dismissalIDs:(id)a4 forFeeds:(unint64_t)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  uint64_t v24;
  BBDismissalItem *v25;
  BBDismissalItem *v26;
  id v27;
  id obj;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v27 = a4;
  obj = v8;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
  if (v9)
  {
    v10 = v9;
    v29 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v39 != v29)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v13 = self->_dismissalDictionariesAndFeeds;
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v35;
          while (2)
          {
            for (j = 0; j != v15; ++j)
            {
              if (*(_QWORD *)v35 != v16)
                objc_enumerationMutation(v13);
              v18 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
              if (objc_msgSend(v18, "matchDismissalDictionary:", v12))
              {
                objc_msgSend(v18, "addFeeds:", a5);
                goto LABEL_16;
              }
            }
            v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
            if (v15)
              continue;
            break;
          }
        }

        v13 = -[BBDismissalDictionaryAndFeeds initWithDismissalDictionary:andFeeds:]([BBDismissalDictionaryAndFeeds alloc], "initWithDismissalDictionary:andFeeds:", v12, a5);
        -[NSMutableArray addObject:](self->_dismissalDictionariesAndFeeds, "addObject:", v13);
LABEL_16:

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    }
    while (v10);
  }
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v19 = v27;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v31;
    do
    {
      for (k = 0; k != v21; ++k)
      {
        if (*(_QWORD *)v31 != v22)
          objc_enumerationMutation(v19);
        v24 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * k);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_dismissalIDToFeeds, "objectForKeyedSubscript:", v24);
        v25 = (BBDismissalItem *)objc_claimAutoreleasedReturnValue();
        if (v25)
        {
          v26 = v25;
          -[BBDismissalItem addFeeds:](v25, "addFeeds:", a5);
        }
        else
        {
          v26 = -[BBDismissalItem initWithFeeds:]([BBDismissalItem alloc], "initWithFeeds:", a5);
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dismissalIDToFeeds, "setObject:forKeyedSubscript:", v26, v24);
        }

      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
    }
    while (v21);
  }

}

- (id)findBulletinMatch:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BBDismissalSyncBulletinMatch *v8;
  void *v9;
  void *v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  BBDismissalSyncBulletinMatch *i;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "dismissalID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5
    || (-[NSMutableDictionary objectForKeyedSubscript:](self->_dismissalIDToFeeds, "objectForKeyedSubscript:", v5),
        (v6 = objc_claimAutoreleasedReturnValue()) == 0)
    || (v7 = (void *)v6,
        v8 = -[BBDismissalSyncBulletinMatch initWithDismissalID:andItem:]([BBDismissalSyncBulletinMatch alloc], "initWithDismissalID:andItem:", v5, v6), v7, !v8))
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("d"));
    objc_msgSend(v4, "syncHash");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("h"));
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v12 = self->_dismissalDictionariesAndFeeds;
    v8 = (BBDismissalSyncBulletinMatch *)-[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v13 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v8; i = (BBDismissalSyncBulletinMatch *)((char *)i + 1))
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v12);
          v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v15, "matchDismissalDictionary:", v9, (_QWORD)v17))
          {
            v8 = -[BBDismissalSyncBulletinMatch initWithDismissalDictionaryItem:]([BBDismissalSyncBulletinMatch alloc], "initWithDismissalDictionaryItem:", v15);
            goto LABEL_18;
          }
        }
        v8 = (BBDismissalSyncBulletinMatch *)-[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_18:

  }
  return v8;
}

- (void)removeBulletinMatch:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "dismissalID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_dismissalIDToFeeds, "removeObjectForKey:", v4);
  }
  else
  {
    objc_msgSend(v6, "dismissalItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      -[NSMutableArray removeObject:](self->_dismissalDictionariesAndFeeds, "removeObject:", v5);

  }
}

- (id)purgeExpired
{
  id v3;
  NSMutableArray *dismissalDictionariesAndFeeds;
  uint64_t v5;
  id v6;
  id v7;
  NSMutableDictionary *dismissalIDToFeeds;
  id v9;
  id v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, void *);
  void *v15;
  id v16;
  uint64_t *v17;
  _QWORD v18[4];
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  v26 = 0;
  v3 = objc_alloc_init(MEMORY[0x24BDD1698]);
  dismissalDictionariesAndFeeds = self->_dismissalDictionariesAndFeeds;
  v5 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __40__BBDismissalSyncCacheItem_purgeExpired__block_invoke;
  v18[3] = &unk_24C562BF8;
  v6 = v3;
  v19 = v6;
  v20 = &v21;
  -[NSMutableArray enumerateObjectsUsingBlock:](dismissalDictionariesAndFeeds, "enumerateObjectsUsingBlock:", v18);
  -[NSMutableArray removeObjectsAtIndexes:](self->_dismissalDictionariesAndFeeds, "removeObjectsAtIndexes:", v6);
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  dismissalIDToFeeds = self->_dismissalIDToFeeds;
  v12 = v5;
  v13 = 3221225472;
  v14 = __40__BBDismissalSyncCacheItem_purgeExpired__block_invoke_2;
  v15 = &unk_24C562C20;
  v9 = v7;
  v16 = v9;
  v17 = &v21;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](dismissalIDToFeeds, "enumerateKeysAndObjectsUsingBlock:", &v12);
  -[NSMutableDictionary removeObjectsForKeys:](self->_dismissalIDToFeeds, "removeObjectsForKeys:", v9, v12, v13, v14, v15);
  v10 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v10;
}

void __40__BBDismissalSyncCacheItem_purgeExpired__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  if (objc_msgSend(v10, "hasExpired"))
  {
    objc_msgSend(*(id *)(a1 + 32), "addIndex:", a3);
  }
  else
  {
    objc_msgSend(v10, "expiration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "compare:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

    if (v6 == -1)
    {
      objc_msgSend(v10, "expiration");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;

    }
  }

}

void __40__BBDismissalSyncCacheItem_purgeExpired__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "hasExpired"))
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v11);
  }
  else
  {
    objc_msgSend(v5, "expiration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "compare:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

    if (v7 == -1)
    {
      objc_msgSend(v5, "expiration");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

    }
  }

}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p; dismissalDictionariesAndFeeds:%@; dismissalIDToFeeds:%@>"),
               objc_opt_class(),
               self,
               self->_dismissalDictionariesAndFeeds,
               self->_dismissalIDToFeeds);
}

- (NSMutableArray)dismissalDictionariesAndFeeds
{
  return self->_dismissalDictionariesAndFeeds;
}

- (NSMutableDictionary)dismissalIDToFeeds
{
  return self->_dismissalIDToFeeds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissalIDToFeeds, 0);
  objc_storeStrong((id *)&self->_dismissalDictionariesAndFeeds, 0);
}

@end

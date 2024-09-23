@implementation BLTSectionInfoList

- (BLTSectionInfoList)init
{
  BLTSectionInfoList *v2;
  BLTSectionInfoList *v3;
  uint64_t v4;
  NSMutableDictionary *sectionInfoListItemsBySectionID;
  uint64_t v6;
  NSMutableArray *loadingCompletionHandlers;
  uint64_t v8;
  NSMutableSet *sectionInfoSectionIDs;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)BLTSectionInfoList;
  v2 = -[BLTSectionInfoList init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    pthread_mutex_init(&v2->_lock, 0);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = objc_claimAutoreleasedReturnValue();
    sectionInfoListItemsBySectionID = v3->_sectionInfoListItemsBySectionID;
    v3->_sectionInfoListItemsBySectionID = (NSMutableDictionary *)v4;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    loadingCompletionHandlers = v3->_loadingCompletionHandlers;
    v3->_loadingCompletionHandlers = (NSMutableArray *)v6;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v8 = objc_claimAutoreleasedReturnValue();
    sectionInfoSectionIDs = v3->_sectionInfoSectionIDs;
    v3->_sectionInfoSectionIDs = (NSMutableSet *)v8;

  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  pthread_mutex_destroy(&self->_lock);
  v3.receiver = self;
  v3.super_class = (Class)BLTSectionInfoList;
  -[BLTSectionInfoList dealloc](&v3, sel_dealloc);
}

- (id)sectionIDs
{
  _opaque_pthread_mutex_t *p_lock;
  void *v4;
  void *v5;

  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  -[NSMutableSet allObjects](self->_sectionInfoSectionIDs, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  pthread_mutex_unlock(p_lock);
  return v5;
}

- (void)setSectionInfoProvider:(id)a3
{
  BLTSectionInfoListBBProvider *v5;
  BLTSectionInfoListBBProvider *v6;

  v5 = (BLTSectionInfoListBBProvider *)a3;
  if (self->_sectionInfoProvider != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_sectionInfoProvider, a3);
    -[BLTSectionInfoListBBProvider setDelegate:](self->_sectionInfoProvider, "setDelegate:", self);
    v5 = v6;
  }

}

- (void)setOverrideProvider:(id)a3
{
  BLTSectionInfoListOverrideProvider *v5;
  BLTSectionInfoListOverrideProvider *v6;

  v5 = (BLTSectionInfoListOverrideProvider *)a3;
  if (self->_overrideProvider != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_overrideProvider, a3);
    -[BLTSectionInfoListOverrideProvider setDelegate:](self->_overrideProvider, "setDelegate:", self);
    v5 = v6;
  }

}

- (void)_updateListItem:(id)a3 overrides:(id)a4 sectionID:(id)a5
{
  id v8;
  id v9;
  id WeakRetained;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LODWORD(self) = objc_msgSend(WeakRetained, "sectionInfoList:override:shouldApplyToSectionInfoForSectionID:", self, v8, v9);

  if ((_DWORD)self)
    objc_msgSend(v11, "setOverrides:", v8);

}

- (void)reloadWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  BLTWorkQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __43__BLTSectionInfoList_reloadWithCompletion___block_invoke;
  v7[3] = &unk_24D761B20;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __43__BLTSectionInfoList_reloadWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;

  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
    v4 = (void *)objc_msgSend(v2, "copy");
    objc_msgSend(v3, "addObject:", v4);

  }
  v5 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v5 + 96))
  {
    *(_BYTE *)(v5 + 96) = 1;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 112);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __43__BLTSectionInfoList_reloadWithCompletion___block_invoke_2;
    v10[3] = &unk_24D762700;
    v11 = v6;
    v12 = v7;
    v9 = v6;
    objc_msgSend(v8, "reloadWithCompletion:", v10);

  }
}

void __43__BLTSectionInfoList_reloadWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;

  v4 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __43__BLTSectionInfoList_reloadWithCompletion___block_invoke_3;
  v14[3] = &unk_24D7626D8;
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v15 = v5;
  v16 = v6;
  objc_msgSend(a2, "enumerateKeysAndObjectsUsingBlock:", v14);
  v7 = *(void **)(a1 + 32);
  v8 = *(void **)(*(_QWORD *)(a1 + 40) + 120);
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __43__BLTSectionInfoList_reloadWithCompletion___block_invoke_4;
  v11[3] = &unk_24D7630D8;
  v9 = v7;
  v10 = *(_QWORD *)(a1 + 40);
  v12 = v9;
  v13 = v10;
  objc_msgSend(v8, "reloadWithCompletion:", v11);

}

void __43__BLTSectionInfoList_reloadWithCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  BLTSectionInfoListItem *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
  v6 = (BLTSectionInfoListItem *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = objc_alloc_init(BLTSectionInfoListItem);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v7);
  }
  objc_msgSend(*(id *)(a1 + 40), "_updateListItem:overrides:sectionID:", v6, v5, v7);

}

void __43__BLTSectionInfoList_reloadWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  uint64_t v11;

  v3 = a2;
  BLTWorkQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__BLTSectionInfoList_reloadWithCompletion___block_invoke_5;
  block[3] = &unk_24D761D70;
  v9 = v3;
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v10 = v5;
  v11 = v6;
  v7 = v3;
  dispatch_async(v4, block);

}

void __43__BLTSectionInfoList_reloadWithCompletion___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void (**v10)(_QWORD);
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[5];
  _QWORD v19[4];
  id v20;
  uint64_t v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v2 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __43__BLTSectionInfoList_reloadWithCompletion___block_invoke_6;
  v19[3] = &unk_24D763088;
  v3 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v20 = v4;
  v21 = v5;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v19);
  pthread_mutex_lock((pthread_mutex_t *)(*(_QWORD *)(a1 + 48) + 24));
  v18[0] = v2;
  v18[1] = 3221225472;
  v18[2] = __43__BLTSectionInfoList_reloadWithCompletion___block_invoke_56;
  v18[3] = &unk_24D7630B0;
  v6 = *(void **)(a1 + 40);
  v18[4] = *(_QWORD *)(a1 + 48);
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v18);
  pthread_mutex_unlock((pthread_mutex_t *)(*(_QWORD *)(a1 + 48) + 24));
  *(_BYTE *)(*(_QWORD *)(a1 + 48) + 97) = 1;
  *(_BYTE *)(*(_QWORD *)(a1 + 48) + 96) = 0;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = *(id *)(*(_QWORD *)(a1 + 48) + 88);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      v13 = v10;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v7);
        v10 = (void (**)(_QWORD))MEMORY[0x219A0C15C](*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12));

        v10[2](v10);
        ++v12;
        v13 = v10;
      }
      while (v9 != v12);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v9);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 88), "removeAllObjects", (_QWORD)v14);

}

void __43__BLTSectionInfoList_reloadWithCompletion___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  BLTSectionInfoListItem *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "sectionID");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
    __43__BLTSectionInfoList_reloadWithCompletion___block_invoke_6_cold_1();
  v5 = (void *)v4;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v4);
  v6 = (BLTSectionInfoListItem *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = objc_alloc_init(BLTSectionInfoListItem);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);
  }
  blt_settings_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v5;
    _os_log_impl(&dword_2173D9000, v7, OS_LOG_TYPE_DEFAULT, "On reload, retrieved section info for %@", (uint8_t *)&v10, 0xCu);
  }

  pthread_mutex_lock((pthread_mutex_t *)(*(_QWORD *)(a1 + 40) + 24));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "addObject:", v5);
  pthread_mutex_unlock((pthread_mutex_t *)(*(_QWORD *)(a1 + 40) + 24));
  objc_msgSend(v3, "universalSectionID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v3, "universalSectionID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLTSectionInfoListItem setUniversalSectionID:](v6, "setUniversalSectionID:", v9);

  }
  objc_msgSend(*(id *)(a1 + 40), "_migrateFromExternalDeviceSwitchToOverrides:sectionID:", v6, v5);

}

void __43__BLTSectionInfoList_reloadWithCompletion___block_invoke_56(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "overrides");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = *(void **)(a1 + 32);
      objc_msgSend(v5, "overrides");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_updateListItem:overrides:sectionID:", v6, v9, v12);

    }
    objc_msgSend(v5, "universalSectionID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v5, "universalSectionID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setUniversalSectionID:", v11);

    }
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKeyedSubscript:", v5, v12);
  }

}

- (id)_sectionInfoFromSectionID:(id)a3 displayName:(id *)a4
{
  void *v5;
  void *v6;

  -[BLTSectionInfoListBBProvider sectionInfoForSectionID:](self->_sectionInfoProvider, "sectionInfoForSectionID:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sectionInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    objc_msgSend(v5, "displayName");
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)_lock_sectionInfoFromListItem:(id)a3 sectionID:(id)a4 displayName:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;

  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "phoneSectionID");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = (void *)v10;
  else
    v12 = v9;
  v13 = v12;
  if (v11)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_sectionInfoListItemsBySectionID, "objectForKeyedSubscript:", v11);
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = v8;
  }
  v15 = v14;
  if (!v14)
  {
    blt_settings_log();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[BLTSectionInfoList _lock_sectionInfoFromListItem:sectionID:displayName:].cold.1((uint64_t)v13, v24);
    goto LABEL_22;
  }
  -[BLTSectionInfoList _sectionInfoFromSectionID:displayName:](self, "_sectionInfoFromSectionID:displayName:", v13, a5);
  v16 = objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    blt_settings_log();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, (os_log_type_t)0x90u))
      -[BLTSectionInfoList _lock_sectionInfoFromListItem:sectionID:displayName:].cold.2((uint64_t)v13, v24);
LABEL_22:

    v17 = 0;
    goto LABEL_23;
  }
  v17 = (void *)v16;
  objc_msgSend(v8, "overriddenDisplayName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5 && v18)
  {
    objc_msgSend(v8, "overriddenDisplayName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *a5 = (id)objc_msgSend(v19, "copy");

  }
  if (v11)
    objc_msgSend(v17, "setSectionID:", v9);
  objc_msgSend(v8, "overriddenIcon");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v8, "overriddenIcon");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setIcon:", v21);

  }
  objc_msgSend(v8, "overriddenFactorySectionID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v8, "overriddenFactorySectionID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setFactorySectionID:", v23);

  }
LABEL_23:

  return v17;
}

- (id)_overriddenSectionInfoForSectionID:(id)a3 originalSectionInfo:(id *)a4 displayName:(id *)a5
{
  id v8;
  BLTSectionInfoOverrideApplier *v9;
  _opaque_pthread_mutex_t *p_lock;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;

  v8 = a3;
  v9 = objc_alloc_init(BLTSectionInfoOverrideApplier);
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_sectionInfoListItemsBySectionID, "objectForKeyedSubscript:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTSectionInfoList _lock_sectionInfoFromListItem:sectionID:displayName:](self, "_lock_sectionInfoFromListItem:sectionID:displayName:", v11, v8, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "phoneSectionID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_sectionInfoListItemsBySectionID, "objectForKeyedSubscript:", v13);
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = v11;
  }
  v15 = v14;
  objc_msgSend(v14, "overrides");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTSectionInfoOverrideApplier applyOverrides:toSectionInfo:](v9, "applyOverrides:toSectionInfo:", v16, v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  pthread_mutex_unlock(p_lock);
  if (a4)
    *a4 = objc_retainAutorelease(v12);

  return v17;
}

- (id)overriddenSectionInfoForSectionID:(id)a3
{
  return -[BLTSectionInfoList _overriddenSectionInfoForSectionID:originalSectionInfo:displayName:](self, "_overriddenSectionInfoForSectionID:originalSectionInfo:displayName:", a3, 0, 0);
}

- (id)bbSectionInfoForSectionID:(id)a3
{
  _opaque_pthread_mutex_t *p_lock;
  id v5;
  void *v6;
  void *v7;

  p_lock = &self->_lock;
  v5 = a3;
  pthread_mutex_lock(p_lock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_sectionInfoListItemsBySectionID, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTSectionInfoList _lock_sectionInfoFromListItem:sectionID:displayName:](self, "_lock_sectionInfoFromListItem:sectionID:displayName:", v6, v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  pthread_mutex_unlock(p_lock);
  return v7;
}

- (id)effectiveSectionInfoForSectionID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _opaque_pthread_mutex_t *p_lock;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id WeakRetained;
  id v16;
  id v17;

  v4 = a3;
  v16 = 0;
  v17 = 0;
  -[BLTSectionInfoList _overriddenSectionInfoForSectionID:originalSectionInfo:displayName:](self, "_overriddenSectionInfoForSectionID:originalSectionInfo:displayName:", v4, &v17, &v16);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v17;
  v7 = v16;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_sectionInfoListItemsBySectionID, "objectForKeyedSubscript:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  BLTPBSectionInfoFromBBSectionInfo(v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPhoneAllowsNotifications:", objc_msgSend(v6, "allowsNotifications"));
  if (objc_msgSend(MEMORY[0x24BE6B4A8], "activePairedDeviceSupportsAuthorizationStatusLockScreenAndNCSettings"))objc_msgSend(v10, "setPhoneAuthorizationStatus:", objc_msgSend(v6, "authorizationStatus"));
  objc_msgSend(v10, "displayName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
    objc_msgSend(v10, "setDisplayName:", v7);
  objc_msgSend(v9, "universalSectionID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v9, "universalSectionID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setUniversalSectionID:", v13);

  }
  if ((objc_msgSend(MEMORY[0x24BE6B4A8], "activePairedDeviceSupportsEmergencyAlerts") & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v10, "setDisplaysCriticalBulletinsLegacy:", objc_msgSend(WeakRetained, "sectionInfoListSectionIDHadDisplayedCriticalBulletins:", v4));

  }
  pthread_mutex_unlock(p_lock);

  return v10;
}

- (id)universalSectionIDForSectionID:(id)a3
{
  _opaque_pthread_mutex_t *p_lock;
  id v5;
  void *v6;
  void *v7;

  p_lock = &self->_lock;
  v5 = a3;
  pthread_mutex_lock(p_lock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_sectionInfoListItemsBySectionID, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "universalSectionID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  pthread_mutex_unlock(p_lock);

  return v7;
}

- (void)updateOverrides:(id)a3 forSectionID:(id)a4 transaction:(id)a5
{
  id v8;
  id v9;
  BLTSectionInfoListItem *v10;
  id WeakRetained;
  void *v12;
  id v13;
  id v14;

  v14 = a4;
  v8 = a5;
  v9 = a3;
  pthread_mutex_lock(&self->_lock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_sectionInfoListItemsBySectionID, "objectForKeyedSubscript:", v14);
  v10 = (BLTSectionInfoListItem *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v10 = objc_alloc_init(BLTSectionInfoListItem);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sectionInfoListItemsBySectionID, "setObject:forKeyedSubscript:", v10, v14);
  }
  -[BLTSectionInfoList _updateListItem:overrides:sectionID:](self, "_updateListItem:overrides:sectionID:", v10, v9, v14);
  pthread_mutex_unlock(&self->_lock);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "sectionInfoList:receivedUpdatedSectionInfoForSectionID:transaction:", self, v14, v8);

  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BE0FD20]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 && objc_msgSend(v12, "BOOLValue"))
  {
    v13 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v13, "sectionInfoList:makeAuthorizationPermanentForSectionID:", self, v14);

  }
}

- (void)updateSectionInfoForSectionIDs:(id)a3 transaction:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSMutableDictionary *sectionInfoListItemsBySectionID;
  void *v12;
  BLTSectionInfoListItem *v13;
  NSMutableDictionary *v14;
  void *v15;
  NSMutableSet *sectionInfoSectionIDs;
  void *v17;
  void *v18;
  id WeakRetained;
  void *v20;
  id obj;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  obj = a3;
  v22 = a4;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v9);
        pthread_mutex_lock(&self->_lock);
        sectionInfoListItemsBySectionID = self->_sectionInfoListItemsBySectionID;
        objc_msgSend(v10, "sectionID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](sectionInfoListItemsBySectionID, "objectForKeyedSubscript:", v12);
        v13 = (BLTSectionInfoListItem *)objc_claimAutoreleasedReturnValue();

        if (!v13)
        {
          v13 = objc_alloc_init(BLTSectionInfoListItem);
          v14 = self->_sectionInfoListItemsBySectionID;
          objc_msgSend(v10, "sectionID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v13, v15);

        }
        sectionInfoSectionIDs = self->_sectionInfoSectionIDs;
        objc_msgSend(v10, "sectionID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableSet addObject:](sectionInfoSectionIDs, "addObject:", v17);

        objc_msgSend(v10, "universalSectionID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[BLTSectionInfoListItem setUniversalSectionID:](v13, "setUniversalSectionID:", v18);

        pthread_mutex_unlock(&self->_lock);
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v10, "sectionID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "sectionInfoList:receivedUpdatedSectionInfoForSectionID:transaction:", self, v20, v22);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v7);
  }

}

- (void)removedSectionWithSectionID:(id)a3 transaction:(id)a4
{
  _opaque_pthread_mutex_t *p_lock;
  id v7;
  id v8;
  id WeakRetained;

  p_lock = &self->_lock;
  v7 = a4;
  v8 = a3;
  pthread_mutex_lock(p_lock);
  -[NSMutableDictionary removeObjectForKey:](self->_sectionInfoListItemsBySectionID, "removeObjectForKey:", v8);
  -[NSMutableSet removeObject:](self->_sectionInfoSectionIDs, "removeObject:", v8);
  pthread_mutex_unlock(p_lock);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "sectionInfoList:receivedRemoveSectionWithSectionID:transaction:", self, v8, v7);

}

- (id)overrides
{
  void *v3;
  _opaque_pthread_mutex_t *p_lock;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[NSMutableDictionary allValues](self->_sectionInfoListItemsBySectionID, "allValues", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "overrides");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(v10, "overrides");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v12);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  pthread_mutex_unlock(p_lock);
  return v3;
}

- (id)originalSettings
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[BLTSectionInfoList sectionIDs](self, "sectionIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        -[BLTSectionInfoList _sectionInfoFromSectionID:displayName:](self, "_sectionInfoFromSectionID:displayName:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), 0, (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)overriddenSettings
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  pthread_mutex_lock(&self->_lock);
  v4 = (void *)-[NSMutableDictionary copy](self->_sectionInfoListItemsBySectionID, "copy");
  pthread_mutex_unlock(&self->_lock);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v4, "allKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        -[BLTSectionInfoList overriddenSectionInfoForSectionID:](self, "overriddenSectionInfoForSectionID:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v3, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v3;
}

- (id)settingsDescriptionForSectionIDs:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id obj;
  uint64_t v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v6)
  {
    v7 = v6;
    v22 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v25 != v22)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@\n---\n"), v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendString:", v10);

        pthread_mutex_lock(&self->_lock);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_sectionInfoListItemsBySectionID, "objectForKeyedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "overrides");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          v13 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v11, "overrides");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "stringWithFormat:", CFSTR("overrides: %@\n"), v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "appendString:", v15);

        }
        pthread_mutex_unlock(&self->_lock);
        v23 = 0;
        -[BLTSectionInfoList _overriddenSectionInfoForSectionID:originalSectionInfo:displayName:](self, "_overriddenSectionInfoForSectionID:originalSectionInfo:displayName:", v9, &v23, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v23;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("originalSettings: %@\n"), v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendString:", v18);

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("overriddenSettings: %@\n---\n\n"), v16);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendString:", v19);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v7);
  }

  return v5;
}

- (id)sectionOverridesOnly
{
  void *v3;
  _opaque_pthread_mutex_t *p_lock;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  v5 = (void *)MEMORY[0x24BDBCEF0];
  -[NSMutableDictionary allKeys](self->_sectionInfoListItemsBySectionID, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "minusSet:", self->_sectionInfoSectionIDs);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __42__BLTSectionInfoList_sectionOverridesOnly__block_invoke;
  v12[3] = &unk_24D763100;
  v12[4] = self;
  v8 = v3;
  v13 = v8;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v12);
  pthread_mutex_unlock(p_lock);
  v9 = v13;
  v10 = v8;

  return v10;
}

void __42__BLTSectionInfoList_sectionOverridesOnly__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  BLTSectionInfoOverride *v7;
  void *v8;
  BLTSectionInfoOverride *v9;
  id v10;

  v10 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", v10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_sectionInfoFromSectionID:displayName:", v10, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "overrides");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = v4 == 0;
  else
    v6 = 0;
  if (v6)
  {
    v7 = [BLTSectionInfoOverride alloc];
    objc_msgSend(v3, "overrides");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[BLTSectionInfoOverride initWithOverrides:](v7, "initWithOverrides:", v8);
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v9, v10);

  }
}

- (id)sectionOverrideOnlyForSectionID:(id)a3
{
  _opaque_pthread_mutex_t *p_lock;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  BLTSectionInfoOverride *v9;
  BOOL v10;
  BLTSectionInfoOverride *v11;
  void *v12;

  p_lock = &self->_lock;
  v5 = a3;
  pthread_mutex_lock(p_lock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_sectionInfoListItemsBySectionID, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTSectionInfoList _sectionInfoFromSectionID:displayName:](self, "_sectionInfoFromSectionID:displayName:", v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "overrides");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 0;
  if (v8)
    v10 = v7 == 0;
  else
    v10 = 0;
  if (v10)
  {
    v11 = [BLTSectionInfoOverride alloc];
    objc_msgSend(v6, "overrides");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[BLTSectionInfoOverride initWithOverrides:](v11, "initWithOverrides:", v12);

  }
  pthread_mutex_unlock(p_lock);

  return v9;
}

- (BOOL)hasCustomSettingsSetForSectionID:(id)a3
{
  _opaque_pthread_mutex_t *p_lock;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  p_lock = &self->_lock;
  v5 = a3;
  pthread_mutex_lock(p_lock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_sectionInfoListItemsBySectionID, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "phoneSectionID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_sectionInfoListItemsBySectionID, "objectForKeyedSubscript:", v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = v6;
  }
  v9 = v8;
  objc_msgSend(v8, "overrides");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BE0FD20]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  pthread_mutex_unlock(p_lock);
  return v12;
}

- (void)_migrateFromExternalDeviceSwitchToOverrides:(id)a3 sectionID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;

  v19 = a3;
  v6 = a4;
  objc_msgSend(v19, "overrides");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[BLTSectionInfoList _sectionInfoFromSectionID:displayName:](self, "_sectionInfoFromSectionID:displayName:", v6, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8
      && (objc_msgSend(v8, "showsOnExternalDevices") & 1) == 0
      && (objc_msgSend(v9, "suppressFromSettings") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "sectionID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, *MEMORY[0x24BE0FD08]);

      objc_msgSend(v10, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE0FD18]);
      v12 = MEMORY[0x24BDBD1C8];
      objc_msgSend(v10, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE0FD20]);
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, *MEMORY[0x24BE0FD48]);

      objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BE0FD28]);
      v14 = objc_alloc(MEMORY[0x24BE6B2C0]);
      v15 = (void *)objc_msgSend(v14, "initWithDomain:", *MEMORY[0x24BE0FCE0]);
      objc_msgSend(v9, "sectionID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKey:", v10, v16);

      v17 = (id)objc_msgSend(v15, "synchronize");
      objc_msgSend(v9, "sectionID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[BLTSectionInfoList _updateListItem:overrides:sectionID:](self, "_updateListItem:overrides:sectionID:", v19, v10, v18);

    }
  }

}

- (void)reloadBBSection:(id)a3 completion:(id)a4
{
  -[BLTSectionInfoListBBProvider reloadSection:completion:](self->_sectionInfoProvider, "reloadSection:completion:", a3, a4);
}

- (void)mapSection:(id)a3 map:(id)a4
{
  id v6;
  void *v7;
  _opaque_pthread_mutex_t *p_lock;
  BLTSectionInfoListItem *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  objc_msgSend(v6, "mappedSectionID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    p_lock = &self->_lock;
    pthread_mutex_lock(&self->_lock);
    -[NSMutableDictionary objectForKeyedSubscript:](self->_sectionInfoListItemsBySectionID, "objectForKeyedSubscript:", v7);
    v9 = (BLTSectionInfoListItem *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      v9 = objc_alloc_init(BLTSectionInfoListItem);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sectionInfoListItemsBySectionID, "setObject:forKeyedSubscript:", v9, v7);
    }
    -[NSMutableSet addObject:](self->_sectionInfoSectionIDs, "addObject:", v7);
    objc_msgSend(v6, "mappedParentSectionID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLTSectionInfoListItem setOverriddenFactorySectionID:](v9, "setOverriddenFactorySectionID:", v10);

    -[BLTSectionInfoListItem setPhoneSectionID:](v9, "setPhoneSectionID:", v13);
    objc_msgSend(v6, "displayName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLTSectionInfoListItem setOverriddenDisplayName:](v9, "setOverriddenDisplayName:", v11);

    objc_msgSend(v6, "icon");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLTSectionInfoListItem setOverriddenIcon:](v9, "setOverriddenIcon:", v12);

    pthread_mutex_unlock(p_lock);
  }

}

- (BLTSectionInfoListDelegate)delegate
{
  return (BLTSectionInfoListDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BLTSectionInfoListOverrideProvider)overrideProvider
{
  return self->_overrideProvider;
}

- (BLTSectionInfoListBBProvider)sectionInfoProvider
{
  return self->_sectionInfoProvider;
}

- (BOOL)hasLoaded
{
  return self->_loaded;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionInfoProvider, 0);
  objc_storeStrong((id *)&self->_overrideProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_loadingCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_sectionInfoSectionIDs, 0);
  objc_storeStrong((id *)&self->_sectionInfoListItemsBySectionID, 0);
}

void __43__BLTSectionInfoList_reloadWithCompletion___block_invoke_6_cold_1()
{
  __assert_rtn("-[BLTSectionInfoList reloadWithCompletion:]_block_invoke_6", "BLTSectionInfoList.m", 133, "sectionID != nil");
}

- (void)_lock_sectionInfoFromListItem:(uint64_t)a1 sectionID:(NSObject *)a2 displayName:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2173D9000, a2, OS_LOG_TYPE_ERROR, "Requesting section info for unknown section %@", (uint8_t *)&v2, 0xCu);
}

- (void)_lock_sectionInfoFromListItem:(uint64_t)a1 sectionID:(NSObject *)a2 displayName:.cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2173D9000, a2, (os_log_type_t)0x90u, "Section info list item contains ID but BulletinBoard does not have section info for %@", (uint8_t *)&v2, 0xCu);
}

@end

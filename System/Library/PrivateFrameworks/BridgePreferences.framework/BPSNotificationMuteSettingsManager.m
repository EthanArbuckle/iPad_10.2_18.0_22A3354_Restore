@implementation BPSNotificationMuteSettingsManager

+ (id)sharedNotificationMuteSettingsManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __75__BPSNotificationMuteSettingsManager_sharedNotificationMuteSettingsManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedNotificationMuteSettingsManager_onceToken != -1)
    dispatch_once(&sharedNotificationMuteSettingsManager_onceToken, block);
  return (id)sharedNotificationMuteSettingsManager___sharedNotificationMuteSettingsManager;
}

void __75__BPSNotificationMuteSettingsManager_sharedNotificationMuteSettingsManager__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedNotificationMuteSettingsManager___sharedNotificationMuteSettingsManager;
  sharedNotificationMuteSettingsManager___sharedNotificationMuteSettingsManager = (uint64_t)v1;

}

- (BPSNotificationMuteSettingsManager)init
{
  BPSNotificationMuteSettingsManager *v2;
  NPSManager *v3;
  NPSManager *npsManager;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BPSNotificationMuteSettingsManager;
  v2 = -[BPSNotificationMuteSettingsManager init](&v9, sel_init);
  if (v2)
  {
    v3 = (NPSManager *)objc_alloc_init(MEMORY[0x24BE6B2C8]);
    npsManager = v2->_npsManager;
    v2->_npsManager = v3;

    v5 = dispatch_queue_create("com.apple.Bridge.MuteSettingsManager", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    -[BPSNotificationMuteSettingsManager _loadMutedSectionIdentifiers](v2, "_loadMutedSectionIdentifiers");
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)BPSMuteForTodaySectionIdentifiersChanged, CFSTR("BLTMuteForTodaySectionIdentifiersChangedNotification"), 0, (CFNotificationSuspensionBehavior)0);
  }
  return v2;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("BLTMuteForTodaySectionIdentifiersChangedNotification"), 0);
  v4.receiver = self;
  v4.super_class = (Class)BPSNotificationMuteSettingsManager;
  -[BPSNotificationMuteSettingsManager dealloc](&v4, sel_dealloc);
}

- (void)_updateObservers
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("BPSNotificationMuteSettingsMutedForTodayChangedNotification"), 0);

}

- (void)_loadMutedSectionIdentifiers
{
  NSObject *queue;
  _QWORD block[5];

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__BPSNotificationMuteSettingsManager__loadMutedSectionIdentifiers__block_invoke;
  block[3] = &unk_24CBE4838;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __66__BPSNotificationMuteSettingsManager__loadMutedSectionIdentifiers__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6B2C0]), "initWithDomain:", CFSTR("com.apple.nano"));
  v6 = (id)objc_msgSend(v5, "synchronize");
  objc_msgSend(v5, "dictionaryForKey:", CFSTR("MuteForTodaySectionIdentifiers"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v12, "componentsSeparatedByString:", CFSTR("-"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_alloc_init(MEMORY[0x24BDBCE68]);
        objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setDay:", objc_msgSend(v15, "integerValue"));

        objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setMonth:", objc_msgSend(v16, "integerValue"));

        objc_msgSend(v13, "objectAtIndexedSubscript:", 2);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setYear:", objc_msgSend(v17, "integerValue"));

        objc_msgSend(v7, "objectForKeyedSubscript:", v12);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKeyedSubscript:", v19, v14);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

}

- (void)_queue_sync
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NPSManager *npsManager;
  void *v15;
  void *v16;
  NSMutableDictionary *obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6B2C0]), "initWithDomain:", CFSTR("com.apple.nano"));
  v3 = (id)objc_msgSend(v16, "synchronize");
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = self->_mutedSectionIdentifiersForDay;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld-%ld-%ld"), objc_msgSend(v9, "day"), objc_msgSend(v9, "month"), objc_msgSend(v9, "year"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](self->_mutedSectionIdentifiersForDay, "objectForKeyedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "allObjects");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v10);
      }
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }

  if (!objc_msgSend(v4, "count"))
  {

    v4 = 0;
  }
  objc_msgSend(v16, "setObject:forKey:", v4, CFSTR("MuteForTodaySectionIdentifiers"));
  v13 = (id)objc_msgSend(v16, "synchronize");
  npsManager = self->_npsManager;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("MuteForTodaySectionIdentifiers"), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPSManager synchronizeNanoDomain:keys:](npsManager, "synchronizeNanoDomain:keys:", CFSTR("com.apple.nano"), v15);

}

- (id)mutedForTodaySectionIdentifiers
{
  void *v3;
  void *v4;

  _BPSToday();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_mutedSectionIdentifiersForDay, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isMutedForTodaySectionIdentifier:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__BPSNotificationMuteSettingsManager_isMutedForTodaySectionIdentifier___block_invoke;
  block[3] = &unk_24CBE4D50;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(v4) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

void __71__BPSNotificationMuteSettingsManager_isMutedForTodaySectionIdentifier___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "mutedForTodaySectionIdentifiers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 40));

}

- (void)addSectionIdentifiers:(id)a3
{
  id v4;
  NSObject *queue;
  _QWORD block[5];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x2020000000;
    v12 = 0;
    dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __60__BPSNotificationMuteSettingsManager_addSectionIdentifiers___block_invoke;
    block[3] = &unk_24CBE4D78;
    block[4] = self;
    v7 = v4;
    v8 = &v9;
    dispatch_sync(queue, block);
    if (*((_BYTE *)v10 + 24))
      -[BPSNotificationMuteSettingsManager _updateObservers](self, "_updateObservers");

    _Block_object_dispose(&v9, 8);
  }

}

void __60__BPSNotificationMuteSettingsManager_addSectionIdentifiers___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  _BPSToday();
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKeyedSubscript:", v3, v9);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unionSet:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 != v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_queue_sync");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }

}

- (void)removeSectionIdentifiers:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__BPSNotificationMuteSettingsManager_removeSectionIdentifiers___block_invoke;
  block[3] = &unk_24CBE4DA0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

void __63__BPSNotificationMuteSettingsManager_removeSectionIdentifiers___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  _BPSToday();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", v7);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "minusSet:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 != v3)
    objc_msgSend(*(id *)(a1 + 32), "_queue_sync");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_npsManager, 0);
  objc_storeStrong((id *)&self->_mutedSectionIdentifiersForDay, 0);
}

@end

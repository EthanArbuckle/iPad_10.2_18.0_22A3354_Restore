@implementation BLTGizmoLegacyMap

- (BLTGizmoLegacyMap)init
{
  BLTGizmoLegacyMap *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BLTGizmoLegacyMap;
  v2 = -[BLTGizmoLegacyMap init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("BLTGizmoLegacyMap", MEMORY[0x24BDAC9C0]);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)_addMapKey:(id)a3 value:(id)a4 bulletinKey:(id)a5 version:(unint64_t)a6 versionDictionary:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  NSMutableDictionary *phoneBulletinKeyMap;
  NSMutableDictionary *v18;
  NSMutableDictionary *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(v14, "objectForKeyedSubscript:", v22);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if ((!v15 || (int)objc_msgSend(v15, "intValue") > a6)
    && (objc_msgSend(MEMORY[0x24BE6B4A8], "activePairedDeviceSupportIsGreaterEqualVersion:", a6) & 1) == 0)
  {
    phoneBulletinKeyMap = self->_phoneBulletinKeyMap;
    if (!phoneBulletinKeyMap)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v18 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      v19 = self->_phoneBulletinKeyMap;
      self->_phoneBulletinKeyMap = v18;

      phoneBulletinKeyMap = self->_phoneBulletinKeyMap;
    }
    -[NSMutableDictionary objectForKeyedSubscript:](phoneBulletinKeyMap, "objectForKeyedSubscript:", v13);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_phoneBulletinKeyMap, "setObject:forKeyedSubscript:", v20, v13);
    }
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v12, v22);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v21, v22);

  }
}

- (void)mapNotification:(id)a3 sectionID:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  BLTGizmoLegacyMap *v14;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__BLTGizmoLegacyMap_mapNotification_sectionID___block_invoke;
  block[3] = &unk_24D761D70;
  v12 = v6;
  v13 = v7;
  v14 = self;
  v9 = v7;
  v10 = v6;
  dispatch_barrier_async(queue, block);

}

void __47__BLTGizmoLegacyMap_mapNotification_sectionID___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  id v30;
  _QWORD v31[5];
  id v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[BLTBBBulletinKey bulletinKeyWithSectionID:publisherMatchID:](BLTBBBulletinKey, "bulletinKeyWithSectionID:publisherMatchID:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 16), "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    blt_general_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v35 = v5;
      _os_log_impl(&dword_2173D9000, v7, OS_LOG_TYPE_INFO, "Bulletin already mapped: %@", buf, 0xCu);
    }
    goto LABEL_25;
  }
  objc_msgSend(v2, "content");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("BLTWatchLegacyMap"));
  v7 = objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v7;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __47__BLTGizmoLegacyMap_mapNotification_sectionID___block_invoke_5;
    v31[3] = &unk_24D763010;
    v31[4] = *(_QWORD *)(a1 + 48);
    v11 = v5;
    v32 = v11;
    v30 = v10;
    v33 = v30;
    -[NSObject enumerateKeysAndObjectsUsingBlock:](v7, "enumerateKeysAndObjectsUsingBlock:", v31);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 16), "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:");
    v13 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 16), "objectForKeyedSubscript:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("sectionInfo"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:");
    v16 = objc_claimAutoreleasedReturnValue();

    if (!(v13 | v16))
    {
LABEL_20:

      goto LABEL_25;
    }
    if (!*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8))
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(a1 + 48);
      v19 = *(void **)(v18 + 8);
      *(_QWORD *)(v18 + 8) = v17;

    }
    v20 = (void *)v16;
    if (!v16)
    {
      objc_msgSend(v11, "sectionID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (v13)
    {
      +[BLTBBBulletinKey bulletinKeyWithSectionID:publisherMatchID:](BLTBBBulletinKey, "bulletinKeyWithSectionID:publisherMatchID:", v20, v13);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
LABEL_13:
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "objectForKeyedSubscript:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v22)
        {
          objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "setObject:forKeyedSubscript:", v23, v21);

        }
        if (v13)
        {
          objc_msgSend(v11, "publisherMatchID");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "objectForKeyedSubscript:", v21);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setObject:forKeyedSubscript:", v24, CFSTR("publisherBulletinID"));

        }
        if (v16)
        {
          objc_msgSend(v11, "sectionID");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "objectForKeyedSubscript:", v21);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setObject:forKeyedSubscript:", v26, CFSTR("sectionID"));

        }
        goto LABEL_20;
      }
    }
    else
    {
      objc_msgSend(v11, "publisherMatchID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      +[BLTBBBulletinKey bulletinKeyWithSectionID:publisherMatchID:](BLTBBBulletinKey, "bulletinKeyWithSectionID:publisherMatchID:", v20, v29);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
        goto LABEL_13;
    }

    goto LABEL_13;
  }
  if (v7)
  {
    blt_general_log();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      __47__BLTGizmoLegacyMap_mapNotification_sectionID___block_invoke_cold_1((uint64_t)v7, v28);

  }
LABEL_25:

}

void __47__BLTGizmoLegacyMap_mapNotification_sectionID___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t v15;

  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = objc_msgSend(v5, "unsignedIntegerValue");
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (objc_msgSend(MEMORY[0x24BE6B4A8], "versionForString:", v5),
          (v8 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      blt_general_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        __47__BLTGizmoLegacyMap_mapNotification_sectionID___block_invoke_5_cold_2();
      goto LABEL_14;
    }
    v9 = v8;
    v7 = objc_msgSend(v8, "unsignedIntegerValue");

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __47__BLTGizmoLegacyMap_mapNotification_sectionID___block_invoke_2;
      v12[3] = &unk_24D762FE8;
      v11 = *(void **)(a1 + 40);
      v12[4] = *(_QWORD *)(a1 + 32);
      v13 = v11;
      v15 = v7;
      v14 = *(id *)(a1 + 48);
      objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v12);

      goto LABEL_15;
    }
    blt_general_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __47__BLTGizmoLegacyMap_mapNotification_sectionID___block_invoke_5_cold_1((uint64_t)v5, (uint64_t)v6, v10);
LABEL_14:

    goto LABEL_15;
  }
  objc_msgSend(*(id *)(a1 + 32), "_addMapKey:value:bulletinKey:version:versionDictionary:", CFSTR("publisherBulletinID"), v6, *(_QWORD *)(a1 + 40), v7, *(_QWORD *)(a1 + 48));
LABEL_15:

}

void __47__BLTGizmoLegacyMap_mapNotification_sectionID___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  char isKindOfClass;
  char v13;
  NSObject *v14;

  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_7;
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (v7 == v6
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {

      goto LABEL_7;
    }
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
LABEL_7:
      v8 = v5;
      if (BLTGizmoLegacyMapKeySet_onceToken != -1)
        dispatch_once(&BLTGizmoLegacyMapKeySet_onceToken, &__block_literal_global_14);
      if (!objc_msgSend((id)BLTGizmoLegacyMapKeySet___BLTGizmoLegacyMapKeySet, "containsObject:", v8))
      {
        blt_general_log();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          __47__BLTGizmoLegacyMap_mapNotification_sectionID___block_invoke_2_cold_2();
        goto LABEL_22;
      }
      v9 = v6;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = v9;
        if (-[NSObject count](v10, "count"))
          -[NSObject objectAtIndexedSubscript:](v10, "objectAtIndexedSubscript:", 0);
        else
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v9 = objc_claimAutoreleasedReturnValue();

      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v11 = objc_claimAutoreleasedReturnValue();
        if (v9 == v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {

        }
        else
        {
          objc_opt_class();
          v13 = objc_opt_isKindOfClass();

          if ((v13 & 1) == 0)
          {
            blt_general_log();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
              __47__BLTGizmoLegacyMap_mapNotification_sectionID___block_invoke_2_cold_1();

            goto LABEL_22;
          }
        }
      }
      objc_msgSend(*(id *)(a1 + 32), "_addMapKey:value:bulletinKey:version:versionDictionary:", v8, v9, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
LABEL_22:

      goto LABEL_26;
    }
  }
  blt_general_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    __47__BLTGizmoLegacyMap_mapNotification_sectionID___block_invoke_2_cold_3();
LABEL_26:

}

- (void)unmapNotification:(id)a3 sectionID:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  BLTGizmoLegacyMap *v14;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__BLTGizmoLegacyMap_unmapNotification_sectionID___block_invoke;
  block[3] = &unk_24D761D70;
  v12 = v7;
  v13 = v6;
  v14 = self;
  v9 = v6;
  v10 = v7;
  dispatch_barrier_async(queue, block);

}

void __49__BLTGizmoLegacyMap_unmapNotification_sectionID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[BLTBBBulletinKey bulletinKeyWithSectionID:publisherMatchID:](BLTBBBulletinKey, "bulletinKeyWithSectionID:publisherMatchID:", v2, v4);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 16), "objectForKeyedSubscript:", v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("publisherBulletinID"));
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("sectionInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("sectionID"));
  v8 = objc_claimAutoreleasedReturnValue();

  if (v6 | v8)
  {
    v9 = (void *)v8;
    if (v8)
    {
      if (v6)
        goto LABEL_4;
    }
    else
    {
      objc_msgSend(v12, "sectionID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
LABEL_4:
        +[BLTBBBulletinKey bulletinKeyWithSectionID:publisherMatchID:](BLTBBBulletinKey, "bulletinKeyWithSectionID:publisherMatchID:", v9, v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
LABEL_6:
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "removeObjectForKey:", v10);

          goto LABEL_7;
        }
LABEL_5:

        goto LABEL_6;
      }
    }
    objc_msgSend(v12, "publisherMatchID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[BLTBBBulletinKey bulletinKeyWithSectionID:publisherMatchID:](BLTBBBulletinKey, "bulletinKeyWithSectionID:publisherMatchID:", v9, v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_7:
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 16), "removeObjectForKey:", v12);

}

- (id)categoryIDForBulletinKey:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  void *v7;
  id v8;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v5 = v4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__5;
  v17 = __Block_byref_object_dispose__5;
  v18 = 0;
  if (v4)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __46__BLTGizmoLegacyMap_categoryIDForBulletinKey___block_invoke;
    block[3] = &unk_24D761A80;
    v12 = &v13;
    block[4] = self;
    v11 = v4;
    dispatch_sync(queue, block);

    v7 = (void *)v14[5];
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __46__BLTGizmoLegacyMap_categoryIDForBulletinKey___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1[4] + 16), "objectForKeyedSubscript:", a1[5]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("categoryID"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)sectionSubtypeForBulletinKey:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD block[5];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v4 = a3;
  v5 = v4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__5;
  v20 = __Block_byref_object_dispose__5;
  v21 = 0;
  if (v4)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __50__BLTGizmoLegacyMap_sectionSubtypeForBulletinKey___block_invoke;
    block[3] = &unk_24D761A80;
    v15 = &v16;
    block[4] = self;
    v14 = v4;
    dispatch_sync(queue, block);
    if (v17[5])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend((id)v17[5], "integerValue"));
          v7 = objc_claimAutoreleasedReturnValue();
          v8 = (void *)v17[5];
          v17[5] = v7;
        }
        else
        {
          blt_general_log();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
            -[BLTGizmoLegacyMap sectionSubtypeForBulletinKey:].cold.1();

          v8 = (void *)v17[5];
          v17[5] = 0;
        }

      }
    }

    v9 = (void *)v17[5];
  }
  else
  {
    v9 = 0;
  }
  v11 = v9;
  _Block_object_dispose(&v16, 8);

  return v11;
}

void __50__BLTGizmoLegacyMap_sectionSubtypeForBulletinKey___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1[4] + 16), "objectForKeyedSubscript:", a1[5]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("sectionSubtype"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)phonePublisherBulletinIDForGizmoKey:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  void *v7;
  id v8;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v5 = v4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__5;
  v17 = __Block_byref_object_dispose__5;
  v18 = 0;
  if (v4)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __57__BLTGizmoLegacyMap_phonePublisherBulletinIDForGizmoKey___block_invoke;
    block[3] = &unk_24D761A80;
    v12 = &v13;
    block[4] = self;
    v11 = v4;
    dispatch_sync(queue, block);

    v7 = (void *)v14[5];
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __57__BLTGizmoLegacyMap_phonePublisherBulletinIDForGizmoKey___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("publisherBulletinID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "publisherMatchID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v3);
  if (!v2)

}

- (id)gizmoPublisherBulletinIDForPhoneKey:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  void *v7;
  id v8;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v5 = v4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__5;
  v17 = __Block_byref_object_dispose__5;
  v18 = 0;
  if (v4)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __57__BLTGizmoLegacyMap_gizmoPublisherBulletinIDForPhoneKey___block_invoke;
    block[3] = &unk_24D761A80;
    v12 = &v13;
    block[4] = self;
    v11 = v4;
    dispatch_sync(queue, block);

    v7 = (void *)v14[5];
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __57__BLTGizmoLegacyMap_gizmoPublisherBulletinIDForPhoneKey___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("publisherBulletinID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "publisherMatchID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v3);
  if (!v2)

}

- (id)phoneSectionIDForGizmoKey:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  void *v7;
  id v8;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v5 = v4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__5;
  v17 = __Block_byref_object_dispose__5;
  v18 = 0;
  if (v4)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __47__BLTGizmoLegacyMap_phoneSectionIDForGizmoKey___block_invoke;
    block[3] = &unk_24D761A80;
    v12 = &v13;
    block[4] = self;
    v11 = v4;
    dispatch_sync(queue, block);

    v7 = (void *)v14[5];
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __47__BLTGizmoLegacyMap_phoneSectionIDForGizmoKey___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sectionID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "sectionID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v3);
  if (!v2)

}

- (id)gizmoSectionInfoForPhoneKey:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  void *v7;
  id v8;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v5 = v4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__5;
  v17 = __Block_byref_object_dispose__5;
  v18 = 0;
  if (v4)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __49__BLTGizmoLegacyMap_gizmoSectionInfoForPhoneKey___block_invoke;
    block[3] = &unk_24D761A80;
    v12 = &v13;
    block[4] = self;
    v11 = v4;
    dispatch_sync(queue, block);

    v7 = (void *)v14[5];
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __49__BLTGizmoLegacyMap_gizmoSectionInfoForPhoneKey___block_invoke(_QWORD *a1)
{
  BLTGizmoLegacyMapSectionInfo *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = [BLTGizmoLegacyMapSectionInfo alloc];
  objc_msgSend(*(id *)(a1[4] + 16), "objectForKeyedSubscript:", a1[5]);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("sectionInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[BLTGizmoLegacyMapSectionInfo initWithNotificationMap:](v2, "initWithNotificationMap:", v3);
  v5 = *(_QWORD *)(a1[6] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_phoneBulletinKeyMap, 0);
  objc_storeStrong((id *)&self->_gizmoBulletinKeyMap, 0);
}

void __47__BLTGizmoLegacyMap_mapNotification_sectionID___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  OUTLINED_FUNCTION_2_1();
  v4 = v3;
  OUTLINED_FUNCTION_0_3(&dword_2173D9000, a2, v5, "Expecting dictionary type for legacy map, got legacy map type %@", v6);

  OUTLINED_FUNCTION_5_0();
}

void __47__BLTGizmoLegacyMap_mapNotification_sectionID___block_invoke_5_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  id v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = (id)objc_opt_class();
  v4 = v9;
  OUTLINED_FUNCTION_2_0(&dword_2173D9000, a3, v5, "Unexpected value type in legacy map for version key %@, value type %@", (uint8_t *)&v6);

  OUTLINED_FUNCTION_5_0();
}

void __47__BLTGizmoLegacyMap_mapNotification_sectionID___block_invoke_5_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_2173D9000, v0, v1, "Expecting string or number type for version key in legacy map, got key %@", v2);
  OUTLINED_FUNCTION_5();
}

void __47__BLTGizmoLegacyMap_mapNotification_sectionID___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_0(&dword_2173D9000, v0, (uint64_t)v0, "Expecting string, number, or dictionary type values for value in legacy map dictionary, got key %@ value %@", v1);
  OUTLINED_FUNCTION_5();
}

void __47__BLTGizmoLegacyMap_mapNotification_sectionID___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_2173D9000, v0, v1, "Unknown legacy map key %@", v2);
  OUTLINED_FUNCTION_5();
}

void __47__BLTGizmoLegacyMap_mapNotification_sectionID___block_invoke_2_cold_3()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_0(&dword_2173D9000, v0, (uint64_t)v0, "Expecting string type values for key and string, array, number, or dictionary type for value in legacy map dictionary, got key %@ value %@", v1);
  OUTLINED_FUNCTION_5();
}

- (void)sectionSubtypeForBulletinKey:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_2173D9000, v0, v1, "Expecting number or string type for sectionSubtype in legacy map for %@", v2);
  OUTLINED_FUNCTION_5();
}

@end

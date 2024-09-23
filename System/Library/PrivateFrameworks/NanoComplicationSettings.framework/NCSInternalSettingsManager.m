@implementation NCSInternalSettingsManager

- (NCSInternalSettingsManager)init
{
  NCSInternalSettingsManager *v2;
  NPSManager *v3;
  NPSManager *syncManager;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NCSInternalSettingsManager;
  v2 = -[NCSInternalSettingsManager init](&v8, sel_init);
  if (v2)
  {
    v3 = (NPSManager *)objc_alloc_init(MEMORY[0x24BE6B2C8]);
    syncManager = v2->_syncManager;
    v2->_syncManager = v3;

    v5 = dispatch_queue_create("com.apple.nanocomplicationsettings.internalsettingsmanager", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

- (NSString)selectedComplicationIdentifier
{
  NSString *selectedComplicationIdentifier;
  void *v4;
  id v5;
  NSString *v6;
  NSString *v7;

  selectedComplicationIdentifier = self->_selectedComplicationIdentifier;
  if (!selectedComplicationIdentifier)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6B2C0]), "initWithDomain:", CFSTR("com.apple.nano-complications"));
    v5 = (id)objc_msgSend(v4, "synchronize");
    objc_msgSend(v4, "stringForKey:", CFSTR("SelectedComplicationIdentifier"));
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    v7 = self->_selectedComplicationIdentifier;
    self->_selectedComplicationIdentifier = v6;

    selectedComplicationIdentifier = self->_selectedComplicationIdentifier;
  }
  return selectedComplicationIdentifier;
}

- (void)setSelectedComplicationIdentifier:(id)a3
{
  NSString *v4;
  NSString *selectedComplicationIdentifier;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  if (!-[NSString isEqualToString:](self->_selectedComplicationIdentifier, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v9, "copy");
    selectedComplicationIdentifier = self->_selectedComplicationIdentifier;
    self->_selectedComplicationIdentifier = v4;

    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6B2C0]), "initWithDomain:", CFSTR("com.apple.nano-complications"));
    objc_msgSend(v6, "setObject:forKey:", self->_selectedComplicationIdentifier, CFSTR("SelectedComplicationIdentifier"));
    v7 = (id)objc_msgSend(v6, "synchronize");
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("SelectedComplicationIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPSManager synchronizeNanoDomain:keys:](self->_syncManager, "synchronizeNanoDomain:keys:", CFSTR("com.apple.nano-complications"), v8);

  }
}

- (BOOL)hasSettings
{
  NCSInternalSettingsManager *v2;
  NSObject *queue;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = v2->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __41__NCSInternalSettingsManager_hasSettings__block_invoke;
  v5[3] = &unk_24F7E9AB0;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __41__NCSInternalSettingsManager_hasSettings__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result != 0;
  return result;
}

- (void)addComplicationDefinition:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__NCSInternalSettingsManager_addComplicationDefinition___block_invoke;
  v7[3] = &unk_24F7E9AD8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __56__NCSInternalSettingsManager_addComplicationDefinition___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)removeComplicationDefinitionsInArray:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __67__NCSInternalSettingsManager_removeComplicationDefinitionsInArray___block_invoke;
  v7[3] = &unk_24F7E9AD8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __67__NCSInternalSettingsManager_removeComplicationDefinitionsInArray___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObjectsInArray:", *(_QWORD *)(a1 + 40));
}

- (void)enumerateComplicationDefinitionsUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __73__NCSInternalSettingsManager_enumerateComplicationDefinitionsUsingBlock___block_invoke;
  v6[3] = &unk_24F7E9B00;
  v7 = v4;
  v5 = v4;
  -[NCSInternalSettingsManager enumerateAllComplicationDefinitionsUsingBlock:](self, "enumerateAllComplicationDefinitionsUsingBlock:", v6);

}

void __73__NCSInternalSettingsManager_enumerateComplicationDefinitionsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "isInstalled"))
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)enumerateAllComplicationDefinitionsUsingBlock:(id)a3
{
  id v4;
  NSObject *queue;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD block[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  queue = self->_queue;
  v6 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __76__NCSInternalSettingsManager_enumerateAllComplicationDefinitionsUsingBlock___block_invoke;
  block[3] = &unk_24F7E9AB0;
  block[4] = self;
  block[5] = &v12;
  dispatch_sync(queue, block);
  v7 = (void *)v13[5];
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __76__NCSInternalSettingsManager_enumerateAllComplicationDefinitionsUsingBlock___block_invoke_2;
  v9[3] = &unk_24F7E9B00;
  v8 = v4;
  v10 = v8;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v9);

  _Block_object_dispose(&v12, 8);
}

void __76__NCSInternalSettingsManager_enumerateAllComplicationDefinitionsUsingBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __76__NCSInternalSettingsManager_enumerateAllComplicationDefinitionsUsingBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)moveComplicationDefinitionFromIndex:(unint64_t)a3 toIndex:(unint64_t)a4
{
  NSObject *queue;
  _QWORD block[7];

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__NCSInternalSettingsManager_moveComplicationDefinitionFromIndex_toIndex___block_invoke;
  block[3] = &unk_24F7E9B28;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(queue, block);
}

void __74__NCSInternalSettingsManager_moveComplicationDefinitionFromIndex_toIndex___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObjectAtIndex:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "insertObject:atIndex:", v2, *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "_saveSettings");

}

- (id)complicationDefinitionForAppBundleIdentifier:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __75__NCSInternalSettingsManager_complicationDefinitionForAppBundleIdentifier___block_invoke;
  v8[3] = &unk_24F7E9B50;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  -[NCSInternalSettingsManager enumerateAllComplicationDefinitionsUsingBlock:](self, "enumerateAllComplicationDefinitionsUsingBlock:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __75__NCSInternalSettingsManager_complicationDefinitionForAppBundleIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "appBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (id)complicationDefinitionForComplicationIdentifier:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __78__NCSInternalSettingsManager_complicationDefinitionForComplicationIdentifier___block_invoke;
  v8[3] = &unk_24F7E9B50;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  -[NCSInternalSettingsManager enumerateAllComplicationDefinitionsUsingBlock:](self, "enumerateAllComplicationDefinitionsUsingBlock:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __78__NCSInternalSettingsManager_complicationDefinitionForComplicationIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "complicationIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (id)complicationDefinitionForWatchKitIdentifier:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __74__NCSInternalSettingsManager_complicationDefinitionForWatchKitIdentifier___block_invoke;
  v8[3] = &unk_24F7E9B50;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  -[NCSInternalSettingsManager enumerateAllComplicationDefinitionsUsingBlock:](self, "enumerateAllComplicationDefinitionsUsingBlock:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __74__NCSInternalSettingsManager_complicationDefinitionForWatchKitIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "sockPuppetIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (void)saveSettings
{
  NSObject *queue;
  _QWORD block[5];

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__NCSInternalSettingsManager_saveSettings__block_invoke;
  block[3] = &unk_24F7E9B78;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __42__NCSInternalSettingsManager_saveSettings__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_saveSettings");
}

- (void)_saveSettings
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[NSMutableArray count](self->_complicationDefinitions, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = self->_complicationDefinitions;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithComplication:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8), (_QWORD)v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  if (!-[NSArray isEqualToArray:](self->_storedSettings, "isEqualToArray:", v3))
  {
    objc_storeStrong((id *)&self->_storedSettings, v3);
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6B2C0]), "initWithDomain:", CFSTR("com.apple.nano-complications"));
    objc_msgSend(v10, "setObject:forKey:", v3, CFSTR("ComplicationDefinitions"));
    v11 = (id)objc_msgSend(v10, "synchronize");
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("ComplicationDefinitions"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPSManager synchronizeNanoDomain:keys:](self->_syncManager, "synchronizeNanoDomain:keys:", CFSTR("com.apple.nano-complications"), v12);

  }
}

- (id)complicationIdentifierForComplicationDefinitionAtIndex:(unint64_t)a3
{
  NSObject *queue;
  void *v6;
  _QWORD block[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __85__NCSInternalSettingsManager_complicationIdentifierForComplicationDefinitionAtIndex___block_invoke;
  block[3] = &unk_24F7E9BA0;
  block[4] = self;
  block[5] = &v9;
  block[6] = a3;
  dispatch_sync(queue, block);
  objc_msgSend((id)v10[5], "complicationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __85__NCSInternalSettingsManager_complicationIdentifierForComplicationDefinitionAtIndex___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 8), "objectAtIndexedSubscript:", a1[6]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[5] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)loadSettings
{
  NSObject *queue;
  _QWORD block[5];

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__NCSInternalSettingsManager_loadSettings__block_invoke;
  block[3] = &unk_24F7E9B78;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __42__NCSInternalSettingsManager_loadSettings__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  NCSComplication *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6B2C0]), "initWithDomain:", CFSTR("com.apple.nano-complications"));
  v3 = (id)objc_msgSend(v2, "synchronize");
  objc_msgSend(v2, "arrayForKey:", CFSTR("ComplicationDefinitions"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v4;

  objc_msgSend(v2, "stringForKey:", CFSTR("SelectedComplicationIdentifier"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 32);
  *(_QWORD *)(v8 + 32) = v7;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(v11 + 8);
  *(_QWORD *)(v11 + 8) = v10;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v26 != v16)
          objc_enumerationMutation(obj);
        v18 = -[NCSComplication initWithDictionary:]([NCSComplication alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i));
        objc_msgSend(*(id *)(a1 + 32), "_localizedNameForComplication:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
          -[NCSComplication setName:](v18, "setName:", v19);
        -[NCSComplication sockPuppetIdentifier](v18, "sockPuppetIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v20)
          goto LABEL_10;
        -[NCSComplication sockPuppetIdentifier](v18, "sockPuppetIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        -[NCSComplication sockPuppetIdentifier](v18, "sockPuppetIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v18, v23);

        if (!v22)
LABEL_10:
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addObject:", v18);

      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v15);
  }

}

- (unint64_t)_numberOfActiveComplications
{
  unint64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __58__NCSInternalSettingsManager__numberOfActiveComplications__block_invoke;
  v5[3] = &unk_24F7E9BC8;
  v5[4] = &v6;
  -[NCSInternalSettingsManager enumerateComplicationDefinitionsUsingBlock:](self, "enumerateComplicationDefinitionsUsingBlock:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __58__NCSInternalSettingsManager__numberOfActiveComplications__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "isActive");
  if ((_DWORD)result)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

- (id)_localizedNameForComplication:(id)a3
{
  return 0;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_selectedComplicationIdentifier, 0);
  objc_storeStrong((id *)&self->_storedSettings, 0);
  objc_storeStrong((id *)&self->_syncManager, 0);
  objc_storeStrong((id *)&self->_complicationDefinitions, 0);
}

@end

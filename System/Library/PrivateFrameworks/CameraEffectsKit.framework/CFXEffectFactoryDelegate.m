@implementation CFXEffectFactoryDelegate

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_13);
  return (id)sharedInstance_sInstance;
}

void __42__CFXEffectFactoryDelegate_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_sInstance;
  sharedInstance_sInstance = v0;

}

- (void)effectFactory:(id)a3 effectIDsAvailableForType:(int)a4 completion:(id)a5
{
  uint64_t v6;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void (**v12)(id, uint64_t);
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[5];
  _QWORD v19[6];

  v6 = *(_QWORD *)&a4;
  v19[5] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = *MEMORY[0x24BE79558];
  v18[0] = &unk_24EE9BB40;
  v18[1] = &unk_24EE9BB58;
  v10 = *MEMORY[0x24BE79568];
  v19[0] = v9;
  v19[1] = v10;
  v18[2] = &unk_24EE9BB70;
  v18[3] = &unk_24EE9BB88;
  v19[2] = v10;
  v19[3] = v10;
  v18[4] = &unk_24EE9BBA0;
  v19[4] = v9;
  v11 = (void *)MEMORY[0x24BDBCE70];
  v12 = (void (**)(id, uint64_t))a5;
  objc_msgSend(v11, "dictionaryWithObjects:forKeys:count:", v19, v18, 5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if ((_DWORD)v6 == 7)
  {
    -[CFXEffectFactoryDelegate CFX_animojiEffectsWithFactory:](self, "CFX_animojiEffectsWithFactory:", v8);
    v16 = objc_claimAutoreleasedReturnValue();
  }
  else if ((_DWORD)v6 == 2)
  {
    -[CFXEffectFactoryDelegate CFX_overlayEffectsWithFactory:](self, "CFX_overlayEffectsWithFactory:", v8);
    v16 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((_DWORD)v6 == 1)
      -[CFXEffectFactoryDelegate CFX_filterEffectsWithFactory:](self, "CFX_filterEffectsWithFactory:", v8);
    else
      objc_msgSend(MEMORY[0x24BE79010], "registeredEffectIDsForEffectType:", v15);
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v17 = (void *)v16;
  v12[2](v12, v16);

}

- (id)effectFactory:(id)a3 createEffectContentDataSourceForEffectID:(id)a4 ofType:(int)a5
{
  id v5;
  CFXFilterEffectContentDataSource *v6;

  if (a5 == 1)
  {
    v5 = a4;
    v6 = -[CFXFilterEffectContentDataSource initWithEffectID:]([CFXFilterEffectContentDataSource alloc], "initWithEffectID:", v5);

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)CFX_animojiEffectsWithFactory:(id)a3
{
  return +[JFXAnimojiEffect animojiIDs](JFXAnimojiEffect, "animojiIDs", a3);
}

- (id)CFX_filterEffectsWithFactory:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  dispatch_semaphore_t v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void *v22;
  CFXEffectFactoryDelegate *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[4];
  NSObject *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLForKey:", CFSTR("showAllRegisteredFilters"));

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BE79010], "registeredEffectIDsForEffectType:", *MEMORY[0x24BE79558]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = dispatch_semaphore_create(0);
    v32 = 0;
    v33 = &v32;
    v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__7;
    v36 = __Block_byref_object_dispose__7;
    v9 = MEMORY[0x24BDAC760];
    v37 = 0;
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __57__CFXEffectFactoryDelegate_CFX_filterEffectsWithFactory___block_invoke;
    v29[3] = &unk_24EE58A68;
    v31 = &v32;
    v10 = v8;
    v30 = v10;
    objc_msgSend(v4, "effectCategoriesForType:completion:", 1, v29);
    dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
    v7 = (void *)objc_opt_new();
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v11 = (id)v33[5];
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v38, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v26;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v26 != v13)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v14), "effectIDs");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObjectsFromArray:", v15);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v38, 16);
      }
      while (v12);
    }

    if (-[CFXEffectFactoryDelegate CFX_disableExpensiveFilters](self, "CFX_disableExpensiveFilters"))
    {
      v16 = (void *)MEMORY[0x24BDD1758];
      v19 = v9;
      v20 = 3221225472;
      v21 = __57__CFXEffectFactoryDelegate_CFX_filterEffectsWithFactory___block_invoke_2;
      v22 = &unk_24EE58A90;
      v23 = self;
      v24 = v4;
      objc_msgSend(v16, "predicateWithBlock:", &v19);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "filterUsingPredicate:", v17, v19, v20, v21, v22, v23);

    }
    _Block_object_dispose(&v32, 8);

  }
  return v7;
}

void __57__CFXEffectFactoryDelegate_CFX_filterEffectsWithFactory___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

uint64_t __57__CFXEffectFactoryDelegate_CFX_filterEffectsWithFactory___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "CFX_isExpensiveEffectID:withFactory:", a2, *(_QWORD *)(a1 + 40)) ^ 1;
}

- (id)CFX_overlayEffectsWithFactory:(id)a3
{
  id v3;
  dispatch_semaphore_t v4;
  NSObject *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD v17[4];
  NSObject *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = dispatch_semaphore_create(0);
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__7;
  v24 = __Block_byref_object_dispose__7;
  v25 = 0;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __58__CFXEffectFactoryDelegate_CFX_overlayEffectsWithFactory___block_invoke;
  v17[3] = &unk_24EE58A68;
  v19 = &v20;
  v5 = v4;
  v18 = v5;
  objc_msgSend(v3, "effectCategoriesForType:completion:", 2, v17);
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  v6 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = (id)v21[5];
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v26, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "effectIDs", (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObjectsFromArray:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v26, 16);
    }
    while (v8);
  }

  _Block_object_dispose(&v20, 8);
  return v6;
}

void __58__CFXEffectFactoryDelegate_CFX_overlayEffectsWithFactory___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (BOOL)CFX_isExpensiveEffectID:(id)a3 withFactory:(id)a4
{
  id v4;
  char v5;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE79278]) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE79280]) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE79288]) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE79270]) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE79268]);
  }

  return v5;
}

- (BOOL)CFX_disableExpensiveFilters
{
  if (CFX_disableExpensiveFilters_onceToken != -1)
    dispatch_once(&CFX_disableExpensiveFilters_onceToken, &__block_literal_global_17);
  return CFX_disableExpensiveFilters_disable;
}

void __55__CFXEffectFactoryDelegate_CFX_disableExpensiveFilters__block_invoke()
{
  char v0;
  BOOL v4;
  void *v5;
  uint64_t v6;
  size_t v7;
  int v8;

  v8 = 0;
  v7 = 4;
  sysctlbyname("hw.cpufamily", &v8, &v7, 0, 0);
  v0 = 1;
  if (v8 <= 747742333)
  {
    if (v8 == -1829029944 || v8 == -1471079478 || v8 == 506291073)
      goto LABEL_18;
    goto LABEL_17;
  }
  if (v8 == 747742334 || v8 == 933271106)
    goto LABEL_18;
  if (v8 != 1741614739
    || (v4 = +[CFXBundleUtils isRunningMessagesExtension](CFXBundleUtils, "isRunningMessagesExtension"),
        (CFX_disableExpensiveFilters_disable = !v4) != 0)
    && (objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "jfx_memorySize"),
        v5,
        v6 > 3670016000))
  {
LABEL_17:
    v0 = 0;
LABEL_18:
    CFX_disableExpensiveFilters_disable = v0;
  }
}

- (Class)JFXEffectClassForType:(int)a3
{
  if (a3 == 1 || a3 == 7 || a3 == 2)
    return (Class)(id)objc_opt_class();
  else
    return (Class)0;
}

- (BOOL)CFX_enoughPowerForStyleTransfer
{
  if (CFX_enoughPowerForStyleTransfer_onceToken != -1)
    dispatch_once(&CFX_enoughPowerForStyleTransfer_onceToken, &__block_literal_global_23);
  return CFX_enoughPowerForStyleTransfer_enough;
}

void __59__CFXEffectFactoryDelegate_CFX_enoughPowerForStyleTransfer__block_invoke()
{
  BOOL v2;
  void *v3;
  int v4;
  size_t v5;
  int v6;

  v6 = 0;
  v5 = 4;
  sysctlbyname("hw.cpufamily", &v6, &v5, 0, 0);
  v2 = v6 != -1829029944 && v6 != 747742334 && v6 != 933271106;
  CFX_enoughPowerForStyleTransfer_enough = v2;
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("forceStyleTransferFiltersOn"));

  if (v4)
    CFX_enoughPowerForStyleTransfer_enough = 1;
}

@end

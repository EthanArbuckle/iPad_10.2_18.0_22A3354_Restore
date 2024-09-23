@implementation CFXEffectComposition

- (CFXEffectComposition)init
{
  CFXEffectComposition *v2;
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  id v7;
  const char *v8;
  dispatch_queue_t v9;
  NSMutableArray *v10;
  NSMutableArray *filters;
  NSMutableArray *v12;
  NSMutableArray *overlays;
  NSMutableArray *v14;
  NSMutableArray *animojis;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CFXEffectComposition;
  v2 = -[CFXEffectComposition init](&v17, sel_init);
  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("com.apple.%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_retainAutorelease(v6);
  v8 = (const char *)objc_msgSend(v7, "UTF8String");
  v9 = dispatch_queue_create(v8, MEMORY[0x24BDAC9C0]);
  -[CFXEffectComposition setConcurrentQueue:](v2, "setConcurrentQueue:", v9);

  v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  filters = v2->_filters;
  v2->_filters = v10;

  v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  overlays = v2->_overlays;
  v2->_overlays = v12;

  v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  animojis = v2->_animojis;
  v2->_animojis = v14;

  return v2;
}

- (unint64_t)count
{
  NSObject *v3;
  unint64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[CFXEffectComposition concurrentQueue](self, "concurrentQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __29__CFXEffectComposition_count__block_invoke;
  v6[3] = &unk_24EE57A80;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __29__CFXEffectComposition_count__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "filters");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v6, "count");
  objc_msgSend(*(id *)(a1 + 32), "overlays");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") + v2;
  objc_msgSend(*(id *)(a1 + 32), "animojis");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4 + objc_msgSend(v5, "count");

}

- (BOOL)isEmpty
{
  return -[CFXEffectComposition count](self, "count") == 0;
}

- (BOOL)hasEffectOfType:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[CFXEffectComposition concurrentQueue](self, "concurrentQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__CFXEffectComposition_hasEffectOfType___block_invoke;
  block[3] = &unk_24EE58190;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

void __40__CFXEffectComposition_hasEffectOfType___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "CFX_effectsForJettyType:", objc_msgSend(*(id *)(a1 + 40), "jtEffectType"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "count") != 0;

}

- (BOOL)hasFaceTrackedOverlays
{
  CFXEffectComposition *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[CFXEffectComposition concurrentQueue](self, "concurrentQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __46__CFXEffectComposition_hasFaceTrackedOverlays__block_invoke;
  v5[3] = &unk_24EE58380;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __46__CFXEffectComposition_hasFaceTrackedOverlays__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "overlays", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "jtEffect");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "trackingProps");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "trackingType");

        if ((unint64_t)(v9 - 3) >= 0xFFFFFFFFFFFFFFFELL)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;

          goto LABEL_11;
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

}

- (BOOL)requiresFaceTracking
{
  void *v3;
  BOOL v4;
  void *v5;

  -[CFXEffectComposition overlays](self, "overlays");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = 1;
  }
  else
  {
    -[CFXEffectComposition animojis](self, "animojis");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "count") != 0;

  }
  return v4;
}

- (id)CFX_effectsForJettyType:(int)a3
{
  void *v3;

  switch(a3)
  {
    case 7:
      -[CFXEffectComposition animojis](self, "animojis");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      -[CFXEffectComposition overlays](self, "overlays");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      -[CFXEffectComposition filters](self, "filters");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v3 = 0;
      break;
  }
  return v3;
}

- (NSArray)effects
{
  id v3;
  NSObject *v4;
  id v5;
  NSArray *v6;
  _QWORD v8[4];
  id v9;
  CFXEffectComposition *v10;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[CFXEffectComposition concurrentQueue](self, "concurrentQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __31__CFXEffectComposition_effects__block_invoke;
  v8[3] = &unk_24EE57AA8;
  v5 = v3;
  v9 = v5;
  v10 = self;
  dispatch_sync(v4, v8);

  v6 = (NSArray *)v5;
  return v6;
}

void __31__CFXEffectComposition_effects__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "CFX_effectsForJettyType:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "CFX_effectsForJettyType:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v5);

  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "CFX_effectsForJettyType:", 7);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v7);

}

- (void)addEffect:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  CFXEffectComposition *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[CFXEffectComposition concurrentQueue](self, "concurrentQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__CFXEffectComposition_addEffect_completion___block_invoke;
  block[3] = &unk_24EE580F0;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_barrier_async(v8, block);

}

void __45__CFXEffectComposition_addEffect_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "jtEffect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "type");

  objc_msgSend(*(id *)(a1 + 40), "CFX_effectsForJettyType:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    if ((_DWORD)v3 == 7 || (_DWORD)v3 == 1)
    {
      objc_msgSend(v4, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeAllObjects");
      if (v7)
      {
        JFXLog_effects();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v7, "jtEffect");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromJFXEffectType(objc_msgSend(v9, "type"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "localizedTitle");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = 138543618;
          v19 = v10;
          v20 = 2114;
          v21 = v11;
          _os_log_impl(&dword_2269A9000, v8, OS_LOG_TYPE_DEFAULT, "Removed effect - type: %{public}@, name: %{public}@", (uint8_t *)&v18, 0x16u);

        }
      }

    }
    if ((objc_msgSend(*(id *)(a1 + 32), "isNone") & 1) == 0)
    {
      objc_msgSend(v5, "addObject:", *(_QWORD *)(a1 + 32));
      JFXLog_effects();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromJFXEffectType(v3);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "localizedTitle");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543618;
        v19 = v13;
        v20 = 2114;
        v21 = v14;
        _os_log_impl(&dword_2269A9000, v12, OS_LOG_TYPE_DEFAULT, "Added effect - type: %{public}@, name: %{public}@", (uint8_t *)&v18, 0x16u);

      }
    }
    +[CFXAnalyticsManager sharedInstance](CFXAnalyticsManager, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "trackEffect:", *(_QWORD *)(a1 + 32));

    v16 = *(void **)(a1 + 48);
    if (v16)
    {
      dispatch_get_global_queue(21, 0);
      v17 = objc_claimAutoreleasedReturnValue();
      dispatch_async(v17, v16);

    }
  }

}

- (void)removeEffect:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  CFXEffectComposition *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[CFXEffectComposition concurrentQueue](self, "concurrentQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__CFXEffectComposition_removeEffect_completion___block_invoke;
  block[3] = &unk_24EE580F0;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_barrier_async(v8, block);

}

void __48__CFXEffectComposition_removeEffect_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "jtEffect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "type");

  objc_msgSend(*(id *)(a1 + 40), "CFX_effectsForJettyType:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "removeObject:", *(_QWORD *)(a1 + 32));
    JFXLog_effects();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromJFXEffectType(v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "localizedTitle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v7;
      v13 = 2114;
      v14 = v8;
      _os_log_impl(&dword_2269A9000, v6, OS_LOG_TYPE_DEFAULT, "Removed effect - type: %{public}@, name: %{public}@", (uint8_t *)&v11, 0x16u);

    }
    v9 = *(void **)(a1 + 48);
    if (v9)
    {
      dispatch_get_global_queue(21, 0);
      v10 = objc_claimAutoreleasedReturnValue();
      dispatch_async(v10, v9);

    }
  }

}

- (void)removeAllEffects:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[CFXEffectComposition concurrentQueue](self, "concurrentQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __41__CFXEffectComposition_removeAllEffects___block_invoke;
  v7[3] = &unk_24EE580A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_async(v5, v7);

}

void __41__CFXEffectComposition_removeAllEffects___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  uint8_t v8[16];

  objc_msgSend(*(id *)(a1 + 32), "CFX_effectsForJettyType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

  objc_msgSend(*(id *)(a1 + 32), "CFX_effectsForJettyType:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  objc_msgSend(*(id *)(a1 + 32), "CFX_effectsForJettyType:", 7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  JFXLog_effects();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_2269A9000, v5, OS_LOG_TYPE_DEFAULT, "Removed all effects", v8, 2u);
  }

  v6 = *(void **)(a1 + 40);
  if (v6)
  {
    dispatch_get_global_queue(21, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v7, v6);

  }
}

- (void)removeAllEffectsOfType:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  int v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  int v15;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "jtEffectType");
  -[CFXEffectComposition concurrentQueue](self, "concurrentQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __58__CFXEffectComposition_removeAllEffectsOfType_completion___block_invoke;
  v12[3] = &unk_24EE583A8;
  v15 = v8;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_barrier_async(v9, v12);

}

void __58__CFXEffectComposition_removeAllEffectsOfType_completion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "CFX_effectsForJettyType:", *(unsigned int *)(a1 + 56));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

  JFXLog_effects();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromJFXEffectType(objc_msgSend(*(id *)(a1 + 40), "jtEffectType"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v4;
    _os_log_impl(&dword_2269A9000, v3, OS_LOG_TYPE_DEFAULT, "Removed effects - type: %{public}@", (uint8_t *)&v7, 0xCu);

  }
  v5 = *(void **)(a1 + 48);
  if (v5)
  {
    dispatch_get_global_queue(21, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v6, v5);

  }
}

- (void)removeAllOverlayEffects:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[CFXEffectComposition concurrentQueue](self, "concurrentQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__CFXEffectComposition_removeAllOverlayEffects___block_invoke;
  v7[3] = &unk_24EE580A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_async(v5, v7);

}

void __48__CFXEffectComposition_removeAllOverlayEffects___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "CFX_effectsForJettyType:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

  JFXLog_effects();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromJFXEffectType(2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v4;
    _os_log_impl(&dword_2269A9000, v3, OS_LOG_TYPE_DEFAULT, "Removed effects - type: %{public}@", (uint8_t *)&v7, 0xCu);

  }
  v5 = *(void **)(a1 + 40);
  if (v5)
  {
    dispatch_get_global_queue(21, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v6, v5);

  }
}

- (unint64_t)indexOfEffect:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  unint64_t v7;
  _QWORD block[4];
  id v10;
  CFXEffectComposition *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0x7FFFFFFFFFFFFFFFLL;
  -[CFXEffectComposition concurrentQueue](self, "concurrentQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__CFXEffectComposition_indexOfEffect___block_invoke;
  block[3] = &unk_24EE583D0;
  v10 = v4;
  v11 = self;
  v12 = &v13;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = v14[3];
  _Block_object_dispose(&v13, 8);
  return v7;
}

void __38__CFXEffectComposition_indexOfEffect___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "jtEffect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "type");

  objc_msgSend(*(id *)(a1 + 40), "CFX_effectsForJettyType:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v4, "indexOfObject:", *(_QWORD *)(a1 + 32));
    v4 = v5;
  }

}

- (void)insertEffectAtIndex:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  CFXEffectComposition *v11;
  unint64_t v12;

  v6 = a3;
  -[CFXEffectComposition concurrentQueue](self, "concurrentQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__CFXEffectComposition_insertEffectAtIndex_atIndex___block_invoke;
  block[3] = &unk_24EE583F8;
  v10 = v6;
  v11 = self;
  v12 = a4;
  v8 = v6;
  dispatch_barrier_async(v7, block);

}

void __52__CFXEffectComposition_insertEffectAtIndex_atIndex___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "jtEffect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "type");

  objc_msgSend(*(id *)(a1 + 40), "CFX_effectsForJettyType:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "insertObject:atIndex:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
    v4 = v5;
  }

}

- (NSArray)jtEffects
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXEffectComposition effects](self, "effects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __33__CFXEffectComposition_jtEffects__block_invoke;
  v7[3] = &unk_24EE58420;
  v5 = v3;
  v8 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);

  return (NSArray *)v5;
}

void __33__CFXEffectComposition_jtEffects__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "jtEffect");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (id)jtEffectsForType:(int)a3
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  _QWORD block[4];
  id v14;
  CFXEffectComposition *v15;
  int v16;

  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[CFXEffectComposition concurrentQueue](self, "concurrentQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__CFXEffectComposition_jtEffectsForType___block_invoke;
  block[3] = &unk_24EE58448;
  v14 = v5;
  v15 = self;
  v16 = a3;
  v8 = v5;
  dispatch_sync(v6, block);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __41__CFXEffectComposition_jtEffectsForType___block_invoke_2;
  v11[3] = &unk_24EE58420;
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v12 = v9;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v11);

  return v9;
}

void __41__CFXEffectComposition_jtEffectsForType___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "CFX_effectsForJettyType:", *(unsigned int *)(a1 + 48));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObjectsFromArray:", v2);

}

void __41__CFXEffectComposition_jtEffectsForType___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "jtEffect");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (NSMutableArray)filters
{
  return self->_filters;
}

- (void)setFilters:(id)a3
{
  objc_storeStrong((id *)&self->_filters, a3);
}

- (NSMutableArray)overlays
{
  return self->_overlays;
}

- (void)setOverlays:(id)a3
{
  objc_storeStrong((id *)&self->_overlays, a3);
}

- (NSMutableArray)animojis
{
  return self->_animojis;
}

- (void)setAnimojis:(id)a3
{
  objc_storeStrong((id *)&self->_animojis, a3);
}

- (OS_dispatch_queue)concurrentQueue
{
  return self->_concurrentQueue;
}

- (void)setConcurrentQueue:(id)a3
{
  objc_storeStrong((id *)&self->_concurrentQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_concurrentQueue, 0);
  objc_storeStrong((id *)&self->_animojis, 0);
  objc_storeStrong((id *)&self->_overlays, 0);
  objc_storeStrong((id *)&self->_filters, 0);
}

@end

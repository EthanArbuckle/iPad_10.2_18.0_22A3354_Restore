@implementation AVBehaviorStorage

- (AVBehaviorStorage)initWithAVKitOwner:(id)a3
{
  id v4;
  AVBehaviorStorage *v5;
  AVBehaviorStorage *v6;
  uint64_t v7;
  NSMapTable *behaviorsAndBehaviorContexts;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AVBehaviorStorage;
  v5 = -[AVBehaviorStorage init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak(&v5->_AVKitOwner, v4);
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v7 = objc_claimAutoreleasedReturnValue();
    behaviorsAndBehaviorContexts = v6->_behaviorsAndBehaviorContexts;
    v6->_behaviorsAndBehaviorContexts = (NSMapTable *)v7;

  }
  return v6;
}

- (id)behaviorContextOfClass:(Class)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[AVBehaviorStorage behaviorsAndBehaviorContexts](self, "behaviorsAndBehaviorContexts", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v8);
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v10 = v9;
          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (void)enumerateAllBehaviorContextsImplementingSelector:(SEL)a3 forProtocol:(id)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  SEL v12;

  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __93__AVBehaviorStorage_enumerateAllBehaviorContextsImplementingSelector_forProtocol_usingBlock___block_invoke;
  v10[3] = &unk_1E5BB3F88;
  v11 = v8;
  v12 = a3;
  v9 = v8;
  -[AVBehaviorStorage enumerateAllBehaviorContextsConformingToProtocol:usingBlock:](self, "enumerateAllBehaviorContextsConformingToProtocol:usingBlock:", a4, v10);

}

- (void)enumerateAllBehaviorContextsConformingToProtocol:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __81__AVBehaviorStorage_enumerateAllBehaviorContextsConformingToProtocol_usingBlock___block_invoke;
  v10[3] = &unk_1E5BB3F60;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[AVBehaviorStorage enumerateAllBehaviorContextsUsingBlock:](self, "enumerateAllBehaviorContextsUsingBlock:", v10);

}

- (void)enumerateAllBehaviorContextsUsingBlock:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[AVBehaviorStorage behaviorsAndBehaviorContexts](self, "behaviorsAndBehaviorContexts", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

void __81__AVBehaviorStorage_enumerateAllBehaviorContextsConformingToProtocol_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "conformsToProtocol:", *(_QWORD *)(a1 + 32)))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __93__AVBehaviorStorage_enumerateAllBehaviorContextsImplementingSelector_forProtocol_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)addBehavior:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  AVDefaultBehaviorContext *v11;
  AVDefaultBehaviorContext *v12;
  AVDefaultBehaviorContext *v13;
  void *v14;
  void *v15;
  id v16;

  v4 = a3;
  if (v4)
  {
    v16 = v4;
    -[AVBehaviorStorage behaviorsAndBehaviorContexts](self, "behaviorsAndBehaviorContexts");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v16);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v16;
    if (!v6)
    {
      if (objc_msgSend(v16, "conformsToProtocol:", &unk_1EECA4230))
      {
        v7 = v16;
        v8 = objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "behaviorContextClass"));
        -[AVBehaviorStorage AVKitOwner](self, "AVKitOwner");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)objc_msgSend(v8, "initWithAVKitOwner:", v9);

        if (v10)
        {
          v11 = v10;
          v12 = v11;
LABEL_8:
          -[AVDefaultBehaviorContext willAddBehavior:](v12, "willAddBehavior:", v16);
          objc_msgSend(v16, "willMoveToContext:", v11);
          -[AVBehaviorStorage behaviorsAndBehaviorContexts](self, "behaviorsAndBehaviorContexts");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setObject:forKey:", v11, v16);

          -[AVDefaultBehaviorContext setBehavior:](v12, "setBehavior:", v16);
          objc_msgSend(v7, "setBehaviorContext:", v11);
          -[AVDefaultBehaviorContext didAddBehavior:](v12, "didAddBehavior:", v16);

          v4 = v16;
          goto LABEL_9;
        }
      }
      else
      {
        v7 = 0;
      }
      v13 = [AVDefaultBehaviorContext alloc];
      -[AVBehaviorStorage AVKitOwner](self, "AVKitOwner");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[AVDefaultBehaviorContext initWithAVKitOwner:](v13, "initWithAVKitOwner:", v14);

      v12 = 0;
      goto LABEL_8;
    }
  }
LABEL_9:

}

- (NSMapTable)behaviorsAndBehaviorContexts
{
  return self->_behaviorsAndBehaviorContexts;
}

- (id)AVKitOwner
{
  return objc_loadWeakRetained(&self->_AVKitOwner);
}

- (id)behaviors
{
  void *v2;
  void *v3;
  void *v4;

  -[AVBehaviorStorage behaviorsAndBehaviorContexts](self, "behaviorsAndBehaviorContexts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keyEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)removeBehavior:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  -[AVBehaviorStorage behaviorsAndBehaviorContexts](self, "behaviorsAndBehaviorContexts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "conformsToProtocol:", &unk_1EECA2630))
  {
    v6 = v5;
    objc_msgSend(v6, "willRemoveBehavior:", v8);
    -[AVBehaviorStorage behaviorsAndBehaviorContexts](self, "behaviorsAndBehaviorContexts");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectForKey:", v8);

    objc_msgSend(v6, "setBehavior:", 0);
    if (objc_msgSend(v8, "conformsToProtocol:", &unk_1EECA4230))
      objc_msgSend(v8, "setBehaviorContext:", 0);
    objc_msgSend(v6, "didRemoveBehavior:", v8);
  }
  else
  {
    -[AVBehaviorStorage behaviorsAndBehaviorContexts](self, "behaviorsAndBehaviorContexts");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", v8);
  }

}

- (void)enumerateAllBehaviorsUsingBlock:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[AVBehaviorStorage behaviorsAndBehaviorContexts](self, "behaviorsAndBehaviorContexts", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)enumerateAllBehaviorsConformingToProtocol:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __74__AVBehaviorStorage_enumerateAllBehaviorsConformingToProtocol_usingBlock___block_invoke;
  v10[3] = &unk_1E5BB3F38;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[AVBehaviorStorage enumerateAllBehaviorsUsingBlock:](self, "enumerateAllBehaviorsUsingBlock:", v10);

}

- (id)behaviorOfClass:(Class)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[AVBehaviorStorage behaviorsAndBehaviorContexts](self, "behaviorsAndBehaviorContexts", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v8);
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v10 = v9;
          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (void)setAVKitOwner:(id)a3
{
  objc_storeWeak(&self->_AVKitOwner, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_behaviorsAndBehaviorContexts, 0);
  objc_destroyWeak(&self->_AVKitOwner);
}

void __74__AVBehaviorStorage_enumerateAllBehaviorsConformingToProtocol_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "conformsToProtocol:", *(_QWORD *)(a1 + 32)))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

@end

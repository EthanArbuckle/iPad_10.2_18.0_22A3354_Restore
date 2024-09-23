@implementation VSBinder

- (VSBinder)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The %@ initializer is not available."), v5);

  return 0;
}

- (VSBinder)initWithBoundObject:(id)a3
{
  id v4;
  VSBinder *v5;
  NSCountedSet *v6;
  NSCountedSet *currentlyChangingBindings;
  NSMutableDictionary *v8;
  NSMutableDictionary *establishedBindings;
  objc_super v11;

  v4 = a3;
  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The boundObject parameter must not be nil."));
  v11.receiver = self;
  v11.super_class = (Class)VSBinder;
  v5 = -[VSBinder init](&v11, sel_init);
  if (v5)
  {
    v6 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E0CB3550]);
    currentlyChangingBindings = v5->_currentlyChangingBindings;
    v5->_currentlyChangingBindings = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    establishedBindings = v5->_establishedBindings;
    v5->_establishedBindings = v8;

    objc_storeWeak(&v5->_boundObject, v4);
  }

  return v5;
}

- (void)dealloc
{
  VSBinder *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  v2->_establishmentProhibited = 1;
  -[NSMutableDictionary allKeys](v2->_establishedBindings, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  objc_sync_exit(v2);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        -[VSBinder tearDownBinding:](v2, "tearDownBinding:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  v9.receiver = v2;
  v9.super_class = (Class)VSBinder;
  -[VSBinder dealloc](&v9, sel_dealloc);
}

- (id)_infoForBinding:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The binding parameter must not be nil."));
  -[VSBinder establishedBindings](self, "establishedBindings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSOptional optionalWithObject:](VSOptional, "optionalWithObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)establishBinding:(id)a3 withInfo:(id)a4
{
  id v6;
  VSBinder *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  if (v15)
  {
    if (v6)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The binding parameter must not be nil."));
    if (v6)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The bindingInfo parameter must not be nil."));
LABEL_3:
  objc_msgSend(v6, "requireExpectedConcurrency");
  v7 = self;
  objc_sync_enter(v7);
  if (!-[VSBinder isEstablishmentProhibited](v7, "isEstablishmentProhibited"))
  {
    -[VSBinder _infoForBinding:](v7, "_infoForBinding:", v15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "object");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      -[VSBinder tearDownBinding:](v7, "tearDownBinding:", v15);
    -[VSBinder establishedBindings](v7, "establishedBindings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1D8236758](objc_msgSend(v10, "setObject:forKey:", v6, v15));
    objc_msgSend(v6, "weakObservedObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v6, "keyPath");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObserver:forKeyPath:options:context:", v7, v13, 12, v15);
      objc_msgSend(v12, "vs_unbinderCreatingIfNeeded:", 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "binder:didEstablishBinding:", v7, v15);

    }
    else
    {
      objc_msgSend(v10, "removeObjectForKey:", v15);
    }

    objc_autoreleasePoolPop(v11);
  }
  objc_sync_exit(v7);

}

- (void)tearDownBinding:(id)a3
{
  id v4;
  VSBinder *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The binding parameter must not be nil."));
  v5 = self;
  objc_sync_enter(v5);
  -[VSBinder _infoForBinding:](v5, "_infoForBinding:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __28__VSBinder_tearDownBinding___block_invoke;
  v8[3] = &unk_1E939FFA0;
  v8[4] = v5;
  v7 = v4;
  v9 = v7;
  objc_msgSend(v6, "conditionallyUnwrapObject:otherwise:", v8, &__block_literal_global_28);

  objc_sync_exit(v5);
}

void __28__VSBinder_tearDownBinding___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "requireExpectedConcurrency");
  objc_msgSend(v3, "unsafeObservedObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:forKeyPath:context:", *(_QWORD *)(a1 + 32), v5, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "establishedBindings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v17 = v5;
  intermediaryKeyPathsForKeyPath(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(v4, "valueForKeyPath:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v11));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)MEMORY[0x1D8236758]();
        objc_msgSend(v12, "vs_unbinderCreatingIfNeeded:", 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "binder:didTearDownBinding:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

        objc_autoreleasePoolPop(v13);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  v15 = (void *)MEMORY[0x1D8236758]();
  objc_msgSend(v4, "vs_unbinderCreatingIfNeeded:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "binder:didTearDownBinding:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  objc_autoreleasePoolPop(v15);
}

- (id)valueForBinding:(id)a3
{
  id v4;
  VSBinder *v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a3;
  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The binding parameter must not be nil."));
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__7;
  v14 = __Block_byref_object_dispose__7;
  v15 = 0;
  v5 = self;
  objc_sync_enter(v5);
  -[VSBinder _infoForBinding:](v5, "_infoForBinding:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __28__VSBinder_valueForBinding___block_invoke;
  v9[3] = &unk_1E939FFC8;
  v9[4] = &v10;
  objc_msgSend(v6, "conditionallyUnwrapObject:", v9);

  objc_sync_exit(v5);
  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __28__VSBinder_valueForBinding___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "value");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)setValue:(id)a3 forBinding:(id)a4
{
  id v6;
  id v7;
  VSBinder *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  v7 = a4;
  if (!v7)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The binding parameter must not be nil."));
  v8 = self;
  objc_sync_enter(v8);
  -[VSBinder currentlyChangingBindings](v8, "currentlyChangingBindings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v7);
  -[VSBinder _infoForBinding:](v8, "_infoForBinding:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __32__VSBinder_setValue_forBinding___block_invoke;
  v12[3] = &unk_1E939FFF0;
  v11 = v6;
  v13 = v11;
  objc_msgSend(v10, "conditionallyUnwrapObject:", v12);

  objc_msgSend(v9, "removeObject:", v7);
  objc_sync_exit(v8);

}

uint64_t __32__VSBinder_setValue_forBinding___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setValue:", *(_QWORD *)(a1 + 32));
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  void *v11;
  VSBinder *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  VSBinder *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v31 = a4;
  v30 = a5;
  if (v10)
  {
    if (a6)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The keyPathOrNil parameter must not be nil."));
    if (a6)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The context parameter must not be nil."));
LABEL_3:
  v11 = a6;
  v12 = self;
  objc_sync_enter(v12);
  v32 = v11;
  -[VSBinder _infoForBinding:](v12, "_infoForBinding:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "conditionallyUnwrapObject:", &__block_literal_global_18);
  v29 = v10;

  objc_sync_exit(v12);
  objc_msgSend(v30, "objectForKey:", *MEMORY[0x1E0CB2CC0]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "BOOLValue");

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  if (!v10)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The keyPathOrNil parameter must not be nil."), 0);
  intermediaryKeyPathsForKeyPath(v29);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v34 != v18)
          objc_enumerationMutation(v16);
        objc_msgSend(v31, "valueForKeyPath:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i), v29);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)MEMORY[0x1D8236758]();
        objc_msgSend(v20, "vs_unbinderCreatingIfNeeded:", v15 ^ 1u);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v22;
        if (v15)
          objc_msgSend(v22, "binder:didTearDownBinding:", v12, v32);
        else
          objc_msgSend(v22, "binder:didEstablishBinding:", v12, v32);

        objc_autoreleasePoolPop(v21);
      }
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v17);
  }

  v24 = v12;
  objc_sync_enter(v24);
  -[VSBinder currentlyChangingBindings](v24, "currentlyChangingBindings");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "containsObject:", v32);

  if (((v26 | v15) & 1) == 0)
  {
    -[VSBinder valueForBinding:](v24, "valueForBinding:", v32);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSBinder boundObject](v24, "boundObject");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setValue:forKey:", v27, v32);

  }
  objc_sync_exit(v24);

}

uint64_t __59__VSBinder_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "requireExpectedConcurrency");
}

- (id)boundObject
{
  return objc_loadWeakRetained(&self->_boundObject);
}

- (BOOL)isEstablishmentProhibited
{
  return self->_establishmentProhibited;
}

- (void)setEstablishmentProhibited:(BOOL)a3
{
  self->_establishmentProhibited = a3;
}

- (NSCountedSet)currentlyChangingBindings
{
  return self->_currentlyChangingBindings;
}

- (void)setCurrentlyChangingBindings:(id)a3
{
  objc_storeStrong((id *)&self->_currentlyChangingBindings, a3);
}

- (NSMutableDictionary)establishedBindings
{
  return self->_establishedBindings;
}

- (void)setEstablishedBindings:(id)a3
{
  objc_storeStrong((id *)&self->_establishedBindings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_establishedBindings, 0);
  objc_storeStrong((id *)&self->_currentlyChangingBindings, 0);
  objc_destroyWeak(&self->_boundObject);
}

@end

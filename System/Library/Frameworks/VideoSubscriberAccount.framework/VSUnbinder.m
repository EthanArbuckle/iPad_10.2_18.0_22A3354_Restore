@implementation VSUnbinder

- (VSUnbinder)init
{
  VSUnbinder *v2;
  uint64_t v3;
  NSMapTable *bindingsByBinder;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VSUnbinder;
  v2 = -[VSUnbinder init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    bindingsByBinder = v2->_bindingsByBinder;
    v2->_bindingsByBinder = (NSMapTable *)v3;

  }
  return v2;
}

- (void)dealloc
{
  VSUnbinder *v2;
  NSMapTable *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  VSUnbinder *v15;
  id obj;
  objc_super v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  v2->_invalid = 1;
  objc_sync_exit(v2);

  v15 = v2;
  v3 = v2->_bindingsByBinder;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[NSMapTable keyEnumerator](v3, "keyEnumerator");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        -[NSMapTable objectForKey:](v3, "objectForKey:", v8, v15);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        objc_msgSend(v9, "reverseObjectEnumerator");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v19;
          do
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v19 != v13)
                objc_enumerationMutation(v10);
              objc_msgSend(v8, "tearDownBinding:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * j));
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          }
          while (v12);
        }

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v5);
  }

  v17.receiver = v15;
  v17.super_class = (Class)VSUnbinder;
  -[VSUnbinder dealloc](&v17, sel_dealloc);
}

- (void)binder:(id)a3 didEstablishBinding:(id)a4
{
  id v6;
  VSUnbinder *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  if (-[VSUnbinder isInvalid](v7, "isInvalid"))
  {
    objc_msgSend(v11, "tearDownBinding:", v6);
  }
  else
  {
    -[VSUnbinder bindingsByBinder](v7, "bindingsByBinder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v11);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v8, "setObject:forKey:", v9, v11);
    }
    v10 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v9, "addObject:", v10);

  }
  objc_sync_exit(v7);

}

- (void)binder:(id)a3 didTearDownBinding:(id)a4
{
  id v6;
  VSUnbinder *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  if (!-[VSUnbinder isInvalid](v7, "isInvalid"))
  {
    -[VSUnbinder bindingsByBinder](v7, "bindingsByBinder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      if (objc_msgSend(v9, "containsObject:", v6))
        objc_msgSend(v10, "removeObject:", v6);
      else
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Attempt to tear down unknown binding %@"), v6);
      if (!objc_msgSend(v10, "count"))
        objc_msgSend(v8, "removeObjectForKey:", v11);
    }

  }
  objc_sync_exit(v7);

}

- (BOOL)isInvalid
{
  return self->_invalid;
}

- (void)setInvalid:(BOOL)a3
{
  self->_invalid = a3;
}

- (NSMapTable)bindingsByBinder
{
  return self->_bindingsByBinder;
}

- (void)setBindingsByBinder:(id)a3
{
  objc_storeStrong((id *)&self->_bindingsByBinder, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bindingsByBinder, 0);
}

@end

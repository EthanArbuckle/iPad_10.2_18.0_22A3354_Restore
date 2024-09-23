@implementation GEOObserverHashTable

- (void)registerObserver:(id)a3 queue:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  os_unfair_lock_lock(&self->_lock);
  -[NSHashTable addObject:](self->_observers, "addObject:", v7);
  -[NSMapTable setObject:forKey:](self->_observerQueues, "setObject:forKey:", v6, v7);
  os_unfair_lock_unlock(&self->_lock);

}

- (GEOObserverHashTable)initWithProtocol:(id)a3 queue:(id)a4
{
  id v7;
  id v8;
  GEOObserverHashTable *v9;
  GEOObserverHashTable *v10;
  uint64_t v11;
  NSHashTable *observers;
  uint64_t v13;
  NSMapTable *observerQueues;
  GEOObserverHashTable *v15;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)GEOObserverHashTable;
  v9 = -[GEOObserverHashTable init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v9->_protocol, a3);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 517, 1);
    observers = v10->_observers;
    v10->_observers = (NSHashTable *)v11;

    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 517, 512, 1);
    observerQueues = v10->_observerQueues;
    v10->_observerQueues = (NSMapTable *)v13;

    objc_storeStrong((id *)&v10->_callbackQueue, a4);
    v15 = v10;
  }

  return v10;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  char *types;
  objc_method_description MethodDescription;
  objc_method_description v7;
  void *v8;

  MethodDescription = protocol_getMethodDescription(self->_protocol, a3, 0, 1);
  types = MethodDescription.types;
  if (MethodDescription.name
    || (v7 = protocol_getMethodDescription(self->_protocol, a3, 1, 1), types = v7.types, v7.name))
  {
    objc_msgSend(MEMORY[0x1E0C99DD8], "signatureWithObjCTypes:", types);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[GEOObserverHashTable doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a3);
    v8 = 0;
  }
  return v8;
}

- (void)registerObserver:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[NSHashTable addObject:](self->_observers, "addObject:", v4);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)forwardInvocation:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;
  OS_dispatch_queue *v8;
  id v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSHashTable allObjects](self->_observers, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)-[NSMapTable copy](self->_observerQueues, "copy");
  v8 = self->_callbackQueue;
  os_unfair_lock_unlock(p_lock);
  if (objc_msgSend(v6, "count"))
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __42__GEOObserverHashTable_forwardInvocation___block_invoke;
    v12[3] = &unk_1E1C01790;
    v9 = v4;
    v13 = v9;
    v14 = v6;
    v15 = v7;
    v10 = MEMORY[0x18D765024](v12);
    v11 = (void *)v10;
    if (v8)
    {
      objc_msgSend(v9, "retainArguments");
      dispatch_async((dispatch_queue_t)v8, v11);
    }
    else
    {
      (*(void (**)(uint64_t))(v10 + 16))(v10);
    }

  }
}

void __42__GEOObserverHashTable_forwardInvocation___block_invoke(id *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  id v18;
  uint64_t v19;
  id obj;
  _QWORD block[4];
  id v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(a1[4], "selector");
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = a1[5];
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v26;
    v19 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v26 != v5)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(a1[6], "objectForKey:", v7);
          v8 = objc_claimAutoreleasedReturnValue();
          if (v8)
          {
            v9 = v2;
            v10 = (void *)MEMORY[0x1E0C99DB8];
            objc_msgSend(a1[4], "methodSignature");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "invocationWithMethodSignature:", v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v12, "setSelector:", objc_msgSend(a1[4], "selector"));
            objc_msgSend(a1[4], "methodSignature");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "numberOfArguments");

            if (v14)
            {
              v15 = 0;
              do
              {
                v24 = 0;
                objc_msgSend(a1[4], "getArgument:atIndex:", &v24, v15);
                objc_msgSend(v12, "setArgument:atIndex:", &v24, v15++);
                objc_msgSend(a1[4], "methodSignature");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                v17 = objc_msgSend(v16, "numberOfArguments");

              }
              while (v15 < v17);
            }
            objc_msgSend(v12, "retainArguments");
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __42__GEOObserverHashTable_forwardInvocation___block_invoke_2;
            block[3] = &unk_1E1C00738;
            v22 = v12;
            v23 = v7;
            v18 = v12;
            dispatch_async(v8, block);

            v2 = v9;
            v5 = v19;
          }
          else
          {
            objc_msgSend(a1[4], "invokeWithTarget:", v7);
          }

        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v4);
  }

}

- (void)unregisterObserver:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[NSHashTable removeObject:](self->_observers, "removeObject:", v4);
  -[NSMapTable removeObjectForKey:](self->_observerQueues, "removeObjectForKey:", v4);
  os_unfair_lock_unlock(&self->_lock);

}

- (GEOObserverHashTable)init
{
  GEOObserverHashTable *result;

  result = (GEOObserverHashTable *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (BOOL)hasObservers
{
  return -[GEOObserverHashTable count](self, "count") != 0;
}

- (unint64_t)count
{
  os_unfair_lock_s *p_lock;
  void *v4;
  unint64_t v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSHashTable allObjects](self->_observers, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (NSArray)allObservers
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSHashTable allObjects](self->_observers, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

uint64_t __42__GEOObserverHashTable_forwardInvocation___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invokeWithTarget:", *(_QWORD *)(a1 + 40));
}

- (void)enumerateObserversWithGroup:(id)a3 visitor:(id)a4
{
  NSObject *v6;
  id v7;
  os_unfair_lock_s *p_lock;
  void *v9;
  void *v10;
  OS_dispatch_queue *v11;
  unint64_t v12;
  void (**v13)(_QWORD);
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  NSObject *v18;
  id v19;

  v6 = a3;
  v7 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSHashTable allObjects](self->_observers, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)-[NSMapTable copy](self->_observerQueues, "copy");
  v11 = self->_callbackQueue;
  os_unfair_lock_unlock(p_lock);
  if (objc_msgSend(v9, "count"))
  {
    if (v6 && objc_msgSend(v9, "count"))
    {
      v12 = 0;
      do
      {
        dispatch_group_enter(v6);
        ++v12;
      }
      while (v12 < objc_msgSend(v9, "count"));
    }
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __60__GEOObserverHashTable_enumerateObserversWithGroup_visitor___block_invoke;
    v15[3] = &unk_1E1C018D0;
    v16 = v9;
    v17 = v10;
    v19 = v7;
    v18 = v6;
    v13 = (void (**)(_QWORD))MEMORY[0x18D765024](v15);
    v14 = v13;
    if (v11)
      dispatch_async((dispatch_queue_t)v11, v13);
    else
      v13[2](v13);

  }
}

void __60__GEOObserverHashTable_enumerateObserversWithGroup_visitor___block_invoke(id *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD block[5];
  id v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v2 = a1[4];
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v15;
    v6 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(v2);
        v8 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(a1[5], "objectForKey:", v8);
        v9 = objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          block[0] = v6;
          block[1] = 3221225472;
          block[2] = __60__GEOObserverHashTable_enumerateObserversWithGroup_visitor___block_invoke_2;
          block[3] = &unk_1E1C01358;
          v13 = a1[7];
          block[4] = v8;
          v12 = a1[6];
          dispatch_async(v9, block);

        }
        else
        {
          (*((void (**)(void))a1[7] + 2))();
          v10 = a1[6];
          if (v10)
            dispatch_group_leave(v10);
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v4);
  }

}

void __60__GEOObserverHashTable_enumerateObserversWithGroup_visitor___block_invoke_2(uint64_t a1)
{
  NSObject *v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v2 = *(NSObject **)(a1 + 40);
  if (v2)
    dispatch_group_leave(v2);
}

- (id)description
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSHashTable copy](self->_observers, "copy");
  os_unfair_lock_unlock(p_lock);
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("GEOObserverHashTable observers count: %d"), objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "appendFormat:", CFSTR("\n\t%@ (%p)"), objc_opt_class(), *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10++), (_QWORD)v12);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_observerQueues, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_protocol, 0);
}

@end

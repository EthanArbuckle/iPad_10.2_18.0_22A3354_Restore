@implementation LCSExtensionMonitor

- (LCSExtensionMonitor)initWithExtensionPointIdentifier:(id)a3
{
  id v5;
  LCSExtensionMonitor *v6;
  LCSExtensionMonitor *v7;
  uint64_t Serial;
  OS_dispatch_queue *queue;
  uint64_t v10;
  NSHashTable *queue_observers;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)LCSExtensionMonitor;
  v6 = -[LCSExtensionMonitor init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_extensionPointIdentifier, a3);
    v7->_lock._os_unfair_lock_opaque = 0;
    Serial = BSDispatchQueueCreateSerial();
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)Serial;

    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v10 = objc_claimAutoreleasedReturnValue();
    queue_observers = v7->_queue_observers;
    v7->_queue_observers = (NSHashTable *)v10;

  }
  return v7;
}

- (void)invalidate
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__LCSExtensionMonitor_invalidate__block_invoke;
  block[3] = &unk_2511049B0;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __33__LCSExtensionMonitor_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "enumerateObjectsUsingBlock:", &__block_literal_global_2);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setDelegate:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "suspend");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 16);
  *(_QWORD *)(v4 + 16) = 0;

}

uint64_t __33__LCSExtensionMonitor_invalidate__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "invalidate");
}

- (void)start
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __28__LCSExtensionMonitor_start__block_invoke;
  block[3] = &unk_2511049B0;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __28__LCSExtensionMonitor_start__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC79E8]), "initWithExtensionPointIdentifier:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
    v8[0] = v2;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDC79F0]), "initWithQueries:delegate:", v3, *(_QWORD *)(a1 + 32));
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 16);
    *(_QWORD *)(v5 + 16) = v4;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setDelegate:");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "resume");
    objc_msgSend(MEMORY[0x24BDC79F0], "executeQueries:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_queue_notifyUpdatedExtensions:", v7);

  }
}

- (void)_queue_notifyUpdatedExtensions:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  NSArray *lock_knownCaptureExtensions;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  id v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  os_unfair_lock_t lock;
  id obj;
  _QWORD block[5];
  id v36;
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint8_t v48[128];
  uint8_t buf[4];
  uint64_t v50;
  __int16 v51;
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  LCSLogExtension();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v50 = objc_msgSend(v4, "count");
    v51 = 2112;
    v52 = v4;
    _os_log_impl(&dword_240B1C000, v5, OS_LOG_TYPE_DEFAULT, "Extensions updated; Received %lu extensions: %@",
      buf,
      0x16u);
  }

  objc_msgSend(MEMORY[0x24BDD1650], "weakToWeakObjectsMapTable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v7 = self->_lock_knownCaptureExtensions;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v44 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        objc_msgSend(v12, "identity");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKey:", v12, v13);

      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    }
    while (v9);
  }

  if (self->_lock_knownCaptureExtensions)
    lock_knownCaptureExtensions = self->_lock_knownCaptureExtensions;
  else
    lock_knownCaptureExtensions = (NSArray *)MEMORY[0x24BDBD1A8];
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", lock_knownCaptureExtensions, self);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v4, "count"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v4;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v40;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v40 != v18)
          objc_enumerationMutation(obj);
        v20 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v19);
        LCSLogExtension();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v50 = v20;
          _os_log_impl(&dword_240B1C000, v21, OS_LOG_TYPE_DEFAULT, "Examining extension identity %@", buf, 0xCu);
        }

        objc_msgSend(v6, "objectForKey:", v20);
        v22 = objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          v23 = v22;
          LCSLogExtension();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v50 = v20;
            _os_log_impl(&dword_240B1C000, v24, OS_LOG_TYPE_DEFAULT, "Extension identity %@ already tracked", buf, 0xCu);
          }

LABEL_25:
          objc_msgSend(v15, "addObject:", v23);
          goto LABEL_26;
        }
        +[LCSExtension extensionWithIdentity:](LCSExtension, "extensionWithIdentity:", v20);
        v23 = objc_claimAutoreleasedReturnValue();
        if (v23)
          goto LABEL_25;
        LCSLogExtension();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v50 = v20;
          _os_log_error_impl(&dword_240B1C000, v23, OS_LOG_TYPE_ERROR, "Failed to add new extension wrapper: %@; PRPosterExtension unable to create extension",
            buf,
            0xCu);
        }
LABEL_26:

        ++v19;
      }
      while (v17 != v19);
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
      v17 = v25;
    }
    while (v25);
  }

  v26 = (id)objc_msgSend(v15, "copy");
  if (objc_msgSend(v32, "isEqual:", v26))
  {
    os_unfair_lock_unlock(lock);
    LCSLogExtension();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_240B1C000, v27, OS_LOG_TYPE_DEFAULT, "Not notifying delegate of updated extensions, no changes detected.", buf, 2u);
    }

  }
  else
  {
    objc_msgSend(v26, "bs_array");
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = *(void **)(v31 + 24);
    *(_QWORD *)(v31 + 24) = v28;

    os_unfair_lock_unlock(lock);
    v30 = *(NSObject **)(v31 + 8);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __54__LCSExtensionMonitor__queue_notifyUpdatedExtensions___block_invoke;
    block[3] = &unk_251104BE8;
    block[4] = v31;
    v36 = v26;
    v37 = v32;
    v38 = v36;
    dispatch_async(v30, block);

  }
}

void __54__LCSExtensionMonitor__queue_notifyUpdatedExtensions___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = (void *)objc_msgSend(*(id *)(a1[4] + 32), "copy", 0);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "captureExtensionProvider:didUpdateKnownExtensions:", a1[4], a1[5]);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "captureExtensionProvider:updatedKnownExtensionsFrom:to:", a1[4], a1[6], a1[7]);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (NSArray)knownCaptureExtensions
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSArray copy](self->_lock_knownCaptureExtensions, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (BOOL)isCaptureExtension:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v5 = (void *)-[NSArray copy](self->_lock_knownCaptureExtensions, "copy");
  os_unfair_lock_unlock(&self->_lock);
  v6 = MEMORY[0x24BDAC760];
  if (!v5)
    goto LABEL_4;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __42__LCSExtensionMonitor_isCaptureExtension___block_invoke;
  v15[3] = &unk_251104C10;
  v16 = v4;
  objc_msgSend(v5, "bs_firstObjectPassingTest:", v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = 1;
  }
  else
  {
LABEL_4:
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC79E8]), "initWithExtensionPointIdentifier:", self->_extensionPointIdentifier);
    objc_msgSend(MEMORY[0x24BDC79F0], "executeQuery:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v6;
    v13[1] = 3221225472;
    v13[2] = __42__LCSExtensionMonitor_isCaptureExtension___block_invoke_2;
    v13[3] = &unk_251104A00;
    v14 = v4;
    objc_msgSend(v10, "bs_firstObjectPassingTest:", v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v11 != 0;

  }
  return v8;
}

uint64_t __42__LCSExtensionMonitor_isCaptureExtension___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __42__LCSExtensionMonitor_isCaptureExtension___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)queryControllerDidUpdate:(id)a3 resultDifference:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  queue = self->_queue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __65__LCSExtensionMonitor_queryControllerDidUpdate_resultDifference___block_invoke;
  v8[3] = &unk_2511049D8;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

void __65__LCSExtensionMonitor_queryControllerDidUpdate_resultDifference___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "extensionIdentities");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_queue_notifyUpdatedExtensions:", v2);

}

- (void)addObserver:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __35__LCSExtensionMonitor_addObserver___block_invoke;
    v7[3] = &unk_2511049D8;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

uint64_t __35__LCSExtensionMonitor_addObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)removeObserver:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __38__LCSExtensionMonitor_removeObserver___block_invoke;
    v7[3] = &unk_2511049D8;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

uint64_t __38__LCSExtensionMonitor_removeObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (NSString)extensionPointIdentifier
{
  return self->_extensionPointIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionPointIdentifier, 0);
  objc_storeStrong((id *)&self->_queue_observers, 0);
  objc_storeStrong((id *)&self->_lock_knownCaptureExtensions, 0);
  objc_storeStrong((id *)&self->_queue_queryController, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end

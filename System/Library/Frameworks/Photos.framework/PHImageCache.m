@implementation PHImageCache

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PHImageCache)init
{
  PHImageCache *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *backingDictionary;
  NSMutableDictionary *v5;
  NSMutableDictionary *uncommittedInserts;
  NSMutableDictionary *v7;
  NSMutableDictionary *uncommittedDeletes;
  PHRecyclableObjectVendor *v9;
  PHRecyclableObjectVendor *entryVendor;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PHImageCache;
  v2 = -[PHImageCache init](&v14, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    backingDictionary = v2->_backingDictionary;
    v2->_backingDictionary = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    uncommittedInserts = v2->_uncommittedInserts;
    v2->_uncommittedInserts = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    uncommittedDeletes = v2->_uncommittedDeletes;
    v2->_uncommittedDeletes = v7;

    v2->_lock._os_unfair_lock_opaque = 0;
    v9 = -[PHRecyclableObjectVendor initWithTargetClass:requiresThreadSafety:initialPoolSize:]([PHRecyclableObjectVendor alloc], "initWithTargetClass:requiresThreadSafety:initialPoolSize:", objc_opt_class(), 1, 50);
    entryVendor = v2->_entryVendor;
    v2->_entryVendor = v9;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    DCIM_applicationDidReceiveMemoryWarningNotificationName();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v2, sel__didReceiveMemoryWarningNotification_, v12, 0);

  }
  return v2;
}

- (void)queryEntryForKey:(id)a3 didWaitForInFlightRequest:(BOOL *)a4 didFindImage:(BOOL *)a5 entryIsValidBlock:(id)a6 resultHandler:(id)a7
{
  id v12;
  os_unfair_lock_s *p_lock;
  id v14;
  void *v15;
  void *v16;
  char v17;
  char v18;
  char v19;
  uint64_t v20;
  CGImage *v21;
  BOOL v22;
  uint64_t (**v23)(id, void *);

  v23 = (uint64_t (**)(id, void *))a6;
  v12 = a7;
  p_lock = &self->_lock;
  v14 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary objectForKey:](self->_backingDictionary, "objectForKey:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend(v15, "additionalInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v23[2](v23, v16);

    v18 = v17 ^ 1;
  }
  else
  {
    v18 = 0;
  }
  if (v15)
    v19 = v18;
  else
    v19 = 1;
  if ((v19 & 1) != 0)
    goto LABEL_11;
  v20 = objc_msgSend(v15, "createImageRef");
  v21 = (CGImage *)v20;
  if (a4 && !v20)
  {
    objc_msgSend(v15, "addNotifyHandler:", v12);
LABEL_11:
    LOBYTE(v21) = v19 ^ 1;
    os_unfair_lock_unlock(p_lock);
    goto LABEL_12;
  }
  os_unfair_lock_unlock(p_lock);
  if (!v21)
  {
LABEL_12:
    v22 = 0;
    if (!a4)
      goto LABEL_14;
    goto LABEL_13;
  }
  (*((void (**)(id, CGImage *, _QWORD, _QWORD))v12 + 2))(v12, v21, 0, 0);
  CGImageRelease(v21);
  LOBYTE(v21) = 0;
  v22 = 1;
  if (a4)
LABEL_13:
    *a4 = (char)v21;
LABEL_14:
  if (a5)
    *a5 = v22;

}

- (BOOL)populateEntryWithImage:(CGImage *)a3 requestID:(int)a4 forKey:(id)a5 additionalInfo:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  int v14;
  BOOL v15;
  char v17;
  _QWORD v18[5];

  v10 = a5;
  v11 = a6;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary objectForKey:](self->_backingDictionary, "objectForKey:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = v12;
  }
  else
  {
    -[NSMutableDictionary objectForKey:](self->_uncommittedInserts, "objectForKey:", v10);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (!v13)
      goto LABEL_8;
  }
  v14 = objc_msgSend(v13, "imageRequestIDForPopulatingCache");
  if (v14 != a4)
  {
    if (!v14)
    {
      v17 = objc_msgSend(v13, "hasImageRef");

      if (a3 && (v17 & 1) == 0)
        goto LABEL_6;
LABEL_9:
      os_unfair_lock_unlock(&self->_lock);
      v15 = 0;
      goto LABEL_10;
    }
LABEL_8:

    goto LABEL_9;
  }

LABEL_6:
  objc_msgSend(v13, "setImageRequestIDForPopulatingCache:", 0);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __71__PHImageCache_populateEntryWithImage_requestID_forKey_additionalInfo___block_invoke;
  v18[3] = &unk_1E35DF110;
  v18[4] = self;
  objc_msgSend(v13, "populateWithImageRef:additionalInfo:error:executeBeforeNotifyingWaitersBlock:", a3, v11, 0, v18);
  v15 = 1;
LABEL_10:

  return v15;
}

- (void)_removeEntry:(id)a3
{
  void *v4;
  id v5;

  if (a3)
  {
    v5 = a3;
    -[PHImageCache delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageCache:didEvictCacheEntry:", self, v5);

    objc_msgSend(v5, "cancel");
    -[PHRecyclableObjectVendor recycleObject:](self->_entryVendor, "recycleObject:", v5);

  }
}

- (BOOL)pinEntryForKey:(id)a3 requestID:(int)a4 inFlightRequestID:(int *)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary objectForKey:](self->_backingDictionary, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = objc_msgSend(v9, "imageRequestIDForPopulatingCache");
    if (!v11)
      objc_msgSend(v10, "setImageRequestIDForPopulatingCache:", v6);
    v12 = v10;
  }
  else
  {
    -[PHRecyclableObjectVendor dequeueRecyclableObject](self->_entryVendor, "dequeueRecyclableObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setImageRequestIDForPopulatingCache:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_uncommittedInserts, "setObject:forKeyedSubscript:", v12, v8);
    v11 = 0;
  }
  -[NSMutableDictionary removeObjectForKey:](self->_uncommittedDeletes, "removeObjectForKey:", v8);
  os_unfair_lock_unlock(&self->_lock);
  if (a5)
    *a5 = v11;

  return v10 == 0;
}

- (void)removeEntriesForKeys:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8);
        os_unfair_lock_lock(&self->_lock);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_backingDictionary, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10
          || (-[NSMutableDictionary objectForKeyedSubscript:](self->_uncommittedInserts, "objectForKeyedSubscript:", v9),
              (v10 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_uncommittedDeletes, "setObject:forKeyedSubscript:", v10, v9);

        }
        -[NSMutableDictionary removeObjectForKey:](self->_uncommittedInserts, "removeObjectForKey:", v9);
        os_unfair_lock_unlock(&self->_lock);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (void)removeAllEntries
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_uncommittedDeletes, "addEntriesFromDictionary:", self->_backingDictionary);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_uncommittedDeletes, "addEntriesFromDictionary:", self->_uncommittedInserts);
  -[NSMutableDictionary removeAllObjects](self->_uncommittedInserts, "removeAllObjects");
  os_unfair_lock_unlock(p_lock);
}

- (void)commitChangesWithQueueToProcessDeletes:(id)a3
{
  os_unfair_lock_s *p_lock;
  NSObject *v5;
  NSMutableDictionary *backingDictionary;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  PHImageCache *v12;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_backingDictionary, "addEntriesFromDictionary:", self->_uncommittedInserts);
  backingDictionary = self->_backingDictionary;
  -[NSMutableDictionary allKeys](self->_uncommittedDeletes, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectsForKeys:](backingDictionary, "removeObjectsForKeys:", v7);

  v8 = (void *)-[NSMutableDictionary copy](self->_uncommittedDeletes, "copy");
  -[NSMutableDictionary removeAllObjects](self->_uncommittedDeletes, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_uncommittedInserts, "removeAllObjects");
  os_unfair_lock_unlock(p_lock);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __55__PHImageCache_commitChangesWithQueueToProcessDeletes___block_invoke;
  v10[3] = &unk_1E35DF9E8;
  v11 = v8;
  v12 = self;
  v9 = v8;
  dispatch_async(v5, v10);

}

- (PHImageCacheDelegate)delegate
{
  return (PHImageCacheDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_entryVendor, 0);
  objc_storeStrong((id *)&self->_uncommittedDeletes, 0);
  objc_storeStrong((id *)&self->_uncommittedInserts, 0);
  objc_storeStrong((id *)&self->_backingDictionary, 0);
}

uint64_t __55__PHImageCache_commitChangesWithQueueToProcessDeletes___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __55__PHImageCache_commitChangesWithQueueToProcessDeletes___block_invoke_2;
  v3[3] = &unk_1E35D5F60;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "enumerateKeysAndObjectsUsingBlock:", v3);
}

uint64_t __55__PHImageCache_commitChangesWithQueueToProcessDeletes___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeEntry:");
}

void __71__PHImageCache_populateEntryWithImage_requestID_forKey_additionalInfo___block_invoke(uint64_t a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 32));
}

@end

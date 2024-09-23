@implementation EKImageCache

- (EKImageCache)init
{
  EKImageCache *v2;
  EKImageCache *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *cache;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EKImageCache;
  v2 = -[EKImageCache init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    cache = v3->_cache;
    v3->_cache = v4;

  }
  return v3;
}

- (void)updateToCachedVersionOrCacheImage:(id)a3
{
  EKImageKey *v4;
  void *v5;
  void *v6;
  void *v7;
  EKImageKey *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v4 = [EKImageKey alloc];
  objc_msgSend(v11, "source");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[EKImageKey initWithSourceID:identifier:](v4, "initWithSourceID:identifier:", v6, v7);

  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_cache, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    os_unfair_lock_unlock(&self->_lock);
    objc_msgSend(v11, "setBackingObject:", v9);
    objc_msgSend(v11, "_resetAfterUpdatingChangeSetOrBackingObject");
    objc_msgSend(v11, "markAsSaved");
  }
  else
  {
    objc_msgSend(v11, "persistentObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cache, "setObject:forKeyedSubscript:", v10, v8);

    os_unfair_lock_unlock(&self->_lock);
  }

}

- (id)persistentImageForSourceID:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  EKImageKey *v8;
  void *v9;
  os_unfair_lock_s lock;

  v6 = a4;
  v7 = a3;
  v8 = -[EKImageKey initWithSourceID:identifier:]([EKImageKey alloc], "initWithSourceID:identifier:", v7, v6);

  lock._os_unfair_lock_opaque = 0;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_cache, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&lock);

  return v9;
}

- (void)uncacheImage:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_cache;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_cache, "objectForKeyedSubscript:", v10, (_QWORD)v12);
        v11 = (id)objc_claimAutoreleasedReturnValue();

        if (v11 == v4)
        {
          -[NSMutableDictionary removeObjectForKey:](self->_cache, "removeObjectForKey:", v10);
          goto LABEL_11;
        }
      }
      v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  os_unfair_lock_unlock(&self->_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
}

@end

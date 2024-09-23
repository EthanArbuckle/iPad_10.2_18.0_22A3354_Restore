@implementation _NTKDeviceSyncedAlbumObserver

- (_NTKDeviceSyncedAlbumObserver)initWithDevice:(id)a3
{
  id v5;
  _NTKDeviceSyncedAlbumObserver *v6;
  _NTKDeviceSyncedAlbumObserver *v7;
  uint64_t v8;
  NSHashTable *observers;
  NSString *syncedAlbumName;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_NTKDeviceSyncedAlbumObserver;
  v6 = -[_NTKDeviceSyncedAlbumObserver init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v8 = objc_claimAutoreleasedReturnValue();
    observers = v7->_observers;
    v7->_observers = (NSHashTable *)v8;

    v7->_lock._os_unfair_lock_opaque = 0;
    syncedAlbumName = v7->_syncedAlbumName;
    v7->_syncedAlbumName = 0;

  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[NPTOCollectionTargetLibrary removeObserver:](self->_library, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)_NTKDeviceSyncedAlbumObserver;
  -[_NTKDeviceSyncedAlbumObserver dealloc](&v3, sel_dealloc);
}

- (void)addObserver:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (!-[NSHashTable containsObject:](self->_observers, "containsObject:", v4))
  {
    -[NSHashTable addObject:](self->_observers, "addObject:", v4);
    -[_NTKDeviceSyncedAlbumObserver _startObserving](self, "_startObserving");
  }
  os_unfair_lock_unlock(&self->_lock);

}

- (void)removeObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable removeObject:](self->_observers, "removeObject:", v5);

  -[_NTKDeviceSyncedAlbumObserver _stopObserving](self, "_stopObserving");
  os_unfair_lock_unlock(p_lock);
}

- (void)_startObserving
{
  NPTOCollectionTargetLibrary *library;
  NPTOCollectionTargetLibrary *v4;
  NPTOCollectionTargetLibrary *v5;
  void *v6;
  void *v7;
  NSString *v8;
  NSString *syncedAlbumName;
  id v10;

  -[NSHashTable allObjects](self->_observers, "allObjects");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "count"))
    goto LABEL_5;
  library = self->_library;

  if (library)
    return;
  v4 = (NPTOCollectionTargetLibrary *)objc_msgSend(objc_alloc(MEMORY[0x1E0D515F8]), "initWithCollectionTarget:device:", 1, self->_device);
  v5 = self->_library;
  self->_library = v4;

  -[NPTOCollectionTargetLibrary addObserver:](self->_library, "addObserver:", self);
  -[NPTOCollectionTargetLibrary assetCollections](self->_library, "assetCollections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "anyObject");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v10;
  if (v10)
  {
    _NTKTrueAlbumNameForAssetCollection(v10);
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    syncedAlbumName = self->_syncedAlbumName;
    self->_syncedAlbumName = v8;

LABEL_5:
    v7 = v10;
  }

}

- (void)_stopObserving
{
  void *v3;
  uint64_t v4;
  NPTOCollectionTargetLibrary *library;
  NSString *syncedAlbumName;

  -[NSHashTable allObjects](self->_observers, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
  {
    -[NPTOCollectionTargetLibrary removeObserver:](self->_library, "removeObserver:", self);
    library = self->_library;
    self->_library = 0;

    syncedAlbumName = self->_syncedAlbumName;
    self->_syncedAlbumName = 0;

  }
}

- (void)collectionTargetLibraryDidUpdate:(id)a3
{
  NPTOCollectionTargetLibrary *v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;
  NSString *syncedAlbumName;
  NSString *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = (NPTOCollectionTargetLibrary *)a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_library == v4)
  {
    -[NPTOCollectionTargetLibrary assetCollections](v4, "assetCollections");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "anyObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    syncedAlbumName = self->_syncedAlbumName;
    self->_syncedAlbumName = 0;

    if (v7)
    {
      _NTKTrueAlbumNameForAssetCollection(v7);
      v9 = (NSString *)objc_claimAutoreleasedReturnValue();
      v10 = self->_syncedAlbumName;
      self->_syncedAlbumName = v9;

    }
    v11 = (void *)MEMORY[0x1E0C99D20];
    -[NSHashTable allObjects](self->_observers, "allObjects");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "arrayWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock(p_lock);
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v14 = v13;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v20;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v20 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v18++), "photoAlbumChanged", (_QWORD)v19);
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v16);
    }

  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }

}

- (NRDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (NSString)syncedAlbumName
{
  return self->_syncedAlbumName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_syncedAlbumName, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_library, 0);
}

@end

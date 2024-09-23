@implementation NTKSyncedAlbumObserver

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_16 != -1)
    dispatch_once(&sharedInstance_onceToken_16, &__block_literal_global_115);
  return (id)sharedInstance_sharedInstance_1;
}

void __40__NTKSyncedAlbumObserver_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_sharedInstance_1;
  sharedInstance_sharedInstance_1 = v0;

}

- (NTKSyncedAlbumObserver)init
{
  NTKSyncedAlbumObserver *v2;
  uint64_t v3;
  NSMutableDictionary *deviceAlbumObservers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NTKSyncedAlbumObserver;
  v2 = -[NTKSyncedAlbumObserver init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    deviceAlbumObservers = v2->_deviceAlbumObservers;
    v2->_deviceAlbumObservers = (NSMutableDictionary *)v3;

    v2->_observersLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (void)addObserver:(id)a3 forDevice:(id)a4
{
  id v6;
  void *v7;
  _NTKDeviceSyncedAlbumObserver *v8;
  _NTKDeviceSyncedAlbumObserver *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  objc_msgSend(v6, "nrDeviceUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    os_unfair_lock_lock(&self->_observersLock);
    -[NSMutableDictionary objectForKey:](self->_deviceAlbumObservers, "objectForKey:", v7);
    v8 = (_NTKDeviceSyncedAlbumObserver *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v9 = [_NTKDeviceSyncedAlbumObserver alloc];
      objc_msgSend(v6, "nrDevice");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[_NTKDeviceSyncedAlbumObserver initWithDevice:](v9, "initWithDevice:", v10);

      -[NSMutableDictionary setObject:forKey:](self->_deviceAlbumObservers, "setObject:forKey:", v8, v7);
    }
    os_unfair_lock_unlock(&self->_observersLock);
    -[_NTKDeviceSyncedAlbumObserver addObserver:](v8, "addObserver:", v11);

  }
}

- (void)removeObserver:(id)a3 forDevice:(id)a4
{
  void *v6;
  os_unfair_lock_s *p_observersLock;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(a4, "nrDeviceUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    p_observersLock = &self->_observersLock;
    os_unfair_lock_lock(&self->_observersLock);
    -[NSMutableDictionary objectForKey:](self->_deviceAlbumObservers, "objectForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(p_observersLock);
    objc_msgSend(v8, "removeObserver:", v9);

  }
}

- (id)syncedAlbumNameForDevice:(id)a3
{
  void *v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;

  objc_msgSend(a3, "nrDeviceUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    os_unfair_lock_lock(&self->_observersLock);
    -[NSMutableDictionary objectForKey:](self->_deviceAlbumObservers, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(&self->_observersLock);
    if (v5)
    {
      objc_msgSend(v5, "syncedAlbumName");
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }
  if (v6)
    v7 = v6;
  else
    v7 = &stru_1E6BDC918;
  v8 = v7;

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceAlbumObservers, 0);
}

@end

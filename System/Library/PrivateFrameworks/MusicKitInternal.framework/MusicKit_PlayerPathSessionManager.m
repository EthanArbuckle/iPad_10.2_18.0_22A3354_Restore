@implementation MusicKit_PlayerPathSessionManager

- (MusicKit_PlayerPathSessionManager)init
{
  MusicKit_PlayerPathSessionManager *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *sessionIDsByPlayerPath;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MusicKit_PlayerPathSessionManager;
  v2 = -[MusicKit_PlayerPathSessionManager init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    sessionIDsByPlayerPath = v2->_sessionIDsByPlayerPath;
    v2->_sessionIDsByPlayerPath = v3;

    v2->_lock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

+ (MusicKit_PlayerPathSessionManager)sharedSessionManager
{
  if (sharedSessionManager_sOnceToken != -1)
    dispatch_once(&sharedSessionManager_sOnceToken, &__block_literal_global_12);
  return (MusicKit_PlayerPathSessionManager *)(id)sharedSessionManager_sSharedSessionManager;
}

- (id)sessionIDForPlayerPath:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v5 = v4;
  -[NSMutableDictionary objectForKey:](self->_sessionIDsByPlayerPath, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary setObject:forKey:](self->_sessionIDsByPlayerPath, "setObject:forKey:", v6, v5);
  }
  os_unfair_lock_unlock(&self->_lock);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionIDsByPlayerPath, 0);
}

@end

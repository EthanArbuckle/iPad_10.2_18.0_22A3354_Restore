@implementation _IDSDeviceConnectionActiveMap

+ (id)sharedInstance
{
  if (qword_1ECDD6738 != -1)
    dispatch_once(&qword_1ECDD6738, &unk_1E2C5FAD0);
  return (id)qword_1ECDD66F8;
}

- (_IDSDeviceConnectionActiveMap)init
{
  NSObject *v3;
  _IDSDeviceConnectionActiveMap *v4;
  _IDSDeviceConnectionActiveMap *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *activeConnectionMap;
  NSMutableSet *v8;
  NSMutableSet *openConnections;
  objc_super v11;

  if (_IDSRunningInDaemon())
  {
    +[IDSLogging IDSDeviceConnection](IDSLogging, "IDSDeviceConnection");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      sub_1907ECC80();

    v4 = 0;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)_IDSDeviceConnectionActiveMap;
    v5 = -[_IDSDeviceConnectionActiveMap init](&v11, sel_init);
    if (v5)
    {
      v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      activeConnectionMap = v5->_activeConnectionMap;
      v5->_activeConnectionMap = v6;

      v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      openConnections = v5->_openConnections;
      v5->_openConnections = v8;

      v5->_writeLock._os_unfair_lock_opaque = 0;
    }
    self = v5;
    v4 = self;
  }

  return v4;
}

- (void)setActiveConnection:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  int v10;
  id v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  os_unfair_lock_lock(&self->_writeLock);
  -[NSMutableDictionary objectForKey:](self->_activeConnectionMap, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    +[IDSTransportLog IDSDeviceConnection](IDSTransportLog, "IDSDeviceConnection");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412802;
      v11 = v6;
      v12 = 2112;
      v13 = v8;
      v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_1906E0000, v9, OS_LOG_TYPE_DEFAULT, "Warning. Setting active connection %@ without closing existing %@ for key %@", (uint8_t *)&v10, 0x20u);
    }

  }
  -[NSMutableDictionary setObject:forKey:](self->_activeConnectionMap, "setObject:forKey:", v7, v6);
  -[NSMutableSet addObject:](self->_openConnections, "addObject:", v7);

  os_unfair_lock_unlock(&self->_writeLock);
}

- (BOOL)hasActiveConnection:(id)a3 forKey:(id)a4
{
  os_unfair_lock_s *p_writeLock;
  id v7;
  id v8;
  void *v9;

  p_writeLock = &self->_writeLock;
  v7 = a4;
  v8 = a3;
  os_unfair_lock_lock(p_writeLock);
  -[NSMutableDictionary objectForKey:](self->_activeConnectionMap, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_writeLock);
  LOBYTE(p_writeLock) = objc_msgSend(v9, "isEqualToString:", v8);

  return (char)p_writeLock;
}

- (void)removeActiveConnection:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  int v8;
  id v9;

  v9 = a4;
  v6 = a3;
  os_unfair_lock_lock(&self->_writeLock);
  -[NSMutableDictionary objectForKey:](self->_activeConnectionMap, "objectForKey:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", v6);

  if (v8)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_activeConnectionMap, "removeObjectForKey:", v9);
    -[NSMutableSet removeObject:](self->_openConnections, "removeObject:", v7);
  }
  os_unfair_lock_unlock(&self->_writeLock);

}

- (int)getActiveConnectionCount
{
  _IDSDeviceConnectionActiveMap *v2;
  os_unfair_lock_s *p_writeLock;

  v2 = self;
  p_writeLock = &self->_writeLock;
  os_unfair_lock_lock(&self->_writeLock);
  LODWORD(v2) = -[NSMutableDictionary count](v2->_activeConnectionMap, "count");
  os_unfair_lock_unlock(p_writeLock);
  return (int)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_openConnections, 0);
  objc_storeStrong((id *)&self->_activeConnectionMap, 0);
}

@end

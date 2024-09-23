@implementation MRAVDistantExternalDeviceFactory

- (MRAVDistantExternalDeviceFactory)init
{
  MRAVDistantExternalDeviceFactory *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MRAVDistantExternalDeviceFactory;
  result = -[MRAVDistantExternalDeviceFactory init](&v3, sel_init);
  if (result)
    result->_lock._os_unfair_lock_opaque = 0;
  return result;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<%@:%p %@>"), objc_opt_class(), self, self->_distantExternalDevices);
}

- (NSArray)externalDevices
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary allValues](self->_distantExternalDevices, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (id)distantExternalDeviceForEndpoint:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *distantExternalDevices;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  NSObject *v13;
  void *v14;
  NSMutableDictionary *v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[MRAVDistantExternalDeviceFactory _withLock_purgeCache](self, "_withLock_purgeCache");
  distantExternalDevices = self->_distantExternalDevices;
  objc_msgSend(v4, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](distantExternalDevices, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    _MRLogForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "debugName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412546;
      v19 = v10;
      v20 = 2112;
      v21 = v8;
      _os_log_impl(&dword_193827000, v9, OS_LOG_TYPE_DEFAULT, "[MRAVDistantExternalDeviceFactory] Reusing distantExternalDevice for endpoint %@ %@", (uint8_t *)&v18, 0x16u);

    }
  }
  else
  {
    -[MRAVDistantExternalDeviceFactory _withLock_createDistantExternalDeviceForEndpoint:](self, "_withLock_createDistantExternalDeviceForEndpoint:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      if (!self->_distantExternalDevices)
      {
        v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        v12 = self->_distantExternalDevices;
        self->_distantExternalDevices = v11;

      }
      _MRLogForCategory(0);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v4, "debugName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138412546;
        v19 = v14;
        v20 = 2112;
        v21 = v8;
        _os_log_impl(&dword_193827000, v13, OS_LOG_TYPE_DEFAULT, "[MRAVDistantExternalDeviceFactory] Caching distantExternalDevice for endpoint %@ %@", (uint8_t *)&v18, 0x16u);

      }
      v15 = self->_distantExternalDevices;
      objc_msgSend(v4, "uniqueIdentifier");
      v9 = objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v8, v9);
    }
    else
    {
      _MRLogForCategory(0);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v4, "debugName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138412546;
        v19 = v16;
        v20 = 2112;
        v21 = 0;
        _os_log_impl(&dword_193827000, v9, OS_LOG_TYPE_DEFAULT, "[MRAVDistantExternalDeviceFactory] Failed to create distantExternalDevice for endpoint %@ %@", (uint8_t *)&v18, 0x16u);

        v8 = 0;
      }
    }
  }

  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (id)_withLock_createDistantExternalDeviceForEndpoint:(id)a3
{
  id v3;
  void *v4;
  MRDistantExternalDevice *v5;

  v3 = a3;
  objc_msgSend(v3, "externalDeviceListenerEndpoint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = -[MRDistantExternalDevice initWithExternalDeviceListenerEndpoint:endpoint:]([MRDistantExternalDevice alloc], "initWithExternalDeviceListenerEndpoint:endpoint:", v4, v3);
  else
    v5 = 0;

  return v5;
}

- (void)_withLock_purgeCache
{
  id v3;
  _QWORD v4[5];

  v3 = (id)-[NSMutableDictionary copy](self->_distantExternalDevices, "copy");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__MRAVDistantExternalDeviceFactory__withLock_purgeCache__block_invoke;
  v4[3] = &unk_1E30CAFA8;
  v4[4] = self;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v4);

}

void __56__MRAVDistantExternalDeviceFactory__withLock_purgeCache__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if ((objc_msgSend(v6, "isValid") & 1) == 0)
  {
    _MRLogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412546;
      v9 = v5;
      v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_193827000, v7, OS_LOG_TYPE_DEFAULT, "[MRAVDistantExternalDeviceFactory] Purging distantExternalDevice %@ %@", (uint8_t *)&v8, 0x16u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObjectForKey:", v5);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distantExternalDevices, 0);
}

@end

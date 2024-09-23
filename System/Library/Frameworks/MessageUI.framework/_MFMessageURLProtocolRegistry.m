@implementation _MFMessageURLProtocolRegistry

+ (id)sharedRegistry
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47___MFMessageURLProtocolRegistry_sharedRegistry__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedRegistry_onceToken != -1)
    dispatch_once(&sharedRegistry_onceToken, block);
  return (id)sharedRegistry_instance;
}

- (_MFMessageURLProtocolRegistry)init
{
  _MFMessageURLProtocolRegistry *v2;
  _MFMessageURLProtocolRegistry *v3;
  uint64_t v4;
  NSMapTable *storage;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_MFMessageURLProtocolRegistry;
  v2 = -[_MFMessageURLProtocolRegistry init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
    v4 = objc_claimAutoreleasedReturnValue();
    storage = v3->_storage;
    v3->_storage = (NSMapTable *)v4;

  }
  return v3;
}

- (void)registerContentRepresentation:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "contentURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    os_unfair_lock_lock(&self->_lock);
    -[NSMapTable setObject:forKey:](self->_storage, "setObject:forKey:", v4, v5);
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    +[MFMessageURLProtocol log](MFMessageURLProtocol, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "ef_publicDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MFMessageURLProtocolRegistry registerContentRepresentation:].cold.1(v7, (uint64_t)v8, v6);
    }

  }
}

- (id)contentRepresentationForURL:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;

  v4 = a3;
  if (v4)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    -[NSMapTable objectForKey:](self->_storage, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSMapTable)storage
{
  return self->_storage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
}

- (void)registerContentRepresentation:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_0(&dword_1AB96A000, a3, (uint64_t)a3, "unexpected attempt to register a content representation without an associated URL: %{public}@", (uint8_t *)a2);

}

@end

@implementation CHLogServer

- (id)logHandleForDomain:(const char *)a3
{
  os_unfair_lock_s *p_accessorLock;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHLogServer logHandleToDomain](self, "logHandleToDomain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v8 = os_log_create("com.apple.callhistory", a3);
    -[CHLogServer logHandleToDomain](self, "logHandleToDomain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v6);

  }
  os_unfair_lock_unlock(p_accessorLock);
  return v8;
}

- (NSMutableDictionary)logHandleToDomain
{
  return self->_logHandleToDomain;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_4);
  return (id)sharedInstance_sLogServer;
}

void __29__CHLogServer_sharedInstance__block_invoke()
{
  CHLogServer *v0;
  void *v1;

  v0 = objc_alloc_init(CHLogServer);
  v1 = (void *)sharedInstance_sLogServer;
  sharedInstance_sLogServer = (uint64_t)v0;

}

- (CHLogServer)init
{
  CHLogServer *v2;
  CHLogServer *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *logHandleToDomain;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CHLogServer;
  v2 = -[CHLogServer init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_accessorLock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    logHandleToDomain = v3->_logHandleToDomain;
    v3->_logHandleToDomain = v4;

  }
  return v3;
}

- (os_unfair_lock_s)accessorLock
{
  return self->_accessorLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logHandleToDomain, 0);
}

@end

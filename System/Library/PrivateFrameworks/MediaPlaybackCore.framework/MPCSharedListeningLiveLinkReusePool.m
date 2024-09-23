@implementation MPCSharedListeningLiveLinkReusePool

- (MPCSharedListeningLiveLinkReusePool)init
{
  MPCSharedListeningLiveLinkReusePool *v2;
  uint64_t v3;
  NSMapTable *sessionIDLiveLinkMap;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MPCSharedListeningLiveLinkReusePool;
  v2 = -[MPCSharedListeningLiveLinkReusePool init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1650], "strongToWeakObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    sessionIDLiveLinkMap = v2->_sessionIDLiveLinkMap;
    v2->_sessionIDLiveLinkMap = (NSMapTable *)v3;

    v2->_lock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (id)liveLinkForSessionID:(id)a3
{
  id v5;
  os_unfair_lock_s *p_lock;
  void *v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCSharedListeningLiveLinkReusePool.m"), 36, CFSTR("sessionIdentifier must not be nil"));

  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMapTable objectForKey:](self->_sessionIDLiveLinkMap, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);

  return v7;
}

- (void)storeLiveLink:(id)a3 forSessionID:(id)a4
{
  id v6;
  id v7;
  dispatch_time_t v8;
  id v9;
  _QWORD block[4];
  id v11;

  v6 = a3;
  v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  -[NSMapTable setObject:forKey:](self->_sessionIDLiveLinkMap, "setObject:forKey:", v6, v7);

  os_unfair_lock_unlock(&self->_lock);
  v8 = dispatch_time(0, 60000000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__MPCSharedListeningLiveLinkReusePool_storeLiveLink_forSessionID___block_invoke;
  block[3] = &unk_24CABA2D0;
  v11 = v6;
  v9 = v6;
  dispatch_after(v8, MEMORY[0x24BDAC9B8], block);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionIDLiveLinkMap, 0);
}

+ (MPCSharedListeningLiveLinkReusePool)sharedReusePool
{
  if (sharedReusePool_onceToken != -1)
    dispatch_once(&sharedReusePool_onceToken, &__block_literal_global_27533);
  return (MPCSharedListeningLiveLinkReusePool *)(id)sharedReusePool___sharedReusePool;
}

void __54__MPCSharedListeningLiveLinkReusePool_sharedReusePool__block_invoke()
{
  MPCSharedListeningLiveLinkReusePool *v0;
  void *v1;

  v0 = objc_alloc_init(MPCSharedListeningLiveLinkReusePool);
  v1 = (void *)sharedReusePool___sharedReusePool;
  sharedReusePool___sharedReusePool = (uint64_t)v0;

}

@end

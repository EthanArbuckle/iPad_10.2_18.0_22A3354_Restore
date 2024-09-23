@implementation MCMClientIdentityCache

- (MCMCache)cache
{
  return self->_cache;
}

- (MCMClientIdentityCache)init
{
  MCMClientIdentityCache *v2;
  MCMLRUCache *v3;
  MCMCache *cache;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)MCMClientIdentityCache;
  v2 = -[MCMClientIdentityCache init](&v6, sel_init);
  if (v2)
  {
    v3 = -[MCMLRUCache initWithName:maxCount:]([MCMLRUCache alloc], "initWithName:maxCount:", CFSTR("perPersonaClients"), 30);
    cache = v2->_cache;
    v2->_cache = (MCMCache *)v3;

  }
  return v2;
}

- (void)flush
{
  id v2;

  -[MCMClientIdentityCache cache](self, "cache");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (id)clientIdentityWithAuditToken:(id *)a3 proximateAuditToken:(id *)a4 personaUniqueString:(id)a5 error:(id *)a6 generator:(id)a7
{
  void (**v12)(id, id *);
  id v13;
  MCMClientIdentityIndex *v14;
  __int128 v15;
  __int128 v16;
  MCMClientIdentityIndex *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id v24;
  __int128 v26;
  int pid;
  id v28;
  _OWORD v29[2];
  uint8_t buf[16];
  __int128 v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v12 = (void (**)(id, id *))a7;
  v13 = a5;
  v14 = [MCMClientIdentityIndex alloc];
  v15 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)buf = *(_OWORD *)a3->var0;
  v31 = v15;
  v16 = *(_OWORD *)&a4->var0[4];
  v29[0] = *(_OWORD *)a4->var0;
  v29[1] = v16;
  v17 = -[MCMClientIdentityIndex initWithAuditToken:proximateAuditToken:personaUniqueString:](v14, "initWithAuditToken:proximateAuditToken:personaUniqueString:", buf, v29, v13);

  if (!v17)
  {
    container_log_handle_for_category();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v26 = *(_OWORD *)&a3->var0[4];
      *(_OWORD *)buf = *(_OWORD *)a3->var0;
      v31 = v26;
      pid = container_audit_token_get_pid();
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = pid;
      _os_log_error_impl(&dword_1CF807000, v22, OS_LOG_TYPE_ERROR, "Could not generate client identity index for pid %d", buf, 8u);
    }

    v20 = 0;
LABEL_7:
    if (a6)
    {
      v20 = objc_retainAutorelease(v20);
      v21 = 0;
      v19 = 0;
      *a6 = v20;
    }
    else
    {
      v21 = 0;
      v19 = 0;
    }
    goto LABEL_13;
  }
  -[MCMClientIdentityCache cache](self, "cache");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKey:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v20 = 0;
    v21 = 0;
    goto LABEL_13;
  }
  v28 = 0;
  v12[2](v12, &v28);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v28;
  if (!v19)
    goto LABEL_7;
  objc_msgSend(v19, "clientIdentityByChangingCached:", 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    -[MCMClientIdentityCache cache](self, "cache");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKey:", v21, v17);

  }
LABEL_13:
  v24 = v19;

  return v24;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
}

@end

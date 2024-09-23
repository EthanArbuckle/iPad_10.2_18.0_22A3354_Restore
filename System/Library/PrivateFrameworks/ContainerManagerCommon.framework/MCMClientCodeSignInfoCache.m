@implementation MCMClientCodeSignInfoCache

- (id)codeSignInfoForCDHash:(id)a3 identifier:(id)a4 error:(id *)a5 generator:(id)a6
{
  id v10;
  void (**v11)(id, id *);
  id v12;
  MCMClientCodeSignIndex *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = (void (**)(id, id *))a6;
  v12 = a3;
  v13 = -[MCMClientCodeSignIndex initWithCDHash:identifier:]([MCMClientCodeSignIndex alloc], "initWithCDHash:identifier:", v12, v10);

  if (!v13)
  {
    container_log_handle_for_category();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v10;
      _os_log_error_impl(&dword_1CF807000, v18, OS_LOG_TYPE_ERROR, "Could not generate code sign index for [%@]", buf, 0xCu);
    }

    v16 = 0;
LABEL_7:
    if (a5)
    {
      v16 = objc_retainAutorelease(v16);
      v17 = 0;
      v15 = 0;
      *a5 = v16;
    }
    else
    {
      v17 = 0;
      v15 = 0;
    }
    goto LABEL_13;
  }
  -[MCMClientCodeSignInfoCache cache](self, "cache");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = 0;
    v17 = 0;
    goto LABEL_13;
  }
  v24 = 0;
  v11[2](v11, &v24);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v24;
  if (!v15)
    goto LABEL_7;
  objc_msgSend(v15, "clientCodeSignInfoByChangingCached:", 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v19;
  if (v19)
  {
    objc_msgSend(v19, "entitlements");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "prune");

    -[MCMClientCodeSignInfoCache cache](self, "cache");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKey:", v17, v13);

  }
LABEL_13:
  v22 = v15;

  return v22;
}

- (MCMCache)cache
{
  return self->_cache;
}

- (MCMClientCodeSignInfoCache)init
{
  MCMClientCodeSignInfoCache *v2;
  MCMLRUCache *v3;
  MCMCache *cache;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)MCMClientCodeSignInfoCache;
  v2 = -[MCMClientCodeSignInfoCache init](&v6, sel_init);
  if (v2)
  {
    v3 = -[MCMLRUCache initWithName:maxCount:]([MCMLRUCache alloc], "initWithName:maxCount:", CFSTR("clientCodeSignInfo"), 30);
    cache = v2->_cache;
    v2->_cache = (MCMCache *)v3;

  }
  return v2;
}

- (void)flush
{
  id v2;

  -[MCMClientCodeSignInfoCache cache](self, "cache");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
}

@end

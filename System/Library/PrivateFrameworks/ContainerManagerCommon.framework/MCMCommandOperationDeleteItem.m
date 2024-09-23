@implementation MCMCommandOperationDeleteItem

- (MCMCommandOperationDeleteItem)initWithCacheEntry:(id)a3 codeSignIdentifiersToRemove:(id)a4 manifest:(id)a5
{
  id v9;
  id v10;
  id v11;
  MCMCommandOperationDeleteItem *v12;
  MCMCommandOperationDeleteItem *v13;
  objc_super v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MCMCommandOperationDeleteItem;
  v12 = -[MCMCommandOperationDeleteItem init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_cacheEntry, a3);
    objc_storeStrong((id *)&v13->_codeSignIdentifiersToRemove, a4);
    objc_storeStrong((id *)&v13->_manifest, a5);
  }

  return v13;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[MCMCommandOperationDeleteItem cacheEntry](self, "cacheEntry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[MCMCommandOperationDeleteItem cacheEntry](self, "cacheEntry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v5, "isEqual:", v4);

  return (char)self;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MCMCommandOperationDeleteItem cacheEntry](self, "cacheEntry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMCommandOperationDeleteItem codeSignIdentifiersToRemove](self, "codeSignIdentifiersToRemove");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@, removeCS = %@>"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (MCMContainerCacheEntry)cacheEntry
{
  return self->_cacheEntry;
}

- (NSSet)codeSignIdentifiersToRemove
{
  return self->_codeSignIdentifiersToRemove;
}

- (MCMDeleteManifest)manifest
{
  return self->_manifest;
}

- (void)setManifest:(id)a3
{
  objc_storeStrong((id *)&self->_manifest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manifest, 0);
  objc_storeStrong((id *)&self->_codeSignIdentifiersToRemove, 0);
  objc_storeStrong((id *)&self->_cacheEntry, 0);
}

@end

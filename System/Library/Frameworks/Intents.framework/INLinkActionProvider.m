@implementation INLinkActionProvider

- (INLinkActionProvider)init
{
  INLinkActionProvider *v2;
  INLinkActionProvider *v3;
  uint64_t v4;
  NSMutableDictionary *lockCachedActionIdentifiers;
  uint64_t v6;
  NSMutableDictionary *lockCachedEntityIdentifiers;
  INLinkActionProvider *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)INLinkActionProvider;
  v2 = -[INLinkActionProvider init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_cacheLinkMetadata = 1;
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = objc_opt_new();
    lockCachedActionIdentifiers = v3->_lockCachedActionIdentifiers;
    v3->_lockCachedActionIdentifiers = (NSMutableDictionary *)v4;

    v6 = objc_opt_new();
    lockCachedEntityIdentifiers = v3->_lockCachedEntityIdentifiers;
    v3->_lockCachedEntityIdentifiers = (NSMutableDictionary *)v6;

    v8 = v3;
  }

  return v3;
}

- (NSDictionary)actionsGroupedByBundleIdentifier
{
  os_unfair_lock_s *p_lock;
  void *v4;
  id v5;
  void *v6;
  uint64_t v8;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[INLinkActionProvider cachedActions](self, "cachedActions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  if (v4)
  {
    v5 = v4;
  }
  else
  {
    -[INLinkActionProvider metadataProvider](self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    objc_msgSend(v6, "actionsWithError:", &v8);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (v5 && -[INLinkActionProvider isCachingLinkMetadata](self, "isCachingLinkMetadata"))
      -[INLinkActionProvider cacheActions:](self, "cacheActions:", v5);

  }
  return (NSDictionary *)v5;
}

- (NSDictionary)entitiesGroupedByBundleIdentifier
{
  void *v3;
  void *v5;
  void *v6;
  uint64_t v7;

  -[INLinkActionProvider cachedEntities](self, "cachedEntities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[INLinkActionProvider cachedEntities](self, "cachedEntities");
    return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[INLinkActionProvider metadataProvider](self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    objc_msgSend(v5, "entitiesWithError:", &v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      if (-[INLinkActionProvider isCachingLinkMetadata](self, "isCachingLinkMetadata"))
        -[INLinkActionProvider cacheEntities:](self, "cacheEntities:", v6);
    }

    return (NSDictionary *)v6;
  }
}

- (id)bundleIdentifiers
{
  void *v3;
  void *v4;
  uint64_t v6;

  -[INLinkActionProvider metadataProvider](self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  objc_msgSend(v3, "bundlesWithError:", &v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && -[INLinkActionProvider isCachingLinkMetadata](self, "isCachingLinkMetadata"))
    -[INLinkActionProvider cacheBundleIdentifiers:](self, "cacheBundleIdentifiers:", v4);

  return v4;
}

- (id)supportedActionIdentifiersForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v15;
  id v16;

  v4 = a3;
  -[INLinkActionProvider cachedActions](self, "cachedActions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[INLinkActionProvider cachedActionIdentifiersForBundleIdentifier:](self, "cachedActionIdentifiersForBundleIdentifier:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v8 = v9;
LABEL_12:

      goto LABEL_13;
    }
    -[INLinkActionProvider metadataProvider](self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v16 = 0;
      objc_msgSend(v11, "actionIdentifiersForBundleIdentifier:error:", v4, &v16);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v12 = v16;
      if (!v8)
        goto LABEL_11;
    }
    else
    {
      v15 = 0;
      objc_msgSend(v11, "actionsForBundleIdentifier:error:", v4, &v15);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v15;
      objc_msgSend(v13, "if_compactMap:", &__block_literal_global_145374);
      v8 = (id)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
LABEL_11:

        goto LABEL_12;
      }
    }
    if (-[INLinkActionProvider isCachingLinkMetadata](self, "isCachingLinkMetadata"))
      -[INLinkActionProvider cacheActionIdentifiers:forBundleIdentifier:](self, "cacheActionIdentifiers:forBundleIdentifier:", v8, v4);
    goto LABEL_11;
  }
  -[INLinkActionProvider cachedActions](self, "cachedActions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "allKeys");
  v8 = (id)objc_claimAutoreleasedReturnValue();

LABEL_13:
  return v8;
}

- (id)supportedEntityIdentifiersForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v15;
  id v16;

  v4 = a3;
  -[INLinkActionProvider cachedEntities](self, "cachedEntities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[INLinkActionProvider cachedEntityIdentifiersForBundleIdentifier:](self, "cachedEntityIdentifiersForBundleIdentifier:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v8 = v9;
LABEL_12:

      goto LABEL_13;
    }
    -[INLinkActionProvider metadataProvider](self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v16 = 0;
      objc_msgSend(v11, "entityIdentifiersForBundleIdentifier:error:", v4, &v16);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v12 = v16;
      if (!v8)
        goto LABEL_11;
    }
    else
    {
      v15 = 0;
      objc_msgSend(v11, "entitiesForBundleIdentifier:error:", v4, &v15);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v15;
      objc_msgSend(v13, "if_compactMap:", &__block_literal_global_8_145363);
      v8 = (id)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
LABEL_11:

        goto LABEL_12;
      }
    }
    if (-[INLinkActionProvider isCachingLinkMetadata](self, "isCachingLinkMetadata"))
      -[INLinkActionProvider cacheEntityIdentifiers:forBundleIdentifier:](self, "cacheEntityIdentifiers:forBundleIdentifier:", v8, v4);
    goto LABEL_11;
  }
  -[INLinkActionProvider cachedEntities](self, "cachedEntities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "allKeys");
  v8 = (id)objc_claimAutoreleasedReturnValue();

LABEL_13:
  return v8;
}

- (id)cachedBundleIdentifiers
{
  void (**v3)(_QWORD);
  NSArray *lockCachedBundleIdentifiers;
  NSArray *v5;
  _QWORD v7[5];

  os_unfair_lock_lock(&self->_lock);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__INLinkActionProvider_cachedBundleIdentifiers__block_invoke;
  v7[3] = &unk_1E2294DE0;
  v7[4] = self;
  v3 = (void (**)(_QWORD))MEMORY[0x18D7812C4](v7);
  if (self)
    lockCachedBundleIdentifiers = self->_lockCachedBundleIdentifiers;
  else
    lockCachedBundleIdentifiers = 0;
  v5 = lockCachedBundleIdentifiers;
  v3[2](v3);

  return v5;
}

- (id)cachedActions
{
  void (**v3)(_QWORD);
  NSDictionary *lockCachedActions;
  NSDictionary *v5;
  _QWORD v7[5];

  os_unfair_lock_lock(&self->_lock);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__INLinkActionProvider_cachedActions__block_invoke;
  v7[3] = &unk_1E2294DE0;
  v7[4] = self;
  v3 = (void (**)(_QWORD))MEMORY[0x18D7812C4](v7);
  if (self)
    lockCachedActions = self->_lockCachedActions;
  else
    lockCachedActions = 0;
  v5 = lockCachedActions;
  v3[2](v3);

  return v5;
}

- (id)cachedEntities
{
  void (**v3)(_QWORD);
  NSDictionary *lockCachedEntities;
  NSDictionary *v5;
  _QWORD v7[5];

  os_unfair_lock_lock(&self->_lock);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__INLinkActionProvider_cachedEntities__block_invoke;
  v7[3] = &unk_1E2294DE0;
  v7[4] = self;
  v3 = (void (**)(_QWORD))MEMORY[0x18D7812C4](v7);
  if (self)
    lockCachedEntities = self->_lockCachedEntities;
  else
    lockCachedEntities = 0;
  v5 = lockCachedEntities;
  v3[2](v3);

  return v5;
}

- (id)cachedActionIdentifiersForBundleIdentifier:(id)a3
{
  id v4;
  void (**v5)(_QWORD);
  NSMutableDictionary *lockCachedActionIdentifiers;
  NSMutableDictionary *v7;
  void *v8;
  _QWORD v10[5];

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67__INLinkActionProvider_cachedActionIdentifiersForBundleIdentifier___block_invoke;
  v10[3] = &unk_1E2294DE0;
  v10[4] = self;
  v5 = (void (**)(_QWORD))MEMORY[0x18D7812C4](v10);
  if (self)
    lockCachedActionIdentifiers = self->_lockCachedActionIdentifiers;
  else
    lockCachedActionIdentifiers = 0;
  v7 = lockCachedActionIdentifiers;
  -[NSMutableDictionary objectForKey:](v7, "objectForKey:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v5[2](v5);
  return v8;
}

- (id)cachedEntityIdentifiersForBundleIdentifier:(id)a3
{
  id v4;
  void (**v5)(_QWORD);
  NSMutableDictionary *lockCachedEntityIdentifiers;
  NSMutableDictionary *v7;
  void *v8;
  _QWORD v10[5];

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67__INLinkActionProvider_cachedEntityIdentifiersForBundleIdentifier___block_invoke;
  v10[3] = &unk_1E2294DE0;
  v10[4] = self;
  v5 = (void (**)(_QWORD))MEMORY[0x18D7812C4](v10);
  if (self)
    lockCachedEntityIdentifiers = self->_lockCachedEntityIdentifiers;
  else
    lockCachedEntityIdentifiers = 0;
  v7 = lockCachedEntityIdentifiers;
  -[NSMutableDictionary objectForKey:](v7, "objectForKey:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v5[2](v5);
  return v8;
}

- (void)cacheBundleIdentifiers:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void (**v6)(_QWORD);
  _QWORD v7[5];

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__INLinkActionProvider_cacheBundleIdentifiers___block_invoke;
  v7[3] = &unk_1E2294DE0;
  v7[4] = self;
  v6 = (void (**)(_QWORD))MEMORY[0x18D7812C4](v7);
  -[INLinkActionProvider setLockCachedBundleIdentifiers:]((uint64_t)self, v5);

  v6[2](v6);
}

- (void)cacheActions:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void (**v6)(_QWORD);
  _QWORD v7[5];

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__INLinkActionProvider_cacheActions___block_invoke;
  v7[3] = &unk_1E2294DE0;
  v7[4] = self;
  v6 = (void (**)(_QWORD))MEMORY[0x18D7812C4](v7);
  -[INLinkActionProvider setLockCachedActions:]((uint64_t)self, v5);

  v6[2](v6);
}

- (void)cacheEntities:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void (**v6)(_QWORD);
  _QWORD v7[5];

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__INLinkActionProvider_cacheEntities___block_invoke;
  v7[3] = &unk_1E2294DE0;
  v7[4] = self;
  v6 = (void (**)(_QWORD))MEMORY[0x18D7812C4](v7);
  -[INLinkActionProvider setLockCachedEntities:]((uint64_t)self, v5);

  v6[2](v6);
}

- (void)cacheActionIdentifiers:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD);
  NSMutableDictionary *lockCachedActionIdentifiers;
  NSMutableDictionary *v10;
  _QWORD v11[5];

  v6 = a3;
  v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __67__INLinkActionProvider_cacheActionIdentifiers_forBundleIdentifier___block_invoke;
  v11[3] = &unk_1E2294DE0;
  v11[4] = self;
  v8 = (void (**)(_QWORD))MEMORY[0x18D7812C4](v11);
  if (self)
    lockCachedActionIdentifiers = self->_lockCachedActionIdentifiers;
  else
    lockCachedActionIdentifiers = 0;
  v10 = lockCachedActionIdentifiers;
  -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v6, v7);

  v8[2](v8);
}

- (void)cacheEntityIdentifiers:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD);
  NSMutableDictionary *lockCachedEntityIdentifiers;
  NSMutableDictionary *v10;
  _QWORD v11[5];

  v6 = a3;
  v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __67__INLinkActionProvider_cacheEntityIdentifiers_forBundleIdentifier___block_invoke;
  v11[3] = &unk_1E2294DE0;
  v11[4] = self;
  v8 = (void (**)(_QWORD))MEMORY[0x18D7812C4](v11);
  if (self)
    lockCachedEntityIdentifiers = self->_lockCachedEntityIdentifiers;
  else
    lockCachedEntityIdentifiers = 0;
  v10 = lockCachedEntityIdentifiers;
  -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v6, v7);

  v8[2](v8);
}

- (void)evictCache
{
  void (**v3)(_QWORD);
  void *v4;
  void *v5;
  _QWORD v6[5];

  os_unfair_lock_lock(&self->_lock);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__INLinkActionProvider_evictCache__block_invoke;
  v6[3] = &unk_1E2294DE0;
  v6[4] = self;
  v3 = (void (**)(_QWORD))MEMORY[0x18D7812C4](v6);
  -[INLinkActionProvider setLockCachedBundleIdentifiers:]((uint64_t)self, 0);
  -[INLinkActionProvider setLockCachedActions:]((uint64_t)self, 0);
  -[INLinkActionProvider setLockCachedEntities:]((uint64_t)self, 0);
  v4 = (void *)objc_opt_new();
  if (self)
    objc_storeStrong((id *)&self->_lockCachedActionIdentifiers, v4);

  v5 = (void *)objc_opt_new();
  if (self)
    objc_storeStrong((id *)&self->_lockCachedEntityIdentifiers, v5);

  v3[2](v3);
}

- (BOOL)isCachingLinkMetadata
{
  return self->_cacheLinkMetadata;
}

- (void)setCacheLinkMetadata:(BOOL)a3
{
  self->_cacheLinkMetadata = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockCachedEntities, 0);
  objc_storeStrong((id *)&self->_lockCachedActions, 0);
  objc_storeStrong((id *)&self->_lockCachedEntityIdentifiers, 0);
  objc_storeStrong((id *)&self->_lockCachedActionIdentifiers, 0);
  objc_storeStrong((id *)&self->_lockCachedBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_metadataProvider, 0);
}

void __34__INLinkActionProvider_evictCache__block_invoke(uint64_t a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
}

- (void)setLockCachedBundleIdentifiers:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 24), a2);
}

- (void)setLockCachedActions:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 48), a2);
}

- (void)setLockCachedEntities:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 56), a2);
}

void __67__INLinkActionProvider_cacheEntityIdentifiers_forBundleIdentifier___block_invoke(uint64_t a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
}

void __67__INLinkActionProvider_cacheActionIdentifiers_forBundleIdentifier___block_invoke(uint64_t a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
}

void __38__INLinkActionProvider_cacheEntities___block_invoke(uint64_t a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
}

void __37__INLinkActionProvider_cacheActions___block_invoke(uint64_t a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
}

void __47__INLinkActionProvider_cacheBundleIdentifiers___block_invoke(uint64_t a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
}

void __67__INLinkActionProvider_cachedEntityIdentifiersForBundleIdentifier___block_invoke(uint64_t a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
}

void __67__INLinkActionProvider_cachedActionIdentifiersForBundleIdentifier___block_invoke(uint64_t a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
}

void __38__INLinkActionProvider_cachedEntities__block_invoke(uint64_t a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
}

void __37__INLinkActionProvider_cachedActions__block_invoke(uint64_t a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
}

void __47__INLinkActionProvider_cachedBundleIdentifiers__block_invoke(uint64_t a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
}

- (_QWORD)metadataProvider
{
  _QWORD *v1;
  void *v2;
  void *v3;
  objc_class *v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  if (a1)
  {
    v1 = a1;
    v2 = (void *)a1[2];
    if (!v2)
    {
      v9 = 0;
      v10 = &v9;
      v11 = 0x2050000000;
      v3 = (void *)getLNMetadataProviderClass_softClass;
      v12 = getLNMetadataProviderClass_softClass;
      if (!getLNMetadataProviderClass_softClass)
      {
        v8[0] = MEMORY[0x1E0C809B0];
        v8[1] = 3221225472;
        v8[2] = __getLNMetadataProviderClass_block_invoke;
        v8[3] = &unk_1E22953C0;
        v8[4] = &v9;
        __getLNMetadataProviderClass_block_invoke((uint64_t)v8);
        v3 = (void *)v10[3];
      }
      v4 = objc_retainAutorelease(v3);
      _Block_object_dispose(&v9, 8);
      v5 = objc_alloc_init(v4);
      v6 = (void *)v1[2];
      v1[2] = v5;

      v2 = (void *)v1[2];
    }
    a1 = v2;
  }
  return a1;
}

id __70__INLinkActionProvider_supportedEntityIdentifiersForBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(a2, "valueForKey:", CFSTR("identifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = v2;
    else
      v3 = 0;
  }
  else
  {
    v3 = 0;
  }
  v4 = v3;

  return v4;
}

id __70__INLinkActionProvider_supportedActionIdentifiersForBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(a2, "valueForKey:", CFSTR("identifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = v2;
    else
      v3 = 0;
  }
  else
  {
    v3 = 0;
  }
  v4 = v3;

  return v4;
}

+ (INLinkActionProvider)sharedProvider
{
  if (sharedProvider_onceToken_145382 != -1)
    dispatch_once(&sharedProvider_onceToken_145382, &__block_literal_global_10_145383);
  return (INLinkActionProvider *)(id)sharedProvider_provider;
}

void __38__INLinkActionProvider_sharedProvider__block_invoke()
{
  INLinkActionProvider *v0;
  void *v1;

  v0 = objc_alloc_init(INLinkActionProvider);
  v1 = (void *)sharedProvider_provider;
  sharedProvider_provider = (uint64_t)v0;

}

@end

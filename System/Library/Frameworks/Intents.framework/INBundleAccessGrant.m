@implementation INBundleAccessGrant

- (INBundleAccessGrant)initWithSecurityScopedURLs:(id)a3
{
  id v4;
  INBundleAccessGrant *v5;
  uint64_t v6;
  NSDictionary *securityScopedURLs;
  INBundleAccessGrant *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)INBundleAccessGrant;
  v5 = -[INBundleAccessGrant init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    securityScopedURLs = v5->_securityScopedURLs;
    v5->_securityScopedURLs = (NSDictionary *)v6;

    v5->_lock._os_unfair_lock_opaque = 0;
    v8 = v5;
  }

  return v5;
}

- (NSSet)bundleIdentifiers
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[INBundleAccessGrant securityScopedURLs](self, "securityScopedURLs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v5;
}

- (void)acquire
{
  os_unfair_lock_s *p_lock;
  int64_t acquireCount;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  acquireCount = self->_acquireCount;
  if (!acquireCount)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[INBundleAccessGrant securityScopedURLs](self, "securityScopedURLs", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "startAccessingSecurityScopedResource");
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

    acquireCount = self->_acquireCount;
  }
  self->_acquireCount = acquireCount + 1;
  os_unfair_lock_unlock(p_lock);
}

- (void)relinquish
{
  os_unfair_lock_s *p_lock;
  int64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_acquireCount - 1;
  self->_acquireCount = v4;
  if (!v4)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[INBundleAccessGrant securityScopedURLs](self, "securityScopedURLs", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "stopAccessingSecurityScopedResource");
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
  os_unfair_lock_unlock(p_lock);
}

- (void)dealloc
{
  os_unfair_lock_s *p_lock;
  objc_super v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  os_unfair_lock_unlock(p_lock);
  v4.receiver = self;
  v4.super_class = (Class)INBundleAccessGrant;
  -[INBundleAccessGrant dealloc](&v4, sel_dealloc);
}

- (NSDictionary)securityScopedURLs
{
  return self->_securityScopedURLs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_securityScopedURLs, 0);
}

@end

@implementation IDSGroupEncryptionKeyMaterialCache

- (IDSGroupEncryptionKeyMaterialCache)init
{
  IDSGroupEncryptionKeyMaterialCache *v2;
  NSObject *v3;
  uint64_t v4;
  NSMutableSet *cache;
  uint8_t v7[16];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)IDSGroupEncryptionKeyMaterialCache;
  v2 = -[IDSGroupEncryptionKeyMaterialCache init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "RealTimeEncryptionController");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1906E0000, v3, OS_LOG_TYPE_DEFAULT, "IDSGroupEncryptionKeyMaterialCache", v7, 2u);
    }

    v2->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v4 = objc_claimAutoreleasedReturnValue();
    cache = v2->_cache;
    v2->_cache = (NSMutableSet *)v4;

  }
  return v2;
}

- (void)recvKeyMaterial:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if ((-[NSMutableSet containsObject:](self->_cache, "containsObject:", v4) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "RealTimeEncryptionController");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_1906E0000, v5, OS_LOG_TYPE_DEFAULT, "IDSGroupEncryptionKeyMaterialCache received key %@", (uint8_t *)&v6, 0xCu);
    }

    -[NSMutableSet addObject:](self->_cache, "addObject:", v4);
  }
  os_unfair_lock_unlock(&self->_lock);

}

- (void)invalidateKeyMaterialByKeyIndexes:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  os_unfair_lock_t lock;
  IDSGroupEncryptionKeyMaterialCache *v16;
  NSMutableSet *obj;
  uint64_t v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  lock = &self->_lock;
  v16 = self;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = self->_cache;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
  if (v5)
  {
    v18 = *(_QWORD *)v25;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v25 != v18)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v6);
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v8 = v19;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
        if (v9)
        {
          v10 = *(_QWORD *)v21;
          do
          {
            v11 = 0;
            do
            {
              if (*(_QWORD *)v21 != v10)
                objc_enumerationMutation(v8);
              v12 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v11);
              objc_msgSend(v7, "keyIndex");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v12) = objc_msgSend(v13, "isEqual:", v12);

              if ((_DWORD)v12)
                objc_msgSend(v4, "addObject:", v7);
              ++v11;
            }
            while (v9 != v11);
            v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
          }
          while (v9);
        }

        ++v6;
      }
      while (v6 != v5);
      v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
    }
    while (v5);
  }

  objc_msgSend(MEMORY[0x1E0D34D40], "RealTimeEncryptionController");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v29 = v4;
    _os_log_impl(&dword_1906E0000, v14, OS_LOG_TYPE_DEFAULT, "IDSGroupEncryptionKeyMaterialCache invalidateKeyMaterialByKeyIndexes %@", buf, 0xCu);
  }

  if (objc_msgSend(v4, "count"))
    -[NSMutableSet minusSet:](v16->_cache, "minusSet:", v4);

  os_unfair_lock_unlock(lock);
}

- (void)enumerateCachedKeyMaterialUsingBlock:(id)a3
{
  void (**v4)(id, uint64_t, char *);
  os_unfair_lock_s *p_lock;
  NSMutableSet *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, char *))a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = self->_cache;
  v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v8)
        objc_enumerationMutation(v6);
      v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
      v11 = 0;
      v4[2](v4, v10, &v11);
      if (v11)
        break;
      if (v7 == ++v9)
      {
        v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
}

@end

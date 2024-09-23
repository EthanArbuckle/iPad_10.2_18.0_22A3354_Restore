@implementation HFReaderWriterCache

- (HFReaderWriterCache)init
{
  HFReaderWriterCache *v2;
  uint64_t v3;
  NSMutableDictionary *cachedObjects;
  int v5;
  void *v6;
  NSObject *v7;
  HFReaderWriterCache *v8;
  objc_super v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)HFReaderWriterCache;
  v2 = -[HFReaderWriterCache init](&v10, sel_init);
  if (v2
    && (objc_msgSend(MEMORY[0x1E0C99E08], "dictionary"),
        v3 = objc_claimAutoreleasedReturnValue(),
        cachedObjects = v2->_cachedObjects,
        v2->_cachedObjects = (NSMutableDictionary *)v3,
        cachedObjects,
        (v5 = pthread_rwlock_init(&v2->_rwlock, 0)) != 0))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    HFLogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v6;
      _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "Failed to init read-write lock: %@", buf, 0xCu);
    }

    v8 = 0;
  }
  else
  {
    v8 = v2;
  }

  return v8;
}

- (void)performBlockWithWriteLock:(id)a3
{
  void (**v4)(id, void *);
  _opaque_pthread_rwlock_t *p_rwlock;
  int v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  void *v10;
  int v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  p_rwlock = &self->_rwlock;
  v6 = pthread_rwlock_wrlock(&self->_rwlock);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    HFLogForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v7;
      v9 = "Failed to take write lock: %@";
LABEL_7:
      _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v12, 0xCu);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  -[HFReaderWriterCache cachedObjects](self, "cachedObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v10);

  v11 = pthread_rwlock_unlock(p_rwlock);
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], v11, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    HFLogForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v7;
      v9 = "Failed to unlock write lock: %@";
      goto LABEL_7;
    }
LABEL_8:

  }
}

- (id)objectForKey:(id)a3
{
  id v4;
  _opaque_pthread_rwlock_t *p_rwlock;
  int v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v11;
  int v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_rwlock = &self->_rwlock;
  v6 = pthread_rwlock_rdlock(&self->_rwlock);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    HFLogForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v7;
      _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "Failed to take read lock: %@", (uint8_t *)&v13, 0xCu);
    }
    v9 = 0;
  }
  else
  {
    -[HFReaderWriterCache cachedObjects](self, "cachedObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = pthread_rwlock_unlock(p_rwlock);
    if (!v12)
      goto LABEL_6;
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], v12, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    HFLogForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v7;
      _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "Failed to unlock read lock: %@", (uint8_t *)&v13, 0xCu);
    }
  }

LABEL_6:
  return v9;
}

- (id)tryObjectForKey:(id)a3
{
  id v4;
  _opaque_pthread_rwlock_t *p_rwlock;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  NSObject *v10;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_rwlock = &self->_rwlock;
  if (pthread_rwlock_tryrdlock(&self->_rwlock))
  {
    v6 = 0;
  }
  else
  {
    -[HFReaderWriterCache cachedObjects](self, "cachedObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = pthread_rwlock_unlock(p_rwlock);
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], v8, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      HFLogForCategory(0);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 138412290;
        v13 = v9;
        _os_log_impl(&dword_1DD34E000, v10, OS_LOG_TYPE_DEFAULT, "Failed to unlock read lock: %@", (uint8_t *)&v12, 0xCu);
      }

    }
  }

  return v6;
}

- (NSMutableDictionary)cachedObjects
{
  return self->_cachedObjects;
}

- (void)dealloc
{
  int v3;
  void *v4;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = pthread_rwlock_destroy(&self->_rwlock);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], v3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    HFLogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v8 = v4;
      _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "Failed to destroy read-write lock: %@", buf, 0xCu);
    }

  }
  v6.receiver = self;
  v6.super_class = (Class)HFReaderWriterCache;
  -[HFReaderWriterCache dealloc](&v6, sel_dealloc);
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __40__HFReaderWriterCache_setObject_forKey___block_invoke;
  v10[3] = &unk_1EA727890;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[HFReaderWriterCache performBlockWithWriteLock:](self, "performBlockWithWriteLock:", v10);

}

uint64_t __40__HFReaderWriterCache_setObject_forKey___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setObject:forKey:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)setObject:(id)a3 onlyIfNoObjectForKey:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__HFReaderWriterCache_setObject_onlyIfNoObjectForKey___block_invoke;
  v10[3] = &unk_1EA727890;
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  -[HFReaderWriterCache performBlockWithWriteLock:](self, "performBlockWithWriteLock:", v10);

}

void __54__HFReaderWriterCache_setObject_onlyIfNoObjectForKey___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "objectForKey:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    objc_msgSend(v4, "setObject:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

}

- (void)removeObjectForKey:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__HFReaderWriterCache_removeObjectForKey___block_invoke;
  v6[3] = &unk_1EA7278B8;
  v7 = v4;
  v5 = v4;
  -[HFReaderWriterCache performBlockWithWriteLock:](self, "performBlockWithWriteLock:", v6);

}

uint64_t __42__HFReaderWriterCache_removeObjectForKey___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeObjectForKey:", *(_QWORD *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedObjects, 0);
}

@end

@implementation _LSDModificationPendingSaveToken

- (_LSDModificationPendingSaveToken)initWithUUID:(id)a3
{
  id v5;
  _LSDModificationPendingSaveToken *v6;
  NSMutableArray *v7;
  NSMutableArray *waiters;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_LSDModificationPendingSaveToken;
  v6 = -[_LSDModificationPendingSaveToken init](&v10, sel_init);
  if (v6)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    waiters = v6->_waiters;
    v6->_waiters = v7;

    objc_storeStrong((id *)&v6->_uuid, a3);
  }

  return v6;
}

- (void)waitForResult:(id)a3
{
  void (**v4)(id, BOOL);
  os_unfair_lock_s *p_mutex;
  NSObject *v6;
  NSUUID *uuid;
  NSObject *v8;
  NSUUID *v9;
  NSMutableArray *waiters;
  void *v11;
  void *v12;
  int v13;
  NSUUID *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, BOOL))a3;
  p_mutex = (os_unfair_lock_s *)&self->_mutex;
  os_unfair_lock_lock((os_unfair_lock_t)&self->_mutex);
  if (self->_saveError.__engaged_)
  {
    _LSInstallLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uuid = self->_uuid;
      v13 = 138412290;
      v14 = uuid;
      _os_log_impl(&dword_182882000, v6, OS_LOG_TYPE_DEFAULT, "save for operation %@ is already complete", (uint8_t *)&v13, 0xCu);
    }

    v4[2](v4, self->_saveError.var0.__val_ == 0);
  }
  else
  {
    _LSInstallLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = self->_uuid;
      v13 = 138412290;
      v14 = v9;
      _os_log_impl(&dword_182882000, v8, OS_LOG_TYPE_INFO, "waiting for save for operation %@", (uint8_t *)&v13, 0xCu);
    }

    waiters = self->_waiters;
    v11 = (void *)objc_msgSend(v4, "copy");
    v12 = (void *)MEMORY[0x186DAE9BC]();
    -[NSMutableArray addObject:](waiters, "addObject:", v12);

  }
  os_unfair_lock_unlock(p_mutex);

}

- (void)saveDidHappen:(BOOL)a3 error:(id)a4
{
  _BOOL4 v4;
  NSObject *v6;
  NSObject *v7;
  id v8;
  NSUUID *uuid;
  uint64_t v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSMutableArray *waiters;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  id v21;
  uint8_t v22[128];
  uint8_t buf[4];
  _BOOL4 v24;
  __int16 v25;
  id v26;
  __int16 v27;
  NSUUID *v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v4 = a3;
  v31 = *MEMORY[0x1E0C80C00];
  v21 = a4;
  os_unfair_lock_lock((os_unfair_lock_t)&self->_mutex);
  if (self->_saveError.__engaged_)
  {
    _LSInstallLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[_LSDModificationPendingSaveToken saveDidHappen:error:].cold.1((uint64_t)self, v6);

  }
  else
  {
    std::optional<NSError * {__strong}>::operator=[abi:nn180100]<NSError * {__strong}&,void>((uint64_t)&self->_saveError, &v21);
    _LSInstallLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v21;
      uuid = self->_uuid;
      v10 = -[NSMutableArray count](self->_waiters, "count");
      *(_DWORD *)buf = 67109890;
      v24 = v4;
      v25 = 2112;
      v26 = v8;
      v27 = 2112;
      v28 = uuid;
      v29 = 2048;
      v30 = v10;
      _os_log_impl(&dword_182882000, v7, OS_LOG_TYPE_DEFAULT, "Save happened (%d %@) for operation %@, save token calling %zu handler(s)", buf, 0x26u);
    }

    v11 = (void *)MEMORY[0x186DAE7A0]();
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v12 = self->_waiters;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v18;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v18 != v14)
            objc_enumerationMutation(v12);
          (*(void (**)(_QWORD, BOOL))(*(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v15) + 16))(*(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v15), v21 == 0);
          ++v15;
        }
        while (v13 != v15);
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v13);
    }

    waiters = self->_waiters;
    self->_waiters = 0;

    objc_autoreleasePoolPop(v11);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&self->_mutex);

}

- (void).cxx_destruct
{
  if (self->_saveError.__engaged_)

  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_waiters, 0);
}

- (id).cxx_construct
{
  *((_BYTE *)self + 24) = 0;
  *((_BYTE *)self + 32) = 0;
  *((_DWORD *)self + 10) = 0;
  return self;
}

- (void)saveDidHappen:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 16);
  v3 = 138412290;
  v4 = v2;
  _os_log_fault_impl(&dword_182882000, a2, OS_LOG_TYPE_FAULT, "Got multiple save callbacks for pending save token (op %@)! That's a bug!", (uint8_t *)&v3, 0xCu);
}

@end

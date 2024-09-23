@implementation BLSPendingAssertionService

- (BLSPendingAssertionService)init
{
  BLSPendingAssertionService *v2;
  BLSPendingAssertionService *v3;
  uint64_t v4;
  NSMutableArray *assertionsToAcquire;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BLSPendingAssertionService;
  v2 = -[BLSPendingAssertionService init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = objc_claimAutoreleasedReturnValue();
    assertionsToAcquire = v3->_assertionsToAcquire;
    v3->_assertionsToAcquire = (NSMutableArray *)v4;

  }
  return v3;
}

- (os_unfair_lock_s)hasReplacementService
{
  os_unfair_lock_s *v1;
  os_unfair_lock_s *v2;

  v1 = a1;
  if (a1)
  {
    v2 = a1 + 6;
    os_unfair_lock_lock(a1 + 6);
    v1 = (os_unfair_lock_s *)(*(_QWORD *)&v1[4]._os_unfair_lock_opaque != 0);
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

- (void)acquireAssertion:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t buf[4];
  BLSPendingAssertionService *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("only BLSAssertion objects supported by pending service not:%@"), v4);
  os_unfair_lock_lock(&self->_lock);
  if (self->_replacementService)
  {
    objc_msgSend(v4, "setService:");
    -[BLSAssertionService acquireAssertion:](self->_replacementService, "acquireAssertion:", v4);
  }
  else
  {
    -[NSMutableArray addObject:](self->_assertionsToAcquire, "addObject:", v4);
    bls_assertions_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218242;
      v7 = self;
      v8 = 2114;
      v9 = v4;
      _os_log_impl(&dword_1B0C75000, v5, OS_LOG_TYPE_INFO, "%p assertion acquired before service setup, pending:%{public}@", buf, 0x16u);
    }

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (void)cancelAssertion:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint8_t buf[4];
  BLSPendingAssertionService *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[BLSPendingAssertionService hasReplacementService]((os_unfair_lock_s *)self))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("replacement service has been set, should not be invalidating:%@"), v6);
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableArray removeObject:](self->_assertionsToAcquire, "removeObject:", v6);
  os_unfair_lock_unlock(&self->_lock);
  bls_assertions_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218498;
    v10 = self;
    v11 = 2114;
    v12 = v7;
    v13 = 2114;
    v14 = v6;
    _os_log_impl(&dword_1B0C75000, v8, OS_LOG_TYPE_INFO, "%p assertion invalidated (%{public}@) before service setup, no longer pending:%{public}@", buf, 0x20u);
  }

}

- (void)restartAssertionTimeoutTimer:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t buf[4];
  BLSPendingAssertionService *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[BLSPendingAssertionService hasReplacementService]((os_unfair_lock_s *)self))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("replacement service has been set, should not be restarting timeout timer for:%@"), v4);
  bls_assertions_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    v7 = self;
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_1B0C75000, v5, OS_LOG_TYPE_INFO, "%p assertion timeout restarted before service setup:%{public}@", buf, 0x16u);
  }

}

- (void)replaceWithService:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  os_unfair_lock_lock(&self->_lock);
  v6 = (void *)-[NSMutableArray copy](self->_assertionsToAcquire, "copy");
  -[NSMutableArray removeAllObjects](self->_assertionsToAcquire, "removeAllObjects");
  objc_storeStrong((id *)&self->_replacementService, a3);
  os_unfair_lock_unlock(&self->_lock);
  bls_assertions_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[BLSPendingAssertionService replaceWithService:].cold.1((uint64_t)self, v6, v7);

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v13, "setService:", v5, (_QWORD)v14);
        objc_msgSend(v5, "acquireAssertion:", v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replacementService, 0);
  objc_storeStrong((id *)&self->_assertionsToAcquire, 0);
}

- (void)replaceWithService:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  int v4;
  uint64_t v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = 134218240;
  v5 = a1;
  v6 = 1024;
  v7 = objc_msgSend(a2, "count");
  _os_log_debug_impl(&dword_1B0C75000, a3, OS_LOG_TYPE_DEBUG, "%p service setup, will transition %u assertions", (uint8_t *)&v4, 0x12u);
}

@end

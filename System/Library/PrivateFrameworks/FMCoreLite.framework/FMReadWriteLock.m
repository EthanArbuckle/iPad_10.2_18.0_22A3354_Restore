@implementation FMReadWriteLock

- (void)performWithReadLock:(id)a3
{
  void (**v4)(_QWORD);
  uint64_t v5;
  NSObject *v6;

  v4 = (void (**)(_QWORD))a3;
  v5 = pthread_rwlock_rdlock(&self->_lock);
  if ((_DWORD)v5)
  {
    LogCategory_Unspecified();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[FMReadWriteLock performWithReadLock:].cold.1(self, v5, v6);

  }
  v4[2](v4);
  if (!(_DWORD)v5)
    pthread_rwlock_unlock(&self->_lock);

}

- (FMReadWriteLock)init
{
  return -[FMReadWriteLock initWithLockName:](self, "initWithLockName:", &stru_1E5E0E900);
}

- (FMReadWriteLock)initWithLockName:(id)a3
{
  id v5;
  FMReadWriteLock *v6;
  FMReadWriteLock *v7;
  int v8;
  int v9;
  NSObject *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FMReadWriteLock;
  v6 = -[FMReadWriteLock init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_lockName, a3);
    v8 = pthread_rwlock_init(&v7->_lock, 0);
    if (v8)
    {
      v9 = v8;
      LogCategory_Unspecified();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[FMReadWriteLock initWithLockName:].cold.1((uint64_t)v5, v9, v10);

    }
  }

  return v7;
}

- (void)performWithWriteLock:(id)a3
{
  void (**v4)(_QWORD);
  uint64_t v5;
  NSObject *v6;

  v4 = (void (**)(_QWORD))a3;
  v5 = pthread_rwlock_wrlock(&self->_lock);
  if ((_DWORD)v5)
  {
    LogCategory_Unspecified();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[FMReadWriteLock performWithWriteLock:].cold.1(self, v5, v6);

  }
  v4[2](v4);
  if (!(_DWORD)v5)
    pthread_rwlock_unlock(&self->_lock);

}

- (NSString)lockName
{
  return self->_lockName;
}

- (void)setLockName:(id)a3
{
  objc_storeStrong((id *)&self->_lockName, a3);
}

- (_opaque_pthread_rwlock_t)lock
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  v3 = *(_OWORD *)&self->__opaque[184];
  *(_OWORD *)&retstr->__opaque[152] = *(_OWORD *)&self->__opaque[168];
  *(_OWORD *)&retstr->__opaque[168] = v3;
  *(_QWORD *)&retstr->__opaque[184] = *(_QWORD *)self[1].__opaque;
  v4 = *(_OWORD *)&self->__opaque[120];
  *(_OWORD *)&retstr->__opaque[88] = *(_OWORD *)&self->__opaque[104];
  *(_OWORD *)&retstr->__opaque[104] = v4;
  v5 = *(_OWORD *)&self->__opaque[152];
  *(_OWORD *)&retstr->__opaque[120] = *(_OWORD *)&self->__opaque[136];
  *(_OWORD *)&retstr->__opaque[136] = v5;
  v6 = *(_OWORD *)&self->__opaque[56];
  *(_OWORD *)&retstr->__opaque[24] = *(_OWORD *)&self->__opaque[40];
  *(_OWORD *)&retstr->__opaque[40] = v6;
  v7 = *(_OWORD *)&self->__opaque[88];
  *(_OWORD *)&retstr->__opaque[56] = *(_OWORD *)&self->__opaque[72];
  *(_OWORD *)&retstr->__opaque[72] = v7;
  v8 = *(_OWORD *)&self->__opaque[24];
  *(_OWORD *)&retstr->__sig = *(_OWORD *)&self->__opaque[8];
  *(_OWORD *)&retstr->__opaque[8] = v8;
  return self;
}

- (void)setLock:(_opaque_pthread_rwlock_t *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  *(_OWORD *)&self->_lock.__sig = *(_OWORD *)&a3->__sig;
  v3 = *(_OWORD *)&a3->__opaque[8];
  v4 = *(_OWORD *)&a3->__opaque[24];
  v5 = *(_OWORD *)&a3->__opaque[56];
  *(_OWORD *)&self->_lock.__opaque[40] = *(_OWORD *)&a3->__opaque[40];
  *(_OWORD *)&self->_lock.__opaque[56] = v5;
  *(_OWORD *)&self->_lock.__opaque[8] = v3;
  *(_OWORD *)&self->_lock.__opaque[24] = v4;
  v6 = *(_OWORD *)&a3->__opaque[72];
  v7 = *(_OWORD *)&a3->__opaque[88];
  v8 = *(_OWORD *)&a3->__opaque[120];
  *(_OWORD *)&self->_lock.__opaque[104] = *(_OWORD *)&a3->__opaque[104];
  *(_OWORD *)&self->_lock.__opaque[120] = v8;
  *(_OWORD *)&self->_lock.__opaque[72] = v6;
  *(_OWORD *)&self->_lock.__opaque[88] = v7;
  v9 = *(_OWORD *)&a3->__opaque[136];
  v10 = *(_OWORD *)&a3->__opaque[152];
  v11 = *(_OWORD *)&a3->__opaque[168];
  *(_QWORD *)&self->_lock.__opaque[184] = *(_QWORD *)&a3->__opaque[184];
  *(_OWORD *)&self->_lock.__opaque[152] = v10;
  *(_OWORD *)&self->_lock.__opaque[168] = v11;
  *(_OWORD *)&self->_lock.__opaque[136] = v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockName, 0);
}

- (void)initWithLockName:(NSObject *)a3 .cold.1(uint64_t a1, int a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 1024;
  v6 = a2;
  OUTLINED_FUNCTION_0_0(&dword_1AEA5C000, a3, (uint64_t)a3, "Error initializing the lock '%@': %d", (uint8_t *)&v3);
}

- (void)performWithReadLock:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "lockName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1AEA5C000, a3, v5, "Error obtaining read lock '%@': %d", v6);

  OUTLINED_FUNCTION_2_0();
}

- (void)performWithWriteLock:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "lockName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1AEA5C000, a3, v5, "Error obtaining write lock '%@': %d", v6);

  OUTLINED_FUNCTION_2_0();
}

@end

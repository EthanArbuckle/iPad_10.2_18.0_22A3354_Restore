@implementation SGSqliteDatabaseSharedLock

- (int64_t)writeTransactionDepth
{
  return self->_writeTransactionDepth;
}

- (SGSqliteDatabaseSharedLock)init
{
  SGSqliteDatabaseSharedLock *v2;
  SGSqliteDatabaseSharedLock *v3;
  objc_super v5;
  pthread_mutexattr_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)SGSqliteDatabaseSharedLock;
  v2 = -[SGSqliteDatabaseSharedLock init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_writeTransactionDepth = 0;
    v6.__sig = 0;
    *(_QWORD *)v6.__opaque = 0;
    pthread_mutexattr_init(&v6);
    pthread_mutexattr_settype(&v6, 2);
    pthread_mutex_init(&v3->_lock, &v6);
    pthread_mutexattr_destroy(&v6);
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  pthread_mutex_destroy(&self->_lock);
  v3.receiver = self;
  v3.super_class = (Class)SGSqliteDatabaseSharedLock;
  -[SGSqliteDatabaseSharedLock dealloc](&v3, sel_dealloc);
}

- (void)runWithLockAcquired:(id)a3
{
  void (**v4)(void);

  v4 = (void (**)(void))a3;
  pthread_mutex_lock(&self->_lock);
  ++self->_writeTransactionDepth;
  v4[2]();
  --self->_writeTransactionDepth;
  pthread_mutex_unlock(&self->_lock);

}

@end

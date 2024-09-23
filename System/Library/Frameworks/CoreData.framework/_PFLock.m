@implementation _PFLock

- (_PFLock)init
{
  _PFLock *v2;
  _PFLock *v3;
  objc_super v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_PFLock;
  v2 = -[_PFLock init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    if (pthread_mutex_init(&v2->_lock, &__PFLockNMAttr))
    {
      v5.receiver = v3;
      v5.super_class = (Class)_PFLock;
      -[_PFLock dealloc](&v5, sel_dealloc);
      return 0;
    }
    else
    {
      v3->_owner = 0;
      v3->_count = 0;
    }
  }
  return v3;
}

- (void)dealloc
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  objc_super v11;
  uint8_t buf[16];

  if (pthread_mutex_destroy(&self->_lock) == 16 || self->_owner)
  {
    v3 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_PFLock deallocated while in use");
    _NSCoreDataLog(17, v3, v4, v5, v6, v7, v8, v9, (uint64_t)v11.receiver);
    v10 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_18A253000, v10, OS_LOG_TYPE_FAULT, "CoreData: _PFLock deallocated while in use", buf, 2u);
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)_PFLock;
  -[_PFLock dealloc](&v11, sel_dealloc);
}

+ (void)initialize
{
  objc_opt_self();
  if ((id)objc_opt_class() == a1)
  {
    pthread_mutexattr_init(&__PFLockNMAttr);
    pthread_mutexattr_settype(&__PFLockNMAttr, 2);
  }
}

- (void)unlock
{
  unint64_t v2;

  v2 = self->_count - 1;
  self->_count = v2;
  if (!v2)
    self->_owner = 0;
  pthread_mutex_unlock(&self->_lock);
}

- (BOOL)tryLock
{
  int v3;
  _opaque_pthread_t *v4;
  unint64_t v5;

  v3 = pthread_mutex_trylock(&self->_lock);
  if (!v3)
  {
    v4 = pthread_self();
    v5 = self->_count + 1;
    self->_owner = v4;
    self->_count = v5;
  }
  return v3 == 0;
}

- (void)lock
{
  _opaque_pthread_t *v3;
  unint64_t v4;

  pthread_mutex_lock(&self->_lock);
  v3 = pthread_self();
  v4 = self->_count + 1;
  self->_owner = v3;
  self->_count = v4;
}

@end

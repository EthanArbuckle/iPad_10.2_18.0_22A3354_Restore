@implementation _PFMutex

- (void)unlock
{
  pthread_mutex_unlock(&self->_lock);
}

- (void)lock
{
  pthread_mutex_lock(&self->_lock);
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

  if (pthread_mutex_destroy(&self->_lock) == 16)
  {
    v3 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_PFMutex deallocated while in use");
    _NSCoreDataLog(17, v3, v4, v5, v6, v7, v8, v9, (uint64_t)v11.receiver);
    v10 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_18A253000, v10, OS_LOG_TYPE_FAULT, "CoreData: _PFMutex deallocated while in use", buf, 2u);
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)_PFMutex;
  -[_PFMutex dealloc](&v11, sel_dealloc);
}

- (_PFMutex)init
{
  _PFMutex *v2;
  _PFMutex *v3;
  objc_super v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_PFMutex;
  v2 = -[_PFMutex init](&v6, sel_init);
  v3 = v2;
  if (v2 && pthread_mutex_init(&v2->_lock, 0))
  {
    v5.receiver = v3;
    v5.super_class = (Class)_PFMutex;
    -[_PFMutex dealloc](&v5, sel_dealloc);
    return 0;
  }
  return v3;
}

+ (void)initialize
{
  objc_opt_self();
  objc_opt_class();
}

- (BOOL)tryLock
{
  return pthread_mutex_trylock(&self->_lock) == 0;
}

@end

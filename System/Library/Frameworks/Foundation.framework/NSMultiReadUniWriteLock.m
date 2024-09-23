@implementation NSMultiReadUniWriteLock

- (void)lockForReading
{
  pthread_rwlock_t *IndexedIvars;

  IndexedIvars = (pthread_rwlock_t *)object_getIndexedIvars(self);
  pthread_rwlock_rdlock(IndexedIvars);
}

- (void)unlock
{
  pthread_rwlock_t *IndexedIvars;
  _opaque_pthread_t *sig;
  _opaque_pthread_t *v4;

  IndexedIvars = (pthread_rwlock_t *)object_getIndexedIvars(self);
  sig = (_opaque_pthread_t *)IndexedIvars[1].__sig;
  v4 = pthread_self();
  if (pthread_equal(sig, v4))
    IndexedIvars[1].__sig = 0;
  pthread_rwlock_unlock(IndexedIvars);
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return NSAllocateObject((Class)a1, 0xD8uLL, a3);
}

- (void)lockForWriting
{
  pthread_rwlock_t *IndexedIvars;

  IndexedIvars = (pthread_rwlock_t *)object_getIndexedIvars(self);
  pthread_rwlock_wrlock(IndexedIvars);
  IndexedIvars[1].__sig = (uint64_t)pthread_self();
}

- (void)setName:(id)a3
{
  _QWORD *IndexedIvars;
  id v5;
  _QWORD *v6;

  IndexedIvars = object_getIndexedIvars(self);
  v5 = (id)IndexedIvars[26];
  if (v5 != a3)
  {
    v6 = IndexedIvars;

    v6[26] = objc_msgSend(a3, "copy");
  }
}

- (void)dealloc
{
  void *IndexedIvars;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  IndexedIvars = object_getIndexedIvars(self);
  pthread_rwlock_destroy((pthread_rwlock_t *)IndexedIvars);

  v4.receiver = self;
  v4.super_class = (Class)NSMultiReadUniWriteLock;
  -[NSMultiReadUniWriteLock dealloc](&v4, sel_dealloc);
}

- (NSMultiReadUniWriteLock)init
{
  NSMultiReadUniWriteLock *v2;
  pthread_rwlock_t *IndexedIvars;
  objc_super v5;
  uint64_t v6;

  v2 = self;
  v6 = *MEMORY[0x1E0C80C00];
  IndexedIvars = (pthread_rwlock_t *)object_getIndexedIvars(self);
  if (pthread_rwlock_init(IndexedIvars, 0))
  {
    v5.receiver = v2;
    v5.super_class = (Class)NSMultiReadUniWriteLock;
    -[NSMultiReadUniWriteLock dealloc](&v5, sel_dealloc);
    return 0;
  }
  else
  {
    IndexedIvars[1].__sig = 0;
    *(_QWORD *)IndexedIvars[1].__opaque = 0;
  }
  return v2;
}

- (BOOL)tryLockForReading
{
  pthread_rwlock_t *IndexedIvars;

  IndexedIvars = (pthread_rwlock_t *)object_getIndexedIvars(self);
  return pthread_rwlock_tryrdlock(IndexedIvars) == 0;
}

- (BOOL)lockForReadingBeforeDate:(id)a3
{
  return 0;
}

- (BOOL)tryLockForWriting
{
  pthread_rwlock_t *IndexedIvars;
  int v3;

  IndexedIvars = (pthread_rwlock_t *)object_getIndexedIvars(self);
  v3 = pthread_rwlock_trywrlock(IndexedIvars);
  if (!v3)
    IndexedIvars[1].__sig = (uint64_t)pthread_self();
  return v3 == 0;
}

- (BOOL)lockForWritingBeforeDate:(id)a3
{
  return 0;
}

- (void)lock
{
  pthread_rwlock_t *IndexedIvars;

  IndexedIvars = (pthread_rwlock_t *)object_getIndexedIvars(self);
  pthread_rwlock_wrlock(IndexedIvars);
  IndexedIvars[1].__sig = (uint64_t)pthread_self();
}

- (id)description
{
  void *IndexedIvars;
  id v4;
  int v5;
  const char *v6;
  uint64_t v7;
  const __CFString *v8;
  const char *v9;
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  IndexedIvars = object_getIndexedIvars(self);
  v11.receiver = self;
  v11.super_class = (Class)NSMultiReadUniWriteLock;
  v4 = -[NSMultiReadUniWriteLock description](&v11, sel_description);
  v5 = pthread_equal(0, *((pthread_t *)IndexedIvars + 25));
  v6 = "'";
  v7 = *((_QWORD *)IndexedIvars + 26);
  if (!v7)
    v6 = "";
  v8 = CFSTR("nil");
  if (v7)
    v8 = (const __CFString *)*((_QWORD *)IndexedIvars + 26);
  v9 = "NO";
  if (!v5)
    v9 = "YES";
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@{locked for writing = %s, writer thread = %p, name = %s%@%s}"), v4, v9, *((_QWORD *)IndexedIvars + 25), v6, v8, v6);
}

- (id)name
{
  return (id)*((_QWORD *)object_getIndexedIvars(self) + 26);
}

@end

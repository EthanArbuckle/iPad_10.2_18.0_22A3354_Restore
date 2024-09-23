@implementation XRRecentArray

- (XRRecentArray)init
{
  return (XRRecentArray *)((uint64_t (*)(XRRecentArray *, char *, uint64_t))MEMORY[0x24BEDD108])(self, sel_initWithMaximumRecentCount_, 10);
}

- (XRRecentArray)initWithMaximumRecentCount:(unint64_t)a3
{
  XRRecentArray *v4;
  XRRecentArray *v5;
  uint64_t v6;
  NSMutableArray *entries;
  dispatch_semaphore_t v8;
  OS_dispatch_semaphore *lock;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)XRRecentArray;
  v4 = -[XRRecentArray init](&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_maximumRecentCount = a3;
    v6 = objc_opt_new();
    entries = v5->_entries;
    v5->_entries = (NSMutableArray *)v6;

    v8 = dispatch_semaphore_create(1);
    lock = v5->_lock;
    v5->_lock = (OS_dispatch_semaphore *)v8;

  }
  return v5;
}

- (void)setMaximumRecentCount:(unint64_t)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t maximumRecentCount;
  NSMutableArray *entries;
  uint64_t v16;
  const char *v17;
  uint64_t v18;

  dispatch_semaphore_wait((dispatch_semaphore_t)self->_lock, 0xFFFFFFFFFFFFFFFFLL);
  self->_maximumRecentCount = a3;
  v9 = objc_msgSend_count(self->_entries, v5, v6, v7, v8);
  maximumRecentCount = self->_maximumRecentCount;
  if (v9 > maximumRecentCount)
  {
    entries = self->_entries;
    v16 = objc_msgSend_count(entries, v10, v11, v12, v13);
    objc_msgSend_removeObjectsInRange_(entries, v17, maximumRecentCount, v16 - self->_maximumRecentCount, v18);
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_lock);
}

- (unint64_t)maximumRecentCount
{
  unint64_t maximumRecentCount;

  dispatch_semaphore_wait((dispatch_semaphore_t)self->_lock, 0xFFFFFFFFFFFFFFFFLL);
  maximumRecentCount = self->_maximumRecentCount;
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_lock);
  return maximumRecentCount;
}

- (void)addEntry:(id)a3
{
  NSObject *lock;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  lock = self->_lock;
  v5 = a3;
  dispatch_semaphore_wait(lock, 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend_removeObject_(self->_entries, v6, (uint64_t)v5, v7, v8);
  objc_msgSend_insertObject_atIndex_(self->_entries, v9, (uint64_t)v5, 0, v10);

  if (objc_msgSend_count(self->_entries, v11, v12, v13, v14) > self->_maximumRecentCount)
    objc_msgSend_removeLastObject(self->_entries, v15, v16, v17, v18);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_lock);
}

- (void)removeEntry:(id)a3
{
  NSObject *lock;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;

  lock = self->_lock;
  v5 = a3;
  dispatch_semaphore_wait(lock, 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend_removeObject_(self->_entries, v6, (uint64_t)v5, v7, v8);

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_lock);
}

- (void)removeEntryAtIndex:(unint64_t)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;

  dispatch_semaphore_wait((dispatch_semaphore_t)self->_lock, 0xFFFFFFFFFFFFFFFFLL);
  if (objc_msgSend_count(self->_entries, v5, v6, v7, v8) > a3)
    objc_msgSend_removeObjectAtIndex_(self->_entries, v9, a3, v10, v11);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_lock);
}

- (id)entries
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  dispatch_semaphore_wait((dispatch_semaphore_t)self->_lock, 0xFFFFFFFFFFFFFFFFLL);
  v7 = (void *)objc_msgSend_copy(self->_entries, v3, v4, v5, v6);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_lock);
  return v7;
}

- (id)entryAtIndex:(unint64_t)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  dispatch_semaphore_wait((dispatch_semaphore_t)self->_lock, 0xFFFFFFFFFFFFFFFFLL);
  if (objc_msgSend_count(self->_entries, v5, v6, v7, v8) <= a3)
  {
    v12 = 0;
  }
  else
  {
    objc_msgSend_objectAtIndexedSubscript_(self->_entries, v9, a3, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_lock);
  return v12;
}

- (BOOL)containsEntry:(id)a3
{
  NSObject *lock;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;

  lock = self->_lock;
  v5 = a3;
  dispatch_semaphore_wait(lock, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(lock) = objc_msgSend_containsObject_(self->_entries, v6, (uint64_t)v5, v7, v8);

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_lock);
  return (char)lock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_entries, 0);
}

@end

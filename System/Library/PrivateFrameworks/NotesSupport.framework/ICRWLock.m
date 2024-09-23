@implementation ICRWLock

- (ICRWLock)init
{
  ICRWLock *v2;
  ICRWLock *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICRWLock;
  v2 = -[ICRWLock init](&v5, sel_init);
  v3 = v2;
  if (v2)
    pthread_rwlock_init(&v2->_rwLock, 0);
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  pthread_rwlock_destroy(&self->_rwLock);
  v3.receiver = self;
  v3.super_class = (Class)ICRWLock;
  -[ICRWLock dealloc](&v3, sel_dealloc);
}

- (void)writeLock
{
  pthread_rwlock_wrlock(&self->_rwLock);
}

- (int)tryReadLock
{
  return pthread_rwlock_tryrdlock(&self->_rwLock);
}

- (void)readLock
{
  pthread_rwlock_rdlock(&self->_rwLock);
}

- (void)unlock
{
  pthread_rwlock_unlock(&self->_rwLock);
}

@end

@implementation SKThreadSafeMapTable

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKThreadSafeMapTable)initWithNSMapTable:(id)a3
{
  id v4;
  SKThreadSafeMapTable *v5;
  SKThreadSafeMapTable *v6;
  uint64_t v7;
  NSMutableArray *storage;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SKThreadSafeMapTable;
  v5 = -[SKThreadSafeMapTable init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    pthread_mutex_init(&v5->_storageLock, 0);
    v7 = objc_msgSend(v4, "copy");
    storage = v6->_storage;
    v6->_storage = (NSMutableArray *)v7;

  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  pthread_mutex_init((pthread_mutex_t *)(v5 + 8), 0);
  pthread_mutex_lock(&self->_storageLock);
  v6 = -[NSMutableArray copyWithZone:](self->_storage, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v6;

  pthread_mutex_unlock(&self->_storageLock);
  return (id)v5;
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  objc_msgSend(v4, "selector");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    pthread_mutex_lock(&self->_storageLock);
    objc_msgSend(v4, "invokeWithTarget:", self->_storage);
    pthread_mutex_unlock(&self->_storageLock);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SKThreadSafeMapTable;
    -[SKThreadSafeMapTable forwardInvocation:](&v5, sel_forwardInvocation_, v4);
  }

}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SKThreadSafeMapTable;
  -[SKThreadSafeMapTable methodSignatureForSelector:](&v7, sel_methodSignatureForSelector_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[NSMutableArray methodSignatureForSelector:](self->_storage, "methodSignatureForSelector:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)description
{
  return (id)-[NSMutableArray description](self->_storage, "description");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
}

@end

@implementation NSPersistentStoreAsynchronousResult

- (NSPersistentStoreAsynchronousResult)initWithContext:(id)a3 andProgress:(id)a4 completetionBlock:(id)a5
{
  NSPersistentStoreAsynchronousResult *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NSPersistentStoreAsynchronousResult;
  v8 = -[NSPersistentStoreAsynchronousResult init](&v11, sel_init);
  if (v8)
  {
    v8->_requestProgress = (NSProgress *)a4;
    v8->_requestContext = (NSManagedObjectContext *)a3;
    if (a5)
      v9 = _Block_copy(a5);
    else
      v9 = 0;
    v8->_requestCompletionBlock = v9;
    v8->_flags = 0;
  }
  return v8;
}

- (void)dealloc
{
  id requestCompletionBlock;
  objc_super v4;

  self->_requestProgress = 0;
  self->_requestError = 0;

  self->_requestContext = 0;
  requestCompletionBlock = self->_requestCompletionBlock;
  if (requestCompletionBlock)
  {
    _Block_release(requestCompletionBlock);
    self->_requestCompletionBlock = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)NSPersistentStoreAsynchronousResult;
  -[NSPersistentStoreAsynchronousResult dealloc](&v4, sel_dealloc);
}

- (void)cancel
{
  int *p_flags;
  unsigned int v3;

  p_flags = &self->_flags;
  do
    v3 = __ldaxr((unsigned int *)p_flags);
  while (__stlxr(v3 + 1, (unsigned int *)p_flags));
  -[NSProgress cancel](-[NSPersistentStoreAsynchronousResult progress](self, "progress"), "cancel");
}

- (void)_cancelProgress
{
  int *p_flags;
  unsigned int v3;

  p_flags = &self->_flags;
  do
    v3 = __ldaxr((unsigned int *)p_flags);
  while (__stlxr(v3 + 1, (unsigned int *)p_flags));
}

- (BOOL)_isCancelled
{
  return self->_flags > 0;
}

- (NSProgress)progress
{
  return (NSProgress *)objc_getProperty(self, a2, 8, 1);
}

- (NSError)operationError
{
  return (NSError *)objc_getProperty(self, a2, 16, 1);
}

- (void)setOperationError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSManagedObjectContext)managedObjectContext
{
  return (NSManagedObjectContext *)objc_getProperty(self, a2, 24, 1);
}

@end

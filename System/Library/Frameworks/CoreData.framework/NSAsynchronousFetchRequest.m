@implementation NSAsynchronousFetchRequest

- (NSAsynchronousFetchRequest)initWithFetchRequest:(NSFetchRequest *)request completionBlock:(void *)blk
{
  NSAsynchronousFetchRequest *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NSAsynchronousFetchRequest;
  v6 = -[NSAsynchronousFetchRequest init](&v9, sel_init);
  if (v6)
  {
    v6->_fetchRequest = request;
    if (blk)
      v7 = _Block_copy(blk);
    else
      v7 = 0;
    v6->_requestCompletionBlock = v7;
    if (-[NSFetchRequest affectedStores](request, "affectedStores"))
      -[NSPersistentStoreRequest setAffectedStores:](v6, "setAffectedStores:", -[NSFetchRequest affectedStores](request, "affectedStores"));
  }
  return v6;
}

- (NSFetchRequest)fetchRequest
{
  return (NSFetchRequest *)objc_getProperty(self, a2, 16, 1);
}

- (void)dealloc
{
  id requestCompletionBlock;
  objc_super v4;

  self->_fetchRequest = 0;
  requestCompletionBlock = self->_requestCompletionBlock;
  if (requestCompletionBlock)
  {
    _Block_release(requestCompletionBlock);
    self->_requestCompletionBlock = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)NSAsynchronousFetchRequest;
  -[NSPersistentStoreRequest dealloc](&v4, sel_dealloc);
}

- (unint64_t)requestType
{
  return 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSAsynchronousFetchRequest;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ with fetch request %@"), -[NSAsynchronousFetchRequest description](&v3, sel_description), self->_fetchRequest);
}

- (NSPersistentStoreAsynchronousFetchResultCompletionBlock)completionBlock
{
  return objc_getProperty(self, a2, 24, 1);
}

- (NSInteger)estimatedResultCount
{
  return self->_estimatedResultCount;
}

- (void)setEstimatedResultCount:(NSInteger)estimatedResultCount
{
  self->_estimatedResultCount = estimatedResultCount;
}

@end

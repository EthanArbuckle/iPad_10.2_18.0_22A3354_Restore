@implementation NSAsynchronousFetchResult

- (id)initForFetchRequest:(id)a3 withContext:(id)a4 andProgress:(id)a5 completetionBlock:(id)a6
{
  NSAsynchronousFetchResult *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NSAsynchronousFetchResult;
  v7 = -[NSPersistentStoreAsynchronousResult initWithContext:andProgress:completetionBlock:](&v9, sel_initWithContext_andProgress_completetionBlock_, a4, a5, a6);
  if (v7)
    v7->_fetchRequest = (NSAsynchronousFetchRequest *)a3;
  return v7;
}

- (NSArray)finalResult
{
  return self->_finalResult;
}

- (void)dealloc
{
  id intermediateResultCallback;
  objc_super v4;

  -[NSFetchRequest _setAsyncResultHandle:](-[NSAsynchronousFetchRequest fetchRequest](self->_fetchRequest, "fetchRequest"), "_setAsyncResultHandle:", 0);

  self->_fetchRequest = 0;
  self->_finalResult = 0;
  intermediateResultCallback = self->_intermediateResultCallback;
  if (intermediateResultCallback)
  {
    _Block_release(intermediateResultCallback);
    self->_intermediateResultCallback = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)NSAsynchronousFetchResult;
  -[NSPersistentStoreAsynchronousResult dealloc](&v4, sel_dealloc);
}

- (uint64_t)setFinalResult:(uint64_t)result
{
  uint64_t v3;
  void *v4;

  if (result)
  {
    v3 = result;
    v4 = *(void **)(result + 56);
    if (v4 != a2)
    {

      *(_QWORD *)(v3 + 56) = a2;
    }
    return objc_msgSend((id)objc_msgSend(*(id *)(v3 + 48), "fetchRequest"), "_setAsyncResultHandle:", 0);
  }
  return result;
}

- (void)setOperationError:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NSAsynchronousFetchResult;
  -[NSPersistentStoreAsynchronousResult setOperationError:](&v4, sel_setOperationError_, a3);
  -[NSFetchRequest _setAsyncResultHandle:](-[NSAsynchronousFetchRequest fetchRequest](self->_fetchRequest, "fetchRequest"), "_setAsyncResultHandle:", 0);
}

- (NSAsynchronousFetchRequest)fetchRequest
{
  return (NSAsynchronousFetchRequest *)objc_getProperty(self, a2, 48, 1);
}

@end

@implementation _DKSyncSerializer

+ (id)sharedInstance
{
  objc_opt_self();
  if (sharedInstance_initialized_3 != -1)
    dispatch_once(&sharedInstance_initialized_3, &__block_literal_global_68);
  return (id)sharedInstance_dispatcher;
}

+ (void)performAsyncBlock:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[_DKSyncSerializer sharedInstance]();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_DKSyncSerializer performAsyncBlock:](v4, v3);

}

- (void)performAsyncBlock:(void *)a1
{
  const char *v3;
  id v4;
  NSObject *Property;
  _QWORD block[4];
  id v7;

  v4 = a2;
  if (a1)
  {
    Property = objc_getProperty(a1, v3, 16, 1);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39___DKSyncSerializer_performAsyncBlock___block_invoke;
    block[3] = &unk_1E26E3358;
    v7 = v4;
    dispatch_async(Property, block);

  }
}

+ (void)performSyncBlock:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[_DKSyncSerializer sharedInstance]();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_DKSyncSerializer performSyncBlock:](v4, v3);

}

- (void)performSyncBlock:(void *)a1
{
  const char *v3;
  NSObject *Property;
  id v5;
  _QWORD block[4];
  id v7;

  v5 = a2;
  if (a1)
  {
    Property = objc_getProperty(a1, v3, 16, 1);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __38___DKSyncSerializer_performSyncBlock___block_invoke;
    block[3] = &unk_1E26E3358;
    v7 = v5;
    dispatch_sync(Property, block);

  }
}

+ (void)performAfter:(double)a3 block:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  +[_DKSyncSerializer sharedInstance]();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[_DKSyncSerializer performAfter:block:](v6, v5, a3);

}

- (void)performAfter:(double)a3 block:
{
  id v5;
  dispatch_time_t v6;
  SEL v7;
  NSObject *Property;
  _QWORD block[4];
  id v10;

  v5 = a2;
  if (a1)
  {
    v6 = dispatch_time(0, (unint64_t)(a3 * 1000000000.0));
    Property = objc_getProperty(a1, v7, 16, 1);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40___DKSyncSerializer_performAfter_block___block_invoke;
    block[3] = &unk_1E26E3358;
    v10 = v5;
    dispatch_after(v6, Property, block);

  }
}

+ (void)addOperation:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[_DKSyncSerializer sharedInstance]();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_DKSyncSerializer addOperation:](v4, v3);

}

- (void)addOperation:(void *)a1
{
  SEL v3;
  id v4;

  if (a1)
  {
    v4 = a2;
    objc_msgSend(objc_getProperty(a1, v3, 8, 1), "addOperation:", v4);

  }
}

+ (void)addOperations:(id)a3 waitUntilFinished:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  id v6;

  v4 = a4;
  v5 = a3;
  +[_DKSyncSerializer sharedInstance]();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[_DKSyncSerializer addOperations:waitUntilFinished:](v6, v5, v4);

}

- (void)addOperations:(uint64_t)a3 waitUntilFinished:
{
  SEL v5;
  id v6;

  if (a1)
  {
    v6 = a2;
    objc_msgSend(objc_getProperty(a1, v5, 8, 1), "addOperations:waitUntilFinished:", v6, a3);

  }
}

+ (void)addOperationWithBlock:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[_DKSyncSerializer sharedInstance]();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_DKSyncSerializer addOperationWithBlock:](v4, (uint64_t)v3);

}

- (void)addOperationWithBlock:(void *)a1
{
  id v3;

  if (a1)
  {
    +[_DKSyncBlockOperation blockOperationWithBlock:](_DKSyncBlockOperation, "blockOperationWithBlock:", a2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[_DKSyncSerializer addOperation:](a1, v3);

  }
}

+ (void)addDependentOperation:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[_DKSyncSerializer sharedInstance]();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_DKSyncSerializer addDependentOperation:](v4, v3);

}

- (void)addDependentOperation:(void *)a1
{
  id *v3;
  id WeakRetained;
  SEL v5;
  id obj;

  obj = a2;
  if (a1)
  {
    v3 = a1;
    objc_sync_enter(v3);
    WeakRetained = objc_loadWeakRetained(v3 + 3);
    if (WeakRetained)
      objc_msgSend(obj, "addDependency:", WeakRetained);
    objc_storeWeak(v3 + 3, obj);

    objc_sync_exit(v3);
    objc_msgSend(objc_getProperty(v3, v5, 8, 1), "addOperation:", obj);
  }

}

+ (void)addDependentOperationWithBlock:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[_DKSyncSerializer sharedInstance]();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_DKSyncSerializer addDependentOperationWithBlock:](v4, (uint64_t)v3);

}

- (void)addDependentOperationWithBlock:(void *)a1
{
  id v3;

  if (a1)
  {
    +[_DKSyncBlockOperation blockOperationWithBlock:](_DKSyncBlockOperation, "blockOperationWithBlock:", a2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[_DKSyncSerializer addDependentOperation:](a1, v3);

  }
}

+ (id)operationQueue
{
  void *Property;
  const char *v3;
  void *v4;
  id v5;

  +[_DKSyncSerializer sharedInstance]();
  Property = (void *)objc_claimAutoreleasedReturnValue();
  v4 = Property;
  if (Property)
    Property = objc_getProperty(Property, v3, 8, 1);
  v5 = Property;

  return v5;
}

+ (id)underlyingQueue
{
  void *Property;
  const char *v3;
  void *v4;
  id v5;

  +[_DKSyncSerializer sharedInstance]();
  Property = (void *)objc_claimAutoreleasedReturnValue();
  v4 = Property;
  if (Property)
    Property = objc_getProperty(Property, v3, 16, 1);
  v5 = Property;

  return v5;
}

- (_DKSyncSerializer)init
{
  _DKSyncSerializer *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *underlyingQueue;
  uint64_t v5;
  NSOperationQueue *operationQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_DKSyncSerializer;
  v2 = -[_DKSyncSerializer init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("_DKSyncDispatcher Queue", 0);
    underlyingQueue = v2->_underlyingQueue;
    v2->_underlyingQueue = (OS_dispatch_queue *)v3;

    v5 = objc_opt_new();
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = (NSOperationQueue *)v5;

    -[NSOperationQueue setName:](v2->_operationQueue, "setName:", CFSTR("_DKSyncDispatcher Operation Queue"));
    -[NSOperationQueue setUnderlyingQueue:](v2->_operationQueue, "setUnderlyingQueue:", v2->_underlyingQueue);
  }
  return v2;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p>"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)debugDescription
{
  void *v3;
  objc_class *v4;
  const char *v5;
  void *v6;
  id Property;
  const char *v8;
  void *v9;
  id v10;
  void *v11;
  id WeakRetained;
  void *v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    Property = objc_getProperty(self, v5, 8, 1);
  else
    Property = 0;
  objc_msgSend(Property, "debugDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    v10 = objc_getProperty(self, v8, 16, 1);
  else
    v10 = 0;
  objc_msgSend(v10, "debugDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_previousOperation);
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p: operationQueue=%@, underlyingQueue=%@, previousOperation=%@>"), v6, self, v9, v11, WeakRetained);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_previousOperation);
  objc_storeStrong((id *)&self->_underlyingQueue, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
}

@end

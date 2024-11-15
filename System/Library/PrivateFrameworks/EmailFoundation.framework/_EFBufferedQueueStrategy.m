@implementation _EFBufferedQueueStrategy

- (_EFBufferedQueueStrategy)initWithCapacity:(unint64_t)a3 batchHandler:(id)a4
{
  id v6;
  _EFBufferedQueueStrategy *v7;
  _EFBufferedQueueStrategy *v8;
  void *v9;
  id batchHandler;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_EFBufferedQueueStrategy;
  v7 = -[_EFBufferedQueueStrategy init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_capacity = a3;
    v9 = _Block_copy(v6);
    batchHandler = v8->_batchHandler;
    v8->_batchHandler = v9;

  }
  return v8;
}

- (NSString)descriptionType
{
  return (NSString *)CFSTR("buffered");
}

- (void)enqueueObject:(id)a3 replaceIfExists:(BOOL)a4 buffer:(id)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  v12 = a3;
  v8 = a5;
  v9 = v8;
  if (v6)
    objc_msgSend(v8, "removeObject:", v12);
  objc_msgSend(v9, "addObject:", v12);
  if (objc_msgSend(v9, "count") >= self->_capacity)
  {
    v10 = (void *)MEMORY[0x1B5E15A60]();
    v11 = (void *)objc_msgSend(v9, "copy");
    (*((void (**)(void))self->_batchHandler + 2))();
    objc_msgSend(v9, "removeAllObjects");

    objc_autoreleasePoolPop(v10);
  }

}

- (void)dequeueObject:(id)a3 buffer:(id)a4
{
  objc_msgSend(a4, "removeObject:", a3);
}

- (id)batchHandler
{
  return self->_batchHandler;
}

- (unint64_t)capacity
{
  return self->_capacity;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_batchHandler, 0);
}

@end

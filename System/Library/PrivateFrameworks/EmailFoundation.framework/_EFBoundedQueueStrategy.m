@implementation _EFBoundedQueueStrategy

- (void)dequeueObject:(id)a3 buffer:(id)a4
{
  objc_msgSend(a4, "removeObject:", a3);
}

- (void)enqueueObject:(id)a3 replaceIfExists:(BOOL)a4 buffer:(id)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  void (**overflowHandler)(id, void *);
  void *v11;
  id v12;

  v6 = a4;
  v12 = a3;
  v8 = a5;
  v9 = v8;
  if (v6)
    objc_msgSend(v8, "removeObject:", v12);
  while (objc_msgSend(v9, "count") >= self->_capacity)
  {
    overflowHandler = (void (**)(id, void *))self->_overflowHandler;
    if (overflowHandler)
    {
      objc_msgSend(v9, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      overflowHandler[2](overflowHandler, v11);

    }
    objc_msgSend(v9, "removeObjectAtIndex:", 0);
  }
  objc_msgSend(v9, "addObject:", v12);

}

- (_EFBoundedQueueStrategy)initWithCapacity:(unint64_t)a3 overflowHandler:(id)a4
{
  id v6;
  _EFBoundedQueueStrategy *v7;
  _EFBoundedQueueStrategy *v8;
  void *v9;
  id overflowHandler;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_EFBoundedQueueStrategy;
  v7 = -[_EFBoundedQueueStrategy init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_capacity = a3;
    v9 = _Block_copy(v6);
    overflowHandler = v8->_overflowHandler;
    v8->_overflowHandler = v9;

  }
  return v8;
}

- (NSString)descriptionType
{
  return (NSString *)CFSTR("bounded");
}

- (id)overflowHandler
{
  return self->_overflowHandler;
}

- (unint64_t)capacity
{
  return self->_capacity;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_overflowHandler, 0);
}

@end

@implementation _CNBoundedQueueingStrategy

- (void).cxx_destruct
{
  objc_storeStrong(&self->_overflowHandler, 0);
}

- (void)enqueueObject:(id)a3 buffer:(id)a4
{
  id v6;
  void (**overflowHandler)(id, void *);
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "count") == self->_capacity)
  {
    overflowHandler = (void (**)(id, void *))self->_overflowHandler;
    if (overflowHandler)
    {
      objc_msgSend(v6, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      overflowHandler[2](overflowHandler, v8);

    }
    objc_msgSend(v6, "removeObjectAtIndex:", 0);
  }
  objc_msgSend(v6, "addObject:", v9);

}

- (_CNBoundedQueueingStrategy)initWithCapacity:(unint64_t)a3 overflowHandler:(id)a4
{
  id v6;
  _CNBoundedQueueingStrategy *v7;
  uint64_t v8;
  id overflowHandler;
  _CNBoundedQueueingStrategy *v10;

  v6 = a4;
  v7 = -[_CNBoundedQueueingStrategy initWithCapacity:](self, "initWithCapacity:", a3);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    overflowHandler = v7->_overflowHandler;
    v7->_overflowHandler = (id)v8;

    v10 = v7;
  }

  return v7;
}

- (_CNBoundedQueueingStrategy)initWithCapacity:(unint64_t)a3
{
  _CNBoundedQueueingStrategy *v4;
  _CNBoundedQueueingStrategy *v5;
  _CNBoundedQueueingStrategy *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_CNBoundedQueueingStrategy;
  v4 = -[_CNBoundedQueueingStrategy init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_capacity = a3;
    v6 = v4;
  }

  return v5;
}

@end

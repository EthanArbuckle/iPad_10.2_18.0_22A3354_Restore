@implementation AXIPCServerMessageHandlerContext

- (id)target
{
  return objc_loadWeakRetained(&self->_target);
}

- (SEL)selector
{
  return self->_selector;
}

- (BOOL)async
{
  return self->_async;
}

- (AXIPCServerMessageHandlerContext)initWithHandler:(id)a3
{
  id v4;
  AXIPCServerMessageHandlerContext *v5;
  AXIPCServerMessageHandlerContext *v6;
  uint64_t v7;
  void *handler;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AXIPCServerMessageHandlerContext;
  v5 = -[AXIPCServerMessageHandlerContext init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      v7 = objc_msgSend(v4, "copy");
      handler = v6->_handler;
      v6->_handler = (id)v7;
    }
    else
    {
      handler = v5;
      v6 = 0;
    }

  }
  return v6;
}

- (AXIPCServerMessageHandlerContext)initWithTarget:(id)a3 selector:(SEL)a4 async:(BOOL)a5
{
  id v8;
  AXIPCServerMessageHandlerContext *v9;
  AXIPCServerMessageHandlerContext *v10;
  objc_super v12;

  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AXIPCServerMessageHandlerContext;
  v9 = -[AXIPCServerMessageHandlerContext init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    if (v8 && a4)
    {
      objc_storeWeak(&v9->_target, v8);
      v10->_selector = a4;
      v10->_async = a5;
    }
    else
    {

      v10 = 0;
    }
  }

  return v10;
}

- (id)handler
{
  return self->_handler;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_target);
  objc_storeStrong(&self->_handler, 0);
}

@end

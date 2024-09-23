@implementation DummyHandlerProvider

- (DummyHandlerProvider)initWithHandler:(id)a3
{
  id v5;
  DummyHandlerProvider *v6;
  DummyHandlerProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DummyHandlerProvider;
  v6 = -[DummyHandlerProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong(&v6->_handler, a3);

  return v7;
}

- (id)handlerForIntent:(id)a3
{
  return self->_handler;
}

- (id)handler
{
  return self->_handler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
}

@end

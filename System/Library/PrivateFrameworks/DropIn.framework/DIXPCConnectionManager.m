@implementation DIXPCConnectionManager

- (DIXPCConnectionManager)initWithXPCManager:(id)a3 dispatcher:(id)a4
{
  id v7;
  id v8;
  DIXPCConnectionManager *v9;
  DIXPCConnectionManager *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DIXPCConnectionManager;
  v9 = -[DIXPCConnectionManager init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_manager, a3);
    objc_storeStrong((id *)&v10->_dispatcher, a4);
  }

  return v10;
}

- (DIXPCManager)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
  objc_storeStrong((id *)&self->_manager, a3);
}

- (DIXPCDispatcher)dispatcher
{
  return self->_dispatcher;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatcher, 0);
  objc_storeStrong((id *)&self->_manager, 0);
}

@end

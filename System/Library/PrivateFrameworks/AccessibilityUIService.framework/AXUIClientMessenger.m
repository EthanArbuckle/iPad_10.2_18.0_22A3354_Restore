@implementation AXUIClientMessenger

+ (id)clientMessengerWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[AXUIServiceManager sharedServiceManager](AXUIServiceManager, "sharedServiceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_clientMessengerWithIdentifier:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (AXUIClientMessenger)init
{
  AXUIClientMessenger *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AXUIClientMessenger;
  v2 = -[AXUIClientMessenger init](&v4, sel_init);
  if (v2)

  return 0;
}

- (AXUIClientMessenger)initWithClientIdentifier:(id)a3 connection:(id)a4
{
  id v6;
  id v7;
  AXUIClientMessenger *v8;
  AXUIClientMessenger *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AXUIClientMessenger;
  v8 = -[AXUIClientMessenger init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[AXUIClientMessenger setClientIdentifier:](v8, "setClientIdentifier:", v6);
    -[AXUIClientMessenger setConnection:](v9, "setConnection:", v7);
  }

  return v9;
}

- (void)sendAsynchronousMessage:(id)a3 withIdentifier:(unint64_t)a4 targetAccessQueue:(id)a5 completion:(id)a6
{
  -[AXUIClientMessenger sendAsynchronousMessage:withIdentifier:targetAccessQueue:completionRequiresWritingBlock:completion:](self, "sendAsynchronousMessage:withIdentifier:targetAccessQueue:completionRequiresWritingBlock:completion:", a3, a4, a5, 1, a6);
}

- (void)sendAsynchronousMessage:(id)a3 withIdentifier:(unint64_t)a4 targetAccessQueue:(id)a5 completionRequiresWritingBlock:(BOOL)a6 completion:(id)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  id v15;

  v7 = a6;
  v12 = a7;
  v13 = a5;
  v14 = a3;
  +[AXUIServiceManager sharedServiceManager](AXUIServiceManager, "sharedServiceManager");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_sendAsynchronousMessage:withIdentifier:toClientWithMessenger:targetAccessQueue:completionRequiresWritingBlock:completion:", v14, a4, self, v13, v7, v12);

}

- (id)sendSynchronousMessage:(id)a3 withIdentifier:(unint64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a3;
  +[AXUIServiceManager sharedServiceManager](AXUIServiceManager, "sharedServiceManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_sendSynchronousMessage:withIdentifier:toClientWithMessenger:error:", v8, a4, self, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUIClientMessenger clientIdentifier](self, "clientIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; clientIdentifier = \"%@\">"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (AXMultiplexConnectionHandler)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

@end

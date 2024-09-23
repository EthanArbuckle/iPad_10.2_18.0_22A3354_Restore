@implementation AISSetupController

- (AISSetupController)init
{
  return -[AISSetupController initWithQueue:](self, "initWithQueue:", 0);
}

- (AISSetupController)initWithQueue:(id)a3
{
  id v4;
  AISSetupController *v5;
  OS_dispatch_queue *v6;
  OS_dispatch_queue *queue;
  OS_dispatch_queue *v8;
  id v9;
  __AISSetupController *v10;
  __AISSetupController *implementation;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AISSetupController;
  v5 = -[AISSetupController init](&v13, sel_init);
  if (v5)
  {
    if (v4)
    {
      v6 = (OS_dispatch_queue *)v4;
      queue = v5->_queue;
      v5->_queue = v6;
    }
    else
    {
      v8 = (OS_dispatch_queue *)MEMORY[0x24BDAC9B8];
      v9 = MEMORY[0x24BDAC9B8];
      queue = v5->_queue;
      v5->_queue = v8;
    }

    v10 = -[__AISSetupController initWithQueue:]([__AISSetupController alloc], "initWithQueue:", v5->_queue);
    implementation = v5->_implementation;
    v5->_implementation = v10;

  }
  return v5;
}

- (void)setupWithContext:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[AISSetupController implementation](self, "implementation");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setupWithContext:completionHandler:", v7, v6);

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (__AISSetupController)implementation
{
  return self->_implementation;
}

- (void)setImplementation:(id)a3
{
  objc_storeStrong((id *)&self->_implementation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_implementation, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end

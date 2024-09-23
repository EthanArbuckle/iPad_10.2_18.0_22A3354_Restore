@implementation HMDCloudAccount

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (void)addAccountOperation:(id)a3
{
  id v4;
  HMDCloudAccountOperation *v5;
  void *v6;
  void *v7;
  HMDCloudAccountOperation *v8;

  v4 = a3;
  v5 = [HMDCloudAccountOperation alloc];
  -[HMDCloudAccount clientQueue](self, "clientQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMDCloudAccountOperation initWithBlock:clientQueue:](v5, "initWithBlock:clientQueue:", v4, v6);

  -[HMDCloudAccount queue](self, "queue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addOperation:", v8);

}

- (NSOperationQueue)queue
{
  return self->_queue;
}

- (HMDCloudAccount)initWithClientQueue:(id)a3
{
  id v5;
  HMDCloudAccount *v6;
  HMDCloudAccount *v7;
  NSOperationQueue *v8;
  NSOperationQueue *queue;
  HMDCloudAccount *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HMDCloudAccount;
  v6 = -[HMDCloudAccount init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_clientQueue, a3);
    v8 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    queue = v7->_queue;
    v7->_queue = v8;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v7->_queue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setName:](v7->_queue, "setName:", CFSTR("com.apple.HMDCloudAccount"));
    v10 = v7;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
}

@end

@implementation MTRCluster

- (MTRCluster)initWithEndpointID:(id)a3 queue:(id)a4
{
  id v7;
  id v8;
  MTRCluster *v9;
  MTRCluster *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MTRCluster;
  v9 = -[MTRCluster init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_endpointID, a3);
    objc_storeStrong((id *)&v10->_callbackQueue, a4);
  }

  return v10;
}

- (NSNumber)endpointID
{
  return self->_endpointID;
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_endpointID, 0);
}

@end

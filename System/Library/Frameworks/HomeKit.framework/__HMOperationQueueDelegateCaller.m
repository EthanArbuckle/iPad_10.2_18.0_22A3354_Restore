@implementation __HMOperationQueueDelegateCaller

- (__HMOperationQueueDelegateCaller)init
{
  __HMOperationQueueDelegateCaller *v2;
  uint64_t v3;
  NSOperationQueue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)__HMOperationQueueDelegateCaller;
  v2 = -[HMDelegateCaller init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    queue = v2->_queue;
    v2->_queue = (NSOperationQueue *)v3;

  }
  return v2;
}

- (__HMOperationQueueDelegateCaller)initWithQueue:(id)a3
{
  id v4;
  __HMOperationQueueDelegateCaller *v5;
  NSOperationQueue *v6;
  NSOperationQueue *queue;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)__HMOperationQueueDelegateCaller;
  v5 = -[HMDelegateCaller initWithQueue:](&v9, sel_initWithQueue_, v4);
  if (v5)
  {
    v6 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    queue = v5->_queue;
    v5->_queue = v6;

    -[NSOperationQueue setName:](v5->_queue, "setName:", CFSTR("HomeKit Delegate Caller"));
    -[NSOperationQueue setMaxConcurrentOperationCount:](v5->_queue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setUnderlyingQueue:](v5->_queue, "setUnderlyingQueue:", v4);
  }

  return v5;
}

- (__HMOperationQueueDelegateCaller)initWithOperationQueue:(id)a3
{
  id v5;
  __HMOperationQueueDelegateCaller *v6;
  __HMOperationQueueDelegateCaller *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)__HMOperationQueueDelegateCaller;
  v6 = -[HMDelegateCaller init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_queue, a3);

  return v7;
}

- (void)invokeBlock:(id)a3
{
  if (a3)
    -[NSOperationQueue addOperationWithBlock:](self->_queue, "addOperationWithBlock:");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end

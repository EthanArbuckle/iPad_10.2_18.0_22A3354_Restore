@implementation __HMQueueDelegateCaller

- (__HMQueueDelegateCaller)initWithQueue:(id)a3
{
  id v5;
  __HMQueueDelegateCaller *v6;
  __HMQueueDelegateCaller *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)__HMQueueDelegateCaller;
  v6 = -[HMDelegateCaller initWithQueue:](&v9, sel_initWithQueue_, v5);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_queue, a3);

  return v7;
}

- (void)invokeBlock:(id)a3
{
  if (a3)
    dispatch_async((dispatch_queue_t)self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end

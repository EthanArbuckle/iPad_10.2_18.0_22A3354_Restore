@implementation AFKeyValueObservingDeliveryOptions

- (AFKeyValueObservingDeliveryOptions)initWithQueue:(id)a3 qosClass:(unsigned int)a4 asynchronous:(BOOL)a5
{
  id v9;
  AFKeyValueObservingDeliveryOptions *v10;
  AFKeyValueObservingDeliveryOptions *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AFKeyValueObservingDeliveryOptions;
  v10 = -[AFKeyValueObservingDeliveryOptions init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_queue, a3);
    v11->_qosClass = a4;
    v11->_asynchronous = a5;
  }

  return v11;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (unsigned)qosClass
{
  return self->_qosClass;
}

- (BOOL)asynchronous
{
  return self->_asynchronous;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end

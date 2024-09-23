@implementation _KSRequestThrottle

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void)setDebugIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (_KSRequestThrottle)init
{
  return -[_KSRequestThrottle initWithCurve:maximumDelay:](self, "initWithCurve:maximumDelay:", &__block_literal_global_5, 60.0);
}

- (_KSRequestThrottle)initWithCurve:(id)a3 maximumDelay:(double)a4
{
  id v6;
  _KSRequestThrottle *v7;
  uint64_t v8;
  id curveFunction;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_KSRequestThrottle;
  v7 = -[_KSRequestThrottle init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    curveFunction = v7->_curveFunction;
    v7->_curveFunction = (id)v8;

    v7->_maximum = a4;
  }

  return v7;
}

- (void)postRequest:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[_KSRequestThrottle queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __34___KSRequestThrottle_postRequest___block_invoke;
  v7[3] = &unk_24E204BB8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (OS_dispatch_queue)queue
{
  OS_dispatch_queue *queue;
  OS_dispatch_queue *v3;
  id v4;

  queue = self->_queue;
  if (queue)
  {
    v3 = queue;
  }
  else
  {
    v3 = (OS_dispatch_queue *)MEMORY[0x24BDAC9B8];
    v4 = MEMORY[0x24BDAC9B8];
  }
  return v3;
}

- (void)_launch
{
  void (**request)(id, _QWORD *);
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  ++self->_retryCount;
  request = (void (**)(id, _QWORD *))self->_request;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __29___KSRequestThrottle__launch__block_invoke;
  v4[3] = &unk_24E205918;
  objc_copyWeak(&v5, &location);
  request[2](request, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (NSString)debugIdentifier
{
  return self->_debugIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugIdentifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_request, 0);
  objc_storeStrong(&self->_curveFunction, 0);
}

@end

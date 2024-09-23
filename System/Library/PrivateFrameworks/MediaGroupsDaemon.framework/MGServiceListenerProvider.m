@implementation MGServiceListenerProvider

- (MGServiceListenerProvider)initWithServiceName:(id)a3 entitlement:(id)a4
{
  id v7;
  id v8;
  MGServiceListenerProvider *v9;
  MGServiceListenerProvider *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MGServiceListenerProvider;
  v9 = -[MGServiceListenerProvider init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_serviceName, a3);
    objc_storeStrong((id *)&v10->_entitlement, a4);
  }

  return v10;
}

- (OS_dispatch_queue)dispatchQueue
{
  OS_dispatch_queue *dispatchQueue;
  id v4;
  const char *v5;
  NSObject *v6;
  OS_dispatch_queue *v7;
  OS_dispatch_queue *v8;

  dispatchQueue = self->_dispatchQueue;
  if (!dispatchQueue)
  {
    -[MGServiceListenerProvider serviceName](self, "serviceName");
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = (const char *)objc_msgSend(v4, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (OS_dispatch_queue *)dispatch_queue_create(v5, v6);
    v8 = self->_dispatchQueue;
    self->_dispatchQueue = v7;

    dispatchQueue = self->_dispatchQueue;
  }
  return dispatchQueue;
}

- (id)serviceListener
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x24BDD1998]);
  -[MGServiceListenerProvider serviceName](self, "serviceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithMachServiceName:", v4);

  return v5;
}

- (BOOL)serviceShouldAcceptNewConnection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  -[MGServiceListenerProvider entitlement](self, "entitlement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[MGServiceListenerProvider entitlement](self, "entitlement");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueForEntitlement:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "BOOLValue");

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (NSString)entitlement
{
  return self->_entitlement;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entitlement, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end

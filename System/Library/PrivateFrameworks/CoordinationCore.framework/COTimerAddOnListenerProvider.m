@implementation COTimerAddOnListenerProvider

- (OS_dispatch_queue)dispatchQueue
{
  OS_dispatch_queue *dispatchQueue;
  NSObject *v4;
  OS_dispatch_queue *v5;
  OS_dispatch_queue *v6;

  dispatchQueue = self->_dispatchQueue;
  if (!dispatchQueue)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.coordination.COTimerService", v4);
    v6 = self->_dispatchQueue;
    self->_dispatchQueue = v5;

    dispatchQueue = self->_dispatchQueue;
  }
  return dispatchQueue;
}

- (id)serviceListener
{
  id v2;

  v2 = objc_alloc(MEMORY[0x24BDD1998]);
  return (id)objc_msgSend(v2, "initWithMachServiceName:", *MEMORY[0x24BE19D80]);
}

- (BOOL)serviceShouldAcceptNewConnection:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "valueForEntitlement:", CFSTR("com.apple.private.coordination"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "BOOLValue") & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "valueForEntitlement:", CFSTR("com.apple.private.coordination.timers"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "BOOLValue");

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end

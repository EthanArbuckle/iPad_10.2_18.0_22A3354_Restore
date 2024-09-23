@implementation LACConcurrencyUtilities

+ (OS_dispatch_queue)daemonQueue
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__LACConcurrencyUtilities_daemonQueue__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (daemonQueue_onceToken != -1)
    dispatch_once(&daemonQueue_onceToken, block);
  return (OS_dispatch_queue *)(id)daemonQueue__queue;
}

void __38__LACConcurrencyUtilities_daemonQueue__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "createUserInitiatedSerialQueueWithIdentifier:", CFSTR("daemon-serial-queue"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)daemonQueue__queue;
  daemonQueue__queue = v1;

}

+ (id)createDefaultSerialQueueWithIdentifier:(id)a3
{
  return (id)objc_msgSend(a1, "createDefaultQueueWithIdentifier:concurrencyAttribute:", a3, 0);
}

+ (id)createUserInitiatedSerialQueueWithIdentifier:(id)a3
{
  return (id)objc_msgSend(a1, "createSerialQueueWithIdentifier:qos:", a3, 25);
}

+ (id)createSerialQueueWithIdentifier:(id)a3 qos:(unsigned int)a4
{
  return (id)objc_msgSend(a1, "createQueueWithIdentifier:concurrencyAttribute:qos:", a3, 0, *(_QWORD *)&a4);
}

+ (id)createDefaultQueueWithIdentifier:(id)a3 concurrencyAttribute:(id)a4
{
  id v5;
  NSObject *v6;
  dispatch_queue_t v7;

  v5 = objc_retainAutorelease(a3);
  v6 = a4;
  v7 = dispatch_queue_create((const char *)objc_msgSend(v5, "UTF8String"), v6);

  return v7;
}

+ (id)createQueueWithIdentifier:(id)a3 concurrencyAttribute:(id)a4 qos:(unsigned int)a5
{
  NSObject *v6;
  dispatch_queue_t v7;

  dispatch_queue_attr_make_with_qos_class((dispatch_queue_attr_t)a4, (dispatch_qos_class_t)a5, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = dispatch_queue_create((const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"), v6);

  return v7;
}

@end

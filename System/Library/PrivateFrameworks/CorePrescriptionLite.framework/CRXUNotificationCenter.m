@implementation CRXUNotificationCenter

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__CRXUNotificationCenter_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance___once__LINE___1 != -1)
    dispatch_once(&sharedInstance___once__LINE___1, block);
  return (id)sharedInstance_instance_1;
}

void __40__CRXUNotificationCenter_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_instance_1;
  sharedInstance_instance_1 = (uint64_t)v1;

}

- (void)postNotificationName:(id)a3
{
  notify_post((const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"));
}

- (int)addBlockObserver:(id)a3 queue:(id)a4 name:(id)a5
{
  id v7;
  id v8;
  id v9;
  const char *v10;
  NSObject *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  int out_token;

  v7 = a3;
  out_token = 0;
  v8 = objc_retainAutorelease(a5);
  v9 = a4;
  v10 = (const char *)objc_msgSend(v8, "UTF8String");
  objc_msgSend(v9, "queue");
  v11 = objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __54__CRXUNotificationCenter_addBlockObserver_queue_name___block_invoke;
  v14[3] = &unk_250B04508;
  v15 = v7;
  v12 = v7;
  notify_register_dispatch(v10, &out_token, v11, v14);

  LODWORD(v10) = out_token;
  return (int)v10;
}

uint64_t __54__CRXUNotificationCenter_addBlockObserver_queue_name___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (int)addObserver:(id)a3 selector:(SEL)a4 queue:(id)a5 name:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  const char *v13;
  NSObject *v14;
  id v15;
  _QWORD handler[4];
  id v18;
  id v19[2];
  id location;
  int out_token;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  out_token = 0;
  objc_initWeak(&location, v9);
  v12 = objc_retainAutorelease(v11);
  v13 = (const char *)objc_msgSend(v12, "UTF8String");
  objc_msgSend(v10, "queue");
  v14 = objc_claimAutoreleasedReturnValue();
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __58__CRXUNotificationCenter_addObserver_selector_queue_name___block_invoke;
  handler[3] = &unk_250B04530;
  objc_copyWeak(v19, &location);
  v19[1] = (id)a4;
  v15 = v12;
  v18 = v15;
  notify_register_dispatch(v13, &out_token, v14, handler);

  LODWORD(v13) = out_token;
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);

  return (int)v13;
}

void __58__CRXUNotificationCenter_addObserver_selector_queue_name___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      ((void (*)(id, _QWORD, _QWORD))objc_msgSend(WeakRetained, "methodForSelector:", *(_QWORD *)(a1 + 48)))(WeakRetained, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
  }
  else
  {
    notify_cancel(a2);
  }

}

- (void)removeObserver:(int)a3
{
  notify_cancel(a3);
}

@end

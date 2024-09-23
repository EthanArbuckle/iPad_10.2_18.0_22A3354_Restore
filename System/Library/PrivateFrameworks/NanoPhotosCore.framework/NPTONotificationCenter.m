@implementation NPTONotificationCenter

- (_QWORD)initWithDevice:(_QWORD *)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v3 = a2;
  if (a1)
  {
    v8.receiver = a1;
    v8.super_class = (Class)NPTONotificationCenter;
    a1 = objc_msgSendSuper2(&v8, sel_init);
    if (a1)
    {
      objc_msgSend(v3, "pairingID");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "UUIDString");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)a1[1];
      a1[1] = v5;

    }
  }

  return a1;
}

- (NPTODarwinNotificationObserver)observerForName:(void *)a3 queue:(void *)a4 block:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NPTODarwinNotificationObserver *v13;
  _QWORD v15[4];
  id v16;
  id v17;

  v7 = a2;
  v8 = a4;
  if (a1)
  {
    objc_msgSend(a3, "underlyingQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      dispatch_get_global_queue(0, 0);
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = v11;

    v13 = [NPTODarwinNotificationObserver alloc];
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __54__NPTONotificationCenter_observerForName_queue_block___block_invoke;
    v15[3] = &unk_24D069630;
    v16 = v7;
    v17 = v8;
    a1 = -[NPTODarwinNotificationObserver initWithNotificationName:queue:block:](v13, "initWithNotificationName:queue:block:", v16, v12, v15);

  }
  return a1;
}

uint64_t __54__NPTONotificationCenter_observerForName_queue_block___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  nanophotos_log_sync();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_21387D000, v2, OS_LOG_TYPE_DEFAULT, "[NotificationCenter] Received notitication %@", (uint8_t *)&v5, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)postNotificationName:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1)
  {
    nanophotos_log_sync();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 8);
      v6 = 138412546;
      v7 = v3;
      v8 = 2112;
      v9 = v5;
      _os_log_impl(&dword_21387D000, v4, OS_LOG_TYPE_DEFAULT, "[NotificationCenter] Posting notitication %@ for device %@", (uint8_t *)&v6, 0x16u);
    }

    notify_post((const char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String"));
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devicePairingID, 0);
}

@end

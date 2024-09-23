@implementation NMSNotificationDispatcher

- (NMSNotificationDispatcher)initWithNotificationName:(id)a3
{
  id v5;
  NMSNotificationDispatcher *v6;
  NMSNotificationDispatcher *v7;
  uint64_t v8;
  NSString *localDarwinNotificationName;
  uint64_t v10;
  NSString *remoteDarwinNotificationName;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;
  const char *v15;
  NSObject *v16;
  uint64_t v17;
  const char *v18;
  NSObject *v19;
  _QWORD v21[4];
  id v22;
  _QWORD handler[4];
  id v24;
  id location;
  objc_super v26;

  v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)NMSNotificationDispatcher;
  v6 = -[NMSNotificationDispatcher init](&v26, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_baseNotificationName, a3);
    objc_msgSend(v5, "stringByAppendingString:", CFSTR(".local"));
    v8 = objc_claimAutoreleasedReturnValue();
    localDarwinNotificationName = v7->_localDarwinNotificationName;
    v7->_localDarwinNotificationName = (NSString *)v8;

    objc_msgSend(v5, "stringByAppendingString:", CFSTR(".remote"));
    v10 = objc_claimAutoreleasedReturnValue();
    remoteDarwinNotificationName = v7->_remoteDarwinNotificationName;
    v7->_remoteDarwinNotificationName = (NSString *)v10;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create("com.apple.NanoMusicSync.NotificationDispatcher", v12);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v13;

    objc_initWeak(&location, v7);
    v7->_localNotifyToken = -1;
    v15 = -[NSString UTF8String](v7->_localDarwinNotificationName, "UTF8String");
    v16 = v7->_queue;
    v17 = MEMORY[0x24BDAC760];
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __54__NMSNotificationDispatcher_initWithNotificationName___block_invoke;
    handler[3] = &unk_24D647588;
    objc_copyWeak(&v24, &location);
    notify_register_dispatch(v15, &v7->_localNotifyToken, v16, handler);
    v7->_remoteNotifyToken = -1;
    v18 = -[NSString UTF8String](v7->_remoteDarwinNotificationName, "UTF8String");
    v19 = v7->_queue;
    v21[0] = v17;
    v21[1] = 3221225472;
    v21[2] = __54__NMSNotificationDispatcher_initWithNotificationName___block_invoke_2;
    v21[3] = &unk_24D647588;
    objc_copyWeak(&v22, &location);
    notify_register_dispatch(v18, &v7->_remoteNotifyToken, v19, v21);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __54__NMSNotificationDispatcher_initWithNotificationName___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleLocalNotificationIgnoringSenderPID:", 0);

}

void __54__NMSNotificationDispatcher_initWithNotificationName___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleRemoteNotification");

}

- (void)dealloc
{
  objc_super v3;

  if (notify_is_valid_token(self->_localNotifyToken))
    notify_cancel(self->_localNotifyToken);
  if (notify_is_valid_token(self->_remoteNotifyToken))
    notify_cancel(self->_remoteNotifyToken);
  v3.receiver = self;
  v3.super_class = (Class)NMSNotificationDispatcher;
  -[NMSNotificationDispatcher dealloc](&v3, sel_dealloc);
}

- (void)scheduleLocalDarwinNotification
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__NMSNotificationDispatcher_scheduleLocalDarwinNotification__block_invoke;
  block[3] = &unk_24D646F30;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __60__NMSNotificationDispatcher_scheduleLocalDarwinNotification__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(result + 32))
    return objc_msgSend((id)result, "_postLocalDarwinNotification");
  *(_BYTE *)(result + 40) = 1;
  return result;
}

- (void)beginWaitingForUpdates
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__NMSNotificationDispatcher_beginWaitingForUpdates__block_invoke;
  block[3] = &unk_24D646F30;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __51__NMSNotificationDispatcher_beginWaitingForUpdates__block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(result + 32) + 32);
  return result;
}

- (void)endWaitingForUpdates
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__NMSNotificationDispatcher_endWaitingForUpdates__block_invoke;
  block[3] = &unk_24D646F30;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __49__NMSNotificationDispatcher_endWaitingForUpdates__block_invoke(uint64_t result)
{
  uint64_t v1;

  --*(_QWORD *)(*(_QWORD *)(result + 32) + 32);
  v1 = *(_QWORD *)(result + 32);
  if (!*(_QWORD *)(v1 + 32))
  {
    if (*(_BYTE *)(v1 + 40))
    {
      *(_BYTE *)(v1 + 40) = 0;
      return objc_msgSend(*(id *)(result + 32), "_postLocalDarwinNotification");
    }
  }
  return result;
}

- (void)_handleLocalNotificationIgnoringSenderPID:(BOOL)a3
{
  NSObject *v4;
  NSString *localDarwinNotificationName;
  uint64_t v6;
  uint64_t v7;
  id WeakRetained;
  char v9;
  id v10;
  char v11;
  _QWORD v12[5];
  BOOL v13;
  _BYTE buf[24];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  NMLogForCategory(5);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    localDarwinNotificationName = self->_localDarwinNotificationName;
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = localDarwinNotificationName;
    _os_log_impl(&dword_216E27000, v4, OS_LOG_TYPE_DEFAULT, "[NMSyncDefaults] Received notification: %@", buf, 0xCu);
  }

  *(_QWORD *)buf = 0;
  v6 = getpid();
  notify_get_state(self->_localNotifyToken, (uint64_t *)buf);
  v7 = *(_QWORD *)buf;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (v7 == v6)
  {
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      v10 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v10, "dispatcherDidReceiveNotificationFromCurrentProcess:", self);
LABEL_8:

    }
  }
  else
  {
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      v10 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v10, "dispatcherDidReceiveNotificationFromOtherProcess:", self);
      goto LABEL_8;
    }
  }
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __71__NMSNotificationDispatcher__handleLocalNotificationIgnoringSenderPID___block_invoke;
  v12[3] = &unk_24D6478D8;
  v12[4] = self;
  v13 = v7 == v6;
  dispatch_async(MEMORY[0x24BDAC9B8], v12);
}

void __71__NMSNotificationDispatcher__handleLocalNotificationIgnoringSenderPID___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
  v6 = CFSTR("IsInProcessNotification");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", v3, 0, v5);

}

- (void)_handleRemoteNotification
{
  NSObject *v3;
  NSString *remoteDarwinNotificationName;
  id WeakRetained;
  char v6;
  id v7;
  _QWORD block[5];
  uint8_t buf[4];
  NSString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  NMLogForCategory(5);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    remoteDarwinNotificationName = self->_remoteDarwinNotificationName;
    *(_DWORD *)buf = 138412290;
    v10 = remoteDarwinNotificationName;
    _os_log_impl(&dword_216E27000, v3, OS_LOG_TYPE_DEFAULT, "[NMSyncDefaults] Received notification: %@", buf, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v7, "dispatcherDidReceiveNotificationFromRemoteDevice:", self);

  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__NMSNotificationDispatcher__handleRemoteNotification__block_invoke;
  block[3] = &unk_24D646F30;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __54__NMSNotificationDispatcher__handleRemoteNotification__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
  v5 = CFSTR("IsInProcessNotification");
  v6[0] = MEMORY[0x24BDBD1C0];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", v3, 0, v4);

}

- (void)_postLocalDarwinNotification
{
  NSObject *v3;
  NSString *localDarwinNotificationName;
  int localNotifyToken;
  pid_t v6;
  int v7;
  NSString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  NMLogForCategory(5);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    localDarwinNotificationName = self->_localDarwinNotificationName;
    v7 = 138412290;
    v8 = localDarwinNotificationName;
    _os_log_impl(&dword_216E27000, v3, OS_LOG_TYPE_DEFAULT, "[NMSyncDefaults] Posting notification: %@", (uint8_t *)&v7, 0xCu);
  }

  localNotifyToken = self->_localNotifyToken;
  v6 = getpid();
  notify_set_state(localNotifyToken, v6);
  notify_post(-[NSString UTF8String](self->_localDarwinNotificationName, "UTF8String"));
}

- (NSString)baseNotificationName
{
  return self->_baseNotificationName;
}

- (NMSNotificationDispatcherDelegate)delegate
{
  return (NMSNotificationDispatcherDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_baseNotificationName, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_remoteDarwinNotificationName, 0);
  objc_storeStrong((id *)&self->_localDarwinNotificationName, 0);
}

@end

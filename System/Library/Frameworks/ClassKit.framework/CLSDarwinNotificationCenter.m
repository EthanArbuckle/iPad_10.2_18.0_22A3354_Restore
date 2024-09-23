@implementation CLSDarwinNotificationCenter

+ (id)defaultCenter
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D4081614;
  block[3] = &unk_1E9749D50;
  block[4] = a1;
  if (qword_1ED0FB628 != -1)
    dispatch_once(&qword_1ED0FB628, block);
  return (id)qword_1ED0FB630;
}

- (CLSDarwinNotificationCenter)init
{
  CLSDarwinNotificationCenter *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSMapTable *notificationsByName;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  NSMapTable *notificationsByObserver;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  NSMapTable *tokenByName;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  NSMapTable *observerByHash;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)CLSDarwinNotificationCenter;
  v2 = -[CLSDarwinNotificationCenter init](&v24, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);
    v4 = objc_claimAutoreleasedReturnValue();

    v5 = dispatch_queue_create("CLSDarwinNotificationCenterQ", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    objc_msgSend_strongToStrongObjectsMapTable(MEMORY[0x1E0CB3748], v7, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    notificationsByName = v2->_notificationsByName;
    v2->_notificationsByName = (NSMapTable *)v9;

    objc_msgSend_weakToStrongObjectsMapTable(MEMORY[0x1E0CB3748], v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    notificationsByObserver = v2->_notificationsByObserver;
    v2->_notificationsByObserver = (NSMapTable *)v13;

    objc_msgSend_strongToStrongObjectsMapTable(MEMORY[0x1E0CB3748], v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    tokenByName = v2->_tokenByName;
    v2->_tokenByName = (NSMapTable *)v17;

    objc_msgSend_strongToWeakObjectsMapTable(MEMORY[0x1E0CB3748], v19, v20);
    v21 = objc_claimAutoreleasedReturnValue();
    observerByHash = v2->_observerByHash;
    v2->_observerByHash = (NSMapTable *)v21;

  }
  return v2;
}

- (void)unregisterFromDarwinNotification:(id)a3
{
  id v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  int v10;
  const char *v11;
  uint32_t v12;
  NSObject *v13;
  int v14;
  id v15;
  __int16 v16;
  uint32_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_objectForKey_(self->_tokenByName, v5, (uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6;
  if (v6)
  {
    v10 = objc_msgSend_intValue(v6, v7, v8);
    if (notify_is_valid_token(v10))
    {
      v12 = notify_cancel(v10);
      if (qword_1ED0FB9A0 != -1)
        dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
      v13 = CLSLogNotifications;
      if (v12)
      {
        if (os_log_type_enabled((os_log_t)CLSLogNotifications, OS_LOG_TYPE_ERROR))
        {
          v14 = 138412546;
          v15 = v4;
          v16 = 1024;
          v17 = v12;
            (uint8_t *)&v14,
            0x12u);
        }
      }
      else if (os_log_type_enabled((os_log_t)CLSLogNotifications, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 138412290;
        v15 = v4;
      }
    }
    objc_msgSend_removeObjectForKey_(self->_tokenByName, v11, (uint64_t)v4);
  }

}

- (void)handleObserverRemoval
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D4081910;
  block[3] = &unk_1E974A658;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)addObserver:(id)a3 notificationName:(id)a4 block:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
    __assert_rtn("-[CLSDarwinNotificationCenter addObserver:notificationName:block:]", "CLSDarwinNotificationCenter.m", 161, "observer != nil");
  if (!v9)
    __assert_rtn("-[CLSDarwinNotificationCenter addObserver:notificationName:block:]", "CLSDarwinNotificationCenter.m", 162, "name != nil");
  if (!v10)
    __assert_rtn("-[CLSDarwinNotificationCenter addObserver:notificationName:block:]", "CLSDarwinNotificationCenter.m", 163, "block != nil");
  queue = self->_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1D4081C2C;
  v15[3] = &unk_1E974A8C0;
  v15[4] = self;
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async(queue, v15);

}

- (void)postNotificationName:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD block[4];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1D4082248;
    block[3] = &unk_1E974A658;
    v8 = v4;
    dispatch_async(queue, block);

  }
}

- (void)postLocalNotificationName:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = sub_1D4082414;
    v7[3] = &unk_1E974A8E8;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

- (void)removeObserver:(id)a3 notificationName:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *queue;
  id v13;
  _QWORD block[5];
  id v15;
  uint64_t v16;

  v6 = a3;
  v7 = a4;
  if (!v6)
    __assert_rtn("-[CLSDarwinNotificationCenter removeObserver:notificationName:]", "CLSDarwinNotificationCenter.m", 269, "observer != nil");
  v10 = v7;
  v11 = objc_msgSend_hash(v6, v8, v9);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D40826A8;
  block[3] = &unk_1E974A5E8;
  v15 = v10;
  v16 = v11;
  block[4] = self;
  v13 = v10;
  dispatch_async(queue, block);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observerByHash, 0);
  objc_storeStrong((id *)&self->_tokenByName, 0);
  objc_storeStrong((id *)&self->_notificationsByObserver, 0);
  objc_storeStrong((id *)&self->_notificationsByName, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end

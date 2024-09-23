@implementation ACCUserNotificationManager

- (ACCUserNotificationManager)init
{
  ACCUserNotificationManager *v2;
  objc_class *v3;
  id v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  uint64_t v7;
  NSMutableSet *userNotifications;
  uint64_t v9;
  NSMutableDictionary *completionHandlers;
  NSRecursiveLock *v11;
  NSRecursiveLock *lock;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)ACCUserNotificationManager;
  v2 = -[ACCUserNotificationManager init](&v14, sel_init);
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = dispatch_queue_create((const char *)objc_msgSend(v4, "UTF8String"), 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v7 = objc_claimAutoreleasedReturnValue();
    userNotifications = v2->_userNotifications;
    v2->_userNotifications = (NSMutableSet *)v7;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    completionHandlers = v2->_completionHandlers;
    v2->_completionHandlers = (NSMutableDictionary *)v9;

    v11 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x24BDD1788]);
    lock = v2->_lock;
    v2->_lock = v11;

  }
  return v2;
}

- (void)presentNotification:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  CFOptionFlags v18;
  const __CFAllocator *v19;
  const __CFDictionary *v20;
  CFUserNotificationRef v21;
  void *v22;
  void *v23;
  const void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  double v28;
  double v29;
  dispatch_time_t v30;
  NSObject *v31;
  _QWORD v32[5];
  id v33;
  uint64_t *v34;
  _QWORD block[5];
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  unint64_t v40;
  SInt32 error;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_msgSend(v6, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v6, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACCUserNotificationManager dismissNotificationWithIdentifier:](self, "dismissNotificationWithIdentifier:", v9);

    }
    -[ACCUserNotificationManager lock](self, "lock");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lock");

    -[ACCUserNotificationManager userNotifications](self, "userNotifications");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v6);

    if (v7)
    {
      -[ACCUserNotificationManager completionHandlers](self, "completionHandlers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x219A09094](v7);
      objc_msgSend(v6, "uuid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKey:", v13, v14);

    }
    -[ACCUserNotificationManager lock](self, "lock");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "unlock");

    objc_msgSend(v6, "createBackingUserNotification");
    objc_msgSend(v6, "userNotificationCFDict");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = objc_msgSend(v6, "type") - 1;
      if (v17 > 2)
        v18 = 3;
      else
        v18 = qword_21728F320[v17];
      error = 0;
      v37 = 0;
      v38 = &v37;
      v39 = 0x2020000000;
      v40 = 0xAAAAAAAAAAAAAAAALL;
      v19 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      objc_msgSend(v6, "userNotificationCFDict");
      v20 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      v21 = CFUserNotificationCreate(v19, 0.0, v18, &error, v20);

      v40 = (unint64_t)v21;
      if (error || !v38[3])
      {
        -[ACCUserNotificationManager lock](self, "lock");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "lock");

        objc_msgSend(v6, "setUserNotificationCF:", 0);
        -[ACCUserNotificationManager lock](self, "lock");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "unlock");

        v24 = (const void *)v38[3];
        if (v24)
        {
          CFRelease(v24);
          v38[3] = 0;
        }
      }
      else
      {
        -[ACCUserNotificationManager lock](self, "lock");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "lock");

        objc_msgSend(v6, "setUserNotificationCF:", v38[3]);
        -[ACCUserNotificationManager lock](self, "lock");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "unlock");

        objc_msgSend(v6, "timeout");
        v27 = MEMORY[0x24BDAC760];
        if (v28 > 0.0)
        {
          objc_msgSend(v6, "timeout");
          v30 = dispatch_time(0, (uint64_t)(v29 * 1000000000.0));
          block[0] = v27;
          block[1] = 3221225472;
          block[2] = __68__ACCUserNotificationManager_presentNotification_completionHandler___block_invoke;
          block[3] = &unk_24D71A1D8;
          block[4] = self;
          v36 = v6;
          dispatch_after(v30, MEMORY[0x24BDAC9B8], block);

        }
        -[ACCUserNotificationManager queue](self, "queue");
        v31 = objc_claimAutoreleasedReturnValue();
        v32[0] = v27;
        v32[1] = 3221225472;
        v32[2] = __68__ACCUserNotificationManager_presentNotification_completionHandler___block_invoke_2;
        v32[3] = &unk_24D719FF8;
        v34 = &v37;
        v32[4] = self;
        v33 = v6;
        dispatch_async(v31, v32);

      }
      _Block_object_dispose(&v37, 8);
    }
  }

}

uint64_t __68__ACCUserNotificationManager_presentNotification_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissNotification:", *(_QWORD *)(a1 + 40));
}

void __68__ACCUserNotificationManager_presentNotification_completionHandler___block_invoke_2(uint64_t a1)
{
  CFOptionFlags v2;
  void *v3;
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  unsigned int v8;
  uint64_t v9;
  CFOptionFlags responseFlags;

  responseFlags = 3;
  CFUserNotificationReceiveResponse(*(CFUserNotificationRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), 0.0, &responseFlags);
  v2 = responseFlags;
  objc_msgSend(*(id *)(a1 + 32), "lock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  objc_msgSend(*(id *)(a1 + 32), "completionHandlers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "setUserNotificationCF:", 0);
  objc_msgSend(*(id *)(a1 + 32), "lock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

  if (v6)
  {
    if (v2 == 1)
      v8 = 1;
    else
      v8 = 2;
    if (v2)
      v9 = v8;
    else
      v9 = 0;
    v6[2](v6, v9);
  }
  CFRelease(*(CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  objc_msgSend(*(id *)(a1 + 32), "removeUserNotification:", *(_QWORD *)(a1 + 40));

}

- (void)dismissNotification:(id)a3
{
  id v4;
  void *v5;
  __CFUserNotification *v6;
  __CFUserNotification *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  if (v4)
  {
    v10 = v4;
    -[ACCUserNotificationManager lock](self, "lock");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lock");

    v6 = (__CFUserNotification *)objc_msgSend(v10, "userNotificationCF");
    if (v6)
    {
      v7 = v6;
      CFRetain(v6);
      -[ACCUserNotificationManager lock](self, "lock");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "unlock");

      CFUserNotificationCancel(v7);
      CFRelease(v7);
    }
    else
    {
      -[ACCUserNotificationManager lock](self, "lock");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "unlock");

    }
    v4 = v10;
  }

}

- (void)dismissNotificationWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    -[ACCUserNotificationManager lock](self, "lock");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lock");

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    -[ACCUserNotificationManager userNotifications](self, "userNotifications");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v26 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v12, "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqualToString:", v4);

          if (v14)
            objc_msgSend(v6, "addObject:", v12);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v9);
    }

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v15 = v6;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v22;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v22 != v18)
            objc_enumerationMutation(v15);
          -[ACCUserNotificationManager dismissNotification:](self, "dismissNotification:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * j), (_QWORD)v21);
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      }
      while (v17);
    }

    -[ACCUserNotificationManager lock](self, "lock");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "unlock");

  }
}

- (void)dismissNotificationsWithGroupIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    -[ACCUserNotificationManager lock](self, "lock");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lock");

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    -[ACCUserNotificationManager userNotifications](self, "userNotifications");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v26 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v12, "groupIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqualToString:", v4);

          if (v14)
            objc_msgSend(v6, "addObject:", v12);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v9);
    }

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v15 = v6;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v22;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v22 != v18)
            objc_enumerationMutation(v15);
          -[ACCUserNotificationManager dismissNotification:](self, "dismissNotification:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * j), (_QWORD)v21);
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      }
      while (v17);
    }

    -[ACCUserNotificationManager lock](self, "lock");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "unlock");

  }
}

- (void)dismisssAllNotifications
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[ACCUserNotificationManager lock](self, "lock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  -[ACCUserNotificationManager userNotifications](self, "userNotifications");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        -[ACCUserNotificationManager dismissNotification:](self, "dismissNotification:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10++), (_QWORD)v12);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  -[ACCUserNotificationManager lock](self, "lock");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "unlock");

}

- (id)userNotificationWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ACCUserNotificationManager lock](self, "lock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[ACCUserNotificationManager userNotifications](self, "userNotifications", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "uuid");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v4);

        if (v12)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  -[ACCUserNotificationManager lock](self, "lock");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "unlock");

  return v7;
}

- (void)removeUserNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (a3)
  {
    v4 = a3;
    -[ACCUserNotificationManager lock](self, "lock");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lock");

    -[ACCUserNotificationManager userNotifications](self, "userNotifications");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObject:", v4);

    -[ACCUserNotificationManager completionHandlers](self, "completionHandlers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectForKey:", v8);

    objc_msgSend(v4, "setUserNotificationCF:", 0);
    -[ACCUserNotificationManager lock](self, "lock");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "unlock");

  }
}

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__ACCUserNotificationManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_once_0 != -1)
    dispatch_once(&sharedManager_once_0, block);
  return (id)sharedManager_sharedInstance_0;
}

void __43__ACCUserNotificationManager_sharedManager__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedManager_sharedInstance_0;
  sharedManager_sharedInstance_0 = (uint64_t)v1;

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSMutableSet)userNotifications
{
  return self->_userNotifications;
}

- (void)setUserNotifications:(id)a3
{
  objc_storeStrong((id *)&self->_userNotifications, a3);
}

- (NSMutableDictionary)completionHandlers
{
  return self->_completionHandlers;
}

- (void)setCompletionHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_completionHandlers, a3);
}

- (NSRecursiveLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
  objc_storeStrong((id *)&self->_lock, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_userNotifications, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end

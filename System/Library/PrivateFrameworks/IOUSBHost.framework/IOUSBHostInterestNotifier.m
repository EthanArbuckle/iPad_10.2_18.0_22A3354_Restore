@implementation IOUSBHostInterestNotifier

- (IOUSBHostInterestNotifier)initWithOwner:(id)a3 callback:(void *)a4
{
  id v5;
  IOUSBHostInterestNotifier *v6;
  id v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  id v12;
  dispatch_queue_t v13;
  void *v14;
  IONotificationPort *v15;
  NSObject *v16;
  IOUSBHostInterestNotifier *v17;
  _BOOL8 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _BOOL8 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _BOOL8 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  objc_super v43;

  v43.receiver = self;
  v43.super_class = (Class)IOUSBHostInterestNotifier;
  v5 = a3;
  v6 = -[IOUSBHostInterestNotifier init](&v43, sel_init);
  -[IOUSBHostInterestNotifier setDestroyed:](v6, "setDestroyed:", 0);
  -[IOUSBHostInterestNotifier setOwner:](v6, "setOwner:", v5);

  -[IOUSBHostInterestNotifier setCallback:](v6, "setCallback:", a4);
  v7 = objc_alloc_init(MEMORY[0x24BDD1788]);
  -[IOUSBHostInterestNotifier setLock:](v6, "setLock:", v7);

  -[IOUSBHostInterestNotifier lock](v6, "lock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v18 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v18)
      -[IOUSBHostInterestNotifier initWithOwner:callback:].cold.1(v18, v19, v20, v21, v22, v23, v24, v25);
    goto LABEL_11;
  }
  v9 = (void *)MEMORY[0x24BDD17C8];
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.iokit.usb.framework.IOUSBHost"), v11, v43.receiver, v43.super_class);
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v13 = dispatch_queue_create((const char *)objc_msgSend(v12, "UTF8String"), 0);
  -[IOUSBHostInterestNotifier setQueue:](v6, "setQueue:", v13);

  -[IOUSBHostInterestNotifier queue](v6, "queue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v26 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v26)
      -[IOUSBHostInterestNotifier initWithOwner:callback:].cold.2(v26, v27, v28, v29, v30, v31, v32, v33);
    goto LABEL_11;
  }
  -[IOUSBHostInterestNotifier setNotificationPortRef:](v6, "setNotificationPortRef:", IONotificationPortCreate(*MEMORY[0x24BDD8B18]));
  if (!-[IOUSBHostInterestNotifier notificationPortRef](v6, "notificationPortRef"))
  {
    v34 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v34)
      -[IOUSBHostInterestNotifier initWithOwner:callback:].cold.3(v34, v35, v36, v37, v38, v39, v40, v41);
LABEL_11:
    v17 = 0;
    goto LABEL_12;
  }
  v15 = -[IOUSBHostInterestNotifier notificationPortRef](v6, "notificationPortRef");
  -[IOUSBHostInterestNotifier queue](v6, "queue");
  v16 = objc_claimAutoreleasedReturnValue();
  IONotificationPortSetDispatchQueue(v15, v16);

  v17 = v6;
LABEL_12:

  return v17;
}

- (IOUSBHostInterestNotifier)initWithOwner:(id)a3 service:(unsigned int)a4 callback:(void *)a5
{
  uint64_t v5;
  IOUSBHostInterestNotifier *v6;
  IOUSBHostInterestNotifier *v7;
  IOUSBHostInterestNotifier *v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v5 = *(_QWORD *)&a4;
  v6 = -[IOUSBHostInterestNotifier initWithOwner:callback:](self, "initWithOwner:callback:", a3, a5);
  v7 = v6;
  if (!(_DWORD)v5)
  {
LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }
  -[IOUSBHostInterestNotifier setService:](v6, "setService:", v5);
  if (!-[IOUSBHostInterestNotifier notifier](v7, "notifier"))
  {
    v9 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v9)
      -[IOUSBHostInterestNotifier initWithOwner:service:callback:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    goto LABEL_6;
  }
  v8 = v7;
LABEL_7:

  return v8;
}

- (IOUSBHostInterestNotifier)initWithOwner:(id)a3 matchingDictionary:(id)a4 callback:(void *)a5
{
  id v8;
  IOUSBHostInterestNotifier *v9;
  IONotificationPort *v10;
  const __CFDictionary *v11;
  uint64_t v12;
  IOUSBHostInterestNotifier *v13;
  _BOOL8 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v8 = a4;
  v9 = -[IOUSBHostInterestNotifier initWithOwner:callback:](self, "initWithOwner:callback:", a3, a5);
  v10 = -[IOUSBHostInterestNotifier notificationPortRef](v9, "notificationPortRef");
  v11 = (const __CFDictionary *)v8;
  IOServiceAddMatchingNotification(v10, "IOServiceFirstMatch", v11, (IOServiceMatchingCallback)_internalMatchingCallback, v9, &v9->_matchingIterator);
  if (-[IOUSBHostInterestNotifier matchingIterator](v9, "matchingIterator"))
  {
    v12 = IOIteratorNext(-[IOUSBHostInterestNotifier matchingIterator](v9, "matchingIterator"));
    if ((_DWORD)v12)
    {
      -[IOUSBHostInterestNotifier setService:](v9, "setService:", v12);
      IOObjectRelease(-[IOUSBHostInterestNotifier matchingIterator](v9, "matchingIterator"));
      -[IOUSBHostInterestNotifier setMatchingIterator:](v9, "setMatchingIterator:", 0);
    }
    v13 = v9;
  }
  else
  {
    v14 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v14)
      -[IOUSBHostInterestNotifier initWithOwner:matchingDictionary:callback:].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);
    v13 = 0;
  }

  return v13;
}

- (void)dealloc
{
  objc_super v3;

  -[IOUSBHostInterestNotifier destroy](self, "destroy");
  v3.receiver = self;
  v3.super_class = (Class)IOUSBHostInterestNotifier;
  -[IOUSBHostInterestNotifier dealloc](&v3, sel_dealloc);
}

- (void)destroy
{
  void *v3;
  void *v4;
  IOUSBHostInterestNotifier *v5;
  NSObject *v6;
  void *v7;
  _QWORD block[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  IOUSBHostInterestNotifier *v14;

  -[IOUSBHostInterestNotifier lock](self, "lock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  if (!-[IOUSBHostInterestNotifier destroyed](self, "destroyed"))
  {
    -[IOUSBHostInterestNotifier setDestroyed:](self, "setDestroyed:", 1);
    if (-[IOUSBHostInterestNotifier service](self, "service"))
      -[IOUSBHostInterestNotifier setService:](self, "setService:", 0);
    if (-[IOUSBHostInterestNotifier notificationPortRef](self, "notificationPortRef"))
    {
      IONotificationPortDestroy(-[IOUSBHostInterestNotifier notificationPortRef](self, "notificationPortRef"));
      -[IOUSBHostInterestNotifier setNotificationPortRef:](self, "setNotificationPortRef:", 0);
    }
    -[IOUSBHostInterestNotifier queue](self, "queue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v9 = 0;
      v10 = &v9;
      v11 = 0x3032000000;
      v12 = __Block_byref_object_copy__0;
      v13 = __Block_byref_object_dispose__0;
      v14 = (IOUSBHostInterestNotifier *)0xAAAAAAAAAAAAAAAALL;
      v5 = self;
      v14 = v5;
      objc_msgSend((id)v10[5], "queue");
      v6 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __36__IOUSBHostInterestNotifier_destroy__block_invoke;
      block[3] = &unk_24DEDCB28;
      block[4] = &v9;
      dispatch_async(v6, block);

      -[IOUSBHostInterestNotifier setQueue:](v5, "setQueue:", 0);
      _Block_object_dispose(&v9, 8);

    }
  }
  -[IOUSBHostInterestNotifier lock](self, "lock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

}

void __36__IOUSBHostInterestNotifier_destroy__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "matchingIterator"))
    IOObjectRelease(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "matchingIterator"));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setMatchingIterator:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setService:", 0);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

- (void)setService:(unsigned int)a3
{
  void *v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _DWORD v15[2];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[IOUSBHostInterestNotifier lock](self, "lock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  if (-[IOUSBHostInterestNotifier notifier](self, "notifier"))
  {
    IOObjectRelease(-[IOUSBHostInterestNotifier notifier](self, "notifier"));
    -[IOUSBHostInterestNotifier setNotifier:](self, "setNotifier:", 0);
  }
  if (-[IOUSBHostInterestNotifier service](self, "service"))
    IOObjectRelease(-[IOUSBHostInterestNotifier service](self, "service"));
  self->_service = a3;
  if (-[IOUSBHostInterestNotifier service](self, "service")
    && !-[IOUSBHostInterestNotifier destroyed](self, "destroyed"))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      v15[0] = 67109120;
      v15[1] = a3;
      _os_log_impl(&dword_21B5CC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "IOUSBHostInterfaceNotifier: adding interest for %d\n", (uint8_t *)v15, 8u);
    }
    IOObjectRetain(-[IOUSBHostInterestNotifier service](self, "service"));
    IOServiceAddInterestNotification(-[IOUSBHostInterestNotifier notificationPortRef](self, "notificationPortRef"), -[IOUSBHostInterestNotifier service](self, "service"), "IOGeneralInterest", (IOServiceInterestCallback)_internalInterestCallback_0, self, &self->_notifier);
    if (!-[IOUSBHostInterestNotifier notifier](self, "notifier"))
    {
      v6 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v6)
        -[IOUSBHostInterestNotifier setService:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  -[IOUSBHostInterestNotifier lock](self, "lock");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "unlock");

}

- (NSObject)owner
{
  return objc_loadWeakRetained((id *)&self->_owner);
}

- (void)setOwner:(id)a3
{
  objc_storeWeak((id *)&self->_owner, a3);
}

- (BOOL)destroyed
{
  return self->_destroyed;
}

- (void)setDestroyed:(BOOL)a3
{
  self->_destroyed = a3;
}

- (NSRecursiveLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
  objc_storeStrong((id *)&self->_lock, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (IONotificationPort)notificationPortRef
{
  return self->_notificationPortRef;
}

- (void)setNotificationPortRef:(IONotificationPort *)a3
{
  self->_notificationPortRef = a3;
}

- (void)callback
{
  return self->_callback;
}

- (void)setCallback:(void *)a3
{
  self->_callback = a3;
}

- (unsigned)service
{
  return self->_service;
}

- (unsigned)notifier
{
  return self->_notifier;
}

- (void)setNotifier:(unsigned int)a3
{
  self->_notifier = a3;
}

- (unsigned)matchingIterator
{
  return self->_matchingIterator;
}

- (void)setMatchingIterator:(unsigned int)a3
{
  self->_matchingIterator = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_destroyWeak((id *)&self->_owner);
}

- (void)initWithOwner:(uint64_t)a3 callback:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B5CC000, MEMORY[0x24BDACB70], a3, "IOUSBHostInterestNotifier: Failed to allocate lock\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithOwner:(uint64_t)a3 callback:(uint64_t)a4 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B5CC000, MEMORY[0x24BDACB70], a3, "IOUSBHostInterestNotifier: Failed to allocate queue\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithOwner:(uint64_t)a3 callback:(uint64_t)a4 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B5CC000, MEMORY[0x24BDACB70], a3, "IOUSBHostInterestNotifier: Failed to create notification port\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithOwner:(uint64_t)a3 service:(uint64_t)a4 callback:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B5CC000, MEMORY[0x24BDACB70], a3, "IOUSBHostInterestNotifier: Failed to register for interest\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithOwner:(uint64_t)a3 matchingDictionary:(uint64_t)a4 callback:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B5CC000, MEMORY[0x24BDACB70], a3, "IOUSBHostInterestNotifier: Failed to create matching notification\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)setService:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B5CC000, MEMORY[0x24BDACB70], a3, "Failed to create notifier\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

@end

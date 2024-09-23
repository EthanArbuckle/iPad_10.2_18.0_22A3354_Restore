@implementation PFCloudKitThrottledNotificationObserver

- (PFCloudKitThrottledNotificationObserver)initWithLabel:(id)a3 handlerBlock:(id)a4
{
  PFCloudKitThrottledNotificationObserver *v6;
  PFCloudKitThrottledNotificationObserver *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PFCloudKitThrottledNotificationObserver;
  v6 = -[PFCloudKitThrottledNotificationObserver init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_notificationStalenessInterval = 10;
    atomic_store(0, (unsigned int *)&v6->_notificationIteration);
    v6->_label = (NSString *)a3;
    v7->_assertionLabel = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("CoreData: %@"), v7->_label);
    v7->_notificationHandlerBlock = (id)objc_msgSend(a4, "copy");
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  self->_notificationHandlerBlock = 0;
  self->_assertionLabel = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFCloudKitThrottledNotificationObserver;
  -[PFCloudKitThrottledNotificationObserver dealloc](&v3, sel_dealloc);
}

- (void)noteRecievedNotification:(uint64_t)a1
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  dispatch_time_t v25;
  NSObject *global_queue;
  _QWORD block[8];
  uint64_t v28;

  if (a1)
  {
    v3 = objc_msgSend(a2, "name");
    v4 = (void *)MEMORY[0x18D76B4E4]();
    if ((unint64_t)__ckLoggingOverride >= 9)
      v5 = 9;
    else
      v5 = __ckLoggingOverride;
    v6 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Got: %@ - %d"));
    v7 = (unsigned int *)(a1 + 8);
    atomic_load((unsigned int *)(a1 + 8));
    _NSCoreDataLog(v5, v6, v8, v9, v10, v11, v12, v13, (uint64_t)"-[PFCloudKitThrottledNotificationObserver noteRecievedNotification:]");
    objc_autoreleasePoolPop(v4);
    do
      v14 = __ldaxr(v7);
    while (__stlxr(v14 + 1, v7));
    if (v14)
    {
      v15 = (void *)MEMORY[0x18D76B4E4]();
      if ((unint64_t)__ckLoggingOverride >= 0x10)
        v16 = 16;
      else
        v16 = __ckLoggingOverride;
      v17 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@ - Already scheduled a block to respond to '%@', %d notifications since."));
      atomic_load((unsigned int *)(a1 + 8));
      _NSCoreDataLog(v16, v17, v18, v19, v20, v21, v22, v23, (uint64_t)"-[PFCloudKitThrottledNotificationObserver noteRecievedNotification:]");
      objc_autoreleasePoolPop(v15);
    }
    else
    {
      v28 = 0;
      v24 = +[NSPersistentStoreCoordinator _beginPowerAssertionNamed:withAssert:]((uint64_t)NSPersistentStoreCoordinator, *(_QWORD *)(a1 + 16), &v28);
      v25 = dispatch_time(0, 1000000000 * *(_QWORD *)(a1 + 32));
      global_queue = dispatch_get_global_queue(21, 0);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __68__PFCloudKitThrottledNotificationObserver_noteRecievedNotification___block_invoke;
      block[3] = &unk_1E1EE1E40;
      block[4] = a1;
      block[5] = v3;
      block[6] = v24;
      block[7] = v28;
      dispatch_after(v25, global_queue, block);
    }
  }
}

void __68__PFCloudKitThrottledNotificationObserver_noteRecievedNotification___block_invoke(uint64_t a1)
{
  unsigned int *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint8_t buf[4];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = (unsigned int *)(*(_QWORD *)(a1 + 32) + 8);
  do
    __ldaxr(v2);
  while (__stlxr(0, v2));
  v3 = (void *)MEMORY[0x18D76B4E4]();
  if ((unint64_t)__ckLoggingOverride >= 9)
    v4 = 9;
  else
    v4 = __ckLoggingOverride;
  v5 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Executing '%@' block for '%@' clearing %d iterations."));
  _NSCoreDataLog(v4, v5, v6, v7, v8, v9, v10, v11, (uint64_t)"-[PFCloudKitThrottledNotificationObserver noteRecievedNotification:]_block_invoke");
  objc_autoreleasePoolPop(v3);
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
  if (v12)
  {
    (*(void (**)(uint64_t, _QWORD))(v12 + 16))(v12, *(_QWORD *)(a1 + 40));
  }
  else
  {
    v13 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "No notification handler block specified. Dropping: %@");
    _NSCoreDataLog(17, v13, v14, v15, v16, v17, v18, v19, *(_QWORD *)(a1 + 40));
    v20 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      v21 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v23 = v21;
      _os_log_fault_impl(&dword_18A253000, v20, OS_LOG_TYPE_FAULT, "CoreData: No notification handler block specified. Dropping: %@", buf, 0xCu);
    }
  }
  +[NSPersistentStoreCoordinator _endPowerAssertionWithAssert:andApp:]((uint64_t)NSPersistentStoreCoordinator, *(_QWORD *)(a1 + 56), *(void **)(a1 + 48));
}

@end

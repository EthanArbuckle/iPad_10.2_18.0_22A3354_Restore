@implementation BSPowerMonitor

+ (id)sharedInstance
{
  if (qword_1ECD39908 != -1)
    dispatch_once(&qword_1ECD39908, &__block_literal_global_15);
  return (id)_MergedGlobals_17;
}

void __32__BSPowerMonitor_sharedInstance__block_invoke()
{
  BSPowerMonitor *v0;
  id v1;
  dispatch_queue_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  io_connect_t v8;
  void *v9;
  objc_super v10;

  v0 = [BSPowerMonitor alloc];
  if (v0)
  {
    v10.receiver = v0;
    v10.super_class = (Class)BSPowerMonitor;
    v1 = objc_msgSendSuper2(&v10, sel_init);
    if (v1)
    {
      v2 = BSDispatchQueueCreateWithQualityOfService("com.apple.baseboard.powermonitor", 0, QOS_CLASS_USER_INITIATED, 0);
      v3 = (void *)*((_QWORD *)v1 + 4);
      *((_QWORD *)v1 + 4) = v2;

      *((_DWORD *)v1 + 10) = 0;
      objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = (void *)*((_QWORD *)v1 + 6);
      *((_QWORD *)v1 + 6) = v4;

      +[BSZeroingWeakReference referenceWithObject:](BSZeroingWeakReference, "referenceWithObject:", v1);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)*((_QWORD *)v1 + 3);
      *((_QWORD *)v1 + 3) = v6;

      v8 = IORegisterForSystemPower(*((void **)v1 + 3), (IONotificationPortRef *)v1 + 1, (IOServiceInterestCallback)_BSPowerChanged, (io_object_t *)v1 + 4);
      *((_DWORD *)v1 + 14) = v8;
      if (v8)
        IONotificationPortSetDispatchQueue(*((IONotificationPortRef *)v1 + 1), *((dispatch_queue_t *)v1 + 4));
    }
  }
  else
  {
    v1 = 0;
  }
  v9 = (void *)_MergedGlobals_17;
  _MergedGlobals_17 = (uint64_t)v1;

}

- (BSPowerMonitor)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSPowerMonitor.m"), 153, CFSTR("Please use the shared instance."));

  return 0;
}

- (void)dealloc
{
  BSZeroingWeakReference *v3;
  NSObject *queue;
  BSZeroingWeakReference *v5;
  objc_super v6;
  _QWORD block[4];
  BSZeroingWeakReference *v8;

  if (self->_rootDomainConnect)
  {
    IODeregisterForSystemPower(&self->_notifier);
    IONotificationPortDestroy(self->_notificationPort);
    IOServiceClose(self->_rootDomainConnect);
  }
  v3 = self->_weakSelfWrapper;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__BSPowerMonitor_dealloc__block_invoke;
  block[3] = &unk_1E1EBE890;
  v8 = v3;
  v5 = v3;
  dispatch_async(queue, block);

  v6.receiver = self;
  v6.super_class = (Class)BSPowerMonitor;
  -[BSPowerMonitor dealloc](&v6, sel_dealloc);
}

id __25__BSPowerMonitor_dealloc__block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "object");
}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    os_unfair_lock_lock(&self->_observersLock);
    -[NSHashTable addObject:](self->_lock_observers, "addObject:", v5);
    os_unfair_lock_unlock(&self->_observersLock);
    v4 = v5;
  }

}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    os_unfair_lock_lock(&self->_observersLock);
    -[NSHashTable removeObject:](self->_lock_observers, "removeObject:", v5);
    os_unfair_lock_unlock(&self->_observersLock);
    v4 = v5;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_observers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_weakSelfWrapper, 0);
}

@end

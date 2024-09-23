@implementation NTKFirstUnlockQueue

- (NTKFirstUnlockQueue)initWithName:(const char *)a3
{
  NTKFirstUnlockQueue *v4;
  NTKFirstUnlockQueue *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NTKFirstUnlockQueue;
  v4 = -[NTKFirstUnlockQueue init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_name = a3;
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create(a3, v6);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v7;

    v5->_isSuspended = 0;
    v5->_suspendLock._os_unfair_lock_opaque = 0;
    -[NTKFirstUnlockQueue _suspendThreadBeforeFirstUnlock](v5, "_suspendThreadBeforeFirstUnlock");

  }
  return v5;
}

- (void)dealloc
{
  int notifyToken;
  objc_super v4;

  notifyToken = self->_notifyToken;
  if (notifyToken != -1)
  {
    notify_cancel(notifyToken);
    self->_notifyToken = -1;
  }
  v4.receiver = self;
  v4.super_class = (Class)NTKFirstUnlockQueue;
  -[NTKFirstUnlockQueue dealloc](&v4, sel_dealloc);
}

- (void)dispatch:(id)a3
{
  dispatch_async((dispatch_queue_t)self->_queue, a3);
}

- (void)_suspendThreadBeforeFirstUnlock
{
  int *p_notifyToken;
  id v4;
  int v5;
  NSObject *v6;
  const char *name;
  _QWORD v8[4];
  id v9;
  id location;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  self->_notifyToken = -1;
  p_notifyToken = &self->_notifyToken;
  v4 = MEMORY[0x1E0C80D38];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__NTKFirstUnlockQueue__suspendThreadBeforeFirstUnlock__block_invoke;
  v8[3] = &unk_1E6BCE7B0;
  objc_copyWeak(&v9, &location);
  notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", &self->_notifyToken, MEMORY[0x1E0C80D38], v8);

  os_unfair_lock_lock(&self->_suspendLock);
  if (MKBGetDeviceLockState() == 3)
  {
    self->_isBeforeFirstUnlock = 0;
    goto LABEL_4;
  }
  v5 = MKBDeviceUnlockedSinceBoot();
  self->_isBeforeFirstUnlock = v5 == 0;
  if (v5)
  {
LABEL_4:
    if (*p_notifyToken != -1)
    {
      notify_cancel(*p_notifyToken);
      *p_notifyToken = -1;
    }
    goto LABEL_9;
  }
  _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    name = self->_name;
    *(_DWORD *)buf = 136315138;
    v12 = name;
    _os_log_impl(&dword_1B72A3000, v6, OS_LOG_TYPE_DEFAULT, "NTKFirstUnlockQueue:init(%s) suspending the queue", buf, 0xCu);
  }

  self->_isSuspended = 1;
  dispatch_suspend((dispatch_object_t)self->_queue);
LABEL_9:
  os_unfair_lock_unlock(&self->_suspendLock);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __54__NTKFirstUnlockQueue__suspendThreadBeforeFirstUnlock__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_firstUnlock");
    WeakRetained = v2;
  }

}

- (void)_firstUnlock
{
  NSObject *v3;
  const char *name;
  NSObject *v5;
  const char *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    name = self->_name;
    v7 = 136315138;
    v8 = name;
    _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "Received kMobileKeyBagFirstUnlockNotificationID NTKFirstUnlockQueue: first unlock for queue %s!", (uint8_t *)&v7, 0xCu);
  }

  os_unfair_lock_lock(&self->_suspendLock);
  notify_cancel(self->_notifyToken);
  self->_notifyToken = -1;
  if (self->_isSuspended)
  {
    _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = self->_name;
      v7 = 136315138;
      v8 = v6;
      _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "NTKFirstUnlockQueue:_firstUnlock(%s) resuming the queue", (uint8_t *)&v7, 0xCu);
    }

    dispatch_resume((dispatch_object_t)self->_queue);
  }
  *(_WORD *)&self->_isSuspended = 0;
  os_unfair_lock_unlock(&self->_suspendLock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end

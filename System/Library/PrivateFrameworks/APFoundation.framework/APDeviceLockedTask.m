@implementation APDeviceLockedTask

+ (BOOL)deviceUnlockedSinceBoot
{
  return MKBDeviceUnlockedSinceBoot() != 0;
}

- (APDeviceLockedTask)initWithHandler:(id)a3
{
  id v4;
  APDeviceLockedTask *v5;
  void *v6;
  id taskHandler;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)APDeviceLockedTask;
  v5 = -[APDeviceLockedTask init](&v12, sel_init);
  if (v5)
  {
    v6 = _Block_copy(v4);
    taskHandler = v5->_taskHandler;
    v5->_taskHandler = v6;

    objc_msgSend__registerForLockStateNotification(v5, v8, v9, v10);
  }

  return v5;
}

- (void)_registerForLockStateNotification
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  _QWORD aBlock[5];
  id v13;
  id location;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1CF27FD88;
  aBlock[3] = &unk_1E8C48830;
  aBlock[4] = self;
  objc_copyWeak(&v13, &location);
  v3 = _Block_copy(aBlock);
  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = dispatch_queue_create("com.apple.ap.unlocknotification", v4);

  if (notify_register_dispatch((const char *)*MEMORY[0x1E0DAC070], &dword_1ED2BC298, v5, v3))
  {
    APLogForCategory(0x10uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138477827;
      v16 = v7;
      v8 = v7;
      _os_log_impl(&dword_1CF251000, v6, OS_LOG_TYPE_ERROR, "[%{private}@]: Failed to register for springboard lock state events", buf, 0xCu);

    }
    dword_1ED2BC298 = -1;
  }
  else
  {
    APLogForCategory(0x10uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138477827;
      v16 = v10;
      v11 = v10;
      _os_log_impl(&dword_1CF251000, v9, OS_LOG_TYPE_DEFAULT, "[%{private}@]: Registered for springboard lock state events.", buf, 0xCu);

    }
  }

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (id)taskHandler
{
  return self->_taskHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_taskHandler, 0);
}

@end

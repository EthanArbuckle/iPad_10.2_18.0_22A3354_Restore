@implementation NPKIDVRemoteDeviceServiceEventsCoordinator

- (NPKIDVRemoteDeviceServiceEventsCoordinator)init
{
  NPKIDVRemoteDeviceServiceEventsCoordinator *v2;
  NPKIDVRemoteDeviceServiceEventsCoordinator *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *remoteProcessNotificationQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NPKIDVRemoteDeviceServiceEventsCoordinator;
  v2 = -[NPKIDVRemoteDeviceServiceEventsCoordinator init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_serviceContextLock._os_unfair_lock_opaque = 0;
    v4 = dispatch_queue_create("com.apple.NanoPassKit.RemoteDeviceServiceEventsCoordinator.remoteNotification", 0);
    remoteProcessNotificationQueue = v3->_remoteProcessNotificationQueue;
    v3->_remoteProcessNotificationQueue = (OS_dispatch_queue *)v4;

  }
  return v3;
}

- (NSString)remoteDeviceID
{
  os_unfair_lock_s *p_serviceContextLock;
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  uint8_t v9[16];

  p_serviceContextLock = &self->_serviceContextLock;
  os_unfair_lock_lock(&self->_serviceContextLock);
  -[NPKIDVRemoteDeviceServiceContext remoteDeviceID](self->_serviceContext, "remoteDeviceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_serviceContextLock);
  if (!v4)
  {
    pk_Payment_log();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

    if (v6)
    {
      pk_Payment_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Warning: NPKIDVRemoteDeviceService: Not active device initialized", v9, 2u);
      }

    }
  }
  return (NSString *)v4;
}

- (void)teardownCurrentRemoteDeviceContextWithReason:(unint64_t)a3
{
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  pk_Payment_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromNPKIDVRemoteDeviceTeardownReason(a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = v8;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested tear down service context with reason:%@", (uint8_t *)&v12, 0xCu);

    }
  }
  if (a3)
    v9 = 4 * (a3 == 1);
  else
    v9 = 2;
  os_unfair_lock_lock(&self->_serviceContextLock);
  -[NPKIDVRemoteDeviceServiceContext remoteDeviceID](self->_serviceContext, "remoteDeviceID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKIDVRemoteDeviceServiceContext serviceNamesForEvent:](self->_serviceContext, "serviceNamesForEvent:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKIDVRemoteDeviceServiceEventsCoordinator insideLockTeardownCurrentRemoteDeviceContextWithReason:](self, "insideLockTeardownCurrentRemoteDeviceContextWithReason:", a3);
  os_unfair_lock_unlock(&self->_serviceContextLock);
  -[NPKIDVRemoteDeviceServiceEventsCoordinator _notifyProcessWithServiceNames:deviceEvent:forDeviceID:](self, "_notifyProcessWithServiceNames:deviceEvent:forDeviceID:", v11, v9, v10);

}

- (void)insideLockTeardownCurrentRemoteDeviceContextWithReason:(unint64_t)a3
{
  NPKIDVRemoteDeviceServiceContext *serviceContext;
  NPKIDVRemoteDeviceServiceContext *v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  NPKIDVRemoteDeviceServiceContext *v11;
  NSString *serviceContextPath;
  void *v13;
  NPKIDVRemoteDeviceServiceContext *v14;
  NSString *v15;
  NSObject *v16;
  _BOOL4 v17;
  NSObject *v18;
  NSString *v19;
  uint64_t v20;
  int v21;
  NPKIDVRemoteDeviceServiceContext *v22;
  __int16 v23;
  NSString *v24;
  __int16 v25;
  NPKIDVRemoteDeviceServiceContext *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  serviceContext = self->_serviceContext;
  if (serviceContext)
  {
    -[NPKIDVRemoteDeviceServiceContext remoteDeviceID](serviceContext, "remoteDeviceID");
    v6 = (NPKIDVRemoteDeviceServiceContext *)objc_claimAutoreleasedReturnValue();
    -[NPKIDVRemoteDeviceServiceContext serviceNamesForEvent:](self->_serviceContext, "serviceNamesForEvent:", 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    pk_Payment_log();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

    if (v9)
    {
      pk_Payment_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = self->_serviceContext;
        serviceContextPath = self->_serviceContextPath;
        NSStringFromNPKIDVRemoteDeviceTeardownReason(a3);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138413058;
        v22 = v11;
        v23 = 2112;
        v24 = serviceContextPath;
        v25 = 2112;
        v26 = v6;
        v27 = 2112;
        v28 = v13;
        _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Will tear down service context:%@ at path:%@ for deviceID:%@ reason:%@", (uint8_t *)&v21, 0x2Au);

      }
    }
    -[NPKIDVRemoteDeviceServiceEventsCoordinator _insideLockPersistServiceContext](self, "_insideLockPersistServiceContext");
    v14 = self->_serviceContext;
    self->_serviceContext = 0;

    v15 = self->_serviceContextPath;
    self->_serviceContextPath = 0;

    pk_Payment_log();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

    if (v17)
    {
      pk_Payment_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromNPKIDVRemoteDeviceTeardownReason(a3);
        v19 = (NSString *)objc_claimAutoreleasedReturnValue();
        v21 = 138412546;
        v22 = v6;
        v23 = 2112;
        v24 = v19;
        _os_log_impl(&dword_213518000, v18, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Did tear down service context for deviceID:%@ reason:%@", (uint8_t *)&v21, 0x16u);

      }
    }
    if (a3)
      v20 = 4 * (a3 == 1);
    else
      v20 = 2;
    -[NPKIDVRemoteDeviceServiceEventsCoordinator _notifyProcessWithServiceNames:deviceEvent:forDeviceID:](self, "_notifyProcessWithServiceNames:deviceEvent:forDeviceID:", v7, v20, v6);

  }
}

- (void)initializeWithDevice:(id)a3
{
  id v4;
  NPKIDVRemoteDeviceServiceContext *v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  NPKIDVRemoteDeviceServiceContext *v12;
  NPKIDVRemoteDeviceServiceContext *serviceContext;
  NSObject *v14;
  _BOOL4 v15;
  NSObject *v16;
  void *v17;
  NSString *v18;
  NSString *serviceContextPath;
  NSString *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  _BOOL4 v24;
  NSObject *p_super;
  NSString *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  NPKIDVRemoteDeviceServiceContext *v30;
  NPKIDVRemoteDeviceServiceContext *v31;
  NSObject *v32;
  _BOOL4 v33;
  NSObject *v34;
  NSString *v35;
  NPKIDVRemoteDeviceServiceContext *v36;
  NPKIDVRemoteDeviceServiceContext *v37;
  NSObject *v38;
  _BOOL4 v39;
  NSObject *v40;
  NPKIDVRemoteDeviceServiceContext *v41;
  NSString *v42;
  id v43;
  uint8_t buf[4];
  NPKIDVRemoteDeviceServiceContext *v45;
  __int16 v46;
  NSString *v47;
  __int16 v48;
  NPKIDVRemoteDeviceServiceContext *v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "valueForProperty:", *MEMORY[0x24BE6B3A8]);
  v5 = (NPKIDVRemoteDeviceServiceContext *)objc_claimAutoreleasedReturnValue();
  pk_Payment_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    pk_Payment_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v45 = v5;
      _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested initialize service context for device with ParingID:%@", buf, 0xCu);
    }

  }
  os_unfair_lock_lock(&self->_serviceContextLock);
  if (self->_serviceContext)
  {
    pk_Payment_log();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (v10)
    {
      pk_Payment_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        -[NPKIDVRemoteDeviceServiceContext remoteDeviceID](self->_serviceContext, "remoteDeviceID");
        v12 = (NPKIDVRemoteDeviceServiceContext *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v45 = v12;
        _os_log_impl(&dword_213518000, v11, OS_LOG_TYPE_DEFAULT, "Warning: NPKIDVRemoteDeviceService: It seem we didn't teardown deviceID:%@. Lets make sure we start from a clean state", buf, 0xCu);

      }
    }
    -[NPKIDVRemoteDeviceServiceEventsCoordinator insideLockTeardownCurrentRemoteDeviceContextWithReason:](self, "insideLockTeardownCurrentRemoteDeviceContextWithReason:", 0);
    serviceContext = self->_serviceContext;
    self->_serviceContext = 0;

  }
  pk_Payment_log();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    if (v15)
    {
      pk_Payment_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v45 = v5;
        _os_log_impl(&dword_213518000, v16, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Will initialize context for device with ParingID:%@", buf, 0xCu);
      }

    }
    NPKHomeDirectoryPathForDevice(v4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringByAppendingPathComponent:", CFSTR("remoteDeviceServiceContext.npkctx"));
    v18 = (NSString *)objc_claimAutoreleasedReturnValue();
    serviceContextPath = self->_serviceContextPath;
    self->_serviceContextPath = v18;

    v20 = self->_serviceContextPath;
    v43 = 0;
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:options:error:", v20, 1, &v43);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v43;
    if (v22)
    {
      pk_Payment_log();
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);

      if (!v24)
      {
LABEL_26:
        v31 = self->_serviceContext;
        if (!v31)
        {
          pk_Payment_log();
          v32 = objc_claimAutoreleasedReturnValue();
          v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);

          if (v33)
          {
            pk_Payment_log();
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              v35 = self->_serviceContextPath;
              *(_DWORD *)buf = 138412290;
              v45 = (NPKIDVRemoteDeviceServiceContext *)v35;
              _os_log_impl(&dword_213518000, v34, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: NPKIDVRemoteDeviceServiceContext from:%@ was nil.", buf, 0xCu);
            }

          }
          v36 = objc_alloc_init(NPKIDVRemoteDeviceServiceContext);
          v37 = self->_serviceContext;
          self->_serviceContext = v36;

          -[NPKIDVRemoteDeviceServiceEventsCoordinator _insideLockPersistServiceContext](self, "_insideLockPersistServiceContext");
          v31 = self->_serviceContext;
        }
        -[NPKIDVRemoteDeviceServiceContext remoteDeviceID](v31, "remoteDeviceID");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        pk_Payment_log();
        v38 = objc_claimAutoreleasedReturnValue();
        v39 = os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT);

        if (v39)
        {
          pk_Payment_log();
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            v41 = self->_serviceContext;
            v42 = self->_serviceContextPath;
            *(_DWORD *)buf = 138413058;
            v45 = v41;
            v46 = 2112;
            v47 = v42;
            v48 = 2112;
            v49 = v5;
            v50 = 2112;
            v51 = v28;
            _os_log_impl(&dword_213518000, v40, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: initialized context:%@ at path:%@ for device with ParingID:%@ and deviceID:%@", buf, 0x2Au);
          }

        }
        -[NPKIDVRemoteDeviceServiceContext serviceNamesForEvent:](self->_serviceContext, "serviceNamesForEvent:", 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_37;
      }
      pk_Payment_log();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
        v26 = self->_serviceContextPath;
        *(_DWORD *)buf = 138412546;
        v45 = (NPKIDVRemoteDeviceServiceContext *)v22;
        v46 = 2112;
        v47 = v26;
        _os_log_impl(&dword_213518000, p_super, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: NPKIDVRemoteDeviceServiceContext error:%@ loading context from:%@", buf, 0x16u);
      }
    }
    else
    {
      v29 = objc_opt_class();
      NPKSecureUnarchiveObject(v21, v29);
      v30 = (NPKIDVRemoteDeviceServiceContext *)objc_claimAutoreleasedReturnValue();
      p_super = &self->_serviceContext->super;
      self->_serviceContext = v30;
    }

    goto LABEL_26;
  }
  if (!v15)
  {
    v27 = 0;
    v28 = 0;
    goto LABEL_38;
  }
  pk_Payment_log();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213518000, v22, OS_LOG_TYPE_DEFAULT, "Warning: NPKIDVRemoteDeviceService: No active device is found, this could be ok but we let you know just in case", buf, 2u);
  }
  v27 = 0;
  v28 = 0;
LABEL_37:

LABEL_38:
  os_unfair_lock_unlock(&self->_serviceContextLock);
  if (objc_msgSend(v27, "count") && objc_msgSend(v28, "length"))
    -[NPKIDVRemoteDeviceServiceEventsCoordinator _notifyProcessWithServiceNames:deviceEvent:forDeviceID:](self, "_notifyProcessWithServiceNames:deviceEvent:forDeviceID:", v27, 1, v28);

}

- (void)setNeedsPrearmCredential:(BOOL)a3
{
  unint64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (a3)
    v4 = 8;
  else
    v4 = 16;
  pk_Payment_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      stringsArrayFromNPKIDVRemoteDeviceServiceEvents(v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v8;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested notify %@", (uint8_t *)&v11, 0xCu);

    }
  }
  os_unfair_lock_lock(&self->_serviceContextLock);
  -[NPKIDVRemoteDeviceServiceContext remoteDeviceID](self->_serviceContext, "remoteDeviceID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKIDVRemoteDeviceServiceContext serviceNamesForEvent:](self->_serviceContext, "serviceNamesForEvent:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_serviceContextLock);
  -[NPKIDVRemoteDeviceServiceEventsCoordinator _notifyProcessWithServiceNames:deviceEvent:forDeviceID:](self, "_notifyProcessWithServiceNames:deviceEvent:forDeviceID:", v10, v4, v9);

}

- (void)handlePassDeletionForPass:(id)a3
{
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      stringsArrayFromNPKIDVRemoteDeviceServiceEvents(0x20uLL);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v7;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested notify %@", (uint8_t *)&v10, 0xCu);

    }
  }
  os_unfair_lock_lock(&self->_serviceContextLock);
  -[NPKIDVRemoteDeviceServiceContext remoteDeviceID](self->_serviceContext, "remoteDeviceID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKIDVRemoteDeviceServiceContext serviceNamesForEvent:](self->_serviceContext, "serviceNamesForEvent:", 32);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_serviceContextLock);
  -[NPKIDVRemoteDeviceServiceEventsCoordinator _notifyProcessWithServiceNames:deviceEvent:forDeviceID:](self, "_notifyProcessWithServiceNames:deviceEvent:forDeviceID:", v9, 32, v8);

}

- (unint64_t)registerEvents:(unint64_t)a3 forServiceName:(id)a4
{
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  unint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  _BOOL4 v17;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  pk_Payment_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    pk_Payment_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      stringsArrayFromNPKIDVRemoteDeviceServiceEvents(a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138412546;
      v20 = v10;
      v21 = 2112;
      v22 = v6;
      _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested register events:%@ forServiceName:%@", (uint8_t *)&v19, 0x16u);

    }
  }
  if (!self->_serviceContext)
  {
    pk_Payment_log();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

    if (!v17)
    {
      v11 = 0xFFFFFFFF80000000;
      goto LABEL_15;
    }
    pk_Payment_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_213518000, v14, OS_LOG_TYPE_DEFAULT, "Warning: NPKIDVRemoteDeviceService: Not active device initialized, we can't register requested events", (uint8_t *)&v19, 2u);
    }
    v11 = 0xFFFFFFFF80000000;
    goto LABEL_13;
  }
  os_unfair_lock_lock(&self->_serviceContextLock);
  v11 = -[NPKIDVRemoteDeviceServiceContext registerEvents:forServiceName:](self->_serviceContext, "registerEvents:forServiceName:", a3, v6);
  -[NPKIDVRemoteDeviceServiceEventsCoordinator _insideLockPersistServiceContext](self, "_insideLockPersistServiceContext");
  os_unfair_lock_unlock(&self->_serviceContextLock);
  pk_Payment_log();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

  if (v13)
  {
    pk_Payment_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      stringsArrayFromNPKIDVRemoteDeviceServiceEvents(v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138412546;
      v20 = v15;
      v21 = 2112;
      v22 = v6;
      _os_log_impl(&dword_213518000, v14, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Finish register events with currentEvents:%@ forServiceName:%@", (uint8_t *)&v19, 0x16u);

    }
LABEL_13:

  }
LABEL_15:

  return v11;
}

- (unint64_t)unregisterEvents:(unint64_t)a3 forServiceName:(id)a4
{
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  unint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  _BOOL4 v17;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  pk_Payment_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    pk_Payment_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      stringsArrayFromNPKIDVRemoteDeviceServiceEvents(a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138412546;
      v20 = v10;
      v21 = 2112;
      v22 = v6;
      _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested unregister events:%@ forServiceName:%@", (uint8_t *)&v19, 0x16u);

    }
  }
  if (!self->_serviceContext)
  {
    pk_Payment_log();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

    if (!v17)
    {
      v11 = 0xFFFFFFFF80000000;
      goto LABEL_15;
    }
    pk_Payment_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_213518000, v14, OS_LOG_TYPE_DEFAULT, "Warning: NPKIDVRemoteDeviceService: Not active device initialized, we can't unregister requested events", (uint8_t *)&v19, 2u);
    }
    v11 = 0xFFFFFFFF80000000;
    goto LABEL_13;
  }
  os_unfair_lock_lock(&self->_serviceContextLock);
  v11 = -[NPKIDVRemoteDeviceServiceContext unregisterEvents:forServiceName:](self->_serviceContext, "unregisterEvents:forServiceName:", a3, v6);
  -[NPKIDVRemoteDeviceServiceEventsCoordinator _insideLockPersistServiceContext](self, "_insideLockPersistServiceContext");
  os_unfair_lock_unlock(&self->_serviceContextLock);
  pk_Payment_log();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

  if (v13)
  {
    pk_Payment_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      stringsArrayFromNPKIDVRemoteDeviceServiceEvents(v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138412546;
      v20 = v15;
      v21 = 2112;
      v22 = v6;
      _os_log_impl(&dword_213518000, v14, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Finish unregister events with currentEvents:%@ forServiceName:%@", (uint8_t *)&v19, 0x16u);

    }
LABEL_13:

  }
LABEL_15:

  return v11;
}

- (void)_notifyProcessWithServiceNames:(id)a3 deviceEvent:(unint64_t)a4 forDeviceID:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  void *v14;
  NSObject *remoteProcessNotificationQueue;
  NSObject *v16;
  void *v17;
  _QWORD block[4];
  NSObject *v19;
  id v20;
  unint64_t v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = objc_msgSend(v8, "count");
  pk_Payment_log();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    if (v12)
    {
      pk_Payment_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        stringsArrayFromNPKIDVRemoteDeviceServiceEvents(a4);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v23 = v8;
        v24 = 2112;
        v25 = v14;
        v26 = 2112;
        v27 = v9;
        _os_log_impl(&dword_213518000, v13, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Found remote process with service Names:%@ event:%@ for deviceID:%@", buf, 0x20u);

      }
    }
    remoteProcessNotificationQueue = self->_remoteProcessNotificationQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __101__NPKIDVRemoteDeviceServiceEventsCoordinator__notifyProcessWithServiceNames_deviceEvent_forDeviceID___block_invoke;
    block[3] = &unk_24CFE83A8;
    v19 = v8;
    v21 = a4;
    v20 = v9;
    dispatch_async(remoteProcessNotificationQueue, block);

    v16 = v19;
  }
  else
  {
    if (!v12)
      goto LABEL_8;
    pk_Payment_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      stringsArrayFromNPKIDVRemoteDeviceServiceEvents(a4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v23 = v17;
      v24 = 2112;
      v25 = v9;
      _os_log_impl(&dword_213518000, v16, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: No service names to notify event:%@ for device with ID:%@", buf, 0x16u);

    }
  }

LABEL_8:
}

void __101__NPKIDVRemoteDeviceServiceEventsCoordinator__notifyProcessWithServiceNames_deviceEvent_forDeviceID___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;
  uint64_t v4;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __101__NPKIDVRemoteDeviceServiceEventsCoordinator__notifyProcessWithServiceNames_deviceEvent_forDeviceID___block_invoke_2;
  v2[3] = &unk_24CFEAFB8;
  v4 = *(_QWORD *)(a1 + 48);
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "enumerateObjectsUsingBlock:", v2);

}

void __101__NPKIDVRemoteDeviceServiceEventsCoordinator__notifyProcessWithServiceNames_deviceEvent_forDeviceID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NPKIDVRemoteDeviceServiceClient *v4;

  v3 = a2;
  v4 = -[NPKIDVRemoteDeviceServiceClient initWithRemoteServiceName:]([NPKIDVRemoteDeviceServiceClient alloc], "initWithRemoteServiceName:", v3);

  -[NPKIDVRemoteDeviceServiceClient didReceiveEvent:fromRemoteDeviceWithID:](v4, "didReceiveEvent:fromRemoteDeviceWithID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_insideLockPersistServiceContext
{
  id v3;

  os_unfair_lock_assert_owner(&self->_serviceContextLock);
  NPKSecureArchiveObject(self->_serviceContext);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "writeToFile:atomically:", self->_serviceContextPath, 1);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteProcessNotificationQueue, 0);
  objc_storeStrong((id *)&self->_serviceContextPath, 0);
  objc_storeStrong((id *)&self->_serviceContext, 0);
}

@end

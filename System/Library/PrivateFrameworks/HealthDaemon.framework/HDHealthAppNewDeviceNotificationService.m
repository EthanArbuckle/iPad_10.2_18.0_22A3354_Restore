@implementation HDHealthAppNewDeviceNotificationService

- (HDHealthAppNewDeviceNotificationService)init
{
  HDHealthAppNewDeviceNotificationService *v2;
  uint64_t v3;
  IDSService *notificationService;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HDHealthAppNewDeviceNotificationService;
  v2 = -[HDHealthAppNewDeviceNotificationService init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0D34358]), "initWithService:", CFSTR("com.apple.private.alloy.healthapp.messaging"));
    notificationService = v2->_notificationService;
    v2->_notificationService = (IDSService *)v3;

  }
  return v2;
}

- (BOOL)sendNewDeviceNotificationWithMessageKind:(int64_t)a3 error:(id *)a4
{
  NSObject **v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  IDSService *notificationService;
  int v21;
  __CFString *v22;
  __CFString *v23;
  NSObject *v24;
  _BOOL4 v25;
  NSObject *v26;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  HDHealthAppNewDeviceNotificationService *v36;
  __int16 v37;
  const __CFString *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v6 = (NSObject **)MEMORY[0x1E0CB5330];
  v7 = *MEMORY[0x1E0CB5330];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5330], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v36 = self;
    v37 = 2114;
    v38 = CFSTR("com.apple.private.alloy.healthapp.messaging");
    _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Attempting to send IDS notification with service: %{public}@", buf, 0x16u);
  }
  -[IDSService linkedDevicesWithRelationship:](self->_notificationService, "linkedDevicesWithRelationship:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v31 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        if (objc_msgSend(v15, "deviceType") == 2 || objc_msgSend(v15, "deviceType") == 4)
        {
          v16 = (void *)IDSCopyIDForDevice();
          objc_msgSend(v9, "addObject:", v16);

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v12);
  }

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6758]), "initWithMessageKind:", a3);
  v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v17, 1, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  notificationService = self->_notificationService;
  v28 = 0;
  v29 = 0;
  v21 = -[IDSService sendData:toDestinations:priority:options:identifier:error:](notificationService, "sendData:toDestinations:priority:options:identifier:error:", v19, v9, 300, v18, &v29, &v28);
  v22 = (__CFString *)v29;
  v23 = (__CFString *)v28;
  _HKInitializeLogging();
  v24 = *v6;
  v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
  if (v21)
  {
    if (v25)
    {
      *(_DWORD *)buf = 138543618;
      v36 = self;
      v37 = 2114;
      v38 = v22;
      _os_log_impl(&dword_1B7802000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@: Data successfully sent with identifier: %{public}@", buf, 0x16u);
    }
  }
  else
  {
    if (v25)
    {
      *(_DWORD *)buf = 138543362;
      v36 = self;
      _os_log_impl(&dword_1B7802000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@: Data was not sent successfully.", buf, 0xCu);
    }
    _HKInitializeLogging();
    v26 = *MEMORY[0x1E0CB5330];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5330], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v36 = self;
      v37 = 2114;
      v38 = v23;
      _os_log_error_impl(&dword_1B7802000, v26, OS_LOG_TYPE_ERROR, "%{public}@: Error occured when sending new device IDS notification: %{public}@", buf, 0x16u);
    }
  }

  return v21;
}

- (IDSService)notificationService
{
  return self->_notificationService;
}

- (void)setNotificationService:(id)a3
{
  objc_storeStrong((id *)&self->_notificationService, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationService, 0);
}

@end

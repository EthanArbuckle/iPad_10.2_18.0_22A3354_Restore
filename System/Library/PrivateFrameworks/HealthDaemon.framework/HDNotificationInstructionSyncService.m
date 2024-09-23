@implementation HDNotificationInstructionSyncService

- (HDNotificationInstructionSyncService)initWithDaemon:(id)a3
{
  id v4;
  HDIDSService *v5;
  id v6;
  uint64_t v7;
  id WeakRetained;
  void *v9;
  void *v10;
  HDNotificationInstructionSyncService *v11;

  v4 = a3;
  v5 = -[HDIDSService initWithServiceName:]([HDIDSService alloc], "initWithServiceName:", CFSTR("com.apple.private.alloy.healthappnotificationsync"));
  v6 = objc_alloc(MEMORY[0x1E0CB62B8]);
  v7 = *MEMORY[0x1E0CB5330];
  WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
  objc_msgSend(WeakRetained, "primaryProfile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v6, "initWithLoggingCategory:healthDataSource:", v7, v9);

  v11 = (HDNotificationInstructionSyncService *)-[HDNotificationInstructionSyncService initWithDaemon:syncService:analyticsEventManager:]((id *)&self->super.isa, v4, v5, v10);
  return v11;
}

- (id)initWithDaemon:(void *)a3 syncService:(void *)a4 analyticsEventManager:
{
  id v7;
  id v8;
  id v9;
  id *v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  objc_super v19;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    v19.receiver = a1;
    v19.super_class = (Class)HDNotificationInstructionSyncService;
    v10 = (id *)objc_msgSendSuper2(&v19, sel_init);
    a1 = v10;
    if (v10)
    {
      objc_storeWeak(v10 + 2, v7);
      *((_DWORD *)a1 + 10) = 0;
      objc_storeStrong(a1 + 6, a3);
      objc_msgSend(a1[6], "setDelegate:", a1);
      v11 = objc_alloc(MEMORY[0x1E0CB6988]);
      NSStringFromProtocol((Protocol *)&unk_1EF1BDF80);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "initWithName:loggingCategory:", v12, *MEMORY[0x1E0CB5330]);
      v14 = a1[1];
      a1[1] = (id)v13;

      v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v16 = a1[4];
      a1[4] = v15;

      objc_storeStrong(a1 + 3, a4);
      objc_msgSend(MEMORY[0x1E0D29830], "sharedDiagnosticManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObject:", a1);

    }
  }

  return a1;
}

- (HDNotificationInstructionSyncService)initWithDaemon:(id)a3 IDSService:(id)a4 analyticsEventManager:(id)a5
{
  id v8;
  id v9;
  id v10;
  HDIDSService *v11;
  HDNotificationInstructionSyncService *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[HDIDSService initWithService:]([HDIDSService alloc], "initWithService:", v9);

  v12 = (HDNotificationInstructionSyncService *)-[HDNotificationInstructionSyncService initWithDaemon:syncService:analyticsEventManager:]((id *)&self->super.isa, v10, v11, v8);
  return v12;
}

- (BOOL)sendNotificationInstructionMessage:(id)a3 identifier:(id *)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HDIDSService *IDSServiceInstance;
  _BOOL4 v16;
  id v17;
  void *v18;
  id v21;

  v8 = a3;
  objc_msgSend(v8, "messageDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc(MEMORY[0x1E0CB67E8]);
  +[HDIDSDestination validHealthSoftwareDeviceTypes](HDIDSDestination, "validHealthSoftwareDeviceTypes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithSet:", v11);

  +[HDIDSDestination initWithAllowedDeviceTypes:](HDIDSDestination, "initWithAllowedDeviceTypes:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDIDSMessageOptions defaultOptionsWithPriority:](HDIDSMessageOptions, "defaultOptionsWithPriority:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  IDSServiceInstance = self->_IDSServiceInstance;
  v21 = 0;
  v16 = -[HDIDSService sendMessage:destination:options:identifier:error:](IDSServiceInstance, "sendMessage:destination:options:identifier:error:", v9, v13, v14, &v21, a5);
  v17 = v21;
  v18 = v17;
  if (v16 && v17 != 0)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v17);
    os_unfair_lock_lock(&self->_lock);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_lock_pendingMessages, "setObject:forKeyedSubscript:", v8, v18);
    os_unfair_lock_unlock(&self->_lock);
  }

  return v16;
}

- (void)registerObserver:(id)a3 queue:(id)a4
{
  -[HDNotificationInstructionSyncServiceObserver registerObserver:queue:](self->_observers, "registerObserver:queue:", a3, a4);
}

- (void)unregisterObserver:(id)a3
{
  -[HDNotificationInstructionSyncServiceObserver unregisterObserver:](self->_observers, "unregisterObserver:", a3);
}

- (void)service:(id)a3 didReceiveMessage:(id)a4 fromDevice:(id)a5 messageContext:(id)a6
{
  id v9;
  id v10;
  id v11;
  HDNotificationInstructionMessage *v12;
  id WeakRetained;
  void *v14;
  void *v15;
  HDNotificationInstructionMessage *v16;
  HDNotificationInstruction *v17;
  void *v18;
  NSDate *unitTest_currentDate;
  NSDate *v20;
  NSDate *v21;
  void *v22;
  HDNotificationInstruction *v23;
  void *v24;
  HDNotificationInstructionSyncServiceObserver *observers;
  HDNotificationInstruction *v26;
  NSObject *v27;
  void *v28;
  id v29;
  void *v30;
  _QWORD v31[4];
  HDNotificationInstruction *v32;
  HDNotificationInstructionSyncService *v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a6;
  v11 = a5;
  v12 = [HDNotificationInstructionMessage alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
  objc_msgSend(WeakRetained, "pluginManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "notificationInstructionCriteriaClasses");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[HDNotificationInstructionMessage initWithMessageDictionary:criteriaClasses:](v12, "initWithMessageDictionary:criteriaClasses:", v9, v15);

  v17 = [HDNotificationInstruction alloc];
  objc_msgSend(v10, "originalGUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
  {
    unitTest_currentDate = self->_unitTest_currentDate;
    if (unitTest_currentDate)
    {
      v20 = unitTest_currentDate;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v20 = (NSDate *)objc_claimAutoreleasedReturnValue();
    }
    v21 = v20;
  }
  else
  {
    v21 = 0;
  }
  objc_msgSend(v11, "name");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = -[HDNotificationInstruction initWithMessageIdentifier:receivedDate:sendingDeviceName:message:](v17, "initWithMessageIdentifier:receivedDate:sendingDeviceName:message:", v18, v21, v22, v16);
  if (!v23)
  {
    _HKInitializeLogging();
    v24 = (void *)*MEMORY[0x1E0CB5330];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5330], OS_LOG_TYPE_ERROR))
    {
      v27 = v24;
      v28 = (void *)objc_opt_class();
      v29 = v28;
      objc_msgSend(v10, "originalGUID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v35 = v28;
      v36 = 2114;
      v37 = v9;
      v38 = 2114;
      v39 = v30;
      _os_log_error_impl(&dword_1B7802000, v27, OS_LOG_TYPE_ERROR, "[%{public}@] Unable to instantiate HDNotificationInstructionMessage from dictionary: %{public}@, originalGUID: %{public}@", buf, 0x20u);

    }
  }
  observers = self->_observers;
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __92__HDNotificationInstructionSyncService_service_didReceiveMessage_fromDevice_messageContext___block_invoke;
  v31[3] = &unk_1E6CFD4A8;
  v32 = v23;
  v33 = self;
  v26 = v23;
  -[HDNotificationInstructionSyncServiceObserver notifyObservers:](observers, "notifyObservers:", v31);

}

void __92__HDNotificationInstructionSyncService_service_didReceiveMessage_fromDevice_messageContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  void *v5;
  void *v6;

  v3 = a2;
  v6 = v3;
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(v3, "notificationInstructionSyncService:didReceiveNotificationInstruction:", *(_QWORD *)(a1 + 40));
LABEL_5:
    v5 = v6;
    goto LABEL_6;
  }
  v4 = objc_msgSend(v3, "conformsToProtocol:", &unk_1EF2524B8);
  v5 = v6;
  if (v4)
  {
    objc_msgSend(v6, "unitTesting_notificationInstructionSyncService:didReceiveNotificationInstruction:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
    goto LABEL_5;
  }
LABEL_6:

}

- (void)service:(id)a3 didSendWithSuccess:(BOOL)a4 identifier:(id)a5 error:(id)a6
{
  _BOOL8 v7;
  id v9;
  void *v10;
  HKAnalyticsEventSubmissionManager *analyticsEventSubmissionManager;
  HDNotificationInstructionSyncSendEvent *v12;
  void (**unitTest_didSendInstructionWithSuccess)(id, _BOOL8);
  id v14;

  v7 = a4;
  v14 = a6;
  v9 = a5;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_lock_pendingMessages, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](self->_lock_pendingMessages, "removeObjectForKey:", v9);

  os_unfair_lock_unlock(&self->_lock);
  if (v10)
  {
    analyticsEventSubmissionManager = self->_analyticsEventSubmissionManager;
    v12 = -[HDNotificationInstructionSyncSendEvent initWithNotificationInstructionMessage:sendError:]([HDNotificationInstructionSyncSendEvent alloc], "initWithNotificationInstructionMessage:sendError:", v10, v14);
    -[HKAnalyticsEventSubmissionManager submitEvent:error:](analyticsEventSubmissionManager, "submitEvent:error:", v12, 0);

  }
  unitTest_didSendInstructionWithSuccess = (void (**)(id, _BOOL8))self->_unitTest_didSendInstructionWithSuccess;
  if (unitTest_didSendInstructionWithSuccess)
    unitTest_didSendInstructionWithSuccess[2](unitTest_didSendInstructionWithSuccess, v7);

}

- (void)setUnitTest_sendOnEmptyDestinationSet:(BOOL)a3
{
  -[HDIDSService setUnitTest_sendOnEmptyDestinationSet:](self->_IDSServiceInstance, "setUnitTest_sendOnEmptyDestinationSet:", a3);
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@] IDS: %@"), objc_opt_class(), self->_IDSServiceInstance);
}

- (id)diagnosticDescription
{
  os_unfair_lock_s *p_lock;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSMutableDictionary copy](self->_lock_pendingMessages, "copy");
  os_unfair_lock_unlock(p_lock);
  v5 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v5, "appendFormat:", CFSTR("ID: %@\n"), v11);
        objc_msgSend(v6, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendFormat:", CFSTR("MSG: %@\n\n"), v12);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  v13 = (void *)objc_msgSend(v5, "copy");
  return v13;
}

- (HDIDSService)IDSService
{
  return self->_IDSServiceInstance;
}

- (BOOL)unitTest_sendOnEmptyDestinationSet
{
  return self->_unitTest_sendOnEmptyDestinationSet;
}

- (NSDate)unitTest_currentDate
{
  return self->_unitTest_currentDate;
}

- (void)setUnitTest_currentDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)unitTest_didSendInstructionWithSuccess
{
  return self->_unitTest_didSendInstructionWithSuccess;
}

- (void)setUnitTest_didSendInstructionWithSuccess:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTest_didSendInstructionWithSuccess, 0);
  objc_storeStrong((id *)&self->_unitTest_currentDate, 0);
  objc_storeStrong((id *)&self->_IDSServiceInstance, 0);
  objc_storeStrong((id *)&self->_lock_pendingMessages, 0);
  objc_storeStrong((id *)&self->_analyticsEventSubmissionManager, 0);
  objc_destroyWeak((id *)&self->_daemon);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end

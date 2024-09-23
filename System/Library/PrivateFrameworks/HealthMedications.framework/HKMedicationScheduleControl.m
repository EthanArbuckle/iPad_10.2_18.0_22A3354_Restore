@implementation HKMedicationScheduleControl

+ (id)clientInterface
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF1845F8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_client_notifyForDidPruneSchduleItems_, 0, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_client_notifyForAddOrModifySchedules_, 0, 0);

  return v2;
}

+ (id)serverInterface
{
  void *v2;
  id v3;
  id v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF1931D8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_saveScheduleItems_completion_, 0, 0);
  v4 = (id)objc_msgSend(v2, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_fetchAllSchedulesWithCompletion_, 0, 1);
  v5 = (id)objc_msgSend(v2, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_fetchSchedulesWithMedicationIdentifiers_completion_, 0, 1);
  return v2;
}

- (id)remoteInterface
{
  return (id)objc_msgSend((id)objc_opt_class(), "serverInterface");
}

- (HKMedicationScheduleControl)initWithHealthStore:(id)a3
{
  id v4;
  HKMedicationScheduleControl *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  HKTaskServerProxyProvider *proxyProvider;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  HKMedicationScheduleControlObserver *observers;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  id location;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)HKMedicationScheduleControl;
  v5 = -[HKMedicationScheduleControl init](&v24, sel_init);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0CB6CC0]);
    objc_msgSend((id)objc_opt_class(), "taskIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", v4, v7, v5, v8);
    proxyProvider = v5->_proxyProvider;
    v5->_proxyProvider = (HKTaskServerProxyProvider *)v9;

    objc_initWeak(&location, v5);
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __51__HKMedicationScheduleControl_initWithHealthStore___block_invoke;
    v21 = &unk_1E6CD5130;
    objc_copyWeak(&v22, &location);
    -[HKTaskServerProxyProvider setAutomaticProxyReconnectionHandler:](v5->_proxyProvider, "setAutomaticProxyReconnectionHandler:", &v18);
    -[HKTaskServerProxyProvider setShouldRetryOnInterruption:](v5->_proxyProvider, "setShouldRetryOnInterruption:", 1, v18, v19, v20, v21);
    v11 = objc_alloc_init(MEMORY[0x1E0CB6CB8]);
    -[HKTaskServerProxyProvider setTaskConfiguration:](v5->_proxyProvider, "setTaskConfiguration:", v11);

    v12 = objc_alloc(MEMORY[0x1E0CB6988]);
    NSStringFromProtocol((Protocol *)&unk_1EF193178);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    HKLogMedication();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v12, "initWithName:loggingCategory:", v13, v14);
    observers = v5->_observers;
    v5->_observers = (HKMedicationScheduleControlObserver *)v15;

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return v5;
}

- (id)exportedInterface
{
  return (id)objc_msgSend((id)objc_opt_class(), "clientInterface");
}

+ (id)taskIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

void __51__HKMedicationScheduleControl_initWithHealthStore___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleAutomaticProxyReconnection");

}

- (void)saveSchedule:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v6 = a3;
  -[HKTaskServerProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __55__HKMedicationScheduleControl_saveSchedule_completion___block_invoke;
  v15[3] = &unk_1E6CD5158;
  v16 = v6;
  v17 = v7;
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __55__HKMedicationScheduleControl_saveSchedule_completion___block_invoke_2;
  v12[3] = &unk_1E6CD5180;
  v12[4] = self;
  v13 = v16;
  v14 = v17;
  v10 = v17;
  v11 = v16;
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v15, v12);

}

uint64_t __55__HKMedicationScheduleControl_saveSchedule_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_saveSchedule:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __55__HKMedicationScheduleControl_saveSchedule_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _HKInitializeLogging();
  HKLogMedication();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __55__HKMedicationScheduleControl_saveSchedule_completion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)updateSchedulesToLocalTimeZoneAndMaintainCalendarDatesAndTimes:(BOOL)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  HKTaskServerProxyProvider *proxyProvider;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[4];
  id v13;
  BOOL v14;

  -[HKTaskServerProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __105__HKMedicationScheduleControl_updateSchedulesToLocalTimeZoneAndMaintainCalendarDatesAndTimes_completion___block_invoke;
  v12[3] = &unk_1E6CD51A8;
  v14 = a3;
  v13 = v6;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __105__HKMedicationScheduleControl_updateSchedulesToLocalTimeZoneAndMaintainCalendarDatesAndTimes_completion___block_invoke_2;
  v10[3] = &unk_1E6CD51D0;
  v10[4] = self;
  v11 = v13;
  v9 = v13;
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v12, v10);

}

uint64_t __105__HKMedicationScheduleControl_updateSchedulesToLocalTimeZoneAndMaintainCalendarDatesAndTimes_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_updateSchedulesToLocalTimeZoneAndMaintainCalendarDatesAndTimes:completion:", *(unsigned __int8 *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __105__HKMedicationScheduleControl_updateSchedulesToLocalTimeZoneAndMaintainCalendarDatesAndTimes_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _HKInitializeLogging();
  HKLogMedication();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __105__HKMedicationScheduleControl_updateSchedulesToLocalTimeZoneAndMaintainCalendarDatesAndTimes_completion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)setTimeZoneTipAsDismissedWithCompletion:(id)a3
{
  void *v4;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[4];
  id v11;

  -[HKTaskServerProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71__HKMedicationScheduleControl_setTimeZoneTipAsDismissedWithCompletion___block_invoke;
  v10[3] = &unk_1E6CD51F8;
  v11 = v4;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __71__HKMedicationScheduleControl_setTimeZoneTipAsDismissedWithCompletion___block_invoke_2;
  v8[3] = &unk_1E6CD51D0;
  v8[4] = self;
  v9 = v11;
  v7 = v11;
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v10, v8);

}

uint64_t __71__HKMedicationScheduleControl_setTimeZoneTipAsDismissedWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_setTimeZoneTipAsDismissedWithCompletion:", *(_QWORD *)(a1 + 32));
}

void __71__HKMedicationScheduleControl_setTimeZoneTipAsDismissedWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _HKInitializeLogging();
  HKLogMedication();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __71__HKMedicationScheduleControl_setTimeZoneTipAsDismissedWithCompletion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)fetchScheduleWithMedicationIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v6 = a3;
  -[HKTaskServerProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __80__HKMedicationScheduleControl_fetchScheduleWithMedicationIdentifier_completion___block_invoke;
  v15[3] = &unk_1E6CD5158;
  v16 = v6;
  v17 = v7;
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __80__HKMedicationScheduleControl_fetchScheduleWithMedicationIdentifier_completion___block_invoke_2;
  v12[3] = &unk_1E6CD5180;
  v12[4] = self;
  v13 = v16;
  v14 = v17;
  v10 = v17;
  v11 = v16;
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v15, v12);

}

uint64_t __80__HKMedicationScheduleControl_fetchScheduleWithMedicationIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchScheduleWithMedicationIdentifier:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __80__HKMedicationScheduleControl_fetchScheduleWithMedicationIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _HKInitializeLogging();
  HKLogMedication();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __80__HKMedicationScheduleControl_fetchScheduleWithMedicationIdentifier_completion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)fetchSchedulesWithMedicationIdentifiers:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v6 = a3;
  -[HKTaskServerProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __82__HKMedicationScheduleControl_fetchSchedulesWithMedicationIdentifiers_completion___block_invoke;
  v15[3] = &unk_1E6CD5158;
  v16 = v6;
  v17 = v7;
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __82__HKMedicationScheduleControl_fetchSchedulesWithMedicationIdentifiers_completion___block_invoke_2;
  v12[3] = &unk_1E6CD5180;
  v12[4] = self;
  v13 = v16;
  v14 = v17;
  v10 = v17;
  v11 = v16;
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v15, v12);

}

uint64_t __82__HKMedicationScheduleControl_fetchSchedulesWithMedicationIdentifiers_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchSchedulesWithMedicationIdentifiers:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __82__HKMedicationScheduleControl_fetchSchedulesWithMedicationIdentifiers_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _HKInitializeLogging();
  HKLogMedication();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __82__HKMedicationScheduleControl_fetchSchedulesWithMedicationIdentifiers_completion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)fetchAllSchedulesWithCompletion:(id)a3
{
  void *v4;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[4];
  id v11;

  -[HKTaskServerProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63__HKMedicationScheduleControl_fetchAllSchedulesWithCompletion___block_invoke;
  v10[3] = &unk_1E6CD51F8;
  v11 = v4;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __63__HKMedicationScheduleControl_fetchAllSchedulesWithCompletion___block_invoke_2;
  v8[3] = &unk_1E6CD51D0;
  v8[4] = self;
  v9 = v11;
  v7 = v11;
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v10, v8);

}

uint64_t __63__HKMedicationScheduleControl_fetchAllSchedulesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchAllSchedulesWithCompletion:", *(_QWORD *)(a1 + 32));
}

void __63__HKMedicationScheduleControl_fetchAllSchedulesWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _HKInitializeLogging();
  HKLogMedication();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __63__HKMedicationScheduleControl_fetchAllSchedulesWithCompletion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)deleteSchedule:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v6 = a3;
  -[HKTaskServerProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __57__HKMedicationScheduleControl_deleteSchedule_completion___block_invoke;
  v15[3] = &unk_1E6CD5158;
  v16 = v6;
  v17 = v7;
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __57__HKMedicationScheduleControl_deleteSchedule_completion___block_invoke_2;
  v12[3] = &unk_1E6CD5180;
  v12[4] = self;
  v13 = v16;
  v14 = v17;
  v10 = v17;
  v11 = v16;
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v15, v12);

}

uint64_t __57__HKMedicationScheduleControl_deleteSchedule_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_deleteSchedule:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __57__HKMedicationScheduleControl_deleteSchedule_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _HKInitializeLogging();
  HKLogMedication();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __57__HKMedicationScheduleControl_deleteSchedule_completion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)saveScheduleItems:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v6 = a3;
  -[HKTaskServerProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __60__HKMedicationScheduleControl_saveScheduleItems_completion___block_invoke;
  v15[3] = &unk_1E6CD5158;
  v16 = v6;
  v17 = v7;
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __60__HKMedicationScheduleControl_saveScheduleItems_completion___block_invoke_2;
  v12[3] = &unk_1E6CD5180;
  v12[4] = self;
  v13 = v16;
  v14 = v17;
  v10 = v17;
  v11 = v16;
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v15, v12);

}

uint64_t __60__HKMedicationScheduleControl_saveScheduleItems_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_saveScheduleItems:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __60__HKMedicationScheduleControl_saveScheduleItems_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _HKInitializeLogging();
  HKLogMedication();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __60__HKMedicationScheduleControl_saveScheduleItems_completion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)updateNotificationSent:(BOOL)a3 scheduleItemIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  HKTaskServerProxyProvider *proxyProvider;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  BOOL v20;

  v8 = a4;
  -[HKTaskServerProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __88__HKMedicationScheduleControl_updateNotificationSent_scheduleItemIdentifier_completion___block_invoke;
  v17[3] = &unk_1E6CD5220;
  v20 = a3;
  v18 = v8;
  v19 = v9;
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __88__HKMedicationScheduleControl_updateNotificationSent_scheduleItemIdentifier_completion___block_invoke_2;
  v14[3] = &unk_1E6CD5180;
  v14[4] = self;
  v15 = v18;
  v16 = v19;
  v12 = v19;
  v13 = v18;
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v17, v14);

}

uint64_t __88__HKMedicationScheduleControl_updateNotificationSent_scheduleItemIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_updateNotificationSent:scheduleItemIdentifier:completion:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __88__HKMedicationScheduleControl_updateNotificationSent_scheduleItemIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _HKInitializeLogging();
  HKLogMedication();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __88__HKMedicationScheduleControl_updateNotificationSent_scheduleItemIdentifier_completion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)rescheduleMedicationsWithCompletion:(id)a3
{
  void *v4;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[4];
  id v11;

  -[HKTaskServerProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67__HKMedicationScheduleControl_rescheduleMedicationsWithCompletion___block_invoke;
  v10[3] = &unk_1E6CD51F8;
  v11 = v4;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __67__HKMedicationScheduleControl_rescheduleMedicationsWithCompletion___block_invoke_2;
  v8[3] = &unk_1E6CD51D0;
  v8[4] = self;
  v9 = v11;
  v7 = v11;
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v10, v8);

}

uint64_t __67__HKMedicationScheduleControl_rescheduleMedicationsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_rescheduleMedicationsWithCompletion:", *(_QWORD *)(a1 + 32));
}

void __67__HKMedicationScheduleControl_rescheduleMedicationsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _HKInitializeLogging();
  HKLogMedication();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __67__HKMedicationScheduleControl_rescheduleMedicationsWithCompletion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)logUnloggedDoseEventsForScheduledItemIdentifier:(id)a3 status:(int64_t)a4 logDate:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  void *v12;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  int64_t v24;

  v10 = a3;
  v11 = a5;
  -[HKTaskServerProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v14 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __105__HKMedicationScheduleControl_logUnloggedDoseEventsForScheduledItemIdentifier_status_logDate_completion___block_invoke;
  v20[3] = &unk_1E6CD5248;
  v24 = a4;
  v21 = v10;
  v22 = v11;
  v23 = v12;
  v18[0] = v14;
  v18[1] = 3221225472;
  v18[2] = __105__HKMedicationScheduleControl_logUnloggedDoseEventsForScheduledItemIdentifier_status_logDate_completion___block_invoke_2;
  v18[3] = &unk_1E6CD51D0;
  v18[4] = self;
  v19 = v23;
  v15 = v23;
  v16 = v11;
  v17 = v10;
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v20, v18);

}

uint64_t __105__HKMedicationScheduleControl_logUnloggedDoseEventsForScheduledItemIdentifier_status_logDate_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_logUnloggedMedicationsWithScheduledItemIdentifier:status:logDate:completion:", a1[4], a1[7], a1[5], a1[6]);
}

void __105__HKMedicationScheduleControl_logUnloggedDoseEventsForScheduledItemIdentifier_status_logDate_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _HKInitializeLogging();
  HKLogMedication();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __105__HKMedicationScheduleControl_logUnloggedDoseEventsForScheduledItemIdentifier_status_logDate_completion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)registerObserver:(id)a3 queue:(id)a4
{
  HKMedicationScheduleControlObserver *observers;
  _QWORD v5[5];

  observers = self->_observers;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__HKMedicationScheduleControl_registerObserver_queue___block_invoke;
  v5[3] = &unk_1E6CD5038;
  v5[4] = self;
  -[HKMedicationScheduleControlObserver registerObserver:queue:runIfFirstObserver:](observers, "registerObserver:queue:runIfFirstObserver:", a3, a4, v5);
}

uint64_t __54__HKMedicationScheduleControl_registerObserver_queue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_registerFirstObserver");
}

- (void)unregisterObserver:(id)a3
{
  HKMedicationScheduleControlObserver *observers;
  _QWORD v4[5];

  observers = self->_observers;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__HKMedicationScheduleControl_unregisterObserver___block_invoke;
  v4[3] = &unk_1E6CD5038;
  v4[4] = self;
  -[HKMedicationScheduleControlObserver unregisterObserver:runIfLastObserver:](observers, "unregisterObserver:runIfLastObserver:", a3, v4);
}

uint64_t __50__HKMedicationScheduleControl_unregisterObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_unregisterLastObserver");
}

- (void)_handleAutomaticProxyReconnection
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0(&dword_1B77D4000, a2, a3, "[%{public}@] Failed to resume observation on server reconnection: %{public}@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_5();
}

- (void)_notifyObserversAboutReconnect
{
  -[HKMedicationScheduleControlObserver notifyObservers:](self->_observers, "notifyObservers:", &__block_literal_global_1);
}

uint64_t __61__HKMedicationScheduleControl__notifyObserversAboutReconnect__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "scheduleControlDidRescheduleItems");
}

- (void)_registerFirstObserver
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __53__HKMedicationScheduleControl__registerFirstObserver__block_invoke;
  v2[3] = &unk_1E6CD52B0;
  v2[4] = self;
  -[HKMedicationScheduleControl _observeMedicationScheduleChanges:completion:](self, "_observeMedicationScheduleChanges:completion:", 1, v2);
}

void __53__HKMedicationScheduleControl__registerFirstObserver__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    HKLogMedication();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __53__HKMedicationScheduleControl__registerFirstObserver__block_invoke_cold_1();

  }
  objc_msgSend(*(id *)(a1 + 32), "_callUnitTestHookObserving:success:error:", 1, a2, v5);

}

- (void)_unregisterLastObserver
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __54__HKMedicationScheduleControl__unregisterLastObserver__block_invoke;
  v2[3] = &unk_1E6CD52B0;
  v2[4] = self;
  -[HKMedicationScheduleControl _observeMedicationScheduleChanges:completion:](self, "_observeMedicationScheduleChanges:completion:", 0, v2);
}

void __54__HKMedicationScheduleControl__unregisterLastObserver__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    HKLogMedication();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);

    if (v7)
    {
      HKLogMedication();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = *(_QWORD *)(a1 + 32);
        v10 = 138543618;
        v11 = v9;
        v12 = 2114;
        v13 = v5;
        _os_log_impl(&dword_1B77D4000, v8, OS_LOG_TYPE_INFO, "%{public}@: Error unregistering observer: %{public}@", (uint8_t *)&v10, 0x16u);
      }

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_callUnitTestHookObserving:success:error:", 0, a2, v5);

}

- (void)_observeMedicationScheduleChanges:(BOOL)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  HKTaskServerProxyProvider *proxyProvider;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  BOOL v14;

  -[HKTaskServerProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __76__HKMedicationScheduleControl__observeMedicationScheduleChanges_completion___block_invoke;
  v12[3] = &unk_1E6CD51A8;
  v14 = a3;
  v13 = v6;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __76__HKMedicationScheduleControl__observeMedicationScheduleChanges_completion___block_invoke_2;
  v10[3] = &unk_1E6CD52D8;
  v11 = v13;
  v9 = v13;
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v12, v10);

}

uint64_t __76__HKMedicationScheduleControl__observeMedicationScheduleChanges_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_observeMedicationScheduleChanges:completion:", *(unsigned __int8 *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __76__HKMedicationScheduleControl__observeMedicationScheduleChanges_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)_synchronouslyRegisterToObserveMedicationScheduleChangesWithError:(id *)a3
{
  HKTaskServerProxyProvider *proxyProvider;
  id v5;
  void *v6;
  char v7;
  _QWORD v9[5];
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__0;
  v15 = __Block_byref_object_dispose__0;
  v16 = 0;
  proxyProvider = self->_proxyProvider;
  v9[4] = &v11;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __97__HKMedicationScheduleControl__synchronouslyRegisterToObserveMedicationScheduleChangesWithError___block_invoke;
  v10[3] = &unk_1E6CD5328;
  v10[4] = &v17;
  v10[5] = &v11;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __97__HKMedicationScheduleControl__synchronouslyRegisterToObserveMedicationScheduleChangesWithError___block_invoke_3;
  v9[3] = &unk_1E6CD5350;
  -[HKTaskServerProxyProvider getSynchronousProxyWithHandler:errorHandler:](proxyProvider, "getSynchronousProxyWithHandler:errorHandler:", v10, v9);
  v5 = (id)v12[5];
  v6 = v5;
  if (v5)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v5);
    else
      _HKLogDroppedError();
  }

  v7 = *((_BYTE *)v18 + 24);
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v7;
}

uint64_t __97__HKMedicationScheduleControl__synchronouslyRegisterToObserveMedicationScheduleChangesWithError___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  __int128 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __97__HKMedicationScheduleControl__synchronouslyRegisterToObserveMedicationScheduleChangesWithError___block_invoke_2;
  v3[3] = &unk_1E6CD5300;
  v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_observeMedicationScheduleChanges:completion:", 1, v3);
}

void __97__HKMedicationScheduleControl__synchronouslyRegisterToObserveMedicationScheduleChangesWithError___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __97__HKMedicationScheduleControl__synchronouslyRegisterToObserveMedicationScheduleChangesWithError___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)_callUnitTestHookObserving:(BOOL)a3 success:(BOOL)a4 error:(id)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  uint64_t v8;
  void *v9;
  id v10;

  v5 = a4;
  v6 = a3;
  v10 = a5;
  v8 = MEMORY[0x1BCCAA908](self->_unitTesting_didChangeObserverRegistration);
  v9 = (void *)v8;
  if (v8)
    (*(void (**)(uint64_t, _BOOL8, _BOOL8, id))(v8 + 16))(v8, v6, v5, v10);

}

- (void)client_notifyForDidRescheduleMedications
{
  -[HKMedicationScheduleControlObserver notifyObservers:](self->_observers, "notifyObservers:", &__block_literal_global_240);
}

uint64_t __71__HKMedicationScheduleControl_client_notifyForDidRescheduleMedications__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "scheduleControlDidRescheduleItems");
}

- (void)client_notifyForDidPruneSchduleItems:(id)a3
{
  id v4;
  HKMedicationScheduleControlObserver *observers;
  id v6;
  _QWORD v7[5];
  id v8;
  char *v9;

  v4 = a3;
  observers = self->_observers;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__HKMedicationScheduleControl_client_notifyForDidPruneSchduleItems___block_invoke;
  v7[3] = &unk_1E6CD53B8;
  v8 = v4;
  v9 = sel_scheduleControl_didDeleteScheduleItems_;
  v7[4] = self;
  v6 = v4;
  -[HKMedicationScheduleControlObserver notifyObservers:](observers, "notifyObservers:", v7);

}

void __68__HKMedicationScheduleControl_client_notifyForDidPruneSchduleItems___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "scheduleControl:didDeleteScheduleItems:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)client_notifyForAddOrModifySchedules:(id)a3
{
  id v4;
  HKMedicationScheduleControlObserver *observers;
  id v6;
  _QWORD v7[5];
  id v8;
  char *v9;

  v4 = a3;
  observers = self->_observers;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__HKMedicationScheduleControl_client_notifyForAddOrModifySchedules___block_invoke;
  v7[3] = &unk_1E6CD53E0;
  v8 = v4;
  v9 = sel_scheduleControl_didAddOrModifySchedules_;
  v7[4] = self;
  v6 = v4;
  -[HKMedicationScheduleControlObserver notifyObservers:](observers, "notifyObservers:", v7);

}

void __68__HKMedicationScheduleControl_client_notifyForAddOrModifySchedules___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "scheduleControl:didAddOrModifySchedules:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)unitTest_noOpWithCompletion:(id)a3
{
  id v4;
  void *v5;
  HKTaskServerProxyProvider *proxyProvider;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  -[HKTaskServerProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v10 = v5;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __59__HKMedicationScheduleControl_unitTest_noOpWithCompletion___block_invoke;
  v11[3] = &unk_1E6CD51F8;
  v12 = v4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __59__HKMedicationScheduleControl_unitTest_noOpWithCompletion___block_invoke_2;
  v9[3] = &unk_1E6CD52D8;
  v7 = v5;
  v8 = v4;
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v11, v9);

}

uint64_t __59__HKMedicationScheduleControl_unitTest_noOpWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_unitTesting_createTaskServerNoOpWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __59__HKMedicationScheduleControl_unitTest_noOpWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)unitTesting_didChangeObserverRegistration
{
  return self->_unitTesting_didChangeObserverRegistration;
}

- (void)setUnitTesting_didChangeObserverRegistration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTesting_didChangeObserverRegistration, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_proxyProvider, 0);
}

void __55__HKMedicationScheduleControl_saveSchedule_completion___block_invoke_2_cold_1()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_8();
  objc_msgSend(*(id *)(v0 + 40), "medicationIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  HKSensitiveLogItem();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1B77D4000, v3, v4, "[%{public}@] Error when inserting schedule for medication with identifier %{public}@: %{public}@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_6();
}

void __105__HKMedicationScheduleControl_updateSchedulesToLocalTimeZoneAndMaintainCalendarDatesAndTimes_completion___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1B77D4000, v0, v1, "[%{public}@] Error when updating schedules to local time zone: %{public}@");
  OUTLINED_FUNCTION_5();
}

void __71__HKMedicationScheduleControl_setTimeZoneTipAsDismissedWithCompletion___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1B77D4000, v0, v1, "[%{public}@] Error when dismissing timezone tile %{public}@");
  OUTLINED_FUNCTION_5();
}

void __80__HKMedicationScheduleControl_fetchScheduleWithMedicationIdentifier_completion___block_invoke_2_cold_1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9(v0);
  HKSensitiveLogItem();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1B77D4000, v2, v3, "[%{public}@] Error when querying schedule for medication with identifier %{public}@: %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_4();
}

void __82__HKMedicationScheduleControl_fetchSchedulesWithMedicationIdentifiers_completion___block_invoke_2_cold_1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9(v0);
  HKSensitiveLogItem();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1B77D4000, v2, v3, "[%{public}@] Error when querying schedules for medications with identifiers %{public}@: %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_4();
}

void __63__HKMedicationScheduleControl_fetchAllSchedulesWithCompletion___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1B77D4000, v0, v1, "[%{public}@] Error when querying all schedules: %{public}@");
  OUTLINED_FUNCTION_5();
}

void __57__HKMedicationScheduleControl_deleteSchedule_completion___block_invoke_2_cold_1()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_8();
  objc_msgSend(*(id *)(v0 + 40), "medicationIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  HKSensitiveLogItem();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1B77D4000, v3, v4, "[%{public}@] Error when deleting schedule with medication identifier: %{public}@ error: %{public}@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_6();
}

void __60__HKMedicationScheduleControl_saveScheduleItems_completion___block_invoke_2_cold_1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9(v0);
  HKSensitiveLogItem();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1B77D4000, v2, v3, "[%{public}@] Error when inserting scheduleItems %{public}@ error %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_4();
}

void __88__HKMedicationScheduleControl_updateNotificationSent_scheduleItemIdentifier_completion___block_invoke_2_cold_1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9(v0);
  HKSensitiveLogItem();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1B77D4000, v2, v3, "[%{public}@] Error when updating scheduleItem with identifier %{public}@: %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_4();
}

void __67__HKMedicationScheduleControl_rescheduleMedicationsWithCompletion___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1B77D4000, v0, v1, "[%{public}@] Error when rescheduling medications: %{public}@");
  OUTLINED_FUNCTION_5();
}

void __105__HKMedicationScheduleControl_logUnloggedDoseEventsForScheduledItemIdentifier_status_logDate_completion___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1B77D4000, v0, v1, "[%{public}@] Error when logging scheduled unlogged medications: %{public}@");
  OUTLINED_FUNCTION_5();
}

void __53__HKMedicationScheduleControl__registerFirstObserver__block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1B77D4000, v0, v1, "%{public}@: Error registering observer: %{public}@");
  OUTLINED_FUNCTION_5();
}

@end

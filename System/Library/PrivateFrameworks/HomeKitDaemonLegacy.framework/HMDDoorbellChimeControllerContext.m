@implementation HMDDoorbellChimeControllerContext

- (HMDDoorbellChimeControllerContext)initWithWorkQueue:(id)a3 accessory:(id)a4
{
  id v7;
  id v8;
  void *v9;
  HMDDoorbellChimeControllerContext *v10;
  HMDDoorbellChimeControllerContext *v11;
  HMDDoorbellBulletinUtilities *v12;
  HMDDoorbellBulletinUtilities *doorbellBulletinUtilities;
  void *v14;
  void *v15;
  HMDCharacteristicsAvailabilityListener *v16;
  HMDCharacteristicsAvailabilityListener *listener;
  void *v18;
  objc_super v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    _HMFPreconditionFailure();
LABEL_7:
    _HMFPreconditionFailure();
  }
  if (!v7)
    goto LABEL_7;
  v9 = v8;
  v20.receiver = self;
  v20.super_class = (Class)HMDDoorbellChimeControllerContext;
  v10 = -[HMDDoorbellChimeControllerContext init](&v20, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_accessory, v9);
    objc_storeStrong((id *)&v11->_workQueue, a3);
    v12 = objc_alloc_init(HMDDoorbellBulletinUtilities);
    doorbellBulletinUtilities = v11->_doorbellBulletinUtilities;
    v11->_doorbellBulletinUtilities = v12;

    v21 = *MEMORY[0x1E0CB9A08];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CB8908]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = -[HMDCharacteristicsAvailabilityListener initWithAccessory:workQueue:interestedCharacteristicTypesByServiceType:]([HMDCharacteristicsAvailabilityListener alloc], "initWithAccessory:workQueue:interestedCharacteristicTypesByServiceType:", v9, v7, v15);
    listener = v11->_listener;
    v11->_listener = v16;

    objc_msgSend(v9, "home");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v11->_stateManagerProvider, v18);

  }
  return v11;
}

- (HMDCOStateManager)stateManager
{
  void *v2;
  void *v3;

  -[HMDDoorbellChimeControllerContext stateManagerProvider](self, "stateManagerProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "coordinationStateManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMDCOStateManager *)v3;
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
}

- (id)postCULiveAction:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D519C0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __54__HMDDoorbellChimeControllerContext_postCULiveAction___block_invoke;
  v13[3] = &unk_1E89BE768;
  v14 = v4;
  v6 = v4;
  objc_msgSend(v5, "futureWithErrorOnlyHandlerAdapterBlock:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0D519E8];
  -[HMDDoorbellChimeControllerContext workQueue](self, "workQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "schedulerWithDispatchQueue:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reschedule:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)isCurrentDevicePrimaryResident
{
  void *v2;
  void *v3;
  char v4;

  -[HMDDoorbellChimeControllerContext accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCurrentDeviceConfirmedPrimaryResident");

  return v4;
}

- (double)doorbellChimeMaximumAnnounceDelay
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferenceForKey:", CFSTR("doorbellChimeMaximumAnnounceDelay"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6;
}

- (BOOL)isCoordinationPathEnabled
{
  return 0;
}

- (BOOL)isCoordinationFreePathEnabled
{
  return 0;
}

- (id)postCoordinationState:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult", a3);
}

- (id)keyPathFromComponents:(id)a3
{
  return 0;
}

- (id)clearCoordinationStateForKeyPaths:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult", a3);
}

- (id)fetchDoorbellDelay
{
  return (id)objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", &unk_1E8B335D0);
}

- (NSUUID)currentAccessoryUUID
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HMDDoorbellChimeControllerContext accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_firstObjectPassingTest:", &__block_literal_global_166_95489);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v6;
}

- (BOOL)accessorySupportsCoordinationDoorbellChime:(id)a3
{
  return objc_msgSend(a3, "supportsCoordinationDoorbellChime");
}

- (BOOL)accessorySupportsCoordinationFreeDoorbellChime:(id)a3
{
  return objc_msgSend(a3, "supportsCoordinationFreeDoorbellChime");
}

- (HMDHAPAccessory)accessory
{
  return (HMDHAPAccessory *)objc_loadWeakRetained((id *)&self->_accessory);
}

- (void)setAccessory:(id)a3
{
  objc_storeWeak((id *)&self->_accessory, a3);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (HMDCharacteristicsAvailabilityListener)listener
{
  return (HMDCharacteristicsAvailabilityListener *)objc_getProperty(self, a2, 24, 1);
}

- (HMDDoorbellBulletinUtilities)doorbellBulletinUtilities
{
  return (HMDDoorbellBulletinUtilities *)objc_getProperty(self, a2, 32, 1);
}

- (HMDCoordinationStateManagerProviding)stateManagerProvider
{
  return (HMDCoordinationStateManagerProviding *)objc_loadWeakRetained((id *)&self->_stateManagerProvider);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_stateManagerProvider);
  objc_storeStrong((id *)&self->_doorbellBulletinUtilities, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_accessory);
}

uint64_t __57__HMDDoorbellChimeControllerContext_currentAccessoryUUID__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isCurrentAccessory");
}

uint64_t __54__HMDDoorbellChimeControllerContext_postCULiveAction___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "activateWithCompletion:", a2);
}

@end

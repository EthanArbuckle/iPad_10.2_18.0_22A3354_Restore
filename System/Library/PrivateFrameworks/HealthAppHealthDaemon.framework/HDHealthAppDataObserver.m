@implementation HDHealthAppDataObserver

- (HDHealthAppDataObserver)initWithProfile:(id)a3
{
  return -[HDHealthAppDataObserver initWithProfile:debounceTime:](self, "initWithProfile:debounceTime:", a3, 5.0);
}

- (HDHealthAppDataObserver)initWithProfile:(id)a3 debounceTime:(double)a4
{
  id v6;
  HDHealthAppDataObserver *v7;
  HDHealthAppDataObserver *v8;
  id v9;
  uint64_t v10;
  HDDataManager *dataManager;
  HDHAHealthPluginHostFeedGenerator *v12;
  HDHAHealthPluginHostFeedGenerator *feedGenerator;
  uint64_t v14;
  OS_dispatch_queue *debounceQueue;
  id v16;
  void *v17;
  uint64_t v18;
  _HKDelayedOperation *delayedOperation;
  _QWORD v21[4];
  id v22;
  id location;
  objc_super v24;

  v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)HDHealthAppDataObserver;
  v7 = -[HDHealthAppDataObserver init](&v24, sel_init);
  v8 = v7;
  if (v7)
  {
    v9 = objc_storeWeak((id *)&v7->_profile, v6);
    objc_msgSend(v6, "dataManager");
    v10 = objc_claimAutoreleasedReturnValue();
    dataManager = v8->_dataManager;
    v8->_dataManager = (HDDataManager *)v10;

    v12 = objc_alloc_init(HDHAHealthPluginHostFeedGenerator);
    feedGenerator = v8->_feedGenerator;
    v8->_feedGenerator = v12;

    HKCreateSerialDispatchQueue();
    v14 = objc_claimAutoreleasedReturnValue();
    debounceQueue = v8->_debounceQueue;
    v8->_debounceQueue = (OS_dispatch_queue *)v14;

    objc_initWeak(&location, v8);
    v16 = objc_alloc(MEMORY[0x24BDD41D0]);
    -[HDHealthAppDataObserver debounceQueue](v8, "debounceQueue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __56__HDHealthAppDataObserver_initWithProfile_debounceTime___block_invoke;
    v21[3] = &unk_250E7E100;
    objc_copyWeak(&v22, &location);
    v18 = objc_msgSend(v16, "initWithMode:queue:delay:block:", 1, v17, v21, a4);
    delayedOperation = v8->_delayedOperation;
    v8->_delayedOperation = (_HKDelayedOperation *)v18;

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return v8;
}

void __56__HDHealthAppDataObserver_initWithProfile_debounceTime___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "runBackgroundGeneration");

}

- (void)dealloc
{
  objc_super v3;

  -[_HKDelayedOperation invalidate](self->_delayedOperation, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)HDHealthAppDataObserver;
  -[HDHealthAppDataObserver dealloc](&v3, sel_dealloc);
}

- (void)start
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "cloudSyncManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:queue:", self, self->_debounceQueue);

  -[HDHealthAppDataObserver observeForAlertSampleTypes](self, "observeForAlertSampleTypes");
}

- (void)observeForAlertSampleTypes
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[HDHealthAppDataObserver alertSampleTypes](self, "alertSampleTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _HKInitializeLogging();
  v4 = *MEMORY[0x24BDD3070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v3;
    _os_log_impl(&dword_23DB70000, v4, OS_LOG_TYPE_DEFAULT, "Observing samples %@", buf, 0xCu);
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[HDHealthAppDataObserver alertSampleTypes](self, "alertSampleTypes", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
        -[HDHealthAppDataObserver dataManager](self, "dataManager");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addSynchronousObserver:forSampleType:", self, v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (id)alertSampleTypes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  _QWORD v14[11];

  v14[10] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD3DC0], "atrialFibrillationEventType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v13;
  objc_msgSend(MEMORY[0x24BDD3DC0], "environmentalAudioExposureEventType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v2;
  objc_msgSend(MEMORY[0x24BDD3DC0], "headphoneAudioExposureEventType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v3;
  objc_msgSend(MEMORY[0x24BDD3DC0], "bradycardiaType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v4;
  objc_msgSend(MEMORY[0x24BDD3DC0], "tachycardiaType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v5;
  objc_msgSend(MEMORY[0x24BDD3DC0], "workoutType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[5] = v6;
  objc_msgSend(MEMORY[0x24BDD3DC0], "lowCardioFitnessEventType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[6] = v7;
  objc_msgSend(MEMORY[0x24BDD3B80], "electrocardiogramType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[7] = v8;
  objc_msgSend(MEMORY[0x24BDD3990], "_categoryTypeWithCode:", 250);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[8] = v9;
  objc_msgSend(MEMORY[0x24BDD3990], "_categoryTypeWithCode:", 276);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[9] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)samplesAdded:(id)a3 anchor:(id)a4
{
  id v5;
  os_log_t *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  os_log_t v10;
  uint8_t v11[16];

  v5 = a3;
  _HKInitializeLogging();
  v6 = (os_log_t *)MEMORY[0x24BDD3070];
  v7 = *MEMORY[0x24BDD3070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_23DB70000, v7, OS_LOG_TYPE_DEFAULT, "HDHealthAppDataObserver received notification for an observed sample type", v11, 2u);
  }
  objc_msgSend(v5, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sampleType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[HDHealthAppDataObserver debounceRunBackgroundGeneration](self, "debounceRunBackgroundGeneration");
  }
  else
  {
    _HKInitializeLogging();
    v10 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
      -[HDHealthAppDataObserver samplesAdded:anchor:].cold.1(v10, v5);
  }

}

- (void)debounceRunBackgroundGeneration
{
  NSObject *v3;
  _QWORD block[5];

  -[HDHealthAppDataObserver debounceQueue](self, "debounceQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__HDHealthAppDataObserver_debounceRunBackgroundGeneration__block_invoke;
  block[3] = &unk_250E7E128;
  block[4] = self;
  dispatch_async(v3, block);

}

void __58__HDHealthAppDataObserver_debounceRunBackgroundGeneration__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "delayedOperation");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "execute");

}

- (void)runBackgroundGeneration
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_23DB70000, log, OS_LOG_TYPE_ERROR, "HDHealthAppDataObserver failed to lookup restore completion date; assuming restore is complete.",
    v1,
    2u);
}

- (HDProfile)profile
{
  return (HDProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (void)setProfile:(id)a3
{
  objc_storeWeak((id *)&self->_profile, a3);
}

- (HDDataManager)dataManager
{
  return self->_dataManager;
}

- (void)setDataManager:(id)a3
{
  objc_storeStrong((id *)&self->_dataManager, a3);
}

- (OS_dispatch_queue)debounceQueue
{
  return self->_debounceQueue;
}

- (void)setDebounceQueue:(id)a3
{
  objc_storeStrong((id *)&self->_debounceQueue, a3);
}

- (_HKDelayedOperation)delayedOperation
{
  return self->_delayedOperation;
}

- (void)setDelayedOperation:(id)a3
{
  objc_storeStrong((id *)&self->_delayedOperation, a3);
}

- (HDHAHealthPluginHostFeedGenerator)feedGenerator
{
  return self->_feedGenerator;
}

- (void)setFeedGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_feedGenerator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedGenerator, 0);
  objc_storeStrong((id *)&self->_delayedOperation, 0);
  objc_storeStrong((id *)&self->_debounceQueue, 0);
  objc_storeStrong((id *)&self->_dataManager, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)samplesAdded:(void *)a1 anchor:(void *)a2 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138477827;
  v6 = v4;
  _os_log_error_impl(&dword_23DB70000, v3, OS_LOG_TYPE_ERROR, "Failed to get sample type for sample %{private}@", (uint8_t *)&v5, 0xCu);

}

@end

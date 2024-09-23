@implementation HDHeartRateDataCollectionForwarder

- (HDHeartRateDataCollectionForwarder)init
{
  HDHeartRateDataCollectionForwarder *v2;
  uint64_t v3;
  OS_dispatch_queue *queue;
  const char *v5;
  NSObject *v6;
  uint64_t v7;
  CMCatherineFeeder *catherineFeeder;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)HDHeartRateDataCollectionForwarder;
  v2 = -[HDHeartRateDataCollectionForwarder init](&v16, sel_init);
  if (v2)
  {
    HKCreateSerialDispatchQueue();
    v3 = objc_claimAutoreleasedReturnValue();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v2->_heartRateEnabledInPrivacy = HKIsHeartRateEnabled();
    objc_initWeak(&location, v2);
    v2->_privacyPreferencesNotificationToken = -1;
    v5 = (const char *)objc_msgSend(objc_retainAutorelease((id)*MEMORY[0x1E0CB7750]), "UTF8String");
    v6 = v2->_queue;
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __42__HDHeartRateDataCollectionForwarder_init__block_invoke;
    v13 = &unk_1E6CE8390;
    objc_copyWeak(&v14, &location);
    notify_register_dispatch(v5, &v2->_privacyPreferencesNotificationToken, v6, &v10);
    if (v2->_heartRateEnabledInPrivacy)
    {
      v7 = -[HDHeartRateDataCollectionForwarder _newCatherineFeeder](v2, "_newCatherineFeeder", v10, v11, v12, v13);
      catherineFeeder = v2->_catherineFeeder;
      v2->_catherineFeeder = (CMCatherineFeeder *)v7;

    }
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __42__HDHeartRateDataCollectionForwarder_init__block_invoke(uint64_t a1)
{
  id WeakRetained;
  _QWORD *v2;
  int v3;
  int v4;
  int v5;
  NSObject *v6;
  const char *v7;
  void *v8;
  uint64_t v9;
  _QWORD *v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v10 = WeakRetained;
    dispatch_assert_queue_V2(*((dispatch_queue_t *)WeakRetained + 1));
    v3 = HKIsHeartRateEnabled();
    v2 = v10;
    v4 = *((unsigned __int8 *)v10 + 16);
    if (v4 != v3)
    {
      v5 = v3;
      *((_BYTE *)v10 + 16) = v3;
      _HKInitializeLogging();
      v6 = *MEMORY[0x1E0CB52E8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_DEFAULT))
      {
        v7 = "disabled";
        if (v5)
          v7 = "enabled";
        *(_DWORD *)buf = 136315138;
        v12 = v7;
        _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "heart rate privacy setting changed to %s", buf, 0xCu);
      }
      v2 = v10;
      v4 = *((unsigned __int8 *)v10 + 16);
    }
    v8 = (void *)v2[3];
    if (v8)
    {
      if (!v4)
      {
        v9 = 0;
LABEL_13:
        v2[3] = v9;

        v2 = v10;
      }
    }
    else if (v4)
    {
      v9 = objc_msgSend(v2, "_newCatherineFeeder");
      v2 = v10;
      v8 = (void *)v10[3];
      goto LABEL_13;
    }
  }

}

- (void)dealloc
{
  int privacyPreferencesNotificationToken;
  objc_super v4;

  privacyPreferencesNotificationToken = self->_privacyPreferencesNotificationToken;
  if (privacyPreferencesNotificationToken != -1)
    notify_cancel(privacyPreferencesNotificationToken);
  v4.receiver = self;
  v4.super_class = (Class)HDHeartRateDataCollectionForwarder;
  -[HDHeartRateDataCollectionForwarder dealloc](&v4, sel_dealloc);
}

- (id)_newCatherineFeeder
{
  return objc_alloc_init(MEMORY[0x1E0CA5618]);
}

- (void)insertSamples:(id)a3 device:(id)a4 source:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[5];

  v11 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (self->_heartRateEnabledInPrivacy && (objc_msgSend(v9, "_isAppleWatch") & 1) == 0)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __66__HDHeartRateDataCollectionForwarder_insertSamples_device_source___block_invoke;
    v12[3] = &unk_1E6D018E8;
    v12[4] = self;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v12);
  }

}

uint64_t __66__HDHeartRateDataCollectionForwarder_insertSamples_device_source___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "quantity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6CD0], "_countPerMinuteUnit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValueForUnit:", v4);
  v6 = v5;

  if (objc_msgSend(MEMORY[0x1E0CB6F18], "isAppleInternalInstall"))
  {
    _HKInitializeLogging();
    v7 = (void *)*MEMORY[0x1E0CB52E8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_INFO))
    {
      v8 = (void *)MEMORY[0x1E0CB37E8];
      v9 = v7;
      objc_msgSend(v8, "numberWithDouble:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      HKSensitiveLogItem();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v11;
      _os_log_impl(&dword_1B7802000, v9, OS_LOG_TYPE_INFO, "feeding %{public}@ to catherine", (uint8_t *)&v13, 0xCu);

    }
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "feedCatherine:confidence:", v6, 1.0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_catherineFeeder, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end

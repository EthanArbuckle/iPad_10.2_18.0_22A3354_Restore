@implementation HDCloudSyncPipelineStageWaitForDeviceToDeviceEncryptionAvailability

- (HDCloudSyncPipelineStageWaitForDeviceToDeviceEncryptionAvailability)initWithConfiguration:(id)a3
{
  HDCloudSyncPipelineStageWaitForDeviceToDeviceEncryptionAvailability *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HDCloudSyncPipelineStageWaitForDeviceToDeviceEncryptionAvailability;
  result = -[HDCloudSyncPipelineStage initWithConfiguration:cloudState:](&v4, sel_initWithConfiguration_cloudState_, a3, 0);
  if (result)
    result->_expirationInterval = 60.0;
  return result;
}

- (void)main
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  HDCloudSyncPipelineStageWaitForDeviceToDeviceEncryptionAvailability *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__cloudKitIdentityUpdated_, *MEMORY[0x1E0C94870], 0);

  -[HDCloudSyncOperation configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "repository");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v5, "primaryCKContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "containerIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.health.sync.secure"));

  if ((v5 & 1) != 0)
  {
    -[HDCloudSyncPipelineStageWaitForDeviceToDeviceEncryptionAvailability _checkForDevicetoDeviceEncryptionAvailabilityAndContinueObserving:](self, 1);
  }
  else
  {
    _HKInitializeLogging();
    v8 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      objc_msgSend(v6, "containerIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = self;
      v13 = 2114;
      v14 = v10;
      _os_log_impl(&dword_1B7802000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Primary container %{public}@ is not secure; skipping D2DE check.",
        (uint8_t *)&v11,
        0x16u);

    }
    -[HDCloudSyncPipelineStageWaitForDeviceToDeviceEncryptionAvailability finishWithSuccess:error:](self, "finishWithSuccess:error:", 1, 0);
  }

}

- (void)_checkForDevicetoDeviceEncryptionAvailabilityAndContinueObserving:(void *)a1
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  char v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    _HKInitializeLogging();
    v4 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v11 = a1;
      _os_log_impl(&dword_1B7802000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Looking up account info to check for device-to-device encryption availability...", buf, 0xCu);
    }
    objc_msgSend(a1, "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "repository");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "primaryCKContainer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __137__HDCloudSyncPipelineStageWaitForDeviceToDeviceEncryptionAvailability__checkForDevicetoDeviceEncryptionAvailabilityAndContinueObserving___block_invoke;
    v8[3] = &unk_1E6CF7708;
    v8[4] = a1;
    v9 = a2;
    objc_msgSend(v7, "accountInfoWithCompletionHandler:", v8);

  }
}

void __137__HDCloudSyncPipelineStageWaitForDeviceToDeviceEncryptionAvailability__checkForDevicetoDeviceEncryptionAvailabilityAndContinueObserving___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  NSObject *v23;
  dispatch_source_t v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  dispatch_time_t v28;
  void *v29;
  id location;
  _BYTE buf[24];
  void *v32;
  id v33[2];

  v33[1] = *(id *)MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    _HKInitializeLogging();
    v12 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v6;
      _os_log_impl(&dword_1B7802000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Failed to fetch account info while waiting on device-to-device encryption availability: %{public}@", buf, 0x16u);
    }
    v9 = *(void **)(a1 + 32);
    v10 = 0;
    v11 = v6;
    goto LABEL_9;
  }
  if (objc_msgSend(v5, "supportsDeviceToDeviceEncryption"))
  {
    _HKInitializeLogging();
    v7 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v8;
      _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Device-to-device encryption is available.", buf, 0xCu);
    }
    v9 = *(void **)(a1 + 32);
    v10 = 1;
    v11 = 0;
LABEL_9:
    objc_msgSend(v9, "finishWithSuccess:error:", v10, v11);
    goto LABEL_10;
  }
  if (*(_BYTE *)(a1 + 40))
  {
    _HKInitializeLogging();
    v14 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      v15 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v15;
      _os_log_impl(&dword_1B7802000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Device-to-device encryption not currently available; waiting for account update notification.",
        buf,
        0xCu);
    }
    v16 = *(_QWORD *)(a1 + 32);
    if (v16)
    {
      if (!*(_QWORD *)(v16 + 128))
      {
        objc_msgSend((id)v16, "profile");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "daemon");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "behavior");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "tinkerModeEnabled");

        if ((v20 & 1) == 0)
        {
          objc_msgSend((id)v16, "profile");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "cloudSyncManager");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "queue");
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v23);
          v25 = *(void **)(v16 + 128);
          *(_QWORD *)(v16 + 128) = v24;

          objc_initWeak(&location, (id)v16);
          v26 = *(NSObject **)(v16 + 128);
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __100__HDCloudSyncPipelineStageWaitForDeviceToDeviceEncryptionAvailability__startExpirationTimerIfNeeded__block_invoke;
          v32 = &unk_1E6CECE78;
          objc_copyWeak(v33, &location);
          dispatch_source_set_event_handler(v26, buf);
          v27 = *(NSObject **)(v16 + 128);
          v28 = dispatch_walltime(0, (uint64_t)(*(double *)(v16 + 136) * 1000000000.0));
          dispatch_source_set_timer(v27, v28, 0xFFFFFFFFFFFFFFFFLL, 0);
          dispatch_resume(*(dispatch_object_t *)(v16 + 128));
          objc_destroyWeak(v33);
          objc_destroyWeak(&location);
        }
      }
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 103, CFSTR("Timeout waiting for device to device encryption availability"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", 0, v29);

  }
LABEL_10:

}

- (void)_cloudKitIdentityUpdated:(id)a3
{
  NSObject *v4;
  int v5;
  HDCloudSyncPipelineStageWaitForDeviceToDeviceEncryptionAvailability *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = self;
    _os_log_impl(&dword_1B7802000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Received CKIdentityUpdateNotification", (uint8_t *)&v5, 0xCu);
  }
  -[HDCloudSyncPipelineStageWaitForDeviceToDeviceEncryptionAvailability _checkForDevicetoDeviceEncryptionAvailabilityAndContinueObserving:](self, 1);
}

void __100__HDCloudSyncPipelineStageWaitForDeviceToDeviceEncryptionAvailability__startExpirationTimerIfNeeded__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = (void *)WeakRetained[16];
    WeakRetained[16] = 0;

    -[HDCloudSyncPipelineStageWaitForDeviceToDeviceEncryptionAvailability _checkForDevicetoDeviceEncryptionAvailabilityAndContinueObserving:](WeakRetained, 0);
  }

}

- (BOOL)finishWithSuccess:(BOOL)a3 error:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *expirationTimer;
  OS_dispatch_source *v8;
  void *v9;
  BOOL v10;
  objc_super v12;

  v4 = a3;
  v6 = a4;
  expirationTimer = self->_expirationTimer;
  if (expirationTimer)
  {
    dispatch_source_cancel(expirationTimer);
    v8 = self->_expirationTimer;
    self->_expirationTimer = 0;

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObserver:", self);

  v12.receiver = self;
  v12.super_class = (Class)HDCloudSyncPipelineStageWaitForDeviceToDeviceEncryptionAvailability;
  v10 = -[HDCloudSyncOperation finishWithSuccess:error:](&v12, sel_finishWithSuccess_error_, v4, v6);

  return v10;
}

- (void)unitTest_setExpirationInterval:(double)a3
{
  self->_expirationInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationTimer, 0);
}

@end

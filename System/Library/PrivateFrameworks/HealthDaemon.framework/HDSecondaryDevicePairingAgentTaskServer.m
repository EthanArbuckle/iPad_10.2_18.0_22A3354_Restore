@implementation HDSecondaryDevicePairingAgentTaskServer

- (HDSecondaryDevicePairingAgentTaskServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  HDSecondaryDevicePairingAgentTaskServer *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HDSecondaryDevicePairingAgentTaskServer;
  result = -[HDStandardTaskServer initWithUUID:configuration:client:delegate:](&v7, sel_initWithUUID_configuration_client_delegate_, a3, a4, a5, a6);
  if (result)
  {
    result->_lock._os_unfair_lock_opaque = 0;
    result->_tinkerSharingSetupTimeout = 300.0;
  }
  return result;
}

- (void)_finishWithSuccess:(void *)a3 error:
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  int v27;
  id v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  void (**v37)(void *, _QWORD, id);
  void *v38;
  NSObject *v39;
  id v40;
  void *v41;
  id v42;
  uint8_t buf[4];
  id v44;
  __int16 v45;
  _BYTE v46[18];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a1)
  {
    -[HDSecondaryDevicePairingAgentTaskServer _cancelTaskTimeout](a1);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    v6 = *(void **)(a1 + 64);
    if (v6)
    {
      v7 = v6;
      v8 = *(void **)(a1 + 64);
      *(_QWORD *)(a1 + 64) = 0;

      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
      _HKInitializeLogging();
      v9 = (void *)*MEMORY[0x1E0CB5370];
      v10 = *MEMORY[0x1E0CB5370];
      if ((_DWORD)a2)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v11 = v9;
          v12 = (void *)objc_opt_class();
          v13 = *((id *)v7 + 7);
          v14 = v12;
          objc_msgSend(v13, "profileIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v44 = v12;
          v45 = 2114;
          *(_QWORD *)v46 = v15;
          _os_log_impl(&dword_1B7802000, v11, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@: Finish successfully, profile: %{public}@ (#t0)", buf, 0x16u);

        }
        objc_msgSend((id)a1, "profile");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "daemon");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "analyticsSubmissionCoordinator");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = *((id *)v7 + 4);
        objc_msgSend(v18, "tinker_pairingDidFinishForConfiguration:duration:", v19, CFAbsoluteTimeGetCurrent() - *((double *)v7 + 2));
        goto LABEL_19;
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v39 = v9;
        *(_DWORD *)buf = 138543618;
        v44 = (id)objc_opt_class();
        v45 = 2114;
        *(_QWORD *)v46 = v5;
        v40 = v44;
        _os_log_error_impl(&dword_1B7802000, v39, OS_LOG_TYPE_ERROR, "[sharing-setup] %{public}@: Failed to successfully setup pairing: %{public}@ (#t0)", buf, 0x16u);

      }
      if (!*((_QWORD *)v7 + 7))
      {
LABEL_18:
        objc_msgSend((id)a1, "profile");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "daemon");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "analyticsSubmissionCoordinator");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = *((id *)v7 + 4);
        objc_msgSend(v18, "tinker_pairingDidFailWithError:configuration:duration:stage:", v5, v19, *((_QWORD *)v7 + 6), CFAbsoluteTimeGetCurrent() - *((double *)v7 + 2));
LABEL_19:

        v36 = v5;
        os_unfair_lock_lock((os_unfair_lock_t)v7 + 2);
        v37 = (void (**)(void *, _QWORD, id))_Block_copy(*((const void **)v7 + 5));
        v38 = (void *)*((_QWORD *)v7 + 5);
        *((_QWORD *)v7 + 5) = 0;

        os_unfair_lock_unlock((os_unfair_lock_t)v7 + 2);
        v37[2](v37, a2, v36);

        objc_msgSend(*((id *)v7 + 3), "invalidate");
        goto LABEL_20;
      }
      objc_msgSend((id)a1, "profile");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "daemon");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "profileManager");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = *((id *)v7 + 7);
      objc_msgSend(v25, "profileIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = 0;
      v27 = objc_msgSend(v24, "deleteProfile:error:", v26, &v42);
      v28 = v42;

      _HKInitializeLogging();
      v29 = (void *)*MEMORY[0x1E0CB5370];
      v30 = *MEMORY[0x1E0CB5370];
      if (v27)
      {
        if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
LABEL_17:

          a2 = 0;
          goto LABEL_18;
        }
        v31 = v29;
        v32 = (void *)objc_opt_class();
        v33 = *((id *)v7 + 7);
        v34 = v32;
        objc_msgSend(v33, "profileIdentifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v44 = v32;
        v45 = 2114;
        *(_QWORD *)v46 = v35;
        _os_log_impl(&dword_1B7802000, v31, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@: Completed profile teardown after pairing failure for %{public}@ (#t0)", buf, 0x16u);
      }
      else
      {
        if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          goto LABEL_17;
        v31 = v29;
        v41 = (void *)objc_opt_class();
        v33 = *((id *)v7 + 7);
        v34 = v41;
        objc_msgSend(v33, "profileIdentifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v44 = v41;
        v45 = 2114;
        *(_QWORD *)v46 = v35;
        *(_WORD *)&v46[8] = 2114;
        *(_QWORD *)&v46[10] = v28;
        _os_log_error_impl(&dword_1B7802000, v31, OS_LOG_TYPE_ERROR, "[sharing-setup] %{public}@: Failed to tear down profile %{public}@ after pairing failure: %{public}@ (#t0)", buf, 0x20u);
      }

      goto LABEL_17;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
    _HKInitializeLogging();
    v20 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      v7 = v20;
      *(_DWORD *)buf = 138543874;
      v44 = (id)objc_opt_class();
      v45 = 1024;
      *(_DWORD *)v46 = a2;
      *(_WORD *)&v46[4] = 2114;
      *(_QWORD *)&v46[6] = v5;
      v21 = v44;
      _os_log_impl(&dword_1B7802000, (os_log_t)v7, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@: Attempting to finish with no active request (success: %{BOOL}d, %{public}@)", buf, 0x1Cu);

LABEL_20:
    }
  }

}

- (void)_cancelTaskTimeout
{
  NSObject *v2;
  void *v3;

  if (a1)
  {
    *(_BYTE *)(a1 + 56) = 0;
    v2 = *(NSObject **)(a1 + 48);
    if (v2)
    {
      dispatch_source_cancel(v2);
      v3 = *(void **)(a1 + 48);
      *(_QWORD *)(a1 + 48) = 0;

    }
  }
}

+ (id)taskIdentifier
{
  return (id)*MEMORY[0x1E0CB73B8];
}

- (id)remoteInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6B20], "clientInterface");
}

- (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6B20], "serverInterface");
}

- (void)remote_requestTinkerSharingOptInWithGuardianDisplayName:(id)a3 NRDeviceUUID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  HDCodableTinkerOptInRequest *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD v24[5];
  id v25;
  _QWORD v26[5];
  id v27;
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  _HKInitializeLogging();
  v11 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    *(_DWORD *)buf = 138543362;
    v29 = (id)objc_opt_class();
    v13 = v29;
    _os_log_impl(&dword_1B7802000, v12, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@ Preparing to send message to Tinker watch (#t0)", buf, 0xCu);

  }
  v14 = objc_alloc_init(HDCodableTinkerOptInRequest);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "UUIDString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableTinkerOptInRequest setRequestIdentifier:](v14, "setRequestIdentifier:", v16);

  -[HDCodableTinkerOptInRequest setGuardianDisplayName:](v14, "setGuardianDisplayName:", v10);
  v17 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __123__HDSecondaryDevicePairingAgentTaskServer_remote_requestTinkerSharingOptInWithGuardianDisplayName_NRDeviceUUID_completion___block_invoke;
  v26[3] = &unk_1E6CE9C08;
  v26[4] = self;
  v18 = v8;
  v27 = v18;
  -[HDSecondaryDevicePairingAgentTaskServer _scheduleTaskTimeout:timeoutHandler:]((dispatch_object_t *)self, v26, 60.0);
  -[HDStandardTaskServer profile](self, "profile");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "daemon");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "primaryProfile");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "nanoSyncManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v17;
  v24[1] = 3221225472;
  v24[2] = __123__HDSecondaryDevicePairingAgentTaskServer_remote_requestTinkerSharingOptInWithGuardianDisplayName_NRDeviceUUID_completion___block_invoke_189;
  v24[3] = &unk_1E6CED3F8;
  v24[4] = self;
  v25 = v18;
  v23 = v18;
  objc_msgSend(v22, "sendTinkerSharingOptInRequest:forNRDeviceUUID:completion:", v14, v9, v24);

}

void __123__HDSecondaryDevicePairingAgentTaskServer_remote_requestTinkerSharingOptInWithGuardianDisplayName_NRDeviceUUID_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  id v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
  {
    v4 = v2;
    *(_DWORD *)v6 = 138543362;
    *(_QWORD *)&v6[4] = objc_opt_class();
    v5 = *(id *)&v6[4];
    _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "[sharing-setup] %{public}@ Sharing Opt In timed out", v6, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 103, CFSTR("Operation timed out"), *(_OWORD *)v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_scheduleTaskTimeout:(double)a3 timeoutHandler:
{
  id v5;
  dispatch_source_t v6;
  dispatch_object_t v7;
  NSObject *v8;
  dispatch_time_t v9;
  NSObject *v10;
  _QWORD handler[4];
  id v12;
  id v13;
  id location;

  v5 = a2;
  if (a1)
  {
    -[HDSecondaryDevicePairingAgentTaskServer _cancelTaskTimeout]((uint64_t)a1);
    v6 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
    v7 = a1[6];
    a1[6] = v6;

    v8 = a1[6];
    v9 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0);
    objc_initWeak(&location, a1);
    v10 = a1[6];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __79__HDSecondaryDevicePairingAgentTaskServer__scheduleTaskTimeout_timeoutHandler___block_invoke;
    handler[3] = &unk_1E6CF2920;
    objc_copyWeak(&v13, &location);
    v12 = v5;
    dispatch_source_set_event_handler(v10, handler);
    dispatch_resume(a1[6]);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

}

void __123__HDSecondaryDevicePairingAgentTaskServer_remote_requestTinkerSharingOptInWithGuardianDisplayName_NRDeviceUUID_completion___block_invoke_189(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v3 + 56))
  {
    v5 = a3;
    -[HDSecondaryDevicePairingAgentTaskServer _cancelTaskTimeout](v3);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

- (void)remote_setupHealthSharingForSecondaryPairedDeviceWithConfiguration:(id)a3 completion:(id)a4
{
  id v8;
  void (**v9)(id, _QWORD, id);
  void *v10;
  NSObject *v11;
  id v12;
  HDSecondaryDevicePairingRequest *v13;
  HDSecondaryDevicePairingRequest *v14;
  id v15;
  void (**v16)(id, _QWORD, id);
  HDSecondaryDevicePairingAgentTaskServer *v17;
  uint64_t v18;
  id completion;
  uint64_t v20;
  HKDaemonTransaction *transaction;
  HDSecondaryDevicePairingRequest *currentRequest;
  HDSecondaryDevicePairingRequest *v23;
  double tinkerSharingSetupTimeout;
  void *v25;
  HDSecondaryDevicePairingRequest *v26;
  HDSecondaryDevicePairingRequest *v27;
  void *v28;
  void *v29;
  id v30;
  _QWORD v31[5];
  objc_super buf;
  void (*v33)(uint64_t, char, void *);
  void *v34;
  HDSecondaryDevicePairingAgentTaskServer *v35;
  HDSecondaryDevicePairingRequest *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, _QWORD, id))a4;
  _HKInitializeLogging();
  v10 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    LODWORD(buf.receiver) = 138543362;
    *(id *)((char *)&buf.receiver + 4) = (id)objc_opt_class();
    v12 = *(id *)((char *)&buf.receiver + 4);
    _os_log_impl(&dword_1B7802000, v11, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@: Received setupHealthSharing call (#t0)", (uint8_t *)&buf, 0xCu);

  }
  os_unfair_lock_lock(&self->_lock);
  if (self->_currentRequest)
  {
    os_unfair_lock_unlock(&self->_lock);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("A secondary device setup request is already in progress."));
    v13 = (HDSecondaryDevicePairingRequest *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0, v13);
  }
  else
  {
    v14 = [HDSecondaryDevicePairingRequest alloc];
    v15 = v8;
    v16 = v9;
    if (v14)
    {
      buf.receiver = v14;
      buf.super_class = (Class)HDSecondaryDevicePairingRequest;
      v17 = -[HDSecondaryDevicePairingAgentTaskServer init](&buf, sel_init);
      v14 = (HDSecondaryDevicePairingRequest *)v17;
      if (v17)
      {
        LODWORD(v17->super._taskUUID) = 0;
        objc_storeStrong((id *)&v17->super._delegate, a3);
        v18 = objc_msgSend(v16, "copy");
        completion = v14->_completion;
        v14->_completion = (id)v18;

        objc_msgSend(MEMORY[0x1E0CB6560], "transactionWithOwner:", v14);
        v20 = objc_claimAutoreleasedReturnValue();
        transaction = v14->_transaction;
        v14->_transaction = (HKDaemonTransaction *)v20;

        v14->_startTime = CFAbsoluteTimeGetCurrent();
        v14->_stage = 1;
      }
    }

    currentRequest = self->_currentRequest;
    self->_currentRequest = v14;
    v23 = v14;

    os_unfair_lock_unlock(&self->_lock);
    tinkerSharingSetupTimeout = self->_tinkerSharingSetupTimeout;
    v25 = (void *)MEMORY[0x1E0C809B0];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __121__HDSecondaryDevicePairingAgentTaskServer_remote_setupHealthSharingForSecondaryPairedDeviceWithConfiguration_completion___block_invoke;
    v31[3] = &unk_1E6CE80E8;
    v31[4] = self;
    -[HDSecondaryDevicePairingAgentTaskServer _scheduleTaskTimeout:timeoutHandler:]((dispatch_object_t *)self, v31, tinkerSharingSetupTimeout);
    v26 = v23;
    v27 = v26;
    if (v26)
      v26->_stage = 2;
    -[HDStandardTaskServer profile](self, "profile");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "cloudSyncManager");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    buf.receiver = v25;
    buf.super_class = (Class)3221225472;
    v33 = __80__HDSecondaryDevicePairingAgentTaskServer__prepareGuardianForSharingForRequest___block_invoke;
    v34 = &unk_1E6CEB718;
    v35 = self;
    v13 = v27;
    v36 = v13;
    v30 = (id)objc_msgSend(v29, "prepareForSharingWithCompletion:", &buf);

  }
}

void __121__HDSecondaryDevicePairingAgentTaskServer_remote_setupHealthSharingForSecondaryPairedDeviceWithConfiguration_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  id v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
  {
    v4 = v2;
    *(_DWORD *)v6 = 138543362;
    *(_QWORD *)&v6[4] = objc_opt_class();
    v5 = *(id *)&v6[4];
    _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "[sharing-setup] %{public}@ Sharing Setup timed out", v6, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 103, CFSTR("Operation timed out"), *(_OWORD *)v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSecondaryDevicePairingAgentTaskServer _finishWithSuccess:error:](*(_QWORD *)(a1 + 32), 0, v3);

}

- (void)remote_performEndToEndCloudSyncWithNRDeviceUUID:(id)a3 syncParticipantFirst:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void (**v16)(_QWORD, _QWORD, _QWORD);
  id *v17;
  id *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;
  SEL v27;
  _QWORD aBlock[5];
  id v29;

  v6 = a4;
  v9 = a3;
  v10 = a5;
  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __123__HDSecondaryDevicePairingAgentTaskServer_remote_performEndToEndCloudSyncWithNRDeviceUUID_syncParticipantFirst_completion___block_invoke;
  aBlock[3] = &unk_1E6CF2858;
  aBlock[4] = self;
  v12 = v9;
  v29 = v12;
  v13 = _Block_copy(aBlock);
  v25[0] = v11;
  v25[1] = 3221225472;
  v25[2] = __123__HDSecondaryDevicePairingAgentTaskServer_remote_performEndToEndCloudSyncWithNRDeviceUUID_syncParticipantFirst_completion___block_invoke_198;
  v25[3] = &unk_1E6CF2880;
  v25[4] = self;
  v14 = v12;
  v26 = v14;
  v27 = a2;
  v15 = _Block_copy(v25);
  v16 = (void (**)(_QWORD, _QWORD, _QWORD))v15;
  if (v6)
  {
    v22[0] = v11;
    v22[1] = 3221225472;
    v22[2] = __123__HDSecondaryDevicePairingAgentTaskServer_remote_performEndToEndCloudSyncWithNRDeviceUUID_syncParticipantFirst_completion___block_invoke_204;
    v22[3] = &unk_1E6CF28A8;
    v17 = &v23;
    v23 = v13;
    v18 = &v24;
    v24 = v10;
    ((void (**)(_QWORD, uint64_t, _QWORD *))v16)[2](v16, 2, v22);
  }
  else
  {
    v19[0] = v11;
    v19[1] = 3221225472;
    v19[2] = __123__HDSecondaryDevicePairingAgentTaskServer_remote_performEndToEndCloudSyncWithNRDeviceUUID_syncParticipantFirst_completion___block_invoke_2;
    v19[3] = &unk_1E6CF28A8;
    v17 = &v20;
    v20 = v15;
    v18 = &v21;
    v21 = v10;
    (*((void (**)(void *, _QWORD *))v13 + 2))(v13, v19);
  }

}

void __123__HDSecondaryDevicePairingAgentTaskServer_remote_performEndToEndCloudSyncWithNRDeviceUUID_syncParticipantFirst_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    *(_DWORD *)buf = 138543362;
    v16 = (id)objc_opt_class();
    v6 = v16;
    _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@ Preparing to send message to Tinker watch for end to end Cloud Sync (#t0)", buf, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "profile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "daemon");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "primaryProfile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "nanoSyncManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __123__HDSecondaryDevicePairingAgentTaskServer_remote_performEndToEndCloudSyncWithNRDeviceUUID_syncParticipantFirst_completion___block_invoke_196;
  v13[3] = &unk_1E6CED3F8;
  v11 = *(_QWORD *)(a1 + 40);
  v13[4] = *(_QWORD *)(a1 + 32);
  v14 = v3;
  v12 = v3;
  objc_msgSend(v10, "sendTinkerEndToEndCloudSyncRequestForNRDeviceUUID:completion:", v11, v13);

}

void __123__HDSecondaryDevicePairingAgentTaskServer_remote_performEndToEndCloudSyncWithNRDeviceUUID_syncParticipantFirst_completion___block_invoke_196(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  int v10;
  id v11;
  __int16 v12;
  int v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v8 = v6;
    v10 = 138543874;
    v11 = (id)objc_opt_class();
    v12 = 1024;
    v13 = a2;
    v14 = 2114;
    v15 = v5;
    v9 = v11;
    _os_log_impl(&dword_1B7802000, v8, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@ Did finish Gizmo Sync with success: %d, error: %{public}@ (#t0)", (uint8_t *)&v10, 0x1Cu);

  }
  (*(void (**)(_QWORD, uint64_t, id, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, v5, v7);

}

void __123__HDSecondaryDevicePairingAgentTaskServer_remote_performEndToEndCloudSyncWithNRDeviceUUID_syncParticipantFirst_completion___block_invoke_198(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[5];
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "profile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "daemon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "profileManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "profileAssociatedWithNRDeviceUUID:", *(_QWORD *)(a1 + 40));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "profile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "daemon");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "profileManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "profileForIdentifier:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  _HKInitializeLogging();
  v14 = *MEMORY[0x1E0CB5370];
  v15 = *MEMORY[0x1E0CB5370];
  if (v13)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v14;
      *(_DWORD *)buf = 138543362;
      v26 = (id)objc_opt_class();
      v17 = v26;
      _os_log_impl(&dword_1B7802000, v16, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@ Performing Sync for local device (reason: end to end Cloud Sync) (#t0)", buf, 0xCu);

    }
    v18 = -[HDCloudSyncContext initForPurpose:options:reason:xpcActivity:]([HDCloudSyncContext alloc], "initForPurpose:options:reason:xpcActivity:", a2, 0, 20, 0);
    objc_msgSend(v13, "cloudSyncManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __123__HDSecondaryDevicePairingAgentTaskServer_remote_performEndToEndCloudSyncWithNRDeviceUUID_syncParticipantFirst_completion___block_invoke_202;
    v23[3] = &unk_1E6CED3F8;
    v23[4] = *(_QWORD *)(a1 + 32);
    v24 = v5;
    v20 = (id)objc_msgSend(v19, "syncWithContext:completion:", v18, v23);

  }
  else
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v21 = *(void **)(a1 + 32);
      v22 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v26 = v21;
      v27 = 2114;
      v28 = v22;
      _os_log_error_impl(&dword_1B7802000, v14, OS_LOG_TYPE_ERROR, "%{public}@: Unable to find profile for end-to-end sync for device %{public}@", buf, 0x16u);
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), *(_QWORD *)(a1 + 48), CFSTR("No profile for device UUID %@"), *(_QWORD *)(a1 + 40));
    v18 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, id))v5 + 2))(v5, 0, v18);
  }

}

void __123__HDSecondaryDevicePairingAgentTaskServer_remote_performEndToEndCloudSyncWithNRDeviceUUID_syncParticipantFirst_completion___block_invoke_202(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v8 = v6;
    v10 = 138543618;
    v11 = (id)objc_opt_class();
    v12 = 2114;
    v13 = v5;
    v9 = v11;
    _os_log_impl(&dword_1B7802000, v8, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@ Did finish local device sync for end to end Cloud Sync with error: %{public}@ (#t0)", (uint8_t *)&v10, 0x16u);

  }
  (*(void (**)(_QWORD, uint64_t, id, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, v5, v7);

}

uint64_t __123__HDSecondaryDevicePairingAgentTaskServer_remote_performEndToEndCloudSyncWithNRDeviceUUID_syncParticipantFirst_completion___block_invoke_204(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __123__HDSecondaryDevicePairingAgentTaskServer_remote_performEndToEndCloudSyncWithNRDeviceUUID_syncParticipantFirst_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 3, *(_QWORD *)(a1 + 40));
}

- (void)remote_tearDownHealthSharingWithPairedGuardianWithCompletion:(id)a3
{
  void (**v5)(id, _QWORD, id);
  os_log_t *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  os_log_t v25;
  NSObject *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  _QWORD v31[5];
  void (**v32)(id, _QWORD, id);
  id v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, _QWORD, id))a3;
  _HKInitializeLogging();
  v6 = (os_log_t *)MEMORY[0x1E0CB5370];
  v7 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    v9 = (void *)objc_opt_class();
    v10 = v9;
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v36 = v9;
    v37 = 2114;
    v38 = v11;
    _os_log_impl(&dword_1B7802000, v8, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@ %{public}@ called (#t0)", buf, 0x16u);

  }
  -[HDStandardTaskServer profile](self, "profile");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "daemon");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "behavior");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isAppleWatch");

  if ((v15 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDSecondaryDevicePairingAgentTaskServer.m"), 258, CFSTR("%@ must be called from a watch."), v30);

  }
  -[HDStandardTaskServer profile](self, "profile");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  objc_msgSend(v16, "pairedGuardianParticipantWithError:", &v34);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v34;

  if (v18)
  {
    v5[2](v5, 0, v18);
  }
  else if (v17)
  {
    objc_initWeak((id *)buf, self);
    -[HDStandardTaskServer profile](self, "profile");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "daemon");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "primaryProfile");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "cloudSyncManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v17);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __104__HDSecondaryDevicePairingAgentTaskServer_remote_tearDownHealthSharingWithPairedGuardianWithCompletion___block_invoke;
    v31[3] = &unk_1E6CF28D0;
    objc_copyWeak(&v33, (id *)buf);
    v31[4] = self;
    v32 = v5;
    v24 = (id)objc_msgSend(v22, "removeParticipants:fromSharesWithCompletion:", v23, v31);

    objc_destroyWeak(&v33);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    _HKInitializeLogging();
    v25 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      v26 = v25;
      v27 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v36 = v27;
      v28 = v27;
      _os_log_impl(&dword_1B7802000, v26, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@ Guardian participant is nil (#t0)", buf, 0xCu);

    }
    -[HDSecondaryDevicePairingAgentTaskServer _removePrivacyAlerts](self);
    v5[2](v5, 1, 0);
  }

}

- (void)_removePrivacyAlerts
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  char v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(a1, "profile");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "daemon");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "primaryProfile");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "tinkerPrivacyAlertCoordinator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v5 = objc_msgSend(v4, "removeAllEventsWithError:", &v11);
    v6 = v11;

    if ((v5 & 1) == 0)
    {
      _HKInitializeLogging();
      v7 = (void *)*MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        v8 = v7;
        v9 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v13 = v9;
        v14 = 2112;
        v15 = v6;
        v10 = v9;
        _os_log_error_impl(&dword_1B7802000, v8, OS_LOG_TYPE_ERROR, "[sharing-setup] %{public}@: Error %@ removing alerts", buf, 0x16u);

      }
    }

  }
}

void __104__HDSecondaryDevicePairingAgentTaskServer_remote_tearDownHealthSharingWithPairedGuardianWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6;
  id WeakRetained;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;

  if ((_DWORD)a2)
  {
    v6 = a3;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    -[HDSecondaryDevicePairingAgentTaskServer _removePrivacyAlerts](WeakRetained);
LABEL_5:

    goto LABEL_6;
  }
  v8 = *(_QWORD *)(a1 + 32);
  v9 = a3;
  if (v8)
  {
    WeakRetained = objc_alloc_init(MEMORY[0x1E0D298D0]);
    HKHealthKitFrameworkBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("STOP_SHARING_FAILED_NOTIFICATION_TITLE"), &stru_1E6D11BB8, CFSTR("Localizable-tinker"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setTitle:", v11);

    HKHealthKitFrameworkBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("STOP_SHARING_FAILED_NOTIFICATION_MESSAGE"), &stru_1E6D11BB8, CFSTR("Localizable-tinker"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setMessage:", v13);

    objc_msgSend(WeakRetained, "presentWithResponseHandler:", &__block_literal_global_63);
    goto LABEL_5;
  }
LABEL_6:
  v14 = *(_QWORD *)(a1 + 40);
  objc_msgSend(a3, "hk_sanitizedError");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, uint64_t, id))(v14 + 16))(v14, a2, v15);
}

- (void)remote_tearDownHealthSharingWithTinkerDeviceWithNRUUID:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  os_log_t *v9;
  void *v10;
  NSObject *v11;
  HDSecondaryDevicePairingAgentTaskServer *v12;
  HDSecondaryDevicePairingAgentTaskServer *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  os_log_t v29;
  os_log_t v30;
  uint64_t v31;
  id v32;
  void *v33;
  id v34;
  os_log_t v35;
  void *v36;
  NSObject *v37;
  void *v38;
  NSObject *v39;
  HDSecondaryDevicePairingAgentTaskServer *v40;
  HDSecondaryDevicePairingAgentTaskServer *v41;
  NSObject *v42;
  HDSecondaryDevicePairingAgentTaskServer *v43;
  HDSecondaryDevicePairingAgentTaskServer *v44;
  void *v45;
  void *v46;
  _QWORD v47[5];
  id v48;
  id v49;
  _QWORD v50[5];
  id v51;
  uint8_t buf[4];
  HDSecondaryDevicePairingAgentTaskServer *v53;
  __int16 v54;
  id v55;
  __int16 v56;
  id v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  _HKInitializeLogging();
  v9 = (os_log_t *)MEMORY[0x1E0CB5370];
  v10 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    v12 = (HDSecondaryDevicePairingAgentTaskServer *)objc_opt_class();
    v13 = v12;
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v53 = v12;
    v54 = 2114;
    v55 = v14;
    v56 = 2114;
    v57 = v7;
    _os_log_impl(&dword_1B7802000, v11, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@ %{public}@ called with NR UUID %{public}@ (#t0)", buf, 0x20u);

  }
  -[HDStandardTaskServer profile](self, "profile");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "daemon");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "behavior");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isAppleWatch");

  if (v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDSecondaryDevicePairingAgentTaskServer.m"), 305, CFSTR("%@ must be called from a phone."), v46);

  }
  -[HDStandardTaskServer profile](self, "profile");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "profileType");

  if (v20 == 1)
  {
    -[HDStandardTaskServer profile](self, "profile");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "daemon");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "profileManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "profileAssociatedWithNRDeviceUUID:", v7);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    -[HDStandardTaskServer profile](self, "profile");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "daemon");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "profileManager");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "profileForIdentifier:", v24);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v28, "profileType") == 1)
    {
      _HKInitializeLogging();
      v29 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
      {
        v39 = v29;
        v40 = (HDSecondaryDevicePairingAgentTaskServer *)objc_opt_class();
        *(_DWORD *)buf = 138543874;
        v53 = v40;
        v54 = 2114;
        v55 = v28;
        v56 = 2114;
        v57 = v7;
        v41 = v40;
        _os_log_error_impl(&dword_1B7802000, v39, OS_LOG_TYPE_ERROR, "[sharing-setup] %{public}@ Profile %{public}@ associated with NRDeviceUUID:%{public}@ is primary profile. Abort sharing tear down flow (#t0)", buf, 0x20u);

      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 100, CFSTR("Profile associated with NRDeviceUUID: %@ is primary profile."), v7);
    }
    else
    {
      if (v28)
      {
        v31 = MEMORY[0x1E0C809B0];
        v50[0] = MEMORY[0x1E0C809B0];
        v50[1] = 3221225472;
        v50[2] = __109__HDSecondaryDevicePairingAgentTaskServer_remote_tearDownHealthSharingWithTinkerDeviceWithNRUUID_completion___block_invoke;
        v50[3] = &unk_1E6CE9C08;
        v50[4] = self;
        v32 = v8;
        v51 = v32;
        -[HDSecondaryDevicePairingAgentTaskServer _scheduleTaskTimeout:timeoutHandler:]((dispatch_object_t *)self, v50, 60.0);
        objc_msgSend(v28, "cloudSyncManager");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v47[0] = v31;
        v47[1] = 3221225472;
        v47[2] = __109__HDSecondaryDevicePairingAgentTaskServer_remote_tearDownHealthSharingWithTinkerDeviceWithNRUUID_completion___block_invoke_219;
        v47[3] = &unk_1E6CE7868;
        v47[4] = self;
        v48 = v28;
        v49 = v32;
        v34 = (id)objc_msgSend(v33, "leaveSharesWithCompletion:", v47);

LABEL_19:
        goto LABEL_20;
      }
      _HKInitializeLogging();
      v35 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
      {
        v42 = v35;
        v43 = (HDSecondaryDevicePairingAgentTaskServer *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v53 = v43;
        v54 = 2114;
        v55 = v7;
        v44 = v43;
        _os_log_error_impl(&dword_1B7802000, v42, OS_LOG_TYPE_ERROR, "[sharing-setup] %{public}@ Unable to find secondary profile associated with NRDeviceUUID: %{public}@ (#t0)", buf, 0x16u);

      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 100, CFSTR("Unable to find secondary profile associated with NRDeviceUUID: %@"), v7);
    }
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v8 + 2))(v8, 0, v36);

    goto LABEL_19;
  }
  _HKInitializeLogging();
  v30 = *v9;
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
  {
    v37 = v30;
    NSStringFromSelector(a2);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v53 = self;
    v54 = 2114;
    v55 = v38;
    _os_log_error_impl(&dword_1B7802000, v37, OS_LOG_TYPE_ERROR, "%{public}@ %{public}@ Health sharing pairing agent must be intialized with primary profile health store.", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("Tear down health sharing pairing agent not initialized with primary profile health store."));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, void *))v8 + 2))(v8, 0, v24);
LABEL_20:

}

void __109__HDSecondaryDevicePairingAgentTaskServer_remote_tearDownHealthSharingWithTinkerDeviceWithNRUUID_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  id v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
  {
    v4 = v2;
    *(_DWORD *)v6 = 138543362;
    *(_QWORD *)&v6[4] = objc_opt_class();
    v5 = *(id *)&v6[4];
    _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "[sharing-setup] %{public}@ Sharing Tear Down timed out", v6, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 103, CFSTR("Operation timed out"), *(_OWORD *)v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __109__HDSecondaryDevicePairingAgentTaskServer_remote_tearDownHealthSharingWithTinkerDeviceWithNRUUID_completion___block_invoke_219(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v6 + 56))
  {
    -[HDSecondaryDevicePairingAgentTaskServer _cancelTaskTimeout](v6);
    if (a2)
    {
      objc_msgSend(*(id *)(a1 + 32), "profile");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "daemon");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "profileManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "profileIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 0;
      objc_msgSend(v9, "deleteProfile:error:", v10, &v12);
      v11 = v12;

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
  }

}

- (void)remote_fetchSharingStatusWithPairedGuardianWithCompletion:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;

  v5 = a3;
  -[HDStandardTaskServer profile](self, "profile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "daemon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "behavior");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isAppleWatch");

  if ((v9 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDSecondaryDevicePairingAgentTaskServer.m"), 362, CFSTR("%@ must be called from a watch."), v15);

  }
  -[HDStandardTaskServer profile](self, "profile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cloudSyncManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __101__HDSecondaryDevicePairingAgentTaskServer_remote_fetchSharingStatusWithPairedGuardianWithCompletion___block_invoke;
  v16[3] = &unk_1E6CF28F8;
  v16[4] = self;
  v17 = v5;
  v12 = v5;
  v13 = (id)objc_msgSend(v11, "fetchShareParticipantsForSharingType:completion:", 1, v16);

}

void __101__HDSecondaryDevicePairingAgentTaskServer_remote_fetchSharingStatusWithPairedGuardianWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "profile");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v6;
    objc_msgSend(v7, "pairedGuardianParticipantWithError:", &v17);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v17;

    if (v8)
    {
      (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(v5, "containsObject:", v8), 0);
    }
    else
    {
      _HKInitializeLogging();
      v11 = (void *)*MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        v14 = v11;
        v15 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v19 = v15;
        v20 = 2114;
        v21 = v9;
        v16 = v15;
        _os_log_error_impl(&dword_1B7802000, v14, OS_LOG_TYPE_ERROR, "[sharing-setup] %{public}@ Failed to fetch persisted paired Guardian participant from key value store, error: %{public}@", buf, 0x16u);

      }
      (*(void (**)(_QWORD, _QWORD, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, v9);
    }

    v6 = v9;
  }
  else
  {
    _HKInitializeLogging();
    v10 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v12 = v10;
      *(_DWORD *)buf = 138543618;
      v19 = (id)objc_opt_class();
      v20 = 2114;
      v21 = v6;
      v13 = v19;
      _os_log_error_impl(&dword_1B7802000, v12, OS_LOG_TYPE_ERROR, "[sharing-setup] %{public}@ Failed to fetch participants from cloud zones, error: %{public}@", buf, 0x16u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)remote_fetchSharingStatusForCurrentAppleIDWithOwnerEmailAddress:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  v7 = a4;
  -[HDStandardTaskServer profile](self, "profile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cloudSyncManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __118__HDSecondaryDevicePairingAgentTaskServer_remote_fetchSharingStatusForCurrentAppleIDWithOwnerEmailAddress_completion___block_invoke;
  v12[3] = &unk_1E6CE77F0;
  v13 = v7;
  v10 = v7;
  v11 = (id)objc_msgSend(v9, "fetchSharingStatusForCurrentAppleIDWithOwnerEmailAddress:completion:", v6, v12);

}

uint64_t __118__HDSecondaryDevicePairingAgentTaskServer_remote_fetchSharingStatusForCurrentAppleIDWithOwnerEmailAddress_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __79__HDSecondaryDevicePairingAgentTaskServer__scheduleTaskTimeout_timeoutHandler___block_invoke(uint64_t a1)
{
  void (**v2)(_QWORD);
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  id WeakRetained;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = (void (**)(_QWORD))*(id *)(a1 + 32);
  if (WeakRetained)
  {
    *((_BYTE *)WeakRetained + 56) = 1;
    _HKInitializeLogging();
    v3 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v6 = v3;
      *(_DWORD *)buf = 138543362;
      v10 = (id)objc_opt_class();
      v7 = v10;
      _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "[sharing-setup] %{public}@ Operation timed out", buf, 0xCu);

    }
    v4 = _Block_copy(*((const void **)WeakRetained + 10));
    v5 = v4;
    if (v4)
      (*((void (**)(void *))v4 + 2))(v4);
    v2[2](v2);

  }
}

void __80__HDSecondaryDevicePairingAgentTaskServer__prepareGuardianForSharingForRequest___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "profile");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cloudSyncManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __80__HDSecondaryDevicePairingAgentTaskServer__prepareGuardianForSharingForRequest___block_invoke_231;
    v12[3] = &unk_1E6CF2968;
    v8 = *(void **)(a1 + 40);
    v12[4] = *(_QWORD *)(a1 + 32);
    v13 = v8;
    objc_msgSend(v7, "fetchCloudKitAccountInfoWithCompletion:", v12);

  }
  else
  {
    _HKInitializeLogging();
    v9 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v10 = v9;
      *(_DWORD *)buf = 138543618;
      v15 = (id)objc_opt_class();
      v16 = 2114;
      v17 = v5;
      v11 = v15;
      _os_log_error_impl(&dword_1B7802000, v10, OS_LOG_TYPE_ERROR, "[sharing-setup] %{public}@: Failed to prepare for sharing during setup: %{public}@ (#t0)", buf, 0x16u);

    }
    -[HDSecondaryDevicePairingAgentTaskServer _finishWithSuccess:error:](*(_QWORD *)(a1 + 32), 0, v5);
  }

}

void __80__HDSecondaryDevicePairingAgentTaskServer__prepareGuardianForSharingForRequest___block_invoke_231(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  os_log_t *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  const char *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  os_log_t v19;
  NSObject *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  HDCodableTinkerPairingRequest *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  NSObject *v38;
  id v39;
  void *v40;
  _BYTE buf[24];
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _HKInitializeLogging();
  v7 = (os_log_t *)MEMORY[0x1E0CB5370];
  v8 = (void *)*MEMORY[0x1E0CB5370];
  v9 = *MEMORY[0x1E0CB5370];
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v38 = v8;
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = objc_opt_class();
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v6;
      v39 = *(id *)&buf[4];
      _os_log_error_impl(&dword_1B7802000, v38, OS_LOG_TYPE_ERROR, "[sharing-setup] %{public}@: Unable to fetch iCloud ID with error: %{public}@ (#t0)", buf, 0x16u);

    }
    -[HDSecondaryDevicePairingAgentTaskServer _finishWithSuccess:error:](*(_QWORD *)(a1 + 32), 0, v6);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v8;
      v11 = (void *)objc_opt_class();
      v12 = v11;
      objc_msgSend(v5, "emailAddress");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543619;
      *(_QWORD *)&buf[4] = v11;
      *(_WORD *)&buf[12] = 2113;
      *(_QWORD *)&buf[14] = v13;
      _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@: Fetched icloud address for guardian: %{private}@ (#t0)", buf, 0x16u);

    }
    objc_msgSend(v5, "emailAddress");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(void **)(a1 + 40);
    if (v16)
      objc_setProperty_nonatomic_copy(v16, v14, v15, 64);

    v17 = *(void **)(a1 + 32);
    v18 = *(id *)(a1 + 40);
    if (v17)
    {
      _HKInitializeLogging();
      v19 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
      {
        v20 = v19;
        v21 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v21;
        v22 = v21;
        _os_log_impl(&dword_1B7802000, v20, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@ Preparing to send message to Tinker watch (#t0)", buf, 0xCu);

      }
      if (v18)
        *((_QWORD *)v18 + 6) = 3;
      objc_msgSend(v17, "profile");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "daemon");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "primaryProfile");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "nanoSyncManager");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        v26 = objc_alloc_init(HDCodableTinkerPairingRequest);
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "UUIDString");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDCodableTinkerPairingRequest setRequestIdentifier:](v26, "setRequestIdentifier:", v28);

        -[HDCodableTinkerPairingRequest setSetupType:](v26, "setSetupType:", objc_msgSend(*((id *)v18 + 4), "setupType"));
        -[HDCodableTinkerPairingRequest setGuardianIcloudIdentifier:](v26, "setGuardianIcloudIdentifier:", *((_QWORD *)v18 + 8));
        objc_msgSend(*((id *)v18 + 4), "guardianFirstName");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDCodableTinkerPairingRequest setGuardianFirstName:](v26, "setGuardianFirstName:", v29);

        objc_msgSend(*((id *)v18 + 4), "guardianLastName");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDCodableTinkerPairingRequest setGuardianLastName:](v26, "setGuardianLastName:", v30);

        objc_msgSend(*((id *)v18 + 4), "guardianDSID");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDCodableTinkerPairingRequest setGuardianDSID:](v26, "setGuardianDSID:", objc_msgSend(v31, "longLongValue"));

        objc_msgSend(*((id *)v18 + 4), "firstName");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDCodableTinkerPairingRequest setTinkerFirstName:](v26, "setTinkerFirstName:", v32);

        objc_msgSend(*((id *)v18 + 4), "lastName");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDCodableTinkerPairingRequest setTinkerLastName:](v26, "setTinkerLastName:", v33);

        v34 = (void *)*((_QWORD *)v18 + 4);
      }
      else
      {
        v26 = 0;
        v34 = 0;
      }
      v35 = v34;
      objc_msgSend(v35, "nanoRegistryDeviceUUID");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __77__HDSecondaryDevicePairingAgentTaskServer__sendSharingRequestToTinkerDevice___block_invoke;
      v42 = &unk_1E6CF2990;
      v43 = v17;
      v37 = v18;

      v44 = v37;
      objc_msgSend(v25, "sendTinkerWatchPairingRequest:forNRDeviceUUID:completion:", v26, v36, buf);

    }
  }

}

void __77__HDSecondaryDevicePairingAgentTaskServer__sendSharingRequestToTinkerDevice___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD *v18;
  id v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  id v29;
  id v30;
  _BYTE buf[24];
  void *v32;
  void *v33;
  _QWORD *v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = v6;
LABEL_3:
    -[HDSecondaryDevicePairingAgentTaskServer _finishWithSuccess:error:](v7, 0, v8);
    goto LABEL_4;
  }
  if (!v5)
  {
    _HKInitializeLogging();
    v12 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      v13 = v12;
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = objc_opt_class();
      v14 = *(id *)&buf[4];
      _os_log_impl(&dword_1B7802000, v13, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@ Tinker health sharing is disabled (#t0)", buf, 0xCu);

    }
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 0;
    goto LABEL_3;
  }
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 56))
  {
    _HKInitializeLogging();
    v9 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = objc_opt_class();
      v11 = *(id *)&buf[4];
      _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@ We received a response from the tinker watch but the request has timed out.(#t0)", buf, 0xCu);

    }
  }
  else
  {
    v30 = 0;
    +[HDCloudSyncShareSetupMetadata cloudSyncShareSetupMetadataWithCodableSharingSetupMetadata:error:](HDCloudSyncShareSetupMetadata, "cloudSyncShareSetupMetadataWithCodableSharingSetupMetadata:error:", v5, &v30);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v30;
    if (v15)
    {
      v17 = *(void **)(a1 + 32);
      v18 = *(id *)(a1 + 40);
      v19 = v15;
      if (v17)
      {
        _HKInitializeLogging();
        v20 = (void *)*MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
        {
          v21 = v20;
          v22 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543619;
          *(_QWORD *)&buf[4] = v22;
          *(_WORD *)&buf[12] = 2113;
          *(_QWORD *)&buf[14] = v19;
          v23 = v22;
          _os_log_impl(&dword_1B7802000, v21, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@ Accept shares with %{private}@ (#t0)", buf, 0x16u);

        }
        if (v18)
          v18[6] = 4;
        objc_msgSend(v17, "profile");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "cloudSyncManager");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __77__HDSecondaryDevicePairingAgentTaskServer__acceptSharingForRequest_metadata___block_invoke;
        v32 = &unk_1E6CF29B8;
        v33 = v17;
        v34 = v18;
        v35 = v19;
        objc_msgSend(v25, "acceptShare:completion:", v35, buf);

      }
    }
    else
    {
      _HKInitializeLogging();
      v26 = (void *)*MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
      {
        v27 = v26;
        v28 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v28;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v16;
        v29 = v28;
        _os_log_impl(&dword_1B7802000, v27, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@: Failed to decode share setup metadata: %{public}@", buf, 0x16u);

      }
      -[HDSecondaryDevicePairingAgentTaskServer _finishWithSuccess:error:](*(_QWORD *)(a1 + 32), 0, v16);
    }

  }
LABEL_4:

}

void __77__HDSecondaryDevicePairingAgentTaskServer__acceptSharingForRequest_metadata___block_invoke(uint64_t *a1, void *a2, void *a3)
{
  id v5;
  _QWORD *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  BOOL v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  NSObject *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  NSObject *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  id v55;
  void *v56;
  id v57;
  id v58;
  void *v59;
  uint64_t v60;
  void *v61;
  id v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  void *v77;
  void *v78;
  id v79;
  void *v80;
  id v81;
  BOOL v82;
  void *v83;
  NSObject *v84;
  void *v85;
  id v86;
  id v87;
  void *v88;
  void *v89;
  id v90;
  void *v91;
  id v92;
  id *v93;
  void *v94;
  uint64_t v95;
  NSObject *v96;
  void *v97;
  id v98;
  id v99;
  void *v100;
  id v101;
  void *v102;
  id v103;
  NSObject *v104;
  NSObject *v105;
  id v106;
  id v107;
  uint64_t v108;
  void *v109;
  __CFString *v110;
  __CFString *v111;
  void *v112;
  void *v113;
  void *v114;
  uint64_t v115;
  void *v116;
  void *v117;
  void *v118;
  id v119;
  id v120;
  void *v121;
  void *v122;
  id v123;
  id v124;
  void *v125;
  void *v126;
  id v127;
  void *v128;
  id v129;
  NSObject *v130;
  void *v131;
  id v132;
  void *v133;
  id v134;
  void *v135;
  id v136;
  void *v137;
  id v138;
  id v139;
  NSObject *v140;
  void *v141;
  uint64_t v142;
  void *v143;
  NSObject *v144;
  void *v145;
  id v146;
  void *v147;
  void *v148;
  id v149;
  id v150;
  void *v151;
  void *v152;
  id v153;
  void *v154;
  NSObject *v155;
  void *v156;
  id v157;
  NSObject *v158;
  void *v159;
  id v160;
  void *v161;
  void *v162;
  uint64_t *v163;
  id v164;
  id *v165;
  id v166;
  id v167;
  id v168;
  void *v169;
  id v170;
  void *v171;
  id v172;
  void *v173;
  id v174;
  void *v175;
  id v176;
  id v177;
  id v178;
  uint64_t v179;
  char v180;
  id v181;
  void *v182;
  void *v183;
  id v184;
  void *v185;
  id v186;
  uint64_t v187;
  void *v188;
  uint64_t v189;
  id v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  id v195;
  _BYTE buf[12];
  __int16 v197;
  void *v198;
  __int16 v199;
  id v200;
  _BYTE v201[24];
  void *v202;
  __int128 v203;
  uint64_t v204;

  v204 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!v5)
  {
    -[HDSecondaryDevicePairingAgentTaskServer _finishWithSuccess:error:](a1[4], 0, a3);
    goto LABEL_113;
  }
  v6 = (_QWORD *)a1[5];
  if (v6)
  {
    v6[6] = 5;
    v6 = (_QWORD *)a1[5];
  }
  v163 = a1;
  v7 = (void *)a1[6];
  v8 = (id)a1[4];
  v165 = v6;
  v9 = v7;
  v164 = v5;
  v162 = v9;
  if (!v8)
  {
    v57 = 0;
    goto LABEL_54;
  }
  v190 = 0;
  v10 = v9;
  objc_msgSend(v5, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "owner");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v171 = v8;
  objc_msgSend(v8, "profile");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "daemon");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "profileManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v193 = 0u;
  v194 = 0u;
  v191 = 0u;
  v192 = 0u;
  objc_msgSend(v15, "allProfileIdentifiers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v191, v201, 16);
  if (!v17)
  {
    v8 = 0;
    goto LABEL_45;
  }
  v18 = v17;
  v19 = *(_QWORD *)v192;
  v177 = v10;
  v179 = *(_QWORD *)v192;
  v173 = v16;
  v175 = v15;
LABEL_7:
  v20 = 0;
  v187 = v18;
  while (1)
  {
    if (*(_QWORD *)v192 != v19)
      objc_enumerationMutation(v16);
    v21 = *(void **)(*((_QWORD *)&v191 + 1) + 8 * v20);
    if (objc_msgSend(v21, "type") != 3)
      goto LABEL_26;
    objc_msgSend(v15, "profileForIdentifier:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
      break;
    _HKInitializeLogging();
    v37 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      v38 = v37;
      v39 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v39;
      v197 = 2114;
      v198 = v21;
      v40 = v39;
      _os_log_impl(&dword_1B7802000, v38, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@: Profile %{public}@ deleted during iteration; skipping.",
        buf,
        0x16u);
LABEL_23:

      v19 = v179;
    }
LABEL_25:

    v18 = v187;
LABEL_26:
    if (v18 == ++v20)
    {
      v43 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v191, v201, 16);
      v18 = v43;
      if (!v43)
      {
        v8 = 0;
        v5 = v164;
        goto LABEL_45;
      }
      goto LABEL_7;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _HKInitializeLogging();
    v41 = (void *)*MEMORY[0x1E0CB5370];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_FAULT))
      goto LABEL_25;
    v38 = v41;
    v42 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v42;
    v197 = 2114;
    v198 = v22;
    v40 = v42;
    _os_log_fault_impl(&dword_1B7802000, v38, OS_LOG_TYPE_FAULT, "[sharing-setup] %{public}@: Profile %{public}@ is not actually a Tinker profile; skipping.",
      buf,
      0x16u);
    goto LABEL_23;
  }
  v185 = v22;
  objc_msgSend(v22, "cloudSyncManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v195 = 0;
  objc_msgSend(v23, "shareOwnerParticipantWithError:", &v195);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v195;

  if (v24)
    v26 = 1;
  else
    v26 = v25 == 0;
  if (!v26)
  {
    _HKInitializeLogging();
    v44 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      v46 = v44;
      v47 = (void *)objc_opt_class();
      v48 = v47;
      objc_msgSend(v185, "profileIdentifier");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v47;
      v197 = 2114;
      v198 = v49;
      v199 = 2114;
      v200 = v25;
      _os_log_impl(&dword_1B7802000, v46, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@: Failed to lookup owner participant at existing tinker profile %{public}@: %{public}@", buf, 0x20u);

    }
    v8 = 0;
    v190 = objc_retainAutorelease(v25);
    goto LABEL_43;
  }
  objc_msgSend(v10, "profileIdentifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "isEqual:", v21);

  if (!v28)
  {
    v182 = v25;
    objc_msgSend(v24, "userIdentity");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "userRecordID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "recordName");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v12;
    objc_msgSend(v12, "userIdentity");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "userRecordID");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "recordName");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v31, "isEqual:", v35);

    if (v36)
    {
      v53 = v185;
      v8 = v185;

      v5 = v164;
      v15 = v175;
      v10 = v177;
      v12 = v32;
      v16 = v173;
      v25 = v182;
      goto LABEL_44;
    }

    v15 = v175;
    v10 = v177;
    v12 = v32;
    v16 = v173;
    v22 = v185;
    v19 = v179;
    goto LABEL_25;
  }
  if (!v12)
    goto LABEL_38;
  objc_msgSend(v24, "userIdentity");
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v188, "userRecordID");
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v183, "recordName");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "userIdentity");
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v169, "userRecordID");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "recordName");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v180 = objc_msgSend(v50, "isEqual:", v52);

  if ((v180 & 1) != 0)
  {
LABEL_38:
    v53 = v185;
    v8 = v185;

    v5 = v164;
    goto LABEL_44;
  }
  _HKInitializeLogging();
  v54 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v171;
    v197 = 2114;
    v198 = v24;
    v199 = 2114;
    v200 = v12;
    _os_log_fault_impl(&dword_1B7802000, v54, OS_LOG_TYPE_FAULT, "%{public}@: Existing profile identifier has an owner (%{public}@) which does not match the incoming owner (%{public}@)", buf, 0x20u);
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", &v190, 721, CFSTR("Existing profile identifier has an owner (%@) which does not match the incoming owner (%@)"), v24, v12, v162);

  v8 = 0;
LABEL_43:
  v5 = v164;
  v53 = v185;
LABEL_44:

LABEL_45:
  v55 = v190;
  v56 = v55;
  if (v8)
  {
    v57 = 0;
    goto LABEL_47;
  }
  if (v55)
  {
    v57 = objc_retainAutorelease(v55);
    v8 = 0;
  }
  else
  {
    v106 = v5;
    if (v165)
      v107 = v165[4];
    else
      v107 = 0;
    objc_msgSend(v107, "firstName");
    v108 = objc_claimAutoreleasedReturnValue();
    v109 = (void *)v108;
    v110 = CFSTR("Health Jr");
    if (v108)
      v110 = (__CFString *)v108;
    v111 = v110;
    objc_msgSend(v10, "profileIdentifier");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v112, "type") != 3)
    {
      v113 = (void *)MEMORY[0x1E0CB6A10];
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v113, "_profileWithUUID:type:", v114, 3);
      v115 = objc_claimAutoreleasedReturnValue();

      v112 = (void *)v115;
    }
    objc_msgSend(v171, "profile");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "daemon");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "profileManager");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&v191 = 0;
    objc_msgSend(v118, "createProfileForIdentifier:firstName:lastName:error:", v112, v111, 0, &v191);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    v119 = (id)v191;
    if (v8)
    {
      v120 = v8;
      v57 = 0;
      v5 = v106;
    }
    else
    {
      _HKInitializeLogging();
      v137 = (void *)*MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        v158 = v137;
        v159 = (void *)objc_opt_class();
        *(_DWORD *)v201 = 138543874;
        *(_QWORD *)&v201[4] = v159;
        *(_WORD *)&v201[12] = 2114;
        *(_QWORD *)&v201[14] = v112;
        *(_WORD *)&v201[22] = 2114;
        v202 = v119;
        v160 = v159;
        _os_log_error_impl(&dword_1B7802000, v158, OS_LOG_TYPE_ERROR, "[sharing-setup] %{public}@: Failed to create profile %{public}@ with error: %{public}@ (#t0)", v201, 0x20u);

      }
      v138 = v119;
      v57 = v138;
      v5 = v106;
      if (v138)
        v139 = objc_retainAutorelease(v138);

    }
    if (v8)
    {
LABEL_47:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v161 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v161, "handleFailureInMethod:object:file:lineNumber:description:", sel__lookupOrCreateTinkerProfileForRequest_metadata_acceptedShares_error_, v171, CFSTR("HDSecondaryDevicePairingAgentTaskServer.m"), 683, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[tinkerProfile isKindOfClass:HDTinkerProfile.class]"));

      }
      if (v165)
        objc_storeStrong(v165 + 7, v8);
    }
  }

LABEL_54:
  v58 = v57;
  v59 = v58;
  v60 = v163[4];
  if (v8)
  {
    v178 = v58;
    v61 = (void *)v163[6];
    v62 = (id)v163[5];
    v186 = v61;
    v184 = v5;
    if (v60)
    {
      if (v62)
      {
        *((_QWORD *)v62 + 6) = 6;
        v63 = *((id *)v62 + 7);
        v64 = (void *)*((_QWORD *)v62 + 4);
      }
      else
      {
        v63 = 0;
        v64 = 0;
      }
      v176 = v64;
      objc_msgSend(v176, "dateOfBirth");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      if (v62)
        v66 = (void *)*((_QWORD *)v62 + 4);
      else
        v66 = 0;
      v174 = v66;
      objc_msgSend(v174, "firstName");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v189 = v60;
      if (v62)
        v68 = (void *)*((_QWORD *)v62 + 4);
      else
        v68 = 0;
      v172 = v68;
      objc_msgSend(v172, "lastName");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      if (v62)
        v70 = (void *)*((_QWORD *)v62 + 4);
      else
        v70 = 0;
      v170 = v70;
      objc_msgSend(v170, "dsid");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = v63;
      v73 = v65;
      v74 = v67;
      v75 = v69;
      v76 = v71;
      v181 = v8;
      if (v73)
      {
        objc_msgSend(MEMORY[0x1E0CB6390], "characteristicTypeForIdentifier:", *MEMORY[0x1E0CB49D0]);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "userCharacteristicsManager");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)&v191 = 0;
        objc_msgSend(v78, "setUserCharacteristic:forType:error:", v73, v77, &v191);
        v79 = (id)v191;

        if (v79)
        {
          _HKInitializeLogging();
          v80 = (void *)*MEMORY[0x1E0CB5370];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
          {
            v140 = v80;
            v141 = (void *)objc_opt_class();
            v167 = v141;
            objc_msgSend(v72, "profileIdentifier");
            v142 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v201 = 138543874;
            *(_QWORD *)&v201[4] = v141;
            *(_WORD *)&v201[12] = 2114;
            *(_QWORD *)&v201[14] = v79;
            *(_WORD *)&v201[22] = 2114;
            v202 = (void *)v142;
            v143 = (void *)v142;
            _os_log_error_impl(&dword_1B7802000, v140, OS_LOG_TYPE_ERROR, "[sharing-setup] %{public}@ Error %{public}@ saving date of birth into profile %{public}@ (#t0)", v201, 0x20u);

          }
          v81 = objc_retainAutorelease(v79);

          v82 = 0;
          goto LABEL_81;
        }

      }
      else
      {
        _HKInitializeLogging();
        v83 = (void *)*MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
        {
          v84 = v83;
          v85 = (void *)objc_opt_class();
          *(_DWORD *)v201 = 138543362;
          *(_QWORD *)&v201[4] = v85;
          v86 = v85;
          _os_log_error_impl(&dword_1B7802000, v84, OS_LOG_TYPE_ERROR, "[sharing-setup] %{public}@ Did not receive birthdate for user (#t0)", v201, 0xCu);

        }
      }
      *(_QWORD *)buf = 0;
      objc_msgSend(v72, "setDisplayFirstName:lastName:error:", v74, v75, buf);
      v87 = *(id *)buf;
      if (v87)
      {
        v88 = v87;
        _HKInitializeLogging();
        v89 = (void *)*MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
        {
          v144 = v89;
          v145 = (void *)objc_opt_class();
          *(_DWORD *)v201 = 138544130;
          *(_QWORD *)&v201[4] = v145;
          *(_WORD *)&v201[12] = 2114;
          *(_QWORD *)&v201[14] = v88;
          *(_WORD *)&v201[22] = 2114;
          v202 = v74;
          LOWORD(v203) = 2114;
          *(_QWORD *)((char *)&v203 + 2) = v75;
          v146 = v145;
          _os_log_error_impl(&dword_1B7802000, v144, OS_LOG_TYPE_ERROR, "[sharing-setup] %{public}@ Error %{public}@ saving first %{public}@ and last %{public}@ name (#t0)", v201, 0x2Au);

        }
        v81 = objc_retainAutorelease(v88);
        v82 = 0;
        v77 = v81;
      }
      else
      {
        v195 = 0;
        objc_msgSend(v72, "setDSID:error:", v76, &v195);
        v90 = v195;
        v82 = v90 == 0;
        if (v90)
        {
          _HKInitializeLogging();
          v91 = (void *)*MEMORY[0x1E0CB5370];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
          {
            v155 = v91;
            v156 = (void *)objc_opt_class();
            *(_DWORD *)v201 = 138543874;
            *(_QWORD *)&v201[4] = v156;
            *(_WORD *)&v201[12] = 2114;
            *(_QWORD *)&v201[14] = v90;
            *(_WORD *)&v201[22] = 2114;
            v202 = v76;
            v157 = v156;
            _os_log_error_impl(&dword_1B7802000, v155, OS_LOG_TYPE_ERROR, "[sharing-setup] %{public}@ Error %{public}@ saving DSID %{public}@ (#t0)", v201, 0x20u);

          }
        }

        v81 = 0;
        v77 = 0;
      }
LABEL_81:

      v92 = v81;
      if (v82)
      {
        _HKInitializeLogging();
        v93 = (id *)MEMORY[0x1E0CB5370];
        v94 = (void *)*MEMORY[0x1E0CB5370];
        v95 = v189;
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
        {
          v96 = v94;
          v97 = (void *)objc_opt_class();
          *(_DWORD *)v201 = 138543362;
          *(_QWORD *)&v201[4] = v97;
          v98 = v97;
          _os_log_impl(&dword_1B7802000, v96, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@ Profile name, DoB, DSID saved successfully (#t0)", v201, 0xCu);

        }
        if (v62)
        {
          v99 = *((id *)v62 + 7);
          v100 = (void *)*((_QWORD *)v62 + 4);
        }
        else
        {
          v99 = 0;
          v100 = 0;
        }
        v101 = v100;
        objc_msgSend(v101, "nanoRegistryDeviceUUID");
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)&v191 = 0;
        objc_msgSend(v99, "setPairedNRDeviceUUID:error:", v102, &v191);
        v103 = (id)v191;

        _HKInitializeLogging();
        v104 = *v93;
        v105 = v104;
        v8 = v181;
        if (v103)
        {
          v5 = v164;
          if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
          {
            v147 = (void *)objc_opt_class();
            if (v62)
              v148 = (void *)*((_QWORD *)v62 + 7);
            else
              v148 = 0;
            v149 = v148;
            v150 = v147;
            objc_msgSend(v149, "profileIdentifier");
            v151 = (void *)objc_claimAutoreleasedReturnValue();
            v168 = v92;
            if (v62)
              v152 = (void *)*((_QWORD *)v62 + 4);
            else
              v152 = 0;
            v153 = v152;
            objc_msgSend(v153, "nanoRegistryDeviceUUID");
            v154 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v201 = 138544130;
            *(_QWORD *)&v201[4] = v147;
            *(_WORD *)&v201[12] = 2114;
            *(_QWORD *)&v201[14] = v151;
            *(_WORD *)&v201[22] = 2114;
            v202 = v154;
            LOWORD(v203) = 2114;
            *(_QWORD *)((char *)&v203 + 2) = v103;
            _os_log_error_impl(&dword_1B7802000, v105, OS_LOG_TYPE_ERROR, "[sharing-setup] %{public}@: Failed to associate profile (%{public}@) with NRDeviceUUID: (%{public}@) error: %{public}@ (#t0)", v201, 0x2Au);

            v5 = v164;
            v8 = v181;
            v95 = v189;
            v92 = v168;
          }

          -[HDSecondaryDevicePairingAgentTaskServer _finishWithSuccess:error:](v95, 0, v92);
        }
        else
        {
          if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
          {
            v121 = (void *)objc_opt_class();
            if (v62)
              v122 = (void *)*((_QWORD *)v62 + 4);
            else
              v122 = 0;
            v123 = v122;
            v124 = v121;
            objc_msgSend(v123, "nanoRegistryDeviceUUID");
            v125 = (void *)objc_claimAutoreleasedReturnValue();
            v166 = v92;
            if (v62)
              v126 = (void *)*((_QWORD *)v62 + 7);
            else
              v126 = 0;
            v127 = v126;
            objc_msgSend(v127, "profileIdentifier");
            v128 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v201 = 138543874;
            *(_QWORD *)&v201[4] = v121;
            *(_WORD *)&v201[12] = 2114;
            *(_QWORD *)&v201[14] = v125;
            *(_WORD *)&v201[22] = 2114;
            v202 = v128;
            _os_log_impl(&dword_1B7802000, v105, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@ Device %{public}@ associated successfully with profile %{public}@ (#t0)", v201, 0x20u);

            v95 = v189;
            v92 = v166;
            v93 = (id *)MEMORY[0x1E0CB5370];
          }

          _HKInitializeLogging();
          v129 = *v93;
          if (os_log_type_enabled((os_log_t)*v93, OS_LOG_TYPE_DEFAULT))
          {
            v130 = v129;
            v131 = (void *)objc_opt_class();
            *(_DWORD *)v201 = 138543362;
            *(_QWORD *)&v201[4] = v131;
            v132 = v131;
            _os_log_impl(&dword_1B7802000, v130, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@ Configuring profile for share setup metadata (#t0)", v201, 0xCu);

          }
          if (v62)
            v133 = (void *)*((_QWORD *)v62 + 7);
          else
            v133 = 0;
          v134 = v133;
          objc_msgSend(v134, "cloudSyncManager");
          v135 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)v201 = MEMORY[0x1E0C809B0];
          *(_QWORD *)&v201[8] = 3221225472;
          *(_QWORD *)&v201[16] = __97__HDSecondaryDevicePairingAgentTaskServer__setupTinkerProfileForRequest_metadata_acceptedShares___block_invoke;
          v202 = &unk_1E6CEB718;
          *(_QWORD *)&v203 = v95;
          v136 = v62;

          *((_QWORD *)&v203 + 1) = v136;
          objc_msgSend(v135, "configureForShareSetupMetadata:acceptedShares:completion:", v186, v184, v201);

          v5 = v164;
        }

      }
      else
      {
        -[HDSecondaryDevicePairingAgentTaskServer _finishWithSuccess:error:](v189, 0, v92);
        v5 = v164;
        v8 = v181;
      }

    }
    v59 = v178;
  }
  else
  {
    -[HDSecondaryDevicePairingAgentTaskServer _finishWithSuccess:error:](v163[4], 0, v58);
  }

LABEL_113:
}

void __97__HDSecondaryDevicePairingAgentTaskServer__setupTinkerProfileForRequest_metadata_acceptedShares___block_invoke(uint64_t a1, char a2, void *a3)
{
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD *v7;
  _QWORD *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[5];
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if ((a2 & 1) != 0)
  {
    _HKInitializeLogging();
    v4 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      v5 = v4;
      *(_DWORD *)buf = 138543362;
      v13 = (id)objc_opt_class();
      v6 = v13;
      _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@ Subscribing to data available notifications (#t0)", buf, 0xCu);

    }
    v7 = *(_QWORD **)(a1 + 40);
    if (v7)
      v7 = (_QWORD *)v7[7];
    v8 = v7;
    objc_msgSend(v8, "cloudSyncManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __97__HDSecondaryDevicePairingAgentTaskServer__setupTinkerProfileForRequest_metadata_acceptedShares___block_invoke_238;
    v11[3] = &unk_1E6CE77C8;
    v10 = *(_QWORD *)(a1 + 32);

    v11[4] = v10;
    objc_msgSend(v9, "subscribeToDataAvailableNotificationsWithCompletion:", v11);

    -[HDSecondaryDevicePairingAgentTaskServer _finishWithSuccess:error:](*(_QWORD *)(a1 + 32), 1, 0);
  }
  else
  {
    -[HDSecondaryDevicePairingAgentTaskServer _finishWithSuccess:error:](*(_QWORD *)(a1 + 32), 0, a3);
  }
}

void __97__HDSecondaryDevicePairingAgentTaskServer__setupTinkerProfileForRequest_metadata_acceptedShares___block_invoke_238(uint64_t a1, char a2, void *a3)
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v5 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_FAULT))
    {
      v6 = v5;
      v8 = 138543618;
      v9 = (id)objc_opt_class();
      v10 = 2114;
      v11 = v4;
      v7 = v9;
      _os_log_fault_impl(&dword_1B7802000, v6, OS_LOG_TYPE_FAULT, "[sharing-setup] %{public}@: Failed to set up subscriptions: %{public}@ (#t0)", (uint8_t *)&v8, 0x16u);

    }
  }

}

- (double)tinkerSharingSetupTimeout
{
  return self->_tinkerSharingSetupTimeout;
}

- (void)setTinkerSharingSetupTimeout:(double)a3
{
  self->_tinkerSharingSetupTimeout = a3;
}

- (id)unitTest_timeoutTriggered
{
  return objc_getProperty(self, a2, 80, 1);
}

- (void)setUnitTest_timeoutTriggered:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTest_timeoutTriggered, 0);
  objc_storeStrong((id *)&self->_currentRequest, 0);
  objc_storeStrong((id *)&self->_timeoutSource, 0);
}

@end

@implementation HDCloudSyncOperation

- (id)asPipelineStage
{
  return -[HDCloudSyncOperationPipelineStage initWithOperation:]([HDCloudSyncOperationPipelineStage alloc], "initWithOperation:", self);
}

+ (int64_t)progressCount
{
  return 1;
}

+ (BOOL)shouldFailOnXPCActivityDeferral
{
  return 1;
}

+ (BOOL)shouldLogAtOperationStart
{
  return 1;
}

+ (BOOL)shouldLogAtOperationEnd
{
  return 1;
}

+ (BOOL)shouldProduceOperationAnalytics
{
  return 1;
}

+ (id)finishedOperationTags
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (id)operationTagDependencies
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (HDCloudSyncOperation)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HDCloudSyncOperation)initWithConfiguration:(id)a3 cloudState:(id)a4
{
  id v7;
  id v8;
  HDCloudSyncOperation *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  HDProfile *profile;
  uint64_t v14;
  NSProgress *progress;
  uint64_t v16;
  NSUUID *identifier;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_class *v24;
  id v25;
  id v26;
  void *v27;
  uint64_t v28;
  NSString *loggingPrefix;
  id v31;
  objc_super v32;

  v7 = a3;
  v8 = a4;
  v32.receiver = self;
  v32.super_class = (Class)HDCloudSyncOperation;
  v9 = -[HDCloudSyncOperation init](&v32, sel_init);
  if (v9)
  {
    objc_msgSend(v7, "repository");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "profile");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "legacyRepositoryProfile");
    v12 = objc_claimAutoreleasedReturnValue();
    profile = v9->_profile;
    v9->_profile = (HDProfile *)v12;

    objc_storeStrong((id *)&v9->_configuration, a3);
    objc_storeStrong((id *)&v9->_cloudState, a4);
    objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", objc_msgSend((id)objc_opt_class(), "progressCount"));
    v14 = objc_claimAutoreleasedReturnValue();
    progress = v9->_progress;
    v9->_progress = (NSProgress *)v14;

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v16 = objc_claimAutoreleasedReturnValue();
    identifier = v9->_identifier;
    v9->_identifier = (NSUUID *)v16;

    v31 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[HDCloudSyncOperationConfiguration shortSyncIdentifier](v9->_configuration, "shortSyncIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSUUID UUIDString](v9->_identifier, "UUIDString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "substringToIndex:", 4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncOperationConfiguration shortProfileIdentifier](v9->_configuration, "shortProfileIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncOperationConfiguration repository](v9->_configuration, "repository");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "profileType");
    HKStringFromProfileType();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    v25 = v7;
    v26 = v8;
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v31, "initWithFormat:", CFSTR("[%@:%@] [%@:%@] %@"), v18, v20, v21, v23, v27);
    loggingPrefix = v9->_loggingPrefix;
    v9->_loggingPrefix = (NSString *)v28;

    v8 = v26;
    v7 = v25;

  }
  return v9;
}

- (HDCloudSyncOperation)initWithPreceedingOperation:(id)a3 transitionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HDCloudSyncOperation *v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HDCloudSyncOperation initWithConfiguration:cloudState:](self, "initWithConfiguration:cloudState:", v8, 0);

  -[HDCloudSyncOperation chainFromOperation:transitionHandler:](v9, "chainFromOperation:transitionHandler:", v7, v6);
  return v9;
}

- (void)setOnSuccess:(id)a3
{
  void *v5;
  id onSuccess;
  void *v7;
  id v8;

  v8 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_status)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDCloudSyncOperation.m"), 101, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_status == HDCloudSyncOperationStatusPending"));

  }
  v5 = (void *)objc_msgSend(v8, "copy");
  onSuccess = self->_onSuccess;
  self->_onSuccess = v5;

  os_unfair_lock_unlock(&self->_lock);
}

- (id)onSuccess
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = _Block_copy(self->_onSuccess);
  os_unfair_lock_unlock(p_lock);
  v5 = _Block_copy(v4);

  return v5;
}

- (void)setOnError:(id)a3
{
  void *v5;
  id onError;
  void *v7;
  id v8;

  v8 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_status)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDCloudSyncOperation.m"), 117, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_status == HDCloudSyncOperationStatusPending"));

  }
  v5 = (void *)objc_msgSend(v8, "copy");
  onError = self->_onError;
  self->_onError = v5;

  os_unfair_lock_unlock(&self->_lock);
}

- (id)onError
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = _Block_copy(self->_onError);
  os_unfair_lock_unlock(p_lock);
  v5 = _Block_copy(v4);

  return v5;
}

- (void)chainFromOperation:(id)a3 transitionHandler:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];

  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __61__HDCloudSyncOperation_chainFromOperation_transitionHandler___block_invoke;
  v12[3] = &unk_1E6CE77A0;
  v12[4] = self;
  v8 = a3;
  objc_msgSend(v8, "setOnError:", v12);
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __61__HDCloudSyncOperation_chainFromOperation_transitionHandler___block_invoke_2;
  v10[3] = &unk_1E6CEB6F0;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "setOnSuccess:", v10);

}

void __61__HDCloudSyncOperation_chainFromOperation_transitionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  void (**v7)(id, id, id);

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  v6 = a2;
  objc_msgSend(v4, "onError");
  v7 = (void (**)(id, id, id))objc_claimAutoreleasedReturnValue();
  v7[2](v7, v6, v5);

}

void __61__HDCloudSyncOperation_chainFromOperation_transitionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "cloudState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setCloudState:", v3);

  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(uint64_t, id, _QWORD))(v4 + 16))(v4, v5, *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "start");

}

- (void)start
{
  os_unfair_lock_s *p_lock;
  HDCloudSyncOperationConfiguration *configuration;
  void *v6;
  BOOL v7;
  id v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  const __CFString *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[5];
  id v36;
  uint8_t buf[4];
  HDCloudSyncOperation *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_onSuccess)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDCloudSyncOperation.m"), 149, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_onSuccess != nil"));

  }
  if (!self->_onError)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDCloudSyncOperation.m"), 150, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_onError != nil"));

  }
  if (self->_status)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDCloudSyncOperation.m"), 151, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_status == HDCloudSyncOperationStatusPending"));

  }
  self->_status = 1;
  self->_startTime = CFAbsoluteTimeGetCurrent();
  configuration = self->_configuration;
  objc_msgSend((id)objc_opt_class(), "operationTagDependencies");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  v7 = -[HDCloudSyncOperationConfiguration satisfiesOperationTagDependencies:error:](configuration, "satisfiesOperationTagDependencies:error:", v6, &v36);
  v8 = v36;

  if (v7)
  {
    -[HDCloudSyncOperation configuration](self, "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "canceled");

    if (v10)
    {
      _HKInitializeLogging();
      v11 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v38 = self;
        _os_log_impl(&dword_1B7802000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Operation cancellation requested.", buf, 0xCu);
      }
      os_unfair_lock_unlock(p_lock);
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v13 = CFSTR("Operation cancellation requested.");
      v14 = 728;
    }
    else
    {
      if (!objc_msgSend((id)objc_opt_class(), "shouldFailOnXPCActivityDeferral"))
        goto LABEL_31;
      -[HDCloudSyncOperation configuration](self, "configuration");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "context");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "xpcActivity");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "shouldDefer");

      if (!v18)
      {
LABEL_31:
        if (objc_msgSend((id)objc_opt_class(), "shouldLogAtOperationStart"))
        {
          _HKInitializeLogging();
          v25 = *MEMORY[0x1E0CB5370];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v38 = self;
            _os_log_impl(&dword_1B7802000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: Starting.", buf, 0xCu);
          }
        }
        os_unfair_lock_unlock(p_lock);
        if (objc_msgSend((id)objc_opt_class(), "shouldProduceOperationAnalytics"))
        {
          -[HDCloudSyncOperationConfiguration repository](self->_configuration, "repository");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "profile");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "daemon");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "analyticsSubmissionCoordinator");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "cloudSync_operationStarted:", self);

        }
        objc_msgSend((id)objc_opt_class(), "unitTest_operationHandler");
        v30 = objc_claimAutoreleasedReturnValue();
        v24 = (void *)v30;
        if (v30)
        {
          v35[0] = MEMORY[0x1E0C809B0];
          v35[1] = 3221225472;
          v35[2] = __29__HDCloudSyncOperation_start__block_invoke;
          v35[3] = &unk_1E6CE77C8;
          v35[4] = self;
          (*(void (**)(uint64_t, HDCloudSyncOperation *, _QWORD *))(v30 + 16))(v30, self, v35);
        }
        else
        {
          v31 = (void *)MEMORY[0x1BCCACAC4]();
          -[HDCloudSyncOperation main](self, "main");
          objc_autoreleasePoolPop(v31);
        }
        goto LABEL_27;
      }
      _HKInitializeLogging();
      v19 = (void *)*MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
      {
        v20 = v19;
        -[HDCloudSyncOperation configuration](self, "configuration");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "context");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "xpcActivity");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v38 = self;
        v39 = 2114;
        v40 = v23;
        _os_log_impl(&dword_1B7802000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: Operation deferral requested for activity %{public}@.", buf, 0x16u);

      }
      os_unfair_lock_unlock(p_lock);
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v13 = CFSTR("Operation activity deferred.");
      v14 = 708;
    }
    objc_msgSend(v12, "hk_error:format:", v14, v13);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 0, v24);
LABEL_27:

    goto LABEL_28;
  }
  os_unfair_lock_unlock(p_lock);
  -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 0, v8);
LABEL_28:

}

uint64_t __29__HDCloudSyncOperation_start__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", a2, a3);
}

- (void)main
{
  objc_opt_class();
  NSRequestConcreteImplementation();
}

- (void)skip
{
  os_unfair_lock_s *p_lock;
  int64_t status;
  id onSuccess;
  id onError;
  id v8;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  status = self->_status;
  onSuccess = self->_onSuccess;
  self->_onSuccess = 0;

  onError = self->_onError;
  self->_onError = 0;

  os_unfair_lock_unlock(p_lock);
  if (status)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDCloudSyncOperation.m"), 215, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("status == HDCloudSyncOperationStatusPending"));

  }
}

- (void)delegateToOperation:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  _QWORD v14[5];

  v5 = a3;
  if (-[HDCloudSyncOperation status](self, "status") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDCloudSyncOperation.m"), 220, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.status == HDCloudSyncOperationStatusActive"));

  }
  v6 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __44__HDCloudSyncOperation_delegateToOperation___block_invoke;
  v14[3] = &unk_1E6CE7778;
  v14[4] = self;
  objc_msgSend(v5, "setOnSuccess:", v14);
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __44__HDCloudSyncOperation_delegateToOperation___block_invoke_2;
  v13[3] = &unk_1E6CE77A0;
  v13[4] = self;
  objc_msgSend(v5, "setOnError:", v13);
  objc_msgSend(v5, "progress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "totalUnitCount");

  -[HDCloudSyncOperation progress](self, "progress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTotalUnitCount:", objc_msgSend(v9, "totalUnitCount") + v8);

  -[HDCloudSyncOperation progress](self, "progress");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "progress");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addChild:withPendingUnitCount:", v11, v8);

  objc_msgSend(v5, "start");
}

uint64_t __44__HDCloudSyncOperation_delegateToOperation___block_invoke(uint64_t a1, void *a2)
{
  void *v3;

  objc_msgSend(a2, "cloudState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setCloudState:", v3);

  return objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", 1, 0);
}

uint64_t __44__HDCloudSyncOperation_delegateToOperation___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", 0, a3);
}

- (BOOL)finishWithSuccess:(BOOL)a3 error:(id)a4
{
  _BOOL4 v4;
  id v7;
  int64_t status;
  int64_t v9;
  void (**v10)(void *, HDCloudSyncOperation *);
  void (**v11)(void *, HDCloudSyncOperation *, id);
  id onSuccess;
  id onError;
  int64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t v45[128];
  uint8_t buf[4];
  HDCloudSyncOperation *v47;
  __int16 v48;
  id v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v4 = a3;
  v52 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  status = self->_status;
  if (status == 1)
  {
    v9 = 2;
    if (!v4)
      v9 = 3;
    self->_status = v9;
    v10 = (void (**)(void *, HDCloudSyncOperation *))_Block_copy(self->_onSuccess);
    v11 = (void (**)(void *, HDCloudSyncOperation *, id))_Block_copy(self->_onError);
    onSuccess = self->_onSuccess;
    self->_onSuccess = 0;

    onError = self->_onError;
    self->_onError = 0;

    self->_endTime = CFAbsoluteTimeGetCurrent();
    if (_HDIsUnitTesting)
    {
      v14 = -[NSProgress completedUnitCount](self->_progress, "completedUnitCount");
      if (v14 > -[NSProgress totalUnitCount](self->_progress, "totalUnitCount"))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDCloudSyncOperation.m"), 257, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_progress.completedUnitCount <= _progress.totalUnitCount"));

      }
    }
    -[NSProgress setCompletedUnitCount:](self->_progress, "setCompletedUnitCount:", -[NSProgress totalUnitCount](self->_progress, "totalUnitCount"));
    os_unfair_lock_unlock(&self->_lock);
    if (v4)
    {
      if (objc_msgSend((id)objc_opt_class(), "shouldLogAtOperationEnd"))
      {
        _HKInitializeLogging();
        v15 = *MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v47 = self;
          _os_log_impl(&dword_1B7802000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: Finished.", buf, 0xCu);
        }
      }
      if (objc_msgSend((id)objc_opt_class(), "shouldProduceOperationAnalytics"))
      {
        -[HDCloudSyncOperationConfiguration repository](self->_configuration, "repository");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "profile");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "daemon");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "analyticsSubmissionCoordinator");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "cloudSync_operationFinished:", self);

      }
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      objc_msgSend((id)objc_opt_class(), "finishedOperationTags");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v42;
        do
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v42 != v23)
              objc_enumerationMutation(v20);
            -[HDCloudSyncOperationConfiguration didFinishOperationTag:](self->_configuration, "didFinishOperationTag:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i));
          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
        }
        while (v22);
      }

      v10[2](v10, self);
    }
    else
    {
      if (!v7)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 2000, CFSTR("%@ failed without reporting an error."), self);
        v7 = (id)objc_claimAutoreleasedReturnValue();
        _HKInitializeLogging();
        v26 = *MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138543362;
          v47 = self;
          _os_log_fault_impl(&dword_1B7802000, v26, OS_LOG_TYPE_FAULT, "%{public}@: Failed but did not provide an error.", buf, 0xCu);
        }
      }
      if (objc_msgSend((id)objc_opt_class(), "shouldLogAtOperationEnd"))
      {
        _HKInitializeLogging();
        v27 = *MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v47 = self;
          v48 = 2114;
          v49 = v7;
          _os_log_impl(&dword_1B7802000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@: Failed with error: %{public}@.", buf, 0x16u);
        }
      }
      objc_msgSend(v7, "hd_errorSurfacingFatalCloudKitPartialFailureForAnalytics");
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = (void *)v28;
      if (v28)
        v30 = (void *)v28;
      else
        v30 = v7;
      v31 = v30;

      -[HDCloudSyncOperationConfiguration repository](self->_configuration, "repository");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "profile");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "daemon");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "analyticsSubmissionCoordinator");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "cloudSync_operationFailed:error:", self, v31);

      v11[2](v11, self, v7);
    }

  }
  else
  {
    _HKInitializeLogging();
    v25 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v37 = v25;
      NSStringFromSelector(a2);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      HDCloudSyncOperationStatusToString(self->_status);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v47 = self;
      v48 = 2114;
      v49 = v38;
      v50 = 2114;
      v51 = v39;
      _os_log_error_impl(&dword_1B7802000, v37, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@ called in unexpected state %{public}@", buf, 0x20u);

    }
    os_unfair_lock_unlock(&self->_lock);
  }

  return status == 1;
}

- (id)analyticsDictionary
{
  os_unfair_lock_s *p_lock;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t status;
  double endTime;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[5];
  _QWORD v19[6];

  v19[5] = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v18[0] = CFSTR("operationClass");
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v5;
  v18[1] = CFSTR("status");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_status);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v6;
  v18[2] = CFSTR("startTime");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_startTime);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v7;
  v18[3] = CFSTR("endTime");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_endTime);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v8;
  v18[4] = CFSTR("duration");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  os_unfair_lock_assert_owner(p_lock);
  status = self->_status;
  if ((unint64_t)(status - 2) < 2)
  {
    endTime = self->_endTime;
LABEL_5:
    v12 = endTime - self->_startTime;
    goto LABEL_6;
  }
  v12 = 0.0;
  if (status == 1)
  {
    endTime = CFAbsoluteTimeGetCurrent();
    goto LABEL_5;
  }
LABEL_6:
  objc_msgSend(v9, "numberWithDouble:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncOperationConfiguration analyticsDictionary](self->_configuration, "analyticsDictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "hk_dictionaryByAddingEntriesFromDictionary:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v16;
}

- (NSString)description
{
  void *v2;
  NSString *loggingPrefix;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  loggingPrefix = self->_loggingPrefix;
  HDCloudSyncOperationStatusToString(self->_status);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<%@ %@>"), loggingPrefix, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)updateCompletedProgressCount:(int64_t)a3
{
  os_unfair_lock_s *p_lock;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[HDCloudSyncOperation progress](self, "progress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "completedUnitCount");

  v9 = v8 + a3;
  if (_HDIsUnitTesting)
  {
    if (a3 < 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDCloudSyncOperation.m"), 329, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("updated >= current"));

    }
    -[HDCloudSyncOperation progress](self, "progress");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "totalUnitCount");

    if (v9 > v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDCloudSyncOperation.m"), 330, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("updated <= self.progress.totalUnitCount"));

    }
  }
  -[HDCloudSyncOperation progress](self, "progress");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCompletedUnitCount:", v9);

  os_unfair_lock_unlock(p_lock);
}

+ (id)unitTest_operationHandler
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_219);
  v3 = (void *)qword_1ED5524A8;
  NSStringFromClass((Class)a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_219);
  v6 = _Block_copy(v5);

  return v6;
}

+ (void)unitTest_setOperationHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_219);
  if (!qword_1ED5524A8)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v5 = (void *)qword_1ED5524A8;
    qword_1ED5524A8 = (uint64_t)v4;

  }
  v6 = (void *)objc_msgSend(v10, "copy");
  v7 = _Block_copy(v6);
  v8 = (void *)qword_1ED5524A8;
  NSStringFromClass((Class)a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);

  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_219);
}

+ (void)unitTest_clearAllOperationHandlers
{
  void *v2;

  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_219);
  v2 = (void *)qword_1ED5524A8;
  qword_1ED5524A8 = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_219);
}

- (HDProfile)profile
{
  return self->_profile;
}

- (HDCloudSyncOperationConfiguration)configuration
{
  return self->_configuration;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (int64_t)status
{
  return self->_status;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (HDCloudSyncCloudState)cloudState
{
  return (HDCloudSyncCloudState *)objc_getProperty(self, a2, 96, 1);
}

- (void)setCloudState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudState, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_loggingPrefix, 0);
  objc_storeStrong(&self->_onError, 0);
  objc_storeStrong(&self->_onSuccess, 0);
}

- (id)operationIgnoringErrors
{
  HDCloudSyncIgnoredErrorsOperation *v3;
  void *v4;
  void *v5;
  HDCloudSyncIgnoredErrorsOperation *v6;

  v3 = [HDCloudSyncIgnoredErrorsOperation alloc];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncOperation cloudState](self, "cloudState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HDCloudSyncIgnoredErrorsOperation initWithConfiguration:cloudState:operation:](v3, "initWithConfiguration:cloudState:operation:", v4, v5, self);

  return v6;
}

- (HDCloudSyncOperation)operationWithRunCondition:(id)a3
{
  id v4;
  HDCloudSyncConditionalOperation *v5;
  void *v6;
  void *v7;
  HDCloudSyncConditionalOperation *v8;

  v4 = a3;
  v5 = [HDCloudSyncConditionalOperation alloc];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncOperation cloudState](self, "cloudState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HDCloudSyncConditionalOperation initWithConfiguration:cloudState:operation:shouldRunHandler:](v5, "initWithConfiguration:cloudState:operation:shouldRunHandler:", v6, v7, self, v4);

  return (HDCloudSyncOperation *)v8;
}

@end

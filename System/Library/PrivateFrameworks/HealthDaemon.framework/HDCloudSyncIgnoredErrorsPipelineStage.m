@implementation HDCloudSyncIgnoredErrorsPipelineStage

- (HDCloudSyncIgnoredErrorsPipelineStage)initWithConfiguration:(id)a3 cloudState:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;

  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "raise:format:", v6, CFSTR("The -%@ method is not available on %@"), v7, objc_opt_class());

  return 0;
}

- (HDCloudSyncIgnoredErrorsPipelineStage)initWithConfiguration:(id)a3 cloudState:(id)a4 stage:(id)a5
{
  id v8;
  HDCloudSyncIgnoredErrorsPipelineStage *v9;
  HDCloudSyncIgnoredErrorsPipelineStage *v10;
  objc_super v12;

  v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)HDCloudSyncIgnoredErrorsPipelineStage;
  v9 = -[HDCloudSyncPipelineStage initWithConfiguration:cloudState:](&v12, sel_initWithConfiguration_cloudState_, a3, a4);
  v10 = v9;
  if (v9)
    -[HDCloudSyncIgnoredErrorsPipelineStage setStage:](v9, "setStage:", v8);

  return v10;
}

- (void)main
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  _QWORD v15[5];

  -[HDCloudSyncIgnoredErrorsPipelineStage stage](self, "stage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDCloudSyncIgnoredErrorsPipelineStage.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("stage != nil"));

  }
  v5 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __45__HDCloudSyncIgnoredErrorsPipelineStage_main__block_invoke;
  v15[3] = &unk_1E6D038B0;
  v15[4] = self;
  objc_msgSend(v4, "setOnSuccess:", v15);
  v14[0] = v5;
  v14[1] = 3221225472;
  v14[2] = __45__HDCloudSyncIgnoredErrorsPipelineStage_main__block_invoke_2;
  v14[3] = &unk_1E6D038D8;
  v14[4] = self;
  objc_msgSend(v4, "setOnError:", v14);
  objc_msgSend(v4, "progress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "totalUnitCount");
  -[HDCloudSyncOperation progress](self, "progress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTotalUnitCount:", v7);

  -[HDCloudSyncOperation progress](self, "progress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCompletedUnitCount:", 0);

  -[HDCloudSyncOperation progress](self, "progress");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "progress");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "progress");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addChild:withPendingUnitCount:", v11, objc_msgSend(v12, "totalUnitCount"));

  objc_msgSend(v4, "start");
}

uint64_t __45__HDCloudSyncIgnoredErrorsPipelineStage_main__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", 1, 0);
}

void __45__HDCloudSyncIgnoredErrorsPipelineStage_main__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  v5 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138543618;
    v8 = v6;
    v9 = 2114;
    v10 = v4;
    _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Underlying pipeline stage failed with an ignored error: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", 1, 0);

}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[HDCloudSyncIgnoredErrorsPipelineStage stage](self, "stage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("[! %@]"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (HDCloudSyncPipelineStage)stage
{
  return (HDCloudSyncPipelineStage *)objc_getProperty(self, a2, 128, 1);
}

- (void)setStage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stage, 0);
}

@end

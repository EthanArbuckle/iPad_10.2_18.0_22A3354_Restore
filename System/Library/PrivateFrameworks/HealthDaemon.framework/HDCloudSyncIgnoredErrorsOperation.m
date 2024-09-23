@implementation HDCloudSyncIgnoredErrorsOperation

+ (BOOL)shouldLogAtOperationStart
{
  return 0;
}

+ (BOOL)shouldLogAtOperationEnd
{
  return 0;
}

+ (BOOL)shouldProduceOperationAnalytics
{
  return 0;
}

- (HDCloudSyncIgnoredErrorsOperation)initWithConfiguration:(id)a3 cloudState:(id)a4
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

- (HDCloudSyncIgnoredErrorsOperation)initWithConfiguration:(id)a3 cloudState:(id)a4 operation:(id)a5
{
  id v8;
  HDCloudSyncIgnoredErrorsOperation *v9;
  HDCloudSyncIgnoredErrorsOperation *v10;
  objc_super v12;

  v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)HDCloudSyncIgnoredErrorsOperation;
  v9 = -[HDCloudSyncOperation initWithConfiguration:cloudState:](&v12, sel_initWithConfiguration_cloudState_, a3, a4);
  v10 = v9;
  if (v9)
    -[HDCloudSyncIgnoredErrorsOperation setOperation:](v9, "setOperation:", v8);

  return v10;
}

- (void)main
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  _QWORD v16[5];

  -[HDCloudSyncIgnoredErrorsOperation operation](self, "operation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDCloudSyncIgnoredErrorsOperation.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("operation != nil"));

  }
  -[HDCloudSyncOperation cloudState](self, "cloudState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCloudState:", v5);

  v6 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __41__HDCloudSyncIgnoredErrorsOperation_main__block_invoke;
  v16[3] = &unk_1E6CE7778;
  v16[4] = self;
  objc_msgSend(v4, "setOnSuccess:", v16);
  v15[0] = v6;
  v15[1] = 3221225472;
  v15[2] = __41__HDCloudSyncIgnoredErrorsOperation_main__block_invoke_2;
  v15[3] = &unk_1E6CE77A0;
  v15[4] = self;
  objc_msgSend(v4, "setOnError:", v15);
  objc_msgSend(v4, "progress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "totalUnitCount");
  -[HDCloudSyncOperation progress](self, "progress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTotalUnitCount:", v8);

  -[HDCloudSyncOperation progress](self, "progress");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCompletedUnitCount:", 0);

  -[HDCloudSyncOperation progress](self, "progress");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "progress");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "progress");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addChild:withPendingUnitCount:", v12, objc_msgSend(v13, "totalUnitCount"));

  objc_msgSend(v4, "start");
}

uint64_t __41__HDCloudSyncIgnoredErrorsOperation_main__block_invoke(uint64_t a1, void *a2)
{
  void *v3;

  objc_msgSend(a2, "cloudState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setCloudState:", v3);

  return objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", 1, 0);
}

void __41__HDCloudSyncIgnoredErrorsOperation_main__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a2, "cloudState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setCloudState:", v6);

  _HKInitializeLogging();
  v7 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = 138543618;
    v10 = v8;
    v11 = 2114;
    v12 = v5;
    _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Underlying operation failed with an ignored error: %{public}@", (uint8_t *)&v9, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", 1, 0);

}

- (void)skip
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HDCloudSyncIgnoredErrorsOperation;
  -[HDCloudSyncOperation skip](&v4, sel_skip);
  -[HDCloudSyncIgnoredErrorsOperation operation](self, "operation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "skip");

}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[HDCloudSyncIgnoredErrorsOperation operation](self, "operation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("[! %@]"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (HDCloudSyncOperation)operation
{
  return (HDCloudSyncOperation *)objc_getProperty(self, a2, 104, 1);
}

- (void)setOperation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operation, 0);
}

@end

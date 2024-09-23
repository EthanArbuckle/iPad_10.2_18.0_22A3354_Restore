@implementation HDCloudSyncConditionalOperation

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

- (HDCloudSyncConditionalOperation)initWithConfiguration:(id)a3 cloudState:(id)a4
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

- (HDCloudSyncConditionalOperation)initWithConfiguration:(id)a3 cloudState:(id)a4 operation:(id)a5 shouldRunHandler:(id)a6
{
  id v10;
  id v11;
  HDCloudSyncConditionalOperation *v12;
  HDCloudSyncConditionalOperation *v13;
  objc_super v15;

  v10 = a5;
  v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)HDCloudSyncConditionalOperation;
  v12 = -[HDCloudSyncOperation initWithConfiguration:cloudState:](&v15, sel_initWithConfiguration_cloudState_, a3, a4);
  v13 = v12;
  if (v12)
  {
    -[HDCloudSyncConditionalOperation setShouldRunHandler:](v12, "setShouldRunHandler:", v11);
    -[HDCloudSyncConditionalOperation setOperation:](v13, "setOperation:", v10);
  }

  return v13;
}

- (void)main
{
  uint64_t (**v4)(_QWORD, _QWORD);
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint8_t buf[4];
  HDCloudSyncConditionalOperation *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[HDCloudSyncConditionalOperation shouldRunHandler](self, "shouldRunHandler");
  v4 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncConditionalOperation setShouldRunHandler:](self, "setShouldRunHandler:", 0);
  if (v4 && (((uint64_t (**)(_QWORD, HDCloudSyncConditionalOperation *))v4)[2](v4, self) & 1) != 0)
  {
    -[HDCloudSyncConditionalOperation operation](self, "operation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDCloudSyncConditionalOperation.m"), 52, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("operation != nil"));

    }
    -[HDCloudSyncOperation cloudState](self, "cloudState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCloudState:", v6);

    -[HDCloudSyncOperation delegateToOperation:](self, "delegateToOperation:", v5);
  }
  else
  {
    _HKInitializeLogging();
    v7 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v11 = self;
      _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Skipping.", buf, 0xCu);
    }
    -[HDCloudSyncConditionalOperation operation](self, "operation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "skip");

    -[HDCloudSyncConditionalOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 1, 0);
  }

}

- (void)skip
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HDCloudSyncConditionalOperation;
  -[HDCloudSyncOperation skip](&v4, sel_skip);
  -[HDCloudSyncConditionalOperation operation](self, "operation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "skip");

  -[HDCloudSyncConditionalOperation setShouldRunHandler:](self, "setShouldRunHandler:", 0);
}

- (BOOL)finishWithSuccess:(BOOL)a3 error:(id)a4
{
  _BOOL8 v4;
  id v6;
  objc_super v8;

  v4 = a3;
  v6 = a4;
  -[HDCloudSyncConditionalOperation setShouldRunHandler:](self, "setShouldRunHandler:", 0);
  v8.receiver = self;
  v8.super_class = (Class)HDCloudSyncConditionalOperation;
  LOBYTE(v4) = -[HDCloudSyncOperation finishWithSuccess:error:](&v8, sel_finishWithSuccess_error_, v4, v6);

  return v4;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[HDCloudSyncConditionalOperation operation](self, "operation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("[? %@]"), v3);
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

- (id)shouldRunHandler
{
  return objc_getProperty(self, a2, 112, 1);
}

- (void)setShouldRunHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_shouldRunHandler, 0);
  objc_storeStrong((id *)&self->_operation, 0);
}

@end

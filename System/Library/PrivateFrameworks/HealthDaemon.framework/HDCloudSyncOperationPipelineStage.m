@implementation HDCloudSyncOperationPipelineStage

- (HDCloudSyncOperationPipelineStage)initWithConfiguration:(id)a3 cloudState:(id)a4
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

- (HDCloudSyncOperationPipelineStage)initWithOperation:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  HDCloudSyncOperationPipelineStage *v8;
  objc_super v10;

  v5 = a3;
  objc_msgSend(v5, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cloudState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)HDCloudSyncOperationPipelineStage;
  v8 = -[HDCloudSyncPipelineStage initWithConfiguration:cloudState:](&v10, sel_initWithConfiguration_cloudState_, v6, v7);

  if (v8)
    objc_storeStrong((id *)&v8->_operation, a3);

  return v8;
}

- (void)main
{
  -[HDCloudSyncOperation delegateToOperation:](self, "delegateToOperation:", self->_operation);
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[HDCloudSyncOperationPipelineStage operation](self, "operation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("[Wrap: %@]"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (HDCloudSyncOperation)operation
{
  return self->_operation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operation, 0);
}

@end

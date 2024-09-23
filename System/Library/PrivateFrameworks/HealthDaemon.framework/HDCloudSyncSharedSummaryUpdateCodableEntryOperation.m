@implementation HDCloudSyncSharedSummaryUpdateCodableEntryOperation

- (HDCloudSyncSharedSummaryUpdateCodableEntryOperation)initWithConfiguration:(id)a3 updatedLocalEntries:(id)a4 isActive:(BOOL)a5 shouldResolveCNContact:(BOOL)a6
{
  id v10;
  HDCloudSyncSharedSummaryUpdateCodableEntryOperation *v11;
  uint64_t v12;
  NSArray *updatedLocalEntries;
  HDSynchronousTaskGroup *v14;
  HDSynchronousTaskGroup *taskGroup;
  objc_super v17;

  v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HDCloudSyncSharedSummaryUpdateCodableEntryOperation;
  v11 = -[HDCloudSyncOperation initWithConfiguration:cloudState:](&v17, sel_initWithConfiguration_cloudState_, a3, 0);
  if (v11)
  {
    v12 = objc_msgSend(v10, "copy");
    updatedLocalEntries = v11->_updatedLocalEntries;
    v11->_updatedLocalEntries = (NSArray *)v12;

    v11->_isActive = a5;
    v11->_shouldResolve = a6;
    v14 = (HDSynchronousTaskGroup *)objc_alloc_init(MEMORY[0x1E0D298C8]);
    taskGroup = v11->_taskGroup;
    v11->_taskGroup = v14;

    -[HDSynchronousTaskGroup setDelegate:](v11->_taskGroup, "setDelegate:", v11);
  }

  return v11;
}

- (void)main
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 shouldResolve;
  _QWORD v9[5];

  -[HDSynchronousTaskGroup beginTask](self->_taskGroup, "beginTask");
  -[HDCloudSyncOperation configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "repository");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cloudSyncShimProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "summarySharingEntryShim");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDCloudSyncSharedSummaryUpdateCodableEntryOperation _filterEntries:active:](self, "_filterEntries:active:", self->_updatedLocalEntries, self->_isActive);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    shouldResolve = self->_shouldResolve;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __59__HDCloudSyncSharedSummaryUpdateCodableEntryOperation_main__block_invoke;
    v9[3] = &unk_1E6CE77C8;
    v9[4] = self;
    objc_msgSend(v6, "insertOrReplaceCodableSharingEntries:shouldResolveCNContact:completion:", v7, shouldResolve, v9);
  }
  else
  {
    -[HDSynchronousTaskGroup finishTask](self->_taskGroup, "finishTask");
  }

}

void __59__HDCloudSyncSharedSummaryUpdateCodableEntryOperation_main__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "finishTask");
  }
  else
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138543618;
      v9 = v7;
      v10 = 2114;
      v11 = v5;
      _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [summary-sharing] Unable to insert inactive entries %{public}@", (uint8_t *)&v8, 0x16u);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "failTaskWithError:", v5);
  }

}

- (id)_filterEntries:(id)a3 active:(BOOL)a4
{
  _QWORD v5[4];
  BOOL v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __77__HDCloudSyncSharedSummaryUpdateCodableEntryOperation__filterEntries_active___block_invoke;
  v5[3] = &__block_descriptor_33_e38_B16__0__HDCodableSummarySharingEntry_8l;
  v6 = a4;
  objc_msgSend(a3, "hk_filter:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

BOOL __77__HDCloudSyncSharedSummaryUpdateCodableEntryOperation__filterEntries_active___block_invoke(uint64_t a1, void *a2)
{
  unsigned int v3;

  v3 = objc_msgSend(a2, "status");
  if (v3 - 2 < 3 || v3 > 1)
    return *(_BYTE *)(a1 + 32) == 0;
  else
    return *(_BYTE *)(a1 + 32) != 0;
}

- (void)synchronousTaskGroup:(id)a3 didFinishWithSuccess:(BOOL)a4 errors:(id)a5
{
  _BOOL8 v5;
  id v7;

  v5 = a4;
  objc_msgSend(a5, "firstObject", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", v5, v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskGroup, 0);
  objc_storeStrong((id *)&self->_updatedLocalEntries, 0);
}

@end

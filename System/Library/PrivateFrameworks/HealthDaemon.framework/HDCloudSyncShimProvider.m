@implementation HDCloudSyncShimProvider

- (HDCloudSyncShimProvider)initWithProfile:(id)a3
{
  id v5;
  HDCloudSyncShimProvider *v6;
  HDCloudSyncShimProvider *v7;
  HDCloudSyncSummarySharingEntryShim *v8;
  HDCloudSyncSummarySharingEntryShim *summarySharingEntryShim;
  HDCloudSyncSharedSummariesShim *v10;
  HDCloudSyncSharedSummariesShim *sharedSummariesShim;
  HDCloudSyncStateSyncShim *v12;
  HDCloudSyncStateSyncShim *stateSyncShim;
  HDCloudSyncProfileManagementShim *v14;
  HDCloudSyncProfileManagementShim *profileManagementShim;
  HDCloudSyncSharedSummariesShim *v16;
  HDCloudSyncSharedSummariesShim *v17;
  HDCloudSyncContextSyncShim *v18;
  HDCloudSyncContextSyncShim *contextSyncShim;
  objc_super v21;

  v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)HDCloudSyncShimProvider;
  v6 = -[HDCloudSyncShimProvider init](&v21, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_profile, a3);
    v8 = -[HDCloudSyncSummarySharingEntryShim initWithProfile:]([HDCloudSyncSummarySharingEntryShim alloc], "initWithProfile:", v5);
    summarySharingEntryShim = v7->_summarySharingEntryShim;
    v7->_summarySharingEntryShim = v8;

    v10 = -[HDCloudSyncSharedSummariesShim initWithProfile:]([HDCloudSyncSharedSummariesShim alloc], "initWithProfile:", v5);
    sharedSummariesShim = v7->_sharedSummariesShim;
    v7->_sharedSummariesShim = v10;

    v12 = -[HDCloudSyncStateSyncShim initWithProfile:]([HDCloudSyncStateSyncShim alloc], "initWithProfile:", v5);
    stateSyncShim = v7->_stateSyncShim;
    v7->_stateSyncShim = v12;

    v14 = -[HDCloudSyncProfileManagementShim initWithProfile:]([HDCloudSyncProfileManagementShim alloc], "initWithProfile:", v5);
    profileManagementShim = v7->_profileManagementShim;
    v7->_profileManagementShim = v14;

    v16 = -[HDCloudSyncSharedSummariesShim initWithProfile:]([HDCloudSyncSharedSummariesShim alloc], "initWithProfile:", v5);
    v17 = v7->_sharedSummariesShim;
    v7->_sharedSummariesShim = v16;

    v18 = -[HDCloudSyncContextSyncShim initWithProfile:]([HDCloudSyncContextSyncShim alloc], "initWithProfile:", v5);
    contextSyncShim = v7->_contextSyncShim;
    v7->_contextSyncShim = v18;

  }
  return v7;
}

- (id)profileManagementShim
{
  return self->_profileManagementShim;
}

- (id)summarySharingEntryShim
{
  return self->_summarySharingEntryShim;
}

- (id)sharedSummariesShim
{
  return self->_sharedSummariesShim;
}

- (id)stateSyncShim
{
  return self->_stateSyncShim;
}

- (id)contextSyncShim
{
  return self->_contextSyncShim;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextSyncShim, 0);
  objc_storeStrong((id *)&self->_sharedSummariesShim, 0);
  objc_storeStrong((id *)&self->_profileManagementShim, 0);
  objc_storeStrong((id *)&self->_stateSyncShim, 0);
  objc_storeStrong((id *)&self->_summarySharingEntryShim, 0);
  objc_storeStrong((id *)&self->_profile, 0);
}

@end

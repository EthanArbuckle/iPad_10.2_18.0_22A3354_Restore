@implementation HDCloudSyncSharedSummaryDisableAndDeleteOperation

- (void)main
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  -[HDCloudSyncOperation configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "repository");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cloudSyncShimProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "summarySharingEntryShim");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDCloudSyncOperation configuration](self, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__HDCloudSyncSharedSummaryDisableAndDeleteOperation_main__block_invoke;
  v8[3] = &unk_1E6CE77C8;
  v8[4] = self;
  objc_msgSend(v6, "disableAllSharingEntriesWithConfiguration:completion:", v7, v8);

}

void __57__HDCloudSyncSharedSummaryDisableAndDeleteOperation_main__block_invoke(uint64_t a1, char a2, uint64_t a3)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  v4 = *(void **)(a1 + 32);
  if ((a2 & 1) != 0)
  {
    objc_msgSend(v4, "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "repository");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cloudSyncShimProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sharedSummariesShim");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __57__HDCloudSyncSharedSummaryDisableAndDeleteOperation_main__block_invoke_2;
    v10[3] = &unk_1E6CE77C8;
    v10[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v8, "deleteAllSharedSummaryTransactionsWithConfiguration:completion:", v9, v10);

  }
  else
  {
    objc_msgSend(v4, "finishWithSuccess:error:", 0, a3);
  }
}

void __57__HDCloudSyncSharedSummaryDisableAndDeleteOperation_main__block_invoke_2(uint64_t a1, char a2, uint64_t a3)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  v4 = *(void **)(a1 + 32);
  if ((a2 & 1) != 0)
  {
    objc_msgSend(v4, "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "repository");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cloudSyncShimProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "profileManagementShim");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __57__HDCloudSyncSharedSummaryDisableAndDeleteOperation_main__block_invoke_3;
    v10[3] = &unk_1E6CE77C8;
    v10[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v8, "deleteAllProfilesOfType:configuration:completion:", 2, v9, v10);

  }
  else
  {
    objc_msgSend(v4, "finishWithSuccess:error:", 0, a3);
  }
}

uint64_t __57__HDCloudSyncSharedSummaryDisableAndDeleteOperation_main__block_invoke_3(uint64_t a1, char a2, uint64_t a3)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(void **)(a1 + 32);
  if ((a2 & 1) != 0)
  {
    v4 = 1;
    v5 = 0;
  }
  else
  {
    v5 = a3;
    v4 = 0;
  }
  return objc_msgSend(v3, "finishWithSuccess:error:", v4, v5);
}

@end

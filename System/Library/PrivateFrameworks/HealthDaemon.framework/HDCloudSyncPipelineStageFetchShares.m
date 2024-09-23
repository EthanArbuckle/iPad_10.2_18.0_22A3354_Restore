@implementation HDCloudSyncPipelineStageFetchShares

- (void)main
{
  HDCloudSyncFetchSharesOperation *v3;
  void *v4;
  HDCloudSyncFetchSharesOperation *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[5];

  v3 = [HDCloudSyncFetchSharesOperation alloc];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HDCloudSyncFetchSharesOperation initWithConfiguration:cloudState:](v3, "initWithConfiguration:cloudState:", v4, 0);

  -[HDCloudSyncFetchSharesOperation setFetchAllShares:](v5, "setFetchAllShares:", self->_fetchAllShares);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __43__HDCloudSyncPipelineStageFetchShares_main__block_invoke;
  v11[3] = &unk_1E6D01358;
  v11[4] = self;
  -[HDCloudSyncOperation setOnSuccess:](v5, "setOnSuccess:", v11);
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __43__HDCloudSyncPipelineStageFetchShares_main__block_invoke_2;
  v10[3] = &unk_1E6CE77A0;
  v10[4] = self;
  -[HDCloudSyncOperation setOnError:](v5, "setOnError:", v10);
  -[HDCloudSyncOperation progress](self, "progress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncOperation progress](v5, "progress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncOperation progress](self, "progress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addChild:withPendingUnitCount:", v8, objc_msgSend(v9, "totalUnitCount"));

  -[HDCloudSyncOperation start](v5, "start");
}

uint64_t __43__HDCloudSyncPipelineStageFetchShares_main__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "shares");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 136);
  *(_QWORD *)(v4 + 136) = v3;

  return objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", 1, 0);
}

uint64_t __43__HDCloudSyncPipelineStageFetchShares_main__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", 0, a3);
}

- (BOOL)fetchAllShares
{
  return self->_fetchAllShares;
}

- (void)setFetchAllShares:(BOOL)a3
{
  self->_fetchAllShares = a3;
}

- (NSArray)shares
{
  return self->_shares;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shares, 0);
}

@end

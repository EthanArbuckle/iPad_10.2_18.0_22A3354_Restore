@implementation _HKMobileAssetDownloadOperation

- (void)_queue_transitionToInitialized
{
  -[_HKMobileAssetDownloadOperation _queue_transitionToState:](self, "_queue_transitionToState:", 0);
}

- (void)_queue_transitionToState:(int64_t)a3
{
  NSObject *v5;
  int64_t state;
  int v7;
  _HKMobileAssetDownloadOperation *v8;
  __int16 v9;
  int64_t v10;
  __int16 v11;
  int64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  _HKInitializeLogging();
  v5 = HKLogMobileAsset;
  if (os_log_type_enabled((os_log_t)HKLogMobileAsset, OS_LOG_TYPE_DEFAULT))
  {
    state = self->_state;
    v7 = 138543874;
    v8 = self;
    v9 = 2048;
    v10 = state;
    v11 = 2048;
    v12 = a3;
    _os_log_impl(&dword_19A0E6000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Transitioning from state %ld to state %ld", (uint8_t *)&v7, 0x20u);
  }
  self->_state = a3;
}

- (void)run
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38___HKMobileAssetDownloadOperation_run__block_invoke;
  block[3] = &unk_1E37E6770;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_queue_run
{
  unint64_t v3;
  NSObject *v4;
  int v5;
  _HKMobileAssetDownloadOperation *v6;
  __int16 v7;
  unint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!self->_state)
  {
    -[_HKMobileAssetDownloadOperation _queue_transitionToDownloadingAsset](self, "_queue_transitionToDownloadingAsset");
    v3 = -[MAAsset state](self->_asset, "state");
    _HKInitializeLogging();
    v4 = HKLogMobileAsset;
    if (os_log_type_enabled((os_log_t)HKLogMobileAsset, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138543618;
      v6 = self;
      v7 = 2048;
      v8 = v3;
      _os_log_impl(&dword_19A0E6000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Asset is in asset state %ld", (uint8_t *)&v5, 0x16u);
    }
    if (v3 <= 6)
    {
      if (((1 << v3) & 0x6C) != 0)
      {
        -[_HKMobileAssetDownloadOperation _queue_transitionToCompleted](self, "_queue_transitionToCompleted");
      }
      else if (((1 << v3) & 0x12) != 0)
      {
        -[_HKMobileAssetDownloadOperation _queue_downloadAsset](self, "_queue_downloadAsset");
      }
    }
  }
}

- (void)_queue_transitionToDownloadingAsset
{
  void *v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_state)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_HKMobileAssetDownloadManager.m"), 468, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_state == _HKMobileAssetDownloadOperationStateInitialized"));

  }
  -[_HKMobileAssetDownloadOperation _queue_transitionToState:](self, "_queue_transitionToState:", 1);
}

- (void)_queue_transitionToCompleted
{
  void *v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_state != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_HKMobileAssetDownloadManager.m"), 494, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_state == _HKMobileAssetDownloadOperationStateDownloadingAsset"));

  }
  -[_HKMobileAssetDownloadOperation _queue_transitionToState:](self, "_queue_transitionToState:", 3);
  -[_HKMobileAssetDownloadOperation _queue_callCompletionWithSuccess:error:](self, "_queue_callCompletionWithSuccess:error:", 1, 0);
}

- (void)_queue_callCompletionWithSuccess:(BOOL)a3 error:(id)a4
{
  _BOOL8 v4;
  void (**completion)(id, _HKMobileAssetDownloadOperation *, _BOOL8, id);
  MAAsset *asset;
  id v8;

  v4 = a3;
  v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  completion = (void (**)(id, _HKMobileAssetDownloadOperation *, _BOOL8, id))self->_completion;
  if (completion)
    completion[2](completion, self, v4, v8);
  asset = self->_asset;
  self->_asset = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_downloadOptions, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

- (_HKMobileAssetDownloadOperation)initWithAsset:(id)a3 queue:(id)a4 downloadOptions:(id)a5 maxNumberOfRetriesAllowed:(int64_t)a6 completion:(id)a7
{
  id v14;
  id v15;
  id v16;
  id v17;
  _HKMobileAssetDownloadOperation *v18;
  _HKMobileAssetDownloadOperation *v19;
  void *v20;
  id completion;
  void *v23;
  void *v24;
  objc_super v25;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  if (v14)
  {
    if (v15)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_HKMobileAssetDownloadManager.m"), 392, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset != nil"));

    if (v15)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_HKMobileAssetDownloadManager.m"), 393, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue != NULL"));

LABEL_3:
  v25.receiver = self;
  v25.super_class = (Class)_HKMobileAssetDownloadOperation;
  v18 = -[_HKMobileAssetDownloadOperation init](&v25, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_retryCount = 0;
    objc_storeStrong((id *)&v18->_asset, a3);
    v20 = _Block_copy(v17);
    completion = v19->_completion;
    v19->_completion = v20;

    objc_storeStrong((id *)&v19->_queue, a4);
    objc_storeStrong((id *)&v19->_downloadOptions, a5);
    v19->_maxNumberOfRetriesAllowed = a6;
    -[_HKMobileAssetDownloadOperation _queue_transitionToInitialized](v19, "_queue_transitionToInitialized");
  }

  return v19;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[MAAsset assetType](self->_asset, "assetType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p assetType:\"%@\">"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_queue_transitionToFailureWithDownloadResult:(int64_t)a3
{
  NSObject *v5;
  int64_t retryCount;
  int64_t maxNumberOfRetriesAllowed;
  id v8;
  uint8_t buf[4];
  _HKMobileAssetDownloadOperation *v10;
  __int16 v11;
  int64_t v12;
  __int16 v13;
  int64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[_HKMobileAssetDownloadOperation _queue_transitionToState:](self, "_queue_transitionToState:", 2);
  if (self->_retryCount >= self->_maxNumberOfRetriesAllowed)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MADownloadResult"), a3, 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[_HKMobileAssetDownloadOperation _queue_callCompletionWithSuccess:error:](self, "_queue_callCompletionWithSuccess:error:", 0);

  }
  else
  {
    _HKInitializeLogging();
    v5 = HKLogMobileAsset;
    if (os_log_type_enabled((os_log_t)HKLogMobileAsset, OS_LOG_TYPE_DEBUG))
    {
      retryCount = self->_retryCount;
      maxNumberOfRetriesAllowed = self->_maxNumberOfRetriesAllowed;
      *(_DWORD *)buf = 138543874;
      v10 = self;
      v11 = 2048;
      v12 = retryCount;
      v13 = 2048;
      v14 = maxNumberOfRetriesAllowed;
      _os_log_debug_impl(&dword_19A0E6000, v5, OS_LOG_TYPE_DEBUG, "%{public}@: Retry count (%ld) less than max number of retries allowed (%ld), retrying.", buf, 0x20u);
    }
    ++self->_retryCount;
    -[_HKMobileAssetDownloadOperation _queue_transitionToInitialized](self, "_queue_transitionToInitialized");
    -[_HKMobileAssetDownloadOperation run](self, "run");
  }
}

- (void)_queue_downloadAsset
{
  MAAsset *asset;
  MADownloadOptions *downloadOptions;
  _QWORD v5[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  asset = self->_asset;
  downloadOptions = self->_downloadOptions;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55___HKMobileAssetDownloadOperation__queue_downloadAsset__block_invoke;
  v5[3] = &unk_1E37F11F0;
  v5[4] = self;
  -[MAAsset startDownload:then:](asset, "startDownload:then:", downloadOptions, v5);
}

@end

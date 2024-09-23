@implementation DDMLScannerGetEmbeddingAndAssetsForScriptWithCompletionHandler

void __DDMLScannerGetEmbeddingAndAssetsForScriptWithCompletionHandler_block_invoke(uint64_t a1, double a2)
{
  void *v3;
  double Helper_x8__OBJC_CLASS___NLContextualEmbedding;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  dispatch_block_t v9;
  void *v10;
  dispatch_time_t v11;
  NSObject *v12;

  v3 = (void *)_currentEmbedding;
  if (!_currentEmbedding)
  {
    Helper_x8__OBJC_CLASS___NLContextualEmbedding = gotLoadHelper_x8__OBJC_CLASS___NLContextualEmbedding(a2);
    objc_msgSend(*(id *)(v5 + 280), "contextualEmbeddingWithModelIdentifier:", CFSTR("8075FCEB-2588-4FBD-9804-8507C9DB31E4"), Helper_x8__OBJC_CLASS___NLContextualEmbedding);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)_currentEmbedding;
    _currentEmbedding = v6;

    v3 = (void *)_currentEmbedding;
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v3);
  _ddmlModelQueue();
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if (_startEmbeddingCleanupTimeout__embeddingCleanupBlock)
    dispatch_block_cancel((dispatch_block_t)_startEmbeddingCleanupTimeout__embeddingCleanupBlock);
  v9 = dispatch_block_create((dispatch_block_flags_t)0, &__block_literal_global_177);
  v10 = (void *)_startEmbeddingCleanupTimeout__embeddingCleanupBlock;
  _startEmbeddingCleanupTimeout__embeddingCleanupBlock = (uint64_t)v9;

  v11 = dispatch_time(0, 600000000000);
  _ddmlModelQueue();
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_after(v11, v12, (dispatch_block_t)_startEmbeddingCleanupTimeout__embeddingCleanupBlock);

}

void __DDMLScannerGetEmbeddingAndAssetsForScriptWithCompletionHandler_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  uint8_t v9[16];

  v5 = a3;
  if (DDLogHandle_onceToken != -1)
    dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
  v6 = (id)DDLogHandle_error_log_handle;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v9 = 0;
    _os_log_error_impl(&dword_19BC07000, v6, OS_LOG_TYPE_ERROR, "Failed to get latin embedding, results will be of DDQOSRegular quality", v9, 2u);
  }

  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
  {
    if (a2)
      v8 = v5;
    else
      v8 = 0;
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v8);
  }

}

@end

@implementation NUStyleTransferThumbnailProcessor

BOOL __79___NUStyleTransferThumbnailProcessor_processWithInputs_arguments_output_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  _DWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "metalTexture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "metalTexture");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "downScaleInputTexture:toOutputTexture:", v5, v6);

  if (v7)
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_623);
    v8 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
    {
      v10[0] = 67109120;
      v10[1] = v7;
      _os_log_error_impl(&dword_1A6553000, v8, OS_LOG_TYPE_ERROR, "*** Failed to rescale StyleEngine: %d", (uint8_t *)v10, 8u);
    }
  }
  return v7 == 0;
}

@end

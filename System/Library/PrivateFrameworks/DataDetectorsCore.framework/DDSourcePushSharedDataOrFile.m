@implementation DDSourcePushSharedDataOrFile

void __DDSourcePushSharedDataOrFile_block_invoke_42(uint64_t a1, char a2)
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  if ((a2 & 1) == 0)
  {
    if (DDLogHandle_onceToken != -1)
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
    v4 = DDLogHandle_error_log_handle;
    if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_19BC07000, v4, OS_LOG_TYPE_ERROR, "Failed to write data to DataDetectorsSourceAccess", v6, 2u);
    }
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    objc_msgSend(v5, "invalidate");

  }
}

void __DDSourcePushSharedDataOrFile_block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  if (DDLogHandle_onceToken != -1)
    dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
  v0 = DDLogHandle_error_log_handle;
  if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v1 = 0;
    _os_log_error_impl(&dword_19BC07000, v0, OS_LOG_TYPE_ERROR, "Failed to write data using DataDetectorsSourceAccess", v1, 2u);
  }
}

@end

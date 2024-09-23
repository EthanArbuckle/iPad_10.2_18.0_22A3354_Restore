@implementation DDUserSourcesWriteAllowed

void __DDUserSourcesWriteAllowed_block_invoke()
{
  _BOOL4 BOOL_entitlement;
  NSObject *v1;
  int v2;
  const __CFString *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  BOOL_entitlement = _get_BOOL_entitlement(CFSTR("com.apple.datadetectors.source-write.user"), 1);
  DDUserSourcesWriteAllowed_sandbox_result = BOOL_entitlement;
  if (!BOOL_entitlement)
  {
    if (DDLogHandle_onceToken != -1)
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
    v1 = DDLogHandle_error_log_handle;
    if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
    {
      v2 = 138412290;
      v3 = CFSTR("com.apple.datadetectors.source-write.user");
      _os_log_error_impl(&dword_19BC07000, v1, OS_LOG_TYPE_ERROR, "DD: This process tried to write a user data source without the proper entitlement (%@)", (uint8_t *)&v2, 0xCu);
    }
  }
}

@end

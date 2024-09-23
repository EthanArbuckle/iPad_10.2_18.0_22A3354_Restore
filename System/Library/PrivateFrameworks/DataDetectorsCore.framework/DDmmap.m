@implementation DDmmap

void ___DDmmap_block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (DDLogHandle_onceToken != -1)
    dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
  v2 = DDLogHandle_error_log_handle;
  if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 136315138;
    v5 = v3;
    _os_log_error_impl(&dword_19BC07000, v2, OS_LOG_TYPE_ERROR, "DDCache: loading files from network file systems is not supported (this will only be logged once. first seen with %s)", (uint8_t *)&v4, 0xCu);
  }
}

@end

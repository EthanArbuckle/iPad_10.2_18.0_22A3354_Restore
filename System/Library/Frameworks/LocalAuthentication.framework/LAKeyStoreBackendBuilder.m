@implementation LAKeyStoreBackendBuilder

+ (id)buildBackend
{
  NSObject *v2;
  uint8_t v4[16];

  if (LA_LOG_once_3 != -1)
    dispatch_once(&LA_LOG_once_3, &__block_literal_global_6);
  v2 = LA_LOG_log_3;
  if (os_log_type_enabled((os_log_t)LA_LOG_log_3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B971E000, v2, OS_LOG_TYPE_DEFAULT, "Using real storage", v4, 2u);
  }
  return objc_alloc_init(_LAKeyStoreBackendKeychain);
}

@end

@implementation CacheDeleteRegisterPurgeNotification

uint64_t __CacheDeleteRegisterPurgeNotification_block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  CDGetLogHandle((uint64_t)"client");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = a2;
    _os_log_impl(&dword_1A3662000, v4, OS_LOG_TYPE_DEFAULT, "CacheDeleteRegisterPurgeNotification notifications: %@", (uint8_t *)&v6, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end

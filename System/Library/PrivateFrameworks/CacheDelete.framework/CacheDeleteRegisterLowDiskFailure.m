@implementation CacheDeleteRegisterLowDiskFailure

uint64_t __CacheDeleteRegisterLowDiskFailure_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "clientRegisterLowDiskFailure:failureType:isRoot:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40), *(unsigned __int8 *)(a1 + 44));
}

void __CacheDeleteRegisterLowDiskFailure_block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  CDGetLogHandle((uint64_t)"client");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v2, "description");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v4;
    _os_log_error_impl(&dword_1A3662000, v3, OS_LOG_TYPE_ERROR, "Failed to report low disk functional failure: %@", (uint8_t *)&v5, 0xCu);

  }
}

@end

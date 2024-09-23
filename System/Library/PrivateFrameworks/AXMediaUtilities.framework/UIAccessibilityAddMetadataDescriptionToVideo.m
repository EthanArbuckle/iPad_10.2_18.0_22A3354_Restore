@implementation UIAccessibilityAddMetadataDescriptionToVideo

intptr_t __UIAccessibilityAddMetadataDescriptionToVideo_block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  AXMediaLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "status");
    objc_msgSend(*(id *)(a1 + 32), "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 134218242;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1B0E3B000, v2, OS_LOG_TYPE_INFO, "AX: Export Session status: %ld %@", (uint8_t *)&v6, 0x16u);

  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

@end

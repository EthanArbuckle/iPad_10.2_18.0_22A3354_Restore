@implementation LSPluginSendNotification

void __LSPluginSendNotification_block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  __CFNotificationCenter *DistributedCenter;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x186DAE7A0]();
  _LSDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v7 = 138412546;
    v8 = v4;
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_182882000, v3, OS_LOG_TYPE_INFO, "sending plugin notification %@ with %@", (uint8_t *)&v7, 0x16u);
  }

  DistributedCenter = CFNotificationCenterGetDistributedCenter();
  CFNotificationCenterPostNotificationWithOptions(DistributedCenter, *(CFNotificationName *)(a1 + 32), 0, *(CFDictionaryRef *)(a1 + 40), 2uLL);
  CFRelease(*(CFTypeRef *)(a1 + 40));
  objc_autoreleasePoolPop(v2);
}

@end

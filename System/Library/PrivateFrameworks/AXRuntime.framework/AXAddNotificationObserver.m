@implementation AXAddNotificationObserver

void ___AXAddNotificationObserver_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  CFDictionaryGetValue((CFDictionaryRef)ObserverDictionary, (const void *)*(int *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v2 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99DE8]), "init");
    CFDictionarySetValue((CFMutableDictionaryRef)ObserverDictionary, (const void *)*(int *)(a1 + 40), v2);
  }
  v3 = (void *)objc_msgSend(objc_allocWithZone((Class)AXObserverElementPair), "initWithObserver:", *(_QWORD *)(a1 + 32));
  AXRuntimeLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_DWORD *)(a1 + 40);
    v7 = 138412546;
    v8 = v5;
    v9 = 1024;
    v10 = v6;
    _os_log_impl(&dword_1B54A6000, v4, OS_LOG_TYPE_INFO, "Adding observer for %@ -> %d", (uint8_t *)&v7, 0x12u);
  }

  if ((objc_msgSend(v2, "containsObject:", v3) & 1) == 0)
    objc_msgSend(v2, "addObject:", v3);

}

@end

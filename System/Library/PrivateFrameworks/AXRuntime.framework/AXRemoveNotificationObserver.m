@implementation AXRemoveNotificationObserver

void ___AXRemoveNotificationObserver_block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  CFDictionaryGetValue((CFDictionaryRef)ObserverDictionary, (const void *)*(int *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v2 = (void *)objc_msgSend(objc_allocWithZone((Class)AXObserverElementPair), "initWithObserver:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v3, "removeObject:", v2);

  }
}

@end

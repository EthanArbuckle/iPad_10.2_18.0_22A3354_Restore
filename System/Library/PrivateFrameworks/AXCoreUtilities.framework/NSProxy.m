@implementation NSProxy

void __44__NSProxy_AXSideStorage___axDictionaryQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.accessibility.AXSideStorageQueue", 0);
  v1 = (void *)_axDictionaryQueue__sDictionaryQueue;
  _axDictionaryQueue__sDictionaryQueue = (uint64_t)v0;

}

void __52__NSProxy_AXSideStorage___accessibilityValueForKey___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_getAssociatedObject(*(id *)(a1 + 32), &AXPropertiesKey);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __68__NSProxy_AXSideStorage___accessibilitySetValue_forKey_storageMode___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_getAssociatedObject(*(id *)(a1 + 32), &AXPropertiesKey);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    if (*(_QWORD *)(a1 + 40))
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v5;

      objc_setAssociatedObject(*(id *)(a1 + 32), &AXPropertiesKey, *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), (void *)1);
    }
  }
}

@end

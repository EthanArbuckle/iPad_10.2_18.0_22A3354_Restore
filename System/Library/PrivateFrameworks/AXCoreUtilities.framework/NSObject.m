@implementation NSObject

void __110__NSObject_AXCollectionsExtensions___ax_appendPrettyDescriptionToString_indentationString_visitedCollections___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  if (!*(_BYTE *)(v6 + 24))
  {
    *(_BYTE *)(v6 + 24) = 1;
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));
  }
  objc_msgSend(*(id *)(a1 + 32), "appendString:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v7, "_ax_appendPrettyDescriptionToString:indentationString:visitedCollections:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(": "));
  objc_msgSend(v5, "_ax_appendPrettyDescriptionToString:indentationString:visitedCollections:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(",\n"));

}

void __57__NSObject_UIAccessibilitySafeCategory__safeValueForKey___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "__axValueForKey:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __61__NSObject_UIAccessibilitySafeCategory__safeValueForKeyPath___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "valueForKeyPath:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __71__NSObject_UIAccessibilitySafeCategory__safeIntegerForIvarKey_onClass___block_invoke(uint64_t a1)
{
  objc_ivar *InstanceVariable;
  void *v3;

  InstanceVariable = class_getInstanceVariable(*(Class *)(a1 + 56), (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String"));
  object_getIvar(*(id *)(a1 + 40), InstanceVariable);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v3;

}

void __45__NSObject_AXSideStorage___axDictionaryQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.accessibility.AXSideStorageQueue", 0);
  v1 = (void *)_axDictionaryQueue__sDictionaryQueue_0;
  _axDictionaryQueue__sDictionaryQueue_0 = (uint64_t)v0;

}

void __53__NSObject_AXSideStorage___accessibilityValueForKey___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_getAssociatedObject(*(id *)(a1 + 32), &AXPropertiesKey_0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __69__NSObject_AXSideStorage___accessibilitySetValue_forKey_storageMode___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_getAssociatedObject(*(id *)(a1 + 32), &AXPropertiesKey_0);
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

      objc_setAssociatedObject(*(id *)(a1 + 32), &AXPropertiesKey_0, *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), (void *)1);
    }
  }
}

@end

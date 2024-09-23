@implementation CFPrefsDeliverPendingKVONotificationsGuts

void ___CFPrefsDeliverPendingKVONotificationsGuts_block_invoke(uint64_t a1, uint64_t a2, const __CFArray *a3)
{
  CFMutableDictionaryRef Mutable;
  CFMutableDictionaryRef v5;
  CFIndex Count;
  CFIndex v7;
  CFIndex v8;
  uint64_t v9;
  _QWORD *ValueAtIndex;
  const __CFDictionary *v11;
  void *v12;
  const __CFDictionary *v13;
  void *v14;
  _QWORD v15[6];
  _QWORD context[6];

  context[5] = *MEMORY[0x1E0C80C00];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v5 = CFDictionaryCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  Count = CFArrayGetCount(a3);
  if (Count < 1)
  {
    v12 = 0;
  }
  else
  {
    v7 = Count;
    v8 = 0;
    v9 = MEMORY[0x1E0C809B0];
    do
    {
      ValueAtIndex = CFArrayGetValueAtIndex(a3, v8);
      v12 = (void *)ValueAtIndex[1];
      v11 = (const __CFDictionary *)ValueAtIndex[2];
      v13 = (const __CFDictionary *)ValueAtIndex[3];
      if (v11)
      {
        context[0] = v9;
        context[1] = 3221225472;
        context[2] = ___CFPrefsDeliverPendingKVONotificationsGuts_block_invoke_2;
        context[3] = &__block_descriptor_40_e25_v24__0____CFString__8_v16l;
        context[4] = Mutable;
        CFDictionaryApplyFunction(v11, (CFDictionaryApplierFunction)applyBlockApplier, context);
      }
      if (v13)
      {
        v15[0] = v9;
        v15[1] = 3221225472;
        v15[2] = ___CFPrefsDeliverPendingKVONotificationsGuts_block_invoke_3;
        v15[3] = &__block_descriptor_48_e25_v24__0____CFString__8_v16l;
        v15[4] = Mutable;
        v15[5] = v5;
        CFDictionaryApplyFunction(v13, (CFDictionaryApplierFunction)applyBlockApplier, v15);
      }
      ++v8;
    }
    while (v7 != v8);
  }
  v14 = (void *)MEMORY[0x186DB02F4]();
  objc_msgSend(v12, "_notifyObserversOfChangeFromValuesForKeys:toValuesForKeys:", Mutable, v5);
  objc_autoreleasePoolPop(v14);
  CFRelease(Mutable);
  CFRelease(v5);
}

void ___CFPrefsDeliverPendingKVONotificationsGuts_block_invoke_2(uint64_t a1, const void *a2, const void *a3)
{
  CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 32), a2, a3);
}

void ___CFPrefsDeliverPendingKVONotificationsGuts_block_invoke_3(uint64_t a1, const void *a2, const void *a3)
{
  CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 32), a2, &__kCFNull);
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 40), a2, a3);
}

@end

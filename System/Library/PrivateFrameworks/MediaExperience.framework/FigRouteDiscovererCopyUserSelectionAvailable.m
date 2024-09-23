@implementation FigRouteDiscovererCopyUserSelectionAvailable

void __FigRouteDiscovererCopyUserSelectionAvailable_block_invoke(uint64_t a1)
{
  uint64_t v1;
  CFIndex v2;
  uint64_t v3;
  uint64_t v4;
  const void *v5;
  uint64_t v6;
  uint64_t v7;
  const __CFArray *Count;
  const __CFDictionary *ValueAtIndex;
  const void *Value;
  uint64_t CMBaseObject;
  void (*v12)(uint64_t, uint64_t, uint64_t, CFTypeRef *);
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, uint64_t, CFTypeRef *);
  uint64_t v15;
  uint64_t v17;
  CFTypeRef cf;
  CFTypeRef v19;

  if (*(_QWORD *)(a1 + 40) == 1)
    v1 = 1;
  else
    v1 = 2;
  if (discoverManager_getSharedManager_onceToken != -1)
    dispatch_once(&discoverManager_getSharedManager_onceToken, &__block_literal_global_15);
  v2 = 0;
  if (qword_1EE2B3238)
    v3 = (uint64_t)&qword_1EE2B3320;
  else
    v3 = 240;
  v17 = *MEMORY[0x1E0CA3A40];
  v4 = *MEMORY[0x1E0C9AE00];
  v5 = (const void *)*MEMORY[0x1E0C9AE40];
  v6 = *MEMORY[0x1E0CA3A30];
  v7 = *MEMORY[0x1E0C9AE50];
  while (1)
  {
    Count = *(const __CFArray **)v3;
    if (*(_QWORD *)v3)
      Count = (const __CFArray *)CFArrayGetCount(Count);
    if (v2 >= (uint64_t)Count)
      break;
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(*(CFArrayRef *)v3, v2);
    Value = CFDictionaryGetValue(ValueAtIndex, CFSTR("EndpointManager_RefKey"));
    v19 = 0;
    if (Value)
    {
      CMBaseObject = FigEndpointManagerGetCMBaseObject();
      v12 = *(void (**)(uint64_t, uint64_t, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                          + 48);
      if (v12)
        v12(CMBaseObject, v17, v4, &v19);
    }
    if (FigCFEqual() || FigCFEqual())
    {
      cf = v5;
      v13 = FigEndpointManagerGetCMBaseObject();
      v14 = *(void (**)(uint64_t, uint64_t, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                          + 48);
      if (v14)
        v14(v13, v6, v4, &cf);
      v15 = FigCFEqual() != 0;
      if (cf)
        CFRelease(cf);
      v1 -= v15;
    }
    if (v19)
      CFRelease(v19);
    if (!v1)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v7;
      return;
    }
    ++v2;
  }
}

@end

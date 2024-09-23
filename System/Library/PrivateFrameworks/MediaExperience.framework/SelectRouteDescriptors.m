@implementation SelectRouteDescriptors

uint64_t __routingContextResilientRemote_SelectRouteDescriptors_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, uint64_t, uint64_t);

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 48);
  if (v5)
    return v5(a2, v3, v4);
  else
    return 4294954514;
}

void __routingContext_SelectRouteDescriptors_block_invoke(uint64_t a1)
{
  const __CFArray *v2;
  const __CFArray *v3;
  __CFDictionary *Mutable;
  const void *v5;
  const void *v6;
  const void *v7;

  v2 = (const __CFArray *)FigEndpointDescriptorUtility_CopyEndpointArrayFromDescriptors(*(void **)(a1 + 32), 0);
  if (v2)
  {
    v3 = v2;
    if (CFArrayGetCount(v2))
      FigRoutingManagerCreateAggregateForContextIfNecessary(*(const void **)(*(_QWORD *)(a1 + 40) + 8), (CFIndex)v3);
    CFRelease(v3);
  }
  FigPredictedRouting_ResetSelectedRouteDescriptor(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), 3);
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  CFDictionarySetValue(Mutable, CFSTR("RouteChangeOptionKey_UserPickedRoute"), (const void *)*MEMORY[0x1E0C9AE50]);
  FigRoutingManagerPickRouteDescriptorsForContext(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), *(const __CFArray **)(a1 + 32), *(const __CFDictionary **)(a1 + 48), (uint64_t)Mutable);
  if (Mutable)
    CFRelease(Mutable);
  v5 = *(const void **)(a1 + 56);
  if (v5)
    CFRelease(v5);
  v6 = *(const void **)(a1 + 32);
  if (v6)
    CFRelease(v6);
  v7 = *(const void **)(a1 + 48);
  if (v7)
    CFRelease(v7);
}

@end

@implementation SelectRoutes

uint64_t __routingContextResilientRemote_SelectRoutes_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, uint64_t, uint64_t);

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 40);
  if (v5)
    return v5(a2, v3, v4);
  else
    return 4294954514;
}

void __routingContext_SelectRoutes_block_invoke(uint64_t a1)
{
  const __CFArray *v2;
  const __CFAllocator *v3;
  __CFDictionary *Mutable;
  const void *v5;
  const void *v6;
  const __CFArray *v7;
  const __CFArray *MutableCopy;
  CFIndex v9;
  CFIndex i;
  const void *ValueAtIndex;
  CFTypeRef v12;
  const void *v13;
  const void *v14;
  const void *v15;
  const void *v16;

  v2 = *(const __CFArray **)(a1 + 32);
  if (v2 && CFArrayGetCount(v2))
    FigRoutingManagerCreateAggregateForContextIfNecessary(*(const void **)(*(_QWORD *)(a1 + 40) + 8), *(_QWORD *)(a1 + 32));
  v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v5 = (const void *)*MEMORY[0x1E0C9AE50];
  CFDictionarySetValue(Mutable, CFSTR("RouteChangeOptionKey_UserPickedRoute"), (const void *)*MEMORY[0x1E0C9AE50]);
  if (FigRoutingManagerContextUtilities_DoesContextSupportWHAMultiDeviceRouting(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)))
    v6 = v5;
  else
    v6 = (const void *)*MEMORY[0x1E0C9AE40];
  CFDictionarySetValue(Mutable, CFSTR("RouteChangeOptionKey_RoutingContextSupportsMultiDeviceRouting"), v6);
  v7 = *(const __CFArray **)(a1 + 32);
  if (v7)
    MutableCopy = CFArrayCreateMutableCopy(v3, 0, v7);
  else
    MutableCopy = 0;
  v9 = 0;
  if (!MutableCopy)
    goto LABEL_12;
LABEL_11:
  for (i = CFArrayGetCount(MutableCopy); v9 < i; i = 0)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 32), v9);
    if (FigRoutingManagerIsEndpointOfType((uint64_t)ValueAtIndex)
      && FigRoutingManagerIsEndpointWHAGroupable((uint64_t)ValueAtIndex))
    {
      v12 = FigRoutingManagerCopyLocalAirPlayEndpoint();
      if (v12)
      {
        v13 = v12;
        CFArraySetValueAtIndex(MutableCopy, v9, v12);
        CFRelease(v13);
      }
    }
    ++v9;
    if (MutableCopy)
      goto LABEL_11;
LABEL_12:
    ;
  }
  FigRoutingManagerPickEndpointsForContext(*(const void **)(*(_QWORD *)(a1 + 40) + 8), MutableCopy, *(const __CFDictionary **)(a1 + 48), Mutable);
  if (MutableCopy)
    CFRelease(MutableCopy);
  if (Mutable)
    CFRelease(Mutable);
  v14 = *(const void **)(a1 + 56);
  if (v14)
    CFRelease(v14);
  v15 = *(const void **)(a1 + 32);
  if (v15)
    CFRelease(v15);
  v16 = *(const void **)(a1 + 48);
  if (v16)
    CFRelease(v16);
}

@end

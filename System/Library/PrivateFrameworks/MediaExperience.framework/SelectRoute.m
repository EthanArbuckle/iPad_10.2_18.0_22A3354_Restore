@implementation SelectRoute

uint64_t __routingContextResilientRemote_SelectRoute_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, uint64_t, uint64_t);

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
  if (v5)
    return v5(a2, v3, v4);
  else
    return 4294954514;
}

void __routingContext_SelectRoute_block_invoke(uint64_t a1)
{
  uint64_t DerivedStorage;
  void *v3;
  int IsTestCodeEnabled;
  const void *v5;
  const void *v6;
  const void *v7;
  const void *v8;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (*(_QWORD *)(a1 + 40))
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", *(_QWORD *)(a1 + 40), 0);
    FigRoutingManagerCreateAggregateForContextIfNecessary(*(const void **)(DerivedStorage + 8), (CFIndex)v3);

  }
  if (*(_DWORD *)DerivedStorage == 2)
  {
    IsTestCodeEnabled = MXSystemMirroring_IsTestCodeEnabled();
    v5 = *(const void **)(a1 + 40);
    if (IsTestCodeEnabled)
    {
      MXSystemMirroring_PickEndpoint(*(const void **)(DerivedStorage + 8), v5, *(CFDictionaryRef *)(a1 + 48), 0);
      goto LABEL_8;
    }
  }
  else
  {
    v5 = *(const void **)(a1 + 40);
  }
  FigRoutingManagerPickEndpointForContext(*(const void **)(DerivedStorage + 8), v5, *(const __CFDictionary **)(a1 + 48), 0);
LABEL_8:
  v6 = *(const void **)(a1 + 32);
  if (v6)
    CFRelease(v6);
  v7 = *(const void **)(a1 + 40);
  if (v7)
    CFRelease(v7);
  v8 = *(const void **)(a1 + 48);
  if (v8)
    CFRelease(v8);
}

@end

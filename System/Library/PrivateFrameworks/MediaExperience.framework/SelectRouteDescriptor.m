@implementation SelectRouteDescriptor

uint64_t __routingContextResilientRemote_SelectRouteDescriptor_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, uint64_t, uint64_t);

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 16);
  if (v5)
    return v5(a2, v3, v4);
  else
    return 4294954514;
}

void __routingContext_SelectRouteDescriptor_block_invoke(uint64_t a1)
{
  uint64_t DerivedStorage;
  OpaqueFigEndpoint *v3;
  OpaqueFigEndpoint *v4;
  void *v5;
  int IsMirroringScreenAudioSeperateFunctionalityAllowed;
  const void *v7;
  const __CFDictionary *v8;
  const __CFDictionary *v9;
  const void *v10;
  const void *v11;
  const void *v12;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v3 = FigEndpointDescriptorUtility_CopyEndpointFromDescriptor(*(_QWORD *)(a1 + 40), 0);
  if (v3)
  {
    v4 = v3;
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v3, 0);
    FigRoutingManagerCreateAggregateForContextIfNecessary(*(const void **)(DerivedStorage + 8), (CFIndex)v5);

    CFRelease(v4);
  }
  FigPredictedRouting_ResetSelectedRouteDescriptor(*(_QWORD *)(DerivedStorage + 8), 2);
  if (FigRoutingManagerContextUtilities_GetContextType(*(_QWORD *)(DerivedStorage + 8)) == 2
    && MXSystemMirroring_IsTestCodeEnabled())
  {
    MXSystemMirroring_PickRouteDescriptor(*(const void **)(DerivedStorage + 8), *(CFDictionaryRef *)(a1 + 40), *(const __CFDictionary **)(a1 + 48), 0);
  }
  else
  {
    IsMirroringScreenAudioSeperateFunctionalityAllowed = MXSystemMirroring_IsMirroringScreenAudioSeperateFunctionalityAllowed();
    v7 = *(const void **)(DerivedStorage + 8);
    v8 = *(const __CFDictionary **)(a1 + 40);
    v9 = *(const __CFDictionary **)(a1 + 48);
    if (IsMirroringScreenAudioSeperateFunctionalityAllowed)
      MXSystemAudio_PickRouteDescriptor(v7, v8, v9, 0);
    else
      FigRoutingManagerPickRouteDescriptorForContext(v7, v8, v9, 0);
  }
  v10 = *(const void **)(a1 + 32);
  if (v10)
    CFRelease(v10);
  v11 = *(const void **)(a1 + 40);
  if (v11)
    CFRelease(v11);
  v12 = *(const void **)(a1 + 48);
  if (v12)
    CFRelease(v12);
}

@end

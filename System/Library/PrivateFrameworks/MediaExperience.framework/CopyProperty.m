@implementation CopyProperty

uint64_t __routingContextResilientRemote_CopyProperty_block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t, uint64_t);

  v3 = a1[4];
  v4 = a1[5];
  v5 = a1[6];
  v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
  if (v6)
    return v6(a2, v3, v4, v5);
  else
    return 4294954514;
}

uint64_t __central_CopyProperty_block_invoke(_QWORD *a1)
{
  const void *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  _BYTE *DerivedStorage;
  _BYTE *v7;
  const void *v8;
  int EntityDoingActivity;
  int v10;
  const void **v11;
  BOOL v12;
  int v13;
  const void *v15;
  CFTypeRef v16;
  uint64_t result;
  int v18;
  const void **v19;
  const void **v20;
  BOOL v21;
  const __CFString *v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t CMBaseObject;
  uint64_t (*v27)(uint64_t, const void *, uint64_t, _QWORD *);

  v3 = a1[5];
  v2 = (const void *)a1[6];
  v5 = a1[7];
  v4 = (_QWORD *)a1[8];
  DerivedStorage = (_BYTE *)CMBaseObjectGetDerivedStorage();
  if (*DerivedStorage)
  {
    result = FigSignalErrorAt();
    goto LABEL_17;
  }
  v7 = DerivedStorage;
  v8 = (const void *)*MEMORY[0x1E0CA44C0];
  if (CFEqual(v2, (CFTypeRef)*MEMORY[0x1E0CA44C0]) || CFEqual(v2, (CFTypeRef)*MEMORY[0x1E0CA4148]))
  {
    EntityDoingActivity = _FigEndpointCentralGetEntityDoingActivity(v3, CFSTR("TurnByTurnNavigation"));
    v10 = CFEqual(v2, v8);
    v11 = (const void **)MEMORY[0x1E0C9AE50];
    if (v10)
      v12 = EntityDoingActivity == 2;
    else
      v12 = 0;
    if (!v12)
    {
      v13 = CFEqual(v2, (CFTypeRef)*MEMORY[0x1E0CA4148]);
      if (EntityDoingActivity != 1 || v13 == 0)
        v11 = (const void **)MEMORY[0x1E0C9AE40];
    }
    v15 = *v11;
    goto LABEL_15;
  }
  if (CFEqual(v2, (CFTypeRef)*MEMORY[0x1E0CA4150]))
  {
    v18 = _FigEndpointCentralGetEntityDoingActivity(v3, CFSTR("Speech"));
    v19 = (const void **)MEMORY[0x1E0C9AE50];
    v20 = (const void **)MEMORY[0x1E0C9AE40];
    v21 = v18 == 1;
LABEL_25:
    if (!v21)
      v19 = v20;
    v15 = *v19;
    goto LABEL_15;
  }
  if (CFEqual(v2, (CFTypeRef)*MEMORY[0x1E0CA4160]))
  {
    v22 = CFSTR("Screen");
LABEL_24:
    v23 = _FigEndpointCentralEntityHoldsResource(v3, (uint64_t)CFSTR("Car"), (uint64_t)v22);
    v19 = (const void **)MEMORY[0x1E0C9AE40];
    v20 = (const void **)MEMORY[0x1E0C9AE50];
    v21 = v23 == 0;
    goto LABEL_25;
  }
  if (CFEqual(v2, (CFTypeRef)*MEMORY[0x1E0CA4158]))
  {
    v22 = CFSTR("MainAudio");
    goto LABEL_24;
  }
  v24 = CFEqual(v2, (CFTypeRef)*MEMORY[0x1E0CA4168]);
  if ((_DWORD)v24)
  {
    if (!MX_FeatureFlags_IsAirPlayDaemonEnabled(v24, v25))
    {
      result = 4294954509;
      goto LABEL_17;
    }
    v15 = (const void *)*((_QWORD *)v7 + 1);
    if (!v15)
    {
      v16 = 0;
      goto LABEL_16;
    }
LABEL_15:
    v16 = CFRetain(v15);
LABEL_16:
    result = 0;
    *v4 = v16;
    goto LABEL_17;
  }
  CMBaseObject = FigEndpointGetCMBaseObject();
  v27 = *(uint64_t (**)(uint64_t, const void *, uint64_t, _QWORD *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                           + 48);
  if (v27)
    result = v27(CMBaseObject, v2, v5, v4);
  else
    result = 4294954514;
LABEL_17:
  *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  return result;
}

void __routingContext_CopyProperty_block_invoke(uint64_t a1)
{
  int IsConfigurationWHASilentPrimary;
  CFTypeRef *v3;
  void *MutableCopy;
  CFDictionaryRef theDict;

  if (CFEqual(*(CFTypeRef *)(a1 + 40), CFSTR("currentGroupID")))
  {
    FigRoutingManagerCopyCurrentGroupUUID(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8), *(_QWORD **)(a1 + 56));
    return;
  }
  if (CFEqual(*(CFTypeRef *)(a1 + 40), CFSTR("associatedAudioDevice")))
  {
    CMBaseObjectGetDerivedStorage();
    **(_QWORD **)(a1 + 56) = 0;
    return;
  }
  if (CFEqual(*(CFTypeRef *)(a1 + 40), CFSTR("isWHASilentPrimary")))
  {
    IsConfigurationWHASilentPrimary = FigRoutingManagerIsConfigurationWHASilentPrimary(*(_QWORD *)(*(_QWORD *)(a1 + 48)
                                                                                                 + 8));
    v3 = (CFTypeRef *)MEMORY[0x1E0C9AE50];
    if (!IsConfigurationWHASilentPrimary)
      v3 = (CFTypeRef *)MEMORY[0x1E0C9AE40];
    **(_QWORD **)(a1 + 56) = CFRetain(*v3);
  }
  else
  {
    if (CFEqual(*(CFTypeRef *)(a1 + 40), CFSTR("selectedEndpointsForDiagnostics")))
    {
      theDict = 0;
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = FigRoutingManagerContextUtilities_CopyNonControlPickedContexts((uint64_t)&theDict);
      if (theDict)
      {
        MutableCopy = (void *)FigCFArrayCreateMutableCopy();
        CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)routingContext_collectPickedEndpoints, MutableCopy);
      }
      else
      {
        MutableCopy = 0;
      }
      **(_QWORD **)(a1 + 56) = MutableCopy;
    }
    else
    {
      if (!CFEqual(*(CFTypeRef *)(a1 + 40), CFSTR("IsAnyRoutePickedOrBeingPicked")))
      {
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -12784;
        return;
      }
      theDict = 0;
      FigRoutingManagerCopyPickedEndpointForRoutingContext(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8), (CFTypeRef *)&theDict);
      if (!theDict)
        return;
      **(_QWORD **)(a1 + 56) = CFRetain((CFTypeRef)*MEMORY[0x1E0C9AE50]);
    }
    if (theDict)
      CFRelease(theDict);
  }
}

uint64_t __endpointAggregate_CopyProperty_block_invoke(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t CMBaseObject;
  uint64_t (*v5)(uint64_t, uint64_t, uint64_t, uint64_t);

  v1 = a1[4];
  v2 = a1[5];
  v3 = a1[6];
  CMBaseObject = FigEndpointGetCMBaseObject();
  v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
  if (v5)
    return v5(CMBaseObject, v1, v2, v3);
  else
    return 4294954514;
}

@end

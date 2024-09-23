@implementation StartSessionWithRouteDescriptors

uint64_t __routingSessionManagerResilientRemote_StartSessionWithRouteDescriptors_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t);

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 72);
  if (v4)
    return v4(a2, v3);
  else
    return 4294954514;
}

void __routingSessionManager_StartSessionWithRouteDescriptors_block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  const void *v5;
  uint64_t v6;
  NSObject *v7;
  const void *v8;
  _QWORD v9[7];

  v5 = (const void *)a1[5];
  if (v5)
  {
    CFRetain(v5);
    v6 = a1[5];
  }
  else
  {
    v6 = 0;
  }
  v7 = *(NSObject **)(a1[6] + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __routingSessionManager_StartSessionWithRouteDescriptors_block_invoke_2;
  v9[3] = &unk_1E309EED0;
  v9[5] = a3;
  v9[6] = v6;
  v9[4] = a1[4];
  MXDispatchAsync((uint64_t)"routingSessionManager_StartSessionWithRouteDescriptors_block_invoke", (uint64_t)"FigRoutingSessionManager.m", 2681, 0, 0, v7, (uint64_t)v9);
  v8 = (const void *)a1[5];
  if (v8)
    CFRelease(v8);
}

void __routingSessionManager_StartSessionWithRouteDescriptors_block_invoke_2(uint64_t a1)
{
  const void *v2;

  routingSessionManager_setPredictionContextForSession(*(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 32), "newSession"), *(void **)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setPredictionContext:", *(_QWORD *)(a1 + 40));
  v2 = *(const void **)(a1 + 48);
  if (v2)
    CFRelease(v2);
}

uint64_t __routingSessionManager_StartSessionWithRouteDescriptors_block_invoke_3(uint64_t a1, const __CFArray *a2)
{
  uint64_t result;
  const void *v4;
  const void *v5;
  const void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  _QWORD v10[8];
  __int16 v11;

  result = (uint64_t)routingSessionManager_createAvailableDestinationFromAvailableRoutes(a2, *(CFDictionaryRef *)(a1 + 40));
  if (result)
  {
    v4 = (const void *)result;
    CFRetain((CFTypeRef)result);
    v5 = *(const void **)(a1 + 48);
    if (v5)
      CFRetain(v5);
    v6 = *(const void **)(a1 + 56);
    if (v6)
    {
      CFRetain(v6);
      v7 = *(_QWORD *)(a1 + 56);
    }
    else
    {
      v7 = 0;
    }
    v8 = *(NSObject **)(*(_QWORD *)(a1 + 64) + 32);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __routingSessionManager_StartSessionWithRouteDescriptors_block_invoke_4;
    v10[3] = &unk_1E309EF20;
    v10[4] = *(_QWORD *)(a1 + 32);
    v10[5] = v4;
    v9 = *(_QWORD *)(a1 + 48);
    v11 = *(_WORD *)(a1 + 72);
    v10[6] = v9;
    v10[7] = v7;
    MXDispatchAsync((uint64_t)"routingSessionManager_StartSessionWithRouteDescriptors_block_invoke_3", (uint64_t)"FigRoutingSessionManager.m", 2706, 0, 0, v8, (uint64_t)v10);
    CFRelease(v4);
    return 1;
  }
  return result;
}

void __routingSessionManager_StartSessionWithRouteDescriptors_block_invoke_4(uint64_t a1)
{
  const void *v2;
  const void *v3;
  const void *v4;
  CFTypeRef cf;

  cf = 0;
  if (!FigRoutingSessionCreate(*MEMORY[0x1E0C9AE00], 0, *(const void **)(a1 + 40), &cf))
  {
    routingSessionManager_updateCurrentSession(*(const void **)(a1 + 48), cf, (void *)objc_msgSend(*(id *)(a1 + 32), "predictionContext"), *(_BYTE *)(a1 + 64), *(unsigned __int8 *)(a1 + 65), 0, 0, 1, *(_QWORD *)(a1 + 56), 1, CFSTR("Update route descriptors of pending route session"), 0);
    objc_msgSend(*(id *)(a1 + 32), "setNewSession:", cf);
  }
  if (cf)
    CFRelease(cf);
  v2 = *(const void **)(a1 + 40);
  if (v2)
    CFRelease(v2);
  v3 = *(const void **)(a1 + 48);
  if (v3)
    CFRelease(v3);
  v4 = *(const void **)(a1 + 56);
  if (v4)
    CFRelease(v4);
}

void __routingSessionManager_StartSessionWithRouteDescriptors_block_invoke_5(uint64_t a1, int a2)
{
  const void *v3;
  const void *v4;
  const void *v5;

  if (a2)
    routingSessionManager_updateCurrentSession(*(const void **)(a1 + 32), 0, 0, 0, 0, 0, 0, 1, *(_QWORD *)(a1 + 40), 0, CFSTR("Failed to discover pending route"), 0);
  v3 = *(const void **)(a1 + 48);
  if (v3)
    CFRelease(v3);
  v4 = *(const void **)(a1 + 32);
  if (v4)
    CFRelease(v4);
  v5 = *(const void **)(a1 + 40);
  if (v5)
    CFRelease(v5);
}

@end

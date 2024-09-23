@implementation FigEndpointPlaybackSessionRemoteXPC

uint64_t __FigEndpointPlaybackSessionRemoteXPC_runAllCallbacks_block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 40) + 24);
  *(_QWORD *)(*(_QWORD *)(result + 40) + 24) = 0;
  return result;
}

void __FigEndpointPlaybackSessionRemoteXPC_sendMessageSynchronouslyExpectingCompletionCallback_block_invoke(uint64_t a1)
{
  uint64_t DerivedStorage;
  uint64_t v3;
  uint64_t v4;
  __CFDictionary *v5;

  DerivedStorage = CMBaseObjectGetDerivedStorage(*(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(DerivedStorage + 56);
  v4 = 1;
  if ((unint64_t)(v3 + 1) > 1)
    v4 = v3 + 1;
  *(_QWORD *)(DerivedStorage + 56) = v4;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v3;
  v5 = *(__CFDictionary **)(*(_QWORD *)(a1 + 48) + 24);
  if (v5)
    CFDictionarySetValue(v5, *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), *(const void **)(a1 + 56));
}

void __FigEndpointPlaybackSessionRemoteXPC_sendMessageSynchronouslyExpectingCompletionCallback_block_invoke_2(_QWORD *a1)
{
  const __CFDictionary *v2;

  v2 = *(const __CFDictionary **)(a1[6] + 24);
  if (v2)
  {
    if (CFDictionaryGetValueIfPresent(v2, *(const void **)(*(_QWORD *)(a1[4] + 8) + 24), 0))
      *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1[6] + 24), *(const void **)(*(_QWORD *)(a1[4] + 8) + 24));
  }
}

void __FigEndpointPlaybackSessionRemoteXPC_SetEventHandler_block_invoke(_QWORD *a1)
{
  uint64_t v1;
  const void *v2;
  const void *v3;

  *(_QWORD *)(a1[4] + 40) = a1[5];
  *(_QWORD *)(a1[4] + 32) = a1[6];
  v1 = a1[4];
  v2 = *(const void **)(v1 + 48);
  v3 = (const void *)a1[7];
  *(_QWORD *)(v1 + 48) = v3;
  if (v3)
    CFRetain(v3);
  if (v2)
    CFRelease(v2);
}

@end

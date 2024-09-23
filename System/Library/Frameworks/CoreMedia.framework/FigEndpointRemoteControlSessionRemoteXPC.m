@implementation FigEndpointRemoteControlSessionRemoteXPC

uint64_t __FigEndpointRemoteControlSessionRemoteXPC_runAllCallbacks_block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 40) + 24);
  *(_QWORD *)(*(_QWORD *)(result + 40) + 24) = 0;
  return result;
}

id __FigEndpointRemoteControlSessionRemoteXPC_postInvalidated_block_invoke(_QWORD *a1)
{
  id result;

  result = FigCFWeakReferenceLoadAndRetain((id *)(a1[6] + 40));
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = *(_QWORD *)(a1[6] + 32);
  return result;
}

void __FigEndpointRemoteControlSessionRemoteXPC_sendMessageSynchronouslyExpectingCompletionCallback_block_invoke(uint64_t a1)
{
  unsigned int *v2;
  uint64_t v3;
  __CFDictionary *v4;

  v2 = (unsigned int *)(CMBaseObjectGetDerivedStorage(*(_QWORD *)(a1 + 40)) + 48);
  v3 = *(_QWORD *)v2;
  FigAtomicIncrement32(v2);
  if (!*(_QWORD *)v2)
    FigAtomicIncrement32(v2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v3;
  v4 = *(__CFDictionary **)(*(_QWORD *)(a1 + 48) + 24);
  if (v4)
    CFDictionarySetValue(v4, *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), *(const void **)(a1 + 56));
}

void __FigEndpointRemoteControlSessionRemoteXPC_sendMessageSynchronouslyExpectingCompletionCallback_block_invoke_2(_QWORD *a1)
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

void __FigEndpointRemoteControlSessionRemoteXPC_SetEventHandler_block_invoke(uint64_t a1)
{
  uint64_t v2;

  FigCFWeakReferenceDestroy((id *)(*(_QWORD *)(a1 + 32) + 40));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = 0;
  v2 = *(_QWORD *)(a1 + 40);
  if (v2 && *(_QWORD *)(a1 + 48))
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = v2;
    FigCFWeakReferenceStore((id *)(*(_QWORD *)(a1 + 32) + 40), *(id *)(a1 + 48));
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = 0;
  }
}

@end

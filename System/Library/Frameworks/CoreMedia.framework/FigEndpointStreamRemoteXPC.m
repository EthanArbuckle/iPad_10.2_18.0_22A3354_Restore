@implementation FigEndpointStreamRemoteXPC

uint64_t __FigEndpointStreamRemoteXPC_runAllCallbacks_block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 40) + 24);
  *(_QWORD *)(*(_QWORD *)(result + 40) + 24) = 0;
  return result;
}

void __FigEndpointStreamRemoteXPC_sendMessageSynchronouslyExpectingCompletionCallback_block_invoke(_QWORD *a1)
{
  uint64_t DerivedStorage;
  uint64_t v3;
  uint64_t v4;
  __CFDictionary *v5;

  DerivedStorage = CMBaseObjectGetDerivedStorage(a1[5]);
  v3 = *(_QWORD *)(DerivedStorage + 32);
  v4 = 1;
  if ((unint64_t)(v3 + 1) > 1)
    v4 = v3 + 1;
  *(_QWORD *)(DerivedStorage + 32) = v4;
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = v3;
  v5 = *(__CFDictionary **)(a1[6] + 24);
  if (v5)
    CFDictionarySetValue(v5, *(const void **)(*(_QWORD *)(a1[4] + 8) + 24), a1 + 7);
}

void __FigEndpointStreamRemoteXPC_sendMessageSynchronouslyExpectingCompletionCallback_block_invoke_2(_QWORD *a1)
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

@end

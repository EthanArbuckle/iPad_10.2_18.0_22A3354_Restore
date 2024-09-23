@implementation FigEndpointStreamAudioEngineRemoteXPC

void __FigEndpointStreamAudioEngineRemoteXPC_ensureClientEstablished_block_invoke(uint64_t a1)
{
  __CFDictionary *Mutable;

  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CA54A0], CFSTR("EndpointStreamAudioEngine_ServerConnectionDied"));
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CA54B8], (const void *)*MEMORY[0x1E0C9AE50]);
  FigCFDictionarySetInt32();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = FigXPCRemoteClientCreate();
  if (Mutable)
    CFRelease(Mutable);
}

void __FigEndpointStreamAudioEngineRemoteXPC_runAllCallbacks_block_invoke(_QWORD *a1)
{
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = CFDictionaryCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], *(CFDictionaryRef *)(a1[6] + 24));
  if (*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24))
    CFDictionaryRemoveAllValues(*(CFMutableDictionaryRef *)(a1[6] + 24));
  else
    *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = -15480;
}

uint64_t __FigEndpointStreamAudioEngineRemoteXPC_sendMessageSynchronouslyExpectingCompletionCallback_block_invoke(uint64_t a1)
{
  uint64_t DerivedStorage;
  uint64_t v3;
  uint64_t v4;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v3 = *(_QWORD *)(DerivedStorage + 32);
  v4 = 1;
  if ((unint64_t)(v3 + 1) > 1)
    v4 = v3 + 1;
  *(_QWORD *)(DerivedStorage + 32) = v4;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v3;
  return FigCFDictionarySetValue();
}

void __FigEndpointStreamAudioEngineRemoteXPC_tryRemoveCallback_block_invoke(uint64_t a1)
{
  if (CFDictionaryContainsKey(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 40) + 24), *(const void **)(a1 + 48)))
  {
    CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(a1 + 40) + 24), *(const void **)(a1 + 48));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }
}

@end

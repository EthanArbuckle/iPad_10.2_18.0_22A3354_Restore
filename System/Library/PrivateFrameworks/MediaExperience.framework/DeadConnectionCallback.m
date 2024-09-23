@implementation DeadConnectionCallback

void __remoteXPCRoutingContext_DeadConnectionCallback_block_invoke(uint64_t a1)
{
  CFDictionaryRemoveValue((CFMutableDictionaryRef)gFigRoutingContextRemoteObject_0, *(const void **)(a1 + 32));
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void __routingSessionManagerRemote_DeadConnectionCallback_block_invoke(uint64_t a1)
{
  uint64_t DerivedStorage;
  const __CFArray *v3;
  CFIndex v4;
  const __CFDictionary *ValueAtIndex;
  const void *v6;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  MEMORY[0x1940352F8](*(_QWORD *)(DerivedStorage + 16));
  v3 = (const __CFArray *)FigCFDictionaryCopyArrayOfValues();
  CFDictionaryRemoveAllValues(*(CFMutableDictionaryRef *)(DerivedStorage + 24));
  MEMORY[0x194035304](*(_QWORD *)(DerivedStorage + 16));
  if (v3)
  {
    if (CFArrayGetCount(v3) >= 1)
    {
      v4 = 0;
      do
      {
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v3, v4);
        routingSessionManagerRemote_runOneCallback(ValueAtIndex, 4294951902);
        ++v4;
      }
      while (v4 < CFArrayGetCount(v3));
    }
    CFRelease(v3);
  }
  v6 = *(const void **)(a1 + 32);
  if (v6)
    CFRelease(v6);
}

@end

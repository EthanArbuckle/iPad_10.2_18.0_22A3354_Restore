@implementation FigRoutingContextRemoteCreateVideoContext

void __FigRoutingContextRemoteCreateVideoContext_block_invoke(uint64_t a1)
{
  uint64_t DerivedStorage;
  uint64_t v3;
  void (*v4)(uint64_t, const __CFString *, _QWORD, void **);
  const void *v5;
  const void *v6;
  const void *v7;
  void *v8;
  void *key;

  key = 0;
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v3 = **(_QWORD **)(a1 + 32);
  v4 = *(void (**)(uint64_t, const __CFString *, _QWORD, void **))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                           + 48);
  if (v4)
  {
    v4(v3, CFSTR("contextUUID"), *MEMORY[0x1E0C9AE00], &key);
    if (key)
    {
      v5 = (const void *)FigCFWeakReferenceHolderCreateWithReferencedObject();
      if (v5)
      {
        v6 = v5;
        CFDictionarySetValue((CFMutableDictionaryRef)gFigRoutingContextRemoteObject_0, key, v5);
        CFRelease(v6);
      }
      v7 = *(const void **)(DerivedStorage + 72);
      v8 = key;
      *(_QWORD *)(DerivedStorage + 72) = key;
      if (v8)
        CFRetain(v8);
      if (v7)
        CFRelease(v7);
      if (key)
        CFRelease(key);
    }
  }
}

@end

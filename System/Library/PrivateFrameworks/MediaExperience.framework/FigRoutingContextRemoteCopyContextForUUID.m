@implementation FigRoutingContextRemoteCopyContextForUUID

void __FigRoutingContextRemoteCopyContextForUUID_block_invoke(uint64_t a1)
{
  uint64_t v2;
  CFTypeRef *v3;
  uint64_t v4;
  uint64_t DerivedStorage;
  uint64_t v6;
  void (*v7)(uint64_t, const __CFString *, _QWORD, void **);
  const void *v8;
  const void *v9;
  const void *v10;
  void *v11;
  void *key;

  if (CFDictionaryGetValue((CFDictionaryRef)gFigRoutingContextRemoteObject_0, *(const void **)(a1 + 48)))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = FigCFWeakReferenceHolderCopyReferencedObject();
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(_QWORD *)(v2 + 24);
  v3 = (CFTypeRef *)(v2 + 24);
  if (!v4)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = routingContext_create(1uLL, *(const __CFDictionary **)(a1 + 64), 1, v3);
    if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    {
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      {
        key = 0;
        DerivedStorage = CMBaseObjectGetDerivedStorage();
        v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
        v7 = *(void (**)(uint64_t, const __CFString *, _QWORD, void **))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                             + 8)
                                                                                 + 48);
        if (v7)
        {
          v7(v6, CFSTR("contextUUID"), *MEMORY[0x1E0C9AE00], &key);
          if (key)
          {
            v8 = (const void *)FigCFWeakReferenceHolderCreateWithReferencedObject();
            if (v8)
            {
              v9 = v8;
              CFDictionarySetValue((CFMutableDictionaryRef)gFigRoutingContextRemoteObject_0, key, v8);
              CFRelease(v9);
            }
            v10 = *(const void **)(DerivedStorage + 72);
            v11 = key;
            *(_QWORD *)(DerivedStorage + 72) = key;
            if (v11)
              CFRetain(v11);
            if (v10)
              CFRelease(v10);
            if (key)
              CFRelease(key);
          }
        }
      }
    }
  }
}

@end

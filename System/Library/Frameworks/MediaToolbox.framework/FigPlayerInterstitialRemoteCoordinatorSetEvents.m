@implementation FigPlayerInterstitialRemoteCoordinatorSetEvents

void __FigPlayerInterstitialRemoteCoordinatorSetEvents_block_invoke(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t v2;
  const __CFArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t DerivedStorage;
  CFIndex Count;
  __CFArray *Mutable;
  uint64_t v9;
  const void *v10;
  CFIndex v11;
  int v12;
  const __CFDictionary *ValueAtIndex;
  CFTypeRef *v14;
  uint64_t v15;
  _QWORD *v16;
  const void *v17;
  uint64_t v18;
  const void *v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  CFTypeRef cf;
  void *value;

  v1 = a1;
  v2 = a1[6];
  v3 = (const __CFArray *)a1[7];
  v4 = a1[5];
  v5 = *(_QWORD *)(a1[4] + 8);
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (v3)
    Count = CFArrayGetCount(v3);
  else
    Count = 0;
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
  if (Mutable)
  {
    v22 = v5;
    v9 = FigCFWeakReferenceHolderCopyReferencedObject();
    if (v9)
    {
      v10 = (const void *)v9;
      v21 = v1;
      if (Count < 1)
      {
        LOBYTE(v12) = 0;
      }
      else
      {
        v11 = 0;
        v12 = 0;
        do
        {
          value = 0;
          ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v3, v11);
          cf = 0;
          if (FigPlayerInterstitialEventCreateFromDictionary(v2, ValueAtIndex, (uint64_t *)&cf) || !cf)
            break;
          v14 = FigPlayerInterstitialEventCopyIdentifier((uint64_t)cf);
          if (*(_QWORD *)(DerivedStorage + 144) && !v12)
            v12 = FigCFEqual();
          if ((*(unsigned int (**)(uint64_t, const void *, CFTypeRef, _QWORD, void **))(DerivedStorage + 96))(v4, v10, cf, 0, &value)|| !value)
          {
            break;
          }
          CFArrayAppendValue(Mutable, value);
          CFRelease(cf);
          if (value)
            CFRelease(value);
          if (v14)
            CFRelease(v14);
          ++v11;
        }
        while (Count != v11);
      }
      CFRelease(v10);
      v1 = v21;
    }
    else
    {
      FigSignalErrorAt();
      LOBYTE(v12) = 0;
    }
    *(_BYTE *)(v22 + 24) = v12;
    v16 = v1 + 8;
    v15 = v1[8];
    v17 = *(const void **)(v15 + 136);
    *(_QWORD *)(v15 + 136) = Mutable;
    CFRetain(Mutable);
    if (v17)
      goto LABEL_24;
  }
  else
  {
    *(_BYTE *)(v5 + 24) = 0;
    v16 = v1 + 8;
    v20 = v1[8];
    v17 = *(const void **)(v20 + 136);
    *(_QWORD *)(v20 + 136) = 0;
    if (v17)
LABEL_24:
      CFRelease(v17);
  }
  v18 = *(_QWORD *)(v1[4] + 8);
  if (*(_BYTE *)(v18 + 24))
    goto LABEL_28;
  v19 = *(const void **)(*v16 + 144);
  if (v19)
  {
    CFRelease(v19);
    *(_QWORD *)(*v16 + 144) = 0;
LABEL_28:
    if (!Mutable)
      return;
    goto LABEL_29;
  }
  *(_BYTE *)(v18 + 24) = 1;
  if (Mutable)
LABEL_29:
    CFRelease(Mutable);
}

@end

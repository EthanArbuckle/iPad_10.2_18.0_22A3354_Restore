@implementation APConnectivityHelperRegisterForEvent

void __APConnectivityHelperRegisterForEvent_block_invoke(uint64_t a1)
{
  const void *Value;
  CFAllocatorRef *v3;
  const __CFSet *v4;
  __CFSet *v5;
  CFMutableSetRef v6;
  int v7;
  const void *v8;
  const void *v9;
  uint64_t v10;
  CFMutableArrayRef Mutable;
  CFMutableArrayRef v12;
  int v13;
  const void *v14;
  char v15;
  uint64_t v16;
  unsigned int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t, const void *);
  void *v22;
  uint64_t v23;
  const void *v24;
  int v25;

  v16 = *(_QWORD *)(a1 + 40);
  v17 = *(_DWORD *)(a1 + 56);
  v18 = 0;
  Value = CFDictionaryGetValue(*(CFDictionaryRef *)(v16 + 216), (const void *)v17);
  v3 = (CFAllocatorRef *)MEMORY[0x1E0C9AE00];
  if (Value)
  {
    v4 = (const __CFSet *)CFRetain(Value);
    if (v4)
    {
      v5 = v4;
      if (CFSetContainsValue(v4, *(const void **)(a1 + 48)))
        goto LABEL_25;
LABEL_7:
      CFSetAddValue(v5, *(const void **)(a1 + 48));
      if (gLogCategory_APConnectivityHelper <= 50
        && (gLogCategory_APConnectivityHelper != -1 || _LogCategory_Initialize()))
      {
        APConnectivityHelperGetEventString(*(_DWORD *)(a1 + 56));
        CFSetGetCount(v5);
        LogPrintF();
      }
      if (CFSetGetCount(v5) == 1)
      {
        _APConnectivityHelperStartListeningToEvent(&v16);
        v7 = v18;
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v18;
        if (v7)
LABEL_40:
          APSLogErrorAt();
LABEL_25:
        if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
        {
LABEL_36:
          CFRelease(v5);
          return;
        }
        CFSetRemoveValue(v5, *(const void **)(a1 + 48));
        v15 = 0;
        goto LABEL_27;
      }
      v8 = (const void *)*(unsigned int *)(a1 + 56);
      if (v8 > 8 || ((1 << (char)v8) & 0x1DA) == 0)
        goto LABEL_25;
      v10 = *(_QWORD *)(a1 + 40);
      v9 = *(const void **)(a1 + 48);
      Mutable = CFArrayCreateMutable(*v3, 0, MEMORY[0x1E0C9B378]);
      if (!Mutable)
        goto LABEL_40;
      v12 = Mutable;
      if ((_DWORD)v8 == 6)
      {
        v19 = MEMORY[0x1E0C809B0];
        v20 = 3221225472;
        v21 = ___APConnectivityHelperReplayEvents_block_invoke;
        v22 = &__block_descriptor_52_e15_v24__0r_v8r_v16l;
        v23 = v10;
        v24 = v9;
        v13 = 6;
      }
      else
      {
        if ((_DWORD)v8 != 4)
        {
          v14 = CFDictionaryGetValue(*(CFDictionaryRef *)(v10 + 232), v8);
          if (v14)
            _APConnectivityHelperReplayEvent(v10, v9, (int)v8, v14);
          goto LABEL_24;
        }
        v19 = MEMORY[0x1E0C809B0];
        v20 = 3221225472;
        v21 = ___APConnectivityHelperReplayEvents_block_invoke;
        v22 = &__block_descriptor_52_e15_v24__0r_v8r_v16l;
        v23 = v10;
        v24 = v9;
        v13 = 4;
      }
      v25 = v13;
      CFDictionaryApplyBlock();
LABEL_24:
      CFRelease(v12);
      goto LABEL_25;
    }
  }
  v6 = CFSetCreateMutable(*v3, 0, MEMORY[0x1E0C9B3B0]);
  if (v6)
  {
    v5 = v6;
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(a1 + 40) + 216), (const void *)*(unsigned int *)(a1 + 56), v6);
    goto LABEL_7;
  }
  APSLogErrorAt();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -6728;
  if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    return;
  v5 = 0;
  v15 = 1;
LABEL_27:
  if (gLogCategory_APConnectivityHelper <= 90
    && (gLogCategory_APConnectivityHelper != -1 || _LogCategory_Initialize()))
  {
    APConnectivityHelperGetEventString(*(_DWORD *)(a1 + 56));
    if ((v15 & 1) == 0)
      CFSetGetCount(v5);
    LogPrintF();
  }
  if (v5)
    goto LABEL_36;
}

@end

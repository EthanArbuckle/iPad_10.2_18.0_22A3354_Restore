@implementation APConnectivityHelperRegisterActivity

void __APConnectivityHelperRegisterActivity_block_invoke(uint64_t a1)
{
  const void *Value;
  const __CFSet *v3;
  CFMutableSetRef Mutable;
  int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  int v10;
  uint64_t v11;

  Value = CFDictionaryGetValue(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 40) + 224), (const void *)*(unsigned int *)(a1 + 56));
  if (Value && (v3 = (const __CFSet *)CFRetain(Value)) != 0)
  {
    Mutable = v3;
    if (CFSetContainsValue(v3, *(const void **)(a1 + 48)))
      goto LABEL_24;
  }
  else
  {
    Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B3B0]);
    if (!Mutable)
    {
      APSLogErrorAt();
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -6728;
      goto LABEL_24;
    }
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(a1 + 40) + 224), (const void *)*(unsigned int *)(a1 + 56), Mutable);
  }
  if (gLogCategory_APConnectivityHelper <= 50
    && (gLogCategory_APConnectivityHelper != -1 || _LogCategory_Initialize()))
  {
    CFSetGetCount(Mutable);
    LogPrintF();
  }
  if (!CFSetGetCount(Mutable))
  {
    if (*(_DWORD *)(a1 + 56))
    {
      v5 = -6735;
    }
    else
    {
      v6 = *(_QWORD *)(a1 + 40);
      v11 = 0;
      if (*(_QWORD *)(v6 + 64))
      {
        v5 = 0;
LABEL_22:
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v5;
        if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
        {
          APSLogErrorAt();
          goto LABEL_24;
        }
        goto LABEL_23;
      }
      v7 = objc_msgSend(MEMORY[0x1E0D1BA38], "activityWithType:reason:", 4, 0);
      if (v7)
      {
        v8 = (void *)v7;
        if ((objc_msgSend(*(id *)(v6 + 40), "beginActivity:error:", v7, &v11) & 1) != 0)
        {
          v9 = v8;
          v5 = 0;
          *(_QWORD *)(v6 + 64) = v9;
          goto LABEL_22;
        }
        v10 = NSErrorToOSStatus();
        if (v10)
          v5 = v10;
        else
          v5 = -72202;
      }
      else
      {
        v5 = -72202;
      }
    }
    APSLogErrorAt();
    goto LABEL_22;
  }
LABEL_23:
  CFSetAddValue(Mutable, *(const void **)(a1 + 48));
LABEL_24:
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24)
    && gLogCategory_APConnectivityHelper <= 90
    && (gLogCategory_APConnectivityHelper != -1 || _LogCategory_Initialize()))
  {
    if (Mutable)
      CFSetGetCount(Mutable);
    LogPrintF();
  }
  if (Mutable)
    CFRelease(Mutable);
}

@end

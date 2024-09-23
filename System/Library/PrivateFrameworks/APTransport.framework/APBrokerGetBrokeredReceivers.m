@implementation APBrokerGetBrokeredReceivers

void __APBrokerGetBrokeredReceivers_block_invoke(uint64_t a1, CFMutableDictionaryRef Mutable, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  int v9;
  int v10;
  uint64_t v11;
  CFTypeRef cf;

  v11 = 0;
  cf = 0;
  v9 = gLogCategory_APBroker;
  if (gLogCategory_APBroker <= 50)
  {
    if (gLogCategory_APBroker == -1)
    {
      if (!_LogCategory_Initialize())
        goto LABEL_9;
      v9 = gLogCategory_APBroker;
    }
    if (v9 == -1)
      _LogCategory_Initialize();
    LogPrintF();
  }
LABEL_9:
  if (a6)
    goto LABEL_22;
  if (!Mutable)
  {
    APSLogErrorAt();
    a6 = -6705;
    goto LABEL_14;
  }
  v10 = APBrokerCreateBrokeredReceiversFromBrokerResponse(*(_QWORD *)(a1 + 48), (uint64_t)Mutable, (CFMutableDictionaryRef *)&cf, &v11);
  if (v10)
  {
    a6 = v10;
LABEL_22:
    APSLogErrorAt();
    Mutable = 0;
    goto LABEL_14;
  }
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (Mutable)
  {
    FigCFDictionarySetValue();
    CFDictionarySetInt64();
    a6 = 0;
  }
  else
  {
    APSLogErrorAt();
    a6 = -6728;
  }
LABEL_14:
  _CallRequestCallbackBlock(a6, *(NSObject **)(a1 + 56), Mutable, *(void **)(a1 + 32));
  if (cf)
    CFRelease(cf);
  if (Mutable)
    CFRelease(Mutable);
  CFRelease(*(CFTypeRef *)(a1 + 48));
  dispatch_release(*(dispatch_object_t *)(a1 + 56));
  _Block_release(*(const void **)(a1 + 32));
}

@end

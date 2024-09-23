@implementation APBrokerGetInfo

void __APBrokerGetInfo_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  int v8;
  CFMutableDictionaryRef Mutable;

  v8 = gLogCategory_APBroker;
  if (gLogCategory_APBroker > 50)
    goto LABEL_9;
  if (gLogCategory_APBroker == -1)
  {
    if (!_LogCategory_Initialize())
      goto LABEL_9;
    v8 = gLogCategory_APBroker;
  }
  if (v8 == -1)
    _LogCategory_Initialize();
  LogPrintF();
LABEL_9:
  if (a6)
  {
    APSLogErrorAt();
    Mutable = 0;
  }
  else
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    FigCFDictionarySetValueFromKeyInDict();
  }
  _CallRequestCallbackBlock(a6, *(NSObject **)(a1 + 48), Mutable, *(void **)(a1 + 32));
  if (Mutable)
    CFRelease(Mutable);
  dispatch_release(*(dispatch_object_t *)(a1 + 48));
  _Block_release(*(const void **)(a1 + 32));
}

@end

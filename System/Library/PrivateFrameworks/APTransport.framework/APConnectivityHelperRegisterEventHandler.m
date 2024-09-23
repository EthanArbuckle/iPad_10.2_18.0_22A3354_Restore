@implementation APConnectivityHelperRegisterEventHandler

void __APConnectivityHelperRegisterEventHandler_block_invoke(uint64_t a1)
{
  if (gLogCategory_APConnectivityHelper <= 50
    && (gLogCategory_APConnectivityHelper != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(a1 + 32) + 208), *(const void **)(a1 + 40), *(const void **)(a1 + 48));
}

@end

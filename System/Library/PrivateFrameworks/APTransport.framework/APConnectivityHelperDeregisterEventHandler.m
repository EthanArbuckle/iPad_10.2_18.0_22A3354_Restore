@implementation APConnectivityHelperDeregisterEventHandler

void __APConnectivityHelperDeregisterEventHandler_block_invoke(uint64_t a1)
{
  if (gLogCategory_APConnectivityHelper <= 50
    && (gLogCategory_APConnectivityHelper != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(a1 + 32) + 208), *(const void **)(a1 + 40));
}

@end

@implementation APBrokerGetReceiverConnectivityInfo

void __APBrokerGetReceiverConnectivityInfo_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int BrokeredReceiverConnectivityInfoFromBrokerResponse)
{
  CFTypeRef cf;

  cf = 0;
  if (gLogCategory_APBroker <= 50 && (gLogCategory_APBroker != -1 || _LogCategory_Initialize()))
  {
    if (*(_QWORD *)(a1 + 48))
      IsAppleInternalBuild();
    if (gLogCategory_APBroker == -1)
      _LogCategory_Initialize();
    LogPrintF();
  }
  if (BrokeredReceiverConnectivityInfoFromBrokerResponse
    || (BrokeredReceiverConnectivityInfoFromBrokerResponse = APBrokerCreateBrokeredReceiverConnectivityInfoFromBrokerResponse(a2, a4, (__CFDictionary **)&cf)) != 0)
  {
    APSLogErrorAt();
  }
  _CallRequestCallbackBlock(BrokeredReceiverConnectivityInfoFromBrokerResponse, *(NSObject **)(a1 + 56), cf, *(void **)(a1 + 32));
  CFRelease(*(CFTypeRef *)(a1 + 48));
  if (cf)
    CFRelease(cf);
  dispatch_release(*(dispatch_object_t *)(a1 + 56));
  _Block_release(*(const void **)(a1 + 32));
}

@end

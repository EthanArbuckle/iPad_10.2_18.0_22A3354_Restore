@implementation APBrokerGroupDoReceiverPolling

void ___APBrokerGroupDoReceiverPolling_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (**a5)(_QWORD))
{
  uint64_t v9;
  const void *v10;
  void *v11;
  _QWORD v12[8];

  v9 = FigCFWeakReferenceHolderCreateWithReferencedObject();
  if (v9)
  {
    v10 = (const void *)v9;
    v11 = _Block_copy(a5);
    CFRetain(v10);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 0x40000000;
    v12[2] = ___APBrokerGroupPollOneBrokerForReceivers_block_invoke;
    v12[3] = &unk_1E8257A10;
    v12[6] = a2;
    v12[7] = v10;
    v12[4] = v11;
    v12[5] = a4;
    APBrokerGetBrokeredReceivers(a3, v12);
    CFRelease(v10);
  }
  else
  {
    APSLogErrorAt();
    *(_DWORD *)(a4 + 4) = -6728;
    *(_BYTE *)a4 = 1;
    a5[2](a5);
  }
}

void ___APBrokerGroupDoReceiverPolling_block_invoke_2(int a1, uint64_t a2, int a3, CFDictionaryRef theDict)
{
  if (!theDict || !CFDictionaryContainsKey(theDict, CFSTR("brokerTimeoutSecs")))
    _APBrokerDoReceiverPollingIfNecessary(a2, 5);
}

@end

@implementation APBrokerManagerEnsureReceiverPollingStarted

uint64_t ___APBrokerManagerEnsureReceiverPollingStarted_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = APBrokerGroupStartReceiverPolling(a3);
  if ((_DWORD)result)
    return APSLogErrorAt();
  return result;
}

@end

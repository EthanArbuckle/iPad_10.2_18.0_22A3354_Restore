@implementation APBrokerCreateBrokeredReceiverConnectivityInfoFromBrokerResponse

CFTypeID __APBrokerCreateBrokeredReceiverConnectivityInfoFromBrokerResponse_block_invoke(CFTypeID result, CFTypeRef cf)
{
  uint64_t v2;
  CFTypeID v3;

  v2 = result;
  if (!cf || (v3 = CFGetTypeID(cf), result = CFStringGetTypeID(), v3 != result))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v2 + 32) + 8) + 24) = 0;
  return result;
}

@end

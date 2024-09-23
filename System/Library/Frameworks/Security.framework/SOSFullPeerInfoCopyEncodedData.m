@implementation SOSFullPeerInfoCopyEncodedData

uint64_t __SOSFullPeerInfoCopyEncodedData_block_invoke(uint64_t a1, uint64_t a2, UInt8 *a3)
{
  return SOSFullPeerInfoEncodeToDER(*(_QWORD *)(a1 + 32), *(CFTypeRef **)(a1 + 40), a3);
}

@end

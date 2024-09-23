@implementation SOSPeerInfoCopyEncodedData

uint64_t __SOSPeerInfoCopyEncodedData_block_invoke(uint64_t a1, uint64_t a2, UInt8 *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return SOSPeerInfoEncodeToDER(*(_QWORD *)(a1 + 32), *(CFTypeRef **)(a1 + 40), a3, (uint64_t)&a3[a2], a5, a6, a7, a8);
}

@end

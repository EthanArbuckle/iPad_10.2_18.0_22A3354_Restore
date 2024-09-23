@implementation SOSPeerInfoArrayEncodeToDER

uint64_t __SOSPeerInfoArrayEncodeToDER_block_invoke(uint64_t a1, CFTypeRef cf)
{
  CFTypeID v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = CFGetTypeID(cf);
  result = SOSPeerInfoGetTypeID();
  if (v4 != result)
  {
    result = SOSCreateErrorWithFormat(1040, 0, *(CFTypeRef **)(a1 + 40), 0, CFSTR("%@"), CFSTR("Non SOSPeerInfo in array"));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }
  v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (v10)
  {
    result = SOSPeerInfoEncodeToDER((uint64_t)cf, *(CFTypeRef **)(a1 + 40), *(UInt8 **)(a1 + 48), v10, v6, v7, v8, v9);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  }
  return result;
}

@end

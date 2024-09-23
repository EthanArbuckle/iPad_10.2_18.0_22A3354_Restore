@implementation SOSPeerInfoArrayGetDEREncodedSize

uint64_t __SOSPeerInfoArrayGetDEREncodedSize_block_invoke(uint64_t a1, CFTypeRef cf)
{
  CFTypeID v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  __CFString **v12;

  if (cf && (v4 = CFGetTypeID(cf), v4 == SOSPeerInfoGetTypeID()))
  {
    result = SOSPeerInfoGetDEREncodedSize((uint64_t)cf, *(CFTypeRef **)(a1 + 48), v5, v6, v7, v8, v9, v10);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result == 0;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += result;
  }
  else
  {
    v12 = *(__CFString ***)(a1 + 48);
    if (v12)
      result = SOSCreateErrorWithFormat(1040, *v12, (CFTypeRef *)v12, 0, CFSTR("%@"), CFSTR("Non SOSPeerInfo in array"));
    else
      result = SOSCreateErrorWithFormat(1040, 0, 0, 0, CFSTR("%@"), CFSTR("Non SOSPeerInfo in array"));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }
  return result;
}

@end

@implementation SOSPerformWithUnwrappedData

uint64_t __SOSPerformWithUnwrappedData_block_invoke(uint64_t a1)
{
  uint64_t v2;
  const UInt8 *BytePtr;

  CFDataGetLength(*(CFDataRef *)(a1 + 56));
  BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 56));
  v2 = ccec_rfc6637_unwrap_key();
  if ((_DWORD)v2)
    return SOSErrorCreate(1028, *(CFTypeRef **)(a1 + 64), 0, CFSTR("ccec_rfc6637_unwrap_key failed with %d"), v2, BytePtr);
  else
    return SecRequirementError(0, *(CFTypeRef **)(a1 + 64), CFSTR("Unexpected algorithm: %d"), 170);
}

@end

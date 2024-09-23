@implementation APAdvertiserCreate

uint64_t __APAdvertiserCreate_block_invoke(uint64_t a1)
{
  uint64_t result;

  if (*(_BYTE *)(a1 + 48))
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 56) |= 1u;
  result = (uint64_t)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), CFSTR("P2PConfig"));
  if (result)
  {
    result = _APAdvertiserProcessP2PConfig(*(_QWORD *)(a1 + 32));
    if ((_DWORD)result)
      return APSLogErrorAt();
  }
  return result;
}

@end

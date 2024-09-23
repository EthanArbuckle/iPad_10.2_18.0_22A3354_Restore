@implementation CCNCopyAsHex

CFTypeRef __CCNCopyAsHex_block_invoke(CFTypeRef result, CFTypeRef cf)
{
  uint64_t v3;

  v3 = (uint64_t)result;
  if (cf)
    result = CFRetain(cf);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 32) + 8) + 24) = cf;
  return result;
}

@end

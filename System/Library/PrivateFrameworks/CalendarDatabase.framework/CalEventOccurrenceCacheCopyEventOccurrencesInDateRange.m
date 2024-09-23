@implementation CalEventOccurrenceCacheCopyEventOccurrencesInDateRange

CFTypeRef ___CalEventOccurrenceCacheCopyEventOccurrencesInDateRange_block_invoke(CFTypeRef result, CFTypeRef cf)
{
  uint64_t v2;

  if (cf)
  {
    v2 = (uint64_t)result;
    result = CFRetain(cf);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 32) + 8) + 24) = result;
  }
  return result;
}

@end

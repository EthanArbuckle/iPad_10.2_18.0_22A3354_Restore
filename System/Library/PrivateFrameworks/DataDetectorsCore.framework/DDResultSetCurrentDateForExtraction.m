@implementation DDResultSetCurrentDateForExtraction

CFTypeRef __DDResultSetCurrentDateForExtraction_block_invoke(uint64_t a1)
{
  CFTypeRef result;

  result = *(CFTypeRef *)(a1 + 32);
  if (result)
  {
    result = CFRetain(result);
    _sDateForExtraction = (uint64_t)result;
  }
  return result;
}

@end

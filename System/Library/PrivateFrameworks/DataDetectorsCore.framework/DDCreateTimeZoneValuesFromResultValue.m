@implementation DDCreateTimeZoneValuesFromResultValue

const __CFString *__DDCreateTimeZoneValuesFromResultValue_block_invoke()
{
  const __CFString *result;

  result = createPropertyListForResource(CFSTR("TimeZones"));
  DDCreateTimeZoneValuesFromResultValue__sTimeZonesPlist = (uint64_t)result;
  return result;
}

@end

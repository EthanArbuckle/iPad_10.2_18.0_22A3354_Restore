@implementation NSNumber(HearingCore)

- (uint64_t)localizedFormat
{
  if (localizedFormat_HCNumberFormatterOnceToken != -1)
    dispatch_once(&localizedFormat_HCNumberFormatterOnceToken, &__block_literal_global_92);
  return objc_msgSend((id)localizedFormat_HCNumberFormatter, "stringFromNumber:", a1);
}

@end

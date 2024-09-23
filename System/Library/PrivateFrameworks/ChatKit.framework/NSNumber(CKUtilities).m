@implementation NSNumber(CKUtilities)

- (uint64_t)__ck_localizedString
{
  if (__ck_localizedString_once != -1)
    dispatch_once(&__ck_localizedString_once, &__block_literal_global_587);
  return objc_msgSend((id)__ck_localizedString_sNumberFormatter, "stringFromNumber:", a1);
}

@end

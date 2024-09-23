@implementation NSCharacterSet(MailCoreAdditions)

+ (id)ef_unsafeDomainNameCharacterSet
{
  if (ef_unsafeDomainNameCharacterSet_onceToken != -1)
    dispatch_once(&ef_unsafeDomainNameCharacterSet_onceToken, &__block_literal_global_13);
  return (id)ef_unsafeDomainNameCharacterSet_unsafeDomainNameCharacterSet;
}

+ (id)ef_unsafeAddressLocalPartCharacterSet
{
  if (ef_unsafeAddressLocalPartCharacterSet_onceToken != -1)
    dispatch_once(&ef_unsafeAddressLocalPartCharacterSet_onceToken, &__block_literal_global_2_0);
  return (id)ef_unsafeAddressLocalPartCharacterSet_unsafeAddressLocalPartCharacterSet;
}

+ (id)ef_asciiAlphaNumericCharacterSet
{
  if (ef_asciiAlphaNumericCharacterSet_onceToken != -1)
    dispatch_once(&ef_asciiAlphaNumericCharacterSet_onceToken, &__block_literal_global_5_0);
  return (id)ef_asciiAlphaNumericCharacterSet_sAsciiAlphaNumericCharacterSet;
}

+ (id)ef_rfc6376WhitespaceCharacterSet
{
  if (ef_rfc6376WhitespaceCharacterSet_onceToken != -1)
    dispatch_once(&ef_rfc6376WhitespaceCharacterSet_onceToken, &__block_literal_global_6_2);
  return (id)ef_rfc6376WhitespaceCharacterSet_rfc6376WhitespaceCharacterSet;
}

@end

@implementation NSCharacterSet(_HKXMLExtractorCharacterSets)

+ (id)hk_forwardSlashCharacterSet
{
  if (hk_forwardSlashCharacterSet_once != -1)
    dispatch_once(&hk_forwardSlashCharacterSet_once, &__block_literal_global_112);
  return (id)hk_forwardSlashCharacterSet_sharedForwardSlashSet;
}

+ (id)hk_percentCharacterSet
{
  if (hk_percentCharacterSet_once != -1)
    dispatch_once(&hk_percentCharacterSet_once, &__block_literal_global_143);
  return (id)hk_percentCharacterSet_sharedPercentSet;
}

+ (id)hk_equalCharacterSet
{
  if (hk_equalCharacterSet_once != -1)
    dispatch_once(&hk_equalCharacterSet_once, &__block_literal_global_146);
  return (id)hk_equalCharacterSet_sharedEqualSet;
}

@end

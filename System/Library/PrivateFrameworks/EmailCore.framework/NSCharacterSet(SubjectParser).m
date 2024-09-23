@implementation NSCharacterSet(SubjectParser)

+ (id)ec_prefixDelimiterCharacterSet
{
  if (ec_prefixDelimiterCharacterSet_onceToken != -1)
    dispatch_once(&ec_prefixDelimiterCharacterSet_onceToken, &__block_literal_global_20);
  return (id)ec_prefixDelimiterCharacterSet_prefixDelimiterCharacterSet;
}

@end

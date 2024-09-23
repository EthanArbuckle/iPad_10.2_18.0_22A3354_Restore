@implementation NSNumberFormatter(MTUtilities)

+ (id)mtDecimalStyleNumberFormatter
{
  if (mtDecimalStyleNumberFormatter_onceToken != -1)
    dispatch_once(&mtDecimalStyleNumberFormatter_onceToken, &__block_literal_global_218);
  return (id)mtDecimalStyleNumberFormatter__decimalStyleumberFormatter;
}

@end

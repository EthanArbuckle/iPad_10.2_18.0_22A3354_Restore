@implementation NSDateFormatter(MTUtilities)

+ (id)mtTimeOnlyFormatter
{
  if (mtTimeOnlyFormatter_onceToken != -1)
    dispatch_once(&mtTimeOnlyFormatter_onceToken, &__block_literal_global_214);
  return (id)mtTimeOnlyFormatter__timeOnlyFormatter;
}

@end

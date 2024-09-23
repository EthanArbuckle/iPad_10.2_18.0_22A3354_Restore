@implementation NSDateComponentsFormatter(HealthUI)

+ (id)hk_fullStyleDateComponentsFormatter
{
  if (hk_fullStyleDateComponentsFormatter_onceToken != -1)
    dispatch_once(&hk_fullStyleDateComponentsFormatter_onceToken, &__block_literal_global_467);
  return (id)hk_fullStyleDateComponentsFormatter___dateComponentsFormatter;
}

@end

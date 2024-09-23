@implementation NSBundle(DoNotDisturbKit)

+ (id)dndk_localizationBundle
{
  if (dndk_localizationBundle_onceToken != -1)
    dispatch_once(&dndk_localizationBundle_onceToken, &__block_literal_global_1);
  return (id)dndk_localizationBundle_bundle;
}

@end

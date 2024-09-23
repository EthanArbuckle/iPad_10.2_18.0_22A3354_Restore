@implementation NSBundle(DoNotDisturb)

+ (id)dnd_doNotDisturbLocalizationBundle
{
  if (dnd_doNotDisturbLocalizationBundle_onceToken != -1)
    dispatch_once(&dnd_doNotDisturbLocalizationBundle_onceToken, &__block_literal_global_10);
  return (id)dnd_doNotDisturbLocalizationBundle_bundle;
}

+ (id)dnd_locationBundle
{
  if (dnd_locationBundle_onceToken != -1)
    dispatch_once(&dnd_locationBundle_onceToken, &__block_literal_global_10);
  return (id)dnd_locationBundle_bundle;
}

@end

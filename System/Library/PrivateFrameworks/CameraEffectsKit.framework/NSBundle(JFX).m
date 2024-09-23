@implementation NSBundle(JFX)

+ (id)jfxBundle
{
  if (jfxBundle_onceToken != -1)
    dispatch_once(&jfxBundle_onceToken, &__block_literal_global_28);
  return (id)jfxBundle_jfxBundle;
}

@end

@implementation ATXLocationManager(Singleton)

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_6 != -1)
    dispatch_once(&sharedInstance_onceToken_6, &__block_literal_global_108);
  return (id)sharedInstance_instance_1;
}

@end

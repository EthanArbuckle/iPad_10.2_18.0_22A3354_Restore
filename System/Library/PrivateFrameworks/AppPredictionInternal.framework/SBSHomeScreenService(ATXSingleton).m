@implementation SBSHomeScreenService(ATXSingleton)

+ (id)atx_sharedInstance
{
  if (atx_sharedInstance_onceToken != -1)
    dispatch_once(&atx_sharedInstance_onceToken, &__block_literal_global_46);
  return (id)atx_sharedInstance_service;
}

@end

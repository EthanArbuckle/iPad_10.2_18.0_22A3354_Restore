@implementation GKSignInVisibilityManager(UISingletons)

+ (id)shared
{
  if (shared_onceToken_0 != -1)
    dispatch_once(&shared_onceToken_0, &__block_literal_global_8);
  return (id)shared_sharedInstance_0;
}

+ (id)sharedWithoutPersistence
{
  if (sharedWithoutPersistence_onceToken != -1)
    dispatch_once(&sharedWithoutPersistence_onceToken, &__block_literal_global_4);
  return (id)sharedWithoutPersistence_sharedInstance;
}

@end

@implementation CSAssetControllerFactory

+ (id)defaultController
{
  return +[CSAssetController sharedController](CSAssetController, "sharedController");
}

@end

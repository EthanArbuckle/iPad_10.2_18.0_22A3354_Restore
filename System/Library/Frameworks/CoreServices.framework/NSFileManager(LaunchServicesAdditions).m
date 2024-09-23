@implementation NSFileManager(LaunchServicesAdditions)

+ (id)_LS_frameworkFileManager
{
  if (_LS_frameworkFileManager_onceToken != -1)
    dispatch_once(&_LS_frameworkFileManager_onceToken, &__block_literal_global_78);
  return (id)_LS_frameworkFileManager_manager;
}

@end

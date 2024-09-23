@implementation MCUIDataManagerLite

- (BOOL)isDeviceManagementHidden
{
  return +[MCUIDataManager _isDeviceManagementHiddenConcrete](MCUIDataManager, "_isDeviceManagementHiddenConcrete");
}

@end

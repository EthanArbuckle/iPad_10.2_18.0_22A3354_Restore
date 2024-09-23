@implementation CXFeatures

- (BOOL)callManagementMuteControl
{
  return _os_feature_enabled_impl();
}

- (BOOL)isChannelEnabled
{
  return _os_feature_enabled_impl();
}

@end

@implementation _DDDevicePickerSceneSpecification

- (Class)clientSettingsClass
{
  return (Class)objc_opt_self();
}

- (Class)settingsClass
{
  return (Class)objc_opt_self();
}

- (id)uiSceneSessionRole
{
  return CFSTR("UISceneSessionRoleEndpointPicker");
}

@end

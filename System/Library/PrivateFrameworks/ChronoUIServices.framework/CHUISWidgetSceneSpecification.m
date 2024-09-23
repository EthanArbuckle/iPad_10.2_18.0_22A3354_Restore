@implementation CHUISWidgetSceneSpecification

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
  return CFSTR("CHUISWindowSceneSessionRoleWidget");
}

- (Class)uiSceneMinimumClass
{
  return (Class)objc_opt_self();
}

@end

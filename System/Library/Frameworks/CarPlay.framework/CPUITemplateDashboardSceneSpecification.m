@implementation CPUITemplateDashboardSceneSpecification

- (Class)settingsClass
{
  return (Class)objc_opt_class();
}

- (Class)uiSceneMinimumClass
{
  return (Class)objc_opt_self();
}

- (id)uiSceneSessionRole
{
  return CFSTR("CPTemplateApplicationDashboardSceneSessionRoleApplication");
}

- (id)initialSettingsDiffActions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v8[4] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_opt_new();
  v8[0] = v2;
  v3 = (void *)objc_opt_new();
  v8[1] = v3;
  v4 = (void *)objc_opt_new();
  v8[2] = v4;
  v5 = (void *)objc_opt_new();
  v8[3] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)baseSceneComponentClassDictionary
{
  return (id)MEMORY[0x24BDBD1B8];
}

@end

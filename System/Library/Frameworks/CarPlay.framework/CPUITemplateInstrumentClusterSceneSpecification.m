@implementation CPUITemplateInstrumentClusterSceneSpecification

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
  return CFSTR("CPTemplateApplicationInstrumentClusterSceneSessionRoleApplication");
}

- (id)initialSettingsDiffActions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[6];

  v9[5] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_opt_new();
  v9[0] = v2;
  v3 = (void *)objc_opt_new();
  v9[1] = v3;
  v4 = (void *)objc_opt_new();
  v9[2] = v4;
  v5 = (void *)objc_opt_new();
  v9[3] = v5;
  v6 = (void *)objc_opt_new();
  v9[4] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)initialActionHandlers
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_opt_new();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)baseSceneComponentClassDictionary
{
  return (id)MEMORY[0x24BDBD1B8];
}

@end

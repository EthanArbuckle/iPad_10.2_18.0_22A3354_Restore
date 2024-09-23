@implementation HealthAppNotificationsLinkBuilder

- (id)URLForNotificationSettings
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  +[HAServicesDefines internalHealthAppURLScheme](HAServicesDefines, "internalHealthAppURLScheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setScheme:", v3);

  +[HAServicesDefines healthProfileResourceSpecifier](HAServicesDefines, "healthProfileResourceSpecifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHost:", v4);

  v10[0] = CFSTR("/");
  +[HAServicesDefines healthAppNotificationSettingsPath](HAServicesDefines, "healthAppNotificationSettingsPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "componentsJoinedByString:", &stru_1E9BE3348);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPath:", v7);

  objc_msgSend(v2, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end

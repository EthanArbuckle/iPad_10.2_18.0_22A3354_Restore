@implementation FBSSceneClientSettingsDiff

+ (id)diffFromSettings:(id)a3 toSettings:(id)a4
{
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___FBSSceneClientSettingsDiff;
  objc_msgSendSuper2(&v5, sel_diffFromSettings_toSettings_, a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)settingsByApplyingToMutableCopyOfSettings:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FBSSceneClientSettingsDiff;
  -[FBSSettingsDiff settingsByApplyingToMutableCopyOfSettings:](&v4, sel_settingsByApplyingToMutableCopyOfSettings_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (Class)_settingsClass
{
  return (Class)objc_opt_class();
}

@end

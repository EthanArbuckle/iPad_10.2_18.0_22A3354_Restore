@implementation CHUISWidgetSceneClientSettings

- (BOOL)containsInteractiveControls
{
  void *v2;
  char IsYes;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "flagForSetting:", 88888);
  IsYes = BSSettingFlagIsYes();

  return IsYes;
}

- (BOOL)baseContentTouchedDown
{
  void *v2;
  char IsYes;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "flagForSetting:", 88889);
  IsYes = BSSettingFlagIsYes();

  return IsYes;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[FBSSettings initWithSettings:]([CHUISMutableWidgetSceneClientSettings alloc], "initWithSettings:", self);
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  __CFString *v5;
  objc_super v7;
  uint64_t v8;
  uint64_t v9;

  if (a3 == 88888)
    return CFSTR("containsInteractiveControls");
  if (a3 == 88889)
  {
    v5 = CFSTR("baseContentTouchedDown");
  }
  else
  {
    v8 = v3;
    v9 = v4;
    v7.receiver = self;
    v7.super_class = (Class)CHUISWidgetSceneClientSettings;
    -[FBSSettings keyDescriptionForSetting:](&v7, sel_keyDescriptionForSetting_);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

@end

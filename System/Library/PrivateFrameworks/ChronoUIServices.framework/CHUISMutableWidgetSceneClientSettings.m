@implementation CHUISMutableWidgetSceneClientSettings

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

- (void)setContainsInteractiveControls:(BOOL)a3
{
  id v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFlag:forSetting:", BSSettingFlagForBool(), 88888);

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

- (void)setBaseContentTouchedDown:(BOOL)a3
{
  id v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFlag:forSetting:", BSSettingFlagForBool(), 88889);

}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[FBSSettings initWithSettings:]([CHUISWidgetSceneClientSettings alloc], "initWithSettings:", self);
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  void *v4;
  const __CFString *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CHUISMutableWidgetSceneClientSettings;
  -[FBSSettings keyDescriptionForSetting:](&v7, sel_keyDescriptionForSetting_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 88888)
  {
    v5 = CFSTR("containsInteractiveControls");
    goto LABEL_5;
  }
  if (a3 == 88889)
  {
    v5 = CFSTR("baseContentTouchedDown");
LABEL_5:

    v4 = (void *)v5;
  }
  return v4;
}

@end

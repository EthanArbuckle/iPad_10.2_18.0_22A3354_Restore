@implementation DDPeoplePickerSceneSettings

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[FBSSettings initWithSettings:]([DDPeoplePickerMutableSceneSettings alloc], "initWithSettings:", self);
}

- (BOOL)isDedicatedDevicePicker
{
  void *v2;
  void *v3;
  char v4;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 18492850);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

@end

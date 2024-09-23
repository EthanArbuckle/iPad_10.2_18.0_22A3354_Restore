@implementation DDPeoplePickerSceneClientSettings

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[FBSSettings initWithSettings:]([DDPeoplePickerMutableSceneClientSettings alloc], "initWithSettings:", self);
}

- (NSUUID)connectedDeviceUUID
{
  void *v2;
  void *v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 18492847);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

@end

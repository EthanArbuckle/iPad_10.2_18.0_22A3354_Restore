@implementation DDPeoplePickerMutableSceneSettings

- (id)copyWithZone:(_NSZone *)a3
{
  return -[FBSSettings initWithSettings:]([DDPeoplePickerSceneSettings alloc], "initWithSettings:", self);
}

- (void)setDedicatedDevicePicker:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[FBSSettings otherSettings](self, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 18492850);

}

- (BOOL)isDedicatedDevicePicker
{
  return self->_dedicatedDevicePicker;
}

@end

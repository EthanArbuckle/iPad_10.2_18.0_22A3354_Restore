@implementation DDPeoplePickerMutableSceneClientSettings

- (id)copyWithZone:(_NSZone *)a3
{
  return -[FBSSettings initWithSettings:]([DDPeoplePickerSceneClientSettings alloc], "initWithSettings:", self);
}

- (void)setConnectedDeviceUUID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FBSSettings otherSettings](self, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 18492847);

}

- (NSUUID)connectedDeviceUUID
{
  return self->_connectedDeviceUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectedDeviceUUID, 0);
}

@end

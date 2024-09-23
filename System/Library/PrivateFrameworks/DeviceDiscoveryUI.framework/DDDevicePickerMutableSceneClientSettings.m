@implementation DDDevicePickerMutableSceneClientSettings

- (id)copyWithZone:(_NSZone *)a3
{
  return -[FBSSettings initWithSettings:]([DDDevicePickerSceneClientSettings alloc], "initWithSettings:", self);
}

- (NSUUID)endpointUUID
{
  void *v2;
  void *v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 18492847);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (void)setEndpointUUID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FBSSettings otherSettings](self, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 18492847);

}

- (NSUUID)agentUUID
{
  void *v2;
  void *v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 18492848);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (void)setAgentUUID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FBSSettings otherSettings](self, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 18492848);

}

@end

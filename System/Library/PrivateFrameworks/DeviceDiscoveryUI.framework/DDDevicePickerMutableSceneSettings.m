@implementation DDDevicePickerMutableSceneSettings

- (id)copyWithZone:(_NSZone *)a3
{
  return -[FBSSettings initWithSettings:]([DDDevicePickerSceneSettings alloc], "initWithSettings:", self);
}

- (NSString)serviceIdentifier
{
  void *v2;
  void *v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 18492849);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setServiceIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FBSSettings otherSettings](self, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 18492849);

}

@end

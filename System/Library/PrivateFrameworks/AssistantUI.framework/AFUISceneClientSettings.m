@implementation AFUISceneClientSettings

- (unsigned)clientWindowContextID
{
  void *v2;
  void *v3;
  unsigned int v4;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 2000);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[FBSSettings initWithSettings:]([AFUIMutableSceneClientSettings alloc], "initWithSettings:", self);
}

@end

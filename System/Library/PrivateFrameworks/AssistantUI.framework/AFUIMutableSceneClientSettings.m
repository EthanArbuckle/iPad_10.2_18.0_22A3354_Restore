@implementation AFUIMutableSceneClientSettings

- (void)setClientWindowContextID:(unsigned int)a3
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)&a3;
  -[FBSSettings otherSettings](self, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 2000);

}

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

- (id)copyWithZone:(_NSZone *)a3
{
  return -[FBSSettings initWithSettings:]([AFUISceneClientSettings alloc], "initWithSettings:", self);
}

@end

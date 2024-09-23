@implementation BLSHNullBacklightSceneHostEnvironment

- (BLSHNullBacklightSceneHostEnvironment)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BLSHNullBacklightSceneHostEnvironment *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("NullEnvironment:%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)BLSHNullBacklightSceneHostEnvironment;
  v7 = -[BLSHBaseSceneHostEnvironment initWithIdentifier:](&v9, sel_initWithIdentifier_, v6);

  return v7;
}

@end

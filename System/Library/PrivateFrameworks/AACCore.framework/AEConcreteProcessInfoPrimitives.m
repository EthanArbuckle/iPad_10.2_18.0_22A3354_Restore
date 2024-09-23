@implementation AEConcreteProcessInfoPrimitives

- (BOOL)hasEntitlement:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  char v6;

  v3 = (void *)MEMORY[0x24BDD1760];
  v4 = a3;
  objc_msgSend(v3, "processInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "ae_hasEntitlement:withValue:", v4, MEMORY[0x24BDBD1C8]);

  return v6;
}

@end

@implementation RPCompanionLinkDevice(HomeKitDaemon)

- (id)redactedDescription
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a1, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("ID %@"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end

@implementation AASetupAssistantUpgradeStatusResponse

- (NSNumber)upgradeStatus
{
  void *v2;
  void *v3;

  -[AAResponse responseDictionary](self, "responseDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", AASetupAssistantUpgradeStatusKey);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

@end

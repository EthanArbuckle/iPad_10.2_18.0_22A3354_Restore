@implementation APEnforcementManager

- (id)disabledReasons
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "array");
}

- (BOOL)adServicesEnabled:(id)a3
{
  return 0;
}

- (BOOL)loggingEnabled
{
  return 0;
}

- (BOOL)shouldShowTCCWithAds
{
  return 0;
}

@end

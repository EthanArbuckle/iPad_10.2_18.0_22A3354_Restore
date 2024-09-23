@implementation FedStatsPluginLocationServiceConsentChecker

- (id)checkConsentForClientIdentifier:(id)a3 error:(id *)a4
{
  void *v4;

  if (objc_msgSend(&unk_250C5B128, "containsObject:", a3, a4))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(MEMORY[0x24BDBFA88], "locationServicesEnabled"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x24BDBD1C8];
  }
  return v4;
}

@end

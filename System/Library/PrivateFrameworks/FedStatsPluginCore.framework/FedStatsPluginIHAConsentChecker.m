@implementation FedStatsPluginIHAConsentChecker

- (id)checkConsentForClientIdentifier:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  void *v6;

  if (objc_msgSend(&unk_250C5B158, "containsObject:", a3, a4))
  {
    v4 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "isHealthDataSubmissionAllowed"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)MEMORY[0x24BDBD1C8];
  }
  return v6;
}

@end

@implementation HKOnboardingSequence(AtrialFibrillation)

+ (id)firstTimeAtrialFibrillationAvailabilitySequence
{
  void *v0;
  void *v1;
  void *v2;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4A760]), "initWithViewControllerClass:sequencePage:", objc_opt_class(), 0);
  v4[0] = v0;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4A768]), "initWithPages:", v1);
  return v2;
}

+ (id)firstTimeAtrialFibrillationOnboardingSequence
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  v7[4] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4A760]), "initWithViewControllerClass:sequencePage:", objc_opt_class(), 1);
  v7[0] = v0;
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4A760]), "initWithViewControllerClass:sequencePage:", objc_opt_class(), 2);
  v7[1] = v1;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4A760]), "initWithViewControllerClass:sequencePage:", objc_opt_class(), 3);
  v7[2] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4A760]), "initWithViewControllerClass:sequencePage:", objc_opt_class(), 4);
  v7[3] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4A768]), "initWithPages:", v4);
  return v5;
}

@end

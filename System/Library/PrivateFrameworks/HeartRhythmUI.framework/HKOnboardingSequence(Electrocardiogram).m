@implementation HKOnboardingSequence(Electrocardiogram)

+ (id)firstTimeElectrocardiogramAvailabilitySequence
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

+ (id)firstTimeElectrocardiogramOnboardingSequenceWithAlgorithmVersion:()Electrocardiogram
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];
  _QWORD v13[6];

  v13[5] = *MEMORY[0x24BDAC8D0];
  if (a3 == 2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4A760]), "initWithViewControllerClass:sequencePage:", objc_opt_class(), 3);
    v12[0] = v3;
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4A760]), "initWithViewControllerClass:sequencePage:", objc_opt_class(), 4);
    v12[1] = v4;
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4A760]), "initWithViewControllerClass:sequencePage:", objc_opt_class(), 5);
    v12[2] = v5;
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4A760]), "initWithViewControllerClass:sequencePage:", objc_opt_class(), 6);
    v12[3] = v6;
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4A760]), "initWithViewControllerClass:sequencePage:", objc_opt_class(), 7);
    v12[4] = v7;
    v8 = v12;
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4A760]), "initWithViewControllerClass:sequencePage:", objc_opt_class(), 3);
    v13[0] = v3;
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4A760]), "initWithViewControllerClass:sequencePage:", objc_opt_class(), 4);
    v13[1] = v4;
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4A760]), "initWithViewControllerClass:sequencePage:", objc_opt_class(), 5);
    v13[2] = v5;
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4A760]), "initWithViewControllerClass:sequencePage:", objc_opt_class(), 6);
    v13[3] = v6;
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4A760]), "initWithViewControllerClass:sequencePage:", objc_opt_class(), 7);
    v13[4] = v7;
    v8 = v13;
LABEL_5:
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4A768]), "initWithPages:", v9);
    return v10;
  }
  return 0;
}

+ (id)upgradingElectrocardiogramAvailabilitySequence
{
  void *v0;
  void *v1;
  void *v2;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4A760]), "initWithViewControllerClass:sequencePage:", objc_opt_class(), 1);
  v4[0] = v0;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4A768]), "initWithPages:", v1);
  return v2;
}

+ (id)upgradingElectrocardiogramSequenceFromAlgorithmVersion:()Electrocardiogram toAlgorithmVersion:
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x24BDAC8D0];
  if (a3 == 1 && a4 == 2)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4A760]), "initWithViewControllerClass:sequencePage:", objc_opt_class(), 4);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4A760]), "initWithViewControllerClass:sequencePage:", objc_opt_class(), 5, v6);
    v13[1] = v7;
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4A760]), "initWithViewControllerClass:sequencePage:", objc_opt_class(), 8);
    v13[2] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4A768]), "initWithPages:", v9);
  }
  else
  {
    _HKInitializeLogging();
    v11 = *MEMORY[0x24BDD3010];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_ERROR))
      +[HKOnboardingSequence(Electrocardiogram) upgradingElectrocardiogramSequenceFromAlgorithmVersion:toAlgorithmVersion:].cold.1(a3, a4, v11);
    v10 = 0;
  }
  return v10;
}

+ (void)upgradingElectrocardiogramSequenceFromAlgorithmVersion:()Electrocardiogram toAlgorithmVersion:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 134218240;
  v4 = a1;
  v5 = 2048;
  v6 = a2;
  _os_log_error_impl(&dword_215454000, log, OS_LOG_TYPE_ERROR, "Electrocardiogram upgrading from %ld to %ld is not supported", (uint8_t *)&v3, 0x16u);
}

@end

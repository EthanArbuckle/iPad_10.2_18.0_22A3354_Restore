@implementation HKSample(HKMenstrualCycles)

+ (id)hkmc_defaultMetadata
{
  uint64_t v0;
  _QWORD v2[2];
  _QWORD v3[3];

  v3[2] = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BDD4450];
  v2[0] = *MEMORY[0x24BDD3230];
  v2[1] = v0;
  v3[0] = MEMORY[0x24BDBD1C8];
  v3[1] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (uint64_t)hkmc_wasEnteredFromCycleTracking
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "metadata");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", *MEMORY[0x24BDD4450]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (uint64_t)hkmc_isNotPresentSymptom
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t result;

  objc_msgSend(a1, "sampleType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "code");

  if ((unint64_t)(v3 - 157) <= 0xE)
  {
    if (((1 << (v3 + 99)) & 0x4F7F) == 0)
    {
      v4 = a1;
      goto LABEL_6;
    }
LABEL_5:
    v4 = a1;
LABEL_6:
    result = objc_msgSend(v4, "value");
    if (result == 1)
      return result;
    return 0;
  }
  if ((unint64_t)(v3 - 229) < 7)
    goto LABEL_5;
  return 0;
}

- (uint64_t)hkmc_isCycleFactorSample
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "sampleType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDD2960]) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(a1, "sampleType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDD29D8]) & 1) != 0)
    {
      v4 = 1;
    }
    else
    {
      objc_msgSend(a1, "sampleType");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BDD28B0]);

    }
  }

  return v4;
}

- (uint64_t)hkmc_isSleepDependentSample
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "sampleType");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BDD3360]);

  return v3;
}

@end

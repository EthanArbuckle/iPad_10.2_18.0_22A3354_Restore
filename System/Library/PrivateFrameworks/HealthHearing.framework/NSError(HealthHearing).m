@implementation NSError(HealthHearing)

- (uint64_t)hearing_isExpectedError
{
  if ((objc_msgSend(a1, "hk_isDatabaseAccessibilityError") & 1) != 0
    || (objc_msgSend(a1, "hk_isHealthStoreUnavailableError") & 1) != 0
    || (objc_msgSend(a1, "hk_isFeatureDisabledError") & 1) != 0)
  {
    return 1;
  }
  else
  {
    return objc_msgSend(a1, "hearing_audioDSP_isHAENDisabled");
  }
}

- (uint64_t)hearing_audioDSP_isHAENDisabled
{
  void *v2;
  int v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BE3E790]);

  if (!v3)
    return 0;
  v4 = objc_msgSend(a1, "code");
  if (v4 != *MEMORY[0x24BE3E788])
    return 0;
  objc_msgSend(a1, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BDD0FC8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(CFSTR("HAEN is disabled"), "isEqualToString:", v6);

  return v7;
}

@end

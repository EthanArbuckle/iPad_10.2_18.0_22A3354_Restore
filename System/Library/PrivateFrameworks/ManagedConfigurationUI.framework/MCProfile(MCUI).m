@implementation MCProfile(MCUI)

- (uint64_t)isHRNProfile
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  BOOL v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(a1, "payloadsWithClass:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "pollingIntervalMinutes");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v2)
    v5 = v3 == 0;
  else
    v5 = 1;
  if (v5)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "isEqualToNumber:", v6) ^ 1;

  }
  return v7;
}

- (uint64_t)shouldHideUnstrustedLabel
{
  return 0;
}

- (uint64_t)shouldUseTrustedNomenclature
{
  return 0;
}

@end

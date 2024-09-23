@implementation CDPFollowUpContext(CDPRepairIdentificationHelper)

- (uint64_t)isDefaultRepairOrSOSCompatibilityFollowUp
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "followUpType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BE1A3C0]) && !objc_msgSend(a1, "repairType"))
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(a1, "followUpType");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE1A3B8]);

  }
  return v4;
}

@end

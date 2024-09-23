@implementation MTRSetupPayload(HMMTRAdditions)

- (uint64_t)isEqualAsOnboarding:()HMMTRAdditions
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a1, "qrCodeString:", 0);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "qrCodeString:", 0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (v5 | v6 && !objc_msgSend((id)v5, "isEqual:", v6))
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(a1, "manualEntryCode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "manualEntryCode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

  }
  return v9;
}

@end

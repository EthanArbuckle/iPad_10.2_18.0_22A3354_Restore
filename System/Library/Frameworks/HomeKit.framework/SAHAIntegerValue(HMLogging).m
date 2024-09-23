@implementation SAHAIntegerValue(HMLogging)

- (id)hm_shortDescription
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("%@=%d/"), *MEMORY[0x1E0D88A80], objc_msgSend(a1, "value"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)*MEMORY[0x1E0D888B8];
  objc_msgSend(a1, "units");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  appendToShortDescription(v2, v3, v4);

  return v2;
}

@end

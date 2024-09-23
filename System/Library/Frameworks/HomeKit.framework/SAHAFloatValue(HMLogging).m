@implementation SAHAFloatValue(HMLogging)

- (id)hm_shortDescription
{
  void *v2;
  uint64_t v3;
  float v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x1E0CB37A0];
  v3 = *MEMORY[0x1E0D88A58];
  objc_msgSend(a1, "value");
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@=%f/"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)*MEMORY[0x1E0D888B8];
  objc_msgSend(a1, "units");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  appendToShortDescription(v5, v6, v7);

  return v5;
}

@end

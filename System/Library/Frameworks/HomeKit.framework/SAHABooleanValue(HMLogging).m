@implementation SAHABooleanValue(HMLogging)

- (id)hm_shortDescription
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)*MEMORY[0x1E0D888C0];
  objc_msgSend(a1, "value");
  HMFBooleanToString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  appendToShortDescription(v2, v3, v4);

  return v2;
}

@end

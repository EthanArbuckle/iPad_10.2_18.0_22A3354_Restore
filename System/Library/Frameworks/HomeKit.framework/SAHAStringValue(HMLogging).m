@implementation SAHAStringValue(HMLogging)

- (id)hm_shortDescription
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = *MEMORY[0x1E0D88C10];
  objc_msgSend(a1, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@=%@"), v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end

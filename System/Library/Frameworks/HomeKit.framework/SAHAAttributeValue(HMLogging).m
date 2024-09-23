@implementation SAHAAttributeValue(HMLogging)

- (__CFString)hm_shortDescription
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;

  objc_msgSend(a1, "units");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = *MEMORY[0x1E0D888B8];
    objc_msgSend(a1, "units");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@=%@"), v4, v5);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = &stru_1E3AB7688;
  }
  return v6;
}

@end

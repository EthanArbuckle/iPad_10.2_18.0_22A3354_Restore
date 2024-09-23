@implementation MFMimePart(FormatFlowedSupportInternal)

- (uint64_t)formatFlowedOptions
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a1, "bodyParameterForKey:", CFSTR("format"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("flowed"));

  if (!v3)
    return 0;
  objc_msgSend(a1, "bodyParameterForKey:", CFSTR("delsp"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4
    || objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("yes"))
    && objc_msgSend(v5, "caseInsensitiveCompare:", CFSTR("y")))
  {
    v6 = 1;
  }
  else
  {
    v6 = 3;
  }

  return v6;
}

@end

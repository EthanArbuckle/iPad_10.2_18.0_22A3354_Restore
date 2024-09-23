@implementation NSUUID(FPAdditions)

- (uint64_t)fp_UUID
{
  return objc_msgSend(a1, "fp_UUIDWithObfuscation:", fp_shouldObfuscateFilenames());
}

- (id)fp_UUIDWithObfuscation:()FPAdditions
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3 && !objc_msgSend(v4, "isEqualToString:", CFSTR("00000000-0000-0000-0000-000000000000")))
  {
    objc_msgSend(v5, "substringToIndex:", 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "substringFromIndex:", objc_msgSend(v5, "length") - 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@...%@"), v7, v8);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = v5;
  }

  return v6;
}

@end

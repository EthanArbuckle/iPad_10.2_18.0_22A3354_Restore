@implementation LSBundleRecord(LNAdditions)

- (id)ln_linkedFrameworksWithError:()LNAdditions
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "executableURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ln_linkedFrameworksWithError:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end

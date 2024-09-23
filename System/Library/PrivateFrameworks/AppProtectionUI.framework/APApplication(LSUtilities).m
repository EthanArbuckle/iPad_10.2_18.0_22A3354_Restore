@implementation APApplication(LSUtilities)

- (id)findApplicationRecordWithError:()LSUtilities
{
  id v5;
  void *v6;
  void *v7;

  v5 = objc_alloc(MEMORY[0x24BDC1540]);
  objc_msgSend(a1, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithBundleIdentifier:allowPlaceholder:error:", v6, 1, a3);

  return v7;
}

@end

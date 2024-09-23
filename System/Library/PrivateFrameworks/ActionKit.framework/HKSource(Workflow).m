@implementation HKSource(Workflow)

- (uint64_t)wf_sourceType
{
  void *v1;
  int v2;

  objc_msgSend(a1, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "hasPrefix:", CFSTR("com.apple.health"));

  return v2 ^ 1u;
}

@end

@implementation INThisProcessIsDonatingBySiri

void __INThisProcessIsDonatingBySiri_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CA5890], "bundleProxyForCurrentProcess");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)INThisProcessIsDonatingBySiri_bundleIdentifier;
  INThisProcessIsDonatingBySiri_bundleIdentifier = v0;

}

@end

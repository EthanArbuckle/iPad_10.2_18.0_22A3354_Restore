@implementation LocationBundle

void __LocationBundle_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/LocationBundles/ClipServicesLocation.bundle"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)LocationBundle_bundle;
  LocationBundle_bundle = v0;

}

@end

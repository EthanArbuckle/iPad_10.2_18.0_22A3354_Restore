@implementation CRAutomaticDNDLocationBundle

void __CRAutomaticDNDLocationBundle_block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = objc_alloc(MEMORY[0x1E0CB34D0]);
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", CFSTR("/System/Library/LocationBundles/DoNotDisturb.bundle"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "initWithURL:", v3);
  v2 = (void *)CRAutomaticDNDLocationBundle_bundle;
  CRAutomaticDNDLocationBundle_bundle = v1;

}

@end

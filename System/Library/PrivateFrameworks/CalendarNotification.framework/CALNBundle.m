@implementation CALNBundle

+ (id)bundle
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __20__CALNBundle_bundle__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (bundle_onceToken != -1)
    dispatch_once(&bundle_onceToken, block);
  return (id)bundle_bundle;
}

void __20__CALNBundle_bundle__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", *(_QWORD *)(a1 + 32));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)bundle_bundle;
  bundle_bundle = v1;

}

@end

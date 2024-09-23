@implementation ECEmailCoreFramework

+ (NSBundle)bundle
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__ECEmailCoreFramework_bundle__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (bundle_onceToken != -1)
    dispatch_once(&bundle_onceToken, block);
  return (NSBundle *)(id)bundle_emailCoreFrameworkBundle;
}

void __30__ECEmailCoreFramework_bundle__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", *(_QWORD *)(a1 + 32));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)bundle_emailCoreFrameworkBundle;
  bundle_emailCoreFrameworkBundle = v1;

}

@end

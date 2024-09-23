@implementation MKBundle

+ (id)bundle
{
  if (bundle_onceToken != -1)
    dispatch_once(&bundle_onceToken, &__block_literal_global_6);
  return (id)bundle_bundle;
}

void __18__MKBundle_bundle__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1488]), "initWithPath:", CFSTR("/System/Library/PrivateFrameworks/MigrationKit.framework/MigrationKit.bundle"));
  v1 = (void *)bundle_bundle;
  bundle_bundle = v0;

}

@end

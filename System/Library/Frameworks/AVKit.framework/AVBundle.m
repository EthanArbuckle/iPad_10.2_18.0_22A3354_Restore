@implementation AVBundle

void __AVBundle_block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_AVKitBundle bundle](_AVKitBundle, "bundle");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)AVBundle_bundle;
  AVBundle_bundle = v0;

}

@end

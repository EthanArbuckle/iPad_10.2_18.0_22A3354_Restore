@implementation GCFrameworkBundle

void __GCFrameworkBundle_block_invoke()
{
  uint64_t v0;
  void *v1;

  +[NSBundle bundleForClass:](&off_254DF2768, "bundleForClass:", objc_opt_class());
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)GCFrameworkBundle_bundle;
  GCFrameworkBundle_bundle = v0;

}

@end

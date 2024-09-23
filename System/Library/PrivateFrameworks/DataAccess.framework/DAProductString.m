@implementation DAProductString

void __DAProductString_block_invoke()
{
  uint64_t v0;
  void *v1;

  _MGStringForKey();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)DAProductString_sProduct;
  DAProductString_sProduct = v0;

}

@end

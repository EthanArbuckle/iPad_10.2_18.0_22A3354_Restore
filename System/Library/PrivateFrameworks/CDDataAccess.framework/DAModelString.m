@implementation DAModelString

void __DAModelString_block_invoke()
{
  uint64_t v0;
  void *v1;

  _MGStringForKey();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)DAModelString_sModel;
  DAModelString_sModel = v0;

}

@end

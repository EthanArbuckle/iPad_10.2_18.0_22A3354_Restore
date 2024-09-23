@implementation HMFObjectDefaultDescriptionOptions

void __HMFObjectDefaultDescriptionOptions_block_invoke()
{
  id v0;

  +[HMFProductInfo productInfo](HMFProductInfo, "productInfo");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  _MergedGlobals_77 = 4 * (objc_msgSend(v0, "productVariant") != 3);

}

@end

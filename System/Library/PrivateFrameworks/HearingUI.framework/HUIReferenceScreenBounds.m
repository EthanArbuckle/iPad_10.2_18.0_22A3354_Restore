@implementation HUIReferenceScreenBounds

void __HUIReferenceScreenBounds_block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_referenceBounds");
  HUIReferenceScreenBounds_ReferenceScreenBounds_0 = v0;
  HUIReferenceScreenBounds_ReferenceScreenBounds_1 = v1;
  HUIReferenceScreenBounds_ReferenceScreenBounds_2 = v2;
  HUIReferenceScreenBounds_ReferenceScreenBounds_3 = v3;

}

@end

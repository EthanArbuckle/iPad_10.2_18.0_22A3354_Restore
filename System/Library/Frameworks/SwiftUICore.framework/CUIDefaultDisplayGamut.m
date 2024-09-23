@implementation CUIDefaultDisplayGamut

void ___CUIDefaultDisplayGamut_block_invoke()
{
  id v0;

  v0 = (id)MGCopyAnswer();
  _CUIDefaultDisplayGamut_defaultGamut = objc_msgSend(v0, "isEqualToString:", CFSTR("P3"));

}

@end

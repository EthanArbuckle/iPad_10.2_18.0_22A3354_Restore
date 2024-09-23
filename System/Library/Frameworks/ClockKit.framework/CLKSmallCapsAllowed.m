@implementation CLKSmallCapsAllowed

void __CLKSmallCapsAllowed_block_invoke()
{
  id v0;

  CLKLocalizedString(CFSTR("SMALL_CAPS_FONT_ALLOWED"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v0, "isEqualToString:", CFSTR("0")))
    CLKSmallCapsAllowed_smallCapsAllowed = 1;

}

@end

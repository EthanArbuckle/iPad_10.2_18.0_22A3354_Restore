@implementation CLKUsesFauxSmallCaps

void __CLKUsesFauxSmallCaps_block_invoke()
{
  id v0;

  CLKLocalizedString(CFSTR("INTERVAL_ALLOW_FAUX_SMALL_CAPS_FOR_FIT"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  CLKUsesFauxSmallCaps_fauxSmallCaps = objc_msgSend(v0, "BOOLValue");

}

@end

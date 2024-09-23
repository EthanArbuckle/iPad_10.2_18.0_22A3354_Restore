@implementation NTKCanUseShortRelativeDateStyleForHeartRateComplicationStrings

void __NTKCanUseShortRelativeDateStyleForHeartRateComplicationStrings_block_invoke()
{
  void *v0;
  int v1;
  void *v2;

  NTKClockFaceLocalizedString(CFSTR("HEART_RATE_USE_SHORT_RELATIVE_DATE_STYLE"), CFSTR("See note in strings file for this key"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (v0)
  {
    v2 = v0;
    v1 = objc_msgSend(CFSTR("1"), "isEqualToString:", v0);
    v0 = v2;
    if (v1)
      NTKCanUseShortRelativeDateStyleForHeartRateComplicationStrings___useShortRelativeDateStyle = 1;
  }

}

@end

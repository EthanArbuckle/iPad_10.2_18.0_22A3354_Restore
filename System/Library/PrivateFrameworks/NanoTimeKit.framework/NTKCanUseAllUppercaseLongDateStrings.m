@implementation NTKCanUseAllUppercaseLongDateStrings

void __NTKCanUseAllUppercaseLongDateStrings_block_invoke()
{
  void *v0;
  int v1;
  void *v2;

  NTKClockFaceLocalizedString(CFSTR("ALLOW_ALL_UPPERCASE_LONG_DATE_STRINGS"), CFSTR("See note in strings file for this key"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (v0)
  {
    v2 = v0;
    v1 = objc_msgSend(CFSTR("1"), "isEqualToString:", v0);
    v0 = v2;
    if (v1)
      NTKCanUseAllUppercaseLongDateStrings___canUppercase = 1;
  }

}

@end

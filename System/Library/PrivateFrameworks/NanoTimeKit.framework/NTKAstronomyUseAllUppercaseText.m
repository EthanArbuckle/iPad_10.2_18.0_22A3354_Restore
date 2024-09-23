@implementation NTKAstronomyUseAllUppercaseText

void ___NTKAstronomyUseAllUppercaseText_block_invoke()
{
  void *v0;
  int v1;
  void *v2;

  NTKClockFaceLocalizedString(CFSTR("ASTRONOMY_USE_ALL_UPPERCASE_TEXT"), CFSTR("1"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (v0)
  {
    v2 = v0;
    v1 = objc_msgSend(CFSTR("1"), "isEqualToString:", v0);
    v0 = v2;
    if (v1)
      _NTKAstronomyUseAllUppercaseText_useAllUppercaseText = 1;
  }

}

@end

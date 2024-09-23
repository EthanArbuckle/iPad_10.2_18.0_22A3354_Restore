@implementation NTKAstronomyFaceViewLocalizedNow

void ___NTKAstronomyFaceViewLocalizedNow_block_invoke()
{
  uint64_t v0;
  void *v1;

  NTKClockFaceLocalizedString(CFSTR("ASTRONOMY_DATE_NOW"), CFSTR("NOW"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_NTKAstronomyFaceViewLocalizedNow_nowString;
  _NTKAstronomyFaceViewLocalizedNow_nowString = v0;

}

@end

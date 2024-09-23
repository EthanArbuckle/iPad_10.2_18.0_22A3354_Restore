@implementation MKLocalizedStringForCurrentLocation

void __MKLocalizedStringForCurrentLocation_block_invoke()
{
  uint64_t v0;
  void *v1;

  _MKLocalizedStringFromThisBundle(CFSTR("My Location"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECE2DA70;
  qword_1ECE2DA70 = v0;

}

@end

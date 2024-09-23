@implementation MKLocalizedStringForUnknownLocation

void __MKLocalizedStringForUnknownLocation_block_invoke()
{
  uint64_t v0;
  void *v1;

  _MKLocalizedStringFromThisBundle(CFSTR("Unknown Location"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECE2DA80;
  qword_1ECE2DA80 = v0;

}

@end

@implementation TVListViewCellAccessibility

uint64_t __51___TVListViewCellAccessibility_accessibilityTraits__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  NSClassFromString(CFSTR("VideosOfferView"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    NSClassFromString(CFSTR("TVButton"));
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

@end

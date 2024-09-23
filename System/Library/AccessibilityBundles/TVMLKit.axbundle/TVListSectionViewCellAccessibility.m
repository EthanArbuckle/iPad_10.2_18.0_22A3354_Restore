@implementation TVListSectionViewCellAccessibility

uint64_t __61___TVListSectionViewCellAccessibility_isAccessibilityElement__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  NSClassFromString(CFSTR("TVButton"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end

@implementation UIStackedImageContainerLayerAccessibility

uint64_t __64___UIStackedImageContainerLayerAccessibility_accessibilityFrame__block_invoke(void *a1, void *a2)
{
  char isKindOfClass;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  NSClassFromString(CFSTR("_TVCarouselView"));
  isKindOfClass = objc_opt_isKindOfClass();
  objc_storeStrong(location, 0);
  return isKindOfClass & 1;
}

@end

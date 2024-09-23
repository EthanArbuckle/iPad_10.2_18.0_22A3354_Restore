@implementation TVStackingPosterViewAccessibility

BOOL __76___TVStackingPosterViewAccessibility__accessibilitySupplementaryFooterViews__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  objc_opt_class();
  v3 = ((objc_opt_isKindOfClass() & 1) != 0
     || (NSClassFromString(CFSTR("_TVProgressView")), (objc_opt_isKindOfClass() & 1) != 0))
    && (objc_msgSend(v2, "isAccessibilityElement") & 1) != 0;

  return v3;
}

Class __76___TVStackingPosterViewAccessibility__accessibilityShouldReverseComponents___block_invoke()
{
  Class result;

  result = NSClassFromString(CFSTR("_TVLabel"));
  _accessibilityShouldReverseComponents___TVLabelClass = (uint64_t)result;
  return result;
}

uint64_t __76___TVStackingPosterViewAccessibility__accessibilityShouldReverseComponents___block_invoke_2()
{
  return objc_opt_isKindOfClass() & 1;
}

uint64_t __65___TVStackingPosterViewAccessibility__accessibilityFrameDelegate__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 3);
  v1 = (void *)_accessibilityFrameDelegate_FrameDelegateClasses;
  _accessibilityFrameDelegate_FrameDelegateClasses = v0;

  objc_msgSend((id)_accessibilityFrameDelegate_FrameDelegateClasses, "axSafelyAddObject:", NSClassFromString(CFSTR("_TVImageView")));
  return objc_msgSend((id)_accessibilityFrameDelegate_FrameDelegateClasses, "axSafelyAddObject:", NSClassFromString(CFSTR("_TVMonogramView")));
}

@end

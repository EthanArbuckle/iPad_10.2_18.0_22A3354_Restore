@implementation TVOrganizerViewAccessibility

BOOL __71___TVOrganizerViewAccessibility__accessibilitySupplementaryFooterViews__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  objc_opt_class();
  v3 = (objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v2, "isAccessibilityElement") & 1) != 0;

  return v3;
}

@end

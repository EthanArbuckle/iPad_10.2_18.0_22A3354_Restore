@implementation UIDimmingViewAccessibility

uint64_t __64__UIDimmingViewAccessibility__MessageUI__UIKit_passthroughViews__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = a2;
  NSClassFromString(CFSTR("MFComposeRecipientTextView"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "safeValueForKey:", CFSTR("firstResponder"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "_accessibilityIsDescendantOfElement:", v2);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end

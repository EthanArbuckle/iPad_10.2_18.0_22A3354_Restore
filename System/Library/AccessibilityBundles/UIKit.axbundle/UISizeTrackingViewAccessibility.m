@implementation UISizeTrackingViewAccessibility

void __68___UISizeTrackingViewAccessibility__accessibilitySetFocusOnElement___block_invoke(uint64_t a1)
{
  id v1;
  id v3;

  v1 = (id)objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:");
  objc_msgSend(v1, "_setWantsKeyboardEnvironmentEventDeferring:", 0);

  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("remoteViewController"));
  objc_msgSend(v3, "_setWantsKeyboardEnvironmentEventDeferring:", 1);

}

void __68___UISizeTrackingViewAccessibility__accessibilitySetFocusOnElement___block_invoke_2(uint64_t a1)
{
  id v1;

  v1 = (id)objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("remoteViewController"));
  objc_msgSend(v1, "_setWantsKeyboardEnvironmentEventDeferring:", 0);

}

@end

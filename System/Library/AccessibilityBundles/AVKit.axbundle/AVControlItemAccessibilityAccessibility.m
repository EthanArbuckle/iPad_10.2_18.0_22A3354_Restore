@implementation AVControlItemAccessibilityAccessibility

id __68__tvOS_AVControlItemAccessibilityAccessibility__startPiPControlItem__block_invoke()
{
  void *v0;
  __CFString *v1;
  void *v2;

  -[objc_class safeValueForKeyPath:](NSClassFromString(CFSTR("PBSPictureInPictureController")), "safeValueForKeyPath:", CFSTR("sharedInstance.currentState"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v0, "safeBoolForKey:", CFSTR("isPictureInPictureActive")))
    v1 = CFSTR("pip.swap.button");
  else
    v1 = CFSTR("pip.start.button");
  accessibilityLocalizedString(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end

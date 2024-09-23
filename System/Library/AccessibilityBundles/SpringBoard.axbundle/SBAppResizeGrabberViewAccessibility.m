@implementation SBAppResizeGrabberViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBAppResizeGrabberView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBAppResizeGrabberView"), CFSTR("_corner"), "NSUInteger");
  objc_msgSend(v3, "validateClass:", CFSTR("SBReusableSnapshotItemContainer"));

}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SBAppResizeGrabberViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("SBReusableSnapshotItemContainer")));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(v2, "accessibilityLabel");
  else
    accessibilityLocalizedString(CFSTR("app.resize.grabber.window.label"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  accessibilityLocalizedString(CFSTR("app.resize.grabber.label"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  AXCFormattedString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(CFSTR("app.resize.grabber.hint"));
}

- (id)accessibilityValue
{
  unint64_t v3;
  void *v4;
  objc_super v6;

  v3 = -[SBAppResizeGrabberViewAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("_corner"));
  if (v3 > 3
    || (accessibilityLocalizedString(off_250367AA8[v3]), (v4 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v6.receiver = self;
    v6.super_class = (Class)SBAppResizeGrabberViewAccessibility;
    -[SBAppResizeGrabberViewAccessibility accessibilityValue](&v6, sel_accessibilityValue);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end

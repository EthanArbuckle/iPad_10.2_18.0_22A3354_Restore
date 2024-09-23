@implementation MKUserTrackingBarButtonItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MKUserTrackingBarButtonItem");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MKUserTrackingBarButtonItem"), CFSTR("_state"), "q", 0);
}

- (id)accessibilityHint
{
  return AXMapKitLocString(CFSTR("TRACKING_BUTTON_HINT"));
}

- (id)accessibilityLabel
{
  return AXMapKitLocString(CFSTR("TRACKING_BUTTON_LABEL"));
}

- (id)accessibilityValue
{
  void *v2;
  unint64_t v3;
  void *v4;

  -[MKUserTrackingBarButtonItemAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_state"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  if (v3 > 3)
  {
    v4 = 0;
  }
  else
  {
    AXMapKitLocString(*(&off_2502509D8 + v3));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

@end

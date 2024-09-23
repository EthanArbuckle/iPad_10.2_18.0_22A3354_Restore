@implementation _MKNanoPlaceCardFooterViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_MKNanoPlaceCardFooterView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("_MKNanoPlaceCardFooterView"), CFSTR("_snapshotView"), "_MKNanoAddressSnapshotView");
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  -[_MKNanoPlaceCardFooterViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_snapshotView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "accessibilityLabel");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)_MKNanoPlaceCardFooterViewAccessibility;
    -[_MKNanoPlaceCardFooterViewAccessibility accessibilityLabel](&v8, sel_accessibilityLabel);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (id)accessibilityHint
{
  return AXMapKitLocString(CFSTR("DROP_PIN_HINT"));
}

@end

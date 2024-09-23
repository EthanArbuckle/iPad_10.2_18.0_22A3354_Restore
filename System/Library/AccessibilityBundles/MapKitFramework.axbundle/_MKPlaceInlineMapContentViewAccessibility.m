@implementation _MKPlaceInlineMapContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_MKPlaceInlineMapContentView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;

  -[_MKPlaceInlineMapContentViewAccessibility accessibilityUserDefinedLabel](self, "accessibilityUserDefinedLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[_MKPlaceInlineMapContentViewAccessibility accessibilityUserDefinedLabel](self, "accessibilityUserDefinedLabel");
  else
    AXMapKitLocString(CFSTR("MAP_PLAIN"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)accessibilityHint
{
  return AXMapKitLocString(CFSTR("MAP_OPEN_HINT"));
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_MKPlaceInlineMapContentViewAccessibility;
  return *MEMORY[0x24BDF73B0] | -[_MKPlaceInlineMapContentViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end

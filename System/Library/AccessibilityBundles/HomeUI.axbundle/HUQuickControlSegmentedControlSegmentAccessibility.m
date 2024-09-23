@implementation HUQuickControlSegmentedControlSegmentAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUQuickControlSegmentedControlSegment");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUQuickControlSegmentedControlSegment"), CFSTR("title"), "@", 0);
}

- (id)accessibilityLabel
{
  return (id)-[HUQuickControlSegmentedControlSegmentAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("title"));
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2;
  int v3;
  uint64_t v4;

  v2 = *MEMORY[0x24BDF73B0];
  v3 = -[HUQuickControlSegmentedControlSegmentAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isSelected"));
  v4 = *MEMORY[0x24BDF7400];
  if (!v3)
    v4 = 0;
  return v4 | v2;
}

- (_NSRange)accessibilityRowRange
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  _NSRange result;

  -[HUQuickControlSegmentedControlSegmentAccessibility superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "indexOfObject:", self);
  v6 = objc_msgSend(v4, "count");

  v7 = v5;
  v8 = v6;
  result.length = v8;
  result.location = v7;
  return result;
}

@end

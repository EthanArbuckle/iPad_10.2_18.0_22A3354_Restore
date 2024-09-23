@implementation SessionSingleMetricViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SeymourUI.SessionSingleMetricView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;

  -[SessionSingleMetricViewAccessibility _accessibilityTextForSubhierarchyIncludingHeaders:focusableItems:exclusions:](self, "_accessibilityTextForSubhierarchyIncludingHeaders:focusableItems:exclusions:", 0, 1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR(","), &stru_250349750);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedLowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SessionSingleMetricViewAccessibility;
  return *MEMORY[0x24BDF7430] | -[SessionSingleMetricViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end

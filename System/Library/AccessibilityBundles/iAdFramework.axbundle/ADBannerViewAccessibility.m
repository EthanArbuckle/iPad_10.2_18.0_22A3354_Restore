@implementation ADBannerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ADBannerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  void *v4;

  if (_AXSAutomationEnabled())
    return -[ADBannerViewAccessibility isMemberOfClass:](self, "isMemberOfClass:", MEMORY[0x234925D9C](CFSTR("ADBannerView")));
  -[ADBannerViewAccessibility accessibilityUserDefinedLabel](self, "accessibilityUserDefinedLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return -[ADBannerViewAccessibility isMemberOfClass:](self, "isMemberOfClass:", MEMORY[0x234925D9C](CFSTR("ADBannerView")));
  else
    return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ADBannerViewAccessibility;
  return *MEMORY[0x24BDF73C8] | -[ADBannerViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end

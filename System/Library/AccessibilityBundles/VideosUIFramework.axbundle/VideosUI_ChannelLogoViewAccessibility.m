@implementation VideosUI_ChannelLogoViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VideosUI.ChannelLogoView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:", CFSTR("VUIImageView"));
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)VideosUI_ChannelLogoViewAccessibility;
  -[VideosUI_ChannelLogoViewAccessibility _accessibilityLoadAccessibilityInformation](&v2, sel__accessibilityLoadAccessibilityInformation);
}

@end

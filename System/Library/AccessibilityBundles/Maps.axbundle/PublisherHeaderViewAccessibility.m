@implementation PublisherHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PublisherHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PublisherHeaderView"), CFSTR("publisherLogoImageView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PublisherHeaderView"), CFSTR("attribution"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  const char *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PublisherHeaderViewAccessibility;
  -[PublisherHeaderViewAccessibility _accessibilityLoadAccessibilityInformation](&v7, sel__accessibilityLoadAccessibilityInformation);
  -[PublisherHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("publisherLogoImageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 1);
  -[PublisherHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("attribution"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  AXPublisherDescriptionForAttribution(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setAccessibilityLabel:", v6);
}

@end

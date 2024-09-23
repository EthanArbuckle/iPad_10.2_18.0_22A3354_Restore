@implementation MRUNowPlayingLabelViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MRUNowPlayingLabelView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MRUNowPlayingLabelView"), CFSTR("routeLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MRUNowPlayingLabelView"), CFSTR("titleMarqueeView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MRUNowPlayingLabelView"), CFSTR("subtitleMarqueeView"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MRUNowPlayingLabelViewAccessibility;
  -[MRUNowPlayingLabelViewAccessibility _accessibilityLoadAccessibilityInformation](&v6, sel__accessibilityLoadAccessibilityInformation);
  -[MRUNowPlayingLabelViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("routeLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 0);

  -[MRUNowPlayingLabelViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleMarqueeView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsAccessibilityElement:", 0);

  -[MRUNowPlayingLabelViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("subtitleMarqueeView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIsAccessibilityElement:", 0);

}

@end

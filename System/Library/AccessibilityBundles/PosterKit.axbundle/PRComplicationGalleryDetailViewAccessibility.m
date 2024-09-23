@implementation PRComplicationGalleryDetailViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PRComplicationGalleryDetailView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PRComplicationGalleryDetailView"), CFSTR("titleView"), "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  UIAccessibilityNotifications v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PRComplicationGalleryDetailViewAccessibility;
  -[PRComplicationGalleryDetailViewAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  v3 = *MEMORY[0x24BDF72C8];
  -[PRComplicationGalleryDetailViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v3, v4);

}

@end

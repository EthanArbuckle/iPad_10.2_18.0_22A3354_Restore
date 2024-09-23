@implementation MPVolumeViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MPVolumeView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_createSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MPVolumeViewAccessibility;
  -[MPVolumeViewAccessibility _createSubviews](&v5, sel__createSubviews);
  -[MPVolumeViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_routeButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  UIKitAccessibilityLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

}

@end

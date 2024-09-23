@implementation TVRUIPagingButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TVRUIPagingButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TVRUIPagingButton"), CFSTR("titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TVRUIPagingButton"), CFSTR("topButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TVRUIPagingButton"), CFSTR("bottomButton"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TVRUIPagingButtonAccessibility;
  -[TVRUIPagingButtonAccessibility _accessibilityLoadAccessibilityInformation](&v8, sel__accessibilityLoadAccessibilityInformation);
  -[TVRUIPagingButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("topButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("tv.remote.channel.up.button"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  -[TVRUIPagingButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("bottomButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("tv.remote.channel.down.button"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v6);

  -[TVRUIPagingButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIsAccessibilityElement:", 0);

}

@end

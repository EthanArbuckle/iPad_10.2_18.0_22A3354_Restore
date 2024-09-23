@implementation SFUnifiedBarButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SFUnifiedBarButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFUnifiedBarButton"), CFSTR("initWithImage:action:"), "@", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFUnifiedBarButton"), CFSTR("_buttonView"), "SFUnifiedBarButtonView");

}

- (void)setAccessibilityLabel:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFUnifiedBarButtonAccessibility;
  v4 = a3;
  -[SFUnifiedBarButtonAccessibility setAccessibilityLabel:](&v6, sel_setAccessibilityLabel_, v4);
  -[SFUnifiedBarButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_buttonView"), v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v4);

}

@end

@implementation WKFormAccessoryViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("WKFormAccessoryView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("WKFormAccessoryView"), CFSTR("_nextItem"), "{RetainPtr<UIBarButtonItem>=\"m_ptr\"^v}");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("WKFormAccessoryView"), CFSTR("_previousItem"), "{RetainPtr<UIBarButtonItem>=\"m_ptr\"^v}");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WKFormAccessoryViewAccessibility;
  -[WKFormAccessoryViewAccessibility _accessibilityLoadAccessibilityInformation](&v7, sel__accessibilityLoadAccessibilityInformation);
  -[WKFormAccessoryViewAccessibility axNextItem](self, "axNextItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("next.button"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  -[WKFormAccessoryViewAccessibility axPreviousItem](self, "axPreviousItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("previous.button"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v6);

}

- (id)axNextItem
{
  id *v2;

  v2 = (id *)-[WKFormAccessoryViewAccessibility safeIvarForKey:](self, "safeIvarForKey:", CFSTR("_nextItem"));
  if (v2)
    v2 = (id *)*v2;
  return v2;
}

- (id)axPreviousItem
{
  id *v2;

  v2 = (id *)-[WKFormAccessoryViewAccessibility safeIvarForKey:](self, "safeIvarForKey:", CFSTR("_previousItem"));
  if (v2)
    v2 = (id *)*v2;
  return v2;
}

@end

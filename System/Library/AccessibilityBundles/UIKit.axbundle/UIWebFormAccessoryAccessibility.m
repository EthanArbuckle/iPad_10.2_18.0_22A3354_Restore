@implementation UIWebFormAccessoryAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIWebFormAccessory");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const char *v3;
  const __CFString *v4;
  id obj;
  id *v6;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v6 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = CFSTR("UIWebFormAccessory");
  v3 = "UIBarButtonItem";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("UIWebFormAccessory"), CFSTR("_previousItem"), "UIBarButtonItem");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIWebFormAccessory"), CFSTR("initWithInputAssistantItem:"), "@", 0);
  objc_storeStrong(v6, obj);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  id v2;
  id v3;
  id v4;
  id v5;
  objc_super v6;
  SEL v7;
  UIWebFormAccessoryAccessibility *v8;

  v8 = self;
  v7 = a2;
  v6.receiver = self;
  v6.super_class = (Class)UIWebFormAccessoryAccessibility;
  -[UIWebFormAccessoryAccessibility _accessibilityLoadAccessibilityInformation](&v6, sel__accessibilityLoadAccessibilityInformation);
  v3 = (id)-[UIWebFormAccessoryAccessibility safeValueForKey:](v8, "safeValueForKey:", CFSTR("_previousItem"));
  v2 = accessibilityLocalizedString(CFSTR("uibutton.table.previous.button.title"));
  objc_msgSend(v3, "setAccessibilityLabel:");

  v5 = (id)-[UIWebFormAccessoryAccessibility safeValueForKey:](v8, "safeValueForKey:", CFSTR("_nextItem"));
  v4 = accessibilityLocalizedString(CFSTR("uibutton.table.next.button.title"));
  objc_msgSend(v5, "setAccessibilityLabel:");

}

- (UIWebFormAccessoryAccessibility)initWithInputAssistantItem:(id)a3
{
  UIWebFormAccessoryAccessibility *v3;
  UIWebFormAccessoryAccessibility *v5;
  objc_super v6;
  UIWebFormAccessoryAccessibility *v7;
  id location[2];
  UIWebFormAccessoryAccessibility *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v9;
  v9 = 0;
  v6.receiver = v3;
  v6.super_class = (Class)UIWebFormAccessoryAccessibility;
  v9 = -[UIWebFormAccessoryAccessibility initWithInputAssistantItem:](&v6, sel_initWithInputAssistantItem_, location[0]);
  v7 = v9;
  -[UIWebFormAccessoryAccessibility _accessibilityLoadAccessibilityInformation](v9, "_accessibilityLoadAccessibilityInformation");
  v5 = v7;
  objc_storeStrong((id *)&v7, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v9, 0);
  return v5;
}

@end

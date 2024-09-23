@implementation BuddyLocaleControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("BuddyLocaleController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("OBTemplateLabel"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BuddyLocaleController"), CFSTR("tableView: cellForRowAtIndexPath:"), "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("BuddyLocaleController"), CFSTR("_language"), "NSString");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("BuddyLocaleController"), CFSTR("OBWelcomeController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BuddyLocaleController"), CFSTR("setLanguage:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("OBWelcomeController"), CFSTR("headerView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BuddyLanguageLocaleCell"), CFSTR("titleLabel"), "@", 0);

}

- (void)setLanguage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BuddyLocaleControllerAccessibility;
  -[BuddyLocaleControllerAccessibility setLanguage:](&v8, sel_setLanguage_, v4);
  -[BuddyLocaleControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("headerView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_accessibilityDescendantOfType:", NSClassFromString(CFSTR("OBTemplateLabel")));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BuddyLocaleControllerAccessibility _accessibilityUpdateLanguageOnLabel:](self, "_accessibilityUpdateLanguageOnLabel:", v7);

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)BuddyLocaleControllerAccessibility;
  -[BuddyLocaleControllerAccessibility tableView:cellForRowAtIndexPath:](&v16, sel_tableView_cellForRowAtIndexPath_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  __UIAccessibilitySafeClass();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "safeValueForKey:", CFSTR("titleLabel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "text");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[BuddyLocaleControllerAccessibility _accessibilitySelectedLanguage](self, "_accessibilitySelectedLanguage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  AXAttributedStringForLanguage(v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    objc_msgSend(v8, "setAccessibilityLabel:", v14);

  return v8;
}

- (id)_accessibilitySelectedLanguage
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[BuddyLocaleControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_language"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_accessibilityUpdateLanguageOnLabel:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BuddyLocaleControllerAccessibility _accessibilitySelectedLanguage](self, "_accessibilitySelectedLanguage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  AXAttributedStringForLanguage(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(v7, "setAccessibilityLabel:", v6);

}

@end

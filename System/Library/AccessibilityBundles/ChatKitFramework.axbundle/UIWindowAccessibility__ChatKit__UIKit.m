@implementation UIWindowAccessibility__ChatKit__UIKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIWindow");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("UIWindow"), CFSTR("rootViewController"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("CKMessagesController"), CFSTR("chatController"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("CKChatController"), CFSTR("entryView"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("CKMessageEntryView"), CFSTR("contentView"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("CKMessageEntryContentView"), CFSTR("textView"), "@");

}

- (id)_accessibilityWindowSections
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)UIWindowAccessibility__ChatKit__UIKit;
  -[UIWindowAccessibility__ChatKit__UIKit _accessibilityWindowSections](&v11, sel__accessibilityWindowSections);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "axSafelyAddObjectsFromArray:", v3);
  -[UIWindowAccessibility__ChatKit__UIKit safeValueForKey:](self, "safeValueForKey:", CFSTR("rootViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("CKMessagesController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "safeValueForKey:", CFSTR("chatController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeValueForKey:", CFSTR("entryView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "safeValueForKey:", CFSTR("contentView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "safeValueForKey:", CFSTR("textView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "_accessibilityViewIsVisible"))
      objc_msgSend(v4, "axSafelyAddObject:", v9);

  }
  return v4;
}

- (BOOL)_accessibilityIsIsolatedWindow
{
  void *v3;
  char v4;
  objc_super v6;

  -[UIWindowAccessibility__ChatKit__UIKit accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("AXMessagesExtensionWindow"));

  if ((v4 & 1) != 0)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)UIWindowAccessibility__ChatKit__UIKit;
  return -[UIWindowAccessibility__ChatKit__UIKit _accessibilityIsIsolatedWindow](&v6, sel__accessibilityIsIsolatedWindow);
}

- (BOOL)accessibilityElementsHidden
{
  void *v3;
  int v4;
  objc_super v6;

  -[UIWindowAccessibility__ChatKit__UIKit accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("AXChatMainWindow"));

  if (v4)
    return _AXCKIsActionWindowShowing();
  v6.receiver = self;
  v6.super_class = (Class)UIWindowAccessibility__ChatKit__UIKit;
  return -[UIWindowAccessibility__ChatKit__UIKit accessibilityElementsHidden](&v6, sel_accessibilityElementsHidden);
}

@end

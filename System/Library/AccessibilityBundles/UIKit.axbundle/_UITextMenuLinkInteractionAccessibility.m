@implementation _UITextMenuLinkInteractionAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UITextMenuLinkInteraction");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id obj;
  id *v4;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v4 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UITextMenuLinkInteraction"), CFSTR("_contextMenuInteraction:styleForMenuWithConfiguration:"), "@", "@", 0);
  objc_storeStrong(v4, obj);
}

- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4
{
  objc_super v6;
  int v7;
  id v8;
  id v9;
  id location[2];
  _UITextMenuLinkInteractionAccessibility *v11;
  id v12;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = 0;
  objc_storeStrong(&v9, a4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (-[_UITextMenuLinkInteractionAccessibility _accessibilityBoolValueForKey:](v11, "_accessibilityBoolValueForKey:", CFSTR("AXIsPerformingSimpleTap")) & 1) != 0)
  {
    v8 = (id)objc_msgSend(MEMORY[0x24BDF7090], "defaultStyle");
    objc_msgSend(v8, "setPreferredLayout:", 3);
    v12 = v8;
    v7 = 1;
    objc_storeStrong(&v8, 0);
  }
  else
  {
    v6.receiver = v11;
    v6.super_class = (Class)_UITextMenuLinkInteractionAccessibility;
    v12 = -[_UITextMenuLinkInteractionAccessibility _contextMenuInteraction:styleForMenuWithConfiguration:](&v6, sel__contextMenuInteraction_styleForMenuWithConfiguration_, location[0], v9);
    v7 = 1;
  }
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  return v12;
}

@end

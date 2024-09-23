@implementation UIFieldEditorAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIFieldEditor");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const char *v3;
  const __CFString *v4;
  const char *v5;
  id v6;
  id *v7;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v7 = location;
  v6 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = "@";
  v4 = CFSTR("UIFieldEditor");
  v5 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", "@", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("insertText:"), v5, v3, 0);
  objc_storeStrong(v7, v6);
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (void)insertText:(id)a3
{
  objc_super v3;
  id location[2];
  UIFieldEditorAccessibility *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  MEMORY[0x2348C39BC](*MEMORY[0x24BEBB0B0]);
  v3.receiver = v5;
  v3.super_class = (Class)UIFieldEditorAccessibility;
  -[UIFieldEditorAccessibility insertText:](&v3, sel_insertText_, location[0]);
  MEMORY[0x2348C39BC](0);
  objc_storeStrong(location, 0);
}

@end

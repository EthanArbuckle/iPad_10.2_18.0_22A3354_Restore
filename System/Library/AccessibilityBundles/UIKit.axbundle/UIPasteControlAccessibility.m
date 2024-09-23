@implementation UIPasteControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIPasteControl");
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
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIPasteControl"), CFSTR("_secureName"), "I", 0);
  objc_storeStrong(v4, obj);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id location[2];
  UIPasteControlAccessibility *v9;
  id v10;

  v9 = self;
  location[1] = (id)a2;
  v7 = (id)objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v6 = (id)objc_msgSend(v7, "preferredLocalizations");
  location[0] = (id)objc_msgSend(v6, "firstObject");

  if (location[0])
  {
    -[UIPasteControlAccessibility safeUnsignedIntForKey:](v9, "safeUnsignedIntForKey:", CFSTR("_secureName"));
    v5 = (id)objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v4 = (id)objc_msgSend(v5, "preferredLocalizations");
    v3 = (id)objc_msgSend(v4, "firstObject");
    v10 = (id)UISLocalizedStringForSecureName();

  }
  else
  {
    v10 = 0;
  }
  objc_storeStrong(location, 0);
  return v10;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

@end

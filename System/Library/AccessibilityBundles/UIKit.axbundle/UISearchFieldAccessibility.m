@implementation UISearchFieldAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UISearchField");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)_accessibilityAutomationType
{
  return 45;
}

- (unint64_t)accessibilityTraits
{
  id v2;
  uint64_t v3;
  id v5;
  BOOL v6;
  id v7;
  char v8;
  id v9;
  id v10;
  char v11;
  unint64_t v12;
  SEL v13;
  UISearchFieldAccessibility *v14;

  v14 = self;
  v13 = a2;
  v12 = 0;
  v12 = *MEMORY[0x24BEBB198] | *MEMORY[0x24BDF73F8];
  v7 = (id)-[UISearchFieldAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("isEditing"));
  v8 = objc_msgSend(v7, "BOOLValue");

  if ((v8 & 1) != 0
    && ((objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilityHardwareKeyboardActive") & 1) != 0
     || (objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilitySoftwareKeyboardActive") & 1) != 0
     || _AXSMossdeepEnabled()))
  {
    v12 |= *MEMORY[0x24BEBB128];
  }
  v2 = (id)-[UISearchFieldAccessibility accessibilityUserDefinedTraits](v14, "accessibilityUserDefinedTraits");
  v6 = v2 == 0;

  if (!v6)
  {
    v5 = (id)-[UISearchFieldAccessibility accessibilityUserDefinedTraits](v14, "accessibilityUserDefinedTraits");
    v12 |= objc_msgSend(v5, "unsignedLongLongValue");

  }
  v11 = 0;
  objc_opt_class();
  v10 = (id)__UIAccessibilityCastAsClass();
  v9 = v10;
  objc_storeStrong(&v10, 0);
  v3 = -[UIView _accessibilityTextAreaTraits](v9);
  v12 |= v3;

  return v12;
}

- (id)_accessibilityCapturedImages
{
  return 0;
}

@end

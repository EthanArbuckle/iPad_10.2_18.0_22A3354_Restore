@implementation COSPasskeyEntryViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("COSPasskeyEntryViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("COSPasskeyEntryViewController"), CFSTR("init"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("COSPasskeyEntryViewController"), CFSTR("textDidChange:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("COSPasskeyEntryViewController"), CFSTR("passkeyField"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("COSPasskeyEntryViewController"), CFSTR("pinKeyView"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)COSPasskeyEntryViewControllerAccessibility;
  -[COSPasskeyEntryViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v6, sel__accessibilityLoadAccessibilityInformation);
  -[COSPasskeyEntryViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("passkeyField"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 0);
  -[COSPasskeyEntryViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("pinKeyView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsAccessibilityElement:", 1);
  accessibilityLocalizedString(CFSTR("no.pin.entered"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v5);

}

- (COSPasskeyEntryViewControllerAccessibility)init
{
  COSPasskeyEntryViewControllerAccessibility *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)COSPasskeyEntryViewControllerAccessibility;
  v2 = -[COSPasskeyEntryViewControllerAccessibility init](&v4, sel_init);
  -[COSPasskeyEntryViewControllerAccessibility _accessibilityLoadAccessibilityInformation](v2, "_accessibilityLoadAccessibilityInformation");
  return v2;
}

- (void)textDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)COSPasskeyEntryViewControllerAccessibility;
  -[COSPasskeyEntryViewControllerAccessibility textDidChange:](&v13, sel_textDidChange_, v4);
  objc_opt_class();
  -[COSPasskeyEntryViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("passkeyField"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    if (objc_msgSend(v7, "length"))
    {
      v9 = 0;
      do
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%C"), objc_msgSend(v7, "characterAtIndex:", v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v10);

        ++v9;
      }
      while (objc_msgSend(v7, "length") > v9);
    }
    -[COSPasskeyEntryViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("pinKeyView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "componentsJoinedByString:", CFSTR(" "));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAccessibilityLabel:", v12);

  }
  else
  {
    -[COSPasskeyEntryViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("pinKeyView"));
    v8 = (id)objc_claimAutoreleasedReturnValue();
    accessibilityLocalizedString(CFSTR("no.pin.entered"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAccessibilityLabel:", v11);
  }

}

@end

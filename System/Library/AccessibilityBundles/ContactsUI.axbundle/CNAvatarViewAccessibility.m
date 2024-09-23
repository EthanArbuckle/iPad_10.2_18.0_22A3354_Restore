@implementation CNAvatarViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CNAvatarView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNAvatarView"), CFSTR("contact"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNAvatarView"), CFSTR("imageView"), "@", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  -[CNAvatarViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("contact"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBACC0], "descriptorForRequiredKeysForStyle:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    goto LABEL_7;
  if ((objc_msgSend(v4, "areKeysAvailable:", v6) & 1) == 0)
  {
    objc_msgSend(v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      accessibilityContactStore();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "unifiedContactWithIdentifier:keysToFetch:error:", v9, v6, 0);
      v10 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v10;
      if (!v10)
        goto LABEL_7;
    }
  }
  objc_msgSend(MEMORY[0x24BDBACC0], "stringFromContact:style:", v4, 0);
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    v13 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("person.photo"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", v14, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_7:
    accessibilityLocalizedString(CFSTR("person.photo.unknown"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (BOOL)accessibilityElementsHidden
{
  void *v3;
  void *v4;
  int v5;

  -[CNAvatarViewAccessibility storedAccessibilityElementsHidden](self, "storedAccessibilityElementsHidden");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    LOBYTE(v5) = objc_msgSend(v3, "BOOLValue");
  else
    v5 = !-[CNAvatarViewAccessibility isAccessibilityElement](self, "isAccessibilityElement");

  return v5;
}

- (BOOL)isAccessibilityElement
{
  void *v3;
  objc_super v5;

  -[CNAvatarViewAccessibility isAccessibilityUserDefinedElement](self, "isAccessibilityUserDefinedElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return AXDoesRequestingClientDeserveAutomation() != 0;
  v5.receiver = self;
  v5.super_class = (Class)CNAvatarViewAccessibility;
  return -[CNAvatarViewAccessibility isAccessibilityElement](&v5, sel_isAccessibilityElement);
}

- (id)automationElements
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCE30];
  -[CNAvatarViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("imageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "axArrayByIgnoringNilElementsWithCount:", 1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

@end

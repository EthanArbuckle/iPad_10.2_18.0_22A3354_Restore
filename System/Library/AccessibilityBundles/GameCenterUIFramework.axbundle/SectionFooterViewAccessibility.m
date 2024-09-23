@implementation SectionFooterViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("GameCenterUI.SectionFooterView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GameCenterUI.SectionFooterView"), CFSTR("accessibilityLabelHasAction"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GameCenterUI.SectionFooterView"), CFSTR("accessibilityAttachmentHasAction"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GameCenterUI.SectionFooterView"), CFSTR("accessibilityFooterLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GameCenterUI.DynamicTypeLabel"), CFSTR("attributedText"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[SectionFooterViewAccessibility _axFooterLabel](self, "_axFooterLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_axFooterLabel
{
  return (id)-[SectionFooterViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityFooterLabel"));
}

- (id)_accessibilityInternalTextLinks
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SectionFooterViewAccessibility;
  -[SectionFooterViewAccessibility _accessibilityInternalTextLinks](&v16, sel__accessibilityInternalTextLinks);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = v3;
  }
  else
  {
    -[SectionFooterViewAccessibility _axFooterLabel](self, "_axFooterLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safeValueForKey:", CFSTR("attributedText"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "length"))
    {
      v7 = objc_msgSend(v6, "length");
      -[SectionFooterViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXLinks"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8 && objc_msgSend(v8, "count"))
      {
        v4 = v9;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        -[SectionFooterViewAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v10, CFSTR("AXLinks"));
        v13[0] = MEMORY[0x24BDAC760];
        v13[1] = 3221225472;
        v13[2] = __65__SectionFooterViewAccessibility__accessibilityInternalTextLinks__block_invoke;
        v13[3] = &unk_250216560;
        v13[4] = self;
        v14 = v6;
        v11 = v10;
        v15 = v11;
        objc_msgSend(v14, "enumerateAttributesInRange:options:usingBlock:", 0, v7, 0x100000, v13);
        v4 = v11;

      }
    }
    else
    {
      v4 = 0;
    }

  }
  return v4;
}

void __65__SectionFooterViewAccessibility__accessibilityInternalTextLinks__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  id v9;

  if (objc_msgSend(a2, "count"))
  {
    v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEBADF0]), "initWithAccessibilityContainer:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v9, "setRange:", a3, a4);
    objc_msgSend(*(id *)(a1 + 40), "string");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "substringWithRange:", a3, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAccessibilityLabel:", v8);

    objc_msgSend(*(id *)(a1 + 48), "axSafelyAddObject:", v9);
  }
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  if ((-[SectionFooterViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("accessibilityAttachmentHasAction")) & 1) != 0)return 1;
  else
    return -[SectionFooterViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("accessibilityLabelHasAction"));
}

@end

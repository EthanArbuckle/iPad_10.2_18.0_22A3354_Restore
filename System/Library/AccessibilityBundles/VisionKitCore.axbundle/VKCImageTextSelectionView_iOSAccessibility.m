@implementation VKCImageTextSelectionView_iOSAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VKCImageTextSelectionView_iOS");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VKCImageTextSelectionView"), CFSTR("highlightSelectableItems"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VKCImageTextSelectionView_iOS"), CFSTR("text"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VKCImageTextSelectionView"), CFSTR("setHighlightSelectableItems:animated:"), "v", "B", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VKCImageTextSelectionView_iOS"), CFSTR("selectable"), "B", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("VKCImageTextSelectionView_iOS"), CFSTR("VKCImageTextSelectionView"));
  objc_msgSend(v3, "validateClass:conformsToProtocol:", CFSTR("VKCImageTextSelectionView_iOS"), CFSTR("UITextInput"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VKCImageTextSelectionView_iOS"), CFSTR("isEditable"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VKCImageTextSelectionView_iOS"), CFSTR("text"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (BOOL)_axShouldHaveAccessibilityElements
{
  void *v3;
  void *v4;
  char v5;

  if (-[VKCImageTextSelectionView_iOSAccessibility _axHighlightSelectableItems](self, "_axHighlightSelectableItems")
    || AXRequestingClient() == 11)
  {
    return 1;
  }
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.Magnifier"));

  return v5;
}

- (unint64_t)accessibilityTraits
{
  objc_super v4;

  if (-[VKCImageTextSelectionView_iOSAccessibility _axShouldHaveAccessibilityElements](self, "_axShouldHaveAccessibilityElements"))
  {
    return *MEMORY[0x24BDFF000] | *MEMORY[0x24BDF7410];
  }
  v4.receiver = self;
  v4.super_class = (Class)VKCImageTextSelectionView_iOSAccessibility;
  return -[VKCImageTextSelectionView_iOSAccessibility accessibilityTraits](&v4, sel_accessibilityTraits);
}

- (id)accessibilityElements
{
  _QWORD *v3;
  void *v4;
  void *v5;
  id v6;
  VKCImageTextSelectionView_iOSAccessibility *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  if (!-[VKCImageTextSelectionView_iOSAccessibility _axShouldHaveAccessibilityElements](self, "_axShouldHaveAccessibilityElements"))return 0;
  v3 = (_QWORD *)MEMORY[0x24BEBB308];
  -[VKCImageTextSelectionView_iOSAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", *MEMORY[0x24BEBB308]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v8 = self;
    if (v8)
    {
      v12 = 0;
      v13 = &v12;
      v14 = 0x3032000000;
      v15 = __Block_byref_object_copy_;
      v16 = __Block_byref_object_dispose_;
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      -[VKCImageTextSelectionView_iOSAccessibility safeStringForKey:](v8, "safeStringForKey:", CFSTR("text"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "length");
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __67__VKCImageTextSelectionView_iOSAccessibility_accessibilityElements__block_invoke;
      v11[3] = &unk_2503DE518;
      v11[4] = v8;
      v11[5] = &v12;
      objc_msgSend(v9, "enumerateSubstringsInRange:options:usingBlock:", 0, v10, 1, v11);
      if (objc_msgSend((id)v13[5], "count"))
        -[VKCImageTextSelectionView_iOSAccessibility _accessibilitySetRetainedValue:forKey:](v8, "_accessibilitySetRetainedValue:forKey:", v13[5], *v3);
      v6 = (id)v13[5];

      _Block_object_dispose(&v12, 8);
    }
    else
    {
      v6 = (id)MEMORY[0x24BDBD1A8];
    }

  }
  return v6;
}

- (int64_t)accessibilityContainerType
{
  objc_super v4;

  if (-[VKCImageTextSelectionView_iOSAccessibility _axShouldHaveAccessibilityElements](self, "_axShouldHaveAccessibilityElements"))
  {
    return 4;
  }
  v4.receiver = self;
  v4.super_class = (Class)VKCImageTextSelectionView_iOSAccessibility;
  return -[VKCImageTextSelectionView_iOSAccessibility accessibilityContainerType](&v4, sel_accessibilityContainerType);
}

- (id)accessibilityLabel
{
  void *v3;
  objc_super v5;

  if (-[VKCImageTextSelectionView_iOSAccessibility _axShouldHaveAccessibilityElements](self, "_axShouldHaveAccessibilityElements"))
  {
    accessibilityLocalizedString(CFSTR("detected.text.element"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)VKCImageTextSelectionView_iOSAccessibility;
    -[VKCImageTextSelectionView_iOSAccessibility accessibilityLabel](&v5, sel_accessibilityLabel);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)accessibilityValue
{
  objc_super v4;

  if (-[VKCImageTextSelectionView_iOSAccessibility _axShouldHaveAccessibilityElements](self, "_axShouldHaveAccessibilityElements"))
  {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)VKCImageTextSelectionView_iOSAccessibility;
  -[VKCImageTextSelectionView_iOSAccessibility accessibilityValue](&v4, sel_accessibilityValue);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setHighlightSelectableItems:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VKCImageTextSelectionView_iOSAccessibility;
  -[VKCImageTextSelectionView_iOSAccessibility setHighlightSelectableItems:animated:](&v6, sel_setHighlightSelectableItems_animated_, a3, a4);
  if (!a3)
    -[VKCImageTextSelectionView_iOSAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", 0, *MEMORY[0x24BEBB308]);
}

- (BOOL)_axHighlightSelectableItems
{
  return -[VKCImageTextSelectionView_iOSAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("highlightSelectableItems"));
}

@end

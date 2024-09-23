@implementation MFExpandedMessageCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MFExpandedMessageCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("WKContentView"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MFExpandedMessageCell"), CFSTR("UICollectionViewCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFExpandedMessageCell"), CFSTR("messageViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UICollectionView"), CFSTR("_accessibilityShouldUseCollectionViewCellAccessibilityElements"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UICollectionViewCellAccessibilityElement"), CFSTR("indexPath"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MFModernAddressAtom"), CFSTR("_atomView"), "CNAtomView");

}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (BOOL)_accessibilityTouchContainerShouldOutputBraille
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_super v11;
  char v12;

  -[MFExpandedMessageCellAccessibility _accessibilityFindSubviewDescendant:](self, "_accessibilityFindSubviewDescendant:", &__block_literal_global_4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_atomView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsSafeCategory();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_accessibilityMessageIndexDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    __AXStringForVariables();
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)MFExpandedMessageCellAccessibility;
    -[MFExpandedMessageCellAccessibility accessibilityLabel](&v11, sel_accessibilityLabel);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;

  return v9;
}

uint64_t __56__MFExpandedMessageCellAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  NSClassFromString(CFSTR("MFModernAddressAtom"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)accessibilityDragSourceDescriptors
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  -[MFExpandedMessageCellAccessibility _accessibilityDescendantOfType:](self, "_accessibilityDescendantOfType:", NSClassFromString(CFSTR("WKContentView")));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "accessibilityDragSourceDescriptors");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)MFExpandedMessageCellAccessibility;
    -[MFExpandedMessageCellAccessibility accessibilityDragSourceDescriptors](&v8, sel_accessibilityDragSourceDescriptors);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (id)accessibilityElements
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;
  char v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  -[MFExpandedMessageCellAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "safeBoolForKey:", CFSTR("_accessibilityShouldUseCollectionViewCellAccessibilityElements"));

  if (!v4)
    goto LABEL_4;
  v11 = 0;
  objc_opt_class();
  -[MFExpandedMessageCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("messageViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v12[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_4:
    v10.receiver = self;
    v10.super_class = (Class)MFExpandedMessageCellAccessibility;
    -[MFExpandedMessageCellAccessibility accessibilityElements](&v10, sel_accessibilityElements);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

@end

@implementation NicknameFieldCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("GameCenterUI.NicknameFieldCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GameCenterUI.NicknameFieldCollectionViewCell"), CFSTR("accessibilityTextLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITextField"), CFSTR("isEditing"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITextField"), CFSTR("_clearButton"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)_accessibilityTextViewTextOperationResponder
{
  return (id)-[NicknameFieldCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityTextLabel"));
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[NicknameFieldCollectionViewCellAccessibility _accessibilityTextViewTextOperationResponder](self, "_accessibilityTextViewTextOperationResponder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[NicknameFieldCollectionViewCellAccessibility _accessibilityTextViewTextOperationResponder](self, "_accessibilityTextViewTextOperationResponder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_accessibilityLineNumberAndColumnForPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  void *v6;

  y = a3.y;
  x = a3.x;
  -[NicknameFieldCollectionViewCellAccessibility _accessibilityTextViewTextOperationResponder](self, "_accessibilityTextViewTextOperationResponder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_accessibilityLineNumberAndColumnForPoint:", x, y);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (_NSRange)_accessibilityRangeForLineNumberAndColumn:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  _NSRange result;

  v4 = a3;
  -[NicknameFieldCollectionViewCellAccessibility _accessibilityTextViewTextOperationResponder](self, "_accessibilityTextViewTextOperationResponder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_accessibilityRangeForLineNumberAndColumn:", v4);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.length = v10;
  result.location = v9;
  return result;
}

- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  id v5;

  length = a3.length;
  location = a3.location;
  -[NicknameFieldCollectionViewCellAccessibility _accessibilityTextViewTextOperationResponder](self, "_accessibilityTextViewTextOperationResponder");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_accessibilitySetSelectedTextRange:", location, length);

}

- (unint64_t)accessibilityTraits
{
  uint64_t v2;
  void *v3;
  int v4;
  uint64_t v5;

  v2 = *MEMORY[0x24BDFF000] | *MEMORY[0x24BEBB198];
  -[NicknameFieldCollectionViewCellAccessibility _accessibilityTextViewTextOperationResponder](self, "_accessibilityTextViewTextOperationResponder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "safeBoolForKey:", CFSTR("isEditing"));

  v5 = *MEMORY[0x24BEBB128];
  if (!v4)
    v5 = 0;
  return v2 | v5;
}

- (BOOL)_accessibilitySupportsHandwriting
{
  unint64_t v3;
  objc_super v5;

  v3 = -[NicknameFieldCollectionViewCellAccessibility accessibilityTraits](self, "accessibilityTraits");
  if ((*MEMORY[0x24BEBB128] & ~v3) == 0)
    return 1;
  v5.receiver = self;
  v5.super_class = (Class)NicknameFieldCollectionViewCellAccessibility;
  return -[NicknameFieldCollectionViewCellAccessibility _accessibilitySupportsHandwriting](&v5, sel__accessibilitySupportsHandwriting);
}

- (unint64_t)_accessibilityAutomationType
{
  return 52;
}

- (id)accessibilityIdentifier
{
  return CFSTR("Nickname Field");
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  -[NicknameFieldCollectionViewCellAccessibility _accessibilityTextViewTextOperationResponder](self, "_accessibilityTextViewTextOperationResponder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "safeBoolForKey:", CFSTR("isEditing")) & 1) != 0)
  {
    objc_msgSend(v3, "safeValueForKey:", CFSTR("_clearButton"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)NicknameFieldCollectionViewCellAccessibility;
    -[NicknameFieldCollectionViewCellAccessibility _accessibilitySupplementaryFooterViews](&v7, sel__accessibilitySupplementaryFooterViews);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

@end

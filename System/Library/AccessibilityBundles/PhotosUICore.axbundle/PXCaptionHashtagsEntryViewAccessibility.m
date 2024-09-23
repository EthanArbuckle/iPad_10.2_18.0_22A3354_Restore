@implementation PXCaptionHashtagsEntryViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PXCaptionHashtagsEntryView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXCaptionHashtagsEntryView"), CFSTR("isEditing"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXCaptionHashtagsEntryView"), CFSTR("textView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXCaptionHashtagsEntryView"), CFSTR("text"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXCaptionHashtagsEntryView"), CFSTR("moreButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXCaptionHashtagsEntryView"), CFSTR("moreButtonTapped:"), "v", "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)_accessibilityTextViewTextOperationResponder
{
  return (id)-[PXCaptionHashtagsEntryViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("textView"));
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[PXCaptionHashtagsEntryViewAccessibility _accessibilityTextViewTextOperationResponder](self, "_accessibilityTextViewTextOperationResponder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  uint64_t v5;

  -[PXCaptionHashtagsEntryViewAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("text"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "length"))
  {
    -[PXCaptionHashtagsEntryViewAccessibility _accessibilityTextViewTextOperationResponder](self, "_accessibilityTextViewTextOperationResponder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessibilityValue");
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
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
  -[PXCaptionHashtagsEntryViewAccessibility _accessibilityTextViewTextOperationResponder](self, "_accessibilityTextViewTextOperationResponder");
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
  -[PXCaptionHashtagsEntryViewAccessibility _accessibilityTextViewTextOperationResponder](self, "_accessibilityTextViewTextOperationResponder");
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
  -[PXCaptionHashtagsEntryViewAccessibility _accessibilityTextViewTextOperationResponder](self, "_accessibilityTextViewTextOperationResponder");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_accessibilitySetSelectedTextRange:", location, length);

}

- (_NSRange)_accessibilitySelectedTextRange
{
  void *v2;
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  _NSRange result;

  -[PXCaptionHashtagsEntryViewAccessibility _accessibilityTextViewTextOperationResponder](self, "_accessibilityTextViewTextOperationResponder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_accessibilitySelectedTextRange");
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2;
  int v3;
  uint64_t v4;

  v2 = *MEMORY[0x24BDFF000] | *MEMORY[0x24BEBB198];
  v3 = -[PXCaptionHashtagsEntryViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isEditing"));
  v4 = *MEMORY[0x24BEBB128];
  if (!v3)
    v4 = 0;
  return v2 | v4;
}

- (BOOL)_accessibilitySupportsHandwriting
{
  unint64_t v3;
  objc_super v5;

  v3 = -[PXCaptionHashtagsEntryViewAccessibility accessibilityTraits](self, "accessibilityTraits");
  if ((*MEMORY[0x24BEBB128] & ~v3) == 0)
    return 1;
  v5.receiver = self;
  v5.super_class = (Class)PXCaptionHashtagsEntryViewAccessibility;
  return -[PXCaptionHashtagsEntryViewAccessibility _accessibilitySupportsHandwriting](&v5, sel__accessibilitySupportsHandwriting);
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  objc_super v11;

  -[PXCaptionHashtagsEntryViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("moreButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDBCEB8];
  v11.receiver = self;
  v11.super_class = (Class)PXCaptionHashtagsEntryViewAccessibility;
  -[PXCaptionHashtagsEntryViewAccessibility _accessibilitySupplementaryFooterViews](&v11, sel__accessibilitySupplementaryFooterViews);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "axArrayWithPossiblyNilArrays:", 1, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  if (objc_msgSend(v3, "_accessibilityViewIsVisible"))
    objc_msgSend(v9, "axSafelyAddObject:", v3);

  return v9;
}

- (void)moreButtonTapped:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXCaptionHashtagsEntryViewAccessibility;
  -[PXCaptionHashtagsEntryViewAccessibility moreButtonTapped:](&v4, sel_moreButtonTapped_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], self);
}

- (unint64_t)_accessibilityAutomationType
{
  return 52;
}

- (id)accessibilityIdentifier
{
  return CFSTR("Caption Entry View");
}

@end

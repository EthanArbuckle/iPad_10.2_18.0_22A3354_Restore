@implementation SKUIGiftTextTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SKUIGiftTextTableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SKUIGiftTextTableViewCell"), CFSTR("_textView"), "UITextView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SKUIGiftTextTableViewCell"), CFSTR("_placeholderLabel"), "UILabel");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[SKUIGiftTextTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("label"));
}

- (id)accessibilityValue
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[SKUIGiftTextTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_placeholderLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isHidden");

  if ((v4 & 1) != 0)
  {
    -[SKUIGiftTextTableViewCellAccessibility _accessibilityTextViewTextOperationResponder](self, "_accessibilityTextViewTextOperationResponder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accessibilityValue");
  }
  else
  {
    -[SKUIGiftTextTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_placeholderLabel"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accessibilityLabel");
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  id v5;

  length = a3.length;
  location = a3.location;
  -[SKUIGiftTextTableViewCellAccessibility _accessibilityTextViewTextOperationResponder](self, "_accessibilityTextViewTextOperationResponder");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_accessibilitySetSelectedTextRange:", location, length);

}

- (id)_accessibilityLineNumberAndColumnForPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  void *v6;

  y = a3.y;
  x = a3.x;
  -[SKUIGiftTextTableViewCellAccessibility _accessibilityTextViewTextOperationResponder](self, "_accessibilityTextViewTextOperationResponder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_accessibilityLineNumberAndColumnForPoint:", x, y);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
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

  -[SKUIGiftTextTableViewCellAccessibility _accessibilityTextViewTextOperationResponder](self, "_accessibilityTextViewTextOperationResponder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_accessibilitySelectedTextRange");
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
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
  -[SKUIGiftTextTableViewCellAccessibility _accessibilityTextViewTextOperationResponder](self, "_accessibilityTextViewTextOperationResponder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_accessibilityRangeForLineNumberAndColumn:", v4);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.length = v10;
  result.location = v9;
  return result;
}

- (id)_accessibilityTextViewTextOperationResponder
{
  return (id)-[SKUIGiftTextTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_textView"));
}

- (unint64_t)accessibilityTraits
{
  void *v3;
  int v4;
  void *v5;
  unint64_t v6;

  -[SKUIGiftTextTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_placeholderLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isHidden");

  if (!v4)
    return 0;
  -[SKUIGiftTextTableViewCellAccessibility _accessibilityTextViewTextOperationResponder](self, "_accessibilityTextViewTextOperationResponder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "accessibilityTraits");

  return v6;
}

- (CGPoint)accessibilityActivationPoint
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  -[SKUIGiftTextTableViewCellAccessibility _accessibilityTextViewTextOperationResponder](self, "_accessibilityTextViewTextOperationResponder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityActivationPoint");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

@end

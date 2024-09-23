@implementation EKEventDetailTextCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("EKEventDetailTextCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("EKEventDetailTextCell"), CFSTR("_textView"), "UITextView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("EKEventDetailTextCell"), CFSTR("_title"), "NSString");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)_accessibilityAutomationType
{
  return 52;
}

- (id)accessibilityLabel
{
  return (id)-[EKEventDetailTextCellAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("_title"));
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[EKEventDetailTextCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_textView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_accessibilityDataDetectorScheme:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;

  y = a3.y;
  x = a3.x;
  -[EKEventDetailTextCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_textView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventDetailTextCellAccessibility convertPoint:toView:](self, "convertPoint:toView:", v6, x, y);
  v8 = v7;
  v10 = v9;

  -[EKEventDetailTextCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_textView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_accessibilityDataDetectorScheme:", v8, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_accessibilityLineNumberAndColumnForPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  void *v6;

  y = a3.y;
  x = a3.x;
  -[EKEventDetailTextCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_textView"));
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
  -[EKEventDetailTextCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_textView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_accessibilityRangeForLineNumberAndColumn:", v4);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.length = v10;
  result.location = v9;
  return result;
}

- (CGRect)_accessibilityChargedLineBoundsForRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  length = a3.length;
  location = a3.location;
  -[EKEventDetailTextCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_textView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_accessibilityChargedLineBoundsForRange:", location, length);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGRect)_accessibilityBoundsForRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  length = a3.length;
  location = a3.location;
  -[EKEventDetailTextCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_textView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_accessibilityBoundsForRange:", location, length);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (id)_accessibilityInternalTextLinks
{
  void *v2;
  void *v3;

  -[EKEventDetailTextCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_textView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityInternalTextLinks");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDFF000];
}

@end

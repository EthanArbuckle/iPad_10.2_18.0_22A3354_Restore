@implementation UICompletionTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UICompletionTableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  id v3;
  char v4;

  v3 = (id)-[UICompletionTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_tableCell"));
  v4 = objc_msgSend(v3, "isAccessibilityElement");

  return v4 & 1;
}

- (id)accessibilityLabel
{
  id v3;
  id v4;

  v3 = (id)-[UICompletionTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_tableCell"));
  v4 = (id)objc_msgSend(v3, "_accessibilityAXAttributedLabel");

  return v4;
}

- (id)accessibilityValue
{
  id v3;
  id v4;

  v3 = (id)-[UICompletionTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_tableCell"));
  v4 = (id)objc_msgSend(v3, "_accessibilityAXAttributedValue");

  return v4;
}

@end

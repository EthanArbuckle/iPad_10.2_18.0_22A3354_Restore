@implementation EKExpandingTextViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("EKExpandingTextView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  -[EKExpandingTextViewAccessibility accessibilityIdentification](self, "accessibilityIdentification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("TextViewInInlineCell"));

  if (v4)
  {
    -[EKExpandingTextViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("superview"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safeValueForKey:", CFSTR("textLabel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessibilityLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    return v7;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)EKExpandingTextViewAccessibility;
    -[EKExpandingTextViewAccessibility accessibilityLabel](&v9, sel_accessibilityLabel);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

@end

@implementation WFTableViewFooterLinkViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("WFTableViewFooterLinkView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[WFTableViewFooterLinkViewAccessibility _axFooterViewTextView](self, "_axFooterViewTextView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_accessibilityInternalTextLinks
{
  void *v2;
  void *v3;

  -[WFTableViewFooterLinkViewAccessibility _axFooterViewTextView](self, "_axFooterViewTextView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityInternalTextLinks");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_axFooterViewTextView
{
  return (id)-[WFTableViewFooterLinkViewAccessibility _accessibilityDescendantOfType:](self, "_accessibilityDescendantOfType:", objc_opt_class());
}

@end

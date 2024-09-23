@implementation CNContactListSectionHeaderFooterViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CNContactListSectionHeaderFooterView");
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
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CNContactListSectionHeaderFooterViewAccessibility;
  -[CNContactListSectionHeaderFooterViewAccessibility accessibilityLabel](&v6, sel_accessibilityLabel);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lowercaseStringWithLocale:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end

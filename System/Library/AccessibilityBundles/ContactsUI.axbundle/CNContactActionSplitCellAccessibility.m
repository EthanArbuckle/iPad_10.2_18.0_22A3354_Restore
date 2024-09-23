@implementation CNContactActionSplitCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CNContactActionSplitCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNContactActionSplitCell"), CFSTR("rightLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNContactActionSplitCell"), CFSTR("leftLabel"), "@", 0);

}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = (void *)objc_opt_new();
  -[CNContactActionSplitCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("leftLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    objc_msgSend(v4, "setAccessibilityContainer:", self);
    objc_msgSend(v3, "addObject:", v4);
  }
  -[CNContactActionSplitCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("rightLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessibilityLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (v9)
  {
    objc_msgSend(v7, "setAccessibilityContainer:", self);
    objc_msgSend(v3, "addObject:", v7);
  }

  return v3;
}

@end

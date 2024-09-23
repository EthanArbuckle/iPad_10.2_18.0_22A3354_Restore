@implementation GKUILabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UILabel");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  objc_super v9;

  -[GKUILabelAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("ComposeHeaderFieldValueLabel")))
  {
    -[GKUILabelAccessibility accessibilityLabel](self, "accessibilityLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length") != 0;

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)GKUILabelAccessibility;
    v7 = -[GKUILabelAccessibility isAccessibilityElement](&v9, sel_isAccessibilityElement);
  }

  return v7;
}

@end

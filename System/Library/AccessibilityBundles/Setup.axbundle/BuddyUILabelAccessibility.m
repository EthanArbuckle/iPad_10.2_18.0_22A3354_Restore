@implementation BuddyUILabelAccessibility

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
  BOOL v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BuddyUILabelAccessibility;
  if (!-[BuddyUILabelAccessibility isAccessibilityElement](&v8, sel_isAccessibilityElement))
    return 0;
  -[BuddyUILabelAccessibility accessibilityLabel](self, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByTrimmingCharactersInSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length") != 0;

  return v6;
}

@end

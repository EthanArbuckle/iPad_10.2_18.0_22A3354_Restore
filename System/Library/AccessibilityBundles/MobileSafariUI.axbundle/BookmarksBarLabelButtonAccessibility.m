@implementation BookmarksBarLabelButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("BookmarksBarLabelButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("bookmark.button"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)BookmarksBarLabelButtonAccessibility;
  -[BookmarksBarLabelButtonAccessibility accessibilityLabel](&v8, sel_accessibilityLabel);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end

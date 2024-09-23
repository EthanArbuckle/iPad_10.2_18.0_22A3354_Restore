@implementation UIContextualActionAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIContextualAction");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id obj;
  id *v4;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v4 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIContextualAction"), CFSTR("title"), "@", 0);
  objc_storeStrong(v4, obj);
}

- (id)accessibilityLabel
{
  id location[2];
  UIContextualActionAccessibility *v4;
  id v5;

  v4 = self;
  location[1] = (id)a2;
  location[0] = (id)-[UIContextualActionAccessibility accessibilityUserDefinedLabel](self, "accessibilityUserDefinedLabel");
  if (location[0])
    v5 = location[0];
  else
    v5 = (id)-[UIContextualActionAccessibility _accessibilityStringForLabelKeyValues:](v4, "_accessibilityStringForLabelKeyValues:", CFSTR("title"));
  objc_storeStrong(location, 0);
  return v5;
}

@end

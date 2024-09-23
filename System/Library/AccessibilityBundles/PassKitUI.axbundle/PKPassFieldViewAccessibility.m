@implementation PKPassFieldViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKPassFieldView");
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
  id v4;

  -[PKPassFieldViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("labelLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("***")) & 1) != 0)
    v4 = 0;
  else
    v4 = v3;

  return v4;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;
  id v4;

  -[PKPassFieldViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("valueLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("***")) & 1) != 0)
    v4 = 0;
  else
    v4 = v3;

  return v4;
}

@end

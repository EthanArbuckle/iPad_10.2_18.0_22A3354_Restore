@implementation ICSDataclassWithSubtitleTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ICSDataclassWithSubtitleTableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ICSDataclassWithSubtitleTableViewCell"), CFSTR("toggle"), "@", 0);
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICSDataclassWithSubtitleTableViewCellAccessibility;
  v3 = -[ICSDataclassWithSubtitleTableViewCellAccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
  objc_opt_class();
  -[ICSDataclassWithSubtitleTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("toggle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "_accessibilityViewIsVisible"))
    v3 |= objc_msgSend(v5, "accessibilityTraits");

  return v3;
}

- (BOOL)isAccessibilityElement
{
  void *v3;
  void *v4;
  BOOL v5;
  objc_super v7;
  char v8;

  v8 = 0;
  objc_opt_class();
  -[ICSDataclassWithSubtitleTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("toggle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "_accessibilityViewIsVisible") & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)ICSDataclassWithSubtitleTableViewCellAccessibility;
    v5 = -[ICSDataclassWithSubtitleTableViewCellAccessibility isAccessibilityElement](&v7, sel_isAccessibilityElement);
  }

  return v5;
}

- (id)automationElements
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ICSDataclassWithSubtitleTableViewCellAccessibility;
  -[ICSDataclassWithSubtitleTableViewCellAccessibility automationElements](&v11, sel_automationElements);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  objc_opt_class();
  -[ICSDataclassWithSubtitleTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("toggle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "_accessibilityViewIsVisible")
    && (objc_msgSend(v7, "containsObject:", v9) & 1) == 0)
  {
    objc_msgSend(v7, "axSafelyAddObject:", v9);
  }

  return v7;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;
  char v9;

  v9 = 0;
  objc_opt_class();
  -[ICSDataclassWithSubtitleTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("toggle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "_accessibilityViewIsVisible"))
  {
    objc_msgSend(v4, "accessibilityValue");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)ICSDataclassWithSubtitleTableViewCellAccessibility;
    -[ICSDataclassWithSubtitleTableViewCellAccessibility accessibilityValue](&v8, sel_accessibilityValue);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (CGPoint)accessibilityActivationPoint
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;
  char v12;
  CGPoint result;

  v12 = 0;
  objc_opt_class();
  -[ICSDataclassWithSubtitleTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("toggle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "_accessibilityViewIsVisible"))
  {
    objc_msgSend(v4, "accessibilityActivationPoint");
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)ICSDataclassWithSubtitleTableViewCellAccessibility;
    -[ICSDataclassWithSubtitleTableViewCellAccessibility accessibilityActivationPoint](&v11, sel_accessibilityActivationPoint);
  }
  v7 = v5;
  v8 = v6;

  v9 = v7;
  v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

@end

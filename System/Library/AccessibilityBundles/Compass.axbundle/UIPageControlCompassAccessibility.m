@implementation UIPageControlCompassAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIPageControl");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (int64_t)_axNumberOfPages
{
  void *v2;
  int64_t v3;

  -[UIPageControlCompassAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("numberOfPages"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (int64_t)_axCurrentPage
{
  void *v2;
  int64_t v3;

  -[UIPageControlCompassAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("currentPage"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (id)accessibilityValue
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;

  -[UIPageControlCompassAccessibility _axNumberOfPages](self, "_axNumberOfPages");
  v3 = -[UIPageControlCompassAccessibility _axCurrentPage](self, "_axCurrentPage");
  v4 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("page.control.format.text"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  AXFormatInteger();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  AXFormatInteger();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (v3 != 1)
    {
      v10 = 0;
      goto LABEL_7;
    }
    v9 = CFSTR("page.title.level");
  }
  else
  {
    v9 = CFSTR("page.title.compass");
  }
  accessibilityLocalizedString(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
  __UIAXStringForVariables();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end

@implementation TPSPageControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TPSPageControl");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("TPSPageControl"), CFSTR("UIPageControl"));
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "numberOfPages");
    v5 = objc_msgSend(v3, "currentPage") + 1;
    v6 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("page.scrollStatus.label"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", v7, v5, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end

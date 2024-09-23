@implementation SUNavigationButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUNavigationButton");
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
  __CFString *v6;
  objc_super v8;

  -[SUNavigationButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("currentTitle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    goto LABEL_2;
  -[SUNavigationButtonAccessibility accessibilityIdentification](self, "accessibilityIdentification");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("1")) & 1) != 0)
  {
    v6 = CFSTR("share.button");
LABEL_7:
    accessibilityLocalizedString(v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("2")))
  {
    v6 = CFSTR("history.button");
    goto LABEL_7;
  }

LABEL_2:
  v8.receiver = self;
  v8.super_class = (Class)SUNavigationButtonAccessibility;
  -[SUNavigationButtonAccessibility accessibilityLabel](&v8, sel_accessibilityLabel);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v4;
}

@end

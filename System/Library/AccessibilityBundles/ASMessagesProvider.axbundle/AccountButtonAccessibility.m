@implementation AccountButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ASMessagesProvider.AccountButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ASMessagesProvider.AccountButton"), CFSTR("accessibilityBadgeCount"), "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AccountButtonAccessibility;
  return *MEMORY[0x24BDF73B0] | -[AccountButtonAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (id)accessibilityLabel
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[AccountButtonAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("accessibilityBadgeCount"));
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)v2;
    v4 = (void *)MEMORY[0x24BDD17C8];
    accessibilityAppStoreLocalizedString(CFSTR("account.updates"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringWithFormat:", v5, objc_msgSend(v3, "intValue"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    accessibilityAppStoreLocalizedString(CFSTR("account.button"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    accessibilityAppStoreLocalizedString(CFSTR("account.button"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

@end

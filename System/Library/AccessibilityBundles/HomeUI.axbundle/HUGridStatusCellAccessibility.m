@implementation HUGridStatusCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUGridStatusCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("HFItem"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUGridStatusCell"), CFSTR("item"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v13;

  objc_opt_class();
  -[HUGridStatusCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("item"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "latestResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE4CF78]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "midValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE4CF80]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    accessibilityHomeUILocalizedString(CFSTR("unknown.percent"));
  else
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE4CF58]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUGridStatusCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[HUGridStatusCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end

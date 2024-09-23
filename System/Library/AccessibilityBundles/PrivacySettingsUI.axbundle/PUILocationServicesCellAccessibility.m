@implementation PUILocationServicesCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PUILocationServicesCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUILocationServicesCell"), CFSTR("location"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUILocationUsageMixin"), CFSTR("usage"), "i", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[PUILocationServicesCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("location"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("usage"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  if (v5 == 2)
  {
    v7 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("tracking.used.recently"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v8, 24);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (v5 == 4)
    {
      v6 = CFSTR("tracking.geofence.enabled");
    }
    else
    {
      if (v5 != 3)
      {
        v9 = 0;
        goto LABEL_9;
      }
      v6 = CFSTR("tracking.used.currently");
    }
    accessibilityLocalizedString(v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_9:
  -[PUILocationServicesCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("textLabel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end

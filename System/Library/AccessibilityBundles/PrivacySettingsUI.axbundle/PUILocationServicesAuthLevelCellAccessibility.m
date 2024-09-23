@implementation PUILocationServicesAuthLevelCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PUILocationServicesAuthLevelCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUILocationServicesAuthLevelCell"), CFSTR("location"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUILocationUsageMixin"), CFSTR("usage"), "i", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[PUILocationServicesAuthLevelCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_location"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "safeValueForKey:", CFSTR("usage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  switch(v6)
  {
    case 1:
      v7 = CFSTR("tracking.used.none.recently");
      goto LABEL_6;
    case 2:
      v8 = (void *)MEMORY[0x24BDD17C8];
      accessibilityLocalizedString(CFSTR("tracking.used.recently"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringWithFormat:", v9, 24);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    case 3:
      v7 = CFSTR("tracking.used.currently");
      goto LABEL_6;
    case 4:
      v7 = CFSTR("tracking.geofence.enabled");
LABEL_6:
      accessibilityLocalizedString(v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v10 = 0;
      break;
  }
  -[PUILocationServicesAuthLevelCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("textLabel"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end

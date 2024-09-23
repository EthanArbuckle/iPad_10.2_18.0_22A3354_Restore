@implementation VUIOfferViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VUIOfferView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("VUIOfferView"), CFSTR("titleLabel"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("VUIOfferView"), CFSTR("subtitleLabel"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("VUIOfferView"), CFSTR("textLabel"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("VUIOfferView"), CFSTR("versionsButton"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("VUIOfferView"), CFSTR("imageView"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("VUIOfferView"), CFSTR("appIconView"), "@");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[VUIOfferViewAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("imageView, appIconView, titleLabel, textLabel, subtitleLabel, versionsButton"));
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VUIOfferViewAccessibility;
  return *MEMORY[0x24BDF73B0] | -[VUIOfferViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;
  objc_super v16;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16.receiver = self;
  v16.super_class = (Class)VUIOfferViewAccessibility;
  -[VUIOfferViewAccessibility accessibilityCustomActions](&v16, sel_accessibilityCustomActions);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObjectsFromArray:", v4);

  -[VUIOfferViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("versionsButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_initWeak(&location, v5);
    v6 = objc_alloc(MEMORY[0x24BDF6788]);
    accessibilityLocalizedString(CFSTR("mls.versions"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x24BDAC760];
    v11 = 3221225472;
    v12 = __55__VUIOfferViewAccessibility_accessibilityCustomActions__block_invoke;
    v13 = &unk_2503D25D8;
    objc_copyWeak(&v14, &location);
    v8 = (void *)objc_msgSend(v6, "initWithName:actionHandler:", v7, &v10);

    objc_msgSend(v3, "axSafelyAddObject:", v8, v10, v11, v12, v13);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return v3;
}

uint64_t __55__VUIOfferViewAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "sendActionsForControlEvents:", 64);

  return 1;
}

@end

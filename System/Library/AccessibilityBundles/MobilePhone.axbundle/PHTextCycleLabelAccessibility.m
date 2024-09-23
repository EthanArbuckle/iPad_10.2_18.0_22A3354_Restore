@implementation PHTextCycleLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PHTextCycleLabel");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLanguage
{
  void *v3;
  void *v4;
  void *v5;

  -[PHTextCycleLabelAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("_accessibilityLanguageMap"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("en"), CFSTR("Emergency call"), CFSTR("de"), CFSTR("Notruf"), CFSTR("fr"), CFSTR("Appel d’urgence"), CFSTR("it"), CFSTR("Solo emergenze"), CFSTR("ja"), CFSTR("緊急電話"), CFSTR("es"), CFSTR("Llamada SOS"), CFSTR("pt"), CFSTR("Ligação emergência"), CFSTR("ru"), CFSTR("Экстренный вызов"), 0);
    -[PHTextCycleLabelAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v3, CFSTR("_accessibilityLanguageMap"));
  }
  -[PHTextCycleLabelAccessibility accessibilityLabel](self, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    _AXAssert();

  return v5;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PHTextCycleLabelAccessibility;
  return *MEMORY[0x24BDF7430] | -[PHTextCycleLabelAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end

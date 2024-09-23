@implementation HUCheckmarkIconCollectionListCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUCheckmarkIconCollectionListCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUCheckmarkIconCollectionListCell"), CFSTR("hidesCheckmark"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUCheckmarkIconCollectionListCell"), CFSTR("checkmarkAccessoryView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUCheckmarkAccessoryView"), CFSTR("checked"), "B", 0);

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
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  -[HUCheckmarkIconCollectionListCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("contentView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("textLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v3, "safeValueForKeyPath:", CFSTR("secondaryTextLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((-[HUCheckmarkIconCollectionListCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("hidesCheckmark")) & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    -[HUCheckmarkIconCollectionListCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("checkmarkAccessoryView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "safeBoolForKey:", CFSTR("checked")))
    {
      v10 = objc_alloc(MEMORY[0x24BDD17C8]);
      accessibilityHomeUILocalizedString(CFSTR("automation.scenes.and.accessories.checked"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v10, "initWithString:", v11);

    }
    else
    {
      v8 = 0;
    }

  }
  objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 3, v5, v7, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  AXLabelForElements();
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end

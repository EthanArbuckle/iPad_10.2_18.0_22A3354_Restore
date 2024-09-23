@implementation CAMDrawerSmartStyleButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMDrawerSmartStyleButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateProtocol:hasMethod:isInstanceMethod:isRequired:", CFSTR("CAMControlDrawerExpandableButton"), CFSTR("isExpanded"), 1, 1);
  objc_msgSend(v3, "validateClass:conformsToProtocol:", CFSTR("CAMControlDrawerCustomButton"), CFSTR("CAMControlDrawerExpandableButton"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CAMDrawerSmartStyleButton"), CFSTR("CAMControlDrawerCustomButton"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMDrawerSmartStyleButton"), CFSTR("shutterButton"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (int64_t)_accessibilityExpandedStatus
{
  if (-[CAMDrawerSmartStyleButtonAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isExpanded")))return 1;
  else
    return 2;
}

- (id)accessibilityLabel
{
  return accessibilityCameraUI3LocalizedString(CFSTR("smart.style.button"));
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x24BDBCEB8];
  v11.receiver = self;
  v11.super_class = (Class)CAMDrawerSmartStyleButtonAccessibility;
  -[CAMDrawerSmartStyleButtonAccessibility _accessibilitySupplementaryFooterViews](&v11, sel__accessibilitySupplementaryFooterViews);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axArrayWithPossiblyNilArrays:", 1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  -[CAMDrawerSmartStyleButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("shutterButton"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_setIsAccessibilityElementBlock:", &__block_literal_global_3);
  if (objc_msgSend(v9, "_accessibilityViewIsVisible"))
    objc_msgSend(v8, "axSafelyAddObject:", v9);

  return v8;
}

uint64_t __80__CAMDrawerSmartStyleButtonAccessibility__accessibilitySupplementaryFooterViews__block_invoke()
{
  return 1;
}

@end

@implementation EditorialCardCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ASMessagesProvider.EditorialCardCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ASMessagesProvider.EditorialCardCollectionViewCell"), CFSTR("accessibilityCaptionLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ASMessagesProvider.EditorialCardCollectionViewCell"), CFSTR("accessibilityTitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ASMessagesProvider.EditorialCardCollectionViewCell"), CFSTR("accessibilitySubtitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ASMessagesProvider.EditorialCardCollectionViewCell"), CFSTR("accessibilityLockupView"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[EditorialCardCollectionViewCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("accessibilityCaptionLabel, accessibilityTitleLabel, accessibilitySubtitleLabel, accessibilityLockupView"));
}

- (id)automationElements
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCE30];
  -[EditorialCardCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityLockupView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "axArrayByIgnoringNilElementsWithCount:", 1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  objc_super v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v10.receiver = self;
  v10.super_class = (Class)EditorialCardCollectionViewCellAccessibility;
  -[EditorialCardCollectionViewCellAccessibility accessibilityCustomActions](&v10, sel_accessibilityCustomActions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EditorialCardCollectionViewCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("accessibilityLockupView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "_accessibilityViewIsVisible"))
  {
    v5 = objc_alloc(MEMORY[0x24BDF6788]);
    objc_msgSend(v4, "accessibilityLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithName:actionHandler:", v6, &__block_literal_global_2);

    objc_msgSend(v4, "accessibilityActivationPoint");
    objc_msgSend(v7, "setActivationPoint:");
    if (v3)
    {
      objc_msgSend(v3, "arrayByAddingObject:", v7);
      v8 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v8;
    }
    else
    {
      v11[0] = v7;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v3;
}

uint64_t __74__EditorialCardCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke()
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v2;
  void *v3;

  -[EditorialCardCollectionViewCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("accessibilityLockupView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilitySupplementaryFooterViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end

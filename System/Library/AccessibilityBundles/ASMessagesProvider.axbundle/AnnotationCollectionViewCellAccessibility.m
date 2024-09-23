@implementation AnnotationCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ASMessagesProvider.AnnotationCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ASMessagesProvider.AnnotationCollectionViewCell"), CFSTR("accessibilityTitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ASMessagesProvider.AnnotationCollectionViewCell"), CFSTR("accessibilitySummaryLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ASMessagesProvider.AnnotationCollectionViewCell"), CFSTR("accessibilityDetailItems"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ASMessagesProvider.AnnotationCollectionViewCell"), CFSTR("accessibilityCellIsExpanded"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ASMessagesProvider.AnnotationCollectionViewCell"), CFSTR("accessibilityLinkLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ASMessagesProvider.AnnotationCollectionViewCell"), CFSTR("accessibilityLinkLabelTapped"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ASMessagesProvider.AnnotationCollectionViewCell"), CFSTR("accessibilityIsSummaryExpandable"), "B", 0);

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
  void *v7;

  if (-[AnnotationCollectionViewCellAccessibility _axIsAnnotationCellExpanded](self, "_axIsAnnotationCellExpanded"))
  {
    -[AnnotationCollectionViewCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("accessibilityTitleLabel"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[AnnotationCollectionViewCellAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("accessibilityDetailItems"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    AXLabelForElements();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[AnnotationCollectionViewCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("accessibilityTitleLabel, accessibilitySummaryLabel"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (BOOL)_axIsAnnotationCellExpanded
{
  return -[AnnotationCollectionViewCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("accessibilityCellIsExpanded"));
}

- (id)_axLinkLabel
{
  return (id)-[AnnotationCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityLinkLabel"));
}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x24BDBCEB8];
  v10.receiver = self;
  v10.super_class = (Class)AnnotationCollectionViewCellAccessibility;
  -[AnnotationCollectionViewCellAccessibility accessibilityCustomActions](&v10, sel_accessibilityCustomActions);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[AnnotationCollectionViewCellAccessibility _axIsAnnotationCellExpanded](self, "_axIsAnnotationCellExpanded"))
  {
    -[AnnotationCollectionViewCellAccessibility _axLinkLabel](self, "_axLinkLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessibilityLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "length"))
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6788]), "initWithName:target:selector:", v7, self, sel__accessibilityPerformLinkAction_);
      objc_msgSend(v5, "axSafelyAddObject:", v8);

    }
  }
  return v5;
}

- (BOOL)_accessibilityPerformLinkAction:(id)a3
{
  AXPerformSafeBlock();
  return 1;
}

uint64_t __77__AnnotationCollectionViewCellAccessibility__accessibilityPerformLinkAction___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessibilityLinkLabelTapped");
}

- (BOOL)_axIsSummaryExpandable
{
  return -[AnnotationCollectionViewCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("accessibilityIsSummaryExpandable"));
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AnnotationCollectionViewCellAccessibility;
  v3 = -[AnnotationCollectionViewCellAccessibility accessibilityTraits](&v5, sel_accessibilityTraits);
  if (-[AnnotationCollectionViewCellAccessibility _axIsSummaryExpandable](self, "_axIsSummaryExpandable")
    && !-[AnnotationCollectionViewCellAccessibility _axIsAnnotationCellExpanded](self, "_axIsAnnotationCellExpanded"))
  {
    v3 |= *MEMORY[0x24BDF73B0];
  }
  return v3;
}

- (id)accessibilityHint
{
  void *v3;
  objc_super v5;

  if (-[AnnotationCollectionViewCellAccessibility _axIsSummaryExpandable](self, "_axIsSummaryExpandable")
    && !-[AnnotationCollectionViewCellAccessibility _axIsAnnotationCellExpanded](self, "_axIsAnnotationCellExpanded"))
  {
    accessibilityAppStoreLocalizedString(CFSTR("expand.annotation.cell"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)AnnotationCollectionViewCellAccessibility;
    -[AnnotationCollectionViewCellAccessibility accessibilityHint](&v5, sel_accessibilityHint);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (BOOL)_accessibilityOverridesInstructionsHint
{
  return -[AnnotationCollectionViewCellAccessibility _axIsSummaryExpandable](self, "_axIsSummaryExpandable")
      && !-[AnnotationCollectionViewCellAccessibility _axIsAnnotationCellExpanded](self, "_axIsAnnotationCellExpanded");
}

@end

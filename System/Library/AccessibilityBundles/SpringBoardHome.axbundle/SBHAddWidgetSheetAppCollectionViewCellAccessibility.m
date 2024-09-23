@implementation SBHAddWidgetSheetAppCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBHAddWidgetSheetAppCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("SBHAddWidgetDetailSheetViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHAddWidgetSheetAppCollectionViewCell"), CFSTR("textLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHAddWidgetSheetAppCollectionViewCell"), CFSTR("detailTextLabel"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[SBHAddWidgetSheetAppCollectionViewCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("textLabel, detailTextLabel"));
}

- (unint64_t)accessibilityTraits
{
  void *v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  unint64_t v7;
  _QWORD *v8;
  objc_super v10;
  char v11;

  v11 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_accessibilityViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("SBHAddWidgetDetailSheetViewController"));
  isKindOfClass = objc_opt_isKindOfClass();

  v10.receiver = self;
  v10.super_class = (Class)SBHAddWidgetSheetAppCollectionViewCellAccessibility;
  v7 = -[SBHAddWidgetSheetAppCollectionViewCellAccessibility accessibilityTraits](&v10, sel_accessibilityTraits);
  v8 = (_QWORD *)MEMORY[0x24BDF73C0];
  if ((isKindOfClass & 1) == 0)
    v8 = (_QWORD *)MEMORY[0x24BDF73B0];
  return *v8 | v7;
}

@end

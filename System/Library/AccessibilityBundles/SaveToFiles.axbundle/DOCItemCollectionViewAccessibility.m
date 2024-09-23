@implementation DOCItemCollectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SaveToFiles.DOCItemCollectionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("DOCFullDocumentManagerViewController"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SaveToFiles.DOCItemCollectionView"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SaveToFiles.DOCItemCollectionViewController"), CFSTR("displayMode"), "q", 0);

}

- (id)accessibilityIdentifier
{
  return CFSTR("File View");
}

- (id)accessibilityValue
{
  void *v3;
  unint64_t v4;
  void *v5;
  objc_super v7;

  if (AXDoesRequestingClientDeserveAutomation())
  {
    -[DOCItemCollectionViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "safeIntegerForKey:", CFSTR("displayMode"));
    if (v4 > 2)
      v5 = 0;
    else
      v5 = *(&off_250332638 + v4);

    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)DOCItemCollectionViewAccessibility;
    -[DOCItemCollectionViewAccessibility accessibilityValue](&v7, sel_accessibilityValue);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DOCItemCollectionViewAccessibility;
  -[DOCItemCollectionViewAccessibility _accessibilitySupplementaryFooterViews](&v5, sel__accessibilitySupplementaryFooterViews);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "axFilterObjectsUsingBlock:", &__block_literal_global_3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

BOOL __76__DOCItemCollectionViewAccessibility__accessibilitySupplementaryFooterViews__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

- (BOOL)_accessibilityOpaqueElementScrollsContentIntoView
{
  return 1;
}

@end

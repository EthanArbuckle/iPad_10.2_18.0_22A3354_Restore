@implementation SearchUIVerticalLayoutCardSectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SearchUIVerticalLayoutCardSectionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SearchUIVerticalLayoutCardSectionView"), CFSTR("titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SearchUIVerticalLayoutCardSectionView"), CFSTR("footnoteLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SearchUIVerticalLayoutCardSectionView"), CFSTR("thumbnailView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SearchUITableViewCell"), CFSTR("rowModel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SearchUIRowModel"), CFSTR("cardSection"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFVerticalLayoutCardSection"), CFSTR("thumbnail"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SFPhotosLibraryImage"));

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v6;
  objc_super v7;

  if (-[SearchUIVerticalLayoutCardSectionViewAccessibility _axCellHasTextContent](self, "_axCellHasTextContent"))
  {
    -[SearchUIVerticalLayoutCardSectionViewAccessibility _axTitleLabel](self, "_axTitleLabel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIVerticalLayoutCardSectionViewAccessibility _axFootnoteLabel](self, "_axFootnoteLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return v4;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SearchUIVerticalLayoutCardSectionViewAccessibility;
    -[SearchUIVerticalLayoutCardSectionViewAccessibility accessibilityLabel](&v7, sel_accessibilityLabel);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  unint64_t v8;
  _BOOL4 v9;
  int v10;
  unint64_t v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SearchUIVerticalLayoutCardSectionViewAccessibility;
  v3 = -[SearchUIVerticalLayoutCardSectionViewAccessibility accessibilityTraits](&v13, sel_accessibilityTraits);
  -[SearchUIVerticalLayoutCardSectionViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("rowModel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("cardSection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("thumbnail"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("SFPhotosLibraryImage"));
  isKindOfClass = objc_opt_isKindOfClass();
  v8 = *MEMORY[0x24BDF73C8] | v3;
  if ((isKindOfClass & 1) != 0)
    v3 |= *MEMORY[0x24BDF73C8];
  v9 = -[SearchUIVerticalLayoutCardSectionViewAccessibility _axCellHasTextContent](self, "_axCellHasTextContent");
  if (v6)
    v10 = v9;
  else
    v10 = 1;
  if (v10)
    v11 = v3;
  else
    v11 = v8;

  return v11;
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  return 1;
}

- (id)_axTitleLabel
{
  void *v2;
  void *v3;

  -[SearchUIVerticalLayoutCardSectionViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_axFootnoteLabel
{
  void *v2;
  void *v3;

  -[SearchUIVerticalLayoutCardSectionViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("footnoteLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_axCellHasTextContent
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  -[SearchUIVerticalLayoutCardSectionViewAccessibility _axTitleLabel](self, "_axTitleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByTrimmingCharactersInSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  -[SearchUIVerticalLayoutCardSectionViewAccessibility _axFootnoteLabel](self, "_axFootnoteLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByTrimmingCharactersInSet:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 | objc_msgSend(v9, "length");

  return v10 != 0;
}

@end

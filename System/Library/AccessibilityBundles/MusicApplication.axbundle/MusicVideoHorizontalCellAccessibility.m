@implementation MusicVideoHorizontalCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MusicApplication.MusicVideoHorizontalCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.MusicVideoHorizontalCell"), CFSTR("title"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.MusicVideoHorizontalCell"), CFSTR("subtitle"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.MusicVideoHorizontalCell"), CFSTR("additionalDescription"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MusicApplication.SongCell"), CFSTR("MusicApplication.HorizontalLockupCollectionViewCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.HorizontalLockupCollectionViewCell"), CFSTR("accessibilityMediaPickerAddButton"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[MusicVideoHorizontalCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("title, subtitle, additionalDescription"));
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MusicVideoHorizontalCellAccessibility;
  v3 = -[MusicVideoHorizontalCellAccessibility accessibilityTraits](&v9, sel_accessibilityTraits);
  objc_opt_class();
  -[MusicVideoHorizontalCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityMediaPickerAddButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *MEMORY[0x24BDF73B0] | v3;
  LODWORD(v3) = objc_msgSend(v5, "safeBoolForKey:", CFSTR("selected"));

  v7 = *MEMORY[0x24BDF7400];
  if (!(_DWORD)v3)
    v7 = 0;
  return v6 | v7;
}

@end

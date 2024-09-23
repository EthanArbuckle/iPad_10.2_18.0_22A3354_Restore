@implementation MUPhotoTileCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MUPhotoTileCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MUPhotoTileCollectionViewCell"), CFSTR("photoOverlay"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MUPhotoTileOverlay"), CFSTR("shouldBeShown"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MUPhotoTileOverlay"), CFSTR("attributionTitle"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MUPhotoTileOverlay"), CFSTR("tileTitle"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MUPhotoTileOverlay"), CFSTR("badgeTitle"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73C8] | *MEMORY[0x24BDF73B0];
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;

  -[MUPhotoTileCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("photoOverlay"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && objc_msgSend(v2, "safeBoolForKey:", CFSTR("shouldBeShown")))
  {
    objc_msgSend(v3, "safeStringForKey:", CFSTR("attributionTitle"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "safeStringForKey:", CFSTR("badgeTitle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v4)
    {
      v7 = v4;
    }
    else if (v5)
    {
      v7 = v5;
    }
    else
    {
      objc_msgSend(v3, "safeStringForKey:", CFSTR("tileTitle"));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    v8 = v7;

  }
  else
  {
    v8 = &stru_25026A470;
  }

  return v8;
}

@end

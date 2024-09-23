@implementation StickerCollectionStickerCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("StickersUI.StickerCollectionStickerCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("StickersUI.StickerCollectionStickerCell"), CFSTR("stickerView"), "STKMSStickerView");
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;
  objc_super v9;

  -[StickerCollectionStickerCellAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("stickerView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)StickerCollectionStickerCellAccessibility;
  -[StickerCollectionStickerCellAccessibility accessibilityLabel](&v9, sel_accessibilityLabel);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    v8.receiver = self;
    v8.super_class = (Class)StickerCollectionStickerCellAccessibility;
    -[StickerCollectionStickerCellAccessibility accessibilityLabel](&v8, sel_accessibilityLabel);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "accessibilityLabel");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end

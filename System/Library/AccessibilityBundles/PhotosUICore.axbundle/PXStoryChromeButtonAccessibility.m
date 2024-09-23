@implementation PXStoryChromeButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PXStoryChromeButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXStoryChromeButton"), CFSTR("userData"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXStoryChromeButtonConfiguration"), CFSTR("systemImageName"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("PXFeedView"));

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  objc_super v10;

  -[PXStoryChromeButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("userData"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("systemImageName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isEqualToString:", CFSTR("speaker.wave.2")))
  {
    v5 = CFSTR("photo.volume.button");
LABEL_5:
    accessibilityPhotosUICoreLocalizedString(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("speaker.slash")))
  {
    v5 = CFSTR("photo.volume.muted.button");
    goto LABEL_5;
  }
  AXSSAccessibilityDescriptionForSymbolName();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v7;
  if (v7 && objc_msgSend(v7, "length"))
    goto LABEL_10;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("arrow.counterclockwise")))
  {
    accessibilityPhotosUICoreLocalizedString(CFSTR("story.replay"));
    v9 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v9;
  }
LABEL_6:
  if (!v6)
  {
    v10.receiver = self;
    v10.super_class = (Class)PXStoryChromeButtonAccessibility;
    -[PXStoryChromeButtonAccessibility accessibilityLabel](&v10, sel_accessibilityLabel);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_10:

  return v6;
}

- (BOOL)_accessibilityIsInFeedView
{
  void *v2;
  BOOL v3;

  -[PXStoryChromeButtonAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_1, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

uint64_t __62__PXStoryChromeButtonAccessibility__accessibilityIsInFeedView__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  MEMORY[0x2348C1678](CFSTR("PXFeedView"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)isAccessibilityElement
{
  return !-[PXStoryChromeButtonAccessibility _accessibilityIsInFeedView](self, "_accessibilityIsInFeedView");
}

@end

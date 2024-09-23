@implementation ThumbnailImageViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ThumbnailImageView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ThumbnailImageView"), CFSTR("item"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("DRItem"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DRItem"), CFSTR("thumbnail"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DRItem"), CFSTR("isDownloaded"), "B", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("thumbnailview.label"));
}

- (id)accessibilityValue
{
  if (-[ThumbnailImageViewAccessibility _axIsDownloaded](self, "_axIsDownloaded"))
    return 0;
  accessibilityLocalizedString(CFSTR("thumbnailview.downloading"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  _BOOL4 v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ThumbnailImageViewAccessibility;
  v3 = *MEMORY[0x24BDF73C8] | -[ThumbnailImageViewAccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
  v4 = -[ThumbnailImageViewAccessibility _axIsDownloaded](self, "_axIsDownloaded");
  v5 = *MEMORY[0x24BDF7430];
  if (v4)
    v5 = 0;
  return v3 | v5;
}

- (void)setItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ThumbnailImageViewAccessibility;
  -[ThumbnailImageViewAccessibility setItem:](&v9, sel_setItem_, v4);
  objc_opt_class();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("thumbnail"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(objc_retainAutorelease(v6), "CGImage");
    UIAXPhotoDescriptionString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ThumbnailImageViewAccessibility setAccessibilityHint:](self, "setAccessibilityHint:", v8, CFSTR("__AXStringForVariablesSentinel"));

  }
  else
  {
    -[ThumbnailImageViewAccessibility setAccessibilityHint:](self, "setAccessibilityHint:", 0);
  }

}

- (BOOL)_axIsDownloaded
{
  void *v2;
  char v3;

  -[ThumbnailImageViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("item"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeBoolForKey:", CFSTR("isDownloaded"));

  return v3;
}

@end

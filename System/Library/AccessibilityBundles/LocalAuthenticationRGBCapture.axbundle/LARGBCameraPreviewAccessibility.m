@implementation LARGBCameraPreviewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("LARGBCameraPreview");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unsigned)_accessibilityMediaAnalysisOptions
{
  return 0;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73C8];
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("preview.view"));
}

@end

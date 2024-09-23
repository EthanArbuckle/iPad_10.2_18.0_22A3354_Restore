@implementation CAMSharedLibraryStatusIndicatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMSharedLibraryStatusIndicator");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMSharedLibraryStatusIndicator"), CFSTR("sharedLibraryMode"), "q", 0);
}

- (id)accessibilityLabel
{
  return -[CAMSharedLibraryStatusIndicatorAccessibility _axLabelForSharedLibraryMode:](self, "_axLabelForSharedLibraryMode:", -[CAMSharedLibraryStatusIndicatorAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("sharedLibraryMode")));
}

- (id)_axLabelForSharedLibraryMode:(int64_t)a3
{
  if ((unint64_t)a3 > 5)
    return 0;
  accessibilityCameraUILocalizedString(off_24FEE0160[a3]);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end

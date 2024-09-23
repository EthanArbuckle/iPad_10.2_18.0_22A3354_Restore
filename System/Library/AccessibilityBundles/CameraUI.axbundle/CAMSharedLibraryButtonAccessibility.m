@implementation CAMSharedLibraryButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMSharedLibraryButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMSharedLibraryButton"), CFSTR("sharedLibraryMode"), "q", 0);
}

- (id)accessibilityHint
{
  return accessibilityCameraUILocalizedString(CFSTR("Shared_Library_Hint"));
}

- (id)accessibilityIdentifier
{
  return CFSTR("SharedLibraryButton");
}

- (id)_axLabelForSharedLibraryMode:(int64_t)a3
{
  if ((unint64_t)a3 > 5)
    return 0;
  accessibilityCameraUILocalizedString(off_24FEE0020[a3]);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)accessibilityLabel
{
  return -[CAMSharedLibraryButtonAccessibility _axLabelForSharedLibraryMode:](self, "_axLabelForSharedLibraryMode:", -[CAMSharedLibraryButtonAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("sharedLibraryMode")));
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CAMSharedLibraryButtonAccessibility;
  return *MEMORY[0x24BDF73B0] | -[CAMSharedLibraryButtonAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end

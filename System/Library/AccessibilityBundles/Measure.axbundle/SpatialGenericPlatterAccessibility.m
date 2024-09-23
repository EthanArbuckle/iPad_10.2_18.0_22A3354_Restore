@implementation SpatialGenericPlatterAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("Measure.SpatialGenericPlatter");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Measure.SpatialGenericPlatter"), CFSTR("closePlatter"), "v", 0);
}

- (BOOL)accessibilityPerformEscape
{
  void *v2;

  AXPerformSafeBlock();
  accessibilityLocalizedString(CFSTR("MEASUREMENT_DISMISSED"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  AXMeasureSpeakMeasurementAnnouncement(v2);

  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  return 1;
}

uint64_t __64__SpatialGenericPlatterAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "closePlatter");
}

@end

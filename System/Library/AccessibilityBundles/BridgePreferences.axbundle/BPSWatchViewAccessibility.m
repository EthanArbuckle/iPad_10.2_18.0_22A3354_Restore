@implementation BPSWatchViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("BPSWatchView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  void *v3;
  void *v4;
  char v5;

  -[BPSWatchViewAccessibility isAccessibilityUserDefinedElement](self, "isAccessibilityUserDefinedElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 1;
  -[BPSWatchViewAccessibility isAccessibilityUserDefinedElement](self, "isAccessibilityUserDefinedElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (id)accessibilityLabel
{
  void *v3;

  -[BPSWatchViewAccessibility accessibilityUserDefinedLabel](self, "accessibilityUserDefinedLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[BPSWatchViewAccessibility accessibilityUserDefinedLabel](self, "accessibilityUserDefinedLabel");
  else
    accessibilityLocalizedString(CFSTR("generic.watch.view"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unsigned)_accessibilityMediaAnalysisOptions
{
  return 0;
}

@end

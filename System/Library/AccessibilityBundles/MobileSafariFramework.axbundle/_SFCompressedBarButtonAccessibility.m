@implementation _SFCompressedBarButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_SFCompressedBarButton");
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

  -[_SFCompressedBarButtonAccessibility isAccessibilityUserDefinedElement](self, "isAccessibilityUserDefinedElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[_SFCompressedBarButtonAccessibility isAccessibilityUserDefinedElement](self, "isAccessibilityUserDefinedElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (id)accessibilityLabel
{
  return accessibilityMobileSafariLocalizedString(CFSTR("collapsed.address.bar"));
}

- (int64_t)_accessibilityExpandedStatus
{
  return 2;
}

@end

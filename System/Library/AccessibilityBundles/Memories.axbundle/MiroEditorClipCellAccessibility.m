@implementation MiroEditorClipCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MiroEditorClipCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MiroEditorClipCell"), CFSTR("clipProvider"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PMClipProvider"), CFSTR("phAsset"), "@", 0);

}

- (id)_axMediaAsset
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[MiroEditorClipCellAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("clipProvider.phAsset"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[MiroEditorClipCellAccessibility _axMediaAsset](self, "_axMediaAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[MiroEditorClipCellAccessibility _axMediaAsset](self, "_axMediaAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end

@implementation SBHLibraryPodCategoryIconAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBHLibraryPodCategoryIcon");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHLibraryPodCategoryIcon"), CFSTR("category"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHLibraryCategory"), CFSTR("compactPodFolder"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFolder"), CFSTR("icons"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SBHLibraryCategoryFolder"), CFSTR("SBFolder"));

}

- (id)automationElements
{
  void *v2;
  void *v3;
  void *v4;

  -[SBHLibraryPodCategoryIconAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("category"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("compactPodFolder"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeArrayForKey:", CFSTR("icons"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)_isSerializableAccessibilityElement
{
  return 1;
}

@end

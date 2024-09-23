@implementation QLItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("QLItem");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("QLItem"), CFSTR("previewItemURL"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("QLItem"), CFSTR("createPreviewContext"), "@", 0);

}

- (id)createPreviewContext
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)QLItemAccessibility;
  -[QLItemAccessibility createPreviewContext](&v8, sel_createPreviewContext);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLItemAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("previewItemURL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  UIAccessibilityMetadataDescriptionForImage();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v6);

  return v3;
}

@end

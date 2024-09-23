@implementation PXContentSyndicationItemAssetPreviewViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PXContentSyndicationItemAssetPreviewView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXContentSyndicationItemAssetPreviewView"), CFSTR("imageViews"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXContentSyndicationStackedImageView"), CFSTR("overlayTitle"), "@", 0);

}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;

  -[PXContentSyndicationItemAssetPreviewViewAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("imageViews"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("overlayTitle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end

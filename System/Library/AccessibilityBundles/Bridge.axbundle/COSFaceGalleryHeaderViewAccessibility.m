@implementation COSFaceGalleryHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("COSFaceGalleryHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("COSFaceGalleryHeaderView"), CFSTR("galleryView"), "@", 0);
}

- (id)accessibilityElements
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  -[COSFaceGalleryHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("galleryView"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    v6[0] = v2;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

@end

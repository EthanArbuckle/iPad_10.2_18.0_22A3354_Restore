@implementation MUPlacePhotoViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MUPlacePhotoView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MUPlacePhotoView"), CFSTR("imageView"), "@", 0);
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73C8];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  CGImage *v7;
  CGDataProvider *DataProvider;
  CGImageSourceRef v9;
  void *v10;
  objc_super v12;
  char v13;

  v13 = 0;
  objc_opt_class();
  -[MUPlacePhotoViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("imageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_retainAutorelease(v5);
  v7 = (CGImage *)objc_msgSend(v6, "CGImage");
  if (v7)
  {
    DataProvider = CGImageGetDataProvider(v7);
    v9 = CGImageSourceCreateWithDataProvider(DataProvider, 0);
    v10 = (void *)MAImageCaptioningCopyCaptionWithSource();
    if (v9)
      CFRelease(v9);
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)MUPlacePhotoViewAccessibility;
    -[MUPlacePhotoViewAccessibility accessibilityLabel](&v12, sel_accessibilityLabel);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

@end

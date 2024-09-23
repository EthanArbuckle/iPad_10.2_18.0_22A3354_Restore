@implementation AVTPoseSelectionViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AVTPoseSelectionViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTPoseSelectionViewController"), CFSTR("setMode:"), "v", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTPoseSelectionViewController"), CFSTR("mode"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTPoseSelectionViewController"), CFSTR("headerViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTPoseSelectionViewController"), CFSTR("gridViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTAnimojiPoseSelectionHeaderViewController"), CFSTR("avtView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTPoseSelectionGridViewController"), CFSTR("selectedStickerConfiguration"), "@", 0);

}

- (void)setMode:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVTPoseSelectionViewControllerAccessibility;
  -[AVTPoseSelectionViewControllerAccessibility setMode:](&v9, sel_setMode_);
  if (a3)
  {
    -[AVTPoseSelectionViewControllerAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("headerViewController.avtView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAccessibilityLabel:", 0);
  }
  else
  {
    objc_opt_class();
    -[AVTPoseSelectionViewControllerAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("gridViewController.selectedStickerConfiguration"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[AVTPoseSelectionViewControllerAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("headerViewController.avtView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAccessibilityLabel:", v8);

  }
}

@end

@implementation MiroTimelineClipCollectionViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MiroTimelineClipCollectionViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axMiroPhotoScrubber
{
  JUMPOUT(0x2348C0868);
}

- (void)_setAXMiroPhotoScrubber:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("MiroEditorFlowLayout"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MiroTimelineClipCollectionViewController"), CFSTR("UICollectionViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MiroEditorFlowLayout"), CFSTR("snappedIndexPath"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MiroTimelineClipCollectionViewController"), CFSTR("viewDidLoad"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MiroTimelineClipCollectionViewController"), CFSTR("collectionView: didSelectItemAtIndexPath:"), "v", "@", "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  AXMiroPhotoScrubber *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v8.receiver = self;
  v8.super_class = (Class)MiroTimelineClipCollectionViewControllerAccessibility;
  -[MiroTimelineClipCollectionViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v8, sel__accessibilityLoadAccessibilityInformation);
  -[MiroTimelineClipCollectionViewControllerAccessibility _axMiroPhotoScrubber](self, "_axMiroPhotoScrubber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = -[AXMiroPhotoScrubber initWithAccessibilityContainer:]([AXMiroPhotoScrubber alloc], "initWithAccessibilityContainer:", self);
    -[MiroTimelineClipCollectionViewControllerAccessibility _setAXMiroPhotoScrubber:](self, "_setAXMiroPhotoScrubber:", v4);
    objc_opt_class();
    -[MiroTimelineClipCollectionViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("view"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v9[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAccessibilityElements:", v7);

  }
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MiroTimelineClipCollectionViewControllerAccessibility;
  -[MiroTimelineClipCollectionViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[MiroTimelineClipCollectionViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end

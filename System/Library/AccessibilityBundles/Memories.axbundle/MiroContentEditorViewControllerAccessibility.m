@implementation MiroContentEditorViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MiroContentEditorViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MiroContentEditorViewController"), CFSTR("topToolbar"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MiroContentEditorViewController"), CFSTR("timelineViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MiroContentEditorViewController"), CFSTR("editorViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MiroContentEditorViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MiroContentEditorViewController"), CFSTR("bottomToolbar"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MiroEditorClipCollectionViewController"), CFSTR("UICollectionViewController"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MiroTimelineClipCollectionViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MiroContentEditorViewController"), CFSTR("viewDidLoad"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MiroContentEditorViewController"), CFSTR("clipCollection: didSnapToIndexPath:"), "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MiroTimelineClipCollectionViewController"), CFSTR("snapToIndexPath: animated:"), "v", "@", "B", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MiroContentEditorViewControllerAccessibility;
  -[MiroContentEditorViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v11, sel__accessibilityLoadAccessibilityInformation);
  -[MiroContentEditorViewControllerAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("topToolbar"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MiroContentEditorViewControllerAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("timelineViewController.view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  -[MiroContentEditorViewControllerAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("editorViewController.collectionView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "accessibilitySetIdentification:", CFSTR("AccessibilityMiroUICollectionView"));
  -[MiroContentEditorViewControllerAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("bottomToolbar"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  -[MiroContentEditorViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 4, v3, v6, v4, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccessibilityElements:", v10);

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MiroContentEditorViewControllerAccessibility;
  -[MiroContentEditorViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[MiroContentEditorViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)clipCollection:(id)a3 didSnapToIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)MiroContentEditorViewControllerAccessibility;
  v7 = a3;
  -[MiroContentEditorViewControllerAccessibility clipCollection:didSnapToIndexPath:](&v10, sel_clipCollection_didSnapToIndexPath_, v7, v6);
  -[MiroContentEditorViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("editorViewController"));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v7)
  {
    v9 = v6;
    AXPerformSafeBlock();

  }
}

void __82__MiroContentEditorViewControllerAccessibility_clipCollection_didSnapToIndexPath___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("timelineViewController"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "snapToIndexPath:animated:", *(_QWORD *)(a1 + 40), 1);

}

@end

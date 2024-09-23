@implementation SRTranscriptStackViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SRTranscriptStackViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_enumerateSortedParentItemIndexPathsForItemIndexPaths:(id)a3 usingBlock:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SRTranscriptStackViewControllerAccessibility;
  -[SRTranscriptStackViewControllerAccessibility _enumerateSortedParentItemIndexPathsForItemIndexPaths:usingBlock:](&v4, sel__enumerateSortedParentItemIndexPathsForItemIndexPaths_usingBlock_, a3, a4);
  AXPerformBlockOnMainThreadAfterDelay();
}

void __113__SRTranscriptStackViewControllerAccessibility__enumerateSortedParentItemIndexPathsForItemIndexPaths_usingBlock___block_invoke()
{
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SRTranscriptStackViewControllerAccessibility;
  -[SRTranscriptStackViewControllerAccessibility navigationController:didShowViewController:animated:](&v5, sel_navigationController_didShowViewController_animated_, a3, a4, a5);
  AXPerformBlockOnMainThreadAfterDelay();
}

void __100__SRTranscriptStackViewControllerAccessibility_navigationController_didShowViewController_animated___block_invoke()
{
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

@end

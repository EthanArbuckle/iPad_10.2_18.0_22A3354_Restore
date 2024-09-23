@implementation _GKBubbleFlowPseudoModalViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_GKBubbleFlowPseudoModalViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_GKBubbleFlowPseudoModalViewControllerAccessibility;
  -[_GKBubbleFlowPseudoModalViewControllerAccessibility viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[_GKBubbleFlowPseudoModalViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityViewIsModal:", 1);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_GKBubbleFlowPseudoModalViewControllerAccessibility;
  -[_GKBubbleFlowPseudoModalViewControllerAccessibility viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  -[_GKBubbleFlowPseudoModalViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityViewIsModal:", 0);

}

@end

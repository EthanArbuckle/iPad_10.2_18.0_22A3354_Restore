@implementation SwipeOptionsControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SwipeOptionsController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SwipeOptionsController"), CFSTR("_configureSwipeDiagramInCell: atIndexPath:"), "v", "@", "@", 0);
}

- (void)_configureSwipeDiagramInCell:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SwipeOptionsControllerAccessibility;
  v7 = a4;
  -[SwipeOptionsControllerAccessibility _configureSwipeDiagramInCell:atIndexPath:](&v13, sel__configureSwipeDiagramInCell_atIndexPath_, v6, v7);
  v8 = objc_msgSend(v7, "section", v13.receiver, v13.super_class);

  v9 = CFSTR("right");
  if (!v8)
    v9 = CFSTR("left");
  v10 = v9;
  if ((-[__CFString isEqualToString:](v10, "isEqualToString:", CFSTR("left")) & 1) != 0)
  {
    v11 = CFSTR("diagram.swipe.left");
LABEL_7:
    accessibilityLocalizedString(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAccessibilityLabel:", v12);

    goto LABEL_8;
  }
  if (-[__CFString isEqualToString:](v10, "isEqualToString:", CFSTR("right")))
  {
    v11 = CFSTR("diagram.swipe.right");
    goto LABEL_7;
  }
LABEL_8:
  objc_msgSend(v6, "setIsAccessibilityElement:", 1);
  objc_msgSend(v6, "setAccessibilityTraits:", *MEMORY[0x24BDF73C8]);

}

@end

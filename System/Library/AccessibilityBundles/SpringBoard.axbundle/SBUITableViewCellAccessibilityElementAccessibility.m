@implementation SBUITableViewCellAccessibilityElementAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UITableViewCellAccessibilityElement");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityScrollToVisibleWithChild:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  BOOL v10;
  void *v11;
  objc_super v13;
  uint64_t v14;
  uint64_t v15;
  id (*v16)(uint64_t);
  void *v17;
  SBUITableViewCellAccessibilityElementAccessibility *v18;

  v4 = a3;
  -[SBUITableViewCellAccessibilityElementAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("SBAssistantView")));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "safeValueForKey:", CFSTR("_tableView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUITableViewCellAccessibilityElementAccessibility accessibilityContainer](self, "accessibilityContainer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isScrollEnabled");

    if ((v9 & 1) == 0)
    {
      -[SBUITableViewCellAccessibilityElementAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("tableViewCell"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "bounds");
      objc_msgSend(v7, "convertRect:fromView:", v11);
      objc_msgSend(v7, "scrollRectToVisible:animated:", 0);
      v14 = MEMORY[0x24BDAC760];
      v15 = 3221225472;
      v16 = __92__SBUITableViewCellAccessibilityElementAccessibility_accessibilityScrollToVisibleWithChild___block_invoke;
      v17 = &unk_250367AD0;
      v18 = self;
      AXPerformBlockAsynchronouslyOnMainThread();

      v10 = 1;
      goto LABEL_6;
    }

  }
  v13.receiver = self;
  v13.super_class = (Class)SBUITableViewCellAccessibilityElementAccessibility;
  v10 = -[SBUITableViewCellAccessibilityElementAccessibility accessibilityScrollToVisibleWithChild:](&v13, sel_accessibilityScrollToVisibleWithChild_, v4);
LABEL_6:

  return v10;
}

id __92__SBUITableViewCellAccessibilityElementAccessibility_accessibilityScrollToVisibleWithChild___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("tableViewCell"));
}

@end

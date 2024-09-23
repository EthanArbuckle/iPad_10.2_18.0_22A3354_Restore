@implementation SBRootFolderControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBRootFolderController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBRootFolderView"), CFSTR("_searchPulldownWrapperView"), "_SBRootFolderLayoutWrapperView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBRootFolderView"), CFSTR("_searchableLeadingCustomWrapperView"), "_SBRootFolderLayoutWrapperView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBRootFolderController"), CFSTR("isPullDownSearchVisibleOrTransitioning"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBRootFolderController"), CFSTR("isLeadingCustomViewSearchVisibleOrTransitioning"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBRootFolderController"), CFSTR("transitionDidFinish:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBRootFolderController"), CFSTR("isPullDownSearchVisible"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBRootFolderController"), CFSTR("isLeadingCustomViewSearchVisible"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBRootFolderController"), CFSTR("rootFolderView"), "@", 0);

}

- (void)transitionDidFinish:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id *v7;
  objc_super v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  if (-[SBRootFolderControllerAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isPullDownSearchVisibleOrTransitioning")))
  {
    -[SBRootFolderControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("rootFolderView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safeValueForKey:", CFSTR("_searchPulldownWrapperView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __59__SBRootFolderControllerAccessibility_transitionDidFinish___block_invoke;
    v11[3] = &unk_250383D20;
    v7 = &v12;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v6, "_setAccessibilityViewIsModalBlock:", v11);
LABEL_5:

    objc_destroyWeak(v7);
    goto LABEL_6;
  }
  if (-[SBRootFolderControllerAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isLeadingCustomViewSearchVisibleOrTransitioning")))
  {
    -[SBRootFolderControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("rootFolderView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safeValueForKey:", CFSTR("_searchableLeadingCustomWrapperView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __59__SBRootFolderControllerAccessibility_transitionDidFinish___block_invoke_2;
    v9[3] = &unk_250383D20;
    v7 = &v10;
    objc_copyWeak(&v10, &location);
    objc_msgSend(v6, "_setAccessibilityViewIsModalBlock:", v9);
    goto LABEL_5;
  }
LABEL_6:
  v8.receiver = self;
  v8.super_class = (Class)SBRootFolderControllerAccessibility;
  -[SBRootFolderControllerAccessibility transitionDidFinish:](&v8, sel_transitionDidFinish_, v4);
  objc_destroyWeak(&location);

}

uint64_t __59__SBRootFolderControllerAccessibility_transitionDidFinish___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "safeBoolForKey:", CFSTR("isPullDownSearchVisible"));

  return v2;
}

uint64_t __59__SBRootFolderControllerAccessibility_transitionDidFinish___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "safeBoolForKey:", CFSTR("isLeadingCustomViewSearchVisible"));

  return v2;
}

@end

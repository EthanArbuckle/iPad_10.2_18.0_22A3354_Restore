@implementation AppStore_UITransitionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UITransitionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:", CFSTR("_UISearchControllerView"));
}

- (BOOL)_isSuperviewOfSearchControllerView
{
  void *v2;
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  -[AppStore_UITransitionViewAccessibility subviews](self, "subviews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __76__AppStore_UITransitionViewAccessibility__isSuperviewOfSearchControllerView__block_invoke;
  v5[3] = &unk_25016E858;
  v5[4] = &v6;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (BOOL)accessibilityViewIsModal
{
  objc_super v4;

  if (-[AppStore_UITransitionViewAccessibility _isSuperviewOfSearchControllerView](self, "_isSuperviewOfSearchControllerView"))
  {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)AppStore_UITransitionViewAccessibility;
  return -[AppStore_UITransitionViewAccessibility accessibilityViewIsModal](&v4, sel_accessibilityViewIsModal);
}

@end

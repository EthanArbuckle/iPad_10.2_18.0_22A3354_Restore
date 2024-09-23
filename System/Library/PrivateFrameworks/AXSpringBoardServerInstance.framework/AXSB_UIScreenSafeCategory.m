@implementation AXSB_UIScreenSafeCategory

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIScreen");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIScreen"), CFSTR("_preferredFocusedWindow"), "@", 0);
}

- (id)_preferredFocusedWindow
{
  void *v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  objc_super v9;
  objc_super v10;

  if (AXProcessIsSpringBoard()
    && _UIAccessibilityFullKeyboardAccessEnabled()
    && (-[AXSB_UIScreenSafeCategory _isCarScreen](self, "_isCarScreen") & 1) == 0)
  {
    +[AXSpringBoardServerHelper sharedServerHelper](AXSpringBoardServerHelper, "sharedServerHelper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "presentationWindow");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      v10.receiver = self;
      v10.super_class = (Class)AXSB_UIScreenSafeCategory;
      -[AXSB_UIScreenSafeCategory _preferredFocusedWindow](&v10, sel__preferredFocusedWindow);
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v3 = v8;

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)AXSB_UIScreenSafeCategory;
    -[AXSB_UIScreenSafeCategory _preferredFocusedWindow](&v9, sel__preferredFocusedWindow);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

@end

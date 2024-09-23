@implementation CKActionMenuWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKActionMenuWindow");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKActionMenuWindow"), CFSTR("actionMenuView"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("CKActionMenuView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKActionMenuView"), CFSTR("defaultActionIndex"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKActionMenuView"), CFSTR("actionMenuItems"), "@", 0);

}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (void)setHidden:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_super v10;

  v3 = a3;
  v5 = -[CKActionMenuWindowAccessibility isHidden](self, "isHidden");
  v10.receiver = self;
  v10.super_class = (Class)CKActionMenuWindowAccessibility;
  -[CKActionMenuWindowAccessibility setHidden:](&v10, sel_setHidden_, v3);
  if (v5 != v3)
  {
    if (v3)
    {
      v6 = 0;
    }
    else
    {
      -[CKActionMenuWindowAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("actionMenuView"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "safeUnsignedIntegerForKey:", CFSTR("defaultActionIndex"));
      objc_msgSend(v7, "safeArrayForKey:", CFSTR("actionMenuItems"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "axSafeObjectAtIndex:", v8);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], v6);

  }
}

@end

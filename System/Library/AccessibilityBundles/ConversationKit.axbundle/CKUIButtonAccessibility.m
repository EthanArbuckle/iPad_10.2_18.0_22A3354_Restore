@implementation CKUIButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)setHidden:(BOOL)a3
{
  void *v4;
  int v5;
  void *v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKUIButtonAccessibility;
  -[CKUIButtonAccessibility setHidden:](&v8, sel_setHidden_, a3);
  -[CKUIButtonAccessibility accessibilityIdentification](self, "accessibilityIdentification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("AXRingButtonIdentification"));

  if (v5)
  {
    -[CKUIButtonAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v6, "safeValueForKey:", CFSTR("_accessibilityClearChildren"));

    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  }
}

@end

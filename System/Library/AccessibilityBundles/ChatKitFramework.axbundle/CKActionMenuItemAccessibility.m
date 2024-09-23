@implementation CKActionMenuItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKActionMenuItem");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKActionMenuItem"), CFSTR("setView:"), "v", "@", 0);
}

- (void)setView:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKActionMenuItemAccessibility;
  v4 = a3;
  -[CKActionMenuItemAccessibility setView:](&v6, sel_setView_, v4);
  -[CKActionMenuItemAccessibility accessibilityLabel](self, "accessibilityLabel", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v5);

}

@end

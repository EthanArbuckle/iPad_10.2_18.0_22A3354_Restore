@implementation AXSB_UIAlertControllerActionViewSafeCategory

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIAlertControllerActionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIAlertControllerActionView"), CFSTR("action"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIAlertAction"), CFSTR("title"), "@", 0);

}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AXSB_UIAlertControllerActionViewSafeCategory;
  -[AXSB_UIAlertControllerActionViewSafeCategory layoutSubviews](&v10, sel_layoutSubviews);
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("action"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("title"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v5, "_isChecked");
  v9 = *MEMORY[0x24BEBDF30];
  if (!v8)
    v9 = 0;
  -[AXSB_UIAlertControllerActionViewSafeCategory setAccessibilityTraits:](self, "setAccessibilityTraits:", *MEMORY[0x24BEBDF00] | v9);
  -[AXSB_UIAlertControllerActionViewSafeCategory setAccessibilityLabel:](self, "setAccessibilityLabel:", v7);

}

@end

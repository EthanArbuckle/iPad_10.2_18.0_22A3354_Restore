@implementation SUUIViewReusePoolAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUUIViewReusePool");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUIViewReusePool"), CFSTR("dequeueReusableViewWithReuseIdentifier:"), "@", 0);
}

- (id)dequeueReusableViewWithReuseIdentifier:(id)a3
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUUIViewReusePoolAccessibility;
  -[SUUIViewReusePoolAccessibility dequeueReusableViewWithReuseIdentifier:](&v5, sel_dequeueReusableViewWithReuseIdentifier_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilityUnregister");
  return v3;
}

@end

@implementation _UNBlockTouchesViewAcessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UNBlockTouchesView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("_UNBlockTouchesView"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UNBlockTouchesView"), CFSTR("initWithFrame:"), "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UNBlockTouchesViewAcessibility;
  -[_UNBlockTouchesViewAcessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[_UNBlockTouchesViewAcessibility layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("NCBlockTouchesViewCALayer"));

}

- (_UNBlockTouchesViewAcessibility)initWithFrame:(CGRect)a3
{
  _UNBlockTouchesViewAcessibility *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UNBlockTouchesViewAcessibility;
  v3 = -[_UNBlockTouchesViewAcessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[_UNBlockTouchesViewAcessibility _accessibilityLoadAccessibilityInformation](v3, "_accessibilityLoadAccessibilityInformation");
  return v3;
}

@end

@implementation PKPassFrontFaceViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKPassFrontFaceView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKPassFrontFaceView"), CFSTR("_bottomRightItemView"), "UIView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPassFrontFaceView"), CFSTR("bottomRightItem"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPassFrontFaceView"), CFSTR("setBottomRightItem:"), "v", "q", 0);

}

- (void)createBodyContentViews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPassFrontFaceViewAccessibility;
  -[PKPassFrontFaceViewAccessibility createBodyContentViews](&v3, sel_createBodyContentViews);
  -[PKPassFrontFaceViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)setBottomRightItem:(int64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPassFrontFaceViewAccessibility;
  -[PKPassFrontFaceViewAccessibility setBottomRightItem:](&v4, sel_setBottomRightItem_, a3);
  -[PKPassFrontFaceViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end

@implementation CKSendMenuCollectionViewLayoutAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKSendMenuCollectionViewLayout");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKSendMenuCollectionViewLayout"), CFSTR("stretchSpringsAttachedToCellsForBoundsChange:"), "v", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
}

- (void)stretchSpringsAttachedToCellsForBoundsChange:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!UIAccessibilityIsVoiceOverRunning())
  {
    v8.receiver = self;
    v8.super_class = (Class)CKSendMenuCollectionViewLayoutAccessibility;
    -[CKSendMenuCollectionViewLayoutAccessibility stretchSpringsAttachedToCellsForBoundsChange:](&v8, sel_stretchSpringsAttachedToCellsForBoundsChange_, x, y, width, height);
  }
}

@end

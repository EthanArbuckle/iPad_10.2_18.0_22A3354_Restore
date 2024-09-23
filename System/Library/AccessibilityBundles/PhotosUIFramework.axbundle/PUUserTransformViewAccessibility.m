@implementation PUUserTransformViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PUUserTransformView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityAllowsSiblingsWhenOvergrown
{
  return 1;
}

- (void)setFrame:(CGRect)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUUserTransformViewAccessibility;
  -[PUUserTransformViewAccessibility setFrame:](&v3, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

@end

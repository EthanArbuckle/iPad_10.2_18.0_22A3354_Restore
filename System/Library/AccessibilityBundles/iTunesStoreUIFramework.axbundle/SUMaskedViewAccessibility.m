@implementation SUMaskedViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUMaskedView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityElementsHidden
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double width;
  double height;
  objc_super v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  -[SUMaskedViewAccessibility accessibilityFrame](self, "accessibilityFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v19.origin.x = v4;
  v19.origin.y = v6;
  v19.size.width = v8;
  v19.size.height = v10;
  v18 = CGRectIntersection(v17, v19);
  width = v18.size.width;
  height = v18.size.height;

  if (width < v8 * 0.5 || height < v10 * 0.5)
    return 1;
  v16.receiver = self;
  v16.super_class = (Class)SUMaskedViewAccessibility;
  return -[SUMaskedViewAccessibility accessibilityElementsHidden](&v16, sel_accessibilityElementsHidden);
}

@end

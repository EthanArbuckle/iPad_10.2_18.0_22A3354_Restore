@implementation _TVGridViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_TVGridView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("_TVGridView"), CFSTR("UIScrollView"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("_TVGridView"), CFSTR("UICollectionView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UICollectionView"), CFSTR("_visibleBounds"), "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);

}

- (CGRect)_visibleBounds
{
  double v3;
  CGFloat x;
  double v5;
  CGFloat y;
  double v7;
  double width;
  double v9;
  double height;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  objc_super v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect result;
  CGRect v32;

  v27.receiver = self;
  v27.super_class = (Class)_TVGridViewAccessibility;
  -[_TVGridViewAccessibility _visibleBounds](&v27, sel__visibleBounds);
  x = v3;
  y = v5;
  width = v7;
  height = v9;
  if (UIAccessibilityIsVoiceOverRunning()
    && -[_TVGridViewAccessibility isAccessibilityOpaqueElementProvider](self, "isAccessibilityOpaqueElementProvider"))
  {
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "contentSize");
      if (v13 > 0.0)
      {
        v15 = v14;
        if (v14 > 0.0)
        {
          v16 = v13;
          objc_msgSend(v12, "contentInset");
          v26 = v17;
          v19 = v18;
          v21 = v20;
          v28.origin.x = x;
          v28.origin.y = y;
          v28.size.width = width;
          v28.size.height = height;
          v32 = CGRectInset(v28, -width, -height);
          v29.origin.x = -v19;
          v29.origin.y = -v26;
          v29.size.width = v16 - v21;
          v29.size.height = v15 - v19;
          v30 = CGRectIntersection(v29, v32);
          x = v30.origin.x;
          y = v30.origin.y;
          width = v30.size.width;
          height = v30.size.height;
        }
      }
    }

  }
  v22 = x;
  v23 = y;
  v24 = width;
  v25 = height;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

@end

@implementation PKStrokeAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKStroke");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKStroke"), CFSTR("ink"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKStroke"), CFSTR("renderBounds"), "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);

}

+ (BOOL)_isSerializableAccessibilityElement
{
  return 1;
}

- (void)dealloc
{
  objc_super v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[PKStrokeAccessibility _accessibilityUnregister](self, "_accessibilityUnregister");
  v3.receiver = self;
  v3.super_class = (Class)PKStrokeAccessibility;
  -[PKStrokeAccessibility dealloc](&v3, sel_dealloc);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (CGRect)accessibilityFrame
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  UIView *v11;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect v20;
  CGRect v21;
  CGRect result;

  -[PKStrokeAccessibility safeCGRectForKey:](self, "safeCGRectForKey:", CFSTR("renderBounds"));
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PKStrokeAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", objc_opt_class());
  v11 = (UIView *)objc_claimAutoreleasedReturnValue();
  v20.origin.x = v4;
  v20.origin.y = v6;
  v20.size.width = v8;
  v20.size.height = v10;
  v21 = UIAccessibilityConvertFrameToScreenCoordinates(v20, v11);
  x = v21.origin.x;
  y = v21.origin.y;
  width = v21.size.width;
  height = v21.size.height;

  v16 = x;
  v17 = y;
  v18 = width;
  v19 = height;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v10;

  -[PKStrokeAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("ink"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "inkType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "color");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDE3450]) & 1) != 0)
  {
    v6 = CFSTR("pen.tool");
  }
  else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDE3458]) & 1) != 0)
  {
    v6 = CFSTR("pencil.tool");
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDE3448]))
    {
      v7 = 0;
      goto LABEL_8;
    }
    v6 = CFSTR("marker.tool");
  }
  accessibilityPencilKitLocalizedString(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
  objc_msgSend(v5, "accessibilityName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  __AXStringForVariables();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end

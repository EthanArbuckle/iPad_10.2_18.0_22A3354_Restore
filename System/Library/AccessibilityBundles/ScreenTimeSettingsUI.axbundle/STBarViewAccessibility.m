@implementation STBarViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("STBarView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("STBarView"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:", CFSTR("STUsageGraphViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STBarView"), CFSTR("dataPoint"), "@", 0);

}

- (unint64_t)_accessibilityUnderlyingRepresentedTimePeriod
{
  return __UIAccessibilityGetAssociatedUnsignedInteger();
}

- (void)_accessibilitySetUnderlyingRepresentedTimePeriod:(unint64_t)a3
{
  __UIAccessibilitySetAssociatedUnsignedInteger();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[STBarViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("dataPoint"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CGRect)accessibilityFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect v17;
  CGRect slice;
  objc_super v19;
  CGRect v20;
  CGRect result;

  v19.receiver = self;
  v19.super_class = (Class)STBarViewAccessibility;
  -[STBarViewAccessibility accessibilityFrame](&v19, sel_accessibilityFrame);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[STBarViewAccessibility _accessibilityFindViewAncestor:startWithSelf:](self, "_accessibilityFindViewAncestor:startWithSelf:", &__block_literal_global_1, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "safeUIViewForKey:", CFSTR("view"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v12, "accessibilityFrame");
    memset(&slice, 0, sizeof(slice));
    memset(&v17, 0, sizeof(v17));
    CGRectDivide(v20, &slice, &v17, v10, CGRectMaxYEdge);
    v6 = v6 - v17.size.height;
    v10 = v10 + v17.size.height;
  }

  v13 = v4;
  v14 = v6;
  v15 = v8;
  v16 = v10;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

uint64_t __44__STBarViewAccessibility_accessibilityFrame__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  MEMORY[0x23491C610](CFSTR("STUsageGraphViewController"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_accessibilityParentForFindingScrollParent
{
  void *v2;
  void *v3;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end

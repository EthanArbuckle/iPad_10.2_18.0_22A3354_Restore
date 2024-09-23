@implementation SBAppSwitcherPeopleButtonAndLabelViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBAppSwitcherPeopleButtonAndLabelView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBAppSwitcherPeopleButtonAndLabelView"), CFSTR("title"), "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)_accessibilityIsNotFirstElement
{
  return 1;
}

- (BOOL)_accessibilityIsFirstElementForFocus
{
  return 0;
}

- (BOOL)accessibilityScrollToVisible
{
  void *v3;
  double x;
  double y;
  double width;
  double height;
  CGFloat v8;
  CGFloat v9;
  CGRect v11;
  CGRect v12;
  CGRect v13;
  CGRect v14;

  -[SBAppSwitcherPeopleButtonAndLabelViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAppSwitcherPeopleButtonAndLabelViewAccessibility bounds](self, "bounds");
  objc_msgSend(v3, "convertRect:fromView:", self);
  x = v11.origin.x;
  y = v11.origin.y;
  width = v11.size.width;
  height = v11.size.height;
  v8 = CGRectGetMaxX(v11) + v11.size.width;
  objc_msgSend(v3, "visibleBounds");
  if (v8 <= CGRectGetMaxX(v12))
  {
    v13.origin.x = x;
    v13.origin.y = y;
    v13.size.width = width;
    v13.size.height = height;
    v9 = CGRectGetMinX(v13) - width;
    objc_msgSend(v3, "visibleBounds");
    if (v9 < CGRectGetMinX(v14))
      x = x - width;
  }
  else
  {
    x = x + width;
  }
  objc_msgSend(v3, "scrollRectToVisible:animated:", 1, x, y, width, height);

  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[SBAppSwitcherPeopleButtonAndLabelViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("title"));
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

@end

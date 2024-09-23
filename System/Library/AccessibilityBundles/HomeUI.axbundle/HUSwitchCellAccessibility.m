@implementation HUSwitchCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUSwitchCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:conformsToProtocol:", CFSTR("HUSwitchCell"), CFSTR("HUDisableableCellProtocol"));
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("HUDisableableCellProtocol"), CFSTR("isDisabled"));

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;

  -[HUSwitchCellAccessibility textLabel](self, "textLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSwitchCellAccessibility detailTextLabel](self, "detailTextLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2;
  int v3;
  _QWORD *v4;

  v2 = *MEMORY[0x24BDF7428];
  v3 = -[HUSwitchCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isDisabled"));
  v4 = (_QWORD *)MEMORY[0x24BDF73E8];
  if (!v3)
    v4 = (_QWORD *)MEMORY[0x24BDF73E0];
  return *v4 | v2;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[HUSwitchCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("accessoryView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CGPoint)accessibilityActivationPoint
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  -[HUSwitchCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("accessoryView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityActivationPoint");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

@end
